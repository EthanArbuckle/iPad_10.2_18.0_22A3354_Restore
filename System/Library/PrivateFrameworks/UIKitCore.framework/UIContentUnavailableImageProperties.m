@implementation UIContentUnavailableImageProperties

- (void)_setTintColor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setImage:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

}

- (void)_applyToActivityIndicatorView:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "setActivityIndicatorViewStyle:", 16);
    objc_msgSend(v3, "_setCustomWidth:", -[UIContentUnavailableImageProperties _effectiveActivityIndicatorViewWidth](a1));
    objc_msgSend(v3, "setColor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", *(unsigned __int8 *)(a1 + 12));

  }
}

- (double)_effectiveActivityIndicatorViewWidth
{
  double v1;
  double v2;
  double v3;
  BOOL v4;
  double v5;
  uint64_t v6;
  double v7;

  if (!a1)
    return 0.0;
  v1 = *(double *)(a1 + 48);
  v2 = *(double *)(a1 + 56);
  if (v1 >= v2)
    v3 = *(double *)(a1 + 56);
  else
    v3 = *(double *)(a1 + 48);
  v4 = v2 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v1 == *MEMORY[0x1E0C9D820];
  v5 = fmax(v3, 32.0);
  if (v4)
    v5 = 2777777.0;
  v6 = *(_QWORD *)(a1 + 24);
  v7 = 0.0;
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 40) & 1) != 0)
      v7 = *(double *)(v6 + 32);
  }
  return fmax(fmin(v7, v5), 32.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_image);
    v6 = -[UIImageSymbolConfiguration copy](self->_preferredSymbolConfiguration, "copy");
    v7 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6;

    objc_storeStrong((id *)(v5 + 32), self->_tintColor);
    *(double *)(v5 + 40) = self->_cornerRadius;
    *(CGSize *)(v5 + 48) = self->_maximumSize;
    *(_BYTE *)(v5 + 12) = self->_accessibilityIgnoresInvertColors;
    *($7F50D8CB4061C9CDF79E0E588C24EA5D *)(v5 + 8) = self->_imageFlags;
  }
  return (id)v5;
}

