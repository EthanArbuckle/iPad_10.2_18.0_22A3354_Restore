@implementation BMDateFormatterVendor

- (BMDateFormatterVendor)init
{
  BMDateFormatterVendor *v2;
  NSISO8601DateFormatter *v3;
  NSISO8601DateFormatter *dateFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMDateFormatterVendor;
  v2 = -[BMDateFormatterVendor init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSISO8601DateFormatter);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10007BE80 != -1)
    dispatch_once(&qword_10007BE80, &stru_1000698E0);
  return (id)qword_10007BE78;
}

- (id)dateFormatter
{
  return self->_dateFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
