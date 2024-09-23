@implementation OspreyTTSService

- (OspreyTTSService)init
{
  void *v3;
  void *v4;
  void *v5;
  OspreyTTSService *v6;
  void *v7;
  uint64_t v8;
  NSString *deviceID;
  objc_super v11;

  +[OspreyTTSService ospreyServiceEndpointURL](OspreyTTSService, "ospreyServiceEndpointURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeoutIntervalForRequest:", 5.0);
  objc_msgSend(v4, "setTimeoutIntervalForResource:", 60.0);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)OspreyTTSService;
  v6 = -[OspreyChannel initWithURL:configuration:](&v11, sel_initWithURL_configuration_, v5, v4);

  if (v6)
  {
    -[OspreyChannel setUseCompression:](v6, "setUseCompression:", 0);
    objc_msgSend(MEMORY[0x24BEC0DC8], "defaultInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceUUID");
    v8 = objc_claimAutoreleasedReturnValue();
    deviceID = v6->_deviceID;
    v6->_deviceID = (NSString *)v8;

  }
  return v6;
}

- (void)roundTripTTS:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OPTTSMutableTextToSpeechRequestExperiment *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[OspreyTTSService deviceID](self, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSpeech_id:", v8);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSession_id:", v10);

  +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "experimentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(OPTTSMutableTextToSpeechRequestExperiment);
    -[OPTTSMutableTextToSpeechRequestExperiment setExperiment_identifier:](v13, "setExperiment_identifier:", v12);
    objc_msgSend(v6, "setExperiment:", v13);

  }
  VSGetLogDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "speech_id");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "session_id");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "meta_info");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "app_id");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_21AA84000, v14, OS_LOG_TYPE_DEFAULT, "Sent Osprey grpc request with speech_id '%@', session_id '%@', app_id '%@'", buf, 0x20u);

  }
  objc_msgSend(v6, "flatbuffData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke;
  v25[3] = &unk_24DD8E878;
  v21 = v6;
  v26 = v21;
  v23[0] = v20;
  v23[1] = 3221225472;
  v23[2] = __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke_2;
  v23[3] = &unk_24DD8E8A0;
  v22 = v7;
  v24 = v22;
  -[OspreyChannel unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:](self, "unaryRequestWithMethodName:requestData:requestBuilder:responseHandler:", CFSTR("/siri.speech.qss_fb.Blazar/TextToSpeechRouter"), v19, v25, v23);

}

- (void)streamTTS:(id)a3 beginHandler:(id)a4 chunkHandler:(id)a5 endHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OPTTSMutableStartTextToSpeechStreamingRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  OPTTSMutableTextToSpeechRequestExperiment *v30;
  OPTTSMutableTextToSpeechRouterStreamingStreamingRequest *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  OPTTSMutableStartTextToSpeechStreamingRequest *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  OspreyTTSService *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[4];
  OPTTSMutableStartTextToSpeechStreamingRequest *v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD v56[4];
  OPTTSMutableStartTextToSpeechStreamingRequest *v57;
  _QWORD v58[5];
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v46 = v13;
  v47 = v16;
  v48 = v15;
  v17 = objc_alloc_init(OPTTSMutableStartTextToSpeechStreamingRequest);
  v45 = self;
  -[OspreyTTSService deviceID](self, "deviceID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setSpeech_id:](v17, "setSpeech_id:", v18);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setSession_id:](v17, "setSession_id:", v20);

  objc_msgSend(v12, "language");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setLanguage:](v17, "setLanguage:", v21);

  objc_msgSend(v12, "voice_name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setVoice_name:](v17, "setVoice_name:", v22);

  objc_msgSend(v12, "gender");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setGender:](v17, "setGender:", v23);

  objc_msgSend(v12, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setText:](v17, "setText:", v24);

  -[OPTTSMutableStartTextToSpeechStreamingRequest setAudio_type:](v17, "setAudio_type:", objc_msgSend(v12, "audio_type"));
  -[OPTTSMutableStartTextToSpeechStreamingRequest setEnable_word_timing_info:](v17, "setEnable_word_timing_info:", objc_msgSend(v12, "enable_word_timing_info"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setStream_id:](v17, "setStream_id:", v26);

  objc_msgSend(v12, "meta_info");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setMeta_info:](v17, "setMeta_info:", v27);

  +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "experimentIdentifier");
  v29 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)v29;
  if (v29)
  {
    v30 = objc_alloc_init(OPTTSMutableTextToSpeechRequestExperiment);
    -[OPTTSMutableTextToSpeechRequestExperiment setExperiment_identifier:](v30, "setExperiment_identifier:", v29);
    -[OPTTSMutableStartTextToSpeechStreamingRequest setExperiment:](v17, "setExperiment:", v30);

  }
  v31 = objc_alloc_init(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest);
  -[OPTTSMutableTextToSpeechRouterStreamingStreamingRequest setContent_type:](v31, "setContent_type:", 1);
  -[OPTTSMutableTextToSpeechRouterStreamingStreamingRequest setContentAsOPTTSStartTextToSpeechStreamingRequest:](v31, "setContentAsOPTTSStartTextToSpeechStreamingRequest:", v17);
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__1983;
  v58[4] = __Block_byref_object_dispose__1984;
  v59 = (id)MEMORY[0x220750D8C](v16);
  VSGetLogDefault();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[OPTTSMutableStartTextToSpeechStreamingRequest speech_id](v17, "speech_id");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OPTTSMutableStartTextToSpeechStreamingRequest session_id](v17, "session_id");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OPTTSMutableStartTextToSpeechStreamingRequest stream_id](v17, "stream_id");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[OPTTSMutableStartTextToSpeechStreamingRequest meta_info](v17, "meta_info");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "app_id");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v61 = v33;
    v62 = 2112;
    v63 = v34;
    v64 = 2112;
    v65 = v35;
    v66 = 2112;
    v67 = v37;
    _os_log_impl(&dword_21AA84000, v32, OS_LOG_TYPE_DEFAULT, "Sent Osprey streaming request with speech_id '%@', session_id '%@', stream_id '%@', app_id '%@'", buf, 0x2Au);

  }
  -[OPTTSTextToSpeechRouterStreamingStreamingRequest flatbuffData](v31, "flatbuffData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke;
  v56[3] = &unk_24DD8E878;
  v57 = v17;
  v50[0] = v39;
  v50[1] = 3221225472;
  v50[2] = __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_2;
  v50[3] = &unk_24DD8E8C8;
  v40 = v57;
  v51 = v40;
  v55 = v58;
  v41 = v46;
  v52 = v41;
  v42 = v14;
  v53 = v42;
  v43 = v48;
  v54 = v43;
  v49[0] = v39;
  v49[1] = 3221225472;
  v49[2] = __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_46;
  v49[3] = &unk_24DD8EC68;
  v49[4] = v58;
  -[OspreyChannel serverStreamingRequestWithMethodName:requestData:requestBuilder:streamingResponseHandler:completion:](v45, "serverStreamingRequestWithMethodName:requestData:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming"), v38, v56, v50, v49);

  _Block_object_dispose(v58, 8);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
}

