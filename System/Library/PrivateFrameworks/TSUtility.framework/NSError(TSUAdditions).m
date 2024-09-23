@implementation NSError(TSUAdditions)

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:description:recoverySuggestion:
{
  void *v11;
  void *v12;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = v11;
  if (a5)
    objc_msgSend(v11, "setObject:forKey:", a5, *MEMORY[0x24BDD0FC8]);
  if (a6)
    objc_msgSend(v12, "setObject:forKey:", a6, *MEMORY[0x24BDD0FF0]);
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", a3, a4, v12);
}

+ (uint64_t)tsuErrorWithCode:()TSUAdditions
{
  id v5;
  uint64_t v6;

  if (a3 >= 3)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSError(TSUAdditions) tsuErrorWithCode:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSError_TSUAdditions.m"), 48, CFSTR("Bad error code"));
  }
  return objc_msgSend(a1, "tsu_errorWithDomain:code:description:recoverySuggestion:", CFSTR("com.apple.iWork.TSUtility"), a3, 0, 0);
}

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:
{
  void *v11;
  void *v12;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = v11;
  if (a5)
  {
    objc_msgSend(v11, "setObject:forKey:", a5, *MEMORY[0x24BDD0FC8]);
    objc_msgSend(v12, "setObject:forKey:", a5, CFSTR("TSULocalizedErrorAlertTitle"));
  }
  if (a6)
    objc_msgSend(v12, "setObject:forKey:", a6, CFSTR("TSULocalizedErrorAlertMessage"));
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", a3, a4, v12);
}

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:underlyingError:
{
  void *v13;
  void *v14;

  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = v13;
  if (a5)
  {
    objc_msgSend(v13, "setObject:forKey:", a5, *MEMORY[0x24BDD0FC8]);
    objc_msgSend(v14, "setObject:forKey:", a5, CFSTR("TSULocalizedErrorAlertTitle"));
  }
  if (a6)
    objc_msgSend(v14, "setObject:forKey:", a6, CFSTR("TSULocalizedErrorAlertMessage"));
  if (a7)
    objc_msgSend(v14, "setObject:forKey:", a7, *MEMORY[0x24BDD1398]);
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", a3, a4, v14);
}

- (uint64_t)tsu_localizedAlertTitle
{
  return objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("TSULocalizedErrorAlertTitle"));
}

- (uint64_t)tsu_localizedAlertMessage
{
  return objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("TSULocalizedErrorAlertMessage"));
}

- (uint64_t)tsu_isOutOfSpaceError
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (a1)
  {
    v1 = a1;
    v2 = *MEMORY[0x24BDD0B88];
    v3 = *MEMORY[0x24BDD1128];
    v4 = *MEMORY[0x24BDD1398];
    while (1)
    {
      v5 = (void *)objc_msgSend(v1, "domain");
      v6 = objc_msgSend(v1, "code");
      if (v5)
      {
        v7 = v6;
        if (objc_msgSend(v5, "isEqualToString:", v2))
        {
          v8 = v7 == 640;
        }
        else
        {
          if (!objc_msgSend(v5, "isEqualToString:", v3))
          {
            v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.iWork.TSUtility"));
            if (v7 == 2)
              v9 = v10;
            else
              v9 = 0;
            goto LABEL_15;
          }
          v8 = v7 == 28;
        }
        v9 = v8;
      }
      else
      {
        v9 = 0;
      }
LABEL_15:
      v11 = objc_msgSend((id)objc_msgSend(v1, "userInfo"), "objectForKey:", v4);
      if (v11)
      {
        v1 = (void *)v11;
        if (!(_DWORD)v9)
          continue;
      }
      return v9;
    }
  }
  return 0;
}

- (uint64_t)tsu_isCancelError
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (result)
  {
    v1 = (void *)result;
    v2 = *MEMORY[0x24BDD0B88];
    v3 = *MEMORY[0x24BDD1308];
    v4 = *MEMORY[0x24BDD1398];
    do
    {
      v5 = objc_msgSend(v1, "domain");
      v6 = objc_msgSend(v1, "code");
      if (v5)
      {
        if (v6 == 3072)
        {
          v7 = (void *)v5;
          v8 = v2;
        }
        else
        {
          if (v6 != -999)
            goto LABEL_9;
          v7 = (void *)v5;
          v8 = v3;
        }
        if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
          return 1;
      }
LABEL_9:
      result = objc_msgSend((id)objc_msgSend(v1, "userInfo"), "objectForKey:", v4);
      v1 = (void *)result;
    }
    while (result);
  }
  return result;
}

@end
