@implementation UIAccessibilitySafeCategory

+ (id)_initializeSafeCategoryFromValidationManager
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "safeCategoryTargetClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_installSafeCategoryOnClassNamed:isManaged:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_installSafeCategoryOnClassNamed:(id)a3 isManaged:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_installSafeCategoryOnClass:isManaged:", NSClassFromString((NSString *)a3), a4);
}

+ (id)_installSafeCategoryOnClass:(Class)a3 isManaged:(BOOL)a4
{
  void *v5;
  Method *v7;
  Method *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *Class;
  Method *v16;
  Method *v17;
  unsigned __int8 v18;
  __CFRunLoop *Main;
  void (*v20)(void *, void *);
  void *v21;
  void (*v22)(void);
  void *v23;
  void *v24;
  void *v25;
  unsigned int outCount;

  v5 = a3;
  if (!a3)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass((Class)a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Error installing %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  outCount = 0;
  v7 = class_copyMethodList((Class)a1, &outCount);
  v8 = v7;
  if (v7 && outCount)
  {
    v9 = 0;
    v10 = &unk_24C1C3DB8;
    do
    {
      if (method_getName(v8[v9]) == sel__accessibilityIgnoreSwiftInit)
      {
        objc_msgSend(v10, "arrayByAddingObject:", CFSTR("init"));
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v11;
      }
      ++v9;
    }
    while (v9 < outCount);
    objc_msgSend(a1, "_addCategoryMethods:count:excluding:toClass:isClass:", v8);

    goto LABEL_11;
  }
  if (v7)
LABEL_11:
    free(v8);
  Class = object_getClass(a1);
  v16 = class_copyMethodList(Class, &outCount);
  v17 = v16;
  if (v16 && outCount)
  {
    objc_msgSend(a1, "_addCategoryMethods:count:excluding:toClass:isClass:", v16, outCount, &unk_24C1C3DD0, object_getClass(v5), 1);
LABEL_16:
    free(v17);
    goto LABEL_17;
  }
  if (v16)
    goto LABEL_16;
LABEL_17:
  v14 = 0;
LABEL_18:
  v18 = atomic_load(_installSafeCategoryOnClass_isManaged__needsPost);
  if ((v18 & 1) != 0)
  {
    atomic_store(0, _installSafeCategoryOnClass_isManaged__needsPost);
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x24BDBD5A0], &__block_literal_global);
  }
  if (v14 && !a4)
  {
    if (v5)
    {
      NSStringFromClass((Class)v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void (*)(void *, void *))_UIAXReportSenderErrorLogger;
      if (_UIAXReportSenderErrorLogger)
      {
        NSStringFromClass((Class)a1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20(v5, v21);

      }
    }
    v22 = (void (*)(void))_UIAXValidationLogger;
    if (_UIAXValidationLogger)
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromClass((Class)a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("UIAccessibility Error installing %@ on %@.  %@ does not exist in runtime"), v24, v5, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22();

    }
  }
  return v14;
}

