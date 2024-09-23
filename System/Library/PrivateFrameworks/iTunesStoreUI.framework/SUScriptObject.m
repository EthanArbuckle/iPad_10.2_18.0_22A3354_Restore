@implementation SUScriptObject

- (SUScriptObject)init
{
  SUScriptObject *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptObject;
  v2 = -[SUScriptObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (void)dealloc
{
  SUScriptObjectInvocationBatch *invocationBatch;
  NSLock *lock;
  NSMutableArray *eventListeners;
  SUScriptNativeObject *nativeObject;
  NSMutableSet *scriptObjects;
  objc_super v8;

  -[SUScriptObject checkOutBatchTarget:](self, "checkOutBatchTarget:", self);
  -[SUScriptObjectInvocationBatch setRootObject:](self->_invocationBatch, "setRootObject:", 0);
  invocationBatch = self->_invocationBatch;
  self->_invocationBatch = 0;

  lock = self->_lock;
  self->_lock = 0;

  eventListeners = self->_eventListeners;
  self->_eventListeners = 0;

  -[SUScriptNativeObject setScriptObject:](self->_nativeObject, "setScriptObject:", 0);
  nativeObject = self->_nativeObject;
  self->_nativeObject = 0;

  -[NSMutableSet makeObjectsPerformSelector:withObject:](self->_scriptObjects, "makeObjectsPerformSelector:withObject:", sel_setParentScriptObject_, 0);
  scriptObjects = self->_scriptObjects;
  self->_scriptObjects = 0;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptObject;
  -[SUScriptObject dealloc](&v8, sel_dealloc);
}

- (void)checkInScriptObject:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDBCE30];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v6);
}

- (void)checkInScriptObjects:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *scriptObjects;

  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  if (!self->_scriptObjects)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    scriptObjects = self->_scriptObjects;
    self->_scriptObjects = v5;

  }
  objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_setParentScriptObject_, self);
  -[NSMutableSet addObjectsFromArray:](self->_scriptObjects, "addObjectsFromArray:", v4);

  -[SUScriptObject unlock](self, "unlock");
}

- (void)checkOutScriptObject:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDBCE30];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:", v6);
}

- (void)checkOutScriptObjects:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_scriptObjects, "containsObject:", v10, (_QWORD)v11))
        {
          objc_msgSend(v10, "setParentScriptObject:", 0);
          -[NSMutableSet removeObject:](self->_scriptObjects, "removeObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[SUScriptObject unlock](self, "unlock");
}

- (SUClientInterface)clientInterface
{
  void *v2;
  void *v3;

  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUClientInterface *)v3;
}

- (OpaqueJSContext)copyJavaScriptContext
{
  void *v2;
  OpaqueJSContext *v3;

  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (OpaqueJSContext *)objc_msgSend(v2, "copyJavaScriptContext");

  return v3;
}

- (id)copyObjectForScriptFromPoolWithClass:(Class)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[SUScriptObject parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copyObjectForScriptFromPoolWithClass:", a3);

  if (!v6)
    v6 = objc_alloc_init(a3);
  if ((Class)objc_opt_class() == a3)
  {
    -[SUScriptObject clientInterface](self, "clientInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "styleBarButtonItem:", v6);

  }
  return v6;
}

- (void)dispatchEvent:(id)a3 forName:(id)a4
{
  -[SUScriptObject dispatchEvent:forName:synchronously:](self, "dispatchEvent:forName:synchronously:", a3, a4, 0);
}

- (void)dispatchEvent:(id)a3 forName:(id)a4 synchronously:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = -[SUScriptObject _copyListenersForName:](self, "_copyListenersForName:", a4);
  if (v5 && (WebThreadIsCurrent() & 1) == 0)
    WebThreadLock();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", self, v8, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "callback");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v16, "callWebScriptMethod:withArguments:", CFSTR("call"), v10);

        }
        else
        {
          v18 = v10;
          WebThreadRun();

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

}

void __54__SUScriptObject_dispatchEvent_forName_synchronously___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "callWebScriptMethod:withArguments:", CFSTR("call"), *(_QWORD *)(a1 + 40));

}

- (id)DOMElementWithElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DOMElementWithElement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isVisible
{
  char v3;
  void *v4;
  char v5;

  -[SUScriptObject lock](self, "lock");
  v3 = *((_BYTE *)self + 56);
  -[SUScriptObject unlock](self, "unlock");
  if ((v3 & 2) != 0)
    return 1;
  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVisible");

  return v5;
}

