@implementation SiriCoreSiriBackgroundConnection

- (SiriCoreSiriBackgroundConnection)initWithQueue:(id)a3
{
  id v5;
  SiriCoreSiriBackgroundConnection *v6;
  SiriCoreSiriBackgroundConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriCoreSiriBackgroundConnection;
  v6 = -[SiriCoreSiriBackgroundConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_storeStrong((id *)&v7->_bufferedProviderHeaderOutputData, MEMORY[0x24BDAC990]);
    v7->_currentPingIndex = 0;
    v7->_currentBarrierIndex = -100000;
    -[SiriCoreSiriBackgroundConnection startHeartBeat](v7, "startHeartBeat");
  }

  return v7;
}

- (SiriCoreSiriBackgroundConnection)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SiriCoreSiriBackgroundConnection _closeConnection](self, "_closeConnection");
  -[SiriCoreSiriBackgroundConnection stopHeartBeat](self, "stopHeartBeat");
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreSiriBackgroundConnection;
  -[SiriCoreSiriBackgroundConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)_usingPOP
{
  return self->_connectionMethod == 4;
}

- (BOOL)_usingFlorence
{
  void *v2;
  void *v3;
  char v4;

  if (self->_connectionMethod != 2)
    return 0;
  -[SiriCoreSiriConnectionInfo connectionPolicyRoute](self->_connectionInfo, "connectionPolicyRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE81AE0]);

  return v4;
}

- (BOOL)_usingPOPOnPeer
{
  void *v2;
  void *v3;
  char v4;

  if (self->_connectionMethod != 3)
    return 0;
  -[SiriCoreSiriConnectionInfo connectionPolicyRoute](self->_connectionInfo, "connectionPolicyRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE81AF0]);

  return v4;
}

- (BOOL)_usingPeer
{
  return self->_connectionMethod == 3;
}

- (BOOL)_usingNetwork
{
  return self->_connectionMethod == 2;
}

- (int64_t)_nextConnectionMethod
{
  int64_t connectionMethod;
  void *v4;
  void *v5;
  int64_t NextSupported;

  connectionMethod = self->_connectionMethod;
  -[SiriCoreSiriConnectionInfo connectionPolicyRoute](self->_connectionInfo, "connectionPolicyRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NextSupported = _SiriCoreSiriConnectionMethodGetNextSupported(connectionMethod, v5, self->_usesProxyConnection);

  return NextSupported;
}

- (void)startWithConnectionInfo:(id)a3
{
  -[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:](self, "_startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:", a3, 0, 1);
}

- (void)_startWithConnectionInfo:(id)a3 proposedFallbackMethod:(int64_t)a4 allowFallbackToNewMethod:(BOOL)a5
{
  _BOOL4 v5;
  id v10;
  os_log_t *v11;
  void *v12;
  const __CFString *v13;
  NSObject *v14;
  int64_t connectionMethod;
  void *v16;
  double v17;
  os_log_t v18;
  unint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *errorsForConnectionMethods;
  SiriCoreErrorInfo *v25;
  os_log_t v26;
  _BOOL4 v27;
  unint64_t v28;
  const __CFString *v29;
  unint64_t v30;
  const __CFString *v31;
  NSObject *safetyNetBuffer;
  size_t size;
  NSObject *bufferedGeneralOutputData;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  OS_dispatch_data *concat;
  OS_dispatch_data *v39;
  OS_dispatch_data *v40;
  OS_dispatch_data *v41;
  NSObject *v42;
  objc_class *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  SiriCoreConnectionProvider *connectionProvider;
  id v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BYTE v58[24];
  size_t v59;
  _BYTE v60[10];
  uint64_t v61;

  v5 = a5;
  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (self->_connectionProvider)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriCoreSiriBackgroundConnection.m"), 267, CFSTR("Can't start a connection twice"));

  }
  v11 = (os_log_t *)MEMORY[0x24BE08FC0];
  v12 = (void *)*MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 3)
      v13 = CFSTR("POP");
    else
      v13 = off_24CCE6188[a4];
    *(_DWORD *)v58 = 136315906;
    *(_QWORD *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(_QWORD *)&v58[14] = v10;
    *(_WORD *)&v58[22] = 2112;
    v59 = (size_t)v13;
    *(_WORD *)v60 = 1024;
    *(_DWORD *)&v60[2] = v5;
    v14 = v12;
    _os_log_impl(&dword_211AB2000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %d", v58, 0x26u);

  }
  connectionMethod = self->_connectionMethod;
  objc_storeStrong((id *)&self->_connectionInfo, a3);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemUptime");
  self->_currentStartTime = v17;

  if (self->_firstStartTime <= 0.0)
    self->_firstStartTime = self->_currentStartTime;
  self->_currentOpenTime = 0.0;
  ++self->_startCount;
  if (!connectionMethod)
  {
    if ((objc_msgSend(v10, "useWiFiHint") & 1) == 0)
    {
LABEL_19:
      a4 = -[SiriCoreSiriBackgroundConnection _nextConnectionMethod](self, "_nextConnectionMethod", *(_OWORD *)v58, *(_QWORD *)&v58[16], v59, *(_QWORD *)v60);
      goto LABEL_20;
    }
    a4 = 2;
LABEL_20:
    self->_connectionMethod = a4;
    goto LABEL_24;
  }
  if (v5)
  {
    if (!a4)
      goto LABEL_19;
    goto LABEL_20;
  }
  v18 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    v19 = self->_connectionMethod;
    if (v19 > 3)
      v20 = CFSTR("POP");
    else
      v20 = off_24CCE6188[v19];
    *(_DWORD *)v58 = 136315394;
    *(_QWORD *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(_QWORD *)&v58[14] = v20;
    v21 = v18;
    _os_log_impl(&dword_211AB2000, v21, OS_LOG_TYPE_INFO, "%s Fallback not allowed for this attempt, sticking with %@", v58, 0x16u);

  }
  a4 = self->_connectionMethod;
LABEL_24:
  if (a4 == 3 && objc_msgSend(v10, "skipPeer"))
  {
    objc_msgSend(v10, "skipPeerErrorReason");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 12, 0);
    if (!self->_errorsForConnectionMethods)
    {
      v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      errorsForConnectionMethods = self->_errorsForConnectionMethods;
      self->_errorsForConnectionMethods = v23;

    }
    v25 = objc_alloc_init(SiriCoreErrorInfo);
    -[SiriCoreErrorInfo setError:](v25, "setError:", v22);
    -[SiriCoreErrorInfo setIsPeerConnectionError:](v25, "setIsPeerConnectionError:", -[SiriCoreConnectionProvider isPeerConnectionError:](self->_connectionProvider, "isPeerConnectionError:", v22));
    -[SiriCoreErrorInfo setIsPeerNotNearbyError:](v25, "setIsPeerNotNearbyError:", -[SiriCoreConnectionProvider isPeerNotNearbyError:](self->_connectionProvider, "isPeerNotNearbyError:", v22));
    -[NSMutableDictionary setObject:forKey:](self->_errorsForConnectionMethods, "setObject:forKey:", v25, &unk_24CCF53C0);
    self->_connectionMethod = -[SiriCoreSiriBackgroundConnection _nextConnectionMethod](self, "_nextConnectionMethod");

  }
  v26 = *v11;
  v27 = os_log_type_enabled(*v11, OS_LOG_TYPE_INFO);
  if (connectionMethod)
  {
    if (v27)
    {
      v28 = self->_connectionMethod;
      if (v28 > 3)
        v29 = CFSTR("POP");
      else
        v29 = off_24CCE6188[v28];
      safetyNetBuffer = self->_safetyNetBuffer;
      if (safetyNetBuffer)
        size = dispatch_data_get_size(safetyNetBuffer);
      else
        size = 0;
      bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
      if (bufferedGeneralOutputData)
        bufferedGeneralOutputData = dispatch_data_get_size(bufferedGeneralOutputData);
      *(_DWORD *)v58 = 136315906;
      *(_QWORD *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallb"
                           "ackToNewMethod:]";
      *(_WORD *)&v58[12] = 2112;
      *(_QWORD *)&v58[14] = v29;
      *(_WORD *)&v58[22] = 2048;
      v59 = size;
      *(_WORD *)v60 = 2048;
      *(_QWORD *)&v60[2] = bufferedGeneralOutputData;
      v35 = v26;
      _os_log_impl(&dword_211AB2000, v35, OS_LOG_TYPE_INFO, "%s falling back to %@ connection method; safety net has %lu bytes, output buffer has %lu bytes",
        v58,
        0x2Au);

    }
    v36 = self->_bufferedGeneralOutputData;
    if (v36)
    {
      if (dispatch_data_get_size((dispatch_data_t)self->_bufferedGeneralOutputData))
      {
        v37 = self->_safetyNetBuffer;
        if (v37)
        {
          concat = (OS_dispatch_data *)dispatch_data_create_concat(v37, v36);
          v39 = self->_safetyNetBuffer;
          self->_safetyNetBuffer = concat;

        }
      }
    }
    v40 = self->_safetyNetBuffer;
    if (v40)
    {
      if (dispatch_data_get_size((dispatch_data_t)self->_safetyNetBuffer))
        v41 = v40;
      else
        v41 = 0;
    }
    else
    {
      v41 = 0;
    }
    objc_storeStrong((id *)&self->_bufferedGeneralOutputData, v41);
  }
  else if (v27)
  {
    v30 = self->_connectionMethod;
    if (v30 > 3)
      v31 = CFSTR("POP");
    else
      v31 = off_24CCE6188[v30];
    *(_DWORD *)v58 = 136315394;
    *(_QWORD *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(_QWORD *)&v58[14] = v31;
    v42 = v26;
    _os_log_impl(&dword_211AB2000, v42, OS_LOG_TYPE_INFO, "%s using %@ connection method", v58, 0x16u);

  }
  objc_storeStrong((id *)&self->_safetyNetBuffer, MEMORY[0x24BDAC990]);
  v43 = -[SiriCoreSiriBackgroundConnection _providerClass](self, "_providerClass");
  v44 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v58 = 136315394;
    *(_QWORD *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:]";
    *(_WORD *)&v58[12] = 2112;
    *(_QWORD *)&v58[14] = v43;
    _os_log_impl(&dword_211AB2000, v44, OS_LOG_TYPE_INFO, "%s Using Provider: %@", v58, 0x16u);
  }
  v45 = (void *)objc_msgSend([v43 alloc], "initWithQueue:", self->_queue);
  objc_msgSend(v10, "connectionPolicyRoute");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setPolicyRoute:", v46);

  if (!connectionMethod)
  {
    objc_msgSend(v10, "connectionPolicy");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setProviderConnectionPolicy:", v47);

  }
  objc_msgSend(v45, "setPrefersWWAN:", objc_msgSend(v10, "prefersWWAN", *(_QWORD *)v58, *(_QWORD *)&v58[8]));
  if ((objc_msgSend(v10, "useWiFiHint") & 1) == 0 && (AFIsNano() & 1) == 0)
  {
    v48 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v58 = 136315138;
      *(_QWORD *)&v58[4] = "-[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallb"
                           "ackToNewMethod:]";
      _os_log_impl(&dword_211AB2000, v48, OS_LOG_TYPE_INFO, "%s Setting scope to Cellular", v58, 0xCu);
    }
    objc_msgSend(v45, "setPrefersWWAN:", 1);
  }
  if (-[SiriCoreSiriBackgroundConnection _usingPOP](self, "_usingPOP"))
    v49 = AFIsNano() ^ 1;
  else
    v49 = 0;
  objc_msgSend(v45, "setConnectByPOPMethod:", v49);
  objc_msgSend(v45, "setDelegate:", self);
  connectionProvider = self->_connectionProvider;
  self->_connectionProvider = (SiriCoreConnectionProvider *)v45;
  v51 = v45;

  v52 = (objc_class *)objc_opt_class();
  NSStringFromClass(v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setConnectionProvider:", v53);

  -[SiriCoreSiriBackgroundConnection delegate](self, "delegate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreConnectionProvider connectionType](self->_connectionProvider, "connectionType");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "siriBackgroundConnection:willStartWithConnectionType:", self, v56);
  -[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:](self, "_startNetworkProviderWithInfo:", v10);

}

- (void)_setNetworkProvider:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_connectionProvider, a3);
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setConnectionProvider:", v7);
}

- (Class)_providerClass
{
  objc_class *peerProviderClass;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[SiriCoreSiriBackgroundConnection _usingPeer](self, "_usingPeer"))
  {
    peerProviderClass = self->_peerProviderClass;
    if (!peerProviderClass)
LABEL_18:
      peerProviderClass = (objc_class *)objc_opt_class();
  }
  else if (-[SiriCoreSiriConnectionInfo requiresURLSession](self->_connectionInfo, "requiresURLSession"))
  {
    v4 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[SiriCoreSiriBackgroundConnection _providerClass]";
      _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_DEFAULT, "%s Forcing provider to URL Session due to connection info", (uint8_t *)&v10, 0xCu);
    }
    peerProviderClass = (objc_class *)objc_opt_class();
    if (!peerProviderClass)
      goto LABEL_18;
  }
  else
  {
    if (!AFIsInternalInstall() || (AFIsNano() & 1) != 0)
      goto LABEL_18;
    _AFPreferencesNetworkStackOverride();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NWConnection")) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("NetworkSessionProvider")))
    {
      peerProviderClass = (objc_class *)objc_opt_class();
      if (peerProviderClass)
      {
        v6 = (void *)*MEMORY[0x24BE08FC0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
        {
          v7 = v6;
          NSStringFromClass(peerProviderClass);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 136315394;
          v11 = "-[SiriCoreSiriBackgroundConnection _providerClass]";
          v12 = 2112;
          v13 = v8;
          _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_DEFAULT, "%s Forcing network provider to %@ due to preferences", (uint8_t *)&v10, 0x16u);

        }
      }
    }
    else
    {
      peerProviderClass = 0;
    }

    if (!peerProviderClass)
      goto LABEL_18;
  }
  return peerProviderClass;
}

- (id)_getInitialPayloadWithBufferedLength:(unint64_t *)a3 forceReconnect:(BOOL)a4
{
  _BOOL8 v4;
  dispatch_data_t concat;
  NSObject *v8;
  id v9;
  NSObject *bufferedGeneralOutputData;
  NSObject *size;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_data_t v15;
  NSObject *v16;

  v4 = a4;
  *a3 = 0;
  concat = 0;
  if (-[SiriCoreSiriBackgroundConnection _usingPOP](self, "_usingPOP"))
  {
    if (-[SiriCoreConnectionProvider supportsInitialPayload](self->_connectionProvider, "supportsInitialPayload"))
    {
      -[SiriCoreConnectionProvider headerDataWithForceReconnect:](self->_connectionProvider, "headerDataWithForceReconnect:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = MEMORY[0x24BDAC990];
        v9 = MEMORY[0x24BDAC990];
      }
      bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
      if (bufferedGeneralOutputData)
      {
        concat = dispatch_data_create_concat(v8, bufferedGeneralOutputData);

        size = self->_bufferedGeneralOutputData;
        if (size)
          size = dispatch_data_get_size(size);
        *a3 = (unint64_t)size;
      }
      else
      {
        -[SiriCoreSiriBackgroundConnection _httpHeaderData](self, "_httpHeaderData");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = dispatch_data_create_concat(v8, v12);

        -[SiriCoreSiriBackgroundConnection _aceHeaderData](self, "_aceHeaderData");
        v14 = objc_claimAutoreleasedReturnValue();
        concat = dispatch_data_create_concat(v13, v14);

      }
    }
    else
    {
      concat = 0;
    }
  }
  if (concat == (dispatch_data_t)MEMORY[0x24BDAC990])
    v15 = 0;
  else
    v15 = concat;
  v16 = v15;

  return v16;
}

