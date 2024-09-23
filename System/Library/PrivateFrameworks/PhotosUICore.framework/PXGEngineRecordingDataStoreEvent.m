@implementation PXGEngineRecordingDataStoreEvent

- (PXGEngineRecordingDataStoreEvent)initWithTextures:(id)a3 dataStore:(id)a4 spriteIndexes:(id)a5 screenScale:(double)a6
{
  id v10;
  id v11;
  id v12;
  PXGEngineRecordingDataStoreEvent *v13;
  uint64_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  size_t v18;
  $738B17BD11CC339B30296C0EA03CEC2B *entities;
  id v20;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *geometries;
  id v22;
  $225AF24142A77900D29617A74D173C5F *styles;
  id v24;
  id *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id *v30;
  _QWORD *v31;
  double v32;
  _QWORD v33[4];
  objc_super v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PXGEngineRecordingDataStoreEvent;
  v13 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v34, sel_initWithComponent_eventName_, 0, CFSTR("dataStore"));
  if (v13)
  {
    v27 = v11;
    v14 = objc_msgSend(v11, "count");
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = v14;
    v15 = 4 * v14;
    v13->_entities = ($738B17BD11CC339B30296C0EA03CEC2B *)malloc_type_malloc(v15, 0x100004052888210uLL);
    v16 = 32 * v14;
    v13->_geometries = ($16EC8B44B1C22DB88FC318D5A7EDDAB2 *)malloc_type_malloc(32 * v14, 0x1000040E0EAB150uLL);
    v17 = 160 * v14;
    v13->_styles = ($225AF24142A77900D29617A74D173C5F *)malloc_type_malloc(160 * v14, 0x1000040FE7FAB29uLL);
    v18 = 40 * v14;
    v13->_infos = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)malloc_type_malloc(40 * v14, 0x100004081CBAE78uLL);
    v13->_textureInfos = ($3BA783FF50B239963188BE194EBFFEBA *)malloc_type_malloc(v14 << 6, 0x100004011B15C4DuLL);
    v13->_textureInfoSprites = (unsigned int *)malloc_type_malloc(v15, 0x100004052888210uLL);
    entities = v13->_entities;
    v20 = objc_retainAutorelease(v27);
    memcpy(entities, (const void *)objc_msgSend(v20, "entities"), v15);
    geometries = v13->_geometries;
    v22 = objc_retainAutorelease(v20);
    memcpy(geometries, (const void *)objc_msgSend(v22, "geometries"), v16);
    styles = v13->_styles;
    v24 = objc_retainAutorelease(v22);
    memcpy(styles, (const void *)objc_msgSend(v24, "styles"), v17);
    memcpy(v13->_infos, (const void *)objc_msgSend(objc_retainAutorelease(v24), "infos"), v18);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __89__PXGEngineRecordingDataStoreEvent_initWithTextures_dataStore_spriteIndexes_screenScale___block_invoke;
    v28[3] = &unk_1E51338F8;
    v29 = v12;
    v31 = v33;
    v25 = v13;
    v30 = v25;
    v32 = a6;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v28);
    objc_storeStrong(v25 + 11, a5);

    _Block_object_dispose(v33, 8);
    v11 = v27;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_styles);
  free(self->_infos);
  free(self->_geometries);
  free(self->_entities);
  free(self->_textureInfos);
  free(self->_textureInfoSprites);
  v3.receiver = self;
  v3.super_class = (Class)PXGEngineRecordingDataStoreEvent;
  -[PXGEngineRecordingDataStoreEvent dealloc](&v3, sel_dealloc);
}

- (id)serializable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSIndexSet *spriteIndexes;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  PXGSpriteTextureInfoSerializable *v12;
  $3BA783FF50B239963188BE194EBFFEBA *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  PXGEngineRecordingDataStoreSerializable *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  _OWORD v24[4];
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  spriteIndexes = self->_spriteIndexes;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__PXGEngineRecordingDataStoreEvent_serializable__block_invoke;
  v25[3] = &unk_1E5133920;
  v25[4] = self;
  v23 = v3;
  v26 = v23;
  v22 = v4;
  v27 = v22;
  v21 = v5;
  v28 = v21;
  v20 = v6;
  v29 = v20;
  -[NSIndexSet enumerateIndexesUsingBlock:](spriteIndexes, "enumerateIndexesUsingBlock:", v25);
  if (self->_textureInfoCount >= 1)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = self->_textureInfoSprites[v10];
      if (-[NSIndexSet containsIndex:](self->_spriteIndexes, "containsIndex:", v11))
      {
        v12 = objc_alloc_init(PXGSpriteTextureInfoSerializable);
        v13 = &self->_textureInfos[v9];
        v14 = *(_OWORD *)&v13[12].var0;
        v16 = *(_OWORD *)&v13->var0;
        v15 = *(_OWORD *)&v13[4].var0;
        v24[2] = *(_OWORD *)&v13[8].var0;
        v24[3] = v14;
        v24[0] = v16;
        v24[1] = v15;
        -[PXGSpriteTextureInfoSerializable setSpriteTextureInfo:](v12, "setSpriteTextureInfo:", v24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v12, v17);

      }
      ++v10;
      v9 += 16;
    }
    while (self->_textureInfoCount > v10);
  }
  v18 = objc_alloc_init(PXGEngineRecordingDataStoreSerializable);
  -[PXGEngineRecordingDataStoreSerializable setSpriteStyles:](v18, "setSpriteStyles:", v23);
  -[PXGEngineRecordingDataStoreSerializable setSpriteInfos:](v18, "setSpriteInfos:", v22);
  -[PXGEngineRecordingDataStoreSerializable setSpriteGeometries:](v18, "setSpriteGeometries:", v21);
  -[PXGEngineRecordingDataStoreSerializable setSpriteEntities:](v18, "setSpriteEntities:", v20);
  -[PXGEngineRecordingDataStoreSerializable setSpriteTextureInfos:](v18, "setSpriteTextureInfos:", v7);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndexes, 0);
}

