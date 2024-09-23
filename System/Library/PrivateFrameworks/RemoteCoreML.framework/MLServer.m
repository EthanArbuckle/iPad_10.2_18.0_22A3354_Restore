@implementation MLServer

void __29___MLServer_initWithOptions___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  NSObject *v13;
  NSObject *v14;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[_MLLog serverFramework](_MLLog, "serverFramework");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __29___MLServer_initWithOptions___block_invoke_cold_2(a1);

    objc_msgSend(WeakRetained, "doReceive:context:isComplete:error:", v9, v10, a4, v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __29___MLServer_initWithOptions___block_invoke_cold_1(a1, v14);

  }
}

uint64_t __48___MLServer_doReceive_context_isComplete_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  NSObject *v10;

  objc_msgSend(*(id *)(a1 + 32), "packet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBytes:length:", a4, a5);

  +[_MLLog serverFramework](_MLLog, "serverFramework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __48___MLServer_doReceive_context_isComplete_error___block_invoke_cold_1(a1);

  return 1;
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  size_t v29;
  size_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t (**v38)(_QWORD, _QWORD, _QWORD);
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "packet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_MLNetworkHeaderEncoding isHeaderAcknowledgeSucessData:](_MLNetworkHeaderEncoding, "isHeaderAcknowledgeSucessData:", objc_msgSend(v2, "command"));

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "packet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[_MLNetworkHeaderEncoding isHeaderLoad:](_MLNetworkHeaderEncoding, "isHeaderLoad:", objc_msgSend(v4, "command"));

    if (v5)
    {
      +[_MLLog serverFramework](_MLLog, "serverFramework");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_1(a1);

      objc_msgSend(*(id *)(a1 + 32), "loadFunction");
      v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8 = (id)v7[2](v7, 0, 0);
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "packet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[_MLNetworkHeaderEncoding isHeaderUnLoad:](_MLNetworkHeaderEncoding, "isHeaderUnLoad:", objc_msgSend(v9, "command"));

    if (v10)
    {
      +[_MLLog serverFramework](_MLLog, "serverFramework");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_2(a1);

      objc_msgSend(*(id *)(a1 + 32), "unLoadFunction");
      v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "packet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "buffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)((uint64_t (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v13);

      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "packet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[_MLNetworkHeaderEncoding isHeaderPredictFeature:](_MLNetworkHeaderEncoding, "isHeaderPredictFeature:", objc_msgSend(v16, "command"));

    if (v17)
    {
      +[_MLLog serverFramework](_MLLog, "serverFramework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_3(a1);

      objc_msgSend(*(id *)(a1 + 32), "predictFunction");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "packet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "buffer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      +[_MLNetworkHeaderEncoding predictFeature:](_MLNetworkHeaderEncoding, "predictFeature:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "nwObj");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendData:", v23);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "packet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = +[_MLNetworkHeaderEncoding isHeaderText:](_MLNetworkHeaderEncoding, "isHeaderText:", objc_msgSend(v25, "command"));

      if (v26)
      {
        objc_msgSend(*(id *)(a1 + 32), "packet");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "buffer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = +[_MLNetworkHeaderEncoding getHeaderDataSize:](_MLNetworkHeaderEncoding, "getHeaderDataSize:", v28);

        if (8 * v29 + 8 >= 0x200)
          v30 = 512;
        else
          v30 = 8 * v29 + 8;
        bzero((char *)v42 - ((8 * v29 + 23) & 0xFFFFFFFFFFFFFFF0), v30);
        objc_msgSend(*(id *)(a1 + 32), "packet");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "buffer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        strlcpy((char *)v42 - ((8 * v29 + 23) & 0xFFFFFFFFFFFFFFF0), (const char *)+[_MLNetworkHeaderEncoding getHeaderDataStart:](_MLNetworkHeaderEncoding, "getHeaderDataStart:", v32), v29);

        objc_msgSend(*(id *)(a1 + 32), "packet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "buffer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = +[_MLNetworkHeaderEncoding getHeaderDataStart:](_MLNetworkHeaderEncoding, "getHeaderDataStart:", v34);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MLLog serverFramework](_MLLog, "serverFramework");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_4(a1);

        objc_msgSend(*(id *)(a1 + 32), "textFunction");
        v38 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v39 = (id)((uint64_t (**)(_QWORD, _QWORD, void *))v38)[2](v38, 0, v36);

        +[_MLNetworkHeaderEncoding acknowledgeSucessData](_MLNetworkHeaderEncoding, "acknowledgeSucessData");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "nwObj");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sendData:", v40);

      }
    }
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "packet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resetDoubleBuffer");

}

void __29___MLServer_initWithOptions___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  const char *v3;
  void *v4;
  uint8_t v5[24];

  v3 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_229FCB000, a2, OS_LOG_TYPE_ERROR, "%@: connection lost", v5, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

void __29___MLServer_initWithOptions___block_invoke_cold_2(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v3, v4, "%@: server callback", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_cold_1(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_229FCB000, v3, v4, "%@: Incoming Packet size = %lu ", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_1(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v3, v4, "%@: Load", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_2(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v3, v4, "%@: Call Unload", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_3(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v3, v4, "%@: Call Prediction", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_4(uint64_t a1)
{
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_229FCB000, v3, v4, "%@: Decoded Text: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
