@implementation REMCDObjectEffectiveVersionValidationDelegateImpl

- (REMCDObjectEffectiveVersionValidationDelegateImpl)initWithManagedObjectContext:(id)a3
{
  id v4;
  REMCDObjectEffectiveVersionValidationDelegateImpl *v5;
  REMCDObjectEffectiveVersionValidationDelegateImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMCDObjectEffectiveVersionValidationDelegateImpl;
  v5 = -[REMCDObjectEffectiveVersionValidationDelegateImpl init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_managedObjectContext, v4);

  return v6;
}

- (BOOL)preprocessTreeNode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  v4 = a3;
  v6 = objc_opt_class(REMCDObjectEffectiveVersionValidationNode, v5);
  v7 = REMDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectID"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backingCDObject"));
    if (v11)
    {
LABEL_3:
      v12 = -[NSObject validateEffectiveMinimumSupportedVersionApplyingChange:](v11, "validateEffectiveMinimumSupportedVersionApplyingChange:", 1);
LABEL_20:

      goto LABEL_21;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
    v23 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingObjectWithID:error:", v10, &v23));
    v15 = v23;

    if (v14)
      v17 = v15 == 0;
    else
      v17 = 0;
    if (v17)
    {
      v19 = objc_opt_class(REMCDObject, v16);
      v20 = REMDynamicCast(v19, v14);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (v21)
      {
        v11 = v21;
        objc_msgSend(v9, "setBackingCDObject:", v21);

        goto LABEL_3;
      }
      v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100682404((uint64_t)v10, (uint64_t)v14, v18);
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100682390();
    }

    v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100682324();
    v12 = 0;
    goto LABEL_20;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    sub_1006822A0((uint64_t)v4, v10);
  v12 = 0;
LABEL_21:

  return v12;
}

- (void)processBatchOfTreeNodes:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSObject *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
  v6 = objc_msgSend(v5, "hasChanges");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "updatedObjects"));
    v9 = objc_msgSend(v8, "count");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
    v21 = 0;
    v11 = objc_msgSend(v10, "coreDataSave:", &v21);
    v12 = v21;

    v13 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    v14 = v13;
    if (!v11 || v12)
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionAuthor"));
      v19 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 138544130;
      v23 = v16;
      v24 = 2048;
      v25 = v19;
      v26 = 2048;
      v27 = v9;
      v28 = 2114;
      v29 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "REMCDObjectEffectiveVersionValidationDelegateImpl.processBatchOfTreeNodes: SAVE COREDATA ERROR {author: %{public}@, nodesToFlush.count: %ld, update.count: %ld, error: %{public}@}", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionAuthor"));
      v17 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 2048;
      v25 = v17;
      v26 = 2048;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "REMCDObjectEffectiveVersionValidationDelegateImpl.processBatchOfTreeNodes: SAVE COREDATA {author: %{public}@, nodesToFlush.count: %ld, update.count: %ld}", buf, 0x20u);
    }

    goto LABEL_10;
  }
  v12 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationDelegateImpl managedObjectContext](self, "managedObjectContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject transactionAuthor](v14, "transactionAuthor"));
    *(_DWORD *)buf = 138543618;
    v23 = v18;
    v24 = 2048;
    v25 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "REMCDObjectEffectiveVersionValidationDelegateImpl.processBatchOfTreeNodes: No changes in MoC, no need to save {author: %{public}@, nodesToFlush.count: %ld}", buf, 0x16u);

    goto LABEL_10;
  }
LABEL_11:

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100071130;
  v20[3] = &unk_1007D9F08;
  v20[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);

}

- (RDStoreControllerManagedObjectContext)managedObjectContext
{
  return (RDStoreControllerManagedObjectContext *)objc_loadWeakRetained((id *)&self->_managedObjectContext);
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeWeak((id *)&self->_managedObjectContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managedObjectContext);
}

@end
