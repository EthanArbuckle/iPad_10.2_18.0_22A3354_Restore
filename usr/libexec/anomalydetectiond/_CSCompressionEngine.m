@implementation _CSCompressionEngine

+ (id)processDataWithFunction:(int64_t)a3 algorithm:(int64_t)a4 content:(id)a5 progressBlock:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  _CSCompressionEngine *v11;
  char *v12;
  id v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;

  v9 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  v11 = -[_CSCompressionEngine initWithFunction:algorithm:destination:]([_CSCompressionEngine alloc], "initWithFunction:algorithm:destination:", a3, a4, 0);
  v12 = (char *)objc_msgSend(v9, "length");
  v13 = objc_retainAutorelease(v9);
  v14 = (char *)objc_msgSend(v13, "bytes");
  if (v12)
  {
    v15 = v14;
    v16 = 0;
    while (1)
    {
      v17 = (unint64_t)&v12[-v16] >= 0x10000 ? 0x10000 : (uint64_t)&v12[-v16];
      if (!-[_CSCompressionEngine _processIncomingData:length:flags:](v11, "_processIncomingData:length:flags:", &v15[v16], v17, 0))break;
      v16 += v17;
      if (v10)
        v10[2](v10, v16);
      if (v16 >= (unint64_t)v12)
        goto LABEL_10;
    }
    v18 = 0;
  }
  else
  {
LABEL_10:
    -[_CSCompressionEngine sourceContentFinished](v11, "sourceContentFinished");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_CSCompressionEngine sinkContent](v11, "sinkContent"));
  }

  return v18;
}

- (_CSCompressionEngine)initWithFunction:(int64_t)a3 algorithm:(int64_t)a4 destination:(id)a5
{
  id v8;
  _CSCompressionEngine *v9;
  _CSCompressionEngine *v10;
  NSMutableData *sinkContent;
  NSMutableData *v12;
  NSMutableData *destinationBuffer;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_CSCompressionEngine;
  v9 = -[_CSCompressionEngine init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    sinkContent = v9->_sinkContent;
    v9->_sinkContent = 0;

    -[_CSCompressionEngine _decodeEngineFunction:algorithm:](v10, "_decodeEngineFunction:algorithm:", a3, a4);
    objc_storeWeak((id *)&v10->_destination, v8);
    v12 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 0x10000);
    destinationBuffer = v10->_destinationBuffer;
    v10->_destinationBuffer = v12;

    if (!-[_CSCompressionEngine _initializeStream](v10, "_initializeStream"))
    {

      v10 = 0;
    }
  }

  return v10;
}

- (void)writeSourceContent:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  -[_CSCompressionEngine _processIncomingData:length:flags:](self, "_processIncomingData:length:flags:", v5, v6, 0);
}

- (void)sourceContentFinished
{
  id WeakRetained;
  id v4;

  -[_CSCompressionEngine _processIncomingData:length:flags:](self, "_processIncomingData:length:flags:", 0, 0, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_destination);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "sinkContentFinished");
    WeakRetained = v4;
  }

}

- (void)dealloc
{
  objc_super v3;

  compression_stream_destroy((compression_stream *)self->_stream);
  free(self->_stream);
  self->_stream = 0;
  v3.receiver = self;
  v3.super_class = (Class)_CSCompressionEngine;
  -[_CSCompressionEngine dealloc](&v3, "dealloc");
}

- (void)_decodeEngineFunction:(int64_t)a3 algorithm:(int64_t)a4
{
  int v4;

  if (a3)
  {
    if (a3 != 1)
      goto LABEL_6;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  self->_operation = v4;
LABEL_6:
  if ((unint64_t)a4 <= 3)
    self->_algorithm = dword_1002E4DE0[a4];
}

- (void)_gatherReadSinkContent:(id)a3
{
  id v4;
  NSMutableData *sinkContent;
  NSMutableData *v6;
  NSMutableData *v7;
  id v8;

  v4 = a3;
  sinkContent = self->_sinkContent;
  v8 = v4;
  if (!sinkContent)
  {
    v6 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0x10000);
    v7 = self->_sinkContent;
    self->_sinkContent = v6;

    v4 = v8;
    sinkContent = self->_sinkContent;
  }
  -[NSMutableData appendData:](sinkContent, "appendData:", v4);

}

