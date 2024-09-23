@implementation SIModel

- (SIModel)initWithNetworkConfiguration:(id)a3
{
  id v5;
  SIModel *v6;
  id *p_isa;
  NSObject *v8;
  SIBaseNetworkE5RT *v9;
  SINetworkProtocol *network;
  id v11;
  unint64_t v12;
  uint64_t v13;
  NSDictionary *subLoggerTable;
  void *v15;
  void *v16;
  SICoreAnalyticManager *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  SIModel *v22;
  objc_super v24;
  _BYTE buf[12];
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SIModel;
  v6 = -[SIModel init](&v24, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (!v6)
    goto LABEL_16;
  if ((SISupportANE() & 1) == 0 && objc_msgSend(v5, "engineType") == 1)
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
      v26 = 1025;
      v27 = 35;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** ANE is not available on this device. Initializing by MPS instead ***", buf, 0x12u);
    }

    objc_msgSend(v5, "setEngineType:", 0);
    objc_msgSend(v5, "setRunByE5RT:", 0);
  }
  v9 = objc_msgSend(v5, "engineType") == 1 && objc_msgSend(v5, "runByE5RT")
     ? -[SIBaseNetworkE5RT initWithNetworkConfiguration:]([SIBaseNetworkE5RT alloc], "initWithNetworkConfiguration:", v5): (SIBaseNetworkE5RT *)-[SIBaseNetworkEspresso initWithNetworkConfiguration:]([SIBaseNetworkEspresso alloc], "initWithNetworkConfiguration:", v5);
  network = v6->_network;
  v6->_network = (SINetworkProtocol *)v9;

  objc_msgSend(v5, "networkName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v12 = objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v11, "length"), 0)? *(_QWORD *)buf: 0;

  v6->_algorithmNameHash = v12;
  if (-[SINetworkProtocol prepare](v6->_network, "prepare"))
  {
    objc_storeStrong((id *)&v6->_config, a3);
    -[SIModel colletSubloggerTable](v6, "colletSubloggerTable");
    v13 = objc_claimAutoreleasedReturnValue();
    subLoggerTable = v6->_subLoggerTable;
    v6->_subLoggerTable = (NSDictionary *)v13;

    +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "subLoggers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerSubloggers:", v16);

    v17 = [SICoreAnalyticManager alloc];
    objc_msgSend(v5, "coreAnalyticEventName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "keysForCoreAnalyticAccumulatedData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SICoreAnalyticManager initWithEventName:requiredKeys:minLogTimeInterval:](v17, "initWithEventName:requiredKeys:minLogTimeInterval:", v18, v19, objc_msgSend(v5, "coreAnalyticTimeInterval"));
    v21 = p_isa[8];
    p_isa[8] = (id)v20;

    objc_msgSend(p_isa[8], "averageAccumulatedDataOverKey:", CFSTR("inferenceCount"));
    v22 = p_isa;
  }
  else
  {
LABEL_16:
    v22 = 0;
  }

  return v22;
}

- (CGSize)getOutputResolution
{
  NSObject *v2;
  double v3;
  double v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  CGSize result;

  v9 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
    v7 = 1025;
    v8 = 71;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** output resolution method must be overriden ***", (uint8_t *)&v5, 0x12u);
  }

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)getInputResolution
{
  NSObject *v2;
  double v3;
  double v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  CGSize result;

  v9 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
    v7 = 1025;
    v8 = 77;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** input resolution method must be overriden ***", (uint8_t *)&v5, 0x12u);
  }

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)networkVersion
{
  return (id)-[SINetworkProtocol networkVersion](self->_network, "networkVersion");
}

- (id)getConfiguration
{
  return self->_config;
}

- (id)getOpsForLibrary
{
  return (id)-[SINetworkProtocol getOpsForLibrary](self->_network, "getOpsForLibrary");
}

