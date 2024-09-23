@implementation _UIMaterial

- (BOOL)isVibrant
{
  return self->_vibrant;
}

+ (id)materialForSystemColorName:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_self();
  if (qword_1ECD7BF40 != -1)
    dispatch_once(&qword_1ECD7BF40, &__block_literal_global_1372);
  v4 = (id)qword_1ECD7BF38;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)initWithVisualEffect:(void *)a1
{
  id v3;
  id *v4;
  id obj;
  id v7;
  objc_super v8;

  v3 = a2;
  v8.receiver = a1;
  v8.super_class = (Class)_UIMaterial;
  v4 = (id *)objc_msgSendSuper2(&v8, sel_init);
  if (v4)
  {
    obj = 0;
    v7 = 0;
    _UIVisualEffectViewUpgradeLegacyEffect(v3, &v7, &obj);
    objc_storeStrong(v4 + 3, obj);
    objc_storeStrong(v4 + 2, v7);

  }
  return v4;
}

+ (id)vibrancyEffectWithA:(double)a1 B:(double)a2 C:(double)a3 D:(double)a4 E:(double)a5 F:(double)a6
{
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  __int128 v19;
  float v20;
  __int128 v21;
  float v22;
  __int128 v23;
  float v24;
  __int128 v25;
  int v26;
  __int128 v27;
  float v28;
  __int128 v29;
  float v30;
  __int128 v31;
  float v32;
  __int128 v33;
  int v34;

  objc_opt_self();
  v12 = a1 / 100.0;
  v13 = a2 / 100.0;
  v14 = a3 / 100.0;
  v15 = a4 / 100.0;
  v16 = a5 / 100.0;
  v28 = v12;
  v27 = xmmword_18667D8E0;
  v30 = v13;
  v29 = xmmword_18667DA10;
  v32 = v14;
  v31 = xmmword_18667DA20;
  v19 = xmmword_18667D8E0;
  v33 = xmmword_18667DA30;
  v34 = 0;
  v20 = v15;
  v21 = xmmword_18667DA10;
  v22 = v16;
  v23 = xmmword_18667DA20;
  v17 = a6 / 100.0;
  v24 = v17;
  v25 = xmmword_18667DA30;
  v26 = 0;
  +[UIVibrancyEffect _vibrantEffectWithLightCAColorMatrix:darkCAColorMatrix:alpha:](UIVibrancyEffect, "_vibrantEffectWithLightCAColorMatrix:darkCAColorMatrix:alpha:", &v27, &v19, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_UIMaterial)initWithVibrancy:(int64_t)a3 forBlurEffectStyle:(int64_t)a4
{
  void *v6;
  void *v7;
  _UIMaterial *v8;

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    v8 = (_UIMaterial *)-[_UIMaterial initWithVisualEffect:](self, v7);
    self = v8;
    if (v8)
      v8->_vibrant = 1;
  }

  return self;
}

- (id)initWithBlur:(id *)a1
{
  id *v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[_UIMaterial initWithVisualEffect:](v2, v3);

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMaterial contentEffects](self, "contentEffects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMaterial backgroundEffects](self, "backgroundEffects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; contentEffects: %@, backgroundEffects: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (NSArray)contentEffects
{
  return self->_contentEffects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
}

@end
