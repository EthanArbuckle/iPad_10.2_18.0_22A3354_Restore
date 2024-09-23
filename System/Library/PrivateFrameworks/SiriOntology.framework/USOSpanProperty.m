@implementation USOSpanProperty

- (USOSpanProperty)initWithKey:(id)a3
{
  id v5;
  USOSpanProperty *v6;
  USOSpanProperty *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USOSpanProperty;
  v6 = -[USOSpanProperty init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_key, a3);

  return v7;
}

- (USOSpanProperty)initWithKey:(id)a3 valueString:(id)a4
{
  id v7;
  id v8;
  USOSpanProperty *v9;
  USOSpanProperty *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)USOSpanProperty;
  v9 = -[USOSpanProperty init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_valueString, a4);
  }

  return v10;
}

- (USOSpanProperty)initWithKey:(id)a3 valueInt:(int)a4
{
  uint64_t v4;
  id v7;
  USOSpanProperty *v8;
  USOSpanProperty *v9;
  uint64_t v10;
  NSNumber *valueInt;
  objc_super v13;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)USOSpanProperty;
  v8 = -[USOSpanProperty init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_key, a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    valueInt = v9->_valueInt;
    v9->_valueInt = (NSNumber *)v10;

  }
  return v9;
}

- (USOSpanProperty)initWithKey:(id)a3 valueFloat:(float)a4
{
  id v7;
  USOSpanProperty *v8;
  USOSpanProperty *v9;
  double v10;
  uint64_t v11;
  NSNumber *valueFloat;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSpanProperty;
  v8 = -[USOSpanProperty init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_key, a3);
    *(float *)&v10 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    valueFloat = v9->_valueFloat;
    v9->_valueFloat = (NSNumber *)v11;

  }
  return v9;
}

- (USOSpanProperty)initWithCoder:(id)a3
{
  id v4;
  USOSpanProperty *v5;
  uint64_t v6;
  NSString *key;
  uint64_t v8;
  NSString *valueString;
  uint64_t v10;
  NSNumber *valueInt;
  uint64_t v12;
  NSNumber *valueFloat;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)USOSpanProperty;
  v5 = -[USOSpanProperty init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueString"));
    v8 = objc_claimAutoreleasedReturnValue();
    valueString = v5->_valueString;
    v5->_valueString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueInt"));
    v10 = objc_claimAutoreleasedReturnValue();
    valueInt = v5->_valueInt;
    v5->_valueInt = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueFloat"));
    v12 = objc_claimAutoreleasedReturnValue();
    valueFloat = v5->_valueFloat;
    v5->_valueFloat = (NSNumber *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[USOSpanProperty key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[USOSpanProperty valueString](self, "valueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueString"));

  -[USOSpanProperty valueInt](self, "valueInt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("valueInt"));

  -[USOSpanProperty valueFloat](self, "valueFloat");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("valueFloat"));

}

- (NSString)key
{
  return self->_key;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (NSNumber)valueInt
{
  return self->_valueInt;
}

- (NSNumber)valueFloat
{
  return self->_valueFloat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFloat, 0);
  objc_storeStrong((id *)&self->_valueInt, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
