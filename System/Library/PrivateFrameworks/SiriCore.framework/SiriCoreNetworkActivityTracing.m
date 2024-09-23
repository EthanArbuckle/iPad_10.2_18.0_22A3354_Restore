@implementation SiriCoreNetworkActivityTracing

- (void)_networkActivityTracingCancel
{
  -[NSMutableDictionary removeAllObjects](self->_activities, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connections, "removeAllObjects");
}

+ (id)sharedNetworkActivityTracing
{
  if (sharedNetworkActivityTracing_sActivityTracerInitToken != -1)
    dispatch_once(&sharedNetworkActivityTracing_sActivityTracerInitToken, &__block_literal_global);
  return (id)sharedNetworkActivityTracing_sActivityTracer;
}

uint64_t __62__SiriCoreNetworkActivityTracing_networkActivityTracingCancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityTracingCancel");
}

- (void)networkActivityTracingCancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SiriCoreNetworkActivityTracing_networkActivityTracingCancel__block_invoke;
  block[3] = &unk_24CCE6BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (SiriCoreNetworkActivityTracing)init
{
  SiriCoreNetworkActivityTracing *v2;
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
  v12.super_class = (Class)SiriCoreNetworkActivityTracing;
  v2 = -[SiriCoreNetworkActivityTracing init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 9);
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 4);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SiriCoreNetworkActivityTracing_networkActivityStart_activate___block_invoke;
  block[3] = &unk_24CCE6090;
  block[4] = self;
  block[5] = a3;
  v6 = a4;
  dispatch_async(queue, block);
}

- (void)networkActivityActivate:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SiriCoreNetworkActivityTracing_networkActivityActivate___block_invoke;
  v4[3] = &unk_24CCE67A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__SiriCoreNetworkActivityTracing_networkActivityStop_withReason_andError___block_invoke;
  v11[3] = &unk_24CCE5DA0;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)networkActivityAddNWConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__SiriCoreNetworkActivityTracing_networkActivityAddNWConnection___block_invoke;
  v7[3] = &unk_24CCE6BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)networkActivityRemoveNWConnection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__SiriCoreNetworkActivityTracing_networkActivityRemoveNWConnection_completion___block_invoke;
  block[3] = &unk_24CCE6C88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__SiriCoreNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke;
  v7[3] = &unk_24CCE6758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v7;
  void *v8;
  SiriCoreNetworkActivity *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SiriCoreNetworkActivity *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 1) > 8)
    v7 = CFSTR("invalid");
  else
    v7 = off_24CCE5E10[a3 - 1];
  -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a3 == 1)
    {
      v9 = -[SiriCoreNetworkActivity initWithLabel:parent:]([SiriCoreNetworkActivity alloc], "initWithLabel:parent:", 1, 0);
      if (v9)
      {
LABEL_7:
        -[NSMutableDictionary setObject:forKey:](self->_activities, "setObject:forKey:", v9, v7);
        if (v4)
          -[SiriCoreNetworkActivityTracing _networkActivityActivate:](self, "_networkActivityActivate:", a3);
        if (-[NSMutableSet count](self->_connections, "count"))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = self->_connections;
          v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v20;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v10);
                -[SiriCoreNetworkActivity addConnection:](v9, "addConnection:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
              }
              v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            }
            while (v12);
          }

        }
        v15 = v9;
        goto LABEL_25;
      }
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", CFSTR("uiRequest"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "nwActivity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SiriCoreNetworkActivity initWithLabel:parent:]([SiriCoreNetworkActivity alloc], "initWithLabel:parent:", a3, v18);

      }
      else
      {
        v9 = 0;
      }

      if (v9)
        goto LABEL_7;
    }
    if ((objc_msgSend(0, "hasStarted") & 1) != 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    v15 = 0;
LABEL_25:
    -[SiriCoreNetworkActivity setHasStarted:](v15, "setHasStarted:", 1, (_QWORD)v19);
    goto LABEL_26;
  }
LABEL_27:

}