- (int64_t)switchNetworkConfiguration:(int64_t)a3
{
  SEL v4;
  void *v5;
  void *v6;
  SINetworkProtocol *network;
  void *v8;
  int64_t v9;
  int64_t v11;

  v11 = a3;
  v4 = NSSelectorFromString(CFSTR("setNetworkModeEnum:"));
  -[SINetworkConfiguration methodSignatureForSelector:](self->_config, "methodSignatureForSelector:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelector:", v4);
  objc_msgSend(v6, "invokeWithTarget:", self->_config);
  objc_msgSend(v6, "setArgument:atIndex:", &v11, 2);
  objc_msgSend(v6, "invoke");
  network = self->_network;
  -[SINetworkConfiguration networkMode](self->_config, "networkMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SINetworkProtocol switchConfiguration:](network, "switchConfiguration:", v8);

  return v9;
}

- (int64_t)evaluateWithInput:(id)a3 outputs:(id)a4
{
  double v6;
  uint64_t v7;
  size_t v8;
  uint64_t i;
  size_t v10;
  void *v11;
  __CVBuffer *v12;
  size_t Width;
  size_t Height;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  int v23;
  __CVBuffer *v24;
  __CVBuffer *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  __CVBuffer *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  size_t v43;
  void *v44;
  __IOSurface *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  __CVBuffer *v56;
  IOSurfaceRef v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  NSObject *v64;
  uint64_t v66;
  __IOSurface *IOSurface;
  IOSurfaceID ID;
  IOSurfaceID v70;
  id v71;
  id v72;
  uint64_t v73;
  size_t v74;
  int64_t v75;
  id obj;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  size_t v96;
  __int16 v97;
  size_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v71 = a3;
  v72 = a4;
  LODWORD(v6) = 1.0;
  -[SICoreAnalyticManager accumulateStatisticDataForKey:value:](self->_coreAnalyticManager, "accumulateStatisticDataForKey:value:", CFSTR("inferenceCount"), v6);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v71;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
  if (v7)
  {
    v8 = 0;
    v73 = *(_QWORD *)v86;
    v74 = 0;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v86 != v73)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (__CVBuffer *)objc_msgSend(v11, "pixelBuffer");

        if (v12)
        {
          Width = CVPixelBufferGetWidth(v12);
          Height = CVPixelBufferGetHeight(v12);
          v15 = -[SINetworkProtocol getInputWidth:](self->_network, "getInputWidth:", v10);
          v16 = -[SINetworkProtocol getInputHeight:](self->_network, "getInputHeight:", v10);
          v17 = v16;
          if (Width != v15 || Height != v16)
          {
            __SceneIntelligenceLogSharedInstance();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136381955;
              v92 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
              v93 = 1025;
              v94 = 129;
              v95 = 2048;
              v96 = Width;
              v97 = 2048;
              v98 = Height;
              v99 = 2049;
              v100 = v15;
              v101 = 2049;
              v102 = v17;
              _os_log_impl(&dword_21071A000, v64, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected image input resolution (%zu, %zu). (Expected: %{private}zu %{private}zu) ***", buf, 0x3Au);
            }
            v66 = 1;
            goto LABEL_57;
          }
          v19 = v74;
          v20 = Height * Width > v8 * v74;
          if (Height * Width > v8 * v74)
            v19 = Height;
          v74 = v19;
          if (v20)
            v8 = Width;
          if (-[SINetworkProtocol setInput:fromCVPixelBuffer:](self->_network, "setInput:fromCVPixelBuffer:", v10, v12))
          {
            __SceneIntelligenceLogSharedInstance();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              IOSurface = CVPixelBufferGetIOSurface(v12);
              ID = IOSurfaceGetID(IOSurface);
              *(_DWORD *)buf = 136381443;
              v92 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
              v93 = 1025;
              v94 = 140;
              v95 = 2113;
              v96 = v10;
              v97 = 1024;
              LODWORD(v98) = ID;
              _os_log_impl(&dword_21071A000, v64, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to set the input for blob= %{private}@ buffer_id= %d. Inference interrupted. ***", buf, 0x22u);
            }
            v66 = 4;
LABEL_57:
            v75 = v66;
            v39 = obj;
LABEL_58:

            goto LABEL_59;
          }
          +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isLoggerEnabled:", v22);

          if (v23)
          {
            kdebug_trace();
            if (CVPixelBufferGetPixelFormatType(v12) == 875836518)
            {
              v24 = SICreatePixelBufferWithNewFormatFromExistingBuffer(v12, 0x42475241u);
              v25 = SICreateRGBFromBGRAPixelBuffer(v24);
              +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[SIModel frameTimestamp](self, "frameTimestamp");
              v28 = v27;
              -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", v10);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "logPixelBuffer:at:sublogger:name:", v25, v29, CFSTR("input"), v28);

              CVPixelBufferRelease(v24);
              CVPixelBufferRelease(v25);
            }
            else if (CVPixelBufferGetPixelFormatType(v12) == 1111970369)
            {
              v30 = SICreateRGBFromBGRAPixelBuffer(v12);
              +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[SIModel frameTimestamp](self, "frameTimestamp");
              v33 = v32;
              -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", v10);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "logPixelBuffer:at:sublogger:name:", v30, v34, CFSTR("input"), v33);

              CVPixelBufferRelease(v30);
            }
            else
            {
              +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[SIModel frameTimestamp](self, "frameTimestamp");
              v37 = v36;
              -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", v10);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "logPixelBuffer:at:sublogger:name:", v12, v38, CFSTR("input"), v37);

            }
            kdebug_trace();
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (-[SINetworkProtocol supportZeroCopyOutput](self->_network, "supportZeroCopyOutput"))
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v39 = v72;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v82;
      while (2)
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v82 != v41)
            objc_enumerationMutation(v39);
          v43 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
          objc_msgSend(v39, "objectForKeyedSubscript:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v44, "pixelBuffer"));

          if (v45
            && -[SINetworkProtocol setOutputBlob:forOutputSurface:](self->_network, "setOutputBlob:forOutputSurface:", v43, v45))
          {
            __SceneIntelligenceLogSharedInstance();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              v70 = IOSurfaceGetID(v45);
              *(_DWORD *)buf = 136381443;
              v92 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
              v93 = 1025;
              v94 = 172;
              v95 = 2113;
              v96 = v43;
              v97 = 1024;
              LODWORD(v98) = v70;
              _os_log_impl(&dword_21071A000, v64, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to set the output for blob= %{private}@ buffer_id= %d. Inference interrupted. ***", buf, 0x22u);
            }
            v75 = 4;
            goto LABEL_58;
          }
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        if (v40)
          continue;
        break;
      }
    }

  }
  kdebug_trace();
  v46 = -[SINetworkProtocol runNetwork](self->_network, "runNetwork");
  kdebug_trace();
  v75 = v46;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v47 = v72;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v78;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v78 != v49)
          objc_enumerationMutation(v47);
        v51 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
        +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v52, "isLoggerEnabled:", v53);

        if (v54)
        {
          kdebug_trace();
          objc_msgSend(v47, "objectForKeyedSubscript:", v51);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (__CVBuffer *)objc_msgSend(v55, "pixelBuffer");

          if (v56)
          {
            v57 = CVPixelBufferGetIOSurface(v56);
          }
          else
          {
            -[SIModel network](self, "network");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = (IOSurfaceRef)objc_msgSend(v58, "getOutputSurface:", v51);

          }
          +[SIVisualLogger sharedLogger](SIVisualLogger, "sharedLogger");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[SIModel frameTimestamp](self, "frameTimestamp");
          v61 = v60;
          -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", v51);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "logIOSurface:at:sublogger:name:", v57, v62, CFSTR("output"), v61);

          kdebug_trace();
        }
      }
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    }
    while (v48);
  }

  if (!v75)
  {
    LODWORD(v63) = 1.0;
    -[SICoreAnalyticManager accumulateStatisticDataForKey:value:](self->_coreAnalyticManager, "accumulateStatisticDataForKey:value:", CFSTR("inferenceSuccessRate"), v63);
    v75 = 0;
  }
