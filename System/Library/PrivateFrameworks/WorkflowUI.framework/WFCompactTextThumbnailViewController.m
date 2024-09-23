@implementation WFCompactTextThumbnailViewController

- (WFCompactTextThumbnailViewController)initWithString:(id)a3
{
  id v4;
  WFCompactTextThumbnailViewController *v5;
  uint64_t v6;
  NSString *string;
  WFCompactTextThumbnailViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactTextThumbnailViewController;
  v5 = -[WFCompactTextThumbnailViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)preferredContentMode
{
  return 1;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)WFCompactTextThumbnailViewController;
  -[WFCompactTextThumbnailViewController loadView](&v9, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[WFCompactTextThumbnailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v11 = CGRectInset(v10, 22.0, 0.0);
  objc_msgSend(v3, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  -[WFCompactTextThumbnailViewController string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v7);

  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  -[WFCompactTextThumbnailViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v3);

  -[WFCompactTextThumbnailViewController setLabel:](self, "setLabel:", v3);
}

- (double)contentHeightForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;

  -[WFCompactTextThumbnailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[WFCompactTextThumbnailViewController label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", a3, 1.79769313e308);
  v7 = v6 + 10.0;

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactTextThumbnailViewController;
  v4 = a3;
  -[WFCompactTextThumbnailViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFCompactTextThumbnailViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[WFCompactThumbnailViewController invalidateContentSize](self, "invalidateContentSize");
}

- (NSString)string
{
  return self->_string;
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
