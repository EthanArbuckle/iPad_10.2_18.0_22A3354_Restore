@implementation NSError

- (BOOL)_isCKServerInternalError
{
  void *v3;
  void *v4;
  void *v5;
  NSInteger v6;
  BOOL v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CKErrorDomain")))
  {
    v6 = -[NSError code](self, "code");
    v7 = 0;
    if (v6 == 15 && v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("CKInternalErrorDomain")))
        v7 = objc_msgSend(v4, "code") == (id)2000;
      else
        v7 = 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isCuttlefishError:(int64_t)a3
{
  NSError *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v4, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("CKErrorDomain")))
    goto LABEL_8;
  v6 = -[NSError code](v4, "code");

  if (v6 == (id)15)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v4, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CKInternalErrorDomain")))
      goto LABEL_11;
    v9 = objc_msgSend(v5, "code");

    if (v9 == (id)6000)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      if (objc_msgSend(v11, "isEqualToString:", CuttlefishErrorDomain))
      {
        v12 = objc_msgSend(v8, "code");

        if (v12 == (id)a3)
        {
          v13 = 1;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {

      }
LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
LABEL_8:
    v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)_isRetryableNSURLError
{
  NSError *v2;
  void *v3;
  unsigned int v4;
  BOOL v5;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  v4 = objc_msgSend(v3, "isEqualToString:", NSURLErrorDomain);

  if (v4)
    v5 = (((unint64_t)-[NSError code](v2, "code") + 1009) & 0xFFFFFFFFFFFFFFF7) == 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isRetryableAKError
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v6 = 0;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AKAuthenticationError")) && v4)
    v6 = objc_msgSend(v4, "_isRetryableNSURLError");

  return v6;
}

- (BOOL)isRetryable
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unint64_t v10;

  if (-[NSError isCuttlefishError:](self, "isCuttlefishError:", 1021)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1019)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1002)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1004)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1016)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1017)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1038))
  {
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", TrustedPeersHelperErrorDomain);

  if (v5)
  {
    LOBYTE(v3) = (id)-[NSError code](self, "code") == (id)36;
    return v3;
  }
  if (-[NSError _isRetryableNSURLError](self, "_isRetryableNSURLError"))
    goto LABEL_8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CKErrorDomain"));

  if (!v7)
  {
    if (!-[NSError _isCKServerInternalError](self, "_isCKServerInternalError"))
    {
      LOBYTE(v3) = -[NSError _isRetryableAKError](self, "_isRetryableAKError");
      return v3;
    }
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CKRetryAfter")));

  if (v9)
  {
LABEL_8:
    LOBYTE(v3) = 1;
    return v3;
  }
  v10 = -[NSError code](self, "code");
  if (v10 >= 8)
    LOBYTE(v3) = 0;
  else
    return (0x98u >> v10) & 1;
  return v3;
}

- (double)cuttlefishRetryAfter
{
  NSError *v2;
  void *v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  v4 = 0.0;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("CKErrorDomain")))
    goto LABEL_9;
  v5 = -[NSError code](v2, "code");

  if (v5 == (id)15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v2, "userInfo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("CKInternalErrorDomain")))
    {
      v8 = objc_msgSend(v3, "code");

      if (v8 != (id)6000)
      {
LABEL_9:

        goto LABEL_10;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
      LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", CuttlefishErrorDomain);

      if ((_DWORD)v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CuttlefishErrorRetryAfterKey));

        if (v12)
        {
          objc_msgSend(v12, "doubleValue");
          v4 = v13;

        }
      }
    }

    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (double)retryInterval
{
  NSError *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double result;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v2 = self;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100011894;
  v18 = sub_1000118A4;
  v19 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CKErrorDomain"));

  if (v4)
  {
    if ((id)-[NSError code](v2, "code") == (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v2, "userInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CKPartialErrors")));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000118AC;
      v13[3] = &unk_100020790;
      v13[4] = &v14;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v2, "userInfo"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CKRetryAfter")));
      v8 = (void *)v15[5];
      v15[5] = v7;

    }
  }
  v9 = (void *)v15[5];
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 0.0;
  }
  _Block_object_dispose(&v14, 8);

  -[NSError cuttlefishRetryAfter](v2, "cuttlefishRetryAfter");
  if (v11 >= result)
    result = v11;
  if (result == 0.0)
    return *(double *)&qword_100025BF8;
  return result;
}

+ (void)setDefaultRetryIntervalForTests:(double)a3
{
  qword_100025BF8 = *(_QWORD *)&a3;
}

@end
