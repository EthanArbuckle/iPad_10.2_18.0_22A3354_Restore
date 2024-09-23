@implementation HDSPTestIDSMessage

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 2;
}

- (HDSPTestIDSMessage)initWithCoder:(id)a3
{
  HDSPTestIDSMessage *v3;
  HDSPTestIDSMessage *v4;
  HDSPTestIDSMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSPTestIDSMessage;
  v3 = -[HDSPTestIDSMessage init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