- (unint64_t)_deliverDestinationContent
{
  unint64_t var1;
  unint64_t v3;
  id WeakRetained;
  void *v6;
  NSMutableData *destinationBuffer;

  var1 = self->_stream->var1;
  v3 = 0x10000 - var1;
  if (var1 != 0x10000)
  {
    -[NSMutableData setLength:](self->_destinationBuffer, "setLength:", 0x10000 - var1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_destination);
    v6 = WeakRetained;
    destinationBuffer = self->_destinationBuffer;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "receiveSinkContent:", destinationBuffer);
    else
      -[_CSCompressionEngine _gatherReadSinkContent:](self, "_gatherReadSinkContent:", destinationBuffer);
    -[NSMutableData setLength:](self->_destinationBuffer, "setLength:", 0x10000);
    self->_stream->var0 = (char *)-[NSMutableData mutableBytes](self->_destinationBuffer, "mutableBytes");
    self->_stream->var1 = 0x10000;

  }
  return v3;
}

- (BOOL)_initializeStream
{
  $D199E5C2C3D9BBBBA45D19FC310E2D7B *v3;
  $D199E5C2C3D9BBBBA45D19FC310E2D7B *stream;
  compression_stream *v5;
  void *v8;

  if (self->_stream)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CSCompressionEngine.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_stream == nil"));

  }
  v3 = ($D199E5C2C3D9BBBBA45D19FC310E2D7B *)malloc_type_malloc(0x28uLL, 0x10D00405C4BD7A1uLL);
  self->_stream = v3;
  v3->var0 = "";
  stream = self->_stream;
  stream->var1 = 0;
  stream->var2 = "";
  v5 = (compression_stream *)self->_stream;
  v5->src_size = 0;
  return compression_stream_init(v5, (compression_stream_operation)self->_operation, (compression_algorithm)self->_algorithm) == COMPRESSION_STATUS_OK;
}

- (BOOL)_processIncomingData:(const void *)a3 length:(unint64_t)a4 flags:(int)a5
{
  $D199E5C2C3D9BBBBA45D19FC310E2D7B *stream;
  compression_status v10;
  id WeakRetained;
  void *v12;
  unint64_t v13;
  BOOL v14;

  self->_stream->var0 = (char *)-[NSMutableData mutableBytes](self->_destinationBuffer, "mutableBytes");
  stream = self->_stream;
  stream->var1 = 0x10000;
  stream->var2 = (char *)a3;
  self->_stream->var3 = a4;
  if (!a4 && (a5 & 1) == 0)
    return 1;
  while (1)
  {
    while (1)
    {
      v10 = compression_stream_process((compression_stream *)self->_stream, a5);
      WeakRetained = objc_loadWeakRetained((id *)&self->_destination);
      v12 = WeakRetained;
      if (v10)
        break;
      v13 = self->_stream->var3 | -[_CSCompressionEngine _deliverDestinationContent](self, "_deliverDestinationContent");

      if (!v13)
        return 1;
    }
    if (v10 == COMPRESSION_STATUS_ERROR)
      break;
    if (v10 == COMPRESSION_STATUS_END)
    {
      -[_CSCompressionEngine _deliverDestinationContent](self, "_deliverDestinationContent");
      v14 = 1;
      goto LABEL_13;
    }

  }
  if (WeakRetained)
    objc_msgSend(WeakRetained, "receiveSinkContent:", 0);
  v14 = 0;
LABEL_13:

  return v14;
}

- (NSMutableData)sinkContent
{
  return self->_sinkContent;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(int)a3
{
  self->_algorithm = a3;
}

- (_CSStreamingDestination)destination
{
  return (_CSStreamingDestination *)objc_loadWeakRetained((id *)&self->_destination);
}

- (void)setDestination:(id)a3
{
  objc_storeWeak((id *)&self->_destination, a3);
}

- (NSMutableData)destinationBuffer
{
  return self->_destinationBuffer;
}

- (void)setDestinationBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_destinationBuffer, a3);
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)stream
{
  return self->_stream;
}

- (void)setStream:(id *)a3
{
  self->_stream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationBuffer, 0);
  objc_destroyWeak((id *)&self->_destination);
  objc_storeStrong((id *)&self->_sinkContent, 0);
}

@end
