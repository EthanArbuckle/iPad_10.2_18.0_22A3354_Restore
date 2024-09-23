@implementation UIInterfaceActionVisualStyleViewState

- (UIInterfaceActionVisualStyleViewState)init
{
  return -[UIInterfaceActionVisualStyleViewState initWithPropertiesFromTopLevelView:](self, "initWithPropertiesFromTopLevelView:", 0);
}

- (UIInterfaceActionVisualStyleViewState)initWithPropertiesFromTopLevelView:(id)a3
{
  id v4;
  UIInterfaceActionVisualStyleViewState *v5;
  UIInterfaceActionVisualStyleViewState *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionVisualStyleViewState;
  v5 = -[UIInterfaceActionVisualStyleViewState init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[UIInterfaceActionVisualStyleViewState _collectStateFromView:](v5, "_collectStateFromView:", v4);
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInterfaceActionVisualStyleViewState _collectStateFromScreen:](v6, "_collectStateFromScreen:", v7);

    }
  }

  return v6;
}

- (id)copyWithTraitCollection:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[UIInterfaceActionVisualStyleViewState copy](self, "copy");
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (id)copyWithScreen:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[UIInterfaceActionVisualStyleViewState copy](self, "copy");
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)UIInterfaceActionVisualStyleViewState;
  -[UIInterfaceActionVisualStyleViewState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ traitCollection = %@, screen = %@"), v4, self->_traitCollection, self->_screen);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "_collectStateFromVisualStyleViewState:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[UIInterfaceActionVisualStyleViewState _stateEqualToVisualStyleViewState:](self, "_stateEqualToVisualStyleViewState:", v4);

  return v5;
}

- (void)_collectStateFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIScreen *v8;
  UIScreen *screen;
  UITraitCollection *v10;
  UITraitCollection *traitCollection;
  UIColor *v12;
  UIColor *tintColor;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v8 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  }
  screen = self->_screen;
  self->_screen = v8;

  objc_msgSend(v4, "traitCollection");
  v10 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v10;

  objc_msgSend(v4, "tintColor");
  v12 = (UIColor *)objc_claimAutoreleasedReturnValue();

  tintColor = self->_tintColor;
  self->_tintColor = v12;

}

- (void)_collectStateFromScreen:(id)a3
{
  UIScreen *v4;
  UIScreen *screen;
  UITraitCollection *v6;
  UITraitCollection *traitCollection;
  UIColor *v8;
  UIColor *tintColor;

  +[UIScreen mainScreen](UIScreen, "mainScreen", a3);
  v4 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  screen = self->_screen;
  self->_screen = v4;

  -[UIScreen traitCollection](self->_screen, "traitCollection");
  v6 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v6;

  +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  tintColor = self->_tintColor;
  self->_tintColor = v8;

}

- (void)_collectStateFromVisualStyleViewState:(id)a3
{
  id v4;
  UIScreen *v5;
  UIScreen *screen;
  UITraitCollection *v7;
  UITraitCollection *traitCollection;
  UIColor *v9;
  UIColor *tintColor;

  v4 = a3;
  objc_msgSend(v4, "screen");
  v5 = (UIScreen *)objc_claimAutoreleasedReturnValue();
  screen = self->_screen;
  self->_screen = v5;

  objc_msgSend(v4, "traitCollection");
  v7 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v7;

  objc_msgSend(v4, "tintColor");
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();

  tintColor = self->_tintColor;
  self->_tintColor = v9;

}

- (BOOL)_stateEqualToVisualStyleViewState:(id)a3
{
  id v4;
  UIScreen *screen;
  void *v6;
  UITraitCollection *traitCollection;
  void *v8;
  UIColor *tintColor;
  void *v10;
  BOOL v11;

  v4 = a3;
  screen = self->_screen;
  objc_msgSend(v4, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIScreen isEqual:](screen, "isEqual:", v6))
  {
    traitCollection = self->_traitCollection;
    objc_msgSend(v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UITraitCollection isEqual:](traitCollection, "isEqual:", v8))
    {
      tintColor = self->_tintColor;
      objc_msgSend(v4, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[UIColor isEqual:](tintColor, "isEqual:", v10);

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

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
