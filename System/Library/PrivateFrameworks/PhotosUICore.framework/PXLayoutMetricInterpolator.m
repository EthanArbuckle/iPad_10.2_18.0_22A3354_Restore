@implementation PXLayoutMetricInterpolator

+ (id)layoutMarginWidthInterpolator
{
  if (layoutMarginWidthInterpolator_onceToken != -1)
    dispatch_once(&layoutMarginWidthInterpolator_onceToken, &__block_literal_global_6);
  return (id)layoutMarginWidthInterpolator_interpolator;
}

- (double)valueForMetric:(double)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  id v17;
  id v18;
  id v19;

  -[PXLayoutMetricInterpolator _cachedMetric](self, "_cachedMetric");
  if (v5 != a3)
  {
    v18 = 0;
    v19 = 0;
    v17 = 0;
    -[PXLayoutMetricInterpolator _getReferenceValueForMetric:exactMatch:closestBeforeMatch:closestAfterMatch:](self, "_getReferenceValueForMetric:exactMatch:closestBeforeMatch:closestAfterMatch:", &v19, &v18, &v17, a3);
    v9 = v19;
    v10 = v18;
    v11 = v17;
    v12 = v11;
    if (v9)
    {
      v13 = v9;
    }
    else if (!v10 || v11)
    {
      if (v10 || !v11)
      {
        v14 = 0;
        if (!v10 || !v11)
          goto LABEL_15;
        -[PXLayoutMetricInterpolator _valueForMetric:fromInterpolationBetweenValue:secondValue:](self, "_valueForMetric:fromInterpolationBetweenValue:secondValue:", v10, v11, a3);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v11;
      }
    }
    else
    {
      v13 = v10;
    }
    v14 = v13;
LABEL_15:
    -[PXLayoutMetricInterpolator _setCachedMetric:](self, "_setCachedMetric:", a3);
    -[PXLayoutMetricInterpolator _setCachedValue:](self, "_setCachedValue:", v14);
    objc_msgSend(v14, "CGPointValue");
    v8 = v15;

    return v8;
  }
  -[PXLayoutMetricInterpolator _cachedValue](self, "_cachedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;

  return v8;
}

- (double)_cachedMetric
{
  return self->__cachedMetric;
}

- (NSValue)_cachedValue
{
  return self->__cachedValue;
}

- (id)_valueForMetric:(double)a3 fromInterpolationBetweenValue:(id)a4 secondValue:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v7 = a5;
  objc_msgSend(a4, "CGPointValue");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "CGPointValue");
  v13 = v12;
  v15 = v14;

  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, v11 - (v15 - v11) / (v13 - v9) * v9 + (v15 - v11) / (v13 - v9) * a3);
}

+ (unint64_t)photosGridLayoutColumnsForWidth:(double)a3
{
  if (a3 >= 480.0)
    return 5;
  else
    return 3;
}

- (void)_getReferenceValueForMetric:(double)a3 exactMatch:(id *)a4 closestBeforeMatch:(id *)a5 closestAfterMatch:(id *)a6
{
  unint64_t v11;
  void *v12;
  double v13;
  id v14;

  -[PXLayoutMetricInterpolator _referenceValuesByMetrics](self, "_referenceValuesByMetrics");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    -[PXLayoutMetricInterpolator _updateReferenceValuesByMetricsOrderIfNeeded](self, "_updateReferenceValuesByMetricsOrderIfNeeded");
    v11 = _IndexOfReferenceValueForMetricWithOptions(v14, 1024, a3);
    if (v11 < objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "CGPointValue");
      if (v13 == a3)
      {
        a6 = a4;
        if (!a4)
        {
LABEL_6:

          goto LABEL_9;
        }
      }
      else
      {
        if (a5 && v11)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v11 - 1);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!a6)
          goto LABEL_6;
      }
      *a6 = objc_retainAutorelease(v12);
      goto LABEL_6;
    }
    if (a5)
    {
      objc_msgSend(v14, "lastObject");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_9:

}

void __59__PXLayoutMetricInterpolator_layoutMarginWidthInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)layoutMarginWidthInterpolator_interpolator;
  layoutMarginWidthInterpolator_interpolator = (uint64_t)v0;

  v2 = (id)layoutMarginWidthInterpolator_interpolator;
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 320.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 20.0, 375.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 20.0, 375.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 20.0, 414.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 20.0, 414.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 22.0, 428.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 34.0, 768.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 46.0, 834.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 52.0, 1024.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 52.0, 568.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 62.0, 667.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 60.0, 812.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 66.0, 736.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 64.0, 896.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 64.0, 926.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 52.0, 1024.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 31.0, 1112.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 52.0, 1366.0);

}

