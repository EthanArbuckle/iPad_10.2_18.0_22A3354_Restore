@implementation PKPaymentAuthorizationInterfaceManager

+ (id)paymentInterfaceForContext:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  PKPaymentAuthorizationPaymentUIInterface *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPaymentAuthorizationPaymentUIInterface initWithContext:configuration:]([PKPaymentAuthorizationPaymentUIInterface alloc], "initWithContext:configuration:", v7, v6);

  return v8;
}

@end
