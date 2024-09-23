@implementation RMLogItem

- (id)_initWithTimestamp:(double)a3
{
  RMLogItem *v4;
  RMLogItemInternal *v5;
  id internalLogItem;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMLogItem;
  v4 = -[RMLogItem init](&v8, sel_init);
  if (v4)
  {
    v5 = -[RMLogItemInternal initWithTimestamp:]([RMLogItemInternal alloc], "initWithTimestamp:", a3);
    internalLogItem = v4->_internalLogItem;
    v4->_internalLogItem = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMLogItem)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kRMLogItemCodingKeyTimestamp"));
  return (RMLogItem *)-[RMLogItem _initWithTimestamp:](self, "_initWithTimestamp:");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kRMLogItemCodingKeyTimestamp"), *((double *)self->_internalLogItem + 1));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RMLogItem timestamp](self, "timestamp");
  return (id)objc_msgSend(v4, "initWithTimestamp:");
}

- (double)timestamp
{
  return *((double *)self->_internalLogItem + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalLogItem, 0);
}

@end
