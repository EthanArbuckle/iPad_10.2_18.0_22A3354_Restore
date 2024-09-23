@implementation WSWebSheetDownloadManager

- (BOOL)removeFromDisk
{
  void *v3;
  char v4;
  NSString *fileDownloadPath;

  if (!self->_fileDownloadPath)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_web_removeFileOnlyAtPath:", self->_fileDownloadPath);

  fileDownloadPath = self->_fileDownloadPath;
  self->_fileDownloadPath = 0;

  return v4;
}

- (void)_downloadDidStart:(id)a3
{
  NSLog(CFSTR("_downloadDidStart"), a2, a3);
}

- (void)_download:(id)a3 didReceiveResponse:(id)a4
{
  NSLog(CFSTR("didReceiveResponse"), a2, a3, a4);
}

- (void)_download:(id)a3 didReceiveData:(unint64_t)a4
{
  NSLog(CFSTR("didReceiveData"), a2, a3, a4);
}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD, NSString *);
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *fileDownloadPath;
  id v13;

  v13 = a3;
  v7 = (void (**)(id, _QWORD, NSString *))a5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("ConfigurationProfile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend(v8, "_web_pathWithUniqueFilenameForPath:", v10),
        v11 = (NSString *)objc_claimAutoreleasedReturnValue(),
        fileDownloadPath = self->_fileDownloadPath,
        self->_fileDownloadPath = v11,
        fileDownloadPath,
        !self->_fileDownloadPath))
  {
    objc_msgSend(v13, "cancel");
  }
  v7[2](v7, 0, self->_fileDownloadPath);

}

- (void)_downloadDidFinish:(id)a3
{
  -[_WSWebSheetDownloadDelegate downloadDidFinish:](self->_delegate, "downloadDidFinish:", a3);
}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  -[_WSWebSheetDownloadDelegate downloadDidFail:](self->_delegate, "downloadDidFail:", a3, a4);
}

- (NSString)fileDownloadPath
{
  return self->_fileDownloadPath;
}

- (_WSWebSheetDownloadDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_WSWebSheetDownloadDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileDownloadPath, 0);
}

@end
