@implementation PXSearchZeroKeywordGadgetSpec

- (PXSearchZeroKeywordGadgetSpec)initWithTraitCollection:(id)a3 scrollAxis:(int64_t)a4
{
  id v7;
  PXSearchZeroKeywordGadgetSpec *v8;
  PXSearchZeroKeywordGadgetSpec *v9;
  CGSize *p_layoutReferenceSize;
  objc_class *v11;
  CGFloat v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSearchZeroKeywordGadgetSpec;
  v8 = -[PXGadgetSpec initWithTraitCollection:scrollAxis:](&v14, sel_initWithTraitCollection_scrollAxis_, v7, a4);
  v9 = v8;
  if (v8)
  {
    p_layoutReferenceSize = &v8->_layoutReferenceSize;
    objc_msgSend(v7, "layoutReferenceSize");
    *(_QWORD *)&p_layoutReferenceSize->width = v11;
    v9->_layoutReferenceSize.height = v12;
    objc_storeStrong((id *)&v9->_traitCollection, a3);
  }

  return v9;
}

- (UIEdgeInsets)contentInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  -[PXSearchZeroKeywordGadgetSpec _contentInsetsInterpolator](self, "_contentInsetsInterpolator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_layoutReferenceSize.width == 0.0)
  {
    v17.receiver = self;
    v17.super_class = (Class)PXSearchZeroKeywordGadgetSpec;
    -[PXGadgetSpec contentInsets](&v17, sel_contentInsets);
  }
  else
  {
    objc_msgSend(v3, "valueForMetric:");
  }
  PXEdgeInsetsMake();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)_contentInsetsInterpolator
{
  PXLayoutMetricInterpolator *v3;
  double v4;
  double v5;

  v3 = objc_alloc_init(PXLayoutMetricInterpolator);
  -[PXExtendedTraitCollection safeAreaInsets](self->_traitCollection, "safeAreaInsets");
  v5 = v4;
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 16.0, 320.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 20.0, 375.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 20.0, 375.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 20.0, 414.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 20.0, 414.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 34.0, 768.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 46.0, 834.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 52.0, 1024.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 56.0, 568.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 62.0, 667.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", v5 + 16.0, 812.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 66.0, 736.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", v5 + 20.0, 896.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 52.0, 1024.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 31.0, 1112.0);
  -[PXLayoutMetricInterpolator setReferenceValue:forMetric:](v3, "setReferenceValue:forMetric:", 52.0, 1366.0);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
