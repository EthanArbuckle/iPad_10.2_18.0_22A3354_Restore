@implementation PLGlobalKeyValueAnyTransformer

+ (id)allowedTopLevelClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PLGlobalKeyValueAnyTransformer;
  objc_msgSendSuper2(&v8, sel_allowedTopLevelClasses);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGlobalKeyValue allDecodeClasses](PLGlobalKeyValue, "allDecodeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