- (void)loadImageWithURL:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  +[ISDataProvider provider](SUImageDataProvider, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataProvider:", v8);

  objc_msgSend(v7, "setUrlKnownToBeTrusted:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", v5);
  objc_msgSend(v9, "setAllowedRetryCount:", 0);
  objc_msgSend(v9, "setTimeoutInterval:", 10.0);
  objc_msgSend(v7, "setRequestProperties:", v9);
  objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __51__SUScriptObject_loadImageWithURL_completionBlock___block_invoke;
  v25 = &unk_24DE7B280;
  v11 = v10;
  v26 = v11;
  v12 = v6;
  v27 = v12;
  objc_msgSend(v7, "setCompletionBlock:", &v22);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldLog");
  if (objc_msgSend(v13, "shouldLogToDisk"))
    v15 = v14 | 2;
  else
    v15 = v14;
  objc_msgSend(v13, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    v15 &= 2u;
  if (!v15)
    goto LABEL_9;
  v17 = (void *)objc_opt_class();
  v28 = 138412546;
  v29 = v17;
  v30 = 2112;
  v31 = v5;
  v18 = v17;
  LODWORD(v21) = 22;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, &v28, v21, v22, v23, v24, v25, v26);
    v16 = objc_claimAutoreleasedReturnValue();
    free(v19);
    SSFileLog();
LABEL_9:

  }
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addOperation:", v7);

}

void __51__SUScriptObject_loadImageWithURL_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "success"))
  {
    objc_msgSend(v6, "dataProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "output");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (SUScriptNativeObject)nativeObject
{
  SUScriptNativeObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_nativeObject;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)newImageWithURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDF6D38];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v7 = -[SUScriptObject newImageWithURL:scale:](self, "newImageWithURL:scale:", v5);

  return v7;
}

- (id)newImageWithURL:(id)a3 scale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("data"));

    if (v9)
    {
      objc_msgSend(v7, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v14 = 0;
        goto LABEL_11;
      }
      -[SUScriptObject webFrame](self, "webFrame");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "subresourceForURL:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_7;
LABEL_9:
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "_initWithData:scale:", v14, a4);
      objc_setAssociatedObject(v10, "com.apple.iTunesStoreUI.SUScriptObject.imageURL", v7, (void *)0x303);
      goto LABEL_11;
    }
    SUGetDataForDataURL((uint64_t)v7, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_9;
  }
  else
  {
    v14 = 0;
  }
LABEL_7:
  v10 = 0;
LABEL_11:

  return v10;
}

- (SUScriptObject)parentScriptObject
{
  SUScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_parentScriptObject;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)parentViewController
{
  void *v2;
  void *v3;

  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)scriptObjectIsCheckedIn:(id)a3
{
  id v4;
  char v5;
  char v6;
  void *v7;

  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  v5 = -[NSMutableSet containsObject:](self->_scriptObjects, "containsObject:", v4);
  -[SUScriptObject unlock](self, "unlock");
  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[SUScriptObject parentScriptObject](self, "parentScriptObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "scriptObjectIsCheckedIn:", v4);

  }
  return v6;
}

- (void)setNativeObject:(id)a3
{
  SUScriptNativeObject *nativeObject;
  SUScriptNativeObject *v6;

  v6 = (SUScriptNativeObject *)a3;
  -[SUScriptObject lock](self, "lock");
  nativeObject = self->_nativeObject;
  if (nativeObject != v6)
  {
    -[SUScriptNativeObject setScriptObject:](nativeObject, "setScriptObject:", 0);
    objc_storeStrong((id *)&self->_nativeObject, a3);
    -[SUScriptNativeObject setScriptObject:](self->_nativeObject, "setScriptObject:", self);
  }
  -[SUScriptObject unlock](self, "unlock");

}

- (void)setParentScriptObject:(id)a3
{
  SUScriptObject *v4;
  SUScriptObject *parentScriptObject;

  v4 = (SUScriptObject *)a3;
  -[SUScriptObject lock](self, "lock");
  parentScriptObject = self->_parentScriptObject;
  self->_parentScriptObject = v4;

  -[SUScriptObject unlock](self, "unlock");
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  char v6;

  v3 = a3;
  -[SUScriptObject lock](self, "lock");
  v5 = *((_BYTE *)self + 56);
  if (((((v5 & 2) == 0) ^ v3) & 1) != 0)
  {
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 56) = v5 & 0xFD | v6;
    -[SUScriptObject unlock](self, "unlock");
    if (!v3)
      -[SUScriptObject _checkOutAfterVisibilityChange](self, "_checkOutAfterVisibilityChange");
  }
}

