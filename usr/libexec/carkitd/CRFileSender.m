@implementation CRFileSender

- (CRFileSender)initWithChannel:(id)a3 isPriority:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CRFileSender *v8;
  CRFileSender *v9;
  dispatch_qos_class_t v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *chunkQueue;
  dispatch_semaphore_t v23;
  OS_dispatch_semaphore *chunkQueueSendSlots;
  objc_super v26;

  v4 = a4;
  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CRFileSender;
  v8 = -[CRFileSender init](&v26, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channel, a3);
    v9->_priority = v4;
    if (v4)
      v10 = QOS_CLASS_USER_INITIATED;
    else
      v10 = QOS_CLASS_BACKGROUND;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, v10, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.carkit.file_sending", v14);
    internalQueue = v9->_internalQueue;
    v9->_internalQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, v10, 0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.carkit.file_sending_chunk", v20);
    chunkQueue = v9->_chunkQueue;
    v9->_chunkQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_semaphore_create(0);
    chunkQueueSendSlots = v9->_chunkQueueSendSlots;
    v9->_chunkQueueSendSlots = (OS_dispatch_semaphore *)v23;

    v9->_internalQueueOutstandingSendCount = 0;
    objc_msgSend(v7, "setChannelDelegate:", v9);
    objc_msgSend(v7, "openChannel");
    v9->_channelIsOpen = 1;
  }

  return v9;
}

- (void)invalidate
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = sub_100056C84(4uLL);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100069A7C();

  v5 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000159DC;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (id)sendThemeAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetsArchiveURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signatureData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryAdditionsData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "version"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessoryContentVersion"));
  if (v8 && v13)
  {
    v25[0] = CFSTR("payloadType");
    v25[1] = CFSTR("version");
    v26[0] = &off_1000BE008;
    v26[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v15 = objc_msgSend(v14, "mutableCopy");

    if (v10)
      objc_msgSend(v15, "setObject:forKey:", v10, CFSTR("certificate"));
    if (v9)
      objc_msgSend(v15, "setObject:forKey:", v9, CFSTR("signature"));
    if (v11)
      objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("additions"));
    v16 = sub_100056C84(4uLL);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "starting file transfer for cluster theme version %@", buf, 0xCu);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100015CF4;
    v20[3] = &unk_1000B55D8;
    v20[4] = self;
    v21 = v13;
    v22 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileSender _sendFileURL:withMetadata:completion:](self, "_sendFileURL:withMetadata:completion:", v8, v15, v20));

  }
  else
  {
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v18 = 0;
  }

  return v18;
}

- (id)sendLogArchive:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  const __CFString *v20;
  _UNKNOWN **v21;

  v6 = a3;
  v7 = a4;
  v20 = CFSTR("payloadType");
  v21 = &off_1000BE020;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v9 = sub_100056C84(4uLL);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "starting file transfer for log archive %@", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100015F78;
  v15[3] = &unk_1000B55D8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileSender _sendFileURL:withMetadata:completion:](self, "_sendFileURL:withMetadata:completion:", v12, v8, v15));

  return v13;
}

- (unint64_t)_internalQueue_chunkSizeForTransferWithPriority:(BOOL)a3
{
  _BOOL4 v3;
  CFIndex AppIntegerValue;
  uint64_t v5;
  unint64_t v7;
  id v8;
  NSObject *v9;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  unint64_t v13;

  v3 = a3;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("TransferChunkSize"), CFSTR("com.apple.carplay.internal"), &keyExistsAndHasValidFormat);
  v5 = 102400;
  if (v3)
    v5 = 204800;
  if (AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0)
    v7 = v5;
  else
    v7 = AppIntegerValue;
  v8 = sub_100056C84(4uLL);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "using chunk size of %lu", buf, 0xCu);
  }

  return v7;
}

- (id)_sendFileURL:(id)a3 withMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  CRFileSender *v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
  objc_msgSend(v11, "setTotalUnitCount:", 2);
  objc_msgSend(v11, "setCompletedUnitCount:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000162B4;
  v21[3] = &unk_1000B56C8;
  v22 = v8;
  v27 = v10;
  v13 = v11;
  v23 = v13;
  v24 = self;
  v25 = v12;
  v26 = v9;
  v14 = v9;
  v15 = v12;
  v16 = v10;
  v17 = v8;
  dispatch_async(v15, v21);
  v18 = v26;
  v19 = v13;

  return v19;
}

