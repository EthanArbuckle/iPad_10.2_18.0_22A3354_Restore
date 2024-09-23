@implementation _UICellViewAccessory

+ (id)accessoryWithIdentifier:(id)a3 view:(id)a4 options:(int64_t)a5 reservedLayoutWidth:(double)a6
{
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____UICellViewAccessory;
  v9 = a4;
  objc_msgSendSuper2(&v12, sel_accessoryWithIdentifier_, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setView:", v9, v12.receiver, v12.super_class);

  objc_msgSend(v10, "setOptions:", a5);
  objc_msgSend(v10, "setReservedLayoutWidth:", a6);
  return v10;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->super._view, a3);
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (BOOL)alwaysNeedsLayout
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

+ (id)accessoryWithIdentifier:(id)a3 view:(id)a4 options:(int64_t)a5
{
  return (id)objc_msgSend(a1, "accessoryWithIdentifier:view:options:reservedLayoutWidth:", a3, a4, a5, 0.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int64_t options;
  UIView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  UIView *view;
  CGSize result;

  height = a3.height;
  width = a3.width;
  options = self->_options;
  if ((options & 2) != 0)
  {
    v12 = -[UIView _wantsAutolayout](self->super._view, "_wantsAutolayout");
    view = self->super._view;
    if (v12)
      -[UIView systemLayoutSizeFittingSize:](view, "systemLayoutSizeFittingSize:", 0.0, height);
    else
      -[UIView sizeThatFits:](view, "sizeThatFits:", width, height);
    if (v11 >= height)
      v11 = height;
  }
  else
  {
    v7 = self->super._view;
    if ((options & 1) != 0)
    {
      -[UIView sizeThatFits:](v7, "sizeThatFits:", a3.width, a3.height);
    }
    else
    {
      -[UIView frame](v7, "frame");
      v9 = v8;
      v11 = v10;
    }
  }
  result.height = v11;
  result.width = v9;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  UIView *view;
  void *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICellViewAccessory;
  if (-[_UICellAccessory isEqual:](&v12, sel_isEqual_, v4))
  {
    if ((self->_options & 4) != 0)
    {
      view = self->super._view;
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = view;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v5 = 1;
      }
      else
      {
        v5 = 0;
        if (v8 && v9)
          v5 = -[UIView isEqual:](v8, "isEqual:", v9);
      }

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)options
{
  return self->_options;
}

@end
