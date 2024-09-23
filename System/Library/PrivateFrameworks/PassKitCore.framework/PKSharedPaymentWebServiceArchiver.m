@implementation PKSharedPaymentWebServiceArchiver

+ (id)sharedPaymentWebServiceArchiver
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)archiveContext:(id)a3
{
  id v3;
  PKPaymentService *v4;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService setSharedPaymentWebServiceContext:](v4, "setSharedPaymentWebServiceContext:", v3);

}

@end
