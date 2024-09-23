@implementation WPDPipeManager

- (WPDPipeManager)initWithServer:(id)a3
{
  id v4;
  WPDPipeManager *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  CBScalablePipeManager *pipeManager;
  uint64_t v11;
  NSMutableDictionary *endpointsDict;
  uint64_t v13;
  NSMutableDictionary *peerPipesDict;
  uint64_t v15;
  NSMutableDictionary *connectionInitiators;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WPDPipeManager;
  v5 = -[WPDManager initWithServer:Name:](&v20, sel_initWithServer_Name_, v4, CFSTR("WPPM"));
  if (v5)
  {
    objc_msgSend(v4, "serverQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_queue, v6);

    v7 = objc_alloc(MEMORY[0x24BDBB290]);
    objc_msgSend(v4, "serverQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithDelegate:queue:", v5, v8);
    pipeManager = v5->_pipeManager;
    v5->_pipeManager = (CBScalablePipeManager *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    endpointsDict = v5->_endpointsDict;
    v5->_endpointsDict = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    peerPipesDict = v5->_peerPipesDict;
    v5->_peerPipesDict = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    connectionInitiators = v5->_connectionInitiators;
    v5->_connectionInitiators = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5->_pipeManager);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDManager setCbManagers:](v5, "setCbManagers:", v17);

    objc_msgSend(v4, "wpdState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerManager:", v5->_pipeManager);

    v5->_wpPipeDataSignPostID = os_signpost_id_make_with_pointer((os_log_t)WiProxLog, v5);
  }

  return v5;
}

- (id)generateStateDumpStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v14.receiver = self;
  v14.super_class = (Class)WPDPipeManager;
  -[WPDManager generateStateDumpStrings](&v14, sel_generateStateDumpStrings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[WPDPipeManager endpointsDict](self, "endpointsDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("endpointsDict %@\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)MEMORY[0x24BDD17C8];
  -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("peerPipesDict %@\n"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)registerEndpoint:(id)a3 requireAck:(BOOL)a4 requireEncryption:(BOOL)a5 forClient:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  CBScalablePipeManager *pipeManager;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v7 = a5;
  v8 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_334_0);
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v10;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v14;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: registerEndpoint %@ for client %@ endpointsDict %@", buf, 0x20u);

  }
  if (v10 && v11)
  {
    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "clientUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v11);

      if (v18)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_336);
        v19 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v11;
          v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "WPPM: registerEndpoint: client %@ has already registered Endpoint %@", buf, 0x16u);
        }
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_338_0);
        v25 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        {
          v29 = v25;
          objc_msgSend(v16, "clientUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = v30;
          v35 = 2112;
          v36 = v10;
          v37 = 2112;
          v38 = v11;
          _os_log_error_impl(&dword_2175D1000, v29, OS_LOG_TYPE_ERROR, "WPPM: registerEndpont: client %@ has already registered endpoint %@ but new client %@ wants to register same endpoint, replace with the last client", buf, 0x20u);

        }
        objc_msgSend(v16, "setClientUUID:", v11);
      }
    }
    else
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setClientUUID:", v11);
      objc_msgSend(v16, "setRequireAck:", v8);
      objc_msgSend(v16, "setRequireEncyption:", v7);
      -[WPDPipeManager endpointsDict](self, "endpointsDict");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, v10);

      pipeManager = self->_pipeManager;
      v22 = *MEMORY[0x24BDBB1D0];
      v32[0] = &unk_24D7D7EF0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7, v22, *MEMORY[0x24BDBB1C8]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = *MEMORY[0x24BDBB1C0];
      v32[1] = v23;
      v32[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBScalablePipeManager registerEndpoint:type:priority:options:](pipeManager, "registerEndpoint:type:priority:options:", v10, 2, 2, v24);

    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_344_1);
    v26 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      -[WPDPipeManager endpointsDict](self, "endpointsDict");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v28;
      _os_log_impl(&dword_2175D1000, v27, OS_LOG_TYPE_DEFAULT, "WPPM: registerEndpoint: Current endpointsDict %@", buf, 0xCu);

    }
  }

}

- (void)unregisterEndpoint:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_345_0);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: unregisterEndpoint %@ for client %@ endpointsDict %@", (uint8_t *)&v22, 0x20u);

  }
  if (v6)
  {
    if (v7)
    {
      -[WPDPipeManager endpointsDict](self, "endpointsDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        -[WPDPipeManager endpointsDict](self, "endpointsDict");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14
          && (objc_msgSend(v14, "clientUUID"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "isEqual:", v7),
              v15,
              v16))
        {
          -[WPDPipeManager endpointsDict](self, "endpointsDict");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v6);

          -[CBScalablePipeManager unregisterEndpoint:](self->_pipeManager, "unregisterEndpoint:", v6);
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_347);
          v18 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            v22 = 138412546;
            v23 = v6;
            v24 = 2112;
            v25 = v7;
            _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: unregisterEndpoint: Endpoint %@ already unregisterd for client %@", (uint8_t *)&v22, 0x16u);
          }
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_349);
        v19 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          -[WPDPipeManager endpointsDict](self, "endpointsDict");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v21;
          _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "WPPM: unregisterEndpoint: Current endpointsDict %@", (uint8_t *)&v22, 0xCu);

        }
      }
    }
  }

}

- (void)sendData:(id)a3 forPeer:(id)a4 forClient:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  __int16 v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  const void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  int64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  uint64_t *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  uint64_t *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  NSObject *v94;
  uint64_t *v95;
  unsigned __int16 v96;
  _QWORD v97[4];
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  id v114;
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  id v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  void *v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  const __CFString *v128;
  char v129[24];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v67 = a4;
  v68 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_350);
  v9 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v48 = v9;
    *(_DWORD *)buf = 134218754;
    v116 = objc_msgSend(v8, "length");
    v117 = 2112;
    v118 = (uint64_t)v8;
    v119 = 2112;
    v120 = v67;
    v121 = 2112;
    v122 = (uint64_t)v68;
    _os_log_debug_impl(&dword_2175D1000, v48, OS_LOG_TYPE_DEBUG, "WPPM: sendData: size (%lu): %@ to peer %@ for client %@", buf, 0x2Au);

  }
  -[WPDManager server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getClientForUUID:", v68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v106 = 0;
    v107 = 0;
    v108 = &v107;
    v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__5;
    v111 = __Block_byref_object_dispose__5;
    v112 = 0;
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__5;
    v105 = __Block_byref_object_dispose__5;
    objc_msgSend(v11, "endpointsSet");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_352_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDPipeManager sendData:forPeer:forClient:].cold.8();
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v67);
    v66 = (id)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      v97[0] = MEMORY[0x24BDAC760];
      v97[1] = 3221225472;
      v97[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_353;
      v97[3] = &unk_24D7C7D70;
      v98 = v65;
      v99 = &v107;
      v100 = &v101;
      objc_msgSend(v66, "enumerateObjectsUsingBlock:", v97);

    }
    if (v108[5])
    {
      v13 = objc_msgSend(v8, "length");
      if (objc_msgSend((id)v102[5], "newProtocol"))
      {
        if (objc_msgSend((id)v102[5], "pipeDidConnectSent"))
        {
          objc_msgSend((id)v102[5], "pipeDataTransfer");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = -[PipeDataTransfer initPipeDataTransferForPeer:]([PipeDataTransfer alloc], "initPipeDataTransferForPeer:", v67);
            objc_msgSend((id)v102[5], "setPipeDataTransfer:", v14);
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_356_0);
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
              -[WPDPipeManager sendData:forPeer:forClient:].cold.6();
          }
          v96 = 0;
          objc_msgSend(v8, "getBytes:length:", &v96, 2);
          objc_msgSend(v14, "setTxTotalLenToSend:", v96);
          objc_msgSend(v8, "subdataWithRange:", 2, v13 - 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTxTotalDataToSend:", v15);

          objc_msgSend(v14, "setTxData:", v8);
          objc_msgSend(v14, "setTxSeqNum:", objc_msgSend(v14, "generateSequenceNumber"));
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_358);
          v16 = (id)WiProxLog;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[WPDPipeManager sendData:forPeer:forClient:].cold.5(v96, buf, objc_msgSend(v8, "length"), v16);

          v17 = objc_msgSend(v8, "length");
          v63 = &v61;
          v18 = (unsigned __int16)(v17 + 4);
          MEMORY[0x24BDAC7A8]();
          v20 = (char *)&v61 - v19;
          bzero((char *)&v61 - v19, v18);
          *v20 = 2;
          *(_WORD *)(v20 + 1) = v17 + 3;
          v20[3] = objc_msgSend(v14, "txSeqNum");
          v64 = objc_retainAutorelease(v8);
          v21 = (const void *)objc_msgSend(v64, "bytes");
          memcpy(v20 + 4, v21, objc_msgSend(v64, "length"));
          objc_msgSend(v14, "setTxDataLeftToSend:", v18);
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v20, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v22, v102[5]);

          if (v23 < 1)
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_365_0);
            v49 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
              -[WPDPipeManager sendData:forPeer:forClient:].cold.4(v49, v50, v51);
            v52 = (void *)MEMORY[0x24BDD1540];
            v127 = *MEMORY[0x24BDD0FC8];
            v128 = CFSTR("sendData failure");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 26, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            -[WPDPipeManager queue](self, "queue");
            v55 = objc_claimAutoreleasedReturnValue();
            v90[0] = MEMORY[0x24BDAC760];
            v90[1] = 3221225472;
            v90[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_367;
            v90[3] = &unk_24D7C7E18;
            v91 = v11;
            v92 = v64;
            v95 = &v107;
            v56 = v67;
            v93 = v56;
            v24 = v54;
            v94 = v24;
            dispatch_async(v55, v90);

            objc_msgSend((id)v108[5], "name");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v57, v56);

          }
          else
          {
            objc_msgSend(v14, "setTxDataLeftToSend:", objc_msgSend(v14, "txDataLeftToSend") - v23);
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_361_0);
            v24 = (id)WiProxLog;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[WPDPipeManager sendData:forPeer:forClient:].cold.3((uint64_t)v129, objc_msgSend(v14, "txDataLeftToSend"), v24);
          }

        }
        else
        {
          v37 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v11, "processName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("sendData failure: LE pipe client %@ for %@ is not connected"), v68, v38);
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_371_0);
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPDPipeManager sendData:forPeer:forClient:].cold.2();
          v39 = (void *)MEMORY[0x24BDD1540];
          v125 = *MEMORY[0x24BDD0FC8];
          v126 = v14;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          -[WPDPipeManager queue](self, "queue");
          v42 = objc_claimAutoreleasedReturnValue();
          v84[0] = MEMORY[0x24BDAC760];
          v84[1] = 3221225472;
          v84[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_372;
          v84[3] = &unk_24D7C7E18;
          v85 = v11;
          v86 = v8;
          v89 = &v107;
          v87 = v67;
          v88 = v41;
          v43 = v41;
          dispatch_async(v42, v84);

        }
      }
      else
      {
        v32 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v8, v102[5]);
        if (v32 == v13)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_377_0);
          v33 = (id)WiProxLog;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend((id)v108[5], "peer");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v116 = v13;
            v117 = 2048;
            v118 = v13;
            v119 = 2112;
            v120 = v35;
            _os_log_impl(&dword_2175D1000, v33, OS_LOG_TYPE_DEFAULT, "WPPM: sendData: bytes written %ld (expected %lu) to peer %@", buf, 0x20u);

          }
          -[WPDPipeManager queue](self, "queue");
          v36 = objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x24BDAC760];
          v74[1] = 3221225472;
          v74[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_378;
          v74[3] = &unk_24D7C7E80;
          v75 = v11;
          v76 = v8;
          v78 = &v107;
          v77 = v67;
          dispatch_async(v36, v74);

          v14 = v75;
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_374);
          v44 = (id)WiProxLog;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)v108[5], "peer");
            v64 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "identifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v108[5], "output");
            v63 = (uint64_t *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v63, "streamStatus");
            objc_msgSend((id)v108[5], "output");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "streamError");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219010;
            v116 = v32;
            v117 = 2048;
            v118 = v13;
            v119 = 2112;
            v120 = v58;
            v121 = 2048;
            v122 = v62;
            v123 = 2112;
            v124 = v60;
            _os_log_error_impl(&dword_2175D1000, v44, OS_LOG_TYPE_ERROR, "WPPM: sendData: bytes written %ld (expected %lu) to peer %@ with status %lu error %@", buf, 0x34u);

          }
          -[WPDPipeManager queue](self, "queue");
          v45 = objc_claimAutoreleasedReturnValue();
          v79[0] = MEMORY[0x24BDAC760];
          v79[1] = 3221225472;
          v79[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_375;
          v79[3] = &unk_24D7C7E80;
          v80 = v11;
          v81 = v8;
          v83 = &v107;
          v46 = v67;
          v82 = v46;
          dispatch_async(v45, v79);

          objc_msgSend((id)v108[5], "name");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v47, v46);

          v14 = v80;
        }
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "endpointsSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("sendData failure: LE pipe set %@ not found for client %@"), v26, v68);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_382);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDPipeManager sendData:forPeer:forClient:].cold.2();
      v27 = (void *)MEMORY[0x24BDD1540];
      v113 = *MEMORY[0x24BDD0FC8];
      v114 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPDPipeManager queue](self, "queue");
      v30 = objc_claimAutoreleasedReturnValue();
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_383;
      v69[3] = &unk_24D7C7EE8;
      v70 = v11;
      v71 = v8;
      v72 = v67;
      v73 = v29;
      v31 = v29;
      dispatch_async(v30, v69);

    }
    _Block_object_dispose(&v101, 8);

    _Block_object_dispose(&v107, 8);
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_385_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDPipeManager sendData:forPeer:forClient:].cold.1();
  }

}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_353(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a2;
  v7 = (void *)a1[4];
  v13 = v6;
  objc_msgSend(v6, "pipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v9);

  if ((_DWORD)v7)
  {
    objc_msgSend(v13, "pipe");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }

}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_367(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_372(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_375(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "output");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "streamError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v4, v5, v7);

}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_378(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v4, *(_QWORD *)(a1 + 48), 0);

}

void __45__WPDPipeManager_sendData_forPeer_forClient___block_invoke_383(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)setPipeClientConnectionStatus:(BOOL)a3 forPeer:(id)a4 forClient:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_386);
  v10 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    v14[0] = 67109634;
    v14[1] = v6;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEBUG, "WPPM: setPipeClientConnectionStatus: status: %d to peer %@ for client %@", (uint8_t *)v14, 0x1Cu);
  }
  -[WPDPipeManager pipeInfo:forClient:](self, "pipeInfo:forClient:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "newProtocol"))
    {
      objc_msgSend(v12, "setPipeDidConnectSent:", v6);
      if (!v6)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_388_0);
        v13 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14[0]) = 0;
          _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: send disconnect status to remote peer", (uint8_t *)v14, 2u);
        }
        -[WPDPipeManager sendConnectStatus:connectStatus:](self, "sendConnectStatus:connectStatus:", v12, 0);
      }
    }
  }

}

