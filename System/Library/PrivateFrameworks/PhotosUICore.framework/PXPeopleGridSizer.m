@implementation PXPeopleGridSizer

+ (double)marginForGridClass:(int64_t)a3 width:(double)result
{
  double v4;
  void *v5;
  double v6;
  double v7;

  if ((unint64_t)a3 <= 1)
  {
    v4 = result;
    +[PXPeopleGridSizer _gridCMarginInterpolator](PXPeopleGridSizer, "_gridCMarginInterpolator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForMetric:", v4);
    v7 = v6;

    return v7;
  }
  return result;
}

+ (CGSize)cellSizeForGridClass:(int64_t)a3 width:(double)a4
{
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  CGSize result;

  if ((unint64_t)a3 > 1)
  {
    v15 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v7 = (double)(unint64_t)objc_msgSend(a1, "numberOfColumnsForGridClass:width:");
    objc_msgSend(a1, "marginForGridClass:width:", a3, a4);
    v9 = v8;
    +[PXPeopleGridSizer _gridCGutterInterpolator](PXPeopleGridSizer, "_gridCGutterInterpolator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForMetric:", a4);
    v12 = v11;

    v13 = (a4 - (v7 + -1.0) * v12 - (v9 + v9)) / v7;
    v14 = floorf(v13);
    v15 = v14;
  }
  result.height = v14;
  result.width = v15;
  return result;
}

+ (unint64_t)numberOfColumnsForGridClass:(int64_t)a3 width:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;

  if (a3 == 1)
  {
    +[PXPeopleGridSizer _peopleHomeColumnInterpolator](PXPeopleGridSizer, "_peopleHomeColumnInterpolator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      return 0;
    +[PXPeopleGridSizer _gridCColumnInterpolator](PXPeopleGridSizer, "_gridCColumnInterpolator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "valueForMetric:", a4);
  v8 = (unint64_t)v7;

  return v8;
}

+ (id)_gridCColumnInterpolator
{
  if (_gridCColumnInterpolator_onceToken != -1)
    dispatch_once(&_gridCColumnInterpolator_onceToken, &__block_literal_global_270101);
  return (id)_gridCColumnInterpolator_columnInterpolator;
}

+ (id)_peopleHomeColumnInterpolator
{
  if (_peopleHomeColumnInterpolator_onceToken != -1)
    dispatch_once(&_peopleHomeColumnInterpolator_onceToken, &__block_literal_global_2_270100);
  return (id)_peopleHomeColumnInterpolator_columnInterpolator;
}

+ (id)_gridCMarginInterpolator
{
  if (_gridCMarginInterpolator_onceToken != -1)
    dispatch_once(&_gridCMarginInterpolator_onceToken, &__block_literal_global_3_270099);
  return (id)_gridCMarginInterpolator_marginInterpolator;
}

+ (id)_gridCGutterInterpolator
{
  if (_gridCGutterInterpolator_onceToken != -1)
    dispatch_once(&_gridCGutterInterpolator_onceToken, &__block_literal_global_4_270097);
  return (id)_gridCGutterInterpolator_gutterInterpolator;
}

uint64_t __45__PXPeopleGridSizer__gridCGutterInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_gridCGutterInterpolator_gutterInterpolator;
  _gridCGutterInterpolator_gutterInterpolator = (uint64_t)v0;

  objc_msgSend((id)_gridCGutterInterpolator_gutterInterpolator, "setReferenceValue:forMetric:", 10.0, 460.0);
  objc_msgSend((id)_gridCGutterInterpolator_gutterInterpolator, "setReferenceValue:forMetric:", 20.0, 981.0);
  return objc_msgSend((id)_gridCGutterInterpolator_gutterInterpolator, "setReferenceValue:forMetric:", 24.0, 1195.0);
}

uint64_t __45__PXPeopleGridSizer__gridCMarginInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_gridCMarginInterpolator_marginInterpolator;
  _gridCMarginInterpolator_marginInterpolator = (uint64_t)v0;

  objc_msgSend((id)_gridCMarginInterpolator_marginInterpolator, "setReferenceValue:forMetric:", 20.0, 460.0);
  objc_msgSend((id)_gridCMarginInterpolator_marginInterpolator, "setReferenceValue:forMetric:", 34.0, 981.0);
  return objc_msgSend((id)_gridCMarginInterpolator_marginInterpolator, "setReferenceValue:forMetric:", 52.0, 1195.0);
}

uint64_t __50__PXPeopleGridSizer__peopleHomeColumnInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_peopleHomeColumnInterpolator_columnInterpolator;
  _peopleHomeColumnInterpolator_columnInterpolator = (uint64_t)v0;

  objc_msgSend((id)_peopleHomeColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 2.0, 460.0);
  objc_msgSend((id)_peopleHomeColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 4.0, 726.0);
  objc_msgSend((id)_peopleHomeColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 5.0, 981.0);
  objc_msgSend((id)_peopleHomeColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 6.0, 1194.0);
  return objc_msgSend((id)_peopleHomeColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 7.0, 1195.0);
}

uint64_t __45__PXPeopleGridSizer__gridCColumnInterpolator__block_invoke()
{
  PXLayoutMetricInterpolator *v0;
  void *v1;

  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_gridCColumnInterpolator_columnInterpolator;
  _gridCColumnInterpolator_columnInterpolator = (uint64_t)v0;

  objc_msgSend((id)_gridCColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 3.0, 460.0);
  objc_msgSend((id)_gridCColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 4.0, 726.0);
  objc_msgSend((id)_gridCColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 5.0, 981.0);
  objc_msgSend((id)_gridCColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 6.0, 1194.0);
  return objc_msgSend((id)_gridCColumnInterpolator_columnInterpolator, "setReferenceValue:forMetric:", 7.0, 1195.0);
}

@end
