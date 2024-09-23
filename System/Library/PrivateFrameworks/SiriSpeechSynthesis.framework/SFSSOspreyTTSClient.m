@implementation SFSSOspreyTTSClient

- (SFSSOspreyTTSClient)init
{
  SFSSOspreyTTSClient *v2;
  SFSSOspreyTTSClient *v3;
  NSString *carryClusterId;
  void *v5;
  void *v6;
  SFSSOspreyTTSClient *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFSSOspreyTTSClient;
  v2 = -[SFSSOspreyTTSClient init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    carryClusterId = v2->_carryClusterId;
    v2->_carryClusterId = 0;

  }
  +[SFSpeechSynthesisInternalSetting sharedInstance](SFSpeechSynthesisInternalSetting, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ospreyEndpointURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SFSSOspreyTTSClient initWithURL:](v3, "initWithURL:", v6);
  return v7;
}

- (SFSSOspreyTTSClient)initWithURL:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  NSString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SFSSOspreyTTSClient *v12;
  void *v13;
  uint64_t v14;
  NSString *deviceId;
  NSObject *v16;
  NSString *v17;
  objc_super v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v5 = a5;
  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = (NSString *)a3;
  SFSSGetLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 1024;
    v25 = v5;
    _os_log_impl(&dword_21E284000, v9, OS_LOG_TYPE_INFO, "Init TTS Osprey client with URL: %@, useBlazar=%d, enableDeviceAuthentication=%d", buf, 0x18u);
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)SFSSOspreyTTSClient;
  v12 = -[OspreyChannel initWithURL:configuration:](&v19, sel_initWithURL_configuration_, v10, v11);

  if (v12)
  {
    v12->_useBlazar = v6;
    +[SFSpeechSynthesisInternalSetting sharedInstance](SFSpeechSynthesisInternalSetting, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceId");
    v14 = objc_claimAutoreleasedReturnValue();
    deviceId = v12->_deviceId;
    v12->_deviceId = (NSString *)v14;

    SFSSGetLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = v12->_deviceId;
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_21E284000, v16, OS_LOG_TYPE_INFO, "Device ID: %@", buf, 0xCu);
    }

    -[OspreyChannel setUseCompression:](v12, "setUseCompression:", 0);
    -[OspreyChannel setEnableDeviceAuthentication:](v12, "setEnableDeviceAuthentication:", v5);
    if (-[OspreyChannel enableDeviceAuthentication](v12, "enableDeviceAuthentication"))
      -[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:](v12, "initializeDeviceAuthenticationSessionWithCompletion:", &__block_literal_global_19);
  }

  return v12;
}

- (SFSSOspreyTTSClient)initWithURL:(id)a3
{
  return -[SFSSOspreyTTSClient initWithURL:useBlazar:enableAuthentication:](self, "initWithURL:useBlazar:enableAuthentication:", a3, 1, 1);
}

- (void)prewarm
{
  NSObject *v3;
  uint8_t v4[16];

  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Preconnect Osprey TTS connection.", v4, 2u);
  }

  -[OspreyChannel preconnect](self, "preconnect");
}

- (void)performCustomBidirectionalStreamingRequest:(id)a3 handler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __85__SFSSOspreyTTSClient_performCustomBidirectionalStreamingRequest_handler_completion___block_invoke;
  v17[3] = &unk_24E2468F0;
  v11 = v8;
  v18 = v11;
  v12 = (void *)MEMORY[0x2207ADF98](v17);
  objc_msgSend(v11, "methodName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OspreyChannel bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:](self, "bidirectionalStreamingRequestWithMethodName:requestBuilder:streamingResponseHandler:completion:", v13, v12, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v11, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "writeFrame:", v16);

    objc_msgSend(v14, "finishWriting");
  }

}

