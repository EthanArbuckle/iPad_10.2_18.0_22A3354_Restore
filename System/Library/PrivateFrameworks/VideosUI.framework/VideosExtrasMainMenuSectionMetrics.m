@implementation VideosExtrasMainMenuSectionMetrics

- (void)dealloc
{
  CGSize *calculatedSizes;
  objc_super v4;

  calculatedSizes = self->_calculatedSizes;
  if (calculatedSizes)
    free(calculatedSizes);
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasMainMenuSectionMetrics;
  -[VideosExtrasMainMenuSectionMetrics dealloc](&v4, sel_dealloc);
}

- (void)_recalculateSizes
{
  CGSize *calculatedSizes;
  void *v4;

  calculatedSizes = self->_calculatedSizes;
  if (calculatedSizes)
    free(calculatedSizes);
  -[VideosExtrasMainMenuSectionMetrics dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itemCount = objc_msgSend(v4, "numberOfItemsForSectionMetrics:", self);

  self->_calculatedSizes = (CGSize *)malloc_type_malloc(16 * self->_itemCount, 0x1000040451B5BE8uLL);
  -[VideosExtrasMainMenuSectionMetrics _updateAllMetrics](self, "_updateAllMetrics");
}

- (void)_setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = obj;
  }

}

- (void)setDesiredFontDescriptor:(id)a3
{
  UIFontDescriptor *v5;
  UIFontDescriptor *v6;

  v5 = (UIFontDescriptor *)a3;
  if (self->_desiredFontDescriptor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_desiredFontDescriptor, a3);
    -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v6;
  }

}

- (void)setMinimumFontDescriptor:(id)a3
{
  UIFontDescriptor *v5;
  UIFontDescriptor *v6;

  v5 = (UIFontDescriptor *)a3;
  if (self->_minimumFontDescriptor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_minimumFontDescriptor, a3);
    -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v6;
  }

}

