@implementation TGIE5ANESessionObjC

+ (void)sendStartSignalForResource:(id)a3 useEnergyEfficientMode:(BOOL)a4 assetIdentifier:(id)a5
{
  _BOOL8 v6;
  id v7;
  cgm::token_generation_inference::common::logging::CGMTGILogger *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t isKindOfClass;
  void *v17;
  NSObject *v18;
  cgm::token_generation_inference::common::logging::CGMTGILogger *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  _BYTE v24[18];
  __int16 v25;
  cgm::token_generation_inference::common::logging::CGMTGILogger *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v6 = a4;
  v28[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (cgm::token_generation_inference::common::logging::CGMTGILogger *)a5;
  cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "path");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = 136315650;
    v22 = objc_msgSend(v10, "UTF8String");
    v23 = 1024;
    *(_DWORD *)v24 = v6;
    *(_WORD *)&v24[4] = 2080;
    *(_QWORD *)&v24[6] = -[cgm::token_generation_inference::common::logging::CGMTGILogger UTF8String](objc_retainAutorelease(v8), "UTF8String");
    _os_log_impl(&dword_248CAA000, v9, OS_LOG_TYPE_INFO, "Sending ANE start session signal for resource at path %s with useEnergyEfficientMode: %i and asset identifier %s", (uint8_t *)&v21, 0x1Cu);

  }
  v27[0] = CFSTR("ANEClientModelAssetPath");
  objc_msgSend(v7, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("ANEClientEnergyEfficientWorkload");
  v28[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  sendAneSessionSignal();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ANEClientTotalPages"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ANEClientResidentPages"));
  isKindOfClass = objc_claimAutoreleasedReturnValue();
  v17 = (void *)isKindOfClass;
  if (v15
    && isKindOfClass
    && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0)
    && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) != 0))
  {
    v18 = v15;
    v19 = v17;
    cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL(v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = 138413058;
      v22 = (uint64_t)v8;
      v23 = 2112;
      *(_QWORD *)v24 = v7;
      *(_WORD *)&v24[8] = 2112;
      *(_QWORD *)&v24[10] = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_248CAA000, v20, OS_LOG_TYPE_INFO, "ANE start signal for asset identifier %@ and resource at path %@ yielded %@ total pages and %@ pages already resident.", (uint8_t *)&v21, 0x2Au);
    }

    +[TelemetryHelpers emitFileResidentInfoWithAssetIdentifier:residentPages:totalPages:](_TtC24TokenGenerationInference16TelemetryHelpers, "emitFileResidentInfoWithAssetIdentifier:residentPages:totalPages:", v8, -[cgm::token_generation_inference::common::logging::CGMTGILogger longValue](v19, "longValue"), -[NSObject longValue](v18, "longValue"));
  }
  else
  {
    cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL((cgm::token_generation_inference::common::logging::CGMTGILogger *)isKindOfClass);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412802;
      v22 = (uint64_t)v8;
      v23 = 2112;
      *(_QWORD *)v24 = v15;
      *(_WORD *)&v24[8] = 2112;
      *(_QWORD *)&v24[10] = v17;
      _os_log_error_impl(&dword_248CAA000, v18, OS_LOG_TYPE_ERROR, "ANE start signal for asset identifier %@ did not return expected metrics back. Received (totalPages: %@, totalPagesAlreadyResident %@)", (uint8_t *)&v21, 0x20u);
    }
  }

}

+ (void)sendStopSignalForResource:(id)a3
{
  cgm::token_generation_inference::common::logging::CGMTGILogger *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (cgm::token_generation_inference::common::logging::CGMTGILogger *)a3;
  cgm::token_generation_inference::common::logging::CGMTGILogger::GENERAL(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[cgm::token_generation_inference::common::logging::CGMTGILogger path](v3, "path");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v11 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_248CAA000, v4, OS_LOG_TYPE_INFO, "Sending ANE stop session signal for resource at path %s", buf, 0xCu);

  }
  -[cgm::token_generation_inference::common::logging::CGMTGILogger path](v3, "path", CFSTR("ANEClientModelAssetPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  sendAneSignal();
}

- (TGIE5ANESessionObjC)initWithResourceURL:(id)a3 useEnergyEfficientMode:(BOOL)a4 assetIdentifier:(id)a5
{
  id v9;
  id v10;
  TGIE5ANESessionObjC *v11;
  TGIE5ANESessionObjC *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TGIE5ANESessionObjC;
  v11 = -[TGIE5ANESessionObjC init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_resourceURL, a3);
    v12->_useEnergyEfficientMode = a4;
    objc_storeStrong((id *)&v12->_assetIdentifier, a5);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TGIE5ANESessionObjC resourceURL](self, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TGIE5ANESessionObjC sendStopSignalForResource:](TGIE5ANESessionObjC, "sendStopSignalForResource:", v3);

  v4.receiver = self;
  v4.super_class = (Class)TGIE5ANESessionObjC;
  -[TGIE5ANESessionObjC dealloc](&v4, sel_dealloc);
}

- (void)resume
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[TGIE5ANESessionObjC resourceURL](self, "resourceURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TGIE5ANESessionObjC useEnergyEfficientMode](self, "useEnergyEfficientMode");
  -[TGIE5ANESessionObjC assetIdentifier](self, "assetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TGIE5ANESessionObjC sendStartSignalForResource:useEnergyEfficientMode:assetIdentifier:](TGIE5ANESessionObjC, "sendStartSignalForResource:useEnergyEfficientMode:assetIdentifier:", v5, v3, v4);

}

- (void)stop
{
  id v2;

  -[TGIE5ANESessionObjC resourceURL](self, "resourceURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[TGIE5ANESessionObjC sendStopSignalForResource:](TGIE5ANESessionObjC, "sendStopSignalForResource:");

}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (BOOL)useEnergyEfficientMode
{
  return self->_useEnergyEfficientMode;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end
