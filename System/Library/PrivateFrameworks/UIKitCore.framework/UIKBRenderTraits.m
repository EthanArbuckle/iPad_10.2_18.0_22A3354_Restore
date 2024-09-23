@implementation UIKBRenderTraits

- (void)overlayWithTraits:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *renderEffects;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *foregroundRenderEffects;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;

  v39 = a3;
  objc_msgSend(v39, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBRenderTraits geometry](self, "geometry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "geometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overlayWithGeometry:", v6);

  }
  objc_msgSend(v39, "backgroundGradient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v39, "backgroundGradient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderTraits setBackgroundGradient:](self, "setBackgroundGradient:", v8);

    -[UIKBRenderTraits setLayeredBackgroundGradient:](self, "setLayeredBackgroundGradient:", 0);
  }
  objc_msgSend(v39, "layeredBackgroundGradient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v39, "layeredBackgroundGradient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderTraits setLayeredBackgroundGradient:](self, "setLayeredBackgroundGradient:", v10);

  }
  objc_msgSend(v39, "layeredForegroundGradient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v39, "layeredForegroundGradient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderTraits setLayeredForegroundGradient:](self, "setLayeredForegroundGradient:", v12);

  }
  objc_msgSend(v39, "symbolStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIKBRenderTraits symbolStyle](self, "symbolStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "symbolStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overlayWithStyle:", v15);

  }
  objc_msgSend(v39, "fallbackSymbolStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UIKBRenderTraits fallbackSymbolStyle](self, "fallbackSymbolStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fallbackSymbolStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "overlayWithStyle:", v18);

  }
  objc_msgSend(v39, "secondarySymbolStyles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[UIKBRenderTraits secondarySymbolStyles](self, "secondarySymbolStyles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[UIKBRenderTraits secondarySymbolStyles](self, "secondarySymbolStyles");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __38__UIKBRenderTraits_overlayWithTraits___block_invoke;
      v40[3] = &unk_1E16D3E60;
      v41 = v39;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v40);

      v22 = v41;
    }
    else
    {
      objc_msgSend(v39, "secondarySymbolStyles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderTraits setSecondarySymbolStyles:](self, "setSecondarySymbolStyles:", v22);
    }

  }
  objc_msgSend(v39, "renderEffects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v39, "renderEffects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (NSMutableArray *)objc_msgSend(v24, "mutableCopy");
    renderEffects = self->_renderEffects;
    self->_renderEffects = v25;

  }
  objc_msgSend(v39, "foregroundRenderEffects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v39, "foregroundRenderEffects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (NSMutableArray *)objc_msgSend(v28, "mutableCopy");
    foregroundRenderEffects = self->_foregroundRenderEffects;
    self->_foregroundRenderEffects = v29;

  }
  objc_msgSend(v39, "variantTraits");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v39, "variantTraits");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderTraits setVariantTraits:](self, "setVariantTraits:", v32);

  }
  v33 = v39;
  if (*((_QWORD *)v39 + 13))
  {
    objc_msgSend(v39, "highlightedVariantTraits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderTraits setHighlightedVariantTraits:](self, "setHighlightedVariantTraits:", v34);

    v33 = v39;
  }
  v35 = objc_msgSend(v33, "controlOpacities");
  v36 = v39;
  if ((v35 & 1) != 0 || *((_BYTE *)v39 + 24))
  {
    -[UIKBRenderTraits setControlOpacities:](self, "setControlOpacities:", objc_msgSend(v39, "controlOpacities"));
    v36 = v39;
  }
  if (objc_msgSend(v36, "blurBlending"))
    -[UIKBRenderTraits setBlurBlending:](self, "setBlurBlending:", objc_msgSend(v39, "blurBlending"));
  if (objc_msgSend(v39, "blendForm"))
    -[UIKBRenderTraits setBlendForm:](self, "setBlendForm:", objc_msgSend(v39, "blendForm"));
  objc_msgSend(v39, "renderFlags");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v39, "renderFlags");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderTraits setRenderFlags:](self, "setRenderFlags:", v38);

  }
  if (objc_msgSend(v39, "renderSecondarySymbolsSeparately"))
    -[UIKBRenderTraits setRenderSecondarySymbolsSeparately:](self, "setRenderSecondarySymbolsSeparately:", objc_msgSend(v39, "renderSecondarySymbolsSeparately"));
  if (objc_msgSend(v39, "renderFlagsForAboveEffects"))
    -[UIKBRenderTraits setRenderFlagsForAboveEffects:](self, "setRenderFlagsForAboveEffects:", objc_msgSend(v39, "renderFlagsForAboveEffects"));

}

