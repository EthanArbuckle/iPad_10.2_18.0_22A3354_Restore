@implementation SCWWatchedStock

+ (id)watchedStockWithSymbol:(id)a3 name:(id)a4 exchange:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:shortName:compactName:symbol:exchange:", v8, 0, 0, v9, v7);

  return v10;
}

- (SCWWatchedStock)initWithName:(id)a3 shortName:(id)a4 compactName:(id)a5 symbol:(id)a6 exchange:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SCWWatchedStock *v17;
  SCWWatchedStock *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SCWWatchedStock;
  v17 = -[SCWWatchedStock init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortName, a4);
    objc_storeStrong((id *)&v18->_compactName, a5);
    objc_storeStrong((id *)&v18->_symbol, a6);
    objc_storeStrong((id *)&v18->_exchange, a7);
  }

  return v18;
}

- (SCWWatchedStock)initWithName:(id)a3 shortName:(id)a4 symbol:(id)a5 exchange:(id)a6
{
  return -[SCWWatchedStock initWithName:shortName:compactName:symbol:exchange:](self, "initWithName:shortName:compactName:symbol:exchange:", a3, a4, 0, a5, a6);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SCWWatchedStock symbol](self, "symbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SCWWatchedStock %p, symbol=%@>"), self, v4);
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
    -[SCWWatchedStock symbol](self, "symbol");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "symbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[SCWWatchedStock exchange](self, "exchange");
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

  -[SCWWatchedStock symbol](self, "symbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SCWWatchedStock exchange](self, "exchange");
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

- (NSString)compactName
{
  return self->_compactName;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (NSString)exchange
{
  return self->_exchange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchange, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_compactName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