- (void)_updateBuffersForInitialPayload:(id)a3 bufferedLength:(unint64_t)a4 forceReconnect:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *safetyNetBuffer;
  OS_dispatch_data *concat;
  OS_dispatch_data *v13;
  OS_dispatch_data *v14;
  NSObject *v15;
  size_t v16;
  OS_dispatch_data *subrange;
  id v18;
  OS_dispatch_data *v19;
  size_t size;
  NSObject *bufferedGeneralOutputData;
  int v22;
  const char *v23;
  __int16 v24;
  size_t v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = *MEMORY[0x24BE08FC0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      size = dispatch_data_get_size(v8);
      bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
      if (bufferedGeneralOutputData)
        bufferedGeneralOutputData = dispatch_data_get_size(bufferedGeneralOutputData);
      v22 = 136315650;
      v23 = "-[SiriCoreSiriBackgroundConnection _updateBuffersForInitialPayload:bufferedLength:forceReconnect:]";
      v24 = 2048;
      v25 = size;
      v26 = 2048;
      v27 = bufferedGeneralOutputData;
      _os_log_debug_impl(&dword_211AB2000, v9, OS_LOG_TYPE_DEBUG, "%s Stream opened with initial payload length %lu, buffered general output length %lu", (uint8_t *)&v22, 0x20u);
    }
    safetyNetBuffer = self->_safetyNetBuffer;
    if (safetyNetBuffer)
    {
      concat = (OS_dispatch_data *)dispatch_data_create_concat(safetyNetBuffer, v8);
      v13 = self->_safetyNetBuffer;
      self->_safetyNetBuffer = concat;

    }
    v14 = self->_bufferedGeneralOutputData;
    v15 = v14;
    if (v14)
    {
      v16 = dispatch_data_get_size((dispatch_data_t)v14);
      if (v16 <= a4)
      {
        subrange = (OS_dispatch_data *)MEMORY[0x24BDAC990];
        v18 = MEMORY[0x24BDAC990];
      }
      else
      {
        subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v15, a4, v16 - a4);
      }
    }
    else
    {
      subrange = 0;
    }

    v19 = self->_bufferedGeneralOutputData;
    self->_bufferedGeneralOutputData = subrange;

  }
  else
  {
    if (v10)
    {
      v22 = 136315138;
      v23 = "-[SiriCoreSiriBackgroundConnection _updateBuffersForInitialPayload:bufferedLength:forceReconnect:]";
      _os_log_debug_impl(&dword_211AB2000, v9, OS_LOG_TYPE_DEBUG, "%s No initial payload", (uint8_t *)&v22, 0xCu);
    }
    -[SiriCoreSiriBackgroundConnection _prepareProviderHeaderWithForceReconnect:](self, "_prepareProviderHeaderWithForceReconnect:", v5);
  }
  -[SiriCoreSiriBackgroundConnection _initializeBufferedGeneralOutputDataWithInitialPayload:](self, "_initializeBufferedGeneralOutputDataWithInitialPayload:", v8 != 0);

}

- (void)_startNetworkProviderWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SiriCoreConnectionProvider *v7;
  SiriCoreSiriConnectionInfo *v8;
  BOOL v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  SiriCoreConnectionProvider *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  SiriCoreConnectionProvider *connectionProvider;
  void *v26;
  id v27;
  id v28;
  SiriCoreSiriConnectionInfo *v29;
  id v30;
  SiriCoreConnectionProvider *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  SiriCoreConnectionProvider *v37;
  SiriCoreSiriBackgroundConnection *v38;
  id v39;
  SiriCoreSiriConnectionInfo *v40;
  id v41;
  id v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  v45 = 0;
  -[SiriCoreSiriBackgroundConnection _getInitialPayloadWithBufferedLength:forceReconnect:](self, "_getInitialPayloadWithBufferedLength:forceReconnect:", &v45, objc_msgSend(v4, "forceReconnect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_connectionProvider;
  v8 = self->_connectionInfo;
  v9 = -[SiriCoreSiriBackgroundConnection _usingPOP](self, "_usingPOP");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v11;
  if (AFIsInternalInstall())
  {
    v49[0] = v11;
    v48[0] = CFSTR("provider");
    v48[1] = CFSTR("id");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v12;
    v48[2] = CFSTR("connectionId");
    -[SiriCoreSiriConnectionInfo connectionId](v8, "connectionId");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = &stru_24CCE7768;
    v49[2] = v15;
    v48[3] = CFSTR("url");
    -[SiriCoreSiriConnectionInfo url](v8, "url");
    v34 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = objc_claimAutoreleasedReturnValue();
    v32 = v4;
    v18 = v9;
    v19 = v7;
    v20 = v6;
    v21 = (void *)v17;
    if (v17)
      v22 = (const __CFString *)v17;
    else
      v22 = &stru_24CCE7768;
    v49[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4, v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v20;
    v7 = v19;
    v9 = v18;
    v4 = v33;

    v5 = v34;
  }
  else
  {
    v46[0] = CFSTR("provider");
    v46[1] = CFSTR("id");
    v47[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "logEventWithType:context:", 1007, v23);

  connectionProvider = self->_connectionProvider;
  -[SiriCoreSiriConnectionInfo connectionId](v8, "connectionId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke;
  v36[3] = &unk_24CCE6000;
  v37 = v7;
  v38 = self;
  v44 = v9;
  v39 = v23;
  v40 = v8;
  v42 = v4;
  v43 = v45;
  v41 = v6;
  v27 = v4;
  v28 = v6;
  v29 = v8;
  v30 = v23;
  v31 = v7;
  -[SiriCoreConnectionProvider openConnectionForURL:withConnectionId:initialPayload:completion:](connectionProvider, "openConnectionForURL:withConnectionId:initialPayload:completion:", v5, v26, v28, v36);

}

- (void)cancel
{
  id WeakRetained;

  if (!self->_isCanceled)
  {
    -[SiriCoreSiriBackgroundConnection _closeConnection](self, "_closeConnection");
    self->_isCanceled = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    objc_msgSend(WeakRetained, "siriBackgroundConnectionDidClose:", self);

  }
}

- (void)updateActiveBackgroundConnectionWithSecondary
{
  SiriCoreConnectionProvider *secondaryConnectionProvider;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  double v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SiriCoreSiriBackgroundConnection _closeConnectionAndPrepareForReconnect:](self, "_closeConnectionAndPrepareForReconnect:", 0);
  objc_storeStrong((id *)&self->_connectionProvider, self->_secondaryConnectionProvider);
  secondaryConnectionProvider = self->_secondaryConnectionProvider;
  self->_secondaryConnectionProvider = 0;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConnectionProvider:", v5);

  v7 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[SiriCoreSiriBackgroundConnection updateActiveBackgroundConnectionWithSecondary]";
    _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_INFO, "%s secondary provider opened", (uint8_t *)&v10, 0xCu);
  }
  v8 = -[SiriCoreConnectionProvider shouldFallbackQuickly](self->_connectionProvider, "shouldFallbackQuickly");
  v9 = 7.0;
  if (v8)
    v9 = 5.0;
  -[SiriCoreSiriBackgroundConnection _scheduleAceHeaderTimeoutTimerWithInterval:](self, "_scheduleAceHeaderTimeoutTimerWithInterval:", v9);
  -[SiriCoreSiriBackgroundConnection _updateBuffersForInitialPayload:bufferedLength:forceReconnect:](self, "_updateBuffersForInitialPayload:bufferedLength:forceReconnect:", 0, 0, -[SiriCoreSiriConnectionInfo forceReconnect](self->_connectionInfo, "forceReconnect"));
  self->_httpResponseHeader = CFHTTPMessageCreateEmpty(0, 0);
  -[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider](self, "_setupReadHandlerOnProvider");
  -[SiriCoreSiriBackgroundConnection _networkProviderDidOpen](self, "_networkProviderDidOpen");
  self->_secondaryConnectionOpenState = 0;
  *(_WORD *)&self->_primaryConnectionViable = 1;

}

- (void)_startSecondaryConnection
{
  NSObject *v3;
  SiriCoreSiriConnectionInfo *v4;
  void *v5;
  SiriCoreNWConnection *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  SiriCoreConnectionProvider *secondaryConnectionProvider;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[4];
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!self->_secondaryConnectionOpenState)
  {
    v3 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[SiriCoreSiriBackgroundConnection _startSecondaryConnection]";
      _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting secondary connection.", buf, 0xCu);
    }
    self->_secondaryConnectionOpenState = 1;
    v4 = self->_connectionInfo;
    -[SiriCoreSiriConnectionInfo url](v4, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SiriCoreNWConnection initWithQueue:]([SiriCoreNWConnection alloc], "initWithQueue:", self->_queue);
    -[SiriCoreSiriConnectionInfo connectionPolicyRoute](v4, "connectionPolicyRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreNWConnection setPolicyRoute:](v6, "setPolicyRoute:", v7);

    -[SiriCoreSiriConnectionInfo connectionPolicy](v4, "connectionPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreNWConnection setProviderConnectionPolicy:](v6, "setProviderConnectionPolicy:", v8);

    -[SiriCoreNWConnection setPrefersWWAN:](v6, "setPrefersWWAN:", -[SiriCoreSiriConnectionInfo prefersWWAN](v4, "prefersWWAN"));
    -[SiriCoreNWConnection setConnectByPOPMethod:](v6, "setConnectByPOPMethod:", 0);
    -[SiriCoreNWConnection setDelegate:](v6, "setDelegate:", self);
    objc_storeStrong((id *)&self->_secondaryConnectionProvider, v6);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (AFIsInternalInstall())
    {
      v29[0] = v10;
      v28[0] = CFSTR("provider");
      v28[1] = CFSTR("id");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v11;
      v28[2] = CFSTR("connectionId");
      -[SiriCoreSiriConnectionInfo connectionId](v4, "connectionId");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (const __CFString *)v12;
      else
        v14 = &stru_24CCE7768;
      v29[2] = v14;
      v28[3] = CFSTR("url");
      -[SiriCoreSiriConnectionInfo url](v4, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (const __CFString *)v16;
      else
        v18 = &stru_24CCE7768;
      v29[3] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26[0] = CFSTR("provider");
      v26[1] = CFSTR("id");
      v27[0] = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logEventWithType:context:", 1009, v19);

    secondaryConnectionProvider = self->_secondaryConnectionProvider;
    -[SiriCoreSiriConnectionInfo connectionId](v4, "connectionId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __61__SiriCoreSiriBackgroundConnection__startSecondaryConnection__block_invoke;
    v24[3] = &unk_24CCE6028;
    v24[4] = self;
    v25 = v19;
    v23 = v19;
    -[SiriCoreConnectionProvider openConnectionForURL:withConnectionId:initialPayload:completion:](secondaryConnectionProvider, "openConnectionForURL:withConnectionId:initialPayload:completion:", v5, v22, 0, v24);

  }
}

- (void)_cancelSecondaryConnection
{
  SiriCoreConnectionProvider *secondaryConnectionProvider;
  NSObject *v4;
  SiriCoreConnectionProvider *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  secondaryConnectionProvider = self->_secondaryConnectionProvider;
  if (secondaryConnectionProvider)
  {
    v4 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315138;
      v7 = "-[SiriCoreSiriBackgroundConnection _cancelSecondaryConnection]";
      _os_log_debug_impl(&dword_211AB2000, v4, OS_LOG_TYPE_DEBUG, "%s Canceling secondary connection", (uint8_t *)&v6, 0xCu);
      secondaryConnectionProvider = self->_secondaryConnectionProvider;
    }
    -[SiriCoreConnectionProvider close](secondaryConnectionProvider, "close");
    v5 = self->_secondaryConnectionProvider;
    self->_secondaryConnectionProvider = 0;

    self->_secondaryConnectionOpenState = 0;
    self->_betterPathAvailable = 0;
  }
}

- (void)_forceTriggerRetry
{
  id WeakRetained;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 32, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriBackgroundConnection:didEncounterError:analysisInfo:", self, v4, 0);

}

- (id)_httpHeaderData
{
  _BOOL4 siriConnectionUsesPeerManagedSync;
  void *v4;
  void *v5;
  void *v6;
  SiriCoreSiriConnectionInfo *connectionInfo;
  void *v8;
  void *v9;

  siriConnectionUsesPeerManagedSync = self->_siriConnectionUsesPeerManagedSync;
  -[SiriCoreSiriConnectionInfo url](self->_connectionInfo, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriConnectionInfo aceHost](self->_connectionInfo, "aceHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriConnectionInfo languageCode](self->_connectionInfo, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connectionInfo = self->_connectionInfo;
  if (siriConnectionUsesPeerManagedSync)
    -[SiriCoreSiriConnectionInfo peerAssistantIdentifier](connectionInfo, "peerAssistantIdentifier");
  else
    -[SiriCoreSiriConnectionInfo assistantIdentifier](connectionInfo, "assistantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriCoreSiriBackgroundConnection _headerDataForURL:aceHost:languageCode:syncAssistantId:](self, "_headerDataForURL:aceHost:languageCode:syncAssistantId:", v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_aceHeaderData
{
  return +[SiriCoreAceSerialization dataForStreamHeaderWithCompressionType:](SiriCoreAceSerialization, "dataForStreamHeaderWithCompressionType:", 2);
}

- (void)_initializeBufferedGeneralOutputDataWithInitialPayload:(BOOL)a3
{
  OS_dispatch_data **p_bufferedGeneralOutputData;
  OS_dispatch_data *bufferedGeneralOutputData;
  SiriCoreZlibDataCompressor *v7;
  SiriCoreDataCompressor *outputCompressor;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  SiriCoreZlibDataCompressor *v12;
  SiriCoreDataCompressor *v13;
  NSObject *v14;
  void *v15;
  OS_dispatch_data **p_bufferedUncompressedData;
  OS_dispatch_data *bufferedUncompressedData;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
  p_bufferedGeneralOutputData = &self->_bufferedGeneralOutputData;
  if (!bufferedGeneralOutputData)
  {
    objc_storeStrong((id *)p_bufferedGeneralOutputData, MEMORY[0x24BDAC990]);
    if (a3)
    {
      v7 = objc_alloc_init(SiriCoreZlibDataCompressor);
      outputCompressor = self->_outputCompressor;
      self->_outputCompressor = &v7->super;

    }
    else
    {
      v9 = (os_log_t *)MEMORY[0x24BE08FC0];
      v10 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        v18 = 136315138;
        v19 = "-[SiriCoreSiriBackgroundConnection _initializeBufferedGeneralOutputDataWithInitialPayload:]";
        _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s Sending HTTP Header", (uint8_t *)&v18, 0xCu);
      }
      -[SiriCoreSiriBackgroundConnection _httpHeaderData](self, "_httpHeaderData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreSiriBackgroundConnection _bufferGeneralData:](self, "_bufferGeneralData:", v11);

      v12 = objc_alloc_init(SiriCoreZlibDataCompressor);
      v13 = self->_outputCompressor;
      self->_outputCompressor = &v12->super;

      v14 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        v18 = 136315138;
        v19 = "-[SiriCoreSiriBackgroundConnection _initializeBufferedGeneralOutputDataWithInitialPayload:]";
        _os_log_impl(&dword_211AB2000, v14, OS_LOG_TYPE_INFO, "%s Sending ACE Header", (uint8_t *)&v18, 0xCu);
      }
      -[SiriCoreSiriBackgroundConnection _aceHeaderData](self, "_aceHeaderData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreSiriBackgroundConnection _bufferGeneralData:](self, "_bufferGeneralData:", v15);

    }
  }
  bufferedUncompressedData = self->_bufferedUncompressedData;
  p_bufferedUncompressedData = &self->_bufferedUncompressedData;
  if (!bufferedUncompressedData)
    objc_storeStrong((id *)p_bufferedUncompressedData, MEMORY[0x24BDAC990]);
}

- (void)_closeConnectionAndPrepareForReconnect:(BOOL)a3
{
  SiriCoreConnectionProvider *connectionProvider;
  OS_dispatch_data *bufferedInputData;
  SiriCoreDataDecompressor *inputDecompressor;
  OS_dispatch_data *bufferedGeneralOutputData;
  SiriCoreDataCompressor *outputCompressor;
  OS_dispatch_data *bufferedUncompressedData;
  __CFHTTPMessage *httpResponseHeader;
  NSObject *aceHeaderTimerSource;
  OS_dispatch_source *v13;
  NSObject *pingTimerSource;
  OS_dispatch_source *v15;

  -[SiriCoreConnectionProvider close](self->_connectionProvider, "close");
  connectionProvider = self->_connectionProvider;
  self->_connectionProvider = 0;

  bufferedInputData = self->_bufferedInputData;
  self->_bufferedInputData = 0;

  inputDecompressor = self->_inputDecompressor;
  self->_inputDecompressor = 0;

  if (!a3)
  {
    bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
    self->_bufferedGeneralOutputData = 0;

    outputCompressor = self->_outputCompressor;
    self->_outputCompressor = 0;

    bufferedUncompressedData = self->_bufferedUncompressedData;
    self->_bufferedUncompressedData = 0;

    -[SiriCoreSiriBackgroundConnection _cancelOutstandingBarriers](self, "_cancelOutstandingBarriers");
  }
  httpResponseHeader = self->_httpResponseHeader;
  if (httpResponseHeader)
  {
    CFRelease(httpResponseHeader);
    self->_httpResponseHeader = 0;
  }
  aceHeaderTimerSource = self->_aceHeaderTimerSource;
  if (aceHeaderTimerSource)
  {
    dispatch_source_cancel(aceHeaderTimerSource);
    v13 = self->_aceHeaderTimerSource;
    self->_aceHeaderTimerSource = 0;

  }
  pingTimerSource = self->_pingTimerSource;
  if (pingTimerSource)
  {
    dispatch_source_cancel(pingTimerSource);
    if (!self->_isOpened)
      dispatch_resume((dispatch_object_t)self->_pingTimerSource);
    v15 = self->_pingTimerSource;
    self->_pingTimerSource = 0;

  }
  *(_WORD *)&self->_isOpened = 0;
  self->_hasReportedError = 0;
  kdebug_trace();
}

- (void)_closeConnection
{
  -[SiriCoreSiriBackgroundConnection _closeConnectionAndPrepareForReconnect:](self, "_closeConnectionAndPrepareForReconnect:", 0);
}

- (void)_didEncounterError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  SiriCoreSiriBackgroundConnection *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_hasReportedError)
  {
    -[NSMutableDictionary objectForKey:](self->_errorsForConnectionMethods, "objectForKey:", &unk_24CCF53C0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
      goto LABEL_11;
    if (objc_msgSend(v5, "isPeerNotNearbyError") && AFHasCellularData())
    {
      v7 = v4;
    }
    else
    {
      v8 = objc_msgSend(v6, "isPeerConnectionError");
      v9 = (void *)MEMORY[0x24BE091D8];
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreSiriBackgroundConnection _bestErrorBetweenError:peerError:](self, "_bestErrorBetweenError:peerError:", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v12 = CFSTR("Couldn't reach companion for peer connection");
        v13 = v9;
        v14 = 1000;
      }
      else
      {
        v12 = CFSTR("Companion couldn't reach Siri");
        v13 = v9;
        v14 = 1001;
      }
      objc_msgSend(v13, "errorWithCode:description:underlyingError:", v14, v12, v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[objc_class getMetricsContext:](self->_peerProviderClass, "getMetricsContext:", &__block_literal_global_582);
    if (!v7)
LABEL_11:
      v7 = v4;
    v15 = (void *)*MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v6, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[SiriCoreSiriBackgroundConnection _didEncounterError:]";
      v27 = 2112;
      v28 = self;
      v29 = 2112;
      v30 = v4;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_INFO, "%s connection (%@) error=(%@)\npeerError=(%@)\nfinalError=(%@)", (uint8_t *)&v25, 0x34u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SiriCoreSiriBackgroundConnection analysisInfo](self, "analysisInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "siriBackgroundConnection:didEncounterError:analysisInfo:", self, v7, v19);

    -[SiriCoreSiriConnectionInfo url](self->_connectionInfo, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)*MEMORY[0x24BE08E40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08E40], OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        objc_msgSend(v20, "absoluteString");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = objc_msgSend(v23, "UTF8String");
        v25 = 136315138;
        v26 = (const char *)v24;
        _os_log_error_impl(&dword_211AB2000, v22, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v25, 0xCu);

      }
    }
    self->_hasReportedError = 1;

  }
}

- (id)_bestErrorBetweenError:(id)a3 peerError:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD1398]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = v10;
    else
      v11 = v6;
    v8 = v11;

  }
  return v8;
}

- (BOOL)_hasBufferedDataOrOutstandingPings
{
  NSObject *bufferedInputData;
  NSObject *bufferedGeneralOutputData;

  bufferedInputData = self->_bufferedInputData;
  return bufferedInputData && dispatch_data_get_size(bufferedInputData)
      || (bufferedGeneralOutputData = self->_bufferedGeneralOutputData) != 0
      && dispatch_data_get_size(bufferedGeneralOutputData)
      || self->_pingTimerSource != 0;
}

- (BOOL)_shouldTrySameConnectionMethodForMethod:(int64_t)a3 error:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  BOOL v14;

  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD1398]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v5;
  v10 = v9;

  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1128]) & 1) == 0
    && !objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDE08F8]))
  {
    goto LABEL_17;
  }
  v12 = objc_msgSend(v10, "code");
  v14 = v12 == 9 || v12 == 57;
  if (a3 == 3 && v12 != 9 && v12 != 57)
  {
    if (v12 == 54)
    {
      v14 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v14 = 0;
  }
LABEL_18:

  return v14;
}

