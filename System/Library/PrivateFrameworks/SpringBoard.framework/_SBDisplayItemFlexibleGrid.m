@implementation _SBDisplayItemFlexibleGrid

- (_SBDisplayItemFlexibleGrid)initWithBounds:(CGRect)a3 screenScale:(double)a4 chamoisLayoutAttributes:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  _SBDisplayItemFlexibleGrid *v13;
  void *v14;
  uint64_t v15;
  SBSwitcherChamoisSettings *settings;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_SBDisplayItemFlexibleGrid;
  v13 = -[_SBDisplayItemFlexibleGrid init](&v18, sel_init);
  if (v13)
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chamoisSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    settings = v13->_settings;
    v13->_settings = (SBSwitcherChamoisSettings *)v15;

    objc_storeStrong((id *)&v13->_chamoisLayoutAttributes, a5);
    v13->_bounds.origin.x = x;
    v13->_bounds.origin.y = y;
    v13->_bounds.size.width = width;
    v13->_bounds.size.height = height;
    -[_SBDisplayItemFlexibleGrid _buildGridWithScreenScale:](v13, "_buildGridWithScreenScale:", a4);
  }

  return v13;
}

- (void)_buildGridWithScreenScale:(double)a3
{
  NSArray *v4;
  NSArray *widths;
  NSArray *v6;
  NSArray *heights;

  -[SBSwitcherChamoisLayoutAttributes gridWidths](self->_chamoisLayoutAttributes, "gridWidths", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  widths = self->_widths;
  self->_widths = v4;

  -[SBSwitcherChamoisLayoutAttributes gridHeights](self->_chamoisLayoutAttributes, "gridHeights");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  heights = self->_heights;
  self->_heights = v6;

}

- (id)_gridWidthsForSafeWidth:(double)a3 minimumWidth:(double)a4
{
  double v6;
  double v7;
  double v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  double v26;

  -[SBSwitcherChamoisLayoutAttributes stageInterItemSpacing](self->_chamoisLayoutAttributes, "stageInterItemSpacing");
  v7 = v6;
  v8 = v6 + a4;
  v9 = (void *)objc_opt_new();
  if (v8 > 0.0)
  {
    v26 = floor(a3 / v8);
    v10 = vcvtmd_u64_f64(a3 / v8);
    v11 = floor(((a3 - v7) * 0.5 + (a3 - v7) * 0.5) * 0.5);
    v12 = (v11 + v11) * 0.5;
    while (1)
    {
      v13 = v10 - 1;
      if (v10 == 1)
        break;
      if (v10 == 2)
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        v22 = v12;
        goto LABEL_10;
      }
      if (!v10)
        return v9;
      v14 = (double)v10;
      v15 = floor((a3 - ((double)v10 + -1.0) * v7) / (double)v10);
      v16 = floor((v15 + v15) * 0.5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v16 + v16) * 0.5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v17);

      v18 = floor((a3 - v7 - v15 + a3 - v7 - v15) * 0.5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v18 + v18) * 0.5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v19);

      if (v26 == v14)
      {
        v20 = (void *)MEMORY[0x1E0CB37E8];
        v21 = floor((a3 - v15 * 0.5 + a3 - v15 * 0.5) * 0.5);
        v22 = (v21 + v21) * 0.5;
LABEL_10:
        objc_msgSend(v20, "numberWithDouble:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v23);

      }
      v10 = v13;
    }
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v22 = a3;
    goto LABEL_10;
  }
  SBLogAppSwitcher();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[_SBDisplayItemFlexibleGrid _gridWidthsForSafeWidth:minimumWidth:].cold.1(v24);

  return v9;
}

- (id)_gridHeightsForSafeHeight:(double)a3 minimumHeight:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherChamoisLayoutAttributes stageInterItemSpacing](self->_chamoisLayoutAttributes, "stageInterItemSpacing");
  if (a3 >= a4)
  {
    v9 = (a3 + (a3 - v8) * -0.5) * 0.25;
    do
    {
      v10 = floor((a3 + a3) * 0.5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v10 + v10) * 0.5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      a3 = a3 - v9;
    }
    while (a3 >= a4);
  }
  return v7;
}

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double height;
  double width;
  uint64_t v8;
  double v9;
  unint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  char v23;
  double v24;
  double v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v8 = MEMORY[0x1E0C9D820];
  v9 = *MEMORY[0x1E0C9D820];
  if (-[NSArray count](self->_widths, "count"))
  {
    v10 = 0;
    v11 = 1.79769313e308;
    do
    {
      -[NSArray objectAtIndex:](self->_widths, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      v15 = vabdd_f64(v14, width);
      if (v15 < v11)
      {
        v9 = v14;
        v11 = v15;
      }
      ++v10;
    }
    while (v10 < -[NSArray count](self->_widths, "count"));
  }
  v16 = *(double *)(v8 + 8);
  if (-[NSArray count](self->_heights, "count"))
  {
    v17 = 0;
    v18 = 1.79769313e308;
    do
    {
      -[NSArray objectAtIndex:](self->_heights, "objectAtIndex:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      v22 = vabdd_f64(v21, height);
      if (v22 < v18)
      {
        v16 = v21;
        v18 = v22;
      }
      ++v17;
    }
    while (v17 < -[NSArray count](self->_heights, "count"));
  }
  -[_SBDisplayItemFlexibleGrid maxSize](self, "maxSize");
  v23 = BSSizeEqualToSize();
  if (a4 == 1 && (v23 & 1) != 0)
  {
    v9 = self->_bounds.size.width;
    v16 = self->_bounds.size.height;
  }
  v24 = v9;
  v25 = v16;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)minSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[NSArray firstObject](self->_widths, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[NSArray firstObject](self->_heights, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)maxSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[NSArray lastObject](self->_widths, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[NSArray lastObject](self->_heights, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeAtIndexFromFullWidthForBounds:(unint64_t)a3
{
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v5 = -[NSArray count](self->_widths, "count");
  v6 = -[NSArray count](self->_heights, "count");
  if ((uint64_t)((v5 - 1) & ~((uint64_t)(v5 - 1) >> 63)) >= (uint64_t)((v5 - 1 - a3) & ~((uint64_t)(v5 - 1 - a3) >> 63)))
    v7 = (v5 - 1 - a3) & ~((uint64_t)(v5 - 1 - a3) >> 63);
  else
    v7 = (v5 - 1) & ~((uint64_t)(v5 - 1) >> 63);
  if ((uint64_t)((v6 - 1) & ~((uint64_t)(v6 - 1) >> 63)) >= (uint64_t)((v6 - 1 - a3) & ~((uint64_t)(v6 - 1 - a3) >> 63)))
    v8 = (v6 - 1 - a3) & ~((uint64_t)(v6 - 1 - a3) >> 63);
  else
    v8 = (v6 - 1) & ~((uint64_t)(v6 - 1) >> 63);
  -[NSArray objectAtIndex:](self->_widths, "objectAtIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[NSArray objectAtIndex:](self->_heights, "objectAtIndex:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = v11;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (id)allWidths
{
  return (id)-[NSArray copy](self->_widths, "copy");
}

- (id)allHeights
{
  return (id)-[NSArray copy](self->_heights, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heights, 0);
  objc_storeStrong((id *)&self->_widths, 0);
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_gridWidthsForSafeWidth:(os_log_t)log minimumWidth:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Item width should be positive non zero", v1, 2u);
}

@end
