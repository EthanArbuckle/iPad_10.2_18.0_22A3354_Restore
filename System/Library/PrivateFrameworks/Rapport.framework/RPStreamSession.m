@implementation RPStreamSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStreamSession)init
{
  RPStreamSession *v2;
  RPStreamSession *v3;
  RPStreamSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPStreamSession;
  v2 = -[RPStreamSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_streamSocket = -1;
    v4 = v3;
  }

  return v3;
}

- (RPStreamSession)initWithCoder:(id)a3
{
  id v4;
  RPStreamSession *v5;
  RPStreamSession *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int streamFlags;
  id v14;
  id v15;
  void *v16;
  void *v17;
  RPStreamSession *v18;
  objc_super v20;
  uint64_t v21;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RPStreamSession;
  v5 = -[RPStreamSession init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_streamSocket = -1;
    v7 = v4;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("dpUPID")))
      v6->_delegatedProcessUPID = objc_msgSend(v7, "decodeInt64ForKey:", CFSTR("dpUPID"));

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    if (objc_msgSend(v11, "containsValueForKey:", CFSTR("serverMode")))
      v6->_serverMode = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("serverMode"));

    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = 0;
    if ((NSDecodeSInt64RangedIfPresent() & 1) != 0)
      LOBYTE(streamFlags) = v21;
    else
      streamFlags = v6->_streamFlags;
    v6->_streamFlags = streamFlags & 2;
    v14 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_streamType = v21;
    v21 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_streamQoS = v21;
    if (objc_msgSend(v15, "containsValueForKey:", CFSTR("streamSocket")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81318], CFSTR("streamSocket"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v6->_streamSocket = xpc_fd_dup(v16);

      }
    }
    v18 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t delegatedProcessUPID;
  NSString *destinationString;
  NSUUID *nwClientID;
  NSData *pskData;
  NSString *serviceType;
  NSString *streamID;
  NSData *streamKey;
  uint64_t streamType;
  uint64_t streamQoS;
  int streamSocket;
  char isKindOfClass;
  xpc_object_t v17;
  void *v18;

  v4 = a3;
  v5 = v4;
  delegatedProcessUPID = self->_delegatedProcessUPID;
  v18 = v4;
  if (delegatedProcessUPID)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", delegatedProcessUPID, CFSTR("dpUPID"));
    v5 = v18;
  }
  destinationString = self->_destinationString;
  if (destinationString)
  {
    objc_msgSend(v5, "encodeObject:forKey:", destinationString, CFSTR("dstS"));
    v5 = v18;
  }
  nwClientID = self->_nwClientID;
  if (nwClientID)
  {
    objc_msgSend(v5, "encodeObject:forKey:", nwClientID, CFSTR("nwClientID"));
    v5 = v18;
  }
  pskData = self->_pskData;
  if (pskData)
  {
    objc_msgSend(v5, "encodeObject:forKey:", pskData, CFSTR("pskD"));
    v5 = v18;
  }
  if (self->_serverMode)
  {
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("serverMode"));
    v5 = v18;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v5, "encodeObject:forKey:", serviceType, CFSTR("streamSrv"));
    v5 = v18;
  }
  if ((self->_streamFlags & 2) != 0)
  {
    objc_msgSend(v5, "encodeInt64:forKey:");
    v5 = v18;
  }
  streamID = self->_streamID;
  if (streamID)
  {
    objc_msgSend(v5, "encodeObject:forKey:", streamID, CFSTR("streamID"));
    v5 = v18;
  }
  streamKey = self->_streamKey;
  if (streamKey)
  {
    objc_msgSend(v5, "encodeObject:forKey:", streamKey, CFSTR("streamKey"));
    v5 = v18;
  }
  streamType = self->_streamType;
  if ((_DWORD)streamType)
  {
    objc_msgSend(v5, "encodeInteger:forKey:", streamType, CFSTR("streamType"));
    v5 = v18;
  }
  streamQoS = self->_streamQoS;
  if ((_DWORD)streamQoS)
  {
    objc_msgSend(v5, "encodeInteger:forKey:", streamQoS, CFSTR("streamQoS"));
    v5 = v18;
  }
  streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v18;
    if ((isKindOfClass & 1) != 0)
    {
      v17 = xpc_fd_create(streamSocket);
      objc_msgSend(v18, "encodeXPCObject:forKey:", v17, CFSTR("streamSocket"));

      v5 = v18;
    }
  }

}

- (void)dealloc
{
  int streamSocket;
  objc_super v4;

  memset_s(self->_ourCurveSK, 0x20uLL, 0, 0x20uLL);
  streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    if (close(streamSocket) && *__error())
      __error();
    self->_streamSocket = -1;
  }
  -[RPStreamSession _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)RPStreamSession;
  -[RPStreamSession dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPStreamSession descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *serviceType;
  id v8;
  id v10;
  id v11;
  id v12;
  NSString *v14;
  void *v15;

  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  if (self->_streamType)
  {
    v15 = v4;
    NSAppendPrintF();
    v6 = v15;

    v5 = v6;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v14 = serviceType;
    NSAppendPrintF();
    v8 = v5;

    v5 = v8;
  }
  if (self->_streamQoS)
  {
    NSAppendPrintF();
    v10 = v5;

    v5 = v10;
  }
  if (self->_statusFlags)
  {
    NSAppendPrintF();
    v11 = v5;

    v5 = v11;
  }
  if (self->_trafficFlags)
  {
    NSAppendPrintF();
    v12 = v5;

    v5 = v12;
  }
  return v5;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_trafficFlags != a3)
  {
    self->_trafficFlags = a3;
    if (self->_trafficRegistrationCalled)
    {
      if (gLogCategory_RPStreamSession <= 30
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__RPStreamSession_setTrafficFlags___block_invoke;
      block[3] = &unk_1E5F4EC60;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
}

uint64_t __35__RPStreamSession_setTrafficFlags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTrafficRegistration");
}

- (void)setStreamQoS:(int)a3
{
  int streamQoS;
  const char *v6;
  const char *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t streamSocket;
  const char *v12;
  const char *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  streamQoS = self->_streamQoS;
  if (streamQoS != a3)
  {
    if (gLogCategory_RPStreamSession > 30)
      goto LABEL_28;
    if (gLogCategory_RPStreamSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_28;
      streamQoS = self->_streamQoS;
    }
    v6 = "Default";
    switch(streamQoS)
    {
      case 0:
        break;
      case 1:
        v6 = "Background";
        break;
      case 2:
        v6 = "Video";
        break;
      case 3:
        v6 = "Voice";
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_11;
      case 10:
        v6 = "AirPlayAudio";
        break;
      case 11:
        v6 = "AirPlayScreenAudio";
        break;
      case 12:
        v6 = "AirPlayScreenVideo";
        break;
      default:
        if (streamQoS == 20)
          v6 = "NTP";
        else
LABEL_11:
          v6 = "?";
        break;
    }
    v7 = "Default";
    switch(a3)
    {
      case 0:
        break;
      case 1:
        v7 = "Background";
        break;
      case 2:
        v7 = "Video";
        break;
      case 3:
        v7 = "Voice";
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_21;
      case 10:
        v7 = "AirPlayAudio";
        break;
      case 11:
        v7 = "AirPlayScreenAudio";
        break;
      case 12:
        v7 = "AirPlayScreenVideo";
        break;
      default:
        if (a3 == 20)
          v7 = "NTP";
        else
LABEL_21:
          v7 = "?";
        break;
    }
    v12 = v6;
    v13 = v7;
    LogPrintF();
LABEL_28:
    self->_streamQoS = a3;
    -[RPConnection tcpConnection](self->_rpCnx, "tcpConnection", v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "socketFD");

    if (v9 < 0)
    {
      streamSocket = self->_streamSocket;
      if ((streamSocket & 0x80000000) != 0)
        return;
    }
    else
    {
      -[RPConnection tcpConnection](self->_rpCnx, "tcpConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      streamSocket = objc_msgSend(v10, "socketFD");

      if ((streamSocket & 0x80000000) != 0)
        return;
    }
    -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", streamSocket);
  }
}

- (void)setStreamQoSOnSocket:(int)a3
{
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  SocketSetQoS();
}

- (void)acceptedByServer
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__RPStreamSession_acceptedByServer__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPStreamSession_acceptedByServer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTrafficRegistration");
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__RPStreamSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __42__RPStreamSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(v2 + 144) & 0x80000000) == 0
    || *(_QWORD *)(v2 + 288) && *(_QWORD *)(v2 + 296)
    || *(_QWORD *)(v2 + 208))
  {
    v3 = 1;
  }
  else
  {
    if (!*(_QWORD *)(v2 + 200))
    {
LABEL_19:
      RPErrorF();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

      return;
    }
    v3 = 0;
  }
  if (!*(_QWORD *)(v2 + 264))
    goto LABEL_19;
  objc_msgSend(*(id *)(v2 + 200), "setServiceType:", *(_QWORD *)(v2 + 240));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_DWORD *)(v4 + 148);
  if (v5 != 3)
  {
    if (v5 == 2)
    {
      if (*(_BYTE *)(v4 + 136))
      {
        v10 = 0;
        objc_msgSend((id)v4, "_startServerConnectionAndReturnError:", &v10);
        v7 = v10;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        v8 = *(_QWORD *)(a1 + 40);
        if (v3)
          objc_msgSend((id)v4, "_clientRPConnectionStartWithCompletion:", v8);
        else
          objc_msgSend((id)v4, "_clientRPConnectionPrepareWithCompletion:", v8);
      }
      return;
    }
    if (v5 == 1)
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (!v3)
      {
        objc_msgSend((id)v4, "_clientUDPSocketStartWithCompletion:", v6);
        return;
      }
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
LABEL_16:
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    return;
  }
  objc_msgSend((id)v4, "_clientUDPNWPathStartWithCompletion:", v6);
}

