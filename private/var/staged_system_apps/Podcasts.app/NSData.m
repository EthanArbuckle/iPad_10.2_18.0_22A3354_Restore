@implementation NSData

- (id)_MZDataByInflating
{
  NSData *v2;
  id v3;
  unsigned int v4;
  unsigned int v5;
  z_stream strm;
  _BYTE v8[16384];

  v2 = self;
  if (-[NSData length](v2, "length") >> 32)
  {
    NSLog(CFSTR("ERROR: unable to zip large data of size ~%.3f GB"), (double)-[NSData length](v2, "length") / 1000000000.0);
  }
  else
  {
    memset(&strm.avail_in, 0, 104);
    strm.avail_in = -[NSData length](v2, "length");
    strm.next_in = (Bytef *)-[NSData bytes](objc_retainAutorelease(v2), "bytes");
    v3 = 0;
    if (inflateInit2_(&strm, -15, "1.2.12", 112))
      goto LABEL_11;
    v3 = objc_alloc_init((Class)NSMutableData);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v8;
      v4 = inflate(&strm, 0);
      if (v4 > 1)
        break;
      v5 = v4;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v3, "appendBytes:length:", v8, 0x4000 - strm.avail_out);
      if (v5)
      {
        inflateEnd(&strm);
        goto LABEL_11;
      }
    }
    inflateEnd(&strm);

  }
  v3 = 0;
LABEL_11:

  return v3;
}

- (id)_MZDataByDeflatingWithCompression:(unint64_t)a3
{
  NSData *v4;
  id v5;
  NSData *v6;
  Bytef *v7;
  uInt v8;
  id v9;
  int v10;
  int v11;
  int v12;
  int v14;
  Bytef *next_out;
  BOOL v16;
  z_stream strm;
  _BYTE v19[16384];

  v4 = self;
  if (-[NSData length](v4, "length") < 0xFFFFFFFF)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = -[NSData bytes](v6, "bytes");
    v8 = -[NSData length](v6, "length");
    v9 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (v8 >> 1) + 1);
    v5 = 0;
    if (!v7 || !v8)
      goto LABEL_22;
    memset(&strm, 0, sizeof(strm));
    if (a3 == 1)
      v10 = 1;
    else
      v10 = -1;
    strm.avail_out = 0x4000;
    if (a3 == 2)
      v11 = 9;
    else
      v11 = v10;
    strm.next_out = v19;
    if (deflateInit2_(&strm, v11, 8, -15, 9, 0, "1.2.12", 112))
    {
      NSLog(CFSTR("deflateInit2() failed: %s"), strm.msg);
    }
    else
    {
      strm.avail_in = v8;
      strm.next_in = v7;
      do
      {
        if (!strm.avail_out)
        {
          objc_msgSend(v9, "appendBytes:length:", v19, 0x4000);
          strm.avail_out = 0x4000;
          strm.next_out = v19;
        }
        v12 = deflate(&strm, 0);
      }
      while (!v12 && strm.avail_in);
      if (!v12)
      {
        if (strm.next_out)
        {
          do
          {
            v14 = deflate(&strm, 4);
            next_out = strm.next_out;
            objc_msgSend(v9, "appendBytes:length:", v19, strm.next_out - v19);
            v16 = next_out > v19 && v14 == -5;
            strm.avail_out = 0x4000;
            strm.next_out = v19;
          }
          while (v16 || v14 == 0);
          strm.avail_out = 0;
          strm.next_out = 0;
          deflateEnd(&strm);
          if (v14 != -5 && v14 != 1)
          {
            NSLog(CFSTR("deflate() failed: %s"), strm.msg);
            goto LABEL_21;
          }
        }
        else
        {
          deflateEnd(&strm);
        }
        v5 = v9;
        goto LABEL_22;
      }
      NSLog(CFSTR("deflate() failed: %s"), strm.msg);
    }
    deflateEnd(&strm);
LABEL_21:
    v5 = 0;
LABEL_22:

    goto LABEL_23;
  }
  NSLog(CFSTR("ERROR: unable to zip large data of size ~%.3f GB"), (double)-[NSData length](v4, "length") / 1000000000.0);
  v5 = 0;
LABEL_23:

  return v5;
}

+ (id)MZStringFromDigestData:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  unsigned __int8 *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * v4));
  if (v4)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("%02x"), v6[v8]);
      v8 = v9;
    }
    while (v4 > v9++);
  }

  return v7;
}

+ (id)MZStringByMD5HashingString:(id)a3
{
  void *v4;
  id v5;
  char *v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CC_MD5_CTX v13;
  unsigned __int8 md[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  if (objc_msgSend(v4, "length"))
  {
    memset(&v13, 0, sizeof(v13));
    if (CC_MD5_Init(&v13))
    {
      v5 = objc_retainAutorelease(v4);
      v6 = (char *)objc_msgSend(v5, "bytes");
      v7 = 0;
      while (1)
      {
        v8 = (char *)objc_msgSend(v5, "length");
        v9 = (unint64_t)&v8[-v7] >= 0xFFFF ? 0xFFFFLL : (uint64_t)&v8[-v7];
        if (!CC_MD5_Update(&v13, &v6[v7], v9))
          break;
        v7 += v9;
        if (v7 >= (unint64_t)objc_msgSend(v5, "length"))
        {
          if (!CC_MD5_Final(md, &v13))
            break;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 16));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MZStringFromDigestData:", v10));

          goto LABEL_12;
        }
      }
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)MZDataByInflatingWithNoZipHeader
{
  return -[NSData _MZDataByInflating](self, "_MZDataByInflating");
}

- (id)MZDataByDeflatingWithNoZipHeader
{
  return -[NSData _MZDataByDeflatingWithCompression:](self, "_MZDataByDeflatingWithCompression:", 2);
}

- (id)MZDataByInflatingWithGZip
{
  return -[NSData _MZDataByInflating](self, "_MZDataByInflating");
}

- (id)MZDataByDeflatingWithGZip
{
  return -[NSData _MZDataByDeflatingWithCompression:](self, "_MZDataByDeflatingWithCompression:", 2);
}

@end