- (void)setConnectionInitiator:(BOOL)a3 forPeer:(id)a4 forClient:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BYTE v28[18];
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v6 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_389);
  v12 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 67109890;
    *(_DWORD *)&v28[4] = v6;
    *(_WORD *)&v28[8] = 2112;
    *(_QWORD *)&v28[10] = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: setConnectionInitiator: %d, peer: %@, client: %@, initiators: %@", v28, 0x26u);

  }
  if (v6)
  {
    if (v11)
    {
      if ((objc_msgSend(v11, "containsObject:", v8) & 1) == 0)
      {
        objc_msgSend(v11, "addObject:", v8);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_391);
        v15 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v28 = 138412290;
          *(_QWORD *)&v28[4] = v17;
          v18 = "WPPM: peer added: %@";
LABEL_22:
          _os_log_impl(&dword_2175D1000, v16, OS_LOG_TYPE_DEFAULT, v18, v28, 0xCu);

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v8);
      -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, v9);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_394);
      v22 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v22;
        -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = v17;
        v18 = "WPPM: alloc peer added %@";
        goto LABEL_22;
      }
    }
  }
  else if (v11 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "removeObject:", v8);
    -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, v9);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_396_0);
    v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v20;
      -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = v17;
      v18 = "WPPM: peer removed: %@";
      goto LABEL_22;
    }
  }
  -[WPDPipeManager pipeInfo:forClient:](self, "pipeInfo:forClient:", v8, v9, *(_OWORD *)v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && objc_msgSend(v23, "newProtocol"))
  {
    objc_msgSend(v24, "setConnectionInitiator:", v6);
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_398_0);
    v25 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v28 = 138412546;
      *(_QWORD *)&v28[4] = v24;
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = v6;
      _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, "WPPM: %@ is already connected, set initiator: %d", v28, 0x12u);
    }
    -[WPDManager server](self, "server");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "getClientForUUID:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27
      && v6
      && objc_msgSend(v24, "versionInfoSent")
      && objc_msgSend(v24, "versionInfoReceived")
      && (objc_msgSend(v24, "pipeDidConnectSent") & 1) == 0
      && objc_msgSend(v24, "useConnectStatusPDU"))
    {
      -[WPDPipeManager sendConnectStatus:connectStatus:](self, "sendConnectStatus:connectStatus:", v24, 1);
      objc_msgSend(v24, "setPipeDidConnectSent:", 1);
      objc_msgSend(v27, "connectedDeviceOverLEPipe:", v8);
    }

  }
}

- (id)pipeInfo:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  -[WPDManager server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getClientForUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  if (v9)
  {
    objc_msgSend(v9, "endpointsSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_399);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDPipeManager sendData:forPeer:forClient:].cold.8();
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __37__WPDPipeManager_pipeInfo_forClient___block_invoke_400;
      v16[3] = &unk_24D7C8030;
      v17 = v10;
      v18 = &v19;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

    }
    v13 = (void *)v20[5];
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __37__WPDPipeManager_pipeInfo_forClient___block_invoke_400(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v10 = v6;
  objc_msgSend(v6, "pipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v9);

  if ((_DWORD)v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)streamEvent:(unint64_t)a3
{
  id result;

  result = CFSTR("NSStreamEventNone");
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      result = CFSTR("NSStreamEventOpenCompleted");
      break;
    case 2uLL:
      result = CFSTR("NSStreamEventHasBytesAvailable");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = CFSTR("NSStreamEventHasSpaceAvailable");
      break;
    case 8uLL:
      result = CFSTR("NSStreamEventErrorOccurred");
      break;
    default:
      if (a3 == 16)
        result = CFSTR("NSStreamEventEndEncountered");
      else
LABEL_5:
        result = CFSTR("unknown");
      break;
  }
  return result;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BYTE v55[4096];
  uint64_t v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  _QWORD v63[4];
  id v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__5;
  v80 = __Block_byref_object_dispose__5;
  v81 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __37__WPDPipeManager_stream_handleEvent___block_invoke;
  v63[3] = &unk_24D7C8080;
  v9 = v6;
  v64 = v9;
  v65 = &v72;
  v66 = &v76;
  v67 = &v68;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v63);

  v10 = (void *)v77[5];
  if (v10)
  {
    objc_msgSend(v10, "pipe");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v57 = (id)objc_claimAutoreleasedReturnValue();

    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v77[5], "pipe");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDManager server](self, "server");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getClientForUUID:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    switch(a4)
    {
      case 1uLL:
        if (*((_BYTE *)v73 + 24))
        {
          if (!v19)
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_422_0);
            v39 = (id)WiProxLog;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)v77[5], "pipe");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "name");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v83 = v17;
              v84 = 2112;
              v85 = (uint64_t)v57;
              v86 = 2112;
              v87 = v47;
              _os_log_error_impl(&dword_2175D1000, v39, OS_LOG_TYPE_ERROR, "WPPM: output open: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

            }
            goto LABEL_69;
          }
          if ((!objc_msgSend((id)v77[5], "newProtocol")
             || objc_msgSend((id)v77[5], "versionInfoSent")
             && objc_msgSend((id)v77[5], "versionInfoReceived"))
            && (objc_msgSend((id)v77[5], "pipeDidConnectSent") & 1) == 0)
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_418);
            v44 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v45 = "WPPM: output open: send pipe connect notification";
              goto LABEL_85;
            }
            goto LABEL_86;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_420_0);
          v21 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)v77[5];
            *(_DWORD *)buf = 138412290;
            v83 = v22;
            v23 = "WPPM: output open: current pipe info: %@";
            v24 = v21;
            v25 = 12;
            goto LABEL_63;
          }
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_424_0);
          v34 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *((unsigned __int8 *)v69 + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v83) = v35;
            v23 = "WPPM: handleEvent: input stream opened %d";
            v24 = v34;
            v25 = 8;
            goto LABEL_63;
          }
        }
        goto LABEL_96;
      case 2uLL:
        v56 = (uint64_t)&v56;
        MEMORY[0x24BDAC7A8](v20);
        bzero(v55, 0x1000uLL);
        v26 = objc_msgSend(v9, "read:maxLength:", v55, 4096);
        if (!v26)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_447);
          v36 = (id)WiProxLog;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "streamError");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[WPDPipeManager stream:handleEvent:].cold.3(v37, (uint64_t)buf, v36);
          }
          goto LABEL_95;
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_436);
        v27 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v83 = v57;
          v84 = 2048;
          v85 = v26;
          _os_log_impl(&dword_2175D1000, v27, OS_LOG_TYPE_DEFAULT, "WPPM: input stream: receivedData from peer %@ of len %ld", buf, 0x16u);
        }
        if (*((_BYTE *)v69 + 24))
        {
          if (objc_msgSend((id)v77[5], "newProtocol"))
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_438_0);
            v28 = WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2175D1000, v28, OS_LOG_TYPE_DEFAULT, "WPPM: input stream: new protocol", buf, 2u);
            }
            -[WPDPipeManager handleIncomingPipeData:data:dataSize:](self, "handleIncomingPipeData:data:dataSize:", v77[5], v55, v26);
            goto LABEL_96;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_440_0);
          v40 = WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2175D1000, v40, OS_LOG_TYPE_DEFAULT, "WPPM: input stream: old protocol", buf, 2u);
          }
          if (v19)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v55, v26);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[WPDPipeManager queue](self, "queue");
            v42 = objc_claimAutoreleasedReturnValue();
            v58[0] = v8;
            v58[1] = 3221225472;
            v58[2] = __37__WPDPipeManager_stream_handleEvent___block_invoke_441;
            v58[3] = &unk_24D7C7E80;
            v59 = v19;
            v60 = v41;
            v62 = &v76;
            v61 = v57;
            v43 = v41;
            dispatch_async(v42, v58);

            goto LABEL_96;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_443);
          v36 = (id)WiProxLog;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)v77[5], "pipe");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "name");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v83 = v17;
            v84 = 2112;
            v85 = (uint64_t)v57;
            v86 = 2112;
            v87 = v49;
            _os_log_error_impl(&dword_2175D1000, v36, OS_LOG_TYPE_ERROR, "WPPM: input stream: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

          }
