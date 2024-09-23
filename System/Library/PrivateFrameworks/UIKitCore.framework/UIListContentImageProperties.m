@implementation UIListContentImageProperties

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_image);
    v6 = -[UIImageSymbolConfiguration copy](self->_preferredSymbolConfiguration, "copy");
    v7 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6;

    objc_storeStrong((id *)(v5 + 32), self->_tintColor);
    v8 = objc_msgSend(self->_tintColorTransformer, "copy");
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    *(_QWORD *)(v5 + 80) = self->_tintColorTransformerIdentifier;
    *(double *)(v5 + 48) = self->_cornerRadius;
    *(CGSize *)(v5 + 96) = self->_reservedLayoutSize;
    *(CGSize *)(v5 + 112) = self->_maximumSize;
    *(_BYTE *)(v5 + 12) = self->_accessibilityIgnoresInvertColors;
    objc_storeStrong((id *)(v5 + 56), self->_strokeColor);
    v10 = _Block_copy(self->_strokeColorTransformer);
    v11 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v10;

    *(_QWORD *)(v5 + 88) = self->_strokeColorTransformerIdentifier;
    *(double *)(v5 + 72) = self->_strokeWidth;
    *($1C1F922583BEB0E08A862DB7E06B5FF0 *)(v5 + 8) = self->_imageFlags;
  }
  return (id)v5;
}

- (UIListContentImageProperties)init
{
  UIListContentImageProperties *v2;
  uint64_t v3;
  UIColor *strokeColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIListContentImageProperties;
  v2 = -[UIListContentImageProperties init](&v6, sel_init);
  if (v2)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    strokeColor = v2->_strokeColor;
    v2->_strokeColor = (UIColor *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strokeColorTransformer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong(&self->_tintColorTransformer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (uint64_t)_isEqualToPropertiesQuick:(int)a3 compareImage:
{
  _QWORD *v5;
  double *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = (double *)v5;
  if (!a1)
    goto LABEL_28;
  if (v5 == (_QWORD *)a1)
    goto LABEL_26;
  if (a3 && *(_QWORD *)(a1 + 16) != v5[2])
    goto LABEL_28;
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

LABEL_28:
      v13 = 0;
      goto LABEL_29;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if (!v11)
      goto LABEL_28;
  }
  if (*(_QWORD *)(a1 + 32) != *((_QWORD *)v6 + 4))
    goto LABEL_28;
  v12 = *(_QWORD *)(a1 + 80);
  if (v12 != *((_QWORD *)v6 + 10) || v12 == 1 && *(_QWORD *)(a1 + 40) != *((_QWORD *)v6 + 5))
    goto LABEL_28;
  if (*(double *)(a1 + 48) != v6[6])
    goto LABEL_28;
  v13 = 0;
  if (*(double *)(a1 + 96) == v6[12] && *(double *)(a1 + 104) == v6[13])
  {
    v13 = 0;
    if (*(double *)(a1 + 112) == v6[14] && *(double *)(a1 + 120) == v6[15])
    {
      if (*(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v6 + 12))
        goto LABEL_28;
      if (*(_QWORD *)(a1 + 56) != *((_QWORD *)v6 + 7))
        goto LABEL_28;
      v14 = *(_QWORD *)(a1 + 88);
      if (v14 != *((_QWORD *)v6 + 11) || v14 == 1 && *(_QWORD *)(a1 + 64) != *((_QWORD *)v6 + 8))
        goto LABEL_28;
      if (*(double *)(a1 + 72) != v6[9])
        goto LABEL_28;
LABEL_26:
      v13 = 1;
    }
  }
LABEL_29:

  return v13;
}

- (uint64_t)_isEqualToProperties:(int)a3 compareImage:
{
  void **v5;
  uint64_t v6;
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
  void *v19;
  void *v20;

  v5 = a2;
  if (!a1)
    goto LABEL_23;
  if ((-[UIListContentImageProperties _isEqualToPropertiesQuick:compareImage:](a1, v5, a3) & 1) != 0)
  {
LABEL_3:
    v6 = 1;
    goto LABEL_24;
  }
  if (a3)
  {
    v7 = v5[2];
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
        goto LABEL_23;
    }
  }
  v12 = v5[3];
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
      goto LABEL_23;
  }
  v15 = v5[4];
  v8 = *(id *)(a1 + 32);
  v16 = v15;
  if (v8 == v16)
  {

    goto LABEL_26;
  }
  v10 = v16;
  if (!v8 || !v16)
  {
LABEL_22:

    goto LABEL_23;
  }
  v17 = objc_msgSend(v8, "isEqual:", v16);

  if (!v17)
    goto LABEL_23;
LABEL_26:
  v19 = *(void **)(a1 + 80);
  if (v19 != v5[10] || v19 == (void *)1 && *(void **)(a1 + 40) != v5[5] || *(double *)(a1 + 48) != *((double *)v5 + 6))
    goto LABEL_23;
  v6 = 0;
  if (*(double *)(a1 + 96) == *((double *)v5 + 12) && *(double *)(a1 + 104) == *((double *)v5 + 13))
  {
    v6 = 0;
    if (*(double *)(a1 + 112) == *((double *)v5 + 14) && *(double *)(a1 + 120) == *((double *)v5 + 15))
    {
      if (*(unsigned __int8 *)(a1 + 12) == *((unsigned __int8 *)v5 + 12))
      {
        if (UIEqual(*(void **)(a1 + 56), v5[7]))
        {
          v20 = *(void **)(a1 + 88);
          if (v20 == v5[11]
            && (v20 != (void *)1 || *(void **)(a1 + 64) == v5[8])
            && *(double *)(a1 + 72) == *((double *)v5 + 9))
          {
            goto LABEL_3;
          }
        }
      }
LABEL_23:
      v6 = 0;
    }
  }
LABEL_24:

  return v6;
}

