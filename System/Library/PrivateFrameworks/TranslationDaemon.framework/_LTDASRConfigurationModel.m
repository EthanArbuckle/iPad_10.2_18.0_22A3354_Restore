@implementation _LTDASRConfigurationModel

- (_LTDASRConfigurationModel)initWithDictionary:(id)a3
{
  id v5;
  _LTDASRConfigurationModel *v6;
  _LTDASRConfigurationModel *v7;
  void *v8;
  int v9;
  void *v10;
  NSArray *v11;
  NSArray *localeIdentifiers;
  _LTDASRConfigurationModel *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTDASRConfigurationModel;
  v6 = -[_LTDASRConfigurationModel init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_root, a3);
    -[NSDictionary objectForKeyedSubscript:](v7->_root, "objectForKeyedSubscript:", CFSTR("_all"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = objc_msgSend(v8, "lt_ensureElementType:", objc_opt_class());
      v10 = (void *)MEMORY[0x24BDBD1A8];
      if (v9)
        v10 = v8;
    }
    else
    {

      v8 = 0;
      v10 = (void *)MEMORY[0x24BDBD1A8];
    }
    v11 = v10;

    localeIdentifiers = v7->_localeIdentifiers;
    v7->_localeIdentifiers = v11;

    v13 = v7;
  }

  return v7;
}

- (NSArray)locales
{
  return (NSArray *)-[NSArray _ltCompactMap:](self->_localeIdentifiers, "_ltCompactMap:", &__block_literal_global_1);
}

- (NSArray)localeIdentifiers
{
  return self->_localeIdentifiers;
}

- (NSDictionary)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
}

@end
