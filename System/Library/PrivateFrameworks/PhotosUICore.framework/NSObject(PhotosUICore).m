@implementation NSObject(PhotosUICore)

+ (void)px_swizzleMethod:()PhotosUICore withMethod:
{
  objc_method *InstanceMethod;
  objc_method *v8;
  void (*MethodImplementation)(void);
  const char *TypeEncoding;
  void (*v11)(void);
  const char *v12;

  InstanceMethod = class_getInstanceMethod(a1, name);
  v8 = class_getInstanceMethod(a1, a4);
  MethodImplementation = class_getMethodImplementation(a1, name);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  if (class_addMethod(a1, name, MethodImplementation, TypeEncoding))
    InstanceMethod = class_getInstanceMethod(a1, name);
  v11 = class_getMethodImplementation(a1, a4);
  v12 = method_getTypeEncoding(v8);
  if (class_addMethod(a1, a4, v11, v12))
    v8 = class_getInstanceMethod(a1, a4);
  method_exchangeImplementations(InstanceMethod, v8);
}

+ (void)px_swizzleClassMethod:()PhotosUICore withMethod:
{
  objc_method *ClassMethod;
  objc_method *v8;
  objc_class *Class;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void (*v12)(void);
  const char *v13;

  ClassMethod = class_getClassMethod(a1, name);
  v8 = class_getClassMethod(a1, a4);
  Class = object_getClass(a1);
  Implementation = method_getImplementation(v8);
  TypeEncoding = method_getTypeEncoding(v8);
  if (class_addMethod(Class, name, Implementation, TypeEncoding))
  {
    v12 = method_getImplementation(ClassMethod);
    v13 = method_getTypeEncoding(ClassMethod);
    class_replaceMethod(Class, a4, v12, v13);
  }
  else
  {
    method_exchangeImplementations(ClassMethod, v8);
  }
}

+ (void)px_swizzleOnceAsSubclassOfClass:()PhotosUICore context:usingBlock:
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, _QWORD);

  v18 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+PhotosUICore.m"), 43, CFSTR("not on the main thread"));

  }
  if ((PLIsPhotosAppAnyPlatform() & 1) == 0
    && (PLIsPhotoPicker() & 1) == 0
    && (PLIsCamera() & 1) == 0
    && (PLIsPhotosMessagesApp() & 1) == 0)
  {
    if (a1 == a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+PhotosUICore.m"), 50, CFSTR("%@ is already the root class"), a1);

    }
    v9 = a1;
    while ((void *)objc_msgSend(v9, "superclass") != a3)
    {
      v9 = (void *)objc_msgSend(v9, "superclass");
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+PhotosUICore.m"), 55, CFSTR("%@ isn't a descendant of %@"), a1, a3);

        abort();
      }
    }
    a3 = v9;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext;
  if (!px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext;
    px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext = v13;

    v12 = (void *)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)px_swizzleOnceAsSubclassOfClass_context_usingBlock__preparedClassesByContext, "setObject:forKeyedSubscript:", v15, v11);
  }
  if ((objc_msgSend(v15, "containsObject:", a3) & 1) == 0)
  {
    objc_msgSend(v15, "addObject:", a3);
    ((void (**)(id, void *))v18)[2](v18, a3);
  }

}

+ (void)px_enumeratePropertiesUsingBlock:()PhotosUICore
{
  void (**v4)(id, void *, Class, _QWORD);
  objc_property_t *v5;
  objc_property_t *v6;
  unint64_t i;
  objc_property *v8;
  void *v9;
  void *v10;
  void *v11;
  Class v12;
  NSString *v13;
  int v14;
  NSString *v15;
  void *v16;
  id v17;
  unsigned int outCount;

  v4 = a3;
  outCount = 0;
  v5 = class_copyPropertyList(a1, &outCount);
  if (v5)
  {
    v6 = v5;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v8 = v6[i];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getAttributes(v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        v13 = 0;
        if (objc_msgSend(v11, "scanString:intoString:", CFSTR("T@\"), 0))
        {
          v17 = 0;
          v14 = objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("\"), &v17);
          v15 = (NSString *)v17;
          v13 = v15;
          if (v14)
            v12 = NSClassFromString(v15);
          else
            v12 = 0;
        }
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v9, v12, objc_msgSend(v16, "containsObject:", CFSTR("R")));

      }
    }
    free(v6);
  }

}

@end
