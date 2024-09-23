@implementation RUISubHeaderElement

- (void)configureView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIElement body](self, "body");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSubHeaderText:attributes:", v4, v5);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v31, "subHeaderLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BEBD4B8];
    -[RUIElement attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("color"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_remoteUI_colorWithString:defaultColor:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[RUIElement style](self, "style");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subHeaderLabelTextColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "setTextColor:", v12);
    -[RUIElement attributes](self, "attributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("subHeaderBold"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("true"));

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v6, "font");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pointSize");
      objc_msgSend(v17, "boldSystemFontOfSize:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v19);

    }
    -[RUIElement attributes](self, "attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("align"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[RUIElement attributes](self, "attributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("align"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v23);

    }
    else
    {
      -[RUIElement style](self, "style");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "subHeaderLabelAlignment");
    }

    objc_msgSend(v6, "setTextAlignment:", v24);
    -[RUIElement attributes](self, "attributes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("textStyle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[RUIElement attributes](self, "attributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("textStyle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[RUIParser textStyleForString:](RUIParser, "textStyleForString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v30);

      objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
    }

  }
}

@end
