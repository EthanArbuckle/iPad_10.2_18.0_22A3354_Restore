@implementation MSDContentFilesUninstallOperation

- (id)methodSelectors
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_removeContentFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)_removeContentFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerType"));

  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting content files from container %{public}@ of type %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = -[MSDContentFilesUninstallOperation _clearDataContainer:ofType:](self, "_clearDataContainer:ofType:", v4, v6);
  return v9;
}

- (BOOL)_clearDataContainer:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  v23 = 0;
  v22 = 0;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AppData")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("GroupData")) & 1) != 0)
  {
    v7 = 7;
  }
  else
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ExtensionData")) & 1) == 0)
    {
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000CCB30((uint64_t)v6, v16);

      goto LABEL_17;
    }
    v7 = 4;
  }
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = v5;
    v26 = 2114;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clearing data container: %{public}@ (%{public}@)", buf, 0x16u);
  }

  v10 = objc_retainAutorelease(v5);
  v11 = container_create_or_lookup_for_current_user(v7, objc_msgSend(v10, "cStringUsingEncoding:", 4), 0, 0, &v22, &v23);
  if (!v11)
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      v26 = 2114;
      v27 = v6;
      v28 = 2048;
      v29 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cannot create container object for %{public}@(%{public}@): %lld", buf, 0x20u);
    }

LABEL_17:
    v13 = 0;
    goto LABEL_13;
  }
  v12 = v11;
  v23 = container_delete_all_container_content();
  v13 = v23 == 1;
  if (v23 != 1)
  {
    v19 = sub_1000604F0();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      v26 = 2114;
      v27 = v6;
      v28 = 2048;
      v29 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Cannot remove data for container %{public}@(%{public}@), error code is %lld", buf, 0x20u);
    }

  }
  container_free_object(v12);
LABEL_13:

  return v13;
}

@end