- (void)setReferenceValue:(double)a3 forMetric:(double)a4
{
  uint64_t v7;
  void *v8;
  id v9;

  -[PXLayoutMetricInterpolator _referenceValuesByMetrics](self, "_referenceValuesByMetrics");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = _IndexOfReferenceValueForMetricWithOptions(v9, 256, a4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "removeObjectAtIndex:", v7);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a4, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[PXLayoutMetricInterpolator _invalidateReferenceValuesByMetricsOrder](self, "_invalidateReferenceValuesByMetricsOrder");
}

- (NSMutableArray)_referenceValuesByMetrics
{
  return self->__referenceValuesByMetrics;
}

- (void)_invalidateReferenceValuesByMetricsOrder
{
  self->_needsUpdateFlags.referenceValuesByMetricsOrder = 1;
  -[PXLayoutMetricInterpolator _setCachedMetric:](self, "_setCachedMetric:", 0.0);
  -[PXLayoutMetricInterpolator _setCachedValue:](self, "_setCachedValue:", 0);
  -[PXLayoutMetricInterpolator _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_setCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->__cachedValue, a3);
}

- (void)_setCachedMetric:(double)a3
{
  self->__cachedMetric = a3;
}

- (PXLayoutMetricInterpolator)init
{
  PXLayoutMetricInterpolator *v2;
  uint64_t v3;
  NSMutableArray *referenceValuesByMetrics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXLayoutMetricInterpolator;
  v2 = -[PXLayoutMetricInterpolator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    referenceValuesByMetrics = v2->__referenceValuesByMetrics;
    v2->__referenceValuesByMetrics = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)_updateReferenceValuesByMetricsOrderIfNeeded
{
  id v2;

  if (self->_needsUpdateFlags.referenceValuesByMetricsOrder)
  {
    self->_needsUpdateFlags.referenceValuesByMetricsOrder = 0;
    -[PXLayoutMetricInterpolator _referenceValuesByMetrics](self, "_referenceValuesByMetrics");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_107);

  }
}

- (id)description
{
  void *v3;
  void *v4;

  -[PXLayoutMetricInterpolator _updateReferenceValuesByMetricsOrderIfNeeded](self, "_updateReferenceValuesByMetricsOrderIfNeeded");
  -[PXLayoutMetricInterpolator _referenceValuesByMetrics](self, "_referenceValuesByMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, (%@)>"), objc_opt_class(), self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedValue, 0);
  objc_storeStrong((id *)&self->__referenceValuesByMetrics, 0);
}

+ (id)memoriesFeedLandscapeEdgeInsetsInterpolator
{
  if (memoriesFeedLandscapeEdgeInsetsInterpolator_onceToken != -1)
    dispatch_once(&memoriesFeedLandscapeEdgeInsetsInterpolator_onceToken, &__block_literal_global_23904);
  return (id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator;
}

+ (id)albumsGridEdgeInsetsInterpolator
{
  if (albumsGridEdgeInsetsInterpolator_onceToken != -1)
    dispatch_once(&albumsGridEdgeInsetsInterpolator_onceToken, &__block_literal_global_1);
  return (id)albumsGridEdgeInsetsInterpolator_interpolator;
}

+ (id)albumsGridItemWidthInterpolator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXLayoutMetricInterpolator_albumsGridItemWidthInterpolator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (albumsGridItemWidthInterpolator_onceToken != -1)
    dispatch_once(&albumsGridItemWidthInterpolator_onceToken, block);
  return (id)albumsGridItemWidthInterpolator_interpolator;
}

+ (id)_sharedGridEdgeInsetsInterpolator
{
  if (_sharedGridEdgeInsetsInterpolator_onceToken != -1)
    dispatch_once(&_sharedGridEdgeInsetsInterpolator_onceToken, &__block_literal_global_2);
  return (id)_sharedGridEdgeInsetsInterpolator_interpolator;
}

+ (id)_sharedGridItemWidthInterpolator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXLayoutMetricInterpolator__sharedGridItemWidthInterpolator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedGridItemWidthInterpolator_onceToken != -1)
    dispatch_once(&_sharedGridItemWidthInterpolator_onceToken, block);
  return (id)_sharedGridItemWidthInterpolator_interpolator;
}