- (BOOL)sourceIsTrusted
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SUScriptObject webFrame](self, "webFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("https"));

  return v7;
}

- (void)tearDownUserInterface
{
  id v4;

  -[SUScriptObject lock](self, "lock");
  v4 = (id)-[NSMutableSet copy](self->_scriptObjects, "copy");
  -[SUScriptObject unlock](self, "unlock");
  objc_msgSend(v4, "makeObjectsPerformSelector:", a2);

}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)viewControllerFactory
{
  void *v3;
  void *v4;
  void *v5;

  -[SUScriptObject parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SUScriptObject clientInterface](self, "clientInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (WebFrame)webFrame
{
  void *v2;
  void *v3;

  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WebFrame *)v3;
}

- (void)addListenerForEventWithName:(id)a3 callback:(id)a4 useCapture:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  char isKindOfClass;
  void *v10;
  SUScriptEventListener *v11;
  NSMutableArray *eventListeners;
  NSMutableArray *v13;
  NSMutableArray *v14;
  const __CFString *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = (void *)MEMORY[0x24BDFA950];
  if ((isKindOfClass & 1) == 0)
  {
    v15 = CFSTR("Invalid event name");
LABEL_8:
    objc_msgSend(v10, "throwException:", v15);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDFA950];
    v15 = CFSTR("Invalid event callback");
    goto LABEL_8;
  }
  v11 = objc_alloc_init(SUScriptEventListener);
  -[SUScriptEventListener setCallback:](v11, "setCallback:", v8);
  -[SUScriptEventListener setName:](v11, "setName:", v16);
  -[SUScriptEventListener setShouldUseCapture:](v11, "setShouldUseCapture:", v5);
  -[SUScriptObject lock](self, "lock");
  eventListeners = self->_eventListeners;
  if (!eventListeners)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = self->_eventListeners;
    self->_eventListeners = v13;

    eventListeners = self->_eventListeners;
  }
  -[NSMutableArray addObject:](eventListeners, "addObject:", v11);
  -[SUScriptObject unlock](self, "unlock");

LABEL_9:
}

- (void)removeListenerForEventWithName:(id)a3 callback:(id)a4 useCapture:(BOOL)a5
{
  int v5;
  id v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  id v18;

  v5 = a5;
  v18 = a3;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = (void *)MEMORY[0x24BDFA950];
  if ((isKindOfClass & 1) == 0)
  {
    v17 = CFSTR("Invalid event name");
LABEL_15:
    objc_msgSend(v10, "throwException:", v17);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDFA950];
    v17 = CFSTR("Invalid event callback");
    goto LABEL_15;
  }
  -[SUScriptObject lock](self, "lock");
  v11 = -[NSMutableArray count](self->_eventListeners, "count");
  if (v11 >= 1)
  {
    for (i = v11 + 1; i > 1; --i)
    {
      -[NSMutableArray objectAtIndex:](self->_eventListeners, "objectAtIndex:", i - 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", v18) & 1) != 0)
      {
        objc_msgSend(v13, "callback");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqual:", v8) & 1) != 0)
        {
          v16 = objc_msgSend(v13, "shouldUseCapture");

          if (v16 == v5)
          {
            objc_msgSend(v13, "setCallback:", 0);
            -[NSMutableArray removeObjectAtIndex:](self->_eventListeners, "removeObjectAtIndex:", i - 2);
          }
          goto LABEL_11;
        }

      }
LABEL_11:

    }
  }
  -[SUScriptObject unlock](self, "unlock");
LABEL_16:

}

- (NSString)_className
{
  return (NSString *)CFSTR("iTunesObject");
}

- (void)_checkOutAfterVisibilityChange
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  if (-[SUScriptObject isVisible](self, "isVisible"))
  {
    objc_msgSend(0, "makeObjectsPerformSelector:", a2);
    v4 = 0;
  }
  else
  {
    -[SUScriptObject lock](self, "lock");
    v5 = *((_BYTE *)self + 56);
    *((_BYTE *)self + 56) = v5 & 0xFE;
    v7 = (id)-[NSMutableSet copy](self->_scriptObjects, "copy");
    -[SUScriptObject unlock](self, "unlock");
    objc_msgSend(v7, "makeObjectsPerformSelector:", a2);
    if ((v5 & 1) != 0)
    {
      -[SUScriptObject parentScriptObject](self, "parentScriptObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "checkOutScriptObject:", self);

    }
    v4 = v7;
  }

}

