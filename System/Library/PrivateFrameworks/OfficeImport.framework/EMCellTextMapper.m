@implementation EMCellTextMapper

- (EMCellTextMapper)initWithEDString:(id)a3 style:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  EMCellTextMapper *v10;
  EMCellTextMapper *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EMCellTextMapper;
  v10 = -[CMMapper init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->edString, a3);
    objc_storeStrong((id *)&v11->edStyle, a4);
  }

  return v11;
}

- (void)mapAt:(id)a3 withState:(id)a4 columnWidth:(double)a5 height:(double)a6 spreadLeft:(BOOL)a7
{
  id v12;
  EDStyle *edStyle;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  CMStyle *v22;
  CMStringProperty *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  CMLengthProperty *v30;
  CMLengthProperty *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = a3;
  v12 = a4;
  if (self->edString)
  {
    edStyle = self->edStyle;
    if (!edStyle)
      goto LABEL_6;
    if (!-[EDStyle isAlignmentInfoOverridden](edStyle, "isAlignmentInfoOverridden"))
      goto LABEL_6;
    -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "textRotation");

    if (!v15
      || (-[EDStyle font](self->edStyle, "font"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "height"),
          v18 = v17 / 20.0,
          v16,
          v18 * 2.6 <= a5))
    {
LABEL_6:
      -[EMCellTextMapper contentWidth](self, "contentWidth");
      if (v19 <= a5)
        goto LABEL_25;
      if (-[EDStyle isAlignmentInfoOverridden](self->edStyle, "isAlignmentInfoOverridden"))
      {
        -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isTextWrappedOverridden"))
        {
          v21 = objc_msgSend(v20, "isTextWrapped");
          if (a7)
          {
LABEL_15:

            if (!v21)
              goto LABEL_25;
            goto LABEL_19;
          }
        }
        else
        {
          v21 = 0;
          if (a7)
            goto LABEL_15;
        }
        if (objc_msgSend(v20, "horizontalAlignment") == 3)
          goto LABEL_15;

      }
      else if (a7)
      {
        goto LABEL_25;
      }
LABEL_19:
      v22 = objc_alloc_init(CMStyle);
      v23 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3D5618);
      -[CMStyle addProperty:forKey:](v22, "addProperty:forKey:", v23, 0x24F3D3BF8);
      if (-[EDStyle isAlignmentInfoOverridden](self->edStyle, "isAlignmentInfoOverridden"))
      {
        -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isIndentOverridden");

        if (v25)
        {
          -[EDStyle font](self->edStyle, "font");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "height");
          v28 = v27;
          -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          a5 = a5 - (v28 / 20.0 * (double)(int)objc_msgSend(v29, "indent") + 1.0);

        }
      }
      v30 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", a5);
      -[CMStyle addProperty:forKey:](v22, "addProperty:forKey:", v30, CFSTR("width"));
      if (a6 > 0.0)
      {
        v31 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", a6);
        -[CMStyle addProperty:forKey:](v22, "addProperty:forKey:", v31, CFSTR("height"));

      }
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addChild:", v32);
      -[CMStyle cssStyleString](v22, "cssStyleString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAttribute:", v34);

      v44 = v32;
LABEL_25:
      -[EDString runs](self->edString, "runs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        -[EDString runs](self->edString, "runs");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count") != 0;

      }
      else
      {
        v37 = 0;
      }

      if (-[EDStyle isAlignmentInfoOverridden](self->edStyle, "isAlignmentInfoOverridden"))
      {
        -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v38, "isTextWrappedOverridden") & 1) != 0)
        {
          -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isTextWrapped");

          if (v40)
          {
            -[EDString string](self->edString, "string");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[CMTextFilter convertLineBreaksToParagraphBreaks:](CMTextFilter, "convertLineBreaksToParagraphBreaks:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v37)
            {
LABEL_32:
              if (v42 && objc_msgSend(v42, "length"))
              {
                +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "addChild:", v43);

              }
              goto LABEL_38;
            }
LABEL_37:
            -[EMCellTextMapper mapTextRunsAt:](self, "mapTextRunsAt:", v44);
LABEL_38:

            goto LABEL_39;
          }
        }
        else
        {

        }
      }
      -[EDString string](self->edString, "string");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
        goto LABEL_32;
      goto LABEL_37;
    }
    -[EMCellTextMapper mapVerticalTextAt:withState:width:height:](self, "mapVerticalTextAt:withState:width:height:", v44, v12, v18, a6);
  }
