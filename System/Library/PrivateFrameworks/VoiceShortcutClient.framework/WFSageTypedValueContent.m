@implementation WFSageTypedValueContent

- (WFSageTypedValueContent)initWithEncodedTypedValue:(id)a3
{
  id v4;
  WFSageTypedValueContent *v5;
  uint64_t v6;
  NSData *encodedTypedValue;
  WFSageTypedValueContent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSageTypedValueContent;
  v5 = -[WFSageTypedValueContent init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    encodedTypedValue = v5->_encodedTypedValue;
    v5->_encodedTypedValue = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSageTypedValueContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFSageTypedValueContent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedTypedValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFSageTypedValueContent initWithEncodedTypedValue:](self, "initWithEncodedTypedValue:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSageTypedValueContent encodedTypedValue](self, "encodedTypedValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("encodedTypedValue"));

}

- (NSString)name
{
  return 0;
}

- (NSData)encodedTypedValue
{
  return self->_encodedTypedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTypedValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
