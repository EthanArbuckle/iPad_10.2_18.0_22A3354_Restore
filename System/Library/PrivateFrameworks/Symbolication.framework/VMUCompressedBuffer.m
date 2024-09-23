@implementation VMUCompressedBuffer

void __VMUCompressedBuffer_block_invoke(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t (**v8)(id, uint64_t);
  uint64_t v9;
  id v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  id v14;

  v6 = (void *)MEMORY[0x1E0C99DF0];
  v7 = a2 + 16;
  v8 = a4;
  objc_msgSend(v6, "dataWithLength:", v7);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = v8[2](v8, objc_msgSend(v14, "mutableBytes") + 16);

  if (v9)
  {
    objc_msgSend(v14, "setLength:", v9 + 16);
    v10 = objc_retainAutorelease(v14);
    v11 = (_DWORD *)objc_msgSend(v10, "mutableBytes");
    v12 = a1[6];
    v13 = a3 | (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) << 16);
    *v11 = 16;
    v11[1] = v9;
    v11[2] = v12;
    v11[3] = v13;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v10);
  }
  else
  {
    objc_msgSend(v14, "setLength:", 0);
  }

}

uint64_t __VMUCompressedBuffer_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) = v3;
  v4 = deflate((z_streamp)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), 4);
  deflateEnd((z_streamp)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((_DWORD)v4 == 1)
    return *(_QWORD *)(v5 + 72);
  NSLog(CFSTR("Unable to compress data: %d (%s)"), v4, *(_QWORD *)(v5 + 80));
  return 0;
}

uint8_t *__VMUCompressedBuffer_block_invoke_3(_QWORD *a1, uint8_t *a2)
{
  const uint8_t *v3;
  size_t v4;
  size_t v5;
  compression_status v6;
  uint8_t *v7;
  compression_stream v9;

  v3 = (const uint8_t *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  memset(&v9, 0, sizeof(v9));
  if (compression_stream_init(&v9, COMPRESSION_STREAM_ENCODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(CFSTR("Unable to initialize compression stream."));
    return 0;
  }
  v9.src_ptr = v3;
  v9.src_size = v4;
  v9.dst_ptr = a2;
  v9.dst_size = v5;
  v6 = compression_stream_process(&v9, 1);
  switch(v6)
  {
    case COMPRESSION_STATUS_ERROR:
      NSLog(CFSTR("Error. Compression failed."));
      return 0;
    case COMPRESSION_STATUS_OK:
      NSLog(CFSTR("Error. Compression output buffer full."));
      return 0;
    case COMPRESSION_STATUS_END:
      if (v9.dst_ptr > a2)
        v7 = (uint8_t *)(v9.dst_ptr - a2);
      else
        v7 = 0;
      break;
    default:
      v7 = 0;
      break;
  }
  compression_stream_destroy(&v9);
  return v7;
}

uint64_t __VMUCompressedBuffer_block_invoke_4(uint64_t a1, void *__dst)
{
  memcpy(__dst, *(const void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  return *(_QWORD *)(a1 + 40);
}

@end
