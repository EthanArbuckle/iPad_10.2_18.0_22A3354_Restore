@implementation CarDataChannel

- (CarDataChannel)initWithChannel:(id)a3 priority:(unint64_t)a4
{
  id v7;
  CarDataChannel *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *outputQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *inputQueue;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CarDataChannel;
  v8 = -[CarDataChannel init](&v18, "init");
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    v13 = dispatch_queue_create("com.apple.caraccessoryd.CarDataChannel.Output", v12);
    outputQueue = v8->_outputQueue;
    v8->_outputQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.caraccessoryd.CarDataChannel.Input", v12);
    inputQueue = v8->_inputQueue;
    v8->_inputQueue = (OS_dispatch_queue *)v15;

    v8->_isOpened = 0;
    v8->_priority = a4;
    objc_storeStrong((id *)&v8->_channel, a3);
    -[CARSessionChannelProviding setChannelDelegate:](v8->_channel, "setChannelDelegate:", v8);

  }
  return v8;
}

- (BOOL)isOpened
{
  unsigned int v3;

  v3 = -[CARSessionChannelProviding isOpened](self->_channel, "isOpened");
  if (v3)
    LOBYTE(v3) = self->_isOpened;
  return v3;
}

- (void)sendToPluginID:(id)a3 payload:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  CarDataChannel *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CarDataChannel outputQueue](self, "outputQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke;
  v15[3] = &unk_100030F50;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v19[0] = kCarDataProtocolKeyPluginID;
  v19[1] = kCarDataProtocolKeyPluginData;
  v2 = *(_QWORD *)(a1 + 40);
  v20[0] = *(_QWORD *)(a1 + 32);
  v20[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData CAF_encodeCarDataFrom:error:](NSData, "CAF_encodeCarDataFrom:error:", v3, &v18));
  v5 = v18;
  if (v5)
  {
    v6 = v5;
    v7 = CAFDChannelLogging();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "channel"));
    v16 = objc_msgSend(v15, "sendChannelMessage:", v4);

    if ((v16 & 1) != 0)
      v6 = 0;
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 4, 0));
  }
  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v6);

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[CarDataChannel priority](self, "priority");
  if (-[CarDataChannel isOpened](self, "isOpened"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataChannel channel](self, "channel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarDataChannel channel](self, "channel"));
  if (objc_msgSend(v9, "isOpened"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p priority=%lu isOpened=%@ channel=%p channel.isOpened=%@>"), v5, self, v6, v7, v8, v10));

  return (NSString *)v11;
}

- (void)invalidate
{
  -[CarDataChannel _stopConnection](self, "_stopConnection");
  -[CarDataChannel setChannel:](self, "setChannel:", 0);
}

- (void)_startConnection
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[CarDataChannel inputQueue](self, "inputQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__CarDataChannel__startConnection__block_invoke;
  block[3] = &unk_100030DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__CarDataChannel__startConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v2 = ((uint64_t (*)(void))CAFDChannelLogging)();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __34__CarDataChannel__startConnection__block_invoke_cold_3();

  v5 = *(void **)(a1 + 32);
  v4 = (id *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "channel"));
  v7 = objc_msgSend(v6, "openChannel");

  if (v7)
  {
    v8 = CAFDChannelLogging(objc_msgSend(*v4, "setIsOpened:", 1));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __34__CarDataChannel__startConnection__block_invoke_cold_1();

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "channelDelegate"));
    objc_msgSend(v10, "carDataChannelDidOpen:", *v4);

  }
  else
  {
    v11 = ((uint64_t (*)(void))CAFDChannelLogging)();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __34__CarDataChannel__startConnection__block_invoke_cold_2();

    objc_initWeak(&location, *v4);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = __34__CarDataChannel__startConnection__block_invoke_28;
    v17 = &unk_100030F78;
    objc_copyWeak(&v18, &location);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v14, 1.0));
    objc_msgSend(*v4, "setReconnectTimer:", v13, v14, v15, v16, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __34__CarDataChannel__startConnection__block_invoke_28(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startConnection");

}

- (void)_stopConnection
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Stopping channel %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

id __33__CarDataChannel__stopConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = CAFDChannelLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __33__CarDataChannel__stopConnection__block_invoke_cold_1();

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  objc_msgSend(v4, "setChannelDelegate:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  objc_msgSend(v5, "closeChannel");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reconnectTimer"));
  objc_msgSend(v6, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setReconnectTimer:", 0);
}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CarDataChannel *v10;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CarDataChannel inputQueue](self, "inputQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __44__CarDataChannel_channel_didReceiveMessage___block_invoke;
  v8[3] = &unk_100030CE8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __44__CarDataChannel_channel_didReceiveMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;

  v2 = objc_opt_class(NSDictionary);
  v3 = *(void **)(a1 + 32);
  v22 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CAF_decodeCarData:", &v22));
  v5 = v22;
  v6 = v4;
  v7 = v6;
  if (v6 && (objc_opt_isKindOfClass(v6, v2) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v5 || !v8)
  {
    v14 = CAFDChannelLogging(v9);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_2();
  }
  else
  {
    v10 = objc_opt_class(NSNumber);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kCarDataProtocolKeyPluginID));
    v12 = v11;
    if (v11 && (objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v15 = objc_opt_class(NSData);
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kCarDataProtocolKeyPluginData));
    v17 = v16;
    if (v16 && (objc_opt_isKindOfClass(v16, v15) & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (v13 && v18)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "channelDelegate"));
      -[NSObject carDataChannelDidReceive:pluginID:payload:](v20, "carDataChannelDidReceive:pluginID:payload:", *(_QWORD *)(a1 + 40), v13, v18);
    }
    else
    {
      v21 = CAFDChannelLogging(v19);
      v20 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_1();
    }

  }
}

