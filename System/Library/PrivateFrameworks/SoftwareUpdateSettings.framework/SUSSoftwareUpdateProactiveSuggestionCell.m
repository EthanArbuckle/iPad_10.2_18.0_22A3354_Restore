@implementation SUSSoftwareUpdateProactiveSuggestionCell

- (SUSSoftwareUpdateProactiveSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SUSSoftwareUpdateProactiveSuggestionCell *v5;
  SUSSoftwareUpdateProactiveSuggestionCell *v7;
  SUSSoftwareUpdateProactiveSuggestionCell *v9;
  objc_super v10;
  id v11;
  id location;
  int64_t v13;
  SEL v14;
  SUSSoftwareUpdateProactiveSuggestionCell *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v5 = v15;
  v15 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)SUSSoftwareUpdateProactiveSuggestionCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, v13, location, v11);
  v15 = v9;
  objc_storeStrong((id *)&v15, v9);
  if (v9)
  {
    -[SUSSoftwareUpdateProactiveSuggestionCell setSelectionStyle:](v15, "setSelectionStyle:", 0);
    -[SUSSoftwareUpdateProactiveSuggestionCell setHoverStyle:](v15, "setHoverStyle:", 0);
    -[SUSSoftwareUpdateProactiveSuggestionCell _setupView](v15, "_setupView");
  }
  v7 = v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (void)_setupView
{
  UILabel *v2;
  UILabel *titleLabel;
  UIImageView *v4;
  UIImageView *iconImage;
  UILabel *v6;
  UILabel *contentLabel;
  NSArray *v8;
  NSArray *titleAndContentVerticalConstaints;
  NSArray *v10;
  NSArray *titleOnlyVerticalConstaints;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSDictionary *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSDictionary *v22;
  void *v23;
  NSDictionary *v24;
  void *v25;
  id v26;
  NSDictionary *v27;
  id v28;
  id v29;
  id v30;

  if (!self->_titleLabel && !self->_contentLabel && !self->_iconImage)
  {
    v2 = (UILabel *)-[SUSSoftwareUpdateProactiveSuggestionCell _configureTitleLabel](self, "_configureTitleLabel");
    titleLabel = self->_titleLabel;
    self->_titleLabel = v2;

    v4 = (UIImageView *)-[SUSSoftwareUpdateProactiveSuggestionCell _configureIconImage](self, "_configureIconImage");
    iconImage = self->_iconImage;
    self->_iconImage = v4;

    v6 = (UILabel *)-[SUSSoftwareUpdateProactiveSuggestionCell _configureContentLabel](self, "_configureContentLabel");
    contentLabel = self->_contentLabel;
    self->_contentLabel = v6;

    v12 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    objc_msgSend(v12, "addSubview:", self->_titleLabel);

    v13 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    objc_msgSend(v13, "addSubview:", self->_iconImage);

    v14 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    objc_msgSend(v14, "addSubview:", self->_contentLabel);

    v18 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    v15 = (void *)MEMORY[0x24BDD1628];
    v17 = _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _iconImage"), self->_titleLabel, self->_iconImage, 0);
    v16 = (id)objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(margin)-[_titleLabel]-(>=iconToTitleSpacing)-[_iconImage(iconWidth)]-(margin)-|"));
    objc_msgSend(v18, "addConstraints:");

    v20 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    v19 = (id)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconImage, 10, 0, self->_titleLabel, 1.0, 0.0);
    objc_msgSend(v20, "addConstraint:");

    v21 = (void *)MEMORY[0x24BDD1628];
    v22 = _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _contentLabel"), self->_titleLabel, self->_contentLabel, 0);
    v8 = (NSArray *)(id)objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(margin)-[_titleLabel]-(spacing)-[_contentLabel]-(margin)-|"), 0, &unk_24F769648);
    titleAndContentVerticalConstaints = self->_titleAndContentVerticalConstaints;
    self->_titleAndContentVerticalConstaints = v8;

    v23 = (void *)MEMORY[0x24BDD1628];
    v24 = _NSDictionaryOfVariableBindings(CFSTR("_titleLabel"), self->_titleLabel, 0);
    v10 = (NSArray *)(id)objc_msgSend(v23, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(margin)-[_titleLabel]-(margin)-|"), 0, &unk_24F769670);
    titleOnlyVerticalConstaints = self->_titleOnlyVerticalConstaints;
    self->_titleOnlyVerticalConstaints = v10;

    v28 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    v25 = (void *)MEMORY[0x24BDD1628];
    v27 = _NSDictionaryOfVariableBindings(CFSTR("_contentLabel"), self->_contentLabel, 0);
    v26 = (id)objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(margin)-[_contentLabel]-(margin)-|"), 0, &unk_24F769698);
    objc_msgSend(v28, "addConstraints:");

    v29 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    objc_msgSend(v29, "addConstraints:", self->_titleAndContentVerticalConstaints);

    v30 = (id)-[SUSSoftwareUpdateProactiveSuggestionCell contentView](self, "contentView");
    objc_msgSend(v30, "addConstraints:", self->_titleOnlyVerticalConstaints);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_titleOnlyVerticalConstaints);
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_titleAndContentVerticalConstaints);
  }
}

