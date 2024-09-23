@implementation CollectionsFilterSizeController

- (CollectionsFilterSizeController)initWithCollectionsFilterDisplayStyle:(int64_t)a3 inContext:(int64_t)a4
{
  CollectionsFilterSizeController *v6;
  CollectionsFilterSizeController *v7;
  double v8;
  id v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CollectionsFilterSizeController;
  v6 = -[CollectionsFilterSizeController init](&v13, "init");
  v7 = v6;
  if (!v6)
    return v7;
  v6->_displayStyle = a3;
  v6->_context = a4;
  v8 = 40.0;
  if (a3 == 1)
    v8 = 16.0;
  v9 = -[CollectionsFilterSizeController setDefaultFilterHeight:](v6, "setDefaultFilterHeight:", v8);
  if (MapsFeature_IsEnabled_Maps269(v9, v10))
  {
    -[CollectionsFilterSizeController setFilterPillInset:](v7, "setFilterPillInset:", 6.0, 12.0, 6.0, 12.0);
    -[CollectionsFilterSizeController setDefaultFilterHeight:](v7, "setDefaultFilterHeight:", 32.0);
  }
  else
  {
    -[CollectionsFilterSizeController setFilterPillInset:](v7, "setFilterPillInset:", 15.0, 15.0, 15.0, 15.0);
  }
  switch(a4)
  {
    case 2:
      -[CollectionsFilterSizeController setDefaultFilterHeight:](v7, "setDefaultFilterHeight:", 32.0);
      v11 = 2.0;
LABEL_15:
      -[CollectionsFilterSizeController setSectionInset:](v7, "setSectionInset:", v11);
      return v7;
    case 1:
      v11 = 12.0;
      goto LABEL_15;
    case 0:
      v11 = 13.0;
      if (v7->_displayStyle != 1)
        v11 = 16.0;
      goto LABEL_15;
  }
  return v7;
}

- (CGSize)sizeForFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSAttributedStringKey v22;
  void *v23;
  CGSize result;

  v22 = NSFontAttributeName;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filterFont"));
  v23 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filterTitle"));
  objc_msgSend(v7, "sizeWithAttributes:", v6);
  v9 = v8;
  v11 = v10;

  -[CollectionsFilterSizeController defaultFilterHeight](self, "defaultFilterHeight");
  if (v12 > v11)
  {
    -[CollectionsFilterSizeController defaultFilterHeight](self, "defaultFilterHeight");
    v11 = v13;
  }
  -[CollectionsFilterSizeController setDefaultFilterHeight:](self, "setDefaultFilterHeight:", v11);
  -[CollectionsFilterSizeController filterPillInset](self, "filterPillInset");
  v15 = v14;
  -[CollectionsFilterSizeController filterPillInset](self, "filterPillInset");
  v17 = v16;
  -[CollectionsFilterSizeController defaultFilterHeight](self, "defaultFilterHeight");
  v19 = v18;

  v20 = v9 + v15 + v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (double)minimumLineSpacingForSectionAtIndex:(int64_t)a3
{
  double v3;

  -[CollectionsFilterSizeController filterPillInset](self, "filterPillInset", a3);
  return v3;
}

- (double)minimumInterItemSpacingForSectionAtIndex:(int64_t)a3
{
  int IsEnabled_Maps269;
  double result;

  IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269(self, a2, a3);
  result = 10.0;
  if (IsEnabled_Maps269)
    return 8.0;
  return result;
}

- (double)defaultHeight
{
  double defaultFilterHeight;
  double v4;
  double v5;
  double v6;

  defaultFilterHeight = self->_defaultFilterHeight;
  -[CollectionsFilterSizeController sectionInset](self, "sectionInset");
  v5 = defaultFilterHeight + v4;
  -[CollectionsFilterSizeController sectionInset](self, "sectionInset");
  return v5 + v6;
}

- (UIEdgeInsets)filterPillInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_filterPillInset.top;
  left = self->_filterPillInset.left;
  bottom = self->_filterPillInset.bottom;
  right = self->_filterPillInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFilterPillInset:(UIEdgeInsets)a3
{
  self->_filterPillInset = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (double)defaultFilterHeight
{
  return self->_defaultFilterHeight;
}

- (void)setDefaultFilterHeight:(double)a3
{
  self->_defaultFilterHeight = a3;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

@end
