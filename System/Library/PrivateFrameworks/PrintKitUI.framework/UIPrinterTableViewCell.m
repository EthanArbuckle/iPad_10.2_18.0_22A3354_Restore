@implementation UIPrinterTableViewCell

- (UIPrinterTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIPrinterTableViewCell *v4;
  UIPrinterAccessoryView *v5;
  uint64_t v6;
  UIPrinterAccessoryView *printerAccessoryView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIPrinterTableViewCell;
  v4 = -[UIPrinterTableViewCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [UIPrinterAccessoryView alloc];
    v6 = -[UIPrinterAccessoryView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    printerAccessoryView = v4->_printerAccessoryView;
    v4->_printerAccessoryView = (UIPrinterAccessoryView *)v6;

    -[UIPrinterAccessoryView setDelegate:](v4->_printerAccessoryView, "setDelegate:", v4);
    -[UIPrinterTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_printerAccessoryView);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterTableViewCell detailTextLabel](v4, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterTableViewCell imageView](v4, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v10);

    -[UIPrinterTableViewCell imageView](v4, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel_expandedAccessoryAreaTapped);
    -[UIPrinterTableViewCell setExpandedAccessoryTapRecognizer:](v4, "setExpandedAccessoryTapRecognizer:", v13);

    -[UIPrinterTableViewCell expandedAccessoryTapRecognizer](v4, "expandedAccessoryTapRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v4);

    -[UIPrinterTableViewCell expandedAccessoryTapRecognizer](v4, "expandedAccessoryTapRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterTableViewCell addGestureRecognizer:](v4, "addGestureRecognizer:", v15);

  }
  return v4;
}

- (void)setPrinter:(id)a3
{
  PKPrinter **p_printer;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;

  p_printer = &self->_printer;
  v5 = a3;
  objc_storeWeak((id *)p_printer, v5);
  objc_msgSend(v5, "displayName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E9D97C98;
  -[UIPrinterTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v5, "location");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = &stru_1E9D97C98;
  -[UIPrinterTableViewCell detailTextLabel](self, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  -[UIPrinterTableViewCell setSelectionStyle:](self, "setSelectionStyle:", v5 != 0);
}

- (BOOL)checked
{
  void *v2;
  char v3;

  -[UIPrinterTableViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[UIPrinterTableViewCell imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrinterTableViewCell;
  -[UIPrinterTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIPrinterTableViewCell setPrinter:](self, "setPrinter:", 0);
  -[UIPrinterTableViewCell setPrinterState:](self, "setPrinterState:", 0);
  -[UIPrinterTableViewCell setChecked:](self, "setChecked:", 0);
}

- (void)printerAccessoryViewInfoButtonPressed:(id)a3
{
  id v4;

  -[UIPrinterTableViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "printerInfoButtonTapped:", self);

}

- (int)printerState
{
  void *v2;
  int v3;

  -[UIPrinterTableViewCell printerAccessoryView](self, "printerAccessoryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "printerState");

  return v3;
}

- (void)setPrinterState:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  -[UIPrinterTableViewCell printerAccessoryView](self, "printerAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "printerState");

  if (v6 != (_DWORD)v3)
  {
    -[UIPrinterTableViewCell printerAccessoryView](self, "printerAccessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrinterState:", v3);

    -[UIPrinterTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[UIPrinterTableViewCell accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterTableViewCell;
  -[UIPrinterTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = a4;
  -[UIPrinterTableViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;

  -[UIPrinterTableViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrinterTableViewCell printerAccessoryView](self, "printerAccessoryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIPrinterTableViewCell printerAccessoryView](self, "printerAccessoryView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromView:", v20, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "userInterfaceLayoutDirection");

  v31 = v22;
  v32 = v24;
  v33 = v26;
  v34 = v28;
  if (v30)
    return v8 <= CGRectGetMaxX(*(CGRect *)&v31);
  else
    return v8 >= CGRectGetMinX(*(CGRect *)&v31);
}

- (void)expandedAccessoryAreaTapped
{
  void *v3;
  uint64_t v4;
  id v5;

  -[UIPrinterTableViewCell expandedAccessoryTapRecognizer](self, "expandedAccessoryTapRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 3)
  {
    -[UIPrinterTableViewCell printerAccessoryView](self, "printerAccessoryView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrinterTableViewCell printerAccessoryViewInfoButtonPressed:](self, "printerAccessoryViewInfoButtonPressed:", v5);

  }
}

- (PKPrinter)printer
{
  return (PKPrinter *)objc_loadWeakRetained((id *)&self->_printer);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (UIPrinterAccessoryView)printerAccessoryView
{
  return self->_printerAccessoryView;
}

- (void)setPrinterAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_printerAccessoryView, a3);
}

- (UIGestureRecognizer)expandedAccessoryTapRecognizer
{
  return self->_expandedAccessoryTapRecognizer;
}

- (void)setExpandedAccessoryTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_expandedAccessoryTapRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedAccessoryTapRecognizer, 0);
  objc_storeStrong((id *)&self->_printerAccessoryView, 0);
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_printer);
}

@end