LABEL_59:

  return v75;
}

- (id)keysForCoreAnalyticAccumulatedData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (int64_t)addPrewiringBuffersToStreamWithInputPools:(id)a3 outputPools:(id)a4 clearWiredBuffer:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[SIModel network](self, "network");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SINetworkConfiguration networkMode](self->_config, "networkMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "addPrewiringBuffersToStreamForFunctionName:inputPools:outputPools:clearWiredBuffer:", v11, v8, v9, v5);

  if (v12)
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136380931;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIModel.mm";
      v18 = 1025;
      v19 = 229;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to complete ANEP. release all ANEP buffers to prevent unexpected behavior. ***", (uint8_t *)&v16, 0x12u);
    }

    -[SIModel unwirePrewiringBuffers](self, "unwirePrewiringBuffers");
    v14 = 4;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)unwirePrewiringBuffers
{
  void *v2;
  int64_t v3;

  -[SIModel network](self, "network");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unwirePrewiringBuffers");

  return v3;
}

- (id)colletSubloggerTable
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  id obja;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SIModel network](self, "network");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "networkInputNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x24BDD17C8]);
        +[SIVisualLogger frameworkPrefix](SIVisualLogger, "frameworkPrefix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SINetworkConfiguration defaultVisualLoggerName](self->_config, "defaultVisualLoggerName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@.%@.ML.input_%@"), v11, v12, v9);

        objc_msgSend(v3, "setObject:forKey:", v13, v9);
        ++v8;
      }
      while (v6 != v8);
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[SIModel network](self, "network");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "networkOutputNames");
  obja = (id)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(obja);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v17);
        v19 = objc_alloc(MEMORY[0x24BDD17C8]);
        +[SIVisualLogger frameworkPrefix](SIVisualLogger, "frameworkPrefix");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SINetworkConfiguration defaultVisualLoggerName](self->_config, "defaultVisualLoggerName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@.%@.ML.output_%@"), v20, v21, v18);

        objc_msgSend(v3, "setObject:forKey:", v22, v18);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v15);
  }

  return v3;
}

- (id)subLoggers
{
  id v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_subLoggerTable;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        -[NSDictionary objectForKeyedSubscript:](self->_subLoggerTable, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (SINetworkProtocol)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (SINetworkConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (unint64_t)algorithmNameHash
{
  return self->_algorithmNameHash;
}

- (void)setAlgorithmNameHash:(unint64_t)a3
{
  self->_algorithmNameHash = a3;
}

- (unint64_t)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(unint64_t)a3
{
  self->_mappingId = a3;
}

- (NSDictionary)inputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)outputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOutputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (SICoreAnalyticManager)coreAnalyticManager
{
  return self->_coreAnalyticManager;
}

- (void)setCoreAnalyticManager:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticManager, a3);
}

- (double)frameTimestamp
{
  return self->_frameTimestamp;
}

- (void)setFrameTimestamp:(double)a3
{
  self->_frameTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticManager, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_subLoggerTable, 0);
}

@end
