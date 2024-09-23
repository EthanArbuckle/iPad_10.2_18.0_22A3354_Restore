void *AXSetValidationErrorLoggingFunction(void *result)
{
  _UIAXValidationLogger = result;
  return result;
}

void *AXSetUIAXReportSenderErrorLoggerFunction(void *result)
{
  _UIAXReportSenderErrorLogger = result;
  return result;
}

uint64_t _AXSafeCategoryLog(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = _AXSafeCategoryLog_onceToken;
  v3 = a2;
  if (v2 != -1)
    dispatch_once(&_AXSafeCategoryLog_onceToken, &__block_literal_global_59);
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "UTF8String");

  return os_log_with_args();
}

void UIAccessibilityInstallSafeCategory(void *a1)
{
  Class v1;
  Class v2;
  void *v3;
  void (*v4)(void);
  NSString *v5;

  v5 = a1;
  v1 = NSClassFromString(v5);
  if (v1)
  {
    v2 = v1;
    -[objc_class safeCategoryTargetClassName](v1, "safeCategoryTargetClassName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class _installSafeCategoryOnClassNamed:](v2, "_installSafeCategoryOnClassNamed:", v3);
LABEL_7:

    goto LABEL_8;
  }
  if (_UIAXReportSenderErrorLogger)
    _UIAXReportSenderErrorLogger(v5, v5);
  v4 = (void (*)(void))_UIAXValidationLogger;
  if (_UIAXValidationLogger)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UIAccessibility Error installing safe category %@."), v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4();
    goto LABEL_7;
  }
LABEL_8:

}

void UIAccessibilityInstallSafeCategories(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t i;
  NSString *v9;
  Class v10;
  Class v11;
  NSString *v12;
  Class v13;
  Class v14;
  Class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id *v23;
  id v24;
  const void *v25;
  id v26;
  id v27;
  char *__base;
  _QWORD __compar[4];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    __base = (char *)malloc_type_malloc(40 * v2, 0xE0040956ACC96uLL);
    if (__base)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v27 = v1;
      v3 = v1;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        v7 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v34 != v7)
              objc_enumerationMutation(v3);
            v9 = *(NSString **)(*((_QWORD *)&v33 + 1) + 8 * i);
            v10 = NSClassFromString(v9);
            if (v10)
            {
              v11 = v10;
              -[objc_class safeCategoryTargetClassName](v10, "safeCategoryTargetClassName");
              v12 = (NSString *)objc_claimAutoreleasedReturnValue();
              v13 = NSClassFromString(v12);
              if (v13)
              {
                v14 = v13;
                v15 = (Class *)&__base[40 * v6];
                *v15 = v11;
                v16 = v9;
                v15[1] = (Class)v16;
                v15[2] = (Class)_UIAccessibilityCopyClassPath(v11, v16);
                v15[3] = v14;
                v15[4] = (Class)_UIAccessibilityCopyClassPath(v14, v12);
                ++v6;
              }

            }
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v5);
      }
      else
      {
        v6 = 0;
      }

      v17 = (void *)objc_opt_new();
      v18 = (void *)objc_opt_new();
      v19 = (void *)objc_opt_new();
      __compar[0] = MEMORY[0x24BDAC760];
      __compar[1] = 3221225472;
      __compar[2] = __UIAccessibilityInstallSafeCategories_block_invoke;
      __compar[3] = &unk_24C1C3978;
      v20 = v17;
      v30 = v20;
      v21 = v18;
      v31 = v21;
      v22 = v19;
      v32 = v22;
      qsort_b(__base, v6, 0x28uLL, __compar);
      v1 = v27;
      if (v6)
      {
        v23 = (id *)(__base + 16);
        do
        {
          v24 = (id)objc_msgSend(*(v23 - 2), "_installSafeCategoryOnClass:isManaged:", v23[1], 0);
          v25 = *(v23 - 1);
          if (v25)
          {
            CFRelease(v25);
            *(v23 - 1) = 0;
          }
          if (*v23)
          {
            CFRelease(*v23);
            *v23 = 0;
          }
          v26 = v23[2];
          if (v26)
          {
            CFRelease(v26);
            v23[2] = 0;
          }
          v23 += 5;
          --v6;
        }
        while (v6);
      }
      free(__base);

    }
  }

}

void *_UIAccessibilityCopyClassPath(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
  v5 = objc_msgSend(a1, "superclass");
  if (v5)
  {
    v6 = (objc_class *)v5;
    do
    {
      objc_msgSend(v4, "insertString:atIndex:", CFSTR(","), 0);
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertString:atIndex:", v7, 0);

      v6 = (objc_class *)-[objc_class superclass](v6, "superclass");
    }
    while (v6);
  }

  return v4;
}

uint64_t _UIAccessibilitySafeCategoryDependsOnSafeCategory(void **a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  char v12;
  NSString *v13;
  Class v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  _UIAccessibilitySafeCategoryAddDependenciesToArray(*a1, v9, v10, v11);
  v12 = 0;
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    objc_msgSend(v11, "addObject:", v13);
    if (-[NSString isEqualToString:](v13, "isEqualToString:", *(_QWORD *)(a2 + 8)))
    {
      objc_msgSend(v9, "removeAllObjects");
      v12 = 1;
    }
    else
    {
      v14 = NSClassFromString(v13);
      _UIAccessibilitySafeCategoryAddDependenciesToArray(v14, v9, v10, v11);
    }

  }
  objc_msgSend(v11, "removeAllObjects");

  return v12 & 1;
}

void _UIAccessibilitySafeCategoryAddDependenciesToArray(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "safeCategoryAddDependenciesToCollection:", v8);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v15, (_QWORD)v16) & 1) == 0
          && (objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  objc_msgSend(v10, "removeAllObjects");
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t class_addMethodsBulk()
{
  return MEMORY[0x24BEDCE48]();
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x24BEDCE70](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

uint64_t class_replaceMethodsBulk()
{
  return MEMORY[0x24BEDCEF0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x24BEDCF38](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x24BDAF3A0]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