LABEL_95:

          goto LABEL_96;
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_445_0);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager stream:handleEvent:].cold.4();
        goto LABEL_96;
      case 4uLL:
        if (!*((_BYTE *)v73 + 24))
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_434);
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPDPipeManager stream:handleEvent:].cold.2();
          goto LABEL_96;
        }
        if (objc_msgSend((id)v77[5], "newProtocol"))
        {
          if ((objc_msgSend((id)v77[5], "versionInfoSent") & 1) == 0)
          {
            -[WPDPipeManager sendVersionInfo:](self, "sendVersionInfo:", v77[5]);
            goto LABEL_96;
          }
          if ((objc_msgSend((id)v77[5], "versionInfoReceived") & 1) != 0)
          {
            if (objc_msgSend((id)v77[5], "versionInfoSent")
              && objc_msgSend((id)v77[5], "versionInfoReceived")
              && (objc_msgSend((id)v77[5], "pipeDidConnectSent") & 1) == 0)
            {
              if (v19)
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_428);
                v44 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v45 = "WPPM: output stream: send pipe connect notification";
LABEL_85:
                  _os_log_impl(&dword_2175D1000, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 2u);
                }
LABEL_86:
                objc_msgSend((id)v77[5], "setPipeDidConnectSent:", 1);
                objc_msgSend(v19, "connectedDeviceOverLEPipe:", v57);
              }
              else
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_430);
                v50 = (id)WiProxLog;
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend((id)v77[5], "pipe");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "name");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v83 = v17;
                  v84 = 2112;
                  v85 = (uint64_t)v57;
                  v86 = 2112;
                  v87 = v54;
                  _os_log_error_impl(&dword_2175D1000, v50, OS_LOG_TYPE_ERROR, "WPPM: output stream: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

                }
                objc_msgSend((id)v77[5], "pipe");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "name");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v52, v57);

LABEL_69:
                v19 = 0;
              }
            }
            else
            {
              -[WPDPipeManager sendRemainingData:wpClient:](self, "sendRemainingData:wpClient:", v77[5], v19);
            }
            goto LABEL_96;
          }
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_426);
          v38 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_96;
          *(_WORD *)buf = 0;
          v23 = "WPPM: output stream: wait to receive version info";
        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_432);
          v38 = WiProxLog;
          if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_96;
          *(_WORD *)buf = 0;
          v23 = "WPPM: output stream: using old protocol";
        }
        v24 = v38;
        v25 = 2;
LABEL_63:
        _os_log_impl(&dword_2175D1000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
        goto LABEL_96;
      case 8uLL:
        if (*((_BYTE *)v73 + 24) || *((_BYTE *)v69 + 24))
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_449);
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPDPipeManager stream:handleEvent:].cold.5();
          objc_msgSend((id)v77[5], "pipe");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v77[5], "pipe");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "peer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v30, v33);

        }
        goto LABEL_96;
      default:
        goto LABEL_96;
    }
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_416);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDPipeManager stream:handleEvent:].cold.1();
  v19 = 0;
  v57 = 0;
  v17 = 0;
LABEL_96:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

}

void __37__WPDPipeManager_stream_handleEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v5[4];
  id v6;
  __int128 v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__WPDPipeManager_stream_handleEvent___block_invoke_2;
  v5[3] = &unk_24D7C8058;
  v6 = *(id *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);

}

void __37__WPDPipeManager_stream_handleEvent___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "pipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", a1[4]);

  if (v8)
  {
    v9 = a1[5];
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v13, "pipe");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "input");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", a1[4]);

  if (v12)
  {
    v9 = a1[7];
    goto LABEL_5;
  }
LABEL_6:

}

void __37__WPDPipeManager_stream_handleEvent___block_invoke_441(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedData:fromEndpoint:forPeripheral:", v3, v5, *(_QWORD *)(a1 + 48));

}

- (void)handleIncomingPipeData:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  WPDPipeManager *v22;
  id v23;
  char *v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  WPDPipeManager *v31;
  id v32;
  char *v33;
  int64_t v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[12];
  __int16 v38;
  int64_t v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = *a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_450);
  v10 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v8, "pipe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v37 = 138412802;
    *(_QWORD *)&v37[4] = v13;
    v38 = 2048;
    v39 = a5;
    v40 = 1024;
    v41 = v9;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "WPPM: handleIncomingPipeData: %@ of size: %ld first byte 0x%x", v37, 0x1Cu);

  }
  objc_msgSend(v8, "pipeDataTransfer");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v8, "pipeDataTransfer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rxWaitForMoreData");

    if (v17)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_452_0);
      v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        v19 = "WPPM: handleIncomingPipeData: continuation of previous packet";
        v20 = v18;
        v21 = 2;
LABEL_11:
        _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
      }
LABEL_12:
      v22 = self;
      v23 = v8;
      v24 = a4;
      v25 = a5;
LABEL_13:
      -[WPDPipeManager receivedPayload:data:dataSize:](v22, "receivedPayload:data:dataSize:", v23, v24, v25, *(_QWORD *)v37);
      goto LABEL_39;
    }
  }
  objc_msgSend(v8, "ackData");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26
    || (v27 = (void *)v26,
        objc_msgSend(v8, "ackData"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "rxWaitForMoreData"),
        v28,
        v27,
        !v29))
  {
    switch(v9)
    {
      case 1:
        -[WPDPipeManager receivedVersionInfo:data:dataSize:](self, "receivedVersionInfo:data:dataSize:", v8, a4 + 1, a5 - 1);
        goto LABEL_39;
      case 2:
        v24 = a4 + 1;
        v25 = a5 - 1;
        v22 = self;
        v23 = v8;
        goto LABEL_13;
      case 3:
        v33 = a4 + 1;
        v34 = a5 - 1;
        v31 = self;
        v32 = v8;
        goto LABEL_31;
      case 4:
        -[WPDPipeManager receivedError:data:dataSize:](self, "receivedError:data:dataSize:", v8, a4 + 1, a5 - 1);
        goto LABEL_39;
      case 5:
        -[WPDPipeManager receivedConnectStatus:data:dataSize:](self, "receivedConnectStatus:data:dataSize:", v8, a4 + 1, a5 - 1);
        goto LABEL_39;
      default:
        if (!objc_msgSend(v8, "versionInfoSent")
          || !objc_msgSend(v8, "versionInfoReceived"))
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_458_0);
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPDPipeManager handleIncomingPipeData:data:dataSize:].cold.1();

          goto LABEL_39;
        }
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_456_0);
        v35 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v37 = 67109120;
          *(_DWORD *)&v37[4] = v9;
          v19 = "WPPM: handleIncomingPipeData: continuation of pervious packet first byte 0x%x";
          v20 = v35;
          v21 = 8;
          goto LABEL_11;
        }
        break;
    }
    goto LABEL_12;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_454_0);
  v30 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_2175D1000, v30, OS_LOG_TYPE_DEFAULT, "WPPM: handleIncomingPipeData: continuation of previous packet", v37, 2u);
  }
  v31 = self;
  v32 = v8;
  v33 = a4;
  v34 = a5;
LABEL_31:
  -[WPDPipeManager receivedAck:data:dataSize:](v31, "receivedAck:data:dataSize:", v32, v33, v34);
LABEL_39:

}

- (void)receivedVersionInfo:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  id v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  _BYTE v33[10];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_459);
  v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v33 = a5;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: receivedVersionInfo of len %ld", buf, 0xCu);
  }
  if (a5 <= 5)
  {
    -[WPDPipeManager sendErrorResponse:errorCode:](self, "sendErrorResponse:errorCode:", v8, 3);
    goto LABEL_30;
  }
  objc_msgSend(v8, "setVersion:", a4[1]);
  v10 = a4[2];
  objc_msgSend(v8, "setSupportedFeatures:", (a4[4] << 16) | (a4[3] << 8) | (a4[5] << 24) | v10);
  objc_msgSend(v8, "setVersionInfoReceived:", 1);
  objc_msgSend(v8, "setUseConnectStatusPDU:", v10 & 1);
  objc_msgSend(v8, "pipe");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "peer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDPipeManager endpointsDict](self, "endpointsDict");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDManager server](self, "server");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getClientForUUID:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "versionInfoReceived")
    && objc_msgSend(v8, "versionInfoSent")
    && (objc_msgSend(v8, "pipeDidConnectSent") & 1) == 0)
  {
    if (!v19)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_463_0);
      v24 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        v28 = v24;
        objc_msgSend(v8, "pipe");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v33 = v17;
        *(_WORD *)&v33[8] = 2112;
        v34 = v31;
        v35 = 2112;
        v36 = v30;
        _os_log_error_impl(&dword_2175D1000, v28, OS_LOG_TYPE_ERROR, "WPPM: receivedVersionInfo: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

      }
      goto LABEL_25;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_461_0);
    v20 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_msgSend(v8, "useConnectStatusPDU");
      v23 = objc_msgSend(v8, "connectionInitiator");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v33 = v22;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v23;
      _os_log_impl(&dword_2175D1000, v21, OS_LOG_TYPE_DEFAULT, "WPPM: receivedVersionInfo: version info exchanged - use conn PDU: %d, initiator: %d", buf, 0xEu);

    }
    if (objc_msgSend(v8, "useConnectStatusPDU"))
    {
      if (!objc_msgSend(v8, "connectionInitiator"))
        goto LABEL_19;
      -[WPDPipeManager sendConnectStatus:connectStatus:](self, "sendConnectStatus:connectStatus:", v8, 1);
    }
    objc_msgSend(v8, "setPipeDidConnectSent:", 1);
    objc_msgSend(v19, "connectedDeviceOverLEPipe:", v31);
LABEL_19:
    if ((unint64_t)a5 >= 7)
      -[WPDPipeManager handleIncomingPipeData:data:dataSize:](self, "handleIncomingPipeData:data:dataSize:", v8, a4 + 6, a5 - 6);
  }
LABEL_25:
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_465);
  v25 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = objc_msgSend(v8, "version");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v33 = v27;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = 1;
    _os_log_impl(&dword_2175D1000, v26, OS_LOG_TYPE_DEFAULT, "WPPM: receivedVersionInfo: remote version %d, local version %d", buf, 0xEu);

  }
LABEL_30:

}

