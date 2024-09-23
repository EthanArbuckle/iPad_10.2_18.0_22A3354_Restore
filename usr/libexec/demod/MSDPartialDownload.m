@implementation MSDPartialDownload

- (MSDPartialDownload)init
{
  -[MSDPartialDownload setTotalFileSize:](self, "setTotalFileSize:", -1);
  -[MSDPartialDownload setDownloadedBytes:](self, "setDownloadedBytes:", 0);
  -[MSDPartialDownload setExistingFileSize:](self, "setExistingFileSize:", 0);
  -[MSDPartialDownload setLastDownloadedByte:](self, "setLastDownloadedByte:", 0);
  return self;
}

- (MSDPartialDownload)initWithFilePath:(id)a3
{
  id v4;
  MSDPartialDownload *v5;
  void *v6;
  void *v7;
  MSDPartialDownload *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDPartialDownload;
  v5 = -[MSDPartialDownload init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if (objc_msgSend(v6, "fileExistsAtPath:", v4))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributesOfItemAtPath:error:", v4, 0));
      -[MSDPartialDownload setExistingFileSize:](v5, "setExistingFileSize:", objc_msgSend(v7, "fileSize"));

    }
    else
    {
      -[MSDPartialDownload setExistingFileSize:](v5, "setExistingFileSize:", 0);
    }
    -[MSDPartialDownload setTotalFileSize:](v5, "setTotalFileSize:", -1);
    -[MSDPartialDownload setDownloadedBytes:](v5, "setDownloadedBytes:", 0);
    -[MSDPartialDownload setLastDownloadedByte:](v5, "setLastDownloadedByte:", 0);
    v8 = v5;

  }
  return v5;
}

- (BOOL)isDownloadComplete
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  int64_t v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  int64_t v15;

  v3 = -[MSDPartialDownload downloadedBytes](self, "downloadedBytes");
  v4 = -[MSDPartialDownload existingFileSize](self, "existingFileSize");
  if (-[MSDPartialDownload totalFileSize](self, "totalFileSize") != -1)
  {
    v5 = (void *)(v4 + v3);
    if ((void *)-[MSDPartialDownload totalFileSize](self, "totalFileSize") == v5)
      return 1;
    if (-[MSDPartialDownload totalFileSize](self, "totalFileSize") < (uint64_t)v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("Downloaded file size went bigger than total size"), CFSTR("testEventAdditionalData"), &off_10014D7A8, CFSTR("testLogLevel"), 0));
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v11 = -[MSDPartialDownload totalFileSize](self, "totalFileSize");
        v12 = 2048;
        v13 = -[MSDPartialDownload downloadedBytes](self, "downloadedBytes");
        v14 = 2048;
        v15 = -[MSDPartialDownload existingFileSize](self, "existingFileSize");
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error happened totalFileSize = %ld downloadContentSize=%ld existingFileSize=%ld", buf, 0x20u);
      }

      return 1;
    }
  }
  return 0;
}

- (BOOL)didProgress
{
  uint64_t v3;

  v3 = -[MSDPartialDownload downloadedBytes](self, "downloadedBytes");
  return v3 > -[MSDPartialDownload lastDownloadedByte](self, "lastDownloadedByte");
}

- (void)recordDownloadedBytes
{
  -[MSDPartialDownload setLastDownloadedByte:](self, "setLastDownloadedByte:", -[MSDPartialDownload downloadedBytes](self, "downloadedBytes"));
}

- (id)getRangeHeaderForDownload
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (char *)-[MSDPartialDownload existingFileSize](self, "existingFileSize")+ -[MSDPartialDownload downloadedBytes](self, "downloadedBytes")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bytes=%@-%@"), v2, &stru_100141020));

  return v3;
}

- (void)processServerRangeResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[MSDPartialDownload totalFileSize](self, "totalFileSize") == -1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/")));
    v4 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "count") == (id)2)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
        v7 = objc_msgSend(v6, "longLongValue");

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
          -[MSDPartialDownload setTotalFileSize:](self, "setTotalFileSize:", objc_msgSend(v8, "longLongValue"));

        }
      }
    }
  }
  else
  {
    v4 = 0;
  }

}

- (void)appendDownloadedFileSize:(int64_t)a3
{
  -[MSDPartialDownload setDownloadedBytes:](self, "setDownloadedBytes:", (char *)-[MSDPartialDownload downloadedBytes](self, "downloadedBytes") + a3);
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("TotalFileSize: %ld\t"), -[MSDPartialDownload totalFileSize](self, "totalFileSize")));
  objc_msgSend(v3, "appendFormat:", CFSTR("DownloadedBytes: %ld"), -[MSDPartialDownload downloadedBytes](self, "downloadedBytes"));
  return v3;
}

- (void)pushToTestLog:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPartialDownload fileDownloading](self, "fileDownloading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(" -> ")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPartialDownload description](self, "description"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v6));

    if (v11)
      v8 = objc_msgSend(v11, "mutableCopy");
    else
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = v8;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestInterface sharedInstance](MSDTestInterface, "sharedInstance"));
      objc_msgSend(v10, "pushTestEvent:ofType:", v7, CFSTR("partialRangeStatus"));

    }
  }

}

- (int64_t)totalFileSize
{
  return self->_totalFileSize;
}

- (void)setTotalFileSize:(int64_t)a3
{
  self->_totalFileSize = a3;
}

- (int64_t)downloadedBytes
{
  return self->_downloadedBytes;
}

- (void)setDownloadedBytes:(int64_t)a3
{
  self->_downloadedBytes = a3;
}

- (int64_t)existingFileSize
{
  return self->_existingFileSize;
}

- (void)setExistingFileSize:(int64_t)a3
{
  self->_existingFileSize = a3;
}

- (int64_t)lastDownloadedByte
{
  return self->_lastDownloadedByte;
}

- (void)setLastDownloadedByte:(int64_t)a3
{
  self->_lastDownloadedByte = a3;
}

- (NSString)fileDownloading
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileDownloading:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileDownloading, 0);
}

@end
