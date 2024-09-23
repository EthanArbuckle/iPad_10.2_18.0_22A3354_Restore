@implementation WiFiPolicyNetworkActivity

- (WiFiPolicyNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  id v7;
  WiFiPolicyNetworkActivity *v8;
  void *v9;
  uint64_t v10;
  NSMutableSet *v11;
  NSMutableSet *connections;
  OS_nw_activity *activity;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WiFiPolicyNetworkActivity;
  v8 = -[WiFiPolicyNetworkActivity init](&v15, sel_init);
  if (v8)
  {
    if (a3)
    {
      _labelDescription(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Creating activity label: %@ hasParent %d"), "-[WiFiPolicyNetworkActivity initWithLabel:parent:]", v9, v7 != 0);

      v10 = nw_activity_create();
      if (v7)
      {
        nw_activity_set_parent_activity();
        v8->_parentLabel = nw_activity_get_label();
        objc_storeStrong((id *)&v8->_parentActivity, a4);
      }
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      connections = v8->_connections;
      v8->_connections = v11;

      activity = v8->_activity;
      v8->_activity = (OS_nw_activity *)v10;

    }
    v8->_state = 0;
    v8->_hasStarted = 0;
  }

  return v8;
}

- (void)activate
{
  id v3;

  if (self->_state <= 0)
  {
    -[WiFiPolicyNetworkActivity _networkActivityState:](self, "_networkActivityState:", 1);
    if (self->_state == 1)
    {
      NSLog(CFSTR("%s: Activating activity"), "-[WiFiPolicyNetworkActivity activate]");
      nw_activity_activate();
      return;
    }
    -[OS_nw_activity description](self->_activity, "description");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Failed to activate %@ bad _state %ld"), "-[WiFiPolicyNetworkActivity activate]", v3, self->_state);
  }
  else
  {
    -[OS_nw_activity description](self->_activity, "description");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Failed to activate %@ incorrect _state %ld"), "-[WiFiPolicyNetworkActivity activate]", v3, self->_state);
  }

}

- (void)addConnection:(id)a3
{
  int64_t state;
  id v5;

  v5 = a3;
  state = self->_state;
  if (state > 1)
  {
    if (state == 2)
    {
LABEL_6:
      NSLog(CFSTR("%s: Starting activity"), "-[WiFiPolicyNetworkActivity addConnection:]");
      nw_connection_start_activity();
      -[NSMutableSet addObject:](self->_connections, "addObject:", v5);
      goto LABEL_7;
    }
    NSLog(CFSTR("%s: Failed to addConnection. Activity %@ has _state %ld"), "-[WiFiPolicyNetworkActivity addConnection:]", self->_activity, state);
  }
  else
  {
    NSLog(CFSTR("%s: Activity has _state %ld, moving to WiFiPolicyNetworkActivityTracingStarted"), "-[WiFiPolicyNetworkActivity addConnection:]", state);
    -[WiFiPolicyNetworkActivity _networkActivityState:](self, "_networkActivityState:", 2);
  }
  if (self->_state == 2)
    goto LABEL_6;
LABEL_7:

}

- (void)removeConnection:(id)a3
{
  int64_t state;
  id v5;

  v5 = a3;
  state = self->_state;
  if (state == 2)
  {
    NSLog(CFSTR("%s: Ending activity due to remove"), "-[WiFiPolicyNetworkActivity removeConnection:]");
    nw_connection_end_activity();
    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v5);
  }
  else
  {
    NSLog(CFSTR("%s: Failed to removeConnection. Activity %@ has _state %ld"), "-[WiFiPolicyNetworkActivity removeConnection:]", self->_activity, state);
  }

}

- (void)stopWithCompletionReason:(int)a3 withClientMetric:(const char *)a4 withClientDict:(id)a5 andError:(id)a6
{
  id v9;
  id v10;
  xpc_object_t v11;
  id v12;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (a4 && v9)
  {
    v11 = xpc_dictionary_create(0, 0, 0);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke;
    v27[3] = &unk_1E881E600;
    v28 = v11;
    v12 = v11;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
    NSLog(CFSTR("%s: Adding Client Metrics %s: %@"), "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]", a4, v9);
    nw_activity_submit_metrics();

  }
  -[WiFiPolicyNetworkActivity _networkActivityState:](self, "_networkActivityState:", 3);
  if (-[NSMutableSet count](self->_connections, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = self->_connections;
    v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          NSLog(CFSTR("%s: Ending activity with connection"), "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]");
          nw_connection_end_activity();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v15);
    }

  }
  if (v10)
  {
    v18 = objc_msgSend(v10, "code");
    objc_msgSend(v10, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v10, "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CB3388]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        v22 = objc_msgSend(v21, "code");
      else
        v22 = 0xFFFFFFFFLL;

    }
    else
    {
      v22 = 0xFFFFFFFFLL;
    }
    NSLog(CFSTR("%s: Reporting to nw_activity that WiFiPolicyNetworkActivity failed with error code %d and underlying error code %d"), "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]", v18, v22);
    nw_activity_complete_with_reason_and_underlying_error();
  }
  else
  {
    nw_activity_complete_with_reason();
  }

}

