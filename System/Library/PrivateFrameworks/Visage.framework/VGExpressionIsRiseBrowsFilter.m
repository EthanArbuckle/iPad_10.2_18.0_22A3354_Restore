@implementation VGExpressionIsRiseBrowsFilter

- (float)filter:(id)a3
{
  void *v3;
  void *v4;
  _DWORD *v5;
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
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    LODWORD(v6) = v5[16];
    LODWORD(v7) = 0.5;
    LODWORD(v8) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v6, v8, v7);
    v10 = v9;
    LODWORD(v11) = v5[17];
    LODWORD(v12) = 0.5;
    LODWORD(v13) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v11, v13, v12);
    v15 = v14;
    LODWORD(v16) = v5[18];
    LODWORD(v17) = 0.5;
    LODWORD(v18) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v16, v18, v17);
    v20 = (float)(v10 * v15) * v19;
  }
  else
  {
    v20 = 0.0;
  }

  return v20;
}

@end
