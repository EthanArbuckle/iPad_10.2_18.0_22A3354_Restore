@implementation PEAdjustmentRotate

- (PEAdjustmentRotate)initWithClockwise:(BOOL)a3
{
  PEAdjustmentRotate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PEAdjustmentRotate;
  result = -[PEAdjustmentRotate init](&v5, sel_init);
  if (result)
    result->_clockwise = a3;
  return result;
}

- (int64_t)category
{
  return 8;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v13 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a7;
  v10 = (void *)objc_msgSend(v13, "copy");
  v11 = *MEMORY[0x24BE71E18];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __121__PEAdjustmentRotate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v15[3] = &unk_24C618460;
  v15[4] = self;
  objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", v11, v15);
  objc_msgSend(v10, "cropAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", *MEMORY[0x24BE71DA0], &__block_literal_global_275);
  objc_msgSend(v13, "applyChangesFromCompositionController:", v10, v13);
  v9[2](v9, 1, 0);

}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void)setClockwise:(BOOL)a3
{
  self->_clockwise = a3;
}

void __121__PEAdjustmentRotate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "orientation");
  NUOrientationIsValid();
  objc_msgSend(*(id *)(a1 + 32), "clockwise");
  objc_msgSend(v3, "setOrientation:", NUOrientationConcat());

}

void __121__PEAdjustmentRotate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  v3 = a2;
  v2 = (double)objc_msgSend(v3, "constraintWidth");
  objc_msgSend(v3, "setConstraintWidth:", objc_msgSend(v3, "constraintHeight"));
  objc_msgSend(v3, "setConstraintHeight:", (uint64_t)v2);

}

@end
