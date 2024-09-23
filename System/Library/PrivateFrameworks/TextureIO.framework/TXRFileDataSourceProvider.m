@implementation TXRFileDataSourceProvider

- (TXRFileDataSourceProvider)initWithURL:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  TXRFileDataSourceProvider *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *fileIOQueue;
  dispatch_semaphore_t v17;
  OS_dispatch_semaphore *infoLoaded;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v24;
  TXRFileDataSourceProvider *v25;
  id v26;
  id v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)TXRFileDataSourceProvider;
  v13 = -[TXRFileDataSourceProvider init](&v28, sel_init);
  if (v13)
  {
    if ((objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create("com.apple.txrtextureloaderfileio", v14);
      fileIOQueue = v13->_fileIOQueue;
      v13->_fileIOQueue = (OS_dispatch_queue *)v15;

      v17 = dispatch_semaphore_create(0);
      infoLoaded = v13->_infoLoaded;
      v13->_infoLoaded = (OS_dispatch_semaphore *)v17;

      v19 = v13->_fileIOQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__TXRFileDataSourceProvider_initWithURL_bufferAllocator_options_error___block_invoke;
      block[3] = &unk_1E977F5D0;
      v24 = v10;
      v25 = v13;
      v26 = v11;
      v27 = v12;
      dispatch_async(v19, block);

      v20 = v24;
LABEL_6:

      goto LABEL_7;
    }
    if (a6)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "lastPathComponent");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Could not find resource %@ at specified location."), v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _newTXRErrorWithCodeAndErrorString(1, (uint64_t)v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v13;
}

void __71__TXRFileDataSourceProvider_initWithURL_bufferAllocator_options_error___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  v3 = a1[4];
  v11 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfURL:options:error:", v3, 1, &v11);
  v5 = v11;
  v6 = (void *)a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v10 = 0;
  objc_msgSend(v6, "_parseData:bufferAllocator:options:error:", v4, v7, v8, &v10);
  v9 = v10;

}

- (TXRFileDataSourceProvider)initWithData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  TXRFileDataSourceProvider *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *fileIOQueue;
  NSObject *v16;
  _QWORD v18[4];
  TXRFileDataSourceProvider *v19;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TXRFileDataSourceProvider;
  v12 = -[TXRFileDataSourceProvider init](&v23, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.txrtextureloaderfileio", v13);
    fileIOQueue = v12->_fileIOQueue;
    v12->_fileIOQueue = (OS_dispatch_queue *)v14;

    v16 = v12->_fileIOQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke;
    v18[3] = &unk_1E977F5D0;
    v19 = v12;
    v20 = v9;
    v21 = v10;
    v22 = v11;
    dispatch_async(v16, v18);

  }
  return v12;
}

id __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  id v6;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v6 = 0;
  objc_msgSend(v2, "_parseData:bufferAllocator:options:error:", v1, v3, v4, &v6);
  result = v6;
  if (result)
    __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke_cold_1();
  return result;
}

- (unint64_t)_determineFileType:(id)a3
{
  if (+[TXRParserKTX handlesData:](TXRParserKTX, "handlesData:", a3))
    return 1;
  else
    return 5;
}

- (void)_parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  __objc2_class *v13;
  TXRParser *v14;
  TXRParser *parser;
  TXRTextureInfo *v16;
  TXRTextureInfo *textureInfo;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[TXRFileDataSourceProvider _determineFileType:](self, "_determineFileType:", v18);
  if (v12 == 5)
  {
    v13 = TXRParserImageIO;
  }
  else
  {
    if (v12 != 1)
      -[TXRFileDataSourceProvider _parseData:bufferAllocator:options:error:].cold.1();
    v13 = TXRParserKTX;
  }
  v14 = (TXRParser *)objc_alloc_init(v13);
  parser = self->_parser;
  self->_parser = v14;

  if (-[TXRParser parseData:bufferAllocator:options:error:](self->_parser, "parseData:bufferAllocator:options:error:", v18, v10, v11, a6))
  {
    -[TXRParser textureInfo](self->_parser, "textureInfo");
    v16 = (TXRTextureInfo *)objc_claimAutoreleasedReturnValue();
    textureInfo = self->_textureInfo;
    self->_textureInfo = v16;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_infoLoaded);
  }

}

- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  return (id)-[TXRParser parsedImageAtLevel:element:face:](self->_parser, "parsedImageAtLevel:element:face:", a3, a4, a5);
}

- (id)provideTextureInfo
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_infoLoaded, 0xFFFFFFFFFFFFFFFFLL);
  return self->_textureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureInfo, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_infoLoaded, 0);
  objc_storeStrong((id *)&self->_fileIOQueue, 0);
  objc_storeStrong((id *)&self->_bufferAllocator, 0);
}

void __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke_cold_1()
{
  __assert_rtn("-[TXRFileDataSourceProvider initWithData:bufferAllocator:options:error:]_block_invoke", "TXRFileDataSourceProvider.m", 91, "!\"TODO: Must be able to return error to dipatching thread\");
}

- (void)_parseData:bufferAllocator:options:error:.cold.1()
{
  __assert_rtn("-[TXRFileDataSourceProvider _parseData:bufferAllocator:options:error:]", "TXRFileDataSourceProvider.m", 123, "!\"Unhandled fileType\");
}

@end
