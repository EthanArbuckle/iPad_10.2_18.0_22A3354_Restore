@implementation SiriTTSOspreyChannel

- (SiriTTSOspreyChannel)initWithURL:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SiriTTSOspreyChannel *v8;
  uint64_t v9;
  OspreyChannel *grpcChannel;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriTTSOspreyChannel;
  v8 = -[SiriTTSOspreyChannel init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D65210]), "initWithURL:configuration:", v6, v7);
    grpcChannel = v8->_grpcChannel;
    v8->_grpcChannel = (OspreyChannel *)v9;

    -[OspreyChannel setUseCompression:](v8->_grpcChannel, "setUseCompression:", 0);
  }

  return v8;
}

- (void)streamTTS:(id)a3 beginHandler:(id)a4 chunkHandler:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  OPTTSMutableTextToSpeechRouterStreamingStreamingRequest *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  OspreyChannel *grpcChannel;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id aBlock;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v26 = a4;
  v27 = a5;
  aBlock = a6;
  objc_msgSend(v9, "underlyingRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(OPTTSMutableTextToSpeechRouterStreamingStreamingRequest);
  -[OPTTSMutableTextToSpeechRouterStreamingStreamingRequest setContent_type:](v11, "setContent_type:", 1);
  -[OPTTSMutableTextToSpeechRouterStreamingStreamingRequest setContentAsOPTTSStartTextToSpeechStreamingRequest:](v11, "setContentAsOPTTSStartTextToSpeechStreamingRequest:", v10);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x4810000000;
  v45 = 0u;
  v46 = 0u;
  v44[3] = &unk_19AE90C62;
  v47 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__611;
  v42[4] = __Block_byref_object_dispose__612;
  v43 = _Block_copy(aBlock);
  TTSGetServiceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "speech_id", v26, v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "session_id");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stream_id");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "meta_info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "app_id");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v9, "requestCreatedTime");
    *(_DWORD *)buf = 138413314;
    v49 = v13;
    v50 = 2112;
    v51 = v14;
    v52 = 2112;
    v53 = v15;
    v54 = 2112;
    v55 = v17;
    v56 = 2048;
    v57 = v18;
    _os_log_impl(&dword_19AD45000, v12, OS_LOG_TYPE_DEFAULT, "Sent Osprey streaming request with speech_id '%@', session_id '%@', stream_id '%@', app_id '%@', request_id '%llu'", buf, 0x34u);

  }
  grpcChannel = self->_grpcChannel;
  -[OPTTSTextToSpeechRouterStreamingStreamingRequest flatbuffData](v11, "flatbuffData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke;
  v40[3] = &unk_1E3A15F68;
  v41 = v10;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_2;
  v33[3] = &unk_1E3A15F90;
  v22 = v41;
  v34 = v22;
  v35 = v9;
  v38 = v42;
  v39 = v44;
  v23 = v26;
  v36 = v23;
  v24 = v27;
  v37 = v24;
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_225;
  v30[3] = &unk_1E3A15FB8;
  v25 = v35;
  v31 = v25;
  v32 = v42;
  -[OspreyChannel serverStreamingRequestWithMethodName:requestData:requestBuilder:streamingResponseHandler:completion:](grpcChannel, "serverStreamingRequestWithMethodName:requestData:requestBuilder:streamingResponseHandler:completion:", CFSTR("/siri.speech.qss_fb.Blazar/TextToSpeechRouterStreaming"), v20, v40, v33, v30);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);

}

- (void)initializeDeviceAuthenticationSessionWithCompletion:(id)a3
{
  -[OspreyChannel initializeDeviceAuthenticationSessionWithCompletion:](self->_grpcChannel, "initializeDeviceAuthenticationSessionWithCompletion:", a3);
}

- (void)preconnect
{
  -[OspreyChannel preconnect](self->_grpcChannel, "preconnect");
}

- (OspreyChannel)grpcChannel
{
  return self->_grpcChannel;
}

- (void)setGrpcChannel:(id)a3
{
  objc_storeStrong((id *)&self->_grpcChannel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grpcChannel, 0);
}

void __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "session_id");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientTraceIdentifier:", v4);

}

