@implementation _UIBarButtonItemAppearanceStorage

- (double)backButtonBackgroundVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  double result;

  -[_UIBarBackButtonItemAppearanceStorage backgroundVerticalAdjustmentForBarMetrics:](self->backButtonAppearance, "backgroundVerticalAdjustmentForBarMetrics:", a3);
  return result;
}

- (double)backgroundVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  NSMutableDictionary *backgroundVerticalAdjustmentsForBarMetrics;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  float v10;
  double v11;

  backgroundVerticalAdjustmentsForBarMetrics = self->backgroundVerticalAdjustmentsForBarMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](backgroundVerticalAdjustmentsForBarMetrics, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if ((unint64_t)(a3 - 101) > 1)
    {
      v7 = 0;
    }
    else
    {
      v8 = self->backgroundVerticalAdjustmentsForBarMetrics;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3 == 102);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v7, "floatValue");
  v11 = v10;

  return v11;
}

- (NSValue)titlePositionOffset
{
  return self->titlePositionOffset;
}

- (id)backgroundImageForState:(unint64_t)a3 style:(int64_t)a4 isMini:(BOOL)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v7 = 1;
  if (a5)
    v7 = 0;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_retain(*(id *)((char *)&self->super.super.isa
                         + OBJC_IVAR____UIBarButtonItemAppearanceStorage_miniBackgroundImages[v7]));
  objc_msgSend(v8, "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = dyld_program_sdk_at_least();
    if (!a4 && v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (a4 != 8 && !v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 style:(int64_t)a5 isMini:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;

  v6 = a6;
  v22 = (unint64_t)a3;
  v10 = 1;
  if (v6)
    v10 = 0;
  v11 = OBJC_IVAR____UIBarButtonItemAppearanceStorage_miniBackgroundImages[v10];
  v12 = (unint64_t)*(id *)((char *)&self->super.super.isa + v11);
  v13 = (void *)v22;
  if (v22 | v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (!v12)
      {
        v15 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v16 = 1;
        if (v6)
          v16 = 0;
        v17 = OBJC_IVAR____UIBarButtonItemAppearanceStorage_miniBackgroundImages[v16];
        v18 = *(Class *)((char *)&self->super.super.isa + v17);
        *(Class *)((char *)&self->super.super.isa + v17) = v15;

        v12 = (unint64_t)*(id *)((char *)&self->super.super.isa + v17);
      }
      objc_msgSend((id)v12, "objectForKey:", v14);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend((id)v12, "setObject:forKey:", v19, v14);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v22, v20);
    }
    else
    {
      objc_msgSend((id)v12, "objectForKey:", v14);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", v21);

      if (objc_msgSend(v19, "count"))
        goto LABEL_15;
      objc_msgSend((id)v12, "removeObjectForKey:", v14);
      if (objc_msgSend((id)v12, "count"))
        goto LABEL_15;
      v20 = *(Class *)((char *)&self->super.super.isa + v11);
      *(Class *)((char *)&self->super.super.isa + v11) = 0;
    }

LABEL_15:
    v13 = (void *)v22;
  }

}

- (UIColor)tintColor
{
  return self->tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backButtonAppearance, 0);
  objc_storeStrong((id *)&self->backgroundVerticalAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->miniTitlePositionOffset, 0);
  objc_storeStrong((id *)&self->titlePositionOffset, 0);
  objc_storeStrong((id *)&self->tintColor, 0);
  objc_storeStrong((id *)&self->miniBackgroundImages, 0);
  objc_storeStrong((id *)&self->backgroundImages, 0);
}

- (id)anyBackgroundImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->backgroundImages, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSMutableDictionary allValues](self->backgroundImages, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "objectForKey:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (id)v9;
LABEL_7:
    v12 = v7;
    goto LABEL_8;
  }
  objc_msgSend(v7, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_7;
  -[NSMutableDictionary objectForKey:](self->miniBackgroundImages, "objectForKey:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v12 = v14;
  }
  else
  {
    -[NSMutableDictionary allValues](self->miniBackgroundImages, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v16;
  }

  objc_msgSend(v12, "objectForKey:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v10 = v17;
  }
  else
  {
    objc_msgSend(v12, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v10;
}

- (void)setBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  double v5;
  NSMutableDictionary *v7;
  NSMutableDictionary *backgroundVerticalAdjustmentsForBarMetrics;
  void *v9;
  id v10;

  v5 = a3;
  if (!self->backgroundVerticalAdjustmentsForBarMetrics)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backgroundVerticalAdjustmentsForBarMetrics = self->backgroundVerticalAdjustmentsForBarMetrics;
    self->backgroundVerticalAdjustmentsForBarMetrics = v7;

  }
  *(float *)&a3 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->backgroundVerticalAdjustmentsForBarMetrics, "setObject:forKey:", v10, v9);

}

