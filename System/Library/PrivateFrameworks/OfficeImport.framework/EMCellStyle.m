@implementation EMCellStyle

- (void)addFontStyle:(id)a3
{
  NSMutableString *mStyleString;
  void *v5;
  id v6;

  v6 = a3;
  mStyleString = self->super.mStyleString;
  objc_msgSend((id)objc_opt_class(), "styleForFont:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](mStyleString, "appendString:", v5);

}

- (void)addFillStyle:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v10;
    v5 = objc_msgSend(v4, "type");
    if (v5)
    {
      if (v5 == 1)
        objc_msgSend(v4, "foreColor");
      else
        objc_msgSend(v4, "backColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUColor whiteColor](OITSUColor, "whiteColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) == 0)
      {
        +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMStyle appendPropertyForName:stringWithColons:](self, "appendPropertyForName:stringWithColons:", 0x24F3E6CB8, v9);

      }
    }

  }
}

- (void)addAlignmentStyle:(id)a3
{
  EMEnumProperty *v4;
  EMEnumProperty *v5;
  double v6;
  void *v7;
  double v8;
  CMLengthProperty *v9;
  CMLengthProperty *v10;
  CMLengthProperty *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "isVerticalAlignOverridden"))
  {
    v4 = -[EMEnumProperty initWithEnum:]([EMEnumProperty alloc], "initWithEnum:", objc_msgSend(v12, "verticalAlignment"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v4, 0x24F3E6698);

  }
  if (objc_msgSend(v12, "isHorizontalAlignOverridden")
    && objc_msgSend(v12, "horizontalAlignment"))
  {
    v5 = -[EMEnumProperty initWithEnum:]([EMEnumProperty alloc], "initWithEnum:", objc_msgSend(v12, "horizontalAlignment"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v5, 0x24F3E70D8);

  }
  if ((int)objc_msgSend(v12, "indent") >= 1)
  {
    v6 = 12.0;
    if (-[EDStyle isFontOverridden](self->_edStyle, "isFontOverridden"))
    {
      -[EDStyle font](self->_edStyle, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "height");
      v6 = v8 / 20.0;

    }
    v9 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", v6 * (double)(int)objc_msgSend(v12, "indent"));
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v9, 0x24F3E7078);

  }
  if (objc_msgSend(v12, "isTextWrapped"))
    -[CMStyle appendPropertyForName:stringWithColons:](self, "appendPropertyForName:stringWithColons:", 0x24F3E7158, CFSTR(":normal;"));
  v10 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", 0.0);
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v10, 0x24F3E70B8);
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v10, 0x24F3E7058);
  v11 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 1, 2.0);

  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v11, 0x24F3E7078);
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v11, 0x24F3E7098);

}

- (void)addBordersStyle:(id)a3
{
  EMBordersProperty *v4;
  id v5;

  v5 = a3;
  v4 = -[EMBordersProperty initWithEDBorders:]([EMBordersProperty alloc], "initWithEDBorders:", v5);
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v4, CFSTR("Borders"));

}

- (EMCellStyle)initWithEDStyle:(id)a3 type:(int)a4 columnWidth:(unint64_t)a5 contentWidth:(unint64_t)a6 truncateContents:(BOOL)a7
{
  id v13;
  EMCellStyle *v14;
  EMCellStyle *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EMCellStyle;
  v14 = -[CMStyle init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_edStyle, a3);
    v15->_edCellType = a4;
    v15->_contentWidth = (double)a6;
    v15->_columnWidth = (double)a5;
    v15->_truncateContents = a7;
    v15->_resolvedProperties = 0;
  }

  return v15;
}

- (void)resolveFormatType
{
  void *v3;
  int v4;
  uint64_t v5;
  CMStringProperty *v6;
  id v7;
  EMEnumProperty *v8;

  if (self->_edCellType == 2)
  {
    v6 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3D5618);
    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:");

  }
  if (-[EDStyle isAlignmentInfoOverridden](self->_edStyle, "isAlignmentInfoOverridden"))
  {
    -[EDStyle alignmentInfo](self->_edStyle, "alignmentInfo");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isHorizontalAlignOverridden") & 1) != 0)
    {
      -[EDStyle alignmentInfo](self->_edStyle, "alignmentInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "horizontalAlignment");

      if (v4)
        return;
    }
    else
    {

    }
  }
  if (self->_edCellType == 2)
    v5 = 3;
  else
    v5 = 1;
  v8 = -[EMEnumProperty initWithEnum:]([EMEnumProperty alloc], "initWithEnum:", v5);
  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:");

}

