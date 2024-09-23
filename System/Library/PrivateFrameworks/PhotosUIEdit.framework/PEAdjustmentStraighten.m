@implementation PEAdjustmentStraighten

- (int64_t)category
{
  return 7;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  const __CFString **v29;
  uint64_t *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[9];
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  _QWORD v38[2];
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v38[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, _QWORD))a7;
  objc_msgSend(a4, "autoCropValuesWithAccuracy:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("angle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("xOrigin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("yOrigin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("width"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("height"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    v39.origin.x = v17;
    v39.origin.y = v20;
    v39.size.width = v23;
    v39.size.height = v26;
    if (!CGRectIsEmpty(v39))
    {
      v40.origin.x = v17;
      v40.origin.y = v20;
      v40.size.width = v23;
      v40.size.height = v26;
      if (!CGRectIsNull(v40))
      {
        v41.origin.x = v17;
        v41.origin.y = v20;
        v41.size.width = v23;
        v41.size.height = v26;
        if (!CGRectIsInfinite(v41))
        {
          v33 = *MEMORY[0x24BE71DA0];
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __125__PEAdjustmentStraighten_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
          v34[3] = &__block_descriptor_72_e36_v16__0__PICropAdjustmentController_8l;
          *(CGFloat *)&v34[4] = v17;
          *(CGFloat *)&v34[5] = v20;
          *(CGFloat *)&v34[6] = v23;
          *(CGFloat *)&v34[7] = v26;
          v34[8] = v14;
          objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v33, v34);
          v10[2](v10, 1, 0);
          goto LABEL_8;
        }
      }
    }
    v27 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0BA0];
    v36 = CFSTR("Auto straighten failed with invalid crop rect");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = &v36;
    v30 = &v35;
  }
  else
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0BA0];
    v38[0] = CFSTR("Auto straighten failed");
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = (const __CFString **)v38;
    v30 = &v37;
  }
  objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentStraightenErrorDomain"), 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v32);

LABEL_8:
}

void __125__PEAdjustmentStraighten_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  objc_msgSend(v7, "setAngle:", a1[8]);
  objc_msgSend(v7, "setEnabled:", 1);
  objc_msgSend(v7, "setIsAuto:", 1);
  objc_msgSend(v7, "setConstraintWidth:", 0);
  objc_msgSend(v7, "setConstraintHeight:", 0);

}

@end