- (void)_fallBackToNextConnectionMethod:(int64_t)a3 fromError:(id)a4 afterDelay:(double)a5
{
  id v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *errorsForConnectionMethods;
  SiriCoreErrorInfo *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *queue;
  _QWORD block[6];
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (os_log_t *)MEMORY[0x24BE08FC0];
  v10 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:]";
    v24 = 2112;
    v25 = *(double *)&v8;
    _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_connectionMethod);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_errorsForConnectionMethods, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = 0;
  else
    v13 = -[SiriCoreSiriBackgroundConnection _shouldTrySameConnectionMethodForMethod:error:](self, "_shouldTrySameConnectionMethodForMethod:error:", self->_connectionMethod, v8);
  if (!self->_errorsForConnectionMethods)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    errorsForConnectionMethods = self->_errorsForConnectionMethods;
    self->_errorsForConnectionMethods = v14;

  }
  if (v8)
  {
    v16 = objc_alloc_init(SiriCoreErrorInfo);
    -[SiriCoreErrorInfo setError:](v16, "setError:", v8);
    -[SiriCoreErrorInfo setIsPeerConnectionError:](v16, "setIsPeerConnectionError:", -[SiriCoreConnectionProvider isPeerConnectionError:](self->_connectionProvider, "isPeerConnectionError:", v8));
    -[SiriCoreErrorInfo setIsPeerNotNearbyError:](v16, "setIsPeerNotNearbyError:", -[SiriCoreConnectionProvider isPeerNotNearbyError:](self->_connectionProvider, "isPeerNotNearbyError:", v8));
    -[NSMutableDictionary setObject:forKey:](self->_errorsForConnectionMethods, "setObject:forKey:", v16, v11);

  }
  -[SiriCoreSiriBackgroundConnection _closeConnectionAndPrepareForReconnect:](self, "_closeConnectionAndPrepareForReconnect:", 1);
  if (a5 <= 0.0)
  {
    -[SiriCoreSiriBackgroundConnection _startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:](self, "_startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:", self->_connectionInfo, a3, !v13);
  }
  else
  {
    v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:]";
      v24 = 2048;
      v25 = a5;
      _os_log_impl(&dword_211AB2000, v17, OS_LOG_TYPE_DEFAULT, "%s Delaying fallback for %lfs", buf, 0x16u);
    }
    v18 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__SiriCoreSiriBackgroundConnection__fallBackToNextConnectionMethod_fromError_afterDelay___block_invoke;
    block[3] = &unk_24CCE6090;
    block[4] = self;
    block[5] = a3;
    v21 = v13;
    dispatch_after(v18, queue, block);
  }

}

- (void)_fallBackToNextConnectionMethodWithError:(id)a3 orElse:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  os_log_t *v8;
  NSObject *v9;
  int64_t v10;
  double v11;
  uint64_t NextSupported;
  OS_dispatch_data **p_safetyNetBuffer;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  _BOOL4 v23;
  OS_dispatch_data *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  int v30;
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FC0];
  v9 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136315394;
    v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v30, 0x16u);
  }
  v10 = -[SiriCoreSiriBackgroundConnection _nextConnectionMethod](self, "_nextConnectionMethod");
  v11 = 0.0;
  if (v10)
  {
    NextSupported = v10;
    goto LABEL_5;
  }
  if (self->_connectionMethod != 2 || !self->_usesProxyConnection)
    goto LABEL_24;
  if (-[SiriCoreSiriConnectionInfo useWiFiHint](self->_connectionInfo, "useWiFiHint"))
  {
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315394;
      v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_DEFAULT, "%s Resetting connection method on error (%@) while trying peer", (uint8_t *)&v30, 0x16u);
    }
    -[SiriCoreSiriConnectionInfo connectionPolicyRoute](self->_connectionInfo, "connectionPolicyRoute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NextSupported = _SiriCoreSiriConnectionMethodGetNextSupported(0, v18, self->_usesProxyConnection);

    -[SiriCoreSiriConnectionInfo setUseWiFiHint:](self->_connectionInfo, "setUseWiFiHint:", 0);
    goto LABEL_5;
  }
  if (!AFHasCellularData() || !objc_msgSend(v6, "siriCore_isNetworkDownError"))
  {
LABEL_24:
    p_safetyNetBuffer = &self->_safetyNetBuffer;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "systemUptime");
  v21 = v20 - self->_firstStartTime;

  v22 = *v8;
  v23 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (v21 > 30.0)
  {
    if (v23)
    {
      v30 = 136315138;
      v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
      _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_DEFAULT, "%s Ran out of time waiting for network to become available", (uint8_t *)&v30, 0xCu);
    }
    goto LABEL_24;
  }
  if (v23)
  {
    v30 = 136315394;
    v31 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:]";
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_DEFAULT, "%s Resetting connection method on error (%@) while waiting for cellular", (uint8_t *)&v30, 0x16u);
  }
  -[SiriCoreSiriConnectionInfo connectionPolicyRoute](self->_connectionInfo, "connectionPolicyRoute");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "type");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NextSupported = _SiriCoreSiriConnectionMethodGetNextSupported(0, v26, self->_usesProxyConnection);

  v11 = 1.0;
LABEL_5:
  p_safetyNetBuffer = &self->_safetyNetBuffer;
  if (self->_safetyNetBuffer
    && NextSupported
    && -[SiriCoreSiriBackgroundConnection _canFallBackFromError:](self, "_canFallBackFromError:", v6))
  {
    -[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:](self, "_fallBackToNextConnectionMethod:fromError:afterDelay:", NextSupported, v6, v11);
    if (v6)
    {
      -[SiriCoreSiriConnectionInfo url](self->_connectionInfo, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)*MEMORY[0x24BE08E40];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08E40], OS_LOG_TYPE_ERROR))
        {
          v27 = v15;
          objc_msgSend(v14, "absoluteString");
          v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v29 = objc_msgSend(v28, "UTF8String");
          v30 = 136315138;
          v31 = (const char *)v29;
          _os_log_error_impl(&dword_211AB2000, v27, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v30, 0xCu);

        }
      }

    }
    goto LABEL_27;
  }
LABEL_25:
  v24 = *p_safetyNetBuffer;
  *p_safetyNetBuffer = 0;

  if (v7)
    v7[2](v7);
LABEL_27:

}

- (BOOL)_canFallBackFromError:(id)a3
{
  return -[SiriCoreConnectionProvider shouldFallbackFromError:](self->_connectionProvider, "shouldFallbackFromError:", a3);
}

- (void)_getCellularMetrics:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v7 = &unk_24CCF53D8;
  v3 = a3;
  +[SiriCoreNetworkManager getCarrierName:signalStrength:subscriptionCount:](SiriCoreNetworkManager, "getCarrierName:signalStrength:subscriptionCount:", &v9, &v8, &v7);
  v4 = v9;
  v5 = v8;
  v6 = v7;
  objc_msgSend(v3, "setCarrierName:", v4);
  objc_msgSend(v3, "setSignalStrengthBars:", v5);
  objc_msgSend(v3, "setSimSubscriptions:", v6);

}

- (int64_t)_normalizeSNR:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;

  v3 = 40;
  if ((unint64_t)(a3 - 25) < 0xF)
    v3 = 25;
  if ((unint64_t)(a3 - 15) >= 0xA)
    v4 = v3;
  else
    v4 = 15;
  if ((unint64_t)(a3 - 10) >= 5)
    v5 = v4;
  else
    v5 = 10;
  if ((unint64_t)a3 >= 0xA)
    return v5;
  else
    return 0;
}

- (void)_getWifiMetrics:(id)a3
{
  id v4;
  SiriCoreWiFiManagerClient *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v16 = 0;
  v15 = 0;
  v4 = a3;
  v5 = objc_alloc_init(SiriCoreWiFiManagerClient);
  v13 = 0;
  v14 = 0;
  -[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:](v5, "hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:", &v18, &v17, &v16, &v14, &v13, &v15);
  v6 = v14;
  v7 = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRssi:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCca:", v9);

  objc_msgSend(v4, "setWifiPhyMode:", v6);
  objc_msgSend(v4, "setWifiChannelInfo:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsCaptive:", v10);

  v11 = -[SiriCoreSiriBackgroundConnection _normalizeSNR:](self, "_normalizeSNR:", v17);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSnr:", v12);

}

- (BOOL)_tcpInfoIndicatesPoorLinkQuality
{
  return -[SiriCoreConnectionProvider providerStatsIndicatePoorLinkQuality](self->_connectionProvider, "providerStatsIndicatePoorLinkQuality");
}

- (BOOL)_wifiOrCellularMayBeBetterThanCurrentStream
{
  char v3;

  v3 = AFDeviceSupportsWiFiLPASMode();
  return v3 & -[SiriCoreSiriBackgroundConnection _tcpInfoIndicatesPoorLinkQuality](self, "_tcpInfoIndicatesPoorLinkQuality");
}

- (void)_scheduleAceHeaderTimeoutTimerWithInterval:(double)a3
{
  NSObject *v5;
  NSObject *aceHeaderTimerSource;
  OS_dispatch_source *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  _QWORD handler[4];
  NSObject *v14;
  id v15[2];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriCoreSiriBackgroundConnection _scheduleAceHeaderTimeoutTimerWithInterval:]";
    v18 = 1024;
    v19 = (int)a3;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Scheduling Ace Header timeout for %d seconds", buf, 0x12u);
  }
  aceHeaderTimerSource = self->_aceHeaderTimerSource;
  if (aceHeaderTimerSource)
  {
    dispatch_source_cancel(aceHeaderTimerSource);
    v7 = self->_aceHeaderTimerSource;
    self->_aceHeaderTimerSource = 0;

  }
  if (a3 > 0.0)
  {
    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, (unint64_t)(a3 * 1000000000.0), 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __79__SiriCoreSiriBackgroundConnection__scheduleAceHeaderTimeoutTimerWithInterval___block_invoke;
    handler[3] = &unk_24CCE60B8;
    v10 = v8;
    v14 = v10;
    objc_copyWeak(v15, (id *)buf);
    v15[1] = *(id *)&a3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(v10);
    v11 = self->_aceHeaderTimerSource;
    self->_aceHeaderTimerSource = (OS_dispatch_source *)v10;
    v12 = v10;

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_aceHeaderTimeoutFired:(id)a3 afterTimeout:(double)a4
{
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  os_log_t *v17;
  NSObject *v18;
  NSObject *v19;
  id WeakRetained;
  id v21;
  _QWORD v22[5];
  id v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (OS_dispatch_source *)a3;
  v7 = v6;
  if (self->_aceHeaderTimerSource == v6)
  {
    self->_aceHeaderTimerSource = 0;

    ++self->_aceHeaderTimerFireCount;
    if (!-[SiriCoreSiriBackgroundConnection _hasReadACEHeader](self, "_hasReadACEHeader"))
    {
      if (self->_isOpened && self->_aceHeaderTimerFireCount <= 1)
      {
        if (-[SiriCoreSiriBackgroundConnection _usingPOP](self, "_usingPOP"))
        {
          v8 = *MEMORY[0x24BE08FC0];
          v9 = 1;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
            v10 = "%s ACE Header timeout while using POP Connection Method";
LABEL_13:
            _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
            goto LABEL_14;
          }
          goto LABEL_14;
        }
        if (-[SiriCoreSiriBackgroundConnection _usingFlorence](self, "_usingFlorence"))
        {
          v8 = *MEMORY[0x24BE08FC0];
          v9 = 1;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
            v10 = "%s ACE Header timeout while using Florence";
            goto LABEL_13;
          }
LABEL_14:
          v11 = 0;
          goto LABEL_15;
        }
        if (!-[SiriCoreSiriBackgroundConnection _usingPeer](self, "_usingPeer")
          || !-[SiriCoreSiriBackgroundConnection _wifiOrCellularMayBeBetterThanCurrentStream](self, "_wifiOrCellularMayBeBetterThanCurrentStream"))
        {
          v17 = (os_log_t *)MEMORY[0x24BE08FC0];
          v18 = *MEMORY[0x24BE08FC0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
            _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, "%s Rescheduling aceheader timeout since wifi isn't available or bt link is ok", buf, 0xCu);
          }
          -[SiriCoreSiriBackgroundConnection _scheduleAceHeaderTimeoutTimerWithInterval:](self, "_scheduleAceHeaderTimeoutTimerWithInterval:", 30.0 - a4);
          if (self->_isOpened)
          {
            v19 = *v17;
            if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
              _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, "%s Ace Header Timeout. Intermediate error", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 5, 0);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

            if (WeakRetained)
            {
              v21 = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v21, "siriBackgroundConnection:didEncounterIntermediateError:", self, v16);

            }
          }
          else
          {
            v16 = 0;
          }
          v11 = 0;
          goto LABEL_21;
        }
        v26 = CFSTR("SiriCoreSiriConnectionShouldSkipIDSOnNextAttemptKey");
        v27 = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      v9 = 0;
LABEL_15:
      v12 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SiriCoreSiriBackgroundConnection _aceHeaderTimeoutFired:afterTimeout:]";
        _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_INFO, "%s Ace Header Timeout. Error", buf, 0xCu);
      }
      if (v9)
      {
        v24 = CFSTR("SiriCoreSiriConnectionShouldSkipTuscanyOnNextAttemptKey");
        v25 = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v13 = objc_claimAutoreleasedReturnValue();

        v14 = 14;
        v11 = (void *)v13;
      }
      else
      {
        v14 = 5;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __72__SiriCoreSiriBackgroundConnection__aceHeaderTimeoutFired_afterTimeout___block_invoke;
      v22[3] = &unk_24CCE6BD0;
      v22[4] = self;
      v16 = v15;
      v23 = v16;
      -[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:](self, "_fallBackToNextConnectionMethodWithError:orElse:", v16, v22);

LABEL_21:
    }
  }

}

