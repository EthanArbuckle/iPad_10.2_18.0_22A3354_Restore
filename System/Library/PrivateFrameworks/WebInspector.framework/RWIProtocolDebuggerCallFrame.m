@implementation RWIProtocolDebuggerCallFrame

- (RWIProtocolDebuggerCallFrame)initWithCallFrameId:(id)a3 functionName:(id)a4 location:(id)a5 scopeChain:(id)a6 thisObject:(id)a7 isTailDeleted:(BOOL)a8
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  RWIProtocolDebuggerCallFrame *v22;
  _BOOL4 v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  RWIProtocolDebuggerCallFrame *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v24 = a8;
  v37 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v25 = a7;
  v35.receiver = self;
  v35.super_class = (Class)RWIProtocolDebuggerCallFrame;
  v30 = -[RWIProtocolJSONObject init](&v35, sel_init);
  if (v30)
  {
    if (!v26)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("callFrameId"));
    if (!v27)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("functionName"));
    if (!v28)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("location"));
    if (!v29)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("scopeChain"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v29;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      v16 = *MEMORY[0x24BDBCAB8];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v19 = (void *)MEMORY[0x24BDBCE88];
            v20 = (objc_class *)objc_opt_class();
            NSStringFromClass(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "raise:format:", v16, CFSTR("array should contain objects of type '%@', found bad value: %@"), v21, v18);

          }
          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);
    }

    if (!v25)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required property '%@' cannot be nil"), CFSTR("thisObject"));
    -[RWIProtocolDebuggerCallFrame setCallFrameId:](v30, "setCallFrameId:", v26);
    -[RWIProtocolDebuggerCallFrame setFunctionName:](v30, "setFunctionName:", v27);
    -[RWIProtocolDebuggerCallFrame setLocation:](v30, "setLocation:", v28);
    -[RWIProtocolDebuggerCallFrame setScopeChain:](v30, "setScopeChain:", v13);
    -[RWIProtocolDebuggerCallFrame setThisObject:](v30, "setThisObject:", v25);
    -[RWIProtocolDebuggerCallFrame setIsTailDeleted:](v30, "setIsTailDeleted:", v24);
    v22 = v30;
  }

  return v30;
}

- (void)setCallFrameId:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("callFrameId"));
}

- (NSString)callFrameId
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("callFrameId"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFunctionName:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("functionName"));
}

- (NSString)functionName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("functionName"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocation:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("location"));
}

- (RWIProtocolDebuggerLocation)location
{
  void *v3;
  RWIProtocolDebuggerLocation *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDebuggerLocation *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDebuggerLocation alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerCallFrame;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setScopeChain:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _DWORD *v12;
  objc_super v14;
  _DWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x24BDBCE88];
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "raise:format:", v6, CFSTR("array should contain objects of type '%@', found bad value: %@"), v11, v8);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  Inspector::toJSONObjectArray((Inspector *)v3, (uint64_t *)&v15);
  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject setJSONArray:forKey:](&v14, sel_setJSONArray_forKey_, &v15, CFSTR("scopeChain"));
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*v12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v12;
  }

}

- (NSArray)scopeChain
{
  void *v2;
  WTF::JSONImpl::ArrayBase *v3;
  objc_super v5;
  WTF::JSONImpl::ArrayBase *v6;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject JSONArrayForKey:](&v5, sel_JSONArrayForKey_, CFSTR("scopeChain"));
  Inspector::toObjCArray<RWIProtocolDebuggerScope>(&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v3;
  }
  return (NSArray *)v2;
}

- (void)setThisObject:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("this"));
}

- (RWIProtocolRuntimeRemoteObject)thisObject
{
  void *v3;
  RWIProtocolRuntimeRemoteObject *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolRuntimeRemoteObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("this"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolRuntimeRemoteObject alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDebuggerCallFrame;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("this"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setIsTailDeleted:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("isTailDeleted"));
}

- (BOOL)isTailDeleted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDebuggerCallFrame;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("isTailDeleted"));
}

@end
