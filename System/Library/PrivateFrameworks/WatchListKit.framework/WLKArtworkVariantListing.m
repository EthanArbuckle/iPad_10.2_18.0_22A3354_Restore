@implementation WLKArtworkVariantListing

- (WLKArtworkVariantListing)initWithArtworkDictionary:(id)a3
{
  id v4;
  WLKArtworkVariantListing *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSArray *artworkVariants;
  WLKArtworkVariantListing *v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    v14.receiver = self;
    v14.super_class = (Class)WLKArtworkVariantListing;
    v5 = -[WLKArtworkVariantListing init](&v14, sel_init);
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__WLKArtworkVariantListing_initWithArtworkDictionary___block_invoke;
      v12[3] = &unk_1E68A83E8;
      v13 = v6;
      v7 = v6;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
      v8 = objc_msgSend(v7, "copy");
      artworkVariants = v5->_artworkVariants;
      v5->_artworkVariants = (NSArray *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __54__WLKArtworkVariantListing_initWithArtworkDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WLKArtworkVariant *v7;
  void *v8;
  WLKArtworkVariant *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [WLKArtworkVariant alloc];
    v10 = v5;
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WLKArtworkVariant initWithDictionary:](v7, "initWithDictionary:", v8);

    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

- (id)bestArtworkVariantOfType:(int64_t)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  id v26;
  double v27;
  double v28;
  BOOL v29;
  id v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  height = a4.height;
  width = a4.width;
  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = self->_artworkVariants;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v34;
    v13 = INFINITY;
    v14 = INFINITY;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (!a3 || objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "artworkType", (_QWORD)v33) == a3)
        {
          objc_msgSend(v16, "artworkSize", (_QWORD)v33);
          v19 = v18;
          v20 = v17;
          v22 = vabdd_f64(v18, width) < 2.22044605e-16;
          v21 = vabdd_f64(v17, height);
          v22 = v22 && v21 < 2.22044605e-16;
          if (v22)
          {
            v31 = v16;

            v11 = v31;
            goto LABEL_34;
          }
          if (v19 >= width && v13 > v19 && v17 >= height && v14 > v17)
          {
            v26 = v16;

            v13 = v19;
            v14 = v20;
            v11 = v26;
          }
          objc_msgSend(v10, "artworkSize");
          if (!v10 || (v27 >= v19 ? (v29 = v28 < v20) : (v29 = 1), v29))
          {
            v30 = v16;

            v10 = v30;
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v9)
        continue;
      break;
    }
LABEL_34:

    if (v10 && !v11)
    {
      v10 = v10;
      v11 = v10;
    }
  }
  else
  {

    v10 = 0;
    v11 = 0;
  }

  return v11;
}

- (id)artworkVariantOfType:(int64_t)a3
{
  NSArray *v4;
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
  v4 = self->_artworkVariants;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        if (objc_msgSend(v9, "artworkType", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSArray)artworkVariants
{
  return self->_artworkVariants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkVariants, 0);
}

@end
