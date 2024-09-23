@implementation FeatureTableViewCell

- (void)_configureFeatureCell
{
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  UISwitch *v7;
  UISwitch *useFeatureSwitch;
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
  _QWORD v39[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

  -[FeatureTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  useFeatureSwitch = self->_useFeatureSwitch;
  self->_useFeatureSwitch = v7;

  -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_useFeatureSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISwitch addTarget:action:forControlEvents:](self->_useFeatureSwitch, "addTarget:action:forControlEvents:", self, "_toggleUseFeature:", 4096);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_useFeatureSwitch);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_titleLabel);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch trailingAnchor](self->_useFeatureSwitch, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 8.0));
  v39[0] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -8.0));
  v39[1] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v39[2] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v39[3] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch leadingAnchor](self->_useFeatureSwitch, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 8.0));
  v39[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch topAnchor](self->_useFeatureSwitch, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 8.0));
  v39[5] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch bottomAnchor](self->_useFeatureSwitch, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -8.0));
  v39[6] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (FeatureTableViewCell)initWithReuseIdentifier:(id)a3
{
  FeatureTableViewCell *v3;
  FeatureTableViewCell *v4;
  FeatureTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FeatureTableViewCell;
  v3 = -[FeatureTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 3, a3);
  v4 = v3;
  if (v3)
  {
    -[FeatureTableViewCell _configureFeatureCell](v3, "_configureFeatureCell");
    v5 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  id toggleFeatureBlock;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FeatureTableViewCell;
  -[FeatureTableViewCell prepareForReuse](&v4, "prepareForReuse");
  -[UILabel setText:](self->_titleLabel, "setText:", &stru_1011EB268);
  toggleFeatureBlock = self->_toggleFeatureBlock;
  self->_toggleFeatureBlock = 0;

}

- (void)_toggleUseFeature:(id)a3
{
  void (**toggleFeatureBlock)(void);

  toggleFeatureBlock = (void (**)(void))self->_toggleFeatureBlock;
  if (toggleFeatureBlock)
    toggleFeatureBlock[2]();
}

- (void)configureFromFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;
  UISwitch *useFeatureSwitch;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  v6 = objc_msgSend(v4, "state");
  if (v6 == (id)2)
  {
    -[UISwitch setEnabled:](self->_useFeatureSwitch, "setEnabled:", 1);
    useFeatureSwitch = self->_useFeatureSwitch;
    v8 = 0;
LABEL_7:
    -[UISwitch setOn:](useFeatureSwitch, "setOn:", v8);
    return;
  }
  if (v6 == (id)1)
  {
    -[UISwitch setEnabled:](self->_useFeatureSwitch, "setEnabled:", 1);
    useFeatureSwitch = self->_useFeatureSwitch;
    v8 = 1;
    goto LABEL_7;
  }
  if (!v6)
  {
    -[UISwitch setOn:](self->_useFeatureSwitch, "setOn:", 0);
    -[UISwitch setEnabled:](self->_useFeatureSwitch, "setEnabled:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[FeatureTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v9, "setEnabled:", 0);

  }
}

- (UISwitch)useFeatureSwitch
{
  return self->_useFeatureSwitch;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (id)toggleFeatureBlock
{
  return self->_toggleFeatureBlock;
}

- (void)setToggleFeatureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toggleFeatureBlock, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_useFeatureSwitch, 0);
}

@end
