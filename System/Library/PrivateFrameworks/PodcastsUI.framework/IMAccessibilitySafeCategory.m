@implementation IMAccessibilitySafeCategory

+ (void)installCategoryOnClassNamed:(id)a3
{
  NSString *v4;
  Class v5;
  Class v6;
  Method *v7;
  Method *v8;
  unint64_t i;
  Method v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *Class;
  Method *v15;
  Method *v16;
  unint64_t j;
  objc_method *v18;
  unsigned int outCount;

  v4 = (NSString *)a3;
  v5 = NSClassFromString(v4);
  if (!v5)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("UIAccessibility Error installing %@ on %@.  %@ does not exist in runtime."), v12, v4, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v6 = v5;
  outCount = 0;
  v7 = class_copyMethodList((Class)a1, &outCount);
  v8 = v7;
  if (v7 && outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v10 = v8[i];
      if (!v10)
        break;
      objc_msgSend(a1, "_addCategoryMethod:toClass:isClass:", v10, v6, 0);
    }
  }
  else if (!v7)
  {
    goto LABEL_11;
  }
  free(v8);
LABEL_11:
  Class = object_getClass(a1);
  v15 = class_copyMethodList(Class, &outCount);
  v16 = v15;
  if (v15 && outCount)
  {
    for (j = 0; j < outCount; ++j)
    {
      v18 = v16[j];
      if (!v18)
        break;
      if (method_getName(v18) != sel_load)
        objc_msgSend(a1, "_addCategoryMethod:toClass:isClass:", v16[j], object_getClass(v6), 1);
    }
    goto LABEL_20;
  }
  if (v15)
LABEL_20:
    free(v16);
LABEL_21:

}

+ (void)_addCategoryMethod:(objc_method *)a3 toClass:(Class)a4 isClass:(BOOL)a5
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
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;

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
        if (v18 == (Class)objc_opt_class())
        {
          if (v5)
            Class = object_getClass(Class);
          v19 = method_getTypeEncoding(v11);
          if (!class_addMethod(Class, Name, Implementation, v19))
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            if (v5)
              v21 = CFSTR("+");
            else
              v21 = CFSTR("-");
            NSStringFromClass(a4);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(Name);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("UIAccessibility Error adding %@[%@ %@]"), v21, v22, v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
      }
    }
  }
}

@end
