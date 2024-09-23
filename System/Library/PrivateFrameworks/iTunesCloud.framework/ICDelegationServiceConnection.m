@implementation ICDelegationServiceConnection

- (ICDelegationServiceConnection)initWithConnectionRole:(int64_t)a3 inputStream:(id)a4 outputStream:(id)a5 securitySettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICDelegationServiceConnection *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *calloutQueue;
  dispatch_queue_t v18;
  OS_dispatch_queue *streamReaderQueue;
  dispatch_queue_t v20;
  OS_dispatch_queue *streamWriterQueue;
  MSVMessageParser *v22;
  MSVMessageParser *messageParser;
  uint64_t v24;
  MSVStreamReader *streamReader;
  MSVStreamReader *v26;
  uint64_t v27;
  MSVStreamReader *v28;
  MSVStreamReader *v29;
  id v30;
  uint64_t v31;
  MSVStreamWriter *streamWriter;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  objc_super v44;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v44.receiver = self;
  v44.super_class = (Class)ICDelegationServiceConnection;
  v13 = -[ICDelegationServiceConnection init](&v44, sel_init);
  if (v13)
  {
    v14 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.calloutQueue", 0);
    calloutQueue = v13->_calloutQueue;
    v13->_calloutQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.streamReaderQueue", 0);
    streamReaderQueue = v13->_streamReaderQueue;
    v13->_streamReaderQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.streamWriterQueue", 0);
    streamWriterQueue = v13->_streamWriterQueue;
    v13->_streamWriterQueue = (OS_dispatch_queue *)v20;

    v13->_connectionRole = a3;
    objc_storeStrong((id *)&v13->_securitySettings, a6);
    objc_initWeak(&location, v13);
    v22 = (MSVMessageParser *)objc_alloc_init(MEMORY[0x1E0D4D080]);
    messageParser = v13->_messageParser;
    v13->_messageParser = v22;

    -[MSVMessageParser setDelegate:](v13->_messageParser, "setDelegate:", v13);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0E8]), "initWithInputStream:queue:", v10, v13->_streamReaderQueue);
    streamReader = v13->_streamReader;
    v13->_streamReader = (MSVStreamReader *)v24;

    v26 = v13->_streamReader;
    v27 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke;
    v41[3] = &unk_1E4390250;
    objc_copyWeak(&v42, &location);
    -[MSVStreamReader setDidEncounterErrorBlock:](v26, "setDidEncounterErrorBlock:", v41);
    v28 = v13->_streamReader;
    v39[0] = v27;
    v39[1] = 3221225472;
    v39[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2;
    v39[3] = &unk_1E438CB58;
    objc_copyWeak(&v40, &location);
    -[MSVStreamReader setDidReadDataBlock:](v28, "setDidReadDataBlock:", v39);
    v29 = v13->_streamReader;
    v34 = v27;
    v35 = 3221225472;
    v36 = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2_10;
    v37 = &unk_1E4391400;
    objc_copyWeak(&v38, &location);
    -[MSVStreamReader setDidFinishReadingBlock:](v29, "setDidFinishReadingBlock:", &v34);
    v30 = objc_alloc(MEMORY[0x1E0D4D0F0]);
    v31 = objc_msgSend(v30, "initWithOutputStream:queue:", v11, v13->_streamWriterQueue, v34, v35, v36, v37);
    streamWriter = v13->_streamWriter;
    v13->_streamWriter = (MSVStreamWriter *)v31;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[ICDelegationServicePairingSession setDelegate:](self->_pairingSession, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationServiceConnection;
  -[ICDelegationServiceConnection dealloc](&v3, sel_dealloc);
}

- (void)delegationServicePairingSession:(id)a3 sendData:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *streamWriterQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  streamWriterQueue = self->_streamWriterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(streamWriterQueue, block);

}

- (void)parser:(id)a3 didParseMessage:(id)a4
{
  ICDelegationServicePairingSession *pairingSession;
  _QWORD v5[5];

  if (a4)
  {
    pairingSession = self->_pairingSession;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke;
    v5[3] = &unk_1E438CB80;
    v5[4] = self;
    -[ICDelegationServicePairingSession getDecryptedDataForEncryptedData:withCompletionHandler:](pairingSession, "getDecryptedDataForEncryptedData:withCompletionHandler:", a4, v5);
  }
}

