@implementation OITSUZipInflateReadChannel

- (OITSUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6
{
  id v11;
  OITSUZipInflateReadChannel *v12;
  OITSUZipInflateReadChannel *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OITSUZipInflateReadChannel;
  v12 = -[OITSUZipInflateReadChannel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readChannel, a3);
    v13->_stream.next_in = 0;
    v13->_remainingUncompressedSize = a4;
    v13->_CRC = a5;
    v13->_validateCRC = a6;
    v13->_stream.avail_in = 0;
    v13->_stream.avail_out = 0;
    v13->_stream.next_out = 0;
    v13->_stream.zfree = 0;
    v13->_stream.opaque = 0;
    v13->_stream.zalloc = 0;
    if (inflateInit2_(&v13->_stream, -15, "1.2.12", 112))
    {
      if (TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_18);

      v13 = 0;
    }
  }

  return v13;
}

void __83__OITSUZipInflateReadChannel_initWithReadChannel_uncompressedSize_CRC_validateCRC___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[OITSUZipInflateReadChannel close](self, "close");
  inflateEnd(&self->_stream);
  free(self->_outBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OITSUZipInflateReadChannel;
  -[OITSUZipInflateReadChannel dealloc](&v3, sel_dealloc);
}

- (void)prepareBuffer
{
  void *v3;
  void *v4;
  unint64_t remainingUncompressedSize;
  unint64_t v6;
  unint64_t v7;
  char *v8;

  if (self->_outBuffer)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUZipInflateReadChannel prepareBuffer]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipInflateReadChannel.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 79, 0, "expected nil value for '%{public}s'", "_outBuffer");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  remainingUncompressedSize = self->_remainingUncompressedSize;
  if (remainingUncompressedSize >= 0x40000)
    v6 = 0x40000;
  else
    v6 = self->_remainingUncompressedSize;
  if (remainingUncompressedSize)
    v7 = v6;
  else
    v7 = 0x40000;
  self->_outBufferSize = v7;
  v8 = (char *)malloc_type_malloc(v7, 0x62401E6EuLL);
  self->_outBuffer = v8;
  self->_stream.avail_out = self->_outBufferSize;
  self->_stream.next_out = (Bytef *)v8;
}

- (void)readWithHandler:(id)a3
{
  id v4;
  TSUStreamReadChannel *readChannel;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 1;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v14 = crc32(0, 0, 0);
  readChannel = self->_readChannel;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__OITSUZipInflateReadChannel_readWithHandler___block_invoke;
  v7[3] = &unk_24F39B3A0;
  v9 = v19;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v10 = v15;
  v11 = v17;
  v12 = v13;
  -[TSUStreamReadChannel readWithHandler:](readChannel, "readWithHandler:", v7);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

void __46__OITSUZipInflateReadChannel_readWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(unsigned __int8 *)(v8 + 24);
  if (v7 && *(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "handleFailureWithHandler:error:", *(_QWORD *)(a1 + 40), v7);
    v9 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_DWORD *)(v10 + 24))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "prepareBuffer");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "processData:inflateResult:CRC:isDone:handler:", v11, v10 + 24, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24, a2, *(_QWORD *)(a1 + 40));
    }
  }

}

- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  BOOL v16;
  void *v18;
  _QWORD applier[5];
  id v20;
  uint64_t *v21;
  int *v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke;
  applier[3] = &unk_24F39B408;
  v21 = &v24;
  v22 = a4;
  applier[4] = self;
  v23 = a5;
  v14 = v13;
  v20 = v14;
  dispatch_data_apply(v12, applier);
  v15 = *((unsigned __int8 *)v25 + 24);
  if (!self->_validateCRC)
    goto LABEL_10;
  if (!*((_BYTE *)v25 + 24))
    goto LABEL_19;
  if (v8)
  {
    if (!a5)
    {
LABEL_9:
      v15 = 1;
LABEL_10:
      if (v15 && v8)
      {
        if (*a4 != 1)
        {
          if (TSUDefaultCat_init_token == -1)
            goto LABEL_18;
          v18 = &__block_literal_global_17_0;
          goto LABEL_23;
        }
        goto LABEL_16;
      }
      if (v15)
      {
LABEL_16:
        v16 = 1;
        goto LABEL_20;
      }
LABEL_19:
      -[OITSUZipInflateReadChannel handleFailureWithHandler:error:](self, "handleFailureWithHandler:error:", v14, 0);
      v16 = *((_BYTE *)v25 + 24) != 0;
      goto LABEL_20;
    }
LABEL_8:
    if (self->_CRC != *a5)
    {
      if (TSUDefaultCat_init_token == -1)
      {
LABEL_18:
        *((_BYTE *)v25 + 24) = 0;
        goto LABEL_19;
      }
      v18 = &__block_literal_global_16;
LABEL_23:
      dispatch_once(&TSUDefaultCat_init_token, v18);
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  v16 = 1;
  if (a5 && *a4 == 1)
    goto LABEL_8;
LABEL_20:

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v15;
  size_t v16;
  size_t v17;
  unsigned int *v18;
  uLong v19;
  const Bytef *v20;
  uInt v21;
  dispatch_data_t v22;
  dispatch_data_t v23;
  dispatch_data_t subrange;
  dispatch_data_t v25;
  uint64_t v26;
  size_t v27;
  BOOL v28;
  size_t v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;

  v8 = a2;
  if (HIDWORD(a5))
  {
    if (TSUDefaultCat_init_token == -1)
      goto LABEL_31;
    v33 = &__block_literal_global_10;
    goto LABEL_37;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v9 + 64))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUZipInflateReadChannel processData:inflateResult:CRC:isDone:handler:]_block_invoke");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipInflateReadChannel.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 127, 0, "Buffer should have been initialized.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
LABEL_31:
    v11 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_32;
  }
  *(_DWORD *)(v9 + 40) = a5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = 1;
  if (*(_DWORD *)(v10 + 40))
  {
    v12 = (void *)*MEMORY[0x24BDAC980];
    while (1)
    {
      if (**(_DWORD **)(a1 + 56))
      {
LABEL_33:
        v11 = 1;
        goto LABEL_32;
      }
      v13 = inflate((z_streamp)(v10 + 32), 0);
      **(_DWORD **)(a1 + 56) = v13;
      if ((v13 + 5) > 6 || ((1 << (v13 + 5)) & 0x61) == 0)
        break;
      v15 = v13;
      v10 = *(_QWORD *)(a1 + 32);
      if (v13 == 1 || !*(_DWORD *)(v10 + 64))
      {
        v16 = *(_QWORD *)(v10 + 144);
        v17 = v16 - *(unsigned int *)(v10 + 64);
        if (*(_BYTE *)(v10 + 28))
        {
          v18 = *(unsigned int **)(a1 + 64);
          if (v18)
          {
            v19 = *v18;
            v20 = *(const Bytef **)(v10 + 152);
            if (HIDWORD(v17))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUZipInflateReadChannel processData:inflateResult:CRC:isDone:handler:]_block_invoke");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipInflateReadChannel.m");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v34, 151, 0, "Out-of-bounds type assignment was clamped to max");

              +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
              v21 = -1;
            }
            else
            {
              v21 = v16 - *(_DWORD *)(v10 + 64);
            }
            **(_DWORD **)(a1 + 64) = crc32(v19, v20, v21);
            v10 = *(_QWORD *)(a1 + 32);
            v16 = *(_QWORD *)(v10 + 144);
          }
        }
        v22 = dispatch_data_create(*(const void **)(v10 + 152), v16, 0, v12);
        v23 = v22;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) == v17)
          subrange = v22;
        else
          subrange = dispatch_data_create_subrange(v22, 0, v17);
        v25 = subrange;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(v26 + 16);
        v28 = v27 >= v17;
        v29 = v27 - v17;
        if (!v28)
          v29 = 0;
        *(_QWORD *)(v26 + 16) = v29;
        if (v15 != 1)
          objc_msgSend(*(id *)(a1 + 32), "prepareBuffer");

        v10 = *(_QWORD *)(a1 + 32);
      }
      if (!*(_DWORD *)(v10 + 40))
        goto LABEL_33;
    }
    if (TSUDefaultCat_init_token == -1)
      goto LABEL_31;
    v33 = &__block_literal_global_12;
LABEL_37:
    dispatch_once(&TSUDefaultCat_init_token, v33);
    goto LABEL_31;
  }
LABEL_32:

  return v11;
}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_5()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  void (*v5)(void);
  void *v6;
  id v7;
  id v8;

  if (a4)
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v8 = a3;
    v5();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = a3;
    objc_msgSend(v6, "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v7, 1, 0);

  }
}

- (void)close
{
  TSUStreamReadChannel *readChannel;

  -[TSUStreamReadChannel close](self->_readChannel, "close");
  readChannel = self->_readChannel;
  self->_readChannel = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
