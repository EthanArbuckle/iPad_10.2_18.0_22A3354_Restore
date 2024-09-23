@implementation MailActionViewHeader

- (MailActionViewHeader)initWithFrame:(CGRect)a3
{
  MailActionViewHeader *v3;
  MailActionViewHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailActionViewHeader;
  v3 = -[MFCollapsedMessageCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFMessageConversationViewCell setShouldAddShadow:](v3, "setShouldAddShadow:", 0);
    -[MFCollapsedMessageCell setIsActionCardHeader:](v4, "setIsActionCardHeader:", 1);
  }
  return v4;
}

- (void)_createPrimaryViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MailActionViewHeader;
  -[MFCollapsedMessageCell _createPrimaryViews](&v7, "_createPrimaryViews");
  -[MailActionViewHeader _updateLabelColor](self, "_updateLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionViewHeader contentView](self, "contentView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[MailActionViewHeader setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionViewHeader contentView](self, "contentView"));
  objc_msgSend(v6, "setClipsToBounds:", 0);

}

- (void)_updateLabelColor
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v3, "setTextColor:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v4, "setTextColor:", v6);

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mf_messageHeaderSenderLabelFontForMailActionHeader](UIFont, "mf_messageHeaderSenderLabelFontForMailActionHeader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v3, "setFont:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont mf_messageHeaderSummaryLabelFontForMailActionHeader](UIFont, "mf_messageHeaderSummaryLabelFontForMailActionHeader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v4, "setFont:", v6);

}

- (double)_topToSenderBaselineInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "topToSenderBaselineInConversationForMailActionHeader");
  v4 = v3;

  return v4;
}

- (double)_baselineToBaselineSpacingInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "baselineToBaselineSpacingInConversationForMailActionHeader");
  v4 = v3;

  return v4;
}

- (double)_messageBottomPaddingInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "messageBottomPaddingInConversationForMailActionHeader");
  v4 = v3;

  return v4;
}

- (double)_messageTopPaddingInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "messageTopPaddingInConversationForMailActionHeader");
  v4 = v3;

  return v4;
}

+ (double)defaultHeightWithDisplayMetrics:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  double v14;
  double v15;

  v3 = a3;
  objc_msgSend(v3, "messageTopPaddingInConversationForMailActionHeader");
  v5 = v4;
  objc_msgSend(v3, "topToSenderBaselineInConversationForMailActionHeader");
  v7 = v6;
  objc_msgSend(v3, "baselineToBaselineSpacingInConversationForMailActionHeader");
  v9 = v8;
  objc_msgSend(v3, "messageBottomPaddingInConversationForMailActionHeader");
  v11 = v10;
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);
  v14 = v5 + v7 + v9 + v11;

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v3, "baselineToBaselineSpacingInConversationForMailActionHeader");
    v14 = v14 + v15;
  }

  return v14;
}

- (BOOL)shouldApplySystemLighterMaterial
{
  return 0;
}

- (void)updateTitle:(id)a3 subject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionViewHeader title](self, "title"));
  if ((objc_msgSend(v7, "isEqualToString:", v19) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionViewHeader subject](self, "subject"));
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if ((v9 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarSuperview](self, "avatarSuperview"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MFActionViewHeaderIcon")));
  objc_msgSend(v10, "setImage:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v10, "setTintColor:", v12);

  objc_msgSend(v10, "setContentMode:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.25)));
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  objc_msgSend(v13, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);
  LODWORD(v15) = 1.0;
  objc_msgSend(v13, "setShadowOpacity:", v15);
  objc_msgSend(v13, "setShadowRadius:", 3.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
  objc_msgSend(v16, "removeFromSuperview");

  -[MailActionViewHeader setTitle:](self, "setTitle:", v19);
  -[MailActionViewHeader setSubject:](self, "setSubject:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v17, "setText:", v19);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v18, "setText:", v6);

  -[MailActionViewHeader setNeedsLayout](self, "setNeedsLayout");
LABEL_6:

}

- (double)_leadingMargin
{
  return 0.0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