- (void)receivedPayload:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  int v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  id v55;
  int v56;
  int v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  int v65;
  void *v66;
  void *v67;
  unint64_t v68;
  unsigned int v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  NSObject *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  NSObject *v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  WPDPipeManager *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  NSObject *v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  NSObject *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD block[4];
  id v110;
  id v111;
  id v112;
  id v113;
  WPDPipeManager *v114;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  id v119;
  uint8_t buf[4];
  _BYTE v121[18];
  __int16 v122;
  _QWORD v123[5];

  v123[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_466_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    -[WPDPipeManager receivedPayload:data:dataSize:].cold.4();
    if (a5)
      goto LABEL_5;
  }
  else if (a5)
  {
LABEL_5:
    objc_msgSend(v8, "pipe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pipe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientUUID");
    v15 = objc_claimAutoreleasedReturnValue();

    -[WPDManager server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)v15;
    objc_msgSend(v16, "getClientForUUID:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "pipeDataTransfer");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "newProtocol") && (objc_msgSend(v8, "pipeDidConnectSent") & 1) == 0)
    {
      if (v18)
        objc_msgSend(v18, "resetRxTransfer");
      -[WPDPipeManager sendErrorResponse:errorCode:](self, "sendErrorResponse:errorCode:", v8, 6);
      goto LABEL_84;
    }
    if (!v18)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_468);
      v19 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v19, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: initialize pipe transfer object", buf, 2u);
      }
      v18 = -[PipeDataTransfer initPipeDataTransferForPeer:]([PipeDataTransfer alloc], "initPipeDataTransferForPeer:", v108);
      objc_msgSend(v8, "setPipeDataTransfer:", v18);
    }
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "rxFirstPacket") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRxData:", v20);

      objc_msgSend(v18, "rxData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");
      v23 = objc_msgSend(v18, "rxCurrentDataSize");

      v24 = v106;
      if (v22 > v23)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_484_0);
        v25 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager receivedPayload:data:dataSize:].cold.1(v25, v18);
        objc_msgSend(v18, "setRxWaitForMoreData:", 0);
        objc_msgSend(v18, "rxData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v18, "rxCurrentDataSize");
        objc_msgSend(v18, "rxData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "subdataWithRange:", v27, objc_msgSend(v28, "length") - objc_msgSend(v18, "rxCurrentDataSize"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v106;
        objc_msgSend(v106, "setData:", v29);

        objc_msgSend(v18, "rxData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "subdataWithRange:", 0, objc_msgSend(v18, "rxCurrentDataSize"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_486);
        v32 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          v34 = objc_msgSend(v31, "length");
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v121 = v34;
          *(_WORD *)&v121[8] = 2112;
          *(_QWORD *)&v121[10] = v31;
          _os_log_impl(&dword_2175D1000, v33, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: of len (%lu) %@", buf, 0x16u);

        }
        objc_msgSend(v18, "setRxData:", v31);

      }
      objc_msgSend(v18, "rxData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5 <= 2)
      {
        -[WPDPipeManager sendErrorResponse:errorCode:](self, "sendErrorResponse:errorCode:", v8, 3);
        v35 = 0;
        v24 = v106;
LABEL_83:

LABEL_84:
        goto LABEL_85;
      }
      v105 = v17;
      v56 = *a4;
      v57 = a4[1];
      v58 = a4[2];
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_470_0);
      v59 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v121 = v56 | (v57 << 8);
        *(_WORD *)&v121[4] = 1024;
        *(_DWORD *)&v121[6] = v58;
        _os_log_debug_impl(&dword_2175D1000, v59, OS_LOG_TYPE_DEBUG, "WPPM: receivedPayload: FIRST PACKET len %d, seqNum %d", buf, 0xEu);
      }
      objc_msgSend(v18, "setRxSeqNum:", v58);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4 + 3, a5 - 3);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRxData:", v60);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_472_0);
      v17 = v105;
      v61 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDPipeManager receivedPayload:data:dataSize:].cold.3(v61, v18);
      if ((unint64_t)a5 < 5)
      {
        v35 = 0;
        v24 = v106;
      }
      else
      {
        objc_msgSend(v18, "setRxTotalLenToReceive:", *(unsigned __int16 *)(a4 + 3));
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4 + 5, a5 - 5);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRxTotalDataToReceive:", v62);

        objc_msgSend(v18, "setRxCurrentDataSize:", objc_msgSend(v18, "rxTotalLenToReceive"));
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_474);
        v63 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v64 = v63;
          v65 = objc_msgSend(v18, "rxTotalLenToReceive");
          objc_msgSend(v18, "rxTotalDataToReceive");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v121 = v65;
          *(_WORD *)&v121[4] = 2112;
          *(_QWORD *)&v121[6] = v66;
          _os_log_impl(&dword_2175D1000, v64, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: FIRST PACKET rxTLen %d, rxTData: %@", buf, 0x12u);

        }
        objc_msgSend(v18, "rxTotalDataToReceive");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "rxTotalDataToReceive");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "length");
        v69 = objc_msgSend(v18, "rxCurrentDataSize");

        if (v68 > v69)
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_476);
          v70 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPDPipeManager receivedPayload:data:dataSize:].cold.2(v70, v18);
          objc_msgSend(v18, "rxTotalDataToReceive");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v18, "rxTotalLenToReceive");
          objc_msgSend(v18, "rxTotalDataToReceive");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "subdataWithRange:", v72, objc_msgSend(v73, "length") - objc_msgSend(v18, "rxTotalLenToReceive"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v106;
          objc_msgSend(v106, "setData:", v74);

          v17 = v105;
          if (v105)
          {
            objc_msgSend(v18, "rxData");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "subdataWithRange:", 0, objc_msgSend(v18, "rxTotalLenToReceive") + 2);
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_478_0);
            v77 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
            {
              v78 = v77;
              v79 = objc_msgSend(v76, "length");
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)v121 = v79;
              *(_WORD *)&v121[8] = 2112;
              *(_QWORD *)&v121[10] = v76;
              _os_log_impl(&dword_2175D1000, v78, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: notify didReceive of len (%lu) %@", buf, 0x16u);

            }
            -[WPDPipeManager queue](self, "queue");
            v80 = objc_claimAutoreleasedReturnValue();
            v115[0] = MEMORY[0x24BDAC760];
            v115[1] = 3221225472;
            v115[2] = __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_479;
            v115[3] = &unk_24D7C7EE8;
            v116 = v105;
            v117 = v76;
            v81 = v8;
            v118 = v81;
            v119 = v108;
            v82 = v76;
            dispatch_async(v80, v115);

            -[WPDPipeManager sendAck:errorCode:](self, "sendAck:errorCode:", v81, 0);
            v24 = v106;
          }
          else
          {
            if (WPLogInitOnce != -1)
              dispatch_once(&WPLogInitOnce, &__block_literal_global_480_0);
            v93 = (void *)WiProxLog;
            if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            {
              v102 = v93;
              objc_msgSend(v8, "pipe");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "name");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v121 = v107;
              *(_WORD *)&v121[8] = 2112;
              *(_QWORD *)&v121[10] = v108;
              v122 = 2112;
              v123[0] = v104;
              _os_log_error_impl(&dword_2175D1000, v102, OS_LOG_TYPE_ERROR, "WPPM: receivedPayload: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

              v24 = v106;
            }
          }
          objc_msgSend(v18, "resetRxTransfer");
          if (!objc_msgSend(v24, "length"))
            goto LABEL_83;
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_482);
          v94 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          {
            v95 = v94;
            v96 = objc_msgSend(v24, "length");
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)v121 = v96;
            *(_WORD *)&v121[8] = 2112;
            *(_QWORD *)&v121[10] = v24;
            _os_log_impl(&dword_2175D1000, v95, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: decode next packet of len (%lu) %@", buf, 0x16u);

          }
          v97 = objc_retainAutorelease(v24);
          v98 = objc_msgSend(v97, "bytes");
          v89 = objc_msgSend(v97, "length");
          v90 = self;
          v91 = v8;
          v92 = v98;
LABEL_82:
          -[WPDPipeManager handleIncomingPipeData:data:dataSize:](v90, "handleIncomingPipeData:data:dataSize:", v91, v92, v89);
          goto LABEL_83;
        }
        objc_msgSend(v18, "setRxFirstPacket:", 1);
        v17 = v105;
        v24 = v106;
      }
    }
    objc_msgSend(v18, "rxTotalDataWithLen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rxData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "appendData:", v37);

    objc_msgSend(v18, "rxCurrentReceivedData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendData:", v35);

    objc_msgSend(v18, "setRxCurrentDataSize:", (unsigned __int16)(objc_msgSend(v18, "rxCurrentDataSize") - objc_msgSend(v35, "length")));
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_488_0);
    v39 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v17;
      v41 = v39;
      objc_msgSend(v18, "rxCurrentReceivedData");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "length");
      v44 = objc_msgSend(v18, "rxCurrentDataSize");
      objc_msgSend(v18, "rxTotalDataWithLen");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)v121 = v43;
      *(_WORD *)&v121[8] = 2112;
      *(_QWORD *)&v121[10] = v108;
      v122 = 1024;
      LODWORD(v123[0]) = v44;
      WORD2(v123[0]) = 2048;
      *(_QWORD *)((char *)v123 + 6) = v46;
      _os_log_impl(&dword_2175D1000, v41, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: length of data received %ld from peer %@, length of data remaining to receive: %d, rxTotalData %ld", buf, 0x26u);

      v17 = v40;
      v24 = v106;
    }
    -[WPDPipeManager _signpostBegin](self, "_signpostBegin");
    if (objc_msgSend(v18, "rxCurrentDataSize")
      || (objc_msgSend(v18, "rxCurrentReceivedData"),
          v48 = (void *)objc_claimAutoreleasedReturnValue(),
          v49 = objc_msgSend(v48, "length"),
          v48,
          !v49))
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_495);
      v47 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v47, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: transfer wait", buf, 2u);
      }
      objc_msgSend(v18, "setRxWaitForMoreData:", 1);
    }
    else
    {
      if (v17)
      {
        v50 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v18, "rxTotalDataWithLen");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "dataWithData:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[WPDPipeManager queue](self, "queue");
        v53 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_489;
        block[3] = &unk_24D7C8588;
        v110 = v17;
        v111 = v52;
        v54 = v8;
        v112 = v54;
        v113 = v108;
        v114 = self;
        v55 = v52;
        dispatch_async(v53, block);

        -[WPDPipeManager sendAck:errorCode:](self, "sendAck:errorCode:", v54, 0);
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_493);
        v83 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        {
          v99 = v83;
          objc_msgSend(v8, "pipe");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "name");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v121 = v107;
          *(_WORD *)&v121[8] = 2112;
          *(_QWORD *)&v121[10] = v108;
          v122 = 2112;
          v123[0] = v101;
          _os_log_error_impl(&dword_2175D1000, v99, OS_LOG_TYPE_ERROR, "WPPM: receivedPayload: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

        }
      }
      objc_msgSend(v18, "resetRxTransfer");
    }
    if (!objc_msgSend(v24, "length"))
      goto LABEL_83;
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_497);
    v84 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v85 = v84;
      v86 = objc_msgSend(v24, "length");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v121 = v86;
      *(_WORD *)&v121[8] = 2112;
      *(_QWORD *)&v121[10] = v24;
      _os_log_impl(&dword_2175D1000, v85, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload: decode next packet of len (%lu) %@", buf, 0x16u);

    }
    v87 = objc_retainAutorelease(v24);
    v88 = objc_msgSend(v87, "bytes");
    v89 = objc_msgSend(v87, "length");
    v90 = self;
    v91 = v8;
    v92 = v88;
    goto LABEL_82;
  }
  -[WPDPipeManager sendErrorResponse:errorCode:](self, "sendErrorResponse:errorCode:", v8, 3);
