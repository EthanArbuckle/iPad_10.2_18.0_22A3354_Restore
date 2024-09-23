@implementation SKUnmountOperation

- (SKUnmountOperation)initWithDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  SKUnmountOperation *v9;
  SKUnmountOperation *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSSet *disksToUnmount;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SKUnmountOperation;
  v9 = -[SKBaseDiskArbOperation initWithTarget:options:callbackBlock:](&v20, "initWithTarget:options:callbackBlock:", v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](v9, "options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kSKAPFSDiskUnmountIgnoreGroup));
    v13 = -[SKBaseDiskArbOperation disksForOperationWithTarget:ignoreGroup:](v10, "disksForOperationWithTarget:ignoreGroup:", v8, sub_10000FC18(v12));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    disksToUnmount = v10->_disksToUnmount;
    v10->_disksToUnmount = (NSSet *)v14;

    if (!-[SKBaseDiskArbOperation recursive](v10, "recursive"))
    {
      v16 = objc_opt_class(SKAPFSContainerDisk);
      if ((objc_opt_isKindOfClass(v8, v16) & 1) != 0)
      {
        if (objc_msgSend(v8, "isLiveFSAPFSDisk"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](v10, "disksToUnmount"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "setByAddingObject:", v8));
          -[SKUnmountOperation setDisksToUnmount:](v10, "setDisksToUnmount:", v18);

        }
      }
    }
  }

  return v10;
}

+ (BOOL)unmountWithDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  SKUnmountOperation *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  void *i;
  uint64_t v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v7 = a3;
  v8 = a4;
  v21 = v7;
  v9 = -[SKUnmountOperation initWithDisk:options:withCompletionBlock:]([SKUnmountOperation alloc], "initWithDisk:options:withCompletionBlock:", v7, v8, 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](v9, "disksToUnmount"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    v14 = 1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v22 = 0;
        v17 = -[SKUnmountOperation _unmountWithDisk:error:](v9, "_unmountWithDisk:error:", v16, &v22);
        v18 = v22;
        v19 = v18;
        v14 &= v17;
        if ((v17 & 1) == 0)
        {
          if (a5)
          {
            v14 = 0;
            if (!*a5)
              *a5 = objc_retainAutorelease(v18);
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)_unmountWithDADisk:(id)a3
{
  __DADisk *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  DADiskUnmountOptions v12;
  BOOL v13;
  int v15;
  __DADisk *v16;
  __int16 v17;
  unsigned int v18;

  v4 = (__DADisk *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSKDiskUnmountOptionForce));
  if ((sub_10000FC18(v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kSKAPFSDiskUnmountForce));
    v7 = sub_10000FC18(v9);

  }
  v10 = sub_10000BA9C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v4;
    v17 = 1024;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling DADiskUnmount for %@, force=%d", (uint8_t *)&v15, 0x12u);
  }

  if (v7)
    v12 = 0x80000;
  else
    v12 = 0;
  DADiskUnmount(v4, v12, (DADiskUnmountCallback)sub_100017048, self);
  v13 = -[SKBaseDiskArbOperation completeDiskArbOp](self, "completeDiskArbOp");

  return v13;
}

- (BOOL)unmountSnapshotsWithDisk:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  _UNKNOWN **v13;
  void *v14;
  const __CFURL *v15;
  void *v16;
  DADiskRef v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  NSObject *v25;
  void *v27;
  id *v28;
  id v29;
  void *v31;
  void *v32;
  statfs *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;

  v5 = a3;
  v33 = 0;
  v6 = getmntinfo_r_np(&v33, 2);
  if (v6 < 0)
  {
    if (a4)
    {
      v40 = NSDebugDescriptionErrorKey;
      v41 = CFSTR("getmntinfo failed");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102));

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v7 = v6;
    v28 = a4;
    v29 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@/dev/%@"), v8));

    if (v7)
    {
      v9 = 0;
      v10 = 0;
      v11 = v7;
      v12 = 1112;
      v13 = &APFSCancelContainerResize_ptr;
      while (1)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (char *)v33 + v12));
        if (objc_msgSend(v14, "hasSuffix:", v31))
        {
          v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[117], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", (char *)v33 + v12 - 1024, 1, 0));
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
            v17 = DADiskCreateFromVolumePath(kCFAllocatorDefault, (DASessionRef)objc_msgSend(v16, "diskArbSession"), v15);

            if (v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v15, "path"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unmount of snapshot %@ from %@"), v14, v18));
              -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v19);

              v13 = &APFSCancelContainerResize_ptr;
              if (!-[SKUnmountOperation _unmountWithDADisk:](self, "_unmountWithDADisk:", v17))
              {
                v24 = sub_10000BA9C();
                v25 = objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v15, "path"));
                  *(_DWORD *)buf = 136315650;
                  v35 = "-[SKUnmountOperation unmountSnapshotsWithDisk:error:]";
                  v36 = 2112;
                  v37 = v14;
                  v38 = 2112;
                  v39 = v27;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: Failed to unmount snapshot %@ from %@", buf, 0x20u);

                }
                v5 = v29;
                if (v28)
                  *v28 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");
                free(v33);

                goto LABEL_20;
              }
            }
            else
            {
              v20 = sub_10000BA9C();
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](v15, "path"));
                *(_DWORD *)buf = 136315394;
                v35 = "-[SKUnmountOperation unmountSnapshotsWithDisk:error:]";
                v36 = 2112;
                v37 = v22;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to create DADisk from %@", buf, 0x16u);

                v13 = &APFSCancelContainerResize_ptr;
              }

            }
          }

        }
        v10 = ++v9 >= v11;
        v12 += 2168;
        if (v11 == v9)
          goto LABEL_19;
      }
    }
    v10 = 1;