+ (void)_addCategoryMethods:(objc_method *)a3 count:(unsigned int)a4 excluding:(id)a5 toClass:(Class)a6 isClass:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v9;
  id v12;
  size_t v13;
  objc_class *Superclass;
  objc_class *v15;
  Class v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  const char *Name;
  uint64_t v22;
  unsigned int v23;
  NSString *v24;
  SEL v25;
  const char *TypeEncoding;
  objc_method *InstanceMethod;
  IMP Implementation;
  _BOOL4 v30;
  IMP v31;
  Class Class;
  unsigned int v33;
  objc_class *v34;
  uint64_t v35;
  SEL *v36;
  unint64_t i;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  id v42;
  _BOOL4 v43;
  objc_class *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  _BOOL4 v49;
  char *v50;
  char *v51;
  char *v52;
  Class v53;
  unsigned int v54;
  uint64_t v55;

  v7 = a7;
  v9 = *(_QWORD *)&a4;
  v55 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = 48 * v9;
  if (v9 > 0x55)
  {
    v48 = (char *)malloc_type_malloc(48 * v9, 0x6ED3E0E5uLL);
  }
  else
  {
    v48 = (char *)&v42 - ((v13 + 15) & 0x7FFFFFFFF0);
    bzero(v48, v13);
  }
  Superclass = class_getSuperclass((Class)a1);
  v15 = Superclass;
  if (Superclass)
  {
    v16 = class_getSuperclass(Superclass);
    v49 = v16 == (Class)objc_msgSend(a1, "safeCategoryBaseClass");
    if (!(_DWORD)v9)
      goto LABEL_33;
  }
  else
  {
    v49 = 0;
    if (!(_DWORD)v9)
      goto LABEL_33;
  }
  v44 = v15;
  v45 = v9;
  v42 = a1;
  v43 = v7;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = v9;
  v52 = &v48[24 * v9];
  v53 = a6;
  v51 = &v48[40 * v9];
  v46 = &v48[16 * v9];
  v47 = &v48[8 * v9];
  v50 = &v48[32 * v9];
  do
  {
    Name = method_getName(a3[v17]);
    if (objc_msgSend(v12, "count", v42))
    {
      v22 = 0;
      v23 = 1;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v22);
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        v25 = NSSelectorFromString(v24);

        if (Name == v25)
          break;
        v22 = v23;
        if (objc_msgSend(v12, "count") <= (unint64_t)v23++)
          goto LABEL_13;
      }
    }
    else
    {
LABEL_13:
      TypeEncoding = method_getTypeEncoding(a3[v17]);
      InstanceMethod = class_getInstanceMethod(v53, Name);
      if (InstanceMethod)
      {
        Implementation = method_getImplementation(InstanceMethod);
        v30 = v49;
        if (!Implementation)
          v30 = 0;
        if (v30)
        {
          *(_QWORD *)&v48[8 * v19] = Name;
          *(_QWORD *)&v47[8 * v19] = Implementation;
          *(_QWORD *)&v46[8 * v19++] = TypeEncoding;
        }
      }
      *(_QWORD *)&v52[8 * v18] = Name;
      v31 = method_getImplementation(a3[v17]);
      *(_QWORD *)&v50[8 * v18] = v31;
      *(_QWORD *)&v51[8 * v18++] = TypeEncoding;
    }
    ++v17;
  }
  while (v17 != v20);
  Class = v44;
  v33 = v45;
  v34 = v53;
  if (!v19)
  {
LABEL_29:
    if (!v18)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v43)
    Class = object_getClass(v44);
  if (Class)
  {
    v54 = 0;
    v35 = class_addMethodsBulk();
    if (v35)
    {
      v36 = (SEL *)v35;
      if (v54)
      {
        for (i = 0; i < v54; ++i)
        {
          NSStringFromClass(v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(v36[i]);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          _AXSafeCategoryLog(0, CFSTR("UIAccessibility Error adding method that already exists. It's likely this class is being installed as a safe category twice %@[%@ %@]"));

        }
      }
      free(v36);
      v33 = v45;
    }
    goto LABEL_29;
  }
  v39 = (objc_class *)objc_opt_class();
  NSStringFromClass(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _AXSafeCategoryLog(0, CFSTR("UIAccessibility Error unable to add %u methods to NULL superclass of %@"));

  if (v18)
LABEL_30:
    class_replaceMethodsBulk();
LABEL_31:
  if (v33 >= 0x56)
    free(v48);
LABEL_33:

}

void __69__UIAccessibilitySafeCategory__installSafeCategoryOnClass_isManaged___block_invoke()
{
  id v0;

  atomic_store(1u, _installSafeCategoryOnClass_isManaged__needsPost);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_AXClearIMPCachesNotification"), 0);

}

+ (id)safeCategoryTargetClassName
{
  return 0;
}

+ (Class)safeCategoryTargetClass
{
  NSString *v2;
  void *v3;

  objc_msgSend(a1, "safeCategoryTargetClassName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)_installSafeCategoryValidationMethod
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "safeCategoryTargetClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_installLocalValidationMethodOnClassNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_installLocalValidationMethodOnClassNamed:(id)a3
{
  NSString *v4;
  Class v5;
  Class v6;
  objc_class *Class;
  Method *v8;
  Method *v9;
  char v10;
  unint64_t v11;
  Method *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  unsigned int outCount;

  v4 = (NSString *)a3;
  v5 = NSClassFromString(v4);
  if (v5)
  {
    v6 = v5;
    outCount = 0;
    Class = object_getClass(a1);
    v8 = class_copyMethodList(Class, &outCount);
    v9 = v8;
    v10 = 0;
    if (v8 && outCount)
    {
      v11 = 0;
      v12 = v8;
      while (1)
      {
        if (!*v12)
        {
          free(v9);
          goto LABEL_17;
        }
        if (method_getName(*v12) == sel__accessibilityPerformValidations_)
          break;
        ++v11;
        ++v12;
        if (v11 >= outCount)
        {
          v10 = 0;
          goto LABEL_9;
        }
      }
      v10 = 1;
      objc_msgSend(a1, "_addCategoryMethods:count:excluding:toClass:isClass:", v12, 1, 0, object_getClass(v6), 1);
      if (!v9)
      {
LABEL_15:
        if ((v10 & 1) != 0)
          goto LABEL_16;
        goto LABEL_17;
      }
    }
    else
    {
LABEL_9:
      if (!v9)
        goto LABEL_15;
    }
    free(v9);
    if ((v10 & 1) != 0)
    {
LABEL_16:
      v15 = 0;
      goto LABEL_18;
    }
LABEL_17:
    v15 = CFSTR("No validation method found");
    goto LABEL_18;
  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass((Class)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Error installing %@ on %@.  %@ does not exist in runtime"), v14, v4, v4);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v15;
}

+ (void)_installSafeCategoryOnClassNamed:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a1, "_installSafeCategoryOnClassNamed:isManaged:", a3, 0);
}

@end
