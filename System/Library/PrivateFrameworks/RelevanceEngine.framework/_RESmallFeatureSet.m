@implementation _RESmallFeatureSet

- (_RESmallFeatureSet)initWithFeatures:(id)a3
{
  id v4;
  _RESmallFeatureSet *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  REFeature *v9;
  uint64_t v10;
  REFeature **features;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_RESmallFeatureSet;
  v5 = -[REFeatureSet init](&v14, sel_init);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    while (v7 < objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_features[v7];
      v5->_features[v7] = (REFeature *)v8;

      ++v7;
      v6 -= 8;
      if (v7 == 3)
        goto LABEL_9;
    }
    if (v7 <= 2)
    {
      v10 = -v6;
      features = v5->_features;
      do
      {
        v12 = *(REFeature **)((char *)features + v10);
        *(REFeature **)((char *)features + v10) = 0;

        v10 += 8;
      }
      while (v10 != 24);
    }
  }
LABEL_9:

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
    return 0;
  a3->var0 = 1;
  a3->var1 = (id *)self->_features;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__mutation_value_55;
  return -[_RESmallFeatureSet count](self, "count");
}

- (unint64_t)count
{
  unint64_t result;
  REFeature **features;

  result = 0;
  features = self->_features;
  do
  {
    if (!features[result])
      break;
    ++result;
  }
  while (result != 3);
  return result;
}

- (id)allFeatures
{
  void *v3;
  uint64_t v4;
  REFeature **features;
  REFeature *v6;
  REFeature *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  features = self->_features;
  do
  {
    v6 = features[v4];
    if (!v6)
      break;
    v7 = v6;
    objc_msgSend(v3, "addObject:", v6);

    ++v4;
  }
  while (v4 != 3);
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (void).cxx_destruct
{
  REFeature **features;
  uint64_t i;

  features = self->_features;
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&features[i], 0);
}

- (_RESmallFeatureSet)init
{
  return -[_RESmallFeatureSet initWithFeatures:](self, "initWithFeatures:", MEMORY[0x24BDBD1A8]);
}

- (_RESmallFeatureSet)initWithFeature:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _RESmallFeatureSet *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_RESmallFeatureSet initWithFeatures:](self, "initWithFeatures:", v6, v9, v10);
  return v7;
}

- (id)featureWithName:(id)a3
{
  id v4;
  uint64_t v5;
  REFeature **features;
  REFeature *v7;
  REFeature *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = 0;
  features = self->_features;
  while (1)
  {
    v7 = features[v5];
    v8 = v7;
    if (!v7)
      break;
    -[REFeature name](v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

    if ((v10 & 1) != 0)
      break;

    if (++v5 == 3)
    {
      v8 = 0;
      break;
    }
  }

  return v8;
}

- (BOOL)containsFeature:(id)a3
{
  REFeature *v4;
  uint64_t v5;
  REFeature **features;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  BOOL v11;

  v4 = (REFeature *)a3;
  v5 = 0;
  features = self->_features;
  while (1)
  {
    v7 = features[v5];
    if (!v7)
    {
LABEL_6:
      v11 = 0;
      goto LABEL_9;
    }
    v8 = v7;
    if (v8 == v4)
      break;
    v9 = v8;
    v10 = -[REFeature isEqual:](v8, "isEqual:", v4);

    if (v10)
      goto LABEL_8;

    if (++v5 == 3)
      goto LABEL_6;
  }

  v9 = v4;
LABEL_8:

  v11 = 1;
LABEL_9:

  return v11;
}

@end
