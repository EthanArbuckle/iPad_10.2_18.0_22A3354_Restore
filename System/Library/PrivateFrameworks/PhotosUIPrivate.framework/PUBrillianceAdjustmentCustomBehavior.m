@implementation PUBrillianceAdjustmentCustomBehavior

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 setEnabled:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "willModifyAdjustment");

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke;
  v16[3] = &unk_1E58ABAF0;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[PUBrillianceAdjustmentCustomBehavior populateSmartToneStatisticsForDataSource:adjustmentInfo:completionHandler:](self, "populateSmartToneStatisticsForDataSource:adjustmentInfo:completionHandler:", v15, v14, v16);

}

- (void)dataSource:(id)a3 adjustmentInfo:(id)a4 modifyValue:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "setCurrentLevel:", a5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_modifyValue___block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PUBrillianceAdjustmentCustomBehavior populateSmartToneStatisticsForDataSource:adjustmentInfo:completionHandler:](self, "populateSmartToneStatisticsForDataSource:adjustmentInfo:completionHandler:", v11, v10, v12);

}

- (void)populateSmartToneStatisticsForDataSource:(id)a3 adjustmentInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  PUBrillianceAdjustmentCustomBehavior *v18;
  void (**v19)(_QWORD);

  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "compositionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "smartToneAdjustmentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "statistics"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else if (!-[PUBrillianceAdjustmentCustomBehavior calculatingStatistics](self, "calculatingStatistics"))
  {
    -[PUBrillianceAdjustmentCustomBehavior setCalculatingStatistics:](self, "setCalculatingStatistics:", 1);
    objc_msgSend(v7, "autoEnhanceController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "compositionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valuesCalculator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke;
    v16[3] = &unk_1E58ABAF0;
    v17 = v7;
    v18 = self;
    v19 = v8;
    objc_msgSend(v13, "calculateStatisticsForCompositionController:valuesCalculator:completionHandler:", v14, v15, v16);

    goto LABEL_8;
  }
  if (v8)
    v8[2](v8);
LABEL_8:

}

- (BOOL)calculatingStatistics
{
  return self->_calculatingStatistics;
}

- (void)setCalculatingStatistics:(BOOL)a3
{
  self->_calculatingStatistics = a3;
}

void __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentConstants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PISmartToneAdjustmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke_2;
  v7[3] = &unk_1E589BB68;
  v8 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  objc_msgSend(v2, "modifyAdjustmentWithKey:modificationBlock:", v5, v7);

}

uint64_t __114__PUBrillianceAdjustmentCustomBehavior_populateSmartToneStatisticsForDataSource_adjustmentInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valuesCalculator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAdjustmentSmartToneStatistics:withAccuracy:", v4, 0);

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "setCalculatingStatistics:", 0);
}

uint64_t __78__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_modifyValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyAdjustmentForInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __95__PUBrillianceAdjustmentCustomBehavior_dataSource_adjustmentInfo_setEnabled_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_modifyAdjustmentForInfo:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedActionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didModifyAdjustmentWithLocalizedName:", v3);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
