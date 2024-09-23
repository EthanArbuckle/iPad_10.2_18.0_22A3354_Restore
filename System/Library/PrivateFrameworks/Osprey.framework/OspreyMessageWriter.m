@implementation OspreyMessageWriter

- (void)writeMessageData:(id)a3 toStream:(id)a4 compressionEnabled:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  OspreyZlibDataCompressor *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v7 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v7)
  {
    v11 = -[OspreyZlibDataCompressor initWithOptions:]([OspreyZlibDataCompressor alloc], "initWithOptions:", 31);
    v12 = (void *)objc_msgSend(v9, "_createDispatchData");
    v23 = 0;
    -[OspreyZlibDataCompressor compressedDataForData:error:](v11, "compressedDataForData:error:", v12, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v13)
    {
      LengthPrefixedMessageFromData(v13, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_18;
      goto LABEL_6;
    }
    OspreyLoggingInit();
    v22 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
    {
      -[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:].cold.1(v22, v14);
      if (!a6)
        goto LABEL_16;
    }
    else if (!a6)
    {
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
    *a6 = objc_retainAutorelease(v14);
    goto LABEL_16;
  }
  LengthPrefixedMessageFromData(v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
LABEL_6:
    v14 = objc_retainAutorelease(v15);
    if (objc_msgSend(v10, "write:maxLength:", objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length")) == -1
      && (objc_msgSend(v10, "streamError"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
    {
      v24 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v10, "streamError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyMessageWriterErrorDomain"), 1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (a6)
        *a6 = objc_retainAutorelease(v20);

    }
    else
    {
      OspreyLoggingInit();
      v16 = (void *)OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG))
        -[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:].cold.2(v16, v14, v7);
    }
    goto LABEL_17;
  }
LABEL_18:

}

- (void)writeMessageData:(void *)a1 toStream:(void *)a2 compressionEnabled:error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:]";
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_ERROR, "%s Error compressing data! Error: %@", (uint8_t *)&v5, 0x16u);

}

- (void)writeMessageData:(char)a3 toStream:compressionEnabled:error:.cold.2(void *a1, void *a2, char a3)
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = 136315650;
  v7 = "-[OspreyMessageWriter writeMessageData:toStream:compressionEnabled:error:]";
  v8 = 2048;
  v9 = objc_msgSend(a2, "length");
  v10 = 1024;
  v11 = a3 & 1;
  _os_log_debug_impl(&dword_1B97C2000, v5, OS_LOG_TYPE_DEBUG, "%s Wrote data of size: %lu, compressed: %d", (uint8_t *)&v6, 0x1Cu);

}

@end
