@implementation _UITintColorViewEntry

- (void)applyRequestedEffectToView:(id)a3
{
  objc_msgSend(a3, "_setOverrideTintColor:", self->_tintColor);
}

- (void)removeEffectFromView:(id)a3
{
  objc_msgSend(a3, "_setOverrideTintColor:", 0);
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (void)applyIdentityEffectToView:(id)a3
{
  objc_msgSend(a3, "_setOverrideTintColor:", 0);
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
  v6.super_class = (Class)_UITintColorViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" tintColor=%@"), self->_tintColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UITintColorViewEntry *v4;
  _UITintColorViewEntry *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_UITintColorViewEntry *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UITintColorViewEntry tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITintColorViewEntry tintColor](v5, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

@end
