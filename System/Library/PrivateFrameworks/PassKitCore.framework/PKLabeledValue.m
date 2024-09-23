@implementation PKLabeledValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKLabeledValue)init
{
  return -[PKLabeledValue initWithLabel:value:](self, "initWithLabel:value:", &stru_1E2ADF4C0, &stru_1E2ADF4C0);
}

- (PKLabeledValue)initWithLabel:(NSString *)label value:(NSString *)value
{
  NSString *v6;
  NSString *v7;
  PKLabeledValue *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = label;
  v7 = value;
  v14.receiver = self;
  v14.super_class = (Class)PKLabeledValue;
  v8 = -[PKLabeledValue init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_label;
    v8->_label = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_value;
    v8->_value = (NSString *)v11;

  }
  return v8;
}

- (PKLabeledValue)initWithCoder:(id)a3
{
  id v4;
  PKLabeledValue *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  void *v9;
  uint64_t v10;
  NSString *value;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKLabeledValue;
  v5 = -[PKLabeledValue init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKLVLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PKLVValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    value = v5->_value;
    v5->_value = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("PKLVLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("PKLVValue"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  NSString *label;
  NSString *v8;
  NSString *value;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_12;
  label = self->_label;
  v8 = (NSString *)v6[1];
  if (!label || !v8)
  {
    if (label == v8)
      goto LABEL_8;
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  if ((-[NSString isEqual:](label, "isEqual:") & 1) == 0)
    goto LABEL_12;
LABEL_8:
  value = self->_value;
  v10 = (NSString *)v6[2];
  if (value && v10)
    v11 = -[NSString isEqual:](value, "isEqual:");
  else
    v11 = value == v10;
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_label, "hash");
  return -[NSString hash](self->_value, "hash") ^ v3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
