@implementation FMDXPCJanitor

- (FMDXPCJanitor)initWithName:(id)a3 gracePeriod:(double)a4 cleanupTask:(id)a5
{
  id v8;
  id v9;
  FMDXPCJanitor *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMDXPCJanitor;
  v10 = -[FMDXPCJanitor init](&v13, "init");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud.findmydeviced.fmdxpcjanitor."), "stringByAppendingString:", v8));
    -[FMDXPCJanitor setName:](v10, "setName:", v11);

    -[FMDXPCJanitor setGracePeriod:](v10, "setGracePeriod:", a4);
    -[FMDXPCJanitor setCleanupTask:](v10, "setCleanupTask:", v9);
    -[FMDXPCJanitor handleActivity](v10, "handleActivity");
  }

  return v10;
}

- (void)schedule:(id)a3
{
  -[FMDXPCJanitor schedule:requireClass:](self, "schedule:requireClass:", a3, 0);
}

- (void)schedule:(id)a3 requireClass:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  int64_t v9;
  double v10;
  int64_t v11;
  id v12;
  NSObject *v13;
  xpc_object_t v14;
  id v15;
  const char *v16;
  const char **v17;
  void *v18;
  int v19;
  int64_t v20;

  v6 = a3;
  -[FMDXPCJanitor gracePeriod](self, "gracePeriod");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:"));

  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = (uint64_t)v8;

  -[FMDXPCJanitor gracePeriod](self, "gracePeriod");
  v11 = (uint64_t)v10;
  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDXPCJanitor: Scheduling cleanup XPC activity in %lld", (uint8_t *)&v19, 0xCu);
  }

  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_POWER_NAP, 1);
  xpc_dictionary_set_int64(v14, XPC_ACTIVITY_DELAY, v9);
  xpc_dictionary_set_int64(v14, XPC_ACTIVITY_GRACE_PERIOD, v11);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor name](self, "name")));
  v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4);

  if (a4)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
    if (a4 != 1)
      v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
    xpc_dictionary_set_BOOL(v14, *v17, 1);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor activityHandler](self, "activityHandler"));
  xpc_activity_register(v16, v14, v18);

}

- (void)deactivate
{
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  const char *v9;
  int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor name](self, "name"));

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor name](self, "name"));
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDXPCJanitor Unregistering XPC activity %@", (uint8_t *)&v10, 0xCu);

    }
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor name](self, "name")));
    v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

    xpc_activity_unregister(v9);
  }
  else
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cannot unregister unnamed XPC activity", (uint8_t *)&v10, 2u);
    }

  }
}

- (id)activityHandler
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100085C3C;
  v3[3] = &unk_1002C4040;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (void)handleActivity
{
  id v3;
  const char *v4;
  id v5;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor name](self, "name")));
  v4 = (const char *)objc_msgSend(v3, "cStringUsingEncoding:", 4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor activityHandler](self, "activityHandler"));
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, v5);

}

- (void)performWork
{
  void *v3;
  id v4;
  NSObject *v5;
  void (**v6)(void);
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor cleanupTask](self, "cleanupTask"));

  if (v3)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FMDXPCJanitor cleanupTask](self, "cleanupTask"));
    v6[2]();

  }
  else
  {
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDXPCJanitor initialized without cleanupTask. No work to do.", buf, 2u);
    }

  }
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (id)cleanupTask
{
  return self->_cleanupTask;
}

- (void)setCleanupTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupTask, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
