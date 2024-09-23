@implementation PRXFeatureTourContentViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[9];

  v53[7] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)PRXFeatureTourContentViewController;
  -[PRXCardContentViewController viewDidLoad](&v52, sel_viewDidLoad);
  +[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController setTitleView:](self, "setTitleView:", v3);

  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (-[PRXFeatureTourContentViewController shouldCenterAlignText](self, "shouldCenterAlignText"))
    v5 = 1;
  else
    v5 = 4;
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", v5);

  -[PRXFeatureTourContentViewController titleText](self, "titleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[PRXCardContentViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  +[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController setBodyView:](self, "setBodyView:", v11);

  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (-[PRXFeatureTourContentViewController shouldCenterAlignText](self, "shouldCenterAlignText"))
    v13 = 1;
  else
    v13 = 4;
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextAlignment:", v13);

  -[PRXFeatureTourContentViewController bodyText](self, "bodyText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  -[PRXCardContentViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  -[PRXCardContentViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "internalContentGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x24BDD1628];
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v48;
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v44;
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 20.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v40;
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v35;
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v31;
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, 4.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v24;
  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v29);

}

- (void)setBodyText:(id)a3
{
  NSString *v4;
  NSString *bodyText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  bodyText = self->_bodyText;
  if (bodyText != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](bodyText, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_bodyText;
      self->_bodyText = v7;

      -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

      v4 = v10;
    }
  }

}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  titleText = self->_titleText;
  if (titleText != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](titleText, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_titleText;
      self->_titleText = v7;

      -[PRXFeatureTourContentViewController titleView](self, "titleView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

      v4 = v10;
    }
  }

}

- (void)setShouldCenterAlignText:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  self->_shouldCenterAlignText = a3;
  if (a3)
    v4 = 1;
  else
    v4 = 4;
  -[PRXFeatureTourContentViewController titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", v4);

  -[PRXFeatureTourContentViewController bodyView](self, "bodyView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", v4);

}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (BOOL)shouldCenterAlignText
{
  return self->_shouldCenterAlignText;
}

- (PRXLabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (PRXLabel)bodyView
{
  return self->_bodyView;
}

- (void)setBodyView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
