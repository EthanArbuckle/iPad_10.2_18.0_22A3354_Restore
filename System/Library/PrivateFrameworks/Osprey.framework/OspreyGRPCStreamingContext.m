@implementation OspreyGRPCStreamingContext

- (OspreyGRPCStreamingContext)initWithQueue:(id)a3 responseHandler:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  OspreyGRPCStreamingContext *v12;
  OspreyGRPCStreamingContext *v13;
  uint64_t v14;
  id completion;
  OspreyMessageReader *v16;
  OspreyMessageReader *messageReader;
  OspreyMessageWriter *v18;
  OspreyMessageWriter *messageWriter;
  NSInputStream *v20;
  id v21;
  NSInputStream *inputStream;
  NSInputStream *v23;
  NSObject *queue;
  id v25;
  _QWORD block[4];
  OspreyGRPCStreamingContext *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)OspreyGRPCStreamingContext;
  v12 = -[OspreyGRPCStreamingContext init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    v14 = MEMORY[0x1BCCC5138](v11);
    completion = v13->_completion;
    v13->_completion = (id)v14;

    v16 = -[OspreyMessageReader initWithMessageHandler:]([OspreyMessageReader alloc], "initWithMessageHandler:", v10);
    messageReader = v13->_messageReader;
    v13->_messageReader = v16;

    v18 = objc_alloc_init(OspreyMessageWriter);
    messageWriter = v13->_messageWriter;
    v13->_messageWriter = v18;

    v31 = 0;
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0C99DB0], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 2048, &v32, &v31);
    v20 = (NSInputStream *)v32;
    v21 = v31;
    inputStream = v13->_inputStream;
    v13->_inputStream = v20;
    v23 = v20;

    queue = v13->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__OspreyGRPCStreamingContext_initWithQueue_responseHandler_completion___block_invoke;
    block[3] = &unk_1E7097F68;
    v28 = v13;
    v29 = v21;
    v30 = v9;
    v25 = v21;
    dispatch_async(queue, block);

  }
  return v13;
}

uint64_t __71__OspreyGRPCStreamingContext_initWithQueue_responseHandler_completion___block_invoke(uint64_t a1)
{
  OspreyBufferedOutputStream *v2;
  uint64_t v3;
  void *v4;

  v2 = -[OspreyBufferedOutputStream initWithBufferSize:underlyingOutputStream:queue:]([OspreyBufferedOutputStream alloc], "initWithBufferSize:underlyingOutputStream:queue:", 0x2000, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  return objc_msgSend(*(id *)(a1 + 40), "open");
}

- (void)writeFrame:(id)a3
{
  -[OspreyGRPCStreamingContext _writeFrame:compressed:error:](self, "_writeFrame:compressed:error:", a3, self->_compressionEnabled, 0);
}

- (void)writeFrame:(id)a3 compressed:(BOOL)a4
{
  -[OspreyGRPCStreamingContext _writeFrame:compressed:error:](self, "_writeFrame:compressed:error:", a3, a4, 0);
}

- (void)finishWriting
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__OspreyGRPCStreamingContext_finishWriting__block_invoke;
  block[3] = &unk_1E7097F90;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__OspreyGRPCStreamingContext_finishWriting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "close");
}

- (void)bindToUrlRequest:(id)a3
{
  if (!self->_closed)
    objc_msgSend(a3, "setHTTPBodyStream:", self->_inputStream);
}

- (void)completeWithError:(id)a3
{
  id v4;
  void *v5;
  NSInputStream *inputStream;
  OspreyBufferedOutputStream *outputStream;
  OspreyMessageReader *messageReader;
  OspreyMessageWriter *messageWriter;
  void (**completion)(id, id);
  id v11;

  v4 = a3;
  if (v4)
  {
    OspreyLoggingInit();
    v5 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
      -[OspreyGRPCStreamingContext completeWithError:].cold.1(v5, v4);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  inputStream = self->_inputStream;
  self->_inputStream = 0;

  -[OspreyBufferedOutputStream close](self->_outputStream, "close");
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  messageReader = self->_messageReader;
  self->_messageReader = 0;

  messageWriter = self->_messageWriter;
  self->_messageWriter = 0;

  self->_closed = 1;
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v4);
    v11 = self->_completion;
    self->_completion = 0;

  }
}

- (void)handleResponseData:(id)a3
{
  id v4;
  OspreyMessageReader *messageReader;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  messageReader = self->_messageReader;
  OspreyLoggingInit();
  v6 = OspreyLogContextGRPC;
  if (messageReader)
  {
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
      -[OspreyGRPCStreamingContext handleResponseData:].cold.2();
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[OspreyMessageReader readData:](self->_messageReader, "readData:", v4);
  }
  else if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
  {
    -[OspreyGRPCStreamingContext handleResponseData:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void)_writeFrame:(id)a3 compressed:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *queue;
  _QWORD v27[4];
  id v28;
  OspreyGRPCStreamingContext *v29;
  id *v30;
  BOOL v31;

  v6 = a4;
  v8 = a3;
  if (self->_closed)
  {
    OspreyLoggingInit();
    v9 = OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
      -[OspreyGRPCStreamingContext _writeFrame:compressed:error:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    if (!self->_compressionEnabled && v6)
    {
      OspreyLoggingInit();
      v18 = OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
        -[OspreyGRPCStreamingContext _writeFrame:compressed:error:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
      LOBYTE(v6) = 0;
    }
    queue = self->_queue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke;
    v27[3] = &unk_1E7097FB8;
    v28 = v8;
    v29 = self;
    v31 = v6;
    v30 = a5;
    dispatch_async(queue, v27);

  }
}

uint64_t __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke(uint64_t a1)
{
  void *v2;

  OspreyLoggingInit();
  v2 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
    __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke_cold_1(a1, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "writeMessageData:toStream:compressionEnabled:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (BOOL)isCompressionEnabled
{
  return self->_compressionEnabled;
}

- (void)setCompressionEnabled:(BOOL)a3
{
  self->_compressionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_messageWriter, 0);
  objc_storeStrong((id *)&self->_messageReader, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)completeWithError:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_DEBUG, "%s Completed with error: %@", (uint8_t *)v5, 0x16u);

}

- (void)handleResponseData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Attempted to handle response data when context is closed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleResponseData:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_3(&dword_1B97C2000, v2, (uint64_t)v2, "%s %@ handling %@", (uint8_t *)v3);
}

- (void)_writeFrame:(uint64_t)a3 compressed:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Attempted to compress data frame on request that hasn't negotiated compression.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_writeFrame:(uint64_t)a3 compressed:(uint64_t)a4 error:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Attempted to write frame when context is closed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  v8 = 136315650;
  v9 = "-[OspreyGRPCStreamingContext _writeFrame:compressed:error:]_block_invoke";
  v10 = 2048;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_3(&dword_1B97C2000, v4, v7, "%s Writing frame of length %lu to outputStream: %@", (uint8_t *)&v8);

}

@end
