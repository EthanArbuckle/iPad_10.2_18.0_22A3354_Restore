@implementation NSData

- (id)_gkZippedData
{
  NSData *v2;
  Bytef *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  id v11;
  z_stream v13;

  v2 = objc_retainAutorelease(self);
  v3 = -[NSData bytes](v2, "bytes");
  v4 = -[NSData length](v2, "length");
  v5 = 0;
  if (v3)
  {
    v6 = v4;
    if (v4)
    {
      memset(&v13.avail_in, 0, 104);
      v13.avail_in = v4;
      v13.avail_out = v4;
      v13.next_in = v3;
      v7 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", v4));
      v13.next_out = (Bytef *)objc_msgSend(v7, "mutableBytes", v13.next_in, *(_QWORD *)&v13.avail_in);
      if (v7
        && !deflateInit2_(&v13, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (v8 = deflate(&v13, 4), v9 = deflateEnd(&v13), v8 == 1))
      {
        v10 = v9;
        v11 = 0;
        if (!v10 && v6 == (id)v13.total_in)
        {
          objc_msgSend(v7, "setLength:", v13.total_out);
          v11 = v7;
        }
      }
      else
      {
        v11 = 0;
      }
      v5 = v11;

    }
  }
  return v5;
}

- (id)_gkUnzippedData
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  z_stream strm;
  _BYTE v8[16384];

  memset(&strm.avail_in, 0, 104);
  strm.avail_in = -[NSData length](self, "length");
  strm.next_in = (Bytef *)-[NSData bytes](objc_retainAutorelease(self), "bytes");
  v3 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
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
        return v3;
      }
    }
    inflateEnd(&strm);

    v3 = 0;
  }
  return v3;
}

- (void)_gkWriteToImageCacheWithURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByDeletingLastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = 0;
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v21);
    v10 = v21;

    if (v10)
    {
      if (!os_log_GKGeneral)
        v12 = (id)GKOSLoggers(v11);
      v13 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100134594((uint64_t)v10, v13);
    }

  }
  v20 = 0;
  -[NSData writeToFile:options:error:](self, "writeToFile:options:error:", v5, 1, &v20);
  v14 = v20;
  v15 = v14;
  if (v14)
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(v14);
    v17 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100134510((uint64_t)v5, (uint64_t)v15, v17);
  }
  else
  {
    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(0);
    v19 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Saved new local player avatar image to image cache: %@", buf, 0xCu);
    }
    _gkMarkFileAsPurgeable(v5);
  }

}

@end
