@implementation _UITableCellAccessoryButton

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITableCellAccessoryButton;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[_UITableCellAccessoryButton _reloadBackgroundImage](self, "_reloadBackgroundImage");
}

- (void)_reloadBackgroundImage
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  -[_UITableCellAccessoryButton backgroundImageProvider](self, "backgroundImageProvider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, UIColor *))v3)[2](v3, self->_accessoryTintColor);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[UIButton setBackgroundImage:forStates:](self, "setBackgroundImage:forStates:", v4, 0);
}

- (id)backgroundImageProvider
{
  return self->_backgroundImageProvider;
}

- (_UITableCellAccessoryButton)initWithFrame:(CGRect)a3 backgroundImageProvider:(id)a4 accessoryType:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  _UITableCellAccessoryButton *v13;
  void *v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UITableCellAccessoryButton;
  v13 = -[UIButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("UICollectionTableSharedSupport.m"), 467, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundImageProvider != NULL"));

    }
    -[_UITableCellAccessoryButton setBackgroundImageProvider:](v13, "setBackgroundImageProvider:", v12);
    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    v13->_accessoryType = a5;
    -[_UITableCellAccessoryButton _reloadBackgroundImage](v13, "_reloadBackgroundImage");
  }

  return v13;
}

- (void)setBackgroundImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 768);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundImageProvider, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_accessoryTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    -[_UITableCellAccessoryButton _reloadBackgroundImage](self, "_reloadBackgroundImage");
  }

}

- (id)_backgroundImageView
{
  void *v2;
  id v3;

  -[UIButton _backgroundView](self, "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

@end
