@implementation PEAdjustmentCrop

- (PEAdjustmentCrop)initWithModifier:(id)a3
{
  id v4;
  PEAdjustmentCrop *v5;
  void *v6;
  id modifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentCrop;
  v5 = -[PEAdjustmentCrop init](&v9, sel_init);
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
  return 6;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double (**v24)(double, double);
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  _QWORD v58[10];
  uint64_t v59;
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v66 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, _QWORD))a7;
  v11 = objc_alloc(MEMORY[0x24BE6C398]);
  objc_msgSend(v9, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithComposition:", v12);

  v59 = 0;
  objc_msgSend(v13, "submitSynchronous:", &v59);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "geometry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "extent");
    NUPixelRectToCGRect();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[PEAdjustmentCrop modifier](self, "modifier");
    v24 = (double (**)(double, double))objc_claimAutoreleasedReturnValue();
    v25 = v24[2](v21, v23);
    v27 = v26;

    if (v21 == 0.0
      || v23 == 0.0
      || (v21 == *MEMORY[0x24BE71BF0] ? (v28 = v23 == *(double *)(MEMORY[0x24BE71BF0] + 8)) : (v28 = 0), v28))
    {
      v29 = 1.0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        v61 = v21;
        v62 = 2048;
        v63 = v23;
        v64 = 2048;
        v65 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_20D13D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
    }
    else
    {
      v29 = fabs(v21 / v23);
    }
    if (v25 == 0.0 || v27 == 0.0 || v25 == *MEMORY[0x24BE71BF0] && v27 == *(double *)(MEMORY[0x24BE71BF0] + 8))
    {
      v30 = 1.0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        v61 = v25;
        v62 = 2048;
        v63 = v27;
        v64 = 2048;
        v65 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_20D13D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
    }
    else
    {
      v30 = fabs(v25 / v27);
    }
    if (vabdd_f64(v30, v29) > 0.00000999999975)
    {
      v57 = v27;
      v31 = v17 + v21 * 0.5;
      v32 = v19 + v23 * 0.5;
      PFSizeWithAspectRatioFittingSize();
      v34 = v33;
      v36 = v35;
      v37 = v31 + v33 * -0.5;
      v38 = v32 + v35 * -0.5;
      objc_msgSend(v15, "orientation");
      NUOrientationInverse();
      if (NUOrientationIsValid())
      {
        NUPixelSizeFromCGSize();
        NUOrientationTransformRect();
        v37 = v39;
        v38 = v40;
        v34 = v41;
        v36 = v42;
      }
      objc_msgSend(v9, "cropAdjustmentController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "cropRect");
      v45 = v44;
      v47 = v46;

      v67.origin.x = v37;
      v67.origin.y = v38;
      v67.size.width = v34;
      v67.size.height = v36;
      v68 = CGRectOffset(v67, v45, v47);
      x = v68.origin.x;
      y = v68.origin.y;
      width = v68.size.width;
      height = v68.size.height;
      if (((uint64_t)v25 | (uint64_t)v57) < 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("NUGeometryPrimitives.h"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(width >= 0) && (height >= 0)"));

      }
      v52 = NUOrientationTransformImageSize();
      v53 = *MEMORY[0x24BE71DA0];
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __119__PEAdjustmentCrop_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
      v58[3] = &__block_descriptor_80_e36_v16__0__PICropAdjustmentController_8l;
      *(CGFloat *)&v58[4] = x;
      *(CGFloat *)&v58[5] = y;
      *(CGFloat *)&v58[6] = width;
      *(CGFloat *)&v58[7] = height;
      v58[8] = v52;
      v58[9] = v54;
      objc_msgSend(v9, "modifyAdjustmentWithKey:modificationBlock:", v53, v58);
    }
    v10[2](v10, 1, 0);
  }

}

- (CGSize)aspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_aspectRatio.width;
  height = self->_aspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAspectRatio:(CGSize)a3
{
  self->_aspectRatio = a3;
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

void __119__PEAdjustmentCrop_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(double *a1, void *a2)
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
  objc_msgSend(v7, "setConstraintWidth:", *((_QWORD *)a1 + 8));
  objc_msgSend(v7, "setConstraintHeight:", *((_QWORD *)a1 + 9));
  objc_msgSend(v7, "setIsAuto:", 0);
  objc_msgSend(v7, "setEnabled:", 1);

}

@end