- (void)resolveContentWidth
{
  EDStyle *edStyle;
  double v4;
  void *v5;
  void *v6;
  CMStringProperty *v7;
  id v8;

  if (self->_columnWidth < self->_contentWidth)
  {
    edStyle = self->_edStyle;
    if (edStyle)
    {
      if (-[EDStyle isAlignmentInfoOverridden](edStyle, "isAlignmentInfoOverridden"))
      {
        -[EDStyle alignmentInfo](self->_edStyle, "alignmentInfo");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isTextWrapped") & 1) == 0 && !objc_msgSend(v8, "textRotation"))
        {
          v4 = self->_contentWidth - self->_columnWidth;
          if (v4 >= 2.0)
          {
            -[CMStyle propertyForName:](self, "propertyForName:", CFSTR("text-align"));
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if (v5)
            {
              -[CMStyle propertyForName:](self, "propertyForName:", CFSTR("Borders"));
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              switch(objc_msgSend(v5, "value"))
              {
                case 0u:
                case 1u:
                  if (self->_truncateContents)
                  {
                    v7 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3D5618);
                    -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v7, 0x24F3E7038);
                    goto LABEL_18;
                  }
                  break;
                case 2u:
                case 6u:
                  if (v6)
                  {
                    objc_msgSend(v6, "setNoneAtLocation:", 2);
                    objc_msgSend(v6, "setNoneAtLocation:", 4);
                  }
                  v4 = v4 * 0.5;
                  goto LABEL_17;
                case 3u:
                  if (v6)
                    objc_msgSend(v6, "setNoneAtLocation:", 2);
LABEL_17:
                  v7 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", -v4);
                  -[CMStyle addProperty:forKey:](self, "addProperty:forKey:", v7, CFSTR("text-indent"));
LABEL_18:

                  break;
                default:
                  break;
              }

            }
          }
        }

      }
    }
  }
}

