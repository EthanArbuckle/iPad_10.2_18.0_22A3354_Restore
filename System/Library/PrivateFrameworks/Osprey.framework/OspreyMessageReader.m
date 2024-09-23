@implementation OspreyMessageReader

- (OspreyMessageReader)initWithMessageHandler:(id)a3
{
  id v4;
  OspreyMessageReader *v5;
  uint64_t v6;
  id messageHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyMessageReader;
  v5 = -[OspreyMessageReader init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    messageHandler = v5->_messageHandler;
    v5->_messageHandler = (id)v6;

  }
  return v5;
}

- (void)_produceMessageBody:(id)a3
{
  id v4;
  void *v5;
  void (**messageHandler)(id, id);

  v4 = a3;
  OspreyLoggingInit();
  v5 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
    -[OspreyMessageReader _produceMessageBody:].cold.1((uint64_t)self, v5);
  messageHandler = (void (**)(id, id))self->_messageHandler;
  if (messageHandler)
    messageHandler[2](messageHandler, v4);

}

- (void)readData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = a3;
  OspreyLoggingInit();
  v5 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
    -[OspreyMessageReader readData:].cold.3((uint64_t)self, v5);
  if (self->_readerState == 1)
  {
    OspreyLoggingInit();
    v6 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
      -[OspreyMessageReader readData:].cold.2((uint64_t)self, v6);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__OspreyMessageReader_readData___block_invoke;
  v8[3] = &unk_1E7098030;
  v8[4] = self;
  v8[5] = 5;
  objc_msgSend(v4, "enumerateByteRangesUsingBlock:", v8);
  if (self->_readerState == 1)
  {
    OspreyLoggingInit();
    v7 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
      -[OspreyMessageReader readData:].cold.1((uint64_t)self, v7);
  }

}

void __32__OspreyMessageReader_readData___block_invoke(uint64_t a1, uint64_t a2, __n128 a3, uint64_t a4, unint64_t a5)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  OspreyZlibDataDecompressor *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __n128 v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    a3.n128_u64[0] = 136315650;
    v35 = a3;
    v8 = a5;
    do
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v9 + 48))
      {
        if (!*(_QWORD *)(v9 + 16))
          v9 = a1;
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", *(_QWORD *)(v9 + 40));
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 48);
        *(_QWORD *)(v11 + 48) = v10;

        v9 = *(_QWORD *)(a1 + 32);
      }
      v13 = a5 - v8;
      v14 = *(_QWORD *)(v9 + 16);
      if (v14 == 1)
      {
        v21 = objc_msgSend(*(id *)(v9 + 48), "length");
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(v22 + 40);
        if (v21 + v8 <= v23)
        {
          v24 = v8;
        }
        else
        {
          v24 = v23 - objc_msgSend(*(id *)(v22 + 48), "length");
          v22 = *(_QWORD *)(a1 + 32);
        }
        objc_msgSend(*(id *)(v22 + 48), "appendBytes:length:", a2 + v13, v24, *(_OWORD *)&v35);
        v8 -= v24;
        v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length");
        v26 = *(_QWORD *)(a1 + 32);
        if (v25 == *(_QWORD *)(v26 + 40))
        {
          if (*(_BYTE *)(v26 + 32))
          {
            v27 = -[OspreyZlibDataDecompressor initWithOptions:]([OspreyZlibDataDecompressor alloc], "initWithOptions:", 31);
            v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "_createDispatchData");
            v36 = 0;
            -[OspreyZlibDataDecompressor decompressedDataForData:error:](v27, "decompressedDataForData:error:", v28, &v36);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v36;

            if (v30 || !v29)
            {
              OspreyLoggingInit();
              v31 = OspreyLogContextGRPC;
              if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
              {
                v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
                *(_DWORD *)buf = v35.n128_u32[0];
                v38 = "-[OspreyMessageReader readData:]_block_invoke";
                v39 = 2048;
                v40 = v34;
                v41 = 2112;
                v42 = v30;
                _os_log_error_impl(&dword_1B97C2000, v31, OS_LOG_TYPE_ERROR, "%s Error decompressing message %lu with %@", buf, 0x20u);
              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_produceMessageBody:", v29);
            }

          }
          else
          {
            v30 = (id)objc_msgSend(*(id *)(v26 + 48), "copy");
            objc_msgSend((id)v26, "_produceMessageBody:", v30);
          }

          v32 = *(_QWORD *)(a1 + 32);
          v33 = *(void **)(v32 + 48);
          *(_QWORD *)(v32 + 48) = 0;

          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        }
      }
      else if (!v14)
      {
        v15 = objc_msgSend(*(id *)(v9 + 48), "length");
        v16 = *(_QWORD *)(a1 + 40);
        v17 = v8;
        if (v15 + v8 > v16)
          v17 = v16 - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "appendBytes:length:", a2 + v13, v17, *(_OWORD *)&v35);
        v8 -= v17;
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "length") == *(_QWORD *)(a1 + 40))
        {
          v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bytes");
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = bswap32(*(_DWORD *)(v18 + 1));
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = *(_BYTE *)v18 != 0;
          v19 = *(_QWORD *)(a1 + 32);
          v20 = *(void **)(v19 + 48);
          *(_QWORD *)(v19 + 48) = 0;

          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 1;
        }
      }
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBuffer, 0);
  objc_storeStrong(&self->_messageHandler, 0);
}

- (void)_produceMessageBody:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  int v9[6];
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  OUTLINED_FUNCTION_2_1();
  v9[0] = 136316418;
  OUTLINED_FUNCTION_1_1();
  v10 = v3;
  v11 = 1024;
  v12 = v4;
  v13 = v7;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  _os_log_debug_impl(&dword_1B97C2000, v2, OS_LOG_TYPE_DEBUG, "%s %@ [%lu] Parsed gRPC message { compressed: %d, size: %lu, bodySize: %lu }", (uint8_t *)v9, 0x3Au);

}

- (void)readData:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1B97C2000, v4, v5, "%s %@ [%lu] Processed %lu of %lu bytes of message body", v6, v7, v8, v9, 2u);

}

- (void)readData:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_1B97C2000, v4, v5, "%s %@ [%lu] Looking for %lu of %lu bytes of message body", v6, v7, v8, v9, 2u);

}

- (void)readData:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  OUTLINED_FUNCTION_2_1();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_1_1();
  v6 = v4;
  _os_log_debug_impl(&dword_1B97C2000, v2, OS_LOG_TYPE_DEBUG, "%s %@ Reading data of size: %lu", (uint8_t *)v5, 0x20u);

}

@end
