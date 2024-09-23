@implementation LTClientConnection

void __57___LTClientConnection_initWithConnection_server_trusted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "cleanupOnDisconnect");
    WeakRetained = v2;
  }

}

uint64_t __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = _LTOSLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2_cold_1();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56___LTClientConnection_translate_withContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

void __56___LTClientConnection_translate_withContext_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3 && !*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      v10 = 138739971;
      v11 = v9;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "_LTTranslationService completed successfully for paragraphResult %{sensitive}@", (uint8_t *)&v10, 0xCu);
    }
    v5 = a1[4];
    v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    goto LABEL_10;
  }
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56___LTClientConnection_translate_withContext_completion___block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v3, v4);
  v5 = a1[4];
  v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v7 = v3;
  if (!v3)
LABEL_10:
    v7 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

uint64_t __66___LTClientConnection_translateParagraphs_withContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "paragraphTranslation:result:error:", a2, a3, a4);
}

uint64_t __43___LTClientConnection_assetRequestHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetResponseWithProgress:finished:error:", a2, 0, 0);
}

uint64_t __43___LTClientConnection_assetRequestHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetResponseWithProgress:finished:error:", 0, 1, a2);
}

uint64_t __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "languageStatusChangedForType:progress:observations:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), a2);
}

uint64_t __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "XPC connection was interrupted, likely because the process was killed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __56___LTClientConnection_translate_withContext_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = 138740483;
  v6 = v3;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = v4;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "_LTTranslationService for paragraphResult %{sensitive}@; got error: %@; paragraphError: %@",
    (uint8_t *)&v5,
    0x20u);
}

@end
