@implementation _UIVibrancyEffectModernVibrancyImpl

- (_UIVibrancyEffectModernVibrancyImpl)initWithFilter:(id)a3 inputColor1:(id)a4 inputColor2:(id)a5 compositingColor:(id)a6 inputReversed:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _UIVibrancyEffectModernVibrancyImpl *v16;
  uint64_t v17;
  NSString *filterType;
  uint64_t v19;
  UIColor *inputColor1;
  uint64_t v21;
  UIColor *inputColor2;
  void *v23;
  void *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_UIVibrancyEffectModernVibrancyImpl;
  v16 = -[_UIVibrancyEffectModernVibrancyImpl init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    filterType = v16->_filterType;
    v16->_filterType = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    inputColor1 = v16->_inputColor1;
    v16->_inputColor1 = (UIColor *)v19;

    v21 = objc_msgSend(v14, "copy");
    inputColor2 = v16->_inputColor2;
    v16->_inputColor2 = (UIColor *)v21;

    if (v15)
    {
      v23 = (void *)objc_msgSend(v15, "copy");
    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;
    objc_storeStrong((id *)&v16->_compositingColor, v23);

    v16->_inputReversed = a7;
  }

  return v16;
}

- (id)implementationReplacingTintColor:(id)a3
{
  id v4;
  UIColor *compositingColor;
  UIColor *v6;
  UIColor *v7;
  UIColor *v8;
  _BOOL4 v9;
  _UIVibrancyEffectModernVibrancyImpl *v10;
  _UIVibrancyEffectModernVibrancyImpl *v11;

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
      v10 = -[_UIVibrancyEffectModernVibrancyImpl initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:]([_UIVibrancyEffectModernVibrancyImpl alloc], "initWithFilter:inputColor1:inputColor2:compositingColor:inputReversed:", self->_filterType, self->_inputColor1, self->_inputColor2, v6, self->_inputReversed);
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

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *filterType;
  id v6;

  v4 = (void *)*MEMORY[0x1E0CD2F20];
  filterType = self->_filterType;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v4, "isEqualToString:", filterType), CFSTR("UIVibrancyEffectFilterType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_inputColor1, CFSTR("UIVibrancyEffectColor1"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_inputColor2, CFSTR("UIVibrancyEffectColor2"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_compositingColor, CFSTR("UIVibrancyEffectCompositingColor"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_inputReversed, CFSTR("UIVibrancyEffectInputReversed"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_filterType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  UIColor *inputColor1;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  BOOL v10;
  _BOOL4 v11;
  BOOL v12;
  UIColor *inputColor2;
  UIColor *v14;
  _BOOL4 v15;
  UIColor *compositingColor;
  UIColor *v17;
  _BOOL4 v18;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (id *)v4;
    if (!objc_msgSend(v5[1], "isEqualToString:", self->_filterType))
      goto LABEL_24;
    inputColor1 = self->_inputColor1;
    v7 = (UIColor *)v5[2];
    v8 = inputColor1;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        goto LABEL_23;
      v11 = -[UIColor isEqual:](v7, "isEqual:", v8);

      if (!v11)
        goto LABEL_24;
    }
    inputColor2 = self->_inputColor2;
    v7 = (UIColor *)v5[3];
    v14 = inputColor2;
    if (v7 == v14)
    {

    }
    else
    {
      v9 = v14;
      if (!v7 || !v14)
        goto LABEL_23;
      v15 = -[UIColor isEqual:](v7, "isEqual:", v14);

      if (!v15)
        goto LABEL_24;
    }
    compositingColor = self->_compositingColor;
    v7 = (UIColor *)v5[4];
    v17 = compositingColor;
    if (v7 == v17)
    {

LABEL_28:
      v12 = *((unsigned __int8 *)v5 + 40) == self->_inputReversed;
      goto LABEL_25;
    }
    v9 = v17;
    if (v7 && v17)
    {
      v18 = -[UIColor isEqual:](v7, "isEqual:", v17);

      if (v18)
        goto LABEL_28;
LABEL_24:
      v12 = 0;
LABEL_25:

      goto LABEL_26;
    }
LABEL_23:

    goto LABEL_24;
  }
  v12 = 0;
LABEL_26:

  return v12;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  NSString *filterType;
  UIColor *inputColor1;
  UIColor *inputColor2;
  _BOOL8 inputReversed;
  id v10;
  void *v11;
  _UITintColorViewEntry *v12;

  filterType = self->_filterType;
  inputColor1 = self->_inputColor1;
  inputColor2 = self->_inputColor2;
  inputReversed = self->_inputReversed;
  v10 = a3;
  +[UIVibrancyEffect _vibrancyEntryWithType:inputColor1:inputColor2:inputReversed:](UIVibrancyEffect, "_vibrancyEntryWithType:inputColor1:inputColor2:inputReversed:", filterType, inputColor1, inputColor2, inputReversed);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFilterEntry:", v11);

  v12 = objc_alloc_init(_UITintColorViewEntry);
  -[_UITintColorViewEntry setTintColor:](v12, "setTintColor:", self->_compositingColor);
  objc_msgSend(v10, "addViewEffect:", v12);
  objc_msgSend(v10, "setTextShouldRenderWithTintColor:", 1);

}

- (void)appendDescriptionTo:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[NSString isEqualToString:](self->_filterType, "isEqualToString:", *MEMORY[0x1E0CD2F20]))
    v4 = CFSTR(" lightVibrancy");
  else
    v4 = CFSTR(" darkVibrancy");
  objc_msgSend(v5, "appendString:", v4);
  objc_msgSend(v5, "appendFormat:", CFSTR(" inputColor1=%@ inputColor2=%@ compositingColor=%@"), self->_inputColor1, self->_inputColor2, self->_compositingColor);
  if (self->_inputReversed)
    objc_msgSend(v5, "appendString:", CFSTR(" inputReversed"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingColor, 0);
  objc_storeStrong((id *)&self->_inputColor2, 0);
  objc_storeStrong((id *)&self->_inputColor1, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end
