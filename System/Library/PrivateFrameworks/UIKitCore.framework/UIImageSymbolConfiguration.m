@implementation UIImageSymbolConfiguration

- (BOOL)_shouldApplyConfiguration:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIImageSymbolConfiguration;
  if (-[UIImageConfiguration _shouldApplyConfiguration:](&v7, sel__shouldApplyConfiguration_, v4))
    v5 = !-[UIImageSymbolConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)isEqualToConfiguration:(UIImageSymbolConfiguration *)otherConfiguration
{
  UIImageSymbolConfiguration *v4;
  UIImageSymbolConfiguration *v5;
  uint64_t v6;
  char isKindOfClass;
  _BOOL4 v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $F7261812317C211F76CC117B9D7B19F5 configFlags;
  $F7261812317C211F76CC117B9D7B19F5 v21;
  double v22;
  double pointSize;
  double v24;
  double v25;
  double v26;
  int64_t v27;
  void *v28;
  void *v29;
  int v30;
  _BOOL4 v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  int v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  BOOL v39;
  objc_super v41;

  v4 = otherConfiguration;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
    v5 = (UIImageSymbolConfiguration *)(id)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_42;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_42;
  }
  v8 = -[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale");
  if (v8 != -[UIImageSymbolConfiguration _hasSpecifiedScale](v5, "_hasSpecifiedScale"))
    goto LABEL_42;
  v9 = -[UIImageSymbolConfiguration scale](self, "scale");
  if (v9 != -[UIImageSymbolConfiguration scale](v5, "scale"))
    goto LABEL_42;
  if (self)
  {
    if ((self->_textStyle != 0) != (v5->_textStyle != 0))
      goto LABEL_42;
  }
  else if (v5->_textStyle)
  {
    goto LABEL_42;
  }
  -[UIImageSymbolConfiguration textStyle](self, "textStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageSymbolConfiguration textStyle](v5, "textStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {

  }
  else
  {
    if (!v12 || !v13)
    {

LABEL_41:
      goto LABEL_42;
    }
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_41;
  }
  -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](self, "pointSizeForScalingWithTextStyle");
  v17 = v16;
  -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](v5, "pointSizeForScalingWithTextStyle");
  v19 = v18;

  if (v17 != v19)
    goto LABEL_42;
  if (self)
  {
    configFlags = self->_configFlags;
    v21 = v5->_configFlags;
    if (((*(_DWORD *)&configFlags ^ *(_DWORD *)&v21) & 1) != 0)
      goto LABEL_42;
    v22 = 0.0;
    pointSize = 0.0;
    if ((*(_BYTE *)&configFlags & 1) != 0)
      pointSize = self->_pointSize;
    if ((*(_BYTE *)&v21 & 1) != 0)
      v22 = v5->_pointSize;
    if (pointSize != v22)
      goto LABEL_42;
  }
  else if ((*(_BYTE *)&v5->_configFlags & 1) != 0)
  {
    goto LABEL_42;
  }
  -[UIImageSymbolConfiguration customFontPointSizeMultiplier](self, "customFontPointSizeMultiplier");
  v25 = v24;
  -[UIImageSymbolConfiguration customFontPointSizeMultiplier](v5, "customFontPointSizeMultiplier");
  if (v25 != v26)
  {
LABEL_42:
    v39 = 0;
    goto LABEL_43;
  }
  if (self)
  {
    if ((self->_weight != 0) != (v5->_weight != 0))
      goto LABEL_42;
  }
  else if (v5->_weight)
  {
    goto LABEL_42;
  }
  v27 = -[UIImageSymbolConfiguration weight](self, "weight");
  if (v27 != -[UIImageSymbolConfiguration weight](v5, "weight"))
    goto LABEL_42;
  if (self)
  {
    if ((self->_namedColorStyles != 0) == (v5->_namedColorStyles != 0))
      goto LABEL_32;
    goto LABEL_42;
  }
  if (v5->_namedColorStyles)
    goto LABEL_42;
