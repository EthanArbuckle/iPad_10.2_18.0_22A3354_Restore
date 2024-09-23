@implementation SUScriptTextFieldDelegate

- (SUScriptTextFieldDelegate)init
{
  SUScriptTextFieldDelegate *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptTextFieldDelegate;
  v2 = -[SUScriptTextFieldDelegate init](&v4, sel_init);
  if (v2)
    v2->_delegates = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 513, 1);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptTextFieldDelegate;
  -[SUScriptTextFieldDelegate dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  -[NSHashTable addObject:](self->_delegates, "addObject:", a3);
}

- (int64_t)numberOfDelegates
{
  return -[NSHashTable count](self->_delegates, "count");
}

- (void)removeDelegate:(id)a3
{
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", a3);
}

- (void)forwardInvocation:(id)a3
{
  int v5;
  NSHashTable *delegates;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 1;
  v5 = strcmp((const char *)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnType"), "B");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  delegates = self->_delegates;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](delegates, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(delegates);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a3, "selector");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(a3, "invokeWithTarget:", v12);
          if (!v5)
          {
            v14 = 0;
            objc_msgSend(a3, "getReturnValue:", &v14);
            if (v10)
              v13 = v14 == 0;
            else
              v13 = 1;
            v10 = !v13;
            v19 = v10;
          }
        }
      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](delegates, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }
  if (!v5)
    objc_msgSend(a3, "setReturnValue:", &v19);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_method_description MethodDescription;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptTextFieldDelegate;
  result = -[SUScriptTextFieldDelegate methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    MethodDescription = protocol_getMethodDescription((Protocol *)&unk_2551E2A78, a3, 0, 1);
    result = (id)MethodDescription.name;
    if (MethodDescription.name)
      return (id)objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", MethodDescription.types);
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned __int8 v4;
  NSHashTable *delegates;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)SUScriptTextFieldDelegate;
  v4 = -[SUScriptTextFieldDelegate respondsToSelector:](&v15, sel_respondsToSelector_);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  delegates = self->_delegates;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](delegates, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(delegates);
        if ((v4 & 1) != 0)
          v4 = 1;
        else
          v4 = objc_opt_respondsToSelector();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](delegates, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }
  return v4 & 1;
}

@end
