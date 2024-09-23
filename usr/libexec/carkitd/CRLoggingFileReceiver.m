@implementation CRLoggingFileReceiver

- (CRLoggingFileReceiver)initWithSession:(id)a3
{
  id v5;
  CRLoggingFileReceiver *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  CARSessionChannel *v11;
  CARSessionChannel *channel;
  CRFileReceiver *v13;
  CRFileReceiver *fileReceiver;
  CRFileReceiver *v15;
  void *v16;
  CRLoggingFileReceiver *v17;
  uint8_t v19[16];
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLoggingFileReceiver;
  v6 = -[CRLoggingFileReceiver init](&v20, "init");
  if (v6)
  {
    v7 = (void *)os_transaction_create("com.apple.carkit.logArchiveReceiver");
    -[CRLoggingFileReceiver setTransaction:](v6, "setTransaction:", v7);

    v8 = sub_100056C84(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "opening logging file channel", v19, 2u);
    }

    objc_storeStrong((id *)&v6->_session, a3);
    v10 = objc_alloc((Class)CARSessionChannel);
    v11 = (CARSessionChannel *)objc_msgSend(v10, "initWithSession:channelType:", v5, kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayLoggingData);
    channel = v6->_channel;
    v6->_channel = v11;

    v13 = -[CRFileReceiver initWithChannel:]([CRFileReceiver alloc], "initWithChannel:", v6->_channel);
    fileReceiver = v6->_fileReceiver;
    v6->_fileReceiver = v13;

    v15 = v6->_fileReceiver;
    if (!v15)
    {
      v17 = 0;
      goto LABEL_8;
    }
    -[CRFileReceiver setLogArchiveReceiver:](v15, "setLogArchiveReceiver:", v6);
    -[CRFileReceiver setStatisticsReceiver:](v6->_fileReceiver, "setStatisticsReceiver:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLoggingFileReceiver fileReceiver](v6, "fileReceiver"));
    objc_msgSend(v16, "requestStartStatisticsOnInterval:", 10);

  }
  v17 = v6;
LABEL_8:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLoggingFileReceiver invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRLoggingFileReceiver;
  -[CRLoggingFileReceiver dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  id currentCompletion;
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLoggingFileReceiver currentCompletion](self, "currentCompletion"));
  if (v5)
  {
    v5[2](v5, 0);
    currentCompletion = self->_currentCompletion;
    self->_currentCompletion = 0;

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLoggingFileReceiver fileReceiver](self, "fileReceiver"));
  objc_msgSend(v4, "invalidate");

  -[CRLoggingFileReceiver setTransaction:](self, "setTransaction:", 0);
}

- (void)requestLogsWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = objc_claimAutoreleasedReturnValue(-[CRLoggingFileReceiver currentCompletion](self, "currentCompletion"));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  -[CRLoggingFileReceiver setCurrentCompletion:](self, "setCurrentCompletion:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLoggingFileReceiver fileReceiver](self, "fileReceiver"));
  objc_msgSend(v6, "requestLogArchive");

}

- (id)urlForSavingLogsForFileReceiverSession:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLsForDirectory:inDomains:", 5, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, &v10));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("VehicleLogs.tar.gz")));
  return v8;
}

- (void)fileReceiverSession:(id)a3 didSaveLogsAtURL:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  CRLoggingFileReceiver *v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038DB4;
  block[3] = &unk_1000B5390;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&location);
}

- (void)fileReceiver:(id)a3 didReceiveStatistics:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];

  v4 = a4;
  v5 = objc_opt_class(NSArray);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CommStats")));
  v7 = v6;
  if (v6 && (objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = sub_100056C84(5uLL);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v11);
    }
  }
  else
  {
    v17 = sub_100056C84(5uLL);
    v9 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006D0F4((uint64_t)v4, v9);
  }

}

- (CARSession)session
{
  return self->_session;
}

- (CARSessionChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (CRFileReceiver)fileReceiver
{
  return self->_fileReceiver;
}

- (void)setFileReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_fileReceiver, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (id)currentCompletion
{
  return self->_currentCompletion;
}

- (void)setCurrentCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentCompletion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_fileReceiver, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