- (void)streamTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v21, "setSpeech_id:", self->_deviceId);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStream_id:", v20);

  if (-[SFSSOspreyTTSClient useBlazar](self, "useBlazar"))
    -[SFSSOspreyTTSClient streamBlazarTTS:headers:beginHandler:chunkHandler:endHandler:completion:](self, "streamBlazarTTS:headers:beginHandler:chunkHandler:endHandler:completion:", v21, v14, v15, v16, v17, v18);
  else
    -[SFSSOspreyTTSClient streamNativeTTS:headers:beginHandler:chunkHandler:endHandler:completion:](self, "streamNativeTTS:headers:beginHandler:chunkHandler:endHandler:completion:", v21, v14, v15, v16, v17, v18);

}

- (void)streamNativeTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  QSSMutableTextToSpeechStreamingStreamingRequest *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v45 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v41 = a8;
  v42 = v15;
  v43 = v16;
  v44 = v17;
  v18 = objc_alloc_init(QSSMutableTextToSpeechStreamingStreamingRequest);
  -[QSSMutableTextToSpeechStreamingStreamingRequest setContent_type:](v18, "setContent_type:", 1);
  -[QSSMutableTextToSpeechStreamingStreamingRequest setContentAsQSSStartTextToSpeechStreamingRequest:](v18, "setContentAsQSSStartTextToSpeechStreamingRequest:", v14);
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy_;
  v52[4] = __Block_byref_object_dispose_;
  v53 = (id)MEMORY[0x2207ADF98](v41);
  SFSSGetLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "speech_id");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "session_id");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stream_id");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "language");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gender");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "voice_name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "meta_info");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "app_id");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "preferred_voice_type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v55 = v40;
    v56 = 2112;
    v57 = v39;
    v58 = 2112;
    v59 = v38;
    v60 = 2112;
    v61 = v20;
    v62 = 2112;
    v63 = v21;
    v64 = 2112;
    v65 = v22;
    v66 = 2112;
    v67 = v24;
    v68 = 2112;
    v69 = v25;
    _os_log_impl(&dword_21E284000, v19, OS_LOG_TYPE_INFO, "Sent Osprey streaming request with speech_id '%@', session_id '%@', stream_id '%@', locale '%@', gender '%@', voice '%@', app_id '%@', voice_type '%@'", buf, 0x52u);

  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E480]), "initWithMethodName:", CFSTR("/siri.speech.qss_fb.Tts/TextToSpeechStreaming"));
  -[QSSTextToSpeechStreamingStreamingRequest flatbuffData](v18, "flatbuffData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setData:", v27);

  v28 = (void *)objc_msgSend(v45, "mutableCopy");
  -[SFSSOspreyTTSClient carryClusterId](self, "carryClusterId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length") == 0;

  if (!v30)
  {
    -[SFSSOspreyTTSClient carryClusterId](self, "carryClusterId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("supercarry-cluster-override"));

  }
  v32 = (void *)objc_msgSend(v28, "copy");
  objc_msgSend(v26, "setHeaders:", v32);

  objc_msgSend(v14, "session_id");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClientTraceId:", v33);

  v34 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke;
  v47[3] = &unk_24E246918;
  v51 = v52;
  v35 = v42;
  v48 = v35;
  v36 = v43;
  v49 = v36;
  v37 = v44;
  v50 = v37;
  v46[0] = v34;
  v46[1] = 3221225472;
  v46[2] = __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_33;
  v46[3] = &unk_24E246940;
  v46[4] = v52;
  -[SFSSOspreyTTSClient performCustomBidirectionalStreamingRequest:handler:completion:](self, "performCustomBidirectionalStreamingRequest:handler:completion:", v26, v47, v46);

  _Block_object_dispose(v52, 8);
}

