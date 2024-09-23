@implementation HDSPNotifiedForEarlyWakeUpIDSMessage

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 3;
}

- (HDSPNotifiedForEarlyWakeUpIDSMessage)initWithCoder:(id)a3
{
  HDSPNotifiedForEarlyWakeUpIDSMessage *v3;
  HDSPNotifiedForEarlyWakeUpIDSMessage *v4;
  HDSPNotifiedForEarlyWakeUpIDSMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSPNotifiedForEarlyWakeUpIDSMessage;
  v3 = -[HDSPNotifiedForEarlyWakeUpIDSMessage init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
