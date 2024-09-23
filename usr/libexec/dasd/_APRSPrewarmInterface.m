@implementation _APRSPrewarmInterface

- (_APRSPrewarmInterface)init
{
  _APRSPrewarmInterface *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSMutableDictionary *prewarmedAssertions;
  id v7;
  dispatch_time_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  _APRSPrewarmInterface *v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_APRSPrewarmInterface;
  v2 = -[_APRSPrewarmInterface init](&v16, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.aprs", "appResume.prewarmInterface");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    prewarmedAssertions = v2->_prewarmedAssertions;
    v2->_prewarmedAssertions = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.aprs"));
    v2->_userDrainBehavior = (int64_t)objc_msgSend(v7, "integerForKey:", CFSTR("drainBehavior"));
    v8 = dispatch_time(0, 300000000000);
    global_queue = dispatch_get_global_queue(-32768, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005A8A8;
    v13[3] = &unk_10015D558;
    v14 = v2;
    v15 = v7;
    v11 = v7;
    dispatch_after(v8, v10, v13);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001AB888 != -1)
    dispatch_once(&qword_1001AB888, &stru_10015E570);
  return (id)qword_1001AB880;
}

- (void)prewarmRecommendations:(id)a3
{
  id v4;
  NSObject *log;
  int v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Prewarm recommendations: %@", buf, 0xCu);
  }
  if (self->_userDrainBehavior == 1)
    v6 = 6;
  else
    v6 = 3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v19;
    *(_QWORD *)&v9 = 138412290;
    v17 = v9;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v7);
      if (v11 >= v6)
        break;
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
      v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v17;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting prewarm for %@", buf, 0xCu);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_APRSPrewarmInterface prewarmLaunchAppFromBundleID:](self, "prewarmLaunchAppFromBundleID:", v14, v17, (_QWORD)v18));
      if (!v16)
        ++v11;

      if (v10 == (id)++v13)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          goto LABEL_8;
        break;
      }
    }
  }

}

- (void)appendPrewarmAssertion:(id)a3 withAssertion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmedAssertions, "objectForKeyedSubscript:", v6));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmedAssertions, "objectForKeyedSubscript:", v6));
    objc_msgSend(v9, "invalidate");

  }
  -[NSMutableDictionary setObject:forKey:](self->_prewarmedAssertions, "setObject:forKey:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);
  v10 = dispatch_time(0, 500000000);
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005AD00;
  v14[3] = &unk_10015D558;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  dispatch_after(v10, v12, v14);

}

- (BOOL)hasPrewarmAssertionForApplication:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmedAssertions, "objectForKeyedSubscript:", v5));

  os_unfair_lock_unlock(p_lock);
  return v6 != 0;
}

- (void)invalidatePrewarmAssertionForApplication:(id)a3
{
  -[_APRSPrewarmInterface invalidatePrewarmAssertionForApplication:onInvalidation:](self, "invalidatePrewarmAssertionForApplication:onInvalidation:", a3, 0);
}

- (void)invalidatePrewarmAssertionForApplication:(id)a3 onInvalidation:(id)a4
{
  id v6;
  void (**v7)(id, BOOL);
  NSObject *log;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Requesting prewarm termination for %@", (uint8_t *)&v13, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmedAssertions, "objectForKeyedSubscript:", v6));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "invalidateSyncWithError:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_prewarmedAssertions, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_lock);
    v11 = self->_log;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v13 = 138412290;
    v14 = v6;
    v12 = "Prewarm terminated for %@";
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v11 = self->_log;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v13 = 138412290;
    v14 = v6;
    v12 = "Prewarm assertion lost for %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
LABEL_9:
  if (v7)
    v7[2](v7, v10 != 0);

}

- (id)prelaunchAppFromBundleID:(id)a3 isClosure:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _UNKNOWN **v12;
  id v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  id v17;
  NSObject *log;
  _BOOL4 v19;
  void *v20;
  id v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  _BYTE v32[14];
  __int16 v33;
  id v34;
  void *v35;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)RBSLaunchContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:](RBSProcessIdentity, "identityForEmbeddedApplicationIdentifier:", v6));
  objc_msgSend(v7, "setIdentity:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.dasd"), CFSTR("DYLDLaunch")));
  v35 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  objc_msgSend(v7, "setAttributes:", v10);

  if (v4)
    v11 = CFSTR("DAS DYLD3 Closure Generation");
  else
    v11 = CFSTR("DAS Prewarm launch");
  if (v4)
    v12 = &off_10016F510;
  else
    v12 = &off_10016F538;
  objc_msgSend(v7, "setExplanation:", v11);
  objc_msgSend(v7, "_setAdditionalEnvironment:", v12);
  v13 = objc_msgSend(objc_alloc((Class)RBSLaunchRequest), "initWithContext:", v7);
  v29 = 0;
  v30 = 0;
  v28 = 0;
  v14 = objc_msgSend(v13, "execute:assertion:error:", &v30, &v29, &v28);
  v15 = v30;
  v16 = v29;
  v17 = v28;
  log = self->_log;
  v19 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) != 0)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v32 = v6;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Prelaunched app: %@ (%u)", buf, 0x12u);
    }
    if (v16)
    {
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_10005B228;
      v26 = &unk_10015E598;
      v27 = v15;
      objc_msgSend(v27, "monitorForDeath:", &v23);
      -[_APRSPrewarmInterface appendPrewarmAssertion:withAssertion:](self, "appendPrewarmAssertion:withAssertion:", v6, v16, v23, v24, v25, v26);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](_APRSMetricRecorder, "sharedInstance"));
    objc_msgSend(v20, "startLoggingForApp:pid:forEvent:", v6, objc_msgSend(v15, "pid"), 0);

  }
  else if (v19)
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v32 = v4;
    *(_WORD *)&v32[4] = 2112;
    *(_QWORD *)&v32[6] = v6;
    v33 = 2112;
    v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Encountered error with prelaunch (%u) of %@: %@", buf, 0x1Cu);
  }
  v21 = v17;

  return v21;
}

- (id)closureBuildLaunchAppFromBundleID:(id)a3
{
  return -[_APRSPrewarmInterface prelaunchAppFromBundleID:isClosure:](self, "prelaunchAppFromBundleID:isClosure:", a3, 1);
}

- (id)prewarmLaunchAppFromBundleID:(id)a3
{
  return -[_APRSPrewarmInterface prelaunchAppFromBundleID:isClosure:](self, "prelaunchAppFromBundleID:isClosure:", a3, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)prewarmedAssertions
{
  return self->_prewarmedAssertions;
}

- (void)setPrewarmedAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmedAssertions, a3);
}

- (int64_t)userDrainBehavior
{
  return self->_userDrainBehavior;
}

- (void)setUserDrainBehavior:(int64_t)a3
{
  self->_userDrainBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmedAssertions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
