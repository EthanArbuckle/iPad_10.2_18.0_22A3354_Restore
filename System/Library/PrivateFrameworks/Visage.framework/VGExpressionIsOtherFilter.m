@implementation VGExpressionIsOtherFilter

- (float)filter:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _DWORD *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  float v11;
  unint64_t v12;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = (_DWORD *)objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v5, "length");
    if (v7 >= 4)
    {
      v12 = v7 >> 2;
      v11 = 1.1755e-38;
      do
      {
        LODWORD(v8) = *v6;
        LODWORD(v9) = 0.5;
        LODWORD(v10) = 1058642330;
        +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v8, v9, v10);
        if (v11 <= *(float *)&v8)
          v11 = *(float *)&v8;
        ++v6;
        --v12;
      }
      while (v12);
    }
    else
    {
      v11 = 1.1755e-38;
    }
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

@end