LABEL_19:
    free(v33);
    v5 = v29;
LABEL_20:

  }
  return v10;
}

- (BOOL)_unmountWithDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __DADisk *v16;
  CFDictionaryRef v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  char v25;
  uint8_t buf[4];
  const char *v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mountPoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  if ((objc_msgSend(v8, "isEqualToString:", kSKDiskTypeAPFSLV) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kSKDiskMountOptionRecursive));
    v11 = sub_10000FC18(v10);

    if (v11 && !-[SKUnmountOperation unmountSnapshotsWithDisk:error:](self, "unmountSnapshotsWithDisk:error:", v6, a4))
      goto LABEL_17;
    if (!v7)
      goto LABEL_19;
  }
  else
  {

    if (!v7)
    {
LABEL_19:
      v19 = 1;
      goto LABEL_20;
    }
  }
  objc_msgSend((id)objc_opt_class(self), "storeMountState:", v6);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  if (-[NSObject isEqualToString:](v12, "isEqualToString:", kSKDiskTypeAPFSLV)
    && objc_msgSend(v6, "isEncrypted")
    && !objc_msgSend(v6, "defaultEffaceable"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", kSKAPFSDiskUnmountDoNotLock));
    v23 = objc_msgSend(v22, "BOOLValue");

    if (!v23)
      goto LABEL_11;
    v25 = 1;
    if (!fsctl((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), 0x80014A22uLL, &v25, 0))goto LABEL_11;
    v24 = sub_10000BA9C();
    v12 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SKUnmountOperation _unmountWithDisk:error:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to stash crypto key for APFS LV, remount may fail.", buf, 0xCu);
    }
  }

LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unmount of %@"), v6));
  -[SKBaseDiskArbOperation setCurrentOperationName:](self, "setCurrentOperationName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daDisk"));
  v15 = -[SKUnmountOperation _unmountWithDADisk:](self, "_unmountWithDADisk:", v14);

  if (v15)
  {
    -[SKBaseDiskArbOperation removeWithMountPoint:](self, "removeWithMountPoint:", v7);
    goto LABEL_19;
  }
  v16 = (__DADisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daDisk"));
  v17 = DADiskCopyDescription(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", kDADiskDescriptionVolumePathKey));
  if (!v18)
  {

    goto LABEL_19;
  }
  if (a4)
    *a4 = -[SKBaseDiskArbOperation newDAError](self, "newDAError");

LABEL_17:
  v19 = 0;
LABEL_20:

  return v19;
}

- (id)newPerformOperation
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  NSObject *v20;
  uint64_t v21;
  dispatch_queue_global_t global_queue;
  NSObject *v23;
  id v24;
  void *v25;
  id obj;
  _QWORD block[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = dispatch_group_create();
  if (-[SKBaseDiskArbOperation recursive](self, "recursive")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount")),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
    v34 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v33 = 0;
          v13 = -[SKUnmountOperation _unmountWithDisk:error:](self, "_unmountWithDisk:error:", v12, &v33);
          v14 = v33;
          v15 = v14;
          if ((v13 & 1) == 0 && !v9)
            v9 = v14;

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount"));
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          v20 = v3;
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
          global_queue = dispatch_get_global_queue(0, 0);
          v23 = objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100018814;
          block[3] = &unk_100044B78;
          block[4] = v21;
          v3 = v20;
          dispatch_group_async(v20, v23, block);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v17);
    }

    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v24 = v9;
    v25 = v24;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 119, 0));
    v24 = 0;
  }

  return v25;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKUnmountOperation disksToUnmount](self, "disksToUnmount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKBaseDiskArbOperation options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unmount Operation for %@ with %@"), v3, v4));

  return v5;
}

- (int64_t)defaultErrorCode
{
  return 401;
}

- (NSSet)disksToUnmount
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisksToUnmount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disksToUnmount, 0);
}

@end
