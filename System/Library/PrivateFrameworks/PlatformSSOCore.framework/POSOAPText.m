@implementation POSOAPText

+ (id)definition
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setContentPropertyName:type:", CFSTR("stringValue"), objc_opt_class());
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:](POXSComplexTypeDefinition, "descriptionForValue:", self);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "rangeOfString:", CFSTR(":")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8.receiver = self;
    v8.super_class = (Class)POSOAPText;
    -[POSOAPText setValue:forKey:](&v8, sel_setValue_forKey_, v6, v7);
  }

}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
