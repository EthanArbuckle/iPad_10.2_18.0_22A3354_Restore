@implementation _UISegmentedControlAppearanceStorage

- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *textAttributesForState;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v6 = a3;
  textAttributesForState = self->_textAttributesForState;
  if (v6)
  {
    v13 = v6;
    if (!textAttributesForState)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_textAttributesForState;
      self->_textAttributesForState = v8;

      v6 = v13;
    }
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = self->_textAttributesForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, v12);

    goto LABEL_7;
  }
  if (textAttributesForState)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](textAttributesForState, "removeObjectForKey:", v10);
LABEL_7:

    v6 = v13;
  }

}

- (_UISegmentedControlAppearanceStorage)init
{
  _UISegmentedControlAppearanceStorage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISegmentedControlAppearanceStorage;
  result = -[_UISegmentedControlAppearanceStorage init](&v3, sel_init);
  if (result)
    *(int64x2_t *)&result->_leftCapWidth = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return result;
}

- (BOOL)legacySuppressOptionsBackground
{
  return self->_legacySuppressOptionsBackground;
}

- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4 withFallback:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v9;
  NSMutableDictionary *v10;
  int v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v5 = a5;
  v6 = a4;
  v9 = 8;
  if (a4)
    v9 = 16;
  v10 = (NSMutableDictionary *)*(id *)((char *)&self->super.isa + v9);
  v11 = !v6;
  if (v10)
    v11 = 1;
  if (v11)
    v12 = v10;
  else
    v12 = 0;
  if ((v11 & 1) == 0 && v5)
    v12 = self->_backgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = 1;
  else
    v15 = !v5;
  if (!v15)
  {
    if (v12 == self->_backgroundImages)
    {
      v14 = 0;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14;
}

- (id)textAttributesForState:(unint64_t)a3
{
  NSMutableDictionary *textAttributesForState;
  void *v4;
  void *v5;

  textAttributesForState = self->_textAttributesForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](textAttributesForState, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 isMini:(BOOL)a5 withFallback:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v11;
  NSMutableDictionary *v12;
  int v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSMutableDictionary *dividerImages;

  v6 = a6;
  v7 = a5;
  v11 = 24;
  if (a5)
    v11 = 32;
  v12 = (NSMutableDictionary *)*(id *)((char *)&self->super.isa + v11);
  v13 = !v7;
  if (v12)
    v13 = 1;
  if (v13)
    v14 = v12;
  else
    v14 = 0;
  if ((v13 & 1) == 0 && v6)
    v14 = self->_dividerImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4 + 100 * a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = 1;
  else
    v17 = !v6;
  if (!v17)
  {
    dividerImages = self->_dividerImages;
    if (v14 == dividerImages)
    {
      v16 = 0;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](dividerImages, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)backgroundImageForState:(unint64_t)a3 isMini:(BOOL)a4
{
  return -[_UISegmentedControlAppearanceStorage backgroundImageForState:isMini:withFallback:](self, "backgroundImageForState:isMini:withFallback:", a3, a4, 0);
}

- (id)anyDividerImageForMini:(BOOL)a3
{
  uint64_t v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = 24;
  if (a3)
    v4 = 32;
  v5 = (NSMutableDictionary *)*(id *)((char *)&self->super.isa + v4);
  if (!v5)
    v5 = self->_dividerImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[NSMutableDictionary allValues](v5, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)contentPositionOffsetForSegment:(int64_t)a3 inMiniBar:(BOOL)a4 noFallback:(BOOL)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = 56;
  if (a4)
    v7 = 64;
  v8 = *(id *)((char *)&self->super.isa + v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)contentPositionOffsetForSegment:(int64_t)a3 inMiniBar:(BOOL)a4
{
  return -[_UISegmentedControlAppearanceStorage contentPositionOffsetForSegment:inMiniBar:noFallback:](self, "contentPositionOffsetForSegment:inMiniBar:noFallback:", a3, a4, 0);
}

- (BOOL)wantsTrackingSuppressed
{
  BOOL v2;
  NSMutableDictionary *backgroundImages;
  void *v5;
  void *v6;
  NSMutableDictionary *miniBackgroundImages;
  void *v8;
  void *v9;

  if (self->_legacyDontHighlight)
    return 1;
  backgroundImages = self->_backgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](backgroundImages, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = 0;
  }
  else
  {
    miniBackgroundImages = self->_miniBackgroundImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](miniBackgroundImages, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v9 == 0;

  }
  return v2;
}

- (void)setBackgroundPositionAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  void *v6;
  float v7;
  double v8;
  double v9;
  NSMutableDictionary *backgroundPositionAdjustmentsForBarMetrics;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_backgroundPositionAdjustmentsForBarMetrics, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (v8 != a3)
  {
    backgroundPositionAdjustmentsForBarMetrics = self->_backgroundPositionAdjustmentsForBarMetrics;
    if (!backgroundPositionAdjustmentsForBarMetrics)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->_backgroundPositionAdjustmentsForBarMetrics;
      self->_backgroundPositionAdjustmentsForBarMetrics = v11;

      backgroundPositionAdjustmentsForBarMetrics = self->_backgroundPositionAdjustmentsForBarMetrics;
    }
    *(float *)&v9 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](backgroundPositionAdjustmentsForBarMetrics, "setObject:forKey:", v13, v14);

  }
}

