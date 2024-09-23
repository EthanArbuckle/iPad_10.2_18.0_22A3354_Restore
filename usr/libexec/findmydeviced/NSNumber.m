@implementation NSNumber

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber objectType](NSNumber, "objectType"));
  objc_msgSend(v5, "encodeNumber:forKey:", self, v6);

  return 1;
}

- (NSNumber)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v12;
  const __CFString *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber objectType](NSNumber, "objectType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeNumberForKey:", v7));

  if (v8)
  {
    self = -[NSNumber initWithInt:](self, "initWithInt:", objc_msgSend(v8, "intValue"));
    if (self)
      v9 = v8;
    else
      v9 = 0;
    a4 = v9;
  }
  else if (a4)
  {
    v12 = NSLocalizedFailureReasonErrorKey;
    v13 = CFSTR("Key \"FM.number\" not found.");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMNumberErrorDomain"), 0, v10));

    a4 = 0;
  }

  return (NSNumber *)a4;
}

+ (id)objectType
{
  return CFSTR("FM.number");
}

+ (id)objectTypeKey
{
  return CFSTR("numberType");
}

@end