- (BOOL)controlOpacities
{
  return self->_controlOpacities;
}

- (BOOL)blurBlending
{
  return self->_blurBlending;
}

- (NSArray)renderEffects
{
  return &self->_renderEffects->super;
}

- (UIKBGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (BOOL)renderSecondarySymbolsSeparately
{
  return self->_renderSecondarySymbolsSeparately;
}

- (NSArray)renderFlags
{
  return self->_renderFlags;
}

- (UIKBRenderTraits)variantTraits
{
  return self->_variantTraits;
}

- (UIKBGradient)layeredForegroundGradient
{
  return self->_layeredForegroundGradient;
}

- (NSArray)secondarySymbolStyles
{
  return self->_secondarySymbolStyles;
}

- (UIKBTextStyle)fallbackSymbolStyle
{
  UIKBTextStyle *fallbackSymbolStyle;
  void *v4;
  void *v5;
  void *v6;

  fallbackSymbolStyle = self->_fallbackSymbolStyle;
  -[UIKBRenderTraits symbolStyle](self, "symbolStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (fallbackSymbolStyle)
  {
    v6 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "overlayWithStyle:", self->_fallbackSymbolStyle);
    v5 = v6;
  }
  return (UIKBTextStyle *)v5;
}

- (int64_t)renderFlagsForAboveEffects
{
  return self->_renderFlagsForAboveEffects;
}

- (UIKBGradient)layeredBackgroundGradient
{
  return self->_layeredBackgroundGradient;
}

- (NSArray)foregroundRenderEffects
{
  return &self->_foregroundRenderEffects->super;
}

- (void)setControlOpacities:(BOOL)a3
{
  self->_controlOpacities = a3;
  self->_honorControlOpacity = 1;
}

- (void)setHashString:(id)a3
{
  objc_storeStrong((id *)&self->_hashString, a3);
}

- (UIKBTextStyle)symbolStyle
{
  return self->_symbolStyle;
}

- (UIKBRenderGeometry)geometry
{
  return self->_geometry;
}

- (void)setBackgroundGradient:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundGradient, a3);
}

- (void)setSymbolStyle:(id)a3
{
  objc_storeStrong((id *)&self->_symbolStyle, a3);
}

- (void)addRenderEffect:(id)a3
{
  id v4;
  NSMutableArray *renderEffects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  renderEffects = self->_renderEffects;
  v8 = v4;
  if (!renderEffects)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v7 = self->_renderEffects;
    self->_renderEffects = v6;

    v4 = v8;
    renderEffects = self->_renderEffects;
  }
  -[NSMutableArray addObject:](renderEffects, "addObject:", v4);

}

- (void)setBlendForm:(int64_t)a3
{
  self->_blendForm = a3;
}

- (void)setUsesDarkAppearance:(BOOL)a3
{
  self->_usesDarkAppearance = a3;
}

+ (id)emptyTraits
{
  return objc_alloc_init(UIKBRenderTraits);
}

- (void)setGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_geometry, a3);
}

- (void)setLayeredBackgroundGradient:(id)a3
{
  objc_storeStrong((id *)&self->_layeredBackgroundGradient, a3);
}

- (void)setSecondarySymbolStyles:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySymbolStyles, a3);
}

- (int64_t)blendForm
{
  return self->_blendForm;
}

- (NSString)hashString
{
  return self->_hashString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashString, 0);
  objc_storeStrong((id *)&self->_renderFlags, 0);
  objc_storeStrong((id *)&self->_highlightedVariantTraits, 0);
  objc_storeStrong((id *)&self->_variantTraits, 0);
  objc_storeStrong((id *)&self->_variantGeometries, 0);
  objc_storeStrong((id *)&self->_secondarySymbolStyles, 0);
  objc_storeStrong((id *)&self->_fallbackSymbolStyle, 0);
  objc_storeStrong((id *)&self->_symbolStyle, 0);
  objc_storeStrong((id *)&self->_layeredForegroundGradient, 0);
  objc_storeStrong((id *)&self->_layeredBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_backgroundGradient, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_foregroundRenderEffects, 0);
  objc_storeStrong((id *)&self->_renderEffects, 0);
}

- (void)setLayeredForegroundGradient:(id)a3
{
  objc_storeStrong((id *)&self->_layeredForegroundGradient, a3);
}