- (void)activateForServerRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v11 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v11;
  if (!v11)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v13 = self->_dispatchQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__RPStreamSession_activateForServerRequest_options_responseHandler___block_invoke;
  v17[3] = &unk_1E5F4F608;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

}

void __68__RPStreamSession_activateForServerRequest_options_responseHandler___block_invoke(_QWORD *a1)
{
  _DWORD *v2;
  int v3;
  id v4;

  *(_BYTE *)(a1[4] + 136) = 1;
  objc_msgSend(*(id *)(a1[4] + 200), "setServiceType:", *(_QWORD *)(a1[4] + 240));
  v2 = (_DWORD *)a1[4];
  v3 = v2[37];
  switch(v3)
  {
    case 3:
      objc_msgSend(v2, "_serverUDPNWPathStartRequest:options:responseHandler:", a1[5], a1[6], a1[7]);
      break;
    case 2:
      objc_msgSend(v2, "_serverRPConnectionStartRequest:options:responseHandler:", a1[5], a1[6], a1[7]);
      break;
    case 1:
      objc_msgSend(v2, "_serverUDPSocketStartRequest:options:responseHandler:", a1[5], a1[6], a1[7]);
      break;
    default:
      RPErrorF();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*(void (**)(_QWORD))(a1[7] + 16))(a1[7]);

      break;
  }
}

- (void)prepareWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__RPStreamSession_prepareWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __41__RPStreamSession_prepareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 200) && *(_QWORD *)(v2 + 264))
  {
    v3 = *(_DWORD *)(v2 + 148);
    switch(v3)
    {
      case 3:
        objc_msgSend((id)v2, "_clientUDPNWPathStartWithCompletion:", *(_QWORD *)(a1 + 40));
        return;
      case 2:
        *(_BYTE *)(v2 + 96) = 1;
        objc_msgSend(*(id *)(a1 + 32), "_clientRPConnectionPrepareWithCompletion:", *(_QWORD *)(a1 + 40));
        return;
      case 1:
        objc_msgSend((id)v2, "_clientUDPSocketStartWithCompletion:", *(_QWORD *)(a1 + 40));
        return;
    }
  }
  RPErrorF();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (void)startServerConnectionWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__RPStreamSession_startServerConnectionWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__RPStreamSession_startServerConnectionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "_startServerConnectionAndReturnError:", &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_startServerConnectionAndReturnError:(id *)a3
{
  uint64_t streamType;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  RPConnection *v16;
  void *v17;
  NSData *pskData;
  uint64_t v19;
  RPConnection *rpCnx;
  RPConnection *v21;
  id v23;
  const char *v24;
  uint64_t streamSocket;
  const char *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  socklen_t v33;
  sockaddr v34;
  uint64_t v35;
  int v36;

  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    streamType = self->_streamType;
    if (streamType > 3)
      v6 = "?";
    else
      v6 = off_1E5F510C0[streamType];
    v7 = "yes";
    if (!self->_pskData)
      v7 = "no";
    streamSocket = self->_streamSocket;
    v26 = v7;
    v24 = v6;
    LogPrintF();
  }
  v8 = self->_streamSocket;
  if ((v8 & 0x80000000) != 0)
  {
    RPErrorF();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (a3)
      *a3 = objc_retainAutorelease(v15);

    return 0;
  }
  else
  {
    *(_QWORD *)&v34.sa_len = 0;
    *(_QWORD *)&v34.sa_data[6] = 0;
    v36 = 0;
    v35 = 0;
    v33 = 28;
    getsockname(v8, &v34, &v33);
    v9 = objc_alloc_init(MEMORY[0x1E0D1B460]);
    objc_msgSend(v9, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v9, "setFlags:", 137);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Stream-%u"), SockAddrGetPort());
    objc_msgSend(v9, "setLabel:", v10);

    objc_msgSend(v9, "setSocketFD:", v8);
    self->_streamSocket = -1;
    if (self->_streamQoS >= 1)
      -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", v8);
    v32 = 0;
    objc_msgSend(v9, "activateDirectAndReturnError:", &v32);
    v11 = v32;
    v12 = v11 == 0;
    if (v11)
    {
      v13 = v11;
      RPErrorF();
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        v23 = v14;
        LogPrintF();
      }
      objc_msgSend(v9, "invalidate", v23, v24, streamSocket, v26);
      if (a3)
      {
        v14 = objc_retainAutorelease(v14);
        *a3 = v14;
      }
    }
    else
    {
      v16 = objc_alloc_init(RPConnection);
      -[RPConnection setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
      -[RPConnection setFlags:](v16, "setFlags:", -[RPConnection flags](v16, "flags") | 0x80000);
      objc_msgSend(v9, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPConnection setLabel:](v16, "setLabel:", v17);

      -[RPConnection setPskData:](v16, "setPskData:", self->_pskData);
      pskData = self->_pskData;
      self->_pskData = 0;

      -[RPConnection setTcpConnection:](v16, "setTcpConnection:", v9);
      v19 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke;
      v31[3] = &unk_1E5F4EC60;
      v31[4] = self;
      -[RPConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v31);
      v30[0] = v19;
      v30[1] = 3221225472;
      v30[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_2;
      v30[3] = &unk_1E5F502D8;
      v30[4] = self;
      -[RPConnection setReceivedEventHandler:](v16, "setReceivedEventHandler:", v30);
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_3;
      v29[3] = &unk_1E5F50300;
      v29[4] = self;
      -[RPConnection setReceivedRequestHandler:](v16, "setReceivedRequestHandler:", v29);
      v28[0] = v19;
      v28[1] = 3221225472;
      v28[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_4;
      v28[3] = &unk_1E5F50178;
      v28[4] = self;
      -[RPConnection setStateChangedHandler:](v16, "setStateChangedHandler:", v28);
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_5;
      v27[3] = &unk_1E5F4ECD0;
      v27[4] = self;
      -[RPConnection setReadErrorHandler:](v16, "setReadErrorHandler:", v27);
      rpCnx = self->_rpCnx;
      self->_rpCnx = v16;
      v21 = v16;

      -[RPConnection activate](v21, "activate");
      v14 = 0;
    }

  }
  return v12;
}

uint64_t __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);

}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);

}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_4(uint64_t a1, int a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionReadyHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

void __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = a2;
  if (objc_msgSend(v3, "code") == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    v4 = (void *)MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
    if (v4)
    {
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_6;
      block[3] = &unk_1E5F50F18;
      block[4] = v4;
      dispatch_async(v5, block);
    }

  }
}

uint64_t __56__RPStreamSession__startServerConnectionAndReturnError___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RPStreamSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPStreamSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  uint64_t streamType;
  const char *v4;
  OS_nw_path_evaluator *nwPathEvaluator;
  OS_nw_path_evaluator *v6;
  OS_nw_path_evaluator *v7;
  OS_nw_listener *nwListener;
  NSObject *v9;
  OS_nw_listener *v10;
  int streamSocket;
  CUWiFiManager *wifiManager;
  NSString *streamID;
  const char *v14;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      streamType = self->_streamType;
      if (streamType > 3)
        v4 = "?";
      else
        v4 = off_1E5F510C0[streamType];
      streamID = self->_streamID;
      v14 = v4;
      LogPrintF();
    }
    nwPathEvaluator = self->_nwPathEvaluator;
    if (nwPathEvaluator)
    {
      v6 = nwPathEvaluator;
      nw_path_evaluator_cancel();
      v7 = self->_nwPathEvaluator;
      self->_nwPathEvaluator = 0;

    }
    nwListener = self->_nwListener;
    if (nwListener)
    {
      v9 = nwListener;
      nw_listener_cancel(v9);
      v10 = self->_nwListener;
      self->_nwListener = 0;

    }
    -[RPConnection invalidate](self->_rpCnx, "invalidate", streamID, v14);
    streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0)
    {
      if (close(streamSocket))
      {
        if (*__error())
          __error();
      }
      self->_streamSocket = -1;
    }
    -[CUTCPServer invalidate](self->_tcpServer, "invalidate");
    -[CUWiFiManager invalidate](self->_wifiManager, "invalidate");
    wifiManager = self->_wifiManager;
    self->_wifiManager = 0;

    -[RPStreamSession _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  uint64_t v3;
  void *v4;
  id disconnectHandler;
  id invalidationHandler;
  RPMessageable *messenger;
  id receivedEventHandler;
  id receivedRequestHandler;
  id statusChangedHandler;
  id streamAcceptHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_rpCnx && !self->_tcpServer)
  {
    v3 = MEMORY[0x1AF45BE48](self->_invalidationHandler);
    v4 = (void *)v3;
    if (v3)
      (*(void (**)(uint64_t))(v3 + 16))(v3);

    disconnectHandler = self->_disconnectHandler;
    self->_disconnectHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    messenger = self->_messenger;
    self->_messenger = 0;

    receivedEventHandler = self->_receivedEventHandler;
    self->_receivedEventHandler = 0;

    receivedRequestHandler = self->_receivedRequestHandler;
    self->_receivedRequestHandler = 0;

    statusChangedHandler = self->_statusChangedHandler;
    self->_statusChangedHandler = 0;

    streamAcceptHandler = self->_streamAcceptHandler;
    self->_streamAcceptHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_clientUDPNWPathStartWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  RPMessageable *v8;
  _BOOL4 v9;
  NSObject *secure_udp;
  NSObject *v11;
  void *v12;
  OS_nw_listener *v13;
  OS_nw_listener *v14;
  nw_listener_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[6];
  NSObject *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v5 = MEMORY[0x1E0C809B0];
  v35 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke;
  v27[3] = &unk_1E5F50DE8;
  v29 = &v30;
  v6 = v4;
  v28 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v27);
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = self->_messenger;
    v9 = -[RPMessageable linkType](v8, "linkType") == 4;

  }
  else
  {
    v9 = 0;
  }
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
  if (!secure_udp)
  {
    RPErrorF();
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = v31[5];
    v31[5] = v16;
    goto LABEL_24;
  }
  nw_parameters_set_allow_duplicate_state_updates();
  v11 = 0;
  v12 = 0;
  v26 = 0;
  if (!v9)
    goto LABEL_15;
  if ((self->_streamFlags & 2) == 0)
    goto LABEL_11;
  -[RPStreamSession _lowLatencySelfAddressString:](self, "_lowLatencySelfAddressString:", &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_11:
    v11 = 0;
    v12 = 0;
LABEL_15:
    v13 = self->_nwListener;
    v14 = v13;
    if (v13)
      nw_listener_cancel((nw_listener_t)v13);

    v15 = nw_listener_create(secure_udp);
    objc_storeStrong((id *)&self->_nwListener, v15);
    if (v15)
    {
      nw_listener_set_queue(v15, (dispatch_queue_t)self->_dispatchQueue);
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__71;
      v24[4] = __Block_byref_object_dispose__72;
      v25 = (id)MEMORY[0x1AF45BE48](v6);
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_73;
      v20[3] = &unk_1E5F50F40;
      v20[4] = v15;
      v20[5] = self;
      v23 = v24;
      v11 = v11;
      v21 = v11;
      v22 = v26;
      MEMORY[0x1AF45BBA8](v15, v20);
      nw_listener_set_new_connection_handler(v15, &__block_literal_global_16);
      if (gLogCategory_RPStreamSession <= 30
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      nw_listener_start(v15);

      _Block_object_dispose(v24, 8);
    }
    else
    {
      RPErrorF();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v31[5];
      v31[5] = v17;

    }
    goto LABEL_23;
  }
  v11 = nw_interface_create_with_name();
  if (v11)
  {
    nw_parameters_require_interface(secure_udp, v11);
    goto LABEL_15;
  }
  RPErrorF();
  v19 = objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v15 = (nw_listener_t)v31[5];
  v31[5] = v19;
LABEL_23:

LABEL_24:
  v7[2](v7);

  _Block_object_dispose(&v30, 8);
}

