@implementation PEAdjustmentExposure

- (PEAdjustmentExposure)initWithModifier:(id)a3
{
  id v4;
  PEAdjustmentExposure *v5;
  void *v6;
  id modifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentExposure;
  v5 = -[PEAdjustmentExposure init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    modifier = v5->_modifier;
    v5->_modifier = v6;

  }
  return v5;
}

- (int64_t)category
{
  return 1;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v8;
  void (**v9)(id, uint64_t, _QWORD);
  _QWORD v10[5];

  v8 = *MEMORY[0x24BE71F28];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __123__PEAdjustmentExposure_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v10[3] = &unk_24C6182B8;
  v10[4] = self;
  v9 = (void (**)(id, uint64_t, _QWORD))a7;
  objc_msgSend(a3, "modifyAdjustmentWithKey:modificationBlock:", v8, v10);
  v9[2](v9, 1, 0);

}

- (id)modifier
{
  return self->_modifier;
}

- (void)setModifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modifier, 0);
}

void __123__PEAdjustmentExposure_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  double (**v3)(_QWORD);
  double v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "modifier");
  v3 = (double (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offsetExposure");
  v4 = v3[2](v3);

  objc_msgSend(v5, "setOffsetExposure:", fmax(fmin(v4, 1.0), -1.0));
}

@end
