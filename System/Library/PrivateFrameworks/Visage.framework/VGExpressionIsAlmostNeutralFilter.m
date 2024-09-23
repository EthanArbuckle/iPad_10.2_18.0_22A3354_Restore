@implementation VGExpressionIsAlmostNeutralFilter

- (int)rejectionReason
{
  return 20;
}

- (VGExpressionIsAlmostNeutralFilter)initWithLowerBound:(float)a3 withUpperBound:(float)a4
{
  VGExpressionIsAlmostNeutralFilter *v6;
  VGExpressionIsAlmostNeutralFilter *v7;
  VGExpressionIsAlmostNeutralFilter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VGExpressionIsAlmostNeutralFilter;
  v6 = -[VGExpressionIsAlmostNeutralFilter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lowerBound = a3;
    v6->_upperBound = a4;
    v8 = v6;
  }

  return v7;
}

- (float)filter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _DWORD *v13;
  float v14;
  float v15;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    if (v8 < 0x3C)
    {
      v14 = 1.1755e-38;
    }
    else
    {
      v12 = (v8 >> 2) - 14;
      v13 = (_DWORD *)(v7 + 56);
      v14 = 1.1755e-38;
      do
      {
        LODWORD(v9) = *v13;
        *(float *)&v10 = self->_lowerBound;
        *(float *)&v11 = self->_upperBound;
        +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v9, v10, v11);
        if (v14 <= *(float *)&v9)
          v14 = *(float *)&v9;
        ++v13;
        --v12;
      }
      while (v12);
    }
    v15 = 1.0 - v14;
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

@end
