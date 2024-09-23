@implementation _REEmptyFeatureSet

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return 0;
}

- (unint64_t)count
{
  return 0;
}

- (_REEmptyFeatureSet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_REEmptyFeatureSet;
  return -[REFeatureSet init](&v3, sel_init);
}

- (id)featureWithName:(id)a3
{
  return 0;
}

- (BOOL)containsFeature:(id)a3
{
  return 0;
}

- (id)allFeatures
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
