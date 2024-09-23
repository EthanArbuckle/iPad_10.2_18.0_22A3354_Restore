@implementation SDAirDropFakeTransfer

+ (id)sharedFakeTransfer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CBE44;
  block[3] = &unk_100715590;
  block[4] = a1;
  if (qword_1007C67D0 != -1)
    dispatch_once(&qword_1007C67D0, block);
  return (id)qword_1007C67C8;
}

- (SDAirDropFakeTransfer)init
{
  SDAirDropFakeTransfer *v2;
  uint64_t v3;
  NSBundle *bundle;
  void *v5;
  int v6;
  SDAirDropFakeTransfer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SDAirDropFakeTransfer;
  v2 = -[SDAirDropFakeTransfer init](&v9, "init");
  if (!v2)
    goto LABEL_5;
  v3 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/AppleInternal/Applications/SharingDemo.app")));
  bundle = v2->_bundle;
  v2->_bundle = (NSBundle *)v3;

  if (!v2->_bundle)
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((objc_msgSend(v5, "enableDebugMode") & 1) == 0)
  {

    goto LABEL_7;
  }
  v6 = IsAppleInternalBuild();

  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v7 = v2;
LABEL_8:

  return v7;
}

- (void)setDebugModeEnabled:(BOOL)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v13;
  uint8_t buf[4];
  __CFString *v15;

  if (self->_debugModeEnabled != a3)
  {
    self->_debugModeEnabled = a3;
    if (a3)
    {
      if (objc_msgSend(&off_10074FA90, "count"))
      {
        v4 = 0;
        do
        {
          if (v4 <= 8)
          {
            v5 = (uint64_t)objc_msgSend(off_100716EE8[v4], "count");
            if (v5 >= 1)
            {
              v6 = v5;
              for (i = 0; i != v6; ++i)
              {
                v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld.%ld"), v4, i));
                v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.sharingd.fake.transfer."), "stringByAppendingString:", v8));
                v10 = airdrop_log(v9);
                v11 = objc_claimAutoreleasedReturnValue(v10);
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v15 = v9;
                  _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "fakeTransfer notification observer %@", buf, 0xCu);
                }

                DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
                CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000CC118, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

              }
            }
          }
          ++v4;
        }
        while (v4 < (unint64_t)objc_msgSend(&off_10074FA90, "count"));
      }
    }
    else
    {
      v13 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveEveryObserver(v13, self);
    }
  }
}

- (void)startFakeTransferInCategory:(int64_t)a3 ofType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  int64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];

  v6 = (id)objc_claimAutoreleasedReturnValue(+[SDASharedItemsFactory sharedItemsInCategory:ofType:](SDASharedItemsFactory, "sharedItemsInCategory:ofType:"));
  v7 = v6;
  v29 = a3;
  if ((unint64_t)(a3 - 7) < 2)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16, a3);
    if (!v6)
      goto LABEL_25;
    v8 = v6;
    v9 = *(_QWORD *)v32;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uti"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer writeDataToFile:ofType:](self, "writeDataToFile:ofType:", v13, v14));

          goto LABEL_11;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer writeDataToFile:ofType:](self, "writeDataToFile:ofType:", v13, kUTTypePlainText));
LABEL_11:

          if (v15)
            goto LABEL_13;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
LABEL_13:
        objc_msgSend(v11, "setURL:", v15);

        objc_msgSend(v11, "setData:", 0);
        objc_msgSend(v11, "setUti:", 0);
        objc_msgSend(v11, "setString:", 0);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v8 = v6;
      if (!v6)
        goto LABEL_25;
    }
  }
  if (a3 == 2 && (unint64_t)(a4 - 3) <= 4)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v42, 16, a3);
    if (v6)
    {
      v18 = v6;
      v19 = *(_QWORD *)v36;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v7);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v20);
          v40[0] = CFSTR("SFAirDropActivitySubjectMain");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "subject"));
          v40[1] = CFSTR("SFAirDropActivitySubjectiTunesStoreLinkType");
          v41[0] = v22;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4 - 2));
          v41[1] = v23;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v24, 0, 0));
          v26 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v25, 4);
          objc_msgSend(v21, "setSubject:", v26);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        v18 = v6;
      }
      while (v6);
    }
  }