LABEL_32:
  -[UIImageSymbolConfiguration _namedColorStyles](self, "_namedColorStyles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageSymbolConfiguration _namedColorStyles](v5, "_namedColorStyles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = UIEqual(v28, v29);

  if (!v30)
    goto LABEL_42;
  v31 = -[UIImageSymbolConfiguration _hasSpecifiedHierarchicalColors](self, "_hasSpecifiedHierarchicalColors");
  if (v31 != -[UIImageSymbolConfiguration _hasSpecifiedHierarchicalColors](v5, "_hasSpecifiedHierarchicalColors"))
    goto LABEL_42;
  v32 = -[UIImageSymbolConfiguration _hasSpecifiedPaletteColors](self, "_hasSpecifiedPaletteColors");
  if (v32 != -[UIImageSymbolConfiguration _hasSpecifiedPaletteColors](v5, "_hasSpecifiedPaletteColors"))
    goto LABEL_42;
  -[UIImageSymbolConfiguration _colors](self, "_colors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageSymbolConfiguration _colors](v5, "_colors");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = UIEqual(v33, v34);

  if (!v35)
    goto LABEL_42;
  v36 = -[UIImageSymbolConfiguration _prefersMulticolor](self, "_prefersMulticolor");
  if (v36 != -[UIImageSymbolConfiguration _prefersMulticolor](v5, "_prefersMulticolor"))
    goto LABEL_42;
  v37 = -[UIImageSymbolConfiguration _prefersMonochrome](self, "_prefersMonochrome");
  if (v37 != -[UIImageSymbolConfiguration _prefersMonochrome](v5, "_prefersMonochrome"))
    goto LABEL_42;
  v38 = -[UIImageSymbolConfiguration _suppressesMaterialRendering](self, "_suppressesMaterialRendering");
  if (v38 != -[UIImageSymbolConfiguration _suppressesMaterialRendering](v5, "_suppressesMaterialRendering"))
    goto LABEL_42;
  v41.receiver = self;
  v41.super_class = (Class)UIImageSymbolConfiguration;
  v39 = -[UIImageConfiguration isEqualToConfiguration:](&v41, sel_isEqualToConfiguration_, v5);
LABEL_43:

  return v39;
}

- (BOOL)_isUnspecified
{
  objc_super v5;

  if (-[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale"))
    return 0;
  if (self)
  {
    if ((*(_BYTE *)&self->_configFlags & 1) != 0 || self->_weight || self->_textStyle || self->_namedColorStyles)
      return 0;
    if ((*(_BYTE *)&self->_configFlags & 0x28) != 0 || self->_colors != 0)
      return 0;
  }
  if (-[UIImageSymbolConfiguration _suppressesMaterialRendering](self, "_suppressesMaterialRendering"))
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)UIImageSymbolConfiguration;
  return -[UIImageConfiguration _isUnspecified](&v5, sel__isUnspecified);
}

- (BOOL)_hasSpecifiedScale
{
  return self->_scale != 0;
}

- (int64_t)scale
{
  return self->_scale;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (double)pointSizeForScalingWithTextStyle
{
  double result;

  result = 0.0;
  if ((*(_BYTE *)&self->_configFlags & 1) == 0)
    return self->_pointSize;
  return result;
}

- (BOOL)_hasSpecifiedHierarchicalColors
{
  _BOOL4 v2;

  if (self->_colors)
    return (*(_BYTE *)&self->_configFlags >> 1) & 1;
  else
    LOBYTE(v2) = 0;
  return v2;
}

- (BOOL)_hasSpecifiedPaletteColors
{
  return self->_colors && (*(_BYTE *)&self->_configFlags & 2) == 0;
}

- (int64_t)weight
{
  return self->_weight;
}

- (BOOL)_prefersMulticolor
{
  return (~*(_BYTE *)&self->_configFlags & 0xC) == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIImageSymbolConfiguration;
  v4 = -[UIImageConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4 && !-[UIImageSymbolConfiguration _isUnspecified](self, "_isUnspecified"))
  {
    *((_QWORD *)v4 + 8) = self->_scale;
    v5 = -[NSString copy](self->_textStyle, "copy");
    v6 = (void *)*((_QWORD *)v4 + 10);
    *((_QWORD *)v4 + 10) = v5;

    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_pointSize;
    *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_customFontPointSizeMultiplier;
    *((_QWORD *)v4 + 9) = self->_weight;
    *((_DWORD *)v4 + 10) = self->_configFlags;
    objc_storeStrong((id *)v4 + 6, self->_namedColorStyles);
    objc_storeStrong((id *)v4 + 7, self->_colors);
  }
  return v4;
}

- (double)customFontPointSizeMultiplier
{
  return self->_customFontPointSizeMultiplier;
}

- (NSDictionary)_namedColorStyles
{
  return self->_namedColorStyles;
}

- (NSArray)_colors
{
  return self->_colors;
}

- (BOOL)_prefersMonochrome
{
  return (~*(_BYTE *)&self->_configFlags & 0x30) == 0;
}

- (void)_applyConfigurationValuesTo:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  double v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  int64_t weight;
  void *v19;
  double v20;
  double pointSize;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSArray *colors;
  $F7261812317C211F76CC117B9D7B19F5 configFlags;
  double v33;
  double v34;
  objc_super v35;

  v4 = a3;
  if (!v4)
    goto LABEL_59;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_59;
  }
  v35.receiver = self;
  v35.super_class = (Class)UIImageSymbolConfiguration;
  -[UIImageConfiguration _applyConfigurationValuesTo:](&v35, sel__applyConfigurationValuesTo_, v4);
  if (-[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale"))
    *((_QWORD *)v4 + 8) = -[UIImageSymbolConfiguration scale](self, "scale");
  if (dyld_program_sdk_at_least())
  {
    if (self)
    {
      if (self->_weight)
        *((_QWORD *)v4 + 9) = -[UIImageSymbolConfiguration weight](self, "weight");
      if (self->_textStyle)
      {
        *((_QWORD *)v4 + 4) = 0;
        *((_BYTE *)v4 + 40) &= ~1u;
        -[UIImageSymbolConfiguration textStyle](self, "textStyle");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)*((_QWORD *)v4 + 10);
        *((_QWORD *)v4 + 10) = v7;

        -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](self, "pointSizeForScalingWithTextStyle");
        if (v9 < 0.0)
          v9 = 0.0;
        *((double *)v4 + 4) = v9;
        v10 = *((_BYTE *)v4 + 40) & 0xFE;
LABEL_16:
        *((_BYTE *)v4 + 40) = v10;
LABEL_46:
        if (self->_namedColorStyles)
        {
          v25 = (void *)objc_msgSend(*((id *)v4 + 6), "mutableCopy");
          v26 = v25;
          if (v25)
            v27 = v25;
          else
            v27 = (id)objc_opt_new();
          v28 = v27;

          objc_msgSend(v28, "addEntriesFromDictionary:", self->_namedColorStyles);
          v29 = objc_msgSend(v28, "copy");
          v30 = (void *)*((_QWORD *)v4 + 6);
          *((_QWORD *)v4 + 6) = v29;

        }
        colors = self->_colors;
        if (colors)
          -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v4, (*(_BYTE *)&self->_configFlags >> 1) & 1, colors);
        configFlags = self->_configFlags;
        if ((*(_BYTE *)&configFlags & 8) != 0)
        {
          -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v4, (*(unsigned int *)&configFlags >> 2) & 1);
          configFlags = self->_configFlags;
        }
        if ((*(_BYTE *)&configFlags & 0x20) != 0)
          -[UIImageSymbolConfiguration _setPrefersMonochrome:]((uint64_t)v4, (*(unsigned int *)&configFlags >> 4) & 1);
        goto LABEL_57;
      }
      if ((*(_BYTE *)&self->_configFlags & 1) == 0)
        goto LABEL_46;
      v15 = (void *)*((_QWORD *)v4 + 10);
      *((_QWORD *)v4 + 10) = 0;

      goto LABEL_25;
    }
  }
  else if (self)
  {
    if (self->_textStyle)
    {
      *((_QWORD *)v4 + 4) = 0;
      *((_BYTE *)v4 + 40) &= ~1u;
      *((_QWORD *)v4 + 9) = 0;
      v11 = (void *)*((_QWORD *)v4 + 10);
      *((_QWORD *)v4 + 10) = 0;

      -[UIImageSymbolConfiguration textStyle](self, "textStyle");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)v4 + 10);
      *((_QWORD *)v4 + 10) = v12;

      -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](self, "pointSizeForScalingWithTextStyle");
      if (v14 < 0.0)
        v14 = 0.0;
      *((double *)v4 + 4) = v14;
      *((_BYTE *)v4 + 40) &= ~1u;
      if (self->_weight)
        *((_QWORD *)v4 + 9) = -[UIImageSymbolConfiguration weight](self, "weight");
      goto LABEL_46;
    }
    weight = self->_weight;
    if ((*(_BYTE *)&self->_configFlags & 1) == 0)
    {
      if (!weight)
        goto LABEL_46;
      if ((*((_BYTE *)v4 + 40) & 1) == 0)
      {
        -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
        *((_QWORD *)v4 + 9) = -[UIImageSymbolConfiguration weight](self, "weight");
        goto LABEL_46;
      }
      v33 = *((double *)v4 + 4);
      -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
      *((_QWORD *)v4 + 9) = -[UIImageSymbolConfiguration weight](self, "weight");
      v34 = 0.0;
      if (v33 >= 0.0)
        v34 = v33;
      *((double *)v4 + 4) = v34;
      v10 = *((_BYTE *)v4 + 40) | 1;
      goto LABEL_16;
    }
    if (weight)
    {
      *((_QWORD *)v4 + 4) = 0;
      *((_BYTE *)v4 + 40) &= ~1u;
      *((_QWORD *)v4 + 9) = 0;
      v19 = (void *)*((_QWORD *)v4 + 10);
      *((_QWORD *)v4 + 10) = 0;

      v20 = 0.0;
      pointSize = 0.0;
      if ((*(_BYTE *)&self->_configFlags & 1) != 0)
        pointSize = self->_pointSize;
      if (pointSize >= 0.0)
        v20 = pointSize;
      *((double *)v4 + 4) = v20;
      *((_BYTE *)v4 + 40) |= 1u;
      *((_QWORD *)v4 + 9) = -[UIImageSymbolConfiguration weight](self, "weight");
      goto LABEL_46;
    }
    if (*((_QWORD *)v4 + 9))
    {
      v22 = objc_msgSend(v4, "weight");
      -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
      v23 = 0.0;
      v24 = 0.0;
      if ((*(_BYTE *)&self->_configFlags & 1) != 0)
        v24 = self->_pointSize;
      if (v24 >= 0.0)
        v23 = v24;
      *((double *)v4 + 4) = v23;
      *((_BYTE *)v4 + 40) |= 1u;
      *((_QWORD *)v4 + 9) = v22;
      goto LABEL_46;
    }
    -[UIImageSymbolConfiguration _clearSpecificsExceptScale]((uint64_t)v4);
