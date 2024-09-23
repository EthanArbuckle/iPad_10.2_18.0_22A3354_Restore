@implementation WFConfiguredStaccatoAction(AperturePreview)

- (WFApertureIconView)leadingApertureView
{
  WFApertureIconView *v2;
  void *v3;
  WFApertureIconView *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v2 = [WFApertureIconView alloc];
  objc_msgSend(a1, "previewIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFApertureIconView initWithIcon:](v2, "initWithIcon:", v3);

  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEC1A70]);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v7;
    -[WFApertureIconView setKeyColorOverride:](v4, "setKeyColorOverride:", v7);

    return v4;
  }
  objc_msgSend(a1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEC1CA8]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.196, 0.678, 0.843, 1.0);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v4;
}

- (WFApertureIconView)trailingApertureView
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  WFApertureIconView *v8;

  objc_msgSend(a1, "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Accessibility"));

  if (v3)
  {
    +[WFStaccatoPreviewViewProvider secondarySymbolForConfiguredAction:](WFStaccatoPreviewViewProvider, "secondarySymbolForConfiguredAction:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x24BEC1610]);
      objc_msgSend(MEMORY[0x24BEC1398], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithSymbolName:symbolColor:", v4, v6);

      v8 = -[WFApertureIconView initWithIcon:]([WFApertureIconView alloc], "initWithIcon:", v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