LABEL_85:

}

void __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_479(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedData:fromEndpoint:forPeripheral:", v3, v5, *(_QWORD *)(a1 + 56));

}

uint64_t __48__WPDPipeManager_receivedPayload_data_dataSize___block_invoke_489(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receivedData:fromEndpoint:forPeripheral:", v4, v6, *(_QWORD *)(a1 + 56));

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_491);
  v7 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    v10 = objc_msgSend(v8, "length");
    v11 = *(_QWORD *)(a1 + 56);
    v13 = 134218242;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: receivedPayload queue block processed: length of data received %lu from peer %@", (uint8_t *)&v13, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 64), "_signpostEnd");
}

- (void)receivedAck:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  WPDPipeManager *v64;
  void *v65;
  void *v66;
  _QWORD block[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint8_t buf[4];
  _BYTE v81[10];
  void *v82;
  _BYTE v83[10];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_498);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDPipeManager receivedAck:data:dataSize:].cold.5();
  objc_msgSend(v8, "pipeDataTransfer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v66 = (void *)v9;
    objc_msgSend(v8, "pipe");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "peer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pipe");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientUUID");
    v18 = objc_claimAutoreleasedReturnValue();

    v64 = self;
    -[WPDManager server](self, "server");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)v18;
    objc_msgSend(v19, "getClientForUUID:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    if (!v20)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_502_0);
      v26 = v13;
      v41 = v65;
      v42 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      {
        v43 = v42;
        objc_msgSend(v8, "pipe");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v81 = v65;
        *(_WORD *)&v81[8] = 2112;
        v82 = v26;
        *(_WORD *)v83 = 2112;
        *(_QWORD *)&v83[2] = v45;
        _os_log_error_impl(&dword_2175D1000, v43, OS_LOG_TYPE_ERROR, "WPPM: receivedAck: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

      }
      goto LABEL_59;
    }
    if (a5 < 5)
    {
      objc_msgSend(v8, "ackData");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v13;
      if (!v29)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_515_0);
        v46 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2175D1000, v46, OS_LOG_TYPE_DEFAULT, "WPPM: init ackData object", buf, 2u);
        }
        v29 = -[PipeDataTransfer initPipeDataTransferForPeer:]([PipeDataTransfer alloc], "initPipeDataTransferForPeer:", v13);
        objc_msgSend(v8, "setAckData:", v29);
      }
      objc_msgSend(v29, "rxCurrentReceivedData");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "appendBytes:length:", a4, a5);

      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_517_0);
      v48 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v49 = v48;
        objc_msgSend(v29, "rxCurrentReceivedData");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v81 = v50;
        _os_log_impl(&dword_2175D1000, v49, OS_LOG_TYPE_DEFAULT, "WPPM: Currenlty received ack data: %@", buf, 0xCu);

      }
      objc_msgSend(v29, "rxCurrentReceivedData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "length");

      if (v52 < 5)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_519_0);
        v41 = v65;
        v57 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2175D1000, v57, OS_LOG_TYPE_DEFAULT, "WPPM: Still have not received full ack packet.", buf, 2u);
        }
        objc_msgSend(v29, "setRxWaitForMoreData:", 1);
      }
      else
      {
        objc_msgSend(v29, "rxCurrentReceivedData");
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v54 = objc_msgSend(v53, "bytes");
        objc_msgSend(v29, "rxCurrentReceivedData");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDPipeManager receivedAck:data:dataSize:](v64, "receivedAck:data:dataSize:", v8, v54, objc_msgSend(v55, "length"));

        v41 = v65;
      }
    }
    else
    {
      v22 = *a4;
      v23 = a4[1];
      v24 = *((unsigned __int16 *)a4 + 1);
      v63 = a4[4];
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_504_0);
      v25 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v81 = v22;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v23;
        LOWORD(v82) = 1024;
        *(_DWORD *)((char *)&v82 + 2) = v24;
        HIWORD(v82) = 1024;
        *(_DWORD *)v83 = v63;
        _os_log_debug_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEBUG, "WPPM: receivedAck: of len %d, seqNum %d, pLen %d, status %d", buf, 0x1Au);
      }
      if (v23 != objc_msgSend(v66, "txSeqNum"))
      {
        v26 = v13;
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_506_0);
        v41 = v65;
        v56 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager receivedAck:data:dataSize:].cold.4(v56);
        goto LABEL_59;
      }
      v26 = v13;
      if (v24 != objc_msgSend(v66, "txTotalLenToSend"))
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_508_0);
        v41 = v65;
        v58 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager receivedAck:data:dataSize:].cold.3(v58);
        goto LABEL_59;
      }
      v27 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v66, "txData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dataWithData:", v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      if ((_DWORD)v63)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v78 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to send data over LE Pipe %d"), v63);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 26, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_512_0);
        v34 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager receivedAck:data:dataSize:].cold.2(v34);
        -[WPDPipeManager queue](v64, "queue");
        v35 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_513;
        block[3] = &unk_24D7C8588;
        v68 = v20;
        v69 = v29;
        v36 = v8;
        v70 = v36;
        v37 = v13;
        v71 = v37;
        v72 = v33;
        v38 = v33;
        dispatch_async(v35, block);

        objc_msgSend(v36, "pipe");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDPipeManager invalidatePipeInfo:forPeer:](v64, "invalidatePipeInfo:forPeer:", v40, v37);

      }
      else
      {
        -[WPDPipeManager queue](v64, "queue");
        v59 = objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_509;
        v73[3] = &unk_24D7C7EE8;
        v74 = v20;
        v75 = v29;
        v60 = v8;
        v76 = v60;
        v77 = v13;
        dispatch_async(v59, v73);

        if ((unint64_t)a5 >= 6)
          -[WPDPipeManager handleIncomingPipeData:data:dataSize:](v64, "handleIncomingPipeData:data:dataSize:", v60, a4 + 5, a5 - 5);

        v38 = v74;
      }

      objc_msgSend(v66, "resetTxTransfer");
      objc_msgSend(v8, "ackData");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = v65;
      if (v61)
      {
        objc_msgSend(v8, "ackData");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "resetRxTransfer");

      }
    }

LABEL_59:
    v10 = v66;
    goto LABEL_60;
  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_500_0);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
    -[WPDPipeManager receivedAck:data:dataSize:].cold.1();
LABEL_60:

}

void __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_509(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v5, *(_QWORD *)(a1 + 56), 0);

}

void __44__WPDPipeManager_receivedAck_data_dataSize___block_invoke_513(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)receivedError:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a5 >= 2)
  {
    v9 = a4[1];
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_520);
    v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDPipeManager receivedError:data:dataSize:].cold.3(v9, a5, v10);
    if (v9 == 6)
    {
      objc_msgSend(v8, "pipeDataTransfer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "pipe");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "peer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[WPDPipeManager endpointsDict](self, "endpointsDict");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pipe");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clientUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[WPDManager server](self, "server");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "getClientForUUID:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)MEMORY[0x24BDD1540];
          v43 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to send data over LE Pipe %d, remote device is not active"), 6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_528);
          v26 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
            -[WPDPipeManager receivedError:data:dataSize:].cold.2(v26);
          v27 = (void *)MEMORY[0x24BDBCE50];
          objc_msgSend(v8, "pipeDataTransfer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "txData");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "dataWithData:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          -[WPDPipeManager queue](self, "queue");
          v31 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __46__WPDPipeManager_receivedError_data_dataSize___block_invoke_529;
          block[3] = &unk_24D7C7EE8;
          v39 = v21;
          v40 = v30;
          v41 = v8;
          v42 = v25;
          v32 = v25;
          v33 = v30;
          dispatch_async(v31, block);

        }
        else
        {
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_524);
          v34 = (void *)WiProxLog;
          if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          {
            v35 = v34;
            objc_msgSend(v8, "pipe");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v46 = v19;
            v47 = 2112;
            v48 = v14;
            v49 = 2112;
            v50 = v37;
            _os_log_error_impl(&dword_2175D1000, v35, OS_LOG_TYPE_ERROR, "WPPM: receivedError: Client %@ not found for peer %@ and Endpoint %@", buf, 0x20u);

          }
        }

      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_522);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager receivedError:data:dataSize:].cold.1();
      }

    }
  }

}

void __46__WPDPipeManager_receivedError_data_dataSize___block_invoke_529(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "peer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v5, v8, *(_QWORD *)(a1 + 56));

}

- (void)receivedConnectStatus:(id)a3 data:(char *)a4 dataSize:(int64_t)a5
{
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a5 >= 2)
  {
    v9 = a4[1];
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_530);
    v10 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v38 = v9;
      v39 = 2048;
      v40 = a5;
      _os_log_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEFAULT, "WPPM: receivedConnectStatus: status: %d, dataSize: %ld", buf, 0x12u);
    }
    if (v9)
    {
      if (v9 == 1)
      {
        objc_msgSend(v8, "pipe");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "peer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[WPDPipeManager endpointsDict](self, "endpointsDict");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pipe");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "clientUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[WPDManager server](self, "server");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "getClientForUUID:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v8, "setUseConnectStatusPDU:", 1);
          objc_msgSend(v8, "setPipeDidConnectSent:", 1);
          objc_msgSend(v19, "connectedDeviceOverLEPipe:", v34);
        }

      }
      if ((unint64_t)a5 >= 3)
        -[WPDPipeManager handleIncomingPipeData:data:dataSize:](self, "handleIncomingPipeData:data:dataSize:", v8, a4 + 2, a5 - 2);
    }
    else
    {
      objc_msgSend(v8, "pipe");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "peer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPDPipeManager endpointsDict](self, "endpointsDict");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pipe");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "clientUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[WPDManager server](self, "server");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "getClientForUUID:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v35 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Remote peer %@ disconnected the link"), v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("WPErrorDomain"), 7, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "disconnectedDeviceOverLEPipe:withError:", v22, v33);
      }

    }
  }

}

- (void)sendAck:(id)a3 errorCode:(unsigned __int8)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  char v19;
  __int16 v20;
  unsigned __int8 v21;

  v6 = a3;
  objc_msgSend(v6, "pipeDataTransfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "pipe");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 1027;
    objc_msgSend(v6, "pipeDataTransfer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v10, "rxSeqNum");

    objc_msgSend(v6, "pipeDataTransfer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rxTotalLenToReceive");

    v20 = v12;
    v21 = a4;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v18, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v13, v6);

    if (v14 == 6)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_537);
      v15 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        -[WPDPipeManager sendAck:errorCode:].cold.2(v15, v16, v17);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_535);
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDPipeManager sendAck:errorCode:].cold.3();
    }

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_533);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDPipeManager sendAck:errorCode:].cold.1();
  }

}

- (BOOL)sendVersionInfo:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  __int16 v9;
  char v10;
  int v11;
  uint8_t buf[4];
  int64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 1281;
  v10 = 1;
  v11 = 1;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v9, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v5, v4);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_538_0);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPPM: sendVersionInfo: bytes written %ld (expected 7) data %@", buf, 0x16u);
  }
  if (v6 == 7)
    objc_msgSend(v4, "setVersionInfoSent:", 1);

  return v6 == 7;
}