+ (UIKBRenderTraits)traitsWithSymbolStyle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "emptyTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSymbolStyle:", v3);

  return (UIKBRenderTraits *)v4;
}

+ (UIKBRenderTraits)traitsWithGeometry:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "emptyTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeometry:", v3);

  return (UIKBRenderTraits *)v4;
}

- (void)addForegroundRenderEffect:(id)a3
{
  id v4;
  NSMutableArray *foregroundRenderEffects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  foregroundRenderEffects = self->_foregroundRenderEffects;
  v8 = v4;
  if (!foregroundRenderEffects)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v7 = self->_foregroundRenderEffects;
    self->_foregroundRenderEffects = v6;

    v4 = v8;
    foregroundRenderEffects = self->_foregroundRenderEffects;
  }
  -[NSMutableArray addObject:](foregroundRenderEffects, "addObject:", v4);

}

- (void)removeAllRenderEffects
{
  -[NSMutableArray removeAllObjects](self->_renderEffects, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_foregroundRenderEffects, "removeAllObjects");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIKBRenderTraits geometry](self, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBRenderTraits geometry](self, "geometry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; geometry = %@"), v5);

  }
  -[UIKBRenderTraits backgroundGradient](self, "backgroundGradient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBRenderTraits backgroundGradient](self, "backgroundGradient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; backgroundGradient = %@"), v7);

  }
  -[UIKBRenderTraits layeredBackgroundGradient](self, "layeredBackgroundGradient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBRenderTraits layeredBackgroundGradient](self, "layeredBackgroundGradient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; layeredBackgroundGradient = %@"), v9);

  }
  -[UIKBRenderTraits layeredForegroundGradient](self, "layeredForegroundGradient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBRenderTraits layeredForegroundGradient](self, "layeredForegroundGradient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; layeredForegroundGradient = %@"), v11);

  }
  -[UIKBRenderTraits symbolStyle](self, "symbolStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIKBRenderTraits symbolStyle](self, "symbolStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; symbolStyle = %@"), v13);

  }
  -[UIKBRenderTraits fallbackSymbolStyle](self, "fallbackSymbolStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIKBRenderTraits fallbackSymbolStyle](self, "fallbackSymbolStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; fallbackSymbolStyle = %@"), v15);

  }
  -[UIKBRenderTraits secondarySymbolStyles](self, "secondarySymbolStyles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UIKBRenderTraits secondarySymbolStyles](self, "secondarySymbolStyles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; secondarySymbolStyles = %@"), v17);

  }
  -[UIKBRenderTraits renderEffects](self, "renderEffects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIKBRenderTraits renderEffects](self, "renderEffects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; renderEffects = %@"), v19);

  }
  -[UIKBRenderTraits foregroundRenderEffects](self, "foregroundRenderEffects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[UIKBRenderTraits foregroundRenderEffects](self, "foregroundRenderEffects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; foregroundRenderEffects = %@"), v21);

  }
  if (-[UIKBRenderTraits blurBlending](self, "blurBlending"))
    objc_msgSend(v3, "appendString:", CFSTR("; blurBlending = YES"));
  v22 = -[UIKBRenderTraits blendForm](self, "blendForm");
  v23 = CFSTR("None");
  if (v22 == 3)
    v23 = CFSTR("Passcode");
  if (v22 == 1)
    v23 = CFSTR("LightLatin");
  objc_msgSend(v3, "appendFormat:", CFSTR("; blendForm = %@"), v23);
  -[UIKBRenderTraits renderFlags](self, "renderFlags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[UIKBRenderTraits renderFlags](self, "renderFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; renderFlags = %@"), v25);

  }
  if (-[UIKBRenderTraits renderSecondarySymbolsSeparately](self, "renderSecondarySymbolsSeparately"))
    objc_msgSend(v3, "appendString:", CFSTR("; renderSecondarySymbolsSeparately = YES"));
  if (-[UIKBRenderTraits renderFlagsForAboveEffects](self, "renderFlagsForAboveEffects"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; renderFlagsForAboveEffects = %ld"),
      -[UIKBRenderTraits renderFlagsForAboveEffects](self, "renderFlagsForAboveEffects"));
  -[UIKBRenderTraits hashString](self, "hashString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; hashString = %@"), v26);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UIKBRenderTraits *v4;
  UIKBRenderGeometry *geometry;
  UIKBGradient *backgroundGradient;
  UIKBGradient *layeredBackgroundGradient;
  UIKBGradient *layeredForegroundGradient;
  UIKBTextStyle *symbolStyle;
  UIKBTextStyle *fallbackSymbolStyle;
  NSArray *secondarySymbolStyles;
  NSMutableArray *renderEffects;
  NSMutableArray *foregroundRenderEffects;
  NSArray *variantGeometries;
  UIKBRenderTraits *variantTraits;
  UIKBRenderTraits *highlightedVariantTraits;
  NSArray *renderFlags;
  BOOL v18;

  v4 = (UIKBRenderTraits *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_46;
    geometry = self->_geometry;
    if ((v4->_geometry == 0) == (geometry != 0)
      || geometry && !-[UIKBRenderGeometry isEqual:](geometry, "isEqual:"))
    {
      goto LABEL_46;
    }
    backgroundGradient = self->_backgroundGradient;
    if ((backgroundGradient != 0) == (v4->_backgroundGradient == 0)
      || backgroundGradient && !-[UIKBGradient isEqual:](backgroundGradient, "isEqual:"))
    {
      goto LABEL_46;
    }
    layeredBackgroundGradient = self->_layeredBackgroundGradient;
    if ((layeredBackgroundGradient != 0) == (v4->_layeredBackgroundGradient == 0)
      || layeredBackgroundGradient && !-[UIKBGradient isEqual:](layeredBackgroundGradient, "isEqual:"))
    {
      goto LABEL_46;
    }
    layeredForegroundGradient = self->_layeredForegroundGradient;
    if ((layeredForegroundGradient != 0) == (v4->_layeredForegroundGradient == 0)
      || layeredForegroundGradient && !-[UIKBGradient isEqual:](layeredForegroundGradient, "isEqual:"))
    {
      goto LABEL_46;
    }
    symbolStyle = self->_symbolStyle;
    if ((symbolStyle != 0) == (v4->_symbolStyle == 0)
      || symbolStyle && !-[UIKBTextStyle isEqual:](symbolStyle, "isEqual:"))
    {
      goto LABEL_46;
    }
    fallbackSymbolStyle = self->_fallbackSymbolStyle;
    if ((fallbackSymbolStyle != 0) == (v4->_fallbackSymbolStyle == 0)
      || fallbackSymbolStyle && !-[UIKBTextStyle isEqual:](fallbackSymbolStyle, "isEqual:"))
    {
      goto LABEL_46;
    }
    if ((secondarySymbolStyles = self->_secondarySymbolStyles,
          (secondarySymbolStyles != 0) == (v4->_secondarySymbolStyles == 0))
      || secondarySymbolStyles && !-[NSArray isEqualToArray:](secondarySymbolStyles, "isEqualToArray:")
      || (renderEffects = self->_renderEffects, (renderEffects != 0) == (v4->_renderEffects == 0))
      || renderEffects && !-[NSMutableArray isEqualToArray:](renderEffects, "isEqualToArray:")
      || (foregroundRenderEffects = self->_foregroundRenderEffects,
          (foregroundRenderEffects != 0) == (v4->_foregroundRenderEffects == 0))
      || foregroundRenderEffects
      && !-[NSMutableArray isEqualToArray:](foregroundRenderEffects, "isEqualToArray:")
      || (variantGeometries = self->_variantGeometries, (variantGeometries != 0) == (v4->_variantGeometries == 0))
      || variantGeometries && !-[NSArray isEqualToArray:](variantGeometries, "isEqualToArray:")
      || (variantTraits = self->_variantTraits, (variantTraits != 0) == (v4->_variantTraits == 0))
      || variantTraits && !-[UIKBRenderTraits isEqual:](variantTraits, "isEqual:")
      || (highlightedVariantTraits = self->_highlightedVariantTraits,
          (highlightedVariantTraits != 0) == (v4->_highlightedVariantTraits == 0))
      || highlightedVariantTraits && !-[UIKBRenderTraits isEqual:](highlightedVariantTraits, "isEqual:")
      || self->_controlOpacities != v4->_controlOpacities
      || self->_blurBlending != v4->_blurBlending
      || self->_blendForm != v4->_blendForm
      || (renderFlags = self->_renderFlags) != 0
      && !-[NSArray isEqualToArray:](renderFlags, "isEqualToArray:", v4->_renderFlags)
      || self->_renderSecondarySymbolsSeparately != v4->_renderSecondarySymbolsSeparately)
    {
LABEL_46:
      v18 = 0;
    }
    else
    {
      v18 = self->_renderFlagsForAboveEffects == v4->_renderFlagsForAboveEffects;
    }
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBRenderTraits *v4;
  uint64_t v5;
  UIKBGradient *backgroundGradient;
  uint64_t v7;
  UIKBGradient *layeredBackgroundGradient;
  uint64_t v9;
  UIKBGradient *layeredForegroundGradient;
  uint64_t v11;
  UIKBTextStyle *symbolStyle;
  uint64_t v13;
  UIKBTextStyle *fallbackSymbolStyle;
  uint64_t v15;
  NSArray *secondarySymbolStyles;
  uint64_t v17;
  NSMutableArray *renderEffects;
  uint64_t v19;
  NSMutableArray *foregroundRenderEffects;
  uint64_t v21;
  NSArray *renderFlags;
  uint64_t v23;
  NSString *hashString;

  v4 = -[UIKBRenderTraits init](+[UIKBRenderTraits allocWithZone:](UIKBRenderTraits, "allocWithZone:", a3), "init");
  v5 = -[UIKBGradient copy](self->_backgroundGradient, "copy");
  backgroundGradient = v4->_backgroundGradient;
  v4->_backgroundGradient = (UIKBGradient *)v5;

  v7 = -[UIKBGradient copy](self->_layeredBackgroundGradient, "copy");
  layeredBackgroundGradient = v4->_layeredBackgroundGradient;
  v4->_layeredBackgroundGradient = (UIKBGradient *)v7;

  v9 = -[UIKBGradient copy](self->_layeredForegroundGradient, "copy");
  layeredForegroundGradient = v4->_layeredForegroundGradient;
  v4->_layeredForegroundGradient = (UIKBGradient *)v9;

  v11 = -[UIKBTextStyle copy](self->_symbolStyle, "copy");
  symbolStyle = v4->_symbolStyle;
  v4->_symbolStyle = (UIKBTextStyle *)v11;

  v13 = -[UIKBTextStyle copy](self->_fallbackSymbolStyle, "copy");
  fallbackSymbolStyle = v4->_fallbackSymbolStyle;
  v4->_fallbackSymbolStyle = (UIKBTextStyle *)v13;

  if (-[NSArray count](self->_secondarySymbolStyles, "count"))
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_secondarySymbolStyles, 1);
    secondarySymbolStyles = v4->_secondarySymbolStyles;
    v4->_secondarySymbolStyles = (NSArray *)v15;

  }
  if (-[NSMutableArray count](self->_renderEffects, "count"))
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_renderEffects, 1);
    renderEffects = v4->_renderEffects;
    v4->_renderEffects = (NSMutableArray *)v17;

  }
  if (-[NSMutableArray count](self->_foregroundRenderEffects, "count"))
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_foregroundRenderEffects, 1);
    foregroundRenderEffects = v4->_foregroundRenderEffects;
    v4->_foregroundRenderEffects = (NSMutableArray *)v19;

  }
  v4->_controlOpacities = self->_controlOpacities;
  v4->_blurBlending = self->_blurBlending;
  v4->_blendForm = self->_blendForm;
  v21 = -[NSArray copy](self->_renderFlags, "copy");
  renderFlags = v4->_renderFlags;
  v4->_renderFlags = (NSArray *)v21;

  v23 = -[NSString copy](self->_hashString, "copy");
  hashString = v4->_hashString;
  v4->_hashString = (NSString *)v23;

  v4->_renderSecondarySymbolsSeparately = self->_renderSecondarySymbolsSeparately;
  v4->_renderFlagsForAboveEffects = self->_renderFlagsForAboveEffects;
  return v4;
}