- (void)setSendPings:(BOOL)a3
{
  NSObject *pingTimerSource;
  NSObject *v5;
  OS_dispatch_source *v6;
  NSObject *v7;
  NSObject *queue;
  NSObject *v9;
  dispatch_time_t v10;
  OS_dispatch_source *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pingTimerSource = self->_pingTimerSource;
  if (a3)
  {
    if (pingTimerSource)
    {
      self->_dispatchedSnapshotMetrics = 0;
    }
    else
    {
      v7 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[SiriCoreSiriBackgroundConnection setSendPings:]";
        _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_INFO, "%s Start sending pings", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      queue = self->_queue;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __49__SiriCoreSiriBackgroundConnection_setSendPings___block_invoke;
      handler[3] = &unk_24CCE60E0;
      objc_copyWeak(&v13, (id *)buf);
      v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
      v10 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v9, v10, 0x3B9ACA00uLL, 0);
      dispatch_source_set_event_handler(v9, handler);
      v11 = self->_pingTimerSource;
      self->_pingTimerSource = (OS_dispatch_source *)v9;

      if (self->_isOpened)
      {
        -[SiriCoreSiriBackgroundConnection _resumePingTimer](self, "_resumePingTimer");
        self->_dispatchedSnapshotMetrics = 0;
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (pingTimerSource)
  {
    v5 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SiriCoreSiriBackgroundConnection setSendPings:]";
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Stop sending pings", buf, 0xCu);
      pingTimerSource = self->_pingTimerSource;
    }
    dispatch_source_cancel(pingTimerSource);
    if (!self->_isOpened)
      dispatch_resume((dispatch_object_t)self->_pingTimerSource);
    v6 = self->_pingTimerSource;
    self->_pingTimerSource = 0;

  }
}

- (void)_resumePingTimer
{
  SiriCorePingInfo *pingInfo;

  if (self->_pingTimerSource)
  {
    pingInfo = self->_pingInfo;
    self->_pingInfo = 0;

    dispatch_resume((dispatch_object_t)self->_pingTimerSource);
  }
}

- (void)_pingTimerFired
{
  NSObject *v3;
  NSObject *bufferedInputData;
  NSObject *bufferedGeneralOutputData;
  int64_t v6;
  unint64_t v7;
  char v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  SiriCorePingInfo *pingInfo;
  uint64_t v15;
  SiriCorePingInfo *v16;
  int64_t v17;
  os_log_t *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *queue;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD block[5];
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  bufferedInputData = self->_bufferedInputData;
  if (bufferedInputData && dispatch_data_get_size(bufferedInputData)
    || (bufferedGeneralOutputData = self->_bufferedGeneralOutputData) != 0
    && dispatch_data_get_size(bufferedGeneralOutputData))
  {
    v6 = -[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData](self, "_checkForProgressOnReadingData");
  }
  else
  {
    v6 = -[SiriCoreSiriBackgroundConnection _checkPings](self, "_checkPings");
  }
  v7 = v6;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) != 0)
      goto LABEL_16;
LABEL_14:
    v9 = 0;
    v10 = 0;
    v11 = (v7 >> 3) & 1;
    if ((v7 & 1) == 0)
      goto LABEL_35;
    goto LABEL_29;
  }
  v8 = -[SiriCoreConnectionProvider shouldFallbackQuickly](self->_connectionProvider, "shouldFallbackQuickly");
  if ((v7 & 4) == 0 && (v8 & 1) == 0)
    goto LABEL_14;
LABEL_16:
  if (!-[SiriCoreSiriBackgroundConnection _usingPeer](self, "_usingPeer"))
  {
    if (-[SiriCoreSiriBackgroundConnection _usingPOP](self, "_usingPOP")
      || -[SiriCoreSiriBackgroundConnection _usingFlorence](self, "_usingFlorence"))
    {
      v12 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
        _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_INFO, "%s Ping timeout while using POP or Florence method", buf, 0xCu);
      }
      v38 = CFSTR("SiriCoreSiriConnectionShouldSkipTuscanyOnNextAttemptKey");
      v39 = MEMORY[0x24BDBD1C8];
      v10 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = 1;
      if ((v7 & 1) == 0)
      {
LABEL_35:
        if (!(_DWORD)v11)
          goto LABEL_46;
        goto LABEL_36;
      }
    }
    else
    {
      v9 = 0;
      v10 = 0;
      LODWORD(v11) = 0;
      if ((v7 & 1) == 0)
        goto LABEL_35;
    }
LABEL_29:
    if (-[SiriCoreSiriBackgroundConnection _usingPOP](self, "_usingPOP")
      && !-[SiriCoreSiriBackgroundConnection _usingPeer](self, "_usingPeer")
      || !-[SiriCoreSiriBackgroundConnection _tcpInfoIndicatesPoorLinkQuality](self, "_tcpInfoIndicatesPoorLinkQuality"))
    {
      goto LABEL_35;
    }
    pingInfo = self->_pingInfo;
    if (pingInfo)
    {
      v15 = -[SiriCorePingInfo numberOfUnacknowledgedPings](pingInfo, "numberOfUnacknowledgedPings");
      v16 = self->_pingInfo;
      if (v16)
      {
        v17 = -[SiriCorePingInfo pingAcknowledgedCount](v16, "pingAcknowledgedCount") + v15;
        goto LABEL_49;
      }
    }
    else
    {
      v15 = 0;
    }
    v17 = 0;
LABEL_49:
    v36[0] = CFSTR("pingCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("unacknowledgedPingCount");
    v37[0] = v25;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v27 = objc_claimAutoreleasedReturnValue();

    if (self->_pingInfo)
      v28 = v27;
    else
      v28 = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 34, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke;
    block[3] = &unk_24CCE6BD0;
    block[4] = self;
    v35 = v29;
    v31 = v29;
    dispatch_async(queue, block);

    v9 = (void *)v27;
    if ((v11 & 1) == 0)
      goto LABEL_46;
    goto LABEL_36;
  }
  if (-[SiriCoreSiriBackgroundConnection _wifiOrCellularMayBeBetterThanCurrentStream](self, "_wifiOrCellularMayBeBetterThanCurrentStream"))
  {
    v40 = CFSTR("SiriCoreSiriConnectionShouldSkipIDSOnNextAttemptKey");
    v41 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_36:
    v18 = (os_log_t *)MEMORY[0x24BE08FC0];
    v19 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
      _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, "%s Ping timeout", buf, 0xCu);
    }
    if (-[SiriCoreSiriBackgroundConnection _hasReadHTTPHeader](self, "_hasReadHTTPHeader"))
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = 6;
    }
    else
    {
      v22 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
        _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_INFO, "%s Overriding ping error since we haven't read our ace header yet.", buf, 0xCu);
      }
      v20 = (void *)MEMORY[0x24BDD1540];
      if (v10)
        v21 = 14;
      else
        v21 = 5;
    }
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), v21, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke_102;
    v32[3] = &unk_24CCE6BD0;
    v32[4] = self;
    v33 = v23;
    v24 = v23;
    -[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethodWithError:orElse:](self, "_fallBackToNextConnectionMethodWithError:orElse:", v24, v32);

    goto LABEL_46;
  }
  v13 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[SiriCoreSiriBackgroundConnection _pingTimerFired]";
    _os_log_impl(&dword_211AB2000, v13, OS_LOG_TYPE_INFO, "%s Ignoring Ping timeout since wifi isn't available to fall back to.", buf, 0xCu);
  }
  v9 = 0;
LABEL_46:

}

- (int64_t)_checkForProgressOnReadingData
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *lastInputDataPointer;
  OS_dispatch_data *bufferedInputData;
  objc_class *v7;
  uint64_t v8;
  size_t size;
  unint64_t v10;
  NSObject *v11;
  NSObject *lastOutputDataPointer;
  OS_dispatch_data *bufferedGeneralOutputData;
  objc_class *v14;
  unint64_t outputLengthUnchangedCounter;
  uint64_t v16;
  size_t v17;
  NSObject *v18;
  unint64_t inputLengthUnchangedCounter;
  int v22;
  const char *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FC0];
  v4 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v22 = 136315138;
    v23 = "-[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData]";
    _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v22, 0xCu);
  }
  lastInputDataPointer = self->_lastInputDataPointer;
  bufferedInputData = self->_bufferedInputData;
  if (lastInputDataPointer != bufferedInputData)
  {
    v7 = 0;
    self->_lastInputLength = 0;
    self->_lastInputDataPointer = bufferedInputData;
    v8 = 168;
    goto LABEL_13;
  }
  if (lastInputDataPointer)
  {
    size = dispatch_data_get_size(lastInputDataPointer);
    v7 = (objc_class *)size;
    if (size && size == self->_lastInputLength)
    {
      v10 = self->_inputLengthUnchangedCounter + 1;
      self->_inputLengthUnchangedCounter = v10;
      v11 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        v22 = 136315394;
        v23 = "-[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData]";
        v24 = 2048;
        v25 = v10;
        _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s Incremented Input Unchanged Counter to %lu", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 0;
  }
  self->_inputLengthUnchangedCounter = 0;
LABEL_12:
  v8 = 152;
LABEL_13:
  *(Class *)((char *)&self->super.isa + v8) = v7;
  lastOutputDataPointer = self->_lastOutputDataPointer;
  bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
  if (lastOutputDataPointer != bufferedGeneralOutputData)
  {
    v14 = 0;
    outputLengthUnchangedCounter = 0;
    self->_lastOutputLength = 0;
    self->_lastOutputDataPointer = bufferedGeneralOutputData;
    v16 = 192;
    goto LABEL_23;
  }
  if (lastOutputDataPointer)
  {
    v17 = dispatch_data_get_size(lastOutputDataPointer);
    v14 = (objc_class *)v17;
    if (v17 && v17 == self->_lastOutputLength)
    {
      outputLengthUnchangedCounter = self->_outputLengthUnchangedCounter + 1;
      self->_outputLengthUnchangedCounter = outputLengthUnchangedCounter;
      v18 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        v22 = 136315394;
        v23 = "-[SiriCoreSiriBackgroundConnection _checkForProgressOnReadingData]";
        v24 = 2048;
        v25 = outputLengthUnchangedCounter;
        _os_log_impl(&dword_211AB2000, v18, OS_LOG_TYPE_INFO, "%s Incremented Output Unchanged Counter to %lu", (uint8_t *)&v22, 0x16u);
        outputLengthUnchangedCounter = self->_outputLengthUnchangedCounter;
      }
      goto LABEL_22;
    }
  }
  else
  {
    v14 = 0;
  }
  outputLengthUnchangedCounter = 0;
  self->_outputLengthUnchangedCounter = 0;
LABEL_22:
  v16 = 176;
LABEL_23:
  *(Class *)((char *)&self->super.isa + v16) = v14;
  inputLengthUnchangedCounter = self->_inputLengthUnchangedCounter;
  if (outputLengthUnchangedCounter > 9 || inputLengthUnchangedCounter > 9)
    return (outputLengthUnchangedCounter + inputLengthUnchangedCounter > 2) | 0xCLL;
  else
    return outputLengthUnchangedCounter + inputLengthUnchangedCounter > 2;
}

- (int64_t)_checkPings
{
  NSObject *v3;
  unsigned int currentPingIndex;
  unsigned int v5;
  void *v6;
  SiriCorePingInfo *pingInfo;
  SiriCorePingInfo *v8;
  SiriCorePingInfo *v9;
  unint64_t v10;
  int64_t v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "-[SiriCoreSiriBackgroundConnection _checkPings]";
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }
  currentPingIndex = self->_currentPingIndex;
  if (currentPingIndex + 1 <= 0xFFFE795F)
    v5 = currentPingIndex + 1;
  else
    v5 = 0;
  self->_currentPingIndex = v5;
  -[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:](self, "_sendAcePingWithId:error:");
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventWithType:context:", 1005, 0);

  pingInfo = self->_pingInfo;
  if (!pingInfo)
  {
    v8 = objc_alloc_init(SiriCorePingInfo);
    v9 = self->_pingInfo;
    self->_pingInfo = v8;

    pingInfo = self->_pingInfo;
  }
  -[SiriCorePingInfo markPingSentWithIndex:](pingInfo, "markPingSentWithIndex:", self->_currentPingIndex);
  v10 = -[SiriCorePingInfo numberOfUnacknowledgedPings](self->_pingInfo, "numberOfUnacknowledgedPings");
  v11 = v10 > 2;
  if (v10 == 3)
    v11 = 3;
  if (v10 == 7)
    v11 |= 4uLL;
  if (v10 <= 0xB)
    return v11;
  else
    return v11 | 8;
}

- (void)barrier:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableDictionary *v5;
  NSMutableDictionary *outstandingBarriers;
  uint64_t currentBarrierIndex;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  id v14;

  v4 = (void (**)(id, _QWORD))a3;
  if (!self->_outstandingBarriers)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    outstandingBarriers = self->_outstandingBarriers;
    self->_outstandingBarriers = v5;

  }
  currentBarrierIndex = self->_currentBarrierIndex;
  v14 = 0;
  -[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:](self, "_sendAcePingWithId:error:", currentBarrierIndex, &v14);
  v8 = v14;
  if (v8)
  {
    v4[2](v4, 0);
  }
  else
  {
    v9 = self->_outstandingBarriers;
    v10 = (void *)MEMORY[0x212BE6580](v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_currentBarrierIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v11);

    v12 = self->_currentBarrierIndex;
    if (v12 == -1)
      v13 = -100000;
    else
      v13 = v12 + 1;
    self->_currentBarrierIndex = v13;
  }

}

- (void)_handleBarrierReply:(unsigned int)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_outstandingBarriers, "objectForKey:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
    -[NSMutableDictionary removeObjectForKey:](self->_outstandingBarriers, "removeObjectForKey:", v6);
  }

}

- (void)_cancelOutstandingBarriers
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *outstandingBarriers;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_outstandingBarriers;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_outstandingBarriers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_outstandingBarriers, "removeAllObjects");
  outstandingBarriers = self->_outstandingBarriers;
  self->_outstandingBarriers = 0;

}

- (void)connectionProvider:(id)a3 receivedError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SiriCoreSiriBackgroundConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke;
  block[3] = &unk_24CCE63B8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)connectionProvider:(id)a3 receivedIntermediateError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__SiriCoreSiriBackgroundConnection_connectionProvider_receivedIntermediateError___block_invoke;
  v8[3] = &unk_24CCE6BD0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)connectionProvider:(id)a3 receivedViabilityChangeNotification:(BOOL)a4
{
  _BOOL4 v4;
  SiriCoreConnectionProvider *v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (SiriCoreConnectionProvider *)a3;
  if (self->_connectionProvider == v6)
  {
    if (self->_primaryConnectionViable == v4)
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 32, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriCoreSiriBackgroundConnection _didEncounterError:](self, "_didEncounterError:", v7);

        goto LABEL_15;
      }
LABEL_10:
      -[SiriCoreSiriBackgroundConnection _cancelSecondaryConnection](self, "_cancelSecondaryConnection");
      goto LABEL_15;
    }
    v8 = (os_log_t *)MEMORY[0x24BE08FC0];
    v9 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("not viable");
      if (v4)
        v10 = CFSTR("viable");
      v12 = 136315394;
      v13 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedViabilityChangeNotification:]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s viability changed %@", (uint8_t *)&v12, 0x16u);
    }
    self->_primaryConnectionViable = v4;
    if (v4)
      goto LABEL_10;
    if (self->_betterPathAvailable)
    {
      -[SiriCoreSiriBackgroundConnection _startSecondaryConnection](self, "_startSecondaryConnection");
    }
    else
    {
      v11 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedViabilityChangeNotification:]";
        _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s wait for better route event", (uint8_t *)&v12, 0xCu);
      }
    }
  }
LABEL_15:

}

- (void)connectionProviderReceivedBetterRouteNotification:(id)a3
{
  SiriCoreConnectionProvider *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (SiriCoreConnectionProvider *)a3;
  if (self->_connectionProvider == v4)
  {
    self->_betterPathAvailable = 1;
    if (!self->_primaryConnectionViable)
    {
      v5 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        v6 = 136315138;
        v7 = "-[SiriCoreSiriBackgroundConnection connectionProviderReceivedBetterRouteNotification:]";
        _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Starting secondary connection", (uint8_t *)&v6, 0xCu);
      }
      -[SiriCoreSiriBackgroundConnection _startSecondaryConnection](self, "_startSecondaryConnection");
    }
  }

}

- (BOOL)_hasReadHTTPHeader
{
  return self->_httpResponseHeader == 0;
}

