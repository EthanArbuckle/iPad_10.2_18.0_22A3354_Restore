@implementation SBEventObserverRegistry

+ (id)sharedInstance
{
  void *v2;
  SBEventObserverRegistry *v3;
  void *v4;

  v2 = (void *)sharedInstance_instance;
  if (!sharedInstance_instance)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBEventObserverRegistry);
    v4 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)sharedInstance_instance;
  }
  return v2;
}

- (void)handleEvent:(id)a3 token:(unint64_t)a4 action:(int64_t)a5
{
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x1E0C81298]), 4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a3)
  {
    v11 = (void *)v9;
    if (a5 == 1)
      -[SBEventObserverRegistry addObserverWithToken:forEvent:](self, "addObserverWithToken:forEvent:", a4, v9);
    else
      -[SBEventObserverRegistry removeObserverWithToken:forEvent:](self, "removeObserverWithToken:forEvent:", a4, v9);
    v10 = v11;
  }

}

- (void)addObserverWithToken:(unint64_t)a3 forEvent:(id)a4
{
  void *v6;
  void *v7;
  NSMutableDictionary *observers;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "addIndex:", a3);
  }
  else
  {
    observers = self->_observers;
    if (!observers)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_observers;
      self->_observers = v9;

      observers = self->_observers;
    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](observers, "setObject:forKey:", v11, v12);

  }
}

- (void)removeObserverWithToken:(unint64_t)a3 forEvent:(id)a4
{
  id v5;

  -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeIndex:", a3);

}

- (void)postEventToInterestedObservers:(__CFString *)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SBEventObserverRegistry_postEventToInterestedObservers___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v4, block);

}

void __58__SBEventObserverRegistry_postEventToInterestedObservers___block_invoke()
{
  const __CFString *DarwinNotificationFromEvent;
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotificationFromEvent = (const __CFString *)__SBSEventObserverGetDarwinNotificationFromEvent();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, DarwinNotificationFromEvent, 0, 0, 1u);
}

- (void)setValue:(BOOL)a3 forState:(__CFString *)a4
{
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  int v14;
  BOOL v15;
  int out_token;

  if (setValue_forState__onceToken != -1)
    dispatch_once(&setValue_forState__onceToken, &__block_literal_global_277);
  v6 = (const char *)objc_msgSend(objc_retainAutorelease((id)__SBSEventObserverGetDarwinNotificationFromEvent()), "UTF8String");
  out_token = -1;
  objc_msgSend((id)setValue_forState__tokenMap, "valueForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "unsignedIntValue");
    out_token = v9;
  }
  else
  {
    if (!notify_register_check(v6, &out_token))
    {
      v10 = (void *)setValue_forState__tokenMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v11, a4);

    }
    v9 = out_token;
  }
  if (v9 != -1)
  {
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__SBEventObserverRegistry_setValue_forState___block_invoke_2;
    v13[3] = &__block_descriptor_37_e5_v8__0l;
    v14 = v9;
    v15 = a3;
    dispatch_async(v12, v13);

  }
}

void __45__SBEventObserverRegistry_setValue_forState___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v1 = (void *)setValue_forState__tokenMap;
  setValue_forState__tokenMap = v0;

}

uint64_t __45__SBEventObserverRegistry_setValue_forState___block_invoke_2(uint64_t a1)
{
  return notify_set_state(*(_DWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
