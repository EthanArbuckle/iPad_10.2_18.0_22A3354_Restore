@implementation APEventSessionPersistence

- (id)rootUrl
{
  if (qword_10026D100 != -1)
    dispatch_once(&qword_10026D100, &stru_1002188A8);
  return (id)qword_10026D0F8;
}

- (BOOL)_isNoFileExistsError:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "code") == (id)2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain")),
        v5 = objc_msgSend(v4, "isEqualToString:", NSPOSIXErrorDomain),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "underlyingErrors"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if (v8 && objc_msgSend(v8, "code") == (id)2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      v6 = objc_msgSend(v9, "isEqualToString:", NSPOSIXErrorDomain);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

@end