void __48__PXGEngineRecordingDataStoreEvent_serializable__block_invoke(_QWORD *a1, uint64_t a2)
{
  PXGSpriteStyleSerializable *v4;
  void *v5;
  void *v6;
  PXGSpriteInfoSerializable *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  PXGSpriteGeometrySerializable *v13;
  _OWORD *v14;
  __int128 v15;
  void *v16;
  void *v17;
  PXGSpriteEntitySerializable *v18;
  void *v19;
  void *v20;
  _OWORD v21[2];
  _OWORD v22[2];
  uint64_t v23;
  _BYTE __dst[168];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(PXGSpriteStyleSerializable);
  memmove(__dst, (const void *)(*(_QWORD *)(a1[4] + 40) + 160 * a2), 0xA0uLL);
  -[PXGSpriteStyleSerializable setSpriteStyle:](v4, "setSpriteStyle:", __dst);
  v5 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v6);

  v7 = objc_alloc_init(PXGSpriteInfoSerializable);
  v8 = *(_QWORD *)(a1[4] + 48) + 40 * a2;
  v9 = *(_OWORD *)v8;
  v10 = *(_OWORD *)(v8 + 16);
  v23 = *(_QWORD *)(v8 + 32);
  v22[0] = v9;
  v22[1] = v10;
  -[PXGSpriteInfoSerializable setSpriteInfo:](v7, "setSpriteInfo:", v22);
  v11 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v7, v12);

  v13 = objc_alloc_init(PXGSpriteGeometrySerializable);
  v14 = (_OWORD *)(*(_QWORD *)(a1[4] + 56) + 32 * a2);
  v15 = v14[1];
  v21[0] = *v14;
  v21[1] = v15;
  -[PXGSpriteGeometrySerializable setSpriteGeometry:](v13, "setSpriteGeometry:", v21);
  v16 = (void *)a1[7];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v13, v17);

  v18 = objc_alloc_init(PXGSpriteEntitySerializable);
  -[PXGSpriteEntitySerializable setSpriteEntity:](v18, "setSpriteEntity:", *(unsigned int *)(*(_QWORD *)(a1[4] + 64) + 4 * a2));
  v19 = (void *)a1[8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v18, v20);

}

void __89__PXGEngineRecordingDataStoreEvent_initWithTextures_dataStore_spriteIndexes_screenScale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  unsigned int v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a2, "intValue") & 0xFD) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v5;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v10, "spriteIndexes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "px_intersectionWithIndexSet:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "isCaptureTexture"))
            v14 = objc_msgSend(v10, "spriteGeometries") != 0;
          else
            v14 = 1;
          if (objc_msgSend(v13, "count"))
            v15 = !v14;
          else
            v15 = 1;
          if (!v15)
          {
            v16 = objc_msgSend(v10, "spriteCount");
            v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            v17 = _PXGArrayCapacityResizeToCount();
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v24;
            if ((v17 & 1) != 0)
              _PXGArrayResize();
            v18 = *(_QWORD **)(a1 + 40);
            v19 = v18[12];
            v20 = v18[10] + 4 * v19;
            v21 = v18[9] + (v19 << 6);
            objc_msgSend(v10, "getSpriteIndexes:maxSpriteCount:", v20, v16);
            objc_msgSend(v10, "getTextureInfos:forSpriteIndexes:geometries:spriteStyles:spriteInfos:screenScale:count:", v21, v20, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), v16, *(double *)(a1 + 56));
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) += v16;
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v7);
    }

    v5 = v22;
  }

}

+ (id)eventWithTextures:(id)a3 dataStore:(id)a4 spriteIndexes:(id)a5 screenScale:(double)a6
{
  id v9;
  id v10;
  id v11;
  PXGEngineRecordingDataStoreEvent *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[PXGEngineRecordingDataStoreEvent initWithTextures:dataStore:spriteIndexes:screenScale:]([PXGEngineRecordingDataStoreEvent alloc], "initWithTextures:dataStore:spriteIndexes:screenScale:", v11, v10, v9, a6);

  return v12;
}

@end
