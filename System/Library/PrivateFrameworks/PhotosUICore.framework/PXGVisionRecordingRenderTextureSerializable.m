@implementation PXGVisionRecordingRenderTextureSerializable

- (PXGVisionRecordingRenderTextureSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGVisionRecordingRenderTextureSerializable *v5;
  id v6;
  id v7;
  uint64_t v8;
  PXGMetalRecordingMetalSpriteTextureSerializable *v9;
  void *v10;
  PXGMetalRecordingMetalSpriteTextureSerializable *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PXGVisionRecordingRenderTextureSerializable;
  v5 = -[PXGVisionRecordingRenderTextureSerializable init](&v30, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entity"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntValue");

    -[PXGVisionRecordingRenderTextureSerializable setEntity:](v5, "setEntity:", v8);
    v9 = [PXGMetalRecordingMetalSpriteTextureSerializable alloc];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("texture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXGMetalRecordingMetalSpriteTextureSerializable initWithSerializableObject:](v9, "initWithSerializableObject:", v10);
    -[PXGVisionRecordingRenderTextureSerializable setTexture:](v5, "setTexture:", v11);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("materialIdentifier"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (int)objc_msgSend(v12, "intValue");

    -[PXGVisionRecordingRenderTextureSerializable setMaterialIdentifier:](v5, "setMaterialIdentifier:", v13);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wantsMaterial"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[PXGVisionRecordingRenderTextureSerializable setWantsMaterial:](v5, "setWantsMaterial:", v15);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wantsMaterialUpdate"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    -[PXGVisionRecordingRenderTextureSerializable setWantsMaterialUpdate:](v5, "setWantsMaterialUpdate:", v17);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasFallbackMaterial"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    -[PXGVisionRecordingRenderTextureSerializable setHasFallbackMaterial:](v5, "setHasFallbackMaterial:", v19);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reuseType"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (int)objc_msgSend(v20, "intValue");

    -[PXGVisionRecordingRenderTextureSerializable setReuseType:](v5, "setReuseType:", v21);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("instanceCount"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = (int)objc_msgSend(v22, "intValue");

    -[PXGVisionRecordingRenderTextureSerializable setInstanceCount:](v5, "setInstanceCount:", v23);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spriteIndices"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_165394);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGVisionRecordingRenderTextureSerializable setSpriteIndices:](v5, "setSpriteIndices:", v25);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("removed"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v26;
    v28 = objc_msgSend(v27, "BOOLValue");

    -[PXGVisionRecordingRenderTextureSerializable setRemoved:](v5, "setRemoved:", v28);
  }

  return v5;
}

- (id)createSerializableObject
{
  unint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[10];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("entity");
  v3 = -[PXGVisionRecordingRenderTextureSerializable entity](self, "entity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  v24[1] = CFSTR("texture");
  -[PXGVisionRecordingRenderTextureSerializable texture](self, "texture");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createSerializableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  v24[2] = CFSTR("materialIdentifier");
  v5 = -[PXGVisionRecordingRenderTextureSerializable materialIdentifier](self, "materialIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  v24[3] = CFSTR("wantsMaterial");
  v7 = -[PXGVisionRecordingRenderTextureSerializable wantsMaterial](self, "wantsMaterial");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v8;
  v24[4] = CFSTR("wantsMaterialUpdate");
  v9 = -[PXGVisionRecordingRenderTextureSerializable wantsMaterialUpdate](self, "wantsMaterialUpdate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v10;
  v24[5] = CFSTR("hasFallbackMaterial");
  v11 = -[PXGVisionRecordingRenderTextureSerializable hasFallbackMaterial](self, "hasFallbackMaterial");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v12;
  v24[6] = CFSTR("reuseType");
  v13 = -[PXGVisionRecordingRenderTextureSerializable reuseType](self, "reuseType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v14;
  v24[7] = CFSTR("instanceCount");
  v15 = -[PXGVisionRecordingRenderTextureSerializable instanceCount](self, "instanceCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v16;
  v24[8] = CFSTR("spriteIndices");
  -[PXGVisionRecordingRenderTextureSerializable spriteIndices](self, "spriteIndices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v17;
  v24[9] = CFSTR("removed");
  v18 = -[PXGVisionRecordingRenderTextureSerializable removed](self, "removed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)entity
{
  return self->_entity;
}

- (void)setEntity:(unint64_t)a3
{
  self->_entity = a3;
}

- (PXGMetalRecordingMetalSpriteTextureSerializable)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- (int64_t)materialIdentifier
{
  return self->_materialIdentifier;
}

- (void)setMaterialIdentifier:(int64_t)a3
{
  self->_materialIdentifier = a3;
}

- (BOOL)wantsMaterial
{
  return self->_wantsMaterial;
}

- (void)setWantsMaterial:(BOOL)a3
{
  self->_wantsMaterial = a3;
}

- (BOOL)wantsMaterialUpdate
{
  return self->_wantsMaterialUpdate;
}

- (void)setWantsMaterialUpdate:(BOOL)a3
{
  self->_wantsMaterialUpdate = a3;
}

- (BOOL)hasFallbackMaterial
{
  return self->_hasFallbackMaterial;
}

- (void)setHasFallbackMaterial:(BOOL)a3
{
  self->_hasFallbackMaterial = a3;
}

- (int64_t)reuseType
{
  return self->_reuseType;
}

- (void)setReuseType:(int64_t)a3
{
  self->_reuseType = a3;
}

- (int64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(int64_t)a3
{
  self->_instanceCount = a3;
}

- (NSArray)spriteIndices
{
  return self->_spriteIndices;
}

- (void)setSpriteIndices:(id)a3
{
  objc_storeStrong((id *)&self->_spriteIndices, a3);
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndices, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

BOOL __74__PXGVisionRecordingRenderTextureSerializable_initWithSerializableObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unsigned int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "unsignedIntValue");
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return a2 > v5;
}

@end
