@implementation _MLRemoteConnection

- (_MLRemoteConnection)initWithOptions:(id)a3
{
  id v5;
  _MLRemoteConnection *v6;
  uint64_t v7;
  _MLNetworkPacket *packet;
  _MLNetworkOptions *v9;
  _MLNetworkOptions *nwOptions;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *semaphore;
  dispatch_queue_t v13;
  OS_dispatch_queue *q;
  _MLNetworking *v15;
  _MLNetworking *nwObj;
  _MLNetworking *v17;
  _QWORD v19[4];
  id v20[2];
  id location;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MLRemoteConnection;
  v6 = -[_MLRemoteConnection init](&v22, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    packet = v6->_packet;
    v6->_packet = (_MLNetworkPacket *)v7;

    v9 = -[_MLNetworkOptions initWithOptions:]([_MLNetworkOptions alloc], "initWithOptions:", v5);
    nwOptions = v6->_nwOptions;
    v6->_nwOptions = v9;

    v11 = dispatch_semaphore_create(0);
    semaphore = v6->_semaphore;
    v6->_semaphore = (OS_dispatch_semaphore *)v11;

    v13 = dispatch_queue_create("com.apple.remoteCoreMLClient", 0);
    q = v6->_q;
    v6->_q = (OS_dispatch_queue *)v13;

    v15 = -[_MLNetworking initConnection:]([_MLNetworking alloc], "initConnection:", v6->_nwOptions);
    nwObj = v6->_nwObj;
    v6->_nwObj = v15;

    objc_initWeak(&location, v6);
    v17 = v6->_nwObj;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __39___MLRemoteConnection_initWithOptions___block_invoke;
    v19[3] = &unk_24F357090;
    objc_copyWeak(v20, &location);
    v20[1] = (id)a2;
    -[_MLNetworking setReceiveDataCallBack:](v17, "setReceiveDataCallBack:", v19);
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)doReceive:(id)a3 context:(id)a4 isComplete:(BOOL)a5 error:(id)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  _QWORD applier[5];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  unint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __58___MLRemoteConnection_doReceive_context_isComplete_error___block_invoke;
  applier[3] = &unk_24F3570B8;
  applier[4] = self;
  dispatch_data_apply((dispatch_data_t)a3, applier);
  -[_MLRemoteConnection packet](self, "packet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sizeOfPacket");

  if (!v9)
  {
    -[_MLRemoteConnection packet](self, "packet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[_MLNetworkHeaderEncoding getHeaderEncoding:](_MLNetworkHeaderEncoding, "getHeaderEncoding:", v11);
    -[_MLRemoteConnection packet](self, "packet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCommand:", v12);

    -[_MLRemoteConnection packet](self, "packet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[_MLNetworkHeaderEncoding getHeaderDataSize:](_MLNetworkHeaderEncoding, "getHeaderDataSize:", v15);
    -[_MLRemoteConnection packet](self, "packet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSizeOfPacket:", v16);

    +[_MLLog clientFramework](_MLLog, "clientFramework");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[_MLRemoteConnection doReceive:context:isComplete:error:].cold.6();

  }
  -[_MLRemoteConnection packet](self, "packet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[_MLNetworkHeaderEncoding isHeaderError:](_MLNetworkHeaderEncoding, "isHeaderError:", objc_msgSend(v19, "command"));

  if (v20)
  {
    +[_MLLog serverFramework](_MLLog, "serverFramework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[_MLRemoteConnection doReceive:context:isComplete:error:].cold.1();

    +[_MLNetworkHeaderEncoding acknowledgeFailData](_MLNetworkHeaderEncoding, "acknowledgeFailData");
    v22 = objc_claimAutoreleasedReturnValue();
    -[_MLRemoteConnection nwObj](self, "nwObj");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendData:", v22);

    -[_MLRemoteConnection packet](self, "packet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cleanupDoubleBuffer");

  }
  else
  {
    -[_MLRemoteConnection packet](self, "packet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "buffer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");
    v28 = v27 - +[_MLNetworkHeaderEncoding getHeaderSize](_MLNetworkHeaderEncoding, "getHeaderSize");

    -[_MLRemoteConnection packet](self, "packet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "sizeOfPacket");

    if (v30 <= v28)
    {
      -[_MLRemoteConnection packet](self, "packet");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v28 - objc_msgSend(v37, "sizeOfPacket");

      if (v38 >= 1)
      {
        -[_MLRemoteConnection packet](self, "packet");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "buffer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = +[_MLNetworkHeaderEncoding getHeaderEnd:](_MLNetworkHeaderEncoding, "getHeaderEnd:", v40);

        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v41, v38);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MLRemoteConnection packet](self, "packet");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setDoubleBuffer:", v42);

      }
      -[_MLRemoteConnection packet](self, "packet");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "buffer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = +[_MLNetworkHeaderEncoding getHeaderDataStart:](_MLNetworkHeaderEncoding, "getHeaderDataStart:", v45);

      v47 = objc_alloc(MEMORY[0x24BDBCEC8]);
      -[_MLRemoteConnection packet](self, "packet");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v47, "initWithBytes:length:", v46, objc_msgSend(v48, "sizeOfPacket"));
      -[_MLRemoteConnection setOutputResult:](self, "setOutputResult:", v49);

      -[_MLRemoteConnection packet](self, "packet");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = +[_MLNetworkHeaderEncoding isHeaderAcknowledgeSucessData:](_MLNetworkHeaderEncoding, "isHeaderAcknowledgeSucessData:", objc_msgSend(v50, "command"));

      if ((_DWORD)v49)
      {
        +[_MLLog clientFramework](_MLLog, "clientFramework");
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[_MLRemoteConnection doReceive:context:isComplete:error:].cold.3(a2);
      }
      else
      {
        -[_MLRemoteConnection packet](self, "packet");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = +[_MLNetworkHeaderEncoding isHeaderPredictFeature:](_MLNetworkHeaderEncoding, "isHeaderPredictFeature:", objc_msgSend(v52, "command"));

        +[_MLLog clientFramework](_MLLog, "clientFramework");
        v54 = objc_claimAutoreleasedReturnValue();
        v51 = v54;
        if (v53)
        {
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            -[_MLRemoteConnection doReceive:context:isComplete:error:].cold.4(a2);

          -[_MLRemoteConnection packet](self, "packet");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "buffer");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setLength:", 0);

          -[_MLRemoteConnection packet](self, "packet");
          v51 = objc_claimAutoreleasedReturnValue();
          -[NSObject buffer](v51, "buffer");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MLRemoteConnection outputResult](self, "outputResult");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "appendData:", v58);

        }
        else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          -[_MLRemoteConnection doReceive:context:isComplete:error:].cold.5();
        }
      }

      -[_MLRemoteConnection packet](self, "packet");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "resetMetadata");

      +[_MLLog clientFramework](_MLLog, "clientFramework");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        -[_MLRemoteConnection doReceive:context:isComplete:error:].cold.2(a2);

      -[_MLRemoteConnection semaphore](self, "semaphore");
      v22 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v22);
    }
    else
    {
      +[_MLLog clientFramework](_MLLog, "clientFramework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MLRemoteConnection packet](self, "packet");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "sizeOfPacket");
        -[_MLRemoteConnection packet](self, "packet");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "buffer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "length");
        *(_DWORD *)buf = 138413058;
        v63 = v31;
        v64 = 2048;
        v65 = v33;
        v66 = 2048;
        v67 = v36;
        v68 = 2048;
        v69 = v28;
        _os_log_debug_impl(&dword_229FCB000, v22, OS_LOG_TYPE_DEBUG, "%@: Size of Packet: %zu < Size of current %zu buffer_length %zu.", buf, 0x2Au);

      }
    }
  }

}

