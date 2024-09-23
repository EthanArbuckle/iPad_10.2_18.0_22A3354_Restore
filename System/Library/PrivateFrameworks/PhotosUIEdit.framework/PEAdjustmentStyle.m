@implementation PEAdjustmentStyle

- (PEAdjustmentStyle)initWithStyleCast:(id)a3 intensity:(double)a4
{
  id v7;
  PEAdjustmentStyle *v8;
  PEAdjustmentStyle *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PEAdjustmentStyle;
  v8 = -[PEAdjustmentStyle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_styleCast, a3);
    v9->_intensity = a4;
  }

  return v9;
}

- (int64_t)category
{
  return 5;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  PEAdjustmentStyle *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a7;
  if ((PISemanticStyleIsRenderSupported() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentStyleErrorDomain"), 2, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12[2](v12, 0, v20);

    goto LABEL_7;
  }
  objc_msgSend(v11, "semanticStyleStatistics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0BA0];
    v29[0] = CFSTR("PEAdjustmentStyle failed due to incompatible asset");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentStyleErrorDomain"), 1, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  -[PEAdjustmentStyle styleCast](self, "styleCast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71CE8], "defaultValuesForCast:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BE71E78];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __120__PEAdjustmentStyle_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
  v23[3] = &unk_24C618A70;
  v24 = v11;
  v25 = v15;
  v26 = self;
  v27 = v16;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", v17, v23);
  v12[2](v12, 1, 0);

LABEL_7:
}

- (NSString)styleCast
{
  return self->_styleCast;
}

- (void)setStyleCast:(id)a3
{
  objc_storeStrong((id *)&self->_styleCast, a3);
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleCast, 0);
}

void __120__PEAdjustmentStyle_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  float v6;
  float v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updateAdjustmentSemanticStyleStatistics:", v4);
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(v4, "setCast:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "intensity");
  objc_msgSend(v4, "setIntensity:");
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v4, "setTone:", v6);

  objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v4, "setColor:", v7);

}

@end
