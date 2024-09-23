@implementation PXGLayoutSnapshot

void __52__PXGLayoutSnapshot_initWithLayout_spriteDataStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "layoutSnapshotDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "dataSourceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "dataSourceIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v9);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v4, "dataSourceIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        PXAssertGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412546;
          v15 = v10;
          v16 = 2112;
          v17 = v13;
          _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Data Source identifier hash collision %@. %@", (uint8_t *)&v14, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v10);

    }
  }

}

- (PXGLayoutSnapshot)initWithLayout:(id)a3 spriteDataStore:(id)a4
{
  id v7;
  id v8;
  PXGLayoutSnapshot *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  PXGLayoutSnapshot *v14;
  uint64_t v15;
  NSDictionary *identifierSourceByDataSourceIdentifier;
  uint64_t v17;
  NSDictionary *identifierSourceByDataSourceIdentifierHash;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  int v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  PXGLayoutSnapshot *v29;
  SEL v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXGLayoutSnapshot;
  v9 = -[PXGLayoutSnapshot init](&v31, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__PXGLayoutSnapshot_initWithLayout_spriteDataStore___block_invoke;
    v26[3] = &unk_1E5144BA8;
    v12 = v10;
    v27 = v12;
    v13 = v11;
    v28 = v13;
    v30 = a2;
    v14 = v9;
    v29 = v14;
    objc_msgSend(v7, "enumerateDescendantsLayoutsUsingBlock:", v26);
    v15 = objc_msgSend(v12, "copy");
    identifierSourceByDataSourceIdentifier = v14->_identifierSourceByDataSourceIdentifier;
    v14->_identifierSourceByDataSourceIdentifier = (NSDictionary *)v15;

    v17 = objc_msgSend(v13, "copy");
    identifierSourceByDataSourceIdentifierHash = v14->_identifierSourceByDataSourceIdentifierHash;
    v14->_identifierSourceByDataSourceIdentifierHash = (NSDictionary *)v17;

    objc_msgSend(v7, "visibleRect");
    v14->_visibleRect.origin.x = v19;
    v14->_visibleRect.origin.y = v20;
    v14->_visibleRect.size.width = v21;
    v14->_visibleRect.size.height = v22;
    objc_storeStrong((id *)&v14->_spriteDataStore, a4);
    v23 = objc_msgSend(v7, "numberOfSprites");
    if (v23 != objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("PXGLayoutSnapshot.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layout.numberOfSprites == spriteDataStore.count"));

    }
  }

  return v9;
}

- (void)releaseSpriteDataStore
{
  PXGSpriteDataStore *spriteDataStore;

  spriteDataStore = self->_spriteDataStore;
  self->_spriteDataStore = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierSourceByDataSourceIdentifierHash, 0);
  objc_storeStrong((id *)&self->_identifierSourceByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_spriteDataStore, 0);
  objc_storeStrong((id *)&self->_spriteIndexesByObjectIdentifier, 0);
}

- (void)applyViewportShift:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  double *v12;
  double v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  self->_visibleRect = CGRectOffset(self->_visibleRect, a3.x, a3.y);
  -[PXGLayoutSnapshot spriteDataStore](self, "spriteDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    v8 = objc_retainAutorelease(v6);
    v9 = objc_msgSend(v8, "geometries");
    v10 = objc_msgSend(v8, "count");
    v7 = v14;
    if (v10)
    {
      v11 = v10;
      v12 = (double *)(v9 + 8);
      do
      {
        v13 = y + *v12;
        *(v12 - 1) = x + *(v12 - 1);
        *v12 = v13;
        v12 += 4;
        --v11;
      }
      while (v11);
    }
  }

}

- (PXGSpriteDataStore)spriteDataStore
{
  PXGSpriteDataStore *spriteDataStore;
  void *v6;

  spriteDataStore = self->_spriteDataStore;
  if (!spriteDataStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayoutSnapshot.m"), 56, CFSTR("Attempting to access the sprite data store after it has been released and reused."));

    spriteDataStore = self->_spriteDataStore;
  }
  return spriteDataStore;
}

- (PXGLayoutSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGLayoutSnapshot.m"), 52, CFSTR("%s is not available as initializer"), "-[PXGLayoutSnapshot init]");

  abort();
}