LABEL_25:
    v16 = 0.0;
    v17 = 0.0;
    if ((*(_BYTE *)&self->_configFlags & 1) != 0)
      v17 = self->_pointSize;
    if (v17 >= 0.0)
      v16 = v17;
    *((double *)v4 + 4) = v16;
    *((_BYTE *)v4 + 40) |= 1u;
    goto LABEL_46;
  }
LABEL_57:
  if (-[UIImageSymbolConfiguration _suppressesMaterialRendering](self, "_suppressesMaterialRendering"))
    *((_BYTE *)v4 + 40) = *((_BYTE *)v4 + 40) & 0xBF | *(_BYTE *)&self->_configFlags & 0x40;
LABEL_59:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_namedColorStyles, 0);
}

+ (UIImageSymbolConfiguration)configurationWithTextStyle:(UIFontTextStyle)textStyle scale:(UIImageSymbolScale)scale
{
  UIImageSymbolConfiguration *result;

  result = (UIImageSymbolConfiguration *)objc_msgSend(a1, "configurationWithTextStyle:", textStyle);
  result->_scale = scale;
  return result;
}

- (id)description
{
  __CFString *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  uint64_t v12;
  int64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSDictionary *namedColorStyles;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t v40;

  if (-[UIImageSymbolConfiguration _isUnspecified](self, "_isUnspecified"))
  {
    if (!-[UIImageSymbolConfiguration _suppressesMaterialRendering](self, "_suppressesMaterialRendering"))
    {
      v3 = 0;
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  if (self)
  {
    if (self->_textStyle)
    {
      -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](self, "pointSizeForScalingWithTextStyle");
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[UIImageSymbolConfiguration textStyle](self, "textStyle");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v5 <= 0.0)
        objc_msgSend(v6, "stringWithFormat:", CFSTR("textStyle=%@"), v7, v40);
      else
        objc_msgSend(v6, "stringWithFormat:", CFSTR("textStyle=%@ (scaled from %gpt)"), v7, *(_QWORD *)&v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if ((*(_BYTE *)&self->_configFlags & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pointSize=%g"), *(_QWORD *)&self->_pointSize);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (self->_weight)
    {
      v10 = -[UIImageSymbolConfiguration weight](self, "weight");
      if (v10 > 9)
      {
        v11 = 0;
        if (v9)
          goto LABEL_16;
      }
      else
      {
        v11 = off_1E16EC6A8[v10];
        if (v9)
        {
LABEL_16:
          objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", weight=%@"), v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v12;
          goto LABEL_19;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weight=%@"), v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_19:
  if (!-[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale"))
    goto LABEL_23;
  v13 = -[UIImageSymbolConfiguration scale](self, "scale");
  if ((unint64_t)(v13 + 1) > 4)
  {
    v14 = CFSTR("?");
    if (v9)
      goto LABEL_22;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scale=%@"), v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self)
      goto LABEL_32;
    goto LABEL_24;
  }
  v14 = off_1E16EC680[v13 + 1];
  if (!v9)
    goto LABEL_28;
LABEL_22:
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", scale=%@"), v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v15;
LABEL_23:
  if (!self)
    goto LABEL_32;
LABEL_24:
  namedColorStyles = self->_namedColorStyles;
  if (namedColorStyles)
  {
    if (v9)
    {
      -[NSDictionary allKeys](namedColorStyles, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", styled colors (%@)"), v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v19;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[NSDictionary allKeys](namedColorStyles, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("styled colors (%@)"), v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_32:
  if (-[UIImageSymbolConfiguration _hasSpecifiedHierarchicalColors](self, "_hasSpecifiedHierarchicalColors"))
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray componentsJoinedByString:](self->_colors, "componentsJoinedByString:", CFSTR(","));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("hierarchical color (%@)"), v22);
  }
  else
  {
    if (!-[UIImageSymbolConfiguration _hasSpecifiedPaletteColors](self, "_hasSpecifiedPaletteColors"))
    {
      v24 = 0;
      if (v9)
        goto LABEL_37;
      goto LABEL_39;
    }
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray componentsJoinedByString:](self->_colors, "componentsJoinedByString:", CFSTR(","));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("palette colors (%@)"), v22);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_37:
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(", %@"), v24);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }
LABEL_39:
  v3 = v24;
LABEL_40:
  if (-[UIImageSymbolConfiguration _prefersMulticolor](self, "_prefersMulticolor"))
  {
    if (v3)
    {
      v25 = CFSTR(", prefers multicolor");
LABEL_46:
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v25);
      v26 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v26;
      goto LABEL_49;
    }
    v3 = CFSTR("prefers multicolor");
  }
  else
  {
    if (!-[UIImageSymbolConfiguration _prefersMonochrome](self, "_prefersMonochrome"))
      goto LABEL_49;
    if (v3)
    {
      v25 = CFSTR(", prefers monochrome");
      goto LABEL_46;
    }
    v3 = CFSTR("prefers monochrome");
  }
LABEL_49:

  if (!-[UIImageSymbolConfiguration _suppressesMaterialRendering](self, "_suppressesMaterialRendering"))
    goto LABEL_53;
  if (v3)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR(", suppresses material rendering"));
    v27 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v27;
    goto LABEL_53;
  }
LABEL_52:
  v3 = CFSTR("suppresses material rendering");
LABEL_53:
  -[UIImageConfiguration traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (v3)
    {
      -[UIImageConfiguration traitCollection](self, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_traitsDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR(", traits=(%@)"), v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v31;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      -[UIImageConfiguration traitCollection](self, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_traitsDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("traits=(%@)"), v30);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  -[UIImageConfiguration locale](self, "locale");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (v3)
    {
      -[UIImageConfiguration locale](self, "locale");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR(", locale=(%@)"), v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v35;
    }
    else
    {
      v36 = (void *)MEMORY[0x1E0CB3940];
      -[UIImageConfiguration locale](self, "locale");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("locale=(%@)"), v34);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (v3)
    v37 = v3;
  else
    v37 = CFSTR("unspecified");
  v38 = v37;

  return v38;
}

- (unint64_t)hash
{
  int64_t v3;
  unint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v3 = self->_weight ^ self->_scale;
  v4 = vcvtmd_u64_f64(self->_pointSize * 100.0);
  v5 = v3 ^ -[NSString hash](self->_textStyle, "hash");
  -[NSArray firstObject](self->_colors, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v10.receiver = self;
  v10.super_class = (Class)UIImageSymbolConfiguration;
  v8 = v7 ^ -[UIImageConfiguration hash](&v10, sel_hash) ^ v4;

  return v8;
}

- (void)_deriveGlyphSize:(int64_t *)a3 weight:(int64_t *)a4 pointSize:(double *)a5
{
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double pointSize;
  double v25;
  uint64_t v26;
  int64_t v27;

  objc_msgSend(off_1E167A828, "defaultFontSize");
  v10 = v9;
  -[UIImageConfiguration _effectiveTraitCollectionForImageLookup](self, "_effectiveTraitCollectionForImageLookup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale"))
  {
    v12 = -[UIImageSymbolConfiguration scale](self, "scale") + 1;
    if (v12 > 4)
    {
      v13 = 0;
      if (!self)
      {
LABEL_30:
        v26 = 4;
        goto LABEL_19;
      }
    }
    else
    {
      v13 = qword_186685960[v12];
      if (!self)
        goto LABEL_30;
    }
  }
  else
  {
    v13 = 2;
    if (!self)
      goto LABEL_30;
  }
  if (!self->_textStyle)
  {
    if ((*(_BYTE *)&self->_configFlags & 1) != 0)
    {
      pointSize = self->_pointSize;
      -[UIImageSymbolConfiguration customFontPointSizeMultiplier](self, "customFontPointSizeMultiplier");
      v10 = pointSize * v25;
    }
    if (self->_weight)
    {
      v26 = -[UIImageSymbolConfiguration weight](self, "weight");
      goto LABEL_19;
    }
    goto LABEL_30;
  }
  -[UIImageSymbolConfiguration textStyle](self, "textStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "_normalizedContentSizeCategory:default:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  CTFontDescriptorGetTextStyleSize();
  v18 = v17;
  -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](self, "pointSizeForScalingWithTextStyle");
  if (v19 > 0.0)
  {
    +[UIFontMetrics scaledValueForValue:withTextStyle:bodyLeading:compatibleWithTraitCollection:](UIFontMetrics, "scaledValueForValue:withTextStyle:bodyLeading:compatibleWithTraitCollection:", v14, v11, self->_pointSize, 0.0);
    v18 = v20;
  }
  -[UIImageSymbolConfiguration customFontPointSizeMultiplier](self, "customFontPointSizeMultiplier", 0, 0);
  v22 = v21;
  if (self->_weight)
    v23 = -[UIImageSymbolConfiguration weight](self, "weight");
  else
    v23 = UISIndexForFontWeight();
  v26 = v23;
  v10 = v18 * v22;

LABEL_19:
  if (objc_msgSend(v11, "legibilityWeight") == 1)
  {
    UISFontWeightForIndex();
    CTFontGetAccessibilityBoldWeightOfWeight();
    v26 = UISIndexForFontWeight();
  }
  v27 = 4;
  if ((unint64_t)(v26 - 1) < 9)
    v27 = v26;
  if (a3)
    *a3 = v13;
  if (a4)
    *a4 = v27;
  if (a5)
    *a5 = v10;

}

+ (id)_configurationWithNamedColorStyles:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[6];
  v5[6] = v6;

  -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v5, 1);
  return v5;
}

- (void)_setPrefersMulticolor:(uint64_t)a1
{
  char v2;

  if (a1)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a1 + 40) & 0xFB | v2;
    *(_BYTE *)(a1 + 40) |= 8u;
    if (a2)
    {
      *(_BYTE *)(a1 + 40) &= ~0x10u;
      *(_BYTE *)(a1 + 40) |= 0x20u;
      -[UIImageSymbolConfiguration _setUsesHierarchical:colors:](a1, 0, 0);
    }
  }
}

+ (UIImageSymbolConfiguration)configurationWithPaletteColors:(NSArray *)paletteColors
{
  NSArray *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = paletteColors;
  if (!v4)
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_init");
  -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v6, 0, v4);

  return (UIImageSymbolConfiguration *)v6;
}

