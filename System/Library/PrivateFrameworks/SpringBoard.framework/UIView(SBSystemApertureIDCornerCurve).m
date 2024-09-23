@implementation UIView(SBSystemApertureIDCornerCurve)

- (id)sb_cornerCurveFloatAnimatableProperty
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, "com.apple.SpringBoardFramework.SBSystemApertureIDCornerCurve.floatAnimatableProperty");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CEABC0]);
    objc_msgSend(v2, "setVelocityUsableForVFD:", 1);
    objc_msgSend(a1, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cornerRadius");
    objc_msgSend(v2, "setValue:");

    objc_setAssociatedObject(a1, "com.apple.SpringBoardFramework.SBSystemApertureIDCornerCurve.floatAnimatableProperty", v2, (void *)1);
    objc_initWeak(&location, v2);
    objc_initWeak(&from, a1);
    v4 = (void *)MEMORY[0x1E0CEABB0];
    v16[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke;
    v11[3] = &unk_1E8EAB5B8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke_2;
    v8[3] = &unk_1E8EA6EF8;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    v8[4] = a1;
    objc_msgSend(v4, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v5, v11, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setIDCornerRadius:()SBSystemApertureIDCornerCurve
{
  id v3;

  objc_msgSend(a1, "sb_cornerCurveFloatAnimatableProperty");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:", a2);

}

- (double)IDCornerRadius
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "sb_cornerCurveFloatAnimatableProperty");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "value");
  v3 = v2;

  return v3;
}

@end
