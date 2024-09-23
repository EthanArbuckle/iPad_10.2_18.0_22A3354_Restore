@implementation VGExpressionIsBrowsScrunchDownFilter

- (float)filter:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  float v10;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    v6 = objc_msgSend(objc_retainAutorelease(v3), "bytes") + 56;
    v10 = 3.4028e38;
    do
    {
      LODWORD(v7) = *(_DWORD *)(v6 + v5);
      LODWORD(v8) = 0.5;
      LODWORD(v9) = 1058642330;
      +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v7, v8, v9);
      if (v10 >= *(float *)&v7)
        v10 = *(float *)&v7;
      v5 += 4;
    }
    while (v5 != 8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

@end