+ (UIImageSymbolConfiguration)configurationWithWeight:(UIImageSymbolWeight)weight
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v4[9] = weight;
  return (UIImageSymbolConfiguration *)v4;
}

+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize weight:(UIImageSymbolWeight)weight
{
  uint64_t v6;
  double v7;
  double v8;

  v6 = objc_msgSend(objc_alloc((Class)a1), "_init");
  if (pointSize <= 0.0)
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    pointSize = v7;
  }
  if (v6)
  {
    v8 = 0.0;
    if (pointSize >= 0.0)
      v8 = pointSize;
    *(double *)(v6 + 32) = v8;
    *(_BYTE *)(v6 + 40) |= 1u;
  }
  *(_QWORD *)(v6 + 72) = weight;
  return (UIImageSymbolConfiguration *)(id)v6;
}

+ (UIImageSymbolConfiguration)configurationWithScale:(UIImageSymbolScale)scale
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v4[8] = scale;
  return (UIImageSymbolConfiguration *)v4;
}

+ (UIImageSymbolConfiguration)configurationWithTextStyle:(UIFontTextStyle)textStyle
{
  NSString *v4;
  _QWORD *v5;
  void *v6;

  v4 = textStyle;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v6 = (void *)v5[10];
  v5[10] = v4;

  return (UIImageSymbolConfiguration *)v5;
}

