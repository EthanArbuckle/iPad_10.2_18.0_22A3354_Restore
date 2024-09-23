@implementation NSString

+ (NSString)stringWithFourCC:(unsigned int)a3
{
  _BYTE v4[2];
  __int16 v5;
  char v6;

  v5 = bswap32(a3) >> 16;
  v4[1] = BYTE2(a3);
  v4[0] = HIBYTE(a3);
  v6 = 0;
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 4));
}

+ (id)sanitizedHexString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("01234567890ABCDEFabcdef")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "invertedSet"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", &stru_1002CD590));

  return v7;
}

- (NSString)fmd_localizedString
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMDFMIPManager, a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", self, &stru_1002CD590, 0));
  else
    v6 = 0;

  return (NSString *)v6;
}

- (id)fmd_localizedStringInTable:(id)a3
{
  id v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FMDFMIPManager, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v7)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", self, &stru_1002CD590, v4));
  else
    v9 = 0;

  return v9;
}

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString objectType](NSString, "objectType"));
  objc_msgSend(v5, "encodeString:forKey:", self, v6);

  return 1;
}

- (NSString)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString objectType](NSString, "objectType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeStringForKey:", v7));

  if (v8)
  {
    self = -[NSString initWithString:](self, "initWithString:", v8);
    a4 = self;
  }
  else if (a4)
  {
    v11 = NSLocalizedFailureReasonErrorKey;
    v12 = CFSTR("Key \"FM.String\" not found.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMStringErrorDomain"), 0, v9));

    a4 = 0;
  }

  return a4;
}

+ (id)objectType
{
  return CFSTR("FM.string");
}

+ (id)objectTypeKey
{
  return CFSTR("stringType");
}

@end
