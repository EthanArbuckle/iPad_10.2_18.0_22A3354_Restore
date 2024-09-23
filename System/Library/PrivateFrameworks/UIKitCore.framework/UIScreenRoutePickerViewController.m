@implementation UIScreenRoutePickerViewController

uint64_t __45___UIScreenRoutePickerViewController_dealloc__block_invoke()
{
  return objc_opt_class();
}

void __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "remoteViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serviceViewControllerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invalidate");

}

void __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  dispatch_semaphore_t *WeakRetained;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = a3;
  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "setPublicController:", WeakRetained);
  objc_msgSend(v7, "serviceViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
  {
    v10 = objc_opt_class();
    NSLog(CFSTR("Remote view controller error while displaying %@: %@"), v10, v6);
    -[dispatch_semaphore_t _endDelayingPresentation](WeakRetained, "_endDelayingPresentation");
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_3;
    v11[3] = &unk_1E16CBA40;
    v11[4] = WeakRetained;
    objc_msgSend(v9, "_prepareForDisplayWithCompletion:", v11);
  }
  dispatch_semaphore_signal(WeakRetained[123]);

}

uint64_t __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_3(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  double v7;

  v6 = objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle");
  v7 = 0.0;
  if (v6 == 7)
    v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v7, a3);
  return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
}

void __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke(uint64_t a1)
{
  int has_internal_diagnostics;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 984), 0xFFFFFFFFFFFFFFFFLL);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Failed to get remote view controller for disconnect", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v7 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_0;
    if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Failed to get remote view controller for disconnect", buf, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke_19;
  v9[3] = &unk_1E16B1B28;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "_disconnectRouteWithCompletion:", v9);

}

id __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke_19()
{
  return (id)objc_opt_self();
}

void __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke(uint64_t a1)
{
  int has_internal_diagnostics;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 984), 0xFFFFFFFFFFFFFFFFLL);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Failed to get remote view controller for disconnect", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v8 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category;
    if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Failed to get remote view controller for disconnect", buf, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke_20;
  v10[3] = &unk_1E16B1B28;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "_setCurrentOutputDeviceEnabled:completion:", v6, v10);

}

id __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke_20()
{
  return (id)objc_opt_self();
}

@end
