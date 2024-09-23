@implementation UIContextualAction

+ (UIContextualAction)contextualActionWithStyle:(UIContextualActionStyle)style title:(NSString *)title handler:(UIContextualActionHandler)handler
{
  UIContextualActionHandler v8;
  NSString *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  v8 = handler;
  v9 = title;
  v10 = objc_alloc_init((Class)a1);
  v10[2] = style;
  objc_msgSend(v10, "setTitle:", v9);

  if (style)
  {
    if (style == UIContextualActionStyleDestructive)
    {
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if (dyld_program_sdk_at_least())
      +[UIColor systemGray3Color](UIColor, "systemGray3Color");
    else
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10[5];
  v10[5] = v11;

  objc_msgSend(v10, "setHandler:", v8);
  return (UIContextualAction *)v10;
}

- (BOOL)isDestructive
{
  return -[UIContextualAction style](self, "style") == UIContextualActionStyleDestructive;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;
  int64_t style;
  UIColor *v8;

  v4 = backgroundColor;
  v8 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        +[UIColor systemRedColor](UIColor, "systemRedColor");
        v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      if (dyld_program_sdk_at_least())
        +[UIColor systemGray3Color](UIColor, "systemGray3Color");
      else
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = self->_backgroundColor;
  self->_backgroundColor = v5;

}

- (void)executePreHandlerWithView:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[UIContextualAction preHandler](self, "preHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIContextualAction preHandler](self, "preHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, UIContextualAction *, id))v5)[2](v5, self, v6);

  }
}

- (void)executeHandlerWithView:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id completionHandler;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v10[5];

  v6 = a3;
  v7 = _Block_copy(a4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v7;

  -[UIContextualAction handler](self, "handler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__UIContextualAction_executeHandlerWithView_completionHandler___block_invoke;
  v10[3] = &unk_1E16B3FD8;
  v10[4] = self;
  ((void (**)(_QWORD, UIContextualAction *, id, _QWORD *))v9)[2](v9, self, v6, v10);

}

uint64_t __63__UIContextualAction_executeHandlerWithView_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeWithResult:", a2);
}

- (void)cancel
{
  id completionHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)_completeWithResult:(BOOL)a3
{
  id completionHandler;
  _BOOL8 v5;
  id v6;
  void (**v7)(id, _BOOL8);

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    v5 = a3;
    v7 = (void (**)(id, _BOOL8))_Block_copy(completionHandler);
    v6 = self->_completionHandler;
    self->_completionHandler = 0;

    v7[2](v7, v5);
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_style);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_title);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_backgroundColor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  NSStringFromSelector(sel_image);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIContextualActionStyle)style
{
  return self->_style;
}

- (UIContextualActionHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 32);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
  objc_setProperty_nonatomic_copy(self, a2, image, 48);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)forcesFallbackBackgroundColor
{
  return self->_forcesFallbackBackgroundColor;
}

- (void)setForcesFallbackBackgroundColor:(BOOL)a3
{
  self->_forcesFallbackBackgroundColor = a3;
}

- (id)preHandler
{
  return self->_preHandler;
}

- (void)setPreHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIMenu)_menu
{
  return self->__menu;
}

- (void)_setMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIVisualEffect)_backgroundEffect
{
  return self->__backgroundEffect;
}

- (void)_setBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundEffect, 0);
  objc_storeStrong((id *)&self->__menu, 0);
  objc_storeStrong(&self->_preHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
