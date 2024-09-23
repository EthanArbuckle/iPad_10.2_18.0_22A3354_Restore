@implementation ICBrowseAttachmentsHeaderView

- (void)awakeFromNib
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICBrowseAttachmentsHeaderView;
  -[ICBrowseAttachmentsHeaderView awakeFromNib](&v7, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView sectionLabel](self, "sectionLabel"));
  v4 = (unint64_t)objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", UIAccessibilityTraitHeader | v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView sectionLabel](self, "sectionLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  -[ICBrowseAttachmentsHeaderView setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (void)seeAll:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView delegate](self, "delegate", a3));
  objc_msgSend(v4, "showAllForAttachmentSection:", -[ICBrowseAttachmentsHeaderView attachmentSection](self, "attachmentSection"));

}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIFont ic_attachmentBrowserTitleFont](UIFont, "ic_attachmentBrowserTitleFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView sectionLabel](self, "sectionLabel"));
  objc_msgSend(v3, "setFont:", v7);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_attachmentBrowserSeeAllButtonFont](UIFont, "ic_attachmentBrowserSeeAllButtonFont"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButton](self, "seeAllButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v6, "setFont:", v4);

  -[ICBrowseAttachmentsHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = (char *)objc_msgSend(v4, "interfaceOrientation");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  v9 = ICAccessibilityAccessibilityLargerTextSizesEnabled(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView sectionLabel](self, "sectionLabel"));
  v11 = v10;
  if (v9 && (unint64_t)(v5 - 3) >= 0xFFFFFFFFFFFFFFFELL && v7 == (id)1)
  {
    objc_msgSend(v10, "setNumberOfLines:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView constraintsForRegularTextSizes](self, "constraintsForRegularTextSizes"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v12);

    v13 = objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView constraintsForAXLargerTextSizes](self, "constraintsForAXLargerTextSizes"));
  }
  else
  {
    objc_msgSend(v10, "setNumberOfLines:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView constraintsForAXLargerTextSizes](self, "constraintsForAXLargerTextSizes"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v14);

    v13 = objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView constraintsForRegularTextSizes](self, "constraintsForRegularTextSizes"));
  }
  v15 = (void *)v13;
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  v16.receiver = self;
  v16.super_class = (Class)ICBrowseAttachmentsHeaderView;
  -[ICBrowseAttachmentsHeaderView updateConstraints](&v16, "updateConstraints");
}

- (id)constraintsForRegularTextSizes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView sectionLabelBottomConstraint](self, "sectionLabelBottomConstraint"));
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonLeadingConstraint](self, "seeAllButtonLeadingConstraint"));
  objc_msgSend(v3, "ic_addNonNilObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonTrailingConstraint](self, "seeAllButtonTrailingConstraint"));
  objc_msgSend(v3, "ic_addNonNilObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonBaselineConstraint](self, "seeAllButtonBaselineConstraint"));
  objc_msgSend(v3, "ic_addNonNilObject:", v7);

  v8 = objc_msgSend(v3, "copy");
  return v8;
}

- (id)constraintsForAXLargerTextSizes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonAXTopConstraint](self, "seeAllButtonAXTopConstraint"));
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonAXLeadingConstraint](self, "seeAllButtonAXLeadingConstraint"));
  objc_msgSend(v3, "ic_addNonNilObject:", v5);

  v6 = objc_msgSend(v3, "copy");
  return v6;
}

- (void)setLeadingMargin:(double)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView sectionLabelLeadingConstraint](self, "sectionLabelLeadingConstraint"));
  objc_msgSend(v5, "setConstant:", a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonAXLeadingConstraint](self, "seeAllButtonAXLeadingConstraint"));
  objc_msgSend(v6, "setConstant:", a3);

}

- (void)setTrailingMargin:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsHeaderView seeAllButtonTrailingConstraint](self, "seeAllButtonTrailingConstraint"));
  objc_msgSend(v4, "setConstant:", a3);

}

- (UILabel)sectionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_sectionLabel);
}

- (void)setSectionLabel:(id)a3
{
  objc_storeWeak((id *)&self->_sectionLabel, a3);
}

- (UIButton)seeAllButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_seeAllButton);
}

- (void)setSeeAllButton:(id)a3
{
  objc_storeWeak((id *)&self->_seeAllButton, a3);
}

- (NSLayoutConstraint)sectionLabelLeadingConstraint
{
  return self->_sectionLabelLeadingConstraint;
}

- (void)setSectionLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)sectionLabelBottomConstraint
{
  return self->_sectionLabelBottomConstraint;
}

- (void)setSectionLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLabelBottomConstraint, a3);
}

- (NSLayoutConstraint)seeAllButtonLeadingConstraint
{
  return self->_seeAllButtonLeadingConstraint;
}

- (void)setSeeAllButtonLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButtonLeadingConstraint, a3);
}

- (NSLayoutConstraint)seeAllButtonTrailingConstraint
{
  return self->_seeAllButtonTrailingConstraint;
}

- (void)setSeeAllButtonTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButtonTrailingConstraint, a3);
}

- (NSLayoutConstraint)seeAllButtonBaselineConstraint
{
  return self->_seeAllButtonBaselineConstraint;
}

- (void)setSeeAllButtonBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButtonBaselineConstraint, a3);
}

- (NSLayoutConstraint)seeAllButtonAXTopConstraint
{
  return self->_seeAllButtonAXTopConstraint;
}

- (void)setSeeAllButtonAXTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButtonAXTopConstraint, a3);
}

- (NSLayoutConstraint)seeAllButtonAXLeadingConstraint
{
  return self->_seeAllButtonAXLeadingConstraint;
}

- (void)setSeeAllButtonAXLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButtonAXLeadingConstraint, a3);
}

- (NSLayoutConstraint)sectionLabelAXTrailingConstrint
{
  return self->_sectionLabelAXTrailingConstrint;
}

- (void)setSectionLabelAXTrailingConstrint:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLabelAXTrailingConstrint, a3);
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  self->_attachmentSection = a3;
}

- (ICBrowseAttachmentsHeaderViewDelegate)delegate
{
  return (ICBrowseAttachmentsHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionLabelAXTrailingConstrint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonAXLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonAXTopConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_sectionLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_sectionLabelLeadingConstraint, 0);
  objc_destroyWeak((id *)&self->_seeAllButton);
  objc_destroyWeak((id *)&self->_sectionLabel);
}

@end
