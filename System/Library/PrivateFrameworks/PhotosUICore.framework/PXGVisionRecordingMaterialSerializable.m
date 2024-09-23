@implementation PXGVisionRecordingMaterialSerializable

- (PXGVisionRecordingMaterialSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGVisionRecordingMaterialSerializable *v5;
  id v6;
  uint64_t v7;
  NSString *shaderFlags;
  uint64_t v9;
  NSString *colorProgram;
  uint64_t v11;
  NSString *shader;
  id v13;
  char v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  int64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXGVisionRecordingMaterialSerializable;
  v5 = -[PXGVisionRecordingMaterialSerializable init](&v21, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shaderFlags"));
    v7 = objc_claimAutoreleasedReturnValue();
    shaderFlags = v5->_shaderFlags;
    v5->_shaderFlags = (NSString *)v7;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("colorProgram"));
    v9 = objc_claimAutoreleasedReturnValue();
    colorProgram = v5->_colorProgram;
    v5->_colorProgram = (NSString *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shader"));
    v11 = objc_claimAutoreleasedReturnValue();
    shader = v5->_shader;
    v5->_shader = (NSString *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isOpaque"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    v5->_isOpaque = v14;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasPlatter"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v5->_hasPlatter = v16;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v19 = (int)objc_msgSend(v18, "intValue");

    v5->_identifier = v19;
  }

  return v5;
}

- (id)createSerializableObject
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("shaderFlags");
  -[PXGVisionRecordingMaterialSerializable shaderFlags](self, "shaderFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("colorProgram");
  -[PXGVisionRecordingMaterialSerializable colorProgram](self, "colorProgram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("shader");
  -[PXGVisionRecordingMaterialSerializable shader](self, "shader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("isOpaque");
  v6 = -[PXGVisionRecordingMaterialSerializable isOpaque](self, "isOpaque");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  v14[4] = CFSTR("hasPlatter");
  v8 = -[PXGVisionRecordingMaterialSerializable hasPlatter](self, "hasPlatter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v9;
  v14[5] = CFSTR("identifier");
  v10 = -[PXGVisionRecordingMaterialSerializable identifier](self, "identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)shaderFlags
{
  return self->_shaderFlags;
}

- (void)setShaderFlags:(id)a3
{
  objc_storeStrong((id *)&self->_shaderFlags, a3);
}

- (NSString)colorProgram
{
  return self->_colorProgram;
}

- (void)setColorProgram:(id)a3
{
  objc_storeStrong((id *)&self->_colorProgram, a3);
}

- (NSString)shader
{
  return self->_shader;
}

- (void)setShader:(id)a3
{
  objc_storeStrong((id *)&self->_shader, a3);
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (BOOL)hasPlatter
{
  return self->_hasPlatter;
}

- (void)setHasPlatter:(BOOL)a3
{
  self->_hasPlatter = a3;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_storeStrong((id *)&self->_shaderFlags, 0);
}

@end
