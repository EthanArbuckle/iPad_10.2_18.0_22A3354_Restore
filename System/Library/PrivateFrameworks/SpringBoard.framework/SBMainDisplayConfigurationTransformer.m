@implementation SBMainDisplayConfigurationTransformer

+ (id)transformedMainDisplayConfigurationForConfiguration:(id)a3
{
  id v5;
  SBMainDisplayConfigurationTransformer *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  v6 = objc_alloc_init(SBMainDisplayConfigurationTransformer);
  -[SBMainDisplayConfigurationTransformer transformDisplayConfiguration:](v6, "transformDisplayConfiguration:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBMainDisplayConfigurationTransformer.m"), 22, CFSTR("Can only have a single transformed display for the main display."));

  }
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CGRect v24;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  BSCGFloatEpsilon();
  v9 = v8;
  objc_msgSend(v3, "CADisplay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 <= v9 || v5 >= 1.79769313e308 || v7 <= v9 || v7 >= 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBMainDisplayConfigurationTransformer transformDisplayConfiguration:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    NSStringFromCGRect(v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentMode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "preferredScale");
    objc_msgSend(v10, "preferredMode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "availableModes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SBMainDisplayConfigurationTransformer.m"), 62, CFSTR("We expect a valid bounds for configuration: %@; CADisplay bounds: %@; currentMode: %@; preferredScale: %lu; preferredMode: %@; availableModes: %lu"),
      v3,
      v18,
      v19,
      v21,
      v22,
      objc_msgSend(v23, "count"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
