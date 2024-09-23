@implementation PSUIPearlInterlockHeaderView

- (PSUIPearlInterlockHeaderView)initWithFrame:(CGRect)a3
{
  PSUIPearlInterlockHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id firstValue;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PSUIPearlInterlockHeaderView;
  v3 = -[PSUIPearlInterlockHeaderView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/HT208186?cid=iOS_SettingsUI_iphone_article_HT208186"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPearlInterlockHeaderView setInterlockURL:](v3, "setInterlockURL:", v4);

    PSLocalizablePearlStringForKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PSLocalizablePearlStringForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", CFSTR("FaceID_warning"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(v6, "size");
    v9 = v8;
    v37 = v6;
    objc_msgSend(v6, "size");
    firstValue = (id)objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, v9, v10);
    objc_msgSend(firstValue, "setImage:", v6);
    objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIPearlInterlockHeaderView addSubview:](v3, "addSubview:", firstValue);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "setText:", v36);
    v12 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v13);

    objc_msgSend(v11, "setTextAlignment:", 1);
    objc_msgSend(v11, "setNumberOfLines:", 0);
    -[PSUIPearlInterlockHeaderView addSubview:](v3, "addSubview:", v11);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    objc_msgSend(v14, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v14, "setEditable:", 0);
    objc_msgSend(v14, "setSelectable:", 1);
    objc_msgSend(v14, "setScrollEnabled:", 0);
    objc_msgSend(v14, "_setInteractiveTextSelectionDisabled:", 1);
    v35 = v5;
    v16 = objc_msgSend(v35, "length");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v35);

    v34 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v34, "setAlignment:", 1);
    objc_msgSend(v17, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v34, 0, v16);
    v18 = *MEMORY[0x24BEBB360];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttribute:value:range:", v18, v19, 0, v16);

    v20 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttribute:value:range:", v20, v21, 0, v16);

    v22 = *MEMORY[0x24BEBB388];
    -[PSUIPearlInterlockHeaderView interlockURL](v3, "interlockURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAttribute:value:range:", v22, v23, 0, v16);

    objc_msgSend(v17, "addAttribute:value:range:", *MEMORY[0x24BEBB440], MEMORY[0x24BDBD1C0], 0, v16);
    objc_msgSend(v14, "setAttributedText:", v17);
    -[PSUIPearlInterlockHeaderView addSubview:](v3, "addSubview:", v14);
    _NSDictionaryOfVariableBindings(CFSTR("warningImageView, interlockMessage, interlockLink"), firstValue, v11, v14, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(firstValue, "bounds");
    objc_msgSend(v25, "numberWithDouble:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("warningImageHeight"), v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[interlockMessage]-|"), 0, 0, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v30);

    v31 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-40-[warningImageView(==warningImageHeight)]-25-[interlockMessage][interlockLink]|"), 512, v28, v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v32);

  }
  return v3;
}

- (double)heightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[PSUIPearlInterlockHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v3, v4);
  return v5;
}

- (NSURL)interlockURL
{
  return self->_interlockURL;
}

- (void)setInterlockURL:(id)a3
{
  objc_storeStrong((id *)&self->_interlockURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interlockURL, 0);
}

@end
