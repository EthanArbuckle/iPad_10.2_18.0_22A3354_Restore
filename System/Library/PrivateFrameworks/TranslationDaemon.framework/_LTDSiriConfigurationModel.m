@implementation _LTDSiriConfigurationModel

- (_LTDSiriConfigurationModel)initWithDictionary:(id)a3
{
  id v4;
  _LTDSiriConfigurationModel *v5;
  void *v6;
  int v7;
  void *v8;
  NSArray *v9;
  NSArray *availableLanguagePairs;
  _LTDSiriConfigurationModel *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTDSiriConfigurationModel;
  v5 = -[_LTDSiriConfigurationModel init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LanguagePairs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = objc_msgSend(v6, "lt_ensureElementType:", objc_opt_class());
      v8 = (void *)MEMORY[0x24BDBD1A8];
      if (v7)
        v8 = v6;
    }
    else
    {

      v6 = 0;
      v8 = (void *)MEMORY[0x24BDBD1A8];
    }
    v9 = v8;

    availableLanguagePairs = v5->_availableLanguagePairs;
    v5->_availableLanguagePairs = v9;

    v11 = v5;
  }

  return v5;
}

- (id)debugDescription
{
  return (id)-[NSArray debugDescription](self->_availableLanguagePairs, "debugDescription");
}

- (NSArray)availableLanguagePairs
{
  return self->_availableLanguagePairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLanguagePairs, 0);
}

@end
