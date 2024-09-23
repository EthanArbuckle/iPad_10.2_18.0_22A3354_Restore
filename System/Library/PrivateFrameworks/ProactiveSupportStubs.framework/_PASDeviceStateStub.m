@implementation _PASDeviceStateStub

+ (void)startMockingSystem
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = objc_opt_new();
  v3 = (void *)_callbackMap;
  _callbackMap = v2;

  v4 = objc_opt_new();
  v5 = (void *)_callbackMapAKS;
  _callbackMapAKS = v4;

  v6 = (void *)_firstUnlockCallback;
  _firstUnlockCallback = 0;

  _lockState = 1;
  _classCLocked = 0;
  _deviceFormattedForProtection = 1;
  v7 = (void *)_currentOsBuild;
  _currentOsBuild = 0;

  _tokenCounter = 1;
  objc_msgSend(MEMORY[0x24BE7A5D0], "setSystemCallbacks:", &kMockSystemCallbacks);
  objc_sync_exit(obj);

}

+ (void)stopMockingSystem
{
  void *v2;
  void *v3;
  void *v4;
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BE7A5D0], "setDefaultSystemCallbacks");
  v2 = (void *)_callbackMap;
  _callbackMap = 0;

  v3 = (void *)_callbackMapAKS;
  _callbackMapAKS = 0;

  v4 = (void *)_firstUnlockCallback;
  _firstUnlockCallback = 0;

  objc_sync_exit(obj);
}

+ (void)setLockState:(int)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  _lockState = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)_callbackMap;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend((id)_callbackMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9[2](v9, _lockState);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

+ (void)setClassCLocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = _classCLocked;
  _classCLocked = v3;
  if (v5)
    v6 = !v3;
  else
    v6 = 0;
  if (!v6 || _firstUnlockCallback == 0)
  {
    v10 = 0;
  }
  else
  {
    v10 = (id)MEMORY[0x22E3265BC](_firstUnlockCallback);
    v8 = (void *)_firstUnlockCallback;
    _firstUnlockCallback = 0;

  }
  objc_sync_exit(v4);

  v9 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
    v9 = v10;
  }

}

+ (void)setLockStateAKS:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  if (v3 <= 5)
    _lockState = dword_22E10AB40[v3];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (id)_callbackMapAKS;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend((id)_callbackMapAKS, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9[2](v9, v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

+ (void)setDeviceFormattedForProtection:(BOOL)a3
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  _deviceFormattedForProtection = a3;
  objc_sync_exit(obj);

}

+ (void)setCurrentOsBuild:(id)a3
{
  id v3;
  void *v4;
  id obj;

  v3 = a3;
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v4 = (void *)_currentOsBuild;
  _currentOsBuild = (uint64_t)v3;

  objc_sync_exit(obj);
}

@end