- (BOOL)loadFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_MLNetworkHeaderEncoding loadModel:](_MLNetworkHeaderEncoding, "loadModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[_MLRemoteConnection sendDataAndWaitForAcknowledgementOrTimeout:](self, "sendDataAndWaitForAcknowledgementOrTimeout:", v8);

  return (char)self;
}

- (BOOL)predictionFromURL:(id)a3 features:(id)a4 output:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _BOOL4 v15;
  BOOL v16;
  void *v17;
  _QWORD block[5];
  id v20;
  SEL v21;

  v11 = a5;
  +[_MLNetworkHeaderEncoding predictFeature:](_MLNetworkHeaderEncoding, "predictFeature:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLRemoteConnection q](self, "q");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke;
  block[3] = &unk_24F3570E0;
  block[4] = self;
  v21 = a2;
  v14 = v11;
  v20 = v14;
  dispatch_sync(v13, block);

  v15 = -[_MLRemoteConnection sendDataAndWaitForAcknowledgementOrTimeout:](self, "sendDataAndWaitForAcknowledgementOrTimeout:", v12);
  v16 = v15;
  if (a7 && v15)
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MLRemoteCoreMLErrors clientTimeoutErrorForMethod:](_MLRemoteCoreMLErrors, "clientTimeoutErrorForMethod:", v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (BOOL)unloadFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_MLNetworkHeaderEncoding unLoadModel:](_MLNetworkHeaderEncoding, "unLoadModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[_MLRemoteConnection sendDataAndWaitForAcknowledgementOrTimeout:](self, "sendDataAndWaitForAcknowledgementOrTimeout:", v8);

  return (char)self;
}