- (void)sendErrorResponse:(id)a3 errorCode:(unsigned __int8)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  __int16 v15;
  unsigned __int8 v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "pipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "output");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 260;
  v16 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v9, v6);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_539);
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v8, "streamStatus");
    objc_msgSend(v8, "streamError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v18 = v10;
    v19 = 2048;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "WPPM: sendErrorResponse: bytes written %ld (expected 3) with status %ld error %@", buf, 0x20u);

  }
}

- (void)sendConnectStatus:(id)a3 connectStatus:(unsigned __int8)a4
{
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  __int16 v10;
  unsigned __int8 v11;
  uint8_t buf[4];
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v10 = 261;
  v11 = a4;
  v5 = (void *)MEMORY[0x24BDBCE50];
  v6 = a3;
  objc_msgSend(v5, "dataWithBytes:length:", &v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v7, v6);

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_540_0);
  v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v8;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: sendConnectStatus: bytes written %ld (expected 3)", buf, 0xCu);
  }
}

- (void)sendRemainingData:(id)a3 wpClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "pipeDataTransfer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "txDataLeftToSend"))
    {
      objc_msgSend(v9, "txData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      v12 = objc_msgSend(v9, "txDataLeftToSend");
      v13 = v11 - v12;
      objc_msgSend(v9, "txData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subdataWithRange:", v11 - v12, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v15;
      v16 = -[WPDPipeManager writeDataToPipe:pipe:](self, "writeDataToPipe:pipe:", v15, v6);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_545_0);
      v17 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        *(_DWORD *)buf = 134218752;
        v41 = v13;
        v42 = 2048;
        v43 = v11;
        v44 = 2048;
        v45 = objc_msgSend(v15, "length");
        v46 = 2048;
        v47 = v16;
        _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: sendRemainingData: starting at %lu total len %lu len %lu, bytes written %ld", buf, 0x2Au);

      }
      if (v16 < 1)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_549);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager sendRemainingData:wpClient:].cold.1();
        v24 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v9, "txData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dataWithData:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[WPDPipeManager queue](self, "queue");
        v27 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __45__WPDPipeManager_sendRemainingData_wpClient___block_invoke_550;
        block[3] = &unk_24D7C7198;
        v37 = v7;
        v38 = v26;
        v28 = v6;
        v39 = v28;
        v29 = v26;
        dispatch_async(v27, block);

        objc_msgSend(v28, "pipe");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "pipe");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "peer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v31, v34);

      }
      else
      {
        objc_msgSend(v9, "setTxDataLeftToSend:", objc_msgSend(v9, "txDataLeftToSend") - v16);
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_547_0);
        v19 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = objc_msgSend(v9, "txDataLeftToSend");
          *(_DWORD *)buf = 134217984;
          v41 = v21;
          _os_log_impl(&dword_2175D1000, v20, OS_LOG_TYPE_DEFAULT, "WPPM: sendRemainingData: txLeftToSend %lu", buf, 0xCu);

        }
      }

      goto LABEL_27;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_543_0);
    v22 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "WPPM: sendRemainingData:  All data sent";
      goto LABEL_20;
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_541_0);
    v22 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "WPPM: sendRemainingData: no pipe data found";
LABEL_20:
      _os_log_impl(&dword_2175D1000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }
  }
LABEL_27:

}

void __45__WPDPipeManager_sendRemainingData_wpClient___block_invoke_550(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "peer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "pipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "output");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "streamError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentData:toEndpoint:forPeripheral:withError:", v3, v5, v8, v11);

}

- (int64_t)writeDataToPipe:(id)a3 pipe:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  __int128 v11;
  uint64_t v12;
  NSObject *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  size_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  id v42;
  id v43;
  uint8_t buf[4];
  _BYTE v45[18];
  __int16 v46;
  uint64_t v47;
  size_t __n[10];

  __n[8] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "pipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "length");
  v9 = 0;
  v43 = v5;
  if (!v5)
    goto LABEL_38;
  v10 = v8;
  if (!v8)
    goto LABEL_38;
  if (objc_msgSend(v7, "channel"))
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_551);
    v42 = v6;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      -[WPDPipeManager writeDataToPipe:pipe:].cold.3();
    objc_msgSend(v7, "channel");
    os_channel_ring_id();
    objc_msgSend(v7, "channel");
    os_channel_tx_ring();
    v9 = 0;
    *(_QWORD *)&v11 = 67109376;
    v41 = v11;
    v12 = v10;
    while (1)
    {
      memset(__n, 0, 64);
      if (!os_channel_get_next_slot())
        break;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_553_0);
      v13 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v41;
        *(_DWORD *)v45 = WORD1(__n[0]);
        *(_WORD *)&v45[4] = 2048;
        *(_QWORD *)&v45[6] = v12;
        _os_log_debug_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEBUG, "WPPM: writeDataToPipe: slot len: %d, remaining %ld", buf, 0x12u);
      }
      v14 = WORD1(__n[0]);
      if (v12 < WORD1(__n[0]))
        v14 = v12;
      WORD1(__n[0]) = v14;
      v15 = (void *)__n[2];
      v16 = objc_msgSend(objc_retainAutorelease(v43), "bytes");
      memcpy(v15, (const void *)(v16 + v9), WORD1(__n[0]));
      os_channel_set_slot_properties();
      v17 = WORD1(__n[0]);
      v9 += WORD1(__n[0]);
      if (WORD1(__n[0]))
        v12 = v10 - v9;
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_555_0);
      v18 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v45 = v17;
        *(_WORD *)&v45[8] = 2048;
        *(_QWORD *)&v45[10] = v9;
        v46 = 2048;
        v47 = v12;
        _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: send data over skywalk written %ld total %ld remaining %ld", buf, 0x20u);
      }
      os_channel_advance_slot();
      if (v10 <= v9)
        goto LABEL_30;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_557_0);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDPipeManager writeDataToPipe:pipe:].cold.2();
LABEL_30:
    objc_msgSend(v7, "channel", v41);
    os_channel_sync();
    goto LABEL_31;
  }
  objc_msgSend(v7, "output");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "streamStatus") == 6)
  {

LABEL_33:
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_565);
    v22 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDPipeManager writeDataToPipe:pipe:].cold.1(v22);
    v9 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v7, "output");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "streamStatus");

  if (v21 == 7)
    goto LABEL_33;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_559_0);
  v24 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    objc_msgSend(v7, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(__n[0]) = 138412290;
    *(size_t *)((char *)__n + 4) = (size_t)v26;
    _os_log_impl(&dword_2175D1000, v25, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: %@ send data over stream", (uint8_t *)__n, 0xCu);

  }
  objc_msgSend(v7, "output");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v27, "write:maxLength:", objc_msgSend(objc_retainAutorelease(v5), "bytes"), v10);

  if (v9 == v10)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_563_0);
    v28 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      objc_msgSend(v7, "peer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(__n[0]) = 134218498;
      *(size_t *)((char *)__n + 4) = v10;
      WORD2(__n[1]) = 2048;
      *(size_t *)((char *)&__n[1] + 6) = v10;
      HIWORD(__n[2]) = 2112;
      __n[3] = (size_t)v31;
      _os_log_impl(&dword_2175D1000, v29, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: bytes written %ld (expected %lu) to peer %@", (uint8_t *)__n, 0x20u);

    }
    v9 = v10;
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_561);
    v32 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      objc_msgSend(v7, "peer");
      v42 = v6;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "output");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "streamStatus");
      objc_msgSend(v7, "output");
      v38 = v7;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "streamError");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(__n[0]) = 134219010;
      *(size_t *)((char *)__n + 4) = v9;
      WORD2(__n[1]) = 2048;
      *(size_t *)((char *)&__n[1] + 6) = v10;
      HIWORD(__n[2]) = 2112;
      __n[3] = (size_t)v35;
      LOWORD(__n[4]) = 2048;
      *(size_t *)((char *)&__n[4] + 2) = v37;
      WORD1(__n[5]) = 2112;
      *(size_t *)((char *)&__n[5] + 4) = (size_t)v40;
      _os_log_impl(&dword_2175D1000, v33, OS_LOG_TYPE_DEFAULT, "WPPM: writeDataToPipe: bytes written %ld (expected %lu) to peer %@ status %lu with error %@", (uint8_t *)__n, 0x34u);

      v7 = v38;
LABEL_31:
      v6 = v42;
    }
  }
LABEL_38:

  return v9;
}

- (id)pipeManagerState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA)
    return CFSTR("unknown");
  else
    return off_24D7C8DF8[a3];
}

- (void)update
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_580_0);
  v3 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 134217984;
    v24 = -[WPDManager state](self, "state");
    _os_log_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEFAULT, "WPPM: PipeManager state: %ld", buf, 0xCu);

  }
  if (-[WPDManager state](self, "state") <= 2)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v17[0] = v10;
          v17[1] = 3221225472;
          v17[2] = __24__WPDPipeManager_update__block_invoke_581;
          v17[3] = &unk_24D7C8A70;
          v17[4] = self;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (-[WPDManager state](self, "state") <= 1)
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_582_0);
      v15 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v15, OS_LOG_TYPE_DEFAULT, "WPPM: scalablePipeManagerDidUpdateState: remove all endpointsDict because bluetooth is not ON.", buf, 2u);
      }
      -[WPDPipeManager endpointsDict](self, "endpointsDict");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeAllObjects");

    }
  }
}

