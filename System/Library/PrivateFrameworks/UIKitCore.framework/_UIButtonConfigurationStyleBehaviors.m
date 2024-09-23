@implementation _UIButtonConfigurationStyleBehaviors

+ (id)plainBehaviors:(uint64_t)a1
{
  uint64_t *v3;
  void *v4;
  _UIButtonConfigurationStyleBehaviors *v5;
  const char *v6;
  int64x2_t *v7;
  SEL v8;
  SEL v9;
  SEL v10;
  void *v11;
  id v12;

  objc_opt_self();
  if (a2)
  {
    if (a2 != 1)
    {
      v12 = 0;
      return v12;
    }
    v3 = &qword_1ECD7E158;
  }
  else
  {
    v3 = &qword_1ECD7E150;
  }
  v4 = (void *)*v3;
  if (!*v3)
  {
    v5 = -[_UIButtonConfigurationStyleBehaviors initWithStyle:]([_UIButtonConfigurationStyleBehaviors alloc], "initWithStyle:", 0);
    v7 = (int64x2_t *)v5;
    if (v5)
    {
      objc_setProperty_nonatomic_copy(v5, v6, CFSTR("plain"), 16);
      objc_setProperty_nonatomic_copy(v7, v8, &__block_literal_global_11_2, 24);
      objc_setProperty_nonatomic_copy(v7, v9, &__block_literal_global_14_4, 32);
      objc_setProperty_nonatomic_copy(v7, v10, &__block_literal_global_16_3, 40);
      v7[3] = vdupq_n_s64(2uLL);
      v7[4].i64[0] = cornerStyleForDeviceIdiomAndConfigurationKind(a2);
    }
    else
    {
      cornerStyleForDeviceIdiomAndConfigurationKind(a2);
    }
    v11 = (void *)*v3;
    *v3 = (uint64_t)v7;

    v4 = (void *)*v3;
  }
  v12 = v4;
  return v12;
}