- (BOOL)_consumeHTTPHeaderWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5
{
  id v9;
  os_log_t *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  __CFHTTPMessage *httpResponseHeader;
  unint64_t v16;
  void *v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  __CFHTTPMessage *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!self->_httpResponseHeader)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriCoreSiriBackgroundConnection.m"), 1387, CFSTR("We shouldn't be trying to handle http header if we're not expecting it"));

  }
  v10 = (os_log_t *)MEMORY[0x24BE08FC0];
  v11 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SiriCoreSiriBackgroundConnection _consumeHTTPHeaderWithData:bytesRead:error:]";
    _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s Still need HTTP Header, trying to parse it", buf, 0xCu);
  }
  v19 = 0;
  v20 = 0;
  v12 = -[SiriCoreSiriBackgroundConnection _tryReadingHTTPHeaderData:withMessage:bytesRead:error:](self, "_tryReadingHTTPHeaderData:withMessage:bytesRead:error:", v9, self->_httpResponseHeader, &v20, &v19);
  v13 = v19;
  if (v12)
  {
    v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      httpResponseHeader = self->_httpResponseHeader;
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriCoreSiriBackgroundConnection _consumeHTTPHeaderWithData:bytesRead:error:]";
      v23 = 2112;
      v24 = httpResponseHeader;
      _os_log_impl(&dword_211AB2000, v14, OS_LOG_TYPE_INFO, "%s HTTP header is complete %@", buf, 0x16u);
    }
    CFRelease(self->_httpResponseHeader);
    self->_httpResponseHeader = 0;
  }
  if (a4)
  {
    v16 = v20;
    if (v13)
      v16 = 0;
    *a4 = v16;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v13 == 0;
}

- (BOOL)_hasReadACEHeader
{
  return self->_inputDecompressor != 0;
}

- (id)_connectionType
{
  return (id)-[SiriCoreConnectionProvider connectionType](self->_connectionProvider, "connectionType");
}

- (BOOL)_consumeAceHeaderWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5
{
  NSObject *v8;
  NSObject **v9;
  NSObject *v10;
  size_t size;
  void *v12;
  id v13;
  BOOL v14;
  NSObject *v16;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  size_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSObject **)MEMORY[0x24BE08FC0];
  v10 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    if (v8)
      size = dispatch_data_get_size(v8);
    else
      size = 0;
    *(_DWORD *)buf = 136315394;
    v21 = "-[SiriCoreSiriBackgroundConnection _consumeAceHeaderWithData:bytesRead:error:]";
    v22 = 2048;
    v23 = size;
    _os_log_impl(&dword_211AB2000, v10, OS_LOG_TYPE_INFO, "%s Still need Ace Header, trying to parse it with %lu bytes", buf, 0x16u);
  }
  v18 = 0;
  v19 = 0;
  -[SiriCoreSiriBackgroundConnection _tryReadingAceHeaderFromData:bytesParsed:error:](self, "_tryReadingAceHeaderFromData:bytesParsed:error:", v8, &v19, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v13)
    v14 = 1;
  else
    v14 = v19 == 0;
  if (!v14 && v12 != 0)
  {
    v16 = *v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SiriCoreSiriBackgroundConnection _consumeAceHeaderWithData:bytesRead:error:]";
      v22 = 2112;
      v23 = (size_t)v12;
      _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_INFO, "%s Ace Header is complete, using compressor %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_inputDecompressor, v12);
  }
  if (a4)
    *a4 = v19;
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v13 == 0;
}

- (BOOL)_consumeAceDataWithData:(id)a3 bytesRead:(unint64_t *)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v30;
  uint64_t v31;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  v9 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemUptime");
  v12 = v11;

  v31 = v7;
  if (!v8)
  {
    v22 = 0;
    if (!v9)
      goto LABEL_28;
    goto LABEL_26;
  }
  v30 = v6;
  v13 = *MEMORY[0x24BE81AA0];
  v35 = *MEMORY[0x24BE81AA8];
  v34 = *MEMORY[0x24BE82650];
  while (1)
  {
    v37 = 0;
    v38 = 0;
    v36 = 0;
    -[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:](self, "_tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:", v7, v8, &v38, &v37, &v39, &v36, v30);
    v14 = v37;
    v15 = v36;
    v16 = v39;
    if (v15 || v39 == 0)
      break;
    if (v8 >= v39)
      v18 = v39;
    else
      v18 = 0;
    if (v8 >= v39)
      v19 = v8 - v39;
    else
      v19 = 0;
    if (v14)
    {
      objc_msgSend(v14, "encodedClassName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqual:", v13) & 1) != 0
        || (objc_msgSend(v20, "isEqual:", v35) & 1) != 0
        || objc_msgSend(v20, "isEqual:", v34))
      {
        objc_msgSend(v9, "addObject:", v20);
      }
      -[SiriCoreSiriBackgroundConnection _handleAceObject:](self, "_handleAceObject:", v14);

    }
    else
    {
      -[SiriCoreSiriBackgroundConnection _handlePacket:](self, "_handlePacket:", &v38);
    }
    v7 += v18;

    v21 = v8 > v16;
    v8 = v19;
    if (!v21)
    {
      v22 = 0;
      goto LABEL_25;
    }
  }
  v22 = v15;

LABEL_25:
  v6 = v30;
  if (v9)
  {
LABEL_26:
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = CFSTR("aceCommands");
      objc_msgSend(v9, "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v24;
      v40[1] = CFSTR("bytes");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v25;
      v40[2] = CFSTR("waitTime");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12 - self->_receivedDataTime);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
      v27 = v6;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logEventWithType:context:", 1018, v28);

      v6 = v27;
    }
  }
LABEL_28:
  self->_receivedDataTime = v12;
  if (a4)
    *a4 = v7 - v31;
  if (a5)
    *a5 = objc_retainAutorelease(v22);

  return v22 == 0;
}

- (void)_connectionHasBytesAvailable:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  size_t size;
  os_log_t *v7;
  OS_dispatch_data *safetyNetBuffer;
  void *v9;
  double v10;
  void *v11;
  SiriCoreDataDecompressor *inputDecompressor;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *bufferedInputData;
  OS_dispatch_data **p_bufferedInputData;
  dispatch_data_t concat;
  OS_dispatch_data *v19;
  NSObject *subrange;
  NSObject *v21;
  size_t v22;
  NSObject *v23;
  size_t v24;
  NSObject *v25;
  NSObject *v26;
  size_t v27;
  id v28;
  NSObject *v29;
  size_t v30;
  NSObject *v31;
  NSObject *v32;
  size_t v33;
  NSObject *v34;
  size_t v35;
  NSObject *v36;
  NSObject *v37;
  size_t v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  size_t v42;
  id v43;
  SiriCoreDataDecompressor *v44;
  NSObject *v45;
  size_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  size_t v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  size_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2(queue);
  size = dispatch_data_get_size(v4);
  v7 = (os_log_t *)MEMORY[0x24BE08FC0];
  if (size)
  {
    safetyNetBuffer = self->_safetyNetBuffer;
    if (safetyNetBuffer)
    {
      self->_safetyNetBuffer = 0;

      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemUptime");
      self->_firstByteReadTime = v10;

      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventWithType:contextProvider:", 915, 0);

    }
    inputDecompressor = self->_inputDecompressor;
    if (inputDecompressor)
    {
      v52 = 0;
      -[SiriCoreDataDecompressor decompressedDataForData:error:](inputDecompressor, "decompressedDataForData:error:", v4, &v52);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v52;
    }
    else
    {
      v13 = v4;
      v14 = 0;
    }
    p_bufferedInputData = &self->_bufferedInputData;
    bufferedInputData = self->_bufferedInputData;
    if (bufferedInputData)
    {
      if (!v13)
        goto LABEL_16;
      concat = dispatch_data_create_concat(bufferedInputData, v13);
    }
    else
    {
      concat = v13;
    }
    v19 = *p_bufferedInputData;
    *p_bufferedInputData = (OS_dispatch_data *)concat;

    bufferedInputData = *p_bufferedInputData;
LABEL_16:
    subrange = bufferedInputData;
    v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      if (subrange)
        v22 = dispatch_data_get_size(subrange);
      else
        v22 = 0;
      *(_DWORD *)buf = 136315394;
      v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
      v55 = 2048;
      v56 = v22;
      _os_log_impl(&dword_211AB2000, v21, OS_LOG_TYPE_INFO, "%s workingData is %lu bytes", buf, 0x16u);
    }
    if (v14)
      goto LABEL_22;
    if (!-[SiriCoreSiriBackgroundConnection _hasReadHTTPHeader](self, "_hasReadHTTPHeader"))
    {
      v50 = 0;
      v51 = 0;
      -[SiriCoreSiriBackgroundConnection _consumeHTTPHeaderWithData:bytesRead:error:](self, "_consumeHTTPHeaderWithData:bytesRead:error:", subrange, &v51, &v50);
      v14 = v50;
      v23 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        v55 = 2048;
        v56 = v51;
        _os_log_impl(&dword_211AB2000, v23, OS_LOG_TYPE_INFO, "%s Consumed %tu bytes", buf, 0x16u);
      }
      v24 = v51;
      v25 = subrange;
      v26 = v25;
      if (v25)
      {
        v27 = dispatch_data_get_size(v25);
        if (v27 <= v24)
        {
          subrange = MEMORY[0x24BDAC990];
          v28 = MEMORY[0x24BDAC990];
        }
        else
        {
          subrange = dispatch_data_create_subrange(v26, v24, v27 - v24);
        }
      }
      else
      {
        subrange = 0;
      }

      if (v14)
        goto LABEL_22;
    }
    if (!-[SiriCoreSiriBackgroundConnection _hasReadACEHeader](self, "_hasReadACEHeader"))
    {
      v51 = 0;
      v49 = 0;
      -[SiriCoreSiriBackgroundConnection _consumeAceHeaderWithData:bytesRead:error:](self, "_consumeAceHeaderWithData:bytesRead:error:", subrange, &v51, &v49);
      v14 = v49;
      v34 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        v55 = 2048;
        v56 = v51;
        _os_log_impl(&dword_211AB2000, v34, OS_LOG_TYPE_INFO, "%s Consumed %tu bytes", buf, 0x16u);
      }
      v35 = v51;
      v36 = subrange;
      v37 = v36;
      if (v36)
      {
        v38 = dispatch_data_get_size(v36);
        if (v38 <= v35)
        {
          v39 = MEMORY[0x24BDAC990];
          v40 = MEMORY[0x24BDAC990];
        }
        else
        {
          v39 = dispatch_data_create_subrange(v37, v35, v38 - v35);
        }
      }
      else
      {
        v39 = 0;
      }

      if (v14)
      {
        subrange = v39;
LABEL_22:
        objc_storeStrong((id *)&self->_bufferedInputData, subrange);
        if (v14)
          -[SiriCoreSiriBackgroundConnection _didEncounterError:](self, "_didEncounterError:", v14);

        goto LABEL_25;
      }
      v41 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        if (v39)
          v42 = dispatch_data_get_size(v39);
        else
          v42 = 0;
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        v55 = 2048;
        v56 = v42;
        _os_log_impl(&dword_211AB2000, v41, OS_LOG_TYPE_INFO, "%s Still have %lu bytes after ace header, decompressing", buf, 0x16u);
      }
      v44 = self->_inputDecompressor;
      if (v44)
      {
        v48 = 0;
        -[SiriCoreDataDecompressor decompressedDataForData:error:](v44, "decompressedDataForData:error:", v39, &v48);
        subrange = objc_claimAutoreleasedReturnValue();
        v14 = v48;

        v45 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
        {
          if (subrange)
            v46 = dispatch_data_get_size(subrange);
          else
            v46 = 0;
          *(_DWORD *)buf = 136315394;
          v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
          v55 = 2048;
          v56 = v46;
          _os_log_impl(&dword_211AB2000, v45, OS_LOG_TYPE_INFO, "%s Decompressed %lu bytes", buf, 0x16u);
        }
        if (v14)
          goto LABEL_22;
      }
      else
      {
        subrange = v39;
      }
    }
    if (-[SiriCoreSiriBackgroundConnection _hasReadACEHeader](self, "_hasReadACEHeader"))
    {
      v51 = 0;
      v47 = 0;
      -[SiriCoreSiriBackgroundConnection _consumeAceDataWithData:bytesRead:error:](self, "_consumeAceDataWithData:bytesRead:error:", subrange, &v51, &v47);
      v14 = v47;
      v29 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
        v55 = 2048;
        v56 = v51;
        _os_log_impl(&dword_211AB2000, v29, OS_LOG_TYPE_INFO, "%s Consumed %tu bytes", buf, 0x16u);
      }
      v30 = v51;
      v31 = subrange;
      v32 = v31;
      if (v31)
      {
        v33 = dispatch_data_get_size(v31);
        if (v33 <= v30)
        {
          subrange = MEMORY[0x24BDAC990];
          v43 = MEMORY[0x24BDAC990];
        }
        else
        {
          subrange = dispatch_data_create_subrange(v32, v30, v33 - v30);
        }
      }
      else
      {
        subrange = 0;
      }

    }
    else
    {
      v14 = 0;
    }
    goto LABEL_22;
  }
  v15 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[SiriCoreSiriBackgroundConnection _connectionHasBytesAvailable:]";
    _os_log_impl(&dword_211AB2000, v15, OS_LOG_TYPE_INFO, "%s NWConnection said it had bytes available, but we couldn't read anything", buf, 0xCu);
  }
LABEL_25:

}

- (void)_networkProviderDidOpen
{
  NSObject *queue;
  os_log_t *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id WeakRetained;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  queue = self->_queue;
  if (queue)
    dispatch_assert_queue_V2(queue);
  v4 = (os_log_t *)MEMORY[0x24BE08FC0];
  v5 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v16 = 136315138;
    v17 = "-[SiriCoreSiriBackgroundConnection _networkProviderDidOpen]";
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v16, 0xCu);
  }
  if (self->_isOpened)
  {
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "-[SiriCoreSiriBackgroundConnection _networkProviderDidOpen]";
      _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s Received open callback when we're already open?", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    self->_isOpened = 1;
    self->_primaryConnectionViable = 1;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemUptime");
    self->_currentOpenTime = v8;

    -[SiriCoreSiriBackgroundConnection _resumePingTimer](self, "_resumePingTimer");
    -[SiriCoreSiriConnectionInfo connectionPolicyRoute](self->_connectionInfo, "connectionPolicyRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routeId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemUptime");
    v13 = v12 - self->_currentStartTime;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[SiriCoreSiriBackgroundConnection _connectionType](self, "_connectionType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "siriBackgroundConnection:didOpenWithConnectionType:routeId:delay:", self, v15, v10, v13);

  }
  -[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData](self, "_tryToWriteBufferedOutputData");
}