- (NSDictionary)spriteIndexesByObjectIdentifier
{
  NSDictionary *spriteIndexesByObjectIdentifier;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *v11;
  _QWORD v13[4];
  id v14;

  spriteIndexesByObjectIdentifier = self->_spriteIndexesByObjectIdentifier;
  if (!spriteIndexesByObjectIdentifier)
  {
    -[PXGLayoutSnapshot spriteDataStore](self, "spriteDataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = objc_retainAutorelease(v4);
      v7 = objc_msgSend(v6, "infos");
      v8 = objc_msgSend(v6, "count");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __52__PXGLayoutSnapshot_spriteIndexesByObjectIdentifier__block_invoke;
      v13[3] = &unk_1E5144BD0;
      v14 = v5;
      v9 = v5;
      -[PXGLayoutSnapshot enumerateObjectIdentifiersForInfos:count:usingBlock:](self, "enumerateObjectIdentifiersForInfos:count:usingBlock:", v7, v8, v13);
      v10 = (NSDictionary *)objc_msgSend(v9, "copy");
      v11 = self->_spriteIndexesByObjectIdentifier;
      self->_spriteIndexesByObjectIdentifier = v10;

    }
    spriteIndexesByObjectIdentifier = self->_spriteIndexesByObjectIdentifier;
  }
  return spriteIndexesByObjectIdentifier;
}

- (void)enumerateObjectIdentifiersForSpriteIndexes:(id)a3 infos:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  const $786F7D2F4E5B3A0CBB66DF574B7D98CF *v15;
  _QWORD v16[4];
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__281666;
  v17[4] = __Block_byref_object_dispose__281667;
  v18 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PXGLayoutSnapshot_enumerateObjectIdentifiersForSpriteIndexes_infos_usingBlock___block_invoke;
  v11[3] = &unk_1E5144BF8;
  v15 = a4;
  v13 = v17;
  v11[4] = self;
  v10 = v9;
  v12 = v10;
  v14 = v16;
  objc_msgSend(v8, "enumerateRangesUsingBlock:", v11);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);

}

- (void)enumerateObjectIdentifiersForInfos:(id *)a3 count:(unsigned int)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PXGLayoutSnapshot_enumerateObjectIdentifiersForInfos_count_usingBlock___block_invoke;
  v11[3] = &unk_1E5144C20;
  v12 = v8;
  v9 = v8;
  -[PXGLayoutSnapshot enumerateObjectIdentifiersForSpriteIndexes:infos:usingBlock:](self, "enumerateObjectIdentifiersForSpriteIndexes:infos:usingBlock:", v10, a3, v11);

}

- (void)enumerateSpritesWithObjectIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a3;
  v6 = a4;
  -[PXGLayoutSnapshot spriteDataStore](self, "spriteDataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXGLayoutSnapshot spriteIndexesByObjectIdentifier](self, "spriteIndexesByObjectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__PXGLayoutSnapshot_enumerateSpritesWithObjectIdentifier_usingBlock___block_invoke;
    v11[3] = &unk_1E5144C48;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v11);

  }
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)identifierSourceByDataSourceIdentifier
{
  return self->_identifierSourceByDataSourceIdentifier;
}

- (NSDictionary)identifierSourceByDataSourceIdentifierHash
{
  return self->_identifierSourceByDataSourceIdentifierHash;
}

uint64_t __69__PXGLayoutSnapshot_enumerateSpritesWithObjectIdentifier_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, _OWORD *, uint64_t);
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "spriteDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "spriteAtIndex:", a2);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  v6 = *(unsigned __int8 *)(*((_QWORD *)&v12 + 1) + 24);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t))(v7 + 16);
  v10[0] = v11;
  v10[1] = v12;
  return v8(v7, a2, v10, v6);
}

uint64_t __73__PXGLayoutSnapshot_enumerateObjectIdentifiersForInfos_count_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__PXGLayoutSnapshot_enumerateObjectIdentifiersForSpriteIndexes_infos_usingBlock___block_invoke(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t DataSourceIdentifierHash;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (a2 < a2 + a3)
  {
    v3 = a3;
    v4 = a2;
    v6 = 40 * a2 + 24;
    do
    {
      v7 = a1[8];
      DataSourceIdentifierHash = PXGSectionedSpriteTagGetDataSourceIdentifierHash();
      if ((_DWORD)DataSourceIdentifierHash != objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "dataSourceIdentifier"))
      {
        v9 = *(void **)(a1[4] + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", DataSourceIdentifierHash);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1[6] + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

      }
      v14 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (v14)
      {
        objc_msgSend(v14, "dataSourceIdentifier");
        PXGSectionedSpriteTagDecompose();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectIdentifierForSpriteTag:", *(_QWORD *)(v7 + v6));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(a1[5] + 16))();

      }
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      ++v4;
      v6 += 40;
      --v3;
    }
    while (v3);
  }
}

void __52__PXGLayoutSnapshot_spriteIndexesByObjectIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "addIndex:", a4);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", a4);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  }

}

@end
