@implementation VGExpressionIsMouthOpenFilter

- (int)rejectionReason
{
  return 21;
}

- (float)filter:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    LODWORD(v5) = *(_DWORD *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 76);
    LODWORD(v6) = 1050253722;
    LODWORD(v7) = 0.5;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v5, v6, v7);
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

@end
