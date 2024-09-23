@implementation PPLabeledValue

- (PPLabeledValue)initWithLabel:(id)a3 value:(id)a4
{
  id v8;
  id v9;
  PPLabeledValue *v10;
  PPLabeledValue *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLabeledValue.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PPLabeledValue;
  v10 = -[PPLabeledValue init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_label, a3);
    objc_storeStrong((id *)&v11->_value, a4);
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPLabeledValue %@: '%@'>"), self->_label, self->_value);
}

- (PPLabeledValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PPLabeledValue *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lab"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("val"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[PPLabeledValue initWithLabel:value:](self, "initWithLabel:value:", v5, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("lab"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("val"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_label, "hash");
  return -[NSCopying hash](self->_value, "hash") - v3 + 32 * v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_class();
  v6 = (void *)-[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = (void *)-[NSCopying copyWithZone:](self->_value, "copyWithZone:", a3);
  objc_msgSend(v5, "labeledValueWithLabel:value:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PPLabeledValue *v4;
  PPLabeledValue *v5;
  BOOL v6;

  v4 = (PPLabeledValue *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPLabeledValue isEqualToLabeledValue:](self, "isEqualToLabeledValue:", v5);

  return v6;
}

- (BOOL)isEqualToLabeledValue:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *label;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSCopying *v12;
  NSCopying *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  label = self->_label;
  v7 = (NSString *)*((id *)v4 + 1);
  if (label == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = label;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_value;
  v13 = v12;
  if (v12 == (NSCopying *)v5[2])
    v11 = 1;
  else
    v11 = -[NSCopying isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (NSString)label
{
  return self->_label;
}

- (NSCopying)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (PPLabeledValue)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  PPLabeledValue *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PPLabeledValue initWithLabel:value:]([PPLabeledValue alloc], "initWithLabel:value:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
