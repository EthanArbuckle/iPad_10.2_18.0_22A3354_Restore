@implementation SXMosaicGalleryCluster

- (SXMosaicGalleryCluster)initWithItems:(id)a3
{
  id v5;
  SXMosaicGalleryCluster *v6;
  SXMosaicGalleryCluster *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXMosaicGalleryCluster;
  v6 = -[SXMosaicGalleryCluster init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (BOOL)isClusterOfType:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SXMosaicGalleryCluster items](self, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "tileType") != a3)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SXMosaicGalleryCluster items](self, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToArray:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)clusterIsEqualToTileTypes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  BOOL v17;

  v4 = a3;
  -[SXMosaicGalleryCluster items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (objc_msgSend(v4, "count") != v6)
  {
    v17 = 0;
    goto LABEL_16;
  }
  if (!v6)
  {
    LOBYTE(v10) = 1;
    LOBYTE(v9) = 1;
    goto LABEL_15;
  }
  v7 = 0;
  v8 = v6 - 1;
  LOBYTE(v9) = 1;
  LOBYTE(v10) = 1;
  while (1)
  {
    -[SXMosaicGalleryCluster items](self, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      v9 = objc_msgSend(v12, "tileType") == v14;
      if (!v10)
        goto LABEL_6;
    }
    else
    {
      v9 = 0;
      if (!v10)
      {
LABEL_6:
        v10 = 0;
        goto LABEL_9;
      }
    }
    objc_msgSend(v4, "objectAtIndex:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue");

    v10 = objc_msgSend(v12, "tileType") == v16;
LABEL_9:

    if (!v9 && !v10)
      break;
    ++v7;
    if (--v8 == -1)
      goto LABEL_15;
  }
  LOBYTE(v10) = 0;
  LOBYTE(v9) = 0;
LABEL_15:
  v17 = v9 || v10;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SXMosaicGalleryCluster items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SXMosaicGalleryCluster items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Cluster: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