- (BOOL)_chunkQueue_blockingSendChannelMessage:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char v16;
  _QWORD v18[5];
  uint8_t buf[16];
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRFileSender chunkQueue](self, "chunkQueue"));
  dispatch_assert_queue_V2(v5);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017654;
  block[3] = &unk_1000B56F0;
  block[4] = self;
  v22 = &v28;
  v7 = v4;
  v21 = v7;
  v23 = &v24;
  dispatch_sync(v6, block);

  if (*((_BYTE *)v25 + 24))
  {
    v8 = sub_100056C84(4uLL);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "waiting on chunk to send", buf, 2u);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[CRFileSender chunkQueueSendSlots](self, "chunkQueueSendSlots"));
    v11 = dispatch_time(0, 60000000000);
    v12 = dispatch_semaphore_wait(v10, v11);

    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100017754;
      v18[3] = &unk_1000B51B8;
      v18[4] = self;
      dispatch_sync(v13, v18);

      v14 = sub_100056C84(4uLL);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100069CFC();

      *((_BYTE *)v29 + 24) = 0;
    }
  }
  v16 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

- (void)_internalQueue_signalChunkQueue
{
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[CRFileSender internalQueueOutstandingSendCount](self, "internalQueueOutstandingSendCount");
  if (-[CRFileSender internalQueueOutstandingSendCount](self, "internalQueueOutstandingSendCount"))
    -[CRFileSender setInternalQueueOutstandingSendCount:](self, "setInternalQueueOutstandingSendCount:", (char *)-[CRFileSender internalQueueOutstandingSendCount](self, "internalQueueOutstandingSendCount") - 1);
  if (v4 >= 3)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CRFileSender chunkQueueSendSlots](self, "chunkQueueSendSlots"));
    dispatch_semaphore_signal(v5);

  }
}

- (void)_internalQueue_handleFileAcceptMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_class(NSNumber);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("accepted")));
  v8 = v7;
  if (v7 && (objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    v11 = sub_100056C84(4uLL);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100069DE4((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "file transfer was accepted", v29, 2u);
    }

    v28 = objc_claimAutoreleasedReturnValue(-[CRFileSender currentAcceptCompletion](self, "currentAcceptCompletion"));
    v21 = v28;
    if (v28)
      (*(void (**)(uint64_t, BOOL))(v28 + 16))(v28, v10 == 0);
  }
  else
  {
    v20 = sub_100056C84(4uLL);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100069D80((uint64_t)v4, v21, v22, v23, v24, v25, v26, v27);
  }

}

- (void)didSendMessageForChannel:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017A08;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CRFileSender *v12;

  v5 = a4;
  v6 = sub_100056C84(4uLL);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100069E74((uint64_t)v5, v7);

  v8 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100017B20;
  v10[3] = &unk_1000B5390;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_async(v8, v10);

}

- (void)didCloseChannel:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[CRFileSender internalQueue](self, "internalQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017DCC;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (CARSessionChannelProviding)channel
{
  return self->_channel;
}

- (BOOL)isPriority
{
  return self->_priority;
}

- (void)setPriority:(BOOL)a3
{
  self->_priority = a3;
}

- (BOOL)channelIsOpen
{
  return self->_channelIsOpen;
}

- (void)setChannelIsOpen:(BOOL)a3
{
  self->_channelIsOpen = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)chunkQueue
{
  return self->_chunkQueue;
}

- (OS_dispatch_semaphore)chunkQueueSendSlots
{
  return self->_chunkQueueSendSlots;
}

- (unint64_t)internalQueueOutstandingSendCount
{
  return self->_internalQueueOutstandingSendCount;
}

- (void)setInternalQueueOutstandingSendCount:(unint64_t)a3
{
  self->_internalQueueOutstandingSendCount = a3;
}

- (id)currentAcceptCompletion
{
  return self->_currentAcceptCompletion;
}

- (void)setCurrentAcceptCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentAcceptCompletion, 0);
  objc_storeStrong((id *)&self->_chunkQueueSendSlots, 0);
  objc_storeStrong((id *)&self->_chunkQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