LABEL_25:
  if (v7)
  {
    -[SDAirDropFakeTransfer startFakeTransferWithItemSources:](self, "startFakeTransferWithItemSources:", v7);
  }
  else
  {
    v27 = airdrop_log(v6);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000CD94C(v29, a4, v28);

  }
}

- (void)startFakeTransferWithItemSources:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.fakeDuration")));
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.fakeBytes")));
  v9 = objc_msgSend(v8, "longLongValue");

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDASharedItemsFactory plainItemsFromItemSources:](SDASharedItemsFactory, "plainItemsFromItemSources:", v4));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fakeBundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "previewImage"));
  LODWORD(v14) = v7;
  -[SDAirDropFakeTransfer startFakeTransferWithItems:fromBundleID:withItemsDescription:previewImage:desiredDuration:totalBytes:](self, "startFakeTransferWithItems:fromBundleID:withItemsDescription:previewImage:desiredDuration:totalBytes:", v10, v11, v12, v13, v9, v14);

}

- (void)startFakeTransferWithItems:(id)a3 fromBundleID:(id)a4 withItemsDescription:(id)a5 previewImage:(id)a6 desiredDuration:(float)a7 totalBytes:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  double v56;
  void *v57;
  id v58;
  double v59;
  void *v60;
  void *v61;
  int64_t v62;
  int v63;
  int v64;
  double v65;
  void *v66;
  id v67;
  id v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  SDAirDropFakeTransfer *v78;
  unsigned int v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  id obj;
  os_log_t log;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  SDAirDropFakeTransfer *v92;
  NSObject *v93;
  id v94;
  int64_t v95;
  char v96;
  _QWORD v97[4];
  id v98;
  id v99;
  SDAirDropFakeTransfer *v100;
  id v101;
  uint64_t v102;
  int64_t v103;
  int v104;
  float v105;
  int v106;
  _QWORD v107[4];
  id v108;
  int64_t v109;
  _QWORD v110[4];
  id v111;
  id v112;
  SDAirDropFakeTransfer *v113;
  id v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  id v123;
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  id v127;
  _BYTE v128[128];
  NSFileAttributeKey v129;
  NSFileProtectionType v130;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v18 = objc_msgSend(v17, "isFileURL");

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));

  v21 = sub_10019BD30();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (v22)
  {
    v23 = v22;
    v79 = v18;
    v78 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.AirDrop"), 1));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URLByAppendingPathComponent:isDirectory:", v20, 1));
    v26 = objc_alloc((Class)NSProgress);
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sf_initWithFileURL:", v25));

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "URLByAppendingPathComponent:isDirectory:", CFSTR("Files"), 1));
    v129 = NSFileProtectionKey;
    v130 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    v28 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v123 = 0;
    log = (os_log_t)v27;
    v80 = (void *)v28;
    LODWORD(v27) = objc_msgSend(v29, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v27, 1, v28, &v123);
    v30 = v123;

    if (!(_DWORD)v27)
    {
      v49 = airdrop_log(v31);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        sub_1000CDA10((uint64_t)v30, v50);
      goto LABEL_31;
    }
    v73 = v13;
    v74 = v20;
    v76 = v15;
    v77 = v14;
    v75 = v16;
    if (v79)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      obj = v13;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
      if (v32)
      {
        v33 = v32;
        v82 = 0;
        v34 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(_QWORD *)v120 != v34)
              objc_enumerationMutation(obj);
            v36 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lastPathComponent"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URLByAppendingPathComponent:isDirectory:](log, "URLByAppendingPathComponent:isDirectory:", v37, 0));

            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v118 = v30;
            v40 = objc_msgSend(v39, "copyItemAtURL:toURL:error:", v36, v38, &v118);
            v41 = v118;

            if (v40)
            {
              objc_msgSend(v83, "addObject:", v38);
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "path"));
              v117 = v41;
              v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "attributesOfItemAtPath:error:", v44, &v117));
              v30 = v117;

              v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", NSFileSize));
              a8 += (int64_t)objc_msgSend(v46, "longLongValue");

            }
            else
            {
              v47 = airdrop_log(v42);
              v45 = objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v125 = v36;
                v126 = 2112;
                v127 = v41;
                _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "startFakeTransferWithItems copyItemAtURL %@ failed %@", buf, 0x16u);
              }
              v82 = 1;
              v30 = v41;
            }

          }
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
        }
        while (v33);
      }
      else
      {
        v82 = 0;
      }

      v50 = objc_msgSend(v83, "copy");
      if ((v82 & 1) != 0)
        goto LABEL_30;
      v51 = &__NSArray0__struct;
      v15 = v76;
      v14 = v77;
      v20 = v74;
      v16 = v75;
    }
    else
    {
      v50 = &__NSArray0__struct;
      v51 = v13;
    }
    v52 = objc_alloc_init((Class)NSOperationQueue);
    objc_msgSend(v52, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v52, "setSuspended:", 1);
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_1000CCEEC;
    v115[3] = &unk_1007146D8;
    v53 = v52;
    v116 = v53;
    objc_msgSend(v81, "setCancellationHandler:", v115);
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_1000CCEF4;
    v110[3] = &unk_100714990;
    v54 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer generateFakeTransferDataFromBundleID:files:items:itemsDescription:](v78, "generateFakeTransferDataFromBundleID:files:items:itemsDescription:", v14, v50, v51, v15));
    v111 = v54;
    v112 = v16;
    v113 = v78;
    v55 = v20;
    v114 = v55;
    LODWORD(v56) = 0;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer createBlockToPerformBlockOnMainQueue:withDelay:](v78, "createBlockToPerformBlockOnMainQueue:withDelay:", v110, v56));
    objc_msgSend(v53, "addOperationWithBlock:", v57);

    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_1000CCF6C;
    v107[3] = &unk_100716108;
    v58 = v81;
    v108 = v58;
    v109 = a8;
    LODWORD(v59) = 0;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer createBlockToPerformBlockOnMainQueue:withDelay:](v78, "createBlockToPerformBlockOnMainQueue:withDelay:", v107, v59));
    v61 = v53;
    objc_msgSend(v53, "addOperationWithBlock:", v60);

    v62 = a8;
    v63 = (int)(float)(a7 + a7);
    if (v63 >= 1)
    {
      v64 = 0;
      do
      {
        ++v64;
        v97[0] = _NSConcreteStackBlock;
        v97[1] = 3221225472;
        v97[2] = sub_1000CCFAC;
        v97[3] = &unk_100716E30;
        v102 = (uint64_t)(double)(a8 / v63);
        v104 = v64;
        v105 = a7;
        v106 = 1056964608;
        v98 = v58;
        v99 = v54;
        v100 = v78;
        v103 = v62;
        v101 = v55;
        LODWORD(v65) = 0.5;
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer createBlockToPerformBlockOnMainQueue:withDelay:](v78, "createBlockToPerformBlockOnMainQueue:withDelay:", v97, v65));
        objc_msgSend(v61, "addOperationWithBlock:", v66);

        v62 = a8;
      }
      while (v63 != v64);
    }
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_1000CD088;
    v89[3] = &unk_100716E58;
    v67 = v58;
    v90 = v67;
    v91 = v54;
    v95 = v62;
    v92 = v78;
    v96 = v79;
    v50 = v50;
    v93 = v50;
    v94 = v55;
    v68 = v54;
    LODWORD(v69) = 0.5;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer createBlockToPerformBlockOnMainQueue:withDelay:](v78, "createBlockToPerformBlockOnMainQueue:withDelay:", v89, v69));
    objc_msgSend(v61, "addOperationWithBlock:", v70);

    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_1000CD124;
    v87[3] = &unk_1007146D8;
    v88 = v67;
    LODWORD(v71) = 2.0;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFakeTransfer createBlockToPerformBlockOnMainQueue:withDelay:](v78, "createBlockToPerformBlockOnMainQueue:withDelay:", v87, v71));
    objc_msgSend(v61, "addOperationWithBlock:", v72);

    objc_msgSend(v61, "setSuspended:", 0);
