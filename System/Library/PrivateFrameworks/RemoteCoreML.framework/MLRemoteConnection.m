@implementation MLRemoteConnection

void __39___MLRemoteConnection_initWithOptions___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
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
  +[_MLLog clientFramework](_MLLog, "clientFramework");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __39___MLRemoteConnection_initWithOptions___block_invoke_cold_2(a1);

    objc_msgSend(WeakRetained, "doReceive:context:isComplete:error:", v9, v10, a4, v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __39___MLRemoteConnection_initWithOptions___block_invoke_cold_1(a1);

  }
}

uint64_t __58___MLRemoteConnection_doReceive_context_isComplete_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "packet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBytes:length:", a4, a5);

  return 1;
}

void __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "packet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    +[_MLLog clientFramework](_MLLog, "clientFramework");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke_cold_1();

    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "packet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v8);

  }
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "packet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBuffer:", v9);

}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "nwObj");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendData:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "nwOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_time(0, objc_msgSend(v3, "receiveTimeoutValue"));

  objc_msgSend(*(id *)(a1 + 32), "semaphore");
  v5 = objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = dispatch_semaphore_wait(v5, v4) != 0;

  objc_msgSend(*(id *)(a1 + 32), "packet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetDoubleBuffer");

  LODWORD(v5) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  +[_MLLog clientFramework](_MLLog, "clientFramework");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_2(a1);

    objc_msgSend(*(id *)(a1 + 32), "q");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_10;
    block[3] = &unk_24F357108;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v9, block);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_1();

  }
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_10(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nwObj");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

  objc_msgSend(*(id *)(a1 + 32), "nwObj");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartConnection");

}

void __39___MLRemoteConnection_initWithOptions___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_229FCB000, v2, v3, "%@: lost client connection", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __39___MLRemoteConnection_initWithOptions___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(&dword_229FCB000, v2, v3, "%@: Client Callback", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke_cold_1()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(*(SEL *)(v1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "packet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "length");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7(&dword_229FCB000, v5, v6, "%@: Buffer should be empty = %lu", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  int v3;
  uint8_t v4[12];
  __int16 v5;
  int v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6();
  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(v1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl(&dword_229FCB000, v0, OS_LOG_TYPE_DEBUG, "%@: Sucess NO Timeout %d", v4, 0x12u);

  OUTLINED_FUNCTION_1_1();
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_229FCB000, v2, v3, "%@: Timeout waiting for server response.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
