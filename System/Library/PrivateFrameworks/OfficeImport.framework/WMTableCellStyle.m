@implementation WMTableCellStyle

- (void)addTableCellProperties:(id)a3
{
  WMBordersProperty *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WMEnumProperty *v9;
  void *v10;
  CMColorProperty *v11;
  void *v12;
  CMColorProperty *v13;
  id v14;

  v14 = a3;
  if ((objc_msgSend(v14, "isTopBorderOverridden") & 1) != 0
    || (objc_msgSend(v14, "isLeftBorderOverridden") & 1) != 0
    || (objc_msgSend(v14, "isBottomBorderOverridden") & 1) != 0
    || objc_msgSend(v14, "isRightBorderOverridden"))
  {
    v4 = objc_alloc_init(WMBordersProperty);
    if (objc_msgSend(v14, "isTopBorderOverridden"))
    {
      objc_msgSend(v14, "topBorder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v5, 1);

    }
    if (objc_msgSend(v14, "isLeftBorderOverridden"))
    {
      objc_msgSend(v14, "leftBorder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v6, 2);

    }
    if (objc_msgSend(v14, "isBottomBorderOverridden"))
    {
      objc_msgSend(v14, "bottomBorder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v7, 3);

    }
    if (objc_msgSend(v14, "isRightBorderOverridden"))
    {
      objc_msgSend(v14, "rightBorder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WMBordersProperty setBorder:location:](v4, "setBorder:location:", v8, 4);

    }
    -[CMBordersProperty adjustValues](v4, "adjustValues");
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v4, 0x24F3E71D8);

  }
  if (objc_msgSend(v14, "isVerticalAlignmentOverridden"))
  {
    v9 = -[WMEnumProperty initWithEnum:]([WMEnumProperty alloc], "initWithEnum:", objc_msgSend(v14, "verticalAlignment"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v9, 0x24F3E71F8);

  }
  if (objc_msgSend(v14, "isLeftMarginOverridden"))
  {
    self->mLeftPadding = (double)(int)objc_msgSend(v14, "leftMargin");
    -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", 0x24F3E7078, 2);
  }
  if (objc_msgSend(v14, "isRightMarginOverridden"))
  {
    self->mRightPadding = (double)(int)objc_msgSend(v14, "rightMargin");
    -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", 0x24F3E7098, 2);
  }
  if (objc_msgSend(v14, "isShadingOverridden"))
  {
    objc_msgSend(v14, "shading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [CMColorProperty alloc];
    +[WMTableCellStyle dominantColorOf:](WMTableCellStyle, "dominantColorOf:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CMColorProperty initWithColor:](v11, "initWithColor:", v12);

    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v13, 0x24F3E6CB8);
  }

}

- (double)leftPadding
{
  return self->mLeftPadding;
}

- (double)rightPadding
{
  return self->mRightPadding;
}

- (void)addTableCellStyleProperties:(id)a3
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
      -[WMTableCellStyle addTableCellStyleProperties:](self, "addTableCellStyleProperties:", v5);
    objc_msgSend(v7, "tableCellProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMTableCellStyle addTableCellProperties:](self, "addTableCellProperties:", v6);

    v4 = v7;
  }

}

+ (id)dominantColorOf:(id)a3
{
  id v5;
  int v6;
  double v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "style");
  LODWORD(v7) = 1057384038;
  switch(v6)
  {
    case 0:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 0;
      goto LABEL_48;
    case 1:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1.0;
      goto LABEL_48;
    case 2:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1028443341;
      goto LABEL_48;
    case 3:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1036831949;
      goto LABEL_48;
    case 4:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1045220557;
      goto LABEL_48;
    case 5:
      a1 = WMTableCellStyle;
      goto LABEL_9;
    case 6:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1050253722;
      goto LABEL_48;
    case 7:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1053609165;
      goto LABEL_48;
    case 8:
      a1 = WMTableCellStyle;
      goto LABEL_2;
    case 9:
      a1 = WMTableCellStyle;
      goto LABEL_14;
    case 10:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1060320051;
      goto LABEL_48;
    case 11:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 0.75;
      goto LABEL_48;
    case 12:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1061997773;
      goto LABEL_48;
    case 13:
      a1 = WMTableCellStyle;
      LODWORD(v7) = *(_DWORD *)"fff?";
      goto LABEL_48;
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 25:
LABEL_2:
      LODWORD(v7) = 0.5;
      goto LABEL_48;
    case 19:
LABEL_14:
      LODWORD(v7) = 1058642330;
      goto LABEL_48;
    case 20:
    case 21:
    case 22:
    case 23:
LABEL_9:
      LODWORD(v7) = 0.25;
      goto LABEL_48;
    case 24:
      goto LABEL_29;
    case 35:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1020054733;
      goto LABEL_48;
    case 36:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1033476506;
      goto LABEL_48;
    case 37:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 0.125;
      goto LABEL_48;
    case 38:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1041865114;
      goto LABEL_48;
    case 39:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1043542835;
      goto LABEL_48;
    case 40:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1046898278;
      goto LABEL_48;
    case 41:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1049414861;
      goto LABEL_48;
    case 42:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1051092582;
      goto LABEL_48;
    case 43:
      a1 = WMTableCellStyle;
LABEL_29:
      LODWORD(v7) = 1051931443;
      goto LABEL_48;
    case 44:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 0.375;
      goto LABEL_48;
    case 45:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1054448026;
      goto LABEL_48;
    case 46:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1055286886;
      goto LABEL_48;
    case 47:
      a1 = WMTableCellStyle;
      LODWORD(v7) = 1056125747;
      goto LABEL_48;
    case 48:
      goto LABEL_48;
    case 49:
      LODWORD(v7) = 1057803469;
      goto LABEL_48;
    case 50:
      LODWORD(v7) = 1058222899;
      goto LABEL_48;
    case 51:
      LODWORD(v7) = 0.625;
      goto LABEL_48;
    case 52:
      LODWORD(v7) = 1059481190;
      goto LABEL_48;
    case 53:
      LODWORD(v7) = 1059900621;
      goto LABEL_48;
    case 54:
      LODWORD(v7) = 1060739482;
      goto LABEL_48;
    case 55:
      LODWORD(v7) = 1061578342;
      goto LABEL_48;
    case 56:
      LODWORD(v7) = 1062417203;
      goto LABEL_48;
    case 57:
      LODWORD(v7) = 1062836634;
      goto LABEL_48;
    case 58:
      LODWORD(v7) = 0.875;
      goto LABEL_48;
    case 59:
      LODWORD(v7) = 1064094925;
      goto LABEL_48;
    case 60:
      LODWORD(v7) = 1064514355;
      goto LABEL_48;
    case 61:
      LODWORD(v7) = 1064933786;
      goto LABEL_48;
    case 62:
      LODWORD(v7) = 1064849900;
LABEL_48:
      objc_msgSend(a1, "resolveStyleColorWithPercentage:shading:", v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 247, CFSTR("Bad shading style encountered."));

      v9 = 0;
      break;
  }

  return v9;
}

+ (id)resolveStyleColorWithPercentage:(float)a3 shading:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v6 = a4;
  objc_msgSend(v6, "foreground");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a3;
  objc_msgSend(a1, "resolveStyleColorWithPercentage:foregroundColor:backgroundColor:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)resolveStyleColorWithPercentage:(float)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  id v9;
  id v10;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;

  v9 = a4;
  v10 = a5;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    if (v9)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 269, CFSTR("Foreground color is not set."));

    if (v10)
      goto LABEL_7;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 268, CFSTR("Percentage out of range."));

  if (!v9)
    goto LABEL_14;
LABEL_6:
  if (v10)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 270, CFSTR("Background color is not set."));

LABEL_7:
  objc_msgSend(v10, "alphaComponent");
  if (v12 == 0.0)
  {
    +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v13;
  }
  else
  {
    v14 = v10;
  }
  objc_msgSend(v9, "alphaComponent");
  if (v15 == 0.0)
  {
    +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v16;
  }
  objc_msgSend(v9, "redComponent");
  v18 = v17;
  objc_msgSend(v14, "redComponent");
  *(float *)&v19 = v18;
  *(float *)&v21 = v20;
  *(float *)&v20 = a3;
  objc_msgSend(a1, "resolveColorValueWithPercentage:foregroundComponent:backgroundComponent:", v20, v19, v21);
  LODWORD(v18) = v22;
  objc_msgSend(v9, "greenComponent");
  v24 = v23;
  objc_msgSend(v14, "greenComponent");
  *(float *)&v25 = v24;
  *(float *)&v27 = v26;
  *(float *)&v26 = a3;
  objc_msgSend(a1, "resolveColorValueWithPercentage:foregroundComponent:backgroundComponent:", v26, v25, v27);
  LODWORD(v24) = v28;
  objc_msgSend(v9, "blueComponent");
  v30 = v29;
  objc_msgSend(v14, "blueComponent");
  *(float *)&v31 = v30;
  *(float *)&v33 = v32;
  *(float *)&v32 = a3;
  objc_msgSend(a1, "resolveColorValueWithPercentage:foregroundComponent:backgroundComponent:", v32, v31, v33);
  +[OITSUColor colorWithRed:green:blue:alpha:](OITSUColor, "colorWithRed:green:blue:alpha:", *(float *)&v18, *(float *)&v24, v34, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (float)resolveColorValueWithPercentage:(float)a3 foregroundComponent:(float)a4 backgroundComponent:(float)a5
{
  void *v13;
  void *v14;
  void *v15;

  if (a3 < 0.0 || a3 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 301, CFSTR("Percentage out of range."));

  }
  if (a4 < 0.0 || a4 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 303, CFSTR("Foreground component out of range."));

  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WMTableCellStyle.mm"), 305, CFSTR("Background component out of range."));

  }
  return (float)(a3 * a4) + (float)((float)(1.0 - a3) * a5);
}

- (WMTableCellStyle)initWithTableCellProperties:(id)a3
{
  id v4;
  WMTableCellStyle *v5;
  WMTableCellStyle *v6;
  WMTableCellStyle *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WMTableCellStyle;
  v5 = -[CMStyle init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WMTableCellStyle addTableCellProperties:](v5, "addTableCellProperties:", v4);
    v7 = v6;
  }

  return v6;
}

@end
