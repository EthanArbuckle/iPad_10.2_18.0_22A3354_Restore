@implementation VGExpressionIsEyesNeutralOpenFilter

- (int)rejectionReason
{
  return 17;
}

- (VGExpressionIsEyesNeutralOpenFilter)initWithEyesOpenSensitivity:(float)a3
{
  VGExpressionIsEyesNeutralOpenFilter *v4;
  VGExpressionIsEyesNeutralOpenFilter *v5;
  VGExpressionIsEyesNeutralOpenFilter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VGExpressionIsEyesNeutralOpenFilter;
  v4 = -[VGExpressionIsEyesNeutralOpenFilter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_eyesOpenSensitivity = a3;
    v6 = v4;
  }

  return v5;
}

- (float)filter:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  float v11;
  float v12;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v10 = 0;
    v11 = 1.1755e-38;
    do
    {
      LODWORD(v7) = *(_DWORD *)(v6 + v10);
      *(float *)&v9 = self->_eyesOpenSensitivity;
      LODWORD(v8) = 0;
      +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v7, v8, v9);
      if (v11 < *(float *)&v7)
        v11 = *(float *)&v7;
      v10 += 4;
    }
    while (v10 != 16);
    v12 = 1.0 - v11;
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

@end