- (id)effectiveForegroundColorFromBaseColor:(void *)a3 baseBackgroundColor:(uint64_t)a4 state:(void *)a5 traitCollection:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    v12 = *(_QWORD *)(a1 + 24);
    if (v12)
    {
      (*(void (**)(uint64_t, id, id, uint64_t, id))(v12 + 16))(v12, v9, v10, a4, v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v9)
    {
      v13 = v9;
    }
    else
    {
      +[UIColor tintColor](UIColor, "tintColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)behaviorForState:(void *)a1
{
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v3 = a1;
    v4 = v3;
    if ((a2 & 4) != 0)
    {
      v5 = v3[6];
      if (v5 != -1)
      {
        +[_UIButtonConfigurationStyleBehaviors behaviorForStyle:]((uint64_t)_UIButtonConfigurationStyleBehaviors, v5);
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)effectiveBackgroundVisualEffectFromBaseColor:(uint64_t)a3 state:(void *)a4 traitCollection:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a2;
  v8 = a4;
  if (a1 && (v9 = *(_QWORD *)(a1 + 40)) != 0)
  {
    (*(void (**)(uint64_t, id, uint64_t, id))(v9 + 16))(v9, v7, a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)effectiveBackgroundColorFromBaseColor:(uint64_t)a3 state:(void *)a4 traitCollection:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      (*(void (**)(uint64_t, id, uint64_t, id))(v9 + 16))(v9, v7, a3, v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v7)
    {
      v10 = v7;
    }
    else
    {
      +[UIColor tintColor](UIColor, "tintColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)effectiveBehaviorWithoutButtonShapes
{
  id v1;
  id v2;
  void *v3;
  _UIButtonConfigurationStyleBehaviors *v4;
  void *v5;
  const char *v6;
  const char *v7;
  _QWORD *v8;
  const char *v9;

  if (a1)
  {
    v1 = a1;
    +[_UIButtonConfigurationStyleBehaviors plainBehaviors:]((uint64_t)_UIButtonConfigurationStyleBehaviors, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if (v2 == v1)
    {
      v3 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape;
      if (!effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape)
      {
        v4 = -[_UIButtonConfigurationStyleBehaviors initWithStyle:]([_UIButtonConfigurationStyleBehaviors alloc], "initWithStyle:", *((_QWORD *)v1 + 1));
        v5 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape;
        effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape = (uint64_t)v4;

        if (effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape
          && (objc_setProperty_nonatomic_copy((id)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape, v6, *((id *)v1 + 3), 24), (v8 = (_QWORD *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape) != 0)&& (*(_QWORD *)(effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape + 48) = *((_QWORD *)v1 + 6), v8[7] = *((_QWORD *)v1 + 7), v8[8] = *((_QWORD *)v1 + 8), objc_setProperty_nonatomic_copy(v8, v7, CFSTR("plain.noShape"), 16), effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape))
        {
          objc_setProperty_nonatomic_copy((id)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape, v9, &__block_literal_global_7_5, 32);
          v3 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape;
        }
        else
        {
          v3 = 0;
        }
      }
    }
    else
    {
      v3 = v1;
    }
    a1 = v3;
  }
  return a1;
}

- (_UIButtonConfigurationStyleBehaviors)initWithStyle:(int64_t)a3
{
  _UIButtonConfigurationStyleBehaviors *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIButtonConfigurationStyleBehaviors;
  result = -[_UIButtonConfigurationStyleBehaviors init](&v5, sel_init);
  if (result)
  {
    result->_style = a3;
    result->_selectionStyle = -1;
  }
  return result;
}

+ (id)grayBehaviors
{
  void *v0;
  _UIButtonConfigurationStyleBehaviors *v1;
  void *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  objc_opt_self();
  v0 = (void *)grayBehaviors_gray;
  if (!grayBehaviors_gray)
  {
    v1 = -[_UIButtonConfigurationStyleBehaviors initWithStyle:]([_UIButtonConfigurationStyleBehaviors alloc], "initWithStyle:", 1);
    v2 = (void *)grayBehaviors_gray;
    grayBehaviors_gray = (uint64_t)v1;

    if (grayBehaviors_gray)
    {
      objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v3, CFSTR("gray"), 16);
      if (grayBehaviors_gray)
      {
        objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v4, &__block_literal_global_19_3, 24);
        if (grayBehaviors_gray)
        {
          objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v5, &__block_literal_global_22_6, 32);
          if (grayBehaviors_gray)
          {
            objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v6, &__block_literal_global_23_6, 40);
            if (grayBehaviors_gray)
              *(_OWORD *)(grayBehaviors_gray + 48) = xmmword_18667CFC0;
          }
        }
      }
    }
    v7 = cornerStyleForDeviceIdiomAndConfigurationKind(1);
    v0 = (void *)grayBehaviors_gray;
    if (grayBehaviors_gray)
      *(_QWORD *)(grayBehaviors_gray + 64) = v7;
  }
  return v0;
}

+ (id)fillBehaviors
{
  void *v0;
  _UIButtonConfigurationStyleBehaviors *v1;
  void *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  objc_opt_self();
  v0 = (void *)fillBehaviors_fill;
  if (!fillBehaviors_fill)
  {
    v1 = -[_UIButtonConfigurationStyleBehaviors initWithStyle:]([_UIButtonConfigurationStyleBehaviors alloc], "initWithStyle:", 3);
    v2 = (void *)fillBehaviors_fill;
    fillBehaviors_fill = (uint64_t)v1;

    if (fillBehaviors_fill)
    {
      objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v3, CFSTR("filled"), 16);
      if (fillBehaviors_fill)
      {
        objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v4, &__block_literal_global_34_0, 24);
        if (fillBehaviors_fill)
        {
          objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v5, &__block_literal_global_36_1, 32);
          if (fillBehaviors_fill)
          {
            objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v6, &__block_literal_global_38, 40);
            if (fillBehaviors_fill)
              *(_QWORD *)(fillBehaviors_fill + 56) = 100;
          }
        }
      }
    }
    v7 = cornerStyleForDeviceIdiomAndConfigurationKind(1);
    v0 = (void *)fillBehaviors_fill;
    if (fillBehaviors_fill)
      *(_QWORD *)(fillBehaviors_fill + 64) = v7;
  }
  return v0;
}

+ (id)tintBehaviors
{
  void *v0;
  _UIButtonConfigurationStyleBehaviors *v1;
  void *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  objc_opt_self();
  v0 = (void *)tintBehaviors_tint;
  if (!tintBehaviors_tint)
  {
    v1 = -[_UIButtonConfigurationStyleBehaviors initWithStyle:]([_UIButtonConfigurationStyleBehaviors alloc], "initWithStyle:", 2);
    v2 = (void *)tintBehaviors_tint;
    tintBehaviors_tint = (uint64_t)v1;

    if (tintBehaviors_tint)
    {
      objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v3, CFSTR("tinted"), 16);
      if (tintBehaviors_tint)
      {
        objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v4, &__block_literal_global_26_2, 24);
        if (tintBehaviors_tint)
        {
          objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v5, &__block_literal_global_29_1, 32);
          if (tintBehaviors_tint)
          {
            objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v6, &__block_literal_global_31_1, 40);
            if (tintBehaviors_tint)
              *(int64x2_t *)(tintBehaviors_tint + 48) = vdupq_n_s64(3uLL);
          }
        }
      }
    }
    v7 = cornerStyleForDeviceIdiomAndConfigurationKind(1);
    v0 = (void *)tintBehaviors_tint;
    if (tintBehaviors_tint)
      *(_QWORD *)(tintBehaviors_tint + 64) = v7;
  }
  return v0;
}

- (id)effectiveActivityIndicatorColorFromEffectiveColor:(char)a3 state:
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ((a3 & 2) != 0)
    {
      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)behaviorForStyle:(uint64_t)a1
{
  uint64_t v3;
  void *v4;

  v3 = objc_opt_self();
  if (a2 == 1)
  {
    +[_UIButtonConfigurationStyleBehaviors grayBehaviors]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a2 == 2)
  {
    +[_UIButtonConfigurationStyleBehaviors tintBehaviors]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2 == 3)
      +[_UIButtonConfigurationStyleBehaviors fillBehaviors]();
    else
      +[_UIButtonConfigurationStyleBehaviors plainBehaviors:](v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calculateBackgroundVisualEffect, 0);
  objc_storeStrong(&self->_calculateBackgroundColor, 0);
  objc_storeStrong(&self->_calculateForegroundColor, 0);
  objc_storeStrong((id *)&self->_styleDescription, 0);
}

@end
