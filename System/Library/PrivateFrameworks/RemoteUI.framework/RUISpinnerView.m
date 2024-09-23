@implementation RUISpinnerView

- (void)setSpinnerColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_spinnerColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spinnerColor, a3);
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", self->_spinnerColor);
    v5 = v6;
  }

}

- (id)spinnerView
{
  UIView *view;
  id v4;
  UIView *v5;
  UIView *v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v9;
  void *v10;
  void *v11;

  view = self->_view;
  if (!view)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_view;
    self->_view = v5;

    v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 10);
    spinner = self->_spinner;
    self->_spinner = v7;

    v9 = self->_spinner;
    -[RUISpinnerView spinnerColor](self, "spinnerColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[UIActivityIndicatorView setColor:](v9, "setColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](v9, "setColor:", v11);

    }
    -[UIView addSubview:](self->_view, "addSubview:", self->_spinner);
    view = self->_view;
  }
  return view;
}

- (void)viewWillAppear:(BOOL)a3
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating", a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating", a3);
}

- (void)viewDidLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  UILabel *v17;
  UILabel *label;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  RUIFooterElement *footer;
  RUIHeaderElement *header;
  int *v39;
  int *v40;
  RUIHeaderView *v41;
  void *v42;
  RUIHeaderView *v43;
  RUIHeaderView *headerView;
  uint64_t v45;
  RemoteUISectionFooter *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  _QWORD v68[2];
  _QWORD v69[3];

  v69[2] = *MEMORY[0x24BDAC8D0];
  -[UIView superview](self->_view, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_view, "frame");
  if (v3)
  {
    v8 = v4;
    v9 = v5;
    objc_msgSend(v3, "bounds");
    v11 = v10;
    v13 = v12;
    -[UIView setFrame:](self->_view, "setFrame:", v8, v9);
  }
  else
  {
    v11 = v6;
    v13 = v7;
  }
  -[UIView center](self->_view, "center");
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
  -[RUIElement attributes](self, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("label"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    if (!self->_label)
    {
      v16 = objc_alloc(MEMORY[0x24BEBD708]);
      v17 = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      label = self->_label;
      self->_label = v17;

      -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
      -[UIView addSubview:](self->_view, "addSubview:", self->_label);
    }
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "setLineBreakMode:", 0);
    v68[0] = *MEMORY[0x24BEBB360];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = *MEMORY[0x24BEBB3A8];
    v69[0] = v21;
    v69[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 1, v22, 0, v11, v13);
    v24 = v23;
    v26 = v25;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v15, v22);
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v27);
    -[UIActivityIndicatorView frame](self->_spinner, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[UILabel frame](self->_label, "frame");
    v34 = round((v13 - (v26 + v33)) * 0.5);
    -[UIView center](self->_view, "center");
    v36 = v35 - round(v24 * 0.5);
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v29, v34, v31, v33);
    -[UILabel setFrame:](self->_label, "setFrame:", v36, v33 + v34, v24, v26);

    goto LABEL_25;
  }
  footer = self->_footer;
  header = self->_header;
  v39 = &OBJC_IVAR___RUIScriptingStaticFunction__function;
  v40 = &OBJC_IVAR___RUIScriptingStaticFunction__function;
  if (!footer)
  {
    if (!header)
      goto LABEL_25;
LABEL_12:
    if (!self->_headerView)
    {
      v41 = [RUIHeaderView alloc];
      -[RUIElement attributes](self->_header, "attributes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[RUIHeaderView initWithAttributes:](v41, "initWithAttributes:", v42);
      headerView = self->_headerView;
      self->_headerView = v43;

      -[RUIHeaderElement configureView:](self->_header, "configureView:", self->_headerView);
      -[UIView addSubview:](self->_view, "addSubview:", self->_headerView);
      v40 = &OBJC_IVAR___RUIScriptingStaticFunction__function;
      footer = self->_footer;
    }
    v39 = &OBJC_IVAR___RUIScriptingStaticFunction__function;
    if (!footer)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (header)
    goto LABEL_12;
LABEL_15:
  v45 = v39[251];
  if (!*(Class *)((char *)&self->super.super.isa + v45))
  {
    v46 = [RemoteUISectionFooter alloc];
    -[RUIElement attributes](self->_footer, "attributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[RemoteUISectionFooter initWithAttributes:](v46, "initWithAttributes:", v47);
    v49 = *(Class *)((char *)&self->super.super.isa + v45);
    *(Class *)((char *)&self->super.super.isa + v45) = v48;

    -[RUIFooterElement configureView:](self->_footer, "configureView:", *(Class *)((char *)&self->super.super.isa + v45));
    -[UIView addSubview:](self->_view, "addSubview:", *(Class *)((char *)&self->super.super.isa + v45));
    v40 = &OBJC_IVAR___RUIScriptingStaticFunction__function;
  }
LABEL_17:
  v50 = v40[250];
  v51 = *(Class *)((char *)&self->super.super.isa + v50);
  if (v51)
  {
    objc_msgSend(v51, "frame");
    v53 = v52;
    v55 = v54;
    v56 = *(Class *)((char *)&self->super.super.isa + v50);
    objc_msgSend(v3, "bounds");
    objc_msgSend(v56, "headerHeightForWidth:inView:", v3, v57);
    objc_msgSend(v3, "bounds");
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v50), "setFrame:", v53, v55);
  }
  v58 = v39[251];
  v59 = *(Class *)((char *)&self->super.super.isa + v58);
  if (v59)
  {
    objc_msgSend(v59, "frame");
    v61 = v60;
    v63 = v62;
    v64 = *(Class *)((char *)&self->super.super.isa + v58);
    objc_msgSend(v3, "bounds");
    objc_msgSend(v64, "footerHeightForWidth:inView:", v3, v65);
    objc_msgSend(v3, "bounds");
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v58), "setFrame:", v61, v63);
  }
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  v66 = *(Class *)((char *)&self->super.super.isa + v50);
  if (v66)
  {
    objc_msgSend(v66, "frame");
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v50), "setFrame:");
  }
  v67 = *(Class *)((char *)&self->super.super.isa + v58);
  if (v67)
  {
    objc_msgSend(v67, "frame");
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v58), "setFrame:");
  }
LABEL_25:

}

- (RUIObjectModel)objectModel
{
  return (RUIObjectModel *)objc_loadWeakRetained((id *)&self->_objectModel);
}

- (void)setObjectModel:(id)a3
{
  objc_storeWeak((id *)&self->_objectModel, a3);
}

- (UIColor)spinnerColor
{
  return self->_spinnerColor;
}

- (RUIHeaderElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (RUIFooterElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_spinnerColor, 0);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
