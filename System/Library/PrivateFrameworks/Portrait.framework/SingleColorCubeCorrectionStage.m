@implementation SingleColorCubeCorrectionStage

- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6
{
  objc_class *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  _QWORD v18[6];

  v9 = (objc_class *)MEMORY[0x1E0CC6BB0];
  v10 = a5;
  v11 = objc_alloc_init(v9);
  if (!v11)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SingleColorCubeCorrectionStage load3DTextureFromData:cubeSize:metal:outTexture:].cold.1(v12);

  }
  objc_msgSend(v11, "setTextureType:", 7);
  objc_msgSend(v11, "setWidth:", a4);
  objc_msgSend(v11, "setHeight:", a4);
  objc_msgSend(v11, "setDepth:", a4);
  objc_msgSend(v11, "setPixelFormat:", 70);
  objc_msgSend(v11, "setUsage:", 1);
  v13 = (void *)objc_msgSend(v10, "newTextureWithDescriptor:", v11);

  v14 = *a6;
  *a6 = v13;

  v15 = *a6;
  if (*a6)
  {
    memset(v18, 0, 24);
    v18[3] = a4;
    v18[4] = a4;
    v18[5] = a4;
    objc_msgSend(v15, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v18, 0, 0, a3, 4 * a4, 4 * a4 * a4);
    v16 = 0;
  }
  else
  {
    v16 = -1;
  }

  return v16;
}

- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5
{
  uint64_t v6;
  id v8;
  SingleColorCubeCorrectionStage *v9;
  SingleColorCubeCorrectionStage *v10;
  NSObject *v11;
  SingleColorCubeCorrectionStage *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SingleColorCubeCorrectionStage;
  v9 = -[SingleColorCubeCorrectionStage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!-[SingleColorCubeCorrectionStage load3DTextureFromData:cubeSize:metal:outTexture:](v9, "load3DTextureFromData:cubeSize:metal:outTexture:", a5, v6, v8, &v9->_defaultCubeTexture))
    {
      v12 = v10;
      goto LABEL_8;
    }
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SingleColorCubeCorrectionStage init:cubeSize:data:].cold.1(v11);

  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)cubeTexture
{
  return self->_defaultCubeTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCubeTexture, 0);
}

- (void)load3DTextureFromData:(os_log_t)log cubeSize:metal:outTexture:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "texDesc";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)init:(os_log_t)log cubeSize:data:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "SingleColorCubeCorrectionStage: cannot load 3d LUT from data!", v1, 2u);
}

@end
