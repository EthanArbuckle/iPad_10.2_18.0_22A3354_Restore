@implementation _UIVibrancyEffectModernCompositedImpl

- (_UIVibrancyEffectModernCompositedImpl)initWithCompositingMode:(int64_t)a3 compositingColor:(id)a4
{
  id v7;
  _UIVibrancyEffectModernCompositedImpl *v8;
  _UIVibrancyEffectModernCompositedImpl *v9;
  uint64_t v10;
  NSString *filterType;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIVibrancyEffectModernCompositedImpl;
  v8 = -[_UIVibrancyEffectModernCompositedImpl init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_compositingMode = a3;
    _UICompositingFilterForMode(a3);
    v10 = objc_claimAutoreleasedReturnValue();
    filterType = v9->_filterType;
    v9->_filterType = (NSString *)v10;

    if (v9->_filterType)
    {
      if (v7)
      {
LABEL_4:
        v12 = (void *)objc_msgSend(v7, "copy");
LABEL_7:
        v14 = v12;
        objc_storeStrong((id *)&v9->_compositingColor, v12);

        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("UIVibrancyEffect.m"), 757, CFSTR("Invalid compositing mode %li"), a3);

      if (v7)
        goto LABEL_4;
    }
    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (id)implementationReplacingTintColor:(id)a3
{
  id v4;
  UIColor *compositingColor;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  _BOOL4 v9;
  _UIVibrancyEffectModernCompositedImpl *v10;
  _UIVibrancyEffectModernCompositedImpl *v11;

  v4 = a3;
  compositingColor = self->_compositingColor;
  v6 = (UIColor *)v4;
  v7 = compositingColor;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = -[_UIVibrancyEffectModernCompositedImpl initWithCompositingMode:compositingColor:]([_UIVibrancyEffectModernCompositedImpl alloc], "initWithCompositingMode:compositingColor:", self->_compositingMode, v6);
      goto LABEL_10;
    }
    v9 = -[UIColor isEqual:](v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_9;
  }
  v10 = self;
LABEL_10:
  v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  return self->_compositingMode;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  UIColor *compositingColor;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;
  BOOL v11;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (id *)v4;
    v6 = v5;
    if (v5[1] == (id)self->_compositingMode)
    {
      compositingColor = self->_compositingColor;
      v8 = (UIColor *)v5[3];
      v9 = compositingColor;
      v10 = v9;
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        if (v8)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (v11)
          v12 = 0;
        else
          v12 = -[UIColor isEqual:](v8, "isEqual:", v9);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t compositingMode;
  id v5;

  compositingMode = self->_compositingMode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", compositingMode, CFSTR("UIVibrancyCompositedType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compositingColor, CFSTR("UIVibrancyEffectCompositingColor"));

}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6;
  _UITintColorViewEntry *v7;
  _UICompositingEffectViewEntry *v8;

  v6 = a3;
  v8 = objc_alloc_init(_UICompositingEffectViewEntry);
  -[_UICompositingEffectViewEntry setFilterType:](v8, "setFilterType:", self->_filterType);
  objc_msgSend(v6, "addViewEffect:", v8);
  v7 = objc_alloc_init(_UITintColorViewEntry);
  -[_UITintColorViewEntry setTintColor:](v7, "setTintColor:", self->_compositingColor);
  objc_msgSend(v6, "addViewEffect:", v7);
  objc_msgSend(v6, "setTextShouldRenderWithTintColor:", 1);

}

- (void)appendDescriptionTo:(id)a3
{
  int64_t compositingMode;
  id v5;
  id v6;

  compositingMode = self->_compositingMode;
  v5 = a3;
  _UICompositingModeName(compositingMode);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" compositingMode=%@ compositingColor=%@"), v6, self->_compositingColor);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingColor, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end
