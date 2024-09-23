@implementation PXGMetalRecordingTextureCreatedEventSerializable

- (PXGMetalRecordingTextureCreatedEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGMetalRecordingTextureCreatedEventSerializable *v5;
  id v6;
  PXGMetalRecordingMetalSpriteTextureSerializable *v7;
  void *v8;
  PXGMetalRecordingMetalSpriteTextureSerializable *v9;
  PXGTextureConverterOptionsSerializable *v10;
  void *v11;
  PXGTextureConverterOptionsSerializable *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXGMetalRecordingTextureCreatedEventSerializable;
  v5 = -[PXGMetalRecordingTextureCreatedEventSerializable init](&v14, sel_init);
  if (v5)
  {
    v6 = v4;
    v7 = [PXGMetalRecordingMetalSpriteTextureSerializable alloc];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("texture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXGMetalRecordingMetalSpriteTextureSerializable initWithSerializableObject:](v7, "initWithSerializableObject:", v8);
    -[PXGMetalRecordingTextureCreatedEventSerializable setTexture:](v5, "setTexture:", v9);

    v10 = [PXGTextureConverterOptionsSerializable alloc];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[PXGTextureConverterOptionsSerializable initWithSerializableObject:](v10, "initWithSerializableObject:", v11);
    -[PXGMetalRecordingTextureCreatedEventSerializable setOptions:](v5, "setOptions:", v12);

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
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("texture");
  -[PXGMetalRecordingTextureCreatedEventSerializable texture](self, "texture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createSerializableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("options");
  v10[0] = v4;
  -[PXGMetalRecordingTextureCreatedEventSerializable options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createSerializableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXGMetalRecordingMetalSpriteTextureSerializable)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- (PXGTextureConverterOptionsSerializable)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
