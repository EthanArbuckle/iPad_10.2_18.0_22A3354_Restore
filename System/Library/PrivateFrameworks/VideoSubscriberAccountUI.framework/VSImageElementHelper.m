@implementation VSImageElementHelper

- (VSImageElementHelper)init
{
  VSImageElementHelper *v2;
  void *v3;
  double v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSImageElementHelper;
  v2 = -[VSImageElementHelper init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v2->_deviceScale = v4;

    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_currentUserInterfaceStyle = objc_msgSend(v5, "userInterfaceStyle");

  }
  return v2;
}

- (id)bestMatchingKeyForSrcset:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v4;
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "count") <= 1)
          v14 = v5;
        else
          v14 = v6;
        objc_msgSend(v14, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if (-[VSImageElementHelper currentUserInterfaceStyle](self, "currentUserInterfaceStyle") != 2
    || (-[VSImageElementHelper deviceScale](self, "deviceScale"),
        -[VSImageElementHelper bestMatchingKeyForScale:withSuffix:inKeysSet:](self, "bestMatchingKeyForScale:withSuffix:inKeysSet:", CFSTR("-dark"), v6), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[VSImageElementHelper deviceScale](self, "deviceScale");
    -[VSImageElementHelper bestMatchingKeyForScale:withSuffix:inKeysSet:](self, "bestMatchingKeyForScale:withSuffix:inKeysSet:", &stru_24FE1B848, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)bestMatchingKeyForScale:(double)a3 withSuffix:(id)a4 inKeysSet:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v15;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a3 <= 0.0)
    return 0;
  v19 = v12;
  v20 = v11;
  v21 = v8;
  v22 = v7;
  v23 = v6;
  v24 = v5;
  v25 = v9;
  v26 = v10;
  v15 = a3;
  do
  {
    -[VSImageElementHelper matchingKeyForScale:withSuffix:inKeysSet:](self, "matchingKeyForScale:withSuffix:inKeysSet:", a4, a5, v15, v19, v20, v21, v22, v23, v24, v25, v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      break;
    v15 = v15 + -1.0;
  }
  while (v15 > 0.0);
  return v17;
}

- (id)matchingKeyForScale:(double)a3 withSuffix:(id)a4 inKeysSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[VSImageElementHelper keysForScale:withSuffix:](self, "keysForScale:withSuffix:", a4, a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "containsObject:", v13, (_QWORD)v15) & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)keysForScale:(double)a3 withSuffix:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0fx%@"), *(_QWORD *)&a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
  return v7;
}

- (double)deviceScale
{
  return self->_deviceScale;
}

- (void)setDeviceScale:(double)a3
{
  self->_deviceScale = a3;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

@end