+ (UIImageSymbolConfiguration)configurationPreferringMonochrome
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "_init");
  -[UIImageSymbolConfiguration _setPrefersMonochrome:]((uint64_t)v2, 1);
  return (UIImageSymbolConfiguration *)v2;
}

- (void)_setUsesHierarchical:(void *)a3 colors:
{
  id v6;
  char v7;
  id v8;

  v6 = a3;
  if (a1)
  {
    v8 = v6;
    objc_storeStrong((id *)(a1 + 56), a3);
    v6 = v8;
    if (a2)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a1 + 40) & 0xFD | v7;
    if (v8)
    {
      *(_BYTE *)(a1 + 40) &= ~4u;
      *(_BYTE *)(a1 + 40) |= 8u;
      *(_BYTE *)(a1 + 40) &= ~0x10u;
      *(_BYTE *)(a1 + 40) |= 0x20u;
    }
  }

}

- (void)_setPrefersMonochrome:(uint64_t)a1
{
  char v2;

  if (a1)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a1 + 40) & 0xEF | v2;
    *(_BYTE *)(a1 + 40) |= 0x20u;
    if (a2)
    {
      *(_BYTE *)(a1 + 40) &= ~4u;
      *(_BYTE *)(a1 + 40) |= 8u;
      -[UIImageSymbolConfiguration _setUsesHierarchical:colors:](a1, 0, 0);
    }
  }
}

+ (UIImageSymbolConfiguration)configurationWithHierarchicalColor:(UIColor *)hierarchicalColor
{
  UIColor *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = hierarchicalColor;
  if (!v4)
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v5, 1, v6);

  return (UIImageSymbolConfiguration *)v5;
}

+ (UIImageSymbolConfiguration)configurationWithFont:(UIFont *)font scale:(UIImageSymbolScale)scale
{
  UIImageSymbolConfiguration *result;

  result = (UIImageSymbolConfiguration *)objc_msgSend(a1, "configurationWithFont:", font);
  result->_scale = scale;
  return result;
}

+ (UIImageSymbolConfiguration)configurationWithFont:(UIFont *)font
{
  UIFont *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v3 = font;
  v4 = -[UIImageConfiguration _init]([UIImageSymbolConfiguration alloc], "_init");
  -[UIFont _textStyle](v3, "_textStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dyld_program_sdk_at_least() ^ 1;
  -[UIFont textStyleForScaling](v3, "textStyleForScaling");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if ((objc_msgSend((id)objc_opt_class(), "_isSupportedDynamicFontTextStyle:", v5) & 1) != 0)
  {
    goto LABEL_9;
  }
  -[UIFont textStyleForScaling](v3, "textStyleForScaling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    -[UIFont textStyleForScaling](v3, "textStyleForScaling");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "_isSupportedDynamicFontTextStyle:", v10);

    if ((_DWORD)v9)
    {
      -[UIFont textStyleForScaling](v3, "textStyleForScaling");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
    }
    else
    {
      v8 = 0;
    }
  }

  v5 = v8;
LABEL_9:
  CTFontGetWeight();
  *((_QWORD *)v4 + 9) = UISIndexForFontWeight();
  if (v5)
  {
    if (v6)
    {
      -[UIFont pointSizeForScaling](v3, "pointSizeForScaling");
      if (v11 < 0.0)
        v11 = 0.0;
      *((double *)v4 + 4) = v11;
      *((_BYTE *)v4 + 40) &= ~1u;
      goto LABEL_22;
    }
    if (!dyld_program_sdk_at_least())
    {
LABEL_22:
      objc_storeStrong((id *)v4 + 10, v5);
      goto LABEL_25;
    }
    objc_msgSend(off_1E167A828, "_normalizedContentSizeCategory:default:", 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CTFontDescriptorGetTextStyleSize();
    v15 = v14;
    -[UIFont pointSize](v3, "pointSize");
    if (v15 == v16)
    {
      objc_storeStrong((id *)v4 + 10, v5);
    }
    else
    {
      -[UIFont pointSize](v3, "pointSize");
      if (v17 < 0.0)
        v17 = 0.0;
      *((double *)v4 + 4) = v17;
      *((_BYTE *)v4 + 40) |= 1u;
    }

  }
  else
  {
    -[UIFont pointSize](v3, "pointSize");
    if (v12 < 0.0)
      v12 = 0.0;
    *((double *)v4 + 4) = v12;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_25:
  CTFontGetUIFontDesign();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(void **)off_1E167DBF8;
  v20 = v18;
  v21 = v19;
  if (v20 == v21)
  {

  }
  else
  {
    v22 = v21;
    if (v20 && v21)
    {
      v23 = objc_msgSend(v20, "isEqual:", v21);

      if ((v23 & 1) != 0)
        goto LABEL_40;
    }
    else
    {

    }
    -[UIFont pointSize](v3, "pointSize");
    CTFontGetCapHeightForSystemFontOfSize();
    v25 = v24;
    -[UIFont capHeight](v3, "capHeight");
    if (v25 == 0.0 || v26 == 0.0)
    {
      CTFontGetAscentForSystemFontOfSize();
      v29 = v28;
      CTFontGetDescentForSystemFontOfSize();
      v31 = v29 + v30;
      -[UIFont lineHeight](v3, "lineHeight");
      if (v31 == 0.0 || v32 == 0.0)
      {
        *((_QWORD *)v4 + 11) = 0x3FF0000000000000;
        goto LABEL_40;
      }
      v27 = v32 / v31;
    }
    else
    {
      v27 = v26 / v25;
    }
    *((double *)v4 + 11) = v27;
  }
LABEL_40:

  return (UIImageSymbolConfiguration *)v4;
}

- (BOOL)isEqual:(id)a3
{
  UIImageSymbolConfiguration *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = (UIImageSymbolConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[UIImageSymbolConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)UIImageSymbolConfiguration;
      v5 = -[UIImageConfiguration isEqual:](&v8, sel_isEqual_, v4);
    }
    v6 = v5;
  }

  return v6;
}

+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize
{
  uint64_t v4;
  double v5;
  double v6;

  v4 = objc_msgSend(objc_alloc((Class)a1), "_init");
  if (pointSize <= 0.0)
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    pointSize = v5;
  }
  if (v4)
  {
    v6 = 0.0;
    if (pointSize >= 0.0)
      v6 = pointSize;
    *(double *)(v4 + 32) = v6;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  return (UIImageSymbolConfiguration *)(id)v4;
}

+ (UIImageSymbolConfiguration)configurationWithPointSize:(CGFloat)pointSize weight:(UIImageSymbolWeight)weight scale:(UIImageSymbolScale)scale
{
  uint64_t v8;
  double v9;
  double v10;

  v8 = objc_msgSend(objc_alloc((Class)a1), "_init");
  if (pointSize <= 0.0)
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    pointSize = v9;
  }
  if (v8)
  {
    v10 = 0.0;
    if (pointSize >= 0.0)
      v10 = pointSize;
    *(double *)(v8 + 32) = v10;
    *(_BYTE *)(v8 + 40) |= 1u;
  }
  *(_QWORD *)(v8 + 72) = weight;
  *(_QWORD *)(v8 + 64) = scale;
  return (UIImageSymbolConfiguration *)(id)v8;
}

- (id)_paletteColorsWithEffect:(id)a3
{
  return -[UIImageSymbolConfiguration _paletteColorsWithEffect:shouldResolveDynamicColors:](self, "_paletteColorsWithEffect:shouldResolveDynamicColors:", a3, 1);
}

- (id)_hierarchicalColorForLayerLevel:(int64_t)a3 effect:(id)a4
{
  return -[UIImageSymbolConfiguration _hierarchicalColorForLayerLevel:effect:shouldResolveDynamicColors:](self, "_hierarchicalColorForLayerLevel:effect:shouldResolveDynamicColors:", a3, a4, 1);
}

- (id)_resolvedColorForNamedStyle:(id)a3 effect:(id)a4
{
  id v6;
  id *v7;
  id *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = (id *)a4;
  v8 = v7;
  if (v7)
    WeakRetained = objc_loadWeakRetained(v7 + 2);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIImageSymbolConfiguration _namedColorStyles](self, "_namedColorStyles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[UIColor _systemColorWithUnvalidatedName:](UIColor, "_systemColorWithUnvalidatedName:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("white")))
      {
        +[UIColor whiteColor](UIColor, "whiteColor");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("black")))
          goto LABEL_12;
        +[UIColor blackColor](UIColor, "blackColor");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v13;
      if (v13)
        goto LABEL_22;
