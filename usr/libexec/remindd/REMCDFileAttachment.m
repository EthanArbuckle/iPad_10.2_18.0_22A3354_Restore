@implementation REMCDFileAttachment

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDFileAttachment"));
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMFileAttachment cdEntityName](REMFileAttachment, "cdEntityName");
}

- (void)prepareForDeletion
{
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v23.receiver = self;
  v23.super_class = (Class)REMCDFileAttachment;
  -[REMCDObject prepareForDeletion](&v23, "prepareForDeletion");
  v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v8, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2114;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] prepareForDeletion {attachmentID: %{public}@}", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[REMCDFileAttachment identifier](self, "identifier"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDFileAttachment account](self, "account"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDFileAttachment sha512Sum](self, "sha512Sum"));

        if (v17)
        {
          v18 = objc_claimAutoreleasedReturnValue(-[REMCDFileAttachment sha512Sum](self, "sha512Sum"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDFileAttachment fileName](self, "fileName"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pathExtension"));

          objc_msgSend(v13, "proposePurgingFileAttachmentWithSha512Sum:fileExtension:account:", v18, v20, v16);
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileAttachmentIdentifiersToPurgeByAccountIdentifier"));
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v16));

          if (!v18)
          {
            v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileAttachmentIdentifiersToPurgeByAccountIdentifier"));
            objc_msgSend(v22, "setObject:forKey:", v18, v16);

          }
          -[NSObject addObject:](v18, "addObject:", v14);
        }
      }
      else
      {
        v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_100682158();
      }

    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100682084();
    }

  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100681FB0();
  }

}

- (id)attachmentRepresentationAndReturnError:(id *)a3
{
  return sub_10041A24C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_10041D124);
}

@end
