@implementation UIDynamicModifiedColor

- (BOOL)_isDynamicTintColor
{
  return -[UIColor _isDynamicTintColor](self->_baseColor, "_isDynamicTintColor");
}

- (BOOL)isEqual:(id)a3
{
  UIDynamicModifiedColor *v4;
  UIDynamicModifiedColor *v5;
  UIDynamicModifiedColor *v6;
  char v7;

  v4 = (UIDynamicModifiedColor *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (v5->_alphaComponent == self->_alphaComponent
        && v5->_contrast == self->_contrast
        && v5->_prominence == self->_prominence)
      {
        v7 = -[UIColor isEqual:](v5->_baseColor, "isEqual:", self->_baseColor);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_resolvedMaterialWithTraitCollection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->_alphaComponent == 1.79769313e308 && self->_contrast == -1)
  {
    -[UIDynamicColor _resolvedMaterialWithTraitCollection:](self->_baseColor, "_resolvedMaterialWithTraitCollection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[UIColor hash](self->_baseColor, "hash") ^ self->_contrast ^ self->_prominence ^ (unint64_t)(self->_alphaComponent * 100.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseColor, 0);
}

- (id)initWithBaseColor:(void *)a3 alphaComponent:(double)a4 contrast:
{
  id v8;
  void *v9;
  id *v10;
  void *v12;
  objc_super v13;

  v8 = a2;
  v9 = v8;
  if (a1)
  {
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithBaseColor_alphaComponent_contrast_, a1, CFSTR("UIColor.m"), 3996, CFSTR("Invalid baseColor: %@"), v9);

    }
    v13.receiver = a1;
    v13.super_class = (Class)UIDynamicModifiedColor;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((double *)a1 + 4) = a4;
      a1[5] = a3;
      a1[6] = (id)-1;
    }
  }

  return a1;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t contrast;
  UIDynamicColor *baseColor;
  id v8;
  UIDynamicColor *v9;
  UIDynamicColor *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  UIDynamicColor *v14;
  UIDynamicColor *v15;
  UIDynamicColor *v16;
  UIDynamicColor *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t prominence;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  UIDynamicColor *v28;

  v4 = a3;
  v5 = v4;
  contrast = self->_contrast;
  if (contrast)
  {
    if (contrast != 1)
    {
      -[UIDynamicColor _resolvedColorWithTraitCollection:](self->_baseColor, "_resolvedColorWithTraitCollection:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    baseColor = self->_baseColor;
    v8 = v4;
    v9 = baseColor;
    v26 = MEMORY[0x1E0C809B0];
    v27 = v8;
    v10 = v9;
    v28 = v10;
    v11 = objc_msgSend(v8, "accessibilityContrast", v26, 3221225472, ___UIResolvedDynamicColorWithHighContrast_block_invoke, &unk_1E16CACA8);
    -[UIDynamicColor _resolvedColorWithTraitCollection:](v10, "_resolvedColorWithTraitCollection:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == 1)
    {
      ___UIResolvedDynamicColorWithHighContrast_block_invoke((uint64_t)&v26, 0);
      v13 = v12;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ___UIResolvedDynamicColorWithHighContrast_block_invoke((uint64_t)&v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v13, "isEqual:", v12))
    {
      if (objc_msgSend(v8, "userInterfaceStyle") == 2)
        +[UIColor _accessibilityLightenedColorForColor:](UIColor, "_accessibilityLightenedColorForColor:", v12);
      else
        +[UIColor _accessibilityDarkenedColorForColor:](UIColor, "_accessibilityDarkenedColorForColor:", v12);
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v18;
    }

  }
  else
  {
    v14 = self->_baseColor;
    v10 = (UIDynamicColor *)v4;
    v15 = v14;
    if (-[UIDynamicColor accessibilityContrast](v10, "accessibilityContrast") == 1)
    {
      -[UIDynamicColor _traitCollectionByReplacingNSIntegerValue:forTraitToken:](v10, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", 0, 0x1E1A99570);
      v16 = (UIDynamicColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v10;
    }
    v17 = v16;
    -[UIDynamicColor _resolvedColorWithTraitCollection:](v15, "_resolvedColorWithTraitCollection:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:
  if (self->_alphaComponent != 1.79769313e308)
  {
    objc_msgSend(v13, "colorWithAlphaComponent:");
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  if (objc_msgSend(v5, "_vibrancy") != 2)
  {
    prominence = self->_prominence;
    if (prominence >= 1)
    {
      v21 = 0.180000007;
      if (prominence == 2)
        v21 = 0.25;
      if (prominence == 1)
        v22 = 0.5;
      else
        v22 = v21;
      objc_msgSend(v13, "alphaComponent", v21);
      objc_msgSend(v13, "colorWithAlphaComponent:", v22 * v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v24;
    }
  }

  return v13;
}

- (UIDynamicModifiedColor)colorWithAlphaComponent:(double)a3
{
  UIDynamicModifiedColor *v3;

  if (self->_alphaComponent == a3)
    v3 = self;
  else
    v3 = (UIDynamicModifiedColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self->_baseColor, (void *)self->_contrast, (void *)self->_prominence, a3);
  return v3;
}

- (id)initWithBaseColor:(void *)a3 alphaComponent:(void *)a4 contrast:(double)a5 prominence:
{
  id v10;
  void *v11;
  id *v12;
  void *v14;
  objc_super v15;

  v10 = a2;
  v11 = v10;
  if (a1)
  {
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithBaseColor_alphaComponent_contrast_prominence_, a1, CFSTR("UIColor.m"), 3982, CFSTR("Invalid baseColor: %@"), v11);

    }
    v15.receiver = a1;
    v15.super_class = (Class)UIDynamicModifiedColor;
    v12 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 3, a2);
      *((double *)a1 + 4) = a5;
      a1[5] = a3;
      a1[6] = a4;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIDynamicColor *baseColor;
  id v5;
  objc_super v6;

  baseColor = self->_baseColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", baseColor, CFSTR("UIDynamicModifiedBaseColor"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("UIDynamicModifiedAlphaComponent"), self->_alphaComponent);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contrast, CFSTR("UIDynamicModifiedContrast"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_prominence, CFSTR("UIDynamicModifiedProminence"));
  v6.receiver = self;
  v6.super_class = (Class)UIDynamicModifiedColor;
  -[UIColor encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (id)_highContrastDynamicColor
{
  UIDynamicModifiedColor *v2;

  if (self->_contrast == 1)
    v2 = self;
  else
    v2 = (UIDynamicModifiedColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self->_baseColor, (void *)1, (void *)self->_prominence, self->_alphaComponent);
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t contrast;
  const __CFString *v6;
  unint64_t prominence;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contrast = self->_contrast;
  if (contrast == 1)
  {
    v6 = CFSTR("contrast = high, ");
  }
  else
  {
    if (contrast)
      goto LABEL_6;
    v6 = CFSTR("contrast = normal, ");
  }
  objc_msgSend(v3, "appendString:", v6);
LABEL_6:
  if (self->_alphaComponent != 1.79769313e308)
    objc_msgSend(v4, "appendFormat:", CFSTR("alpha = %g, "), *(_QWORD *)&self->_alphaComponent);
  prominence = self->_prominence;
  if (prominence <= 3)
    objc_msgSend(v4, "appendString:", off_1E16CAD08[prominence]);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p; %@baseColor = %@>"), v10, self, v4, self->_baseColor);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIDynamicModifiedColor)colorWithProminence:(int64_t)a3
{
  UIDynamicModifiedColor *v5;
  UIDynamicModifiedColor *v6;
  void *v7;
  UIDynamicModifiedColor *v8;
  UIDynamicModifiedColor *v9;

  if (-[UIDynamicModifiedColor prominence](self, "prominence") == a3)
  {
    v5 = self;
LABEL_5:
    v6 = v5;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (UIDynamicModifiedColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self->_baseColor, (void *)self->_contrast, (void *)a3, self->_alphaComponent);
    goto LABEL_5;
  }
  -[UIDynamicColor colorWithProminence:](self->_baseColor, "colorWithProminence:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", self->_alphaComponent);
  v8 = (UIDynamicModifiedColor *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v8)
    v9 = v8;

  return v6;
}

- (int64_t)prominence
{
  if (self->_prominence == -1)
    return -[UIDynamicColor prominence](self->_baseColor, "prominence");
  else
    return self->_prominence;
}

@end
