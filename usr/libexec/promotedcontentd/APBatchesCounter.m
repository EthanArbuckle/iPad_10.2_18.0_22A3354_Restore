@implementation APBatchesCounter

- (NSString)startDirectory
{
  return self->_startDirectory;
}

- (APBatchesCounter)initWithFileManager:(id)a3 startDirectory:(id)a4
{
  id v7;
  id v8;
  APBatchesCounter *v9;
  APBatchesCounter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APBatchesCounter;
  v9 = -[APBatchesCounter init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_startDirectory, a4);
  }

  return v10;
}

- (APStorageManager)fileManager
{
  return self->_fileManager;
}

- (int64_t)count
{
  void *v3;
  void *v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APBatchesCounter fileManager](self, "fileManager"));
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APBatchesCounter startDirectory](self, "startDirectory"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DD0C;
  v7[3] = &unk_100215D10;
  v7[4] = &v8;
  objc_msgSend(v3, "dfsWithStartPath:nodeCallback:", v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDirectory, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void)setStartDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_startDirectory, a3);
}

@end