- (ICDelegationServiceConnectionDelegate)delegate
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__17243;
  v10 = __Block_byref_object_dispose__17244;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ICDelegationServiceConnection_delegate__block_invoke;
  v5[3] = &unk_1E4391568;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ICDelegationServiceConnectionDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ICDelegationServiceConnection_setDelegate___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)close
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ICDelegationServiceConnection_close__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICDelegationServiceConnection_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_1E4390E58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(accessQueue, block);

}

- (void)sendResponse:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__ICDelegationServiceConnection_sendResponse_forRequest_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E4390EA8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_barrier_async(accessQueue, v15);

}

- (unsigned)_nextRequestUniqueID
{
  unsigned int *p_nextRequestID;
  unsigned int v3;
  unsigned int result;

  p_nextRequestID = &self->_nextRequestID;
  do
  {
    v3 = __ldaxr(p_nextRequestID);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, p_nextRequestID));
  return result;
}

- (void)_sendMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ICDelegationServicePairingSession *pairingSession;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  ICDelegationServiceConnection *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E4390FE0;
    v12[4] = self;
    v13 = v7;
    -[ICDelegationServicePairingSession getEncryptedDataForData:withCompletionHandler:](pairingSession, "getEncryptedDataForData:withCompletionHandler:", v9, v12);

  }
  else
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Failing to send message as there is no longer a pairing session", buf, 0xCu);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }

}

- (void)_sendRequest:(id)a3 withResponseHandler:(id)a4
{
  _BYTE *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingRequestIDToRequestContext;
  _ICDelegationServiceConnectionPendingRequestContext *v13;
  ICPBDGSMessage *v14;
  ICPBDGSMessage *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  ICDelegationServiceConnection *v23;
  __int16 v24;
  ICPBDGSMessage *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[ICDelegationServiceConnection _nextRequestUniqueID](self, "_nextRequestUniqueID");
  if (v7)
  {
    v7[28] |= 1u;
    *((_DWORD *)v7 + 6) = v9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_pendingRequestIDToRequestContext)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequestIDToRequestContext = self->_pendingRequestIDToRequestContext;
    self->_pendingRequestIDToRequestContext = v11;

  }
  v13 = -[_ICDelegationServiceConnectionPendingRequestContext initWithRequest:responseHandler:]([_ICDelegationServiceConnectionPendingRequestContext alloc], "initWithRequest:responseHandler:", v7, v8);
  -[NSMutableDictionary setObject:forKey:](self->_pendingRequestIDToRequestContext, "setObject:forKey:", v13, v10);
  v14 = objc_alloc_init(ICPBDGSMessage);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_request, a3);
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending request message: %@", buf, 0x16u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke;
  v19[3] = &unk_1E43901D8;
  v19[4] = self;
  v20 = v10;
  v21 = v8;
  v17 = v8;
  v18 = v10;
  -[ICDelegationServiceConnection _sendMessage:withCompletionHandler:](self, "_sendMessage:withCompletionHandler:", v15, v19);

}

- (void)_sendResponse:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  ICPBDGSMessage *v12;
  ICPBDGSMessage *v13;
  NSObject *v14;
  int v15;
  ICDelegationServiceConnection *v16;
  __int16 v17;
  ICPBDGSMessage *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  v10 = v9;
  if (a4)
  {
    v11 = *((_DWORD *)a4 + 6);
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 0;
  if (v9)
  {
LABEL_3:
    *((_BYTE *)v9 + 32) |= 1u;
    *((_DWORD *)v9 + 4) = v11;
  }
LABEL_4:
  v12 = objc_alloc_init(ICPBDGSMessage);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_response, a3);

  v14 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = self;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending response message: %@", (uint8_t *)&v15, 0x16u);
  }

  -[ICDelegationServiceConnection _sendMessage:withCompletionHandler:](self, "_sendMessage:withCompletionHandler:", v13, v8);
}

