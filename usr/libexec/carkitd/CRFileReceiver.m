@implementation CRFileReceiver

- (CRFileReceiver)initWithChannel:(id)a3
{
  id v5;
  CRFileReceiver *v6;
  CRFileReceiver *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *fileQueue;
  CRFileReceiver *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *themeWritersForSessionIDs;
  NSMutableDictionary *v15;
  NSMutableDictionary *logArchiveWritersForSessionIDs;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRFileReceiver;
  v6 = -[CRFileReceiver init](&v18, "init");
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_channel, a3);
  v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = dispatch_queue_create("com.apple.carkit.file_receiving", v9);
  fileQueue = v7->_fileQueue;
  v7->_fileQueue = (OS_dispatch_queue *)v10;

  objc_msgSend(v5, "setChannelDelegate:", v7);
  v12 = 0;
  if (objc_msgSend(v5, "openChannel"))
  {
    v7->_channelIsOpen = 1;
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    themeWritersForSessionIDs = v7->_themeWritersForSessionIDs;
    v7->_themeWritersForSessionIDs = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    logArchiveWritersForSessionIDs = v7->_logArchiveWritersForSessionIDs;
    v7->_logArchiveWritersForSessionIDs = v15;

LABEL_4:
    v12 = v7;
  }

  return v12;
}

- (void)requestLogArchive
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062DDC;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)requestStartStatisticsOnInterval:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100063008;
  v6[3] = &unk_1000B6370;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006325C;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CRFileReceiver *v10;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100063368;
  v8[3] = &unk_1000B5390;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)didCloseChannel:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000635E4;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_fileQueue_handleFileHeaderMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_class(NSNumber);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("payloadType")));
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v10 = objc_opt_class(NSString);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sessionID")));
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v13)
    {
      v14 = objc_opt_class(NSNumber);
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("chunkCount")));
      v16 = v15;
      if (v15 && (objc_opt_isKindOfClass(v15, v14) & 1) != 0)
        v17 = v16;
      else
        v17 = 0;

      if (v17)
      {
        v19 = objc_msgSend(v9, "unsignedIntegerValue");
        if (v19 == (id)2)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveReceiver](self, "logArchiveReceiver"));

          if (v24)
            -[CRFileReceiver _fileQueue_setupLogArchiveWriterForSessionID:chunkCount:message:](self, "_fileQueue_setupLogArchiveWriterForSessionID:chunkCount:message:", v13, v17, v4);
        }
        else if (v19 == (id)1)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeAssetReceiver](self, "themeAssetReceiver"));

          if (v20)
            -[CRFileReceiver _fileQueue_setupThemeWriterForSessionID:chunkCount:message:](self, "_fileQueue_setupThemeWriterForSessionID:chunkCount:message:", v13, v17, v4);
        }
      }
      else
      {
        v22 = sub_100056C84(4uLL);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_10006F908();

      }
    }
    else
    {
      v21 = sub_100056C84(4uLL);
      v17 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10006F8A8();
    }

  }
  else
  {
    v18 = sub_100056C84(4uLL);
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006F848();
  }

}

- (void)_fileQueue_handleFilePayloadMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  CRFileReceiver *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  CRFileReceiver *v41;
  uint64_t v42;
  uint8_t v43[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_class(NSString);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sessionID")));
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v10 = objc_opt_class(NSData);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("data")));
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v14 = objc_opt_class(NSNumber);
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("chunkIndex")));
    v16 = v15;
    if (v15 && (objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    if (!v13 || !v17)
    {
      v32 = sub_100056C84(4uLL);
      v20 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10006F968();
      goto LABEL_43;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeAssetReceiver](self, "themeAssetReceiver"));

    if (!v18
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeWritersForSessionIDs](self, "themeWritersForSessionIDs")),
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v9)),
          v19,
          !v20))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveReceiver](self, "logArchiveReceiver"));

      if (!v33)
        goto LABEL_44;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveWritersForSessionIDs](self, "logArchiveWritersForSessionIDs"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", v9));

      if (!v20)
        goto LABEL_44;
      if (-[NSObject saveData:forIndex:](v20, "saveData:forIndex:", v13, v17))
      {
        if (!-[NSObject hasAllChunks](v20, "hasAllChunks"))
        {
LABEL_43:

LABEL_44:
          goto LABEL_45;
        }
        v35 = sub_100056C84(4uLL);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "saved all log archive chunks!", v43, 2u);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveReceiver](self, "logArchiveReceiver"));
        v38 = objc_opt_respondsToSelector(v37, "fileReceiverSession:didSaveLogsAtURL:");

        if ((v38 & 1) != 0)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveReceiver](self, "logArchiveReceiver"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fileURL](v20, "fileURL"));
          objc_msgSend(v39, "fileReceiverSession:didSaveLogsAtURL:", self, v40);

        }
        v41 = self;
        v42 = 0;
      }
      else
      {
        v41 = self;
        v42 = 5;
      }
      -[CRFileReceiver _fileQueue_sendFileAcceptMessageWithStatus:](v41, "_fileQueue_sendFileAcceptMessageWithStatus:", v42);
      goto LABEL_43;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetArchiveWriter](v20, "assetArchiveWriter"));
    if (objc_msgSend(v21, "saveData:forIndex:", v13, v17))
    {
      if (!objc_msgSend(v21, "hasAllChunks"))
      {
LABEL_40:

        goto LABEL_43;
      }
      v22 = sub_100056C84(4uLL);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "saved all theme asset chunks!", buf, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeAssetReceiver](self, "themeAssetReceiver"));
      v25 = objc_opt_respondsToSelector(v24, "fileReceiver:didSaveThemeAssetOfVersion:atURL:");

      if ((v25 & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeAssetReceiver](self, "themeAssetReceiver"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject version](v20, "version"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetURL](v20, "assetURL"));
        objc_msgSend(v26, "fileReceiver:didSaveThemeAssetOfVersion:atURL:", self, v27, v28);

      }
      v29 = self;
      v30 = 0;
    }
    else
    {
      v29 = self;
      v30 = 5;
    }
    -[CRFileReceiver _fileQueue_sendFileAcceptMessageWithStatus:](v29, "_fileQueue_sendFileAcceptMessageWithStatus:", v30);
    goto LABEL_40;
  }
  v31 = sub_100056C84(4uLL);
  v13 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_10006F8A8();
