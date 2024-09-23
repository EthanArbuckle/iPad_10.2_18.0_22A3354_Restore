@implementation CMLogItem

- (CMLogItem)initWithTimestamp:(double)a3
{
  CMLogItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMLogItem;
  v4 = -[CMLogItem init](&v6, "init");
  if (v4)
    v4->_internalLogItem = -[CMLogItemInternal initWithTimestamp:]([CMLogItemInternal alloc], "initWithTimestamp:", a3);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLogItem)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("kCMLogItemCodingKeyTimestamp"));
  return -[CMLogItem initWithTimestamp:](self, "initWithTimestamp:");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("kCMLogItemCodingKeyTimestamp"), *((double *)self->_internalLogItem + 1));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMLogItem;
  -[CMLogItem dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  -[CMLogItem timestamp](self, "timestamp");
  return objc_msgSend(v4, "initWithTimestamp:");
}

- (NSTimeInterval)timestamp
{
  return *((double *)self->_internalLogItem + 1);
}

@end