- (void)_streamDidClose
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *streamReaderQueue;
  NSObject *v7;
  NSObject *streamWriterQueue;
  NSObject *v9;
  void *v10;
  ICDelegationServiceConnectionDelegate *v11;
  NSObject *calloutQueue;
  ICDelegationServiceConnectionDelegate *v13;
  _QWORD v14[4];
  ICDelegationServiceConnectionDelegate *v15;
  ICDelegationServiceConnection *v16;
  _QWORD v17[5];
  NSObject *v18;
  _QWORD block[5];
  NSObject *v20;
  uint8_t buf[4];
  ICDelegationServiceConnection *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Stream did close.", buf, 0xCu);
  }

  if (self->_isStarted)
  {
    self->_isStarted = 0;
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    v5 = MEMORY[0x1E0C809B0];
    streamReaderQueue = self->_streamReaderQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke;
    block[3] = &unk_1E4391110;
    block[4] = self;
    v7 = v4;
    v20 = v7;
    dispatch_async(streamReaderQueue, block);
    dispatch_group_enter(v7);
    streamWriterQueue = self->_streamWriterQueue;
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke_2;
    v17[3] = &unk_1E4391110;
    v17[4] = self;
    v18 = v7;
    v9 = v7;
    dispatch_async(streamWriterQueue, v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7803, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDelegationServiceConnection _finishPendingRequestsWithError:](self, "_finishPendingRequestsWithError:", v10);

    v11 = self->_delegate;
    calloutQueue = self->_calloutQueue;
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke_3;
    v14[3] = &unk_1E4391110;
    v15 = v11;
    v16 = self;
    v13 = v11;
    dispatch_group_notify(v9, calloutQueue, v14);

  }
}

- (void)_streamDidParseMessage:(id)a3
{
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  unsigned int *v7;
  ICDelegationServiceConnectionDelegate *v8;
  NSObject *calloutQueue;
  ICPBDGSResponse *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD block[4];
  ICDelegationServiceConnectionDelegate *v16;
  ICDelegationServiceConnection *v17;
  unsigned int *v18;
  uint8_t buf[4];
  ICDelegationServiceConnection *v20;
  __int16 v21;
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received message: %@", buf, 0x16u);
  }

  if (v4)
  {
    v6 = (void *)v4[1];
    if (v6)
    {
      v7 = v6;
      v8 = self->_delegate;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        calloutQueue = self->_calloutQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke;
        block[3] = &unk_1E4391230;
        v8 = v8;
        v16 = v8;
        v17 = self;
        v7 = v7;
        v18 = v7;
        dispatch_async(calloutQueue, block);

        v10 = (ICPBDGSResponse *)v16;
      }
      else
      {
        v10 = objc_alloc_init(ICPBDGSResponse);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_32;
        v14[3] = &unk_1E438E718;
        v14[4] = self;
        -[ICDelegationServiceConnection _sendResponse:forRequest:withCompletionHandler:](self, "_sendResponse:forRequest:withCompletionHandler:", v10, v7, v14);
      }
LABEL_13:

      goto LABEL_14;
    }
    v11 = (void *)v4[2];
    if (v11)
    {
      v7 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7[4]);
      v8 = (ICDelegationServiceConnectionDelegate *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_pendingRequestIDToRequestContext, "objectForKey:", v8);
      v10 = (ICPBDGSResponse *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_pendingRequestIDToRequestContext, "removeObjectForKey:", v8);
        -[ICPBDGSResponse responseHandler](v10, "responseHandler");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          (*(void (**)(uint64_t, unsigned int *, _QWORD))(v12 + 16))(v12, v7, 0);

      }
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)_finishPendingRequestsWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *pendingRequestIDToRequestContext;
  NSObject *calloutQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  ICDelegationServiceConnection *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Finished pending requests error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished pending requests", buf, 0xCu);
  }

  -[NSMutableDictionary objectEnumerator](self->_pendingRequestIDToRequestContext, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  pendingRequestIDToRequestContext = self->_pendingRequestIDToRequestContext;
  self->_pendingRequestIDToRequestContext = 0;

  calloutQueue = self->_calloutQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__ICDelegationServiceConnection__finishPendingRequestsWithError___block_invoke;
  v14[3] = &unk_1E4391110;
  v15 = v9;
  v16 = v4;
  v12 = v4;
  v13 = v9;
  dispatch_async(calloutQueue, v14);

}

