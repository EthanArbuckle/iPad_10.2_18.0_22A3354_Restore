@implementation VGExpressionIsBlinkFilter

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
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;

  +[VGExpressionFilterLegacy getBlendshapes:](VGExpressionFilterLegacy, "getBlendshapes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    LODWORD(v6) = *v5;
    LODWORD(v7) = 1050253722;
    LODWORD(v8) = 1051931443;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v6, v7, v8);
    v10 = v9;
    LODWORD(v11) = v5[1];
    LODWORD(v12) = 1050253722;
    LODWORD(v13) = 1051931443;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v11, v12, v13);
    LODWORD(v15) = v5[v10 <= v14];
    LODWORD(v16) = 1050253722;
    LODWORD(v17) = 1051931443;
    +[VGExpressionFilterLegacy clip_to_01:min_val:max_val:](VGExpressionFilterLegacy, "clip_to_01:min_val:max_val:", v15, v16, v17);
    v19 = v18;
  }
  else
  {
    v19 = 0.0;
  }

  return v19;
}

@end
