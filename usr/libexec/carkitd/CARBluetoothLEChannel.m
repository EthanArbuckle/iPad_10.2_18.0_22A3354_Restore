@implementation CARBluetoothLEChannel

- (CARBluetoothLEChannel)initWithService:(id)a3 channel:(id)a4
{
  id v6;
  id v7;
  CARBluetoothLEChannel *v8;
  CARBluetoothLEChannel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CARBluetoothLEChannel;
  v8 = -[CARBluetoothLEChannel init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_channel, a4);
    v9->_open = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputStream"));
    objc_msgSend(v10, "setDelegate:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputStream"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v11, "scheduleInRunLoop:forMode:", v12, NSDefaultRunLoopMode);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputStream"));
    objc_msgSend(v13, "open");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputStream"));
    objc_msgSend(v14, "setDelegate:", v9);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputStream"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v15, "scheduleInRunLoop:forMode:", v16, NSDefaultRunLoopMode);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputStream"));
    objc_msgSend(v17, "open");

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel channel](self, "channel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputStream"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v4, "removeFromRunLoop:forMode:", v5, NSDefaultRunLoopMode);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel channel](self, "channel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outputStream"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v7, "removeFromRunLoop:forMode:", v8, NSDefaultRunLoopMode);

  }
  v9.receiver = self;
  v9.super_class = (Class)CARBluetoothLEChannel;
  -[CARBluetoothLEChannel dealloc](&v9, "dealloc");
}

- (void)sendData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CE34;
  v8[3] = &unk_1000B5390;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_handleChannelOpened
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D08C;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleHasBytesAvailableOnStream:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARBluetoothLEChannel *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D310;
  v8[3] = &unk_1000B5390;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_handleErrorOnStream:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARBluetoothLEChannel *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D57C;
  v8[3] = &unk_1000B5390;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_handleEndedStream:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CARBluetoothLEChannel *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D728;
  v8[3] = &unk_1000B5390;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_serviceQueue_handleChannelClosed
{
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint8_t v15[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queue"));
  dispatch_assert_queue_V2(v4);

  if (-[CARBluetoothLEChannel isOpen](self, "isOpen"))
  {
    v5 = sub_100056C84(2uLL);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "L2CAP channel closed", v15, 2u);
    }

    -[CARBluetoothLEChannel setOpen:](self, "setOpen:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceDelegate"));

    if (v8 && (objc_opt_respondsToSelector(v8, "bluetoothLEService:didCloseChannel:") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
      objc_msgSend(v8, "bluetoothLEService:didCloseChannel:", v9, self);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentConnectionState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceChannel"));
    v13 = -[CARBluetoothLEChannel isEqual:](self, "isEqual:", v12);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARBluetoothLEChannel service](self, "service"));
      objc_msgSend(v14, "setCurrentConnectionState:", 0);

    }
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  unint64_t v12;

  v6 = a3;
  v7 = sub_100056C84(2uLL);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stream: %@ handleEvent: %lu", (uint8_t *)&v9, 0x16u);
  }

  if ((uint64_t)a4 > 7)
  {
    if (a4 == 8)
    {
      -[CARBluetoothLEChannel _handleErrorOnStream:](self, "_handleErrorOnStream:", v6);
    }
    else if (a4 == 16)
    {
      -[CARBluetoothLEChannel _handleEndedStream:](self, "_handleEndedStream:", v6);
    }
  }
  else if (a4 == 1)
  {
    -[CARBluetoothLEChannel _handleChannelOpened](self, "_handleChannelOpened");
  }
  else if (a4 == 2)
  {
    -[CARBluetoothLEChannel _handleHasBytesAvailableOnStream:](self, "_handleHasBytesAvailableOnStream:", v6);
  }

}

- (CARBluetoothLEChannelDelegate)channelDelegate
{
  return (CARBluetoothLEChannelDelegate *)objc_loadWeakRetained((id *)&self->_channelDelegate);
}

- (void)setChannelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_channelDelegate, a3);
}

- (CARBluetoothLEService)service
{
  return (CARBluetoothLEService *)objc_loadWeakRetained((id *)&self->_service);
}

- (CBL2CAPChannel)channel
{
  return self->_channel;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_channelDelegate);
}

@end
