@implementation TUIPointerStyle

- (TUIPointerStyle)init
{
  TUIPointerStyle *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIPointerStyle;
  result = -[TUIPointerStyle init](&v3, "init");
  if (result)
  {
    *(_WORD *)&result->_prefersShadow = 257;
    *(_OWORD *)&result->_effect = xmmword_22F3C0;
  }
  return result;
}

- (TUIPointerStyle)initWithOther:(id)a3
{
  id v4;
  TUIPointerStyle *v5;
  uint64_t v6;
  TUIPointerCursor *cursor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIPointerStyle;
  v5 = -[TUIPointerStyle init](&v9, "init");
  if (v5)
  {
    v5->_effect = (int64_t)objc_msgSend(v4, "effect");
    v5->_prefersShadow = objc_msgSend(v4, "prefersShadow");
    v5->_prefersScale = objc_msgSend(v4, "prefersScale");
    v5->_preferredTintMode = (int64_t)objc_msgSend(v4, "preferredTintMode");
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cursor"));
    cursor = v5->_cursor;
    v5->_cursor = (TUIPointerCursor *)v6;

  }
  return v5;
}

+ (id)defaultPointerStyle
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  TUIPointerStyle *v7;
  TUIPointerStyle *v8;
  unsigned __int8 v9;
  BOOL v10;
  TUIPointerCursor *cursor;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  v8 = v7;
  v9 = v7 == self;
  if (v7)
    v10 = v7 == self;
  else
    v10 = 1;
  if (!v10)
  {
    if (self->_effect == v7->_effect
      && self->_prefersShadow == v7->_prefersShadow
      && self->_prefersScale == v7->_prefersScale
      && self->_preferredTintMode == v7->_preferredTintMode)
    {
      cursor = self->_cursor;
      if (cursor == v8->_cursor)
        v9 = 1;
      else
        v9 = -[TUIPointerCursor isEqual:](cursor, "isEqual:");
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)pointerEffectWithPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  switch(self->_effect)
  {
    case 0:
      v5 = UIPointerEffect;
      goto LABEL_6;
    case 1:
      v5 = UIPointerHighlightEffect;
      goto LABEL_6;
    case 2:
      v5 = UIPointerLiftEffect;
LABEL_6:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "effectWithPreview:", v4));
      break;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHoverEffect effectWithPreview:](UIPointerHoverEffect, "effectWithPreview:", v4));
      objc_msgSend(v6, "setPrefersShadow:", self->_prefersShadow);
      objc_msgSend(v6, "setPrefersScaledContent:", self->_prefersScale);
      objc_msgSend(v6, "setPreferredTintMode:", self->_preferredTintMode);
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (TUIPointerStyle)pointerStyleWithEffect:(int64_t)a3
{
  TUIPointerStyle *v4;
  TUIPointerStyle *v5;

  v4 = self;
  if (v4->_effect != a3)
  {
    v5 = -[TUIPointerStyle initWithOther:]([TUIPointerStyle alloc], "initWithOther:", v4);

    -[TUIPointerStyle setEffect:](v5, "setEffect:", a3);
    v4 = v5;
  }
  return v4;
}

- (TUIPointerStyle)pointerStyleWithPrefersShadow:(BOOL)a3
{
  _BOOL8 v3;
  TUIPointerStyle *v4;
  TUIPointerStyle *v5;

  v3 = a3;
  v4 = self;
  if (v4->_prefersShadow != v3)
  {
    v5 = -[TUIPointerStyle initWithOther:]([TUIPointerStyle alloc], "initWithOther:", v4);

    -[TUIPointerStyle setPrefersShadow:](v5, "setPrefersShadow:", v3);
    v4 = v5;
  }
  return v4;
}

- (TUIPointerStyle)pointerStyleWithPrefersScale:(BOOL)a3
{
  _BOOL8 v3;
  TUIPointerStyle *v4;
  TUIPointerStyle *v5;

  v3 = a3;
  v4 = self;
  if (v4->_prefersScale != v3)
  {
    v5 = -[TUIPointerStyle initWithOther:]([TUIPointerStyle alloc], "initWithOther:", v4);

    -[TUIPointerStyle setPrefersScale:](v5, "setPrefersScale:", v3);
    v4 = v5;
  }
  return v4;
}

- (TUIPointerStyle)pointerStyleWithPreferredTintMode:(int64_t)a3
{
  TUIPointerStyle *v4;
  TUIPointerStyle *v5;

  v4 = self;
  if (v4->_preferredTintMode != a3)
  {
    v5 = -[TUIPointerStyle initWithOther:]([TUIPointerStyle alloc], "initWithOther:", v4);

    -[TUIPointerStyle setPreferredTintMode:](v5, "setPreferredTintMode:", a3);
    v4 = v5;
  }
  return v4;
}

- (TUIPointerStyle)pointerStyleWithCursor:(id)a3
{
  id v4;
  TUIPointerStyle *v5;

  v4 = a3;
  v5 = -[TUIPointerStyle initWithOther:]([TUIPointerStyle alloc], "initWithOther:", self);
  -[TUIPointerStyle setCursor:](v5, "setCursor:", v4);

  return v5;
}

- (TUIPointerCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->_cursor, a3);
}

- (int64_t)effect
{
  return self->_effect;
}

- (void)setEffect:(int64_t)a3
{
  self->_effect = a3;
}

- (BOOL)prefersShadow
{
  return self->_prefersShadow;
}

- (void)setPrefersShadow:(BOOL)a3
{
  self->_prefersShadow = a3;
}

- (BOOL)prefersScale
{
  return self->_prefersScale;
}

- (void)setPrefersScale:(BOOL)a3
{
  self->_prefersScale = a3;
}

- (int64_t)preferredTintMode
{
  return self->_preferredTintMode;
}

- (void)setPreferredTintMode:(int64_t)a3
{
  self->_preferredTintMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursor, 0);
}

@end
