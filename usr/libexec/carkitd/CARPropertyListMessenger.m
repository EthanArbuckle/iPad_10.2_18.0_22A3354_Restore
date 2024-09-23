@implementation CARPropertyListMessenger

- (CARPropertyListMessenger)init
{
  CARPropertyListMessenger *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *receiveQueue;
  uint64_t v7;
  NSMutableData *receiveBuffer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CARPropertyListMessenger;
  v2 = -[CARPropertyListMessenger init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.carkit.plist_messenger_receive", v4);
    receiveQueue = v2->_receiveQueue;
    v2->_receiveQueue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    receiveBuffer = v2->_receiveBuffer;
    v2->_receiveBuffer = (NSMutableData *)v7;

  }
  return v2;
}

- (id)dataForMessageWithIdentifier:(unsigned __int16)a3 contents:(id)a4 error:(id *)a5
{
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  unsigned int v19;
  __int16 v20;
  int v21;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v8 = (void *)OPACKEncoderCreateData(v7, 0, &v21);
  v9 = v8;
  if (!v8)
  {
    v14 = sub_100056C84(2uLL);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10006F2E4(&v21, (uint64_t)v7, v15);

    v13 = v21;
    if (v21)
    {
      v12 = (const __CFString *)NSOSStatusErrorDomain;
      goto LABEL_11;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)objc_msgSend(v8, "length") <= 0x100000)
  {
    v17 = objc_msgSend(v9, "length");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v20 = __rev16(v6);
    objc_msgSend(v16, "appendBytes:length:", &v20, 2);
    v19 = bswap32(v17);
    objc_msgSend(v16, "appendBytes:length:", &v19, 4);
    objc_msgSend(v16, "appendData:", v9);
    goto LABEL_14;
  }
  v10 = sub_100056C84(2uLL);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10006F358();

  if (!a5)
    goto LABEL_13;
  v12 = CFSTR("com.apple.carkit");
  v13 = 4;
LABEL_11:
  v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v12, v13, 0));
LABEL_14:

  return v16;
}

- (void)handleReceivedData:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CARPropertyListMessenger receiveQueue](self, "receiveQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100060E40;
    v6[3] = &unk_1000B5390;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (CARPropertyListMessageReceiving)messageReceiver
{
  return (CARPropertyListMessageReceiving *)objc_loadWeakRetained((id *)&self->_messageReceiver);
}

- (void)setMessageReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_messageReceiver, a3);
}

- (OS_dispatch_queue)receiveQueue
{
  return self->_receiveQueue;
}

- (NSMutableData)receiveBuffer
{
  return self->_receiveBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveBuffer, 0);
  objc_storeStrong((id *)&self->_receiveQueue, 0);
  objc_destroyWeak((id *)&self->_messageReceiver);
}

@end