void __24__WPDPipeManager_update__block_invoke_581(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "pipeManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "scalablePipeManager:pipeDidDisconnect:error:", v5, v4, 0);
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_583);
  v11 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2175D1000, v11, OS_LOG_TYPE_DEFAULT, "WPPM: didRegisterEndpoint %@ (error %@)", (uint8_t *)&v13, 0x16u);
  }
  if (v10)
  {
    -[WPDPipeManager endpointsDict](self, "endpointsDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v9);

  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_584_0);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2175D1000, v7, OS_LOG_TYPE_DEFAULT, "WPPM: didUnregisterEndpoint %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  PipeInfo *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  int fd;
  NSObject *v34;
  dispatch_source_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD handler[5];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  _BYTE v72[10];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v60 = v6;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_585_0);
  v8 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "peer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v68 = v10;
    v69 = 2112;
    v70 = (uint64_t)v12;
    v71 = 2112;
    *(_QWORD *)v72 = v13;
    *(_WORD *)&v72[8] = 2112;
    v73 = v14;
    _os_log_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEFAULT, "WPPM: pipeDidConnect: %@ %@ peer dict %@, initiators: %@", buf, 0x2Au);

  }
  objc_msgSend(v7, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("nearby"));

  v17 = v16 ^ 1u;
  objc_msgSend(v7, "peer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_586;
    v63[3] = &unk_24D7C8B38;
    v64 = v7;
    v65 = v19;
    v22 = v21;
    v66 = v22;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v63);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = objc_alloc_init(PipeInfo);
  -[PipeInfo setPipe:](v23, "setPipe:", v7);
  -[PipeInfo setNewProtocol:](v23, "setNewProtocol:", v17);
  -[PipeInfo setLocalVersion:](v23, "setLocalVersion:", 1);
  -[PipeInfo setLocalSupportedFeatures:](v23, "setLocalSupportedFeatures:", 1);
  -[WPDPipeManager endpointsDict](self, "endpointsDict");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "clientUUID");
  v27 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v27;
  if (v27)
  {
    -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_590);
    v31 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v68 = v30;
      v69 = 2112;
      v70 = v27;
      _os_log_impl(&dword_2175D1000, v31, OS_LOG_TYPE_DEFAULT, "WPPM: peersSet: %@ for clientUUID: %@", buf, 0x16u);
    }
    if (objc_msgSend(v30, "containsObject:", v19))
    {
      -[PipeInfo setConnectionInitiator:](v23, "setConnectionInitiator:", 1);
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_592_0);
      v32 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2175D1000, v32, OS_LOG_TYPE_DEFAULT, "WPPM: set connection initiator", buf, 2u);
      }
    }

  }
  if (objc_msgSend(v7, "channel"))
  {
    v59 = (void *)v27;
    objc_msgSend(v7, "channel");
    fd = os_channel_get_fd();
    -[WPDPipeManager queue](self, "queue");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_source_create(MEMORY[0x24BDACA00], fd, 0, v34);
    -[PipeInfo setPipeReadSource:](v23, "setPipeReadSource:", v35);

    -[PipeInfo pipeReadSource](v23, "pipeReadSource");
    v36 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_593;
    handler[3] = &unk_24D7C2600;
    handler[4] = self;
    v37 = v7;
    v62 = v37;
    dispatch_source_set_event_handler(v36, handler);

    objc_msgSend(v22, "addObject:", v23);
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v22, v19);

    -[PipeInfo pipeReadSource](v23, "pipeReadSource");
    v39 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v39);

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_595_0);
    v40 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v40;
      -[PipeInfo pipeReadSource](v23, "pipeReadSource");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v37, "channel");
      v44 = objc_msgSend(v37, "reliablePipe");
      *(_DWORD *)buf = 134219008;
      v68 = v42;
      v69 = 2048;
      v70 = v43;
      v71 = 1024;
      *(_DWORD *)v72 = fd;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = fd;
      LOWORD(v73) = 1024;
      *(_DWORD *)((char *)&v73 + 2) = v44;
      _os_log_impl(&dword_2175D1000, v41, OS_LOG_TYPE_DEFAULT, "WPPM: Created pipe read %p for skywalk channel %p fd 0x%x(%d) isreliable? %d", buf, 0x28u);

    }
    -[WPDPipeManager sendChannelData:](self, "sendChannelData:", v23);

    v28 = v59;
  }
  else
  {
    v45 = (void *)voucher_copy();
    -[PipeInfo setVoucher:](v23, "setVoucher:", v45);

    objc_msgSend(v7, "input");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDelegate:", self);

    objc_msgSend(v7, "output");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDelegate:", self);

    objc_msgSend(v7, "input");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *MEMORY[0x24BDBCA90];
    objc_msgSend(v48, "scheduleInRunLoop:forMode:", v49, *MEMORY[0x24BDBCA90]);

    objc_msgSend(v7, "output");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "scheduleInRunLoop:forMode:", v52, v50);

    objc_msgSend(v7, "input");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "open");

    objc_msgSend(v7, "output");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "open");

    -[PipeInfo applyQOSOverride](v23, "applyQOSOverride");
    objc_msgSend(v22, "addObject:", v23);
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v22, v19);

  }
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_597_0);
  v56 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v57 = v56;
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v68 = v58;
    v69 = 2112;
    v70 = (uint64_t)v19;
    _os_log_impl(&dword_2175D1000, v57, OS_LOG_TYPE_DEFAULT, "WPPM: Pipes after pipeDidConnect %@ to peer %@", buf, 0x16u);

  }
}

void __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_586(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(a2, "pipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_587_1);
    v9 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_586_cold_1(a1 + 32, v9);
    *a3 = 1;
  }
}

uint64_t __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_593(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "channelHasData:", *(_QWORD *)(a1 + 40));
}

- (void)sendChannelData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[16];
  __int16 v28;
  uint8_t v29[16];

  v4 = a3;
  -[WPDPipeManager endpointsDict](self, "endpointsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WPDManager server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getClientForUUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "newProtocol"))
  {
    if ((objc_msgSend(v4, "versionInfoSent") & 1) == 0)
    {
      -[WPDPipeManager sendVersionInfo:](self, "sendVersionInfo:", v4);
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "versionInfoReceived") & 1) != 0)
    {
      if (!objc_msgSend(v4, "versionInfoSent")
        || !objc_msgSend(v4, "versionInfoReceived")
        || (objc_msgSend(v4, "pipeDidConnectSent") & 1) != 0
        || (objc_msgSend(v4, "useConnectStatusPDU") & 1) != 0)
      {
        -[WPDPipeManager sendRemainingData:wpClient:](self, "sendRemainingData:wpClient:", v4, v11);
        goto LABEL_31;
      }
      if (v11)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_600_0);
        v13 = WiProxLog;
        if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v28 = 0;
        v14 = (uint8_t *)&v28;
LABEL_19:
        _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: sendChannelData: send pipe connect notification", v14, 2u);
LABEL_20:
        objc_msgSend(v4, "setPipeDidConnectSent:", 1, v26);
        objc_msgSend(v4, "pipe");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "peer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "connectedDeviceOverLEPipe:", v17);

        goto LABEL_31;
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_602);
      v25 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDPipeManager sendChannelData:].cold.1((uint64_t)v9, v25, v4);
      goto LABEL_30;
    }
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_598);
    v18 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2175D1000, v18, OS_LOG_TYPE_DEFAULT, "WPPM: sendChannelData: wait to receive version info", v29, 2u);
    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_604_0);
    v12 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "WPPM: sendChannelData: using old protocol, send didConnect if not sent already", buf, 2u);
    }
    if ((objc_msgSend(v4, "pipeDidConnectSent") & 1) == 0)
    {
      if (v11)
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_606_0);
        v13 = WiProxLog;
        if (!os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        LOWORD(v26) = 0;
        v14 = (uint8_t *)&v26;
        goto LABEL_19;
      }
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_608);
      v19 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDPipeManager sendChannelData:].cold.1((uint64_t)v9, v19, v4);
LABEL_30:
      objc_msgSend(v4, "pipe");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pipe");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "peer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v21, v24);

    }
  }
LABEL_31:

}

- (void)channelHasData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t next_slot;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "peer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__5;
  v49 = 0;
  if (v34)
  {
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __33__WPDPipeManager_channelHasData___block_invoke_610;
    v41[3] = &unk_24D7C8030;
    v7 = v35;
    v42 = v7;
    v43 = &v44;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v41);

    if (v45[5])
    {
      objc_msgSend(v7, "channel");
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      os_channel_ring_id();
      os_channel_rx_ring();
      if (os_channel_get_next_slot())
      {
        *(_QWORD *)&v8 = 138412290;
        v33 = v8;
        do
        {
          ++channelHasData__rxCount;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (_QWORD)v55, WORD1(v54), v33);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (WPLogInitOnce != -1)
            dispatch_once(&WPLogInitOnce, &__block_literal_global_613_0);
          v10 = (id)WiProxLog;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v25 = objc_msgSend(v9, "length");
            objc_msgSend(v7, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v51 = v25;
            v52 = 2112;
            v53 = v26;
            _os_log_debug_impl(&dword_2175D1000, v10, OS_LOG_TYPE_DEBUG, "WPPM: channelHasData Received %lu bytes over skywalk %@", buf, 0x16u);

          }
          if (objc_msgSend((id)v45[5], "newProtocol"))
          {
            v11 = v45[5];
            v12 = objc_retainAutorelease(v9);
            -[WPDPipeManager handleIncomingPipeData:data:dataSize:](self, "handleIncomingPipeData:data:dataSize:", v11, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
          }
          else
          {
            -[WPDPipeManager endpointsDict](self, "endpointsDict");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "clientUUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "peer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 && v18)
            {
              -[WPDManager server](self, "server");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "getClientForUUID:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                -[WPDPipeManager queue](self, "queue");
                v21 = objc_claimAutoreleasedReturnValue();
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 3221225472;
                block[2] = __33__WPDPipeManager_channelHasData___block_invoke_614;
                block[3] = &unk_24D7C7EE8;
                v37 = v20;
                v38 = v9;
                v39 = v7;
                v40 = v18;
                dispatch_async(v21, block);

              }
              else
              {
                if (WPLogInitOnce != -1)
                  dispatch_once(&WPLogInitOnce, &__block_literal_global_616_0);
                v23 = WiProxLog;
                if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v33;
                  v51 = (uint64_t)v16;
                  _os_log_error_impl(&dword_2175D1000, v23, OS_LOG_TYPE_ERROR, "WPPM: channelHasData failure: client %@ is not found", buf, 0xCu);
                }
              }

            }
            else
            {
              if (WPLogInitOnce != -1)
                dispatch_once(&WPLogInitOnce, &__block_literal_global_618_0);
              v22 = WiProxLog;
              if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v51 = (uint64_t)v16;
                v52 = 2112;
                v53 = v18;
                _os_log_error_impl(&dword_2175D1000, v22, OS_LOG_TYPE_ERROR, "WPPM: channelHasData failure: clientUUID %@ or identfier %@ is invalid", buf, 0x16u);
              }
            }

          }
          next_slot = os_channel_get_next_slot();

        }
        while (next_slot);
      }
      os_channel_advance_slot();
      if (channelHasData__rxCount > 31 || os_channel_available_slot_count() <= 1)
      {
        channelHasData__rxCount = 0;
        os_channel_sync();
      }
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_611_0);
      v30 = (id)WiProxLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "peer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[WPDPipeManager channelHasData:].cold.2(v32, (uint64_t)&v54, v30, v31);
      }

    }
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_609_0);
    v27 = (id)WiProxLog;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v35, "peer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPDPipeManager channelHasData:].cold.1(v29, (uint64_t)&v54, v27, v28);
    }

  }
  _Block_object_dispose(&v44, 8);

}

void __33__WPDPipeManager_channelHasData___block_invoke_610(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "pipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __33__WPDPipeManager_channelHasData___block_invoke_614(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionForClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedData:fromEndpoint:forPeripheral:", v3, v4, *(_QWORD *)(a1 + 56));

}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_619_0);
  v11 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v9, "peer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138413314;
    v38 = v14;
    v39 = 2112;
    v40 = v9;
    v41 = 2112;
    v42 = v10;
    v43 = 2112;
    v44 = v15;
    v45 = 2112;
    v46 = v16;
    _os_log_impl(&dword_2175D1000, v12, OS_LOG_TYPE_DEFAULT, "WPPM: pipeDidDisconnect %@ %@ (error %@), pipes %@, set: %@", (uint8_t *)&v37, 0x34u);

  }
  objc_msgSend(v9, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "peer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPDPipeManager invalidatePipeInfo:forPeer:](self, "invalidatePipeInfo:forPeer:", v17, v19);

  -[WPDPipeManager endpointsDict](self, "endpointsDict");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "clientUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "peer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "containsObject:", v27);

    if (v28)
    {
      objc_msgSend(v9, "peer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObject:", v30);

      -[WPDPipeManager connectionInitiators](self, "connectionInitiators");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, v23);

    }
    -[WPDManager server](self, "server");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "getClientForUUID:", v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v9, "peer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "disconnectedDeviceOverLEPipe:withError:", v35, v10);

    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_621);
      v36 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDPipeManager scalablePipeManager:pipeDidDisconnect:error:].cold.2((uint64_t)v23, v36, v9);
    }

  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_623);
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPDPipeManager scalablePipeManager:pipeDidDisconnect:error:].cold.1();
  }

}