void __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "session_id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientTraceIdentifier:", v3);

}

void __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  char *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  const __CFString *v71;
  uint8_t buf[4];
  const char *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[OPTTSTextToSpeechRouterStreamingStreamingResponse initAndVerifyWithFlatbuffData:]([OPTTSTextToSpeechRouterStreamingStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v3);
  v5 = v4;
  if (v4)
  {
    switch(objc_msgSend(v4, "content_type"))
    {
      case 0:
        VSGetLogDefault();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[OspreyTTSService streamTTS:beginHandler:chunkHandler:endHandler:completion:]_block_invoke";
          _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "%s, Unknown response from Osprey for streaming TTS", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 601, MEMORY[0x24BDBD1B8]);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v8)
        {
          (*(void (**)(uint64_t, NSObject *))(v8 + 16))(v8, v7);
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = 0;

        }
        goto LABEL_35;
      case 1:
        objc_msgSend(v5, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "error_code");

        if (v18 == 200)
        {
          VSGetLogDefault();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stream_id");
            v21 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v73 = v21;
            _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_INFO, "Osprey streaming received Begin response %@", buf, 0xCu);

          }
          v22 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v5, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
          v7 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, NSObject *))(v22 + 16))(v22, v7);
        }
        else
        {
          v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v33)
          {
            v34 = (void *)MEMORY[0x24BDD1540];
            v68 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(v5, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "error_str");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v36;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 601, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v38);

            v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v40 = *(void **)(v39 + 40);
            *(_QWORD *)(v39 + 40) = 0;

          }
          VSGetLogDefault();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "error_code");
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v42;
            _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Osprey streaming received Begin response with non 200 status: %d", buf, 8u);

          }
        }
        goto LABEL_35;
      case 2:
        objc_msgSend(v5, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "error_code");

        if (v24 == 200)
        {
          VSGetLogDefault();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = objc_msgSend(v26, "current_pkt_number");
            _os_log_impl(&dword_21AA84000, v25, OS_LOG_TYPE_INFO, "Osprey streaming received Chunk response, pkt number: %d", buf, 8u);

          }
          v27 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v5, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
          v7 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, NSObject *))(v27 + 16))(v27, v7);
        }
        else
        {
          v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v43)
          {
            v44 = (void *)MEMORY[0x24BDD1540];
            v66 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(v5, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "error_str");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v46;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 601, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v48);

            v49 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v50 = *(void **)(v49 + 40);
            *(_QWORD *)(v49 + 40) = 0;

          }
          VSGetLogDefault();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "error_code");
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v52;
            _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Osprey streaming received Chunk response with non 200 status: %d", buf, 8u);

          }
        }
        goto LABEL_35;
      case 3:
        objc_msgSend(v5, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "error_code");

        if (v29 == 200)
        {
          VSGetLogDefault();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v5, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = objc_msgSend(v31, "total_pkt_number");
            _os_log_impl(&dword_21AA84000, v30, OS_LOG_TYPE_INFO, "Osprey streaming received End response, total pkt: %d", buf, 8u);

          }
          v32 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v5, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
          v7 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, NSObject *))(v32 + 16))(v32, v7);
        }
        else
        {
          v53 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v53)
          {
            v54 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v5, "contentAsOPTTSFinalTextToSpeechStreamingResponse", *MEMORY[0x24BDD0FC8]);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "error_str");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v56;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 601, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v53 + 16))(v53, v58);

            v59 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v60 = *(void **)(v59 + 40);
            *(_QWORD *)(v59 + 40) = 0;

          }
          VSGetLogDefault();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "error_code");
            *(_DWORD *)buf = 67109120;
            LODWORD(v73) = v63;
            _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "Osprey streaming received End response with non 200 status: %d", buf, 8u);

          }
        }
        goto LABEL_35;
      default:
        break;
    }
  }
  else
  {
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "stream_id");
      v61 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = v61;
      _os_log_error_impl(&dword_21AA84000, v11, OS_LOG_TYPE_ERROR, "Corrupted Osprey response, stream ID: %@", buf, 0xCu);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v70 = *MEMORY[0x24BDD0FC8];
      v71 = CFSTR("Corrupted Osprey response.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 600, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(NSObject **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = 0;
LABEL_35:

    }
  }

}

