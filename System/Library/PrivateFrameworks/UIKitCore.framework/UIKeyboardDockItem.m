@implementation UIKeyboardDockItem

- (UIKeyboardDockItemButton)button
{
  UIKeyboardDockItemButton *v3;
  UIKeyboardDockItemButton *button;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  if (!self->_button)
  {
    +[UIButton buttonWithType:](UIKeyboardDockItemButton, "buttonWithType:", 1);
    v3 = (UIKeyboardDockItemButton *)objc_claimAutoreleasedReturnValue();
    button = self->_button;
    self->_button = v3;

    -[UIButton imageView](self->_button, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 0);

    -[UIButton titleLabel](self->_button, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 4);

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_button, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    if (qword_1ECD79B20 != -1)
      dispatch_once(&qword_1ECD79B20, &__block_literal_global_348);
    if (_MergedGlobals_13_3)
    {
      +[UIColor systemPurpleColor](UIColor, "systemPurpleColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_button, "setBackgroundColor:", v9);

      +[UIColor greenColor](UIColor, "greenColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton imageView](self->_button, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v10);

    }
  }
  v12 = -[UIView _lightStyleRenderConfig](self->_button, "_lightStyleRenderConfig");
  -[UIView _inheritedRenderConfig](self->_button, "_inheritedRenderConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "animatedBackground");

  if (!v12)
  {
    +[UIKeyboardDockItem _darkStyleGlyphColor](UIKeyboardDockItem, "_darkStyleGlyphColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      objc_msgSend(v17, "colorWithAlphaComponent:", 0.6451);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardDockItemButton setTintColor:](self->_button, "setTintColor:", v19);

      -[UIView setAlpha:](self->_button, "setAlpha:", 0.8);
      v16 = (uint64_t *)MEMORY[0x1E0CD2EA0];
      goto LABEL_11;
    }
LABEL_13:
    -[UIKeyboardDockItemButton setTintColor:](self->_button, "setTintColor:", v18);
    goto LABEL_14;
  }
  if (!v14)
  {
    +[UIKeyboardDockItem _standardGlyphColor](UIKeyboardDockItem, "_standardGlyphColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.2, 0.6451);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardDockItemButton setTintColor:](self->_button, "setTintColor:", v15);

  -[UIView setAlpha:](self->_button, "setAlpha:", 0.8);
  v16 = (uint64_t *)MEMORY[0x1E0CD2E98];
LABEL_11:
  v20 = *v16;
  -[UIView layer](self->_button, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCompositingFilter:", v20);

  -[UIView layer](self->_button, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsGroupOpacity:", 1);
LABEL_14:

  -[UIKeyboardDockItem identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardDockItemButton setIdentifier:](self->_button, "setIdentifier:", v22);

  -[UIKeyboardDockItemButton setupDictationAnimationButtonIfNeeded](self->_button, "setupDictationAnimationButtonIfNeeded");
  return self->_button;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)_darkStyleGlyphColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)_standardGlyphColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.314, 0.333, 0.36, 1.0);
}

- (void)setTitle:(id)a3 image:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_image, a4);
    objc_storeStrong((id *)&self->_title, a3);
    -[UIKeyboardDockItem button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:forState:", v7, 0);

    -[UIKeyboardDockItem button](self, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", 0, 0);
  }
  else
  {
    -[UIKeyboardDockItem button](self, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v11, 0);

    -[UIKeyboardDockItem button](self, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:forState:", 0, 0);
  }

}

- (void)setEnabled:(BOOL)a3
{
  -[UIView setHidden:](self->_button, "setHidden:", !a3);
}

- (UIImage)image
{
  return self->_image;
}

- (UIKeyboardDockItem)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIKeyboardDockItem *v12;
  UIKeyboardDockItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardDockItem;
  v12 = -[UIKeyboardDockItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_image, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (void)setActive:(BOOL)a3
{
  -[UIButton setEnabled:](self->_button, "setEnabled:", a3);
}

- (BOOL)isEqual:(id)a3
{
  UIKeyboardDockItem *v4;
  UIKeyboardDockItem *v5;
  UIKeyboardDockItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (UIKeyboardDockItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[UIKeyboardDockItem title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardDockItem title](v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[UIKeyboardDockItem identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardDockItem identifier](v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_lastTouchUp, 0);
  objc_storeStrong((id *)&self->_customAction, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)enabled
{
  return !-[UIView isHidden](self->_button, "isHidden");
}

- (BOOL)active
{
  return -[UIControl isEnabled](self->_button, "isEnabled");
}

- (NSString)title
{
  return self->_title;
}

- (UIAction)customAction
{
  return self->_customAction;
}

- (void)setCustomAction:(id)a3
{
  objc_storeStrong((id *)&self->_customAction, a3);
}

- (UITouch)lastTouchUp
{
  return self->_lastTouchUp;
}

- (void)setLastTouchUp:(id)a3
{
  objc_storeStrong((id *)&self->_lastTouchUp, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (CGPoint)touchDownPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchDownPoint.x;
  y = self->_touchDownPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchDownPoint:(CGPoint)a3
{
  self->_touchDownPoint = a3;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

@end
