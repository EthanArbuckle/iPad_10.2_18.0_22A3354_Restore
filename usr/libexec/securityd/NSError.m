@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", a3, a4, a5, 0);
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, NSLocalizedDescriptionKey);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, NSUnderlyingErrorKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, a4, v12));

  return (NSError *)v13;
}

- (BOOL)ckksIsCKErrorRecordChangedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", CKErrorDomain) || (id)-[NSError code](self, "code") != (id)2)
  {

    goto LABEL_18;
  }

  if (!v4)
  {
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
        if (!objc_msgSend(v12, "isEqualToString:", CKErrorDomain))
        {

LABEL_21:
          v14 = 0;
          goto LABEL_22;
        }
        if (objc_msgSend(v11, "code") == (id)22 || objc_msgSend(v11, "code") == (id)14)
        {

        }
        else
        {
          v13 = objc_msgSend(v11, "code");

          if (v13 != (id)11)
            goto LABEL_21;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_22:

LABEL_19:
  return v14;
}

- (BOOL)isCKKSServerPluginError:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (objc_msgSend(v9, "isEqualToString:", CKErrorDomain))
  {
    v10 = 0;
    if ((id)-[NSError code](self, "code") == (id)15 && v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      if (!objc_msgSend(v11, "isEqualToString:", CKUnderlyingErrorDomain)
        || (objc_msgSend(v6, "code") == (id)6000 ? (v12 = v8 == 0) : (v12 = 1), v12))
      {
        v10 = 0;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("CloudkitKeychainService")))
          v10 = objc_msgSend(v8, "code") == (id)a3;
        else
          v10 = 0;

      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCKServerInternalError
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
  if (objc_msgSend(v5, "isEqualToString:", CKErrorDomain))
  {
    v6 = -[NSError code](self, "code");
    v7 = 0;
    if (v6 == 15 && v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      if (objc_msgSend(v8, "isEqualToString:", CKUnderlyingErrorDomain))
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

- (BOOL)isCKInternalServerHTTPError
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
  if (objc_msgSend(v5, "isEqualToString:", CKErrorDomain))
  {
    v6 = -[NSError code](self, "code");
    v7 = 0;
    if (v6 == 15 && v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      if (objc_msgSend(v8, "isEqualToString:", CKUnderlyingErrorDomain))
        v7 = objc_msgSend(v4, "code") == (id)2001;
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
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("CuttlefishError")))
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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.security.trustedpeers.container"));

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
      LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", CFSTR("CuttlefishError"));

      if ((_DWORD)v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("retryafter")));

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
  v17 = sub_10019B4E4;
  v18 = sub_10019B4F4;
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
      v13[2] = sub_10019B4FC;
      v13[3] = &unk_1002EA858;
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
    return *(double *)&qword_100340430;
  return result;
}

+ (void)setDefaultRetryIntervalForTests:(double)a3
{
  qword_100340430 = *(_QWORD *)&a3;
}

@end