- (UIContentUnavailableImageProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIContentUnavailableImageProperties;
  return -[UIContentUnavailableImageProperties init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3;
  const char *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  BOOL v10;
  id v11;

  v3 = a2;
  if (!a1)
    goto LABEL_23;
  v5 = *(_BYTE *)(a1 + 8);
  v11 = v3;
  if ((v5 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (v3)
      v6 = (void *)*((_QWORD *)v3 + 3);
    else
      v6 = 0;
    objc_setProperty_nonatomic_copy((id)a1, v4, v6, 24);
    v5 = *(_BYTE *)(a1 + 8);
    v3 = v11;
    if ((v5 & 2) != 0)
    {
LABEL_4:
      if ((v5 & 4) != 0)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  if (v3)
    v7 = (void *)*((_QWORD *)v3 + 4);
  else
    v7 = 0;
  objc_storeStrong((id *)(a1 + 32), v7);
  v5 = *(_BYTE *)(a1 + 8);
  v3 = v11;
  if ((v5 & 4) != 0)
  {
LABEL_5:
    if ((v5 & 8) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_14:
  if (v3)
    v8 = *((_QWORD *)v3 + 5);
  else
    v8 = 0;
  *(_QWORD *)(a1 + 40) = v8;
  if ((v5 & 8) != 0)
  {
LABEL_6:
    if ((v5 & 0x10) != 0)
      goto LABEL_23;
    goto LABEL_20;
  }
LABEL_17:
  if (v3)
    v9 = *((_OWORD *)v3 + 3);
  else
    v9 = 0uLL;
  *(_OWORD *)(a1 + 48) = v9;
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if (v3)
      v10 = *((_BYTE *)v3 + 12) != 0;
    else
      v10 = 0;
    *(_BYTE *)(a1 + 12) = v10;
  }
LABEL_23:

}

- (BOOL)_isEqualToProperties:(int)a3 compareImage:
{
  unsigned __int8 *v5;
  _BOOL8 v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  int v17;

  v5 = a2;
  if (!a1)
    goto LABEL_25;
  if (-[UIContentUnavailableImageProperties _isEqualToPropertiesQuick:compareImage:](a1, v5, a3))
  {
    v6 = 1;
    goto LABEL_26;
  }
  if (a3)
  {
    v7 = (void *)*((_QWORD *)v5 + 2);
    v8 = *(id *)(a1 + 16);
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v8 || !v9)
        goto LABEL_22;
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_25;
    }
  }
  v12 = (void *)*((_QWORD *)v5 + 3);
  v8 = *(id *)(a1 + 24);
  v13 = v12;
  if (v8 == v13)
  {

  }
  else
  {
    v10 = v13;
    if (!v8 || !v13)
      goto LABEL_22;
    v14 = objc_msgSend(v8, "isEqual:", v13);

    if (!v14)
      goto LABEL_25;
  }
  v15 = (void *)*((_QWORD *)v5 + 4);
  v8 = *(id *)(a1 + 32);
  v16 = v15;
  if (v8 == v16)
  {

    goto LABEL_24;
  }
  v10 = v16;
  if (!v8 || !v16)
  {
LABEL_22:

LABEL_25:
    v6 = 0;
    goto LABEL_26;
  }
  v17 = objc_msgSend(v8, "isEqual:", v16);

  if (!v17)
    goto LABEL_25;
LABEL_24:
  if (*(double *)(a1 + 40) != *((double *)v5 + 5))
    goto LABEL_25;
  v6 = 0;
  if (*(double *)(a1 + 48) == *((double *)v5 + 6) && *(double *)(a1 + 56) == *((double *)v5 + 7))
    v6 = *(unsigned __int8 *)(a1 + 12) == v5[12];
LABEL_26:

  return v6;
}

- (BOOL)_isEqualToPropertiesQuick:(int)a3 compareImage:
{
  _QWORD *v5;
  double *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL8 v12;

  v5 = a2;
  v6 = (double *)v5;
  if (!a1)
    goto LABEL_18;
  if (v5 == (_QWORD *)a1)
  {
    v12 = 1;
  }
  else
  {
    if (a3 && *(_QWORD *)(a1 + 16) != v5[2])
      goto LABEL_18;
    v7 = (void *)v5[3];
    v8 = *(id *)(a1 + 24);
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if (!v8 || !v9)
      {

LABEL_18:
        v12 = 0;
        goto LABEL_19;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_18;
    }
    if (*(_QWORD *)(a1 + 32) != *((_QWORD *)v6 + 4) || *(double *)(a1 + 40) != v6[5])
      goto LABEL_18;
    v12 = 0;
    if (*(double *)(a1 + 48) == v6[6] && *(double *)(a1 + 56) == v6[7])
      v12 = *(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v6 + 12);
  }
LABEL_19:

  return v12;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableImageProperties)initWithCoder:(id)a3
{
  id v4;
  UIContentUnavailableImageProperties *v5;
  uint64_t v6;
  UIImage *image;
  uint64_t v8;
  UIImageSymbolConfiguration *preferredSymbolConfiguration;
  uint64_t v10;
  UIColor *tintColor;
  double v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIContentUnavailableImageProperties;
  v5 = -[UIContentUnavailableImageProperties init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredSymbolConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    preferredSymbolConfiguration = v5->_preferredSymbolConfiguration;
    v5->_preferredSymbolConfiguration = (UIImageSymbolConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    v5->_cornerRadius = v12;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("maximumSize"));
    v5->_maximumSize.width = v13;
    v5->_maximumSize.height = v14;
    v5->_accessibilityIgnoresInvertColors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accessibilityIgnoresInvertColors"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("preferredSymbolConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_imageFlags = *(_BYTE *)&v5->_imageFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v16))
      v17 = 2;
    else
      v17 = 0;
    *(_BYTE *)&v5->_imageFlags = *(_BYTE *)&v5->_imageFlags & 0xFD | v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v18))
      v19 = 4;
    else
      v19 = 0;
    *(_BYTE *)&v5->_imageFlags = *(_BYTE *)&v5->_imageFlags & 0xFB | v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maximumSize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v20))
      v21 = 8;
    else
      v21 = 0;
    *(_BYTE *)&v5->_imageFlags = *(_BYTE *)&v5->_imageFlags & 0xF7 | v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("accessibilityIgnoresInvertColors"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v22))
      v23 = 16;
    else
      v23 = 0;
    *(_BYTE *)&v5->_imageFlags = *(_BYTE *)&v5->_imageFlags & 0xEF | v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *image;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  image = self->_image;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredSymbolConfiguration, CFSTR("preferredSymbolConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("maximumSize"), self->_maximumSize.width, self->_maximumSize.height);
  objc_msgSend(v5, "encodeBool:forKey:", self->_accessibilityIgnoresInvertColors, CFSTR("accessibilityIgnoresInvertColors"));
  v6 = *(_BYTE *)&self->_imageFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("preferredSymbolConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_BYTE *)&self->_imageFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_BYTE *)&self->_imageFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_BYTE *)&self->_imageFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maximumSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

  v14 = (*(_BYTE *)&self->_imageFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("accessibilityIgnoresInvertColors"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v14, v15);

}

- (BOOL)isEqual:(id)a3
{
  UIContentUnavailableImageProperties *v4;
  UIContentUnavailableImageProperties *v5;
  BOOL v6;

  v4 = (UIContentUnavailableImageProperties *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[UIContentUnavailableImageProperties _isEqualToProperties:compareImage:]((uint64_t)self, v5, 0);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UIImageSymbolConfiguration hash](self->_preferredSymbolConfiguration, "hash");
  return -[UIColor hash](self->_tintColor, "hash") ^ v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat width;
  double height;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_image)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("image = %@"), self->_image);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (self->_preferredSymbolConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("preferredSymbolConfiguration = %@"), self->_preferredSymbolConfiguration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_tintColor)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tintColor = %@"), self->_tintColor);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (self->_cornerRadius > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cornerRadius = %g"), *(_QWORD *)&self->_cornerRadius);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)&width);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("maximumSize = %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (self->_accessibilityIgnoresInvertColors)
    objc_msgSend(v3, "addObject:", CFSTR("accessibilityIgnoresInvertColors = YES"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("none");
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v17, self, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (__CFString)_shortDescription
{
  __CFString *v1;
  void *v2;
  objc_class *v3;
  void *v4;
  char *data;
  void *v6;

  v1 = a1;
  if (a1)
  {
    if (a1->data)
    {
      v2 = (void *)MEMORY[0x1E0CB3940];
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      data = v1->data;
      objc_msgSend(data, "_identityDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v4, data, v6);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = CFSTR("none");
    }
  }
  return v1;
}

- (void)_applyToImageView:(uint64_t)a1
{
  uint64_t v3;
  id v4;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 16);
    v4 = a2;
    objc_msgSend(v4, "setImage:", v3);
    objc_msgSend(v4, "setPreferredSymbolConfiguration:", *(_QWORD *)(a1 + 24));
    objc_msgSend(v4, "setTintColor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", *(unsigned __int8 *)(a1 + 12));

  }
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration
{
  *(_BYTE *)&self->_imageFlags |= 1u;
  objc_setProperty_nonatomic_copy(self, a2, preferredSymbolConfiguration, 24);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setTintColor:(UIColor *)tintColor
{
  *(_BYTE *)&self->_imageFlags |= 2u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, tintColor);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  *(_BYTE *)&self->_imageFlags |= 4u;
  self->_cornerRadius = cornerRadius;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  *(_BYTE *)&self->_imageFlags |= 8u;
  self->_maximumSize = maximumSize;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)accessibilityIgnoresInvertColors
{
  *(_BYTE *)&self->_imageFlags |= 0x10u;
  self->_accessibilityIgnoresInvertColors = accessibilityIgnoresInvertColors;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return self->_accessibilityIgnoresInvertColors;
}

@end