+ (id)styleForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  __int16 v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_parseFontName:nameContainsBold:nameContainsItalic:", v7, (char *)&v15 + 1, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendFormat:", CFSTR("%@:%@;"), 0x24F3D6278, v8);
  }
  if (HIBYTE(v15) || objc_msgSend(v4, "isBoldOverridden") && objc_msgSend(v4, "isBold"))
    objc_msgSend(v5, "appendString:", CFSTR(" font-weight:bold;"));
  if ((_BYTE)v15 || objc_msgSend(v4, "isItalicOverridden") && objc_msgSend(v4, "isItalic"))
    objc_msgSend(v5, "appendString:", CFSTR(" font-style:italic;"));
  if (objc_msgSend(v4, "isStrikeOverridden") && objc_msgSend(v4, "isStrike"))
    objc_msgSend(v5, "appendString:", CFSTR(" text-decoration:line-through;"));
  if (objc_msgSend(v4, "isUnderlineOverridden"))
  {
    objc_msgSend(v5, "appendString:", CFSTR(" "));
    +[EMEnumProperty mapUnderlineValue:](EMEnumProperty, "mapUnderlineValue:", objc_msgSend(v4, "underline"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v9);

  }
  objc_msgSend(v4, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isBlack") & 1) == 0)
  {
    objc_msgSend(v5, "appendString:", 0x24F3E6678);
    +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v11);

  }
  if (objc_msgSend(v4, "isHeightOverridden"))
  {
    objc_msgSend(v4, "height");
    if (v12 != 200.0)
    {
      objc_msgSend(v5, "appendString:", 0x24F3D6298);
      objc_msgSend(v4, "height");
      +[CMLengthProperty cssStringValue:unit:](CMLengthProperty, "cssStringValue:unit:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v13);

    }
  }

  return v5;
}

+ (double)contentWidthForColumnWidth:(double)a3
{
  return a3 + -4.0;
}

+ (id)_parseFontName:(id)a3 nameContainsBold:(BOOL *)a4 nameContainsItalic:(BOOL *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = a3;
  if (!objc_msgSend(v7, "hasSuffix:", CFSTR(" Bold")))
  {
    if (objc_msgSend(v7, "hasSuffix:", CFSTR(" BoldItalic")))
    {
      *a4 = 1;
      *a5 = 1;
      v10 = objc_msgSend(v7, "length");
    }
    else
    {
      if (objc_msgSend(v7, "hasSuffix:", CFSTR(" MediumItalic")))
      {
        *a5 = 1;
        v9 = objc_msgSend(v7, "length") - 13;
        goto LABEL_13;
      }
      if (objc_msgSend(v7, "hasSuffix:", CFSTR(" SemiBold")))
      {
        *a4 = 1;
        v9 = objc_msgSend(v7, "length") - 9;
        goto LABEL_13;
      }
      if (objc_msgSend(v7, "hasSuffix:", CFSTR(" SemiBoldItalic")))
      {
        *a4 = 1;
        *a5 = 1;
        v9 = objc_msgSend(v7, "length") - 15;
        goto LABEL_13;
      }
      if (objc_msgSend(v7, "hasSuffix:", CFSTR(" Text")))
      {
        v8 = objc_msgSend(v7, "length");
        goto LABEL_3;
      }
      if (!objc_msgSend(v7, "hasSuffix:", CFSTR(" TextItalic")))
      {
        v11 = v7;
        goto LABEL_14;
      }
      *a5 = 1;
      v10 = objc_msgSend(v7, "length");
    }
    v9 = v10 - 11;
    goto LABEL_13;
  }
  *a4 = 1;
  v8 = objc_msgSend(v7, "length");
LABEL_3:
  v9 = v8 - 5;
LABEL_13:
  objc_msgSend(v7, "substringToIndex:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v12 = v11;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EMCellStyle;
  v4 = -[CMStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_edStyle);
  *((_DWORD *)v4 + 8) = self->_edCellType;
  v4[6] = *(id *)&self->_contentWidth;
  v4[5] = *(id *)&self->_columnWidth;
  return v4;
}

- (unint64_t)hash
{
  return -[EDStyle hash](self->_edStyle, "hash") ^ self->_edCellType;
}

- (BOOL)isEqual:(id)a3
{
  EMCellStyle *v4;
  EMCellStyle *v5;
  BOOL v6;

  v4 = (EMCellStyle *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[EDStyle isEqual:](v5->_edStyle, "isEqual:", self->_edStyle)
        && v5->_contentWidth == self->_contentWidth
        && v5->_columnWidth == self->_columnWidth
        && v5->_edCellType == self->_edCellType;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)cssStyleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (!self->_resolvedProperties)
  {
    self->_resolvedProperties = 1;
    -[EDStyle font](self->_edStyle, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[EDStyle font](self->_edStyle, "font");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMCellStyle addFontStyle:](self, "addFontStyle:", v4);

    }
    if (-[EDStyle isBordersOverridden](self->_edStyle, "isBordersOverridden"))
    {
      -[EDStyle borders](self->_edStyle, "borders");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMCellStyle addBordersStyle:](self, "addBordersStyle:", v5);

    }
    -[EDStyle fill](self->_edStyle, "fill");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[EDStyle fill](self->_edStyle, "fill");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMCellStyle addFillStyle:](self, "addFillStyle:", v7);

    }
    -[EDStyle alignmentInfo](self->_edStyle, "alignmentInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[EDStyle alignmentInfo](self->_edStyle, "alignmentInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMCellStyle addAlignmentStyle:](self, "addAlignmentStyle:", v9);

    }
    -[EMCellStyle resolveFormatType](self, "resolveFormatType");
    -[EMCellStyle resolveContentWidth](self, "resolveContentWidth");
  }
  v11.receiver = self;
  v11.super_class = (Class)EMCellStyle;
  -[CMStyle cssStyleString](&v11, sel_cssStyleString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edStyle, 0);
}

@end
