@implementation RadioArtworkCollection

- (RadioArtworkCollection)initWithArtworks:(id)a3
{
  id v4;
  RadioArtworkCollection *v5;
  RadioArtworkCollection *v6;
  void *v7;
  uint64_t v8;
  NSArray *artworks;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RadioArtworkCollection;
  v5 = -[RadioArtworkCollection init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[RadioArtworkCollection _artworksBySortingArtworks:](v5, "_artworksBySortingArtworks:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    artworks = v6->_artworks;
    v6->_artworks = (NSArray *)v8;

  }
  return v6;
}

- (RadioArtworkCollection)initWithArtworkVariants:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RadioArtwork *v12;
  RadioArtworkCollection *v13;
  RadioArtworkCollection *v14;
  uint64_t v15;
  NSArray *artworks;
  RadioArtworkCollection *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[RadioArtwork initWithArtworkDictionary:]([RadioArtwork alloc], "initWithArtworkDictionary:", v11);
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v19.receiver = self;
    v19.super_class = (Class)RadioArtworkCollection;
    v13 = -[RadioArtworkCollection init](&v19, sel_init);
    v14 = v13;
    if (v13)
    {
      -[RadioArtworkCollection _artworksBySortingArtworks:](v13, "_artworksBySortingArtworks:", v5);
      v15 = objc_claimAutoreleasedReturnValue();
      artworks = v14->_artworks;
      v14->_artworks = (NSArray *)v15;

    }
    self = v14;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p artworks: %@>"), objc_opt_class(), self, self->_artworks);
}

- (unint64_t)hash
{
  return ~-[NSArray hash](self->_artworks, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RadioArtworkCollection *v4;
  NSArray *artworks;
  char v6;

  v4 = (RadioArtworkCollection *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    artworks = self->_artworks;
    if ((unint64_t)artworks | (unint64_t)v4->_artworks)
    {
      v6 = -[NSArray isEqual:](artworks, "isEqual:");
      goto LABEL_7;
    }
  }
  v6 = 1;
LABEL_7:

  return v6;
}

- (id)bestArtworkForPixelSize:(CGSize)a3
{
  double height;
  double width;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  height = a3.height;
  width = a3.width;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_artworks;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "pixelSize", (_QWORD)v17);
      if (v13 >= width || v12 >= height)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    v15 = v11;

    if (v15)
      return v15;
  }
  else
  {
LABEL_13:

  }
  -[NSArray lastObject](self->_artworks, "lastObject", (_QWORD)v17);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  return v15;
}

- (id)bestArtworkForPointSize:(CGSize)a3
{
  double height;
  double width;
  float v6;

  height = a3.height;
  width = a3.width;
  GSMainScreenScaleFactor();
  return -[RadioArtworkCollection bestArtworkForPixelSize:](self, "bestArtworkForPixelSize:", width * v6, height * v6);
}

- (id)_artworksBySortingArtworks:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_519);
}

- (NSArray)artworks
{
  return self->_artworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworks, 0);
}

uint64_t __53__RadioArtworkCollection__artworksBySortingArtworks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a2, "pixelSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "pixelSize");
  v11 = v8 < v10 || v6 < v9;
  v12 = v8 <= v10 && v6 <= v9;
  v13 = v11 << 63 >> 63;
  if (v12)
    v14 = v13;
  else
    v14 = 1;

  return v14;
}

@end
