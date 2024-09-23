@implementation UIColorPickerRVCHostingImpl

void __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[6];
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    if (!v10 || v9)
    {
      if (*(uint64_t *)(a1 + 48) < 1)
      {
        v20 = _UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_1;
        if (!_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_1)
        {
          v20 = __UILogCategoryGetNode("UIColorPicker", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_1);
        }
        v21 = *(NSObject **)(v20 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = v21;
          objc_msgSend(v9, "localizedDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v23;
          _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Error launching extension: %{public}@", buf, 0xCu);

        }
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIColorPickerRVCHostingImpl _tryLaunchingExtension:]_block_invoke");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIColorPickerRVCHostingImpl.m"), 84, CFSTR("Cannot load extension’s view controller."));

        }
      }
      else
      {
        v18 = dispatch_time(0, 500000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_3;
        block[3] = &unk_1E16B1888;
        v19 = *(_QWORD *)(a1 + 48);
        block[4] = v13;
        block[5] = v19;
        dispatch_after(v18, MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "setRemoteViewController:", v10);
      objc_msgSend(v10, "set_delegate:", v13);
      objc_msgSend(v13, "setExtensionRequestIdentifier:", v7);
      objc_msgSend(v10, "serviceViewControllerProxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "delegateColorPickerViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setChildViewController:", v10);
      objc_msgSend(v15, "_selectedColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRemoteSelectedColor:", v16);

      objc_msgSend(v15, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setRemoteConfiguration:", v17);

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_2;
      v27[3] = &unk_1E16B3F40;
      objc_copyWeak(&v28, v11);
      objc_msgSend(v14, "_prepareForDisplayWithCompletion:", v27);
      objc_destroyWeak(&v28);

    }
  }

}

void __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegateColorPickerViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_endDelayingPresentation");

}

uint64_t __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tryLaunchingExtension:", *(_QWORD *)(a1 + 40) - 1);
}

@end
