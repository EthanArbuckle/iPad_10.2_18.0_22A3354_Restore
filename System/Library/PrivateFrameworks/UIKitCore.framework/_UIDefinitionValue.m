@implementation _UIDefinitionValue

- (_UIDefinitionValue)initWithLocalizedDictionaryName:(id)a3 term:(id)a4 definition:(id)a5 longDefinition:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _UIDefinitionValue *v14;
  uint64_t v15;
  NSString *localizedDictionaryName;
  uint64_t v17;
  NSString *term;
  uint64_t v19;
  NSAttributedString *definition;
  uint64_t v21;
  NSString *longDefinition;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UIDefinitionValue;
  v14 = -[_UIDefinitionValue init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    localizedDictionaryName = v14->_localizedDictionaryName;
    v14->_localizedDictionaryName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    term = v14->_term;
    v14->_term = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    definition = v14->_definition;
    v14->_definition = (NSAttributedString *)v19;

    v21 = objc_msgSend(v13, "copy");
    longDefinition = v14->_longDefinition;
    v14->_longDefinition = (NSString *)v21;

  }
  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: localizedDictionaryName: %@, term: %@, definition: %@"), v5, self, self->_localizedDictionaryName, self->_term, self->_definition);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)localizedDictionaryName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)term
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSAttributedString)definition
{
  return (NSAttributedString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)longDefinition
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (MAAsset)rawAsset
{
  return self->_rawAsset;
}

- (void)setRawAsset:(id)a3
{
  objc_storeStrong((id *)&self->_rawAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_longDefinition, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_localizedDictionaryName, 0);
}

@end