+ (id)_gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:(id)a3
{
  id v3;
  PXLayoutMetricInterpolator *v4;
  PXLayoutMetricInterpolator *v5;
  id v6;
  void (**v7)(void *, uint64_t, double, double);
  PXLayoutMetricInterpolator *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, double, double);
  void *v13;
  id v14;
  PXLayoutMetricInterpolator *v15;

  v3 = a3;
  v4 = objc_alloc_init(PXLayoutMetricInterpolator);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __87__PXLayoutMetricInterpolator__gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator___block_invoke;
  v13 = &unk_1E5119D38;
  v14 = v3;
  v5 = v4;
  v15 = v5;
  v6 = v3;
  v7 = (void (**)(void *, uint64_t, double, double))_Block_copy(&v10);
  v7[2](v7, 2, 16.0, 320.0);
  v7[2](v7, 2, 16.0, 375.0);
  v7[2](v7, 2, 20.0, 414.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v5, "setReferenceValue:forMetric:", 142.0, 467.0, v10, v11, v12, v13);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v5, "setReferenceValue:forMetric:", 130.0, 523.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v5, "setReferenceValue:forMetric:", 157.5, 567.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v5, "setReferenceValue:forMetric:", 177.0, 633.333313);
  v7[2](v7, 3, 20.0, 490.0);
  v7[2](v7, 4, 20.0, 768.0);
  v7[2](v7, 4, 22.0, 834.0);
  v7[2](v7, 5, 30.0, 1024.0);
  v7[2](v7, 5, 32.0, 1112.0);
  v7[2](v7, 7, 24.0, 1366.0);
  v8 = v5;

  return v8;
}

+ (id)legacyLayoutMarginWidthInterpolator
{
  if (legacyLayoutMarginWidthInterpolator_onceToken != -1)
    dispatch_once(&legacyLayoutMarginWidthInterpolator_onceToken, &__block_literal_global_4);
  return (id)legacyLayoutMarginWidthInterpolator_interpolator;
}

+ (id)photosDetailsEdgeInsetsInterpolator
{
  if (photosDetailsEdgeInsetsInterpolator_onceToken != -1)
    dispatch_once(&photosDetailsEdgeInsetsInterpolator_onceToken, &__block_literal_global_5);
  return (id)photosDetailsEdgeInsetsInterpolator_interpolator;
}

+ (id)gadgetColumnSpacingSpanSingleSetAInterpolator
{
  if (gadgetColumnSpacingSpanSingleSetAInterpolator_onceToken != -1)
    dispatch_once(&gadgetColumnSpacingSpanSingleSetAInterpolator_onceToken, &__block_literal_global_7);
  return (id)gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator;
}

+ (id)gadgetColumnWidthSpanSingleSetAInterpolator
{
  if (gadgetColumnWidthSpanSingleSetAInterpolator_onceToken != -1)
    dispatch_once(&gadgetColumnWidthSpanSingleSetAInterpolator_onceToken, &__block_literal_global_8_23902);
  return (id)gadgetColumnWidthSpanSingleSetAInterpolator_interpolator;
}

+ (id)gadgetColumnSpacingSpanDoubleSetAInterpolator
{
  if (gadgetColumnSpacingSpanDoubleSetAInterpolator_onceToken != -1)
    dispatch_once(&gadgetColumnSpacingSpanDoubleSetAInterpolator_onceToken, &__block_literal_global_9);
  return (id)gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator;
}

+ (id)gadgetColumnWidthSpanDoubleSetAInterpolator
{
  if (gadgetColumnWidthSpanDoubleSetAInterpolator_onceToken != -1)
    dispatch_once(&gadgetColumnWidthSpanDoubleSetAInterpolator_onceToken, &__block_literal_global_10_23901);
  return (id)gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator;
}

+ (id)gadgetColumnSpacingSpanDoubleSetBInterpolator
{
  if (gadgetColumnSpacingSpanDoubleSetBInterpolator_onceToken != -1)
    dispatch_once(&gadgetColumnSpacingSpanDoubleSetBInterpolator_onceToken, &__block_literal_global_11);
  return (id)gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator;
}

+ (id)gadgetColumnWidthSpanDoubleSetBInterpolator
{
  if (gadgetColumnWidthSpanDoubleSetBInterpolator_onceToken != -1)
    dispatch_once(&gadgetColumnWidthSpanDoubleSetBInterpolator_onceToken, &__block_literal_global_12);
  return (id)gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator;
}

+ (NSArray)allLayoutMetricConfigurationSizes
{
  if (allLayoutMetricConfigurationSizes_onceToken != -1)
    dispatch_once(&allLayoutMetricConfigurationSizes_onceToken, &__block_literal_global_13);
  return (NSArray *)(id)allLayoutMetricConfigurationSizes_configurations;
}