- (void)streamBlazarTTS:(id)a3 headers:(id)a4 beginHandler:(id)a5 chunkHandler:(id)a6 endHandler:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  QSSMutableTextToSpeechRouterStreamingStreamingRequest *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v45 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v41 = a8;
  v42 = v15;
  v43 = v16;
  v44 = v17;
  v18 = objc_alloc_init(QSSMutableTextToSpeechRouterStreamingStreamingRequest);
  -[QSSMutableTextToSpeechRouterStreamingStreamingRequest setContent_type:](v18, "setContent_type:", 1);
  -[QSSMutableTextToSpeechRouterStreamingStreamingRequest setContentAsQSSStartTextToSpeechStreamingRequest:](v18, "setContentAsQSSStartTextToSpeechStreamingRequest:", v14);
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy_;
  v52[4] = __Block_byref_object_dispose_;
  v53 = (id)MEMORY[0x2207ADF98](v41);
  SFSSGetLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "speech_id");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "session_id");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stream_id");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "language");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gender");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "voice_name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "meta_info");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "app_id");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "preferred_voice_type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v55 = v40;
    v56 = 2112;
    v57 = v39;
    v58 = 2112;
    v59 = v38;
    v60 = 2112;
    v61 = v20;
    v62 = 2112;
    v63 = v21;
    v64 = 2112;
    v65 = v22;
    v66 = 2112;
    v67 = v24;
    v68 = 2112;
    v69 = v25;
    _os_log_impl(&dword_21E284000, v19, OS_LOG_TYPE_INFO, "Sent Osprey Blazar streaming request with speech_id '%@', session_id '%@', stream_id '%@', locale '%@', gender '%@', voice '%@', app_id '%@', voice_type '%@'", buf, 0x52u);

  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E480]), "initWithMethodName:", CFSTR("/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming"));
  -[QSSTextToSpeechRouterStreamingStreamingRequest flatbuffData](v18, "flatbuffData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setData:", v27);

  v28 = (void *)objc_msgSend(v45, "mutableCopy");
  -[SFSSOspreyTTSClient carryClusterId](self, "carryClusterId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length") == 0;

  if (!v30)
  {
    -[SFSSOspreyTTSClient carryClusterId](self, "carryClusterId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("supercarry-cluster-override"));

  }
  v32 = (void *)objc_msgSend(v28, "copy");
  objc_msgSend(v26, "setHeaders:", v32);

  objc_msgSend(v14, "session_id");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClientTraceId:", v33);

  v34 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke;
  v47[3] = &unk_24E246918;
  v51 = v52;
  v35 = v42;
  v48 = v35;
  v36 = v43;
  v49 = v36;
  v37 = v44;
  v50 = v37;
  v46[0] = v34;
  v46[1] = 3221225472;
  v46[2] = __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_38;
  v46[3] = &unk_24E246940;
  v46[4] = v52;
  -[SFSSOspreyTTSClient performCustomBidirectionalStreamingRequest:handler:completion:](self, "performCustomBidirectionalStreamingRequest:handler:completion:", v26, v47, v46);

  _Block_object_dispose(v52, 8);
}

- (NSString)carryClusterId
{
  return self->_carryClusterId;
}