LABEL_39:

}

- (double)contentWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[EDString string](self->edString, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentWidthForString:style:", v4, self->edStyle);
  v6 = v5;

  return v6;
}

- (void)mapTextRunsAt:(id)a3
{
  EDStyle *edStyle;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;

  v28 = a3;
  edStyle = self->edStyle;
  if (!edStyle)
    goto LABEL_5;
  if (-[EDStyle isAlignmentInfoOverridden](edStyle, "isAlignmentInfoOverridden"))
  {
    -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isTextWrappedOverridden") & 1) != 0)
    {
      -[EDStyle alignmentInfo](self->edStyle, "alignmentInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isTextWrapped");

      if (v6)
      {
LABEL_5:
        -[EDString string](self->edString, "string");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[CMTextFilter convertLineBreaksToParagraphBreaks:](CMTextFilter, "convertLineBreaksToParagraphBreaks:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  -[EDString string](self->edString, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  -[EDString runs](self->edString, "runs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    v13 = v10 - 1;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "charIndex");
      v16 = v15;
      if (!v12 && v15)
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addChild:", v17);
        objc_msgSend(v8, "substringWithRange:", 0, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addChild:", v19);

      }
      if (v13 == v12)
      {
        v20 = objc_msgSend(v8, "length");
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", v12 + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "charIndex");

      }
      if (v16 >= objc_msgSend(v8, "length"))
        break;
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addChild:", v22);
      objc_msgSend(v8, "substringWithRange:", v16, v20 - v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addChild:", v24);

      objc_msgSend(v14, "font");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        +[EMCellStyle styleForFont:](EMCellStyle, "styleForFont:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v22, v26);

      }
      if (v11 == ++v12)
        goto LABEL_22;
    }

  }
LABEL_22:

}

- (void)mapVerticalTextAt:(id)a3 withState:(id)a4 width:(double)a5 height:(double)a6
{
  void *v8;
  void *v9;
  CMStyle *v10;
  CMStringProperty *v11;
  CMStringProperty *v12;
  CMLengthProperty *v13;
  CMLengthProperty *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[EDString string](self->edString, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMTextFilter convertToVericalString:](CMTextFilter, "convertToVericalString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(CMStyle);
  v11 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3D5618);
  -[CMStyle addProperty:forKey:](v10, "addProperty:forKey:", v11, 0x24F3D3BF8);
  v12 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", 0x24F3D4578);
  -[CMStyle addProperty:forKey:](v10, "addProperty:forKey:", v12, CFSTR("text-align"));
  v13 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 9, 0.85);
  -[CMStyle addProperty:forKey:](v10, "addProperty:forKey:", v13, 0x24F3E6F58);
  if (a6 > 0.0)
  {
    v14 = -[CMLengthProperty initWithNumber:]([CMLengthProperty alloc], "initWithNumber:", a6);
    -[CMStyle addProperty:forKey:](v10, "addProperty:forKey:", v14, 0x24F3D5658);

  }
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addChild:", v15);
  +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addChild:", v16);

  -[CMStyle cssStyleString](v10, "cssStyleString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v15, v17);

}

+ (double)contentWidthForString:(id)a3 style:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;

  v5 = a3;
  objc_msgSend(a4, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "height");
  v9 = v8;
  if (objc_msgSend(v6, "isBoldOverridden"))
    v10 = objc_msgSend(v6, "isBold");
  else
    v10 = 0;
  if (objc_msgSend(v6, "isItalicOverridden"))
    v11 = objc_msgSend(v6, "isItalic");
  else
    v11 = 0;
  objc_msgSend(v5, "oi_sizeWithFontName:size:bold:italic:", v7, (int)(v9 / 20.0), v10, v11);
  v13 = v12;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->edStyle, 0);
  objc_storeStrong((id *)&self->edString, 0);
}

@end
