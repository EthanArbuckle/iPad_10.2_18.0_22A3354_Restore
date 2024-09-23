@implementation OADTableUnnecessaryOverrideRemover

- (OADTableUnnecessaryOverrideRemover)initWithTable:(id)a3 parentTextListStyle:(id)a4
{
  id v7;
  OADTableUnnecessaryOverrideRemover *v8;
  OADTableUnnecessaryOverrideRemover *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OADTableUnnecessaryOverrideRemover;
  v8 = -[OADTableStyleResolver initWithTable:](&v11, sel_initWithTable_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_parentTextListStyle, a4);

  return v9;
}

- (void)applyTextBodyPropertiesToCellPropertiesInCell:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasLeftInset") && (objc_msgSend(v3, "isLeftMarginOverridden") & 1) == 0)
  {
    objc_msgSend(v5, "leftInset");
    objc_msgSend(v3, "setLeftMargin:");
  }
  if (objc_msgSend(v5, "hasRightInset") && (objc_msgSend(v3, "isRightMarginOverridden") & 1) == 0)
  {
    objc_msgSend(v5, "rightInset");
    objc_msgSend(v3, "setRightMargin:");
  }
  if (objc_msgSend(v5, "hasTopInset") && (objc_msgSend(v3, "isTopMarginOverridden") & 1) == 0)
  {
    objc_msgSend(v5, "topInset");
    objc_msgSend(v3, "setTopMargin:");
  }
  if (objc_msgSend(v5, "hasBottomInset") && (objc_msgSend(v3, "isBottomMarginOverridden") & 1) == 0)
  {
    objc_msgSend(v5, "bottomInset");
    objc_msgSend(v3, "setBottomMargin:");
  }
  if (objc_msgSend(v5, "hasFlowType") && (objc_msgSend(v3, "isTextFlowOverridden") & 1) == 0)
    objc_msgSend(v3, "setTextFlow:", objc_msgSend(v5, "flowType"));
  if (objc_msgSend(v5, "hasTextAnchorType") && (objc_msgSend(v3, "isTextAnchorOverridden") & 1) == 0)
    objc_msgSend(v3, "setTextAnchor:", objc_msgSend(v5, "textAnchorType"));
  if (objc_msgSend(v5, "hasIsAnchorCenter")
    && (objc_msgSend(v3, "isTextAnchorCenterOverridden") & 1) == 0)
  {
    objc_msgSend(v3, "setTextAnchorCenter:", objc_msgSend(v5, "isAnchorCenter"));
  }
  if (objc_msgSend(v5, "hasHorizontalOverflowType")
    && (objc_msgSend(v3, "isTextHorizontalOverflowOverridden") & 1) == 0)
  {
    objc_msgSend(v3, "setTextHorizontalOverflow:", objc_msgSend(v5, "horizontalOverflowType"));
  }
  if (objc_msgSend(v5, "hasIsAnchorCenter")
    && (objc_msgSend(v3, "isTextAnchorCenterOverridden") & 1) == 0)
  {
    objc_msgSend(v3, "setTextAnchorCenter:", objc_msgSend(v5, "isAnchorCenter"));
  }

}

- (void)fixFill:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = objc_msgSend(v8, "isMergedWithParent");
  objc_msgSend(v8, "setMergedWithParent:", 0);
  v4 = objc_opt_class();
  TSUDynamicCast(v4, (uint64_t)v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isColorOverridden") & 1) == 0)
  {
    +[OADRgbColor black](OADRgbColor, "black");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v7);

  }
  objc_msgSend(v8, "setMergedWithParent:", v3);

}

- (void)removeUnnecessaryOverridesInCellProperties:(id)a3 strokeType:(int)a4 resolvedStroke:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = *(_QWORD *)&a4;
  v13 = a3;
  v8 = a5;
  objc_msgSend(v13, "stroke:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setParent:", v9);
    objc_msgSend(v10, "changeParentPreservingEffectiveValues:", v8);
    if ((objc_msgSend(v10, "isAnythingOverridden") & 1) != 0)
    {
      +[OADStroke defaultProperties](OADStroke, "defaultProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changeParentPreservingEffectiveValues:", v11);

      objc_msgSend(v9, "fill");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableUnnecessaryOverrideRemover fixFill:](self, "fixFill:", v12);

    }
    else
    {
      objc_msgSend(v13, "setStrokeOfType:toValue:", v6, 0);
    }

  }
}

- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;

  v35 = a3;
  v34 = a4;
  v33 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v16, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableUnnecessaryOverrideRemover applyTextBodyPropertiesToCellPropertiesInCell:](self, "applyTextBodyPropertiesToCellPropertiesInCell:", v16);
  objc_msgSend(v35, "textStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableStyleResolver applyTextStyle:toCell:](self, "applyTextStyle:toCell:", v18, v16);

  objc_msgSend(v17, "fill");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  objc_msgSend(v35, "cellStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fill");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_class();

  if (v20 == v23)
  {
    objc_msgSend(v17, "fill");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init((Class)objc_opt_class());

    objc_msgSend(v17, "fill");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setParent:", v26);

    objc_msgSend(v35, "cellStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fill");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "changeParentPreservingEffectiveValues:", v28);

    if ((objc_msgSend(v25, "isAnythingOverridden") & 1) != 0)
    {
      objc_msgSend(v17, "fill");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fill");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "defaultProperties");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "changeParentPreservingEffectiveValues:", v31);

      objc_msgSend(v17, "fill");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableUnnecessaryOverrideRemover fixFill:](self, "fixFill:", v32);

    }
    else
    {
      objc_msgSend(v17, "setFill:", 0);
    }

  }
  -[OADTableUnnecessaryOverrideRemover removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:](self, "removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:", v17, 1, v34);
  -[OADTableUnnecessaryOverrideRemover removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:](self, "removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:", v17, 2, v33);
  -[OADTableUnnecessaryOverrideRemover removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:](self, "removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:", v17, 3, v14);
  -[OADTableUnnecessaryOverrideRemover removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:](self, "removeUnnecessaryOverridesInCellProperties:strokeType:resolvedStroke:", v17, 4, v15);

}

- (void)applyTextStyle:(id)a3 toParagraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  OADSolidFill *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  const __CFString *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setParent:", 0);
  if (objc_msgSend(v24, "bold") != 2)
    objc_msgSend(v7, "setIsBold:", objc_msgSend(v24, "bold") == 0);
  if (objc_msgSend(v24, "italic") != 2)
    objc_msgSend(v7, "setIsItalic:", objc_msgSend(v24, "italic") == 0);
  objc_msgSend(v24, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(OADSolidFill);
    objc_msgSend(v24, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADSolidFill setColor:](v9, "setColor:", v10);

    objc_msgSend(v7, "setFill:", v9);
  }
  v11 = objc_opt_class();
  objc_msgSend(v24, "fontReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v11, (uint64_t)v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "latinFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLatinFont:", v14);

    objc_msgSend(v13, "eastAsianFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEastAsianFont:", v15);

    objc_msgSend(v13, "complexScriptFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBidiFont:", v16);
  }
  else
  {
    v20 = objc_opt_class();
    objc_msgSend(v24, "fontReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v20, (uint64_t)v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v22 = objc_msgSend(v16, "index");
      if (v22)
      {
        if (v22 != 1)
          goto LABEL_9;
        objc_msgSend(v7, "setLatinFont:", CFSTR("+mn-lt"));
        objc_msgSend(v7, "setEastAsianFont:", CFSTR("+mn-ea"));
        v23 = CFSTR("+mn-cs");
      }
      else
      {
        objc_msgSend(v7, "setLatinFont:", CFSTR("+mj-lt"));
        objc_msgSend(v7, "setEastAsianFont:", CFSTR("+mj-ea"));
        v23 = CFSTR("+mj-cs");
      }
      objc_msgSend(v7, "setBidiFont:", v23);
    }
  }
LABEL_9:

  -[OADTableUnnecessaryOverrideRemover parentTextListStyle](self, "parentTextListStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "propertiesForListLevel:", (int)objc_msgSend(v18, "level"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParent:", v19);

  objc_msgSend(v6, "changeParentParagraphPropertiesPreservingEffectiveValues:", v7);
}

- (OADTextListStyle)parentTextListStyle
{
  return self->_parentTextListStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTextListStyle, 0);
}

@end
