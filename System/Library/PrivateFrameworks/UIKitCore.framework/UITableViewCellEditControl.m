@implementation UITableViewCellEditControl

- (void)setAccessoryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTintColor, a3);
}

- (void)setAccessoryBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, a3);
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControl;
  -[UIControl setSelected:](&v4, sel_setSelected_, a3);
  -[UITableViewCellEditControl _updateImageView](self, "_updateImageView");
}

- (void)_updateImageView
{
  id v3;

  -[UITableViewCellEditControl _currentImage](self, "_currentImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v3);

}

- (id)_currentImage
{
  int v3;
  void *v4;

  v3 = *((_BYTE *)self + 504) & 3;
  switch(v3)
  {
    case 3:
      if (-[UIControl isHighlighted](self, "isHighlighted") || -[UIControl isSelected](self, "isSelected"))
      {
        -[UITableViewCellEditControl _multiSelectSelectedImage](self, "_multiSelectSelectedImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[UITableViewCellEditControl _multiSelectNotSelectedImage](self, "_multiSelectNotSelectedImage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 2:
      -[UITableViewCellEditControl _insertImage](self, "_insertImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[UITableViewCellEditControl _deleteImage](self, "_deleteImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)_multiSelectNotSelectedImage
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(WeakRetained, "_cellStyle");
  objc_msgSend(WeakRetained, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessoryBaseColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultMultiSelectNotSelectedImageForCellStyle:traitCollection:accessoryBaseColor:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UITableViewCellEditControl)initWithTableViewCell:(id)a3 editingStyle:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  UITableViewCellEditControl *v9;
  UITableViewCellEditControl *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  -[UITableViewCellEditControl defaultSize](self, "defaultSize");
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCellEditControl;
  v9 = -[UIControl initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[UIView setAlpha:](v9, "setAlpha:", 1.0);
    -[UIView setOpaque:](v10, "setOpaque:", 0);
    -[UIControl setRequiresDisplayOnTracking:](v10, "setRequiresDisplayOnTracking:", 1);
    objc_storeWeak((id *)&v10->_cell, v6);
    *((_BYTE *)v10 + 504) = *((_BYTE *)v10 + 504) & 0xFC | a4 & 3;
    if (v10->_imageView)
    {
      -[UITableViewCellEditControl _currentImage](v10, "_currentImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v10->_imageView, "setImage:", v11);

    }
    if (!a4 || a4 == 3)
    {
      -[UIView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
    }
    else if (a4 == 1)
    {
      -[UIControl addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v10, sel__toggleRotate, 64);
    }
    v10->_focalY = NAN;
    v10->_focalHeight = NAN;
  }

  return v10;
}

- (CGSize)defaultSize
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultEditControlSizeForCell:inTableView:", WeakRetained, v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return 0;
}

- (void)setRotated:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;

  if (((((*((_BYTE *)self + 504) & 4) == 0) ^ a3) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__UITableViewCellEditControl_setRotated_animated___block_invoke_2;
    v6[3] = &unk_1E16B70C0;
    v6[4] = self;
    v7 = a3;
    v8 = a4;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __50__UITableViewCellEditControl_setRotated_animated___block_invoke_3;
    v4[3] = &unk_1E16B7F38;
    v5 = a4;
    v4[4] = self;
    +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", a4, &__block_literal_global_516, v6, v4);
  }
}

- (void)setRotated:(BOOL)a3
{
  -[UITableViewCellEditControl setRotated:animated:](self, "setRotated:animated:", a3, 0);
}

- (void)_toggleRotate
{
  -[UITableViewCellEditControl setRotated:animated:](self, "setRotated:animated:", (*((_BYTE *)self + 504) & 4) == 0, 1);
}

- (id)_deleteImage
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultDeleteImageForCell:", WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_insertImage
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_constants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultInsertImageForCell:", WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_multiSelectSelectedImage
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(WeakRetained, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_multiselectCheckmarkColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[UITableViewCellEditControl accessoryTintColor](self, "accessoryTintColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(WeakRetained, "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(WeakRetained, "_cellStyle");
  objc_msgSend(WeakRetained, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCellEditControl accessoryBackgroundColor](self, "accessoryBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultMultiSelectSelectedImageForCellStyle:traitCollection:checkmarkColor:backgroundColor:", v10, v11, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_renderedImage
{
  return -[UIImageView _currentImage](self->_imageView, "_currentImage");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id WeakRetained;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v5 = objc_msgSend(WeakRetained, "_usesModernAccessoriesLayout");

  if (v5)
  {
    -[UITableViewCellEditControl _createImageViewIfNecessary](self, "_createImageViewIfNecessary");
    -[UIImageView _currentImage](self->_imageView, "_currentImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    -[UITableViewCellEditControl defaultSize](self, "defaultSize");
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)adjustLayoutForFocalRect:(CGRect)a3
{
  double height;
  double y;
  _BOOL4 IsEmpty;
  double v7;
  double v8;

  height = a3.size.height;
  y = a3.origin.y;
  IsEmpty = CGRectIsEmpty(a3);
  v7 = NAN;
  if (IsEmpty)
    v8 = NAN;
  else
    v8 = y;
  self->_focalY = v8;
  if (!IsEmpty)
    v7 = height;
  self->_focalHeight = v7;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)_shadowImage
{
  void *v3;
  double v4;
  void *v5;
  _QWORD *ContextStack;
  CGContext *v7;
  uint64_t v8;
  void *v9;
  CGRect v11;

  v3 = (void *)_shadowImage_shadowImage;
  if (!_shadowImage_shadowImage)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    _UIGraphicsBeginImageContextWithOptions(0, 0, 23.5, 23.5, v4);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.05);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set");

    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v7 = 0;
    else
      v7 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = 23.5;
    v11.size.height = 23.5;
    CGContextFillEllipseInRect(v7, v11);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_shadowImage_shadowImage;
    _shadowImage_shadowImage = v8;

    UIGraphicsEndImageContext();
    v3 = (void *)_shadowImage_shadowImage;
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  UIImageView *imageView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  id WeakRetained;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  UIImageView *shadowView;
  UIImageView *v24;
  void *v25;
  UIImageView *v26;
  UIImageView *v27;
  _QWORD v28[9];

  -[UIView bounds](self, "bounds");
  v5 = v4 + v3 * 0.5;
  imageView = self->_imageView;
  -[UITableViewCellEditControl _createImageViewIfNecessary](self, "_createImageViewIfNecessary");
  -[UIImageView _currentImage](self->_imageView, "_currentImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  v12 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v14 = objc_msgSend(WeakRetained, "_usesModernAccessoriesLayout");

  v15 = 3.0;
  if (v14)
    v15 = 0.0;
  v16 = -0.0;
  if (!v14)
    v16 = -3.0;
  if (v12)
    v15 = v16;
  v17 = floor(v5 - v9 * 0.5);
  v18 = floor((self->_focalHeight - v11) * 0.5);
  v19 = self->_focalY + v18;
  v20 = v19;
  v21 = v17 + v15;
  if (imageView)
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v17 + v15, self->_focalY + v18, v9, v11);
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __44__UITableViewCellEditControl_layoutSubviews__block_invoke;
    v28[3] = &unk_1E16B20D8;
    v28[4] = self;
    *(double *)&v28[5] = v17 + v15;
    *(double *)&v28[6] = v19;
    *(double *)&v28[7] = v9;
    *(double *)&v28[8] = v11;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
  }
  v22 = -[UITableViewCellEditControl wantsImageShadow](self, "wantsImageShadow");
  shadowView = self->_shadowView;
  if (v22)
  {
    if (!shadowView)
    {
      v24 = [UIImageView alloc];
      -[UITableViewCellEditControl _shadowImage](self, "_shadowImage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[UIImageView initWithImage:](v24, "initWithImage:", v25);
      v27 = self->_shadowView;
      self->_shadowView = v26;

      -[UIView insertSubview:below:](self, "insertSubview:below:", self->_shadowView, self->_imageView);
      shadowView = self->_shadowView;
    }
    -[UIImageView setFrame:](shadowView, "setFrame:", v21, v20 + 2.0, v9, v11);
  }
  else
  {
    -[UIView removeFromSuperview](shadowView, "removeFromSuperview");
  }
}

uint64_t __44__UITableViewCellEditControl_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControl;
  -[UIControl setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[UITableViewCellEditControl _updateImageView](self, "_updateImageView");
}

uint64_t __50__UITableViewCellEditControl_setRotated_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a2, a3, 0.2, 0.0);
}

_BYTE *__50__UITableViewCellEditControl_setRotated_animated___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 504) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 504) & 0xFB | (4 * *(_BYTE *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 504) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 504) & 0xF7 | (8 * *(_BYTE *)(a1 + 41));
  result = *(_BYTE **)(a1 + 32);
  if ((result[504] & 4) != 0 || (result[504] & 8) != 0)
    return (_BYTE *)objc_msgSend(result, "_updateImageView");
  return result;
}

uint64_t __50__UITableViewCellEditControl_setRotated_animated___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_toggleRotateAnimationDidStop");
  return result;
}

- (BOOL)isRotated
{
  return (*((unsigned __int8 *)self + 504) >> 2) & 1;
}

- (BOOL)isRotating
{
  return (*((unsigned __int8 *)self + 504) >> 3) & 1;
}

- (void)_toggleRotateAnimationDidStop
{
  *((_BYTE *)self + 504) &= ~8u;
  if ((*((_BYTE *)self + 504) & 4) == 0)
    -[UITableViewCellEditControl _updateImageView](self, "_updateImageView");
}

- (BOOL)wantsImageShadow
{
  return 0;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellEditControl;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[UITableViewCellEditControl _updateImageView](self, "_updateImageView");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellEditControl;
  -[UIView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, a3);
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*((_BYTE *)self + 504) & 3) - 1;
  if (v7 >= 3)
    v8 = 4;
  else
    v8 = v7;
  objc_msgSend(v5, "defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:accessoryType:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v9);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (id)viewForFirstBaselineLayout
{
  -[UITableViewCellEditControl _createImageViewIfNecessary](self, "_createImageViewIfNecessary");
  return self->_imageView;
}

- (id)viewForLastBaselineLayout
{
  -[UITableViewCellEditControl _createImageViewIfNecessary](self, "_createImageViewIfNecessary");
  return self->_imageView;
}

- (void)_createImageViewIfNecessary
{
  UIImageView *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  if (!self->_imageView)
  {
    v3 = [UIImageView alloc];
    -[UITableViewCellEditControl _currentImage](self, "_currentImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIImageView initWithImage:](v3, "initWithImage:", v4);
    imageView = self->_imageView;
    self->_imageView = v5;

    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableConstantsForTraitCollection(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (*((_BYTE *)self + 504) & 3) - 1;
    if (v10 >= 3)
      v11 = 4;
    else
      v11 = v10;
    objc_msgSend(v8, "defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:accessoryType:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v12);

    v13 = *((_BYTE *)self + 504) & 3;
    if (v13 == 1)
    {
      v14 = 0.823529412;
      v15 = 0.0;
      v16 = 0.0;
    }
    else
    {
      if (v13 != 2)
      {
LABEL_10:
        -[UIView addSubview:](self, "addSubview:", self->_imageView);
        return;
      }
      v14 = 0.00392156863;
      v15 = 0.678431373;
      v16 = 0.196078431;
    }
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v14, v15, v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _setInteractionTintColor:](self, "_setInteractionTintColor:", v17);

    goto LABEL_10;
  }
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UIColor)accessoryBackgroundColor
{
  return self->_accessoryBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_cell);
}

- (id)_imageView
{
  return self->_imageView;
}

@end
