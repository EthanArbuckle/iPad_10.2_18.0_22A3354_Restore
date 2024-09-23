@implementation INCodableDescription(Workflow)

- (Class)wf_contentItemClassForCustomObjectWithNamespace:()Workflow
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  Class v10;
  objc_class *v11;
  Class v12;
  NSString *v13;
  Class ClassPair;
  Class v15;
  id v16;
  id v17;
  void *v18;
  void (*v19)(void);
  objc_method *ClassMethod;
  const char *TypeEncoding;
  objc_class *Class;
  id v23;
  id v24;
  _QWORD aBlock[4];
  id v27;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "typeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@_%@"), v7, v4, v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  v10 = NSClassFromString(v9);
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&classRegistrationLock);
    v13 = objc_retainAutorelease(v9);
    ClassPair = objc_allocateClassPair(v5, -[NSString cStringUsingEncoding:](v13, "cStringUsingEncoding:", 4), 0);
    if (ClassPair)
    {
      v15 = ClassPair;
      v16 = a1;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__INCodableDescription_Workflow__wf_contentItemClassForCustomObjectWithNamespace___block_invoke;
      aBlock[3] = &unk_1E7AE9D80;
      v27 = v16;
      v17 = v16;
      v18 = _Block_copy(aBlock);
      v19 = imp_implementationWithBlock(v18);

      ClassMethod = class_getClassMethod(v5, sel_codableDescription);
      TypeEncoding = method_getTypeEncoding(ClassMethod);
      Class = object_getClass(v15);
      class_addMethod(Class, sel_codableDescription, v19, TypeEncoding);
      objc_registerClassPair(v15);
      os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock);
      v23 = (id)-[objc_class typeDescription](v15, "typeDescription");
      v24 = (id)-[objc_class properties](v15, "properties");
      v12 = v15;

      goto LABEL_6;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock);
    NSClassFromString(v13);
    v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
LABEL_6:

  return v12;
}

@end
