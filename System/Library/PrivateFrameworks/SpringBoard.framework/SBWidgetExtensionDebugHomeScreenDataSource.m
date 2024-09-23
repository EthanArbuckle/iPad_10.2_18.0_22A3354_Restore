@implementation SBWidgetExtensionDebugHomeScreenDataSource

void __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_2;
  v7[3] = &unk_1E8EB5F48;
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v9 = v2;
  v7[4] = v3;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v10 = v6;
  SBWorkspaceForceToSpringBoard(v7);

}

uint64_t __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  SBWorkspaceSuspendActiveDisplay();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_reallyLaunchWidgetOnHomeScreen:widgetFamily:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

void __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "removeObject:", WeakRetained);

}

void __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SBLogWidgets();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke_cold_1(v3, a1, v4);

  }
}

void __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a2 + 32);
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "Tools reload error %{public}@ for container %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_20();
}

@end
