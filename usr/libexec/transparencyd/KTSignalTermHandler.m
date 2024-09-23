@implementation KTSignalTermHandler

+ (void)reset
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *source;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A76E8);
  source = (id)qword_1002A76F0;
  v2 = (void *)qword_1002A76F0;
  qword_1002A76F0 = 0;

  v3 = (void *)qword_1002A76F8;
  qword_1002A76F8 = (uint64_t)&stru_100247468;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
  v4 = source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = source;
  }

}

+ (void)setTryExit:(id)a3
{
  Block_layout *v3;
  void *v4;

  if (a3)
    v3 = (Block_layout *)objc_retainBlock(a3);
  else
    v3 = &stru_100247468;
  v4 = (void *)qword_1002A76F8;
  qword_1002A76F8 = (uint64_t)v3;

}

+ (void)signalEventHander
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void (**v9)(void);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  (*(void (**)(uint64_t, SEL))(qword_1002A76F8 + 16))(qword_1002A76F8, a2);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A76E8);
  v2 = (id)qword_1002A7700;
  v3 = (void *)qword_1002A7700;
  qword_1002A7700 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1)
                                                                                   + 8 * (_QWORD)v8), "complete", (_QWORD)v10));
        v9[2]();

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (BOOL)terminated
{
  BOOL v2;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A76E8);
  v2 = qword_1002A7700 == 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
  return v2;
}

+ (void)setup
{
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;
  _QWORD handler[5];

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A76E8);
  if (!qword_1002A76F0)
  {
    signal(15, (void (__cdecl *)(int))1);
    if (!qword_1002A76F8)
    {
      qword_1002A76F8 = (uint64_t)&stru_100247468;

    }
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v4 = (void *)qword_1002A7700;
    qword_1002A7700 = v3;

    v5 = dispatch_queue_create("KTSignalTermHandler", 0);
    v6 = (void *)qword_1002A7708;
    qword_1002A7708 = (uint64_t)v5;

    v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_1002A7708);
    v8 = (void *)qword_1002A76F0;
    qword_1002A76F0 = (uint64_t)v7;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10013561C;
    handler[3] = &unk_100247488;
    handler[4] = a1;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1002A76F0, handler);
    dispatch_activate((dispatch_object_t)qword_1002A76F0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
}

- (KTSignalTermHandler)initWithSIGTERMNotification:(id)a3
{
  id v4;
  KTSignalTermHandler *v5;
  uint64_t v6;
  KTSignalTermHandler *v7;
  NSObject *v8;
  KTSignalTermHandler *v9;
  _QWORD block[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KTSignalTermHandler;
  v5 = -[KTSignalTermHandler init](&v13, "init");
  v7 = v5;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(v5, v6), "setup");
    -[KTSignalTermHandler setComplete:](v7, "setComplete:", v4);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A76E8);
    if (qword_1002A7700)
    {
      objc_msgSend((id)qword_1002A7700, "addObject:", v7);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
      v8 = qword_1002A7708;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100135794;
      block[3] = &unk_1002474B0;
      v12 = v4;
      dispatch_async(v8, block);

    }
    v9 = v7;
  }

  return v7;
}

- (void)unregister
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002A76E8);
  objc_msgSend((id)qword_1002A7700, "removeObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002A76E8);
}

- (void)dealloc
{
  objc_super v3;

  -[KTSignalTermHandler unregister](self, "unregister");
  v3.receiver = self;
  v3.super_class = (Class)KTSignalTermHandler;
  -[KTSignalTermHandler dealloc](&v3, "dealloc");
}

- (id)complete
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setComplete:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_complete, 0);
}

@end
