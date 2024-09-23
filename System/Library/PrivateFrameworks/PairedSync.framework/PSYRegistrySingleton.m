@implementation PSYRegistrySingleton

+ (id)registry
{
  if (registry_onceToken != -1)
    dispatch_once(&registry_onceToken, &__block_literal_global);
  return (id)registry_singleton;
}

void __32__PSYRegistrySingleton_registry__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE6E638]);
  v1 = (void *)registry_singleton;
  registry_singleton = (uint64_t)v0;

}

+ (void)addDelegate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addDelegate:", v3);

  if ((objc_msgSend(v4, "started") & 1) == 0)
    objc_msgSend(v4, "start");

}

@end