void __78__OspreyTTSService_streamTTS_beginHandler_chunkHandler_endHandler_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@", buf, 0xCu);
    }

    v6 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v4, "localizedDescription", *MEMORY[0x24BDD0FC8]);
    v7 = objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 601, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v9;
  }
  else
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_INFO, "Osprey streaming invokes completion callback", buf, 2u);
    }
    v10 = 0;
  }

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
}

void __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "session_id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientTraceIdentifier:", v3);

}

void __49__OspreyTTSService_roundTripTTS_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  OPTTSTextToSpeechResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!v5 || !objc_msgSend(v5, "length"))
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v29 = CFSTR("Empty data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 600, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      VSGetLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "localizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[OspreyTTSService roundTripTTS:responseHandler:]_block_invoke";
        v32 = 2112;
        v33 = v23;
        _os_log_error_impl(&dword_21AA84000, v12, OS_LOG_TYPE_ERROR, "%s, Error: %@", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_17;
    }
    v8 = -[OPTTSTextToSpeechResponse initWithFlatbuffData:]([OPTTSTextToSpeechResponse alloc], "initWithFlatbuffData:", v5);
    v9 = v8;
    if (v8)
    {
      if (!-[OPTTSTextToSpeechResponse error_code](v8, "error_code")
        || objc_msgSend(v9, "error_code") == 200)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_17:

        goto LABEL_18;
      }
      v17 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FC8];
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = objc_msgSend(v9, "error_code");
      objc_msgSend(v9, "error_str");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Error %d in response: %@"), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 601, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      v27 = CFSTR("Invalid data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 600, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

    goto LABEL_17;
  }
  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[OspreyTTSService roundTripTTS:responseHandler:]_block_invoke_2";
    v32 = 2112;
    v33 = v16;
    _os_log_error_impl(&dword_21AA84000, v7, OS_LOG_TYPE_ERROR, "%s, Error: %@", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_18:

}

+ (id)ospreyServiceEndpointURL
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ospreyEndpointURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else if ((objc_msgSend(MEMORY[0x24BEC0E18], "isSeedBuild") & 1) != 0)
  {
    v4 = CFSTR("https://seed-dejavu.siri.apple.com");
  }
  else if (objc_msgSend(MEMORY[0x24BEC0E18], "isInternalBuild"))
  {
    v4 = CFSTR("https://carry-dejavu.siri.apple.com");
  }
  else
  {
    v4 = CFSTR("https://dejavu.apple.com");
  }

  return v4;
}

+ (id)sharedInstance
{
  if (+[OspreyTTSService sharedInstance]::onceToken != -1)
    dispatch_once(&+[OspreyTTSService sharedInstance]::onceToken, &__block_literal_global_2028);
  return (id)+[OspreyTTSService sharedInstance]::__sharedInstance;
}

void __34__OspreyTTSService_sharedInstance__block_invoke()
{
  OspreyTTSService *v0;
  void *v1;

  v0 = objc_alloc_init(OspreyTTSService);
  v1 = (void *)+[OspreyTTSService sharedInstance]::__sharedInstance;
  +[OspreyTTSService sharedInstance]::__sharedInstance = (uint64_t)v0;

}

@end
