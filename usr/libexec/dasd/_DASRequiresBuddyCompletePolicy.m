@implementation _DASRequiresBuddyCompletePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (self->_fwIsAvailable)
  {
    if ((objc_msgSend(v4, "requiresBuddyComplete") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fastPass"));
      v6 = v7 != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (_DASRequiresBuddyCompletePolicy)init
{
  _DASRequiresBuddyCompletePolicy *v2;
  _DASRequiresBuddyCompletePolicy *v3;
  NSString *policyName;
  NSMutableDictionary *v5;
  NSMutableDictionary *buddyCompleteForUserIdentifier;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;
  __int128 v13;
  uint64_t v14;

  v12.receiver = self;
  v12.super_class = (Class)_DASRequiresBuddyCompletePolicy;
  v2 = -[_DASRequiresBuddyCompletePolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Requires Buddy Complete Policy");

    v5 = objc_opt_new(NSMutableDictionary);
    buddyCompleteForUserIdentifier = v3->_buddyCompleteForUserIdentifier;
    v3->_buddyCompleteForUserIdentifier = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.dasd.buddyComplete", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    if (!qword_1001AB670)
    {
      v13 = off_10015E160;
      v14 = 0;
      qword_1001AB670 = _sl_dlopen(&v13, 0);
    }
    v3->_fwIsAvailable = qword_1001AB670 != 0;
  }
  return v3;
}

- (void)_updateCache
{
  uint64_t (*v3)(void);
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  NSObject *timer;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  NSObject *v14;
  OS_dispatch_source *v15;
  _QWORD handler[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];

  if (self->_fwIsAvailable)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v3 = (uint64_t (*)(void))off_1001AB678;
    v25 = off_1001AB678;
    if (!off_1001AB678)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10004AA4C;
      v21[3] = &unk_10015D610;
      v21[4] = &v22;
      sub_10004AA4C((uint64_t)v21);
      v3 = (uint64_t (*)(void))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v3)
    {
      sub_1000E1AD4();
      __break(1u);
    }
    v4 = v3();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keyEnumerator](self->_buddyCompleteForUserIdentifier, "keyEnumerator"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4 ^ 1u));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_buddyCompleteForUserIdentifier, "setObject:forKeyedSubscript:", v10, v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      }
      while (v6);
    }

    timer = self->_timer;
    if ((v4 & 1) != 0)
    {
      if (!timer)
      {
        v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
        v13 = self->_timer;
        self->_timer = v12;

        dispatch_set_qos_class_fallback(self->_timer, 17);
        dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, 0x37E11D600uLL, 0x3B9ACA00uLL);
        v14 = self->_timer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10004A670;
        handler[3] = &unk_10015D4E0;
        handler[4] = self;
        dispatch_source_set_event_handler(v14, handler);
        dispatch_activate((dispatch_object_t)self->_timer);
      }
    }
    else if (timer)
    {
      dispatch_source_cancel(timer);
      v15 = self->_timer;
      self->_timer = 0;

    }
  }
}

+ (id)policyInstance
{
  if (qword_1001AB660 != -1)
    dispatch_once(&qword_1001AB660, &stru_10015E140);
  return (id)qword_1001AB668;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (BOOL)buddyCompleteWithActivity:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  OS_dispatch_queue *queue;
  BOOL v8;
  _QWORD block[4];
  id v11;
  _DASRequiresBuddyCompletePolicy *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = v5;
  if (self->_fwIsAvailable)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A7C4;
    block[3] = &unk_10015D930;
    v11 = v5;
    v12 = self;
    v13 = &v14;
    dispatch_sync((dispatch_queue_t)queue, block);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  _BOOL8 v7;
  _DASPolicyResponseRationale *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = -[_DASRequiresBuddyCompletePolicy buddyCompleteWithActivity:withState:](self, "buddyCompleteWithActivity:withState:", v6, a4);
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("buddyComplete = %@"), v9));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v10);

  if (v7)
  {
    v11 = 0;
  }
  else if (-[_DASRequiresBuddyCompletePolicy appliesToActivity:](self, "appliesToActivity:", v6))
  {
    v11 = 33;
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v11, v8, (double)0x384uLL));

  return v12;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)buddyCompleteForUserIdentifier
{
  return self->_buddyCompleteForUserIdentifier;
}

- (void)setBuddyCompleteForUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_buddyCompleteForUserIdentifier, a3);
}

- (BOOL)fwIsAvailable
{
  return self->_fwIsAvailable;
}

- (void)setFwIsAvailable:(BOOL)a3
{
  self->_fwIsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyCompleteForUserIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
