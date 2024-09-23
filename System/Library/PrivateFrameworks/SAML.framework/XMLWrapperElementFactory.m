@implementation XMLWrapperElementFactory

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__XMLWrapperElementFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_factory;
}

void __42__XMLWrapperElementFactory_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_factory;
  sharedInstance_factory = (uint64_t)v1;

}

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3 = (void *)sClassMap;
    sClassMap = (uint64_t)v2;

    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = (void *)sTypeMap;
    sTypeMap = (uint64_t)v4;

    +[XMLWrapperElementFactory registerClass:forElementName:](XMLWrapperElementFactory, "registerClass:forElementName:", objc_opt_class(), CFSTR("DefaultElementClass"));
  }
}

+ (void)registerClass:(Class)a3 forElementName:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v8 = v5;
    v7 = objc_msgSend(v5, "length");
    v6 = v8;
    if (v7)
    {
      objc_msgSend((id)sClassMap, "setObject:forKey:", a3, v8);
      v6 = v8;
    }
  }

}

- (Class)classForXMLNode:(_xmlNode *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (!a3->name
    || (v5 = (void *)objc_opt_class(),
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->name),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (void *)objc_msgSend(v5, "elementClassByTagName:", v6),
        v6,
        !v7))
  {
    v7 = (void *)objc_msgSend((id)objc_opt_class(), "elementClassByTagName:", CFSTR("DefaultElementClass"));
  }
  return (Class)v7;
}

+ (Class)elementClassByTagName:(id)a3
{
  return (Class)objc_msgSend((id)sClassMap, "objectForKeyedSubscript:", a3);
}

+ (unint64_t)elementTypeByTagName:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)sTypeMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

@end
