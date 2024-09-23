@implementation PCStatusConditionsService

- (void)clearCache
{
  PCStatusConditionsService *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_cachedEvaluations, "removeAllObjects");
  objc_sync_exit(obj);

}

+ (PCStatusConditionsService)sharedInstance
{
  if (qword_10026D170 != -1)
    dispatch_once(&qword_10026D170, &stru_100218E68);
  return (PCStatusConditionsService *)(id)qword_10026D168;
}

- (PCStatusConditionsService)init
{
  PCStatusConditionsService *v2;
  uint64_t v3;
  NSMutableDictionary *cachedEvaluations;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id notificationObject;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PCStatusConditionsService;
  v2 = -[PCStatusConditionsService init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cachedEvaluations = v2->_cachedEvaluations;
    v2->_cachedEvaluations = (NSMutableDictionary *)v3;

    objc_initWeak(&location, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    v6 = kAPAccountChangedNotification;
    v7 = kAPAdLibBundleID;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003470;
    v11[3] = &unk_100213E80;
    objc_copyWeak(&v12, &location);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, v7, 0, v11));
    notificationObject = v2->_notificationObject;
    v2->_notificationObject = (id)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (int64_t)maxVersion
{
  return 1;
}

- (BOOL)evaluate:(id)a3 error:(id *)a4
{
  unsigned __int8 v4;
  id v7;
  void *v8;
  PCStatusConditionsService *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  PCSCTreeNode *v30;
  PCStatusConditionsService *v31;
  PCStatusConditionsService *v32;
  _BOOL8 v33;
  void *v34;
  id v36;
  APTargetingExpression *v37;
  void *v38;
  BOOL v39;
  PCStatusConditionsService *v40;
  NSMutableDictionary *cachedEvaluations;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  void *v46;
  void *v47;
  PCStatusConditionsService *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;

  v7 = a3;
  v8 = v7;
  if (a4)
    *a4 = 0;
  if (!v7 || !objc_msgSend(v7, "length"))
  {
    v4 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1122, 0));
    goto LABEL_51;
  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9->_cachedEvaluations, "objectForKey:", v8));
  if (v10)
  {
    v11 = APLogForCategory(44);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iTunesDSID"));
      *(_DWORD *)buf = 136643587;
      v57 = "-[PCStatusConditionsService evaluate:error:]";
      v58 = 2114;
      v59 = v8;
      v60 = 2160;
      v61 = 1752392040;
      v62 = 2112;
      v63 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{sensitive}s]: fetching previously evaluated status condition expression from the cache (%{public}@) for DSID %{mask.hash}@", buf, 0x2Au);

    }
    v4 = objc_msgSend(v10, "BOOLValue");
  }

  objc_sync_exit(v9);
  if (v10)
    goto LABEL_51;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v44, 4, a4));
  if (!v46)
  {
LABEL_31:
    v4 = 0;
    goto LABEL_50;
  }
  v15 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v46, v15) & 1) == 0)
  {
    if (a4)
    {
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1112, 0));
      goto LABEL_50;
    }
    goto LABEL_31;
  }
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v46;
  v16 = 0;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (!v17)
  {
    v47 = 0;
    goto LABEL_35;
  }
  v47 = 0;
  v18 = *(_QWORD *)v52;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v52 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
      v21 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
      {
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1123, 0));
        goto LABEL_46;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("version")));
      v23 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
      {
        v24 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
        {
          if (a4)
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1116, 0));

LABEL_46:
          goto LABEL_47;
        }
      }
      v25 = objc_msgSend(v22, "integerValue");
      if ((uint64_t)v25 <= +[PCStatusConditionsService maxVersion](PCStatusConditionsService, "maxVersion")&& (uint64_t)v25 > (uint64_t)v16)
      {
        v26 = v20;

        v16 = v25;
        v47 = v26;
      }

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v17)
      continue;
    break;
  }
LABEL_35:

  +[PCStatusConditionsService setVersion:](PCStatusConditionsService, "setVersion:", v16);
  if ((uint64_t)+[PCStatusConditionsService version](PCStatusConditionsService, "version") <= 0)
  {
    if (a4)
    {
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1116, 0));
    }
    else
    {
LABEL_47:
      v4 = 0;
    }
    goto LABEL_48;
  }
  if (v47)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("expression")));
    v28 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0
      || (v29 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v27, v29) & 1) != 0))
    {
      if (qword_10026D178 != -1)
        dispatch_once(&qword_10026D178, &stru_100218E88);
      v50 = 0;
      v30 = -[PCSCTreeNode initWithExpression:version:andParent:error:]([PCSCTreeNode alloc], "initWithExpression:version:andParent:error:", v27, +[PCStatusConditionsService version](PCStatusConditionsService, "version"), 0, &v50);
      v31 = (PCStatusConditionsService *)v50;
      if (v31)
      {
        v32 = v31;
        LOBYTE(v33) = 0;
        goto LABEL_68;
      }
      v49 = 0;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _translateRootNodeToExpressionFormat:error:](PCSCTreeNode, "_translateRootNodeToExpressionFormat:error:", v30, &v49));
      v32 = (PCStatusConditionsService *)v49;
      if (v43)
      {
        v37 = -[APTargetingExpression initWithDictionary:]([APTargetingExpression alloc], "initWithDictionary:", v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression error](v37, "error"));
        v39 = v38 == 0;

        if (!v39)
        {
          v40 = (PCStatusConditionsService *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression error](v37, "error"));
          LOBYTE(v33) = 0;
          goto LABEL_59;
        }
        v48 = v32;
        v33 = -[APTargetingExpression evaluate:](v37, "evaluate:", &v48);
        v40 = v48;

        if (!v40)
        {
          v32 = v9;
          objc_sync_enter(v32);
          cachedEvaluations = v9->_cachedEvaluations;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v33));
          -[NSMutableDictionary setObject:forKey:](cachedEvaluations, "setObject:forKey:", v42, v8);

          objc_sync_exit(v32);
          v40 = 0;
LABEL_59:

        }
        v32 = v40;
      }
      else
      {
        LOBYTE(v33) = 0;
      }

LABEL_68:
      if (v32)
        v4 = 0;
      else
        v4 = v33;
      if (a4 && v32)
      {
        v4 = 0;
        *a4 = objc_retainAutorelease(v32);
      }

    }
    else
    {
      v4 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1112, 0));
    }

LABEL_48:
    v34 = v47;
  }
  else if (a4)
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1116, 0));
    v34 = 0;
    v4 = 0;
    *a4 = v36;
  }
  else
  {
    v34 = 0;
    v4 = 0;
  }

LABEL_50:
LABEL_51:

  return v4 & 1;
}

- (NSMutableDictionary)cachedEvaluations
{
  return self->_cachedEvaluations;
}

- (void)setCachedEvaluations:(id)a3
{
  objc_storeStrong((id *)&self->_cachedEvaluations, a3);
}

- (id)notificationObject
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setNotificationObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_cachedEvaluations, 0);
}

@end
