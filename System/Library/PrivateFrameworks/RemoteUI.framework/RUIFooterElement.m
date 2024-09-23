@implementation RUIFooterElement

- (int64_t)labelAlignment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

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
    -[RUIFooterElement linkURL](self, "linkURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUIElement style](self, "style");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v8)
      v10 = objc_msgSend(v9, "footerLinkAlignment");
    else
      v10 = objc_msgSend(v9, "footerLabelAlignment");
    v7 = v10;
  }

  return v7;
}

- (id)linkURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  RemoteUISectionFooter **p_footerView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  RemoteUISectionFooter *v17;
  void *v18;
  RemoteUISectionFooter *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  RemoteUISectionFooter *v24;
  void *v25;
  RemoteUISectionFooter *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id location;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIElement body](self, "body");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:attributes:", v6, v7);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_footerView = &self->_footerView;
    objc_storeStrong((id *)&self->_footerView, a3);
    v9 = (void *)MEMORY[0x24BEBD4B8];
    -[RUIElement attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("color"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_remoteUI_colorWithString:defaultColor:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[RUIElement style](self, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "footerLabelTextColor");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[RemoteUISectionFooter setTextColor:](*p_footerView, "setTextColor:", v14);
    -[RemoteUISectionFooter setTextAlignment:](*p_footerView, "setTextAlignment:", -[RUIFooterElement labelAlignment](self, "labelAlignment"));
    -[RUIElement style](self, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = *p_footerView;
      -[RUIElement style](self, "style");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "footerTopMargin");
      -[RemoteUISectionFooter setTopMargin:](v17, "setTopMargin:");

      v19 = *p_footerView;
      -[RUIElement style](self, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "footerFont");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RemoteUISectionFooter setFont:](v19, "setFont:", v21);

    }
    -[RUIElement attributes](self, "attributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("activationFunction"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_initWeak(&location, self);
      v24 = *p_footerView;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __34__RUIFooterElement_configureView___block_invoke;
      v30[3] = &unk_24C297688;
      objc_copyWeak(&v31, &location);
      -[RemoteUISectionFooter setLinkAction:](v24, "setLinkAction:", v30);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      -[RUIFooterElement linkURL](self, "linkURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = *p_footerView;
        -[RUIFooterElement linkURL](self, "linkURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[RemoteUISectionFooter setLinkURL:](v26, "setLinkURL:", v27);

      }
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RUIElement pageElement](self, "pageElement");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "page");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureInPage:", v29);

  }
}

void __34__RUIFooterElement_configureView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performAction:completion:", 2, 0);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RUIFooterElement;
  -[RUIElement setEnabled:](&v6, sel_setEnabled_);
  -[RemoteUISectionFooter linkLabel](self->_footerView, "linkLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
}

@end
