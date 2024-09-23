@implementation PIEffectAdjustmentController

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  unsigned __int8 v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController intensityKey](PIEffectAdjustmentController, "intensityKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v9, "doubleValue");
    v14 = v13;
    objc_msgSend(v10, "doubleValue");
    v16 = round(v14 * 100.0) == round(v15 * 100.0);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PIEffectAdjustmentController;
    v16 = -[PIAdjustmentController isSettingEqual:forKey:](&v18, sel_isSettingEqual_forKey_, v6, v7);
  }

  return v16;
}

- (void)setKind:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController kindKey](PIEffectAdjustmentController, "kindKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSString)kind
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController kindKey](PIEffectAdjustmentController, "kindKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController versionKey](PIEffectAdjustmentController, "versionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (int64_t)version
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController versionKey](PIEffectAdjustmentController, "versionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (void)setIntensity:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController intensityKey](PIEffectAdjustmentController, "intensityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)intensity
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  float v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIEffectAdjustmentController intensityKey](PIEffectAdjustmentController, "intensityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "floatValue");
    v5 = v6;
  }

  return v5;
}

+ (id)intensityKey
{
  return CFSTR("intensity");
}

+ (id)kindKey
{
  return CFSTR("kind");
}

+ (id)versionKey
{
  return CFSTR("version");
}

@end
