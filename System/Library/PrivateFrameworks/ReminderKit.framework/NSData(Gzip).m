@implementation NSData(Gzip)

- (id)TT_gzipInflate
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uLong total_out;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  NSObject *v15;
  NSObject *v16;
  z_stream v17;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2 + (v3 >> 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(a1);
  v17.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v17.zalloc = 0;
  v17.zfree = 0;
  v17.total_out = 0;
  v6 = 0;
  if (!inflateInit2_(&v17, 47, "1.2.12", 112))
  {
    v7 = v3 >> 1;
    do
    {
      total_out = v17.total_out;
      if (total_out >= objc_msgSend(v4, "length"))
        objc_msgSend(v4, "increaseLengthBy:", v7);
      v9 = objc_retainAutorelease(v4);
      v10 = objc_msgSend(v9, "mutableBytes");
      v17.next_out = (Bytef *)(v10 + v17.total_out);
      v11 = objc_msgSend(v9, "length");
      v17.avail_out = v11 - LODWORD(v17.total_out);
      v12 = inflate(&v17, 2);
    }
    while (!v12);
    v13 = v12;
    if (v12 == 1)
    {
      if (!inflateEnd(&v17))
      {
        objc_msgSend(v9, "setLength:", v17.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      +[REMLog crdt](REMLog, "crdt");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NSData(Gzip) TT_gzipInflate].cold.2(v13, v15);

      if (!inflateEnd(&v17))
        goto LABEL_17;
    }
    +[REMLog crdt](REMLog, "crdt");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NSData(Gzip) TT_gzipInflate].cold.1(v16);

LABEL_17:
    v6 = 0;
  }
LABEL_18:

  return v6;
}

- (id)TT_gzipDeflate
{
  id v2;
  id v3;
  void *v4;
  uLong total_out;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  z_stream v11;

  if (!objc_msgSend(a1, "length"))
  {
    v3 = a1;
    return v3;
  }
  memset(&v11.total_out, 0, 72);
  v2 = objc_retainAutorelease(a1);
  v11.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  v3 = 0;
  if (deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112))
    return v3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    total_out = v11.total_out;
    if (total_out >= objc_msgSend(v4, "length"))
      objc_msgSend(v4, "increaseLengthBy:", 0x4000);
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "mutableBytes");
    v11.next_out = (Bytef *)(v7 + v11.total_out);
    v8 = objc_msgSend(v6, "length");
    v11.avail_out = v8 - LODWORD(v11.total_out);
    deflate(&v11, 4);
  }
  while (!v11.avail_out);
  deflateEnd(&v11);
  objc_msgSend(v6, "setLength:", v11.total_out);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)TT_gzipInflate
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "inflate failed returned %d", (uint8_t *)v2, 8u);
}

@end
