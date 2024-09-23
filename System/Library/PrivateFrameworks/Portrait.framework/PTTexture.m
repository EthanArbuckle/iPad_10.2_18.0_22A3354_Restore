@implementation PTTexture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, 0);
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);
}

+ (id)createFromPixelbuffer:(__CVBuffer *)a3 device:(id)a4 read:(BOOL)a5 write:(BOOL)a6
{
  return (id)objc_msgSend(a1, "createFromPixelbuffer:device:textureCache:read:write:", a3, a4, 0, a5, a6);
}

- (NSString)transferFunction
{
  return self->_transferFunction;
}

- (NSString)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

+ (id)createYUV420:(id)a3 chroma:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTexLuma:", v6);

  objc_msgSend(v7, "setTexChroma:", v5);
  objc_msgSend(v7, "setColorPrimaries:", *MEMORY[0x1E0CA8D98]);
  objc_msgSend(v7, "setTransferFunction:", *MEMORY[0x1E0CA8EB0]);
  objc_msgSend(v7, "setYCbCrMatrix:", *MEMORY[0x1E0CA8F18]);
  objc_msgSend(v7, "setYCbCrColorDepth:", 0);
  objc_msgSend(v7, "setYCbCrFullRange:", 1);
  return v7;
}

- (void)setYCbCrMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, a3);
}

- (void)setYCbCrFullRange:(BOOL)a3
{
  self->_YCbCrFullRange = a3;
}

- (void)setYCbCrColorDepth:(int64_t)a3
{
  self->_YCbCrColorDepth = a3;
}

- (void)setTransferFunction:(id)a3
{
  objc_storeStrong((id *)&self->_transferFunction, a3);
}

- (void)setColorPrimaries:(id)a3
{
  objc_storeStrong((id *)&self->_colorPrimaries, a3);
}

- (void)copyMetadataTo:(id)a3
{
  NSString *colorPrimaries;
  id v5;

  colorPrimaries = self->_colorPrimaries;
  v5 = a3;
  objc_msgSend(v5, "setColorPrimaries:", colorPrimaries);
  objc_msgSend(v5, "setTransferFunction:", self->_transferFunction);
  objc_msgSend(v5, "setYCbCrMatrix:", self->_YCbCrMatrix);
  objc_msgSend(v5, "setYCbCrColorDepth:", self->_YCbCrColorDepth);
  objc_msgSend(v5, "setYCbCrFullRange:", self->_YCbCrFullRange);

}

+ (id)createRGBA:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTexRGBA:", v3);

  objc_msgSend(v4, "setColorPrimaries:", *MEMORY[0x1E0CA8D98]);
  objc_msgSend(v4, "setTransferFunction:", *MEMORY[0x1E0CA8EB0]);
  objc_msgSend(v4, "setYCbCrMatrix:", *MEMORY[0x1E0CA8F18]);
  objc_msgSend(v4, "setYCbCrColorDepth:", 0);
  objc_msgSend(v4, "setYCbCrFullRange:", 1);
  return v4;
}

+ (id)createFromPixelbuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 read:(BOOL)a6 write:(BOOL)a7
{
  _BOOL8 v8;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;

  v8 = a6;
  v11 = a4;
  v12 = +[PTPixelBufferUtil isRGB:](PTPixelBufferUtil, "isRGB:", a3);
  if (v12)
  {
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:textureCache:sRGB:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:textureCache:sRGB:", a3, v11, a5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PTTexture createRGBA:](PTTexture, "createRGBA:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = 0;
    v37 = 0;
    LOBYTE(v35) = a7;
    v15 = +[PTPixelBufferUtil createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:](PTPixelBufferUtil, "createTexturesFromPixelBuffer:device:textureCache:outLuma:outChroma:read:write:", a3, v11, a5, &v37, &v36, v8, v35);

    if (v15)
    {

      return 0;
    }
    +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v37, v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTPixelBufferUtil getAttachmentString:forKey:](PTPixelBufferUtil, "getAttachmentString:forKey:", a3, *MEMORY[0x1E0CA8EE8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setYCbCrMatrix:", v17);

    objc_msgSend(v14, "YCbCrMatrix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      _PTLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[PTTexture createFromPixelbuffer:device:textureCache:read:write:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

      objc_msgSend(v14, "setYCbCrMatrix:", *MEMORY[0x1E0CA8F18]);
    }
    objc_msgSend(v14, "setYCbCrFullRange:", +[PTPixelBufferUtil isPixelBufferFullRange:](PTPixelBufferUtil, "isPixelBufferFullRange:", a3));
    if (+[PTPixelBufferUtil isPixelBuffer10Bit:](PTPixelBufferUtil, "isPixelBuffer10Bit:", a3))
      v27 = 10;
    else
      v27 = 8;
    objc_msgSend(v14, "setYCbCrColorDepth:", v27);

  }
  +[PTPixelBufferUtil getAttachmentString:forKey:](PTPixelBufferUtil, "getAttachmentString:forKey:", a3, *MEMORY[0x1E0CA8D68]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColorPrimaries:", v28);

  +[PTPixelBufferUtil getAttachmentString:forKey:](PTPixelBufferUtil, "getAttachmentString:forKey:", a3, *MEMORY[0x1E0CA8E98]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTransferFunction:", v29);

  objc_msgSend(v14, "transferFunction");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    +[PTPixelBufferUtil getAttachmentString:forKey:](PTPixelBufferUtil, "getAttachmentString:forKey:", a3, *MEMORY[0x1E0CA8E48]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTransferFunction:", v31);

  }
  objc_msgSend(v14, "transferFunction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    v33 = (_QWORD *)MEMORY[0x1E0CA8EB8];
    if (!v12)
      v33 = (_QWORD *)MEMORY[0x1E0CA8EB0];
    objc_msgSend(v14, "setTransferFunction:", *v33);
    _PTLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[PTTexture createFromPixelbuffer:device:textureCache:read:write:].cold.1(v14, v34);

  }
  return v14;
}

- (unint64_t)width
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _PTLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[PTTexture width].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (unint64_t)height
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _PTLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[PTTexture width].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (NSString)colorPrimaries
{
  return self->_colorPrimaries;
}

- (int64_t)YCbCrColorDepth
{
  return self->_YCbCrColorDepth;
}

- (BOOL)YCbCrFullRange
{
  return self->_YCbCrFullRange;
}

- (BOOL)isRGB
{
  NSObject *v2;

  _PTLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[PTTexture(PTTextureAdditions) isRGB].cold.1(v2);

  return 0;
}

+ (void)createFromPixelbuffer:(void *)a1 device:(NSObject *)a2 textureCache:read:write:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "transferFunction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "createFromPixelbuffer: TransferFunctionKey not found. Using %@", (uint8_t *)&v4, 0xCu);

}

+ (void)createFromPixelbuffer:(uint64_t)a3 device:(uint64_t)a4 textureCache:(uint64_t)a5 read:(uint64_t)a6 write:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "createFromPixelbuffer: kCVImageBufferYCbCrMatrixKey not found. Using R709", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)width
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Should be overridden", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

@end