- (void)invalidatePipeInfo:(id)a3 forPeer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__5;
      v25 = __Block_byref_object_dispose__5;
      v26 = 0;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __45__WPDPipeManager_invalidatePipeInfo_forPeer___block_invoke_625;
      v18 = &unk_24D7C8030;
      v19 = v6;
      v20 = &v21;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v15);
      if (v22[5])
      {
        objc_msgSend(v10, "removeObject:", v15, v16, v17, v18);
        if (objc_msgSend(v10, "count"))
        {
          -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);
        }
        else
        {
          -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObjectForKey:", v8);
        }

        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_628);
        v13 = (id)WiProxLog;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[WPDPipeManager peerPipesDict](self, "peerPipesDict");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v14;
          v29 = 2112;
          v30 = v10;
          _os_log_impl(&dword_2175D1000, v13, OS_LOG_TYPE_DEFAULT, "WPPM: invalidatePipeInfo: current peer pipes %@, pipeInfoSet: %@", buf, 0x16u);

        }
      }
      else
      {
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_626_0);
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
          -[WPDPipeManager invalidatePipeInfo:forPeer:].cold.2();
      }

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      if (WPLogInitOnce != -1)
        dispatch_once(&WPLogInitOnce, &__block_literal_global_624_0);
      v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
        -[WPDPipeManager invalidatePipeInfo:forPeer:].cold.1((uint64_t)v8, v12, self);
    }

  }
}

void __45__WPDPipeManager_invalidatePipeInfo_forPeer___block_invoke_625(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v10 = v6;
  objc_msgSend(v6, "pipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v9);

  if ((_DWORD)v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_signpostBegin
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t wpPipeDataSignPostID;
  uint8_t v6[16];

  v3 = (id)WiProxLog;
  v4 = v3;
  wpPipeDataSignPostID = self->_wpPipeDataSignPostID;
  if (wpPipeDataSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_2175D1000, v4, OS_SIGNPOST_INTERVAL_BEGIN, wpPipeDataSignPostID, "receivedPayload", (const char *)&unk_217632882, v6, 2u);
  }

}

- (void)_signpostEnd
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t wpPipeDataSignPostID;
  uint8_t v6[16];

  v3 = (id)WiProxLog;
  v4 = v3;
  wpPipeDataSignPostID = self->_wpPipeDataSignPostID;
  if (wpPipeDataSignPostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_2175D1000, v4, OS_SIGNPOST_INTERVAL_END, wpPipeDataSignPostID, "receivedPayload", (const char *)&unk_217632882, v6, 2u);
  }

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (void)setQueue:(id)a3
{
  objc_storeWeak((id *)&self->_queue, a3);
}

- (CBScalablePipeManager)pipeManager
{
  return (CBScalablePipeManager *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPipeManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)endpointsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpointsDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)peerPipesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPeerPipesDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)connectionInitiators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnectionInitiators:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInitiators, 0);
  objc_storeStrong((id *)&self->_peerPipesDict, 0);
  objc_storeStrong((id *)&self->_endpointsDict, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_destroyWeak((id *)&self->_queue);
}

- (void)sendData:forPeer:forClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "WPPM: sendData failure: client %@ not found to send data to", v2);
  OUTLINED_FUNCTION_0();
}

- (void)sendData:forPeer:forClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "WPPM: %@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)sendData:(uint64_t)a1 forPeer:(uint64_t)a2 forClient:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_2(&dword_2175D1000, a3, (uint64_t)a3, "WPPM: sendData: txLeftToSend %lu", (uint8_t *)a1);
}

- (void)sendData:(NSObject *)a1 forPeer:(uint64_t)a2 forClient:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = CFSTR("sendData failure");
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, a1, a3, "WPPM: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)sendData:(uint64_t)a3 forPeer:(os_log_t)log forClient:.cold.5(unsigned __int16 a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2048;
  *(_QWORD *)(buf + 10) = a3;
  _os_log_debug_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEBUG, "WPPM: sendData: txTLen %d, txLen %lu", buf, 0x12u);
}

- (void)sendData:forPeer:forClient:.cold.6()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_2175D1000, v0, OS_LOG_TYPE_DEBUG, "WPPM: sendData: Initialize pipe data transfer object", v1, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)sendData:forPeer:forClient:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v0, v1, "WPPM: client endpoints: %@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)stream:handleEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: handleEvent: Pipe Info is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stream:handleEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: handleEvent: output stream is not opened?!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stream:(NSObject *)a3 handleEvent:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = 0;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_14(&dword_2175D1000, a3, (uint64_t)a3, "WPPM: input stream: Failed to read data from pipe with error %ld %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_25_0();
}

- (void)stream:handleEvent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: handleEvent: input stream is not opened!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stream:handleEvent:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: handleEvent: input/output stream error occurred - remove from list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleIncomingPipeData:data:dataSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "WPPM: handleIncomingPipeData: bogus data received - ignore!! %@", v2);
  OUTLINED_FUNCTION_0();
}

- (void)receivedPayload:(void *)a1 data:(void *)a2 dataSize:.cold.1(void *a1, void *a2)
{
  void *v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "rxCurrentDataSize");
  objc_msgSend(a2, "rxData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_26_0(v4, v5);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_2_3(&dword_2175D1000, v6, v7, "WPPM: receivedPayload: data size expected: %d, but received: %lu", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivedPayload:(void *)a1 data:(void *)a2 dataSize:.cold.2(void *a1, void *a2)
{
  void *v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "rxTotalLenToReceive");
  objc_msgSend(a2, "rxTotalDataToReceive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_26_0(v4, v5);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_2_3(&dword_2175D1000, v6, v7, "WPPM: receivedPayload: FIRST PACKET - data size expected: %d but received %lu", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivedPayload:(void *)a1 data:(void *)a2 dataSize:.cold.3(void *a1, void *a2)
{
  void *v2;
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_msgSend(a2, "rxTotalDataWithLen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OUTLINED_FUNCTION_26_0(v5, v6);
  objc_msgSend(a2, "rxData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  objc_msgSend(a2, "rxData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 134218498;
  v12 = v7;
  v13 = 2048;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_debug_impl(&dword_2175D1000, v4, OS_LOG_TYPE_DEBUG, "WPPM: receivedPayload: FIRST PACKET txTotalDataLen (%lu) rxData (%lu) %@", (uint8_t *)&v11, 0x20u);

}

- (void)receivedPayload:data:dataSize:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v0, v1, "WPPM: receivedPayload of len %ld", v2);
  OUTLINED_FUNCTION_0();
}

- (void)receivedAck:data:dataSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: receivedAck: Data transfer object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedAck:(void *)a1 data:dataSize:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "WPPM: receivedAck: %@", v4);

  OUTLINED_FUNCTION_8();
}

- (void)receivedAck:(void *)a1 data:dataSize:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "txTotalLenToSend");
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_17_1(&dword_2175D1000, v2, v3, "WPPM: receivedAck: received payload len %d doesn't match with sender payload len %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivedAck:(void *)a1 data:dataSize:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "txSeqNum");
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_17_1(&dword_2175D1000, v2, v3, "WPPM: receivedAck: Received seqNum %d doesn't match with sender seqNum %d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)receivedAck:data:dataSize:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_2175D1000, v0, v1, "WPPM: receivedAck: dataSize %ld", v2);
  OUTLINED_FUNCTION_0();
}

- (void)receivedError:data:dataSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: receivedError: Data transfer object is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)receivedError:(void *)a1 data:dataSize:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "WPPM: receivedError: %@", v4);

  OUTLINED_FUNCTION_8();
}

- (void)receivedError:(unsigned __int8)a1 data:(uint64_t)a2 dataSize:(os_log_t)log .cold.3(unsigned __int8 a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_2175D1000, log, OS_LOG_TYPE_ERROR, "WPPM: receivedError: error: %d, dataSize: %ld", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)sendAck:errorCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: sendAck: pipe data transfer obejct is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendAck:(uint64_t)a3 errorCode:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = 6;
  OUTLINED_FUNCTION_2(&dword_2175D1000, a1, a3, "WPPM: sendAck: bytes written %ld (expected 6)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)sendAck:errorCode:.cold.3()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  OUTLINED_FUNCTION_24_0();
  v14 = *MEMORY[0x24BDAC8D0];
  v4 = v3;
  v5 = objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "streamStatus");
  objc_msgSend(v1, "streamError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218498;
  v9 = v0;
  v10 = 2048;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  OUTLINED_FUNCTION_11_2(&dword_2175D1000, v2, v7, "WPPM: sendAck: bytes written %ld (expected 6) with status %ld error %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11_0();
}

- (void)sendRemainingData:wpClient:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_2_1(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "length");
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_1_4(&dword_2175D1000, v2, v3, "WPPM: sendRemainingData: fail to send remaining data %lu with error %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)writeDataToPipe:(void *)a1 pipe:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_1(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "output");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamStatus");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v1, v3, "WPPM: writeDataToPipe: output stream is not opened %lu", v4);

  OUTLINED_FUNCTION_8();
}

- (void)writeDataToPipe:pipe:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2175D1000, v0, v1, "WPPM: writeDataToPipe slot is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeDataToPipe:pipe:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_2_1(v1);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21_0();
  _os_log_debug_impl(&dword_2175D1000, v0, OS_LOG_TYPE_DEBUG, "WPPM: writeDataToPipe: %@ send (%lu) data over skywalk", v3, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

void __53__WPDPipeManager_scalablePipeManager_pipeDidConnect___block_invoke_586_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  OUTLINED_FUNCTION_11_2(&dword_2175D1000, v2, v7, "WPPM: pipeDidConnect: pipe %@ already exist for peer %@, Peer pipe set %@", v8);

  OUTLINED_FUNCTION_11_0();
}

- (void)sendChannelData:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "pipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "pipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_2(&dword_2175D1000, v4, v10, "WPPM: sendChannelData: Client %@ not found for peer %@ and Endpoint %@", v11);

  OUTLINED_FUNCTION_12_0();
}

- (void)channelHasData:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_2175D1000, a3, (uint64_t)a3, "WPPM: channelHasData - no peerPipeSet found for peer %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_25_0();
}

- (void)channelHasData:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_2175D1000, a3, (uint64_t)a3, "WPPM: channelHasData - no pipeInfo found for peer %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_25_0();
}

- (void)scalablePipeManager:pipeDidDisconnect:error:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_2_1(v2);
  objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_21(), "endpointsDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_4(&dword_2175D1000, v4, v5, "WPPM: pipeDidDisconnect failure: No client exist for Endpoint %@, current endpointsDict %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

- (void)scalablePipeManager:(uint64_t)a1 pipeDidDisconnect:(void *)a2 error:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v4 = a2;
  objc_msgSend(a3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_4(&dword_2175D1000, v6, v7, "WPPM: pipeDidDisconnect failure: Client %@ not found for Endpoint %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)invalidatePipeInfo:(void *)a3 forPeer:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "peerPipesDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_14(&dword_2175D1000, v5, v7, "WPPM: invalidatePipeInfo: No PipeInfo set found for peer %@ in %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)invalidatePipeInfo:forPeer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_2175D1000, v0, v1, "WPPM: invalidatePipeInfo: pipe not found which is matching endpoint name %@", v2);
  OUTLINED_FUNCTION_0();
}

@end
