@implementation _UICollectionViewListAccessoryDisclosure

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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  -[UIView layoutSubviews](&v21, sel_layoutSubviews);
  -[UIImageView _currentImage](self->_imageView, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, v7);
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v17 = UIRectCenteredIntegralRectScale(0.0, 0.0, v5, v7, v9, v11, v13, v15, v16);
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v17 + v18 * 0.5, v20 + v19 * 0.5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  -[UITableConstants defaultDisclosureLayoutWidthForView:](self->_constants, "defaultDisclosureLayoutWidthForView:", self, a3.width);
  v6 = v5;
  -[_UICollectionViewListAccessoryDisclosure _minimumSizeForHitTesting](self, "_minimumSizeForHitTesting");
  if (height >= v7)
    v8 = v7;
  else
    v8 = height;
  if (v6 >= v8)
    v9 = v6;
  else
    v9 = v8;
  v10 = v6;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGSize)_minimumSizeForHitTesting
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v3 = 44.0;
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v2)
    v4 = 44.0;
  else
    v3 = *MEMORY[0x1E0C9D820];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a3.size.width > 0.0)
  {
    -[_UICollectionViewListAccessoryDisclosure _enforcedWidthForWidth:](self, "_enforcedWidthForWidth:", a3.size.width);
    v9 = v8;
    v10 = x + (width - v8) * 0.5;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    x = UIRectIntegralWithScale(v10, y + (height - height) * 0.5, v9, height, v11);
    y = v12;
    width = v13;
    height = v14;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
}

- (double)_enforcedWidthForWidth:(double)a3
{
  double result;

  -[_UICollectionViewListAccessoryDisclosure _minimumSizeForHitTesting](self, "_minimumSizeForHitTesting");
  if (result <= a3)
    return a3;
  return result;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setConstants:(id)a3
{
  objc_storeStrong((id *)&self->_constants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedElementDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (_UICollectionViewListAccessoryDisclosure)initWithConstants:(id)a3 handlesOwnAction:(BOOL)a4
{
  id v6;
  _UICollectionViewListAccessoryDisclosure *v7;
  _UICollectionViewListAccessoryDisclosure *v8;
  UIImageView *v9;
  UIImageView *imageView;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  v7 = -[UIControl initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    -[UIView setOpaque:](v7, "setOpaque:", 0);
    objc_storeStrong((id *)&v8->_constants, a3);
    v9 = objc_alloc_init(UIImageView);
    imageView = v8->_imageView;
    v8->_imageView = v9;

    -[UIView addSubview:](v8, "addSubview:", v8->_imageView);
  }

  return v8;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
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

- (void)_executeActionHandler
{
  void (**actionHandler)(void);

  actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler)
    actionHandler[2]();
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_accessoryTintColor, a3);
  v5 = a3;
  -[UIView setTintColor:](self->_imageView, "setTintColor:", v5);

}

- (void)setRotated:(BOOL)a3
{
  self->_rotated = a3;
  -[_UICollectionViewListAccessoryDisclosure _updateRotation](self, "_updateRotation");
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
  -[_UICollectionViewListAccessoryDisclosure _updateRotation](self, "_updateRotation");
}

- (void)_updateRotation
{
  _BOOL4 v3;
  double rotationAngle;
  UIImageView *imageView;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v3 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  rotationAngle = self->_rotationAngle;
  if (v3)
    rotationAngle = -rotationAngle;
  if (!self->_rotated)
    rotationAngle = 0.0;
  CGAffineTransformMakeRotation(&v7, rotationAngle);
  imageView = self->_imageView;
  v6 = v7;
  -[UIView setTransform:](imageView, "setTransform:", &v6);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double y;
  double x;
  double v7;
  objc_super v8;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UICollectionViewListAccessoryDisclosure _enforcedWidthForWidth:](self, "_enforcedWidthForWidth:", a3.size.width);
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  -[UIView setBounds:](&v8, sel_setBounds_, x, y, v7, height);
}

- (void)setMenu:(id)a3
{
  UIMenu *v4;
  UIMenu *menu;
  UIMenu *v6;
  UIMenu *v7;
  UIMenu *v8;
  void *v9;
  UIMenu *v10;

  v4 = (UIMenu *)a3;
  menu = self->_menu;
  if (menu != v4)
  {
    v10 = v4;
    v6 = v4;
    v7 = self->_menu;
    self->_menu = v6;
    v8 = menu;

    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIControlMenuUpdateVisibleMenu(v9, v8, v6);

    -[UIMenu setForcedAutomaticSelectionDelegate:](v6, "setForcedAutomaticSelectionDelegate:", self);
    -[UIMenu setForceAutomaticSelection:](v6, "setForceAutomaticSelection:", 1);

    -[UIControl setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v6 != 0);
    v4 = v10;
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  UIMenu *v4;
  UIMenu *v5;
  void *v6;
  _QWORD v8[4];
  UIMenu *v9;

  v4 = self->_menu;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98___UICollectionViewListAccessoryDisclosure_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v8[3] = &unk_1E16B5118;
  v9 = v4;
  v5 = v4;
  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4
{
  void (**selectedElementDidChangeHandler)(id, id);
  id v5;

  selectedElementDidChangeHandler = (void (**)(id, id))self->_selectedElementDidChangeHandler;
  if (selectedElementDidChangeHandler)
  {
    v5 = (id)objc_msgSend(a3, "copy");
    selectedElementDidChangeHandler[2](selectedElementDidChangeHandler, v5);

  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_imageView;
}

- (id)viewForLastBaselineLayout
{
  return self->_imageView;
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (BOOL)rotated
{
  return self->_rotated;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (id)selectedElementDidChangeHandler
{
  return self->_selectedElementDidChangeHandler;
}

- (void)setSelectedElementDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

@end
