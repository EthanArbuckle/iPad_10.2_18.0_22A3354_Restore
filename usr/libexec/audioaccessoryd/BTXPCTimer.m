@implementation BTXPCTimer

- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  BTXPCTimer *v17;
  BTXPCTimer *v18;
  objc_super v20;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BTXPCTimer;
  v17 = -[BTXPCTimer init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    -[BTXPCTimer setName:](v17, "setName:", v14);
    -[BTXPCTimer setDate:](v18, "setDate:", v15);
    -[BTXPCTimer setGracePeriod:](v18, "setGracePeriod:", a5);
    -[BTXPCTimer setPriority:](v18, "setPriority:", a6);
    -[BTXPCTimer setOptions:](v18, "setOptions:", a7);
    -[BTXPCTimer setBlock:](v18, "setBlock:", v16);
    -[BTXPCTimer handleActivity](v18, "handleActivity");
  }

  return v18;
}

- (BTXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return -[BTXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", a3, a4, a5, a6, a7, 0.0);
}

- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14;
  id v15;
  void *v16;
  BTXPCTimer *v17;

  v14 = a8;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v17 = -[BTXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", v15, v16, a6, a7, v14, a5);

  return v17;
}

- (BTXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  id v12;
  id v13;
  void *v14;
  BTXPCTimer *v15;

  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
  v15 = -[BTXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", v13, v14, a5, a6, v12, 0.0);

  return v15;
}

- (id)criteria
{
  void *v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  int64_t v9;
  xpc_object_t v10;
  int64_t v11;
  const char **v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  const char **v17;
  unsigned __int8 v18;
  unint64_t v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer date](self, "date"));
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  v6 = 0.0;
  if (v5 >= 0.0)
    v6 = v5;
  v7 = (uint64_t)v6;
  -[BTXPCTimer gracePeriod](self, "gracePeriod");
  v9 = (uint64_t)v8;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, v7);
  xpc_dictionary_set_int64(v10, XPC_ACTIVITY_GRACE_PERIOD, v9);
  v11 = -[BTXPCTimer priority](self, "priority");
  v12 = (const char **)&XPC_ACTIVITY_PRIORITY_UTILITY;
  if (v11 != 1)
    v12 = (const char **)&XPC_ACTIVITY_PRIORITY_MAINTENANCE;
  xpc_dictionary_set_string(v10, XPC_ACTIVITY_PRIORITY, *v12);
  v13 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_POWER_NAP, v13 & 1);
  v14 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, (v14 & 4) != 0);
  v15 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, (v15 & 2) != 0);
  v16 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_USES_DUET_POWER_BUDGETING, (v16 & 8) != 0);
  if ((-[BTXPCTimer options](self, "options") & 0x10) != 0)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_A;
  }
  else if ((-[BTXPCTimer options](self, "options") & 0x20) != 0)
  {
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_B;
  }
  else
  {
    if ((-[BTXPCTimer options](self, "options") & 0x40) == 0)
      goto LABEL_13;
    v17 = (const char **)&XPC_ACTIVITY_REQUIRES_CLASS_C;
  }
  if (*v17)
    xpc_dictionary_set_BOOL(v10, *v17, 1);
LABEL_13:
  v18 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, (v18 & 0x80) != 0);
  v19 = -[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, v19 & 0x100);
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_ALLOW_BATTERY, (-[BTXPCTimer options](self, "options") & 0x200) != 0);
  v20 = (unsigned __int16)-[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_MEMORY_INTENSIVE, (v20 & 0x400) != 0);
  v21 = (unsigned __int16)-[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_CPU_INTENSIVE, (v21 & 0x800) != 0);
  v22 = (unsigned __int16)-[BTXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_DISK_INTENSIVE, (v22 & 0x1000) != 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer duetActivitySchedulerData](self, "duetActivitySchedulerData"));
  if (v23)
    xpc_dictionary_set_value(v10, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA, v23);

  return v10;
}

- (void)invalidate
{
  id v3;
  const char *v4;
  os_log_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _xpc_activity_s *v9;
  _BOOL4 v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name")));
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  v5 = sub_1000681B8("BTXPCTimer");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BTXPCTimer Unregistering XPC activity %s", (uint8_t *)&v15, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));
    v10 = xpc_activity_set_state(v9, 5);

    if (v10)
    {
      v11 = sub_1000681B8("BTXPCTimer");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BTXPCTimer XPC activity marked DONE for %s", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  xpc_activity_unregister(v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer block](self, "block"));

  if (v13)
    -[BTXPCTimer setBlock:](self, "setBlock:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));

  if (v14)
    -[BTXPCTimer setActivity:](self, "setActivity:", 0);
}

- (id)activityHandler
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer criteria](self, "criteria"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer date](self, "date"));
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  v8 = sub_1000681B8("BTXPCTimer");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 < 0.0)
      v7 = 0.0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
    -[BTXPCTimer gracePeriod](self, "gracePeriod");
    *(_DWORD *)buf = 138412802;
    v24 = v10;
    v25 = 2048;
    v26 = (uint64_t)v7;
    v27 = 2048;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BTXPCTimer: Scheduling XPC activity (%@) in %lld ~%lf grace.", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer block](self, "block"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100067774;
  v18[3] = &unk_1001E43E0;
  objc_copyWeak(&v22, (id *)buf);
  v19 = v4;
  v20 = v3;
  v21 = v12;
  v13 = v12;
  v14 = v3;
  v15 = v4;
  v16 = objc_retainBlock(v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
  return v16;
}

- (BOOL)isActive
{
  void *v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  xpc_activity_state_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));

  if (!v3)
    return 0;
  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activity](self, "activity"));
  state = xpc_activity_get_state(v4);

  v6 = sub_1000681B8("BTXPCTimer");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name"));
    v10 = 138412546;
    v11 = v8;
    v12 = 2048;
    v13 = state;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTXPCTimer %@ current state %ld", (uint8_t *)&v10, 0x16u);

  }
  return state != 5;
}

- (void)handleActivity
{
  const char *v3;
  void *v4;
  id v5;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTXPCTimer name](self, "name")));
  v3 = (const char *)objc_msgSend(v5, "UTF8String");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTXPCTimer activityHandler](self, "activityHandler"));
  xpc_activity_register(v3, XPC_ACTIVITY_CHECK_IN, v4);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_xpc_object)duetActivitySchedulerData
{
  return self->_duetActivitySchedulerData;
}

- (void)setDuetActivitySchedulerData:(id)a3
{
  objc_storeStrong((id *)&self->_duetActivitySchedulerData, a3);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_duetActivitySchedulerData, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