LABEL_12:
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("controlAccentColor")) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", CFSTR("tintColor")))
      {
        +[UIColor tintColor](UIColor, "tintColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_22;
      }
      if (v8)
      {
        v14 = objc_loadWeakRetained(v8 + 3);
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "_colorForName:withTraitCollection:", v6, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        v15 = 0;
      }
      v12 = 0;
      goto LABEL_21;
    }
  }
LABEL_22:
  +[UIColor tintColor](UIColor, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v16)
  {
    _TintColorFromTraitCollection(v10);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v17;
  }
  objc_msgSend(v12, "resolvedColorWithTraitCollection:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (UIImageSymbolConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIImageSymbolConfiguration *v5;
  float v6;
  uint64_t v7;
  NSString *textStyle;
  BOOL v9;
  float v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *namedColorStyles;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIImageSymbolConfiguration;
  v5 = -[UIImageConfiguration initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISymbolScale")))
      v5->_scale = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISymbolScale"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIPointSizeScaleFactor")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIPointSizeScaleFactor"));
      v5->_customFontPointSizeMultiplier = v6;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISymbolWeight")))
      v5->_weight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISymbolWeight"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITextStyle")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITextStyle"));
      v7 = objc_claimAutoreleasedReturnValue();
      textStyle = v5->_textStyle;
      v5->_textStyle = (NSString *)v7;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIPointSize")))
    {
      v9 = v5->_textStyle == 0;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIPointSize"));
      v11 = v10;
      if (v11 < 0.0)
        v11 = 0.0;
      v5->_pointSize = v11;
      *(_BYTE *)&v5->_configFlags = *(_BYTE *)&v5->_configFlags & 0xFE | v9;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UINamedColorStyles")))
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("UINamedColorStyles"));
      v16 = objc_claimAutoreleasedReturnValue();
      namedColorStyles = v5->_namedColorStyles;
      v5->_namedColorStyles = (NSDictionary *)v16;

      -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v5, 1);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIHierarchicalColors")))
    {
      v18 = (void *)MEMORY[0x1E0C99E60];
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("UIHierarchicalColors"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageSymbolConfiguration _setUsesHierarchical:colors:]((uint64_t)v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDerivativeHierarchicalColors")), v22);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISpecifiedPrefersMulticolor"))
      && objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISpecifiedPrefersMulticolor")))
    {
      -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIPrefersMulticolor")));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISpecifiedPrefersMonochrome"))
      && objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISpecifiedPrefersMonochrome")))
    {
      -[UIImageSymbolConfiguration _setPrefersMonochrome:]((uint64_t)v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIPrefersMonochrome")));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UISuppressesMaterialRendering")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UISuppressesMaterialRendering")))
        v23 = 64;
      else
        v23 = 0;
      *(_BYTE *)&v5->_configFlags = *(_BYTE *)&v5->_configFlags & 0xBF | v23;
    }
  }

  return v5;
}

+ (id)_unspecifiedConfiguration
{
  if (_MergedGlobals_9_11 != -1)
    dispatch_once(&_MergedGlobals_9_11, &__block_literal_global_673);
  return (id)qword_1ECD7AE00;
}

void __55__UIImageSymbolConfiguration__unspecifiedConfiguration__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UIImageConfiguration _init]([UIImageSymbolConfiguration alloc], "_init");
  v1 = (void *)qword_1ECD7AE00;
  qword_1ECD7AE00 = (uint64_t)v0;

}

+ (id)_configurationWithHierarchicalColors:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") != 1)
    {
      objc_msgSend(a1, "configurationWithPaletteColors:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  objc_msgSend(a1, "configurationWithHierarchicalColor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (id)_configurationByReplacingColors:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[UIImageSymbolConfiguration copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

+ (UIImageSymbolConfiguration)configurationPreferringMulticolor
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "_init");
  -[UIImageSymbolConfiguration _setPrefersMulticolor:]((uint64_t)v2, 1);
  return (UIImageSymbolConfiguration *)v2;
}

- (id)_configurationSuppressingMaterialRendering
{
  _BYTE *v2;

  v2 = (_BYTE *)-[UIImageSymbolConfiguration copy](self, "copy");
  if (v2)
    v2[40] |= 0x40u;
  return v2;
}

- (BOOL)_suppressesMaterialRendering
{
  return (*(_BYTE *)&self->_configFlags >> 6) & 1;
}

- (id)_initWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIImageSymbolConfiguration;
  v3 = -[UIImageConfiguration _initWithTraitCollection:](&v7, sel__initWithTraitCollection_, a3);
  v4 = v3;
  if (v3)
  {
    *((_QWORD *)v3 + 8) = 0;
    *((_QWORD *)v3 + 11) = 0x3FF0000000000000;
    *((_QWORD *)v3 + 4) = 0;
    *((_BYTE *)v3 + 40) &= ~1u;
    *((_QWORD *)v3 + 9) = 0;
    v5 = (void *)*((_QWORD *)v3 + 10);
    *((_QWORD *)v3 + 10) = 0;

  }
  return v4;
}

