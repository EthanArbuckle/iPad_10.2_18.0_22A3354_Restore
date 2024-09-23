@implementation NFUnifiedAccessSessionInterface

+ (id)interface
{
  if (qword_10032AC68 != -1)
    dispatch_once(&qword_10032AC68, &stru_1002EC448);
  return (id)qword_10032AC60;
}

- (void)setupInterface
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](&v2, "setupInterface");
}

@end