- (void)setBackButtonBackgroundVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  _UIBarBackButtonItemAppearanceStorage *backButtonAppearance;
  _UIBarBackButtonItemAppearanceStorage *v8;
  _UIBarBackButtonItemAppearanceStorage *v9;

  backButtonAppearance = self->backButtonAppearance;
  if (!backButtonAppearance)
  {
    v8 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
    v9 = self->backButtonAppearance;
    self->backButtonAppearance = v8;

    backButtonAppearance = self->backButtonAppearance;
  }
  -[_UIBarBackButtonItemAppearanceStorage setBackgroundVerticalAdjustment:forBarMetrics:](backButtonAppearance, "setBackgroundVerticalAdjustment:forBarMetrics:", a4, a3);
}

- (void)setBackButtonBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _UIBarBackButtonItemAppearanceStorage *backButtonAppearance;
  _UIBarBackButtonItemAppearanceStorage *v10;
  _UIBarBackButtonItemAppearanceStorage *v11;
  id v12;

  v5 = a5;
  v8 = a3;
  backButtonAppearance = self->backButtonAppearance;
  v12 = v8;
  if (v8)
  {
    if (!backButtonAppearance)
    {
      v10 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
      v11 = self->backButtonAppearance;
      self->backButtonAppearance = v10;

      backButtonAppearance = self->backButtonAppearance;
    }
    goto LABEL_5;
  }
  if (backButtonAppearance)
  {
LABEL_5:
    -[_UIBarBackButtonItemAppearanceStorage setBackgroundImage:forState:isMini:](backButtonAppearance, "setBackgroundImage:forState:isMini:", v12, a4, v5);
    v8 = v12;
  }

}

- (id)backButtonBackgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4
{
  return -[_UIBarBackButtonItemAppearanceStorage backgroundImageForState:isMini:](self->backButtonAppearance, "backgroundImageForState:isMini:", a3, a4);
}

- (id)anyBackButtonBackgroundImage
{
  return -[_UIBarBackButtonItemAppearanceStorage anyBackgroundImage](self->backButtonAppearance, "anyBackgroundImage");
}

- (void)setBackButtonTitlePositionOffset:(id)a3
{
  id v4;
  _UIBarBackButtonItemAppearanceStorage *backButtonAppearance;
  _UIBarBackButtonItemAppearanceStorage *v6;
  _UIBarBackButtonItemAppearanceStorage *v7;
  id v8;

  v4 = a3;
  backButtonAppearance = self->backButtonAppearance;
  v8 = v4;
  if (v4)
  {
    if (!backButtonAppearance)
    {
      v6 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
      v7 = self->backButtonAppearance;
      self->backButtonAppearance = v6;

      backButtonAppearance = self->backButtonAppearance;
    }
    goto LABEL_5;
  }
  if (backButtonAppearance)
  {
LABEL_5:
    -[_UIBarBackButtonItemAppearanceStorage setTitlePositionOffset:](backButtonAppearance, "setTitlePositionOffset:", v8);
    v4 = v8;
  }

}

- (NSValue)backButtonTitlePositionOffset
{
  return -[_UIBarBackButtonItemAppearanceStorage titlePositionOffset](self->backButtonAppearance, "titlePositionOffset");
}

- (void)setMiniBackButtonTitlePositionOffset:(id)a3
{
  id v4;
  _UIBarBackButtonItemAppearanceStorage *backButtonAppearance;
  _UIBarBackButtonItemAppearanceStorage *v6;
  _UIBarBackButtonItemAppearanceStorage *v7;
  id v8;

  v4 = a3;
  backButtonAppearance = self->backButtonAppearance;
  v8 = v4;
  if (v4)
  {
    if (!backButtonAppearance)
    {
      v6 = objc_alloc_init(_UIBarBackButtonItemAppearanceStorage);
      v7 = self->backButtonAppearance;
      self->backButtonAppearance = v6;

      backButtonAppearance = self->backButtonAppearance;
    }
    goto LABEL_5;
  }
  if (backButtonAppearance)
  {
LABEL_5:
    -[_UIBarBackButtonItemAppearanceStorage setMiniTitlePositionOffset:](backButtonAppearance, "setMiniTitlePositionOffset:", v8);
    v4 = v8;
  }

}

- (NSValue)miniBackButtonTitlePositionOffset
{
  return -[_UIBarBackButtonItemAppearanceStorage miniTitlePositionOffset](self->backButtonAppearance, "miniTitlePositionOffset");
}

- (void)setTitlePositionOffset:(id)a3
{
  objc_storeStrong((id *)&self->titlePositionOffset, a3);
}

- (NSValue)miniTitlePositionOffset
{
  return self->miniTitlePositionOffset;
}

- (void)setMiniTitlePositionOffset:(id)a3
{
  objc_storeStrong((id *)&self->miniTitlePositionOffset, a3);
}

@end
