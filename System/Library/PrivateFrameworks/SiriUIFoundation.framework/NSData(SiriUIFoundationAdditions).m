@implementation NSData(SiriUIFoundationAdditions)

- (id)sruif_dataByCompressingWithGzip
{
  id v1;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  z_stream v8;

  memset(&v8.total_out, 0, 72);
  v1 = objc_retainAutorelease(a1);
  v8.avail_in = objc_msgSend(v1, "length", objc_msgSend(v1, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  if (deflateInit2_(&v8, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[NSData(SiriUIFoundationAdditions) sruif_dataByCompressingWithGzip].cold.2();
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", deflateBound(&v8, objc_msgSend(v1, "length")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v4 = objc_retainAutorelease(v3);
      v5 = objc_msgSend(v4, "mutableBytes");
      v8.next_out = (Bytef *)(v5 + v8.total_out);
      v6 = objc_msgSend(v4, "length");
      v8.avail_out = v6 - LODWORD(v8.total_out);
      v7 = deflate(&v8, 4);
    }
    while (!v7);
    if (v7 != 1)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[NSData(SiriUIFoundationAdditions) sruif_dataByCompressingWithGzip].cold.1();

      v4 = 0;
    }
    deflateEnd(&v8);
    objc_msgSend(v4, "setLength:", v8.total_out);
    return v4;
  }
}

- (void)sruif_dataByCompressingWithGzip
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219F26000, v0, v1, "%s Error initializing zlib for NSData deflation: %{public}s (zlib code=%{public}d)", v2);
}

@end
