@implementation SSPaymentSheetPriceSectionItem

- (SSPaymentSheetPriceSectionItem)initWithDictionary:(id)a3
{
  id v4;
  SSPaymentSheetPriceSectionItem *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSPaymentSheetPriceSectionItem;
  v5 = -[SSPaymentSheetPriceSectionItem init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("caseControl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    -[SSPaymentSheetPriceSectionItem _parseDictionary:withCaseControl:](v5, "_parseDictionary:withCaseControl:", v4, v7);
  }

  return v5;
}

- (void)_parseDictionary:(id)a3 withCaseControl:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSString *v7;
  NSString *label;
  void *v9;
  NSString *v10;
  NSString *price;
  id v12;

  v4 = a4;
  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("header"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(v6, "localizedUppercaseString");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    label = self->_label;
    self->_label = v7;

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v9, "localizedUppercaseString");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    price = self->_price;
    self->_price = v10;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  SSPaymentSheetPriceSectionItem *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *price;

  v5 = objc_alloc_init(SSPaymentSheetPriceSectionItem);
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  label = v5->_label;
  v5->_label = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_price, "copyWithZone:", a3);
  price = v5->_price;
  v5->_price = (NSString *)v8;

  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_label);
  SSXPCDictionarySetObject(v3, "1", self->_price);
  return v3;
}

- (SSPaymentSheetPriceSectionItem)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPaymentSheetPriceSectionItem *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *label;
  uint64_t v11;
  uint64_t v12;
  NSString *price;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSPaymentSheetPriceSectionItem;
    v6 = -[SSPaymentSheetPriceSectionItem init](&v14, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      label = v6->_label;
      v6->_label = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      price = v6->_price;
      v6->_price = (NSString *)v12;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)price
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrice:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