LABEL_30:
    v13 = v73;
    v20 = v74;
    v15 = v76;
    v14 = v77;
    v16 = v75;
LABEL_31:

    goto LABEL_32;
  }
  v48 = airdrop_log(0);
  log = (os_log_t)objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    sub_1000CD9D0(log);
  v30 = 0;
LABEL_32:

}

- (id)writeDataToFile:(id)a3 ofType:(id)a4
{
  __CFString *v5;
  id v6;
  __CFString *v7;
  CFStringRef v8;
  __CFString *v9;
  CFStringRef v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (__CFString *)a4;
  v6 = a3;
  v7 = (__CFString *)UTTypeCopyPreferredTagWithClass(v5, kUTTagClassFilenameExtension);
  v8 = UTTypeCopyDescription(v5);
  v9 = (__CFString *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@.%@"), v10, v12, v7));

  v14 = NSTemporaryDirectory();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v13));
  objc_msgSend(v6, "writeToFile:atomically:", v16, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));
  return v17;
}

- (id)createBlockToPerformBlockOnMainQueue:(id)a3 withDelay:(float)a4
{
  id v4;
  _QWORD *v5;
  _QWORD v7[4];
  id v8;
  float v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CD2E4;
  v7[3] = &unk_100716EA8;
  v9 = a4;
  v8 = a3;
  v4 = v8;
  v5 = objc_retainBlock(v7);

  return v5;
}