- (void)_applyPropertiesFromDefaultProperties:(uint64_t)a1
{
  id v3;
  const char *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  if (!a1)
    goto LABEL_43;
  v5 = *(_WORD *)(a1 + 8);
  v16 = v3;
  if ((v5 & 1) != 0)
  {
    if ((v5 & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (v3)
      v6 = (void *)*((_QWORD *)v3 + 3);
    else
      v6 = 0;
    objc_setProperty_nonatomic_copy((id)a1, v4, v6, 24);
    v5 = *(_WORD *)(a1 + 8);
    v3 = v16;
    if ((v5 & 2) != 0)
    {
LABEL_4:
      if ((v5 & 4) != 0)
        goto LABEL_5;
      goto LABEL_19;
    }
  }
  if (v3)
    v7 = (void *)*((_QWORD *)v3 + 4);
  else
    v7 = 0;
  objc_storeStrong((id *)(a1 + 32), v7);
  v5 = *(_WORD *)(a1 + 8);
  v3 = v16;
  if ((v5 & 4) != 0)
  {
LABEL_5:
    if ((v5 & 8) != 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_19:
  if (v3)
    v8 = (void *)*((_QWORD *)v3 + 5);
  else
    v8 = 0;
  -[UIListContentImageProperties _setTintColorTransformer:](a1, v8);
  v5 = *(_WORD *)(a1 + 8);
  v3 = v16;
  if ((v5 & 8) != 0)
  {
LABEL_6:
    if ((v5 & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_22:
  if (v3)
    v9 = *((_QWORD *)v3 + 6);
  else
    v9 = 0;
  *(_QWORD *)(a1 + 48) = v9;
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    if ((v5 & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_25:
  if (v3)
    v10 = *((_OWORD *)v3 + 6);
  else
    v10 = 0uLL;
  *(_OWORD *)(a1 + 96) = v10;
  if ((v5 & 0x20) != 0)
  {
LABEL_8:
    if ((v5 & 0x40) != 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_28:
  if (v3)
    v11 = *((_OWORD *)v3 + 7);
  else
    v11 = 0uLL;
  *(_OWORD *)(a1 + 112) = v11;
  if ((v5 & 0x40) != 0)
  {
LABEL_9:
    if ((v5 & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_31:
  if (v3)
    v12 = *((_BYTE *)v3 + 12) != 0;
  else
    v12 = 0;
  *(_BYTE *)(a1 + 12) = v12;
  if ((v5 & 0x80) != 0)
  {
LABEL_10:
    if ((v5 & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_34:
  if (v3)
    v13 = (void *)*((_QWORD *)v3 + 7);
  else
    v13 = 0;
  objc_storeStrong((id *)(a1 + 56), v13);
  v5 = *(_WORD *)(a1 + 8);
  v3 = v16;
  if ((v5 & 0x100) != 0)
  {
LABEL_11:
    if ((v5 & 0x200) != 0)
      goto LABEL_43;
    goto LABEL_40;
  }
LABEL_37:
  if (v3)
    v14 = (void *)*((_QWORD *)v3 + 8);
  else
    v14 = 0;
  -[UIListContentImageProperties __setStrokeColorTransformer:](a1, v14);
  v3 = v16;
  if ((*(_WORD *)(a1 + 8) & 0x200) == 0)
  {
LABEL_40:
    if (v3)
      v15 = *((_QWORD *)v3 + 9);
    else
      v15 = 0;
    *(_QWORD *)(a1 + 72) = v15;
  }
LABEL_43:

}

- (void)_setTintColorTransformer:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v3 = a2;
    *(_QWORD *)(a1 + 80) = _UIConfigurationIdentifierForColorTransformer(v3);
    v4 = objc_msgSend(v3, "copy");

    v5 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v4;

  }
}

- (void)__setStrokeColorTransformer:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v3 = a2;
    *(_QWORD *)(a1 + 88) = _UIConfigurationIdentifierForColorTransformer(v3);
    v4 = objc_msgSend(v3, "copy");

    v5 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v4;

  }
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

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setReservedLayoutSize:(CGSize)reservedLayoutSize
{
  *(_WORD *)&self->_imageFlags |= 0x10u;
  self->_reservedLayoutSize = reservedLayoutSize;
}

- (void)_applyToImageView:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    objc_msgSend(v3, "setImage:", *(_QWORD *)(a1 + 16));
    objc_msgSend(v8, "setPreferredSymbolConfiguration:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40))
    {
      -[UIView _ancestorTintColor](v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "resolvedTintColorForTintColor:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v8, "setTintColor:", v5);
    objc_msgSend(v8, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_resolvedStrokeColorForTintColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setStrokeColor:", v7);

    objc_msgSend(v8, "_setStrokeWidth:", *(double *)(a1 + 72));
    objc_msgSend(v8, "setAccessibilityIgnoresInvertColors:", *(unsigned __int8 *)(a1 + 12));

    v3 = v8;
  }

}

- (UIColor)resolvedTintColorForTintColor:(UIColor *)tintColor
{
  UIColor *v4;
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  void (**tintColorTransformer)(id, id);
  UIColor *v9;
  UIColor *v10;

  v4 = tintColor;
  v5 = v4;
  v6 = self->_tintColor;
  if (!v6)
    v6 = v4;
  v7 = v6;
  tintColorTransformer = (void (**)(id, id))self->_tintColorTransformer;
  if (tintColorTransformer)
  {
    tintColorTransformer[2](tintColorTransformer, v7);
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (void)setTintColor:(UIColor *)tintColor
{
  *(_WORD *)&self->_imageFlags |= 2u;
  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)self, tintColor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIListContentImageProperties)initWithCoder:(id)a3
{
  id v4;
  UIListContentImageProperties *v5;
  uint64_t v6;
  UIImage *image;
  uint64_t v8;
  UIImageSymbolConfiguration *preferredSymbolConfiguration;
  uint64_t v10;
  UIColor *tintColor;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  UIColor *strokeColor;
  uint64_t v19;
  uint64_t v20;
  id strokeColorTransformer;
  uint64_t v22;
  double v23;
  uint64_t v24;
  UIColor *v25;
  void *v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)UIListContentImageProperties;
  v5 = -[UIListContentImageProperties init](&v46, sel_init);
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

    -[UIListContentImageProperties _setTintColorTransformerIdentifier:]((uint64_t)v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tintColorTransformerIdentifier")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    v5->_cornerRadius = v12;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("reservedLayoutSize"));
    v5->_reservedLayoutSize.width = v13;
    v5->_reservedLayoutSize.height = v14;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("maximumSize"));
    v5->_maximumSize.width = v15;
    v5->_maximumSize.height = v16;
    v5->_accessibilityIgnoresInvertColors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accessibilityIgnoresInvertColors"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("strokeColor")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strokeColor"));
      v17 = objc_claimAutoreleasedReturnValue();
      strokeColor = v5->_strokeColor;
      v5->_strokeColor = (UIColor *)v17;

      v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("strokeColorTransformerIdentifier"));
      _UIConfigurationColorTransformerForIdentifier(v19);
      v20 = objc_claimAutoreleasedReturnValue();
      strokeColorTransformer = v5->_strokeColorTransformer;
      v5->_strokeColorTransformer = (id)v20;

      if (v5->_strokeColorTransformer)
        v22 = v19;
      else
        v22 = 0;
      v5->_strokeColorTransformerIdentifier = v22;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("strokeWidth"));
      v5->_strokeWidth = v23;
    }
    else
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v5->_strokeColor;
      v5->_strokeColor = (UIColor *)v24;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("preferredSymbolConfiguration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", v26);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v27))
      v28 = 2;
    else
      v28 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFFD | v28;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColorTransformerIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v29))
      v30 = 4;
    else
      v30 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFFB | v30;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v31))
      v32 = 8;
    else
      v32 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFF7 | v32;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("reservedLayoutSize"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v33))
      v34 = 16;
    else
      v34 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFEF | v34;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maximumSize"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v35))
      v36 = 32;
    else
      v36 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFDF | v36;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("accessibilityIgnoresInvertColors"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v37))
      v38 = 64;
    else
      v38 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFFBF | v38;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v39))
      v40 = 128;
    else
      v40 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFF7F | v40;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColorTransformerIdentifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v41))
      v42 = 256;
    else
      v42 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFEFF | v42;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeWidth"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "decodeBoolForKey:", v43))
      v44 = 512;
    else
      v44 = 0;
    *(_WORD *)&v5->_imageFlags = *(_WORD *)&v5->_imageFlags & 0xFDFF | v44;

  }
  return v5;
}