- (void)_clearSpecificsExceptScale
{
  void *v1;

  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) &= ~1u;
  *(_QWORD *)(a1 + 72) = 0;
  v1 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double pointSize;
  double customFontPointSizeMultiplier;
  int64_t weight;
  NSString *textStyle;
  NSDictionary *namedColorStyles;
  NSArray *colors;
  char configFlags;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIImageSymbolConfiguration;
  -[UIImageConfiguration encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  if (!-[UIImageSymbolConfiguration _isUnspecified](self, "_isUnspecified"))
  {
    if (-[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale"))
      objc_msgSend(v4, "encodeInteger:forKey:", self->_scale, CFSTR("UISymbolScale"));
    pointSize = self->_pointSize;
    if (pointSize != 0.0)
    {
      *(float *)&pointSize = pointSize;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIPointSize"), pointSize);
    }
    customFontPointSizeMultiplier = self->_customFontPointSizeMultiplier;
    if (customFontPointSizeMultiplier != 1.0)
    {
      *(float *)&customFontPointSizeMultiplier = customFontPointSizeMultiplier;
      objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIPointSizeScaleFactor"), customFontPointSizeMultiplier);
    }
    weight = self->_weight;
    if (weight)
      objc_msgSend(v4, "encodeInt:forKey:", weight, CFSTR("UISymbolWeight"));
    textStyle = self->_textStyle;
    if (textStyle)
      objc_msgSend(v4, "encodeObject:forKey:", textStyle, CFSTR("UITextStyle"));
    namedColorStyles = self->_namedColorStyles;
    if (namedColorStyles)
      objc_msgSend(v4, "encodeObject:forKey:", namedColorStyles, CFSTR("UINamedColorStyles"));
    colors = self->_colors;
    if (colors)
    {
      objc_msgSend(v4, "encodeObject:forKey:", colors, CFSTR("UIHierarchicalColors"));
      objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_configFlags >> 1) & 1, CFSTR("UIDerivativeHierarchicalColors"));
    }
    configFlags = (char)self->_configFlags;
    if ((configFlags & 8) != 0)
    {
      objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISpecifiedPrefersMulticolor"));
      objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_configFlags >> 2) & 1, CFSTR("UIPrefersMulticolor"));
      configFlags = (char)self->_configFlags;
    }
    if ((configFlags & 0x20) != 0)
    {
      objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISpecifiedPrefersMonochrome"));
      objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_configFlags >> 4) & 1, CFSTR("UIPrefersMonochrome"));
    }
    if (-[UIImageSymbolConfiguration _suppressesMaterialRendering](self, "_suppressesMaterialRendering"))
      objc_msgSend(v4, "encodeBool:forKey:", (*(_BYTE *)&self->_configFlags >> 6) & 1, CFSTR("UISuppressesMaterialRendering"));
  }

}

