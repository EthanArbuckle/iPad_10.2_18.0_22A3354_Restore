@implementation SKRenameOperation

- (SKRenameOperation)initWithDisk:(id)a3 name:(id)a4 withCompletionBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id);
  SKRenameOperation *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  SKRenameOperation *v21;
  id v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id))a5;
  v24.receiver = self;
  v24.super_class = (Class)SKRenameOperation;
  v12 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:](&v24, "initWithTarget:options:callbackBlock:", v9, &__NSDictionary0__struct, v11);
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filesystemType"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filesystemType"));
      v16 = objc_msgSend(v15, "isEqualToString:", kSKDiskFileSystemFAT);

      if (v16)
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uppercaseString"));

        v10 = (id)v17;
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filesystem"));
    v23 = 0;
    v19 = objc_msgSend(v18, "isValidName:error:", v10, &v23);
    v20 = v23;

    if ((v19 & 1) != 0)
    {
      objc_storeStrong((id *)&v12->_diskToRename, a3);
      objc_storeStrong((id *)&v12->_name, v10);
      v21 = v12;
    }
    else
    {
      v11[2](v11, v20);
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)newPerformOperation
{
  __DADisk *v3;
  void *v4;
  id v5;

  v3 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self->_diskToRename, "daDisk"));
  DADiskRename(v3, (CFStringRef)self->_name, 0, (DADiskRenameCallback)sub_100017048, self);

  if (!-[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp"))
    return -[SKBaseDiskArbOperation newDAError](self, "newDAError");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v5 = objc_msgSend(v4, "_recacheSyncDisk:", self->_diskToRename);

  return 0;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Rename Operation for %@"), self->_diskToRename);
}

- (int64_t)defaultErrorCode
{
  return 402;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_diskToRename, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end
