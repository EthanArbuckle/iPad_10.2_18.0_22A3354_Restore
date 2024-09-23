@implementation ShowMoreFooterView

+ (double)defaultHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EpisodeListAvailableStyle defaultStyle](EpisodeListAvailableStyle, "defaultStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "seeMore_containerTop_To_buttonBL"));
  objc_msgSend(v3, "currentConstant");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "seeMore_buttonBL_To_containerBottom"));
  objc_msgSend(v6, "currentConstant");
  v8 = v5 + v7;

  return v8;
}

- (ShowMoreFooterView)initWithFrame:(CGRect)a3
{
  ShowMoreFooterView *v3;
  uint64_t v4;
  EpisodeListAvailableStyle *style;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ShowMoreFooterView;
  v3 = -[ShowMoreFooterView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[EpisodeListAvailableStyle defaultStyle](EpisodeListAvailableStyle, "defaultStyle"));
    style = v3->_style;
    v3->_style = (EpisodeListAvailableStyle *)v4;

    -[ShowMoreFooterView loadViewAndConstraints](v3, "loadViewAndConstraints");
  }
  return v3;
}

- (void)loadViewAndConstraints
{
  ShowMoreFooterView *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  uint64_t v18;
  NSArray *installedConstraints;
  void *v20;
  _QWORD v21[3];

  v2 = self;
  -[ShowMoreFooterView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView style](v2, "style"));
  v4 = objc_msgSend(v3, "newSeeMoreButton");
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", v2, "buttonTapped:", 64);
  -[ShowMoreFooterView addSubview:](v2, "addSubview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView leadingAnchor](v2, "leadingAnchor"));
  objc_msgSend(v3, "defaultMarginH");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstBaselineAnchor", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView topAnchor](v2, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seeMore_containerTop_To_buttonBL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mt_copyWithDynamicTypeConstant:", v11));

  v21[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView bottomAnchor](v2, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seeMore_buttonBL_To_containerBottom"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mt_copyWithDynamicTypeConstant:", v16));

  v21[2] = v17;
  v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  installedConstraints = v2->_installedConstraints;
  v2->_installedConstraints = (NSArray *)v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView installedConstraints](v2, "installedConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void)updateDynamicConstraints
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView installedConstraints](self, "installedConstraints"));
  +[MTDynamicTypeConstant updateDynamicConstantInConstraints:](MTDynamicTypeConstant, "updateDynamicConstantInConstraints:", v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ShowMoreFooterView;
  -[ShowMoreFooterView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[ShowMoreFooterView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ShowMoreFooterView;
  -[ShowMoreFooterView updateConstraints](&v3, "updateConstraints");
  -[ShowMoreFooterView updateDynamicConstraints](self, "updateDynamicConstraints");
}

- (void)buttonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ShowMoreFooterView actionHandler](self, "actionHandler", a3));
  objc_msgSend(v4, "handleShowMoreEpisodesForFooterView:", self);

}

- (ShowMoreFooterViewActionHandler)actionHandler
{
  return (ShowMoreFooterViewActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (EpisodeListAvailableStyle)style
{
  return self->_style;
}

- (NSArray)installedConstraints
{
  return self->_installedConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedConstraints, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
}

@end
