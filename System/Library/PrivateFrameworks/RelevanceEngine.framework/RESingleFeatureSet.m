@implementation RESingleFeatureSet

void __39___RESingleFeatureSet_initWithFeature___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithFeature__FeatureSetCache;
  initWithFeature__FeatureSetCache = v0;

  initWithFeature__Lock = 0;
}

@end
