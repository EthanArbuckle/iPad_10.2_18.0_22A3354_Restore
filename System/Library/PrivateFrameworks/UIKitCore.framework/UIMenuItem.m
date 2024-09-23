@implementation UIMenuItem

- (UIMenuItem)init
{
  return -[UIMenuItem initWithTitle:action:](self, "initWithTitle:action:", &stru_1E16EDF20, sel_self);
}

- (UIMenuItem)initWithTitle:(NSString *)title action:(SEL)action
{
  NSString *v6;
  UIMenuItem *v7;
  UIMenuItem *v8;
  objc_super v10;

  v6 = title;
  v10.receiver = self;
  v10.super_class = (Class)UIMenuItem;
  v7 = -[UIMenuItem init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[UIMenuItem setTitle:](v7, "setTitle:", v6);
    -[UIMenuItem setAction:](v8, "setAction:", action);
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_nonatomic_copy(self, a2, title, 16);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)action
{
  self->_action = action;
}

- (BOOL)dontDismiss
{
  return self->_dontDismiss;
}

- (void)setDontDismiss:(BOOL)a3
{
  self->_dontDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
