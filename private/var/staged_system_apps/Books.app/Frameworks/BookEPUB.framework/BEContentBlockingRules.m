@implementation BEContentBlockingRules

+ (BEContentBlockingRules)sharedInstance
{
  if (qword_3C19B8 != -1)
    dispatch_once(&qword_3C19B8, &stru_3774A0);
  return (BEContentBlockingRules *)(id)qword_3C19B0;
}

- (BEContentBlockingRules)init
{
  BEContentBlockingRules *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cachedRules;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEContentBlockingRules;
  v2 = -[BEContentBlockingRules init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedRules = v2->_cachedRules;
    v2->_cachedRules = v3;

  }
  return v2;
}

- (void)applyContentBlockingRule:(unint64_t)a3 toWebView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  __CFString *v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __CFString *v40;
  id v41;
  id v42[2];
  uint8_t buf[4];
  void *v44;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "be_appliedContentBlockingRule") == (id)a3)
  {
    v10 = objc_retainBlock(v9);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLsForDirectory:inDomains:", 13, 1));

    v14 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v14, "addObject:", CFSTR("BEContentRuleLists"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "systemVersion"));
    objc_msgSend(v14, "addObject:", v16);

    if (BEIsInternalInstall())
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "buildVersion"));
      objc_msgSend(v14, "addObject:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR("_")));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:", v19));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[WKContentRuleListStore storeWithURL:](WKContentRuleListStore, "storeWithURL:", v21));
    if (a3 >= 3)
    {
      v24 = _BookEPUBLog();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
        *(_DWORD *)buf = 138412290;
        v44 = v26;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Unsupported content blocking rule '%@'", buf, 0xCu);

      }
      v23 = CFSTR("RemoteContentBlocked");
    }
    else
    {
      v23 = off_377510[a3];
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "userContentController"));

    objc_initWeak((id *)buf, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_4528;
    v37[3] = &unk_3774C8;
    v29 = v28;
    v38 = v29;
    v39 = v8;
    v42[1] = (id)a3;
    objc_copyWeak(v42, (id *)buf);
    v40 = (__CFString *)v23;
    v41 = v9;
    v30 = objc_retainBlock(v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedRules, "objectForKeyedSubscript:", v23));
    if (v31)
    {
      ((void (*)(_QWORD *, void *, _QWORD))v30[2])(v30, v31, 0);
    }
    else
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_4670;
      v32[3] = &unk_3774F0;
      v35 = v30;
      v36 = a3;
      v33 = v22;
      v34 = (__CFString *)v23;
      objc_msgSend(v33, "lookUpContentRuleListForIdentifier:completionHandler:", v23, v32);

    }
    objc_destroyWeak(v42);

    objc_destroyWeak((id *)buf);
  }

}

- (NSMutableDictionary)cachedRules
{
  return self->_cachedRules;
}

- (void)setCachedRules:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRules, 0);
}

@end
