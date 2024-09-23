@implementation VISAXNotificationHandler

- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 handler:(SEL)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__VISAXNotificationHandler_initWithNotificationName_target_handler___block_invoke;
  v6[3] = &__block_descriptor_40_e40__32__0__NSString_8r_v16__NSDictionary_24l;
  v6[4] = a5;
  return -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:](self, "initWithNotificationName:target:dispatcher:", a3, a4, v6);
}

uint64_t __68__VISAXNotificationHandler_initWithNotificationName_target_handler___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5
{
  return -[VISAXNotificationHandler initWithNotificationName:target:dispatcher:startObserving:](self, "initWithNotificationName:target:dispatcher:startObserving:", a3, a4, a5, 1);
}

- (VISAXNotificationHandler)initWithNotificationName:(id)a3 target:(id)a4 dispatcher:(id)a5 startObserving:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  VISAXNotificationHandler *v13;
  VISAXNotificationHandler *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  void *v22;
  VISAXNotificationHandler *v24;
  void *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VISAXNotificationHandler;
  v13 = -[VISAXNotificationHandler init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    -[VISAXNotificationHandler _setNotificationName:](v13, "_setNotificationName:", v10);
    -[VISAXNotificationHandler _setTarget:](v14, "_setTarget:", v11);
    -[VISAXNotificationHandler _setDispatcher:](v14, "_setDispatcher:", v12);
    v14->_observerIdentifier = objc_msgSend((id)objc_opt_class(), "_safelyRegisterObserver:", v14);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "ignoreLogging");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE00710], "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v18, v19))
        {
          AXColorizeFormatLog();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[VISAXNotificationHandler _notificationTypeDescription](v14, "_notificationTypeDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[VISAXNotificationHandler _notificationName](v14, "_notificationName");
          v25 = v21;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v14;
          _AXStringForArgs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, v19))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v22;
            _os_log_impl(&dword_21FD32000, v18, v19, "%{public}@", buf, 0xCu);
          }

        }
      }
      -[VISAXNotificationHandler _startObserving](v14, "_startObserving", v24, v25, v26);
      v14->_valid = 1;
    }
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[VISAXNotificationHandler invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VISAXNotificationHandler;
  -[VISAXNotificationHandler dealloc](&v3, sel_dealloc);
}

- (id)_dispatcher
{
  return (id)MEMORY[0x2207D1D70](self->_dispatcher, a2);
}

- (void)_setDispatcher:(id)a3
{
  id v4;
  id dispatcher;
  id v6;

  v4 = a3;
  dispatcher = self->_dispatcher;
  if (dispatcher != v4)
  {
    v6 = v4;
    if (v4)
    {
      v4 = (id)objc_msgSend(v4, "copy");
      dispatcher = self->_dispatcher;
    }
    self->_dispatcher = v4;

    v4 = v6;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[VISAXNotificationHandler _target](self, "_target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)VISAXNotificationHandler;
  -[VISAXNotificationHandler description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (target: <%@: %p>)"), v5, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)invalidate
{
  AXPerformBlockSynchronouslyOnMainThread();
}

uint64_t __38__VISAXNotificationHandler_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_stopObserving");
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ignoreLogging");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v6, v7))
      {
        AXColorizeFormatLog();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_notificationTypeDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_notificationName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v6, v7))
        {
          *(_DWORD *)buf = 138543362;
          v13 = v10;
          _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend((id)objc_opt_class(), "_safelyRemoveObserverForIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_setNotificationName:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setTarget:", 0);
    result = objc_msgSend(*(id *)(a1 + 32), "_setDispatcher:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
  return result;
}

- (void)processHandler:(SEL)a3
{
  AXPerformBlockOnMainThread();
}

void __43__VISAXNotificationHandler_processHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = v8;
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl(&dword_21FD32000, v5, v6, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_target", v11, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performSelector:withObject:", *(_QWORD *)(a1 + 40), 0);

}

- (void)_handleNotificationWithName:(id)a3 object:(const void *)a4 userInfo:(id)a5
{
  id v8;
  uint64_t (**dispatcher)(id, id, const void *, id);
  uint64_t v10;
  id v11;

  v11 = a3;
  v8 = a5;
  dispatcher = (uint64_t (**)(id, id, const void *, id))self->_dispatcher;
  if (dispatcher)
  {
    v10 = dispatcher[2](dispatcher, v11, a4, v8);
    if (v10)
      -[VISAXNotificationHandler processHandler:](self, "processHandler:", v10);
  }

}

+ (unint64_t)_safelyRegisterObserver:(id)a3
{
  unint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5 = a3;
  AXPerformBlockSynchronouslyOnMainThread();
  v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__VISAXNotificationHandler__safelyRegisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!_AXNotificationHandlerListenerIdentifiers)
  {
    v2 = objc_opt_new();
    v3 = (void *)_AXNotificationHandlerListenerIdentifiers;
    _AXNotificationHandlerListenerIdentifiers = v2;

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ++_AXNotificationHandlerListenerNextIdentifier;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)_AXNotificationHandlerListenerIdentifiers;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

+ (void)_safelyRemoveObserverForIdentifier:(unint64_t)a3
{
  AXPerformBlockSynchronouslyOnMainThread();
}

void __63__VISAXNotificationHandler__safelyRemoveObserverForIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)_AXNotificationHandlerListenerIdentifiers, "removeObjectForKey:");
  if (!objc_msgSend((id)_AXNotificationHandlerListenerIdentifiers, "count"))
  {
    v1 = (void *)_AXNotificationHandlerListenerIdentifiers;
    _AXNotificationHandlerListenerIdentifiers = 0;

  }
}

+ (id)_safelyGetObserverForIdentifier:(unint64_t)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __60__VISAXNotificationHandler__safelyGetObserverForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)_AXNotificationHandlerListenerIdentifiers, "objectForKey:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonretainedObjectValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)_notificationName
{
  return self->_notificationName;
}

- (void)_setNotificationName:(id)a3
{
  objc_storeStrong((id *)&self->_notificationName, a3);
}

- (id)_target
{
  return self->_target;
}

- (void)_setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dispatcher, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

- (id)_notificationTypeDescription
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)_startObserving
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0();
}

- (void)_stopObserving
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0();
}

@end
