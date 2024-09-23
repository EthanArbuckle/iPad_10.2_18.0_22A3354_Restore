@implementation PUAutoEnhanceAdjustmentCustomBehavior

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 setEnabled:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  void (**v27)(_QWORD);

  v7 = a5;
  v8 = a3;
  v9 = (void (**)(_QWORD))a6;
  objc_msgSend(v8, "autoEnhanceController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isBusy") & 1) == 0)
  {
    v12 = objc_msgSend(MEMORY[0x1E0D7CAC0], "isAutoEnhanceEnabledForCompositionController:", v11);
    if ((v12 & 1) != 0 || !v7)
    {
      if (v12)
      {
        if (!v7)
        {
          objc_msgSend(v8, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "willModifyAdjustment");

          objc_msgSend(v10, "disableAutoEnhanceOnCompositionController:", v11);
          objc_msgSend(v8, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          PULocalizedString(CFSTR("MENU_ITEM_TITLE_REMOVE_AUTO_ENHANCEMENTS"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "didModifyAdjustmentWithLocalizedName:", v21);

          if (v9)
            v9[2](v9);
        }
      }
    }
    else
    {
      objc_msgSend(v8, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "willModifyAdjustment");

      objc_msgSend(v8, "_resetEnabledStateForAutoEnhancedInfos");
      objc_msgSend(v11, "whiteBalanceAdjustmentController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "warmFace");

      objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71468]);
      objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71460]);
      if (v15)
        objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x1E0D71488]);
      objc_msgSend(v11, "removeAdjustmentWithKey:", *MEMORY[0x1E0D713E0]);
      objc_msgSend(v8, "valuesCalculator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __96__PUAutoEnhanceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke;
      v25 = &unk_1E58AB968;
      v17 = v8;
      v26 = v17;
      v27 = v9;
      objc_msgSend(v10, "enableAutoEnhanceOnCompositionController:valuesCalculator:completionHandler:", v11, v16, &v22);

      objc_msgSend(v17, "delegate", v22, v23, v24, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "autoEnhanceActionStateChanged");

    }
  }

}

- (PUAdjustmentsDataSource)dataSource
{
  return (PUAdjustmentsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __96__PUAutoEnhanceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("MENU_ITEM_TITLE_AUTO_ENHANCE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didModifyAdjustmentWithLocalizedName:", v3);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoEnhanceActionStateChanged");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
