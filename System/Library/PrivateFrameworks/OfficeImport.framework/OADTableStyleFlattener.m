@implementation OADTableStyleFlattener

- (void)applyCellPropertiesToTextBodyPropertiesInCell:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParent:", 0);
  if (objc_msgSend(v3, "isLeftMarginOverridden") && (objc_msgSend(v5, "hasLeftInset") & 1) == 0)
  {
    objc_msgSend(v3, "leftMargin");
    objc_msgSend(v5, "setLeftInset:");
  }
  if (objc_msgSend(v3, "isRightMarginOverridden") && (objc_msgSend(v5, "hasRightInset") & 1) == 0)
  {
    objc_msgSend(v3, "rightMargin");
    objc_msgSend(v5, "setRightInset:");
  }
  if (objc_msgSend(v3, "isTopMarginOverridden") && (objc_msgSend(v5, "hasTopInset") & 1) == 0)
  {
    objc_msgSend(v3, "topMargin");
    objc_msgSend(v5, "setTopInset:");
  }
  if (objc_msgSend(v3, "isBottomMarginOverridden") && (objc_msgSend(v5, "hasBottomInset") & 1) == 0)
  {
    objc_msgSend(v3, "bottomMargin");
    objc_msgSend(v5, "setBottomInset:");
  }
  if (objc_msgSend(v3, "isTextFlowOverridden") && (objc_msgSend(v5, "hasFlowType") & 1) == 0)
    objc_msgSend(v5, "setFlowType:", objc_msgSend(v3, "textFlow"));
  if (objc_msgSend(v3, "isTextAnchorOverridden") && (objc_msgSend(v5, "hasTextAnchorType") & 1) == 0)
    objc_msgSend(v5, "setTextAnchorType:", objc_msgSend(v3, "textAnchor"));
  if (objc_msgSend(v3, "isTextAnchorCenterOverridden")
    && (objc_msgSend(v5, "hasIsAnchorCenter") & 1) == 0)
  {
    objc_msgSend(v5, "setIsAnchorCenter:", objc_msgSend(v3, "textAnchorCenter"));
  }
  if (objc_msgSend(v3, "isTextHorizontalOverflowOverridden")
    && (objc_msgSend(v5, "hasHorizontalOverflowType") & 1) == 0)
  {
    objc_msgSend(v5, "setHorizontalOverflowType:", objc_msgSend(v3, "textHorizontalOverflow"));
  }
  if (objc_msgSend(v3, "isTextAnchorCenterOverridden")
    && (objc_msgSend(v5, "hasIsAnchorCenter") & 1) == 0)
  {
    objc_msgSend(v5, "setIsAnchorCenter:", objc_msgSend(v3, "textAnchorCenter"));
  }
  objc_msgSend(v5, "setParent:", v6);

}

- (void)applyResolvedPartStyle:(id)a3 leftStroke:(id)a4 rightStroke:(id)a5 topStroke:(id)a6 bottomStroke:(id)a7 toCell:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v18, "properties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableStyleFlattener applyCellPropertiesToTextBodyPropertiesInCell:](self, "applyCellPropertiesToTextBodyPropertiesInCell:", v18);
  objc_msgSend(v28, "textStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableStyleResolver applyTextStyle:toCell:](self, "applyTextStyle:toCell:", v20, v18);

  objc_msgSend(v19, "fill");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(v28, "cellStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fill");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFill:", v23);

  }
  objc_msgSend(v19, "leftStroke");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    objc_msgSend(v19, "setLeftStroke:", v14);
  objc_msgSend(v19, "rightStroke");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    objc_msgSend(v19, "setRightStroke:", v15);
  objc_msgSend(v19, "topStroke");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    objc_msgSend(v19, "setTopStroke:", v16);
  objc_msgSend(v19, "bottomStroke");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    objc_msgSend(v19, "setBottomStroke:", v17);

}

- (void)applyTextStyle:(id)a3 toParagraph:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADTable applyTextStyle:toParagraphProperties:](OADTable, "applyTextStyle:toParagraphProperties:", v6, v5);

}

@end
