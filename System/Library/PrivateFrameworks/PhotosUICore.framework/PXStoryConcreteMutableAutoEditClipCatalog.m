@implementation PXStoryConcreteMutableAutoEditClipCatalog

- (void)addClip:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *clipIndicesByAssetUUID;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = a3;
  objc_msgSend(v13, "displayAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        clipIndicesByAssetUUID = self->super._clipIndicesByAssetUUID;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->super._orderedClips, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v8;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "alternateUUID");
        else
          objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKey:](clipIndicesByAssetUUID, "setObject:forKey:", v10, v12);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[NSMutableArray addObject:](self->super._orderedClips, "addObject:", v13);
}

- (void)updateClipForDisplayAsset:(id)a3 usingBlock:(id)a4
{
  NSMutableDictionary *clipIndicesByAssetUUID;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a4;
  clipIndicesByAssetUUID = self->super._clipIndicesByAssetUUID;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "alternateUUID");
  else
    objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](clipIndicesByAssetUUID, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super._orderedClips, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntegerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10);

  }
}

- (void)updateClipAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  NSMutableArray *orderedClips;
  void (**v6)(id, id);
  id v7;

  orderedClips = self->super._orderedClips;
  v6 = (void (**)(id, id))a4;
  -[NSMutableArray objectAtIndexedSubscript:](orderedClips, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)enumerateMutableClipsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *orderedClips;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  orderedClips = self->super._orderedClips;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PXStoryConcreteMutableAutoEditClipCatalog_enumerateMutableClipsUsingBlock___block_invoke;
  v7[3] = &unk_1E51370C8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedClips, "enumerateObjectsUsingBlock:", v7);

}

- (void)enumeratePairsOfMutableClipsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *orderedClips;
  void (**v6)(_QWORD);
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__213562;
  v19 = __Block_byref_object_dispose__213563;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  orderedClips = self->super._orderedClips;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryConcreteMutableAutoEditClipCatalog_enumeratePairsOfMutableClipsUsingBlock___block_invoke;
  v7[3] = &unk_1E51370F0;
  v6 = (void (**)(_QWORD))v4;
  v8 = v6;
  v9 = &v15;
  v10 = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedClips, "enumerateObjectsUsingBlock:", v7);
  if (v16[5] && !*((_BYTE *)v12 + 24))
    v6[2](v6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

}

- (void)composeClipsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableDictionary *clipIndicesByAssetUUID;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a3.length;
  location = a3.location;
  v26 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray subarrayWithRange:](self->super._orderedClips, "subarrayWithRange:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryConcreteAutoEditClip composedClipWithClips:](PXStoryConcreteAutoEditClip, "composedClipWithClips:");
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->super._orderedClips, "removeObjectsInRange:", location, length);
  v17 = (void *)v6;
  -[NSMutableArray insertObject:atIndex:](self->super._orderedClips, "insertObject:atIndex:", v6, location);
  while (location < -[NSMutableArray count](self->super._orderedClips, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super._orderedClips, "objectAtIndexedSubscript:", location);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v7;
    objc_msgSend(v7, "displayAssets");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", location);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          clipIndicesByAssetUUID = self->super._clipIndicesByAssetUUID;
          v15 = v12;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "alternateUUID");
          else
            objc_msgSend(v15, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](clipIndicesByAssetUUID, "setObject:forKeyedSubscript:", v13, v16);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    ++location;
  }

}

void __84__PXStoryConcreteMutableAutoEditClipCatalog_enumeratePairsOfMutableClipsUsingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  v9 = v6;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *a4;
}

uint64_t __77__PXStoryConcreteMutableAutoEditClipCatalog_enumerateMutableClipsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