- (void)_networkActivityActivate:(int64_t)a3
{
  NSMutableDictionary *activities;
  const __CFString *v4;
  id v5;

  activities = self->_activities;
  if ((unint64_t)(a3 - 1) > 8)
    v4 = CFSTR("invalid");
  else
    v4 = off_24CCE5E10[a3 - 1];
  -[NSMutableDictionary objectForKey:](activities, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activate");

}

- (void)_networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5
{
  id v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  NSMutableDictionary *activities;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  int64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 8)
    v10 = CFSTR("invalid");
  else
    v10 = off_24CCE5E10[v9];
  -[NSMutableDictionary objectForKey:](self->_activities, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    activities = self->_activities;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __75__SiriCoreNetworkActivityTracing__networkActivityStop_withReason_andError___block_invoke;
    v17[3] = &unk_24CCE5DC8;
    v19 = 1;
    v20 = a4;
    v18 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v17);

  }
  if (objc_msgSend(v11, "hasStarted"))
  {
    v13 = (void *)*MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_INFO))
    {
      if (v9 > 8)
        v14 = CFSTR("invalid");
      else
        v14 = off_24CCE5E10[v9];
      if ((unint64_t)(a4 - 1) > 4)
        v15 = CFSTR("SiriCoreNetworkActivityInvalid");
      else
        v15 = off_24CCE5E58[a4 - 1];
      *(_DWORD *)buf = 136315906;
      v22 = "-[SiriCoreNetworkActivityTracing _networkActivityStop:withReason:andError:]";
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v8;
      v16 = v13;
      _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_INFO, "%s Stopping network activity %@ with reason %@ and error: %@", buf, 0x2Au);

    }
    objc_msgSend(v11, "setHasStarted:", 0);
    objc_msgSend(v11, "stopWithCompletionReason:andError:", a4, v8);
  }

}

- (void)_networkActivityAddNWConnection:(id)a3
{
  NSMutableDictionary *activities;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((-[NSMutableSet containsObject:](self->_connections, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_connections, "addObject:", v5);
    activities = self->_activities;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__SiriCoreNetworkActivityTracing__networkActivityAddNWConnection___block_invoke;
    v6[3] = &unk_24CCE5DF0;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

- (void)_networkActivityRemoveNWConnection:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSMutableDictionary *activities;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[NSMutableSet containsObject:](self->_connections, "containsObject:", v8))
  {
    -[NSMutableSet removeObject:](self->_connections, "removeObject:", v8);
    activities = self->_activities;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__SiriCoreNetworkActivityTracing__networkActivityRemoveNWConnection_completion___block_invoke;
    v9[3] = &unk_24CCE5DF0;
    v10 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activities, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
  if (v6)
    v6[2](v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __80__SiriCoreNetworkActivityTracing__networkActivityRemoveNWConnection_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeConnection:", *(_QWORD *)(a1 + 32));
}

uint64_t __66__SiriCoreNetworkActivityTracing__networkActivityAddNWConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addConnection:", *(_QWORD *)(a1 + 32));
}

void __75__SiriCoreNetworkActivityTracing__networkActivityStop_withReason_andError___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  _BYTE v12[24];
  const __CFString *v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "parentLabel") == a1[5] && objc_msgSend(v4, "hasStarted"))
  {
    v5 = (void *)*MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_INFO))
    {
      v6 = a1[5] - 1;
      if (v6 > 8)
        v7 = CFSTR("invalid");
      else
        v7 = off_24CCE5E10[v6];
      v8 = a1[6] - 1;
      if (v8 > 4)
        v9 = CFSTR("SiriCoreNetworkActivityInvalid");
      else
        v9 = off_24CCE5E58[v8];
      v10 = a1[4];
      *(_DWORD *)v12 = 136315906;
      *(_QWORD *)&v12[4] = "-[SiriCoreNetworkActivityTracing _networkActivityStop:withReason:andError:]_block_invoke";
      *(_WORD *)&v12[12] = 2112;
      *(_QWORD *)&v12[14] = v7;
      *(_WORD *)&v12[22] = 2112;
      v13 = v9;
      LOWORD(v14) = 2112;
      *(_QWORD *)((char *)&v14 + 2) = v10;
      v11 = v5;
      _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s Stopping network sub-activity %@ with reason %@ and error: %@", v12, 0x2Au);

    }
    objc_msgSend(v4, "setHasStarted:", 0, *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
    objc_msgSend(v4, "stopWithCompletionReason:andError:", a1[6], a1[4]);
  }

}

void __76__SiriCoreNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", CFSTR("uiRequest"));
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

uint64_t __79__SiriCoreNetworkActivityTracing_networkActivityRemoveNWConnection_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityRemoveNWConnection:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __65__SiriCoreNetworkActivityTracing_networkActivityAddNWConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityAddNWConnection:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__SiriCoreNetworkActivityTracing_networkActivityStop_withReason_andError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityStop:withReason:andError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __58__SiriCoreNetworkActivityTracing_networkActivityActivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityActivate:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__SiriCoreNetworkActivityTracing_networkActivityStart_activate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkActivityStart:activate:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __62__SiriCoreNetworkActivityTracing_sharedNetworkActivityTracing__block_invoke()
{
  SiriCoreNetworkActivityTracing *v0;
  void *v1;

  v0 = objc_alloc_init(SiriCoreNetworkActivityTracing);
  v1 = (void *)sharedNetworkActivityTracing_sActivityTracer;
  sharedNetworkActivityTracing_sActivityTracer = (uint64_t)v0;

}

@end
