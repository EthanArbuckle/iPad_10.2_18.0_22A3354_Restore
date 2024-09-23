@implementation PIDepthAdjustmentController

- (PIDepthAdjustmentController)initWithAdjustment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PIDepthAdjustmentController;
  return -[PIAdjustmentController initWithAdjustment:](&v4, sel_initWithAdjustment_, a3);
}

- (BOOL)canRenderDepth
{
  void *v2;
  BOOL v3;

  -[PIDepthAdjustmentController depthInfo](self, "depthInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)canAdjustApertureValue
{
  double v3;
  double v4;

  -[PIDepthAdjustmentController minimumAperture](self, "minimumAperture");
  if (v3 <= 0.0)
    return 0;
  -[PIDepthAdjustmentController maximumAperture](self, "maximumAperture");
  return v4 > 0.0;
}

- (double)minimumAperture
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[PIDepthAdjustmentController depthInfo](self, "depthInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("minimumAperture"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)maximumAperture
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[PIDepthAdjustmentController depthInfo](self, "depthInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("maximumAperture"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setDepthInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController depthInfoKey](PIDepthAdjustmentController, "depthInfoKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSDictionary)depthInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController depthInfoKey](PIDepthAdjustmentController, "depthInfoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setAperture:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController apertureKey](PIDepthAdjustmentController, "apertureKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)aperture
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController apertureKey](PIDepthAdjustmentController, "apertureKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (id)capturedAperture
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController depthInfoKey](PIDepthAdjustmentController, "depthInfoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capturedAperture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setFocusRect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController focusRectKey](PIDepthAdjustmentController, "focusRectKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v5);

}

- (NSDictionary)focusRect
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController focusRectKey](PIDepthAdjustmentController, "focusRectKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)capturedFocusRect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController depthInfoKey](PIDepthAdjustmentController, "depthInfoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focusRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setGlassesMatteAllowed:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "BOOLValue");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController glassesMatteAllowedKey](PIDepthAdjustmentController, "glassesMatteAllowedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = MEMORY[0x1E0C9AAB0];
    v7 = v8;
  }
  else
  {
    v7 = v8;
    v6 = 0;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSNumber)glassesMatteAllowed
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDepthAdjustmentController glassesMatteAllowedKey](PIDepthAdjustmentController, "glassesMatteAllowedKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    return (NSNumber *)MEMORY[0x1E0C9AAB0];
  else
    return 0;
}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[PIAdjustmentController enabledKey](PIAdjustmentController, "enabledKey", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  +[PIDepthAdjustmentController apertureKey](PIDepthAdjustmentController, "apertureKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)depthInfoKey
{
  return CFSTR("depthInfo");
}

+ (id)apertureKey
{
  return CFSTR("aperture");
}

+ (id)focusRectKey
{
  return CFSTR("focusRect");
}

+ (id)glassesMatteAllowedKey
{
  return CFSTR("glassesMatteAllowed");
}

@end
