@implementation IMDebugDataManager

+ (void)initialize
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  IMDebugViewHierarchyDataProvider *v7;
  IMDebugViewControllerHierarchyDataProvider *v8;
  IMDebugScreenShotDataProvider *v9;
  IMDebugUserDefaultsDataProvider *v10;
  IMDebugDownloadReportDataProvider *v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___IMDebugDataManager;
  objc_msgSendSuper2(&v12, "initialize");
  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)dataProviders;
  dataProviders = (uint64_t)v3;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)asyncDataProviders;
  asyncDataProviders = (uint64_t)v5;

  v7 = objc_alloc_init(IMDebugViewHierarchyDataProvider);
  objc_msgSend(a1, "registerDataProvider:", v7);

  v8 = objc_alloc_init(IMDebugViewControllerHierarchyDataProvider);
  objc_msgSend(a1, "registerDataProvider:", v8);

  v9 = objc_alloc_init(IMDebugScreenShotDataProvider);
  objc_msgSend(a1, "registerDataProvider:", v9);

  v10 = objc_alloc_init(IMDebugUserDefaultsDataProvider);
  objc_msgSend(a1, "registerDataProvider:", v10);

  v11 = objc_alloc_init(IMDebugDownloadReportDataProvider);
  objc_msgSend(a1, "registerAsyncDataProvider:", v11);

}

+ (void)registerDataProvider:(id)a3
{
  if (a3)
    objc_msgSend((id)dataProviders, "addObject:");
}

+ (void)registerAsyncDataProvider:(id)a3
{
  objc_msgSend((id)asyncDataProviders, "addObject:", a3);
}

+ (void)writeDebugData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__IMDebugDataManager_writeDebugData_completion___block_invoke;
  block[3] = &unk_105E8;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __48__IMDebugDataManager_writeDebugData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "writeDebugDataWithProgress:", *(_QWORD *)(a1 + 32)));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__IMDebugDataManager_writeDebugData_completion___block_invoke_2;
  v5[3] = &unk_105C0;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

uint64_t __48__IMDebugDataManager_writeDebugData_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (void)writeDebugData:(id)a3
{
  objc_msgSend(a1, "writeDebugData:completion:", 0, a3);
}

+ (id)writeDebugData
{
  return objc_msgSend(a1, "writeDebugDataWithProgress:", 0);
}

+ (id)writeDebugDataWithProgress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  dispatch_group_t v30;
  char *v31;
  id v32;
  unsigned int v33;
  char *v34;
  NSObject *v35;
  _QWORD *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *k;
  void *v48;
  dispatch_time_t v49;
  id v50;
  unsigned int v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  NSObject *v73;
  id v74;
  _QWORD *v75;
  void *v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  _QWORD v87[4];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];

  v53 = a3;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUtil applicationDocumentsDirectory](DebugUtil, "applicationDocumentsDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@"), v62, v58, v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "URLByAppendingPathComponent:", v57));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("zip")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v60, 0, 0, 0));

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v89 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathExtension"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathExtension"));
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathComponents"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsSeparatedByCharactersInSet:", v20));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
          LODWORD(v19) = objc_msgSend(v22, "isEqualToString:", v62);

          if ((_DWORD)v19)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            objc_msgSend(v23, "removeItemAtURL:error:", v14, 0);

          }
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    }
    while (v11);
  }

  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path")));
  v59 = zipOpen((uint64_t)objc_msgSend(v24, "cStringUsingEncoding:", 4), 0);

  if (!v59)
    NSLog(CFSTR("Can't open '%@'"), v8);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "components:fromDate:", 252, v56));
  v52 = objc_msgSend(v61, "second");
  v25 = objc_msgSend(v61, "minute");
  v26 = objc_msgSend(v61, "hour");
  v27 = objc_msgSend(v61, "day");
  v28 = objc_msgSend(v61, "month");
  v29 = objc_msgSend(v61, "year");
  v30 = dispatch_group_create();
  v31 = (char *)objc_msgSend((id)dataProviders, "count");
  v32 = objc_msgSend((id)asyncDataProviders, "count");
  v33 = v28 - 1;
  v34 = &v31[(_QWORD)v32];
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v87[3] = 0;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke;
  v72[3] = &unk_10638;
  v76 = v59;
  v77 = v52;
  v78 = v25;
  v79 = v26;
  v80 = v27;
  v81 = v33;
  v82 = v29;
  v84 = 0;
  v85 = 0;
  v83 = 0;
  v54 = v53;
  v74 = v54;
  v75 = v87;
  v86 = v34;
  v35 = v30;
  v73 = v35;
  v36 = objc_retainBlock(v72);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v37 = (id)dataProviders;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v69 != v39)
          objc_enumerationMutation(v37);
        v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
        dispatch_group_enter(v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "debugData"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "debugDataFileName"));
        ((void (*)(_QWORD *, void *, void *))v36[2])(v36, v42, v43);

      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
    }
    while (v38);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v44 = (id)asyncDataProviders;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v92, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v45; k = (char *)k + 1)
      {
        if (*(_QWORD *)v65 != v46)
          objc_enumerationMutation(v44);
        v48 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k);
        dispatch_group_enter(v35);
        objc_msgSend(v48, "createDebugDataWithCompletion:", v36);
      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v64, v92, 16);
    }
    while (v45);
  }

  v49 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v35, v49);
  if (zipClose((uint64_t)v59, 0))
  {
    NSLog(CFSTR("Error closing '%@'"), v8);
    v50 = 0;
  }
  else
  {
    v50 = v8;
  }

  _Block_object_dispose(v87, 8);
  return v50;
}

void __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  const Bytef *v11;
  uInt v12;
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = objc_retainAutorelease(v5);
  v8 = a2;
  if (zipOpenNewFileInZip3(v6, (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), a1 + 64, 0, 0, 0, 0, 0, 8, 8, 0xFFFFFFF100000000, 8, 0, 0, 0))NSLog(CFSTR("Could not append file %@ to zip archive"), v7);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = objc_retainAutorelease(v8);
  v11 = (const Bytef *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  if ((zipWriteInFileInZip(v9, v11, v12) & 0x80000000) != 0)
    NSLog(CFSTR("Error writing data for %@ to zip archive"), v7);
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke_2;
    block[3] = &unk_10610;
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v16 = v13;
    v17 = v14;
    v18 = *(_QWORD *)(a1 + 112);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __49__IMDebugDataManager_writeDebugDataWithProgress___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1[4];
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(_QWORD *)(v2 + 24) + 1;
  *(_QWORD *)(v2 + 24) = v3;
  return (*(uint64_t (**)(uint64_t, double))(v1 + 16))(v1, (double)(unint64_t)v3 / (double)(unint64_t)a1[6]);
}

@end
