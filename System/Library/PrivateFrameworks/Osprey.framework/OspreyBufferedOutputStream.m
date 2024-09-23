@implementation OspreyBufferedOutputStream

- (OspreyBufferedOutputStream)initWithBufferSize:(unint64_t)a3 underlyingOutputStream:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  OspreyBufferedOutputStream *v11;
  uint64_t v12;
  NSMutableData *outputBuffer;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OspreyBufferedOutputStream;
  v11 = -[OspreyBufferedOutputStream init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", a3);
    outputBuffer = v11->_outputBuffer;
    v11->_outputBuffer = (NSMutableData *)v12;

    objc_storeStrong((id *)&v11->_outputStream, a4);
    MEMORY[0x1BCCC4D0C](v11->_outputStream, v10);
    -[NSOutputStream setDelegate:](v11->_outputStream, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_queue, a5);
  }

  return v11;
}

- (BOOL)hasSpaceAvailable
{
  return -[NSOutputStream streamStatus](self->_outputStream, "streamStatus") != 7
      && -[NSOutputStream streamStatus](self->_outputStream, "streamStatus") != 6;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  int64_t v7;
  void *v9;

  if (!-[OspreyBufferedOutputStream _flushBuffer](self, "_flushBuffer")
    || !-[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable"))
  {
    goto LABEL_5;
  }
  v7 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", a3, a4);
  if (v7 > 0)
    goto LABEL_6;
  if (v7 != -1)
  {
LABEL_5:
    v7 = 0;
LABEL_6:
    if (a4 <= v7)
      return v7;
    -[NSMutableData appendBytes:length:](self->_outputBuffer, "appendBytes:length:", &a3[v7], a4 - v7);
    return a4;
  }
  OspreyLoggingInit();
  v9 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
    -[OspreyBufferedOutputStream write:maxLength:].cold.1((uint64_t)&self->_outputStream, v9);
  return -1;
}

- (BOOL)hasBufferedData
{
  return -[NSMutableData length](self->_outputBuffer, "length") != 0;
}

- (id)streamError
{
  return (id)-[NSOutputStream streamError](self->_outputStream, "streamError");
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  self->_closed = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__OspreyBufferedOutputStream_close__block_invoke;
  block[3] = &unk_1E7097F90;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__OspreyBufferedOutputStream_close__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "length");
  if (!result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = 0;

    return objc_msgSend(*(id *)(a1 + 32), "_closeUnderlying");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[OspreyBufferedOutputStream _closeUnderlying](self, "_closeUnderlying");
  v3.receiver = self;
  v3.super_class = (Class)OspreyBufferedOutputStream;
  -[OspreyBufferedOutputStream dealloc](&v3, sel_dealloc);
}

- (void)_closeUnderlying
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s Closing underlying stream: %@", v2, v3, v4, v5, 2u);
}

- (BOOL)_flushBuffer
{
  NSMutableData *outputBuffer;
  uint64_t v4;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[NSMutableData length](self->_outputBuffer, "length"))
    return 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  outputBuffer = self->_outputBuffer;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__OspreyBufferedOutputStream__flushBuffer__block_invoke;
  v7[3] = &unk_1E7097FE0;
  v7[4] = self;
  v7[5] = &v8;
  -[NSMutableData enumerateByteRangesUsingBlock:](outputBuffer, "enumerateByteRangesUsingBlock:", v7);
  v4 = v9[3];
  if (v4)
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_outputBuffer, "replaceBytesInRange:withBytes:length:", 0, v4, 0, 0);
  v5 = -[NSMutableData length](self->_outputBuffer, "length") == 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __42__OspreyBufferedOutputStream__flushBuffer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v9 = (_QWORD *)(a1 + 32);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "hasSpaceAvailable"))
  {
    v10 = objc_msgSend(*(id *)(*v9 + 144), "write:maxLength:", a2, a4);
    if (v10 < 1)
    {
      *a5 = 1;
      if (v10 == -1)
      {
        OspreyLoggingInit();
        v11 = (void *)OspreyLogContextGRPC;
        if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
          __42__OspreyBufferedOutputStream__flushBuffer__block_invoke_cold_1(v9, 144, v11);
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v10;
    }
  }
  else
  {
    *a5 = 1;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSOutputStream *v6;
  void *v7;

  v6 = (NSOutputStream *)a3;
  if (self->_outputStream != v6)
    goto LABEL_13;
  switch(a4)
  {
    case 0x10uLL:
      goto LABEL_12;
    case 8uLL:
      OspreyLoggingInit();
      v7 = (void *)OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
        -[OspreyBufferedOutputStream stream:handleEvent:].cold.2((uint64_t)&self->_outputStream, v7);
      goto LABEL_12;
    case 4uLL:
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
        -[OspreyBufferedOutputStream stream:handleEvent:].cold.1();
      if (-[OspreyBufferedOutputStream _flushBuffer](self, "_flushBuffer") && self->_closed)
LABEL_12:
        -[OspreyBufferedOutputStream _closeUnderlying](self, "_closeUnderlying");
      break;
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputBuffer, 0);
}

- (void)write:(uint64_t)a1 maxLength:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend(v2, "streamError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B97C2000, v5, v6, "%s Error writing bytes to %@ with: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_0();
}

void __42__OspreyBufferedOutputStream__flushBuffer__block_invoke_cold_1(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(void **)(*a1 + a2);
  v4 = a3;
  objc_msgSend(v3, "streamError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B97C2000, v6, v7, "%s Error writing bytes to %@ with: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)stream:handleEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_1B97C2000, v0, v1, "%s OutputStream %@ has space available.", v2, v3, v4, v5, 2u);
}

- (void)stream:(uint64_t)a1 handleEvent:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend(v2, "streamError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B97C2000, v5, v6, "%s OutputStream %@ error occurred: %@.", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
