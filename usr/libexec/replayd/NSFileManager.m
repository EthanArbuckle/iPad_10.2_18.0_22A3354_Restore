@implementation NSFileManager

- (id)_srTempPath
{
  return objc_msgSend(CFSTR("/private/var/mobile/Library/ReplayKit/"), "stringByExpandingTildeInPath");
}

- (void)_srSetupTempDirectory
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  id v7;
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_srSetupTempDirectory", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  v4 = -[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:", v3, 0);

  if ((v4 & 1) != 0)
  {
    -[NSFileManager _srDeleteAllAndSystemTempFiles](self, "_srDeleteAllAndSystemTempFiles");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
    v7 = 0;
    -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 0, 0, &v7);
    v6 = v7;

    if (v6)
    {
      NSLog(CFSTR("error: %@"), v6);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10004BE9C();
    }

  }
}

- (id)dateSuffix
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v3, "setDateFormat:", CFSTR("MM-dd-yyyy HH:mm:ss"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-")));

  return v5;
}

- (id)outputPath:(int)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager dateSuffix](self, "dateSuffix"));
  if (a3 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_srTempPath"));
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/ClipRecording_%@.mp4"), v9, v7);
  }
  else
  {
    if (a3 != 2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_srTempPath"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v6));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@_%@.mp4"), v9, v12, v7));

      goto LABEL_7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_srTempPath"));
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/ScreenRecording_%@.mp4"), v9, v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_7:

  return v11;
}

- (id)trimmedOutputPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_srTempPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedAppNameFromBundleID:](NSBundle, "_rpLocalizedAppNameFromBundleID:", v3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@_trimmed.mp4"), v5, v6));
  return v7;
}

- (int64_t)_srSizeOfTempDir:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, a3));

  v8 = objc_msgSend(v7, "fileSize");
  return (int64_t)v8;
}

- (int64_t)_srDeleteAllTempFiles
{
  return -[NSFileManager _srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:](self, "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:", 0, 0.0);
}

- (int64_t)_srDeleteAllAndSystemTempFiles
{
  return -[NSFileManager _srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:](self, "_srDeleteFilesOlderThanTimeToLiveInSeconds:deleteSystemFiles:", 1, 0.0);
}

- (int64_t)_srDeleteFilesOlderThanTimeToLiveInSeconds:(double)a3 deleteSystemFiles:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id obj;
  int64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  int v42;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v42 = (int)a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_srDeleteFilesOlderThanTimeToLiveInSeconds: %i", buf, 8u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  v39 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v8, &v39));
  v10 = v39;

  sub_100004C20(v11, v10);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v32 = 0;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if (a4
          || (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "containsString:", CFSTR("ScreenRecording_")) & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v17, v16));

          v34 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager attributesOfItemAtPath:error:](self, "attributesOfItemAtPath:error:", v18, &v34));
          v20 = v34;

          sub_100004C20(v21, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileModificationDate"));
          objc_msgSend(v22, "timeIntervalSinceDate:", v23);
          v25 = v24;

          v26 = objc_msgSend(v19, "fileSize");
          if (a3 == 0.0 || v25 > a3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "deleting old file", buf, 2u);
            }
            v33 = v20;
            -[NSFileManager removeItemAtPath:error:](self, "removeItemAtPath:error:", v18, &v33);
            v27 = v33;

            sub_100004C20(v28, v27);
            if (v27)
              v29 = 0;
            else
              v29 = v26;
            v32 += (int64_t)v29;
            v20 = v27;
          }

          v10 = v20;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)_srRemoveFile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  NSFileManager *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  global_queue = dispatch_get_global_queue(-32768, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D40;
  block[3] = &unk_100080D60;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)_srMoveFileFromURL:(id)a3 toURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004EDC;
  v16[3] = &unk_100080D88;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)_srDeleteFilesWithPrefix:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005034;
  v8[3] = &unk_100080DB0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (id)_srGetCreationDateForFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfItemAtPath:error:", v5, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", NSFileCreationDate));

  return v7;
}

- (BOOL)_srDeviceHasSufficientFreeSpaceForRecording
{
  return -[NSFileManager _srDeviceFreeDiskSpace](self, "_srDeviceFreeDiskSpace") > 0x5F5E100;
}

- (unint64_t)_srDeviceFreeDiskSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager _srTempPath](self, "_srTempPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v4, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSFileSystemFreeSize));
  v7 = objc_msgSend(v6, "unsignedLongValue");

  return (unint64_t)v7;
}

- (BOOL)_srDeviceHasSufficientSpaceForCurrentRecording
{
  unint64_t v3;

  v3 = 2 * -[NSFileManager _srSizeOfTempDir:](self, "_srSizeOfTempDir:", 0) + 20000000;
  return v3 < -[NSFileManager _srDeviceFreeDiskSpace](self, "_srDeviceFreeDiskSpace");
}

@end
