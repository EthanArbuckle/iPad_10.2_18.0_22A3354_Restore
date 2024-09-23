@implementation RUIHeaderElement

- (int64_t)labelAlignment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("align"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RUIElement attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("align"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v6);

  }
  else
  {
    -[RUIElement style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "headerLabelAlignment");
  }

  return v7;
}

- (void)configureView:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIElement body](self, "body");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:attributes:", v5, v6);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
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
      objc_msgSend(v13, "headerLabelTextColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "headerLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v12);

    objc_msgSend(v4, "headerLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", -[RUIHeaderElement labelAlignment](self, "labelAlignment"));

    -[RUIElement attributes](self, "attributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("legacyLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v20, "setLineBreakMode:", 0);
      if (+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
        RemoteUIHeaderFont();
      else
        objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 14.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BEBB3A8];
      v29[0] = *MEMORY[0x24BEBB360];
      v29[1] = v22;
      v30[0] = v21;
      v30[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "headerLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x24BDD1458]);
      -[RUIElement body](self, "body");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithString:attributes:", v26, v23);
      objc_msgSend(v24, "setAttributedText:", v27);

      objc_msgSend(v4, "headerLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextAlignment:", 1);

    }
  }

}

@end