- (void)_setTintColorTransformerIdentifier:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a1)
  {
    _UIConfigurationColorTransformerForIdentifier(a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v4;

    if (*(_QWORD *)(a1 + 40))
      v6 = a2;
    else
      v6 = 0;
    *(_QWORD *)(a1 + 80) = v6;
  }
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
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  image = self->_image;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredSymbolConfiguration, CFSTR("preferredSymbolConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tintColorTransformerIdentifier, CFSTR("tintColorTransformerIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("reservedLayoutSize"), self->_reservedLayoutSize.width, self->_reservedLayoutSize.height);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("maximumSize"), self->_maximumSize.width, self->_maximumSize.height);
  objc_msgSend(v5, "encodeBool:forKey:", self->_accessibilityIgnoresInvertColors, CFSTR("accessibilityIgnoresInvertColors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_strokeColor, CFSTR("strokeColor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_strokeColorTransformerIdentifier, CFSTR("strokeColorTransformerIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("strokeWidth"), self->_strokeWidth);
  v6 = *(_WORD *)&self->_imageFlags & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("preferredSymbolConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v6, v7);

  v8 = (*(_WORD *)&self->_imageFlags >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v8, v9);

  v10 = (*(_WORD *)&self->_imageFlags >> 2) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("tintColorTransformerIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v10, v11);

  v12 = (*(_WORD *)&self->_imageFlags >> 3) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("cornerRadius"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v12, v13);

  v14 = (*(_WORD *)&self->_imageFlags >> 4) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("reservedLayoutSize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v14, v15);

  v16 = (*(_WORD *)&self->_imageFlags >> 5) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("maximumSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v16, v17);

  v18 = (*(_WORD *)&self->_imageFlags >> 6) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("accessibilityIgnoresInvertColors"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v18, v19);

  v20 = (*(_WORD *)&self->_imageFlags >> 7) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v20, v21);

  v22 = HIBYTE(*(_WORD *)&self->_imageFlags) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeColorTransformerIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v22, v23);

  v24 = (*(_WORD *)&self->_imageFlags >> 9) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasCustomized-%@"), CFSTR("strokeWidth"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", v24, v25);

}

- (BOOL)isEqual:(id)a3
{
  UIListContentImageProperties *v4;
  UIListContentImageProperties *v5;
  char v6;

  v4 = (UIListContentImageProperties *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[UIListContentImageProperties _isEqualToProperties:compareImage:]((uint64_t)self, v5, 0);
  }
  else
  {
    v6 = 0;
  }

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
  unint64_t tintColorTransformerIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat width;
  double height;
  double v14;
  double v15;
  void *v17;
  void *v18;
  void *v19;
  CGFloat v20;
  double v21;
  void *v23;
  void *v24;
  void *v25;
  UIColor *strokeColor;
  UIColor *v27;
  void *v28;
  unint64_t strokeColorTransformerIdentifier;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;

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
  else
  {
    objc_msgSend(v3, "addObject:", CFSTR("tintColor = Inherited"));
  }
  tintColorTransformerIdentifier = self->_tintColorTransformerIdentifier;
  if (tintColorTransformerIdentifier)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    _UIConfigurationColorTransformerIdentifierToString(tintColorTransformerIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("tintColorTransformer = %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  if (self->_cornerRadius > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cornerRadius = %g"), *(_QWORD *)&self->_cornerRadius);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  width = self->_reservedLayoutSize.width;
  height = self->_reservedLayoutSize.height;
  v14 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width != *MEMORY[0x1E0C9D820] || height != v15)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)&width);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("reservedLayoutSize = %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  v20 = self->_maximumSize.width;
  v21 = self->_maximumSize.height;
  if (v20 != v14 || v21 != v15)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)&v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("maximumSize = %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25);

  }
  if (self->_accessibilityIgnoresInvertColors)
    objc_msgSend(v3, "addObject:", CFSTR("accessibilityIgnoresInvertColors = YES"));
  if (self->_strokeWidth > 0.0)
  {
    strokeColor = self->_strokeColor;
    +[UIColor clearColor](UIColor, "clearColor");
    v27 = (UIColor *)objc_claimAutoreleasedReturnValue();

    if (strokeColor != v27)
    {
      if (self->_strokeColor)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeColor = %@"), self->_strokeColor);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v28);

      }
      else
      {
        objc_msgSend(v3, "addObject:", CFSTR("strokeColor = Inherited Tint Color"));
      }
      strokeColorTransformerIdentifier = self->_strokeColorTransformerIdentifier;
      if (strokeColorTransformerIdentifier)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        _UIConfigurationColorTransformerIdentifierToString(strokeColorTransformerIdentifier);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("strokeColorTransformer = %@"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v32);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strokeWidth = %g"), *(_QWORD *)&self->_strokeWidth);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v33);

    }
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = CFSTR("none");
  }
  v35 = (void *)MEMORY[0x1E0CB3940];
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v37, self, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (void)setPreferredSymbolConfiguration:(UIImageSymbolConfiguration *)preferredSymbolConfiguration
{
  *(_WORD *)&self->_imageFlags |= 1u;
  objc_setProperty_nonatomic_copy(self, a2, preferredSymbolConfiguration, 24);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColorTransformer:(UIConfigurationColorTransformer)tintColorTransformer
{
  *(_WORD *)&self->_imageFlags |= 4u;
  -[UIListContentImageProperties _setTintColorTransformer:]((uint64_t)self, tintColorTransformer);
}

- (UIConfigurationColorTransformer)tintColorTransformer
{
  return _Block_copy(self->_tintColorTransformer);
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  *(_WORD *)&self->_imageFlags |= 8u;
  self->_cornerRadius = cornerRadius;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  *(_WORD *)&self->_imageFlags |= 0x20u;
  self->_maximumSize = maximumSize;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)accessibilityIgnoresInvertColors
{
  *(_WORD *)&self->_imageFlags |= 0x40u;
  self->_accessibilityIgnoresInvertColors = accessibilityIgnoresInvertColors;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return self->_accessibilityIgnoresInvertColors;
}

- (void)setStrokeColor:(id)a3
{
  *(_WORD *)&self->_imageFlags |= 0x80u;
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColorTransformer:(id)a3
{
  *(_WORD *)&self->_imageFlags |= 0x100u;
  -[UIListContentImageProperties __setStrokeColorTransformer:]((uint64_t)self, a3);
}

- (id)strokeColorTransformer
{
  return _Block_copy(self->_strokeColorTransformer);
}

- (void)setStrokeWidth:(double)a3
{
  *(_WORD *)&self->_imageFlags |= 0x200u;
  self->_strokeWidth = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (id)resolvedStrokeColorForTintColor:(id)a3
{
  UIColor *v4;
  UIColor *v5;
  UIColor *strokeColor;
  UIColor *v7;
  void (**strokeColorTransformer)(id, id);
  UIColor *v9;
  UIColor *v10;

  v4 = (UIColor *)a3;
  v5 = v4;
  strokeColor = self->_strokeColor;
  if (!strokeColor)
    strokeColor = v4;
  v7 = strokeColor;
  strokeColorTransformer = (void (**)(id, id))self->_strokeColorTransformer;
  if (strokeColorTransformer)
  {
    strokeColorTransformer[2](strokeColorTransformer, v7);
    v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

@end