- (UIKBRenderTraits)highlightedVariantTraits
{
  UIKBRenderTraits *highlightedVariantTraits;
  void *v4;
  void *v5;
  void *v6;

  highlightedVariantTraits = self->_highlightedVariantTraits;
  -[UIKBRenderTraits variantTraits](self, "variantTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (highlightedVariantTraits)
  {
    v6 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "overlayWithTraits:", self->_highlightedVariantTraits);
    v5 = v6;
  }
  return (UIKBRenderTraits *)v5;
}

void __38__UIKBRenderTraits_overlayWithTraits___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "secondarySymbolStyles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "secondarySymbolStyles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "overlayWithStyle:", v10);

  }
}

- (void)modifyForMasking
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIKBRenderTraits backgroundGradient](self, "backgroundGradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[UIKBRenderTraits layeredBackgroundGradient](self, "layeredBackgroundGradient"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[UIKBRenderTraits layeredForegroundGradient](self, "layeredForegroundGradient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_5;
  }
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorBlack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderTraits setBackgroundGradient:](self, "setBackgroundGradient:", v4);

  -[UIKBRenderTraits setLayeredBackgroundGradient:](self, "setLayeredBackgroundGradient:", 0);
  -[UIKBRenderTraits setLayeredForegroundGradient:](self, "setLayeredForegroundGradient:", 0);
