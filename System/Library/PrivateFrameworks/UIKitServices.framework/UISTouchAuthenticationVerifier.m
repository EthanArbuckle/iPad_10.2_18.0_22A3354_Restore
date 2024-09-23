@implementation UISTouchAuthenticationVerifier

UISTransform3DGrader *__89___UISTouchAuthenticationVerifier_initWithBuildOverrideThresholds_runOverrideThresholds___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  UISTransform3DGrader *v8;
  void *v9;
  int v10;
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(UISTransform3DGrader);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("mayHaveCatalystPadIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v12[0] = xmmword_190895950;
    -[UISTransform3DGrader allowScales:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:](v8, "allowScales:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:", v12, 2, a3, 0.0, a4, 0.0);
    v13 = xmmword_190895960;
    -[UISTransform3DGrader allowRotations:count:](v8, "allowRotations:count:", &v13, 2);
    -[UISTransform3DGrader allowHorizontalFlip:](v8, "allowHorizontalFlip:", 1);
  }
  else
  {
    *(_QWORD *)&v13 = 0x3FF0000000000000;
    -[UISTransform3DGrader allowScales:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:](v8, "allowScales:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:", &v13, 1, a3, 0.0, a4, 0.0);
    if (a2)
    {
      v12[0] = xmmword_190895970;
      v12[1] = unk_190895980;
      -[UISTransform3DGrader allowRotations:count:](v8, "allowRotations:count:", v12, 4);
    }
  }
  return v8;
}

@end
