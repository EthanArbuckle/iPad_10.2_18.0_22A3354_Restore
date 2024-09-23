uint64_t SAElementIdentityEqualToIdentity(void *a1, void *a2)
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
  if (v3 == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v3, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      objc_msgSend(v3, "elementIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "elementIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = BSEqualObjects();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

id SAEffectiveElementIdentityDescription(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "elementDescription");
  else
    SAElementIdentityDescription(v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id SAElementIdentityDescription(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDD16A8];
    v6 = objc_opt_class();
    objc_msgSend(v3, "elementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; elementIdentifier: %@; clientIdentifier: %@"), v6, v3, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "uniqueElementIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendFormat:", CFSTR("; uniqueElementIdentifier: %@"), v10);

    }
    if (objc_msgSend(v4, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v4;
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
            v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendFormat:", CFSTR("; %@: %@"), v16, v17);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
    objc_msgSend(v9, "appendString:", CFSTR(">"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t SAHasIndicatorBehavior(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "hasIndicatorBehavior");
  else
    v2 = 0;

  return v2;
}

void sub_247C585C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SARegisterSystemApertureLogging()
{
  if (SARegisterSystemApertureLogging_onceToken != -1)
    dispatch_once(&SARegisterSystemApertureLogging_onceToken, &__block_literal_global);
}

void sub_247C58B54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_247C58F7C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_247C59154(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_247C592E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_247C59478(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t SAElementIdentitiesEqualToIdentities(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    if (v5)
    {
      v6 = 0;
      v7 = v5 - 1;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = SAElementIdentityEqualToIdentity(v8, v9);

        if (!(_DWORD)v10)
          break;
      }
      while (v7 != v6++);
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t SAElementEqualToElement(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  v4 = a2;
  if (v3 == v4)
  {
    v7 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "uniqueElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueElementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t SAHasActivityBehavior(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "hasActivityBehavior");
  else
    v2 = 0;

  return v2;
}

uint64_t SAHasAlertBehavior(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "hasAlertBehavior");
  else
    v2 = 0;

  return v2;
}

id SATargetElementFromBehaviorOverrider(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "behaviorOverridingTarget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "element");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

