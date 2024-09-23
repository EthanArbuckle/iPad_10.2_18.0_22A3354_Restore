@implementation REElementArchiver

- (REElementArchiver)initWithEngine:(id)a3
{
  id v5;
  REElementArchiver *v6;
  REElementArchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementArchiver;
  v6 = -[REElementArchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_engine, a3);

  return v7;
}

- (id)_supportedClasses
{
  if (_supportedClasses_onceToken != -1)
    dispatch_once(&_supportedClasses_onceToken, &__block_literal_global_44);
  return (id)_supportedClasses_Classes;
}

void __38__REElementArchiver__supportedClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_supportedClasses_Classes;
  _supportedClasses_Classes = v2;

}

- (id)elementWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  -[REElementArchiver _supportedClasses](self, "_supportedClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v6, v5, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v18;
  if (v7)
  {
    -[RERelevanceEngine elementFromDictionary:](self->_engine, "elementFromDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    RELogForDomain(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[REElementArchiver elementWithData:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }

  return v9;
}

- (id)dataWithElement:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  -[RERelevanceEngine dictionaryFromElement:](self->_engine, "dictionaryFromElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      RELogForDomain(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REElementArchiver dataWithElement:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)elementWithData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Unable to decode REElement from data %@", a5, a6, a7, a8, 2u);
}

- (void)dataWithElement:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_2132F7000, a2, a3, "Unable to encode REElement to data %@", a5, a6, a7, a8, 2u);
}

@end
