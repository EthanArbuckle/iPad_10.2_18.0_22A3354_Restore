@implementation SUSSoftwareUpdateComingSoonTipCell

- (SUSSoftwareUpdateComingSoonTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SUSSoftwareUpdateComingSoonTipCell *v5;
  UIView *v6;
  UIView *tipView;
  SUSSoftwareUpdateComingSoonTipCell *v9;
  SUSSoftwareUpdateComingSoonTipCell *v10;
  UIView *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;
  id v18;
  id location;
  int64_t v20;
  SEL v21;
  SUSSoftwareUpdateComingSoonTipCell *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v5 = v22;
  v22 = 0;
  v17.receiver = v5;
  v17.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  v22 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v17, sel_initWithStyle_reuseIdentifier_specifier_, v20, location, v18);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    -[SUSSoftwareUpdateComingSoonTipCell setHoverStyle:](v22, "setHoverStyle:", 0);
    v6 = (UIView *)-[SUSSoftwareUpdateComingSoonTipCell createTipView](v22, "createTipView");
    tipView = v22->_tipView;
    v22->_tipView = v6;

    v11 = v22->_tipView;
    v10 = v22;
    v14 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v13 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
    v12 = -[SUSSoftwareUpdateComingSoonTipCell createDynamicColor:withDarkStyleVariant:](v10, "createDynamicColor:withDarkStyleVariant:", v14);
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:");

    v15 = (id)-[SUSSoftwareUpdateComingSoonTipCell contentView](v22, "contentView");
    objc_msgSend(v15, "addSubview:", v22->_tipView);

    -[SUSSoftwareUpdateComingSoonTipCell updateConstraints](v22, "updateConstraints");
  }
  v9 = v22;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v9;
}

- (id)createDynamicColor:(id)a3 withDarkStyleVariant:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = (id)objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 0);
  v8 = (id)objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:");
  v12[0] = v9;
  v13[0] = location[0];
  v12[1] = v8;
  v13[1] = v10;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (id)objc_msgSend(MEMORY[0x24BEBD4B8], "_dynamicColorWithColorsByTraitCollection:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)updateConstraints
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSLayoutYAxisAnchor *v18;
  id v19;
  id v20;
  id v21;
  NSLayoutXAxisAnchor *v22;
  id v23;
  id v24;
  id v25;
  NSLayoutXAxisAnchor *v26;
  objc_super v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  SEL v38;
  SUSSoftwareUpdateComingSoonTipCell *v39;

  v39 = self;
  v38 = a2;
  v36 = 0u;
  v37 = 0u;
  -[UIView frame](self->_tipView, "frame");
  *(_QWORD *)&v37 = v2;
  *((_QWORD *)&v37 + 1) = v3;
  v13 = (id)-[SUSSoftwareUpdateComingSoonTipCell contentView](v39, "contentView");
  objc_msgSend(v13, "frame");
  v32 = v4;
  v33 = v5;
  v34 = v6;
  v35 = v7;
  *(float *)&v4 = v4;
  *(double *)&v36 = floorf(*(float *)&v4);

  v14 = (id)-[SUSSoftwareUpdateComingSoonTipCell contentView](v39, "contentView");
  objc_msgSend(v14, "frame");
  v28 = v8;
  v29 = v9;
  v30 = v10;
  v31 = v11;
  *(float *)&v8 = v9;
  *((double *)&v36 + 1) = floorf(*(float *)&v8);

  -[UIView setFrame:](v39->_tipView, "setFrame:", v36, v37);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v39->_tipView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](v39->_tipView, "setContentHuggingPriority:forAxis:", 1, v12);
  v18 = -[UIView bottomAnchor](v39->_tipView, "bottomAnchor");
  v17 = (id)-[SUSSoftwareUpdateComingSoonTipCell contentView](v39, "contentView");
  v16 = (id)objc_msgSend(v17, "bottomAnchor");
  v15 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v18, "constraintEqualToAnchor:");
  objc_msgSend(v15, "setActive:", 1);

  v22 = -[UIView leadingAnchor](v39->_tipView, "leadingAnchor");
  v21 = (id)-[SUSSoftwareUpdateComingSoonTipCell contentView](v39, "contentView");
  v20 = (id)objc_msgSend(v21, "leadingAnchor");
  v19 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v22, "constraintEqualToAnchor:");
  objc_msgSend(v19, "setActive:", 1);

  v26 = -[UIView trailingAnchor](v39->_tipView, "trailingAnchor");
  v25 = (id)-[SUSSoftwareUpdateComingSoonTipCell contentView](v39, "contentView");
  v24 = (id)objc_msgSend(v25, "trailingAnchor");
  v23 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v26, "constraintEqualToAnchor:");
  objc_msgSend(v23, "setActive:", 1);

  v27.receiver = v39;
  v27.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  -[SUSSoftwareUpdateComingSoonTipCell updateConstraints](&v27, sel_updateConstraints);
}

- (double)preferredHeightWithTable:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  id location[2];
  SUSSoftwareUpdateComingSoonTipCell *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSSoftwareUpdateComingSoonTipCell bounds](v11, "bounds");
  CGSizeMake_1();
  v8 = v3;
  v9 = v4;
  -[UIView layoutIfNeeded](v11->_tipView, "layoutIfNeeded");
  -[UIView sizeThatFits:](v11->_tipView, "sizeThatFits:", v8, v9);
  v7 = v5;
  objc_storeStrong(location, 0);
  return v7;
}

- (void)layoutSubviews
{
  objc_super v2;
  objc_super v3;
  SEL v4;
  SUSSoftwareUpdateComingSoonTipCell *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  -[SUSSoftwareUpdateComingSoonTipCell updateConstraints](&v3, sel_updateConstraints);
  v2.receiver = v5;
  v2.super_class = (Class)SUSSoftwareUpdateComingSoonTipCell;
  -[PSTableCell layoutSubviews](&v2, sel_layoutSubviews);
}

- (UIView)tipView
{
  return self->_tipView;
}

- (void)setTipView:(id)a3
{
  objc_storeStrong((id *)&self->_tipView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipView, 0);
}

- (id)createTipView
{
  SUSSoftwareUpdateComingSoonTipCell *v2;
  id *v3;
  void (*v4)(_QWORD *__return_ptr);
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  v2 = self;
  v3 = (id *)SUSettingsSwiftTipsManager.shared.unsafeMutableAddressor();
  v4 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)*v3) + 0x90);
  v5 = *v3;
  v4(v9);

  v6 = objc_allocWithZone((Class)sub_22CBCA4D0());
  v7 = (void *)sub_22CBCA4DC();

  return v7;
}

@end
