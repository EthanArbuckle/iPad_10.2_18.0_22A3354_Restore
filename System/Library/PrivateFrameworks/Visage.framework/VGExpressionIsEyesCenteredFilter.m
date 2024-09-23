@implementation VGExpressionIsEyesCenteredFilter

- (float)filter:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  float v10;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v9 = 0;
    v10 = 3.4028e38;
    do
    {
      LODWORD(v6) = *(_DWORD *)(v5 + v9);
      LODWORD(v7) = 0.5;
      LODWORD(v8) = 1058642330;
      +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v6, v7, v8);
      *(float *)&v6 = 1.0 - *(float *)&v6;
      if (v10 >= *(float *)&v6)
        v10 = *(float *)&v6;
      v9 += 4;
    }
    while (v9 != 56);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

@end