uint64_t __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_73(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;

  v5 = a3;
  v6 = v5;
  if (gLogCategory_RPStreamSession <= 30)
  {
    v13 = v5;
    if (gLogCategory_RPStreamSession != -1 || (v7 = _LogCategory_Initialize(), v6 = v13, v7))
    {
      LogPrintF();
      v6 = v13;
    }
  }
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
  {
    if (a2 == 3 || v6)
    {
      v14 = v6;
      if (v6)
        v8 = nw_error_copy_cf_error(v6);
      else
        v8 = 0;
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(_QWORD *)(v9 + 40);
      if (!v10)
      {
        v12 = 0;
        goto LABEL_23;
      }
      RPNestedErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

LABEL_21:
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v9 + 40);
LABEL_23:
      *(_QWORD *)(v9 + 40) = 0;

LABEL_24:
      v6 = v14;
      goto LABEL_25;
    }
    if ((a2 - 1) <= 1 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v14 = 0;
      v8 = (void *)nw_listener_copy_local_endpoint();
      if (!v8)
      {
        if (gLogCategory_RPStreamSession <= 90
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_24;
      }
      objc_msgSend(*(id *)(a1 + 40), "_clientUDPNWPathNextWithEndpoint:nwInterface:selfMACData:usb:completion:", v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      goto LABEL_21;
    }
  }
LABEL_25:

}

void __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  int v3;
  NSObject *v4;

  v2 = a2;
  v4 = v2;
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1 || (v3 = _LogCategory_Initialize(), v2 = v4, v3))
    {
      LogPrintF();
      v2 = v4;
    }
  }
  nw_connection_cancel(v2);

}

- (void)_clientUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 usb:(BOOL)a6 completion:(id)a7
{
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  const sockaddr *address;
  int sa_family;
  void *v18;
  void *v19;
  uint64_t Port;
  uint64_t streamType;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *serviceType;
  RPMessageable *messenger;
  id v31;
  NSString *streamID;
  const char *v33;
  uint64_t streamFlags;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD v40[5];
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  address = nw_endpoint_get_address(v12);
  if (address)
  {
    sa_family = address->sa_family;
    if (sa_family == 30)
    {
      if (!*(_DWORD *)&address->sa_data[6]
        && !*(_DWORD *)&address->sa_data[10]
        && !*(_DWORD *)&address[1].sa_len
        && !*(_DWORD *)&address[1].sa_data[2])
      {
        goto LABEL_5;
      }
    }
    else if (sa_family == 2 && !*(_DWORD *)&address->sa_data[2])
    {
LABEL_5:
      v18 = 0;
      goto LABEL_14;
    }
    v46[0] = 0;
    SockAddrToString();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    Port = SockAddrGetPort();
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      streamType = self->_streamType;
      if (streamType > 3)
        v22 = "?";
      else
        v22 = off_1E5F510C0[streamType];
      v38 = v12;
      v39 = Port;
      v36 = v18;
      v37 = v14;
      streamFlags = self->_streamFlags;
      v35 = &unk_1AF3085F2;
      streamID = self->_streamID;
      v33 = v22;
      LogPrintF();
    }
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = v23;
    if (v18)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, CFSTR("_streamAddr"));
    if (v14)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, CFSTR("_streamMACAddr"));
    if (self->_streamFlags)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("_streamFlags"));

    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", self->_streamID, CFSTR("_streamID"), streamID, v33, streamFlags, v35, v36, v37, v38, v39);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Port);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("_streamPort"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_streamType);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("_streamType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trafficFlags);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("_tf"));

    serviceType = self->_serviceType;
    if (serviceType)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", serviceType, CFSTR("_streamSrv"));
    messenger = self->_messenger;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __91__RPStreamSession__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion___block_invoke;
    v40[3] = &unk_1E5F50F88;
    v44 = v15;
    v40[4] = self;
    v41 = v12;
    v42 = v13;
    v43 = v18;
    v45 = a6;
    v31 = v18;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_streamStart"), v24, CFSTR("rapport:rdid:DirectPeer"), 0, v40);

    goto LABEL_33;
  }
  RPErrorF();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *))v15 + 2))(v15, v19);

LABEL_33:
}

void __91__RPStreamSession__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v12 = v7;
  if (!v12 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = *(_QWORD *)(a1 + 64);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }
    else
    {
      RPErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientUDPNWPathStartResponse:options:localEndpoint:nwInterface:selfIPString:usb:completion:", v12, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));
  }

}

- (void)_clientUDPNWPathStartResponse:(id)a3 options:(id)a4 localEndpoint:(id)a5 nwInterface:(id)a6 selfIPString:(id)a7 usb:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t address_with_ethernet;
  NSObject *legacy_tcp_socket;
  nw_parameters_t secure_udp;
  NSObject *v32;
  NSObject *options;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *nwPathEvaluator;
  NSUUID *v36;
  NSUUID *nwClientID;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *local_endpoint;
  NSObject *interface;
  id v48;
  id v49;
  sockaddr address;
  uint64_t v51;
  int v52;
  _QWORD v53[4];
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];

  v9 = a8;
  v62[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v48 = a4;
  local_endpoint = a5;
  interface = a6;
  v49 = a7;
  v16 = a9;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__4;
  v60 = __Block_byref_object_dispose__4;
  v61 = 0;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke;
  v53[3] = &unk_1E5F50DE8;
  v55 = &v56;
  v17 = v16;
  v54 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v53);
  CFStringGetTypeID();
  if (!objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String"))
  {
    RPErrorF();
    v38 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v57[5];
    v57[5] = v38;
    goto LABEL_40;
  }
  if (stristr() || stristr())
  {
    StringToSockAddr();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if (v49)
        v21 = CFSTR("%llw0");
      else
        v21 = CFSTR("%awdl0");
      objc_msgSend(v19, "stringByAppendingString:", v21);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = objc_msgSend(v22, "UTF8String");

      if (!v23)
      {
        RPErrorF();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v57[5];
        v57[5] = v41;

        goto LABEL_40;
      }
    }
    else if (v49
           && gLogCategory_RPStreamSession <= 30
           && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v20, "length") >= 0x20)
    objc_storeStrong((id *)&self->_streamKey, v20);
  CFDictionaryGetCFDataOfLength();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CFDictionaryGetInt64Ranged())
  {
    RPErrorF();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v57[5];
    v57[5] = v39;

    goto LABEL_39;
  }
  *(_QWORD *)&address.sa_len = 0;
  *(_QWORD *)&address.sa_data[6] = 0;
  v52 = 0;
  v51 = 0;
  if (!StringToSockAddr())
  {
    SockAddrSetPort();
    if (!SockAddrConvertToIPv6())
    {
      if (v24)
      {
        WORD2(v62[0]) = 0;
        LODWORD(v62[0]) = 0;
        v27 = objc_msgSend(objc_retainAutorelease(v24), "bytes");
        v28 = *(_DWORD *)v27;
        WORD2(v62[0]) = *(_WORD *)(v27 + 4);
        LODWORD(v62[0]) = v28;
        address_with_ethernet = nw_endpoint_create_address_with_ethernet();
      }
      else
      {
        address_with_ethernet = (uint64_t)nw_endpoint_create_address(&address);
      }
      v26 = (void *)address_with_ethernet;
      if (address_with_ethernet)
      {
        -[RPStreamSession _updateTrafficRegistrationForIP:](self, "_updateTrafficRegistrationForIP:", &address);
        if (v9)
        {
          legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
          secure_udp = legacy_tcp_socket;
          if (legacy_tcp_socket)
          {
            v32 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
            if (!v32)
            {
LABEL_47:
              RPErrorF();
              v43 = objc_claimAutoreleasedReturnValue();
              v44 = (void *)v57[5];
              v57[5] = v43;

LABEL_37:
              goto LABEL_38;
            }
            options = nw_udp_create_options();
            nw_udp_options_set_no_metadata();
            nw_protocol_stack_set_transport_protocol(v32, options);

LABEL_29:
            nw_parameters_set_delegated_unique_pid();
            nw_parameters_set_reuse_local_address(secure_udp, 1);
            if (interface)
              nw_parameters_require_interface(secure_udp, interface);
            nw_parameters_set_local_endpoint(secure_udp, local_endpoint);
            evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
            nwPathEvaluator = self->_nwPathEvaluator;
            self->_nwPathEvaluator = evaluator_for_endpoint;

            if (self->_nwPathEvaluator)
            {
              v62[0] = 0;
              v62[1] = 0;
              nw_path_evaluator_get_client_id();
              v36 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v62);
              nwClientID = self->_nwClientID;
              self->_nwClientID = v36;

              if (gLogCategory_RPStreamSession <= 30
                && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
              goto LABEL_37;
            }
            goto LABEL_47;
          }
        }
        else
        {
          secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], &__block_literal_global_126);
          if (secure_udp)
            goto LABEL_29;
        }
      }
      RPErrorF();
      v45 = objc_claimAutoreleasedReturnValue();
      secure_udp = (nw_parameters_t)v57[5];
      v57[5] = v45;
      goto LABEL_37;
    }
  }
  RPErrorF();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v57[5];
  v57[5] = v25;