+ (int64_t)photosGridSizeSubclassForScreenSize:(CGSize)a3
{
  int64_t v3;

  if (a3.width > a3.height)
    a3.width = a3.height;
  v3 = 3;
  if (a3.width != 414.0)
    v3 = 1;
  if (a3.width == 375.0)
    return 2;
  else
    return v3;
}

+ (CGSize)zoomableGridLayoutSmallItemSizeForWidth:(double)a3
{
  BOOL v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3 <= 480.0;
  v4 = 10.0;
  if (!v3)
    v4 = 11.0;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)bestItemSizeForAvailableWidth:(double)a3 screenScale:(double)a4 columns:(unint64_t)a5 bestSpacing:(double *)a6 bestInset:(double *)a7
{
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v24;
  double v25;
  CGSize result;

  v11 = 0.0;
  v12 = a3 <= 0.0;
  v13 = 0.0;
  if (!v12 && a4 > 0.0)
    PXFloatFloorToPixel();
  v14 = round(a4);
  if (a4 <= 0.0)
    v14 = 1.0;
  v15 = v14 * v13;
  v16 = (double)(a5 - 1);
  v17 = round(v14 + v14);
  v18 = floor((v14 * v13 - v17 * v16) / (double)a5);
  v19 = round(v15 - (v17 * v16 + v18 * (double)a5 + 0.0));
  if (v19 <= 0.0)
  {
    v20 = v17;
    if (a6)
LABEL_24:
      *a6 = v20 / v14;
  }
  else
  {
    v20 = v17;
    v21 = v19;
    do
    {
      if (v19 < v17 + v17 || (v11 == 0.0 ? (v22 = v20 - v11 < v14 + v14) : (v22 = 1), v22))
      {
        if (v19 >= v16)
        {
          v20 = v20 + 1.0;
          v19 = v19 - v16;
        }
        else if (v19 < 2.0 || v11 < v17)
        {
          v18 = v18 + -1.0;
          v21 = v21 + (double)a5;
          v11 = 0.0;
          v19 = v21;
          v20 = v17;
        }
        else
        {
          v11 = v11 + 1.0;
          v19 = v19 + -2.0;
        }
      }
      else
      {
        v19 = v19 + -v17 * 2.0;
        v11 = v17;
      }
    }
    while (v19 > 0.0);
    if (a6)
      goto LABEL_24;
  }
  if (a7)
    *a7 = v11 / v14;
  v24 = v18 / v14;
  v25 = v24;
  result.height = v25;
  result.width = v24;
  return result;
}

+ (double)locketGadgetColumnWidthForLayoutWidth:(CGSize)a3 layoutMargins:(double)a4 interSpacing:(double)a5 isPhone:(BOOL)a6
{
  BOOL v6;
  unint64_t v7;
  uint64_t v8;

  if (a6)
  {
    if (a3.width <= a3.height)
    {
      v7 = 3;
      return (a3.width - a4 - a5 * (double)(v7 - 1)) / (double)v7;
    }
    v6 = a3.height / a3.width <= 0.472;
    v7 = 6;
    v8 = 4;
  }
  else
  {
    v6 = a3.width <= a3.height;
    v7 = 2;
    v8 = 3;
  }
  if (!v6)
    v7 = v8;
  return (a3.width - a4 - a5 * (double)(v7 - 1)) / (double)v7;
}

void __63__PXLayoutMetricInterpolator_allLayoutMetricConfigurationSizes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 320.0, 480.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 320.0, 568.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 375.0, 667.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 414.0, 736.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 375.0, 812.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)allLayoutMetricConfigurationSizes_configurations;
  allLayoutMetricConfigurationSizes_configurations = v5;

}

void __73__PXLayoutMetricInterpolator_gadgetColumnWidthSpanDoubleSetBInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator;
  gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator = (uint64_t)v0;

  _ConfigureGadgetColumnWidthAndSpacingSetBReferenceValues(0, (void *)gadgetColumnWidthSpanDoubleSetBInterpolator_interpolator);
}

void __75__PXLayoutMetricInterpolator_gadgetColumnSpacingSpanDoubleSetBInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator;
  gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator = (uint64_t)v0;

  _ConfigureGadgetColumnWidthAndSpacingSetBReferenceValues((void *)gadgetColumnSpacingSpanDoubleSetBInterpolator_interpolator, 0);
}