- (void)didCloseChannel:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];

  v4 = CAFDChannelLogging(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CarDataChannel didCloseChannel:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

  -[CarDataChannel setIsOpened:](self, "setIsOpened:", 0);
  v12 = objc_claimAutoreleasedReturnValue(-[CarDataChannel inputQueue](self, "inputQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__CarDataChannel_didCloseChannel___block_invoke;
  block[3] = &unk_100030DF0;
  block[4] = self;
  dispatch_async(v12, block);

}

void __34__CarDataChannel_didCloseChannel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = CAFDChannelLogging(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __34__CarDataChannel_didCloseChannel___block_invoke_cold_1();

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channel"));
  objc_msgSend(v4, "setChannelDelegate:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reconnectTimer"));
  objc_msgSend(v5, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setReconnectTimer:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "channelDelegate"));
  objc_msgSend(v6, "carDataChannelDidClose:", *(_QWORD *)(a1 + 32));

}

- (CarDataChannelDelegate)channelDelegate
{
  return (CarDataChannelDelegate *)objc_loadWeakRetained((id *)&self->_channelDelegate);
}

- (void)setChannelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_channelDelegate, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setIsOpened:(BOOL)a3
{
  self->_isOpened = a3;
}

- (CARSessionChannelProviding)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (NSTimer)reconnectTimer
{
  return self->_reconnectTimer;
}

- (void)setReconnectTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reconnectTimer, a3);
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputQueue, a3);
}

- (OS_dispatch_queue)inputQueue
{
  return self->_inputQueue;
}

- (void)setInputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_inputQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_destroyWeak((id *)&self->_channelDelegate);
}

void __56__CarDataChannel_sendToPluginID_payload_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, a2, a3, "Unable to package payload: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __34__CarDataChannel__startConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Did open channel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __34__CarDataChannel__startConnection__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11((void *)&_mh_execute_header, v0, v1, "Failed to open channel %@, will retry later...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __34__CarDataChannel__startConnection__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Starting channel %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __33__CarDataChannel__stopConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Stopping channel (inputQueue) %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "%{public}@ Received data message without pluginID or data: %@");
  OUTLINED_FUNCTION_3();
}

void __44__CarDataChannel_channel_didReceiveMessage___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v0, v1, "%{public}@ Error parsing data: %@");
  OUTLINED_FUNCTION_3();
}

- (void)didCloseChannel:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Did close channel: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __34__CarDataChannel_didCloseChannel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Did close channel (inputQueue): %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
