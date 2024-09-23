@implementation MCDContentManager

void __56___MCDContentManager_tableView_didSelectRowAtIndexPath___block_invoke(id a1, BOOL a2)
{
  _BOOL4 v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;

  v2 = a2;
  v3 = soft_MCDMusicGeneralLogging_5();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Unsuccessfully");
    if (v2)
      v5 = CFSTR("Successfully");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Activated Siri %@", (uint8_t *)&v6, 0xCu);
  }

}

void __37___MCDContentManager__performRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_processResponse:error:", v6, v5);

}

void __45___MCDContentManager__processResponse_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "contentManager:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id __45___MCDContentManager__processResponse_error___block_invoke_97(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "modelResponseDidInvalidate:", MPModelResponseDidInvalidateNotification, 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "contentManager:didReceiveResponse:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v5, "contentManager:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  result = objc_msgSend(*(id *)(a1 + 40), "isValid");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_performRequest");
  return result;
}

@end
