@implementation _MLServer

- (_MLServer)initWithOptions:(id)a3
{
  id v5;
  _MLServer *v6;
  uint64_t v7;
  _MLNetworkPacket *packet;
  dispatch_queue_t v9;
  OS_dispatch_queue *q;
  _MLNetworkOptions *v11;
  _MLNetworkOptions *nwOptions;
  _MLNetworking *v13;
  _MLNetworking *nwObj;
  _MLNetworking *v15;
  _QWORD v17[4];
  id v18[2];
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_MLServer;
  v6 = -[_MLServer init](&v20, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    packet = v6->_packet;
    v6->_packet = (_MLNetworkPacket *)v7;

    v9 = dispatch_queue_create("com.apple.remoteCoreMLServer", 0);
    q = v6->_q;
    v6->_q = (OS_dispatch_queue *)v9;

    v11 = -[_MLNetworkOptions initWithOptions:]([_MLNetworkOptions alloc], "initWithOptions:", v5);
    nwOptions = v6->_nwOptions;
    v6->_nwOptions = v11;

    v13 = -[_MLNetworking initListener:]([_MLNetworking alloc], "initListener:", v6->_nwOptions);
    nwObj = v6->_nwObj;
    v6->_nwObj = v13;

    objc_initWeak(&location, v6);
    v15 = v6->_nwObj;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __29___MLServer_initWithOptions___block_invoke;
    v17[3] = &unk_24F357090;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a2;
    -[_MLNetworking setListenerReceiveDataCallBack:](v15, "setListenerReceiveDataCallBack:", v17);
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)doReceive:(id)a3 context:(id)a4 isComplete:(BOOL)a5 error:(id)a6
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *q;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[6];
  _QWORD applier[6];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  unint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = MEMORY[0x24BDAC760];
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __48___MLServer_doReceive_context_isComplete_error___block_invoke;
  applier[3] = &unk_24F357158;
  applier[4] = self;
  applier[5] = a2;
  dispatch_data_apply((dispatch_data_t)a3, applier);
  -[_MLServer packet](self, "packet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sizeOfPacket");

  if (!v10)
  {
    -[_MLServer packet](self, "packet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[_MLNetworkHeaderEncoding getHeaderEncoding:](_MLNetworkHeaderEncoding, "getHeaderEncoding:", v12);
    -[_MLServer packet](self, "packet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCommand:", v13);

    -[_MLServer packet](self, "packet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "buffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[_MLNetworkHeaderEncoding getHeaderDataSize:](_MLNetworkHeaderEncoding, "getHeaderDataSize:", v16);
    -[_MLServer packet](self, "packet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSizeOfPacket:", v17);

    +[_MLLog serverFramework](_MLLog, "serverFramework");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[_MLServer doReceive:context:isComplete:error:].cold.2(a2, self, v19);

  }
  -[_MLServer packet](self, "packet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[_MLNetworkHeaderEncoding isHeaderError:](_MLNetworkHeaderEncoding, "isHeaderError:", objc_msgSend(v20, "command"));

  if (v21)
  {
    +[_MLLog serverFramework](_MLLog, "serverFramework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_MLServer doReceive:context:isComplete:error:].cold.1(a2, self);

    +[_MLNetworkHeaderEncoding acknowledgeFailData](_MLNetworkHeaderEncoding, "acknowledgeFailData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MLServer nwObj](self, "nwObj");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendData:", v23);

    -[_MLServer packet](self, "packet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cleanupDoubleBuffer");

  }
  else
  {
    -[_MLServer packet](self, "packet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "buffer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");
    v29 = v28 - +[_MLNetworkHeaderEncoding getHeaderSize](_MLNetworkHeaderEncoding, "getHeaderSize");

    -[_MLServer packet](self, "packet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "sizeOfPacket");

    if (v31 <= v29)
    {
      -[_MLServer packet](self, "packet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v29 - objc_msgSend(v33, "sizeOfPacket");

      if (v34 >= 1)
      {
        -[_MLServer packet](self, "packet");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "buffer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = +[_MLNetworkHeaderEncoding getHeaderEnd:](_MLNetworkHeaderEncoding, "getHeaderEnd:", v36);

        objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v37, v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MLServer packet](self, "packet");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDoubleBuffer:", v38);

      }
      -[_MLServer packet](self, "packet");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "buffer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = +[_MLNetworkHeaderEncoding getHeaderDataStart:](_MLNetworkHeaderEncoding, "getHeaderDataStart:", v41);

      v43 = (void *)MEMORY[0x24BDBCEC8];
      -[_MLServer packet](self, "packet");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "dataWithBytes:length:", v42, objc_msgSend(v44, "sizeOfPacket"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MLServer packet](self, "packet");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setBuffer:", v45);

      q = self->_q;
      v54[0] = v8;
      v54[1] = 3221225472;
      v54[2] = __48___MLServer_doReceive_context_isComplete_error___block_invoke_8;
      v54[3] = &unk_24F357180;
      v54[4] = self;
      v54[5] = a2;
      dispatch_sync(q, v54);
    }
    else
    {
      +[_MLLog serverFramework](_MLLog, "serverFramework");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MLServer packet](self, "packet");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "sizeOfPacket");
        -[_MLServer packet](self, "packet");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "buffer");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "length");
        *(_DWORD *)buf = 138413058;
        v57 = v48;
        v58 = 2048;
        v59 = v50;
        v60 = 2048;
        v61 = v53;
        v62 = 2048;
        v63 = v29;
        _os_log_debug_impl(&dword_229FCB000, v32, OS_LOG_TYPE_DEBUG, "%@: Size of Packet: %zu < Size of current %zu buffer_length %zu.", buf, 0x2Au);

      }
    }
  }
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

- (id)loadFunction
{
  return self->_loadFunction;
}

- (void)setLoadFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)predictFunction
{
  return self->_predictFunction;
}

- (void)setPredictFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)unLoadFunction
{
  return self->_unLoadFunction;
}

- (void)setUnLoadFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)textFunction
{
  return self->_textFunction;
}

- (void)setTextFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong(&self->_textFunction, 0);
  objc_storeStrong(&self->_unLoadFunction, 0);
  objc_storeStrong(&self->_predictFunction, 0);
  objc_storeStrong(&self->_loadFunction, 0);
  objc_storeStrong((id *)&self->_packet, 0);
  objc_storeStrong((id *)&self->_nwOptions, 0);
  objc_storeStrong((id *)&self->_nwObj, 0);
}

- (void)doReceive:(const char *)a1 context:(void *)a2 isComplete:error:.cold.1(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "packet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command");
  OUTLINED_FUNCTION_4_0(&dword_229FCB000, v5, v6, "%@: Header Error Command = %lu", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)doReceive:(NSObject *)a3 context:isComplete:error:.cold.2(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "packet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sizeOfPacket");
  objc_msgSend(a2, "packet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v5;
  v11 = 2048;
  v12 = v7;
  v13 = 2048;
  v14 = objc_msgSend(v8, "command");
  _os_log_debug_impl(&dword_229FCB000, a3, OS_LOG_TYPE_DEBUG, "%@: Begin Packet size = %lu command %lu", (uint8_t *)&v9, 0x20u);

}

@end
