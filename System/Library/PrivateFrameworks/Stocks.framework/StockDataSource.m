@implementation StockDataSource

- (StockDataSource)initWithDictionary:(id)a3
{
  id v4;
  StockDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  StockDataSource *v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)StockDataSource;
  v5 = -[StockDataSource init](&v16, sel_init);
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v4, "objectForKey:", CFSTR("id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[StockDataSource setIdentifier:](v5, "setIdentifier:", objc_msgSend(v6, "integerValue"));
  objc_msgSend(v4, "objectForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[StockDataSource setName:](v5, "setName:", v7);
  objc_msgSend(v4, "objectForKey:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[StockDataSource setSourceDescription:](v5, "setSourceDescription:", v8);
  -[StockDataSource name](v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[StockDataSource sourceDescription](v5, "sourceDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {

LABEL_11:
      v12 = v5;
      goto LABEL_16;
    }
  }
  else
  {

  }
  StocksLogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[StockDataSource identifier](v5, "identifier");
    *(_DWORD *)buf = 134217984;
    v18 = v14;
    _os_log_impl(&dword_21736B000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring data source ID %llu with empty name or description", buf, 0xCu);
  }

  v12 = 0;
LABEL_16:

  return v12;
}

- (NSString)localizedSourceDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)localizedSourceDescription_dataSourceMap;
  if (!localizedSourceDescription_dataSourceMap)
  {
    localizedSourceDescription_dataSourceMap = (uint64_t)&unk_24D7603A0;

    v3 = &unk_24D7603A0;
  }
  -[StockDataSource name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24D74CF50, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[StockDataSource sourceDescription](self, "sourceDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v7;
}

- (id)archiveDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("id");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[StockDataSource identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("name");
  -[StockDataSource name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("text");
  -[StockDataSource sourceDescription](self, "sourceDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[StockDataSource identifier](self, "identifier");
  -[StockDataSource name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockDataSource sourceDescription](self, "sourceDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<StockDataSource: %p, %i, %@, %@>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sourceDescription
{
  return self->_sourceDescription;
}

- (void)setSourceDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
