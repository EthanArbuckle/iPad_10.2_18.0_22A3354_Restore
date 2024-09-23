@implementation ISAuthenticationChallengeOperation

- (void)dealloc
{
  objc_super v3;

  -[ISAuthenticationChallengeOperation setChallenge:](self, "setChallenge:", 0);
  -[ISAuthenticationChallengeOperation setCredential:](self, "setCredential:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ISAuthenticationChallengeOperation;
  -[ISDialogOperation dealloc](&v3, sel_dealloc);
}

+ (id)operationWithChallenge:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setChallenge:", a3);
  return v4;
}

- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4
{
  id v7;
  objc_super v8;

  if (a3 == 1)
    v7 = -[ISAuthenticationChallengeOperation _copyCredentialForSignInResponseDictionary:](self, "_copyCredentialForSignInResponseDictionary:", a4);
  else
    v7 = 0;
  -[ISAuthenticationChallengeOperation setCredential:](self, "setCredential:", v7);

  v8.receiver = self;
  v8.super_class = (Class)ISAuthenticationChallengeOperation;
  -[ISDialogOperation handleButtonSelected:withResponseDictionary:](&v8, sel_handleButtonSelected_withResponseDictionary_, a3, a4);
}

- (void)run
{
  ISDialog *v3;
  objc_super v4;

  v3 = -[ISDialog initWithAuthenticationChallege:]([ISDialog alloc], "initWithAuthenticationChallege:", -[ISAuthenticationChallengeOperation challenge](self, "challenge"));
  -[ISDialog setAllowDuplicates:](v3, "setAllowDuplicates:", 1);
  -[ISDialogOperation setDialog:](self, "setDialog:", v3);

  v4.receiver = self;
  v4.super_class = (Class)ISAuthenticationChallengeOperation;
  -[ISDialogOperation run](&v4, "run");
}

- (id)_copyCredentialForSignInResponseDictionary:(id)a3
{
  void *Value;
  void *v5;
  CFTypeID v6;
  NSString *ValueAtIndex;
  CFTypeID v8;

  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x24BDBD728]);
  v5 = Value;
  if (!Value)
    goto LABEL_8;
  v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    v8 = CFGetTypeID(v5);
    if (v8 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v5) == 2)
    {
      ValueAtIndex = (NSString *)CFArrayGetValueAtIndex((CFArrayRef)v5, 0);
      v5 = (void *)CFArrayGetValueAtIndex((CFArrayRef)v5, 1);
      goto LABEL_9;
    }
    v5 = 0;
LABEL_8:
    ValueAtIndex = 0;
    goto LABEL_9;
  }
  ValueAtIndex = -[ISAuthenticationChallenge user](-[ISAuthenticationChallengeOperation challenge](self, "challenge"), "user");
LABEL_9:
  if (-[NSString length](ValueAtIndex, "length") && objc_msgSend(v5, "length"))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1818]), "initWithUser:password:persistence:", ValueAtIndex, v5, 1);
  else
    return 0;
}

- (ISAuthenticationChallenge)challenge
{
  return (ISAuthenticationChallenge *)objc_getProperty(self, a2, 376, 1);
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSURLCredential)credential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

@end
