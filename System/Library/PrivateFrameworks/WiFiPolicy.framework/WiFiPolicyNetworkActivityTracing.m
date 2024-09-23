@implementation WiFiPolicyNetworkActivityTracing

+ (id)sharedNetworkActivityTracing
{
  if (sharedNetworkActivityTracing_sActivityTracerInitToken != -1)
    dispatch_once(&sharedNetworkActivityTracing_sActivityTracerInitToken, &__block_literal_global_13);
  return (id)sharedNetworkActivityTracing_sActivityTracer;
}

void __64__WiFiPolicyNetworkActivityTracing_sharedNetworkActivityTracing__block_invoke()
{
  WiFiPolicyNetworkActivityTracing *v0;
  void *v1;

  v0 = objc_alloc_init(WiFiPolicyNetworkActivityTracing);
  v1 = (void *)sharedNetworkActivityTracing_sActivityTracer;
  sharedNetworkActivityTracing_sActivityTracer = (uint64_t)v0;

}

- (WiFiPolicyNetworkActivityTracing)init
{
  WiFiPolicyNetworkActivityTracing *v2;
  uint64_t v3;
  NSMutableDictionary *activities;
  uint64_t v5;
  NSMutableSet *connections;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WiFiPolicyNetworkActivityTracing;
  v2 = -[WiFiPolicyNetworkActivityTracing init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 11);
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 4);
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("network.activity.tracing", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WiFiPolicyNetworkActivityTracing_networkActivityStart_activate___block_invoke;
  block[3] = &unk_1E881D0B0;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

uint64_t __66__WiFiPolicyNetworkActivityTracing_networkActivityStart_activate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityStart:activate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)networkActivityActivate:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__WiFiPolicyNetworkActivityTracing_networkActivityActivate___block_invoke;
  v4[3] = &unk_1E881D448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__WiFiPolicyNetworkActivityTracing_networkActivityActivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityActivate:", *(_QWORD *)(a1 + 40));
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7
{
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  int64_t v20;
  const char *v21;
  int v22;

  v12 = a6;
  v13 = a7;
  if (a3 == 1)
    NSLog(CFSTR("%s: LinkTest %@"), "-[WiFiPolicyNetworkActivityTracing networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", CFSTR("linkTest"));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__WiFiPolicyNetworkActivityTracing_networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke;
  block[3] = &unk_1E881E520;
  v22 = a4;
  v20 = a3;
  v21 = a5;
  block[4] = self;
  v18 = v12;
  v19 = v13;
  v15 = v13;
  v16 = v12;
  dispatch_async(queue, block);

}

uint64_t __108__WiFiPolicyNetworkActivityTracing_networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityStop:withReason:withClientMetric:withClientDict:andError:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)networkActivityTracingCompleteConnectionsActivities
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WiFiPolicyNetworkActivityTracing_networkActivityTracingCompleteConnectionsActivities__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __87__WiFiPolicyNetworkActivityTracing_networkActivityTracingCompleteConnectionsActivities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityTracingCancel");
}

- (void)networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WiFiPolicyNetworkActivityTracing_networkActivityAddNWConnection_toActivityWithLabel___block_invoke;
  block[3] = &unk_1E881D218;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __87__WiFiPolicyNetworkActivityTracing_networkActivityAddNWConnection_toActivityWithLabel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityAddNWConnection:toActivityWithLabel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__WiFiPolicyNetworkActivityTracing_networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke;
  v13[3] = &unk_1E881E548;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