- (id)_headerDataForURL:(id)a3 aceHost:(id)a4 languageCode:(id)a5 syncAssistantId:(id)a6
{
  const __CFURL *v10;
  __CFString *v11;
  const __CFString *v12;
  __CFHTTPMessage *Request;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *peerType;
  const __CFString *peerVersion;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  CFDictionaryRef v25;
  NSObject *v26;
  id WeakRetained;
  char v28;
  id v29;
  __CFString *v30;
  CFDataRef v31;
  const UInt8 *BytePtr;
  size_t Length;
  dispatch_data_t v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v49;
  void *v50;
  __CFString *v51;
  const __CFURL *v52;
  __CFString *value;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[4];
  _QWORD v57[4];
  const __CFString *v58;
  __CFString *v59;
  _BYTE buf[24];
  void *v61;
  CFDataRef v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v10 = (const __CFURL *)a3;
  v11 = (__CFString *)a4;
  v12 = (const __CFString *)a5;
  value = (__CFString *)a6;
  Request = CFHTTPMessageCreateRequest(0, CFSTR("ACE"), v10, (CFStringRef)*MEMORY[0x24BDB7690]);
  v52 = v10;
  -[__CFURL host](v10, "host");
  v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Host"), v51);
  SiriCoreUserAgentStringCreate(self->_productTypePrefix);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("User-Agent"), v14);
  if (v11)
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Ace-Host"), v11);
  if (v12)
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Accept-Language"), v12);
  v49 = v12;
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Length"), CFSTR("2000000000"));
  SiriCoreUUIDStringCreate();
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Client-Connection-Id"), v15);
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = CFSTR("X-Client-Connection-Id");
  v59 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logEventWithType:context:", 914, v17);

  if (self->_siriConnectionUsesPeerManagedSync)
  {
    peerType = (const __CFString *)self->_peerType;
    if (peerType)
      CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Linked-Siri-Type"), peerType);
    peerVersion = (const __CFString *)self->_peerVersion;
    if (peerVersion)
      CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Linked-Siri-Version"), peerVersion);
  }
  v20 = AFIsInternalInstall();
  v21 = MEMORY[0x24BDAC760];
  if (v20)
  {
    if (self->_deviceIsInWalkaboutExperimentGroup)
      CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Walkabout-Device"), CFSTR("true"));
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", v49);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "configOverrides");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = MEMORY[0x24BDAC760];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke;
    v55[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v55[4] = Request;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v55);

  }
  objc_msgSend(MEMORY[0x24BE091E0], "featureFlags", v49);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v21;
  v54[1] = 3221225472;
  v54[2] = __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke_2;
  v54[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
  v54[4] = Request;
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v54);
  if (-[SiriCoreSiriConnectionInfo isForceOnDeviceOnlyDictationEnabled](self->_connectionInfo, "isForceOnDeviceOnlyDictationEnabled"))
  {
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-OnDevice-Only-Dictation-Forced"), CFSTR("true"));
  }
  if (AFIsInternalInstall() && _AFPreferencesShowAllDialogVariantsEnabled())
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Show-Dialog-Variants"), CFSTR("true"));
  CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Sync-Owner-Assistant-ID"), value);
  v25 = CFHTTPMessageCopyAllHeaderFields(Request);
  v26 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SiriCoreSiriBackgroundConnection _headerDataForURL:aceHost:languageCode:syncAssistantId:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_211AB2000, v26, OS_LOG_TYPE_INFO, "%s Connection Header: %@", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    v29 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v29, "siriBackgroundConnection:willStartConnectionWithHTTPHeader:", self, v25);

  }
  AFDeviceRegionCode();
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v30)
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("X-Device-Region-Code"), v30);
  v31 = CFHTTPMessageCopySerializedMessage(Request);
  CFRelease(Request);
  if (v31)
  {
    CFRetain(v31);
    BytePtr = CFDataGetBytePtr(v31);
    Length = CFDataGetLength(v31);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __SiriCoreDispatchDataCreateFromImmutableCFData_block_invoke;
    v61 = &__block_descriptor_40_e5_v8__0l;
    v62 = v31;
    v34 = dispatch_data_create(BytePtr, Length, 0, buf);
    CFRelease(v31);
  }
  else
  {
    v34 = 0;
  }
  if (AFIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v51;
    if (!v51)
      v36 = &stru_24CCE7768;
    v56[0] = CFSTR("host");
    v56[1] = CFSTR("userAgent");
    if (v14)
      v37 = v14;
    else
      v37 = &stru_24CCE7768;
    v57[0] = v36;
    v57[1] = v37;
    if (v11)
      v38 = v11;
    else
      v38 = &stru_24CCE7768;
    v57[2] = v38;
    v56[2] = CFSTR("aceHost");
    v56[3] = CFSTR("url");
    -[__CFURL absoluteString](v52, "absoluteString");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v39)
      v41 = (const __CFString *)v39;
    else
      v41 = &stru_24CCE7768;
    v57[3] = v41;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "logEventWithType:context:", 922, v42);

    v43 = objc_alloc_init(MEMORY[0x24BE95348]);
    v44 = v43;
    if (v14)
    {
      v45 = (void *)-[__CFString copy](v14, "copy");
      objc_msgSend(v44, "setUserAgent:", v45);

      if (v11)
      {
LABEL_42:
        v46 = (void *)-[__CFString copy](v11, "copy");
        objc_msgSend(v44, "setAceHost:", v46);

LABEL_45:
        +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logSessionConnectionHttpHeaderCreated:", v44);

        goto LABEL_46;
      }
    }
    else
    {
      objc_msgSend(v43, "setUserAgent:", &stru_24CCE7768);
      if (v11)
        goto LABEL_42;
    }
    objc_msgSend(v44, "setAceHost:", &stru_24CCE7768);
    goto LABEL_45;
  }
LABEL_46:

  return v34;
}

- (void)_tryToWriteBufferedOutputData
{
  NSObject *v3;
  SiriCoreConnectionProvider *v4;
  OS_dispatch_data *bufferedProviderHeaderOutputData;
  OS_dispatch_data **p_bufferedGeneralOutputData;
  NSObject *v7;
  size_t size;
  size_t v9;
  SiriCoreConnectionProvider *connectionProvider;
  OS_dispatch_data *v11;
  NSObject *safetyNetBuffer;
  OS_dispatch_data *concat;
  OS_dispatch_data *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SiriCoreConnectionProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->_isCanceled && self->_isOpened)
  {
    bufferedProviderHeaderOutputData = self->_bufferedProviderHeaderOutputData;
    if (bufferedProviderHeaderOutputData)
    {
      p_bufferedGeneralOutputData = &self->_bufferedGeneralOutputData;
      if (dispatch_data_get_size((dispatch_data_t)self->_bufferedProviderHeaderOutputData))
      {
        v7 = bufferedProviderHeaderOutputData;
LABEL_10:
        size = dispatch_data_get_size(v7);
        if (size)
        {
          v9 = size;
          kdebug_trace();
          connectionProvider = self->_connectionProvider;
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __65__SiriCoreSiriBackgroundConnection__tryToWriteBufferedOutputData__block_invoke;
          v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v15[4] = v9;
          -[SiriCoreConnectionProvider writeData:completion:](connectionProvider, "writeData:completion:", v7, v15);
          v11 = (OS_dispatch_data *)v7;
          if (v7 != self->_bufferedProviderHeaderOutputData)
          {
            safetyNetBuffer = self->_safetyNetBuffer;
            if (safetyNetBuffer)
            {
              concat = (OS_dispatch_data *)dispatch_data_create_concat(safetyNetBuffer, v7);
              v14 = self->_safetyNetBuffer;
              self->_safetyNetBuffer = concat;

            }
            v11 = self->_bufferedProviderHeaderOutputData;
          }
          if (v7 == v11)
          {
            p_bufferedGeneralOutputData = &self->_bufferedProviderHeaderOutputData;
LABEL_20:
            objc_storeStrong((id *)p_bufferedGeneralOutputData, MEMORY[0x24BDAC990]);
            goto LABEL_21;
          }
          if (v7 == *p_bufferedGeneralOutputData)
            goto LABEL_20;
        }
LABEL_21:

        return;
      }
    }
    else
    {
      p_bufferedGeneralOutputData = &self->_bufferedGeneralOutputData;
    }
    v7 = *p_bufferedGeneralOutputData;
    if (!v7)
      goto LABEL_21;
    goto LABEL_10;
  }
  v3 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v4 = self->_connectionProvider;
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData]";
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_211AB2000, v3, OS_LOG_TYPE_INFO, "%s %@ is not open. buffering data", buf, 0x16u);
  }
}

- (void)_bufferGeneralData:(id)a3
{
  OS_dispatch_data *concat;
  OS_dispatch_data *bufferedGeneralOutputData;

  concat = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_bufferedGeneralOutputData, (dispatch_data_t)a3);
  bufferedGeneralOutputData = self->_bufferedGeneralOutputData;
  self->_bufferedGeneralOutputData = concat;

}

- (void)_sendGeneralData:(id)a3
{
  -[SiriCoreSiriBackgroundConnection _bufferGeneralData:](self, "_bufferGeneralData:", a3);
  -[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData](self, "_tryToWriteBufferedOutputData");
}

- (void)_prepareProviderHeaderWithForceReconnect:(BOOL)a3
{
  _BOOL8 v3;
  OS_dispatch_data **p_bufferedProviderHeaderOutputData;
  NSObject *v6;
  NSObject *v7;
  dispatch_data_t concat;
  dispatch_data_t v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  p_bufferedProviderHeaderOutputData = &self->_bufferedProviderHeaderOutputData;
  objc_storeStrong((id *)&self->_bufferedProviderHeaderOutputData, MEMORY[0x24BDAC990]);
  -[SiriCoreConnectionProvider headerDataWithForceReconnect:](self->_connectionProvider, "headerDataWithForceReconnect:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[SiriCoreSiriBackgroundConnection _prepareProviderHeaderWithForceReconnect:]";
      _os_log_impl(&dword_211AB2000, v7, OS_LOG_TYPE_INFO, "%s Preparing Provider Header", (uint8_t *)&v10, 0xCu);
    }
    concat = dispatch_data_create_concat((dispatch_data_t)*p_bufferedProviderHeaderOutputData, v6);
    v9 = (dispatch_data_t)*p_bufferedProviderHeaderOutputData;
    *p_bufferedProviderHeaderOutputData = (OS_dispatch_data *)concat;

  }
}

- (void)sendCommand:(id)a3 moreComing:(BOOL)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *bufferedUncompressedData;
  OS_dispatch_data **p_bufferedUncompressedData;
  dispatch_data_t concat;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  SiriCoreDataCompressor *outputCompressor;
  id v23;
  NSObject *v24;
  void *size;
  void *v26;
  size_t v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  size_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = (os_log_t *)MEMORY[0x24BE08FC0];
  v11 = (void *)*MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    *(_DWORD *)buf = 136315394;
    v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
    v33 = 2112;
    v34 = (id)objc_opt_class();
    v13 = v34;
    _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_INFO, "%s Sending ACE Object, %@", buf, 0x16u);

  }
  v30 = 0;
  objc_msgSend(v8, "siriCore_serializedAceDataError:", &v30);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v30;
  if (!v15 && v14)
  {
    p_bufferedUncompressedData = &self->_bufferedUncompressedData;
    bufferedUncompressedData = self->_bufferedUncompressedData;
    if (bufferedUncompressedData)
    {
      concat = dispatch_data_create_concat(bufferedUncompressedData, v14);

      if (concat)
      {
        objc_storeStrong((id *)&self->_bufferedUncompressedData, MEMORY[0x24BDAC990]);
        v15 = 0;
        v14 = concat;
        if (!a4)
          goto LABEL_14;
LABEL_10:
        v19 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
        {
          size = (void *)dispatch_data_get_size(v14);
          *(_DWORD *)buf = 136315394;
          v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
          v33 = 2048;
          v34 = size;
          _os_log_debug_impl(&dword_211AB2000, v19, OS_LOG_TYPE_DEBUG, "%s Buffering ACE Object of size %lu", buf, 0x16u);
        }
        v20 = v14;
        v21 = *p_bufferedUncompressedData;
        *p_bufferedUncompressedData = (OS_dispatch_data *)v20;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 27, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (a4)
        goto LABEL_10;
    }
    else
    {
      v15 = 0;
      if (a4)
        goto LABEL_10;
    }
LABEL_14:
    outputCompressor = self->_outputCompressor;
    v29 = v15;
    -[SiriCoreDataCompressor compressedDataForData:error:](outputCompressor, "compressedDataForData:error:", v14, &v29);
    v21 = objc_claimAutoreleasedReturnValue();
    v23 = v29;

    v24 = *v10;
    if (v23 || !v21)
    {
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)dispatch_data_get_size(v14);
        *(_DWORD *)buf = 136315394;
        v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
        v33 = 2048;
        v34 = v28;
        _os_log_error_impl(&dword_211AB2000, v24, OS_LOG_TYPE_ERROR, "%s error in compressing data of size %lu", buf, 0x16u);
      }
      v15 = v23;
    }
    else
    {
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
      {
        v26 = (void *)dispatch_data_get_size(v21);
        v27 = dispatch_data_get_size(v14);
        *(_DWORD *)buf = 136315650;
        v32 = "-[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:]";
        v33 = 2048;
        v34 = v26;
        v35 = 2048;
        v36 = v27;
        _os_log_debug_impl(&dword_211AB2000, v24, OS_LOG_TYPE_DEBUG, "%s compression ratio is %lu/%lu", buf, 0x20u);
      }
      -[SiriCoreSiriBackgroundConnection _sendGeneralData:](self, "_sendGeneralData:", v21);
      v15 = 0;
    }
LABEL_22:

  }
  if (v15)
    v9[2](v9, v15);

}

- (void)sendCommands:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id obj;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        --v8;
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __62__SiriCoreSiriBackgroundConnection_sendCommands_errorHandler___block_invoke;
        v16[3] = &unk_24CCE6B08;
        v14 = v7;
        v16[4] = v13;
        v17 = v14;
        -[SiriCoreSiriBackgroundConnection sendCommand:moreComing:errorHandler:](self, "sendCommand:moreComing:errorHandler:", v13, v8 != 0, v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (BOOL)_sendAcePingWithId:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  SiriCoreDataCompressor *outputCompressor;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (os_log_t *)MEMORY[0x24BE08FC0];
  v8 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:]";
    v18 = 1024;
    LODWORD(v19) = v5;
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s Sending ACE Ping %u", buf, 0x12u);
  }
  +[SiriCoreAceSerialization dataForPing:](SiriCoreAceSerialization, "dataForPing:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  outputCompressor = self->_outputCompressor;
  v15 = 0;
  -[SiriCoreDataCompressor compressedDataForData:error:](outputCompressor, "compressedDataForData:error:", v9, &v15);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t)v15;
  if (!(v12 | v11))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 27, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  if (!v12)
  {
    -[SiriCoreSiriBackgroundConnection _sendGeneralData:](self, "_sendGeneralData:", v11);
    goto LABEL_10;
  }
  v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePingWithId:error:]";
    v18 = 2114;
    v19 = v12;
    _os_log_error_impl(&dword_211AB2000, v13, OS_LOG_TYPE_ERROR, "%s Error compressing ping %{public}@", buf, 0x16u);
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease((id)v12);
LABEL_10:

  return v12 == 0;
}

- (BOOL)_sendAcePongWithId:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  SiriCoreDataCompressor *outputCompressor;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (os_log_t *)MEMORY[0x24BE08FC0];
  v8 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePongWithId:error:]";
    v18 = 1024;
    LODWORD(v19) = v5;
    _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_INFO, "%s Sending ACE Pong %u", buf, 0x12u);
  }
  +[SiriCoreAceSerialization dataForPong:](SiriCoreAceSerialization, "dataForPong:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  outputCompressor = self->_outputCompressor;
  v15 = 0;
  -[SiriCoreDataCompressor compressedDataForData:error:](outputCompressor, "compressedDataForData:error:", v9, &v15);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (uint64_t)v15;
  if (!(v12 | v11))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 27, 0);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  if (!v12)
  {
    -[SiriCoreSiriBackgroundConnection _sendGeneralData:](self, "_sendGeneralData:", v11);
    goto LABEL_10;
  }
  v13 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriCoreSiriBackgroundConnection _sendAcePongWithId:error:]";
    v18 = 2114;
    v19 = v12;
    _os_log_error_impl(&dword_211AB2000, v13, OS_LOG_TYPE_ERROR, "%s Error compressing pong %{public}@", buf, 0x16u);
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease((id)v12);
LABEL_10:

  return v12 == 0;
}

- (void)_setupReadHandlerOnProvider
{
  SiriCoreConnectionProvider *v3;
  SiriCoreConnectionProvider *connectionProvider;
  SiriCoreConnectionProvider *v5;
  _QWORD v6[4];
  SiriCoreConnectionProvider *v7;
  SiriCoreSiriBackgroundConnection *v8;

  kdebug_trace();
  v3 = self->_connectionProvider;
  connectionProvider = self->_connectionProvider;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke;
  v6[3] = &unk_24CCE6148;
  v7 = v3;
  v8 = self;
  v5 = v3;
  -[SiriCoreConnectionProvider readData:](connectionProvider, "readData:", v6);

}

