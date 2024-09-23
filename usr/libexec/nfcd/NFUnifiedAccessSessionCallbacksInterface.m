@implementation NFUnifiedAccessSessionCallbacksInterface

+ (id)interface
{
  if (qword_10032AC78 != -1)
    dispatch_once(&qword_10032AC78, &stru_1002EC468);
  return (id)qword_10032AC70;
}

- (void)setupInterface
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionCallbacksInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](&v2, "setupInterface");
}

@end
