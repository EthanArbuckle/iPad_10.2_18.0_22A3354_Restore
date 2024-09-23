@implementation _UILumaTrackingGroup

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_paused != a3)
  {
    v3 = a3;
    self->_paused = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_lumaViews;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPaused:", v3, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (_UILumaTrackingGroup)initWithTransitionBoundaries:(id)a3 minimumDifference:(double)a4 delegate:(id)a5 views:(id)a6
{
  double var1;
  double var0;
  id v10;
  id v11;
  _UILumaTrackingGroup *v12;
  _UILumaTrackingGroup *v13;
  uint64_t v14;
  NSArray *lumaViews;
  uint64_t v16;
  NSMutableArray *lumaValues;
  unint64_t v18;
  id *v19;
  void *v20;
  objc_super v22;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a5;
  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UILumaTrackingGroup;
  v12 = -[_UILumaTrackingGroup init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_backgroundLuminanceLevel = 0;
    v12->_transitionBoundaries.minimum = var0;
    v12->_transitionBoundaries.maximum = var1;
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13->_paused = 1;
    v14 = objc_msgSend(v11, "copy");
    lumaViews = v13->_lumaViews;
    v13->_lumaViews = (NSArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v13->_lumaViews, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    lumaValues = v13->_lumaValues;
    v13->_lumaValues = (NSMutableArray *)v16;

    if (-[NSArray count](v13->_lumaViews, "count"))
    {
      v18 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v13->_lumaViews, "objectAtIndexedSubscript:", v18);
        v19 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](v13->_lumaValues, "setObject:atIndexedSubscript:", v20, v18);

        objc_msgSend(v19, "setPaused:", 1);
        objc_msgSend(v19, "setTransitionBoundaries:", var0, var1);
        if (v19)
          objc_storeWeak(v19 + 53, v13);

        ++v18;
      }
      while (v18 < -[NSArray count](v13->_lumaViews, "count"));
    }
  }

  return v13;
}

- (void)backgroundLumaView:(id)a3 didChangeLuma:(double)a4
{
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  _QWORD block[5];

  v6 = -[NSArray indexOfObject:](self->_lumaViews, "indexOfObject:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_lumaValues, "setObject:atIndexedSubscript:", v8, v7);

    if ((*(_BYTE *)&self->_lumaTrackingGroupFlags & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57___UILumaTrackingGroup_backgroundLumaView_didChangeLuma___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      *(_BYTE *)&self->_lumaTrackingGroupFlags |= 1u;
    }
  }
}

- (void)unpauseAfterSeedingWithLumaLevel:(unint64_t)a3
{
  NSMapTable *v5;
  NSMapTable *outliers;
  id WeakRetained;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_paused)
  {
    if (a3)
    {
      self->_backgroundLuminanceLevel = a3;
      v5 = (NSMapTable *)objc_opt_new();
      outliers = self->_outliers;
      self->_outliers = v5;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "backgroundLumaGroup:didTransitionToLevel:viewsWithDifferentLevels:", self, self->_backgroundLuminanceLevel, self->_outliers);

      }
    }
    self->_paused = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_lumaViews;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "unpauseAfterSeedingWithLumaLevel:", a3, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)_updateLumaValue
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  float v11;
  unint64_t backgroundLuminanceLevel;
  double v13;
  unint64_t v14;
  int v15;
  NSMapTable *v16;
  NSMapTable *outliers;
  unint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  float v25;
  double v26;
  double v27;
  NSMapTable *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id WeakRetained;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = self->_lumaValues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v4)
  {
LABEL_38:

    return;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v35;
  v8 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "floatValue", (_QWORD)v34);
        v8 = v8 + v11;
        ++v6;
      }
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  }
  while (v5);

  if (v6 >= 1)
  {
    backgroundLuminanceLevel = self->_backgroundLuminanceLevel;
    v13 = v8 / (double)v6;
    if ((BSFloatGreaterThanOrEqualToFloat() & 1) != 0)
    {
      v14 = 1;
    }
    else if ((BSFloatLessThanOrEqualToFloat() & 1) != 0)
    {
      v14 = 2;
    }
    else
    {
      if (self->_backgroundLuminanceLevel)
        goto LABEL_19;
      v15 = BSFloatGreaterThanOrEqualToFloat();
      v14 = 1;
      if (!v15)
        v14 = 2;
    }
    self->_backgroundLuminanceLevel = v14;
LABEL_19:
    v3 = self->_outliers;
    v16 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0x10000, 1);
    outliers = self->_outliers;
    self->_outliers = v16;

    if ((unint64_t)v6 >= 2 && -[NSArray count](self->_lumaViews, "count"))
    {
      v18 = 0;
      v19 = v13 * (double)v6;
      v20 = (double)(v6 - 1);
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_lumaViews, "objectAtIndexedSubscript:", v18, (_QWORD)v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "backgroundLuminanceLevel");
        if (!v22)
          goto LABEL_33;
        v23 = v22;
        if (v22 == self->_backgroundLuminanceLevel)
          goto LABEL_33;
        -[NSMutableArray objectAtIndexedSubscript:](self->_lumaValues, "objectAtIndexedSubscript:", v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "floatValue");
          v26 = v25;
          v27 = (v19 - v26) / v20;
          if (v23 != 1)
          {
            if (v23 != 2 || v27 - v26 <= self->_minimumDifference)
              goto LABEL_32;
            v28 = self->_outliers;
            v29 = (void *)MEMORY[0x1E0CB37E8];
            v30 = 2;
            goto LABEL_31;
          }
          if (v26 - v27 > self->_minimumDifference)
          {
            v28 = self->_outliers;
            v29 = (void *)MEMORY[0x1E0CB37E8];
            v30 = 1;
LABEL_31:
            objc_msgSend(v29, "numberWithUnsignedInteger:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](v28, "setObject:forKey:", v31, v21);

          }
        }
LABEL_32:

LABEL_33:
        ++v18;
      }
      while (v18 < -[NSArray count](self->_lumaViews, "count"));
    }
    if (self->_backgroundLuminanceLevel != backgroundLuminanceLevel
      || (-[NSMapTable isEqual:](self->_outliers, "isEqual:", v3) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        v33 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v33, "backgroundLumaGroup:didTransitionToLevel:viewsWithDifferentLevels:", self, self->_backgroundLuminanceLevel, self->_outliers);

      }
    }
    goto LABEL_38;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outliers, 0);
  objc_storeStrong((id *)&self->_lumaValues, 0);
  objc_storeStrong((id *)&self->_lumaViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)transitionBoundaries
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_transitionBoundaries.minimum;
  maximum = self->_transitionBoundaries.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (void)setTransitionBoundaries:(id)a3
{
  self->_transitionBoundaries = ($888842945EE2C7AB0ACD33E179C69952)a3;
}

- (double)minimumDifference
{
  return self->_minimumDifference;
}

- (void)setMinimumDifference:(double)a3
{
  self->_minimumDifference = a3;
}

- (unint64_t)backgroundLuminanceLevel
{
  return self->_backgroundLuminanceLevel;
}

@end
