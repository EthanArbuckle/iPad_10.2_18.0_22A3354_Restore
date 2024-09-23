@implementation IMAccessibilitySafeCategory

+ (id)imaxTargetClassName
{
  return 0;
}

+ (Class)imaxTargetClass
{
  NSString *v2;
  Class v3;
  void *v4;

  v2 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imaxTargetClassName"));
  v3 = NSClassFromString(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (Class)v4;
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

+ (void)_imaxInitializeSafeCategory
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imaxTargetClassName"));
  objc_msgSend(a1, "_imaxInstallSafeCategoryOnClassNamed:", v3);

}

+ (void)_imaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
  BOOL v20;
  char v21;
  int v22;
  const __CFString *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;

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
        if (v18 == objc_msgSend(a1, "imaxBaseSafeCategoryClass"))
        {
          if (v5)
            Class = object_getClass(Class);
          v19 = method_getTypeEncoding(v11);
          v20 = class_addMethod(Class, Name, Implementation, v19);
          if (qword_311308 != -1)
            dispatch_once(&qword_311308, &stru_291A08);
          if (byte_311300)
            v21 = v20;
          else
            v21 = 1;
          if ((v21 & 1) == 0)
          {
            if (qword_311318 != -1)
              dispatch_once(&qword_311318, &stru_291A28);
            v22 = byte_311310;
            if (v5)
              v23 = CFSTR("+");
            else
              v23 = CFSTR("-");
            v24 = NSStringFromClass(a4);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            v26 = NSStringFromSelector(Name);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v26);
            v32 = __IMAccessibilityHandleValidationErrorWithDescription(v22, 1, CFSTR("Failed adding %@[%@ %@]"), v27, v28, v29, v30, v31, (uint64_t)v23);

            if (v32)
              abort();
          }
        }
      }
    }
  }
}

+ (void)_imaxInstallSafeCategoryOnClassNamed:(id)a3
{
  Class v4;
  BOOL v5;
  int v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSString *v15;

  v15 = (NSString *)a3;
  v4 = NSClassFromString(v15);
  if (qword_311308 != -1)
    dispatch_once(&qword_311308, &stru_291A08);
  if (byte_311300)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    if (qword_311318 != -1)
      dispatch_once(&qword_311318, &stru_291A28);
    v6 = byte_311310;
    v7 = NSStringFromClass((Class)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v14 = __IMAccessibilityHandleValidationErrorWithDescription(v6, 1, CFSTR("Failed installing %@ on %@. %@ does not exist in runtime."), v9, v10, v11, v12, v13, (uint64_t)v8);

    if (v14)
      abort();
  }
  else if (v4)
  {
    objc_msgSend(a1, "_imaxInstallSafeCategoryOnClass:", v4);
  }

}

+ (void)_imaxInstallSafeCategoryOnClass:(Class)a3
{
  Protocol **v5;
  Protocol **v6;
  unint64_t v7;
  uint64_t *v8;
  Protocol *v9;
  BOOL v10;
  char v11;
  int v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  Method *v24;
  Method *v25;
  unint64_t i;
  Method v27;
  objc_class *Class;
  Method *v29;
  Method *v30;
  unint64_t j;
  objc_method *v32;
  void *v33;
  unsigned int v34;
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
        v7 = 0;
        v8 = &qword_311000;
        do
        {
          v9 = v6[v7];
          v10 = class_addProtocol(a3, v9);
          if (v8[97] != -1)
            dispatch_once(&qword_311308, &stru_291A08);
          if (byte_311300)
            v11 = v10;
          else
            v11 = 1;
          if ((v11 & 1) == 0)
          {
            if (qword_311318 != -1)
              dispatch_once(&qword_311318, &stru_291A28);
            v12 = byte_311310;
            v13 = NSStringFromProtocol(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
            v15 = NSStringFromClass((Class)a1);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            v17 = NSStringFromClass(a3);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v17);
            v23 = __IMAccessibilityHandleValidationErrorWithDescription(v12, 1, CFSTR("Failed adding protocol %@ from safe category %@ to target class %@."), v18, v19, v20, v21, v22, (uint64_t)v14);

            v8 = &qword_311000;
            if (v23)
              abort();
          }

          ++v7;
        }
        while (v7 < outCount);
      }
      free(v6);
    }
    v34 = 0;
    v24 = class_copyMethodList((Class)a1, &v34);
    if (v24)
    {
      v25 = v24;
      if (v34)
      {
        for (i = 0; i < v34; ++i)
        {
          v27 = v25[i];
          if (!v27)
            break;
          objc_msgSend(a1, "_imaxAddCategoryMethod:toClass:isClass:", v27, a3, 0);
        }
      }
      free(v25);
    }
    Class = object_getClass(a1);
    v29 = class_copyMethodList(Class, &v34);
    if (v29)
    {
      v30 = v29;
      if (v34)
      {
        for (j = 0; j < v34; ++j)
        {
          v32 = v30[j];
          if (!v32)
            break;
          if (method_getName(v32) != "load")
            objc_msgSend(a1, "_imaxAddCategoryMethod:toClass:isClass:", v30[j], object_getClass(a3), 1);
        }
      }
      free(v30);
    }
  }
}

@end
