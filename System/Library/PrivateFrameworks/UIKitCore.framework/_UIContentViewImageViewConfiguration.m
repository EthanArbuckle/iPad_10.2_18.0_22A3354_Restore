@implementation _UIContentViewImageViewConfiguration

- (_UIContentViewImageViewConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContentViewImageViewConfiguration;
  return -[_UIContentViewImageViewConfiguration init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIContentViewImageViewConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIContentViewImageViewConfiguration *v5;
  uint64_t v6;
  UIImage *image;
  uint64_t v8;
  UIImage *highlightedImage;
  uint64_t v10;
  UIImageSymbolConfiguration *preferredSymbolConfiguration;
  uint64_t v12;
  UIColor *tintColor;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIContentViewImageViewConfiguration;
  v5 = -[_UIContentViewImageViewConfiguration init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highlightedImage"));
    v8 = objc_claimAutoreleasedReturnValue();
    highlightedImage = v5->_highlightedImage;
    v5->_highlightedImage = (UIImage *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredSymbolConfiguration"));
    v10 = objc_claimAutoreleasedReturnValue();
    preferredSymbolConfiguration = v5->_preferredSymbolConfiguration;
    v5->_preferredSymbolConfiguration = (UIImageSymbolConfiguration *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    v5->_cornerRadius = v14;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("reservedLayoutSize"));
    v5->_reservedLayoutSize.width = v15;
    v5->_reservedLayoutSize.height = v16;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("maximumSize"));
    v5->_maximumSize.width = v17;
    v5->_maximumSize.height = v18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("image"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", v19);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("preferredSymbolConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v20))
      v21 = 2;
    else
      v21 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFD | v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v22))
      v23 = 4;
    else
      v23 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xFB | v23;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v24))
      v25 = 8;
    else
      v25 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xF7 | v25;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("reservedLayoutSize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v26))
      v27 = 16;
    else
      v27 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xEF | v27;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maximumSize"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v28))
      v29 = 32;
    else
      v29 = 0;
    *(_BYTE *)&v5->_configurationFlags = *(_BYTE *)&v5->_configurationFlags & 0xDF | v29;

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
  void *v15;
  uint64_t v16;
  id v17;

  image = self->_image;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highlightedImage, CFSTR("highlightedImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredSymbolConfiguration, CFSTR("preferredSymbolConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("reservedLayoutSize"), self->_reservedLayoutSize.width, self->_reservedLayoutSize.height);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("maximumSize"), self->_maximumSize.width, self->_maximumSize.height);
  v6 = *(_BYTE *)&self->_configurationFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("image"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_BYTE *)&self->_configurationFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("preferredSymbolConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_BYTE *)&self->_configurationFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_BYTE *)&self->_configurationFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

  v14 = (*(_BYTE *)&self->_configurationFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("reservedLayoutSize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v14, v15);

  v16 = (*(_BYTE *)&self->_configurationFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maximumSize"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v16, v17);

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
    objc_storeStrong((id *)(v5 + 48), self->_highlightedImage);
    v6 = -[UIImageSymbolConfiguration copy](self->_preferredSymbolConfiguration, "copy");
    v7 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6;

    objc_storeStrong((id *)(v5 + 32), self->_tintColor);
    *(double *)(v5 + 40) = self->_cornerRadius;
    *(CGSize *)(v5 + 56) = self->_reservedLayoutSize;
    *(CGSize *)(v5 + 72) = self->_maximumSize;
    *($86FA21D87CEDB4EE83B4CEBBBEC486C5 *)(v5 + 8) = self->_configurationFlags;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _UIContentViewImageViewConfiguration *v4;
  _UIContentViewImageViewConfiguration *v5;
  BOOL v6;

  v4 = (_UIContentViewImageViewConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_UIContentViewImageViewConfiguration _isEqualToConfiguration:]((uint64_t)self, v5);

  return v6;
}

- (BOOL)_isEqualToConfiguration:(uint64_t)a1
{
  id v3;
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  int v15;

  v3 = a2;
  if (!a1)
    goto LABEL_22;
  if (-[_UIContentViewImageViewConfiguration _isEqualToConfigurationQuick:](a1, v3))
  {
    v4 = 1;
    goto LABEL_23;
  }
  v5 = (void *)*((_QWORD *)v3 + 2);
  v6 = *(id *)(a1 + 16);
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
      goto LABEL_21;
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_22;
  }
  v10 = (void *)*((_QWORD *)v3 + 6);
  v6 = *(id *)(a1 + 48);
  v11 = v10;
  if (v6 == v11)
  {

    goto LABEL_16;
  }
  v8 = v11;
  if (!v6 || !v11)
  {
LABEL_21:

    goto LABEL_22;
  }
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (!v12)
    goto LABEL_22;
LABEL_16:
  v13 = (void *)*((_QWORD *)v3 + 4);
  v6 = *(id *)(a1 + 32);
  v14 = v13;
  if (v6 == v14)
  {

    goto LABEL_25;
  }
  v8 = v14;
  if (!v6 || !v14)
    goto LABEL_21;
  v15 = objc_msgSend(v6, "isEqual:", v14);

  if (!v15)
  {
LABEL_22:
    v4 = 0;
    goto LABEL_23;
  }
LABEL_25:
  if (*(double *)(a1 + 40) != *((double *)v3 + 5))
    goto LABEL_22;
  v4 = 0;
  if (*(double *)(a1 + 56) == *((double *)v3 + 7) && *(double *)(a1 + 64) == *((double *)v3 + 8))
    v4 = *(double *)(a1 + 80) == *((double *)v3 + 10) && *(double *)(a1 + 72) == *((double *)v3 + 9);
LABEL_23:

  return v4;
}

- (BOOL)_isEqualToConfigurationQuick:(uint64_t)a1
{
  _QWORD *v3;
  double *v4;
  _BOOL8 v5;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;

  v3 = a2;
  v4 = (double *)v3;
  if (!a1)
    goto LABEL_5;
  if (v3 == (_QWORD *)a1)
  {
    v5 = 1;
    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 16) != v3[2] || *(_QWORD *)(a1 + 48) != v3[6])
    goto LABEL_5;
  v7 = (void *)v3[3];
  v8 = *(id *)(a1 + 24);
  v9 = v7;
  if (v8 != v9)
  {
    v10 = v9;
    if (v8 && v9)
    {
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (v11)
        goto LABEL_14;
    }
    else
    {

    }
LABEL_5:
    v5 = 0;
    goto LABEL_7;
  }

LABEL_14:
  if (*(_QWORD *)(a1 + 32) != *((_QWORD *)v4 + 4) || *(double *)(a1 + 40) != v4[5])
    goto LABEL_5;
  v5 = 0;
  if (*(double *)(a1 + 56) == v4[7] && *(double *)(a1 + 64) == v4[8])
    v5 = *(double *)(a1 + 80) == v4[10] && *(double *)(a1 + 72) == v4[9];
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[UIImage hash](self->_image, "hash");
  v4 = -[UIImage hash](self->_highlightedImage, "hash") ^ v3;
  v5 = -[UIImageSymbolConfiguration hash](self->_preferredSymbolConfiguration, "hash");
  return v4 ^ v5 ^ -[UIColor hash](self->_tintColor, "hash");
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
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;

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
  width = self->_reservedLayoutSize.width;
  height = self->_reservedLayoutSize.height;
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width != *MEMORY[0x1E0C9D820] || height != v11)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)&width);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("reservedLayoutSize = %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = self->_maximumSize.width;
  v17 = self->_maximumSize.height;
  if (v16 != v10 || v17 != v11)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)&v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("maximumSize = %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("empty configuration");
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v25, self, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
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
    if (a1->data || a1[1].data)
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

- (void)applyToImageView:(id)a3
{
  UIImage *image;
  id v5;

  image = self->_image;
  v5 = a3;
  objc_msgSend(v5, "setImage:", image);
  objc_msgSend(v5, "setHighlightedImage:", self->_highlightedImage);
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", self->_preferredSymbolConfiguration);
  objc_msgSend(v5, "setTintColor:", self->_tintColor);

}

- (void)_applyPropertiesFromDefaultConfiguration:(uint64_t)a1
{
  char *v3;
  const char *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  char *v12;

  v3 = a2;
  if (!a1)
    goto LABEL_27;
  v5 = *(_BYTE *)(a1 + 8);
  v12 = v3;
  if ((v5 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (v3)
      v6 = (void *)*((_QWORD *)v3 + 2);
    else
      v6 = 0;
    objc_storeStrong((id *)(a1 + 16), v6);
    v5 = *(_BYTE *)(a1 + 8);
    v3 = v12;
    if ((v5 & 2) != 0)
    {
LABEL_4:
      if ((v5 & 4) != 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  if (v3)
    v7 = (void *)*((_QWORD *)v3 + 3);
  else
    v7 = 0;
  objc_setProperty_nonatomic_copy((id)a1, v4, v7, 24);
  v5 = *(_BYTE *)(a1 + 8);
  v3 = v12;
  if ((v5 & 4) != 0)
  {
LABEL_5:
    if ((v5 & 8) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_15:
  if (v3)
    v8 = (void *)*((_QWORD *)v3 + 4);
  else
    v8 = 0;
  objc_storeStrong((id *)(a1 + 32), v8);
  v5 = *(_BYTE *)(a1 + 8);
  v3 = v12;
  if ((v5 & 8) != 0)
  {
LABEL_6:
    if ((v5 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_18:
  if (v3)
    v9 = *((_QWORD *)v3 + 5);
  else
    v9 = 0;
  *(_QWORD *)(a1 + 40) = v9;
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    if ((v5 & 0x20) != 0)
      goto LABEL_27;
    goto LABEL_24;
  }
LABEL_21:
  if (v3)
    v10 = *(_OWORD *)(v3 + 56);
  else
    v10 = 0uLL;
  *(_OWORD *)(a1 + 56) = v10;
  if ((v5 & 0x20) == 0)
  {
LABEL_24:
    if (v3)
      v11 = *(_OWORD *)(v3 + 72);
    else
      v11 = 0uLL;
    *(_OWORD *)(a1 + 72) = v11;
  }
LABEL_27:

}

- (void)setImage:(id)a3
{
  *(_BYTE *)&self->_configurationFlags |= 1u;
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  *(_BYTE *)&self->_configurationFlags |= 2u;
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setTintColor:(id)a3
{
  *(_BYTE *)&self->_configurationFlags |= 4u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setCornerRadius:(double)a3
{
  *(_BYTE *)&self->_configurationFlags |= 8u;
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setReservedLayoutSize:(CGSize)a3
{
  *(_BYTE *)&self->_configurationFlags |= 0x10u;
  self->_reservedLayoutSize = a3;
}

- (CGSize)reservedLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_reservedLayoutSize.width;
  height = self->_reservedLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  *(_BYTE *)&self->_configurationFlags |= 0x20u;
  self->_maximumSize = a3;
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

- (void)setHorizontalCenteringWidth:(double)a3
{
  -[_UIContentViewImageViewConfiguration setReservedLayoutSize:](self, "setReservedLayoutSize:", a3, 0.0);
}

- (UIImage)highlightedImage
{
  return self->_highlightedImage;
}

- (void)setHighlightedImage:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
