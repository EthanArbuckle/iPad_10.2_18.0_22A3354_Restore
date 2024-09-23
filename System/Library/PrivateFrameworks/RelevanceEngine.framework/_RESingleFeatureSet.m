@implementation _RESingleFeatureSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

- (unint64_t)count
{
  return 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;

  if (a3->var0)
    return 0;
  result = 1;
  a3->var0 = 1;
  a3->var1 = (id *)&self->_feature;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__mutation_value;
  return result;
}

- (BOOL)containsFeature:(id)a3
{
  REFeature *feature;

  feature = self->_feature;
  return feature == a3 || -[REFeature isEqual:](feature, "isEqual:");
}

- (id)allFeatures
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_feature;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_RESingleFeatureSet)initWithFeature:(id)a3
{
  id v5;
  void *v6;
  _RESingleFeatureSet *v7;
  _RESingleFeatureSet *v8;
  _RESingleFeatureSet *v9;
  _RESingleFeatureSet *v10;
  objc_super v12;

  v5 = a3;
  if (initWithFeature__onceToken != -1)
    dispatch_once(&initWithFeature__onceToken, &__block_literal_global_39);
  os_unfair_lock_lock((os_unfair_lock_t)&initWithFeature__Lock);
  objc_msgSend((id)initWithFeature__FeatureSetCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&initWithFeature__Lock);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_RESingleFeatureSet;
    v8 = -[REFeatureSet init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_feature, a3);
      os_unfair_lock_lock((os_unfair_lock_t)&initWithFeature__Lock);
      objc_msgSend((id)initWithFeature__FeatureSetCache, "setObject:forKey:", v9, v5);
      os_unfair_lock_unlock((os_unfair_lock_t)&initWithFeature__Lock);
    }
    v7 = v9;
    self = v7;
  }
  v10 = v7;

  return v10;
}

- (_RESingleFeatureSet)initWithFeatures:(id)a3
{
  void *v4;
  _RESingleFeatureSet *v5;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_RESingleFeatureSet initWithFeature:](self, "initWithFeature:", v4);

  return v5;
}

- (_RESingleFeatureSet)init
{
  return -[_RESingleFeatureSet initWithFeature:](self, "initWithFeature:", 0);
}

- (id)featureWithName:(id)a3
{
  REFeature *feature;
  id v5;
  void *v6;
  int v7;
  REFeature *v8;

  feature = self->_feature;
  v5 = a3;
  -[REFeature name](feature, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if (v7)
    v8 = self->_feature;
  else
    v8 = 0;
  return v8;
}

@end
