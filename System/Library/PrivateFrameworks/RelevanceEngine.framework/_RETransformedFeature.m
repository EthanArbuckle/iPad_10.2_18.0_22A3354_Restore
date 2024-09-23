@implementation _RETransformedFeature

- (id)_dependentFeatures
{
  return self->_features;
}

- (REFeatureTransformer)transformer
{
  return self->_transformer;
}

- (BOOL)isEqual:(id)a3
{
  _RETransformedFeature *v4;
  _RETransformedFeature *v5;
  REFeatureTransformer *transformer;
  REFeatureTransformer *v7;
  REFeatureTransformer *v8;
  REFeatureTransformer *v9;
  int v10;
  char v11;
  REFeatureSet *features;
  REFeatureSet *v13;
  REFeatureSet *v14;
  REFeatureSet *v15;

  v4 = (_RETransformedFeature *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      transformer = self->_transformer;
      v7 = v5->_transformer;
      if (transformer == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = transformer;
        v10 = -[REFeatureTransformer isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      features = self->_features;
      v13 = v5->_features;
      v14 = features;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[REFeatureSet isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)name
{
  return self->_name;
}

- (id)_rootFeatures
{
  return RERootFeatureSetForFeatures(self->_features);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_name);
  objc_storeStrong(v4 + 4, self->_transformer);
  objc_storeStrong(v4 + 3, self->_features);
  objc_msgSend(v4, "_computeHash");
  return v4;
}

- (int64_t)_bitCount
{
  return -[REFeatureTransformer _bitCount](self->_transformer, "_bitCount");
}

- (unint64_t)featureType
{
  return -[REFeatureTransformer _outputType](self->_transformer, "_outputType");
}

- (unint64_t)hash
{
  return self->_hash;
}

- (void)_computeHash
{
  REFeatureSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  self->_hash = -[REFeatureTransformer hash](self->_transformer, "hash");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_features;
  v4 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        self->_hash ^= objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "hash", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[REFeatureSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (_RETransformedFeature)initWithTransformer:(id)a3 features:(id)a4
{
  id v6;
  id v7;
  _RETransformedFeature *v8;
  uint64_t v9;
  uint64_t v10;
  REFeatureSet *features;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *name;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_RETransformedFeature;
  v8 = -[_RETransformedFeature init](&v27, sel_init);
  if (v8)
  {
    if ((objc_msgSend((id)objc_opt_class(), "supportsInvalidation") & 1) != 0
      || objc_msgSend((id)objc_opt_class(), "supportsPersistence"))
    {
      v9 = objc_msgSend(v6, "copy");

      v6 = (id)v9;
    }
    objc_storeStrong((id *)&v8->_transformer, v6);
    +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    features = v8->_features;
    v8->_features = (REFeatureSet *)v10;

    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "name", (_QWORD)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v6, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v19);

    v20 = objc_msgSend(v12, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v20;

    -[_RETransformedFeature _computeHash](v8, "_computeHash");
  }

  return v8;
}

- (void)_replaceDependentFeature:(id)a3 withFeature:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  REFeatureSet *v17;
  REFeatureSet *features;
  uint64_t v19;
  id v20;

  v20 = a4;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("This API is only meant to switch around pointers to the same type of object"), v10, v11, v12, v13, v14, v15, v19);
  v16 = (void *)-[REFeatureSet mutableCopy](self->_features, "mutableCopy");
  objc_msgSend(v16, "removeFeature:", v6);

  objc_msgSend(v16, "addFeature:", v20);
  v17 = (REFeatureSet *)objc_msgSend(v16, "copy");
  features = self->_features;
  self->_features = v17;

  -[_RETransformedFeature _computeHash](self, "_computeHash");
}

- (REFeatureSet)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
