@implementation UITableViewRowAction

+ (UITableViewRowAction)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void *)handler
{
  void *v8;
  NSString *v9;
  void *v10;

  v8 = handler;
  v9 = title;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStyle:title:handler:", style, v9, v8);

  return (UITableViewRowAction *)v10;
}

- (id)_initWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  UITableViewRowAction *v10;
  UITableViewRowAction *v11;
  uint64_t v12;
  UIColor *backgroundColor;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  id handler;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UITableViewRowAction;
  v10 = -[UITableViewRowAction init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_style = a3;
    if (a3 == 1)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
LABEL_7:
        v14 = objc_msgSend(v8, "copy");
        title = v11->_title;
        v11->_title = (NSString *)v14;

        v16 = objc_msgSend(v9, "copy");
        handler = v11->_handler;
        v11->_handler = (id)v16;

        goto LABEL_8;
      }
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = (UIColor *)v12;

    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "rowActionWithStyle:title:handler:", self->_style, self->_title, self->_handler);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", self->_backgroundColor);
  return v4;
}

- (id)_button
{
  return 0;
}

- (UITableViewRowActionStyle)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 16);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  objc_setProperty_nonatomic_copy(self, a2, backgroundColor, 24);
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(UIVisualEffect *)backgroundEffect
{
  objc_setProperty_nonatomic_copy(self, a2, backgroundEffect, 40);
}

- (id)_handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