void __73__PXLayoutMetricInterpolator_gadgetColumnWidthSpanDoubleSetAInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator;
  gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator = (uint64_t)v0;

  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(2uLL, 0, (void *)gadgetColumnWidthSpanDoubleSetAInterpolator_interpolator);
}

void __75__PXLayoutMetricInterpolator_gadgetColumnSpacingSpanDoubleSetAInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator;
  gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator = (uint64_t)v0;

  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(2uLL, (void *)gadgetColumnSpacingSpanDoubleSetAInterpolator_interpolator, 0);
}

void __73__PXLayoutMetricInterpolator_gadgetColumnWidthSpanSingleSetAInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnWidthSpanSingleSetAInterpolator_interpolator;
  gadgetColumnWidthSpanSingleSetAInterpolator_interpolator = (uint64_t)v0;

  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(1uLL, 0, (void *)gadgetColumnWidthSpanSingleSetAInterpolator_interpolator);
}

void __75__PXLayoutMetricInterpolator_gadgetColumnSpacingSpanSingleSetAInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator;
  gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator = (uint64_t)v0;

  _ConfigureGadgetColumnWidthAndSpacingSetAReferenceValues(1uLL, (void *)gadgetColumnSpacingSpanSingleSetAInterpolator_interpolator, 0);
}

void __65__PXLayoutMetricInterpolator_photosDetailsEdgeInsetsInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)photosDetailsEdgeInsetsInterpolator_interpolator;
  photosDetailsEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  v2 = (id)photosDetailsEdgeInsetsInterpolator_interpolator;
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 320.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 375.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 375.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 414.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 414.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 768.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 834.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 1024.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 568.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 667.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 32.0, 812.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 32.0, 736.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 32.0, 896.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 32.0, 844.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 32.0, 926.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 1024.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 1112.0);
  objc_msgSend(v2, "setReferenceValue:forMetric:", 16.0, 1366.0);

}

void __65__PXLayoutMetricInterpolator_legacyLayoutMarginWidthInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)legacyLayoutMarginWidthInterpolator_interpolator;
  legacyLayoutMarginWidthInterpolator_interpolator = (uint64_t)v0;

  _ConfigureStandardLayoutMarginValues((void *)legacyLayoutMarginWidthInterpolator_interpolator);
}

uint64_t __87__PXLayoutMetricInterpolator__gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "valueForMetric:", a4);
  v9 = 0.0;
  if (a2 >= 2)
    v9 = (double)(a2 - 1) * a3;
  return objc_msgSend(*(id *)(a1 + 40), "setReferenceValue:forMetric:", (a4 + v8 * -2.0 - v9) / (double)a2);
}

void __62__PXLayoutMetricInterpolator__sharedGridItemWidthInterpolator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_sharedGridEdgeInsetsInterpolator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_sharedGridItemWidthInterpolator_interpolator;
  _sharedGridItemWidthInterpolator_interpolator = v2;

}

void __63__PXLayoutMetricInterpolator__sharedGridEdgeInsetsInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_sharedGridEdgeInsetsInterpolator_interpolator;
  _sharedGridEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  _ConfigureSharedReferenceValues((void *)_sharedGridEdgeInsetsInterpolator_interpolator);
}

void __61__PXLayoutMetricInterpolator_albumsGridItemWidthInterpolator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "albumsGridEdgeInsetsInterpolator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_gridItemWidthInterpolatorWithGridEdgeInsetsInterpolator:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)albumsGridItemWidthInterpolator_interpolator;
  albumsGridItemWidthInterpolator_interpolator = v2;

}

uint64_t __62__PXLayoutMetricInterpolator_albumsGridEdgeInsetsInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)albumsGridEdgeInsetsInterpolator_interpolator;
  albumsGridEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  _ConfigureSharedReferenceValues((void *)albumsGridEdgeInsetsInterpolator_interpolator);
  objc_msgSend((id)albumsGridEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 20.0, 756.0);
  return objc_msgSend((id)albumsGridEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 20.0, 838.0);
}

uint64_t __73__PXLayoutMetricInterpolator_memoriesFeedLandscapeEdgeInsetsInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator;
  memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator = (uint64_t)v0;

  _ConfigureSharedReferenceValues((void *)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator);
  objc_msgSend((id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 65.0, 667.0);
  objc_msgSend((id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 156.0, 724.0);
  objc_msgSend((id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 156.0, 1024.0);
  objc_msgSend((id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 179.0, 1112.0);
  return objc_msgSend((id)memoriesFeedLandscapeEdgeInsetsInterpolator_interpolator, "setReferenceValue:forMetric:", 187.0, 1366.0);
}

@end
