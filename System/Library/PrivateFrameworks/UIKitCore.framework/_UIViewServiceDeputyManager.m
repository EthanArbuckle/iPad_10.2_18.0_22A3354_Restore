@implementation _UIViewServiceDeputyManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  id v3;
  _QWORD v4[5];

  v3 = -[_UIAsyncInvocation invoke](self->_invalidationInvocation, "invoke");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52___UIViewServiceDeputyManager__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  objc_msgSend(v3, "whenCompleteDo:", v4);
}

- (_UIViewServiceDeputyManager)init
{
  _UIViewServiceDeputyManager *v2;
  void *v3;
  objc_class *v4;
  const char *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIViewServiceDeputyManager;
  v2 = -[_UIViewServiceDeputyManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.uikit.%@ %p"), NSStringFromClass(v4), v2), "UTF8String");
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(v5, 0);
    v2->_connectionHandlers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_connectionHandlersLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_deputies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35___UIViewServiceDeputyManager_init__block_invoke;
    v7[3] = &__block_descriptor_40_e14_v16__0___v___8ls32l8;
    v7[4] = v2;
    v2->_invalidationInvocation = +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v7);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);

  self->_deputies = 0;
  self->_connectionHandlers = 0;

  self->_connectionHandlersLock = 0;
  self->_invalidationInvocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceDeputyManager;
  -[_UIViewServiceDeputyManager dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[_UIAsyncInvocation invoke](self->_invalidationInvocation, "invoke");
}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___UIViewServiceDeputyManager__invalidateUnconditionallyThen___block_invoke;
  v4[3] = &unk_1E16E8DD8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

+ (id)exportedInterfaceSupportingDeputyInterfaces:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "connectionProtocol"));
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "addObject:", &unk_1EE0CF3C8);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", _UIProtocolConformingToProtocols(v4));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        v15 = objc_msgSend(v14, "hostObjectInterface");
        if (v15)
          objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v15, objc_msgSend(v14, "connectionSelector"), 0, 0);
        v16 = objc_msgSend(v14, "exportedInterface");
        if (v16)
          objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v16, objc_msgSend(v14, "connectionSelector"), 0, 1);
      }
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v11);
  }
  return v9;
}

- (Class)_deputyClassForConnectionSelector:(SEL)a3
{
  NSMutableDictionary *connectionHandlers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_connectionHandlersLock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  connectionHandlers = self->_connectionHandlers;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](connectionHandlers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(connectionHandlers);
      v10 = NSClassFromString(*(NSString **)(*((_QWORD *)&v12 + 1) + 8 * v9));
      if (sel_isEqual(a3, (SEL)objc_msgSend((id)-[objc_class XPCInterface](v10, "XPCInterface"), "connectionSelector")))
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](connectionHandlers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  -[NSLock unlock](self->_connectionHandlersLock, "unlock");
  return v10;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;

  result = -[_UIViewServiceDeputyManager _deputyClassForConnectionSelector:](self, "_deputyClassForConnectionSelector:", a3);
  if (result)
    return (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", sel___prototype_requestConnectionToDeputyFromHostObject_replyHandler_);
  return result;
}

- (void)__requestConnectionToDeputyOfClass:(Class)a3 fromHostObject:(id)a4 replyHandler:(id)a5
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94___UIViewServiceDeputyManager___requestConnectionToDeputyOfClass_fromHostObject_replyHandler___block_invoke;
  block[3] = &unk_1E16E9278;
  block[4] = self;
  block[5] = a3;
  block[7] = a5;
  block[8] = a2;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)forwardInvocation:(id)a3
{
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = -[_UIViewServiceDeputyManager _deputyClassForConnectionSelector:](self, "_deputyClassForConnectionSelector:", objc_msgSend(a3, "selector"));
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    objc_msgSend(a3, "getArgument:atIndex:", &v8, 2);
    objc_msgSend(a3, "getArgument:atIndex:", &v7, 3);
    -[_UIViewServiceDeputyManager __requestConnectionToDeputyOfClass:fromHostObject:replyHandler:](self, "__requestConnectionToDeputyOfClass:fromHostObject:replyHandler:", v6, v8, v7);
  }
}

- (void)registerDeputyClass:(Class)a3 withConnectionHandler:(id)a4
{
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSMutableDictionary *connectionHandlers;
  _QWORD v13[5];

  v8 = NSStringFromClass(a3);
  -[NSLock lock](self->_connectionHandlersLock, "lock");
  if (-[NSMutableDictionary objectForKey:](self->_connectionHandlers, "objectForKey:", v8))
  {
    v9 = objc_opt_class();
    v10 = NSStringFromSelector(a2);
    NSLog(CFSTR("-[%@ %@] - newDeputyClassName already registered %@"), v9, v10, a3);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_connectionHandlers, "setObject:forKey:", (id)objc_msgSend(a4, "copy"), v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_connectionHandlers, "count"));
      connectionHandlers = self->_connectionHandlers;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73___UIViewServiceDeputyManager_registerDeputyClass_withConnectionHandler___block_invoke;
      v13[3] = &unk_1E16E92A0;
      v13[4] = v11;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectionHandlers, "enumerateKeysAndObjectsUsingBlock:", v13);
      objc_msgSend(self->_delegate, "deputyManager:didUpdateExportedInterface:", self, objc_msgSend((id)objc_opt_class(), "exportedInterfaceSupportingDeputyInterfaces:", v11));
    }
  }
  -[NSLock unlock](self->_connectionHandlersLock, "unlock");
}

- (void)unregisterDeputyClass:(Class)a3
{
  NSString *v5;
  id v6;
  uint64_t v7;
  NSMutableDictionary *connectionHandlers;
  _QWORD v9[5];

  -[NSLock lock](self->_connectionHandlersLock, "lock");
  v5 = NSStringFromClass(a3);
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_connectionHandlers, "objectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_connectionHandlers, "removeObjectForKey:", v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_connectionHandlers, "count"));
    connectionHandlers = self->_connectionHandlers;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___UIViewServiceDeputyManager_unregisterDeputyClass___block_invoke;
    v9[3] = &unk_1E16E92A0;
    v9[4] = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connectionHandlers, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend(self->_delegate, "deputyManager:didUpdateExportedInterface:", self, objc_msgSend((id)objc_opt_class(), "exportedInterfaceSupportingDeputyInterfaces:", v7));
  }
  -[NSLock unlock](self->_connectionHandlersLock, "unlock");
}

- (void)checkDeputyForRotation:(id)a3
{
  NSMutableSet *deputies;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1EE056468))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    deputies = self->_deputies;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deputies, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(deputies);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE054678))
            objc_msgSend(a3, "addDeputyRotationDelegate:", v10);
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deputies, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
  }
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1EE054678))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_deputies;
    v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE056468))
            objc_msgSend(v16, "addDeputyRotationDelegate:", a3);
        }
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
  }
}

- (void)viewControllerOperator:(id)a3 didCreateServiceViewControllerOfClass:(Class)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92___UIViewServiceDeputyManager_viewControllerOperator_didCreateServiceViewControllerOfClass___block_invoke;
  v4[3] = &unk_1E16E9318;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[_UIViewServiceDeputyManager registerDeputyClass:withConnectionHandler:](self, "registerDeputyClass:withConnectionHandler:", a4, v4);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

@end