void __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  SiriTTSOspreyStreamingBeginResponse *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  SiriTTSOspreyStreamingPartialResponse *v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  _OWORD v83[2];
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  const __CFString *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  const __CFString *v97;
  uint8_t buf[4];
  _BYTE v99[18];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[OPTTSTextToSpeechRouterStreamingStreamingResponse initAndVerifyWithFlatbuffData:]([OPTTSTextToSpeechRouterStreamingStreamingResponse alloc], "initAndVerifyWithFlatbuffData:", v3);

  if (v4)
  {
    switch(objc_msgSend(v4, "content_type"))
    {
      case 0:
        TTSGetServiceLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v82 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v99 = "-[SiriTTSOspreyChannel streamTTS:beginHandler:chunkHandler:completion:]_block_invoke";
          *(_WORD *)&v99[8] = 2048;
          *(_QWORD *)&v99[10] = v82;
          _os_log_error_impl(&dword_19AD45000, v5, OS_LOG_TYPE_ERROR, "%s, Unknown response from Osprey for streaming TTS, request_id: %llu", buf, 0x16u);
        }

        v6 = (void *)MEMORY[0x1E0CB35C8];
        v88 = *MEMORY[0x1E0CB2D50];
        v89 = CFSTR("Unknown response from Osprey for streaming TTS");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("OspreyTTSService"), -1, v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v9)
        {
          (*(void (**)(uint64_t, NSObject *))(v9 + 16))(v9, v8);
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v11 = *(void **)(v10 + 40);
          *(_QWORD *)(v10 + 40) = 0;

        }
        goto LABEL_39;
      case 1:
        objc_msgSend(v4, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "error_code");

        if (v19 == 200)
        {
          TTSGetServiceLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stream_id");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v99 = v22;
            *(_WORD *)&v99[8] = 2048;
            *(_QWORD *)&v99[10] = v23;
            _os_log_impl(&dword_19AD45000, v20, OS_LOG_TYPE_DEFAULT, "Osprey streaming received Begin response %@, request_id: %llu", buf, 0x16u);

          }
          objc_msgSend(v4, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "decoder_description");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "audioStreamBasicDescription");
          v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v27 = v87;
          v28 = v86;
          *(_OWORD *)(v26 + 32) = v85;
          *(_OWORD *)(v26 + 48) = v28;
          *(_QWORD *)(v26 + 64) = v27;

          v29 = [SiriTTSOspreyStreamingBeginResponse alloc];
          objc_msgSend(v4, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[SiriTTSOspreyStreamingBeginResponse initWithOspreyBeginResponse:](v29, "initWithOspreyBeginResponse:", v30);

          v31 = *(_QWORD *)(a1 + 48);
          goto LABEL_21;
        }
        v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v49)
        {
          v50 = (void *)MEMORY[0x1E0CB35C8];
          v94 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(v4, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "error_str");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("OspreyTTSService"), -1, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v49 + 16))(v49, v54);

          v55 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v56 = *(void **)(v55 + 40);
          *(_QWORD *)(v55 + 40) = 0;

        }
        TTSGetServiceLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v46, "error_code");
          v58 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v99 = v57;
          *(_WORD *)&v99[4] = 2048;
          *(_QWORD *)&v99[6] = v58;
          v59 = "Osprey streaming received Begin response with non 200 status: %d, request_id: %llu";
          goto LABEL_37;
        }
        goto LABEL_39;
      case 2:
        objc_msgSend(v4, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "error_code");

        if (v33 == 200)
        {
          TTSGetServiceLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "current_pkt_number");
            v37 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v99 = v36;
            *(_WORD *)&v99[4] = 2048;
            *(_QWORD *)&v99[6] = v37;
            _os_log_impl(&dword_19AD45000, v34, OS_LOG_TYPE_DEFAULT, "Osprey streaming received Chunk response, pkt number: %d, request_id: %llu", buf, 0x12u);

          }
          if (objc_msgSend(*(id *)(a1 + 40), "serverLogs"))
          {
            objc_msgSend(v4, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[SiriTTSOspreyStreamingPartialResponse processServerLogs:](SiriTTSOspreyStreamingPartialResponse, "processServerLogs:", v38);

          }
          v39 = [SiriTTSOspreyStreamingPartialResponse alloc];
          objc_msgSend(v4, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[SiriTTSOspreyStreamingPartialResponse initWithOspreyPartialResponse:](v39, "initWithOspreyPartialResponse:", v40);

          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v42 = *(_OWORD *)(v41 + 32);
          v43 = *(_OWORD *)(v41 + 48);
          v84 = *(_QWORD *)(v41 + 64);
          v83[0] = v42;
          v83[1] = v43;
          -[NSObject setAsbd:](v8, "setAsbd:", v83);
          v31 = *(_QWORD *)(a1 + 56);
LABEL_21:
          (*(void (**)(uint64_t, NSObject *))(v31 + 16))(v31, v8);
        }
        else
        {
          v60 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v60)
          {
            v61 = (void *)MEMORY[0x1E0CB35C8];
            v92 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(v4, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "error_str");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("OspreyTTSService"), -1, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v65);

            v66 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v67 = *(void **)(v66 + 40);
            *(_QWORD *)(v66 + 40) = 0;

          }
          TTSGetServiceLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v46, "error_code");
            v69 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v99 = v68;
            *(_WORD *)&v99[4] = 2048;
            *(_QWORD *)&v99[6] = v69;
            v59 = "Osprey streaming received Chunk response with non 200 status: %d, request_id: %llu";
            goto LABEL_37;
          }
        }
        goto LABEL_39;
      case 3:
        objc_msgSend(v4, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "error_code");

        if (v45 == 200)
        {
          TTSGetServiceLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            goto LABEL_39;
          objc_msgSend(v4, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "total_pkt_number");
          v48 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v99 = v47;
          *(_WORD *)&v99[4] = 2048;
          *(_QWORD *)&v99[6] = v48;
          _os_log_impl(&dword_19AD45000, v8, OS_LOG_TYPE_DEFAULT, "Osprey streaming received End response, total pkt: %d, request_id: %llu", buf, 0x12u);
          goto LABEL_38;
        }
        v70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v70)
        {
          v71 = (void *)MEMORY[0x1E0CB35C8];
          v90 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(v4, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "error_str");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v73;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "errorWithDomain:code:userInfo:", CFSTR("OspreyTTSService"), -1, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v70 + 16))(v70, v75);

          v76 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v77 = *(void **)(v76 + 40);
          *(_QWORD *)(v76 + 40) = 0;

        }
        TTSGetServiceLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v46, "error_code");
          v79 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v99 = v78;
          *(_WORD *)&v99[4] = 2048;
          *(_QWORD *)&v99[6] = v79;
          v59 = "Osprey streaming received End response with non 200 status: %d, request_id: %llu";
