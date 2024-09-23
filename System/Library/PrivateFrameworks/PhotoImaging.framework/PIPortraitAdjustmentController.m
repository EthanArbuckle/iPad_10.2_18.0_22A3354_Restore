@implementation PIPortraitAdjustmentController

- (PIPortraitAdjustmentController)initWithAdjustment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PIPortraitAdjustmentController;
  return -[PIAdjustmentController initWithAdjustment:](&v4, sel_initWithAdjustment_, a3);
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  unsigned __int8 v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  +[PIPortraitAdjustmentController strengthKey](PIPortraitAdjustmentController, "strengthKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "schema");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIPortraitAdjustmentController strengthKey](PIPortraitAdjustmentController, "strengthKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "defaultValue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v11)
      v20 = v11;
    else
      v20 = (void *)v18;
    v21 = v20;

    if (v12)
      v22 = v12;
    else
      v22 = v19;
    v23 = v22;

    objc_msgSend((id)v21, "doubleValue");
    v25 = v24;
    objc_msgSend((id)v23, "doubleValue");
    v27 = round(v25 * 100.0) == round(v26 * 100.0) || (v21 | v23) == 0;

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)PIPortraitAdjustmentController;
    v27 = -[PIAdjustmentController isSettingEqual:forKey:](&v29, sel_isSettingEqual_forKey_, v6, v7);
  }

  return v27;
}

- (void)setKind:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController kindKey](PIPortraitAdjustmentController, "kindKey");
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
  +[PIPortraitAdjustmentController kindKey](PIPortraitAdjustmentController, "kindKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setPortraitInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController portraitInfoKey](PIPortraitAdjustmentController, "portraitInfoKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (NSDictionary)portraitInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController portraitInfoKey](PIPortraitAdjustmentController, "portraitInfoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (BOOL)canRenderPortraitEffect
{
  void *v2;
  BOOL v3;

  -[PIPortraitAdjustmentController portraitInfo](self, "portraitInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setStrength:(double)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController strengthKey](PIPortraitAdjustmentController, "strengthKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (double)strength
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;

  +[PIPortraitAdjustmentController strengthKey](PIPortraitAdjustmentController, "strengthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v7, "defaultValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

- (double)defaultStrength
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;

  +[PIPortraitAdjustmentController strengthKey](PIPortraitAdjustmentController, "strengthKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

- (void)setSpillMatteAllowed:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "BOOLValue");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController spillMatteAllowedKey](PIPortraitAdjustmentController, "spillMatteAllowedKey");
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

- (NSNumber)spillMatteAllowed
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController spillMatteAllowedKey](PIPortraitAdjustmentController, "spillMatteAllowedKey");
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
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  +[PIAdjustmentController enabledKey](PIAdjustmentController, "enabledKey", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPortraitAdjustmentController kindKey](PIPortraitAdjustmentController, "kindKey", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  +[PIPortraitAdjustmentController strengthKey](PIPortraitAdjustmentController, "strengthKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

+ (id)portraitInfoKey
{
  return CFSTR("portraitInfo");
}

+ (id)kindKey
{
  return CFSTR("kind");
}

+ (id)strengthKey
{
  return CFSTR("strength");
}

+ (id)spillMatteAllowedKey
{
  return CFSTR("spillMatteAllowed");
}

@end
