@implementation SCWatchedStock

+ (id)watchedStockWithSymbol:(id)a3 name:(id)a4 exchange:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:shortName:symbol:exchange:displaySymbol:", v8, 0, v9, v7, 0);

  return v10;
}

- (SCWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6 displaySymbol:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SCWatchedStock *v17;
  SCWatchedStock *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SCWatchedStock;
  v17 = -[SCWatchedStock init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortName, a4);
    objc_storeStrong((id *)&v18->_symbol, a5);
    objc_storeStrong((id *)&v18->_exchange, a6);
    objc_storeStrong((id *)&v18->_displaySymbol, a7);
  }

  return v18;
}

- (SCWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6
{
  return -[SCWatchedStock initWithName:shortName:symbol:exchange:displaySymbol:](self, "initWithName:shortName:symbol:exchange:displaySymbol:", a3, a4, a5, a6, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCWatchedStock symbol](self, "symbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SCWatchedStock %p, symbol=%@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SCWatchedStock symbol](self, "symbol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "symbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[SCWatchedStock exchange](self, "exchange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exchange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SCWatchedStock symbol](self, "symbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SCWatchedStock exchange](self, "exchange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (NSString)exchange
{
  return self->_exchange;
}

- (NSString)displaySymbol
{
  return self->_displaySymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySymbol, 0);
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
