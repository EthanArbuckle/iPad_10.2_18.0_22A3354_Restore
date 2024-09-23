@implementation PKPaymentSetupFieldRequirement

- (PKPaymentSetupFieldRequirement)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentSetupFieldRequirement *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  _BOOL8 v9;
  uint64_t v10;
  NSString *fieldIdentifier;
  uint64_t v12;
  NSObject *value;
  uint64_t v14;
  NSObject *v15;
  PKPaymentSetupFieldRequirement *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupFieldRequirement;
  v5 = -[PKPaymentSetupFieldRequirement init](&v18, sel_init);
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
  v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v9 = 1;
  if (v6 != CFSTR("field"))
  {
    if (!v6 || (v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("field")), v7, !v8))
      v9 = 0;
  }

  v5->_type = v9;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("field"));
  v10 = objc_claimAutoreleasedReturnValue();
  fieldIdentifier = v5->_fieldIdentifier;
  v5->_fieldIdentifier = (NSString *)v10;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("value"));
  v12 = objc_claimAutoreleasedReturnValue();
  value = v5->_value;
  v5->_value = v12;

  if (!v5->_value)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("value"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v5->_value;
    v5->_value = v14;

  }
  if (!v5->_type)
    v16 = 0;
  else
LABEL_10:
    v16 = v5;

  return v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
}

@end
