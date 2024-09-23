@implementation LNEntityMetadata(Strings)

+ (id)wf_descriptionClassForEntityType:()Strings appBundleIdentifier:
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = wf_descriptionClassForEntityType_appBundleIdentifier__token;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&wf_descriptionClassForEntityType_appBundleIdentifier__token, &__block_literal_global_16779);
  objc_msgSend((id)wf_descriptionClassForEntityType_appBundleIdentifier__descriptionClassForEntityTypeByAppBundleIdentifier, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)wf_addDescriptionMethodsToClass:()Strings withEntityType:appBundleIdentifier:
{
  id v8;
  id v9;
  objc_class *Class;
  void *v11;
  objc_class *v12;
  Method *v13;
  Method *v14;
  uint64_t v15;
  _BOOL8 v16;
  Method *v17;
  const char *Name;
  void (*Implementation)(void);
  const char *TypeEncoding;
  unsigned int outCount;

  v8 = a4;
  v9 = a5;
  Class = object_getClass(a3);
  v11 = (void *)objc_msgSend(a1, "wf_descriptionClassForEntityType:appBundleIdentifier:", v8, v9);
  if (v11)
  {
    v12 = object_getClass(v11);
    outCount = 0;
    v13 = class_copyMethodList(v12, &outCount);
    v14 = v13;
    v15 = outCount;
    if (outCount)
    {
      LOBYTE(v16) = 1;
      v17 = v13;
      do
      {
        if (v16)
        {
          Name = method_getName(*v17);
          Implementation = method_getImplementation(*v17);
          TypeEncoding = method_getTypeEncoding(*v17);
          v16 = class_addMethod(Class, Name, Implementation, TypeEncoding);
          v15 = outCount;
        }
        else
        {
          v16 = 0;
        }
        ++v17;
      }
      while (v17 != &v14[v15]);
    }
    else
    {
      v16 = 1;
    }
    free(v14);
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

@end
