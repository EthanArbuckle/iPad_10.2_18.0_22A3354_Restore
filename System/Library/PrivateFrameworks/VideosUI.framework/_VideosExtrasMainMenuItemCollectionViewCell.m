@implementation _VideosExtrasMainMenuItemCollectionViewCell

+ (id)_createLabelInCell:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  if (v3)
  {
    objc_msgSend(v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v5, v6, 10, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "keyWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 10, 0, v6, 10, 1.0, v10 * -0.5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextLabelConstraint:", v11);

    objc_msgSend(v3, "textLabelConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v13);

  }
  return v5;
}

- (_VideosExtrasMainMenuItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  _VideosExtrasMainMenuItemCollectionViewCell *v3;
  _VideosExtrasMainMenuItemCollectionViewCell *v4;
  void *v5;
  uint64_t v6;
  UILabel *textLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_VideosExtrasMainMenuItemCollectionViewCell;
  v3 = -[_VideosExtrasMainMenuItemCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_VideosExtrasMainMenuItemCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_createLabelInCell:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    textLabel = v4->_textLabel;
    v4->_textLabel = (UILabel *)v6;

    objc_msgSend(v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    -[_VideosExtrasMainMenuItemCollectionViewCell layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    -[_VideosExtrasMainMenuItemCollectionViewCell layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel__dynamicTypeChanged, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_VideosExtrasMainMenuItemCollectionViewCell;
  -[_VideosExtrasMainMenuItemCollectionViewCell dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  double v3;
  id v4;

  -[_VideosExtrasMainMenuItemCollectionViewCell textLabelConstraint](self, "textLabelConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_VideosExtrasMainMenuItemCollectionViewCell safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v4, "setConstant:", v3 * -0.5);

}

- (void)_dynamicTypeChanged
{
  -[UILabel invalidateIntrinsicContentSize](self->_textLabel, "invalidateIntrinsicContentSize");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *textLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_VideosExtrasMainMenuItemCollectionViewCell;
  -[_VideosExtrasMainMenuItemCollectionViewCell setSelected:](&v10, sel_setSelected_);
  if (v3)
  {
    textLabel = self->_textLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](textLabel, "setTextColor:", v6);

    -[UILabel layer](self->_textLabel, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2ED8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v8);
  }
  else
  {
    +[VideosExtrasNavigationBarButton textDodgeColor](VideosExtrasNavigationBarButton, "textDodgeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v7);
    -[UILabel layer](self->_textLabel, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VideosExtrasNavigationBarButton textFilter](VideosExtrasNavigationBarButton, "textFilter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v9);

  }
}

- (NSLayoutConstraint)textLabelConstraint
{
  return self->_textLabelConstraint;
}

- (void)setTextLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelConstraint, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_textLabelConstraint, 0);
}

@end