- (double)backgroundPositionAdjustmentForBarMetrics:(int64_t)a3
{
  NSMutableDictionary *backgroundPositionAdjustmentsForBarMetrics;
  void *v4;
  void *v5;
  float v6;
  double v7;

  backgroundPositionAdjustmentsForBarMetrics = self->_backgroundPositionAdjustmentsForBarMetrics;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](backgroundPositionAdjustmentsForBarMetrics, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)setContentPositionOffset:(id)a3 forSegment:(int64_t)a4 inMiniBar:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v5 = a5;
  v15 = (unint64_t)a3;
  if (v5)
    v8 = 64;
  else
    v8 = 56;
  v9 = (unint64_t)*(id *)((char *)&self->super.isa + v8);
  v10 = (void *)v15;
  if (v15 | v9)
  {
    v11 = (id)v9;
    if (!v9)
    {
      v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = *(Class *)((char *)&self->super.isa + v8);
      *(Class *)((char *)&self->super.isa + v8) = v12;

      v11 = *(id *)((char *)&self->super.isa + v8);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v11, "setObject:forKey:", v15, v14);
    else
      objc_msgSend(v11, "removeObjectForKey:", v14);

    v10 = (void *)v15;
  }

}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 isMini:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v5 = a5;
  v15 = (unint64_t)a3;
  if (v5)
    v8 = 16;
  else
    v8 = 8;
  v9 = (unint64_t)*(id *)((char *)&self->super.isa + v8);
  v10 = (void *)v15;
  if (v15 | v9)
  {
    v11 = (id)v9;
    if (!v9)
    {
      v12 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = *(Class *)((char *)&self->super.isa + v8);
      *(Class *)((char *)&self->super.isa + v8) = v12;

      v11 = *(id *)((char *)&self->super.isa + v8);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v11, "setObject:forKey:", v15, v14);
    else
      objc_msgSend(v11, "removeObjectForKey:", v14);

    v10 = (void *)v15;
  }

}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 isMini:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  unint64_t v17;

  v6 = a6;
  v17 = (unint64_t)a3;
  if (v6)
    v10 = 32;
  else
    v10 = 24;
  v11 = (unint64_t)*(id *)((char *)&self->super.isa + v10);
  v12 = (void *)v17;
  if (v17 | v11)
  {
    v13 = (id)v11;
    if (!v11)
    {
      v14 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = *(Class *)((char *)&self->super.isa + v10);
      *(Class *)((char *)&self->super.isa + v10) = v14;

      v13 = *(id *)((char *)&self->super.isa + v10);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5 + 100 * a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v13, "setObject:forKey:", v17, v16);
    else
      objc_msgSend(v13, "removeObjectForKey:", v16);

    v12 = (void *)v17;
  }

}

