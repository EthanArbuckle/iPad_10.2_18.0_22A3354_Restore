@implementation _UIVibrancyEffectVibrantColorMatrixImpl

- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithLightCAColorMatrix:(CAColorMatrix *)a3 darkCAColorMatrix:(CAColorMatrix *)a4 alpha:(double)a5
{
  _UIVibrancyEffectVibrantColorMatrixImpl *v8;
  _UIVibrancyEffectVibrantColorMatrixImpl *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIVibrancyEffectVibrantColorMatrixImpl;
  v8 = -[_UIVibrancyEffectVibrantColorMatrixImpl init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m11 = *(_OWORD *)&a3->m11;
    v10 = *(_OWORD *)&a3->m42;
    v12 = *(_OWORD *)&a3->m15;
    v11 = *(_OWORD *)&a3->m24;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m33 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m42 = v10;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m15 = v12;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m24 = v11;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m11 = *(_OWORD *)&a4->m11;
    v13 = *(_OWORD *)&a4->m42;
    v15 = *(_OWORD *)&a4->m15;
    v14 = *(_OWORD *)&a4->m24;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m33 = *(_OWORD *)&a4->m33;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m42 = v13;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m15 = v15;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m24 = v14;
    v8->_alpha = fmax(fmin(a5, 1.0), 0.0);
    v8->_hasDarkVariant = memcmp(a3, a4, 0x50uLL) != 0;
  }
  return v9;
}

- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithSystemName:(int64_t)a3
{
  char *v5;
  _UIVibrancyEffectVibrantColorMatrixImpl *v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  uint64_t v10;
  UIColor *reducedTransperancyColor;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v23;
  objc_super v24;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIVibrancyEffect.m"), 820, CFSTR("Cannot initialize custom vibrant color matrix effect without a matix"));

  }
  v24.receiver = self;
  v24.super_class = (Class)_UIVibrancyEffectVibrantColorMatrixImpl;
  v5 = -[_UIVibrancyEffectVibrantColorMatrixImpl init](&v24, sel_init);
  v6 = (_UIVibrancyEffectVibrantColorMatrixImpl *)v5;
  if (v5)
  {
    *((_QWORD *)v5 + 1) = a3;
    if (a3 == 3)
    {
      *((_OWORD *)v5 + 1) = xmmword_186678DE0;
      *((_OWORD *)v5 + 2) = xmmword_186678DF0;
      *((_OWORD *)v5 + 3) = xmmword_186678E00;
      *((_OWORD *)v5 + 4) = xmmword_186678E10;
      *((_OWORD *)v5 + 5) = xmmword_186678E20;
      *((_OWORD *)v5 + 6) = xmmword_186678E30;
      *((_OWORD *)v5 + 7) = xmmword_186678E40;
      *((_OWORD *)v5 + 8) = xmmword_186678E50;
      *((_OWORD *)v5 + 9) = xmmword_186678E60;
      *((_OWORD *)v5 + 10) = xmmword_186678E70;
      +[UIColor _systemChromeShadowColor](UIColor, "_systemChromeShadowColor");
      v10 = objc_claimAutoreleasedReturnValue();
      reducedTransperancyColor = v6->_reducedTransperancyColor;
      v6->_reducedTransperancyColor = (UIColor *)v10;

      v6->_hasDarkVariant = 1;
    }
    else
    {
      if (a3 == 2)
      {
        v7 = v5 + 16;
        v8 = v5 + 96;
        *((_OWORD *)v5 + 6) = xmmword_186678E80;
        *((_OWORD *)v5 + 7) = xmmword_186678E90;
        *((_OWORD *)v5 + 8) = xmmword_186678EA0;
        *((_OWORD *)v5 + 9) = xmmword_186678EB0;
        v9 = xmmword_186678EC0;
      }
      else
      {
        if (a3 != 1)
        {
          *((_QWORD *)v5 + 1) = 0;
          v15 = (__int128 *)MEMORY[0x1E0CD2338];
          v16 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
          v17 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
          *((_OWORD *)v5 + 8) = v16;
          *((_OWORD *)v5 + 9) = v17;
          v18 = v15[4];
          *((_OWORD *)v5 + 10) = v18;
          v20 = *v15;
          v19 = v15[1];
          *((_OWORD *)v5 + 6) = *v15;
          *((_OWORD *)v5 + 7) = v19;
          *((_OWORD *)v5 + 4) = v17;
          *((_OWORD *)v5 + 5) = v18;
          *((_OWORD *)v5 + 2) = v19;
          *((_OWORD *)v5 + 3) = v16;
          *((_OWORD *)v5 + 1) = v20;
          goto LABEL_12;
        }
        v7 = v5 + 16;
        v8 = v5 + 96;
        *((_OWORD *)v5 + 6) = xmmword_186678ED0;
        *((_OWORD *)v5 + 7) = xmmword_186678EE0;
        *((_OWORD *)v5 + 8) = xmmword_186678EF0;
        *((_OWORD *)v5 + 9) = xmmword_186678F00;
        v9 = xmmword_186678F10;
      }
      v8[4] = v9;
      v12 = v8[4];
      v14 = v8[1];
      v13 = v8[2];
      v7[3] = v8[3];
      v7[4] = v12;
      v7[1] = v14;
      v7[2] = v13;
      *v7 = *v8;
    }
LABEL_12:
    v6->_alpha = 1.0;
  }
  return v6;
}

- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithCAColorMatrix:(CAColorMatrix *)a3 alpha:(double)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[5];
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = *(_OWORD *)&a3->m15;
  v5 = *(_OWORD *)&a3->m33;
  v11 = *(_OWORD *)&a3->m24;
  v12 = v5;
  v6 = *(_OWORD *)&a3->m33;
  v13 = *(_OWORD *)&a3->m42;
  v7 = *(_OWORD *)&a3->m15;
  v10[0] = *(_OWORD *)&a3->m11;
  v10[1] = v7;
  v9[2] = v11;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a3->m42;
  v9[0] = v10[0];
  v9[1] = v4;
  return -[_UIVibrancyEffectVibrantColorMatrixImpl initWithLightCAColorMatrix:darkCAColorMatrix:alpha:](self, "initWithLightCAColorMatrix:darkCAColorMatrix:alpha:", v10, v9, a4);
}

- (id)implementationReplacingTintColor:(id)a3
{
  double v4;
  double v5;
  _UIVibrancyEffectVibrantColorMatrixImpl *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  objc_msgSend(a3, "alphaComponent");
  v5 = v4;
  if (v4 == self->_alpha)
  {
    v6 = self;
  }
  else
  {
    v6 = (_UIVibrancyEffectVibrantColorMatrixImpl *)objc_opt_new();
    v6->_systemName = self->_systemName;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m11 = *(_OWORD *)&self->_lightVibrantColorMatrix.m11;
    v7 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    v9 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    v8 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m33 = *(_OWORD *)&self->_lightVibrantColorMatrix.m33;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m42 = v7;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m15 = v9;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m24 = v8;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m11 = *(_OWORD *)&self->_darkVibrantColorMatrix.m11;
    v10 = *(_OWORD *)&self->_darkVibrantColorMatrix.m42;
    v12 = *(_OWORD *)&self->_darkVibrantColorMatrix.m15;
    v11 = *(_OWORD *)&self->_darkVibrantColorMatrix.m24;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m33 = *(_OWORD *)&self->_darkVibrantColorMatrix.m33;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m42 = v10;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m15 = v12;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m24 = v11;
    objc_storeStrong((id *)&v6->_reducedTransperancyColor, self->_reducedTransperancyColor);
    v6->_hasDarkVariant = self->_hasDarkVariant;
    v6->_alpha = v5;
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t systemName;

  systemName = self->_systemName;
  if (!systemName)
    return (unint64_t)(float)((float)((float)((float)(self->_lightVibrantColorMatrix.m11
                                                           + self->_lightVibrantColorMatrix.m22)
                                                   + self->_lightVibrantColorMatrix.m33)
                                           + self->_lightVibrantColorMatrix.m44)
                                   * (float)(unint64_t)(self->_alpha * 1000.0));
  return systemName;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  double *v6;
  int64_t systemName;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (double *)v4;
    v6 = v5;
    systemName = self->_systemName;
    if (systemName == *((_QWORD *)v5 + 1))
    {
      if (systemName)
      {
        v8 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (self->_hasDarkVariant == *((unsigned __int8 *)v5 + 192)
        && (!self->_hasDarkVariant || !memcmp(&self->_darkVibrantColorMatrix, v5 + 12, 0x50uLL))
        && self->_alpha == v6[23])
      {
        v8 = memcmp(&self->_lightVibrantColorMatrix, v6 + 2, 0x50uLL) == 0;
        goto LABEL_12;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_systemName, CFSTR("UIVibrancyColorMatrixType"));
  if (!self->_systemName)
  {
    v5 = *(_OWORD *)&self->_lightVibrantColorMatrix.m33;
    v13 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    v14 = v5;
    v15 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    v6 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    v11 = *(_OWORD *)&self->_lightVibrantColorMatrix.m11;
    v12 = v6;
    _UIVisualEffectModelEncodeCAColorMatrix(&v11, *(double *)&v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UIVibrancyEffectColorMatrixLight"));

    if (self->_hasDarkVariant)
    {
      v8 = *(_OWORD *)&self->_darkVibrantColorMatrix.m33;
      v13 = *(_OWORD *)&self->_darkVibrantColorMatrix.m24;
      v14 = v8;
      v15 = *(_OWORD *)&self->_darkVibrantColorMatrix.m42;
      v9 = *(_OWORD *)&self->_darkVibrantColorMatrix.m15;
      v11 = *(_OWORD *)&self->_darkVibrantColorMatrix.m11;
      v12 = v9;
      _UIVisualEffectModelEncodeCAColorMatrix(&v11, *(double *)&v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIVibrancyEffectColorMatrixDark"));

    }
    if (self->_alpha < 1.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIVibrancyEffectColorMatrixAlpha"));
  }

}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!self->_hasDarkVariant)
    goto LABEL_3;
  objc_msgSend(v8, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");
  objc_msgSend(v9, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle");

  if (v11 != v13)
  {
    v14 = 1;
  }
  else
  {
LABEL_3:
    v16.receiver = self;
    v16.super_class = (Class)_UIVibrancyEffectVibrantColorMatrixImpl;
    v14 = -[_UIVibrancyEffectImpl _needsUpdateForTransitionFromEnvironment:toEnvironment:usage:](&v16, sel__needsUpdateForTransitionFromEnvironment_toEnvironment_usage_, v8, v9, a5);
  }

  return v14;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  _UITintColorViewEntry *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  _UIVisualEffectFilterEntry *v18;
  uint64_t v19;
  void *v20;
  _UIVisualEffectFilterEntry *v21;
  _UITintColorViewEntry *v22;
  void *v23;
  _OWORD v24[5];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (self->_reducedTransperancyColor && objc_msgSend(v8, "reducedTransperancy"))
  {
    v10 = objc_alloc_init(_UITintColorViewEntry);
    -[_UITintColorViewEntry setTintColor:](v10, "setTintColor:", self->_reducedTransperancyColor);
    objc_msgSend(v7, "addViewEffect:", v10);
  }
  else
  {
    if (self->_hasDarkVariant
      && (objc_msgSend(v9, "traitCollection"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "userInterfaceStyle"),
          v11,
          v12 == 2))
    {
      v13 = (void *)MEMORY[0x1E0CB3B18];
      v14 = 96;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3B18];
      v14 = 16;
    }
    v15 = (_OWORD *)((char *)self + v14);
    v16 = v15[3];
    v24[2] = v15[2];
    v24[3] = v16;
    v24[4] = v15[4];
    v17 = v15[1];
    v24[0] = *v15;
    v24[1] = v17;
    objc_msgSend(v13, "valueWithCAColorMatrix:", v24);
    v10 = (_UITintColorViewEntry *)objc_claimAutoreleasedReturnValue();
    v18 = [_UIVisualEffectFilterEntry alloc];
    v19 = *MEMORY[0x1E0CD2F08];
    v25 = *MEMORY[0x1E0CD2D20];
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_UIVisualEffectFilterEntry initWithFilterType:configurationValues:requestedValues:identityValues:](v18, "initWithFilterType:configurationValues:requestedValues:identityValues:", v19, v20, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);

    objc_msgSend(v7, "addFilterEntry:", v21);
    v22 = objc_alloc_init(_UITintColorViewEntry);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, self->_alpha);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITintColorViewEntry setTintColor:](v22, "setTintColor:", v23);

    objc_msgSend(v7, "addViewEffect:", v22);
  }

  objc_msgSend(v7, "setTextShouldRenderWithTintColor:", 1);
}

- (void)appendDescriptionTo:(id)a3
{
  id v4;
  void *v5;
  int64_t systemName;
  const __CFString *v7;
  CAColorMatrix *p_lightVibrantColorMatrix;
  __int128 v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v4 = a3;
  v5 = v4;
  systemName = self->_systemName;
  switch(systemName)
  {
    case 3:
      v7 = CFSTR(" style=systemChromeShadow");
      goto LABEL_7;
    case 2:
      v7 = CFSTR(" style=highIntensityShadow");
      goto LABEL_7;
    case 1:
      v7 = CFSTR(" style=lowIntensityShadow");
LABEL_7:
      objc_msgSend(v4, "appendString:", v7);
      goto LABEL_12;
  }
  p_lightVibrantColorMatrix = &self->_lightVibrantColorMatrix;
  v9 = *(_OWORD *)&self->_lightVibrantColorMatrix.m33;
  if (self->_hasDarkVariant)
  {
    v18 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    v19 = v9;
    v20 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    v10 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    v16 = *(_OWORD *)&p_lightVibrantColorMatrix->m11;
    v17 = v10;
    _UIVisualEffectFilterEntryDescribeColorMatrix((uint64_t)&v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)&self->_darkVibrantColorMatrix.m33;
    v18 = *(_OWORD *)&self->_darkVibrantColorMatrix.m24;
    v19 = v12;
    v20 = *(_OWORD *)&self->_darkVibrantColorMatrix.m42;
    v13 = *(_OWORD *)&self->_darkVibrantColorMatrix.m15;
    v16 = *(_OWORD *)&self->_darkVibrantColorMatrix.m11;
    v17 = v13;
    _UIVisualEffectFilterEntryDescribeColorMatrix((uint64_t)&v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" lightVibrantColorMatrix=%@ darkVibrantColorMatrix=%@"), v11, v14);

  }
  else
  {
    v18 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    v19 = v9;
    v20 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    v15 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    v16 = *(_OWORD *)&p_lightVibrantColorMatrix->m11;
    v17 = v15;
    _UIVisualEffectFilterEntryDescribeColorMatrix((uint64_t)&v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" vibrantColorMatrix=%@"), v11);
  }

  objc_msgSend(v5, "appendFormat:", CFSTR(" alpha=%f"), *(_QWORD *)&self->_alpha);
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reducedTransperancyColor, 0);
}

@end