LABEL_38:

LABEL_39:
LABEL_40:

  v18[2](v18);
  _Block_object_dispose(&v56, 8);

}

uint64_t __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __111__RPStreamSession__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion___block_invoke_2()
{
  return nw_udp_options_set_no_metadata();
}

- (void)_serverUDPNWPathStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  uint64_t streamType;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *secure_udp;
  uint64_t v27;
  NSObject *v28;
  OS_nw_listener *v29;
  OS_nw_listener *v30;
  nw_listener_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSString *streamID;
  const char *v46;
  uint64_t streamFlags;
  void *v48;
  uint64_t trafficFlags;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[6];
  NSObject *v55;
  id v56;
  void *v57;
  _QWORD *v58;
  _OWORD v59[2];
  _QWORD v60[5];
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  _OWORD v68[2];
  id v69;
  _QWORD v70[4];
  id v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__4;
  v77 = __Block_byref_object_dispose__4;
  v11 = MEMORY[0x1E0C809B0];
  v78 = 0;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke;
  v70[3] = &unk_1E5F50DE8;
  v72 = &v73;
  v53 = v10;
  v71 = v53;
  v12 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v70);
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    streamType = self->_streamType;
    if (streamType > 3)
      v14 = "?";
    else
      v14 = off_1E5F510C0[streamType];
    trafficFlags = self->_trafficFlags;
    v50 = &unk_1AF30857F;
    streamFlags = self->_streamFlags;
    v48 = &unk_1AF3085F2;
    streamID = self->_streamID;
    v46 = v14;
    LogPrintF();
  }
  v69 = 0;
  CFStringGetTypeID();
  if (!objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String"))
  {
    RPErrorF();
    v35 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v74[5];
    v74[5] = v35;
    goto LABEL_54;
  }
  if (!stristr() && !stristr())
  {
    v22 = 0;
    goto LABEL_21;
  }
  StringToSockAddr();
  if ((self->_streamFlags & 2) != 0)
  {
    -[RPStreamSession _lowLatencySelfAddressString:](self, "_lowLatencySelfAddressString:", &v69);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_15;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v15 = 0;
LABEL_15:
  v16 = (void *)v15;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (v16)
      v19 = CFSTR("%llw0");
    else
      v19 = CFSTR("%awdl0");
    objc_msgSend(v17, "stringByAppendingString:", v19, streamID, v46, streamFlags, v48, trafficFlags, v50);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");

    if (!v21)
    {
      RPErrorF();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v74[5];
      v74[5] = v42;

      v22 = v16;
      goto LABEL_54;
    }
  }
  else if (v16
         && gLogCategory_RPStreamSession <= 30
         && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  v22 = v16;
LABEL_21:
  memset(v68, 0, 28);
  v67 = 0;
  v66 = StringToSockAddr();
  if ((_DWORD)v66)
  {
    RPErrorF();
    v36 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v74[5];
    v74[5] = v36;

    goto LABEL_54;
  }
  CFDictionaryGetCFDataOfLength();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!CFDictionaryGetInt64Ranged())
  {
    RPErrorF();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v74[5];
    v74[5] = v37;

    goto LABEL_53;
  }
  SockAddrSetPort();
  self->_trafficFlags = CFDictionaryGetInt64Ranged();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "stringByAppendingString:", CFSTR("%llw0"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v24, "UTF8String");

    if (v25)
      goto LABEL_25;
  }
  else
  {
    CFStringGetTypeID();
    if (objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String"))
    {
LABEL_25:
      v62 = 0;
      v63 = 0;
      v65 = 0;
      v64 = 0;
      v22 = v23;
      LODWORD(v66) = StringToSockAddr();
      if ((_DWORD)v66)
      {
        RPErrorF();
        v39 = objc_claimAutoreleasedReturnValue();
        secure_udp = v74[5];
        v74[5] = v39;
        goto LABEL_52;
      }
      secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
      if (secure_udp)
      {
        nw_parameters_set_allow_duplicate_state_updates();
        v27 = v11;
        v28 = 0;
        if (!v23 || (self->_streamFlags & 2) == 0)
          goto LABEL_31;
        v28 = nw_interface_create_with_name();
        if (v28)
        {
          nw_parameters_require_interface(secure_udp, v28);
LABEL_31:
          v29 = self->_nwListener;
          v30 = v29;
          if (v29)
            nw_listener_cancel((nw_listener_t)v29);

          v31 = nw_listener_create(secure_udp);
          objc_storeStrong((id *)&self->_nwListener, v31);
          if (v31)
          {
            nw_listener_set_queue(v31, (dispatch_queue_t)self->_dispatchQueue);
            v60[0] = 0;
            v60[1] = v60;
            v60[2] = 0x3032000000;
            v60[3] = __Block_byref_object_copy__71;
            v60[4] = __Block_byref_object_dispose__72;
            v61 = (id)MEMORY[0x1AF45BE48](v53);
            v54[0] = v27;
            v54[1] = 3221225472;
            v54[2] = __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_2;
            v54[3] = &unk_1E5F50FD0;
            v54[4] = v31;
            v54[5] = self;
            v58 = v60;
            v55 = v28;
            v32 = v69;
            v59[0] = v68[0];
            *(_OWORD *)((char *)v59 + 12) = *(_OWORD *)((char *)v68 + 12);
            v56 = v32;
            v57 = v51;
            MEMORY[0x1AF45BBA8](v31, v54);
            v22 = v23;
            nw_listener_set_new_connection_handler(v31, &__block_literal_global_140);
            if (gLogCategory_RPStreamSession <= 30
              && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            nw_listener_start(v31);

            _Block_object_dispose(v60, 8);
          }
          else
          {
            RPErrorF();
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v74[5];
            v74[5] = v40;

            v22 = v23;
          }

          goto LABEL_51;
        }
      }
      RPErrorF();
      v44 = objc_claimAutoreleasedReturnValue();
      v28 = v74[5];
      v74[5] = v44;
LABEL_51:

LABEL_52:
      goto LABEL_53;
    }
  }
  RPErrorF();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v74[5];
  v74[5] = v33;

  v22 = v23;
LABEL_53:

LABEL_54:
  v12[2](v12);

  _Block_object_dispose(&v73, 8);
}

uint64_t __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _OWORD v16[2];

  v5 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
  {
    if (a2 == 3 || v5)
    {
      if (v5)
        v6 = nw_error_copy_cf_error(v5);
      else
        v6 = 0;
      if (gLogCategory_RPStreamSession <= 90
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v13 = *(_QWORD *)(v12 + 40);
      if (!v13)
      {
        v15 = 0;
        goto LABEL_23;
      }
      RPNestedErrorF();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v14);

LABEL_21:
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = *(void **)(v12 + 40);
LABEL_23:
      *(_QWORD *)(v12 + 40) = 0;

LABEL_24:
      goto LABEL_25;
    }
    if ((a2 - 1) <= 1 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      v6 = (void *)nw_listener_copy_local_endpoint();
      if (!v6)
      {
        if (gLogCategory_RPStreamSession <= 90
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_24;
      }
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 64);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v16[0] = *(_OWORD *)(a1 + 80);
      *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)(a1 + 92);
      objc_msgSend(v7, "_serverUDPNWPathNextWithEndpoint:nwInterface:selfMACData:peerIP:peerMACData:usb:responseHandler:", v6, v8, v9, v16, v10, 0, v11);
      goto LABEL_21;
    }
  }
