@implementation PXMemoryViewModel

- (PXMemoryViewModel)init
{
  PXMemoryViewModel *v2;
  PXMemoryViewModel *v3;
  NSString *localizedTitle;
  NSString *localizedDateText;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMemoryViewModel;
  v2 = -[PXMemoryViewModel init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    localizedTitle = v2->_localizedTitle;
    v2->_localizedTitle = (NSString *)&stru_1E5149688;

    localizedDateText = v3->_localizedDateText;
    v3->_localizedDateText = (NSString *)&stru_1E5149688;

  }
  return v3;
}

- (void)setLocalizedDateText:(id)a3
{
  NSString *v4;
  NSString *localizedDateText;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_localizedDateText;
  localizedDateText = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqualToString:](v4, "isEqualToString:", v9);

  if (!v7)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 1);
    v8 = v9;
    localizedDateText = self->_localizedDateText;
    self->_localizedDateText = v8;
LABEL_4:

  }
}

- (void)setLocalizedTitle:(id)a3
{
  NSString *v4;
  NSString *localizedTitle;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_localizedTitle;
  localizedTitle = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqualToString:](v4, "isEqualToString:", v9);

  if (!v7)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 2);
    v8 = v9;
    localizedTitle = self->_localizedTitle;
    self->_localizedTitle = v8;
LABEL_4:

  }
}

- (void)setKeyAsset:(id)a3
{
  PXDisplayAsset *v4;
  PXDisplayAsset *keyAsset;
  PXDisplayAsset *v6;
  char v7;
  PXDisplayAsset *v8;
  PXDisplayAsset *v9;

  v9 = (PXDisplayAsset *)a3;
  v4 = self->_keyAsset;
  keyAsset = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[PXDisplayAsset isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 4);
    v8 = v9;
    keyAsset = self->_keyAsset;
    self->_keyAsset = v8;
LABEL_4:

  }
}

- (void)setIsHighlighted:(BOOL)a3
{
  if (self->_isHighlighted != a3)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 8);
    self->_isHighlighted = a3;
  }
}

- (void)setSpecSet:(int64_t)a3
{
  if (self->_specSet != a3)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 16);
    self->_specSet = a3;
  }
}

- (void)setVariant:(int64_t)a3
{
  if (self->_variant != a3)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 16);
    self->_variant = a3;
  }
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_layoutMargins;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_layoutMargins = &self->_layoutMargins;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    -[PXMemoryViewModel signalChange:](self, "signalChange:", 16);
    p_layoutMargins->top = top;
    p_layoutMargins->left = left;
    p_layoutMargins->bottom = bottom;
    p_layoutMargins->right = right;
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMemoryViewModel;
  -[PXMemoryViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (NSString)localizedDateText
{
  return self->_localizedDateText;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (int64_t)specSet
{
  return self->_specSet;
}

- (int64_t)variant
{
  return self->_variant;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDateText, 0);
}

@end
