@implementation SXTextTangierApplicationDelegate

+ (void)setup
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SXTextTangierApplicationDelegate_setup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, block);
}

void __41__SXTextTangierApplicationDelegate_setup__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)__applicationDelegate;
  __applicationDelegate = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BEB3AD8], "setSurrogateDelegate:", __applicationDelegate);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD0B58];
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x24BDD0B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1448]);
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v4);

  }
}

- (id)createCompatibilityDelegate
{
  return 0;
}

@end
