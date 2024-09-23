@implementation CRLAccessibilitySafeCategory

+ (id)crlaxTargetClassName
{
  return 0;
}

+ (Class)crlaxTargetClass
{
  return NSClassFromString((NSString *)objc_msgSend(a1, "crlaxTargetClassName"));
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (void)_crlaxInitializeSafeCategory
{
  _objc_msgSend(a1, "_crlaxInstallSafeCategoryOnClassNamed:", objc_msgSend(a1, "crlaxTargetClassName"));
}

+ (void)_crlaxAddCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
        if (v18 == objc_msgSend(a1, "crlaxBaseSafeCategoryClass"))
        {
          if (v5)
            Class = object_getClass(Class);
          v19 = method_getTypeEncoding(v11);
          v20 = class_addMethod(Class, Name, Implementation, v19);
          if (qword_101414E18 != -1)
            dispatch_once(&qword_101414E18, &stru_101238640);
          if (byte_101414E10)
            v21 = v20;
          else
            v21 = 1;
          if ((v21 & 1) == 0)
          {
            if (qword_101414E28 != -1)
              dispatch_once(&qword_101414E28, &stru_101238660);
            v22 = byte_101414E20;
            if (v5)
              v23 = CFSTR("+");
            else
              v23 = CFSTR("-");
            NSStringFromClass(a4);
            NSStringFromSelector(Name);
            if (__CRLAccessibilityHandleValidationErrorWithDescription(v22, 1, (uint64_t)CFSTR("Failed adding %@[%@ %@]"), v24, v25, v26, v27, v28, (uint64_t)v23))abort();
          }
        }
      }
    }
  }
}

+ (void)_crlaxInstallSafeCategoryOnClassNamed:(id)a3
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
  if (qword_101414E18 != -1)
    dispatch_once(&qword_101414E18, &stru_101238640);
  if (byte_101414E10)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    if (qword_101414E28 != -1)
      dispatch_once(&qword_101414E28, &stru_101238660);
    v6 = byte_101414E20;
    v7 = NSStringFromClass((Class)a1);
    if (__CRLAccessibilityHandleValidationErrorWithDescription(v6, 1, (uint64_t)CFSTR("Failed installing %@ on %@. %@ does not exist in runtime."), v8, v9, v10, v11, v12, (uint64_t)v7))abort();
  }
  else if (v4)
  {
    objc_msgSend(a1, "_crlaxInstallSafeCategoryOnClass:", v4);
  }
}

+ (void)_crlaxInstallSafeCategoryOnClass:(Class)a3
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
  SEL v18;
  SEL v19;
  Method *v20;
  Method *v21;
  uint64_t v22;
  objc_method *v23;
  SEL Name;
  objc_class *Class;
  Method *v27;
  Method *v28;
  uint64_t v29;
  objc_method *v30;
  unsigned int v31;
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
          if (qword_101414E18 != -1)
            dispatch_once(&qword_101414E18, &stru_101238640);
          if (byte_101414E10)
            v10 = v9;
          else
            v10 = 1;
          if ((v10 & 1) == 0)
          {
            if (qword_101414E28 != -1)
              dispatch_once(&qword_101414E28, &stru_101238660);
            v11 = byte_101414E20;
            v12 = NSStringFromProtocol(v8);
            NSStringFromClass((Class)a1);
            NSStringFromClass(a3);
            if (__CRLAccessibilityHandleValidationErrorWithDescription(v11, 1, (uint64_t)CFSTR("Failed adding protocol %@ from safe category %@ to target class %@."), v13, v14, v15, v16, v17, (uint64_t)v12))abort();
          }
        }
      }
      free(v6);
    }
    v18 = NSSelectorFromString(CFSTR(".cxx_destruct"));
    v19 = NSSelectorFromString(CFSTR(".cxx_construct"));
    v31 = 0;
    v20 = class_copyMethodList((Class)a1, &v31);
    if (v20)
    {
      v21 = v20;
      if (v31)
      {
        v22 = 0;
        do
        {
          v23 = v21[v22];
          if (!v23)
            break;
          Name = method_getName(v23);
          if (Name != v18 && Name != v19)
            objc_msgSend(a1, "_crlaxAddCategoryMethod:toClass:isClass:", v21[v22], a3, 0);
          ++v22;
        }
        while (v22 < v31);
      }
      free(v21);
    }
    Class = object_getClass(a1);
    v27 = class_copyMethodList(Class, &v31);
    if (v27)
    {
      v28 = v27;
      if (v31)
      {
        v29 = 0;
        do
        {
          v30 = v28[v29];
          if (!v30)
            break;
          if (method_getName(v30) != "load")
            objc_msgSend(a1, "_crlaxAddCategoryMethod:toClass:isClass:", v28[v29], object_getClass(a3), 1);
          ++v29;
        }
        while (v29 < v31);
      }
      free(v28);
    }
  }
}

@end
