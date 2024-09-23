@implementation _PASCompression

+ (id)compress:(id)a3 fast:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_compress:fast:lowMemory:", a3, a4, 0);
}

+ (id)compress:(id)a3 lowMemory:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_compress:fast:lowMemory:", a3, 0, a4);
}

+ (id)fastCompress:(id)a3
{
  return (id)objc_msgSend(a1, "_compress:fast:lowMemory:", a3, 1, 1);
}

+ (id)_compress:(id)a3 fast:(BOOL)a4 lowMemory:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  Bytef *v10;
  Bytef *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  compression_algorithm v15;
  uint8_t *v16;
  id v17;
  size_t v18;
  int v19;
  Bytef *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASCompression _compress:fast:lowMemory:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_PASCompression.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v8 = objc_msgSend(v7, "length");
  if (v8 >= 0x3FFFFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASCompression _compress:fast:lowMemory:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_PASCompression.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uncompressedLen < 0x3fffffff"));

  }
  v9 = v8 + 8;
  v10 = (Bytef *)malloc_type_malloc(v8 + 8, 0xD04F404EuLL);
  if (v10)
  {
    v11 = v10;
    if (v5)
      v12 = 2050;
    else
      v12 = 2049;
    v13 = 3;
    if (!v6)
      v13 = 1;
    v14 = (4 * v8) | (unint64_t)v13;
    if (v6)
      v15 = COMPRESSION_LZ4;
    else
      v15 = v12;
    v16 = v10 + 8;
    v17 = objc_retainAutorelease(v7);
    v18 = compression_encode_buffer(v16, v8, (const uint8_t *)objc_msgSend(v17, "bytes"), v8, 0, v15);
    if (!v18)
    {
      v14 = v14 & 0xFFFFFFFE;
      memcpy(v16, (const void *)objc_msgSend(objc_retainAutorelease(v17), "bytes"), v8);
      goto LABEL_19;
    }
    v19 = v18;
    v9 = v18 + 8;
    v20 = (Bytef *)reallocf(v11, v18 + 8);
    if (v20)
    {
      v11 = v20;
      LODWORD(v8) = v19;
LABEL_19:
      *(_QWORD *)v11 = v14 | (adler32(0xFFFFFFFFFFFFFFFFLL, v11 + 8, v8) << 32);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v11, v9, 1);
      goto LABEL_20;
    }
  }
  v21 = 0;
LABEL_20:

  return v21;
}

+ (id)decompress:(id)a3
{
  return (id)objc_msgSend(a1, "decompress:maxLength:", a3, -1);
}

+ (id)decompress:(id)a3 maxLength:(int64_t)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  const Bytef *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  size_t v12;
  uint8_t *v13;
  uint8_t *v14;
  compression_algorithm v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASCompression decompress:maxLength:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_PASCompression.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  if ((unint64_t)objc_msgSend(v5, "length") < 8)
    goto LABEL_20;
  v6 = objc_retainAutorelease(v5);
  v7 = (_QWORD *)objc_msgSend(v6, "bytes");
  v8 = (const Bytef *)(v7 + 1);
  v9 = *v7;
  v10 = objc_msgSend(v6, "length");
  if ((a4 & 0x8000000000000000) == 0 && v9 >> 2 > (unint64_t)a4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v23 = v9 >> 2;
      v24 = 2048;
      v25 = a4;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Decompressed data size %u greater than limit %li", buf, 0x12u);
    }
    goto LABEL_20;
  }
  v11 = v10 - 8;
  if (HIDWORD(v9) != adler32(0xFFFFFFFFFFFFFFFFLL, v8, (int)v10 - 8)
    || (v12 = v9 >> 2, (v13 = (uint8_t *)malloc_type_malloc(v12, 0xBEAF573DuLL)) == 0))
  {
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v14 = v13;
  if ((v9 & 1) == 0)
  {
    if (v11 != v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_PASCompression decompress:maxLength:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_PASCompression.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("compressedLen == hdr.length"));

    }
    memcpy(v14, v8, v11);
    goto LABEL_18;
  }
  if ((v9 & 2) != 0)
    v15 = COMPRESSION_LZ4;
  else
    v15 = COMPRESSION_LZFSE;
  if (compression_decode_buffer(v13, v9 >> 2, v8, v11, 0, v15) != v12)
  {
    free(v14);
    goto LABEL_20;
  }
LABEL_18:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v14, v12, 1);
LABEL_21:

  return v16;
}

@end
