@implementation RPFileTransferResumeStateItem

- (RPFileTransferResumeStateItem)initWithFileTransferRequestDict:(id)a3
{
  id v4;
  RPFileTransferResumeStateItem *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *fileInfo;
  void *v8;
  RPFileTransferResumeStateItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPFileTransferResumeStateItem;
  v5 = -[RPFileTransferResumeStateItem init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fileInfo = v5->_fileInfo;
    v5->_fileInfo = v6;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[RPFileTransferResumeStateItem setFileName:](v5, "setFileName:", v8);
    -[RPFileTransferResumeStateItem setFileSize:](v5, "setFileSize:", CFDictionaryGetInt64());
    -[RPFileTransferResumeStateItem setFileOffset:](v5, "setFileOffset:", CFDictionaryGetInt64());
    -[RPFileTransferResumeStateItem setFileModTime:](v5, "setFileModTime:", CFDictionaryGetInt64());
    -[RPFileTransferResumeStateItem setFileModTimeNsec:](v5, "setFileModTimeNsec:", CFDictionaryGetInt64());
    -[RPFileTransferResumeStateItem setBytesWritten:](v5, "setBytesWritten:", 0);
    -[RPFileTransferResumeStateItem setError:](v5, "setError:", 0);
    v9 = v5;

  }
  return v5;
}

- (RPFileTransferResumeStateItem)initWithStateDict:(id)a3
{
  id v5;
  RPFileTransferResumeStateItem *v6;
  RPFileTransferResumeStateItem *v7;
  RPFileTransferResumeStateItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPFileTransferResumeStateItem;
  v6 = -[RPFileTransferResumeStateItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  NSMutableDictionary *fileInfo;
  objc_super v4;

  fileInfo = self->_fileInfo;
  self->_fileInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)RPFileTransferResumeStateItem;
  -[RPFileTransferResumeStateItem dealloc](&v4, sel_dealloc);
}

- (id)fileInfo
{
  return self->_fileInfo;
}

- (id)itemURL
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("sourceFileURL"));
}

- (void)setItemURL:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_fileInfo, "setValue:forKey:", a3, CFSTR("sourceFileURL"));
}

- (id)fileName
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("outputFileName"));
}

- (void)setFileName:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_fileInfo, "setValue:forKey:", a3, CFSTR("outputFileName"));
}

- (unint64_t)fileSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("fileSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (void)setFileSize:(unint64_t)a3
{
  NSMutableDictionary *fileInfo;
  id v4;

  fileInfo = self->_fileInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, CFSTR("fileSize"));

}

- (unint64_t)fileOffset
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("fileOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (void)setFileOffset:(unint64_t)a3
{
  NSMutableDictionary *fileInfo;
  id v4;

  fileInfo = self->_fileInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, CFSTR("fileOffset"));

}

- (unint64_t)fileModTime
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("modTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (void)setFileModTime:(unint64_t)a3
{
  NSMutableDictionary *fileInfo;
  id v4;

  fileInfo = self->_fileInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, CFSTR("modTime"));

}

- (unint64_t)fileModTimeNsec
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("modTimeNsec"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (void)setFileModTimeNsec:(unint64_t)a3
{
  NSMutableDictionary *fileInfo;
  id v4;

  fileInfo = self->_fileInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, CFSTR("modTimeNsec"));

}

- (unint64_t)bytesWritten
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("bytesWritten"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (void)setBytesWritten:(unint64_t)a3
{
  NSMutableDictionary *fileInfo;
  id v4;

  fileInfo = self->_fileInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, CFSTR("bytesWritten"));

}

- (id)error
{
  return (id)-[NSMutableDictionary objectForKey:](self->_fileInfo, "objectForKey:", CFSTR("error"));
}

- (void)setError:(id)a3
{
  NSMutableDictionary *fileInfo;
  id v4;

  fileInfo = self->_fileInfo;
  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setValue:forKey:](fileInfo, "setValue:forKey:", v4, CFSTR("error"));

}

- (BOOL)sourceFileItemUsable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  BOOL v9;
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  stat v13;

  v4 = a3;
  -[RPFileTransferResumeStateItem error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

  if ((v7 & 1) == 0)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    LogPrintF();
    goto LABEL_25;
  }
  memset(&v13, 0, sizeof(v13));
  v8 = objc_retainAutorelease(v4);
  if (stat((const char *)objc_msgSend(v8, "UTF8String"), &v13))
  {
    if (gLogCategory_RPFileTransferSession > 30)
    {
LABEL_25:
      v9 = 0;
      goto LABEL_26;
    }
    if (gLogCategory_RPFileTransferSession == -1)
    {
      v9 = 0;
      if (!_LogCategory_Initialize())
        goto LABEL_26;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    tv_sec = v13.st_mtimespec.tv_sec;
    tv_nsec = v13.st_mtimespec.tv_nsec;
    if (tv_sec == -[RPFileTransferResumeStateItem fileModTime](self, "fileModTime")
      && tv_nsec == -[RPFileTransferResumeStateItem fileModTimeNsec](self, "fileModTimeNsec"))
    {
      if (gLogCategory_RPFileTransferSession > 30)
      {
        v9 = 1;
        goto LABEL_26;
      }
      if (gLogCategory_RPFileTransferSession == -1)
      {
        v9 = 1;
        if (!_LogCategory_Initialize())
          goto LABEL_26;
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      if (gLogCategory_RPFileTransferSession > 30)
        goto LABEL_25;
      if (gLogCategory_RPFileTransferSession == -1)
      {
        v9 = 0;
        if (!_LogCategory_Initialize())
          goto LABEL_26;
      }
      else
      {
        v9 = 0;
      }
    }
  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  LogPrintF();
LABEL_26:

  return v9;
}

- (BOOL)outputFileItemUsable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  off_t v10;
  void *v11;
  char v12;
  id v13;
  BOOL v14;
  stat v16;

  v4 = a3;
  -[RPFileTransferResumeStateItem fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RPFileTransferResumeStateItem fileOffset](self, "fileOffset");
  v8 = -[RPFileTransferResumeStateItem bytesWritten](self, "bytesWritten");
  -[RPFileTransferResumeStateItem error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
    goto LABEL_4;
  }
  v10 = v8 + v7;
  if (!(v8 + v7))
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
LABEL_4:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
LABEL_5:
    LogPrintF();
LABEL_34:
    v14 = 0;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v6);

  if ((v12 & 1) == 0)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
    goto LABEL_4;
  }
  memset(&v16, 0, sizeof(v16));
  v13 = objc_retainAutorelease(v6);
  if (stat((const char *)objc_msgSend(v13, "UTF8String"), &v16))
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
    goto LABEL_11;
  }
  if (v16.st_size < v10)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    goto LABEL_5;
  }
  if (gLogCategory_RPFileTransferSession <= 30
    && (gLogCategory_RPFileTransferSession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    LogPrintF();
  }
  v14 = 1;
LABEL_35:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileInfo, 0);
}

@end
