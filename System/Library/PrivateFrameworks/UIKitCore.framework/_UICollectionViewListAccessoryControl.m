@implementation _UICollectionViewListAccessoryControl

- (void)setConstants:(id)a3
{
  UITableConstants *v5;
  UITableConstants *v6;

  v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    -[_UICollectionViewListAccessoryControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
    v5 = v6;
  }

}

- (void)setAccessoryTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    -[_UICollectionViewListAccessoryControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
    v5 = v6;
  }

}

- (void)setAccessoryBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_accessoryBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryBackgroundColor, a3);
    -[_UICollectionViewListAccessoryControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
    v5 = v6;
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIControl isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListAccessoryControl;
  -[UIControl setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != v3)
    -[_UICollectionViewListAccessoryControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
}

- (_UICollectionViewListAccessoryControl)initWithType:(int64_t)a3 constants:(id)a4
{
  id v7;
  _UICollectionViewListAccessoryControl *v8;
  _UICollectionViewListAccessoryControl *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListAccessoryControl;
  v8 = -[UIControl initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[UIView setOpaque:](v8, "setOpaque:", 0);
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_constants, a4);
    v9->_needsImageViewUpdate = 1;
    +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection systemTraitsAffectingImageLookup](UITraitCollection, "systemTraitsAffectingImageLookup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[UIView registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v12, sel__setNeedsImageViewUpdate);
  }

  return v9;
}

- (void)setActionHandler:(id)a3
{
  id actionHandler;
  void *v6;
  id v7;

  actionHandler = self->_actionHandler;
  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = self->_actionHandler;
  self->_actionHandler = v6;

  if (!a3 || actionHandler)
  {
    if (!a3)
    {
      if (actionHandler)
        -[UIControl removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, sel__executeActionHandler, 0x2000);
    }
  }
  else
  {
    -[UIControl addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__executeActionHandler, 0x2000);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)_executeActionHandler
{
  void (**actionHandler)(void);

  actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler)
    actionHandler[2]();
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[_UICollectionViewListAccessoryControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewListAccessoryControl;
  -[UIControl setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[_UICollectionViewListAccessoryControl _setNeedsImageViewUpdate](self, "_setNeedsImageViewUpdate");
}

- (void)_setNeedsImageViewUpdate
{
  self->_needsImageViewUpdate = 1;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateImageViewIfNeeded
{
  UIImageView *v3;
  UIImageView *imageView;
  uint64_t v5;
  _BOOL4 v6;
  UITableConstants *constants;
  void *v8;
  UIColor *accessoryTintColor;
  void *v10;
  UIColor *v11;
  uint64_t v12;
  UITableConstants *v13;
  void *v14;
  int64_t type;
  void *v16;
  id v17;

  if (self->_needsImageViewUpdate)
  {
    self->_needsImageViewUpdate = 0;
    if (!self->_imageView)
    {
      v3 = objc_alloc_init(UIImageView);
      imageView = self->_imageView;
      self->_imageView = v3;

      -[UIView addSubview:](self, "addSubview:", self->_imageView);
    }
    switch(self->_type)
    {
      case 0:
        -[UITableConstants defaultDeleteImageWithTintColor:backgroundColor:](self->_constants, "defaultDeleteImageWithTintColor:backgroundColor:", self->_accessoryTintColor, self->_accessoryBackgroundColor);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1:
        -[UITableConstants defaultInsertImageWithTintColor:backgroundColor:](self->_constants, "defaultInsertImageWithTintColor:backgroundColor:", self->_accessoryTintColor, self->_accessoryBackgroundColor);
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v17 = (id)v5;
        break;
      case 2:
        v6 = -[UIControl isSelected](self, "isSelected");
        constants = self->_constants;
        -[UIView traitCollection](self, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        accessoryTintColor = self->_accessoryTintColor;
        if (v6)
          -[UITableConstants defaultMultiSelectSelectedImageForCellStyle:traitCollection:checkmarkColor:backgroundColor:](constants, "defaultMultiSelectSelectedImageForCellStyle:traitCollection:checkmarkColor:backgroundColor:", 0, v8, accessoryTintColor, self->_accessoryBackgroundColor);
        else
          -[UITableConstants defaultMultiSelectNotSelectedImageForCellStyle:traitCollection:accessoryBaseColor:](constants, "defaultMultiSelectNotSelectedImageForCellStyle:traitCollection:accessoryBaseColor:", 0, v8, accessoryTintColor);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        break;
      case 3:
        -[UITableConstants defaultDetailAccessoryImage](self->_constants, "defaultDetailAccessoryImage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = self->_accessoryTintColor;
        v17 = v10;
        if (v11)
        {
          objc_msgSend(v10, "imageWithTintColor:renderingMode:", v11, 1);
          v12 = objc_claimAutoreleasedReturnValue();

          v17 = (id)v12;
        }
        break;
      default:
        v17 = 0;
        break;
    }
    v13 = self->_constants;
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_type >= 4uLL)
      type = 4;
    else
      type = self->_type;
    -[UITableConstants defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:accessoryType:](v13, "defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:accessoryType:", v14, type);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v16);

    -[UIImageView setImage:](self->_imageView, "setImage:", v17);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_UICollectionViewListAccessoryControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded", a3.width, a3.height);
  -[UIImageView _currentImage](self->_imageView, "_currentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewListAccessoryControl;
  -[UIView layoutSubviews](&v12, sel_layoutSubviews);
  -[_UICollectionViewListAccessoryControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
  -[UIImageView _currentImage](self->_imageView, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, v7);
  -[UIView bounds](self, "bounds");
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v9 + v8 * 0.5, v11 + v10 * 0.5);
}

- (id)viewForFirstBaselineLayout
{
  -[_UICollectionViewListAccessoryControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
  return self->_imageView;
}

- (id)viewForLastBaselineLayout
{
  -[_UICollectionViewListAccessoryControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
  return self->_imageView;
}

- (id)_renderedImage
{
  -[_UICollectionViewListAccessoryControl _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
  return -[UIImageView _currentImage](self->_imageView, "_currentImage");
}

- (int64_t)type
{
  return self->_type;
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UIColor)accessoryBackgroundColor
{
  return self->_accessoryBackgroundColor;
}

@end
