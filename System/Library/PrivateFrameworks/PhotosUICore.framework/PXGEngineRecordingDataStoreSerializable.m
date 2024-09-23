@implementation PXGEngineRecordingDataStoreSerializable

- (PXGEngineRecordingDataStoreSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGEngineRecordingDataStoreSerializable *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGEngineRecordingDataStoreSerializable;
  v5 = -[PXGEngineRecordingDataStoreSerializable init](&v18, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteStyles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateDictionaryWithTransforms(v7, &__block_literal_global_5_187880, &__block_literal_global_150436);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngineRecordingDataStoreSerializable setSpriteStyles:](v5, "setSpriteStyles:", v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteInfos"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateDictionaryWithTransforms(v9, &__block_literal_global_5_187880, &__block_literal_global_57);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngineRecordingDataStoreSerializable setSpriteInfos:](v5, "setSpriteInfos:", v10);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteGeometries"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateDictionaryWithTransforms(v11, &__block_literal_global_5_187880, &__block_literal_global_60);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngineRecordingDataStoreSerializable setSpriteGeometries:](v5, "setSpriteGeometries:", v12);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteEntities"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXGCreateDictionaryWithTransforms(v13, &__block_literal_global_5_187880, &__block_literal_global_63);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngineRecordingDataStoreSerializable setSpriteEntities:](v5, "setSpriteEntities:", v14);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteTextureInfos"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PXGCreateDictionaryWithTransforms(v15, &__block_literal_global_5_187880, &__block_literal_global_66);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngineRecordingDataStoreSerializable setSpriteTextureInfos:](v5, "setSpriteTextureInfos:", v16);

  }
  return v5;
}

- (id)createSerializableObject
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
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("spriteStyles");
  -[PXGEngineRecordingDataStoreSerializable spriteStyles](self, "spriteStyles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateDictionaryWithTransforms(v14, &__block_literal_global_2_187874, &__block_literal_global_8_187884);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  v15[1] = CFSTR("spriteInfos");
  -[PXGEngineRecordingDataStoreSerializable spriteInfos](self, "spriteInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateDictionaryWithTransforms(v3, &__block_literal_global_2_187874, &__block_literal_global_8_187884);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("spriteGeometries");
  -[PXGEngineRecordingDataStoreSerializable spriteGeometries](self, "spriteGeometries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateDictionaryWithTransforms(v5, &__block_literal_global_2_187874, &__block_literal_global_8_187884);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  v15[3] = CFSTR("spriteEntities");
  -[PXGEngineRecordingDataStoreSerializable spriteEntities](self, "spriteEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateDictionaryWithTransforms(v7, &__block_literal_global_2_187874, &__block_literal_global_8_187884);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = CFSTR("spriteTextureInfos");
  -[PXGEngineRecordingDataStoreSerializable spriteTextureInfos](self, "spriteTextureInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXGCreateDictionaryWithTransforms(v9, &__block_literal_global_2_187874, &__block_literal_global_8_187884);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)spriteStyles
{
  return self->_spriteStyles;
}

- (void)setSpriteStyles:(id)a3
{
  objc_storeStrong((id *)&self->_spriteStyles, a3);
}

- (NSDictionary)spriteInfos
{
  return self->_spriteInfos;
}

- (void)setSpriteInfos:(id)a3
{
  objc_storeStrong((id *)&self->_spriteInfos, a3);
}

- (NSDictionary)spriteGeometries
{
  return self->_spriteGeometries;
}

- (void)setSpriteGeometries:(id)a3
{
  objc_storeStrong((id *)&self->_spriteGeometries, a3);
}

- (NSDictionary)spriteEntities
{
  return self->_spriteEntities;
}

- (void)setSpriteEntities:(id)a3
{
  objc_storeStrong((id *)&self->_spriteEntities, a3);
}

- (NSDictionary)spriteTextureInfos
{
  return self->_spriteTextureInfos;
}

- (void)setSpriteTextureInfos:(id)a3
{
  objc_storeStrong((id *)&self->_spriteTextureInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteTextureInfos, 0);
  objc_storeStrong((id *)&self->_spriteEntities, 0);
  objc_storeStrong((id *)&self->_spriteGeometries, 0);
  objc_storeStrong((id *)&self->_spriteInfos, 0);
  objc_storeStrong((id *)&self->_spriteStyles, 0);
}

PXGSpriteTextureInfoSerializable *__70__PXGEngineRecordingDataStoreSerializable_initWithSerializableObject___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  PXGSpriteTextureInfoSerializable *v3;

  v2 = a2;
  v3 = -[PXGSpriteTextureInfoSerializable initWithSerializableObject:]([PXGSpriteTextureInfoSerializable alloc], "initWithSerializableObject:", v2);

  return v3;
}

PXGSpriteEntitySerializable *__70__PXGEngineRecordingDataStoreSerializable_initWithSerializableObject___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  PXGSpriteEntitySerializable *v3;

  v2 = a2;
  v3 = -[PXGSpriteEntitySerializable initWithSerializableObject:]([PXGSpriteEntitySerializable alloc], "initWithSerializableObject:", v2);

  return v3;
}

PXGSpriteGeometrySerializable *__70__PXGEngineRecordingDataStoreSerializable_initWithSerializableObject___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  PXGSpriteGeometrySerializable *v3;

  v2 = a2;
  v3 = -[PXGSpriteGeometrySerializable initWithSerializableObject:]([PXGSpriteGeometrySerializable alloc], "initWithSerializableObject:", v2);

  return v3;
}

PXGSpriteInfoSerializable *__70__PXGEngineRecordingDataStoreSerializable_initWithSerializableObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PXGSpriteInfoSerializable *v3;

  v2 = a2;
  v3 = -[PXGSpriteInfoSerializable initWithSerializableObject:]([PXGSpriteInfoSerializable alloc], "initWithSerializableObject:", v2);

  return v3;
}

PXGSpriteStyleSerializable *__70__PXGEngineRecordingDataStoreSerializable_initWithSerializableObject___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXGSpriteStyleSerializable *v3;

  v2 = a2;
  v3 = -[PXGSpriteStyleSerializable initWithSerializableObject:]([PXGSpriteStyleSerializable alloc], "initWithSerializableObject:", v2);

  return v3;
}

@end