- (void)_streamEncounteredError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICDelegationServiceConnectionDelegate *v7;
  NSObject *calloutQueue;
  _QWORD block[4];
  ICDelegationServiceConnectionDelegate *v10;
  ICDelegationServiceConnection *v11;
  id v12;
  uint8_t buf[4];
  ICDelegationServiceConnection *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Stream encountered error %{public}@", buf, 0x16u);
  }

  if (self->_isStarted)
  {
    self->_isStarted = 0;
    -[MSVStreamWriter stop](self->_streamWriter, "stop");
    -[MSVStreamReader stop](self->_streamReader, "stop");
    if (v4)
    {
      -[ICDelegationServiceConnection _finishPendingRequestsWithError:](self, "_finishPendingRequestsWithError:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7803, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDelegationServiceConnection _finishPendingRequestsWithError:](self, "_finishPendingRequestsWithError:", v6);

    }
    v7 = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__ICDelegationServiceConnection__streamEncounteredError___block_invoke;
      block[3] = &unk_1E4391230;
      v10 = v7;
      v11 = self;
      v12 = v4;
      dispatch_async(calloutQueue, block);

    }
  }

}

- (int64_t)connectionRole
{
  return self->_connectionRole;
}

- (ICDelegationServiceSecuritySettings)securitySettings
{
  return self->_securitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securitySettings, 0);
  objc_storeStrong((id *)&self->_streamWriterQueue, 0);
  objc_storeStrong((id *)&self->_streamWriter, 0);
  objc_storeStrong((id *)&self->_streamReaderQueue, 0);
  objc_storeStrong((id *)&self->_streamReader, 0);
  objc_storeStrong((id *)&self->_pendingRequestIDToRequestContext, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_messageParser, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __57__ICDelegationServiceConnection__streamEncounteredError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegationServiceConnection:didEncouterError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__ICDelegationServiceConnection__finishPendingRequestsWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "responseHandler", (_QWORD)v9);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke(uint64_t a1)
{
  ICPBDGSResponse *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "delegationServiceConnection:didReceiveRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    v2 = objc_alloc_init(ICPBDGSResponse);
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_2;
    v5[3] = &unk_1E438E718;
    v5[4] = v3;
    objc_msgSend(v3, "_sendResponse:forRequest:withCompletionHandler:", v2, v4, v5);

  }
}

void __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_32(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send response message. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send response message. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __48__ICDelegationServiceConnection__streamDidClose__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stop");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __48__ICDelegationServiceConnection__streamDidClose__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stop");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __48__ICDelegationServiceConnection__streamDidClose__block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke_4;
    v6[3] = &unk_1E4391110;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    dispatch_async(v3, v6);

  }
}

uint64_t __48__ICDelegationServiceConnection__streamDidClose__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "delegationServiceConnectionDidClose:", *(_QWORD *)(a1 + 40));
}

void __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(v6 + 8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_2;
    v9[3] = &unk_1E4390EA8;
    v9[4] = v6;
    v10 = v7;
    v12 = *(id *)(a1 + 48);
    v11 = v5;
    dispatch_barrier_async(v8, v9);

  }
}

void __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_3;
    v4[3] = &unk_1E4390EF8;
    v6 = *(id *)(a1 + 56);
    v5 = *(id *)(a1 + 48);
    dispatch_async(v3, v4);

  }
}

void __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0D4D080];
  v4 = a2;
  objc_msgSend(v3, "createHeader:", objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "appendData:", v5);
  objc_msgSend(v6, "appendData:", v4);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 96);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4390E58;
  block[4] = v7;
  v12 = v6;
  v13 = v8;
  v10 = v6;
  dispatch_async(v9, block);

}

void __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "length");
    *(_DWORD *)buf = 138543618;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Writing data of length: %li", buf, 0x16u);
  }

  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_22;
  v10[3] = &unk_1E43908A8;
  v8 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v7, "writeData:withCompletion:", v6, v10);

}

