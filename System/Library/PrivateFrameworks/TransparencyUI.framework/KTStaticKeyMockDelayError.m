@implementation KTStaticKeyMockDelayError

+ (id)mockStaticKeyWithNotificationCenter:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___KTStaticKeyMockDelayError;
  objc_msgSendSuper2(&v5, sel_mockStaticKeyWithNotificationCenter_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelayCode:", 1);
  objc_msgSend(v3, "setCodeFailure:", 1);
  return v3;
}

@end
