@implementation SDNetworkBrowser

- (SDNetworkBrowser)initWithKind:(id)a3 rootNode:(__SFNode *)a4
{
  id v7;
  SDNetworkBrowser *v8;
  SDNetworkBrowser *v9;
  NSNumber *isEntitled;
  OS_xpc_object *connection;
  uint64_t v12;
  OS_os_transaction *transaction;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SDNetworkBrowser;
  v8 = -[SDNetworkBrowser init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    isEntitled = v8->_isEntitled;
    v8->_isEntitled = 0;

    v9->_mode = 0;
    objc_storeStrong((id *)&v9->_kind, a3);
    connection = v9->_connection;
    v9->_connection = 0;

    v9->_rootNode = (__SFNode *)CFRetain(a4);
    v9->_nodeBrowsers = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v12 = os_transaction_create("com.apple.sharing.SDNetworkBrowser");
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v12;

  }
  return v9;
}

- (void)dealloc
{
  __SFNode *rootNode;
  __CFDictionary *nodeBrowsers;
  objc_super v5;

  -[SDNetworkBrowser invalidate](self, "invalidate");
  rootNode = self->_rootNode;
  if (rootNode)
    CFRelease(rootNode);
  nodeBrowsers = self->_nodeBrowsers;
  if (nodeBrowsers)
    CFRelease(nodeBrowsers);
  v5.receiver = self;
  v5.super_class = (Class)SDNetworkBrowser;
  -[SDNetworkBrowser dealloc](&v5, "dealloc");
}

- (void)nodeBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  uint64_t v6;
  SDNetworkBrowserDelegate **p_delegate;
  id v10;
  id WeakRetained;

  v6 = *(_QWORD *)&a6;
  p_delegate = &self->_delegate;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "networkBrowser:nodesChangedForParent:protocol:error:", self, a4, v10, v6);

}

- (int)openNode:(__SFNode *)rootNode forProtocol:(id)a4 flags:(unint64_t)a5
{
  id v8;
  const void *Value;
  uint64_t v10;
  SDNodeBrowser *v11;
  void *v12;
  int v13;

  v8 = a4;
  if (!rootNode)
    rootNode = self->_rootNode;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  v10 = objc_claimAutoreleasedReturnValue(Value);
  if (v10)
  {
    v11 = (SDNodeBrowser *)v10;
  }
  else
  {
    if (!SFNodeIsContainer(rootNode))
    {
      v11 = 0;
      v13 = -1;
      goto LABEL_8;
    }
    v11 = -[SDNodeBrowser initWithNode:protocol:flags:kind:]([SDNodeBrowser alloc], "initWithNode:protocol:flags:kind:", rootNode, v8, a5, self->_kind);
    CFDictionarySetValue(self->_nodeBrowsers, rootNode, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDNetworkBrowser helperConnection](self, "helperConnection"));
    -[SDNodeBrowser setHelperConnection:](v11, "setHelperConnection:", v12);

    -[SDNodeBrowser setBundleID:](v11, "setBundleID:", self->_bundleID);
    -[SDNodeBrowser setConnection:](v11, "setConnection:", self->_connection);
    -[SDNodeBrowser setDelegate:](v11, "setDelegate:", self);
    -[SDNodeBrowser setMode:](v11, "setMode:", self->_mode);
    -[SDNodeBrowser setOptions:](v11, "setOptions:", self->_options);
    -[SDNodeBrowser start](v11, "start");
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (__SFNode)copyRootNode
{
  __SFNode *result;

  result = self->_rootNode;
  if (result)
    return (__SFNode *)CFRetain(result);
  return result;
}

- (id)childrenForNode:(__SFNode *)a3
{
  __SFNode *rootNode;
  const void *Value;
  void *v5;
  void *v6;
  void *v7;

  rootNode = a3;
  if (!a3)
    rootNode = self->_rootNode;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));
  else
    v7 = &__NSArray0__struct;

  return v7;
}

- (id)sidebarChildren
{
  const void *Value;
  void *v3;
  void *v4;
  void *v5;

  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v3 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sidebarNodes"));
  else
    v5 = &__NSArray0__struct;

  return v5;
}

- (void)setMode:(int64_t)a3
{
  const void *Value;
  id v5;

  self->_mode = a3;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v5 = (id)objc_claimAutoreleasedReturnValue(Value);
  objc_msgSend(v5, "setMode:", a3);

}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOptions:(id)a3
{
  id v5;
  const void *Value;
  id v7;

  objc_storeStrong((id *)&self->_options, a3);
  v5 = a3;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v7 = (id)objc_claimAutoreleasedReturnValue(Value);
  objc_msgSend(v7, "setOptions:", v5);

}

- (NSDictionary)options
{
  return self->_options;
}

- (int)addNode:(__SFNode *)a3
{
  const void *Value;
  void *v5;
  void *v6;
  int v7;

  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "addNode:", a3);
  else
    v7 = -1;

  return v7;
}

- (int)removeNode:(__SFNode *)a3
{
  const void *Value;
  void *v5;
  void *v6;
  int v7;

  Value = CFDictionaryGetValue(self->_nodeBrowsers, self->_rootNode);
  v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "removeNode:", a3);
  else
    v7 = -1;

  return v7;
}

- (int)closeNode:(__SFNode *)a3
{
  __SFNode *rootNode;
  const void *Value;
  void *v6;
  void *v7;

  rootNode = a3;
  if (!a3)
    rootNode = self->_rootNode;
  Value = CFDictionaryGetValue(self->_nodeBrowsers, rootNode);
  v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stop");
    objc_msgSend(v7, "setDelegate:", 0);
    CFDictionaryRemoveValue(self->_nodeBrowsers, rootNode);
  }

  return 0;
}

- (void)invalidate
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary allValues](self->_nodeBrowsers, "allValues"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setDelegate:", 0);
        objc_msgSend(v8, "stop");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  CFDictionaryRemoveAllValues(self->_nodeBrowsers);

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
  objc_storeWeak((id *)&self->_helperConnection, a3);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)objectKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setObjectKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (OS_xpc_object)boostMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBoostMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SDNetworkBrowserDelegate)delegate
{
  return (SDNetworkBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)isEntitled
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIsEntitled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEntitled, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_objectKey, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