- (BOOL)_hasColorConfigurationWithTintColor
{
  UIImageSymbolConfiguration *v2;
  NSDictionary *namedColorStyles;
  void *v4;
  NSArray *colors;
  void *v6;
  BOOL v7;

  if (self)
  {
    v2 = self;
    namedColorStyles = self->_namedColorStyles;
    if (namedColorStyles
      && (-[NSDictionary objectForKeyedSubscript:](namedColorStyles, "objectForKeyedSubscript:", CFSTR("tintColor")),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      LOBYTE(self) = 1;
    }
    else
    {
      colors = v2->_colors;
      if (colors)
      {
        +[UIColor tintColor](UIColor, "tintColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[NSArray containsObject:](colors, "containsObject:", v6);

        LOBYTE(self) = v7;
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  return (char)self;
}

- (UIImageSymbolConfiguration)configurationWithoutTextStyle
{
  UIImageSymbolConfiguration *v3;
  void *v4;
  __CFString *v5;
  UIImageSymbolConfiguration *p_pointSize;
  char v7;
  NSString *textStyle;

  if (self)
  {
    if (self->_textStyle)
    {
      v3 = (UIImageSymbolConfiguration *)-[UIImageSymbolConfiguration copy](self, "copy");
      -[UIImageConfiguration traitCollection](v3, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "preferredContentSizeCategory");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      p_pointSize = (UIImageSymbolConfiguration *)&v3->_pointSize;
      if (v5 == CFSTR("_UICTContentSizeCategoryUnspecified"))
      {
        p_pointSize->super.super.isa = 0;
        v7 = *(_BYTE *)&v3->_configFlags & 0xFE;
      }
      else
      {
        -[UIImageSymbolConfiguration _deriveGlyphSize:weight:pointSize:](self, "_deriveGlyphSize:weight:pointSize:", 0, 0, p_pointSize);
        v7 = *(_BYTE *)&v3->_configFlags | 1;
      }
      *(_BYTE *)&v3->_configFlags = v7;
      textStyle = v3->_textStyle;
      v3->_textStyle = 0;

    }
    else
    {
      v3 = self;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (UIImageSymbolConfiguration)configurationWithoutScale
{
  _QWORD *v2;

  if (self)
  {
    if (self->_scale)
    {
      v2 = (_QWORD *)-[UIImageSymbolConfiguration copy](self, "copy");
      v2[8] = 0;
      return (UIImageSymbolConfiguration *)v2;
    }
    self = self;
  }
  return self;
}

- (UIImageSymbolConfiguration)configurationWithoutWeight
{
  _QWORD *v2;

  if (self)
  {
    if (self->_weight)
    {
      v2 = (_QWORD *)-[UIImageSymbolConfiguration copy](self, "copy");
      v2[9] = 0;
      return (UIImageSymbolConfiguration *)v2;
    }
    self = self;
  }
  return self;
}

- (UIImageSymbolConfiguration)configurationWithoutPointSizeAndWeight
{
  uint64_t v2;

  if (self)
  {
    if ((*(_BYTE *)&self->_configFlags & 1) != 0 || self->_weight)
    {
      v2 = -[UIImageSymbolConfiguration copy](self, "copy");
      *(_BYTE *)(v2 + 40) &= ~1u;
      *(_QWORD *)(v2 + 32) = 0;
      *(_QWORD *)(v2 + 72) = 0;
      return (UIImageSymbolConfiguration *)(id)v2;
    }
    self = self;
  }
  return self;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageSymbolConfiguration description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isEquivalentToConfiguration:(id)a3
{
  id v4;
  BOOL v5;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  unsigned int v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  objc_super v22;

  v4 = a3;
  if (!v4)
  {
    +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)UIImageSymbolConfiguration;
    v5 = -[UIImageConfiguration _isEquivalentToConfiguration:](&v21, sel__isEquivalentToConfiguration_, v4);
    goto LABEL_8;
  }
  if (!-[UIImageSymbolConfiguration _isUnspecified](self, "_isUnspecified")
    && (objc_msgSend(v4, "_isUnspecified") & 1) == 0)
  {
    if (-[UIImageSymbolConfiguration _hasSpecifiedScale](self, "_hasSpecifiedScale")
      && objc_msgSend(v4, "_hasSpecifiedScale"))
    {
      v7 = -[UIImageSymbolConfiguration scale](self, "scale");
      v8 = objc_msgSend(v4, "scale");
      goto LABEL_28;
    }
    if (self)
    {
      if (self->_textStyle)
      {
        if (!v4)
          goto LABEL_30;
        if (*((_QWORD *)v4 + 10))
        {
          -[UIImageSymbolConfiguration textStyle](self, "textStyle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "textStyle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v9;
          v12 = v10;
          v13 = v12;
          if (v11 == v12)
          {

          }
          else
          {
            if (!v11 || !v12)
            {

LABEL_39:
              goto LABEL_6;
            }
            v14 = objc_msgSend(v11, "isEqual:", v12);

            if (!v14)
              goto LABEL_39;
          }
          -[UIImageSymbolConfiguration pointSizeForScalingWithTextStyle](self, "pointSizeForScalingWithTextStyle");
          v18 = v17;
          objc_msgSend(v4, "pointSizeForScalingWithTextStyle");
          v20 = v19;

          if (v18 != v20)
            goto LABEL_6;
LABEL_36:
          v16 = 1;
          goto LABEL_37;
        }
      }
      if ((*(_BYTE *)&self->_configFlags & 1) != 0 && v4 && (*((_BYTE *)v4 + 40) & 1) != 0)
      {
        if (self->_pointSize != *((double *)v4 + 4))
          goto LABEL_6;
        goto LABEL_36;
      }
      if (self->_weight && v4 && *((_QWORD *)v4 + 9))
      {
        v7 = -[UIImageSymbolConfiguration weight](self, "weight");
        v8 = objc_msgSend(v4, "weight");
LABEL_28:
        if (v7 != v8)
          goto LABEL_6;
        goto LABEL_36;
      }
    }
LABEL_30:
    v22.receiver = self;
    v22.super_class = (Class)UIImageSymbolConfiguration;
    v15 = -[UIImageConfiguration _isEquivalentToConfiguration:](&v22, sel__isEquivalentToConfiguration_, v4);
    v16 = 0;
    v5 = 0;
    if (!v15)
      goto LABEL_8;
LABEL_37:
    v5 = v16;
    goto LABEL_8;
  }
LABEL_6:
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)_hierarchicalColorForLayerLevel:(int64_t)a3 effect:(id)a4 shouldResolveDynamicColors:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  double v25;
  double v26;
  double v27;
  unint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  NSUInteger v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[NSArray count](self->_colors, "count");
  if (v9 < 2)
  {
    -[NSArray firstObject](self->_colors, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor tintColor](UIColor, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
    {
      _TintColorFromTraitCollection(v8);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    if (objc_msgSend(v8, "userInterfaceStyle") == 2)
    {
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", v17))
      {

LABEL_18:
        v20 = 0.2;
        goto LABEL_19;
      }
      +[UIColor systemPinkColor](UIColor, "systemPinkColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v14, "isEqual:", v21);

      v20 = 0.25;
      if (v22)
        goto LABEL_18;
    }
    else
    {
      +[UIColor systemYellowColor](UIColor, "systemYellowColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v14, "isEqual:", v18);

      if (v19)
        v20 = 0.3;
      else
        v20 = 0.25;
    }
LABEL_19:
    if (v5 && v8)
    {
      objc_msgSend(v14, "resolvedColorWithTraitCollection:", v8);
      v23 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v23;
    }
    if (a3 == 1)
    {
      objc_msgSend(v14, "alphaComponent");
      v26 = v25 * 0.5;
    }
    else
    {
      if (!a3)
      {
        v24 = v14;
LABEL_28:
        v13 = v24;

        goto LABEL_29;
      }
      objc_msgSend(v14, "alphaComponent");
      v26 = v20 * v27;
    }
    objc_msgSend(v14, "colorWithAlphaComponent:", v26);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v10 = v9;
  v11 = v9 - 1;
  if (v9 - 1 >= a3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        v32 = 134218240;
        v33 = v10;
        v34 = 2048;
        v35 = a3;
        _os_log_fault_impl(&dword_185066000, v31, OS_LOG_TYPE_FAULT, "Only %lu hierarchical colors specified for a symbol with a layer at level %lu; please adopt +configurationWith"
          "HierarchicalColor: or +configurationWithPaletteColors: API",
          (uint8_t *)&v32,
          0x16u);
      }

    }
    else
    {
      v29 = _hierarchicalColorForLayerLevel_effect_shouldResolveDynamicColors____s_category;
      if (!_hierarchicalColorForLayerLevel_effect_shouldResolveDynamicColors____s_category)
      {
        v29 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v29, (unint64_t *)&_hierarchicalColorForLayerLevel_effect_shouldResolveDynamicColors____s_category);
      }
      v30 = *(NSObject **)(v29 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = 134218240;
        v33 = v10;
        v34 = 2048;
        v35 = a3;
        _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Only %lu hierarchical colors specified for a symbol with a layer at level %lu; please adopt +configurationWith"
          "HierarchicalColor: or +configurationWithPaletteColors: API",
          (uint8_t *)&v32,
          0x16u);
      }
    }
  }
  if (v11 >= a3)
    v12 = a3;
  else
    v12 = v11;
  -[NSArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v13;
}

- (id)_paletteColorsWithEffect:(id)a3 shouldResolveDynamicColors:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  objc_msgSend(a3, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)-[NSArray mutableCopy](self->_colors, "mutableCopy");
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    if (v6)
      v9 = v4;
    else
      v9 = 0;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor tintColor](UIColor, "tintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
        break;
      if (v9)
        goto LABEL_9;
LABEL_10:
      if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_14;
    }
    _TintColorFromTraitCollection(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v14, v8);

    if (!v9)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resolvedColorWithTraitCollection:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v13, v8);

    goto LABEL_10;
  }
LABEL_14:
  v15 = (void *)objc_msgSend(v7, "copy");

  return v15;
}

@end
