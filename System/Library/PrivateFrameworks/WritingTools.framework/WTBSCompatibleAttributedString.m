@implementation WTBSCompatibleAttributedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[WTBSCompatibleAttributedString attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WTUICodingKeyString"));

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[WTBSCompatibleAttributedString attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTBSCompatibleAttributedString attributedString](self, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__WTBSCompatibleAttributedString_encodeWithCoder___block_invoke;
  v12[3] = &unk_251C051A8;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v12);

  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("WTUICodingAttributes"));
}

void __50__WTBSCompatibleAttributedString_encodeWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x24BDD1968];
  v8 = a2;
  objc_msgSend(v7, "valueWithRange:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

}

- (WTBSCompatibleAttributedString)initWithCoder:(id)a3
{
  id v4;
  WTBSCompatibleAttributedString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSAttributedString *v10;
  NSAttributedString *attributedString;
  NSAttributedString *v12;
  _QWORD v14[4];
  NSAttributedString *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WTBSCompatibleAttributedString;
  v5 = -[WTBSCompatibleAttributedString init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTUICodingKeyString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
    objc_msgSend((id)objc_opt_class(), "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("WTUICodingAttributes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__WTBSCompatibleAttributedString_initWithCoder___block_invoke;
    v14[3] = &unk_251C051D0;
    v10 = v7;
    v15 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
    attributedString = v5->_attributedString;
    v5->_attributedString = v10;
    v12 = v10;

  }
  return v5;
}

void __48__WTBSCompatibleAttributedString_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v7 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  objc_msgSend(v4, "addAttributes:range:", v7, v5, v6);

}

+ (id)allowedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(CFSTR("WTBSCodingKey"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

- (WTBSCompatibleAttributedString)initWithXPCDictionary:(id)a3
{
  id v4;
  WTBSCompatibleAttributedString *v5;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(CFSTR("WTBSCodingKey"), "UTF8String");
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v5 = (WTBSCompatibleAttributedString *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
