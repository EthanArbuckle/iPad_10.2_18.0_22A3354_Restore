@implementation STSVideoCell

- (STSVideoCell)initWithFrame:(CGRect)a3
{
  STSVideoCell *v3;
  STSVideoCell *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *constraints;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UIView *footerContainer;
  uint64_t v16;
  UIImageView *providerIconView;
  void *v18;
  void *v19;
  uint64_t v20;
  UIButton *playButton;
  uint64_t v22;
  UILabel *titleLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  uint64_t v28;
  UILabel *subtitleLabel;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  uint64_t v34;
  UILabel *providerLabel;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  uint64_t v40;
  UILabel *durationLabel;
  UILabel *v42;
  void *v43;
  UILabel *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)STSVideoCell;
  v3 = -[STSImageCell initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[STSVideoCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    constraints = v4->_constraints;
    v4->_constraints = (NSMutableArray *)v7;

    v9 = objc_alloc(MEMORY[0x24BEBDB00]);
    v10 = *MEMORY[0x24BDBF090];
    v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
    footerContainer = v4->_footerContainer;
    v4->_footerContainer = (UIView *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v10, v11, v12, v13);
    providerIconView = v4->_providerIconView;
    v4->_providerIconView = (UIImageView *)v16;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_providerIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_providerIconView, "setContentMode:", 4);
    v18 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageNamed:inBundle:", CFSTR("play-icon"), v19);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v20 = objc_claimAutoreleasedReturnValue();
    playButton = v4->_playButton;
    v4->_playButton = (UIButton *)v20;

    -[UIButton setImage:forState:](v4->_playButton, "setImage:forState:", v50, 0);
    -[UIButton setImageEdgeInsets:](v4->_playButton, "setImageEdgeInsets:", 10.0, 10.0, 10.0, 10.0);
    -[UIButton addTarget:action:forControlEvents:](v4->_playButton, "addTarget:action:forControlEvents:", v4, sel__didPressPlay, 64);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v22;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 14.5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    v26 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_primaryResultTextColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v26, "setTextColor:", v27);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v28;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v30, "setFont:", v31);

    v32 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_secondaryResultTextColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v32, "setTextColor:", v33);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 2);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
    providerLabel = v4->_providerLabel;
    v4->_providerLabel = (UILabel *)v34;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_providerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = v4->_providerLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 11.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v36, "setFont:", v37);

    v38 = v4->_providerLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_primaryResultTextColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v38, "setTextColor:", v39);

    v40 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v10, v11, v12, v13);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = (UILabel *)v40;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_durationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v42 = v4->_durationLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 11.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v42, "setFont:", v43);

    v44 = v4->_durationLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_secondaryResultTextColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v44, "setTextColor:", v45);

    LODWORD(v46) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_durationLabel, "setContentCompressionResistancePriority:forAxis:", 0, v46);
    -[UIView addSubview:](v4->_footerContainer, "addSubview:", v4->_providerIconView);
    -[UIView addSubview:](v4->_footerContainer, "addSubview:", v4->_providerLabel);
    -[UIView addSubview:](v4->_footerContainer, "addSubview:", v4->_durationLabel);
    -[UIView addSubview:](v4->_footerContainer, "addSubview:", v4->_subtitleLabel);
    -[UIView addSubview:](v4->_footerContainer, "addSubview:", v4->_titleLabel);
    -[STSVideoCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v4->_footerContainer);

    -[STSVideoCell contentView](v4, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v4->_playButton);

    -[STSVideoCell _updateHiddenViewsAnimated:](v4, "_updateHiddenViewsAnimated:", 0);
    -[STSVideoCell updateConstraints](v4, "updateConstraints");

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSVideoCell;
  -[STSImageCell prepareForReuse](&v3, sel_prepareForReuse);
  -[STSVideoCell setPlayButtonAction:](self, "setPlayButtonAction:", 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v31.receiver = self;
  v31.super_class = (Class)STSVideoCell;
  -[STSImageCell layoutSubviews](&v31, sel_layoutSubviews);
  -[STSVideoCell bounds](self, "bounds");
  v29 = v4;
  v30 = v3;
  v27 = v6;
  v28 = v5;
  -[STSImageCell imageFrame](self, "imageFrame");
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  MaxX = CGRectGetMaxX(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxY = CGRectGetMaxY(v33);
  -[UIButton imageForState:](self->_playButton, "imageForState:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;

  -[UIButton imageEdgeInsets](self->_playButton, "imageEdgeInsets");
  v20 = v15 + v18 + v19;
  v23 = v17 + v21 + v22;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v24 = CGRectGetMaxY(v34);
  v35.origin.x = v30;
  v35.origin.y = v29;
  v35.size.width = v28;
  v35.size.height = v27;
  v25 = CGRectGetHeight(v35) - v24;
  v36.origin.x = v30;
  v36.origin.y = v29;
  v36.size.width = v28;
  v36.size.height = v27;
  v26 = CGRectGetWidth(v36);
  -[UIButton setFrame:](self->_playButton, "setFrame:", MaxX - v20 + 5.0, MaxY - v23 + 5.0, v20, v23);
  -[UIView setFrame:](self->_footerContainer, "setFrame:", 0.0, v24, v26, v25);
}

- (double)imageAspectRatio
{
  return 0.5625;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[STSVideoCell removeConstraints:](self, "removeConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v11.receiver = self;
  v11.super_class = (Class)STSVideoCell;
  -[STSVideoCell updateConstraints](&v11, sel_updateConstraints);
  _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _subtitleLabel, _providerIconView, _providerLabel, _durationLabel"), self->_titleLabel, self->_subtitleLabel, self->_providerIconView, self->_providerLabel, self->_durationLabel, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-9-[_titleLabel]-(>=5)-|"), 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-9-[_subtitleLabel]-(>=9)-|"), 0, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(8.5)-[_titleLabel]-0-[_subtitleLabel]-(>=5)-|"), 0, 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-9-[_providerIconView(20)]-5-[_providerLabel]-(>=10)-[_durationLabel]-9-|"), 0, 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=5)-[_providerIconView(20)]-(4.5)-|"), 0, 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=5)-[_providerLabel]-7-|"), 0, 0, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=5)-[_durationLabel]-7-|"), 0, 0, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v4);
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v5);
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v6);
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v7);
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v8);
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v9);
  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v10);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);

}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double Width;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)STSVideoCell;
  -[STSVideoCell setFrame:](&v21, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STSVideoCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[STSVideoCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMargins");
  v15 = v8 + v14;
  v18 = v10 - (v16 + v17);
  v22.size.height = v12 - (v14 + v19);
  v22.origin.x = v6 + v16;
  v22.origin.y = v15;
  v22.size.width = v18;
  Width = CGRectGetWidth(v22);

  -[UILabel setPreferredMaxLayoutWidth:](self->_titleLabel, "setPreferredMaxLayoutWidth:", Width);
  -[UILabel setPreferredMaxLayoutWidth:](self->_subtitleLabel, "setPreferredMaxLayoutWidth:", Width);
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)STSVideoCell;
  -[STSImageCell setImage:animated:](&v6, sel_setImage_animated_, a3);
  -[STSVideoCell _updateHiddenViewsAnimated:](self, "_updateHiddenViewsAnimated:", v4);
}

