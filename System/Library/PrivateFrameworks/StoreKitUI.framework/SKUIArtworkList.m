@implementation SKUIArtworkList

- (SKUIArtworkList)initWithArtworkListArray:(id)a3
{
  id v4;
  SKUIArtworkList *v5;
  NSMutableArray *v6;
  NSMutableArray *artworks;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIArtwork *v16;
  SKUIArtwork *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIArtworkList initWithArtworkListArray:].cold.1();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIArtworkList;
  v5 = -[SKUIArtworkList init](&v23, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    artworks = v5->_artworks;
    v5->_artworks = v6;

    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "firstObject");
        v10 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v10;
      }
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = v4;
    v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v4);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = [SKUIArtwork alloc];
            v17 = -[SKUIArtwork initWithArtworkDictionary:](v16, "initWithArtworkDictionary:", v15, (_QWORD)v19);
            if (v17)
              -[NSMutableArray addObject:](v5->_artworks, "addObject:", v17);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    -[NSMutableArray sortUsingComparator:](v5->_artworks, "sortUsingComparator:", &__block_literal_global_2);
  }

  return v5;
}

uint64_t __44__SKUIArtworkList_initWithArtworkListArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "width");
  if (v6 <= objc_msgSend(v5, "width"))
  {
    v8 = objc_msgSend(v4, "width");
    if (v8 >= objc_msgSend(v5, "width"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (SKUIArtworkList)initWithLookupArray:(id)a3
{
  id v4;
  SKUIArtworkList *v5;
  NSMutableArray *v6;
  NSMutableArray *artworks;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIArtwork *v14;
  SKUIArtwork *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIArtworkList initWithLookupArray:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIArtworkList;
  v5 = -[SKUIArtworkList init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    artworks = v5->_artworks;
    v5->_artworks = v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [SKUIArtwork alloc];
            v15 = -[SKUIArtwork initWithArtworkDictionary:](v14, "initWithArtworkDictionary:", v13, (_QWORD)v17);
            if (v15)
              -[NSMutableArray addObject:](v5->_artworks, "addObject:", v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    -[NSMutableArray sortUsingComparator:](v5->_artworks, "sortUsingComparator:", &__block_literal_global_7);
  }

  return v5;
}

uint64_t __39__SKUIArtworkList_initWithLookupArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "width");
  if (v6 <= objc_msgSend(v5, "width"))
  {
    v8 = objc_msgSend(v4, "width");
    if (v8 >= objc_msgSend(v5, "width"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)artworkForSize:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_artworks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v5)
  {
    v13 = 0;
    goto LABEL_25;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v19;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "width", (_QWORD)v18) - a3;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = v11;

        v7 = v13;
        v9 = v12;
        if (!v12)
          goto LABEL_25;
      }
      else
      {
        if (!v12)
        {
          v13 = v11;

          goto LABEL_25;
        }
        if (v9 < 0)
        {
          if (v12 > v9)
            goto LABEL_16;
        }
        else if (v12 >= 1 && v12 < v9)
        {
LABEL_16:
          v15 = v11;

          v7 = v15;
          v9 = v12;
        }
      }
      ++v10;
    }
    while (v6 != v10);
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v6 = v16;
    v13 = v7;
  }
  while (v16);
LABEL_25:

  return v13;
}

- (id)artworkURLForSize:(int64_t)a3
{
  void *v3;
  void *v4;

  -[SKUIArtworkList artworkForSize:](self, "artworkForSize:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)artworkWithWidth:(int64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_artworks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "width", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)bestArtworkForSize:(CGSize)a3
{
  double height;
  double width;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  height = a3.height;
  width = a3.width;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_artworks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      if (width <= (double)objc_msgSend(v11, "width", (_QWORD)v14) || height <= (double)objc_msgSend(v11, "height"))
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v12 = v11;

    if (v12)
      return v12;
  }
  else
  {
LABEL_10:

  }
  if (-[NSMutableArray count](self->_artworks, "count", (_QWORD)v14))
  {
    -[NSMutableArray lastObject](self->_artworks, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)bestArtworkForScaledSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  return -[SKUIArtworkList bestArtworkForSize:](self, "bestArtworkForSize:", ceil(width * v8), ceil(height * v8));
}

- (id)preferredExactArtworkForSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  height = a3.height;
  width = a3.width;
  v28 = *MEMORY[0x1E0C80C00];
  -[SKUIArtworkList artworks](self, "artworks");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_27;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v24;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    v11 = 0;
    do
    {
      v12 = v10;
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
      v14 = (void *)MEMORY[0x1BCCE6C7C](v6);
      v15 = objc_msgSend(v13, "height", (_QWORD)v23);
      v16 = objc_msgSend(v13, "width");
      if (height == (double)v15 && width == (double)v16)
      {
        v21 = v13;

        objc_autoreleasePoolPop(v14);
        v8 = v21;
        goto LABEL_27;
      }
      v18 = objc_msgSend(v13, "height");
      if (!v12)
      {
LABEL_19:
        v10 = v12;
        goto LABEL_22;
      }
      v10 = (uint64_t)((double)v18 - height);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL && v10)
      {
        if (v12 < 0)
        {
          if (v12 >= v10)
            goto LABEL_19;
        }
        else if (v10 < 1 || v12 <= v10)
        {
          goto LABEL_19;
        }
      }
      v20 = v13;

      v8 = v20;
LABEL_22:
      objc_autoreleasePoolPop(v14);
      ++v11;
    }
    while (v7 != v11);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v7 = v6;
    if (v6)
      continue;
    break;
  }
