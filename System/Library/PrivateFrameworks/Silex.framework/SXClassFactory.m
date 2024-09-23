@implementation SXClassFactory

+ (id)valueClassBlockForBaseClass:(Class)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  Class v10;

  objc_msgSend((id)__registeredClasses, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SXClassFactory_valueClassBlockForBaseClass___block_invoke;
  v8[3] = &unk_24D689140;
  v9 = v4;
  v10 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x219A070A8](v8);

  return v6;
}

+ (Class)classForBaseClass:(Class)a3 type:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  Class v9;
  objc_class *v10;

  v5 = (void *)__registeredClasses;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "objectForKey:", v6);

  if (v8)
    v9 = (Class)v8;
  else
    v9 = a3;
  v10 = v9;

  return v10;
}

id __46__SXClassFactory_valueClassBlockForBaseClass___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = *(void **)(a1 + 40);
  v5 = v3;

  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__registeredClasses;
  __registeredClasses = v2;

  +[SXJSONActionClassRegister registerClasses](SXJSONActionClassRegister, "registerClasses");
  +[SXAdditionClassRegister registerClasses](SXAdditionClassRegister, "registerClasses");
  +[SXComponentAnimationClassRegister registerClasses](SXComponentAnimationClassRegister, "registerClasses");
  +[SXComponentBehaviorClassRegister registerClasses](SXComponentBehaviorClassRegister, "registerClasses");
  +[SXComponentStyleClassRegister registerClasses](SXComponentStyleClassRegister, "registerClasses");
  +[SXDataFormatClassRegister registerClasses](SXDataFormatClassRegister, "registerClasses");
  +[SXResourceClassRegister registerClasses](SXResourceClassRegister, "registerClasses");
}

+ (void)registerClass:(Class)a3 type:(id)a4 baseClass:(Class)a5
{
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend((id)__registeredClasses, "objectForKey:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__registeredClasses, "setObject:forKey:", v7, a5);
  }
  objc_msgSend(v7, "setObject:forKey:", a3, v8);

}

+ (void)startTesting
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)&__registeredClassesWhileTesting, (id)__registeredClasses);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__registeredClasses;
  __registeredClasses = v2;

}

+ (void)stopTesting
{
  void *v2;

  objc_storeStrong((id *)&__registeredClasses, (id)__registeredClassesWhileTesting);
  v2 = (void *)__registeredClassesWhileTesting;
  __registeredClassesWhileTesting = 0;

}

@end