uint64_t __103__WiFiPolicyNetworkActivityTracing_networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityRemoveNWConnection:fromActivityWithLabel:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)currentNetworkActivityTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WiFiPolicyNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke;
  v7[3] = &unk_1E881CED0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __78__WiFiPolicyNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("linkTest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  if (v2)
  {
    objc_msgSend(v2, "nwActivityToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

- (BOOL)hasActivitiesRunning
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__WiFiPolicyNetworkActivityTracing_hasActivitiesRunning__block_invoke;
  v5[3] = &unk_1E881D700;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__WiFiPolicyNetworkActivityTracing_hasActivitiesRunning__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WiFiPolicyNetworkActivity *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  WiFiPolicyNetworkActivity *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *activities;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  _labelDescription(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a3 == 1)
    {
      v11 = -[WiFiPolicyNetworkActivity initWithLabel:parent:]([WiFiPolicyNetworkActivity alloc], "initWithLabel:parent:", 1, 0);
      if (v11)
      {
LABEL_5:
        -[NSMutableDictionary setObject:forKey:](self->_activities, "setObject:forKey:", v11, v7);
        if (v4)
          -[WiFiPolicyNetworkActivityTracing _networkActivityActivate:](self, "_networkActivityActivate:", a3);
        if (-[NSMutableSet count](self->_connections, "count"))
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v12 = self->_connections;
          v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v25 != v15)
                  objc_enumerationMutation(v12);
                -[WiFiPolicyNetworkActivity addConnection:](v11, "addConnection:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
              }
              v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            }
            while (v14);
          }

        }
        -[WiFiPolicyNetworkActivity setQueue:](v11, "setQueue:", self->_queue);
        v17 = v11;
        goto LABEL_23;
      }
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", CFSTR("linkTest"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "nwActivity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[WiFiPolicyNetworkActivity initWithLabel:parent:]([WiFiPolicyNetworkActivity alloc], "initWithLabel:parent:", a3, v20);

      }
      else
      {
        v11 = 0;
      }

      if (v11)
        goto LABEL_5;
    }
    if ((objc_msgSend(0, "hasStarted") & 1) != 0)
    {
LABEL_24:
      _labelDescription(a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      activities = self->_activities;
      -[WiFiPolicyNetworkActivity description](v11, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Start activity with label %@ _activities %@ %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStart:activate:]", v21, activities, v23);

      goto LABEL_25;
    }
    v17 = 0;
LABEL_23:
    -[WiFiPolicyNetworkActivity setHasStarted:](v17, "setHasStarted:", 1);
    goto LABEL_24;
  }
  _labelDescription(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: Failed to start Existing Activity with label %@, activityExists %@ _activities %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStart:activate:]", v9, v10, self->_activities);

LABEL_25:
}

