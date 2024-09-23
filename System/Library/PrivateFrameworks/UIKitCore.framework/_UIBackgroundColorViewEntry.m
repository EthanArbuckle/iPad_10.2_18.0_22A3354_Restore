@implementation _UIBackgroundColorViewEntry

- (void)applyRequestedEffectToView:(id)a3
{
  objc_msgSend(a3, "setBackgroundColor:", self->_color);
}

- (void)applyIdentityEffectToView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "_nilBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)removeEffectFromView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "_nilBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBackgroundColorViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" color=%@"), self->_color);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
