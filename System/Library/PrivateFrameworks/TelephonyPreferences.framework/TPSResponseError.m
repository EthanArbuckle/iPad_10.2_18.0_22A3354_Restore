@implementation TPSResponseError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v5;
  TPSResponseError *v6;

  v5 = a4;
  v6 = -[TPSResponseError initWithCode:userInfo:]([TPSResponseError alloc], "initWithCode:userInfo:", a3, v5);

  return v6;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (TPSResponseError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSResponseError;
  return -[TPSResponseError initWithDomain:code:userInfo:](&v5, sel_initWithDomain_code_userInfo_, TPSResponseErrorDomain, a3, a4);
}

- (TPSResponseError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  -[TPSResponseError doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

@end
