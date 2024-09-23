@implementation TCMPSGraphNodeHandle

+ (id)handleWithLabel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:", v4);

  return v5;
}

- (TCMPSGraphNodeHandle)initWithLabel:(id)a3
{
  id v5;
  TCMPSGraphNodeHandle *v6;
  TCMPSGraphNodeHandle *v7;
  TCMPSGraphNodeHandle *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCMPSGraphNodeHandle;
  v6 = -[TCMPSGraphNodeHandle init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    v8 = v7;
  }

  return v7;
}

- (id)label
{
  return self->_label;
}

- (BOOL)isEqual:(id)a3
{
  NSString *label;
  void *v4;

  label = self->_label;
  objc_msgSend(a3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(label) = -[NSString isEqual:](label, "isEqual:", v4);

  return (char)label;
}

- (TCMPSGraphNodeHandle)initWithCoder:(id)a3
{
  id v4;
  TCMPSGraphNodeHandle *v5;
  uint64_t v6;
  NSString *label;
  TCMPSGraphNodeHandle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCMPSGraphNodeHandle;
  v5 = -[TCMPSGraphNodeHandle init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TCMPSGraphNodeHandleLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_label, CFSTR("TCMPSGraphNodeHandleLabel"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
