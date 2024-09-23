@implementation PNPHandwritingGesturesViewController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v8;
  PNPHandwritingGesturesViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PNPHandwritingGesturesViewController *v14;

  v8 = a6;
  v9 = [PNPHandwritingGesturesViewController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_GESTURES_EDUCATION_PANEL_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_GESTURES_EDUCATION_PANEL_DETAIL"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PNPHandwritingGesturesViewController initWithTitle:detailText:icon:contentLayout:](v9, "initWithTitle:detailText:icon:contentLayout:", v11, v13, 0, 2);

  -[PNPWelcomeController setControllerType:buttonType:deviceType:delegate:](v14, "setControllerType:buttonType:deviceType:delegate:", a3, a4, a5, v8);
  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PNPHandwritingGesturesViewController;
  -[OBBaseWelcomeController viewDidLoad](&v21, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingGesturesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[PNPHandwritingGesturesViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v6, "setAxis:", 1);
  objc_msgSend(v6, "setSpacing:", 48.0);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -18.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 18.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v6, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[PNPHandwritingGesturesViewController setBulletListView:](self, "setBulletListView:", v6);
  v19 = objc_alloc(MEMORY[0x24BDF6F90]);
  v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "addArrangedSubview:", v20);

  -[PNPHandwritingGesturesViewController addDeleteBulletItem](self, "addDeleteBulletItem");
  -[PNPHandwritingGesturesViewController addSpaceBulletItem](self, "addSpaceBulletItem");

}

- (void)addDeleteBulletItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_GESTURES_EDUCATION_PANEL_DELETE_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_GESTURES_EDUCATION_PANEL_DELETE_DETAIL"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:renderingMode:](self, "bundleImageNamed:renderingMode:", CFSTR("welcome_delete"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingGesturesViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addSpaceBulletItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_GESTURES_EDUCATION_PANEL_SPACE_TITLE"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HANDWRITING_GESTURES_EDUCATION_PANEL_SPACE_DETAIL"), &stru_24F4E5CD0, CFSTR("PencilSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWelcomeController bundleImageNamed:renderingMode:](self, "bundleImageNamed:renderingMode:", CFSTR("welcome_make_space"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPHandwritingGesturesViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v3, v5, v6);

}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  id v45;

  v8 = (objc_class *)MEMORY[0x24BDF6DD0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v45 = objc_alloc_init(v8);
  objc_msgSend(v45, "setAxis:", 1);
  objc_msgSend(v45, "setSpacing:", 0.0);
  objc_msgSend(v45, "setAlignment:", 1);
  v12 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v12, "setNumberOfLines:", 0);
  v13 = (void *)MEMORY[0x24BEBB520];
  v14 = *MEMORY[0x24BDF7810];
  -[PNPHandwritingGesturesViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredFontForTextStyle:compatibleWithTraitCollection:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "fontDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontDescriptorWithSymbolicTraits:", 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v16, "pointSize");
  objc_msgSend(v18, "fontWithDescriptor:size:", v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v19);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v20);

  LODWORD(v21) = 1148846080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v21);
  LODWORD(v22) = 1144750080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v22);
  objc_msgSend(v45, "addArrangedSubview:", v12);
  v23 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v23, "setText:", v10);

  objc_msgSend(v23, "setNumberOfLines:", 0);
  v24 = (void *)MEMORY[0x24BEBB520];
  -[PNPHandwritingGesturesViewController traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "preferredFontForTextStyle:compatibleWithTraitCollection:", v14, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v26);

  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v27);

  LODWORD(v28) = 1148846080;
  objc_msgSend(v23, "setContentHuggingPriority:forAxis:", 1, v28);
  LODWORD(v29) = 1144750080;
  objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 1, v29);
  objc_msgSend(v45, "addArrangedSubview:", v23);
  v30 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v30, "setAxis:", 0);
  objc_msgSend(v30, "setSpacing:", 18.0);
  objc_msgSend(v30, "setAlignment:", 3);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
  objc_msgSend(v9, "size");
  v33 = v32;
  objc_msgSend(v9, "size");
  v35 = v34;

  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v31, "setContentMode:", 1);
  objc_msgSend(v30, "addArrangedSubview:", v31);
  objc_msgSend(v30, "addArrangedSubview:", v45);
  objc_msgSend(v31, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintGreaterThanOrEqualToConstant:", 105.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  objc_msgSend(v31, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:multiplier:", v39, 1.0 / (v33 / v35));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  LODWORD(v41) = 1148846080;
  objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 0, v41);
  LODWORD(v42) = 1148846080;
  objc_msgSend(v31, "setContentHuggingPriority:forAxis:", 0, v42);
  -[PNPHandwritingGesturesViewController bulletListView](self, "bulletListView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addArrangedSubview:", v30);

}

- (UIStackView)bulletListView
{
  return self->_bulletListView;
}

- (void)setBulletListView:(id)a3
{
  objc_storeStrong((id *)&self->_bulletListView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletListView, 0);
}

@end
