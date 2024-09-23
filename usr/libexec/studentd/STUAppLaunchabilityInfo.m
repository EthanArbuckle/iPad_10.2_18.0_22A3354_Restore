@implementation STUAppLaunchabilityInfo

- (STUAppLaunchabilityInfo)initWithBundleIdentifier:(id)a3 primitives:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  STUAppLaunchabilityInfo *v16;
  void *v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLaunchabilityInfo.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "launchServicesPrimitives"));
  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationRecordWithBundleIdentifier:error:", v7, &v19));
  v11 = v19;

  if (!v10)
  {
    if (qword_1000FC248 != -1)
      dispatch_once(&qword_1000FC248, &stru_1000CA538);
    v12 = (void *)qword_1000FC240;
    if (os_log_type_enabled((os_log_t)qword_1000FC240, OS_LOG_TYPE_ERROR))
      sub_10007B794((uint64_t)v7, v12, v11);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationState"));
  v14 = objc_msgSend(v13, "isInstalled");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationState"));
  v16 = -[STUAppLaunchabilityInfo initWithBundleIdentifier:isInstalled:isRestricted:](self, "initWithBundleIdentifier:isInstalled:isRestricted:", v7, v14, objc_msgSend(v15, "isRestricted"));

  return v16;
}

- (STUAppLaunchabilityInfo)initWithBundleIdentifier:(id)a3 isInstalled:(BOOL)a4 isRestricted:(BOOL)a5
{
  id v9;
  STUAppLaunchabilityInfo *v10;
  NSString *v11;
  NSString *bundleIdentifier;
  void *v14;
  objc_super v15;

  v9 = a3;
  if (!v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUAppLaunchabilityInfo.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v15.receiver = self;
  v15.super_class = (Class)STUAppLaunchabilityInfo;
  v10 = -[STUAppLaunchabilityInfo init](&v15, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v9, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = v11;

    v10->mIsInstalled = a4;
    v10->mIsRestricted = a5;
  }

  return v10;
}

- (BOOL)isLaunchableWithError:(id *)a3
{
  return -[STUAppLaunchabilityInfo isLaunchableReturningDMFError:error:](self, "isLaunchableReturningDMFError:error:", 0, a3);
}

- (BOOL)isLaunchableReturningDMFError:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  unsigned __int8 v8;
  id v10;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", CRKSpringBoardBundleIdentifier);

  if ((v8 & 1) != 0)
    return 1;
  if (!self->mIsInstalled)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo appNotInstalledErrorReturningDMFError:](self, "appNotInstalledErrorReturningDMFError:", v5));
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!self->mIsRestricted)
    return 1;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo unableToOpenAppErrorReturningDMFError:](self, "unableToOpenAppErrorReturningDMFError:", v5));
  if (a4)
  {
LABEL_6:
    v10 = objc_retainAutorelease(v10);
    *a4 = v10;
  }
LABEL_7:

  return 0;
}

- (id)appNotInstalledErrorReturningDMFError:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  if (a3)
  {
    v14 = DMFBundleIdentifierErrorKey;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v6 = DMFErrorWithCodeAndUserInfo(3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
    if (!v4)
    {
      v11 = CRKErrorWithCodeAndUserInfo(122, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_6;
    }
    v12 = CFSTR("kCRKBundleIdentifierErrorKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
    v13 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = CRKErrorWithCodeAndUserInfo(122, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
LABEL_6:

  return v7;
}

- (id)unableToOpenAppErrorReturningDMFError:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  if (a3)
  {
    v14 = DMFBundleIdentifierErrorKey;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v6 = DMFErrorWithCodeAndUserInfo(101, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
    if (!v4)
    {
      v11 = CRKErrorWithCodeAndUserInfo(123, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_6;
    }
    v12 = CFSTR("kCRKBundleIdentifierErrorKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
    v13 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = CRKErrorWithCodeAndUserInfo(123, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
LABEL_6:

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo bundleIdentifier](self, "bundleIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->mIsInstalled));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->mIsRestricted));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STUAppLaunchabilityInfo *v8;
  STUAppLaunchabilityInfo *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  STUAppLaunchabilityInfo *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("bundleIdentifier, mIsLaunchable, mIsRestricted"), "componentsSeparatedByString:", CFSTR(",")));
  v6 = objc_msgSend(v5, "mutableCopy");

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100028354;
  v28[3] = &unk_1000C9E08;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (STUAppLaunchabilityInfo *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[STUAppLaunchabilityInfo isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v17 = v9;
          v18 = objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo valueForKey:](v8, "valueForKey:", v16));
          v19 = objc_claimAutoreleasedReturnValue(-[STUAppLaunchabilityInfo valueForKey:](v17, "valueForKey:", v16));

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