- (void)setDesiredCellSpacing:(double)a3
{
  if (vabdd_f64(a3, self->_desiredCellSpacing) >= 0.00000011920929)
  {
    self->_desiredCellSpacing = a3;
    -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setMinimumCellSpacing:(double)a3
{
  if (vabdd_f64(a3, self->_minimumCellSpacing) >= 0.00000011920929)
  {
    self->_minimumCellSpacing = a3;
    -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)setFittingWidth:(double)a3
{
  if (vabdd_f64(a3, self->_fittingWidth) >= 0.00000011920929)
  {
    self->_fittingWidth = a3;
    -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (CGSize)sizeForCellAtIndex:(int64_t)a3
{
  CGSize *v3;
  double width;
  double height;
  CGSize result;

  if (a3 < 0 || self->_itemCount <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], &stru_1E9FF3598);
    v3 = (CGSize *)MEMORY[0x1E0C9D820];
  }
  else
  {
    v3 = &self->_calculatedSizes[a3];
  }
  width = v3->width;
  height = v3->height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)updateSizes
{
  -[VideosExtrasMainMenuSectionMetrics _setNeedsUpdate](self, "_setNeedsUpdate");
  -[VideosExtrasMainMenuSectionMetrics _recalculateSizes](self, "_recalculateSizes");
}

- (void)_updateAllMetrics
{
  double v3;
  double minimumCellSpacing;
  double desiredWidth;
  void *v6;
  int64_t itemCount;
  CGSize *calculatedSizes;
  double v9;
  CGFloat v10;
  UIFontDescriptor *v11;
  CGFloat v12;
  CGFloat v13;
  UIFontDescriptor *v14;
  UIFontDescriptor *fittingFontDescriptor;
  UIFontDescriptor *v16;

  -[VideosExtrasMainMenuSectionMetrics desiredCellSpacing](self, "desiredCellSpacing");
  minimumCellSpacing = v3;
  desiredWidth = self->_desiredWidth;
  -[VideosExtrasMainMenuSectionMetrics desiredFontDescriptor](self, "desiredFontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  itemCount = self->_itemCount;
  calculatedSizes = self->_calculatedSizes;
  -[VideosExtrasMainMenuSectionMetrics _horizontalFittingSizeForFontDescriptor:gutterSize:itemCount:itemSizes:](self, "_horizontalFittingSizeForFontDescriptor:gutterSize:itemCount:itemSizes:", v6, itemCount, calculatedSizes, minimumCellSpacing);
  if (v9 <= desiredWidth
    || (minimumCellSpacing = self->_minimumCellSpacing,
        -[VideosExtrasMainMenuSectionMetrics _horizontalFittingSizeForFontDescriptor:gutterSize:itemCount:itemSizes:](self, "_horizontalFittingSizeForFontDescriptor:gutterSize:itemCount:itemSizes:", v6, itemCount, calculatedSizes, minimumCellSpacing), v9 <= desiredWidth))
  {
    self->_totalFittingSize.width = v9;
    self->_totalFittingSize.height = v10;
    self->_fittingCellSpacing = minimumCellSpacing;
    v14 = v6;
  }
  else
  {
    v11 = self->_minimumFontDescriptor;

    -[VideosExtrasMainMenuSectionMetrics _horizontalFittingSizeForFontDescriptor:gutterSize:itemCount:itemSizes:](self, "_horizontalFittingSizeForFontDescriptor:gutterSize:itemCount:itemSizes:", v11, itemCount, calculatedSizes, minimumCellSpacing);
    self->_totalFittingSize.width = v12;
    self->_totalFittingSize.height = v13;
    self->_fittingCellSpacing = minimumCellSpacing;
    v14 = v11;
  }
  fittingFontDescriptor = self->_fittingFontDescriptor;
  v16 = v14;
  self->_fittingFontDescriptor = v14;

}

- (CGSize)_horizontalFittingSizeForFontDescriptor:(id)a3 gutterSize:(double)a4 itemCount:(int64_t)a5 itemSizes:(CGSize *)a6
{
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  CGFloat *p_height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v10 = a3;
  v12 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[VideosExtrasMainMenuSectionMetrics dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 >= 1)
  {
    v14 = 0;
    p_height = &a6->height;
    do
    {
      objc_msgSend(v13, "sectionMetrics:sizeForItemAtIndex:withFontDescriptor:", self, v14, v10);
      if (v17 > v11)
        v11 = v17;
      v12 = v12 + v16;
      *(p_height - 1) = v16;
      *p_height = v17;
      ++v14;
      p_height += 2;
    }
    while (a5 != v14);
  }
  if (a5 <= 0)
    v18 = v12;
  else
    v18 = v12 + a4 * (double)(a5 - 1);

  v19 = v18;
  v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

- (VideosExtrasMainMenuSectionMetricsDataSource)dataSource
{
  return (VideosExtrasMainMenuSectionMetricsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UIFontDescriptor)desiredFontDescriptor
{
  return self->_desiredFontDescriptor;
}

- (UIFontDescriptor)minimumFontDescriptor
{
  return self->_minimumFontDescriptor;
}

- (double)desiredCellSpacing
{
  return self->_desiredCellSpacing;
}

- (double)minimumCellSpacing
{
  return self->_minimumCellSpacing;
}

- (double)desiredWidth
{
  return self->_desiredWidth;
}

- (void)setDesiredWidth:(double)a3
{
  self->_desiredWidth = a3;
}

- (UIFontDescriptor)fittingFontDescriptor
{
  return self->_fittingFontDescriptor;
}

- (double)fittingCellSpacing
{
  return self->_fittingCellSpacing;
}

- (CGSize)totalFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_totalFittingSize.width;
  height = self->_totalFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fittingFontDescriptor, 0);
  objc_storeStrong((id *)&self->_minimumFontDescriptor, 0);
  objc_storeStrong((id *)&self->_desiredFontDescriptor, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
