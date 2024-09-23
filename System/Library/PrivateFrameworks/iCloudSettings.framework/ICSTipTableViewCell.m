@implementation ICSTipTableViewCell

+ (int64_t)cellStyle
{
  return 0;
}

- (ICSTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ICSTipTableViewCell *v4;
  ICSTipTableViewCell *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  uint64_t v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  UILabel *subtitleLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UIButton *v22;
  UIButton *actionButton;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIButton *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;
  _QWORD v66[6];
  _QWORD v67[2];
  _QWORD v68[5];

  v68[3] = *MEMORY[0x24BDAC8D0];
  v65.receiver = self;
  v65.super_class = (Class)ICSTipTableViewCell;
  v4 = -[ICSTipTableViewCell initWithStyle:reuseIdentifier:](&v65, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ICSTipTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v5->_imageView;
    v5->_imageView = v6;

    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v5->_imageView, "setTintColor:", v8);

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    v11 = v5->_titleLabel;
    v12 = *MEMORY[0x24BEBE220];
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE220], *MEMORY[0x24BEBB610]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v13);

    v14 = v5->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_subtitleLabel, "setNumberOfLines:", 0);
    v18 = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v5->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    v22 = (UIButton *)objc_alloc_init(MEMORY[0x24BEBD430]);
    actionButton = v5->_actionButton;
    v5->_actionButton = v22;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton titleLabel](v5->_actionButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNumberOfLines:", 0);

    -[UIButton titleLabel](v5->_actionButton, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextAlignment:", 0);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v5->_actionButton, "titleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v26);

    v28 = v5->_actionButton;
    -[ICSTipTableViewCell tintColor](v5, "tintColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v28, "setTitleColor:forState:", v29, 0);

    v30 = v5->_actionButton;
    -[ICSTipTableViewCell tintColor](v5, "tintColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "colorWithAlphaComponent:", 0.200000003);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v30, "setTitleColor:forState:", v32, 1);

    -[UIButton addTarget:action:forControlEvents:](v5->_actionButton, "addTarget:action:forControlEvents:", v5, sel_actionButtonTapped_, 64);
    v33 = objc_alloc(MEMORY[0x24BEBD978]);
    v68[0] = v5->_titleLabel;
    v68[1] = v5->_subtitleLabel;
    v68[2] = v5->_actionButton;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithArrangedSubviews:", v34);

    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v35, "setAxis:", 1);
    v36 = v35;
    v64 = v35;
    objc_msgSend(v35, "setAlignment:", 1);
    v37 = objc_alloc(MEMORY[0x24BEBD978]);
    v67[0] = v5->_imageView;
    v67[1] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithArrangedSubviews:", v38);

    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v39, "setAxis:", 0);
    objc_msgSend(v39, "setAlignment:", 3);
    objc_msgSend(v39, "setSpacing:", 12.0);
    -[ICSTipTableViewCell contentView](v5, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v39);

    v55 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v39, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTipTableViewCell contentView](v5, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 6.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v60;
    objc_msgSend(v39, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTipTableViewCell contentView](v5, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, -11.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v56;
    objc_msgSend(v39, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTipTableViewCell contentView](v5, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 11.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v51;
    objc_msgSend(v39, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTipTableViewCell contentView](v5, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v42, -11.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v43;
    -[UIImageView widthAnchor](v5->_imageView, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToConstant:", 40.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v45;
    -[UIImageView heightAnchor](v5->_imageView, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", 40.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v48);

  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICSTipTableViewCell;
  -[PSTableCell layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *actionButton;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICSTipTableViewCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v12, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSTableCell titleLabel](self, "titleLabel", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_251C6B070);

  -[ICSTipTableViewCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75D50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v9);

  actionButton = self->_actionButton;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICSActionButtonTitleKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton setTitle:forStates:](actionButton, "setTitle:forStates:", v11, 0);
  -[ICSTipTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)actionButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Action button tapped.", v6, 2u);
  }

  -[PSTableCell specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performButtonAction");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