LABEL_5:
  -[UIKBRenderTraits removeAllRenderEffects](self, "removeAllRenderEffects");
  -[UIKBRenderTraits setHashString:](self, "setHashString:", 0);
  -[UIKBRenderTraits variantTraits](self, "variantTraits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modifyForMasking");

}

- (id)extraFiltersForType:(id)a3
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  __int128 *v8;
  void *v9;
  void *v10;
  void **v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if ((id)*MEMORY[0x1E0CD2F08] != a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKBRenderTraits usesDarkAppearance](self, "usesDarkAppearance");
  v7 = -[UIKBRenderTraits controlOpacities](self, "controlOpacities");
  if (v6)
  {
    if (v7)
      v8 = &xmmword_1866802B8;
    else
      v8 = &xmmword_186680308;
    v12 = v8[3];
    v19 = v8[2];
    v20 = v12;
    v21 = v8[4];
    v13 = v8[1];
    v17 = *v8;
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("inputColorMatrix"));
    v24[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7)
    {
      v19 = xmmword_186680378;
      v20 = unk_186680388;
      v21 = xmmword_186680398;
      v17 = xmmword_186680358;
      v18 = unk_186680368;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("inputColorMatrix"));

      v23 = v5;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v23;
    }
    else
    {
      v19 = xmmword_1866803C8;
      v20 = unk_1866803D8;
      v21 = xmmword_1866803E8;
      v17 = xmmword_1866803A8;
      v18 = unk_1866803B8;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v16, CFSTR("inputColorMatrix"));

      v22 = v5;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v22;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)setFallbackSymbolStyle:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackSymbolStyle, a3);
}

