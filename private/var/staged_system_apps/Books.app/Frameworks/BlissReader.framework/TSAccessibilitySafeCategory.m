@implementation TSAccessibilitySafeCategory

+ (id)tsaxTargetClassName
{
  return 0;
}

+ (Class)tsaxTargetClass
{
  return NSClassFromString((NSString *)objc_msgSend(a1, "tsaxTargetClassName"));
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (void)_tsaxInitializeSafeCategory
{
  objc_msgSend(a1, "_tsaxInstallSafeCategoryOnClassNamed:", objc_msgSend(a1, "tsaxTargetClassName"));
}

+ (void)_tsaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

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
        if (v18 == objc_msgSend(a1, "tsaxBaseSafeCategoryClass"))
        {
          if (v5)
            Class = object_getClass(Class);
          v19 = method_getTypeEncoding(v11);
          v20 = class_addMethod(Class, Name, Implementation, v19);
          if (qword_543800 != -1)
            dispatch_once(&qword_543800, &stru_43B7B0);
          if (byte_5437F8)
            v21 = v20;
          else
            v21 = 1;
          if ((v21 & 1) == 0)
          {
            if (qword_543810 != -1)
              dispatch_once(&qword_543810, &stru_43B7D0);
            v22 = byte_543808;
            if (v5)
              v23 = CFSTR("+");
            else
              v23 = CFSTR("-");
            NSStringFromClass(a4);
            NSStringFromSelector(Name);
            if (__TSAccessibilityHandleValidationErrorWithDescription(v22, 1, (uint64_t)CFSTR("Failed adding %@[%@ %@]"), v24, v25, v26, v27, v28, (uint64_t)v23))abort();
          }
        }
      }
    }
  }
}

+ (void)_tsaxInstallSafeCategoryOnClassNamed:(id)a3
{
  Class v4;
  BOOL v5;
  int v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = NSClassFromString((NSString *)a3);
  if (qword_543800 != -1)
    dispatch_once(&qword_543800, &stru_43B7B0);
  if (byte_5437F8)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    if (qword_543810 != -1)
      dispatch_once(&qword_543810, &stru_43B7D0);
    v6 = byte_543808;
    v7 = NSStringFromClass((Class)a1);
    if (__TSAccessibilityHandleValidationErrorWithDescription(v6, 1, (uint64_t)CFSTR("Failed installing %@ on %@. %@ does not exist in runtime."), v8, v9, v10, v11, v12, (uint64_t)v7))abort();
  }
  else if (v4)
  {
    objc_msgSend(a1, "_tsaxInstallSafeCategoryOnClass:", v4);
  }
}

+ (void)_tsaxInstallSafeCategoryOnClass:(Class)a3
{
  Protocol **v5;
  Protocol **v6;
  unint64_t i;
  Protocol *v8;
  BOOL v9;
  char v10;
  int v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Method *v18;
  Method *v19;
  unint64_t j;
  Method v21;
  objc_class *Class;
  Method *v23;
  Method *v24;
  unint64_t k;
  objc_method *v26;
  unsigned int v27;
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
          v8 = v6[i];
          v9 = class_addProtocol(a3, v8);
          if (qword_543800 != -1)
            dispatch_once(&qword_543800, &stru_43B7B0);
          if (byte_5437F8)
            v10 = v9;
          else
            v10 = 1;
          if ((v10 & 1) == 0)
          {
            if (qword_543810 != -1)
              dispatch_once(&qword_543810, &stru_43B7D0);
            v11 = byte_543808;
            v12 = NSStringFromProtocol(v8);
            NSStringFromClass((Class)a1);
            NSStringFromClass(a3);
            if (__TSAccessibilityHandleValidationErrorWithDescription(v11, 1, (uint64_t)CFSTR("Failed adding protocol %@ from safe category %@ to target class %@."), v13, v14, v15, v16, v17, (uint64_t)v12))abort();
          }
        }
      }
      free(v6);
    }
    v27 = 0;
    v18 = class_copyMethodList((Class)a1, &v27);
    if (v18)
    {
      v19 = v18;
      if (v27)
      {
        for (j = 0; j < v27; ++j)
        {
          v21 = v19[j];
          if (!v21)
            break;
          objc_msgSend(a1, "_tsaxAddCategoryMethod:toClass:isClass:", v21, a3, 0);
        }
      }
      free(v19);
    }
    Class = object_getClass(a1);
    v23 = class_copyMethodList(Class, &v27);
    if (v23)
    {
      v24 = v23;
      if (v27)
      {
        for (k = 0; k < v27; ++k)
        {
          v26 = v24[k];
          if (!v26)
            break;
          if (method_getName(v26) != "load")
            objc_msgSend(a1, "_tsaxAddCategoryMethod:toClass:isClass:", v24[k], object_getClass(a3), 1);
        }
      }
      free(v24);
    }
  }
}

@end
