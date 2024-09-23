@implementation PKPrinterTool

void __36__PKPrinterTool_Client_sharedClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[PKPrinterTool_Client sharedClient]::sSharedClient;
  +[PKPrinterTool_Client sharedClient]::sSharedClient = v0;

}

void __37__PKPrinterTool_Client_ptConn_locked__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _PKLogCategory(PKLogCategoryDefault[0]);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_220F9A000, v2, OS_LOG_TYPE_DEFAULT, "PrinterTool connection %@ invalidated", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

  }
}

void __37__PKPrinterTool_Client_ptConn_locked__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _PKLogCategory(PKLogCategoryDefault[0]);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_220F9A000, v2, OS_LOG_TYPE_DEFAULT, "PrinterTool connection %@ interrupted", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");

}

void __55__PKPrinterTool_Client_getRecentJobsCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__PKPrinterTool_Client_getJobUpdateStatus_includeThumbnail_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__PKPrinterTool_Client_getLastUsedPrintersForCurrentNetworkCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__PKPrinterTool_Client_getiCloudPrintersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__PKPrinterTool_Client_logiCloudPrintersCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__PKPrinterTool_Client_browseInfoForPrinter_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__PKPrinterTool_Client_endpointResolve_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__PKPrinterTool_Client_printerTool_realPathForTmp___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __95__PKPrinterTool_Client_printerTool_getPrinterDescription_assertReachability_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    +[PKIPP responseFromData:](PKIPP, "responseFromData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __71__PKPrinterTool_Client_printerTool_checkAccessState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__PKPrinterTool_Client_startStreamingRequest_printSettings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__PKPrinterTool_Client_finishRequestWithCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v3;

  v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