- (void)setCarryClusterId:(id)a3
{
  objc_storeStrong((id *)&self->_carryClusterId, a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (BOOL)useBlazar
{
  return self->_useBlazar;
}

- (void)setUseBlazar:(BOOL)a3
{
  self->_useBlazar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_carryClusterId, 0);
}

void __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  QSSTextToSpeechRouterStreamingStreamingResponse *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[QSSTextToSpeechRouterStreamingStreamingResponse initWithFlatbuffData:]([QSSTextToSpeechRouterStreamingStreamingResponse alloc], "initWithFlatbuffData:", v3);
  switch(-[QSSTextToSpeechRouterStreamingStreamingResponse content_type](v4, "content_type"))
  {
    case 0:
      SFSSGetLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[SFSSOspreyTTSClient streamBlazarTTS:headers:beginHandler:chunkHandler:endHandler:completion:]_block_invoke";
        _os_log_fault_impl(&dword_21E284000, v5, OS_LOG_TYPE_FAULT, "%s, Unknown response from Osprey for streaming TTS", buf, 0xCu);
      }
      goto LABEL_28;
    case 1:
      -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "error_code");

      if (v7 == 200)
      {
        SFSSGetLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stream_id");
          v10 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v10;
          _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "Osprey streaming received Begin response %@", buf, 0xCu);

        }
        v11 = a1[4];
        -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
        v5 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v5);
      }
      else
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        if (v21)
        {
          v22 = (void *)MEMORY[0x24BDD1540];
          v57 = *MEMORY[0x24BDD0FC8];
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "error_str");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v26);

          v27 = *(_QWORD *)(a1[7] + 8);
          v28 = *(void **)(v27 + 40);
          *(_QWORD *)(v27 + 40) = 0;

        }
        SFSSGetLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v29, "error_code");
          _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received Begin response with non 200 status: %d", buf, 8u);

        }
      }
      goto LABEL_28;
    case 2:
      -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "error_code");

      if (v13 == 200)
      {
        SFSSGetLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v48, "current_pkt_number");
          _os_log_debug_impl(&dword_21E284000, v14, OS_LOG_TYPE_DEBUG, "Osprey streaming received Chunk response, pkt number: %d", buf, 8u);

        }
        v15 = a1[5];
        -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
        v5 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v15 + 16))(v15, v5);
      }
      else
      {
        v30 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        if (v30)
        {
          v31 = (void *)MEMORY[0x24BDD1540];
          v53 = *MEMORY[0x24BDD0FC8];
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "error_str");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v35);

          v36 = *(_QWORD *)(a1[7] + 8);
          v37 = *(void **)(v36 + 40);
          *(_QWORD *)(v36 + 40) = 0;

        }
        SFSSGetLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v39;
          _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error: Osprey streaming received Chunk response with non 200 status: %d", buf, 8u);

        }
      }
      goto LABEL_28;
    case 3:
      -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "error_code");

      if (v17 == 200)
      {
        SFSSGetLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v19, "total_pkt_number");
          _os_log_impl(&dword_21E284000, v18, OS_LOG_TYPE_INFO, "Osprey streaming received End response, total pkt: %d", buf, 8u);

        }
        v20 = a1[6];
        -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
        v5 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v5);
      }
      else
      {
        v40 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        if (v40)
        {
          v41 = (void *)MEMORY[0x24BDD1540];
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse", *MEMORY[0x24BDD0FC8]);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "error_str");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v45);

          v46 = *(_QWORD *)(a1[7] + 8);
          v47 = *(void **)(v46 + 40);
          *(_QWORD *)(v46 + 40) = 0;

        }
        SFSSGetLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[QSSTextToSpeechRouterStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v50;
          _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received End response with non 200 status: %d", buf, 8u);

        }
      }
LABEL_28:

      break;
    default:
      break;
  }

}