void __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_22(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2_23;
    block[3] = &unk_1E4390B70;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __79__ICDelegationServiceConnection_sendResponse_forRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendResponse:forRequest:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __65__ICDelegationServiceConnection_sendRequest_withResponseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequest:withResponseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ICDelegationServicePairingSession *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD block[5];
  NSObject *v21;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) == 2)
    v2 = 2;
  else
    v2 = 1;
  v3 = -[ICDelegationServicePairingSession initWithRole:securitySettings:]([ICDelegationServicePairingSession alloc], "initWithRole:securitySettings:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDelegate:");
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v9 = *(NSObject **)(v7 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4391110;
  block[4] = v7;
  v10 = v6;
  v21 = v10;
  dispatch_async(v9, block);
  dispatch_group_enter(v10);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(NSObject **)(v11 + 96);
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E4391110;
  v18[4] = v11;
  v19 = v10;
  v13 = v10;
  dispatch_async(v12, v18);
  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_4;
  v16[3] = &unk_1E4390EF8;
  v15 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v15;
  dispatch_group_notify(v13, v14, v16);

}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "start");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "start");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_5;
  v4[3] = &unk_1E4390EF8;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 33))
  {
    v2 = *(void **)(v1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_6;
    v8[3] = &unk_1E43908A8;
    v8[4] = v1;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v2, "prepareEncryptedSessionWithCompletionHandler:", v8);
    v3 = v9;
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    if (!v4)
      return;
    v5 = *(NSObject **)(v1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_9;
    block[3] = &unk_1E4390D18;
    v7 = v4;
    dispatch_async(v5, block);
    v3 = v7;
  }

}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  _QWORD block[5];

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v8 = v6[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_7;
    block[3] = &unk_1E43913D8;
    block[4] = v6;
    dispatch_barrier_async(v8, block);
  }
  else
  {
    objc_msgSend(v6, "close");
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_8;
    v11[3] = &unk_1E4390B70;
    v13 = v9;
    v14 = a2;
    v12 = v5;
    dispatch_async(v10, v11);

  }
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7100, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_7(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

uint64_t __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __38__ICDelegationServiceConnection_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 33))
  {
    *(_BYTE *)(v1 + 33) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = MEMORY[0x1E0C809B0];
    v7 = *(NSObject **)(v5 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__ICDelegationServiceConnection_close__block_invoke_2;
    block[3] = &unk_1E43913D8;
    block[4] = v5;
    dispatch_async(v7, block);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 96);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __38__ICDelegationServiceConnection_close__block_invoke_3;
    v10[3] = &unk_1E43913D8;
    v10[4] = v8;
    dispatch_async(v9, v10);
  }
}

uint64_t __38__ICDelegationServiceConnection_close__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "stop");
}

uint64_t __38__ICDelegationServiceConnection_close__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stop");
}

void __45__ICDelegationServiceConnection_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

void __41__ICDelegationServiceConnection_delegate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICPBDGSMessage *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  ICPBDGSMessage *v8;

  v3 = a2;
  v4 = -[ICPBDGSMessage initWithData:]([ICPBDGSMessage alloc], "initWithData:", v3);

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke_2;
    v7[3] = &unk_1E4391110;
    v7[4] = v5;
    v8 = v4;
    dispatch_barrier_async(v6, v7);

  }
}

uint64_t __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_streamDidParseMessage:", *(_QWORD *)(a1 + 40));
}

void __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "length");
    *(_DWORD *)buf = 138543618;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Writing data of length: %li", buf, 0x16u);
  }

  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_15;
  v10[3] = &unk_1E43908A8;
  v8 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  objc_msgSend(v7, "writeData:withCompletion:", v6, v10);

}

void __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_15(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E4390B70;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[4];
  _QWORD *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered error: %{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_5;
    v7[3] = &unk_1E4391110;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_barrier_async(v6, v7);

  }
}

void __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  uint8_t buf[4];
  _QWORD *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = WeakRetained;
    v12 = 2048;
    v13 = objc_msgSend(v3, "length");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received data of length: %li.", buf, 0x16u);
  }

  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_8;
    v7[3] = &unk_1E4391110;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2_10(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;
  uint8_t buf[4];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished reading.", buf, 0xCu);
  }

  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_11;
    block[3] = &unk_1E43913D8;
    v5 = WeakRetained;
    dispatch_barrier_async(v3, block);

  }
}

uint64_t __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_streamDidClose");
}

uint64_t __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_8(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 32))
    return objc_msgSend(*(id *)(v1 + 40), "processData:", *(_QWORD *)(result + 40));
  if (*(_BYTE *)(v1 + 33))
    return objc_msgSend(*(id *)(v1 + 56), "receievedData:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_streamEncounteredError:", *(_QWORD *)(a1 + 40));
}

@end