LABEL_27:

  return v8;
}

+ (id)artworkForSize:(int64_t)a3 artworkDictionaries:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  SKUIArtwork *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  SKUIArtwork *v13;
  uint64_t v14;
  uint64_t v15;
  SKUIArtwork *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = -[SKUIArtwork initWithArtworkDictionary:]([SKUIArtwork alloc], "initWithArtworkDictionary:", v12);
          v14 = -[SKUIArtwork width](v13, "width");
          if (!v10)
            goto LABEL_15;
          v15 = v14 - a3;
          if (v10 != 0x7FFFFFFFFFFFFFFFLL && v15)
          {
            if (v10 < 0)
            {
              if (v15 <= v10)
                goto LABEL_15;
            }
            else if (v15 < 1 || v15 >= v10)
            {
LABEL_15:
              v15 = v10;
LABEL_18:

              v10 = v15;
              continue;
            }
          }
          v17 = v13;

          v8 = v17;
          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (!v7)
        goto LABEL_23;
    }
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (BOOL)hasArtwork
{
  return -[NSMutableArray count](self->_artworks, "count") != 0;
}

+ (BOOL)canHandleArtworkFormat:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SKUIArtwork)largestArtwork
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_artworks, "count");
  if (v3)
  {
    -[NSMutableArray lastObject](self->_artworks, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SKUIArtwork *)v3;
}

- (void)setArtworks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *artworks;

  if (self->_artworks != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    artworks = self->_artworks;
    self->_artworks = v4;

  }
}

- (SKUIArtwork)smallestArtwork
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_artworks, "count");
  if (v3)
  {
    -[NSMutableArray objectAtIndex:](self->_artworks, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SKUIArtwork *)v3;
}

- (NSArray)_lookupArray
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_artworks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "_lookupDictionary", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *artworks;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    artworks = self->_artworks;
    objc_msgSend(v4, "artworks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableArray isEqualToArray:](artworks, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSMutableArray *artworks;
  void *v5;
  unint64_t v6;

  v3 = -[NSMutableArray count](self->_artworks, "count");
  artworks = self->_artworks;
  if (!v3)
    return -[NSMutableArray hash](artworks, "hash");
  -[NSMutableArray objectAtIndex:](artworks, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableArray copyWithZone:](self->_artworks, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIArtworkList;
  -[SKUIArtworkList description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Artwork: %@"), v4, self->_artworks);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIArtworkList)initWithCoder:(id)a3
{
  id v4;
  SKUIArtworkList *v5;
  uint64_t v6;
  NSMutableArray *artworks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIArtworkList;
  v5 = -[SKUIArtworkList init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("artworks"));
    v6 = objc_claimAutoreleasedReturnValue();
    artworks = v5->_artworks;
    v5->_artworks = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_artworks, CFSTR("artworks"));
}

- (SKUIArtworkList)initWithCacheRepresentation:(id)a3
{
  id v4;
  SKUIArtworkList *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  NSMutableArray *artworks;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)SKUIArtworkList;
    v5 = -[SKUIArtworkList init](&v11, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("array"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (objc_class *)objc_opt_class();
        SKUICacheCodingDecodeArray(v6, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        artworks = v5->_artworks;
        v5->_artworks = (NSMutableArray *)v8;

      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  SKUICacheCodingEncodeArray(self->_artworks);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("array"));

  return (NSMutableDictionary *)v3;
}

- (NSArray)artworks
{
  return &self->_artworks->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworks, 0);
}

- (void)initWithArtworkListArray:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIArtworkList initWithArtworkListArray:]";
}

- (void)initWithLookupArray:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIArtworkList initWithLookupArray:]";
}

@end