LABEL_25:

}

void __72__RPStreamSession__serverUDPNWPathStartRequest_options_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  int v3;
  NSObject *v4;

  v2 = a2;
  v4 = v2;
  if (gLogCategory_RPStreamSession <= 30)
  {
    if (gLogCategory_RPStreamSession != -1 || (v3 = _LogCategory_Initialize(), v2 = v4, v3))
    {
      LogPrintF();
      v2 = v4;
    }
  }
  nw_connection_cancel(v2);

}

- (void)_serverUDPNWPathNextWithEndpoint:(id)a3 nwInterface:(id)a4 selfMACData:(id)a5 peerIP:(id *)a6 peerMACData:(id)a7 usb:(BOOL)a8 responseHandler:(id)a9
{
  _BOOL4 v9;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  const sockaddr *v19;
  unsigned int Port;
  int sa_family;
  void *v22;
  uint64_t address_with_ethernet;
  uint64_t v24;
  int v25;
  void *v26;
  NSObject *legacy_tcp_socket;
  NSObject *secure_udp;
  NSObject *v29;
  NSObject *options;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *nwPathEvaluator;
  NSUUID *v33;
  NSUUID *nwClientID;
  void *v35;
  uint64_t streamType;
  const char *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSString *streamID;
  const char *v46;
  uint64_t streamFlags;
  void *v48;
  uint64_t trafficFlags;
  void *v50;
  NSUUID *v51;
  NSObject *v52;
  void *v53;
  $B34E9F681C60DAD13D1FAE8CC51D8B4D *v54;
  id v55;
  unsigned int v56;
  id v58;
  NSObject *interface;
  _QWORD v60[4];
  id v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[18];

  v9 = a8;
  v69[16] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  interface = a4;
  v58 = a5;
  v15 = a7;
  v16 = a9;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__4;
  v67 = __Block_byref_object_dispose__4;
  v68 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke;
  v60[3] = &unk_1E5F50DE8;
  v62 = &v63;
  v17 = v16;
  v61 = v17;
  v18 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v60);
  v19 = nw_endpoint_get_address(v14);
  if (!v19)
  {
    RPErrorF();
    v41 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v64[5];
    v64[5] = v41;
    goto LABEL_36;
  }
  Port = SockAddrGetPort();
  sa_family = v19->sa_family;
  v56 = Port;
  if (sa_family != 30)
  {
    if (sa_family == 2 && !*(_DWORD *)&v19->sa_data[2])
      goto LABEL_5;
LABEL_11:
    LOBYTE(v69[0]) = 0;
    SockAddrToString();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v69);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_6;
    goto LABEL_12;
  }
  if (*(_DWORD *)&v19->sa_data[6]
    || *(_DWORD *)&v19->sa_data[10]
    || *(_DWORD *)&v19[1].sa_len
    || *(_DWORD *)&v19[1].sa_data[2])
  {
    goto LABEL_11;
  }
LABEL_5:
  v22 = 0;
  if (!v15)
  {
LABEL_6:
    address_with_ethernet = (uint64_t)nw_endpoint_create_address(&a6->var0);
    goto LABEL_13;
  }
LABEL_12:
  WORD2(v69[0]) = 0;
  LODWORD(v69[0]) = 0;
  v24 = objc_msgSend(objc_retainAutorelease(v15), "bytes");
  v25 = *(_DWORD *)v24;
  WORD2(v69[0]) = *(_WORD *)(v24 + 4);
  LODWORD(v69[0]) = v25;
  address_with_ethernet = nw_endpoint_create_address_with_ethernet();
LABEL_13:
  v26 = (void *)address_with_ethernet;
  if (!address_with_ethernet)
    goto LABEL_40;
  if (!v9)
  {
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], &__block_literal_global_144);
    if (secure_udp)
    {
LABEL_19:
      nw_parameters_set_delegated_unique_pid();
      nw_parameters_set_reuse_local_address(secure_udp, 1);
      if (interface)
        nw_parameters_require_interface(secure_udp, interface);
      nw_parameters_set_local_endpoint(secure_udp, v14);
      evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
      nwPathEvaluator = self->_nwPathEvaluator;
      self->_nwPathEvaluator = evaluator_for_endpoint;

      if (self->_nwPathEvaluator)
      {
        v69[0] = 0;
        v69[1] = 0;
        nw_path_evaluator_get_client_id();
        v33 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v69);
        nwClientID = self->_nwClientID;
        self->_nwClientID = v33;

        NSRandomData();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_streamKey, v35);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          streamType = self->_streamType;
          if (streamType > 3)
            v37 = "?";
          else
            v37 = off_1E5F510C0[streamType];
          v54 = a6;
          v55 = v15;
          v52 = v14;
          v53 = v22;
          v51 = self->_nwClientID;
          trafficFlags = self->_trafficFlags;
          v50 = &unk_1AF30857F;
          streamFlags = self->_streamFlags;
          v48 = &unk_1AF3085F2;
          streamID = self->_streamID;
          v46 = v37;
          LogPrintF();
        }
        v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v39 = v38;
        if (v22)
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v22, CFSTR("_streamAddr"));
        if (v58)
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v58, CFSTR("_streamMACAddr"));
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v35, CFSTR("_streamKey"), streamID, v46, streamFlags, v48, trafficFlags, v50, v51, v52, v53, v54, v55);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, CFSTR("_streamPort"));

        (*((void (**)(id, void *, _QWORD, _QWORD))v17 + 2))(v17, v39, 0, 0);
        goto LABEL_35;
      }
      goto LABEL_39;
    }
LABEL_40:
    RPErrorF();
    v44 = objc_claimAutoreleasedReturnValue();
    secure_udp = v64[5];
    v64[5] = v44;
    goto LABEL_35;
  }
  legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
  secure_udp = legacy_tcp_socket;
  if (!legacy_tcp_socket)
    goto LABEL_40;
  v29 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
  if (v29)
  {
    options = nw_udp_create_options();
    nw_udp_options_set_no_metadata();
    nw_protocol_stack_set_transport_protocol(v29, options);

    goto LABEL_19;
  }
LABEL_39:
  RPErrorF();
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v64[5];
  v64[5] = v42;

LABEL_35:
LABEL_36:

  v18[2](v18);
  _Block_object_dispose(&v63, 8);

}

uint64_t __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t __115__RPStreamSession__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler___block_invoke_2()
{
  return nw_udp_options_set_no_metadata();
}

- (void)_clientUDPSocketStartWithCompletion:(id)a3
{
  void (**v4)(id, id);
  int streamSocket;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *serviceType;
  RPMessageable *messenger;
  uint64_t v12;
  _QWORD v13[5];
  void (**v14)(id, id);
  unsigned int v15;

  v4 = (void (**)(id, id))a3;
  streamSocket = self->_streamSocket;
  if ((streamSocket & 0x80000000) == 0)
  {
    if (close(streamSocket) && *__error())
      __error();
    self->_streamSocket = -1;
  }
  v15 = 0;
  LODWORD(v12) = 3;
  if (ServerSocketOpenEx2())
  {
    RPErrorF();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4[2](v4, v6);
  }
  else
  {
    if (self->_streamQoS >= 1)
      -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", self->_streamSocket, v12, &self->_streamSocket);
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_streamID, CFSTR("_streamID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("_streamPort"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_streamType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("_streamType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trafficFlags);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("_tf"));

    serviceType = self->_serviceType;
    if (serviceType)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", serviceType, CFSTR("_streamSrv"));
    messenger = self->_messenger;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__RPStreamSession__clientUDPSocketStartWithCompletion___block_invoke;
    v13[3] = &unk_1E5F50620;
    v13[4] = self;
    v14 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_streamStart"), v6, CFSTR("rapport:rdid:DirectPeer"), 0, v13);

  }
}

void __55__RPStreamSession__clientUDPSocketStartWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v13 = v10;
  if (!v10 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }
    else
    {
      RPErrorF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientUDPSocketStartResponse:options:completion:", v10, v8, *(_QWORD *)(a1 + 40));
  }

}

- (void)_clientUDPSocketStartResponse:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  int streamSocket;
  socklen_t Size;
  socklen_t v15;
  sockaddr v16;
  uint64_t v17;
  int v18;
  sockaddr v19;
  uint64_t v20;
  int v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "length") >= 0x20)
    objc_storeStrong((id *)&self->_streamKey, v11);
  if (!CFDictionaryGetInt64Ranged())
    goto LABEL_7;
  CFStringGetTypeID();
  if (!objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String")
    || (*(_QWORD *)&v19.sa_len = 0,
        *(_QWORD *)&v19.sa_data[6] = 0,
        v21 = 0,
        v20 = 0,
        StringToSockAddr())
    || (SockAddrSetPort(), SockAddrConvertToIPv6())
    || (streamSocket = self->_streamSocket, Size = SockAddrGetSize(), connect(streamSocket, &v19, Size))
    && (!*__error() || *__error()))
  {
LABEL_7:
    RPErrorF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10[2](v10, v12);

  }
  else
  {
    *(_QWORD *)&v16.sa_len = 0;
    *(_QWORD *)&v16.sa_data[6] = 0;
    v18 = 0;
    v17 = 0;
    v15 = 28;
    getsockname(self->_streamSocket, &v16, &v15);
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10[2](v10, 0);
  }

}