LABEL_37:
          _os_log_error_impl(&dword_19AD45000, v8, OS_LOG_TYPE_ERROR, v59, buf, 0x12u);
LABEL_38:

          goto LABEL_39;
        }
        break;
      default:
        goto LABEL_40;
    }
    goto LABEL_39;
  }
  TTSGetServiceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "stream_id");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(*(id *)(a1 + 40), "requestCreatedTime");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v99 = v80;
    *(_WORD *)&v99[8] = 2048;
    *(_QWORD *)&v99[10] = v81;
    _os_log_error_impl(&dword_19AD45000, v12, OS_LOG_TYPE_ERROR, "Corrupted Osprey response, stream ID: %@, request_id: %llu", buf, 0x16u);

  }
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v96 = *MEMORY[0x1E0CB2D50];
    v97 = CFSTR("Corrupted Osprey response.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("OspreyTTSService"), -1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(NSObject **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;
LABEL_39:

  }
LABEL_40:

}

void __71__SiriTTSOspreyChannel_streamTTS_beginHandler_chunkHandler_completion___block_invoke_225(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TTSGetServiceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTime");
      v11 = 138412546;
      v12 = (uint64_t)v3;
      v13 = 2048;
      v14 = v6;
      _os_log_error_impl(&dword_19AD45000, v5, OS_LOG_TYPE_ERROR, "Osprey streaming invokes completion with error %@, request_id: %llu", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "requestCreatedTime");
    v11 = 134217984;
    v12 = v7;
    _os_log_impl(&dword_19AD45000, v5, OS_LOG_TYPE_DEFAULT, "Osprey streaming invokes completion callback, request_id: %llu", (uint8_t *)&v11, 0xCu);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

@end
