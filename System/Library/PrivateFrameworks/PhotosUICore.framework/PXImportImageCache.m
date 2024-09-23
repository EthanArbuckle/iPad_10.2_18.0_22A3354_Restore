@implementation PXImportImageCache

- (PXImportImageCache)init
{
  PXImportImageCache *v2;
  PXImportImageCache *v3;
  PXImportImageCache *v4;
  uint64_t v5;
  NSMutableDictionary *caches;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *cacheTableQueue;
  objc_super v12;

  v2 = self;
  if (sharedInstance)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("use singleton access %@"), objc_opt_class());
    v3 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXImportImageCache;
    v4 = -[PXImportImageCache init](&v12, sel_init);
    if (v4)
    {
      v5 = objc_opt_new();
      caches = v4->_caches;
      v4->_caches = (NSMutableDictionary *)v5;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = dispatch_queue_create("com.apple.photos.import.ImageCache", v8);
      cacheTableQueue = v4->_cacheTableQueue;
      v4->_cacheTableQueue = (OS_dispatch_queue *)v9;

    }
    v2 = v4;
    v3 = v2;
  }

  return v3;
}

- (void)configureWithFormat:(unsigned __int16)a3
{
  self->_imageFormat = a3;
}

- (void)tearDown
{
  NSMutableDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_caches;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setImage:(id)a3 forIdentifier:(id)a4
{
  -[PXImportImageCache setImage:forIdentifier:completion:](self, "setImage:forIdentifier:completion:", a3, a4, 0);
}

- (void)setImage:(id)a3 forIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PXImportImageCache_setImage_forIdentifier_completion___block_invoke;
    v11[3] = &unk_1E51455D0;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    -[PXImportImageCache accessImageTableForIdentifier:withChangeBlock:](self, "accessImageTableForIdentifier:withChangeBlock:", v13, v11);

  }
}

- (id)imageForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PXImportImageCache cacheTableForIdentifier:](self, "cacheTableForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "cacheIndex");

  objc_msgSend(v5, "imageForItemAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageForModel:(id)a3 ofSize:(unint64_t)a4 allowLowerResolutions:(BOOL)a5 foundSize:(unint64_t *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  unint64_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "imageRepresentations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    -[PXImportImageCache imageForIdentifier:](self, "imageForIdentifier:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v13, "sizeType");
    if (!a6)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(v10, "imageRepresentations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v27 = v13;
    v28 = a6;
    v20 = *(_QWORD *)v30;
    v21 = 4;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v23, "sizeType", v27, v28, (_QWORD)v29) <= a4)
        {
          -[PXImportImageCache imageForIdentifier:](self, "imageForIdentifier:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)v24;
            v21 = objc_msgSend(v23, "sizeType");
            goto LABEL_15;
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v19)
        continue;
      break;
    }
    v25 = 0;
LABEL_15:
    v13 = v27;
    a6 = v28;
  }
  else
  {
    v25 = 0;
    v21 = 4;
  }

  if (a6)
LABEL_18:
    *a6 = v21;
LABEL_19:

  return v25;
}

- (void)imageForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PXImportImageCache_imageForIdentifier_completion___block_invoke;
  v10[3] = &unk_1E51455F8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[PXImportImageCache accessImageTableForIdentifier:withChangeBlock:](self, "accessImageTableForIdentifier:withChangeBlock:", v8, v10);

}

- (void)imageForModel:(id)a3 ofSize:(unint64_t)a4 allowLowerResolutions:(BOOL)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (v10)
  {
    objc_msgSend(a3, "imageRepresentations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a5)
    {
      objc_msgSend(v11, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_51);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
LABEL_5:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
          if (objc_msgSend(v20, "integerValue") <= a4)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v17)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v22 = v20;

        if (v22)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", v22);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        v21 = 0;
      }
      else
      {
LABEL_11:
        v21 = 0;
        v22 = v15;
LABEL_15:

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v21)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __76__PXImportImageCache_imageForModel_ofSize_allowLowerResolutions_completion___block_invoke_2;
      v23[3] = &unk_1E5145660;
      v24 = v10;
      -[PXImportImageCache imageForIdentifier:completion:](self, "imageForIdentifier:completion:", v21, v23);

    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t))v10 + 2))(v10, 0, 4);
    }

  }
}

- (void)removeCacheForIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[PXImportImageCache cacheTableForIdentifier:](self, "cacheTableForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeItemAtIndex:", objc_msgSend(v9, "cacheIndex"));

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)cacheTableForIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *caches;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PUTemporaryImageTable *v12;
  NSMutableDictionary *v13;
  void *v14;

  v4 = a3;
  caches = self->_caches;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](caches, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!self->_imageFormat)
      _PFAssertContinueHandler();
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/import-%@.ithmb"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "sizeType"))
      v12 = (PUTemporaryImageTable *)objc_opt_new();
    else
      v12 = -[PLTemporaryImageTable initWithWithPath:imageFormat:]([PUTemporaryImageTable alloc], "initWithWithPath:imageFormat:", v11, self->_imageFormat);
    v7 = v12;
    v13 = self->_caches;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sizeType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v7, v14);

    if (!v7)
      _PFAssertContinueHandler();
  }

  return v7;
}

- (void)accessImageTableForIdentifier:(id)a3 withChangeBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheTableQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cacheTableQueue = self->_cacheTableQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PXImportImageCache_accessImageTableForIdentifier_withChangeBlock___block_invoke;
  block[3] = &unk_1E5145688;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(cacheTableQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheTableQueue, 0);
  objc_storeStrong((id *)&self->_caches, 0);
}

void __68__PXImportImageCache_accessImageTableForIdentifier_withChangeBlock___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheTableForIdentifier:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __76__PXImportImageCache_imageForModel_ofSize_allowLowerResolutions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__PXImportImageCache_imageForModel_ofSize_allowLowerResolutions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __52__PXImportImageCache_imageForIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v4, "imageForItemAtIndex:", objc_msgSend(v3, "cacheIndex"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, objc_msgSend(*(id *)(a1 + 32), "sizeType"));
  }
}

uint64_t __56__PXImportImageCache_setImage_forIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t result;

  v3 = a2;
  v4 = (int)objc_msgSend(v3, "nextCacheIndex");
  objc_msgSend(v3, "setImage:forItemAtIndex:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(*(id *)(a1 + 40), "setCacheIndex:", v4);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (PXImportImageCache)sharedInstance
{
  if (sharedInstance_onceToken_285237 != -1)
    dispatch_once(&sharedInstance_onceToken_285237, &__block_literal_global_285238);
  return (PXImportImageCache *)(id)sharedInstance;
}

void __36__PXImportImageCache_sharedInstance__block_invoke()
{
  PXImportImageCache *v0;
  void *v1;

  v0 = objc_alloc_init(PXImportImageCache);
  v1 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v0;

}

@end
