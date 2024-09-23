@implementation PTPCameraFolder

- (PTPCameraFolder)initWithStorageID:(unsigned int)a3 objHandle:(unsigned int)a4 parent:(id)a5 initiator:(id)a6
{
  PTPCameraFolder *v6;
  PTPCameraFolder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTPCameraFolder;
  v6 = -[PTPCameraItem initWithStorageID:objHandle:parent:initiator:](&v9, "initWithStorageID:objHandle:parent:initiator:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
  v7 = v6;
  if (v6)
    -[PTPCameraItem setType:](v6, "setType:", 3);
  return v7;
}

- (id)mediaItemType
{
  return CFSTR("folder");
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)PTPCameraFolder;
  -[PTPCameraFolder dealloc](&v3, "dealloc");
}

- (void)refreshInfo
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInfo:", -[PTPCameraItem objHandle](self, "objHandle")));
  -[PTPCameraItem setInfo:](self, "setInfo:", v3);

}

- (void)newItemWithObjectInfo:(id)a3 notify:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PTPCameraFile *v10;
  uint64_t v11;
  id v12;
  void *v13;
  PTPCameraFile *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;

  v6 = a3;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001E360;
    v20[3] = &unk_1000489E8;
    v20[4] = self;
    v21 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v20));
    objc_msgSend(v8, "addInitiatedOperation:", v9);

  }
  else
  {
    v10 = [PTPCameraFile alloc];
    v11 = -[PTPCameraItem storageID](self, "storageID");
    v12 = objc_msgSend(v6, "objectHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
    v14 = -[PTPCameraFile initWithStorageID:ptpObjectInfo:objHandle:parent:initiator:](v10, "initWithStorageID:ptpObjectInfo:objHandle:parent:initiator:", v11, v6, v12, self, v13);

    __ICOSLogCreate();
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File queued: %@\n"), v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v16));

    if (__ICLogTypeEnabled(4))
    {
      v18 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem storage](self, "storage"));
    objc_msgSend(v19, "addCameraFileToIndex:", v14);

  }
}

- (id)newFolderWithObjectInfo:(id)a3 inFolder:(id)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PTPCameraFolder *v10;
  uint64_t v11;
  id v12;
  void *v13;
  PTPCameraFolder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  const __CFString *v24;
  void *v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = [PTPCameraFolder alloc];
  v11 = -[PTPCameraItem storageID](self, "storageID");
  v12 = objc_msgSend(v8, "objectHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v14 = -[PTPCameraFolder initWithStorageID:objHandle:parent:initiator:](v10, "initWithStorageID:objHandle:parent:initiator:", v11, v12, v9, v13);

  -[PTPCameraItem setInfo:](v14, "setInfo:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem storage](self, "storage"));
  objc_msgSend(v15, "addCameraFolderToIndex:", v14);

  if (v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));

    v24 = CFSTR("ICPTPObjectInfoArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content:", 2));
    v23 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v25 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allConnections"));
    objc_msgSend(v17, "sendAddedItemsNotification:toConnections:", v20, v21);

  }
  return v14;
}

@end
