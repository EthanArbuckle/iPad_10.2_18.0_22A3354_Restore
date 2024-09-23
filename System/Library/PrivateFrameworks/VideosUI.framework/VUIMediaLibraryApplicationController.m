@implementation VUIMediaLibraryApplicationController

+ (id)defaultController
{
  if (defaultController___once_0 != -1)
    dispatch_once(&defaultController___once_0, &__block_literal_global_58);
  return (id)defaultController___defaultController_0;
}

void __57__VUIMediaLibraryApplicationController_defaultController__block_invoke()
{
  VUIMediaLibraryApplicationController *v0;
  void *v1;

  v0 = objc_alloc_init(VUIMediaLibraryApplicationController);
  v1 = (void *)defaultController___defaultController_0;
  defaultController___defaultController_0 = (uint64_t)v0;

}

- (id)settingsURL
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[VUIMediaLibraryApplicationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "settingsURLForMediaLibraryApplicationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController settingsURL].cold.1();

    v5 = 0;
  }

  return v5;
}

- (BOOL)isCellularDataForPlaybackEnabled
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;

  -[VUIMediaLibraryApplicationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isCellularDataPlaybackEnabledForMediaLibraryApplicationController:", self);
  }
  else
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController isCellularDataForPlaybackEnabled].cold.1();

    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldWarnAboutPlaybackQualityForRentalMediaItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;
  NSObject *v8;

  v4 = a3;
  -[VUIMediaLibraryApplicationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController shouldWarnAboutPlaybackQualityForRentalMediaItem:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v4, "mediaPlayerMediaItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController shouldWarnAboutPlaybackQualityForRentalMediaItem:].cold.2();

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v7 = objc_msgSend(v5, "mediaLibraryApplicationController:shouldWarnAboutPlaybackQualityForRentalMediaItem:", self, v6);
LABEL_10:

  return v7;
}

- (void)clearCellularPlaybackQualityOverrides
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No delegate has been registered! -clearCellularPlaybackQualityOverrides will be a NO-OP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)overrideCellularPlaybackQuality:(unint64_t)a3 forMediaItem:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  v6 = a4;
  -[VUIMediaLibraryApplicationController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "mediaPlayerMediaItem");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "mediaLibraryApplicationController:overrideCellularPlaybackQuality:forMediaItem:", self, a3, v8);
    }
    else
    {
      VUIDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[VUIMediaLibraryApplicationController overrideCellularPlaybackQuality:forMediaItem:].cold.2();

    }
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController shouldWarnAboutPlaybackQualityForRentalMediaItem:].cold.1();
  }

}

- (unint64_t)assetTypeForRentalMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[VUIMediaLibraryApplicationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaLibraryApplicationController:assetTypeForRentalMediaItem:", self, v4);
  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController assetTypeForRentalMediaItem:].cold.1();

  }
  return 0;
}

- (void)removeRentalMediaItem:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD aBlock[4];
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke;
  aBlock[3] = &unk_1E9F99C68;
  v14 = v7;
  v8 = v7;
  v9 = _Block_copy(aBlock);
  -[VUIMediaLibraryApplicationController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "mediaLibraryApplicationController:removeRentalMediaItem:withCompletion:", self, v6, v9);
  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VUIMediaLibraryApplicationController removeRentalMediaItem:withCompletion:].cold.1();

  }
}

void __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_get_global_queue(21, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke_2;
    block[3] = &unk_1E9F9DB98;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (VUIMediaLibraryApplicationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)settingsURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No delegate has been registered! -settingsURL will return nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)isCellularDataForPlaybackEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No delegate has been registered! -isCellularDataForPlaybackEnabled will return NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)shouldWarnAboutPlaybackQualityForRentalMediaItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No delegate has been registered! -shouldWarnAboutPlaybackSettingsForMediaIten: will return NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)shouldWarnAboutPlaybackQualityForRentalMediaItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No MPMediaItem found! Unable to check if need to warn about playback settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)overrideCellularPlaybackQuality:forMediaItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No MPMediaItem found! Unable to override cellular playback quality", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)assetTypeForRentalMediaItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No delegate has been registered! -rentalAssetTypeForMediaItem: will return VUIMediaEntityAssetTypeUndefined", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)removeRentalMediaItem:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "No delegate has been registered! -removeRentalMediaItem:withCompletion will be a no-op", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
