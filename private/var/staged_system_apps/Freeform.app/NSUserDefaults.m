@implementation NSUserDefaults

+ (void)crl_registerDefaults
{
  if (qword_101414EC8 != -1)
    dispatch_once(&qword_101414EC8, &stru_10123E4D8);
}

- (BOOL)CRLEnsureOwnershipOfDataUserDefault
{
  NSUserDefaults *v2;
  NSString v3;
  unsigned __int8 v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", v3);

  return v4;
}

- (int64_t)CRLMathRecognitionMode
{
  return -[NSUserDefaults integerForKey:](self, "integerForKey:", CFSTR("CRLMathRecognitionMode"));
}

@end
