@implementation _UIModernBarButton

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIModernBarButton;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[UIButton setHighlighted:](self, "setHighlighted:", 0);
}

- (BOOL)_likelyToHaveTitle
{
  return 0;
}

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (CGSize)_roundSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  UICeilToViewScale(self);
  v5 = v4;
  UICeilToViewScale(self);
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)a3
{
  self->__additionalSelectionInsets = a3;
}

- (void)_setGuardAgainstDegenerateBaselineCalculation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_guardAgainstDegenerateBaselineCalculation = a3;
  -[UIButton _imageView](self, "_imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "_setGuardAgainstDegenerateBaselineCalculation:", v3);
  }

}

- (BOOL)_guardAgainstDegenerateBaselineCalculation
{
  void *v3;
  char guardAgainstDegenerateBaselineCalculation;

  -[UIButton _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    guardAgainstDegenerateBaselineCalculation = objc_msgSend(v3, "_guardAgainstDegenerateBaselineCalculation");
  else
    guardAgainstDegenerateBaselineCalculation = self->_guardAgainstDegenerateBaselineCalculation;

  return guardAgainstDegenerateBaselineCalculation;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  if (a3.size.width == *MEMORY[0x1E0C9D820] && a3.size.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIModernBarButton;
    -[UIButton contentRectForBounds:](&v8, sel_contentRectForBounds_, a3.origin.x, a3.origin.y);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_setupForUseAsImageButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[UIButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverridingSymbolConfiguration:", v6);

  v12[0] = 0x1E1A99540;
  v12[1] = 0x1E1A995A0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47___UIModernBarButton__setupForUseAsImageButton__block_invoke;
  v10[3] = &unk_1E16B5838;
  v11 = v3;
  v8 = v3;
  v9 = -[UIView _registerForTraitTokenChanges:withHandler:](self, "_registerForTraitTokenChanges:withHandler:", v7, v10);

}

- (BOOL)_shouldAdjustToTraitCollection
{
  int v2;

  v2 = dyld_program_sdk_at_least();
  if (v2)
    LOBYTE(v2) = _UIBarsUseDynamicType();
  return v2;
}

- (CGRect)_selectedIndicatorBounds
{
  double v3;
  double v4;
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
  double v17;
  double v18;
  objc_super v19;
  CGRect result;

  -[_UIModernBarButton _additionalSelectionInsets](self, "_additionalSelectionInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v19.receiver = self;
  v19.super_class = (Class)_UIModernBarButton;
  -[UIButton _selectedIndicatorBounds](&v19, sel__selectedIndicatorBounds);
  v12 = v6 + v11;
  v14 = v13 - (v10 + v6);
  v16 = v4 + v15;
  v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v12;
  return result;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__additionalSelectionInsets.top;
  left = self->__additionalSelectionInsets.left;
  bottom = self->__additionalSelectionInsets.bottom;
  right = self->__additionalSelectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
