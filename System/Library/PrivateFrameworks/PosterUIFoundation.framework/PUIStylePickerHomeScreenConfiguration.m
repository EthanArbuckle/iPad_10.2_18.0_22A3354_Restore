@implementation PUIStylePickerHomeScreenConfiguration

- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3
{
  return -[PUIStylePickerHomeScreenConfiguration initWithStyleType:variation:luminance:](self, "initWithStyleType:variation:luminance:", a3, 0.0, 0.0);
}

- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3 variation:(double)a4 luminance:(double)a5
{
  return -[PUIStylePickerHomeScreenConfiguration initWithStyleType:variation:luminance:saturation:](self, "initWithStyleType:variation:luminance:saturation:", a3, a4, a5, 1.0);
}

- (PUIStylePickerHomeScreenConfiguration)initWithStyleType:(unint64_t)a3 variation:(double)a4 luminance:(double)a5 saturation:(double)a6
{
  PUIStylePickerHomeScreenConfiguration *v10;
  PUIStylePickerHomeScreenConfiguration *v11;
  PUIDiscreteGradientVariatedCustomStyle *v12;
  PUIDiscreteGradientVariatedCustomStyle *accentStyle;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PUIStylePickerHomeScreenConfiguration;
  v10 = -[PUIStylePickerHomeScreenConfiguration init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_styleType = a3;
    v12 = -[PUIDiscreteGradientVariatedCustomStyle initWithVariation:luminance:saturation:]([PUIDiscreteGradientVariatedCustomStyle alloc], "initWithVariation:luminance:saturation:", a4, a5, a6);
    accentStyle = v11->_accentStyle;
    v11->_accentStyle = v12;

    v11->_iconContinuousCornerRadius = 14.3999996;
    v11->_iconSize = (CGSize)vdupq_n_s64(0x4050000000000000uLL);
    __asm { FMOV            V0.2D, #12.0 }
    v11->_iconSpacing = _Q0;
    *(CGSize *)&v11->_layoutInsets.top = _Q0;
    *(CGSize *)&v11->_layoutInsets.bottom = _Q0;
  }
  return v11;
}

- (PUIStylePickerHomeScreenConfiguration)init
{
  PUIStylePickerHomeScreenConfiguration *v2;
  PUIStylePickerHomeScreenConfiguration *v3;
  PUIDiscreteGradientVariatedCustomStyle *v4;
  PUIDiscreteGradientVariatedCustomStyle *accentStyle;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUIStylePickerHomeScreenConfiguration;
  v2 = -[PUIStylePickerHomeScreenConfiguration init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_styleType = 0;
    v4 = -[PUIDiscreteGradientVariatedCustomStyle initWithVariation:]([PUIDiscreteGradientVariatedCustomStyle alloc], "initWithVariation:", 0.0);
    accentStyle = v3->_accentStyle;
    v3->_accentStyle = v4;

    v3->_iconContinuousCornerRadius = 14.3999996;
    v3->_iconSize = (CGSize)vdupq_n_s64(0x4050000000000000uLL);
    __asm { FMOV            V0.2D, #12.0 }
    v3->_iconSpacing = _Q0;
    *(CGSize *)&v3->_layoutInsets.top = _Q0;
    *(CGSize *)&v3->_layoutInsets.bottom = _Q0;
  }
  return v3;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIStylePickerHomeScreenConfiguration styleType](self, "styleType") - 1;
  if (v4 > 2)
    v5 = CFSTR("auto");
  else
    v5 = off_25154C8F0[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("_styleType"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_accentStyle, CFSTR("_accentStyle"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_styleType);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_accentStyle);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (double)luminance
{
  double result;

  -[PUIDiscreteGradientVariatedCustomStyle luminance](self->_accentStyle, "luminance");
  return result;
}

- (double)variation
{
  double result;

  -[PUIDiscreteGradientVariatedCustomStyle variation](self->_accentStyle, "variation");
  return result;
}

- (double)saturation
{
  double result;

  -[PUIDiscreteGradientVariatedCustomStyle saturation](self->_accentStyle, "saturation");
  return result;
}

- (void)setAccentStyle:(id)a3
{
  PUIDiscreteGradientVariatedCustomStyle *v4;
  PUIDiscreteGradientVariatedCustomStyle *accentStyle;

  if (a3)
    v4 = (PUIDiscreteGradientVariatedCustomStyle *)objc_msgSend(a3, "copy");
  else
    v4 = -[PUIDiscreteGradientVariatedCustomStyle initWithVariation:]([PUIDiscreteGradientVariatedCustomStyle alloc], "initWithVariation:", 0.0);
  accentStyle = self->_accentStyle;
  self->_accentStyle = v4;

}

- (UIColor)accentColor
{
  return -[PUIDiscreteGradientVariatedCustomStyle luminanceAppliedColor](self->_accentStyle, "luminanceAppliedColor");
}

- (BOOL)isEqual:(id)a3
{
  PUIStylePickerHomeScreenConfiguration *v4;
  BOOL v5;

  v4 = (PUIStylePickerHomeScreenConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStylePickerHomeScreenConfiguration isEqualToHomeScreenConfiguration:](self, "isEqualToHomeScreenConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHomeScreenConfiguration:(id)a3
{
  PUIStylePickerHomeScreenConfiguration *v4;
  PUIStylePickerHomeScreenConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;

  v4 = (PUIStylePickerHomeScreenConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_18;
    -[PUIStylePickerHomeScreenConfiguration accentStyle](v4, "accentStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_18;
    v9 = -[PUIStylePickerHomeScreenConfiguration styleType](v5, "styleType");
    if (v9 != -[PUIStylePickerHomeScreenConfiguration styleType](self, "styleType"))
      goto LABEL_18;
    -[PUIStylePickerHomeScreenConfiguration suggestedAccentColor](self, "suggestedAccentColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStylePickerHomeScreenConfiguration suggestedAccentColor](v5, "suggestedAccentColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BSEqualObjects();

    if (!v12)
      goto LABEL_18;
    -[PUIStylePickerHomeScreenConfiguration iconContinuousCornerRadius](v5, "iconContinuousCornerRadius");
    -[PUIStylePickerHomeScreenConfiguration iconContinuousCornerRadius](self, "iconContinuousCornerRadius");
    if (BSFloatEqualToFloat())
    {
      -[PUIStylePickerHomeScreenConfiguration iconSize](v5, "iconSize");
      v14 = v13;
      v16 = v15;
      -[PUIStylePickerHomeScreenConfiguration iconSize](self, "iconSize");
      v18 = 0;
      if (v14 == v19 && v16 == v17)
      {
        -[PUIStylePickerHomeScreenConfiguration iconSpacing](v5, "iconSpacing");
        v21 = v20;
        v23 = v22;
        -[PUIStylePickerHomeScreenConfiguration iconSpacing](self, "iconSpacing");
        v18 = 0;
        if (v21 == v25 && v23 == v24)
        {
          -[PUIStylePickerHomeScreenConfiguration layoutInsets](v5, "layoutInsets");
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          -[PUIStylePickerHomeScreenConfiguration layoutInsets](self, "layoutInsets");
          v37 = v29 == v36;
          if (v27 != v38)
            v37 = 0;
          if (v33 != v35)
            v37 = 0;
          v18 = v31 == v34 && v37;
        }
      }
    }
    else
    {
LABEL_18:
      v18 = 0;
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStylePickerHomeScreenConfiguration)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v16;
  uint64_t v17;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PUIStylePickerHomeScreenConfiguration;
  v5 = -[PUIStylePickerHomeScreenConfiguration init](&v28, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 3) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_styleType"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_accentStyle"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_suggestedAccentColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_iconContinuousCornerRadius"));
    *((_QWORD *)v5 + 2) = v11;
    if (BSFloatIsZero())
      *((_QWORD *)v5 + 2) = 0x402CCCCCC0000000;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("_iconSize"));
    *((double *)v5 + 5) = v13;
    *((double *)v5 + 6) = v12;
    v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
    _ZF = *MEMORY[0x24BDBF148] == v13 && v14 == v12;
    if (_ZF)
      *(int64x2_t *)(v5 + 40) = vdupq_n_s64(0x4050000000000000uLL);
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("_iconSpacing"));
    *((_QWORD *)v5 + 7) = v17;
    *((double *)v5 + 8) = v16;
    __asm { FMOV            V0.2D, #12.0 }
    if (_ZF && v14 == v16)
      *(_OWORD *)(v5 + 56) = _Q0;
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("_layoutInsets"), _Q0);
    *((double *)v5 + 9) = v22;
    *((double *)v5 + 10) = v25;
    *((double *)v5 + 11) = v23;
    *((double *)v5 + 12) = v24;
    if (*(double *)(MEMORY[0x24BDF7718] + 8) == v25
      && *MEMORY[0x24BDF7718] == v22
      && *(double *)(MEMORY[0x24BDF7718] + 24) == v24
      && *(double *)(MEMORY[0x24BDF7718] + 16) == v23)
    {
      *(_OWORD *)(v5 + 72) = v27;
      *(_OWORD *)(v5 + 88) = v27;
    }
  }

  return (PUIStylePickerHomeScreenConfiguration *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t styleType;
  id v5;

  styleType = self->_styleType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", styleType, CFSTR("_styleType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accentStyle, CFSTR("_accentStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedAccentColor, CFSTR("_suggestedAccentColor"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_iconContinuousCornerRadius"), self->_iconContinuousCornerRadius);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("_iconSize"), self->_iconSize.width, self->_iconSize.height);
  objc_msgSend(v5, "encodeCGSize:forKey:", CFSTR("_iconSpacing"), self->_iconSpacing.width, self->_iconSpacing.height);
  objc_msgSend(v5, "encodeUIEdgeInsets:forKey:", CFSTR("_layoutInsets"), self->_layoutInsets.top, self->_layoutInsets.left, self->_layoutInsets.bottom, self->_layoutInsets.right);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PUIStylePickerHomeScreenConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[PUIStylePickerHomeScreenConfiguration init](+[PUIStylePickerHomeScreenConfiguration allocWithZone:](PUIStylePickerHomeScreenConfiguration, "allocWithZone:", a3), "init");
  -[PUIStylePickerHomeScreenConfiguration setStyleType:](v4, "setStyleType:", -[PUIStylePickerHomeScreenConfiguration styleType](self, "styleType"));
  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerHomeScreenConfiguration setAccentStyle:](v4, "setAccentStyle:", v5);

  -[PUIStylePickerHomeScreenConfiguration suggestedAccentColor](self, "suggestedAccentColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerHomeScreenConfiguration setSuggestedAccentColor:](v4, "setSuggestedAccentColor:", v6);

  -[PUIStylePickerHomeScreenConfiguration iconContinuousCornerRadius](self, "iconContinuousCornerRadius");
  -[PUIStylePickerHomeScreenConfiguration setIconContinuousCornerRadius:](v4, "setIconContinuousCornerRadius:");
  -[PUIStylePickerHomeScreenConfiguration iconSize](self, "iconSize");
  -[PUIStylePickerHomeScreenConfiguration setIconSize:](v4, "setIconSize:");
  -[PUIStylePickerHomeScreenConfiguration iconSpacing](self, "iconSpacing");
  -[PUIStylePickerHomeScreenConfiguration setIconSpacing:](v4, "setIconSpacing:");
  -[PUIStylePickerHomeScreenConfiguration layoutInsets](self, "layoutInsets");
  -[PUIStylePickerHomeScreenConfiguration setLayoutInsets:](v4, "setLayoutInsets:");
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PUIMutableStylePickerHomeScreenConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[PUIStylePickerHomeScreenConfiguration init](+[PUIMutableStylePickerHomeScreenConfiguration allocWithZone:](PUIMutableStylePickerHomeScreenConfiguration, "allocWithZone:", a3), "init");
  -[PUIStylePickerHomeScreenConfiguration setStyleType:](v4, "setStyleType:", -[PUIStylePickerHomeScreenConfiguration styleType](self, "styleType"));
  -[PUIStylePickerHomeScreenConfiguration accentStyle](self, "accentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerHomeScreenConfiguration setAccentStyle:](v4, "setAccentStyle:", v5);

  -[PUIStylePickerHomeScreenConfiguration suggestedAccentColor](self, "suggestedAccentColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIStylePickerHomeScreenConfiguration setSuggestedAccentColor:](v4, "setSuggestedAccentColor:", v6);

  -[PUIStylePickerHomeScreenConfiguration iconContinuousCornerRadius](self, "iconContinuousCornerRadius");
  -[PUIStylePickerHomeScreenConfiguration setIconContinuousCornerRadius:](v4, "setIconContinuousCornerRadius:");
  -[PUIStylePickerHomeScreenConfiguration iconSize](self, "iconSize");
  -[PUIStylePickerHomeScreenConfiguration setIconSize:](v4, "setIconSize:");
  -[PUIStylePickerHomeScreenConfiguration iconSpacing](self, "iconSpacing");
  -[PUIStylePickerHomeScreenConfiguration setIconSpacing:](v4, "setIconSpacing:");
  -[PUIStylePickerHomeScreenConfiguration layoutInsets](self, "layoutInsets");
  -[PUIStylePickerHomeScreenConfiguration setLayoutInsets:](v4, "setLayoutInsets:");
  return v4;
}

- (PUIDiscreteGradientVariatedCustomStyle)accentStyle
{
  return self->_accentStyle;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (CGSize)iconSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSpacing.width;
  height = self->_iconSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSpacing:(CGSize)a3
{
  self->_iconSpacing = a3;
}

- (double)iconContinuousCornerRadius
{
  return self->_iconContinuousCornerRadius;
}

- (void)setIconContinuousCornerRadius:(double)a3
{
  self->_iconContinuousCornerRadius = a3;
}

- (UIEdgeInsets)layoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutInsets.top;
  left = self->_layoutInsets.left;
  bottom = self->_layoutInsets.bottom;
  right = self->_layoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutInsets:(UIEdgeInsets)a3
{
  self->_layoutInsets = a3;
}

- (unint64_t)styleType
{
  return self->_styleType;
}

- (void)setStyleType:(unint64_t)a3
{
  self->_styleType = a3;
}

- (UIColor)suggestedAccentColor
{
  return self->_suggestedAccentColor;
}

- (void)setSuggestedAccentColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAccentColor, 0);
  objc_storeStrong((id *)&self->_accentStyle, 0);
}

@end