- (void)_networkActivityActivate:(int64_t)a3
{
  NSMutableDictionary *activities;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  activities = self->_activities;
  _labelDescription(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activities, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (!v9)
  {
    _labelDescription(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Failed to find activity with label %@ _activities %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityActivate:]", v8, self->_activities);

    v7 = 0;
  }
  objc_msgSend(v7, "activate");

}

- (void)_networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  NSMutableDictionary *activities;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  const char *v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v9 = *(_QWORD *)&a4;
  v12 = a6;
  v13 = a7;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__7;
  v42 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  activities = self->_activities;
  _labelDescription(a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activities, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _labelDescription(a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v18 = self->_activities;
    objc_msgSend(v16, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Stopping activity with label %@ _activities %@ %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v17, v18, v19);

  }
  else
  {
    NSLog(CFSTR("%s: Failed to find activity with label %@ _activities %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v17, self->_activities);
  }

  if (a3 == 1)
  {
    _labelDescription(1uLL);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Stopping Parent Activity %@ %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v20, v21);

    v22 = self->_activities;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __109__WiFiPolicyNetworkActivityTracing__networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke;
    v29[3] = &unk_1E881E570;
    v35 = 1;
    v36 = a5;
    v30 = v12;
    v31 = v16;
    v37 = v9;
    v32 = v13;
    v33 = &v44;
    v34 = &v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v29);

  }
  if (objc_msgSend(v16, "hasStarted"))
  {
    if (a5 && v12)
    {
      _labelDescription(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Stopping network activity %@ with completion %d clientMetric %s clientDict %@ and error: %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v23, v9, a5, v12, v13);
    }
    else
    {
      _labelDescription(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Stopping network activity %@ with completion %d and error: %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v23, v9, v13);
    }

    objc_msgSend(v16, "setHasStarted:", 0);
    objc_msgSend(v16, "stopWithCompletionReason:withClientMetric:withClientDict:andError:", v9, a5, v12, v13);
    *((_BYTE *)v45 + 24) = 1;
    if (objc_msgSend(v16, "getState") == 3)
    {
      _labelDescription(a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Will Remove Ended Activity %@ %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v24, v25);

      v26 = (void *)v39[5];
      _labelDescription(a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v27);

    }
  }
  if (!*((_BYTE *)v45 + 24))
  {
    _labelDescription(a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Failed to stop activity with label %@ _activities %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v28, self->_activities);

  }
  if (objc_msgSend((id)v39[5], "count"))
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_activities, "removeObjectsForKeys:", v39[5]);
    NSLog(CFSTR("%s: There are %lu remaining activities _activities %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", -[NSMutableDictionary count](self->_activities, "count"), self->_activities);
  }
  if (a3 == 1)
  {
    if (-[NSMutableDictionary count](self->_activities, "count"))
      NSLog(CFSTR("%s: When stopping parent activity - there are %lu remaining activities _activities %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", -[NSMutableDictionary count](self->_activities, "count"), self->_activities);
    -[WiFiPolicyNetworkActivityTracing _networkActivityTracingCancel](self, "_networkActivityTracingCancel");
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

}

void __109__WiFiPolicyNetworkActivityTracing__networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "parentLabel") == *(_QWORD *)(a1 + 72) && objc_msgSend(v5, "hasStarted"))
  {
    if (*(_QWORD *)(a1 + 80) && *(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Stopping network Child Activity %@ with coompletion %d clientMetric %s clientDict %@ and error: %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v6, *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Stopping network Child Activity %@ with coompletion %d and error: %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v6, *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 48));
    }

    objc_msgSend(v5, "setHasStarted:", 0);
    objc_msgSend(v5, "stopWithCompletionReason:withClientMetric:withClientDict:andError:", *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if (objc_msgSend(v5, "getState") == 3)
    {
      _labelDescription(*(_QWORD *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Will Remove Ended Child Activity %@ %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v8, v9);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v10);
    }
  }
  else if (objc_msgSend(v5, "parentLabel") == *(_QWORD *)(a1 + 72) && (objc_msgSend(v5, "hasStarted") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Failed to stop network notStarted Child Activity %@ with coompletion %d and error: %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v7, *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 48));

  }
}

- (void)_networkActivityTracingCancel
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_activities, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_38);
  -[NSMutableDictionary removeAllObjects](self->_activities, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
}

void __65__WiFiPolicyNetworkActivityTracing__networkActivityTracingCancel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  unsigned int v4;
  id v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasStarted");
  objc_msgSend(v3, "description");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("%s: Failed to properly end activity: hasStarted %d %@"), "-[WiFiPolicyNetworkActivityTracing _networkActivityTracingCancel]_block_invoke", v4, v5);
}

- (void)_networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4
{
  NSMutableDictionary *activities;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v7 = a3;
  if ((-[NSMutableSet containsObject:](self->_connections, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_connections, "addObject:", v7);
    activities = self->_activities;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__WiFiPolicyNetworkActivityTracing__networkActivityAddNWConnection_toActivityWithLabel___block_invoke;
    v8[3] = &unk_1E881E5D8;
    v10 = a4;
    v9 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __88__WiFiPolicyNetworkActivityTracing__networkActivityAddNWConnection_toActivityWithLabel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int label;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "nwActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  label = nw_activity_get_label();
  v6 = *(_QWORD *)(a1 + 40);

  if (v6 == label)
    objc_msgSend(v7, "addConnection:", *(_QWORD *)(a1 + 32));

}

- (void)_networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  NSMutableDictionary *activities;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v10 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (-[NSMutableSet containsObject:](self->_connections, "containsObject:", v10))
  {
    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v10);
    activities = self->_activities;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __104__WiFiPolicyNetworkActivityTracing__networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke;
    v11[3] = &unk_1E881E5D8;
    v13 = a4;
    v12 = v10;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  if (v8)
    v8[2](v8);

}

void __104__WiFiPolicyNetworkActivityTracing__networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int label;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "nwActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  label = nw_activity_get_label();
  v6 = *(_QWORD *)(a1 + 40);

  if (v6 == label)
    objc_msgSend(v7, "removeConnection:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