- (void)_serverUDPSocketStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int *p_streamSocket;
  void *v13;
  uint64_t streamType;
  const char *v15;
  void *v16;
  void *v17;
  NSString *streamID;
  int *v19;
  _QWORD *v20;
  sockaddr *v21;
  NSString *serviceType;
  _QWORD v23[3];
  int v24;
  uint64_t v25;
  int v26;
  sockaddr v27;
  uint64_t v28;
  int v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CFStringGetTypeID();
  if (objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String"))
  {
    *(_QWORD *)&v27.sa_len = 0;
    *(_QWORD *)&v27.sa_data[6] = 0;
    v29 = 0;
    v28 = 0;
    v26 = 0;
    v25 = StringToSockAddr();
    if (!(_DWORD)v25)
    {
      if (CFDictionaryGetInt64Ranged())
      {
        SockAddrSetPort();
        self->_trafficFlags = CFDictionaryGetInt64Ranged();
        CFStringGetTypeID();
        if (objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String"))
        {
          memset(v23, 0, sizeof(v23));
          v24 = 0;
          LODWORD(v25) = StringToSockAddr();
          if (!(_DWORD)v25)
          {
            p_streamSocket = &self->_streamSocket;
            if ((self->_streamSocket & 0x80000000) == 0)
            {
              if (close(self->_streamSocket) && *__error())
                __error();
              *p_streamSocket = -1;
            }
            v19 = &self->_streamSocket;
            LODWORD(streamID) = 1;
            LODWORD(v25) = ServerSocketOpenEx2();
            if (!(_DWORD)v25)
            {
              SockAddrSetPort();
              if (self->_streamQoS >= 1)
                -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", self->_streamSocket, streamID, v19);
              LODWORD(v25) = connect(*p_streamSocket, &v27, HIDWORD(v25));
              if (!(_DWORD)v25)
              {
                LODWORD(v25) = 0;
                goto LABEL_28;
              }
              if (*__error())
              {
                LODWORD(v25) = *__error();
                if (!(_DWORD)v25)
                {
LABEL_28:
                  NSRandomData();
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_storeStrong((id *)&self->_streamKey, v13);
                  if (gLogCategory_RPStreamSession <= 30
                    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
                  {
                    streamType = self->_streamType;
                    if (streamType > 3)
                      v15 = "?";
                    else
                      v15 = off_1E5F510C0[streamType];
                    serviceType = self->_serviceType;
                    v20 = v23;
                    v21 = &v27;
                    streamID = self->_streamID;
                    v19 = (int *)v15;
                    LogPrintF();
                  }
                  v30[1] = CFSTR("_streamPort");
                  v31[0] = v13;
                  v30[0] = CFSTR("_streamKey");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0, streamID, v19, v20, v21, serviceType);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v31[1] = v16;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v17, 0, 0);
LABEL_38:

                  goto LABEL_12;
                }
              }
              else
              {
                LODWORD(v25) = -6700;
              }
            }
            RPErrorF();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (gLogCategory_RPStreamSession <= 90
              && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v13);
            goto LABEL_38;
          }
        }
      }
    }
  }
  RPErrorF();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPStreamSession <= 90
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v11);

LABEL_12:
}

- (void)_clientRPConnectionPrepareWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSString *streamID;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *serviceType;
  RPMessageable *messenger;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  RPStreamSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  RPStreamSessionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, self->_streamID);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    streamID = self->_streamID;
    *(_DWORD *)buf = 138412290;
    v19 = streamID;
    _os_signpost_emit_with_name_impl(&dword_1AF28C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RPStreamBringUpTime", " enableTelemetry=YES {streamID:%@, signpost.description:begin_time}", buf, 0xCu);
  }

  Curve25519MakeKeyPair();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_streamID, CFSTR("_streamID"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buf, 32);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("_streamKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_streamType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("_streamType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trafficFlags);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("_tf"));

  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", serviceType, CFSTR("_streamSrv"));
  messenger = self->_messenger;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__RPStreamSession__clientRPConnectionPrepareWithCompletion___block_invoke;
  v16[3] = &unk_1E5F50620;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_streamStart"), v9, CFSTR("rapport:rdid:DirectPeer"), 0, v16);

}

void __60__RPStreamSession__clientRPConnectionPrepareWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v13 = v10;
  if (!v10 || v9)
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }
    else
    {
      RPErrorF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientRPConnectionPrepareResponse:options:completion:", v10, v8, *(_QWORD *)(a1 + 40));
  }

}

- (void)_clientRPConnectionPrepareResponse:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  int Int64Ranged;
  NSString *v14;
  NSString *destinationString;
  void *v16;
  id v17;
  int8x16_t v18;
  NSData *v19;
  NSData *pskData;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  int8x16_t __s[2];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  v39 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__RPStreamSession__clientRPConnectionPrepareResponse_options_completion___block_invoke;
  v31[3] = &unk_1E5F50DE8;
  v33 = &v34;
  v11 = v10;
  v32 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v31);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged
    && (self->_peerPort = Int64Ranged,
        CFStringGetTypeID(),
        objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String")))
  {
    v27 = 0;
    v28 = 0;
    v30 = 0;
    v29 = 0;
    v26 = StringToSockAddr();
    if ((_DWORD)v26)
    {
      RPErrorF();
      v23 = objc_claimAutoreleasedReturnValue();
      v17 = (id)v35[5];
      v35[5] = v23;
    }
    else
    {
      SockAddrSetPort();
      NSPrintF();
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      destinationString = self->_destinationString;
      self->_destinationString = v14;

      CFDictionaryGetCFDataOfLength();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
        goto LABEL_21;
      v17 = objc_retainAutorelease(v16);
      if (objc_msgSend(v17, "bytes", (char *)&v26 + 4))
      {
        objc_msgSend(objc_retainAutorelease(v17), "bytes");
        cccurve25519();
      }
      else
      {
        cccurve25519_make_pub();
      }
      memset_s(self->_ourCurveSK, 0x20uLL, 0, 0x20uLL);
      v18 = vorrq_s8(__s[1], __s[0]);
      if (vorr_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL)))
      {
        CryptoHKDF();
        v19 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", __s, 32, __s);
        pskData = self->_pskData;
        self->_pskData = v19;

        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (self->_prepareOnly)
          (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
        else
          -[RPStreamSession _clientRPConnectionStartWithCompletion:](self, "_clientRPConnectionStartWithCompletion:", v11);
      }
      else
      {
LABEL_21:
        RPErrorF();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v35[5];
        v35[5] = v24;

      }
    }

  }
  else
  {
    RPErrorF();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v35[5];
    v35[5] = v21;

  }
  v12[2](v12);

  _Block_object_dispose(&v34, 8);
}

uint64_t __73__RPStreamSession__clientRPConnectionPrepareResponse_options_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)_clientRPConnectionStartWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t streamType;
  const char *v6;
  RPConnection *v7;
  void *v8;
  NSData *pskData;
  uint64_t v10;
  RPConnection *rpCnx;
  RPConnection *v12;
  NSString *streamID;
  const char *v14;
  NSString *destinationString;
  uint64_t peerPort;
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v4 = (void (**)(id, _QWORD))a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    streamType = self->_streamType;
    if (streamType > 3)
      v6 = "?";
    else
      v6 = off_1E5F510C0[streamType];
    destinationString = self->_destinationString;
    peerPort = self->_peerPort;
    streamID = self->_streamID;
    v14 = v6;
    LogPrintF();
  }
  -[RPStreamSession _updateTrafficRegistrationForDestination:](self, "_updateTrafficRegistrationForDestination:", self->_destinationString, streamID, v14, destinationString, peerPort);
  v7 = objc_alloc_init(RPConnection);
  -[RPConnection setDestinationString:](v7, "setDestinationString:", self->_destinationString);
  -[RPConnection setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setFlags:](v7, "setFlags:", -[RPConnection flags](v7, "flags") | 0x80000);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Stream-%u"), self->_peerPort);
  -[RPConnection setLabel:](v7, "setLabel:", v8);

  -[RPConnection setPskData:](v7, "setPskData:", self->_pskData);
  pskData = self->_pskData;
  self->_pskData = 0;

  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke;
  v22[3] = &unk_1E5F4EC60;
  v22[4] = self;
  -[RPConnection setInvalidationHandler:](v7, "setInvalidationHandler:", v22);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2;
  v21[3] = &unk_1E5F502D8;
  v21[4] = self;
  -[RPConnection setReceivedEventHandler:](v7, "setReceivedEventHandler:", v21);
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_3;
  v20[3] = &unk_1E5F50300;
  v20[4] = self;
  -[RPConnection setReceivedRequestHandler:](v7, "setReceivedRequestHandler:", v20);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_4;
  v19[3] = &unk_1E5F4EC60;
  v19[4] = self;
  -[RPConnection setFlowControlWriteChangedHandler:](v7, "setFlowControlWriteChangedHandler:", v19);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_5;
  v18[3] = &unk_1E5F50268;
  v18[4] = self;
  v18[5] = v7;
  -[RPConnection setStateChangedHandler:](v7, "setStateChangedHandler:", v18);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_171;
  v17[3] = &unk_1E5F4ECD0;
  v17[4] = self;
  -[RPConnection setReadErrorHandler:](v7, "setReadErrorHandler:", v17);
  rpCnx = self->_rpCnx;
  self->_rpCnx = v7;
  v12 = v7;

  -[RPConnection activate](v12, "activate");
  v4[2](v4, 0);

}