- (id)_configureTitleLabel
{
  double v2;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(MEMORY[0x24BEBD708]);
  v4 = v7[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  objc_msgSend(v4, "setFont:");

  objc_msgSend(v7[0], "setNumberOfLines:", 0);
  objc_msgSend(v7[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7[0], "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v7[0], "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v2) = 1148846080;
  objc_msgSend(v7[0], "setContentHuggingPriority:forAxis:", 1, v2);
  objc_msgSend(v7[0], "setAccessibilityIdentifier:", CFSTR("SUProactiveSuggestionCellTitle"));
  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (id)_configureIconImage
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(v8[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8[0], "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(v8[0], "setContentMode:", 2);
  v4 = v8[0];
  v3 = (void *)MEMORY[0x24BEBD660];
  v6 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v5 = (id)objc_msgSend(v3, "configurationWithFont:");
  objc_msgSend(v4, "setSymbolConfiguration:");

  objc_msgSend(v8[0], "sizeToFit");
  objc_msgSend(v8[0], "setAccessibilityIdentifier:", CFSTR("SUProactiveSuggestionCellIcon"));
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_configureContentLabel
{
  double v2;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(MEMORY[0x24BEBD708]);
  v4 = v7[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  objc_msgSend(v4, "setFont:");

  objc_msgSend(v7[0], "setNumberOfLines:", 0);
  objc_msgSend(v7[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7[0], "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v7[0], "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v2) = 1148846080;
  objc_msgSend(v7[0], "setContentHuggingPriority:forAxis:", 1, v2);
  objc_msgSend(v7[0], "setAccessibilityIdentifier:", CFSTR("SUProactiveSuggestionCellContent"));
  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (id)title
{
  return -[UILabel text](self->_titleLabel, "text", a2, self);
}

- (void)setTitle:(id)a3
{
  id location[2];
  SUSSoftwareUpdateProactiveSuggestionCell *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v4->_titleLabel, "setText:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)content
{
  return -[UILabel text](self->_contentLabel, "text", a2, self);
}

- (void)setContent:(id)a3
{
  uint64_t v3;
  id location[2];
  SUSSoftwareUpdateProactiveSuggestionCell *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UILabel setText:](v5->_contentLabel, "setText:", location[0]);
  if (!location[0] || (objc_msgSend(location[0], "isEqualToString:", &stru_24F764478) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v5->_titleOnlyVerticalConstaints, 0x24BDD1000uLL);
    objc_msgSend(*(id *)(v3 + 1576), "deactivateConstraints:", v5->_titleAndContentVerticalConstaints);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v5->_titleOnlyVerticalConstaints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v5->_titleAndContentVerticalConstaints);
  }
  objc_storeStrong(location, 0);
}

- (void)setSystemIconNamed:(id)a3 withTintColor:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id location[2];
  SUSSoftwareUpdateProactiveSuggestionCell *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v6 = (void *)MEMORY[0x24BEBD640];
  v5 = location[0];
  v7 = (id)objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 2);
  v8 = (id)objc_msgSend(v6, "systemImageNamed:withConfiguration:", v5);

  -[UIImageView setImage:](v11->_iconImage, "setImage:", v8);
  -[UIImageView setTintColor:](v11->_iconImage, "setTintColor:", v9);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleOnlyVerticalConstaints, 0);
  objc_storeStrong((id *)&self->_titleAndContentVerticalConstaints, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
