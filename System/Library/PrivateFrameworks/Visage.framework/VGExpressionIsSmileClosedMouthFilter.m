@implementation VGExpressionIsSmileClosedMouthFilter

- (int)rejectionReason
{
  return 22;
}

- (float)filter:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    LODWORD(v6) = *(_DWORD *)(v5 + 120);
    LODWORD(v7) = 0.5;
    LODWORD(v8) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v6, v8, v7);
    v10 = v9;
    LODWORD(v11) = *(_DWORD *)(v5 + 124);
    LODWORD(v12) = 0.5;
    LODWORD(v13) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v11, v13, v12);
    v15 = v10 * v14;
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

@end