- (UIImage)providerIcon
{
  return -[UIImageView image](self->_providerIconView, "image");
}

- (void)setProviderIcon:(id)a3
{
  -[UIImageView setImage:](self->_providerIconView, "setImage:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (NSString)providerName
{
  return -[UILabel text](self->_providerLabel, "text");
}

- (void)setProviderName:(id)a3
{
  -[UILabel setText:](self->_providerLabel, "setText:", a3);
}

- (NSString)duration
{
  return -[UILabel text](self->_durationLabel, "text");
}

- (void)setDuration:(id)a3
{
  -[UILabel setText:](self->_durationLabel, "setText:", a3);
}

- (void)_didPressPlay
{
  void *v3;
  void (**v4)(void);

  -[STSVideoCell playButtonAction](self, "playButtonAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STSVideoCell playButtonAction](self, "playButtonAction");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_updateHiddenViewsAnimated:(BOOL)a3
{
  void *v4;
  double v5;

  -[STSImageCell image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1.0;
  else
    v5 = 0.0;

  -[UIButton setAlpha:](self->_playButton, "setAlpha:", v5);
}

uint64_t __43__STSVideoCell__updateHiddenViewsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 744), "setAlpha:", *(double *)(a1 + 40));
}

- (id)playButtonAction
{
  return self->_playButtonAction;
}

- (void)setPlayButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playButtonAction, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_providerLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_providerIconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
}

@end