- (void)send:(id)a3 options:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(a3, "dataUsingEncoding:", 4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MLNetworkHeaderEncoding textDebug:](_MLNetworkHeaderEncoding, "textDebug:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MLLog clientFramework](_MLLog, "clientFramework");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_MLRemoteConnection send:options:].cold.1();

  -[_MLRemoteConnection sendDataAndWaitForAcknowledgementOrTimeout:](self, "sendDataAndWaitForAcknowledgementOrTimeout:", v6);
}

- (BOOL)sendDataAndWaitForAcknowledgementOrTimeout:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  SEL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[_MLRemoteConnection q](self, "q");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke;
  v9[3] = &unk_24F357130;
  v9[4] = self;
  v10 = v5;
  v11 = &v13;
  v12 = a2;
  v7 = v5;
  dispatch_sync(v6, v9);

  LOBYTE(v5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return (char)v5;
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (_MLNetworking)nwObj
{
  return self->_nwObj;
}

- (_MLNetworkOptions)nwOptions
{
  return self->_nwOptions;
}

- (_MLNetworkPacket)packet
{
  return self->_packet;
}

- (NSMutableData)outputResult
{
  return self->_outputResult;
}

- (void)setOutputResult:(id)a3
{
  objc_storeStrong((id *)&self->_outputResult, a3);
}

- (unint64_t)jobCount
{
  return self->_jobCount;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_outputResult, 0);
  objc_storeStrong((id *)&self->_packet, 0);
  objc_storeStrong((id *)&self->_nwOptions, 0);
  objc_storeStrong((id *)&self->_nwObj, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)doReceive:context:isComplete:error:.cold.1()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "packet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "command");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_229FCB000, v3, v4, "%@: Command = %lu", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)doReceive:(const char *)a1 context:isComplete:error:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v2, v3, "%@: Release Semaphore", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)doReceive:(const char *)a1 context:isComplete:error:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v2, v3, "%@: Recived ACK", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)doReceive:(const char *)a1 context:isComplete:error:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v2, v3, "%@: Recived PredictReturnResult", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)doReceive:context:isComplete:error:.cold.5()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "packet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "command");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7(&dword_229FCB000, v3, v4, "%@: Unexpected command = %lu", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)doReceive:context:isComplete:error:.cold.6()
{
  void *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "packet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeOfPacket");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_229FCB000, v3, v4, "%@: Packet size = %lu", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)send:options:.cold.1()
{
  void *v0;
  SEL v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "length");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_229FCB000, v2, v3, "%@: Send Text Size=%zu.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
