@implementation BAXSafeCategory

+ (id)baxTargetClassName
{
  return 0;
}

+ (Class)baxTargetClass
{
  NSString *v2;
  Class v3;
  void *v4;

  v2 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baxTargetClassName"));
  v3 = NSClassFromString(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (Class)v4;
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(BAXSafeCategory, a2);
}

+ (void)_baxInitializeSafeCategory
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baxTargetClassName"));
  objc_msgSend(a1, "_baxInstallSafeCategoryOnClassNamed:", v3);

}

+ (void)_baxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
{
  _BOOL4 v5;
  const char *Name;
  objc_method *InstanceMethod;
  objc_method *v11;
  void (*Implementation)(void);
  void (*v13)(void);
  const char *TypeEncoding;
  void (*v15)(void);
  objc_class *Superclass;
  Class Class;
  Class v18;
  const char *v19;

  v5 = a5;
  Name = method_getName(a3);
  InstanceMethod = class_getInstanceMethod(a4, Name);
  v11 = InstanceMethod;
  if (InstanceMethod)
    Implementation = method_getImplementation(InstanceMethod);
  else
    Implementation = 0;
  v13 = method_getImplementation(a3);
  TypeEncoding = method_getTypeEncoding(a3);
  if (!class_addMethod(a4, Name, v13, TypeEncoding))
  {
    v15 = method_getImplementation(a3);
    method_setImplementation(v11, v15);
  }
  if (v11)
  {
    if (Implementation)
    {
      Superclass = class_getSuperclass((Class)a1);
      if (Superclass)
      {
        Class = Superclass;
        v18 = class_getSuperclass(Superclass);
        if (v18 == objc_msgSend(a1, "baxBaseSafeCategoryClass"))
        {
          if (v5)
            Class = object_getClass(Class);
          v19 = method_getTypeEncoding(v11);
          class_addMethod(Class, Name, Implementation, v19);
          if (qword_271D8 != -1)
            dispatch_once(&qword_271D8, &stru_209C8);
        }
      }
    }
  }
}

+ (void)_baxInstallSafeCategoryOnClassNamed:(id)a3
{
  Class v4;
  Class v5;

  v4 = NSClassFromString((NSString *)a3);
  v5 = v4;
  if (qword_271D8 == -1)
  {
    if (!v4)
      return;
    goto LABEL_3;
  }
  dispatch_once(&qword_271D8, &stru_209C8);
  if (v5)
LABEL_3:
    objc_msgSend(a1, "_baxInstallSafeCategoryOnClass:", v5);
}

+ (void)_baxInstallSafeCategoryOnClass:(Class)a3
{
  Protocol **v5;
  Protocol **v6;
  unint64_t i;
  Method *v8;
  Method *v9;
  unint64_t j;
  Method v11;
  objc_class *Class;
  Method *v13;
  Method *v14;
  unint64_t k;
  objc_method *v16;
  unsigned int v17;
  unsigned int outCount;

  if (a3)
  {
    outCount = 0;
    v5 = class_copyProtocolList((Class)a1, &outCount);
    if (v5)
    {
      v6 = v5;
      if (outCount)
      {
        for (i = 0; i < outCount; ++i)
        {
          class_addProtocol(a3, v6[i]);
          if (qword_271D8 != -1)
            dispatch_once(&qword_271D8, &stru_209C8);
        }
      }
      free(v6);
    }
    v17 = 0;
    v8 = class_copyMethodList((Class)a1, &v17);
    if (v8)
    {
      v9 = v8;
      if (v17)
      {
        for (j = 0; j < v17; ++j)
        {
          v11 = v9[j];
          if (!v11)
            break;
          objc_msgSend(a1, "_baxAddCategoryMethod:toClass:isClass:", v11, a3, 0);
        }
      }
      free(v9);
    }
    Class = object_getClass(a1);
    v13 = class_copyMethodList(Class, &v17);
    if (v13)
    {
      v14 = v13;
      if (v17)
      {
        for (k = 0; k < v17; ++k)
        {
          v16 = v14[k];
          if (!v16)
            break;
          if (method_getName(v16) != "load")
            objc_msgSend(a1, "_baxAddCategoryMethod:toClass:isClass:", v14[k], object_getClass(a3), 1);
        }
      }
      free(v14);
    }
  }
}

@end