- (NSArray)variantGeometries
{
  return self->_variantGeometries;
}

- (void)setVariantGeometries:(id)a3
{
  objc_storeStrong((id *)&self->_variantGeometries, a3);
}

- (void)setVariantTraits:(id)a3
{
  objc_storeStrong((id *)&self->_variantTraits, a3);
}

- (void)setHighlightedVariantTraits:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedVariantTraits, a3);
}

- (void)setBlurBlending:(BOOL)a3
{
  self->_blurBlending = a3;
}

- (void)setRenderFlags:(id)a3
{
  objc_storeStrong((id *)&self->_renderFlags, a3);
}

- (void)setRenderSecondarySymbolsSeparately:(BOOL)a3
{
  self->_renderSecondarySymbolsSeparately = a3;
}

- (void)setRenderFlagsForAboveEffects:(int64_t)a3
{
  self->_renderFlagsForAboveEffects = a3;
}

- (BOOL)usesDarkAppearance
{
  return self->_usesDarkAppearance;
}

- (double)floatingContentViewCornerRadius
{
  return self->_floatingContentViewCornerRadius;
}

- (void)setFloatingContentViewCornerRadius:(double)a3
{
  self->_floatingContentViewCornerRadius = a3;
}

- (CGSize)floatingContentViewFocusedIncreaseSize
{
  double width;
  double height;
  CGSize result;

  width = self->_floatingContentViewFocusedIncreaseSize.width;
  height = self->_floatingContentViewFocusedIncreaseSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFloatingContentViewFocusedIncreaseSize:(CGSize)a3
{
  self->_floatingContentViewFocusedIncreaseSize = a3;
}

- (double)floatingContentViewShadowVerticalOffset
{
  return self->_floatingContentViewShadowVerticalOffset;
}

- (void)setFloatingContentViewShadowVerticalOffset:(double)a3
{
  self->_floatingContentViewShadowVerticalOffset = a3;
}

- (double)floatingContentViewShadowRadius
{
  return self->_floatingContentViewShadowRadius;
}

- (void)setFloatingContentViewShadowRadius:(double)a3
{
  self->_floatingContentViewShadowRadius = a3;
}

- (double)floatingContentViewShadowOpacity
{
  return self->_floatingContentViewShadowOpacity;
}

- (void)setFloatingContentViewShadowOpacity:(double)a3
{
  self->_floatingContentViewShadowOpacity = a3;
}

@end
