@implementation RAPCommentPartHeaderView

- (RAPCommentPartHeaderView)initWithQuestion:(id)a3 reuseIdentifier:(id)a4
{
  id v7;
  RAPCommentPartHeaderView *v8;
  RAPCommentPartHeaderView *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RAPCommentPartHeaderView;
  v8 = -[RAPHeaderFooterView initWithReuseIdentifier:](&v16, "initWithReuseIdentifier:", a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_question, a3);
    -[RAPCommentPartHeaderView updateRemainingCharacters](v9, "updateRemainingCharacters");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion commentsTitle](v9->_question, "commentsTitle"));
    -[RAPHeaderFooterView setTitleLabelText:](v9, "setTitleLabelText:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentPartHeaderView traitCollection](v9, "traitCollection"));
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == (id)5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentPartHeaderView contentView](v9, "contentView"));
      objc_msgSend(v14, "setBackgroundColor:", v13);

    }
  }

  return v9;
}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)RAPCommentPartHeaderView;
  v3 = -[RAPHeaderFooterView _initialConstraints](&v25, "_initialConstraints");
  v24 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_remainingCharactersLabel, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView titleLabel](self, "titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v6, 8.0));

  LODWORD(v8) = 1148829696;
  v21 = v7;
  objc_msgSend(v7, "setPriority:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_remainingCharactersLabel, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentPartHeaderView contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v20, -16.0));
  v26[0] = v9;
  v26[1] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_remainingCharactersLabel, "lastBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastBaselineAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v26[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_remainingCharactersLabel, "firstBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView titleLabel](self, "titleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v26[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  objc_msgSend(v24, "addObjectsFromArray:", v18);

  return v24;
}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *remainingCharactersLabel;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPCommentPartHeaderView;
  -[RAPHeaderFooterView _createSubviews](&v7, "_createSubviews");
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  remainingCharactersLabel = self->_remainingCharactersLabel;
  self->_remainingCharactersLabel = v3;

  LODWORD(v5) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_remainingCharactersLabel, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_remainingCharactersLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentPartHeaderView contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_remainingCharactersLabel);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPCommentPartHeaderView;
  -[RAPHeaderFooterView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UILabel setTextColor:](self->_remainingCharactersLabel, "setTextColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[UILabel setFont:](self->_remainingCharactersLabel, "setFont:", v4);

}

- (void)updateRemainingCharacters
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[RAPCommentQuestion remainingCharacters](self->_question, "remainingCharacters")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v4, 0));
  -[UILabel setText:](self->_remainingCharactersLabel, "setText:", v3);

}

- (RAPCommentQuestion)question
{
  return self->_question;
}

- (void)setQuestion:(id)a3
{
  objc_storeStrong((id *)&self->_question, a3);
}

- (UILabel)remainingCharactersLabel
{
  return self->_remainingCharactersLabel;
}

- (void)setRemainingCharactersLabel:(id)a3
{
  objc_storeStrong((id *)&self->_remainingCharactersLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingCharactersLabel, 0);
  objc_storeStrong((id *)&self->_question, 0);
}

@end
