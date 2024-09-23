@implementation MBProgressDrive

- (MBProgressDrive)initWithScript:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  MBProgressDrive *v9;
  MBProgressDrive *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBProgressDrive;
  v9 = -[MBProgressDrive init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_script, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
  }

  return v10;
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  MBDriveScript *script;
  id v9;
  id v10;
  void *v11;

  script = self->_script;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToCreateDirectory](MBDriveOperation, "operationToCreateDirectory"));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v11);

  LOBYTE(a5) = -[MBDrive createDirectoryAtPath:options:error:](self->_delegate, "createDirectoryAtPath:options:error:", v10, v9, a5);
  return (char)a5;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  MBDriveScript *script;
  id v9;
  id v10;
  void *v11;
  void *v12;

  script = self->_script;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationForContentsOfDirectory](MBDriveOperation, "operationForContentsOfDirectory"));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MBDrive contentsOfDirectoryAtPath:options:error:](self->_delegate, "contentsOfDirectoryAtPath:options:error:", v10, v9, a5));
  return v12;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  MBDriveScript *script;
  id v11;
  id v12;
  id v13;
  void *v14;

  script = self->_script;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToC0pyItemWithCount:size:](MBDriveOperation, "operationToC0pyItemWithCount:size:", -1, -1));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v14);

  LOBYTE(a6) = -[MBDrive copyItemAtPath:toPath:options:error:](self->_delegate, "copyItemAtPath:toPath:options:error:", v13, v12, v11, a6);
  return (char)a6;
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  MBDriveScript *script;
  id v11;
  id v12;
  void *v13;

  script = self->_script;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFilesWithCount:size:](MBDriveOperation, "operationToUploadFilesWithCount:size:", objc_msgSend(v12, "count"), -1));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v13);

  LOBYTE(a6) = -[MBDrive uploadFilesAtPaths:options:results:error:](self->_delegate, "uploadFilesAtPaths:options:results:error:", v12, v11, a5, a6);
  return (char)a6;
}

- (void)uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  MBDriveScript *script;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  script = self->_script;
  v9 = a5;
  v10 = a4;
  v13 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "paths"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToUploadFilesWithCount:size:](MBDriveOperation, "operationToUploadFilesWithCount:size:", objc_msgSend(v11, "count"), -1));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v12);

  -[MBDrive uploadBatch:options:completion:](self->_delegate, "uploadBatch:options:completion:", v13, v10, v9);
}

- (void)finishBatchUploadsWithOptions:(id)a3 completion:(id)a4
{
  -[MBDrive finishBatchUploadsWithOptions:completion:](self->_delegate, "finishBatchUploadsWithOptions:completion:", a3, a4);
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  MBDriveScript *script;
  id v11;
  id v12;
  void *v13;

  script = self->_script;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToDownloadFilesWithCount:size:](MBDriveOperation, "operationToDownloadFilesWithCount:size:", objc_msgSend(v12, "count"), -1));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v13);

  LOBYTE(a6) = -[MBDrive downloadFilesAtPaths:options:results:error:](self->_delegate, "downloadFilesAtPaths:options:results:error:", v12, v11, a5, a6);
  return (char)a6;
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  MBDriveScript *script;
  id v11;
  id v12;
  void *v13;

  script = self->_script;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToMoveItemsWithCount:](MBDriveOperation, "operationToMoveItemsWithCount:", objc_msgSend(v12, "count")));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v13);

  LOBYTE(a6) = -[MBDrive moveItemsAtPaths:options:results:error:](self->_delegate, "moveItemsAtPaths:options:results:error:", v12, v11, a5, a6);
  return (char)a6;
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  MBDriveScript *script;
  id v11;
  id v12;
  void *v13;

  script = self->_script;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MBDriveOperation operationToRemoveItemsWithCount:](MBDriveOperation, "operationToRemoveItemsWithCount:", objc_msgSend(v12, "count")));
  -[MBDriveScript performingOperation:](script, "performingOperation:", v13);

  LOBYTE(a6) = -[MBDrive removeItemsAtPaths:options:results:error:](self->_delegate, "removeItemsAtPaths:options:results:error:", v12, v11, a5, a6);
  return (char)a6;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  return -[MBDrive freeSpace:error:](self->_delegate, "freeSpace:error:", a3, a4);
}

- (BOOL)purgeDiskSpace:(unint64_t *)a3 amountRequested:(unint64_t)a4 urgencyLevel:(int)a5 error:(id *)a6
{
  return -[MBDrive purgeDiskSpace:amountRequested:urgencyLevel:error:](self->_delegate, "purgeDiskSpace:amountRequested:urgencyLevel:error:", a3, a4, *(_QWORD *)&a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_script, 0);
}

@end
