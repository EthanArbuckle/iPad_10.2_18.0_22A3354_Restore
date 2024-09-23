@implementation NSData(RCAdditions)

- (id)rc_gzipDeflate
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

- (id)rc_gzipInflate
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
  z_stream v14;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "length");
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v2 + (v3 >> 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(a1);
  v14.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v14.zalloc = 0;
  v14.zfree = 0;
  v14.total_out = 0;
  v6 = 0;
  if (!inflateInit2_(&v14, 47, "1.2.12", 112))
  {
    v7 = v3 >> 1;
    do
    {
      total_out = v14.total_out;
      if (total_out >= objc_msgSend(v4, "length"))
        objc_msgSend(v4, "increaseLengthBy:", v7);
      v9 = objc_retainAutorelease(v4);
      v10 = objc_msgSend(v9, "mutableBytes");
      v14.next_out = (Bytef *)(v10 + v14.total_out);
      v11 = objc_msgSend(v9, "length");
      v14.avail_out = v11 - LODWORD(v14.total_out);
      v12 = inflate(&v14, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&v14))
      {
        objc_msgSend(v9, "setLength:", v14.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v14);
    }
    v6 = 0;
  }
LABEL_13:

  return v6;
}

@end