void __95__SFSSOspreyTTSClient_streamBlazarTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_21E284000, v8, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = (void *)v7;
  }
  else
  {
    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "Osprey streaming invokes completion callback", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v10)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  QSSTextToSpeechStreamingStreamingResponse *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[QSSTextToSpeechStreamingStreamingResponse initWithFlatbuffData:]([QSSTextToSpeechStreamingStreamingResponse alloc], "initWithFlatbuffData:", v3);
  switch(-[QSSTextToSpeechStreamingStreamingResponse content_type](v4, "content_type"))
  {
    case 0:
      SFSSGetLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[SFSSOspreyTTSClient streamNativeTTS:headers:beginHandler:chunkHandler:endHandler:completion:]_block_invoke";
        _os_log_fault_impl(&dword_21E284000, v5, OS_LOG_TYPE_FAULT, "%s, Unknown response from Osprey for streaming TTS", buf, 0xCu);
      }
      goto LABEL_28;
    case 2:
      -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "error_code");

      if (v7 == 200)
      {
        SFSSGetLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stream_id");
          v10 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v10;
          _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "Osprey streaming received Begin response %@", buf, 0xCu);

        }
        v11 = a1[4];
        -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
        v5 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v11 + 16))(v11, v5);
      }
      else
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        if (v21)
        {
          v22 = (void *)MEMORY[0x24BDD1540];
          v57 = *MEMORY[0x24BDD0FC8];
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "error_str");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = v24;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v26);

          v27 = *(_QWORD *)(a1[7] + 8);
          v28 = *(void **)(v27 + 40);
          *(_QWORD *)(v27 + 40) = 0;

        }
        SFSSGetLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](v4, "contentAsQSSBeginTextToSpeechStreamingResponse");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v29, "error_code");
          _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received Begin response with non 200 status: %d", buf, 8u);

        }
      }
      goto LABEL_28;
    case 3:
      -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "error_code");

      if (v13 == 200)
      {
        SFSSGetLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v48, "current_pkt_number");
          _os_log_debug_impl(&dword_21E284000, v14, OS_LOG_TYPE_DEBUG, "Osprey streaming received Chunk response, pkt number: %d", buf, 8u);

        }
        v15 = a1[5];
        -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
        v5 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v15 + 16))(v15, v5);
      }
      else
      {
        v30 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        if (v30)
        {
          v31 = (void *)MEMORY[0x24BDD1540];
          v53 = *MEMORY[0x24BDD0FC8];
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "error_str");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v35);

          v36 = *(_QWORD *)(a1[7] + 8);
          v37 = *(void **)(v36 + 40);
          *(_QWORD *)(v36 + 40) = 0;

        }
        SFSSGetLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](v4, "contentAsQSSPartialTextToSpeechStreamingResponse");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v39;
          _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Error: Osprey streaming received Chunk response with non 200 status: %d", buf, 8u);

        }
      }
      goto LABEL_28;
    case 4:
      -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "error_code");

      if (v17 == 200)
      {
        SFSSGetLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = objc_msgSend(v19, "total_pkt_number");
          _os_log_impl(&dword_21E284000, v18, OS_LOG_TYPE_INFO, "Osprey streaming received End response, total pkt: %d", buf, 8u);

        }
        v20 = a1[6];
        -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
        v5 = objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v5);
      }
      else
      {
        v40 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        if (v40)
        {
          v41 = (void *)MEMORY[0x24BDD1540];
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse", *MEMORY[0x24BDD0FC8]);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "error_str");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v45);

          v46 = *(_QWORD *)(a1[7] + 8);
          v47 = *(void **)(v46 + 40);
          *(_QWORD *)(v46 + 40) = 0;

        }
        SFSSGetLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](v4, "contentAsQSSFinalTextToSpeechStreamingResponse");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "error_code");
          *(_DWORD *)buf = 67109120;
          LODWORD(v56) = v50;
          _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming received End response with non 200 status: %d", buf, 8u);

        }
      }
LABEL_28:

      break;
    default:
      break;
  }

}

void __95__SFSSOspreyTTSClient_streamNativeTTS_headers_beginHandler_chunkHandler_endHandler_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisServerErrorDomain"), 800, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_21E284000, v8, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@", (uint8_t *)&v13, 0xCu);
    }
    v9 = (void *)v7;
  }
  else
  {
    SFSSGetLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21E284000, v8, OS_LOG_TYPE_INFO, "Osprey streaming invokes completion callback", (uint8_t *)&v13, 2u);
    }
    v9 = 0;
  }

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v10)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __85__SFSSOspreyTTSClient_performCustomBidirectionalStreamingRequest_handler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientTraceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientTraceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClientTraceIdentifier:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "headers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "headers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "headers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forHTTPHeaderField:", v13, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

void __66__SFSSOspreyTTSClient_initWithURL_useBlazar_enableAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "initializeDeviceAuthenticationSessionWithCompletion Error: %@", (uint8_t *)&v6, 0xCu);
  }

  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_error_impl(&dword_21E284000, v5, OS_LOG_TYPE_ERROR, "Unable to initialize device authentication session: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "Device authentication session is initialized", (uint8_t *)&v6, 2u);
  }

}

+ (id)sharedInstance
{
  if (+[SFSSOspreyTTSClient sharedInstance]::onceToken != -1)
    dispatch_once(&+[SFSSOspreyTTSClient sharedInstance]::onceToken, &__block_literal_global);
  return (id)+[SFSSOspreyTTSClient sharedInstance]::__sharedInstance;
}

void __37__SFSSOspreyTTSClient_sharedInstance__block_invoke()
{
  SFSSOspreyTTSClient *v0;
  void *v1;

  v0 = objc_alloc_init(SFSSOspreyTTSClient);
  v1 = (void *)+[SFSSOspreyTTSClient sharedInstance]::__sharedInstance;
  +[SFSSOspreyTTSClient sharedInstance]::__sharedInstance = (uint64_t)v0;

}

@end