- (BOOL)_tryReadingHTTPHeaderData:(id)a3 withMessage:(__CFHTTPMessage *)a4 bytesRead:(unint64_t *)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = 0;
  -[SiriCoreSiriBackgroundConnection _tryParsingHTTPHeaderData:partialMessage:statusCode:bytesRead:error:](self, "_tryParsingHTTPHeaderData:partialMessage:statusCode:bytesRead:error:", a3, a4, &v20, a5, &v19);
  v8 = v19;
  v9 = v8;
  if (v8 || v20 == (void *)200)
  {
    objc_msgSend(v8, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("SiriCoreSiriConnectionInternalErrorDomain")))
    {
      v16 = objc_msgSend(v9, "code");

      if (!v16)
      {

        v9 = 0;
        if (!a6)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    else
    {

    }
    if (v9
      && (v17 = *MEMORY[0x24BE08FC0], os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SiriCoreSiriBackgroundConnection _tryReadingHTTPHeaderData:withMessage:bytesRead:error:]";
      v23 = 2114;
      v24 = v9;
      _os_log_error_impl(&dword_211AB2000, v17, OS_LOG_TYPE_ERROR, "%s Error reading HTTP Header %{public}@", buf, 0x16u);
      if (!a6)
        goto LABEL_20;
    }
    else if (!a6)
    {
      goto LABEL_20;
    }
LABEL_19:
    *a6 = objc_retainAutorelease(v9);
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SiriCoreSiriBackgroundConnection _tryReadingHTTPHeaderData:withMessage:bytesRead:error:]";
    v23 = 2050;
    v24 = v20;
    v25 = 2114;
    v26 = v10;
    _os_log_error_impl(&dword_211AB2000, v11, OS_LOG_TYPE_ERROR, "%s HTTP status code %{public}ld: %{public}@", buf, 0x20u);
  }
  v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(self->_httpResponseHeader, CFSTR("Location"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("SiriCoreSiriConnectionHTTPErrorStatusCodeKey"));

  if (v10)
    objc_msgSend(v13, "setObject:forKey:", v10, *MEMORY[0x24BDD0FC8]);
  if (v12)
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("SiriCoreSiriConnectionHTTPRedirectValueKey"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 0, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    goto LABEL_19;
LABEL_20:

  return v9 == 0;
}

- (BOOL)_tryParsingHTTPHeaderData:(id)a3 partialMessage:(__CFHTTPMessage *)a4 statusCode:(int64_t *)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  id v11;
  unint64_t v12;
  id v13;
  const UInt8 *v14;
  const __CFData *v15;
  const __CFData *v16;
  unint64_t Length;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  CFIndex ResponseStatusCode;
  unint64_t v23;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = objc_msgSend(v11, "length");
  v13 = objc_retainAutorelease(v11);
  v14 = (const UInt8 *)objc_msgSend(v13, "bytes");

  if (!CFHTTPMessageAppendBytes(a4, v14, v12))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_10;
  }
  if (!CFHTTPMessageIsHeaderComplete(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionInternalErrorDomain"), 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    ResponseStatusCode = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v15 = CFHTTPMessageCopyBody(a4);
  if (v15)
  {
    v16 = v15;
    Length = CFDataGetLength(v15);
    v18 = v12 - Length;
    if (v12 <= Length)
    {
      v23 = Length;
      v24 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
      {
        v25 = 136315650;
        v26 = "-[SiriCoreSiriBackgroundConnection _tryParsingHTTPHeaderData:partialMessage:statusCode:bytesRead:error:]";
        v27 = 2050;
        v28 = v23;
        v29 = 2050;
        v30 = v12;
        _os_log_error_impl(&dword_211AB2000, v24, OS_LOG_TYPE_ERROR, "%s Something has gone terribly wrong. bytesRead: %{public}lld bodyLength: %{public}tu", (uint8_t *)&v25, 0x20u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 15, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
    }
    else
    {
      v19 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        v25 = 136315394;
        v26 = "-[SiriCoreSiriBackgroundConnection _tryParsingHTTPHeaderData:partialMessage:statusCode:bytesRead:error:]";
        v27 = 2048;
        v28 = v18;
        _os_log_impl(&dword_211AB2000, v19, OS_LOG_TYPE_INFO, "%s Header is complete bytes read %tu", (uint8_t *)&v25, 0x16u);
      }
      v20 = 0;
    }
    CFRelease(v16);
    v12 = v18;
  }
  else
  {
    v20 = 0;
  }
  ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(a4);
  if (a5)
LABEL_11:
    *a5 = ResponseStatusCode;
LABEL_12:
  if (a6)
    *a6 = v12;
  if (a7)
    *a7 = objc_retainAutorelease(v20);

  return v20 == 0;
}

- (id)_tryReadingAceHeaderFromData:(id)a3 bytesParsed:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v15;
  unint64_t v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v15 = 0;
  v16 = 0;
  +[SiriCoreAceSerialization tryParsingAceHeaderData:compressionType:bytesRead:error:](SiriCoreAceSerialization, "tryParsingAceHeaderData:compressionType:bytesRead:error:", a3, &v17, &v16, &v15);
  v7 = v15;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("SiriCoreAceSerializationErrorDomain")))
    {
      v10 = objc_msgSend(v8, "code");

      if (!v10)
      {
        v11 = *MEMORY[0x24BE08FC0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[SiriCoreSiriBackgroundConnection _tryReadingAceHeaderFromData:bytesParsed:error:]";
          _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_INFO, "%s Need more data to read ace header.", buf, 0xCu);
        }

        v8 = 0;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v13 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SiriCoreSiriBackgroundConnection _tryReadingAceHeaderFromData:bytesParsed:error:]";
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_211AB2000, v13, OS_LOG_TYPE_ERROR, "%s Error reading ace header %{public}@", buf, 0x16u);
    }
LABEL_12:
    v12 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = objc_alloc_init((Class)objc_opt_class());
  if (a4)
LABEL_13:
    *a4 = v16;
LABEL_14:
  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return v12;
}

- (BOOL)_tryReadingParsedDataFromBytes:(const void *)a3 length:(unint64_t)a4 packet:(id *)a5 object:(id *)a6 bytesParsed:(unint64_t *)a7 error:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id v26;
  unint64_t v27;
  $391024036B902F3EE9BCB0FBA5EF777F v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = 0;
  v25 = 0;
  v26 = 0;
  +[SiriCoreAceSerialization tryParsingPacketWithBytes:length:rawPacket:object:bytesRead:error:](SiriCoreAceSerialization, "tryParsingPacketWithBytes:length:rawPacket:object:bytesRead:error:", a3, a4, &v28, &v26, &v27, &v25);
  v12 = v26;
  v13 = v25;
  if (!v13)
  {
    if (v12)
      v21 = 0;
    else
      v21 = v28.var0 == 0;
    if (v21)
    {
      v22 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:]";
        _os_log_impl(&dword_211AB2000, v22, OS_LOG_TYPE_INFO, "%s No error parsing packet but we didn't get anything!", buf, 0xCu);
      }
    }
LABEL_14:
    v14 = 0;
    if (!a5)
      goto LABEL_20;
    goto LABEL_19;
  }
  v14 = v13;
  objc_msgSend(v13, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("SiriCoreAceSerializationErrorDomain")))
  {
    v16 = objc_msgSend(v14, "code");

    if (!v16)
    {
      objc_msgSend(v14, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("SiriCoreAceSerializationErrorUserInfoBytesNeeded"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("SiriCoreAceSerializationErrorUserInfoBytesAvailable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:]";
        v31 = 2112;
        v32 = v18;
        v33 = 2112;
        v34 = v19;
        _os_log_impl(&dword_211AB2000, v20, OS_LOG_TYPE_INFO, "%s Need more data to read packet. Needed: %@ Have: %@", buf, 0x20u);
      }

      v27 = 0;
      goto LABEL_14;
    }
  }
  else
  {

  }
  v23 = *MEMORY[0x24BE08FC0];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
  {
    if (!a5)
      goto LABEL_20;
    goto LABEL_19;
  }
  *(_DWORD *)buf = 136315394;
  v30 = "-[SiriCoreSiriBackgroundConnection _tryReadingParsedDataFromBytes:length:packet:object:bytesParsed:error:]";
  v31 = 2114;
  v32 = v14;
  _os_log_error_impl(&dword_211AB2000, v23, OS_LOG_TYPE_ERROR, "%s Error parsing packet data %{public}@", buf, 0x16u);
  if (a5)
LABEL_19:
    *a5 = v28;
LABEL_20:
  if (a6)
    *a6 = objc_retainAutorelease(v12);
  if (a7)
    *a7 = v27;
  if (a8)
    *a8 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (void)_handlePacket:(id *)a3
{
  switch(a3->var0)
  {
    case 1u:
      -[SiriCoreSiriBackgroundConnection _handleAceNop](self, "_handleAceNop");
      break;
    case 2u:
      -[SiriCoreSiriBackgroundConnection _handleAcePing:](self, "_handleAcePing:", a3->var1);
      break;
    case 3u:
      -[SiriCoreSiriBackgroundConnection _handleAcePong:](self, "_handleAcePong:", a3->var1);
      break;
    case 4u:
      -[SiriCoreSiriBackgroundConnection _handleAceEnd](self, "_handleAceEnd");
      break;
    default:
      return;
  }
}

- (void)_handleAceNop
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[SiriCoreSiriBackgroundConnection _handleAceNop]";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Connection got nop", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_handleAceObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "encodedClassName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriCoreSiriBackgroundConnection _handleAceObject:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_211AB2000, v6, OS_LOG_TYPE_INFO, "%s Connection got AceObject: %@", (uint8_t *)&v9, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "siriBackgroundConnection:didReceiveAceObject:", self, v4);

}

- (void)_handleAcePing:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SiriCoreSiriBackgroundConnection _handleAcePing:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Connection got ping %u", (uint8_t *)&v6, 0x12u);
  }
  -[SiriCoreSiriBackgroundConnection _sendAcePongWithId:error:](self, "_sendAcePongWithId:error:", v3, 0);
}

- (void)_handleAcePong:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SiriCoreSiriBackgroundConnection _handleAcePong:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_INFO, "%s Connection got pong %u", (uint8_t *)&v7, 0x12u);
  }
  if (v3 > 0xFFFE795F)
  {
    -[SiriCoreSiriBackgroundConnection _handleBarrierReply:](self, "_handleBarrierReply:", v3);
  }
  else
  {
    -[SiriCorePingInfo markPongReceivedWithIndex:](self->_pingInfo, "markPongReceivedWithIndex:", v3);
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEventWithType:context:", 1006, 0);

  }
}

- (void)_handleAceEnd
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FC0];
  v4 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SiriCoreSiriBackgroundConnection _handleAceEnd]";
    _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_INFO, "%s Connection got ace end. Terminating connection", (uint8_t *)&v7, 0xCu);
  }
  if (-[SiriCoreSiriBackgroundConnection _hasBufferedDataOrOutstandingPings](self, "_hasBufferedDataOrOutstandingPings"))
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[SiriCoreSiriBackgroundConnection _handleAceEnd]";
      _os_log_error_impl(&dword_211AB2000, v5, OS_LOG_TYPE_ERROR, "%s Ace end is unexpected, return error", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreSiriBackgroundConnection _didEncounterError:](self, "_didEncounterError:", v6);

  }
  -[SiriCoreSiriBackgroundConnection cancel](self, "cancel");
}

- (id)analysisInfo
{
  return (id)-[SiriCoreConnectionProvider analysisInfo](self->_connectionProvider, "analysisInfo");
}

- (id)_connectionMethodDescription
{
  int64_t connectionMethod;
  __CFString *v3;
  SiriCoreSiriConnectionInfo *v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  int v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  __CFString *v15;

  connectionMethod = self->_connectionMethod;
  if (connectionMethod == 2)
  {
    v6 = self->_connectionInfo;
    -[SiriCoreSiriConnectionInfo connectionPolicyRoute](v6, "connectionPolicyRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE81AE0]);

    if ((v9 & 1) != 0)
    {
      v10 = CFSTR("Florence");
    }
    else
    {
      v11 = -[SiriCoreConnectionProvider isMultipath](self->_connectionProvider, "isMultipath");
      -[SiriCoreSiriConnectionInfo connectionPolicy](v6, "connectionPolicy");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12
        && (v13 = (void *)v12,
            v14 = -[SiriCoreSiriConnectionInfo imposePolicyBan](v6, "imposePolicyBan"),
            v13,
            v14))
      {
        v15 = CFSTR("TCP_PolicyBanned");
        if (v11)
          v15 = CFSTR("MPTCP_PolicyBanned");
        v10 = v15;
      }
      else if (v11)
      {
        v10 = CFSTR("MPTCP");
      }
      else
      {
        v10 = CFSTR("TCP");
      }
    }

    return v10;
  }
  else
  {
    v3 = CFSTR("TCP");
    if (connectionMethod == 3)
      v3 = CFSTR("Peer");
    if (connectionMethod == 4)
      return CFSTR("Tuscany");
    else
      return v3;
  }
}

- (void)getConnectionMetrics:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  _BOOL4 isCanceled;
  NSObject *v9;
  _BOOL4 dispatchedSnapshotMetrics;
  SiriCoreConnectionMetrics *v11;
  double currentOpenTime;
  double firstStartTime;
  void *v14;
  double firstByteReadTime;
  void *v16;
  void *v17;
  void *v18;
  SiriCorePingInfo *pingInfo;
  uint64_t v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *metricsQueue;
  NSObject *v34;
  NSObject *v35;
  OS_dispatch_queue *v36;
  OS_dispatch_queue *v37;
  uint64_t v38;
  SiriCoreConnectionMetrics *v39;
  NSObject *v40;
  SiriCoreConnectionMetrics *v41;
  SiriCoreConnectionProvider *connectionProvider;
  SiriCoreConnectionProvider *v43;
  NSObject *v44;
  SiriCoreConnectionProvider *v45;
  NSObject *queue;
  SiriCoreConnectionMetrics *v47;
  void *v48;
  _QWORD v49[5];
  SiriCoreConnectionMetrics *v50;
  void (**v51)(id, _QWORD);
  _QWORD v52[4];
  SiriCoreConnectionProvider *v53;
  NSObject *v54;
  _QWORD v55[5];
  SiriCoreConnectionMetrics *v56;
  _QWORD block[5];
  SiriCoreConnectionMetrics *v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  _BOOL4 v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  isCanceled = self->_isCanceled;
  if (self->_isCanceled || self->_dispatchedSnapshotMetrics)
  {
    v9 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
    {
      dispatchedSnapshotMetrics = self->_dispatchedSnapshotMetrics;
      *(_DWORD *)buf = 136315650;
      v60 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]";
      v61 = 1024;
      v62 = isCanceled;
      v63 = 1024;
      v64 = dispatchedSnapshotMetrics;
      _os_log_impl(&dword_211AB2000, v9, OS_LOG_TYPE_INFO, "%s isCanceled %d dispatched %d", buf, 0x18u);
    }
    v7[2](v7, 0);
  }
  else
  {
    ++self->_metricsCount;
    v11 = objc_alloc_init(SiriCoreConnectionMetrics);
    -[SiriCoreConnectionMetrics setConnectionMethodHistory:](v11, "setConnectionMethodHistory:", v6);
    currentOpenTime = self->_currentOpenTime;
    firstStartTime = self->_firstStartTime;
    if (currentOpenTime > firstStartTime)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", currentOpenTime - firstStartTime);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setTimeUntilOpen:](v11, "setTimeUntilOpen:", v14);

      firstStartTime = self->_firstStartTime;
    }
    firstByteReadTime = self->_firstByteReadTime;
    if (firstByteReadTime > firstStartTime)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", firstByteReadTime - firstStartTime);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setTimeUntilFirstByteRead:](v11, "setTimeUntilFirstByteRead:", v16);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_startCount);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setAttemptCount:](v11, "setAttemptCount:", v17);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_metricsCount);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setMetricsCount:](v11, "setMetricsCount:", v18);

    pingInfo = self->_pingInfo;
    if (pingInfo)
    {
      v20 = -[SiriCorePingInfo numberOfUnacknowledgedPings](pingInfo, "numberOfUnacknowledgedPings");
      v21 = -[SiriCorePingInfo pingAcknowledgedCount](self->_pingInfo, "pingAcknowledgedCount") + v20;
      v22 = (void *)MEMORY[0x24BDD16E0];
      -[SiriCorePingInfo avgPingTime](self->_pingInfo, "avgPingTime");
      objc_msgSend(v22, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setMeanPing:](v11, "setMeanPing:", v23);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setPingCount:](v11, "setPingCount:", v24);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setUnacknowledgedPingCount:](v11, "setUnacknowledgedPingCount:", v25);

    }
    else
    {
      -[SiriCoreConnectionMetrics setMeanPing:](v11, "setMeanPing:", &unk_24CCF53F0);
      -[SiriCoreConnectionMetrics setPingCount:](v11, "setPingCount:", &unk_24CCF53F0);
      -[SiriCoreConnectionMetrics setUnacknowledgedPingCount:](v11, "setUnacknowledgedPingCount:", &unk_24CCF53F0);
    }
    -[SiriCoreSiriBackgroundConnection _connectionMethodDescription](self, "_connectionMethodDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setConnectionMethod:](v11, "setConnectionMethod:", v26);

    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriCoreConnectionMetrics setProviderStyle:](v11, "setProviderStyle:", v28);

    -[SiriCoreSiriConnectionInfo connectionPolicy](self->_connectionInfo, "connectionPolicy");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "policyId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriCoreConnectionMetrics setPolicyId:](v11, "setPolicyId:", v31);

    }
    v48 = v30;
    v32 = dispatch_group_create();
    metricsQueue = self->_metricsQueue;
    if (!metricsQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v34 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_DEFAULT, 0);
      v35 = objc_claimAutoreleasedReturnValue();

      v36 = (OS_dispatch_queue *)dispatch_queue_create(0, v35);
      v37 = self->_metricsQueue;
      self->_metricsQueue = v36;

      metricsQueue = self->_metricsQueue;
    }
    v38 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke;
    block[3] = &unk_24CCE6BD0;
    block[4] = self;
    v39 = v11;
    v58 = v39;
    dispatch_group_async(v32, metricsQueue, block);
    v40 = self->_metricsQueue;
    v55[0] = v38;
    v55[1] = 3221225472;
    v55[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_2;
    v55[3] = &unk_24CCE6BD0;
    v55[4] = self;
    v41 = v39;
    v56 = v41;
    dispatch_group_async(v32, v40, v55);
    connectionProvider = self->_connectionProvider;
    if (connectionProvider)
    {
      v43 = connectionProvider;
      dispatch_group_enter(v32);
      v44 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v60 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]";
        _os_log_debug_impl(&dword_211AB2000, v44, OS_LOG_TYPE_DEBUG, "%s Asking for metrics from stream provider", buf, 0xCu);
      }
      v52[0] = v38;
      v52[1] = 3221225472;
      v52[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_189;
      v52[3] = &unk_24CCE6BD0;
      v53 = v43;
      v54 = v32;
      v45 = v43;
      -[SiriCoreConnectionProvider updateConnectionMetrics:completion:](v45, "updateConnectionMetrics:completion:", v41, v52, v30);

    }
    queue = self->_queue;
    v49[0] = v38;
    v49[1] = 3221225472;
    v49[2] = __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_190;
    v49[3] = &unk_24CCE6C88;
    v49[4] = self;
    v50 = v41;
    v51 = v7;
    v47 = v41;
    dispatch_group_notify(v32, queue, v49);

  }
}