- (id)generateFakeTransferDataFromBundleID:(id)a3 files:(id)a4 items:(id)a5 itemsDescription:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, kSFOperationBundleIDKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = SFGenerateFileInfoForURL(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v19));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend(v14, "addObject:", v21, (_QWORD)v25);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

  v22 = objc_msgSend(v14, "copy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, kSFOperationFilesKey);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, kSFOperationItemsKey);
  v23 = objc_msgSend(v12, "copy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, kSFOperationItemsDescriptionKey);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("John's iPhone"), kSFOperationSenderComputerNameKey);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("john_doe86@icloud.com"), kSFOperationSenderEmailKey);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("John"), kSFOperationSenderFirstNameKey);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("7g63429g1d7d"), kSFOperationSenderIDKey);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Doe"), kSFOperationSenderLastNameKey);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("John Doe"), kSFOperationSenderCompositeNameKey);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSFOperationVerifiableIdentityKey);

  return v13;
}

- (void)addIconPropertiesWithImage:(CGImage *)a3 toFakeTransferData:(id)a4
{
  objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, kSFOperationFileIconKey);
}

- (void)addProgressPropertiesWithBytesCopied:(int64_t)a3 totalBytes:(int64_t)a4 timeRemaining:(int64_t)a5 filesCopied:(int64_t)a6 toFakeTransferData:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v11 = a7;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("application/x-cpio"), CFSTR("Content-Type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kSFOperationBytesCopiedKey);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, kSFOperationTotalBytesKey);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, kSFOperationTimeRemainingKey);

  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, kSFOperationFilesCopiedKey);

}

- (void)replaceItemsWithItems:(id)a3 inFakeTransferData:(id)a4
{
  objc_msgSend(a4, "setObject:forKeyedSubscript:", a3, kSFOperationItemsKey);
}

- (SDAirDropAlertManagerProtocol)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
  objc_storeStrong((id *)&self->_transferManager, a3);
}

- (BOOL)debugModeEnabled
{
  return self->_debugModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferManager, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