uint64_t __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);

}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);

}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_4(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_5(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  int *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    RPStreamSessionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    RPStreamSessionLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(*(_QWORD *)(a1 + 32) + 264));

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264);
      v9 = objc_msgSend(*(id *)(a1 + 40), "linkType");
      if (v9 > 0xB)
        v10 = "?";
      else
        v10 = off_1E5F510E0[v9];
      v15 = 138412802;
      v16 = v8;
      v17 = 2080;
      v18 = v10;
      v19 = 2080;
      v20 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_1AF28C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "RPStreamBringUpTime", " enableTelemetry=YES {streamID:%@, linkType=%{signpost.telemetry:string1}s, process=%{signpost.telemetry:string2}s, signpost.description:end_time}", (uint8_t *)&v15, 0x20u);
    }

    v11 = *(int **)(a1 + 32);
    if (v11[38] >= 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "tcpConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStreamQoSOnSocket:", objc_msgSend(v12, "socketFD"));

      v11 = *(int **)(a1 + 32);
    }
    objc_msgSend(v11, "connectionReadyHandler");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      (*(void (**)(uint64_t))(v13 + 16))(v13);

  }
}

void __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = a2;
  if (objc_msgSend(v3, "code") == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    v4 = (void *)MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
    if (v4)
    {
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2_172;
      block[3] = &unk_1E5F50F18;
      block[4] = v4;
      dispatch_async(v5, block);
    }

  }
}

uint64_t __58__RPStreamSession__clientRPConnectionStartWithCompletion___block_invoke_2_172(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_serverRPConnectionStartRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  CUTCPServer *v15;
  CUTCPServer *tcpServer;
  CUTCPServer *v17;
  id *v18;
  uint64_t v19;
  id v20;
  int8x16_t v21;
  NSData *v22;
  NSData *pskData;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id obj;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _DWORD v36[17];
  int v37;
  _QWORD v38[5];
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  int8x16_t v49[2];
  _BYTE __s[32];
  _BYTE v51[32];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__4;
  v45 = __Block_byref_object_dispose__4;
  v46 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke;
  v38[3] = &unk_1E5F51018;
  v40 = &v41;
  v38[4] = self;
  v12 = v10;
  v39 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x1AF45BE48](v38);
  v37 = 0;
  CFDictionaryGetCFDataOfLength();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (self->_trafficFlags = CFDictionaryGetInt64Ranged(),
        CFStringGetTypeID(),
        objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String"))
    && (memset(&v36[10], 0, 28), (v37 = StringToSockAddr()) == 0))
  {
    v15 = (CUTCPServer *)objc_alloc_init(MEMORY[0x1E0D1B468]);
    tcpServer = self->_tcpServer;
    self->_tcpServer = v15;

    -[CUTCPServer setDispatchQueue:](self->_tcpServer, "setDispatchQueue:", self->_dispatchQueue);
    -[CUTCPServer setFlags:](self->_tcpServer, "setFlags:", 201);
    *(_OWORD *)v36 = *(_OWORD *)&v36[10];
    *(_OWORD *)&v36[3] = *(_OWORD *)&v36[13];
    -[CUTCPServer setInterfaceAddress:](self->_tcpServer, "setInterfaceAddress:", v36);
    if ((self->_streamFlags & 5) != 0)
    {
      v35[0] = v11;
      v35[1] = 3221225472;
      v35[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_2;
      v35[3] = &unk_1E5F50178;
      v35[4] = self;
      -[CUTCPServer setConnectionAcceptHandler:](self->_tcpServer, "setConnectionAcceptHandler:", v35);
    }
    else
    {
      v34[0] = v11;
      v34[1] = 3221225472;
      v34[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_3;
      v34[3] = &unk_1E5F51040;
      v34[4] = self;
      -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v34);
    }
    v33[0] = v11;
    v33[1] = 3221225472;
    v33[2] = __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_4;
    v33[3] = &unk_1E5F4EC60;
    v33[4] = self;
    -[CUTCPServer setInvalidationHandler:](self->_tcpServer, "setInvalidationHandler:", v33);
    v17 = self->_tcpServer;
    v18 = (id *)(v42 + 5);
    obj = (id)v42[5];
    -[CUTCPServer activateDirectAndReturnError:](v17, "activateDirectAndReturnError:", &obj);
    objc_storeStrong(v18, obj);
    if (v42[5])
    {
      RPNestedErrorF();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v42[5];
      v42[5] = v29;

    }
    else
    {
      v19 = -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort");
      SockAddrSetPort();
      Curve25519MakeKeyPair();
      v20 = objc_retainAutorelease(v14);
      if (objc_msgSend(v20, "bytes"))
      {
        objc_msgSend(objc_retainAutorelease(v20), "bytes");
        cccurve25519();
      }
      else
      {
        cccurve25519_make_pub();
      }
      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      v21 = vorrq_s8(v49[1], v49[0]);
      if (vorr_s8(*(int8x8_t *)v21.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)))
      {
        CryptoHKDF();
        v22 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", v49, 32, v49);
        pskData = self->_pskData;
        self->_pskData = v22;

        memset_s(v49, 0x20uLL, 0, 0x20uLL);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v47[0] = CFSTR("_streamKey");
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v51, 32);
        v47[1] = CFSTR("_streamPort");
        v48[0] = v24;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void *, _QWORD, _QWORD))v12 + 2))(v12, v26, 0, 0);
      }
      else
      {
        RPErrorF();
        v31 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v42[5];
        v42[5] = v31;
      }

    }
  }
  else
  {
    RPErrorF();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v42[5];
    v42[5] = v27;

  }
  v13[2](v13);

  _Block_object_dispose(&v41, 8);
}

uint64_t __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v1)
  {
    v2 = (_QWORD *)result;
    if (gLogCategory_RPStreamSession <= 90)
    {
      if (gLogCategory_RPStreamSession == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_7;
        v1 = *(_QWORD *)(*(_QWORD *)(v2[6] + 8) + 40);
      }
      v5 = v1;
      LogPrintF();
    }
LABEL_7:
    objc_msgSend(*(id *)(v2[4] + 112), "invalidate", v5);
    v3 = v2[4];
    v4 = *(void **)(v3 + 112);
    *(_QWORD *)(v3 + 112) = 0;

    return (*(uint64_t (**)(void))(v2[5] + 16))();
  }
  return result;
}

void __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  uint64_t v4;
  void *v5;

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[8])
  {
    objc_msgSend(v3, "_serverRPConnectionHandleConnectionAccepted:", a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

  }
}

void __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  uint64_t v4;
  void *v5;

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[8])
  {
    objc_msgSend(v3, "_serverRPConnectionHandleConnectionStarted:", a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 0;

  }
}

uint64_t __75__RPStreamSession__serverRPConnectionStartRequest_options_responseHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_serverRPConnectionHandleConnectionAccepted:(int)a3
{
  uint64_t v3;
  id streamAcceptHandler;
  uint64_t v6;
  int streamSocket;
  void (**v8)(id, _QWORD);

  v3 = *(_QWORD *)&a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = (void (**)(id, _QWORD))MEMORY[0x1AF45BE48](self->_streamAcceptHandler);
  if (v8)
  {
    streamAcceptHandler = self->_streamAcceptHandler;
    self->_streamAcceptHandler = 0;

    streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0 && close(streamSocket) && *__error())
      __error();
    self->_streamSocket = v3;
    if (self->_streamQoS >= 1)
      -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", v3);
    v8[2](v8, v6);
  }
  else
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    close(v3);
  }

}

- (void)_serverRPConnectionHandleConnectionStarted:(id)a3
{
  id v4;
  RPConnection *v5;
  void *v6;
  void *v7;
  NSData *pskData;
  uint64_t v9;
  RPConnection *rpCnx;
  RPConnection *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = a3;
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = objc_alloc_init(RPConnection);
  -[RPConnection setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[RPConnection setFlags:](v5, "setFlags:", -[RPConnection flags](v5, "flags") | 0x80000);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Stream-%u"), -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
  -[RPConnection setLabel:](v5, "setLabel:", v6);

  -[RPConnection label](v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v7);

  -[RPConnection setPskData:](v5, "setPskData:", self->_pskData);
  pskData = self->_pskData;
  self->_pskData = 0;

  -[RPConnection setTcpConnection:](v5, "setTcpConnection:", v4);
  if (self->_streamQoS >= 1)
    -[RPStreamSession setStreamQoSOnSocket:](self, "setStreamQoSOnSocket:", objc_msgSend(v4, "socketFD"));
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke;
  v17[3] = &unk_1E5F4EC60;
  v17[4] = self;
  -[RPConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v17);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_2;
  v16[3] = &unk_1E5F502D8;
  v16[4] = self;
  -[RPConnection setReceivedEventHandler:](v5, "setReceivedEventHandler:", v16);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_3;
  v15[3] = &unk_1E5F50300;
  v15[4] = self;
  -[RPConnection setReceivedRequestHandler:](v5, "setReceivedRequestHandler:", v15);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_4;
  v14[3] = &unk_1E5F4EC60;
  v14[4] = self;
  -[RPConnection setFlowControlWriteChangedHandler:](v5, "setFlowControlWriteChangedHandler:", v14);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_5;
  v13[3] = &unk_1E5F50178;
  v13[4] = self;
  -[RPConnection setStateChangedHandler:](v5, "setStateChangedHandler:", v13);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_6;
  v12[3] = &unk_1E5F4ECD0;
  v12[4] = self;
  -[RPConnection setReadErrorHandler:](v5, "setReadErrorHandler:", v12);
  rpCnx = self->_rpCnx;
  self->_rpCnx = v5;
  v11 = v5;

  -[RPConnection activate](v11, "activate");
}

uint64_t __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v11, v7, v8);

}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, id, id, id, id))(v12 + 16))(v12, v14, v9, v10, v11);

}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_4(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  v1 = (void (**)(void))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_5(uint64_t a1, int a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionReadyHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

void __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = a2;
  if (objc_msgSend(v3, "code") == -6723 || objc_msgSend(v3, "code") == -6753)
  {
    v4 = (void *)MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
    if (v4)
    {
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_7;
      block[3] = &unk_1E5F50F18;
      block[4] = v4;
      dispatch_async(v5, block);
    }

  }
}

uint64_t __62__RPStreamSession__serverRPConnectionHandleConnectionStarted___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unsigned)_getSockAddrInterfaceType:(const void *)a3
{
  uint64_t v3;
  ifaddrs *v4;
  ifaddrs *v6;
  unsigned int v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  if (!SockAddrSimplify())
  {
    if (getifaddrs(&v6) && *__error())
      __error();
    v4 = v6;
    if (v6)
    {
      v8 = 0;
      while (!v4->ifa_addr || !v4->ifa_name || SockAddrCompareAddr())
      {
        v4 = v4->ifa_next;
        if (!v4)
          goto LABEL_13;
      }
      __strlcpy_chk();
LABEL_13:
      if (v8)
      {
        if (SocketGetInterfaceInfo())
        {
          if (gLogCategory_RPStreamSession <= 90
            && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_30;
          }
        }
        else if (!v7
               && gLogCategory_RPStreamSession <= 90
               && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
LABEL_30:
          LogPrintF();
        }
      }
      else if (gLogCategory_RPStreamSession <= 90
             && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_30;
      }
    }
    else
    {
      if (gLogCategory_RPStreamSession > 90)
        return v7;
      if (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize())
        goto LABEL_30;
    }
  }
  if (v6)
    MEMORY[0x1AF45B9EC](v6, v3);
  return v7;
}

