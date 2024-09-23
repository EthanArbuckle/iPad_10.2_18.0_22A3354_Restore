@implementation _REFeatureSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

- (_REFeatureSet)initWithFeatures:(id)a3
{
  id v4;
  _RESingleFeatureSet *v5;
  void *v6;
  _REFeatureSet *v7;
  _RESmallFeatureSet *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _REFeatureSet *v25;
  uint64_t v26;
  NSSet *features;
  _REFeatureSet *v29;
  id v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    if (initWithFeatures__onceToken != -1)
      dispatch_once(&initWithFeatures__onceToken, &__block_literal_global_55);
    v8 = (_RESmallFeatureSet *)(id)initWithFeatures__EmptyFeatureSet;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = [_RESingleFeatureSet alloc];
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_RESingleFeatureSet initWithFeature:](v5, "initWithFeature:", v6);

    goto LABEL_25;
  }
  if ((unint64_t)objc_msgSend(v4, "count") <= 3)
  {
    v8 = -[_RESmallFeatureSet initWithFeatures:]([_RESmallFeatureSet alloc], "initWithFeatures:", v4);
LABEL_9:
    v7 = (_REFeatureSet *)v8;
    goto LABEL_25;
  }
  v29 = self;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = v4;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    v15 = (void *)*MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "containsObject:", v18))
          {
            RERaiseInternalException(v15, CFSTR("Features as duplicate feature with name \"%@\"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);
          }
          else
          {
            objc_msgSend(v9, "addObject:", v18);
            objc_msgSend(v10, "addObject:", v17);
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v13);
  }

  v31.receiver = v29;
  v31.super_class = (Class)_REFeatureSet;
  v25 = -[REFeatureSet init](&v31, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v10, "copy");
    features = v25->_features;
    v25->_features = (NSSet *)v26;

  }
  self = v25;

  v7 = self;
  v4 = v30;
LABEL_25:

  return v7;
}

- (_REFeatureSet)init
{
  return -[_REFeatureSet initWithFeatures:](self, "initWithFeatures:", MEMORY[0x24BDBD1A8]);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSSet countByEnumeratingWithState:objects:count:](self->_features, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BOOL)containsFeature:(id)a3
{
  return -[NSSet containsObject:](self->_features, "containsObject:", a3);
}

- (unint64_t)count
{
  return -[NSSet count](self->_features, "count");
}

- (_REFeatureSet)initWithFeature:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _REFeatureSet *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_REFeatureSet initWithFeatures:](self, "initWithFeatures:", v6, v9, v10);
  return v7;
}

- (id)featureWithName:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_features;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