- (id)_copyListenersForName:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUScriptObject lock](self, "lock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_eventListeners;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)a3
{
  return 0;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "webScriptNameForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 0;
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasSuffix:", CFSTR(":")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "webScriptNameForKeyName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8 == 0;

  }
  return v6;
}

+ (id)webScriptNameForKey:(const char *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3);
  objc_msgSend(a1, "webScriptNameForKeyName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  return (id)objc_msgSend((id)__KeyMapping_8, "objectForKey:", a3);
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  return (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_6, 4);
}

- (NSMutableArray)scriptAttributeKeys
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend((id)__KeyMapping_8, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return (NSMutableArray *)v2;
}

- (void)finalizeForWebScript
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUScriptObject_finalizeForWebScript__block_invoke;
  block[3] = &unk_24DE7B230;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__SUScriptObject_finalizeForWebScript__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  char v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isVisible");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(v3 + 56);
  if (v2)
  {
    *(_BYTE *)(v3 + 56) = v4 | 1;
  }
  else
  {
    *(_BYTE *)(v3 + 56) = v4 & 0xFE;
    objc_msgSend(*(id *)(a1 + 32), "parentScriptObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkOutScriptObject:", *(_QWORD *)(a1 + 32));

  }
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_6 = (uint64_t)sel_addListenerForEventWithName_callback_useCapture_;
    *(_QWORD *)algn_2551860A8 = CFSTR("addEventListener");
    qword_2551860B0 = (uint64_t)sel_equals_;
    unk_2551860B8 = CFSTR("equals");
    qword_2551860C0 = (uint64_t)sel_removeListenerForEventWithName_callback_useCapture_;
    unk_2551860C8 = CFSTR("removeEventListener");
    qword_2551860D0 = (uint64_t)sel_stringRepresentation;
    unk_2551860D8 = CFSTR("toString");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("className"), CFSTR("_className"), 0);
    v3 = (void *)__KeyMapping_8;
    __KeyMapping_8 = v2;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_scriptObjects, 0);
  objc_storeStrong((id *)&self->_parentScriptObject, 0);
  objc_storeStrong((id *)&self->_nativeObject, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_invocationBatch, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
}

- (void)checkOutBatchTarget:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUScriptObject invocationBatch:](self, "invocationBatch:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkOutBatchTarget:", v4);

}

- (void)didPerformBatchedInvocations
{
  id v4;

  -[SUScriptObject lock](self, "lock");
  v4 = (id)-[NSMutableSet copy](self->_scriptObjects, "copy");
  -[SUScriptObject unlock](self, "unlock");
  objc_msgSend(v4, "makeObjectsPerformSelector:", a2);

}

- (id)invocationBatch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SUScriptObjectInvocationBatch *v6;
  SUScriptObjectInvocationBatch *invocationBatch;
  BOOL v8;
  SUScriptObjectInvocationBatch *v9;
  SUScriptObjectInvocationBatch *v10;

  v3 = a3;
  -[SUScriptObject parentScriptObject](self, "parentScriptObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invocationBatch:", v3);
  v6 = (SUScriptObjectInvocationBatch *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SUScriptObject lock](self, "lock");
    invocationBatch = self->_invocationBatch;
    if (invocationBatch)
      v8 = 1;
    else
      v8 = !v3;
    if (!v8)
    {
      v9 = objc_alloc_init(SUScriptObjectInvocationBatch);
      v10 = self->_invocationBatch;
      self->_invocationBatch = v9;

      -[SUScriptObjectInvocationBatch setRootObject:](self->_invocationBatch, "setRootObject:", self);
      invocationBatch = self->_invocationBatch;
    }
    v6 = invocationBatch;
    -[SUScriptObject unlock](self, "unlock");
  }
  return v6;
}

- (id)webThreadMainThreadBatchProxy
{
  void *v3;
  void *v4;

  -[SUScriptObject invocationBatch:](self, "invocationBatch:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batchProxyForObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)willPerformBatchedInvocations
{
  id v4;

  -[SUScriptObject lock](self, "lock");
  v4 = (id)-[NSMutableSet copy](self->_scriptObjects, "copy");
  -[SUScriptObject unlock](self, "unlock");
  objc_msgSend(v4, "makeObjectsPerformSelector:", a2);

}

@end
