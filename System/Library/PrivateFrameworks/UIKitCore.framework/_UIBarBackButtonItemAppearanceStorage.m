@implementation _UIBarBackButtonItemAppearanceStorage

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5
{
  _BOOL4 v5;
  NSMutableDictionary **p_miniBackgroundImages;
  NSMutableDictionary **p_backgroundImages;
  uint64_t v10;
  id *v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;

  v5 = a5;
  v17 = (unint64_t)a3;
  p_miniBackgroundImages = &self->miniBackgroundImages;
  p_backgroundImages = &self->backgroundImages;
  v10 = 8;
  if (v5)
  {
    v10 = 16;
    v11 = (id *)&self->miniBackgroundImages;
  }
  else
  {
    v11 = (id *)&self->backgroundImages;
  }
  v12 = (unint64_t)*(id *)((char *)&self->super.isa + v10);
  if (v17 | v12)
  {
    if (v17)
    {
      if (!v12)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v14 = *v11;
        *v11 = v13;

        v12 = (unint64_t)*v11;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "setObject:forKey:", v17, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "removeObjectForKey:", v16);

      if (objc_msgSend((id)v12, "count"))
        goto LABEL_11;
      if (v5)
      {
        v15 = *p_miniBackgroundImages;
        *p_miniBackgroundImages = 0;
      }
      else
      {
        v15 = *p_backgroundImages;
        *p_backgroundImages = 0;
      }
    }

  }
  else
  {
    v12 = 0;
  }
LABEL_11:

}

- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = 8;
  if (a4)
    v5 = 16;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(id *)((char *)&self->super.isa + v5);
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)anyBackgroundImage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->backgroundImages, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[NSMutableDictionary allValues](self->backgroundImages, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[NSMutableDictionary objectForKey:](self->miniBackgroundImages, "objectForKey:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v4 = v6;
      }
      else
      {
        -[NSMutableDictionary allValues](self->miniBackgroundImages, "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastObject");
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backgroundVerticalAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->miniTitlePositionOffset, 0);
  objc_storeStrong((id *)&self->titlePositionOffset, 0);
  objc_storeStrong((id *)&self->miniBackgroundImages, 0);
  objc_storeStrong((id *)&self->backgroundImages, 0);
}

@end