- (SiriCoreSiriBackgroundConnectionDelegate)delegate
{
  return (SiriCoreSiriBackgroundConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)peerType
{
  return self->_peerType;
}

- (void)setPeerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)peerVersion
{
  return self->_peerVersion;
}

- (void)setPeerVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)productTypePrefix
{
  return self->_productTypePrefix;
}

- (void)setProductTypePrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)usesProxyConnection
{
  return self->_usesProxyConnection;
}

- (void)setUsesProxyConnection:(BOOL)a3
{
  self->_usesProxyConnection = a3;
}

- (BOOL)siriConnectionUsesPeerManagedSync
{
  return self->_siriConnectionUsesPeerManagedSync;
}

- (void)setSiriConnectionUsesPeerManagedSync:(BOOL)a3
{
  self->_siriConnectionUsesPeerManagedSync = a3;
}

- (Class)peerProviderClass
{
  return self->_peerProviderClass;
}

- (void)setPeerProviderClass:(Class)a3
{
  objc_storeStrong((id *)&self->_peerProviderClass, a3);
}

- (BOOL)deviceIsInWalkaboutExperimentGroup
{
  return self->_deviceIsInWalkaboutExperimentGroup;
}

- (void)setDeviceIsInWalkaboutExperimentGroup:(BOOL)a3
{
  self->_deviceIsInWalkaboutExperimentGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryConnectionProvider, 0);
  objc_storeStrong((id *)&self->_outgoingCommandsWithSendCompletions, 0);
  objc_storeStrong((id *)&self->_peerProviderClass, 0);
  objc_storeStrong((id *)&self->_productTypePrefix, 0);
  objc_storeStrong((id *)&self->_peerVersion, 0);
  objc_storeStrong((id *)&self->_peerType, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_safetyNetBuffer, 0);
  objc_storeStrong((id *)&self->_outstandingBarriers, 0);
  objc_storeStrong((id *)&self->_pingInfo, 0);
  objc_storeStrong((id *)&self->_pingTimerSource, 0);
  objc_storeStrong((id *)&self->_aceHeaderTimerSource, 0);
  objc_storeStrong((id *)&self->_errorsForConnectionMethods, 0);
  objc_storeStrong((id *)&self->_outputCompressor, 0);
  objc_storeStrong((id *)&self->_inputDecompressor, 0);
  objc_storeStrong((id *)&self->_bufferedUncompressedData, 0);
  objc_storeStrong((id *)&self->_bufferedGeneralOutputData, 0);
  objc_storeStrong((id *)&self->_bufferedProviderHeaderOutputData, 0);
  objc_storeStrong((id *)&self->_bufferedInputData, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getWifiMetrics:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getCellularMetrics:", *(_QWORD *)(a1 + 40));
}

void __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_189(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_debug_impl(&dword_211AB2000, v2, OS_LOG_TYPE_DEBUG, "%s Got metrics from stream provider %@", (uint8_t *)&v4, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __72__SiriCoreSiriBackgroundConnection_getConnectionMetrics_withCompletion___block_invoke_190(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 360) = 1;
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SiriCoreSiriBackgroundConnection getConnectionMetrics:withCompletion:]_block_invoke";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_INFO, "%s Giving metrics back", (uint8_t *)&v4, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  size_t size;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  kdebug_trace();
  v7 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v7[3])
  {
    v8 = *MEMORY[0x24BE08FC0];
    if (!v5 || v6)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
        v13 = 2112;
        size = (size_t)v6;
        _os_log_error_impl(&dword_211AB2000, v8, OS_LOG_TYPE_ERROR, "%s Error reading data with error %@", buf, 0x16u);
        v7 = *(_QWORD **)(a1 + 40);
      }
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke_166;
      v9[3] = &unk_24CCE6BD0;
      v9[4] = v7;
      v10 = v6;
      objc_msgSend(v7, "_fallBackToNextConnectionMethodWithError:orElse:", v10, v9);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
        v13 = 2048;
        size = dispatch_data_get_size(v5);
        _os_log_impl(&dword_211AB2000, v8, OS_LOG_TYPE_DEFAULT, "%s read %lu bytes", buf, 0x16u);
        v7 = *(_QWORD **)(a1 + 40);
      }
      objc_msgSend(v7, "_connectionHasBytesAvailable:", v5);
      objc_msgSend(*(id *)(a1 + 40), "_setupReadHandlerOnProvider");
    }
  }

}

uint64_t __63__SiriCoreSiriBackgroundConnection__setupReadHandlerOnProvider__block_invoke_166(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  _BOOL4 v10;
  _BYTE v12[22];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_hasBufferedDataOrOutstandingPings"))
  {
    v2 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
      _os_log_error_impl(&dword_211AB2000, v2, OS_LOG_TYPE_ERROR, "%s Read Error - mid request", v12, 0xCu);
    }
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    return objc_msgSend(v3, "_didEncounterError:", v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SiriCoreSiriConnectionErrorDomain")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v6 == 25)
    {
      v7 = *MEMORY[0x24BE08FC0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v12 = 136315138;
        *(_QWORD *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
        v8 = "%s Read Error - NWConnectionReadFailure";
LABEL_18:
        _os_log_error_impl(&dword_211AB2000, v7, OS_LOG_TYPE_ERROR, v8, v12, 0xCu);
        return objc_msgSend(*(id *)(a1 + 32), "cancel", *(_OWORD *)v12);
      }
      return objc_msgSend(*(id *)(a1 + 32), "cancel", *(_OWORD *)v12);
    }
  }
  else
  {

  }
  v9 = *(_QWORD *)(a1 + 40);
  v7 = *MEMORY[0x24BE08FC0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v10)
    {
      *(_DWORD *)v12 = 136315394;
      *(_QWORD *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
      *(_WORD *)&v12[12] = 2112;
      *(_QWORD *)&v12[14] = v9;
      _os_log_error_impl(&dword_211AB2000, v7, OS_LOG_TYPE_ERROR, "%s Read Error - error %@", v12, 0x16u);
      v9 = *(_QWORD *)(a1 + 40);
    }
    v3 = *(void **)(a1 + 32);
    v4 = v9;
    return objc_msgSend(v3, "_didEncounterError:", v4);
  }
  if (v10)
  {
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)&v12[4] = "-[SiriCoreSiriBackgroundConnection _setupReadHandlerOnProvider]_block_invoke";
    v8 = "%s Read Error - cancel";
    goto LABEL_18;
  }
  return objc_msgSend(*(id *)(a1 + 32), "cancel", *(_OWORD *)v12);
}

uint64_t __62__SiriCoreSiriBackgroundConnection_sendCommands_errorHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), *(_QWORD *)(result + 32), a2);
  return result;
}

void __65__SiriCoreSiriBackgroundConnection__tryToWriteBufferedOutputData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  kdebug_trace();
  v4 = *MEMORY[0x24BE08FC0];
  v5 = *MEMORY[0x24BE08FC0];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData]_block_invoke";
      v9 = 2114;
      v10 = v3;
      _os_log_error_impl(&dword_211AB2000, v4, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = 136315394;
    v8 = "-[SiriCoreSiriBackgroundConnection _tryToWriteBufferedOutputData]_block_invoke";
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_211AB2000, v4, OS_LOG_TYPE_DEFAULT, "%s Wrote: %lu", (uint8_t *)&v7, 0x16u);
  }

}

void __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  CFHTTPMessageSetHeaderFieldValue(*(CFHTTPMessageRef *)(a1 + 32), a2, a3);
}

void __91__SiriCoreSiriBackgroundConnection__headerDataForURL_aceHost_languageCode_syncAssistantId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *headerField;

  headerField = a2;
  v5 = a3;
  if ((AFIsInternalInstall() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (-[__CFString hasPrefix:](headerField, "hasPrefix:", *MEMORY[0x24BE08D18]) & 1) == 0)
  {
    CFHTTPMessageSetHeaderFieldValue(*(CFHTTPMessageRef *)(a1 + 32), headerField, v5);
  }

}

void __81__SiriCoreSiriBackgroundConnection_connectionProvider_receivedIntermediateError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v3, "siriBackgroundConnection:didEncounterIntermediateError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("SiriCoreSiriConnectionErrorDomain"))
      && objc_msgSend(*(id *)(a1 + 48), "code") == 4
      && (AFDeviceSupportsSiriUOD() & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));

      if (WeakRetained)
      {
        v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
        v5 = *(void **)(a1 + 40);
        v4 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v5, "analysisInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "siriBackgroundConnection:didEncounterError:analysisInfo:", v5, v4, v6);

        return;
      }
    }
    else
    {

    }
    v7 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedError:]_block_invoke";
      v16 = 2114;
      v17 = v10;
      _os_log_error_impl(&dword_211AB2000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v9 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke_105;
    v12[3] = &unk_24CCE6BD0;
    v12[4] = v9;
    v13 = v8;
    objc_msgSend(v9, "_fallBackToNextConnectionMethodWithError:orElse:", v13, v12);

  }
}

uint64_t __69__SiriCoreSiriBackgroundConnection_connectionProvider_receivedError___block_invoke_105(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_hasBufferedDataOrOutstandingPings"))
  {
    v2 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[SiriCoreSiriBackgroundConnection connectionProvider:receivedError:]_block_invoke";
      _os_log_error_impl(&dword_211AB2000, v2, OS_LOG_TYPE_ERROR, "%s Error Occurred mid request", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_didEncounterError:", *(_QWORD *)(a1 + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v3, "siriBackgroundConnection:didEncounterIntermediateError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __51__SiriCoreSiriBackgroundConnection__pingTimerFired__block_invoke_102(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BE090C0], "logPingTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_didEncounterError:", *(_QWORD *)(a1 + 40));
}

void __49__SiriCoreSiriBackgroundConnection_setSendPings___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pingTimerFired");

}

uint64_t __72__SiriCoreSiriBackgroundConnection__aceHeaderTimeoutFired_afterTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didEncounterError:", *(_QWORD *)(a1 + 40));
}

void __79__SiriCoreSiriBackgroundConnection__scheduleAceHeaderTimeoutTimerWithInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_aceHeaderTimeoutFired:afterTimeout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

uint64_t __89__SiriCoreSiriBackgroundConnection__fallBackToNextConnectionMethod_fromError_afterDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriCoreSiriBackgroundConnection _fallBackToNextConnectionMethod:fromError:afterDelay:]_block_invoke";
    _os_log_impl(&dword_211AB2000, v2, OS_LOG_TYPE_DEFAULT, "%s Beginning fallback now", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_startWithConnectionInfo:proposedFallbackMethod:allowFallbackToNewMethod:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) == 0);
}

void __55__SiriCoreSiriBackgroundConnection__didEncounterError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:contextNoCopy:", 1004, v2, 1);

  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "objectForKey:", CFSTR("connected_bt_devices"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v2, "objectForKey:", CFSTR("connected_bt_devices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v34 = v2;
      objc_msgSend(v2, "objectForKey:", CFSTR("connected_bt_devices"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              v15 = objc_alloc_init(MEMORY[0x24BE952A0]);
              objc_msgSend(v14, "objectForKey:", CFSTR("index"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v14, "objectForKey:", CFSTR("index"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setIndex:", v17);

              }
              else
              {
                objc_msgSend(v15, "setIndex:", 0);
              }

              objc_msgSend(v14, "objectForKey:", CFSTR("RSSI"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v14, "objectForKey:", CFSTR("RSSI"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "doubleValue");
                objc_msgSend(v15, "setRssi:");

              }
              else
              {
                objc_msgSend(v15, "setRssi:", 0.0);
              }

              objc_msgSend(v35, "addObject:", v15);
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v10);
      }

      v2 = v34;
    }
  }
  v20 = objc_alloc_init(MEMORY[0x24BE95330]);
  objc_msgSend(v20, "setConnectedBtDevices:", v35);
  objc_msgSend(v2, "objectForKey:", CFSTR("cloud_connected"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("cloud_connected"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsCloudConnected:", objc_msgSend(v22, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v20, "setIsCloudConnected:", 0);
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("connected"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("connected"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsConnected:", objc_msgSend(v24, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v20, "setIsConnected:", 0);
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("has_device"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("has_device"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHasDevice:", objc_msgSend(v26, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v20, "setHasDevice:", 0);
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("last_nearby_status_change"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("last_nearby_status_change"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v20, "setTimeSinceLastNearbyChangeInSeconds:");

  }
  else
  {
    objc_msgSend(v20, "setTimeSinceLastNearbyChangeInSeconds:", 0.0);
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("nearby"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("nearby"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsNearby:", objc_msgSend(v30, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v20, "setIsNearby:", 0);
  }

  objc_msgSend(v2, "objectForKey:", CFSTR("preferring_bt_classic"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("preferring_bt_classic"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsPreferringBtClassic:", objc_msgSend(v32, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v20, "setIsPreferringBtClassic:", 0);
  }

  +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics](SiriCoreNetworkingAnalytics, "sharedSiriCoreNetworkingAnalytics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "logPeerConnectionFailed:", v20);

}

void __61__SiriCoreSiriBackgroundConnection__startSecondaryConnection__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  kdebug_trace();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = *(_QWORD *)(a1 + 40);
  AFAnalyticsContextCreateWithError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v19 = CFSTR("primaryIsViable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 1010, v10);

  if ((_DWORD)v4)
  {
    v11 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("ignored with no errors.");
      if (v3)
        v12 = v3;
      v15 = 136315394;
      v16 = "-[SiriCoreSiriBackgroundConnection _startSecondaryConnection]_block_invoke";
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_211AB2000, v11, OS_LOG_TYPE_DEFAULT, "%s Secondary open completion %@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_cancelSecondaryConnection");
  }
  else if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelSecondaryConnection");
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriCoreSiriConnectionErrorDomain"), 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_didEncounterError:", v13);

  }
  else
  {
    v14 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[SiriCoreSiriBackgroundConnection _startSecondaryConnection]_block_invoke";
      _os_log_impl(&dword_211AB2000, v14, OS_LOG_TYPE_DEFAULT, "%s Secondary connection opened and waiting.", (uint8_t *)&v15, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) = 2;
    objc_msgSend(*(id *)(a1 + 32), "_forceTriggerRetry");
  }

}

void __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  char v16;
  double v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  kdebug_trace();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = *(_QWORD *)(a1 + 48);
  AFAnalyticsContextCreateWithError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v7;
  v24 = CFSTR("stale");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4 != v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventWithType:context:", 1008, v11);

  if (v4 == v5)
  {
    v13 = *MEMORY[0x24BE08FC0];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:]_block_invoke";
        v22 = 2112;
        v23 = v3;
        _os_log_impl(&dword_211AB2000, v13, OS_LOG_TYPE_INFO, "%s provider open error: %@", buf, 0x16u);
      }
      v15 = *(void **)(a1 + 40);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke_57;
      v18[3] = &unk_24CCE6BD0;
      v18[4] = v15;
      v19 = v3;
      objc_msgSend(v15, "_fallBackToNextConnectionMethodWithError:orElse:", v19, v18);

    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:]_block_invoke_2";
        _os_log_impl(&dword_211AB2000, v13, OS_LOG_TYPE_INFO, "%s provider opened", buf, 0xCu);
      }
      v16 = objc_msgSend(*(id *)(a1 + 32), "shouldFallbackQuickly");
      v17 = 5.0;
      if ((v16 & 1) == 0)
      {
        if (*(_BYTE *)(a1 + 88))
          objc_msgSend(*(id *)(a1 + 56), "timeout", 5.0);
        else
          v17 = 7.0;
      }
      objc_msgSend(*(id *)(a1 + 40), "_scheduleAceHeaderTimeoutTimerWithInterval:", v17);
      objc_msgSend(*(id *)(a1 + 40), "_updateBuffersForInitialPayload:bufferedLength:forceReconnect:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), objc_msgSend(*(id *)(a1 + 72), "forceReconnect"));
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = CFHTTPMessageCreateEmpty(0, 0);
      objc_msgSend(*(id *)(a1 + 40), "_setupReadHandlerOnProvider");
      objc_msgSend(*(id *)(a1 + 40), "_networkProviderDidOpen");
    }
  }
  else
  {
    v12 = *MEMORY[0x24BE08FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SiriCoreSiriBackgroundConnection _startNetworkProviderWithInfo:]_block_invoke";
      _os_log_impl(&dword_211AB2000, v12, OS_LOG_TYPE_DEFAULT, "%s Ignoring open completion for stale connection", buf, 0xCu);
    }
  }

}

uint64_t __66__SiriCoreSiriBackgroundConnection__startNetworkProviderWithInfo___block_invoke_57(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didEncounterError:", *(_QWORD *)(a1 + 40));
}

@end
