@implementation VMRecordingAssetsBackup

- (VMRecordingAssetsBackup)initWithComposedAVURL:(id)a3 duration:(double)a4 error:(id *)a5
{
  id v8;
  VMRecordingAssetsBackup *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VMRecordingAssetsBackup *v19;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VMRecordingAssetsBackup;
  v9 = -[VMRecordingAssetsBackup init](&v21, "init");
  if (!v9)
    goto LABEL_3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v13, 1, 0));
  -[VMRecordingAssetsBackup setTemporaryDirectoryURL:](v9, "setTemporaryDirectoryURL:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingAssetsBackup temporaryDirectoryURL](v9, "temporaryDirectoryURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLByAppendingPathComponent:", v16));
  -[VMRecordingAssetsBackup setComposedAVURLBackup:](v9, "setComposedAVURLBackup:", v17);

  -[VMRecordingAssetsBackup setOriginalDuration:](v9, "setOriginalDuration:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingAssetsBackup composedAVURLBackup](v9, "composedAVURLBackup"));
  LODWORD(v16) = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v8, v18, a5);

  v19 = 0;
  if ((_DWORD)v16)
LABEL_3:
    v19 = v9;

  return v19;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingAssetsBackup temporaryDirectoryURL](self, "temporaryDirectoryURL"));
  objc_msgSend(v3, "removeItemAtURL:error:", v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)VMRecordingAssetsBackup;
  -[VMRecordingAssetsBackup dealloc](&v5, "dealloc");
}

- (NSURL)composedAVURLBackup
{
  return self->_composedAVURLBackup;
}

- (void)setComposedAVURLBackup:(id)a3
{
  objc_storeStrong((id *)&self->_composedAVURLBackup, a3);
}

- (double)originalDuration
{
  return self->_originalDuration;
}

- (void)setOriginalDuration:(double)a3
{
  self->_originalDuration = a3;
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_composedAVURLBackup, 0);
}

@end
