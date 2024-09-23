@implementation PTAssetFSDNetworkInputReader

- (PTAssetFSDNetworkInputReader)initWithURL:(id)a3
{
  id v5;
  PTAssetFSDNetworkInputReader *v6;
  void *v7;
  void *v8;
  int v9;
  PTAssetFSDNetworkInputReader *v10;
  uint64_t v11;
  const __CFDictionary *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PTAssetFSDNetworkInputReader;
  v6 = -[PTAssetFSDNetworkInputReader init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

    v10 = 0;
    if (v9)
    {
      objc_storeStrong((id *)&v6->_url, a3);
      v6->_frameIndex = 0;
      v11 = *MEMORY[0x1E0CA8F68];
      v15[0] = *MEMORY[0x1E0CA8FF0];
      v15[1] = v11;
      v16[0] = MEMORY[0x1E0C9AA70];
      v16[1] = &unk_1E82521C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CVPixelBufferCreate(0, 0x200uLL, 0x120uLL, 0x52476841u, v12, &v6->_refBuffer);
      CVPixelBufferCreate(0, 0x240uLL, 0x160uLL, 0x52476841u, v12, &v6->_auxBuffer);
      v10 = v6;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_readRGBABufferFromFile:(id)a3 to:(__CVBuffer *)a4
{
  id v5;
  size_t Width;
  size_t Height;
  id v8;
  FILE *v9;
  FILE *v10;
  void *BaseAddress;
  size_t v12;
  uint64_t v13;
  BOOL v14;
  size_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  if (!a4)
  {
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_10;
  }
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v8 = objc_retainAutorelease(v5);
  v9 = fopen((const char *)objc_msgSend(v8, "UTF8String"), "r");
  if (!v9)
  {
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:].cold.2((uint64_t)v8, v16, v24, v25, v26, v27, v28, v29);
    goto LABEL_10;
  }
  v10 = v9;
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a4);
  v12 = Width * Height;
  v13 = 8 * Width * Height;
  v14 = 1;
  v15 = fread(BaseAddress, 1uLL, v13, v10);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  fclose(v10);
  if (v15 != 8 * v12)
  {
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:].cold.3(v13, v15, v16);
LABEL_10:

    v14 = 0;
  }

  return v14;
}

- (id)copyNextFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  PTAssetFSDNetworkInputFrame *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v48;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL path](self->_url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/Undistorted/%08i_rectifiedReference.RGhA"), v4, self->_frameIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL path](self->_url, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/Undistorted/%08i_rectifiedAuxiliaryPadded.RGhA"), v7, self->_frameIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:](self, "_readRGBABufferFromFile:to:", v5, self->_refBuffer);
  v9 = -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:](self, "_readRGBABufferFromFile:to:", v8, self->_auxBuffer);
  if ((_DWORD)v7 && v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[NSURL path](self->_url, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/Inputs/%08i_options.metadata.plist"), v11, self->_frameIndex);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithFileAtPath:", v12);
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "open");
      v48 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v14, 0, 0, &v48);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v48;
      if (v16)
      {
        _PTLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PTAssetFSDNetworkInputReader copyNextFrame].cold.3((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

      }
      objc_msgSend(v14, "close");
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CorrectedCalibration"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        goto LABEL_18;
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PTAssetFSDNetworkInputReader copyNextFrame].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    else
    {
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PTAssetFSDNetworkInputReader copyNextFrame].cold.1((uint64_t)v12, v25, v41, v42, v43, v44, v45, v46);
      v16 = 0;
    }

    v24 = 0;
LABEL_18:
    v40 = -[PTAssetFSDNetworkInputFrame initWithRef:aux:unrectifyData:index:]([PTAssetFSDNetworkInputFrame alloc], "initWithRef:aux:unrectifyData:index:", self->_refBuffer, self->_auxBuffer, v24, self->_frameIndex++);

    goto LABEL_19;
  }
  _PTLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[PTAssetFSDNetworkInputReader copyNextFrame].cold.4(v16, v33, v34, v35, v36, v37, v38, v39);
  v40 = 0;
LABEL_19:

  return v40;
}

- (id)globals
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)_readRGBABufferFromFile:(uint64_t)a3 to:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Output pixelbuffer not allocated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)_readRGBABufferFromFile:(uint64_t)a3 to:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "Failed to open file %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_readRGBABufferFromFile:(os_log_t)log to:.cold.3(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Failed to read file (expected %i vs read %i)", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)copyNextFrame
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Failed to read ref and/or aux images", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

@end
