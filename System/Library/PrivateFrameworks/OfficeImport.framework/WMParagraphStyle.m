@implementation WMParagraphStyle

- (WMParagraphStyle)initWithWDStyle:(id)a3 isInTextFrame:(BOOL)a4
{
  id v7;
  WMParagraphStyle *v8;
  WMParagraphStyle *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WMParagraphStyle;
  v8 = -[CMStyle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_baseStyle, a3);
    v9->_isInTextFrame = a4;
  }

  return v9;
}

- (void)addParagraphProperties:(id)a3
{
  void *v4;
  CMStringProperty *v5;
  CMStringProperty *v6;
  CMLengthProperty *v7;
  CMLengthProperty *v8;
  CMLengthProperty *v9;
  WMEnumProperty *v10;
  CMLengthProperty *v11;
  CMLengthProperty *v12;
  void *v13;
  CMLengthProperty *v14;
  void *v15;
  CMLengthProperty *v16;
  CMLengthProperty *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  CMColorProperty *v22;
  id v23;

  v23 = a3;
  if (objc_msgSend(v23, "isCharacterPropertiesOverridden"))
  {
    objc_msgSend(v23, "characterProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(v23, "isBiDiOverridden") && objc_msgSend(v23, "biDi"))
  {
    v5 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3E2EB8);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v5, 0x24F3E6618);

  }
  if (objc_msgSend(v4, "isRightToLeftOverridden"))
  {
    if (-[WMParagraphStyle isRTLWithOverridesFromProperties:](self, "isRTLWithOverridesFromProperties:", v4))
      v6 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3E2EB8);
    else
      v6 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3E2ED8);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v6, 0x24F3E6618);

  }
  if (objc_msgSend(v23, "isSpaceAfterOverridden"))
  {
    v7 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)objc_msgSend(v23, "spaceAfter"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v7, 0x24F3E6F78);

  }
  if (objc_msgSend(v23, "isSpaceBeforeOverridden"))
  {
    v8 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)objc_msgSend(v23, "spaceBefore"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v8, 0x24F3D5698);

  }
  if (objc_msgSend(v23, "isLineSpacingOverridden"))
  {
    v9 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 8, (double)(int)objc_msgSend(v23, "lineSpacing") / 240.0 * 1.2);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v9, 0x24F3E6F58);

  }
  if (objc_msgSend(v23, "isJustificationOverridden"))
  {
    v10 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", (int)objc_msgSend(v23, "justification"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v10, 0x24F3E70D8);

  }
  if (objc_msgSend(v23, "isLeftIndentOverridden"))
  {
    v11 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)objc_msgSend(v23, "leftIndent"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v11, 0x24F3D5678);

  }
  if (objc_msgSend(v23, "isRightIndentOverridden"))
  {
    v12 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)objc_msgSend(v23, "rightIndent"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v12, 0x24F3E6F98);

  }
  if (objc_msgSend(v23, "isLeadingIndentOverridden"))
  {
    -[WMParagraphStyle leadingMarginPropertyNameWithOverridesFromProperties:](self, "leadingMarginPropertyNameWithOverridesFromProperties:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)objc_msgSend(v23, "leadingIndent"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v14, v13);

  }
  if (objc_msgSend(v23, "isFollowingIndentOverridden"))
  {
    -[WMParagraphStyle trailingMarginPropertyNameWithOverridesFromProperties:](self, "trailingMarginPropertyNameWithOverridesFromProperties:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)objc_msgSend(v23, "followingIndent"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v16, v15);

  }
  if (objc_msgSend(v23, "isFirstLineIndentOverridden"))
  {
    v17 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)objc_msgSend(v23, "firstLineIndent"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v17, 0x24F3E70F8);

  }
  -[WMParagraphStyle mapBorders:](self, "mapBorders:", v23);
  if (objc_msgSend(v23, "isShadingOverridden"))
  {
    objc_msgSend(v23, "shading");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[WMParagraphStyle isShadingNull:](WMParagraphStyle, "isShadingNull:", v18);

    if (!v19)
    {
      objc_msgSend(v23, "shading");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMColorProperty nsColorFromShading:](CMColorProperty, "nsColorFromShading:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = -[CMColorProperty initWithColor:]([CMColorProperty alloc], "initWithColor:", v21);
      -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v22, 0x24F3E6CB8);

    }
  }

}

- (void)mapBorders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WMBordersProperty *v7;
  id v8;

  v4 = a3;
  if (!self->_isInTextFrame)
  {
    v8 = v4;
    if (objc_msgSend(v4, "isBottomBorderOverridden"))
    {
      objc_msgSend(v8, "bottomBorder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && objc_msgSend(v5, "style"))
      {
        v7 = objc_alloc_init(WMBordersProperty);
        -[WMBordersProperty setBorder:location:](v7, "setBorder:location:", v6, 3);
        -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v7, 0x24F3E6D18);

      }
    }
    else
    {
      v6 = 0;
    }

    v4 = v8;
  }

}

- (void)addParagraphStyleCharacterProperties:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "baseStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 && v5 != v7)
      -[WMParagraphStyle addParagraphStyleCharacterProperties:](self, "addParagraphStyleCharacterProperties:", v5);
    objc_msgSend(v7, "characterProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMStyle addCharacterProperties:](self, "addCharacterProperties:", v6);

    v4 = v7;
  }

}

+ (BOOL)isShadingNull:(id)a3
{
  id v3;
  int v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "style");
  if (v4)
  {
    if (v4 == 0xFFFF)
    {
      objc_msgSend(v3, "foreground");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alphaComponent");
      if (v6 == 0.0)
      {
        objc_msgSend(v3, "background");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alphaComponent");
        v9 = v8 == 0.0;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)addParagraphPropertiesFromStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "baseStyle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 && v5 != v7)
      -[WMParagraphStyle addParagraphPropertiesFromStyle:](self, "addParagraphPropertiesFromStyle:", v5);
    objc_msgSend(v7, "paragraphProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMParagraphStyle addParagraphProperties:](self, "addParagraphProperties:", v6);

    v4 = v7;
  }

}

- (void)addParagraphPropertiesFromStyle
{
  -[WMParagraphStyle addParagraphPropertiesFromStyle:](self, "addParagraphPropertiesFromStyle:", self->_baseStyle);
}

- (BOOL)isRTLWithOverridesFromProperties:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isRightToLeftOverridden"))
  {
    v5 = objc_msgSend(v4, "rightToLeft");
    if (!v5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    if (v5 == 1)
    {
      v10 = 1;
      goto LABEL_7;
    }
    v6 = v5 == 129;
  }
  else
  {
    v6 = 0;
  }
  -[CMStyle propertyForName:](self, "propertyForName:", 0x24F3E6618);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", 0x24F3E2EB8);

  v10 = v6 ^ v9;
LABEL_7:

  return v10;
}

- (id)leadingMarginPropertyNameWithOverridesFromProperties:(id)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = -[WMParagraphStyle isRTLWithOverridesFromProperties:](self, "isRTLWithOverridesFromProperties:", a3);
  v4 = &HUPropNmMarginRight;
  if (!v3)
    v4 = &HUPropNmMarginLeft;
  return (id)*v4;
}

- (id)trailingMarginPropertyNameWithOverridesFromProperties:(id)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = -[WMParagraphStyle isRTLWithOverridesFromProperties:](self, "isRTLWithOverridesFromProperties:", a3);
  v4 = &HUPropNmMarginLeft;
  if (!v3)
    v4 = &HUPropNmMarginRight;
  return (id)*v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