- (id)anyDividerImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_UISegmentedControlAppearanceStorage anyDividerImageForMini:](self, "anyDividerImageForMini:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UISegmentedControlAppearanceStorage anyDividerImageForMini:](self, "anyDividerImageForMini:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 isMini:(BOOL)a5
{
  return -[_UISegmentedControlAppearanceStorage dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:](self, "dividerImageForLeftSegmentState:rightSegmentState:isMini:withFallback:", a3, a4, a5, 0);
}

- (void)takeTextAttributesFrom:(id *)a3 forState:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  -[_UISegmentedControlAppearanceStorage textAttributesForState:](self, "textAttributesForState:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v10;

  objc_msgSend(v12, "setValue:forKey:", a3->var3, *(_QWORD *)off_1E1678D98);
  if (a3->var4)
  {
    v11 = objc_alloc_init((Class)off_1E1679CA0);
    objc_msgSend(v11, "setShadowColor:", a3->var4);
    objc_msgSend(v11, "setShadowOffset:", a3->var5.width, a3->var5.height);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v12, "setValue:forKey:", v11, *(_QWORD *)off_1E1679048);
  -[_UISegmentedControlAppearanceStorage setTextAttributes:forState:](self, "setTextAttributes:forState:", v12, a4);

}

- (void)setDetail:(id *)a3
{
  double var1;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGFloat height;
  _QWORD v21[2];
  double v22[2];
  _QWORD v23[2];

  if (a3)
  {
    self->_legacySuppressOptionsBackground = 1;
    self->_legacyDontHighlight = a3->var7;
    var1 = a3->var1;
    if (a3->var2 != 0.0 || var1 != 0.0)
    {
      v23[0] = *(_QWORD *)&a3->var2;
      *(double *)&v23[1] = var1;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v23, "{UIOffset=dd}");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a3->var1;
      v22[0] = -a3->var2;
      v22[1] = v7;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{UIOffset=dd}");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a3->var1;
      v21[0] = 0;
      *(double *)&v21[1] = v9;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v21, "{UIOffset=dd}");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISegmentedControlAppearanceStorage setContentPositionOffset:forSegment:inMiniBar:](self, "setContentPositionOffset:forSegment:inMiniBar:", v6, 4, 0);
      -[_UISegmentedControlAppearanceStorage setContentPositionOffset:forSegment:inMiniBar:](self, "setContentPositionOffset:forSegment:inMiniBar:", v6, 1, 0);
      -[_UISegmentedControlAppearanceStorage setContentPositionOffset:forSegment:inMiniBar:](self, "setContentPositionOffset:forSegment:inMiniBar:", v8, 3, 0);
      -[_UISegmentedControlAppearanceStorage setContentPositionOffset:forSegment:inMiniBar:](self, "setContentPositionOffset:forSegment:inMiniBar:", v10, 2, 0);

    }
    -[_UISegmentedControlAppearanceStorage setBackgroundImage:forState:isMini:](self, "setBackgroundImage:forState:isMini:", a3->var3.var0, 0, 0);
    -[_UISegmentedControlAppearanceStorage setBackgroundImage:forState:isMini:](self, "setBackgroundImage:forState:isMini:", a3->var4.var0, 4, 0);
    -[_UISegmentedControlAppearanceStorage setBackgroundImage:forState:isMini:](self, "setBackgroundImage:forState:isMini:", a3->var6.var0, 2, 0);
    -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var3.var1, 0, 0, 0);
    -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var4.var1, 0, 4, 0);
    -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var4.var2, 4, 0, 0);
    -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var6.var1, 0, 2, 0);
    -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var6.var2, 2, 0, 0);
    -[_UISegmentedControlAppearanceStorage textAttributesForState:](self, "textAttributesForState:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "mutableCopy");

    if (a3->var0 && !v12)
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setValue:forKey:");
    -[_UISegmentedControlAppearanceStorage setTextAttributes:forState:](self, "setTextAttributes:forState:", v12, 0);
    if (a3->var3.var3 || a3->var3.var4)
    {
      v13 = *(_OWORD *)&a3->var3.var2;
      v17 = *(_OWORD *)&a3->var3.var0;
      v18 = v13;
      v19 = *(_OWORD *)&a3->var3.var4;
      height = a3->var3.var5.height;
      -[_UISegmentedControlAppearanceStorage takeTextAttributesFrom:forState:](self, "takeTextAttributesFrom:forState:", &v17, 0);
    }
    if (a3->var4.var3 || a3->var4.var4)
    {
      v14 = *(_OWORD *)&a3->var4.var2;
      v17 = *(_OWORD *)&a3->var4.var0;
      v18 = v14;
      v19 = *(_OWORD *)&a3->var4.var4;
      height = a3->var4.var5.height;
      -[_UISegmentedControlAppearanceStorage takeTextAttributesFrom:forState:](self, "takeTextAttributesFrom:forState:", &v17, 4);
    }
    if (a3->var6.var3 || a3->var6.var4)
    {
      v15 = *(_OWORD *)&a3->var6.var2;
      v17 = *(_OWORD *)&a3->var6.var0;
      v18 = v15;
      v19 = *(_OWORD *)&a3->var6.var4;
      height = a3->var6.var5.height;
      -[_UISegmentedControlAppearanceStorage takeTextAttributesFrom:forState:](self, "takeTextAttributesFrom:forState:", &v17, 2);
    }
    if (!a3->var7)
    {
      -[_UISegmentedControlAppearanceStorage setBackgroundImage:forState:isMini:](self, "setBackgroundImage:forState:isMini:", a3->var5.var0, 1, 0);
      -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var5.var1, 0, 1, 0);
      -[_UISegmentedControlAppearanceStorage setDividerImage:forLeftSegmentState:rightSegmentState:isMini:](self, "setDividerImage:forLeftSegmentState:rightSegmentState:isMini:", a3->var5.var2, 1, 0, 0);
      if (a3->var5.var3 || a3->var5.var4)
      {
        v16 = *(_OWORD *)&a3->var5.var2;
        v17 = *(_OWORD *)&a3->var5.var0;
        v18 = v16;
        v19 = *(_OWORD *)&a3->var5.var4;
        height = a3->var5.var5.height;
        -[_UISegmentedControlAppearanceStorage takeTextAttributesFrom:forState:](self, "takeTextAttributesFrom:forState:", &v17, 1);
      }
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_backgroundImages, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_dividerImages, "removeAllObjects");
    *(_WORD *)&self->_legacyDontHighlight = 0;
  }
}

- (void)setIsTiled:(BOOL)a3 leftCapWidth:(unint64_t)a4 rightCapWidth:(unint64_t)a5
{
  self->_isTiled = a3;
  self->_leftCapWidth = a4;
  self->_rightCapWidth = a5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniContentPositionOffsets, 0);
  objc_storeStrong((id *)&self->_contentPositionOffsets, 0);
  objc_storeStrong((id *)&self->_backgroundPositionAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->_textAttributesForState, 0);
  objc_storeStrong((id *)&self->_miniDividerImages, 0);
  objc_storeStrong((id *)&self->_dividerImages, 0);
  objc_storeStrong((id *)&self->_miniBackgroundImages, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
}

@end
