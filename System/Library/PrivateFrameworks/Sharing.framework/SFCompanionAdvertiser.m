@implementation SFCompanionAdvertiser

- (SFCompanionAdvertiser)initWithServiceType:(id)a3
{
  id v4;
  SFCompanionAdvertiser *v5;
  uint64_t v6;
  NSString *serviceType;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCompanionAdvertiser;
  v5 = -[SFCompanionAdvertiser init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v6;

    v8 = +[SFCompanionManager serviceManager](SFCompanionManager, "serviceManager");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)SFCompanionAdvertiser;
  -[SFCompanionAdvertiser dealloc](&v2, sel_dealloc);
}

- (NSData)serviceEndpointData
{
  void *v3;
  void *v4;

  +[SFCompanionManager serviceManager](SFCompanionManager, "serviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamDataForIdentifier:", self->_serviceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)getContinuationStreamsWithEndpointData:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[SFCompanionManager serviceManager](SFCompanionManager, "serviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__SFCompanionAdvertiser_getContinuationStreamsWithEndpointData_completionHandler___block_invoke;
  v9[3] = &unk_1E482F8E8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "getStreamsForData:withStreamHandler:", v6, v9);

}

uint64_t __82__SFCompanionAdvertiser_getContinuationStreamsWithEndpointData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)start
{
  SFCompanionAdvertiser *v3;
  void *v4;
  NSString *serviceType;
  _QWORD v6[6];
  _QWORD v7[5];
  SFCompanionAdvertiser *v8;

  if (-[SFCompanionAdvertiser supportsStreams](self, "supportsStreams"))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__1;
    v7[4] = __Block_byref_object_dispose__1;
    v8 = 0;
    v3 = self;
    v8 = v3;
    +[SFCompanionManager serviceManager](SFCompanionManager, "serviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    serviceType = v3->_serviceType;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__SFCompanionAdvertiser_start__block_invoke;
    v6[3] = &unk_1E482F910;
    v6[4] = v3;
    v6[5] = v7;
    objc_msgSend(v4, "supportStreamsWithIdentifier:withStreamHandler:", serviceType, v6);

    _Block_object_dispose(v7, 8);
  }
}

uint64_t __30__SFCompanionAdvertiser_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v7 || !*(_BYTE *)(v7 + 8))
  {
    streams_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "No longer supports streams", v11, 2u);
    }

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "advertiser:didReceiveInputStream:outputStream:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5, v6);
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)stop
{
  void *v3;

  +[SFCompanionManager serviceManager](SFCompanionManager, "serviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableStreamSupportForIdentifier:", self->_serviceType);

  -[SFCompanionAdvertiser setSupportsStreams:](self, "setSupportsStreams:", 0);
}

- (SFCompanionAdvertiserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFCompanionAdvertiserDelegate *)a3;
}

- (BOOL)supportsStreams
{
  return self->_supportsStreams;
}

- (void)setSupportsStreams:(BOOL)a3
{
  self->_supportsStreams = a3;
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
