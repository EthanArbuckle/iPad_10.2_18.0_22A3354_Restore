@implementation STUCreateTemporaryFileOperation

- (STUCreateTemporaryFileOperation)initWithData:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  STUCreateTemporaryFileOperation *v8;
  NSData *v9;
  NSData *mData;
  NSString *v11;
  NSString *mName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUCreateTemporaryFileOperation;
  v8 = -[STUCreateTemporaryFileOperation init](&v14, "init");
  if (v8)
  {
    v9 = (NSData *)objc_msgSend(v6, "copy");
    mData = v8->mData;
    v8->mData = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    mName = v8->mName;
    v8->mName = v11;

  }
  return v8;
}

- (void)main
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSString *v7;
  id v8;
  void *v9;
  void *v10;
  NSData *mData;
  NSData *v12;
  NSData *v13;
  unsigned int v14;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crk_uniqueTemporaryDirectoryURL](NSURL, "crk_uniqueTemporaryDirectoryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v16);
  v6 = v16;

  if ((v5 & 1) != 0)
  {
    if (-[NSString length](self->mName, "length"))
    {
      v7 = self->mName;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", v7));
    mData = self->mData;
    if (mData)
      v12 = mData;
    else
      v12 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v13 = v12;
    v15 = v6;
    v14 = -[NSData writeToURL:options:error:](v12, "writeToURL:options:error:", v10, 1, &v15);
    v8 = v15;

    if (v14)
      -[STUCreateTemporaryFileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v10);
    else
      -[STUCreateTemporaryFileOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
  else
  {
    -[STUCreateTemporaryFileOperation endOperationWithError:](self, "endOperationWithError:", v6);
    v8 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end