LABEL_45:

}

- (void)_fileQueue_handleStreamPayloadMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_class(NSNumber);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("payloadType")));
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    if (objc_msgSend(v9, "unsignedIntegerValue") == (id)3)
    {
      v10 = objc_opt_class(NSDictionary);
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("data")));
      v12 = v11;
      if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
        v13 = v12;
      else
        v13 = 0;

      if (v13)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver statisticsReceiver](self, "statisticsReceiver"));
        v17 = objc_opt_respondsToSelector(v16, "fileReceiver:didReceiveStatistics:");

        if ((v17 & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver statisticsReceiver](self, "statisticsReceiver"));
          objc_msgSend(v18, "fileReceiver:didReceiveStatistics:", self, v13);

        }
      }
      else
      {
        v19 = sub_100056C84(4uLL);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_10006FA28();

      }
    }
    else
    {
      v15 = sub_100056C84(4uLL);
      v13 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006FA88();
    }
  }
  else
  {
    v14 = sub_100056C84(4uLL);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006F9C8();
  }

}

- (void)_fileQueue_setupThemeWriterForSessionID:(id)a3 chunkCount:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  CRThemeAssetDataWriter *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  int v44;
  id v45;
  __int16 v46;
  NSObject *v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = objc_opt_class(NSNumber);
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("version")));
  v14 = v13;
  if (v13 && (objc_opt_isKindOfClass(v13, v12) & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeAssetReceiver](self, "themeAssetReceiver"));
    v17 = objc_opt_respondsToSelector(v16, "fileReceiver:urlForSavingThemeAssetOfVersion:");

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeAssetReceiver](self, "themeAssetReceiver"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fileReceiver:urlForSavingThemeAssetOfVersion:", self, v15));

      if (v19)
      {
        v20 = -[CRThemeAssetDataWriter initWithAssetURL:version:chunkCount:]([CRThemeAssetDataWriter alloc], "initWithAssetURL:version:chunkCount:", v19, v15, v9);
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver themeWritersForSessionIDs](self, "themeWritersForSessionIDs"));
          objc_msgSend(v21, "setObject:forKey:", v20, v8);

          v22 = sub_100056C84(4uLL);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v44 = 138412546;
            v45 = v15;
            v46 = 2112;
            v47 = v19;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "ready to receive theme asset version %@ to %@", (uint8_t *)&v44, 0x16u);
          }

          v24 = objc_opt_class(NSData);
          v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("certificate")));
          v26 = v25;
          if (v25 && (objc_opt_isKindOfClass(v25, v24) & 1) != 0)
            v27 = v26;
          else
            v27 = 0;

          v31 = objc_opt_class(NSData);
          v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("signature")));
          v33 = v32;
          if (v32 && (objc_opt_isKindOfClass(v32, v31) & 1) != 0)
            v34 = v33;
          else
            v34 = 0;

          if (v27 && v34)
          {
            v35 = sub_100056C84(4uLL);
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "code signing data is present in file transfer", (uint8_t *)&v44, 2u);
            }

            -[CRThemeAssetDataWriter saveCertificateData:signatureData:](v20, "saveCertificateData:signatureData:", v27, v34);
          }
          v37 = objc_opt_class(NSData);
          v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("additions")));
          v39 = v38;
          if (v38 && (objc_opt_isKindOfClass(v38, v37) & 1) != 0)
            v40 = v39;
          else
            v40 = 0;

          if (v40)
          {
            v41 = sub_100056C84(4uLL);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "accessory additions data are present in file transfer", (uint8_t *)&v44, 2u);
            }

            -[CRThemeAssetDataWriter saveAdditionsData:](v20, "saveAdditionsData:", v40);
          }

        }
        else
        {
          v43 = sub_100056C84(4uLL);
          v27 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_10006FB40();
        }

      }
      else
      {
        v30 = sub_100056C84(4uLL);
        v20 = (CRThemeAssetDataWriter *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_ERROR))
          sub_10006FB14();
      }

    }
    else
    {
      v29 = sub_100056C84(4uLL);
      v19 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10006FBA0();
    }
  }
  else
  {
    v28 = sub_100056C84(4uLL);
    v19 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10006FAE8();
  }

}

