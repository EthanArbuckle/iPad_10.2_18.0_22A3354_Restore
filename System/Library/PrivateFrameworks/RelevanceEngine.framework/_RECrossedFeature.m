@implementation _RECrossedFeature

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  _RECrossedFeature *v4;
  _RECrossedFeature *v5;
  _RECrossedFeature *v6;
  NSArray *features;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  char v11;

  v4 = (_RECrossedFeature *)a3;
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
      v6 = v5;
      if (self->_featureType == v5->_featureType)
      {
        features = self->_features;
        v8 = v5->_features;
        v9 = features;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSArray isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)name
{
  return self->_name;
}

- (id)_dependentFeatures
{
  return self->_dependentFeatures;
}

- (_RECrossedFeature)initWithFeatures:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _RECrossedFeature *v21;
  uint64_t v22;
  REFeatureSet *dependentFeatures;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *name;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[REMLModel featureBitWidth](REMLModel, "featureBitWidth");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v45;
    v9 = (void *)*MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "_bitCount");
        if (v12 < 0)
        {
          RERaiseInternalException(v9, CFSTR("Feature %@ cannot be crossed. It may need to be transformed first"), v13, v14, v15, v16, v17, v18, (uint64_t)v11);
        }
        else
        {
          v19 = v12 + v7;
          if (v12 + v7 <= v4)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "_dependentFeatures");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "unionFeatureSet:", v20);

            }
            else
            {
              objc_msgSend(v37, "addFeature:", v11);
            }
            v7 = v19;
          }
          else
          {
            RERaiseInternalException(v9, CFSTR("Feature %@ cannot be crossed with other features. It requires too much precision"), v13, v14, v15, v16, v17, v18, (uint64_t)v11);
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v6);
  }

  v43.receiver = self;
  v43.super_class = (Class)_RECrossedFeature;
  v21 = -[_RECrossedFeature init](&v43, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v37, "copy");
    dependentFeatures = v21->_dependentFeatures;
    v21->_dependentFeatures = (REFeatureSet *)v22;

    -[_RECrossedFeature _updateFeaturesArray](v21, "_updateFeaturesArray");
    v21->_bitCount = 0;
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = v21->_features;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      v29 = 1;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          if (objc_msgSend(v24, "length"))
            objc_msgSend(v24, "appendString:", CFSTR("X"));
          objc_msgSend(v31, "name");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendString:", v32);

          if (objc_msgSend(v31, "featureType") == 2)
            v29 = 2;
          v21->_bitCount += objc_msgSend(v31, "_bitCount");
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v27);
    }
    else
    {
      v29 = 1;
    }

    v33 = objc_msgSend(v24, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v33;

    v21->_featureType = v29;
    -[_RECrossedFeature _computeHash](v21, "_computeHash");

  }
  return v21;
}

- (void)_updateFeaturesArray
{
  NSArray *v3;
  NSArray *features;
  id v5;

  -[REFeatureSet allFeatures](self->_dependentFeatures, "allFeatures");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_75);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  features = self->_features;
  self->_features = v3;

}

- (void)_computeHash
{
  NSArray *v3;
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
  self->_hash = self->_featureType;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_features;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (id)_rootFeatures
{
  return RERootFeatureSetForFeatures(self->_dependentFeatures);
}

- (int64_t)_bitCount
{
  return self->_bitCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFeatures:", self->_features);
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
  REFeatureSet *dependentFeatures;
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
  v16 = (void *)-[REFeatureSet mutableCopy](self->_dependentFeatures, "mutableCopy");
  objc_msgSend(v16, "removeFeature:", v6);

  objc_msgSend(v16, "addFeature:", v20);
  v17 = (REFeatureSet *)objc_msgSend(v16, "copy");
  dependentFeatures = self->_dependentFeatures;
  self->_dependentFeatures = v17;

  -[_RECrossedFeature _updateFeaturesArray](self, "_updateFeaturesArray");
  -[_RECrossedFeature _computeHash](self, "_computeHash");

}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_dependentFeatures, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
