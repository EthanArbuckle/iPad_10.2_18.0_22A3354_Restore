@implementation TBError

- (TBError)initWithType:(int64_t)a3 userInfo:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TBError;
  return -[TBError initWithDomain:code:userInfo:](&v5, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.wifi.threebars"), a3, a4);
}

+ (id)responseErrorWithUserInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:userInfo:", 200, v4);

  return v5;
}

+ (id)fetchUnsupportedErrorWithUserInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:userInfo:", 100, v4);

  return v5;
}

+ (id)fetchMissingParametersErrorWithUserInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:userInfo:", 101, v4);

  return v5;
}

@end
