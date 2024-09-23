@implementation _REMutableFeatureSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

- (_REMutableFeatureSet)initWithFeatures:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _REMutableFeatureSet *v20;
  _REMutableFeatureSet *v21;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    v10 = (void *)*MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "containsObject:", v13))
          {
            RERaiseInternalException(v10, CFSTR("Features as duplicate feature with name \"%@\"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
          }
          else
          {
            objc_msgSend(v4, "addObject:", v13);
            objc_msgSend(v5, "addObject:", v12);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v24.receiver = self;
  v24.super_class = (Class)_REMutableFeatureSet;
  v20 = -[REMutableFeatureSet init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_features, v5);
    objc_storeStrong((id *)&v21->_names, v4);
  }

  return v21;
}

- (void)addFeature:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_names, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_names, "addObject:", v4);
    -[NSMutableSet addObject:](self->_features, "addObject:", v5);
  }

}

- (_REMutableFeatureSet)init
{
  return -[_REMutableFeatureSet initWithCapacity:](self, "initWithCapacity:", 0);
}

- (_REMutableFeatureSet)initWithCapacity:(unint64_t)a3
{
  _REMutableFeatureSet *v4;
  uint64_t v5;
  NSMutableSet *features;
  uint64_t v7;
  NSMutableSet *names;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_REMutableFeatureSet;
  v4 = -[REMutableFeatureSet init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    features = v4->_features;
    v4->_features = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    names = v4->_names;
    v4->_names = (NSMutableSet *)v7;

  }
  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableSet countByEnumeratingWithState:objects:count:](self->_features, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)removeFeature:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_REMutableFeatureSet containsFeature:](self, "containsFeature:"))
  {
    objc_msgSend(v5, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](self->_features, "removeObject:", v5);
    -[NSMutableSet removeObject:](self->_names, "removeObject:", v4);

  }
}

- (BOOL)containsFeature:(id)a3
{
  return -[NSMutableSet containsObject:](self->_features, "containsObject:", a3);
}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_features, "count");
}

- (_REMutableFeatureSet)initWithFeature:(id)a3
{
  id v4;
  _REMutableFeatureSet *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableSet *names;
  uint64_t v10;
  NSMutableSet *features;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_REMutableFeatureSet;
  v5 = -[REMutableFeatureSet init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    names = v5->_names;
    v5->_names = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    features = v5->_features;
    v5->_features = (NSMutableSet *)v10;

  }
  return v5;
}

- (id)featureWithName:(id)a3
{
  id v4;
  NSMutableSet *v5;
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
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeAllFeatures
{
  -[NSMutableSet removeAllObjects](self->_features, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_names, "removeAllObjects");
}

@end
