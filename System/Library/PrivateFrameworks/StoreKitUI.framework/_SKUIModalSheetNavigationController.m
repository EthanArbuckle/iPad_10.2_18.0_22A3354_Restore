@implementation _SKUIModalSheetNavigationController

- (int64_t)preferredUserInterfaceStyle
{
  return self->_forcedUserInterfaceStyle;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[_SKUIModalSheetNavigationController topViewController](self, "topViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SKUIModalSheetNavigationController;
    -[_SKUIModalSheetNavigationController sizeForChildContentContainer:withParentContainerSize:](&v13, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    width = v9;
    height = v10;
  }

  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)forcedUserInterfaceStyle
{
  return self->_forcedUserInterfaceStyle;
}

- (void)setForcedUserInterfaceStyle:(int64_t)a3
{
  self->_forcedUserInterfaceStyle = a3;
}

@end