- (void)_fileQueue_setupLogArchiveWriterForSessionID:(id)a3 chunkCount:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  CRFileTransferDataWriter *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  int v20;
  NSObject *v21;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveReceiver](self, "logArchiveReceiver"));
  v11 = objc_opt_respondsToSelector(v10, "urlForSavingLogsForFileReceiverSession:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveReceiver](self, "logArchiveReceiver"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "urlForSavingLogsForFileReceiverSession:", self));

    if (v13)
    {
      v14 = -[CRFileTransferDataWriter initWithFileURL:chunkCount:]([CRFileTransferDataWriter alloc], "initWithFileURL:chunkCount:", v13, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver logArchiveWritersForSessionIDs](self, "logArchiveWritersForSessionIDs"));
      objc_msgSend(v15, "setObject:forKey:", v14, v7);

      v16 = sub_100056C84(4uLL);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "ready to receive log archive to %@", (uint8_t *)&v20, 0xCu);
      }

    }
    else
    {
      v19 = sub_100056C84(4uLL);
      v14 = (CRFileTransferDataWriter *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
        sub_10006FBCC();
    }

  }
  else
  {
    v18 = sub_100056C84(4uLL);
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006FBF8();
  }

}

- (void)_fileQueue_sendFileAcceptMessageWithStatus:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  uint8_t buf[4];
  int v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v3 = *(_QWORD *)&a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRFileReceiver fileQueue](self, "fileQueue"));
  dispatch_assert_queue_V2(v5);

  v19[0] = CFSTR("messageType");
  v19[1] = CFSTR("accepted");
  v20[0] = &off_1000BE860;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v20[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

  v16 = 0;
  v8 = (void *)OPACKEncoderCreateData(v7, 0, &v16);
  if (v8)
  {
    if (-[CRFileReceiver channelIsOpen](self, "channelIsOpen"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileReceiver channel](self, "channel"));
      v10 = objc_msgSend(v9, "sendChannelMessage:", v8);

      v11 = sub_100056C84(4uLL);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if ((v10 & 1) != 0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v18 = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sent file accept message with status: %i", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_10006F6B8();
      }
    }
    else
    {
      v15 = sub_100056C84(4uLL);
      v13 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006FC88();
    }
  }
  else
  {
    v14 = sub_100056C84(4uLL);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006FC24();
  }

}

- (CRThemeAssetReceiving)themeAssetReceiver
{
  return (CRThemeAssetReceiving *)objc_loadWeakRetained((id *)&self->_themeAssetReceiver);
}

- (void)setThemeAssetReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_themeAssetReceiver, a3);
}

- (CRLogArchiveReceiving)logArchiveReceiver
{
  return (CRLogArchiveReceiving *)objc_loadWeakRetained((id *)&self->_logArchiveReceiver);
}

- (void)setLogArchiveReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_logArchiveReceiver, a3);
}

- (CRStatisticsStreamReceiving)statisticsReceiver
{
  return (CRStatisticsStreamReceiving *)objc_loadWeakRetained((id *)&self->_statisticsReceiver);
}

- (void)setStatisticsReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_statisticsReceiver, a3);
}

- (CARSessionChannelProviding)channel
{
  return self->_channel;
}

- (BOOL)channelIsOpen
{
  return self->_channelIsOpen;
}

- (void)setChannelIsOpen:(BOOL)a3
{
  self->_channelIsOpen = a3;
}

- (OS_dispatch_queue)fileQueue
{
  return self->_fileQueue;
}

- (NSMutableDictionary)themeWritersForSessionIDs
{
  return self->_themeWritersForSessionIDs;
}

- (NSMutableDictionary)logArchiveWritersForSessionIDs
{
  return self->_logArchiveWritersForSessionIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logArchiveWritersForSessionIDs, 0);
  objc_storeStrong((id *)&self->_themeWritersForSessionIDs, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_destroyWeak((id *)&self->_statisticsReceiver);
  objc_destroyWeak((id *)&self->_logArchiveReceiver);
  objc_destroyWeak((id *)&self->_themeAssetReceiver);
}

@end
