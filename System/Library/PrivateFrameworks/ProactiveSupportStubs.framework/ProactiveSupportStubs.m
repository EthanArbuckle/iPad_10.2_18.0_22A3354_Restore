void sub_22E109E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22E109EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22E10A03C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E10A264(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL unlockedSinceBoot()
{
  void *v0;
  _BOOL8 v1;

  objc_opt_class();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  v1 = _classCLocked == 0;
  objc_sync_exit(v0);

  return v1;
}

uint64_t formattedForContentProtection()
{
  void *v0;
  uint64_t v1;

  objc_opt_class();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  v1 = _deviceFormattedForProtection;
  objc_sync_exit(v0);

  return v1;
}

uint64_t lockState()
{
  void *v0;
  uint64_t v1;

  objc_opt_class();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  v1 = _lockState;
  objc_sync_exit(v0);

  return v1;
}

id currentOsBuild()
{
  void *v0;
  void *v1;
  id v2;
  void *v4;
  void *v5;

  objc_opt_class();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  v1 = (void *)_currentOsBuild;
  if (!_currentOsBuild)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *currentOsBuild(void)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_PASDeviceStateStub.m"), 48, CFSTR("You must set the current Os Build"));

    v1 = (void *)_currentOsBuild;
  }
  v2 = v1;
  objc_sync_exit(v0);

  return v2;
}

void sub_22E10A4D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id registerForLockStateChanges(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  ++_tokenCounter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x22E3265BC]();
  objc_msgSend((id)_callbackMap, "setObject:forKeyedSubscript:", v8, v6);

  objc_sync_exit(v5);
  return v6;
}

void sub_22E10A5A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void unregisterForLockStateChanges(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  objc_opt_class();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v1);
  if (_callbackMap)
    objc_msgSend((id)_callbackMap, "removeObjectForKey:", v2);
  objc_sync_exit(v1);

}

void sub_22E10A61C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t registerForAKSEvents(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  ++_tokenCounter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)MEMORY[0x22E3265BC]();
  objc_msgSend((id)_callbackMapAKS, "setObject:forKeyedSubscript:", v8, v6);

  v9 = objc_msgSend(v6, "integerValue");
  objc_sync_exit(v5);

  return v9;
}

void sub_22E10A700(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void unregisterForAKSEvents(uint64_t a1)
{
  void *v2;
  void *v3;
  id obj;

  if ((_DWORD)a1)
  {
    objc_opt_class();
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v2 = (void *)_callbackMapAKS;
    if (_callbackMapAKS)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObjectForKey:", v3);

    }
    objc_sync_exit(obj);

  }
}

void sub_22E10A7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void registerOnceForFirstUnlock(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = a1;
  objc_opt_class();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v1);
  if (!_firstUnlockCallback)
  {
    v2 = objc_msgSend(v4, "copy");
    v3 = (void *)_firstUnlockCallback;
    _firstUnlockCallback = v2;

  }
  objc_sync_exit(v1);

}

void sub_22E10A828(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

