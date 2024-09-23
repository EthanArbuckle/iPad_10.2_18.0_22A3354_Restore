@implementation PKTransactionReceiptHeaderField

- (PKTransactionReceiptHeaderField)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKTransactionReceiptHeaderField *v8;
  uint64_t v9;
  NSString *key;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *label;
  uint64_t v15;
  NSString *value;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKTransactionReceiptHeaderField;
  v8 = -[PKTransactionReceiptHeaderField init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("key"));
    v9 = objc_claimAutoreleasedReturnValue();
    key = v8->_key;
    v8->_key = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("label"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      PKLocalizedReceiptStringForReceiptBundle(v11, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      label = v8->_label;
      v8->_label = (NSString *)v13;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("value"));
    v15 = objc_claimAutoreleasedReturnValue();
    value = v8->_value;
    v8->_value = (NSString *)v15;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("key: '%@'; "), self->_key);
  objc_msgSend(v3, "appendFormat:", CFSTR("label: '%@'; "), self->_label);
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), self->_value);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReceiptHeaderField *v4;
  PKTransactionReceiptHeaderField *v5;
  BOOL v6;

  v4 = (PKTransactionReceiptHeaderField *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReceiptHeaderField isEqualToTransactionReceiptHeaderField:](self, "isEqualToTransactionReceiptHeaderField:", v5);

  return v6;
}

- (BOOL)isEqualToTransactionReceiptHeaderField:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  NSString *value;
  void *v14;
  NSString *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[1];
    v7 = self->_key;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
        goto LABEL_20;
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_21;
    }
    v11 = (void *)v5[2];
    v7 = self->_label;
    v12 = v11;
    if (v7 == v12)
    {

LABEL_15:
      value = self->_value;
      v14 = (void *)v5[3];
      v7 = value;
      v15 = v14;
      if (v7 == v15)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v15;
        LOBYTE(v10) = 0;
        if (v7 && v15)
          LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v15);
      }
      goto LABEL_20;
    }
    v9 = v12;
    LOBYTE(v10) = 0;
    if (v7 && v12)
    {
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

      if (!v10)
        goto LABEL_21;
      goto LABEL_15;
    }
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v10) = 0;
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_key);
  objc_msgSend(v3, "safelyAddObject:", self->_label);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceiptHeaderField)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReceiptHeaderField *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSString *label;
  uint64_t v10;
  NSString *value;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionReceiptHeaderField;
  v5 = -[PKTransactionReceiptHeaderField init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v10 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)value
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