void __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  const char *v9;
  double v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = objc_retainAutorelease(v11);
    v8 = v5;
    v9 = (const char *)objc_msgSend(v7, "UTF8String");
    objc_msgSend(v8, "doubleValue");
    xpc_dictionary_set_double(v6, v9, v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke_cold_1((uint64_t)v11, (uint64_t)v5);
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  }

}

- (void)_startMaxActivityLifetime
{
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  OS_dispatch_source *activityTimer;
  NSObject *v7;
  _QWORD handler[4];
  NSObject *v9;
  WiFiPolicyNetworkActivity *v10;
  uint64_t v11;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v4 = dispatch_time(0, 100000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__WiFiPolicyNetworkActivity__startMaxActivityLifetime__block_invoke;
  handler[3] = &unk_1E881D218;
  v11 = 100;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  activityTimer = self->_activityTimer;
  self->_activityTimer = (OS_dispatch_source *)v5;
  v7 = v5;

}

void __54__WiFiPolicyNetworkActivity__startMaxActivityLifetime__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  NSLog(CFSTR("%s: Activity still active after %lus"), "-[WiFiPolicyNetworkActivity _startMaxActivityLifetime]_block_invoke", *(_QWORD *)(a1 + 48));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(void **)(v3 + 56))
  {
    *(_QWORD *)(v3 + 56) = 0;

  }
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.wifi.policy.nwactivity"), 1, 0);
  objc_msgSend(*(id *)(a1 + 40), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: Cancelling activity due to timeout %@"), "-[WiFiPolicyNetworkActivity _startMaxActivityLifetime]_block_invoke", v4);

  +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", nw_activity_get_label(), 4, 0, 0, v6);

}

- (void)_startActivityTimer
{
  -[WiFiPolicyNetworkActivity _cancelActivityTimer](self, "_cancelActivityTimer");
  -[WiFiPolicyNetworkActivity _startMaxActivityLifetime](self, "_startMaxActivityLifetime");
}

- (void)_cancelActivityTimer
{
  NSObject *activityTimer;
  OS_dispatch_source *v4;

  activityTimer = self->_activityTimer;
  if (activityTimer)
  {
    dispatch_source_cancel(activityTimer);
    v4 = self->_activityTimer;
    self->_activityTimer = 0;

  }
}

- (id)nwActivity
{
  return self->_activity;
}

- (id)nwActivityToken
{
  int is_null;
  void *v3;
  unsigned __int8 uu[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu = 0;
  v6 = 0;
  nw_activity_get_token();
  is_null = uuid_is_null(uu);
  v3 = 0;
  if (!is_null)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  return v3;
}

- (int64_t)parentLabel
{
  return self->_parentLabel;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
  if (a3)
    -[WiFiPolicyNetworkActivity _startActivityTimer](self, "_startActivityTimer");
  else
    -[WiFiPolicyNetworkActivity _cancelActivityTimer](self, "_cancelActivityTimer");
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)getState
{
  return self->_state;
}

- (id)description
{
  OS_nw_activity *parentActivity;
  void *v4;
  uint64_t domain;
  uint64_t label;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  parentActivity = self->_parentActivity;
  v4 = (void *)MEMORY[0x1E0CB3940];
  domain = nw_activity_get_domain();
  label = nw_activity_get_label();
  -[WiFiPolicyNetworkActivity nwActivityToken](self, "nwActivityToken");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (parentActivity)
  {
    v9 = nw_activity_get_domain();
    v10 = nw_activity_get_label();
    -[OS_nw_activity description](self->_parentActivity, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("nw_activity %d:%d[%@] parent nw_activity %d:%d[%@]"), domain, label, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("nw_activity %d:%d[%@]"), domain, label, v7);
    v12 = 0;
  }

  return v12;
}

- (void)_networkActivityState:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  switch(self->_state)
  {
    case 0:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
        v3 = 0;
      break;
    case 1:
      if (!a3)
        goto LABEL_8;
      break;
    case 2:
      if ((unint64_t)a3 >= 2)
      {
        if (a3 == 2)
        {
          -[WiFiPolicyNetworkActivity _networkActivityRestart](self, "_networkActivityRestart");
          v3 = 0;
        }
      }
      else
      {
LABEL_8:
        -[WiFiPolicyNetworkActivity _networkActivityAbort](self, "_networkActivityAbort");
      }
      break;
    case 3:
      if ((unint64_t)a3 < 2)
        v3 = 0;
      break;
    default:
      break;
  }
  self->_state = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_parentActivity, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s: Failed to find supported data type with key: %@ %@"), "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]_block_invoke", a1, a2);
  __assert_rtn("-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]_block_invoke", "WiFiPolicyActivityTracing.m", 375, "false");
}

@end
