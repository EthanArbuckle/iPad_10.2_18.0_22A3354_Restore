@implementation RMUIKeyValueViewModel

- (RMUIKeyValueViewModel)init
{
  RMUIKeyValueViewModel *v2;
  RMUIKeyValueViewModel *v3;
  NSArray *detailViewModels;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RMUIKeyValueViewModel;
  v2 = -[RMUIKeyValueViewModel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    detailViewModels = v2->_detailViewModels;
    v2->_detailViewModels = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (void)clearModel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[RMUIKeyValueViewModel setTitle:](self, "setTitle:", 0);
  -[RMUIKeyValueViewModel setSymbol:](self, "setSymbol:", 0);
  -[RMUIKeyValueViewModel setDeclaration:](self, "setDeclaration:", 0);
  -[RMUIKeyValueViewModel setDeclarationIdentifier:](self, "setDeclarationIdentifier:", 0);
  -[RMUIKeyValueViewModel setDeclarationServerToken:](self, "setDeclarationServerToken:", 0);
  -[RMUIKeyValueViewModel setDeclarationType:](self, "setDeclarationType:", 0);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[RMUIKeyValueViewModel detailViewModels](self, "detailViewModels", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearModel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithShort:", -[RMUIKeyValueViewModel symbol](self, "symbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("symbol"));

  -[RMUIKeyValueViewModel title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("title"));

  -[RMUIKeyValueViewModel declaration](self, "declaration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("declaration"));

  -[RMUIKeyValueViewModel declarationIdentifier](self, "declarationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("declarationIdentifier"));

  -[RMUIKeyValueViewModel declarationServerToken](self, "declarationServerToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("declarationServerToken"));

  -[RMUIKeyValueViewModel declarationType](self, "declarationType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("declarationType"));

  -[RMUIKeyValueViewModel detailViewModels](self, "detailViewModels");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("detailViewModels"));

}

- (RMUIKeyValueViewModel)initWithCoder:(id)a3
{
  id v4;
  RMUIKeyValueViewModel *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  void *v10;
  uint64_t v11;
  RMModelDeclarationBase *declaration;
  void *v13;
  uint64_t v14;
  NSString *declarationIdentifier;
  void *v16;
  uint64_t v17;
  NSString *declarationServerToken;
  void *v19;
  uint64_t v20;
  NSString *declarationType;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *detailViewModels;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RMUIKeyValueViewModel;
  v5 = -[RMUIKeyValueViewModel init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_symbol = objc_msgSend(v6, "integerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("declaration"));
    v11 = objc_claimAutoreleasedReturnValue();
    declaration = v5->_declaration;
    v5->_declaration = (RMModelDeclarationBase *)v11;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("declarationIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    declarationIdentifier = v5->_declarationIdentifier;
    v5->_declarationIdentifier = (NSString *)v14;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("declarationServerToken"));
    v17 = objc_claimAutoreleasedReturnValue();
    declarationServerToken = v5->_declarationServerToken;
    v5->_declarationServerToken = (NSString *)v17;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("declarationType"));
    v20 = objc_claimAutoreleasedReturnValue();
    declarationType = v5->_declarationType;
    v5->_declarationType = (NSString *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("detailViewModels"));
    v25 = objc_claimAutoreleasedReturnValue();
    detailViewModels = v5->_detailViewModels;
    v5->_detailViewModels = (NSArray *)v25;

  }
  return v5;
}

- (signed)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(signed __int16)a3
{
  self->_symbol = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (RMModelDeclarationBase)declaration
{
  return (RMModelDeclarationBase *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeclaration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)declarationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeclarationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)declarationServerToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeclarationServerToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)declarationType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeclarationType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)detailViewModels
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDetailViewModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailViewModels, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_declarationServerToken, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_declaration, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