- (id)_lowLatencySelfAddressString:(id *)a3
{
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = 0;
  v9 = 0;
  v8 = 0;
  v5 = 0;
  v4 = 0;
  CUGetInterfaceAddresses();
  return 0;
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_rpCnx)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RPStreamSession_sendEventID_event_options_completion___block_invoke;
    block[3] = &unk_1E5F51068;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    RPErrorF();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *))v13 + 2))(v13, v15);

  }
}

uint64_t __56__RPStreamSession_sendEventID_event_options_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 104), "sendEncryptedEventID:event:options:completion:", a1[5], a1[6], a1[7], a1[8]);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_rpCnx)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__RPStreamSession_sendRequestID_request_options_responseHandler___block_invoke;
    block[3] = &unk_1E5F51068;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    RPErrorF();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v15);

  }
}

uint64_t __65__RPStreamSession_sendRequestID_request_options_responseHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 104), "sendEncryptedRequestID:request:xpcID:options:responseHandler:", a1[5], a1[6], 0, a1[7], a1[8]);
}

- (void)_updateTrafficRegistration
{
  int streamSocket;
  int v4;
  socklen_t v5;
  sockaddr v6;
  uint64_t v7;
  int v8;

  if (self->_peerIP.sa.sa_family)
  {
    -[RPStreamSession _updateTrafficRegistrationForIP:](self, "_updateTrafficRegistrationForIP:", &self->_peerIP);
  }
  else if (self->_trafficFlags)
  {
    streamSocket = self->_streamSocket;
    if ((streamSocket & 0x80000000) == 0)
    {
      *(_QWORD *)&v6.sa_len = 0;
      *(_QWORD *)&v6.sa_data[6] = 0;
      v8 = 0;
      v7 = 0;
      v5 = 28;
      getpeername(streamSocket, &v6, &v5);
      if (v6.sa_family == 30 && v6.sa_data[6] == 254 && (v6.sa_data[7] & 0xC0) == 0x80)
      {
        v4 = v8;
        if (v8)
        {
          if (v4 == if_nametoindex("awdl0"))
            -[RPStreamSession _updateTrafficRegistrationForIP:](self, "_updateTrafficRegistrationForIP:", &v6);
        }
      }
    }
  }
}

- (void)_updateTrafficRegistrationForIP:(id *)a3
{
  void *v5;
  NSString *v6;
  NSString *trafficSessionID;
  CUWiFiManager *v8;
  CUWiFiManager *wifiManager;
  NSObject *v10;
  dispatch_queue_t v11;
  id v12;
  void *v13;
  const $B34E9F681C60DAD13D1FAE8CC51D8B4D *v14;
  uint64_t trafficFlags;
  void *v16;
  NSString *v17;
  _OWORD v18[2];
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_trafficSessionID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    trafficSessionID = self->_trafficSessionID;
    self->_trafficSessionID = v6;

  }
  if (gLogCategory_RPStreamSession <= 30
    && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
  {
    v16 = &unk_1AF30857F;
    v17 = self->_trafficSessionID;
    v14 = a3;
    trafficFlags = self->_trafficFlags;
    LogPrintF();
  }
  self->_trafficRegistrationCalled = 1;
  if (!self->_wifiManager)
  {
    v8 = (CUWiFiManager *)objc_alloc_init(MEMORY[0x1E0D1B478]);
    wifiManager = self->_wifiManager;
    self->_wifiManager = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.rapport.traffic_registration", v10);
    -[CUWiFiManager setDispatchQueue:](self->_wifiManager, "setDispatchQueue:", v11);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke;
    v19[3] = &unk_1E5F4EC60;
    v19[4] = self;
    -[CUWiFiManager setWifiStateChangedHandler:](self->_wifiManager, "setWifiStateChangedHandler:", v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CUWiFiManager setValue:forKey:](self->_wifiManager, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("degradeOnAnyTrafficUnavailable"));
    -[CUWiFiManager activateWithCompletion:](self->_wifiManager, "activateWithCompletion:", 0, v14, trafficFlags, v16, v17);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0D1B488]);
  v18[0] = a3->var0;
  *(in6_addr *)((char *)v18 + 12) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  objc_msgSend(v12, "setPeerIP:", v18);
  objc_msgSend(v12, "setSessionID:", self->_trafficSessionID);
  objc_msgSend(v12, "setTrafficFlags:", self->_trafficFlags);
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUWiFiManager setTrafficPeers:](self->_wifiManager, "setTrafficPeers:", v13);

}

void __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 176);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke_2;
  block[3] = &unk_1E5F4EC60;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __51__RPStreamSession__updateTrafficRegistrationForIP___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 256);
  v4 = objc_msgSend(*(id *)(v2 + 128), "wifiFlags");
  v5 = v3 & 0xFFFFFFFFF9FFFFFFLL | (v4 << 19) & 0x2000000 | (v4 << 19) & 0x4000000;
  if (v5 != v3)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = v5;
    if (gLogCategory_RPStreamSession <= 30
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 248));
    if (v6)
    {
      v10 = v6;
      v6[2](v6, v7, v8, v9);
      v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
    }

  }
}

- (void)_updateTrafficRegistrationForDestination:(id)a3
{
  id v4;
  _OWORD v5[2];

  memset(v5, 0, 28);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  if (StringToSockAddr())
  {
    if (gLogCategory_RPStreamSession <= 90
      && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_peerIP.sa = (sockaddr)v5[0];
    *(in6_addr *)((char *)&self->_peerIP.v6.sin6_addr + 4) = *(in6_addr *)((char *)v5 + 12);
    -[RPStreamSession _updateTrafficRegistration](self, "_updateTrafficRegistration");
  }

}

- (int)flowControlWriteState
{
  RPConnection *rpCnx;
  int v3;

  rpCnx = self->_rpCnx;
  if (rpCnx)
  {
    v3 = -[RPConnection flowControlWriteState](rpCnx, "flowControlWriteState");
    if (v3 == 10)
      LODWORD(rpCnx) = 1;
    else
      LODWORD(rpCnx) = 2 * (v3 == 20);
  }
  return (int)rpCnx;
}

- (unint64_t)delegatedProcessUPID
{
  return self->_delegatedProcessUPID;
}

- (void)setDelegatedProcessUPID:(unint64_t)a3
{
  self->_delegatedProcessUPID = a3;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)flowControlWriteChangedHandler
{
  return self->_flowControlWriteChangedHandler;
}

- (void)setFlowControlWriteChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (NSUUID)nwClientID
{
  return self->_nwClientID;
}

- (void)setNwClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)connectionReadyHandler
{
  return self->_connectionReadyHandler;
}

- (void)setConnectionReadyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_streamFlags = a3;
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSData)streamKey
{
  return self->_streamKey;
}

- (void)setStreamKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (int)streamSocket
{
  return self->_streamSocket;
}

- (void)setStreamSocket:(int)a3
{
  self->_streamSocket = a3;
}

- (int)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(int)a3
{
  self->_streamType = a3;
}

- (int)streamQoS
{
  return self->_streamQoS;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSString)trafficSessionID
{
  return self->_trafficSessionID;
}

- (void)setTrafficSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)serverMode
{
  return self->_serverMode;
}

- (void)setServerMode:(BOOL)a3
{
  self->_serverMode = a3;
}

- (id)streamAcceptHandler
{
  return self->_streamAcceptHandler;
}

- (void)setStreamAcceptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamAcceptHandler, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong((id *)&self->_trafficSessionID, 0);
  objc_storeStrong((id *)&self->_streamKey, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_connectionReadyHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedEventHandler, 0);
  objc_storeStrong((id *)&self->_nwClientID, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_flowControlWriteChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_tcpServer, 0);
  objc_storeStrong((id *)&self->_rpCnx, 0);
  objc_storeStrong((id *)&self->_nwPathEvaluator, 0);
  objc_storeStrong((id *)&self->_nwListener, 0);
}

@end
