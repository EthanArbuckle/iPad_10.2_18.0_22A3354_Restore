@implementation MessageListCellView

- (id)_highlightedPrimaryString:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView _highlightedSender:](self, "_highlightedSender:", a3));
}

- (void)_setupDisclosureButtonImageIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  if (!v4)
  {
    -[MessageListCellView _layoutDisclosureButton](self, "_layoutDisclosureButton");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphMessageListChevronThread));
    objc_msgSend(v8, "setImage:forState:", v5, 0);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageView"));
    objc_msgSend(v6, "setContentMode:", 1);

  }
}

- (void)setDisplayVIP:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v4, "setHidesVIPIndicator:", !v3);

}

- (void)setDisplayUnreadDot:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v4, "setHidesUnreadIndicator:", !v3);

}

- (UIImageView)chevron
{
  UIImageView *chevron;
  UIImageView *v4;
  UIImageView *v5;

  chevron = self->_chevron;
  if (!chevron)
  {
    if (self->_chevronType)
    {
      v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      v5 = self->_chevron;
      self->_chevron = v4;

      -[MessageListCellView addSubview:](self, "addSubview:", self->_chevron);
      chevron = self->_chevron;
    }
    else
    {
      chevron = 0;
    }
  }
  return chevron;
}

- (void)_layoutChevronForDisclosureStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  _QWORD v21[11];
  CGAffineTransform v22;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "threadDisclosureColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v6, v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
  objc_msgSend(v10, "setTintColor:", v9);

  if (-[MessageListCellView disclosureEnabled](self, "disclosureEnabled"))
  {
    if (-[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))v11 = -1.57079633;
    else
      v11 = 1.57079633;
    CGAffineTransformMakeRotation(&v22, v11);
    a = v22.a;
    b = v22.b;
    c = v22.c;
    d = v22.d;
    tx = v22.tx;
    ty = v22.ty;
  }
  else
  {
    a = CGAffineTransformIdentity.a;
    b = CGAffineTransformIdentity.b;
    c = CGAffineTransformIdentity.c;
    d = CGAffineTransformIdentity.d;
    tx = CGAffineTransformIdentity.tx;
    ty = CGAffineTransformIdentity.ty;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003AC38;
  v21[3] = &unk_10051F060;
  v21[4] = self;
  *(CGFloat *)&v21[5] = a;
  *(CGFloat *)&v21[6] = b;
  *(CGFloat *)&v21[7] = c;
  *(CGFloat *)&v21[8] = d;
  *(CGFloat *)&v21[9] = tx;
  *(CGFloat *)&v21[10] = ty;
  v18 = objc_retainBlock(v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003AB6C;
  v20[3] = &unk_10051A848;
  v20[4] = self;
  v19 = objc_retainBlock(v20);
  if (v3)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v19, 0.333);
  }
  else
  {
    ((void (*)(_QWORD *))v18[2])(v18);
    ((void (*)(_QWORD *, uint64_t))v19[2])(v19, 1);
  }

}

- (void)setSummary:(id)a3
{
  NSString *v4;
  NSString *summary;
  NSAttributedString *attributedTertiaryString;
  NSString *v7;

  v7 = (NSString *)a3;
  if (self->_summary != v7)
  {
    v4 = (NSString *)-[NSString copy](v7, "copy");
    summary = self->_summary;
    self->_summary = v4;

    attributedTertiaryString = self->_attributedTertiaryString;
    self->_attributedTertiaryString = 0;

    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (MessageListCellView)initWithFrame:(CGRect)a3
{
  MessageListCellView *v3;
  MessageListCellView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MessageListCellView;
  v3 = -[MessageListCellView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MessageListCellView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[MessageListCellView setAutoresizesSubviews:](v4, "setAutoresizesSubviews:", 1);
    -[MessageListCellView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MessageListCellView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[MessageListCellView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "_layoutValuesDidChange:", kMessageListCellLayoutValuesDidChangeNotification, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "_dynamicTypeDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)setConfigurationState:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UICellConfigurationState isEqual:](self->_configurationState, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_configurationState, a3);
    -[MessageListCellView _resetAttributedStrings](self, "_resetAttributedStrings");
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setContentConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIListContentConfiguration isEqual:](self->_contentConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentConfiguration, a3);
    -[MessageListCellView _resetAttributedStrings](self, "_resetAttributedStrings");
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_secondaryStringAttributesWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subjectFont"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _defaultAttributesWithFont:color:](self, "_defaultAttributesWithFont:color:", v6, v4));

  return v7;
}

- (id)_addressAttributesWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressFont"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _defaultAttributesWithFont:color:](self, "_defaultAttributesWithFont:color:", v6, v4));

  return v7;
}

- (void)_resetAttributedStrings
{
  NSAttributedString *attributedPrimaryString;
  NSAttributedString *attributedSecondaryString;
  NSString *accessibilitySecondaryLabel;
  NSAttributedString *attributedTertiaryString;

  attributedPrimaryString = self->_attributedPrimaryString;
  self->_attributedPrimaryString = 0;

  attributedSecondaryString = self->_attributedSecondaryString;
  self->_attributedSecondaryString = 0;

  accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
  self->_accessibilitySecondaryLabel = 0;

  attributedTertiaryString = self->_attributedTertiaryString;
  self->_attributedTertiaryString = 0;

}

- (id)_highlightedSummarySnippet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hintsBySnippetZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", EMMessageSnippetHintZoneTextContent));

  if (_os_feature_enabled_impl("Mail", "SnippetHighlighting") && objc_msgSend(v7, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListCellView log](MessageListCellView, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringFromArray:](EFPrivacy, "partiallyRedactedStringFromArray:", v7));
      objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
      sub_100392FE8();
    }

    v9 = sub_10010B6C8(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[MUISnippetGenerator highlightedSnippetUsingTokens:attributedString:maxNumberOfWordsBeforeOrAfterToken:maxNumberOfRanges:highlighting:error:](MUISnippetGenerator, "highlightedSnippetUsingTokens:attributedString:maxNumberOfWordsBeforeOrAfterToken:maxNumberOfRanges:highlighting:error:", v7, v4, 2, 2, v10, 0));

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (id)_highlightedSubject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hintsBySnippetZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", EMMessageSnippetHintZoneSubject));

  if (_os_feature_enabled_impl("Mail", "SnippetHighlighting") && objc_msgSend(v7, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MessageListCellView log](MessageListCellView, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringFromArray:](EFPrivacy, "partiallyRedactedStringFromArray:", v7));
      objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
      sub_100392FE8();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView secondaryLabel](self, "secondaryLabel"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = sub_10010B6C8(self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(+[MUISnippetGenerator highlightedSnippetUsingTokens:attributedString:frame:highlighting:error:](MUISnippetGenerator, "highlightedSnippetUsingTokens:attributedString:frame:highlighting:error:", v7, v4, v19, 0, v11, v13, v15, v17));

  }
  else
  {
    v20 = v4;
  }

  return v20;
}

- (void)_updateDateLabelWithDateStyle:(int64_t)a3
{
  _QWORD *v4;
  objc_class *v5;
  UILabel *v6;
  UILabel *dateLabel;
  void *v8;
  void *v9;
  void *v10;

  v4 = UIDateLabel_ptr;
  if (a3)
    v4 = UILabel_ptr;
  v5 = (objc_class *)objc_opt_class(*v4);
  if ((-[UILabel isMemberOfClass:](self->_dateLabel, "isMemberOfClass:", v5) & 1) == 0)
  {
    -[MessageListCellView _resetDateLabel](self, "_resetDateLabel");
    v6 = (UILabel *)objc_alloc_init(v5);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_dateLabel, "setBackgroundColor:", v8);

    -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFont"));
    -[UILabel setFont:](self->_dateLabel, "setFont:", v10);

    -[UILabel setAccessibilityIdentifier:](self->_dateLabel, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellViewDateLabel);
    -[MessageListCellView addSubview:](self, "addSubview:", self->_dateLabel);
  }
}

- (id)_bodyAttributesWithColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  double v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "summaryFont"));

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    LODWORD(v11) = 1.0;
    objc_msgSend(v6, "setHyphenationFactor:", v11);
  }
  v14[0] = NSFontAttributeName;
  v14[1] = NSParagraphStyleAttributeName;
  v15[0] = v8;
  v15[1] = v6;
  v14[2] = NSForegroundColorAttributeName;
  v15[2] = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  return v12;
}

- (void)setViewModel:(id)a3
{
  MessageListCellViewModel *v5;
  NSAttributedString *attributedPrimaryString;
  NSAttributedString *attributedSecondaryString;
  NSString *accessibilitySecondaryLabel;
  NSAttributedString *attributedTertiaryString;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  MessageListCellViewModel *v22;

  v5 = (MessageListCellViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    attributedPrimaryString = self->_attributedPrimaryString;
    self->_attributedPrimaryString = 0;

    attributedSecondaryString = self->_attributedSecondaryString;
    self->_attributedSecondaryString = 0;

    accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
    self->_accessibilitySecondaryLabel = 0;

    attributedTertiaryString = self->_attributedTertiaryString;
    self->_attributedTertiaryString = 0;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellViewModel readLaterDate](v22, "readLaterDate"));
    -[MessageListCellView setRead:](self, "setRead:", -[MessageListCellViewModel isRead](v22, "isRead"));
    -[MessageListCellView setFlagged:](self, "setFlagged:", -[MessageListCellViewModel isFlagged](v22, "isFlagged"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellViewModel flagColors](v22, "flagColors"));
    -[MessageListCellView setFlagColors:](self, "setFlagColors:", v11);

    -[MessageListCellView setNotify:](self, "setNotify:", -[MessageListCellViewModel isNotify](v22, "isNotify"));
    -[MessageListCellView setMute:](self, "setMute:", -[MessageListCellViewModel isMute](v22, "isMute"));
    -[MessageListCellView setReadLaterDate:](self, "setReadLaterDate:", v10);
    -[MessageListCellView setIsReadLater:](self, "setIsReadLater:", v10 != 0);
    v12 = -[MessageListCellViewModel recipientType](v22, "recipientType");
    v13 = 3;
    if (v12 != (id)2)
      v13 = 0;
    if (v12 == (id)1)
      v14 = 2;
    else
      v14 = v13;
    -[MessageListCellView setRecipientLabelType:](self, "setRecipientLabelType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellViewModel sendLaterDate](v22, "sendLaterDate"));

    if (v15)
    {
      v16 = 1;
    }
    else if (v10)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView readLaterDate](self, "readLaterDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellViewModel displayDate](v22, "displayDate"));
      v19 = -[MessageListCellView _hasPastReminderForReadLaterDate:displayDate:](self, "_hasPastReminderForReadLaterDate:displayDate:", v17, v18);

      if (v19)
        v16 = 2;
      else
        v16 = 1;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellViewModel followUp](v22, "followUp"));
      if (objc_msgSend(v20, "isActive"))
      {
        v21 = -[MessageListCellViewModel hideFollowUp](v22, "hideFollowUp");

        if (v21)
          v16 = 0;
        else
          v16 = 3;
      }
      else
      {

        v16 = 0;
      }
    }
    -[MessageListCellView setDateStyle:](self, "setDateStyle:", v16);
    -[MessageListCellView _updateDateLabelWithDateStyle:](self, "_updateDateLabelWithDateStyle:", v16);
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");

    v5 = v22;
  }

}

- (id)_formatTertiaryString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableAttributedString *v9;
  void *v10;
  id v11;
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
  id v24;
  id v26;
  NSAttributedStringKey v27;
  void *v28;

  v26 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "summaryColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v5, v6, v7));

  LODWORD(v6) = -[MessageListCellView hasGeneratedSummary](self, "hasGeneratedSummary");
  v9 = objc_opt_new(NSMutableAttributedString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _bodyAttributesWithColor:](self, "_bodyAttributesWithColor:", v8));
  if ((_DWORD)v6)
  {
    v11 = objc_alloc_init((Class)NSTextAttachment);
    -[MessageListCellView setSummarySymbolTextAttachment:](self, "setSummarySymbolTextAttachment:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "summaryFont"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_imageForSummarySymbolWithFont:](UIImage, "mf_imageForSummarySymbolWithFont:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView summarySymbolTextAttachment](self, "summarySymbolTextAttachment"));
    objc_msgSend(v15, "setImage:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "summarySymbolColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v17, v18, v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView summarySymbolTextAttachment](self, "summarySymbolTextAttachment"));
    v27 = NSForegroundColorAttributeName;
    v28 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:attributes:](NSAttributedString, "attributedStringWithAttachment:attributes:", v21, v22));
    -[NSMutableAttributedString appendAttributedString:](v9, "appendAttributedString:", v23);

  }
  v24 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v26, v10);
  -[NSMutableAttributedString appendAttributedString:](v9, "appendAttributedString:", v24);

  return v9;
}

- (id)_defaultAttributesWithFont:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
  v8 = objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setLineBreakMode:", 4);
  v11[0] = NSFontAttributeName;
  v11[1] = NSParagraphStyleAttributeName;
  v12[0] = v5;
  v12[1] = v8;
  v11[2] = NSForegroundColorAttributeName;
  v12[2] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  return v9;
}

- (id)_highlightedSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hintsBySnippetZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", EMMessageSnippetHintZoneAuthor));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hintsBySnippetZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", EMMessageSnippetHintZoneAuthorEmailAddresses));

  if (_os_feature_enabled_impl("Mail", "SnippetHighlighting")
    && (objc_msgSend(v7, "count") || objc_msgSend(v10, "count")))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MessageListCellView log](MessageListCellView, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringFromArray:](EFPrivacy, "partiallyRedactedStringFromArray:", v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFPrivacy partiallyRedactedStringFromArray:](EFPrivacy, "partiallyRedactedStringFromArray:", v10));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
      v19 = 138412802;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Snippet Hints] Highlighting: %@ and %@ in %@", (uint8_t *)&v19, 0x20u);

    }
    v12 = sub_10010B6C8(self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[MUISnippetGenerator highlightingAuthorTokens:authorEmailTokens:inEmailAttributedString:highlighting:error:](MUISnippetGenerator, "highlightingAuthorTokens:authorEmailTokens:inEmailAttributedString:highlighting:error:", v7, v10, v4, v13, 0));

  }
  else
  {
    v14 = v4;
  }

  return v14;
}

- (BOOL)verifyContentVisibility:(id *)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  NSString *v19;

  v4 = objc_claimAutoreleasedReturnValue(-[MessageListCellView primaryLabel](self, "primaryLabel"));
  if (!v4)
    return 1;
  v5 = (void *)v4;
  while (1)
  {
    if ((objc_msgSend(v5, "isHidden") & 1) != 0)
      goto LABEL_12;
    objc_msgSend(v5, "alpha");
    if (v6 < 0.0)
      v6 = -v6;
    if (v6 < 2.22044605e-16)
    {
LABEL_12:
      v11 = (objc_class *)objc_opt_class(v5);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_msgSend(v5, "isHidden");
      objc_msgSend(v5, "alpha");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unexpectedly hidden (hidden=%d, alpha=%.2f)"), v13, v14, v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError em_internalErrorWithReason:](NSError, "em_internalErrorWithReason:", v16));
      goto LABEL_14;
    }
    v7 = objc_opt_class(UICollectionView);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      goto LABEL_10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (!v8)
      break;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    v5 = (void *)v9;
    if (!v9)
    {
LABEL_10:
      v10 = 1;
      goto LABEL_15;
    }
  }
  v18 = (objc_class *)objc_opt_class(v5);
  v19 = NSStringFromClass(v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is missing its superview"), v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError em_internalErrorWithReason:](NSError, "em_internalErrorWithReason:", v16));
LABEL_14:
  *a3 = v17;

  v10 = 0;
LABEL_15:

  return v10;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIBackgroundConfiguration isEqual:](self->_backgroundConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundConfiguration, a3);
    -[MessageListCellView _resetAttributedStrings](self, "_resetAttributedStrings");
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (LayoutStatusIndicatorInfo)_layoutStatusIndicatorViewsWithChevronRect:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  NSString *v43;
  NSComparisonResult v44;
  void *v45;
  uint64_t i;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  double MidX;
  double v52;
  void *v53;
  float v54;
  NSString *v55;
  _BOOL4 IsAccessibilityCategory;
  void *v57;
  id v58;
  void *v59;
  float v60;
  float v61;
  double v62;
  CGSize v63;
  LayoutStatusIndicatorInfo *result;
  void *v65;
  id v66;
  id v67;
  CGRect v68;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v11 = objc_msgSend(v10, "isVIP");
  v12 = -[MessageListCellView isRead](self, "isRead");
  v13 = objc_msgSend(v10, "isReplied");
  v14 = objc_msgSend(v10, "isBlockedSender");
  v15 = -[MessageListCellView isNotify](self, "isNotify");
  v16 = 2;
  if (!v11)
    v16 = 0;
  LODWORD(v17) = v12 ^ 1;
  if (v10)
    v17 = v17;
  else
    v17 = 0;
  v18 = v16 | v17;
  if (v13)
    v18 |= 8uLL;
  if (v14)
    v18 |= 0x100uLL;
  if (v15)
    v19 = v18 | 0x40;
  else
    v19 = v18;
  if (-[MessageListCellView isReadLater](self, "isReadLater"))
  {
    if (!_os_feature_enabled_impl("Mail", "RemindMeEverywhere")
      || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView readLaterDate](self, "readLaterDate")),
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayDate")),
          v22 = -[MessageListCellView _hasPastReminderForReadLaterDate:displayDate:](self, "_hasPastReminderForReadLaterDate:displayDate:", v20, v21), v21, v20, (v22 & 1) == 0))
    {
      v19 |= 0x200uLL;
    }
  }
  v23 = -[MessageListCellView isMute](self, "isMute");
  v24 = objc_msgSend(v10, "isForwarded");
  v25 = objc_msgSend(v10, "hasAttachments");
  v26 = -[MessageListCellView isFlagged](self, "isFlagged");
  v27 = v19 | 0x80;
  if (!v23)
    v27 = v19;
  if (v24)
    v27 |= 0x10uLL;
  if (v25)
    v27 |= 0x20uLL;
  if (v26)
    v28 = v27 | 4;
  else
    v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView flagColors](self, "flagColors"));
  objc_msgSend(v29, "setFlagColors:", v30);

  objc_msgSend(v29, "setIndicatorOptions:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
  objc_msgSend(v29, "setUseSelectedColors:", objc_msgSend(v31, "useSelectedColorForConfigurationState:backgroundConfiguration:", v32, v33));

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "primaryStatusIndicatorImage"));
  -[MessageListCellView _rectForStatusIndicatorViewsWithPrimaryStatusIndicatorImage:](self, "_rectForStatusIndicatorViewsWithPrimaryStatusIndicatorImage:", v65);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v43 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "preferredContentSizeCategory"));
  v44 = UIContentSizeCategoryCompareToCategory(v43, UIContentSizeCategoryAccessibilityLarge);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
  for (i = 0; i != 3; ++i)
  {
    v67 = 0;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _labelForVerticalPosition:font:](self, "_labelForVerticalPosition:font:", i, &v67));
    v48 = v67;
    v49 = v48;
    if (v47 && v48)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _statusIndicatorVeritcalPositionForLabel:font:shouldAlignWithCenter:](self, "_statusIndicatorVeritcalPositionForLabel:font:shouldAlignWithCenter:", v47, v48, v44 == NSOrderedDescending));
      objc_msgSend(v45, "addObject:", v50);

    }
  }
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  MidX = CGRectGetMidX(v68);
  v52 = 0.0;
  if ((unint64_t)objc_msgSend(v45, "count") >= 2)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndex:", 1));
    objc_msgSend(v53, "floatValue");
    v52 = v54;

  }
  v55 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v55);

  if (IsAccessibilityCategory)
  {
    v66 = 0;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _labelForVerticalPosition:font:](self, "_labelForVerticalPosition:font:", 3, &v66));
    v58 = v66;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _statusIndicatorVeritcalPositionForLabel:font:shouldAlignWithCenter:](self, "_statusIndicatorVeritcalPositionForLabel:font:shouldAlignWithCenter:", v57, v58, v44 == NSOrderedDescending));
    objc_msgSend(v59, "floatValue");
    v61 = v60;
    v62 = v60;

    if (v61 > 0.0)
      v52 = v62;

  }
  v63.width = NAN;
  v63.height = NAN;
  retstr->var0.origin = (CGPoint)v63;
  retstr->var0.size = v63;
  retstr->var1 = 0xAAAAAAAAAAAAAAAALL;
  if (v29)
  {
    objc_msgSend(v29, "layoutStatusIndicatorViewsInRect:contentView:verticalPositions:avatarVerticalPostions:horizontalPoint:shouldAlignWithCenter:", self, v45, 0, v44 == NSOrderedDescending, v35, v37, v39, v41, MidX, v52);
  }
  else
  {
    retstr->var1 = 0;
    retstr->var0.origin = 0u;
    retstr->var0.size = 0u;
  }

  return result;
}

- (id)_statusIndicatorVeritcalPositionForLabel:(id)a3 font:(id)a4 shouldAlignWithCenter:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  _UNKNOWN **v11;
  uint64_t v12;
  double MinY;
  double v17;
  double v18;
  double v19;
  __n128 v20;
  double v21;
  __n128 v22;
  unint64_t v23;
  double v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = &off_100541800;
  if (v8 && v9)
  {
    objc_msgSend(v8, "frame");
    if (v5)
    {
      MinY = CGRectGetMinY(*(CGRect *)&v12);
      objc_msgSend(v8, "_firstBaselineOffsetFromTop");
      v18 = v17;
      objc_msgSend(v10, "capHeight");
      v20.n128_f64[0] = v19 * 0.5;
      v21 = UIRoundToViewScale(self, v20);
      v22.n128_f64[0] = MinY + v18;
    }
    else
    {
      objc_msgSend(v10, "mf_baselinePointFromOriginPoint:");
      v22.n128_u64[0] = v23;
      v21 = 0.0;
    }
    v24 = UIRoundToViewScale(self, v22) - v21;
    *(float *)&v24 = v24;
    v11 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24));
  }

  return v11;
}

- (id)_labelForVerticalPosition:(unint64_t)a3 font:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  void *v21;
  NSString *v22;
  _BOOL4 IsAccessibilityCategory;
  void *v24;
  uint64_t v25;
  id v26;
  id *v28;
  id v29;
  id v30;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView secondaryLabel](self, "secondaryLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView tertiaryLabel](self, "tertiaryLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subjectFont"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "summaryFont"));
  v28 = a4;
  v12 = -[MessageListCellView _isLabelValid:](self, "_isLabelValid:", v8);
  if (v12)
    v13 = v8;
  else
    v13 = v9;
  if (v12)
    v14 = v10;
  else
    v14 = v11;
  if (v12)
    v15 = v9;
  else
    v15 = v8;
  if (v12)
    v16 = v11;
  else
    v16 = v10;
  v30 = v13;
  v29 = v14;
  v17 = v15;
  v18 = v16;
  if (!-[MessageListCellView _isLabelValid:](self, "_isLabelValid:", v17))
  {

    v17 = 0;
    v18 = 0;
  }
  switch(a3)
  {
    case 0uLL:
      v19 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView primaryLabel](self, "primaryLabel"));
      if (v28)
        *v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressFont"));
      break;
    case 1uLL:
      v19 = v30;
      v20 = v28;
      if (v28)
      {
        v21 = v29;
        goto LABEL_22;
      }
      break;
    case 2uLL:
      v19 = v17;
      v20 = v28;
      if (v28)
      {
        v21 = v18;
LABEL_22:
        *v20 = objc_retainAutorelease(v21);
      }
      break;
    case 3uLL:
      v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

      if (!IsAccessibilityCategory)
        goto LABEL_30;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView dateLabel](self, "dateLabel"));
      if (!-[MessageListCellView _isLabelValid:](self, "_isLabelValid:", v24))
      {

        goto LABEL_30;
      }
      v25 = objc_claimAutoreleasedReturnValue(-[MessageListCellView dateLabel](self, "dateLabel"));

      if (v28 && v25)
        *v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateFont"));
      v19 = (id)v25;
      break;
    default:
LABEL_30:
      v19 = 0;
      break;
  }
  v26 = v19;

  return v26;
}

- (BOOL)_isLabelValid:(id)a3
{
  id v3;
  double v4;
  _BOOL4 v5;
  CGRect v7;
  CGRect v8;

  v3 = a3;
  objc_msgSend(v3, "alpha");
  if (v4 <= 0.0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v3, "frame");
    v8.origin.x = CGRectZero.origin.x;
    v8.origin.y = CGRectZero.origin.y;
    v8.size.width = CGRectZero.size.width;
    v8.size.height = CGRectZero.size.height;
    v5 = !CGRectEqualToRect(v7, v8);
  }

  return v5;
}

- (MessageListCellLabel)tertiaryLabel
{
  void *v3;
  uint64_t v4;
  MessageListCellLabel *tertiaryLabel;
  BOOL v6;
  double v7;
  MessageListCellLabel *v8;
  MessageListCellLabel *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v4 = (uint64_t)objc_msgSend(v3, "linesOfSummaryForCompactHeight:", self->_compact);

  tertiaryLabel = self->_tertiaryLabel;
  if (tertiaryLabel)
    v6 = 1;
  else
    v6 = v4 < 1;
  if (v6)
  {
    if (v4)
      v7 = 1.0;
    else
      v7 = 0.0;
    -[MessageListCellLabel mf_setAlpha:](tertiaryLabel, "mf_setAlpha:", v7);
  }
  else
  {
    v8 = (MessageListCellLabel *)objc_alloc_init((Class)MessageListCellLabel);
    v9 = self->_tertiaryLabel;
    self->_tertiaryLabel = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MessageListCellLabel setBackgroundColor:](self->_tertiaryLabel, "setBackgroundColor:", v10);

    -[MessageListCellLabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellViewSummaryLabel);
    -[MessageListCellView addSubview:](self, "addSubview:", self->_tertiaryLabel);
  }
  return self->_tertiaryLabel;
}

- (MessageListCellLabel)secondaryLabel
{
  MessageListCellLabel *secondaryLabel;
  MessageListCellLabel *v4;
  MessageListCellLabel *v5;
  void *v6;
  void *v7;

  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    v4 = (MessageListCellLabel *)objc_alloc_init((Class)MessageListCellLabel);
    v5 = self->_secondaryLabel;
    self->_secondaryLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MessageListCellLabel setBackgroundColor:](self->_secondaryLabel, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    -[MessageListCellLabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", objc_msgSend(v7, "subjectNumberOfLines"));

    -[MessageListCellLabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellViewSubjectLabel);
    -[MessageListCellView addSubview:](self, "addSubview:", self->_secondaryLabel);
    secondaryLabel = self->_secondaryLabel;
  }
  return secondaryLabel;
}

- (UICellConfigurationState)configurationState
{
  return self->_configurationState;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  return self->_backgroundConfiguration;
}

- (MessageListStatusIndicatorManager)statusIndicatorManager
{
  MessageListStatusIndicatorManager *statusIndicatorManager;
  MessageListStatusIndicatorManager *v4;
  MessageListStatusIndicatorManager *v5;

  statusIndicatorManager = self->_statusIndicatorManager;
  if (!statusIndicatorManager)
  {
    v4 = objc_alloc_init(MessageListStatusIndicatorManager);
    v5 = self->_statusIndicatorManager;
    self->_statusIndicatorManager = v4;

    statusIndicatorManager = self->_statusIndicatorManager;
  }
  return statusIndicatorManager;
}

- (void)layoutSubviews
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  NSString *v9;
  void *v10;
  unsigned int v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t recipientLabelType;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  _QWORD *v70;
  int v71;
  unsigned int v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  __n128 v102;
  __n128 v103;
  __n128 v104;
  __n128 v105;
  void *v106;
  void *v107;
  BOOL v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  NSString *v113;
  _BOOL4 v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CGSize v129;
  void *v130;
  void *v131;
  unsigned int v132;
  id v133;
  id v134;
  _BOOL4 IsAccessibilityCategory;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  CGRect v147;
  _QWORD v148[4];
  char v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  objc_super v154;
  _BYTE v155[128];
  CGRect v156;

  v154.receiver = self;
  v154.super_class = (Class)MessageListCellView;
  -[MessageListCellView layoutSubviews](&v154, "layoutSubviews");
  -[MessageListCellView _layoutDisclosureButton](self, "_layoutDisclosureButton");
  if (-[MessageListCellView isEditing](self, "isEditing"))
  {
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusIndicatorViews"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v150, v155, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v151;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v151 != v7)
            objc_enumerationMutation(v5);
          -[MessageListCellView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)i));
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v150, v155, 16);
      }
      while (v6);
    }

  }
  -[MessageListCellView _recalculateAttributedStrings](self, "_recalculateAttributedStrings");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _dateForViewModel:](self, "_dateForViewModel:", v10));
  if (-[MessageListCellView isSelected](self, "isSelected"))
    v11 = 1;
  else
    v11 = -[MessageListCellView isHighlighted](self, "isHighlighted");
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView dateLabel](self, "dateLabel"));
  switch(-[MessageListCellView dateStyle](self, "dateStyle"))
  {
    case 0:
      objc_msgSend(v144, "timeIntervalSince1970");
      objc_msgSend(v146, "setTimeInterval:", v12 + -978307200.0);
      break;
    case 1:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter ef_formatDate:style:](NSDateFormatter, "ef_formatDate:style:", v144, 2));
      objc_msgSend(v146, "setText:", v15);
      goto LABEL_24;
    case 2:
      if (v11)
        v13 = sub_10010ABB8((uint64_t)MessageListCellView);
      else
        v13 = sub_10010AB00((uint64_t)MessageListCellView);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v146, "_setTextEncapsulation:", v16);

      v17 = _EFLocalizedString(CFSTR("REMIND ME"), &unk_10059D2A0, &unk_10059D2A8);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
      objc_msgSend(v146, "setText:", v15);
      goto LABEL_24;
    case 3:
      if (v11)
        v14 = sub_10010ABB8((uint64_t)MessageListCellView);
      else
        v14 = sub_10010AB00((uint64_t)MessageListCellView);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v146, "_setTextEncapsulation:", v18);

      v19 = _EFLocalizedString(CFSTR("FOLLOW UP"), &unk_10059D2A0, &unk_10059D2A8);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v146, "setText:", v15);
LABEL_24:

      break;
    default:
      break;
  }
  v20 = -[MessageListCellView dateStyle](self, "dateStyle");
  if (v144 || (v21 = 0.0, (v20 & 0xFFFFFFFFFFFFFFFELL) == 2))
  {
    v22 = !IsAccessibilityCategory || objc_msgSend(v10, "style") != (id)2;
    v21 = (double)v22;
  }
  objc_msgSend(v146, "mf_setAlpha:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v24, v25, v26));
  objc_msgSend(v146, "setTextColor:", v27);

  if (_os_feature_enabled_impl("Mail", "SnippetHighlighting"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hintsBySnippetZone"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", EMMessageSnippetHintZoneAuthor));
    if (objc_msgSend(v29, "count"))
    {

    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hintsBySnippetZone"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", EMMessageSnippetHintZoneAuthorEmailAddresses));
      v32 = objc_msgSend(v31, "count") == 0;

      if (v32)
        goto LABEL_36;
    }
    -[MessageListCellView _recalculatePrimaryAttributedStringShouldRehighlight:](self, "_recalculatePrimaryAttributedStringShouldRehighlight:", 1);
  }
LABEL_36:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView attributedPrimaryString](self, "attributedPrimaryString"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView primaryLabel](self, "primaryLabel"));
  objc_msgSend(v34, "setAttributedText:", v33);

  v145 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView secondaryLabel](self, "secondaryLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  LODWORD(v33) = objc_msgSend(v35, "isSubjectVisible");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView attributedSecondaryString](self, "attributedSecondaryString"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView accessibilitySecondaryLabel](self, "accessibilitySecondaryLabel"));
  sub_100036D70((uint64_t)self, v145, (int)v33, v36, v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView recipientLabelImageView](self, "recipientLabelImageView"));
  if (-[MessageListCellView recipientLabelType](self, "recipientLabelType"))
  {
    objc_msgSend(v38, "mf_setAlpha:", 1.0);
    recipientLabelType = self->_recipientLabelType;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView traitCollection](self, "traitCollection"));
    v41 = sub_10010B62C(recipientLabelType, (uint64_t)objc_msgSend(v40, "userInterfaceStyle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "imageWithRenderingMode:", 2));
    objc_msgSend(v38, "setImage:", v43);

    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recipientColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v44, v36, v45));
    objc_msgSend(v38, "setTintColor:", v46);

  }
  else
  {
    objc_msgSend(v38, "mf_setAlpha:", 0.0);
  }
  if ((id)-[MessageListCellView chevronType](self, "chevronType") == (id)1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView chevron](self, "chevron"));
    objc_msgSend(v2, "mf_setAlpha:", 1.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_imageForChevronType:](UIImage, "mf_imageForChevronType:", 1));
    objc_msgSend(v2, "setImage:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_symbolConfigurationForView:](UIImage, "mf_symbolConfigurationForView:", 9));
    objc_msgSend(v2, "setPreferredSymbolConfiguration:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    objc_msgSend(v2, "setTintColor:", v49);

  }
  else
  {
    -[UIImageView mf_setAlpha:](self->_chevron, "mf_setAlpha:", 0.0);
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  objc_msgSend(v50, "padding");
  v55 = MFEdgeInsetsFromDirectionalEdgeInsets(-[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"), v51, v52, v53, v54);
  v57 = v56;
  v59 = v58;
  v61 = v60;

  -[MessageListCellView bounds](self, "bounds");
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472;
  v148[2] = sub_1000369E4;
  v148[3] = &unk_10051F010;
  v149 = v11;
  v70 = objc_retainBlock(v148);
  v71 = _os_feature_enabled_impl("Mail", "SnippetHighlighting");
  if (v71)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hintsBySnippetZone"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", EMMessageSnippetHintZoneTextContent));
    if (objc_msgSend(v36, "count"))
    {

LABEL_52:
      -[MessageListCellView _recalculateTertiaryAttributedStringShouldRehighlight:](self, "_recalculateTertiaryAttributedStringShouldRehighlight:", 1);
      goto LABEL_53;
    }
  }
  if (_os_feature_enabled_impl("Mail", "CatchUp") && EMIsGreymatterAvailableWithOverride())
  {
    v72 = -[MessageListCellView hasGeneratedSummary](self, "hasGeneratedSummary");
    if (!v71)
      goto LABEL_48;
LABEL_51:

    if ((v72 & 1) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
  v72 = 0;
  if (v71)
    goto LABEL_51;
LABEL_48:
  if (v72)
    goto LABEL_52;
LABEL_53:
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView tertiaryLabel](self, "tertiaryLabel"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView attributedTertiaryString](self, "attributedTertiaryString"));
  objc_msgSend(v73, "setAttributedText:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "text"));
  v76 = objc_msgSend(v75, "_isNaturallyRTL");

  if (v76)
    v77 = 2;
  else
    v77 = 0;
  objc_msgSend(v73, "setTextAlignment:", v77);
  v78 = v57 + v63;
  v79 = v55 + v65;
  v80 = v67 - (v57 + v61);
  v81 = v69 - (v55 + v59);
  -[MessageListCellView _rectForSummaryWithBounds:](self, "_rectForSummaryWithBounds:", v78, v79, v80, v81);
  ((void (*)(_QWORD *, void *))v70[2])(v70, v73);
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView primaryLabel](self, "primaryLabel"));
  -[MessageListCellView _rectForAddressWithBounds:](self, "_rectForAddressWithBounds:", v78, v79, v80, v81);
  v84 = v83;
  v86 = v85;
  v88 = v87;
  v90 = v89;
  ((void (*)(_QWORD *, void *))v70[2])(v70, v82);
  v136 = v84;
  v137 = v86;
  v138 = v88;
  v139 = v90;
  -[MessageListCellView _rectForChevronWithBounds:addressRect:](self, "_rectForChevronWithBounds:addressRect:", v78, v79, v80, v81, v84, v86, v88, v90);
  v92 = v91;
  v94 = v93;
  v96 = v95;
  v98 = v97;
  if (self->_chevronType == 2)
  {
    -[MessageListCellView _setupDisclosureButtonImageIfNecessary](self, "_setupDisclosureButtonImageIfNecessary");
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
    -[MessageListCellView addSubview:](self, "addSubview:", v99);

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
    objc_msgSend(v100, "setFrame:", v92, v94, v96, v98);

    -[MessageListCellView _layoutChevronForDisclosureStateAnimated:](self, "_layoutChevronForDisclosureStateAnimated:", 0);
  }
  else
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
    objc_msgSend(v101, "removeFromSuperview");

  }
  ((void (*)(_QWORD *, UIImageView *, double, double, double, double))v70[2])(v70, self->_chevron, v92, v94, v96, v98);
  -[MessageListCellView _rectForDateWithBounds:chevronRect:](self, "_rectForDateWithBounds:chevronRect:", v78, v79, v80, v81, v92, v94, v96, v98);
  v142 = v103.n128_f64[0];
  v143 = v102.n128_f64[0];
  v140 = v105.n128_f64[0];
  v141 = v104.n128_f64[0];
  ((void (*)(_QWORD *, void *, __n128, __n128, __n128, __n128))v70[2])(v70, v146, v102, v103, v104, v105);
  -[MessageListCellView _rectForSubjectWithBounds:](self, "_rectForSubjectWithBounds:", v78, v79, v80, v81);
  ((void (*)(_QWORD *, void *))v70[2])(v70, v145);
  -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", v78, v79, v80, v81);
  ((void (*)(_QWORD *, void *))v70[2])(v70, v38);
  if (_os_feature_enabled_impl("Mail", "SnippetHighlighting"))
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hintsBySnippetZone"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectForKeyedSubscript:", EMMessageSnippetHintZoneSubject));
    v108 = objc_msgSend(v107, "count") == 0;

    if (!v108)
    {
      -[MessageListCellView _recalculateSecondaryAttributedStringShouldRehighlight:](self, "_recalculateSecondaryAttributedStringShouldRehighlight:", 1);
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
      v110 = objc_msgSend(v109, "isSubjectVisible");
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView attributedSecondaryString](self, "attributedSecondaryString"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView accessibilitySecondaryLabel](self, "accessibilitySecondaryLabel"));
      sub_100036D70((uint64_t)self, v145, v110, v111, v112);

    }
  }
  v113 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  v114 = UIContentSizeCategoryIsAccessibilityCategory(v113);

  if (v114)
  {
    -[MessageListCellView _adjustRect:forTrailingRect:padding:](self, "_adjustRect:forTrailingRect:padding:", v136, v137, v138, v139, v92, v94, v96, v98, 0x4024000000000000);
    v116 = v115;
    v118 = v117;
    v120 = v119;
    v122 = v121;
  }
  else
  {
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    objc_msgSend(v123, "horizontalSpacing");
    -[MessageListCellView _adjustRect:forTrailingRect:padding:](self, "_adjustRect:forTrailingRect:padding:", v136, v137, v138, v139, v143, v142, v141, v140, v124);
    v116 = v125;
    v118 = v126;
    v120 = v127;
    v122 = v128;

  }
  ((void (*)(_QWORD *, void *, double, double, double, double))v70[2])(v70, v82, v116, v118, v120, v122);
  v129.width = NAN;
  v129.height = NAN;
  v147.origin = (CGPoint)v129;
  v147.size = v129;
  -[MessageListCellView _layoutStatusIndicatorViews](self, "_layoutStatusIndicatorViews");
  v156.origin.x = CGRectZero.origin.x;
  v156.origin.y = CGRectZero.origin.y;
  v156.size.width = CGRectZero.size.width;
  v156.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v147, v156))
    goto LABEL_66;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView secondaryLabel](self, "secondaryLabel"));
  v132 = -[MessageListCellView _isLabelValid:](self, "_isLabelValid:", v131);

  if (v132)
  {
    if (IsAccessibilityCategory)
      goto LABEL_66;
    v133 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView secondaryLabel](self, "secondaryLabel"));
  }
  else
  {
    if (!-[MessageListCellView _isLabelValid:](self, "_isLabelValid:", v73))
      goto LABEL_66;
    v133 = v73;
  }
  v134 = v133;
  if (v133)
  {
    objc_msgSend(v133, "frame");
    -[MessageListCellView _adjustRect:forTrailingRect:padding:](self, "_adjustRect:forTrailingRect:padding:", 0x4030000000000000);
    ((void (*)(_QWORD *, id))v70[2])(v70, v134);
    v130 = v134;
    goto LABEL_67;
  }
LABEL_66:
  v130 = 0;
LABEL_67:
  -[MessageListCellView mf_activateDebugModeIfEnabled](self, "mf_activateDebugModeIfEnabled");

}

- (MessageListCellLayoutValues)layoutValues
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValuesHelper](self, "layoutValuesHelper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutValuesForStyle:", objc_msgSend(v4, "style")));

  return (MessageListCellLayoutValues *)v5;
}

- (MessageListCellViewModel)viewModel
{
  return self->_viewModel;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (MessageListCellLabel)primaryLabel
{
  MessageListCellLabel *primaryLabel;
  MessageListCellLabel *v4;
  MessageListCellLabel *v5;
  void *v6;

  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    v4 = (MessageListCellLabel *)objc_alloc_init((Class)MessageListCellLabel);
    v5 = self->_primaryLabel;
    self->_primaryLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MessageListCellLabel setBackgroundColor:](self->_primaryLabel, "setBackgroundColor:", v6);

    -[MessageListCellLabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellViewAddressLabel);
    -[MessageListCellView addSubview:](self, "addSubview:", self->_primaryLabel);
    primaryLabel = self->_primaryLabel;
  }
  return primaryLabel;
}

- (int64_t)dateStyle
{
  return self->_dateStyle;
}

- (UIListContentConfiguration)contentConfiguration
{
  return self->_contentConfiguration;
}

- (int64_t)recipientLabelType
{
  return self->_recipientLabelType;
}

- (UIImageView)recipientLabelImageView
{
  UIImageView *recipientLabelImageView;
  UIImageView *v4;
  UIImageView *v5;

  recipientLabelImageView = self->_recipientLabelImageView;
  if (!recipientLabelImageView)
  {
    if (self->_recipientLabelType)
    {
      v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      v5 = self->_recipientLabelImageView;
      self->_recipientLabelImageView = v4;

      -[UIImageView setAccessibilityIdentifier:](self->_recipientLabelImageView, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellViewRecipientImageView);
      -[MessageListCellView addSubview:](self, "addSubview:", self->_recipientLabelImageView);
      recipientLabelImageView = self->_recipientLabelImageView;
    }
    else
    {
      recipientLabelImageView = 0;
    }
  }
  return recipientLabelImageView;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isRead
{
  return self->_read;
}

- (BOOL)isReadLater
{
  return self->_isReadLater;
}

- (BOOL)isNotify
{
  return self->_notify;
}

- (BOOL)isMute
{
  return self->_mute;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isFlagged
{
  return self->_flagged;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (UIButton)disclosureButton
{
  UIButton *disclosureButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;

  disclosureButton = self->_disclosureButton;
  if (!disclosureButton)
  {
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v5 = self->_disclosureButton;
    self->_disclosureButton = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIButton setBackgroundColor:](self->_disclosureButton, "setBackgroundColor:", v6);

    -[UIButton setAccessibilityIdentifier:](self->_disclosureButton, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageCellViewDisclosureButton);
    disclosureButton = self->_disclosureButton;
  }
  return disclosureButton;
}

- (UILabel)dateLabel
{
  UILabel *dateLabel;

  dateLabel = self->_dateLabel;
  if (!dateLabel)
  {
    -[MessageListCellView _updateDateLabelWithDateStyle:](self, "_updateDateLabelWithDateStyle:", -[MessageListCellView dateStyle](self, "dateStyle"));
    dateLabel = self->_dateLabel;
  }
  return dateLabel;
}

- (NSAttributedString)attributedTertiaryString
{
  return self->_attributedTertiaryString;
}

- (NSAttributedString)attributedSecondaryString
{
  return self->_attributedSecondaryString;
}

- (NSAttributedString)attributedPrimaryString
{
  return self->_attributedPrimaryString;
}

- (NSString)accessibilitySecondaryLabel
{
  return self->_accessibilitySecondaryLabel;
}

- (CGRect)_rectForSummaryWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  NSString *v22;
  _BOOL4 IsAccessibilityCategory;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __n128 v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v10 = (uint64_t)objc_msgSend(v9, "linesOfSummaryForCompactHeight:", self->_compact);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView summary](self, "summary"));
  if (v10 < 1)
  {
    v27 = CGRectZero.origin.x;
    v29 = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    v34 = CGRectZero.size.height;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "summaryFont"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    objc_msgSend(v14, "addressAndSubjectHeight");
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    objc_msgSend(v17, "bodyLeading");
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
    v21 = objc_msgSend(v20, "style");

    v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

    if (v21 != (id)2 && IsAccessibilityCategory)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
      -[MessageListCellView bounds](self, "bounds");
      v10 = (uint64_t)objc_msgSend(v25, "actualLineCountForSummary:bounds:", v11);

    }
    objc_msgSend(v13, "mf_originPointFromBaselinePoint:", x, y + v16 + v19);
    v27 = v26;
    v29 = v28;
    objc_msgSend(v13, "_bodyLeading");
    v31 = v30;
    objc_msgSend(v13, "descender");
    v33.n128_f64[0] = -(v32 - (double)v10 * v31);
    v34 = UIRoundToViewScale(self, v33);
    if (v21 == (id)2)
    {
      if (-[MessageListCellView recipientLabelType](self, "recipientLabelType"))
      {
        -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", x, y, width, height);
        v35 = v50.origin.x;
        v36 = v50.origin.y;
        v37 = v50.size.width;
        v38 = v50.size.height;
        width = width - (CGRectGetWidth(v50) + 2.5);
        if ((v8 & 1) == 0)
        {
          v51.origin.x = v35;
          v51.origin.y = v36;
          v51.size.width = v37;
          v51.size.height = v38;
          v27 = CGRectGetMaxX(v51) + 2.5;
        }
      }
    }

  }
  v39 = MFIntegralRectToViewScale(self, v27, v29, width, v34);
  v41 = v40;
  v43 = v42;
  v45 = v44;

  v46 = v39;
  v47 = v41;
  v48 = v43;
  v49 = v45;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (CGRect)_rectForSubjectWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  unsigned __int8 v9;
  unsigned int v10;
  double left;
  double right;
  unsigned int v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  double v29;
  __n128 v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect v43;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v9 = objc_msgSend(v8, "isSubjectVisible");

  if ((v9 & 1) != 0)
  {
    v10 = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
    left = UIEdgeInsetsZero.left;
    right = UIEdgeInsetsZero.right;
    if (self->_recipientLabelType)
    {
      v13 = v10;
      -[MessageListCellView _rectForRecipientLabelWithBounds:](self, "_rectForRecipientLabelWithBounds:", x, y, width, height);
      v14 = CGRectGetWidth(v43) + 2.5;
      if (v13)
        v15 = v14;
      else
        v15 = -0.0;
      right = right + v15;
      if (v13)
        v14 = -0.0;
      left = left + v14;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    objc_msgSend(v16, "addressAndSubjectHeight");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subjectFont"));

    objc_msgSend(v20, "mf_originPointFromBaselinePoint:", x + left, y + UIEdgeInsetsZero.top + v18);
    v22 = v21;
    v24 = v23;
    objc_msgSend(v20, "lineHeight");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v28 = objc_msgSend(v27, "subjectNumberOfLines");
    objc_msgSend(v20, "descender");
    v30.n128_f64[0] = -(v29 - v26 * (double)(uint64_t)v28);
    v31 = UIRoundToViewScale(self, v30);

    v32 = MFIntegralRectToViewScale(self, v22, v24, width - (right + left), v31);
    v34 = v33;
    v36 = v35;
    v38 = v37;

  }
  else
  {
    v32 = CGRectZero.origin.x;
    v34 = CGRectZero.origin.y;
    v36 = CGRectZero.size.width;
    v38 = CGRectZero.size.height;
  }
  v39 = v32;
  v40 = v34;
  v41 = v36;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)_rectForStatusIndicatorViewsWithPrimaryStatusIndicatorImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  __n128 v13;
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
  CGRect v25;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressFont"));
  -[MessageListCellLabel frame](self->_primaryLabel, "frame");
  objc_msgSend(v6, "mf_baselinePointFromOriginPoint:");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressFont"));
  objc_msgSend(v9, "capHeight");
  v11 = v10;

  objc_msgSend(v4, "size");
  v13.n128_f64[0] = v8 - v11 + (v11 - v12) * 0.5;
  UIRoundToViewScale(self, v13);
  UIRectInset(-[MessageListCellView bounds](self, "bounds"));
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "padding");
  v19 = v18;
  v20 = 0.0;
  if (-[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))
  {
    -[MessageListCellView bounds](self, "bounds");
    v20 = CGRectGetMaxX(v25) - v19;
  }

  v21 = v20;
  v22 = v15;
  v23 = v19;
  v24 = v17;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)_originForChevronBoxWithBounds:(CGRect)a3 addressRect:(CGRect)a4 sizeForChevron:(CGSize)a5
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat v9;
  CGFloat v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  unsigned int v21;
  double v22;
  double MaxX;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;
  CGRect v31;
  CGRect v32;

  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  width = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues", *(_QWORD *)&a5.width, *(_QWORD *)&a5.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addressFont"));

  objc_msgSend(v13, "mf_baselinePointFromOriginPoint:", x, y);
  v15 = v14;
  v16 = objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16, "addressFont"));
  objc_msgSend(v17, "capHeight");
  v19 = v18;

  LOBYTE(v16) = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView traitCollection](self, "traitCollection"));
  v21 = objc_msgSend(v20, "mf_useSplitViewStyling");

  if ((v16 & 1) != 0)
  {
    v31.origin.x = v10;
    v31.origin.y = v9;
    v31.size.width = width;
    v31.size.height = height;
    v22 = CGRectGetMinX(v31) + v28 * 0.5 * -0.5;
  }
  else
  {
    v32.origin.x = v10;
    v32.origin.y = v9;
    v32.size.width = width;
    v32.size.height = height;
    MaxX = CGRectGetMaxX(v32);
    if (v21)
      v24 = v28;
    else
      v24 = v28 * 0.5;
    v22 = MaxX - v24;
  }
  v25 = round(v22);

  v26 = v25;
  v27 = round(v15 - v19 * 0.5 - v29 * 0.5);
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGRect)_rectForRecipientLabelWithBounds:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  int64_t recipientLabelType;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double MaxX;
  double v19;
  void *v20;
  double MinY;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  recipientLabelType = self->_recipientLabelType;
  if (recipientLabelType)
  {
    v9 = a3.size.height;
    v10 = a3.size.width;
    v11 = a3.origin.y;
    v12 = a3.origin.x;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView traitCollection](self, "traitCollection"));
    v14 = sub_10010B62C(recipientLabelType, (uint64_t)objc_msgSend(v13, "userInterfaceStyle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15)
    {
      objc_msgSend(v15, "size");
      width = v16;
      height = v17;
      x = v12;
      if (-[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))
      {
        v32.origin.x = v12;
        v32.origin.y = v11;
        v32.size.width = v10;
        v32.size.height = v9;
        MaxX = CGRectGetMaxX(v32);
        objc_msgSend(v15, "size");
        x = MaxX - v19;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _baselineLabelForIndicator](self, "_baselineLabelForIndicator"));
      objc_msgSend(v20, "frame");
      MinY = CGRectGetMinY(v33);
      objc_msgSend(v20, "_firstBaselineOffsetFromTop");
      v23 = v22;
      v34.origin.x = x;
      v34.origin.y = v11;
      v34.size.width = width;
      v34.size.height = height;
      v24 = CGRectGetHeight(v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "font"));
      objc_msgSend(v25, "capHeight");
      v27 = v26;
      v35.origin.x = x;
      v35.origin.y = v11;
      v35.size.width = width;
      v35.size.height = height;
      y = MinY + v23 - (v24 + (v27 - CGRectGetHeight(v35)) * 0.5);

    }
  }
  v28 = MFIntegralRectToViewScale(self, x, y, width, height);
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_rectForDateWithBounds:(CGRect)a3 chevronRect:(CGRect)a4
{
  CGFloat height;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned __int8 v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinX;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MaxX;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat rect;
  CGFloat y;
  CGFloat width;
  CGRect v35;
  CGRect v36;
  CGRect result;

  height = a4.size.height;
  y = a4.origin.y;
  width = a4.size.width;
  x = a4.origin.x;
  v6 = a3.size.height;
  v7 = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  v11 = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", v7, v6);
  v15 = v14;
  v17 = v16;
  if (IsAccessibilityCategory)
  {
    -[MessageListCellView _dateOriginUnderSummary:](self, "_dateOriginUnderSummary:", v9, v8, v7, v6);
    v19 = v18;
    if ((v11 & 1) != 0)
    {
LABEL_3:
      v35.origin.x = v9;
      v35.origin.y = v8;
      v35.size.width = v7;
      v35.size.height = v6;
      MinX = CGRectGetMaxX(v35) - v15;
      goto LABEL_13;
    }
LABEL_10:
    v36.origin.x = v9;
    v36.origin.y = v8;
    v36.size.width = v7;
    v36.size.height = v6;
    MinX = CGRectGetMinX(v36);
    goto LABEL_13;
  }
  rect = height;
  -[MessageListCellView _dateOriginAlignedWithAddressBaselineForBounds:](self, "_dateOriginAlignedWithAddressBaselineForBounds:", v9, v8, v7, v6);
  v19 = v21;
  if (!self->_chevronType || -[MessageListCellView isEditing](self, "isEditing") && self->_chevronType != 2)
  {
    if ((v11 & 1) == 0)
      goto LABEL_3;
    goto LABEL_10;
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = rect;
  if ((v11 & 1) != 0)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    v27 = 6.0;
  }
  else
  {
    MaxX = CGRectGetMinX(*(CGRect *)&v22) - v15;
    v27 = -6.0;
  }
  MinX = MaxX + v27;
LABEL_13:
  v28 = MFIntegralRectToViewScale(self, MinX, v19, v15, v17);
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_rectForChevronWithBounds:(CGRect)a3 addressRect:(CGRect)a4
{
  CGFloat x;
  double y;
  CGFloat height;
  CGFloat width;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  unsigned __int8 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  if (self->_chevronType)
  {
    height = a4.size.height;
    width = a4.size.width;
    v8 = a4.origin.y;
    v9 = a4.origin.x;
    v10 = a3.size.height;
    v11 = a3.size.width;
    v38 = a3.origin.x;
    v35 = a3.origin.y;
    v13 = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
    v36 = v8;
    v37 = v9;
    if (-[MessageListCellView swiped](self, "swiped")
      || !-[MessageListCellView isEditing](self, "isEditing")
      || (id)-[MessageListCellView chevronType](self, "chevronType") == (id)2)
    {
      v14 = width;
      v15 = height;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_imageForChevronType:](UIImage, "mf_imageForChevronType:", 2));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
      objc_msgSend(v31, "padding");
      v34 = v32;

      objc_msgSend(v30, "size");
      if ((v13 & 1) != 0)
        v38 = v38 - (v34 + v33);
      else
        v11 = v11 + v34 + v33;
      v14 = width;
      v15 = height;

    }
    -[MessageListCellView _sizeForChevron](self, "_sizeForChevron");
    v17 = v16;
    v19 = v18;
    v20 = -[MessageListCellView _rectForChevronBoxWithBounds:addressRect:type:](self, "_rectForChevronBoxWithBounds:addressRect:type:", -[MessageListCellView chevronType](self, "chevronType"), v38, v35, v11, v10, v37, v36, v14, v15);
    x = UIRectCenteredIntegralRect(v20, CGRectZero.origin.x, y, v17, v19, v21, v22, v23, v24);
    y = v27;
  }
  else
  {
    v25 = CGRectZero.size.width;
    v26 = CGRectZero.size.height;
  }
  v28 = x;
  v29 = y;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_rectForAddressWithBounds:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
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
  __n128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  objc_msgSend(v4, "horizontalSpacing");

  v6 = UIRectInset(v5);
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressFont"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  objc_msgSend(v13, "addressCapHeight");
  v15 = v8 + v14;

  objc_msgSend(v12, "mf_originPointFromBaselinePoint:", v6, v15);
  v17 = v16;
  v19 = v18;
  objc_msgSend(v12, "lineHeight");
  v21 = v20;
  objc_msgSend(v12, "descender");
  v23.n128_f64[0] = v21 - v22;
  v24 = UIRoundToViewScale(self, v23);
  v25 = MFIntegralRectToViewScale(self, v17, v19, v10, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)_recalculateTertiaryAttributedString
{
  -[MessageListCellView _recalculateTertiaryAttributedStringShouldRehighlight:](self, "_recalculateTertiaryAttributedStringShouldRehighlight:", 0);
}

- (void)_recalculateTertiaryAttributedStringShouldRehighlight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  NSAttributedString *v10;
  NSAttributedString *attributedTertiaryString;
  void *v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView summary](self, "summary"));
  v6 = v5;
  if (self->_attributedTertiaryString)
    v7 = 1;
  else
    v7 = v5 == 0;
  v12 = v5;
  if (!v7 || (v8 = objc_msgSend(v5, "length"), v6 = v12, v8) && v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _formatTertiaryString:](self, "_formatTertiaryString:", v6));
    v10 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _highlightedSummarySnippet:](self, "_highlightedSummarySnippet:", v9));
    attributedTertiaryString = self->_attributedTertiaryString;
    self->_attributedTertiaryString = v10;

    v6 = v12;
  }

}

- (NSString)summary
{
  return self->_summary;
}

- (void)_recalculateAttributedStrings
{
  -[MessageListCellView _recalculatePrimaryAttributedString](self, "_recalculatePrimaryAttributedString");
  -[MessageListCellView _recalculateSecondaryAttributedString](self, "_recalculateSecondaryAttributedString");
  -[MessageListCellView _recalculateTertiaryAttributedString](self, "_recalculateTertiaryAttributedString");
}

- (void)_recalculateSecondaryAttributedString
{
  -[MessageListCellView _recalculateSecondaryAttributedStringShouldRehighlight:](self, "_recalculateSecondaryAttributedStringShouldRehighlight:", 0);
}

- (void)_recalculateSecondaryAttributedStringShouldRehighlight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSString *v19;
  NSString *accessibilitySecondaryLabel;
  NSAttributedString *v21;
  NSAttributedString *attributedSecondaryString;
  id v23;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subject"));

  if (self->_attributedSecondaryString)
    v6 = 1;
  else
    v6 = v23 == 0;
  if (!v6 || objc_msgSend(v23, "length") && v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v8 = objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subjectColorForContentConfiguration:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
    LOBYTE(v8) = objc_msgSend(v10, "subjectIsPresent");

    if ((v8 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absentDataColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v12, v13, v14));

      v9 = (void *)v15;
    }
    v16 = objc_alloc((Class)NSAttributedString);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _secondaryStringAttributesWithColor:](self, "_secondaryStringAttributesWithColor:", v9));
    v18 = objc_msgSend(v16, "initWithString:attributes:", v23, v17);

    v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "string"));
    accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
    self->_accessibilitySecondaryLabel = v19;

    v21 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _highlightedSubject:](self, "_highlightedSubject:", v18));
    attributedSecondaryString = self->_attributedSecondaryString;
    self->_attributedSecondaryString = v21;

  }
}

- (void)_recalculatePrimaryAttributedString
{
  -[MessageListCellView _recalculatePrimaryAttributedStringShouldRehighlight:](self, "_recalculatePrimaryAttributedStringShouldRehighlight:", 0);
}

- (void)_recalculatePrimaryAttributedStringShouldRehighlight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int64_t annotatedRelationshipType;
  NSBundle *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSAttributedString *v34;
  NSAttributedString *attributedPrimaryString;
  NSBundle *v36;
  NSBundle *v37;
  id v38;
  id v39;
  uint64_t v40;
  NSAttributedString *v41;
  NSAttributedString *v42;
  id v43;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _primaryLabelString](self, "_primaryLabelString"));
  v43 = v5;
  if (self->_attributedPrimaryString)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6 || objc_msgSend(v5, "length") && v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addressColorForContentConfiguration:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotationColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v11, v12, v13));

    if (!self->_shouldAnnotateReplyOrForward || !self->_annotatedRelationshipType)
    {
      v15 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
      v22 = objc_msgSend(v21, "addressIsPresent");

      if ((v22 & 1) == 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView configurationState](self, "configurationState"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView contentConfiguration](self, "contentConfiguration"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView backgroundConfiguration](self, "backgroundConfiguration"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absentDataColorForConfigurationState:contentConfiguration:backgroundConfiguration:", v24, v25, v26));

        v15 = (id)v27;
      }
      v28 = objc_alloc((Class)NSAttributedString);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _addressAttributesWithColor:](self, "_addressAttributesWithColor:", v15));
      v30 = objc_msgSend(v28, "initWithString:attributes:", v43, v29);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attributedAddress"));

      if (v32)
      {
        v16 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _addressAttributesWithColor:](self, "_addressAttributesWithColor:", v15));
        objc_msgSend(v16, "addAttributes:range:", v33, 0, objc_msgSend(v16, "length"));

      }
      else
      {
        v16 = v30;
      }
      v34 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _highlightedPrimaryString:](self, "_highlightedPrimaryString:", v16));
      attributedPrimaryString = self->_attributedPrimaryString;
      self->_attributedPrimaryString = v34;
      goto LABEL_24;
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView _addressAttributesWithColor:](self, "_addressAttributesWithColor:", v9));
    v16 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView _addressAttributesWithColor:](self, "_addressAttributesWithColor:", v14));
    annotatedRelationshipType = self->_annotatedRelationshipType;
    switch(annotatedRelationshipType)
    {
      case 1:
        v36 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REPLY_ANNOTATION_FORMAT"), &stru_100531B00, CFSTR("Main")));
        break;
      case 2:
        v37 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DRAFT_ANNOTATION_FORMAT"), &stru_100531B00, CFSTR("Main")));
        break;
      case 3:
        v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FORWARD_ANNOTATION_FORMAT"), &stru_100531B00, CFSTR("Main")));
        break;
      default:
        goto LABEL_25;
    }
    v32 = (void *)v20;

    if (v32)
    {
      attributedPrimaryString = (NSAttributedString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v43));
      v38 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", attributedPrimaryString, v16);
      v39 = -[NSAttributedString rangeOfString:](attributedPrimaryString, "rangeOfString:", v43);
      objc_msgSend(v38, "setAttributes:range:", v15, v39, v40);
      v41 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[MessageListCellView _highlightedPrimaryString:](self, "_highlightedPrimaryString:", v38));
      v42 = self->_attributedPrimaryString;
      self->_attributedPrimaryString = v41;

LABEL_24:
    }
LABEL_25:

  }
}

- (id)_primaryLabelString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "address"));

  return v3;
}

- (LayoutStatusIndicatorInfo)_layoutStatusIndicatorViews
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
  double v13;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  objc_msgSend(v4, "padding");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (!-[MessageListCellView chevronType](self, "chevronType"))
    v12 = v12 + 1.0;
  -[MessageListCellView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = MFEdgeInsetsFromDirectionalEdgeInsets(-[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"), v6, v8, v10, v12);
  v23 = v14 + v22;
  v24 = v16 + v21;
  v26 = v18 - (v22 + v25);
  v28 = v20 - (v21 + v27);
  -[MessageListCellLabel frame](self->_primaryLabel, "frame");
  -[MessageListCellView _rectForChevronBoxWithBounds:addressRect:type:](self, "_rectForChevronBoxWithBounds:addressRect:type:", 2, v23, v24, v26, v28, v29, v30, v31, v32);
  return -[MessageListCellView _layoutStatusIndicatorViewsWithChevronRect:](self, "_layoutStatusIndicatorViewsWithChevronRect:");
}

- (int64_t)chevronType
{
  return self->_chevronType;
}

- (CGRect)_rectForChevronBoxWithBounds:(CGRect)a3 addressRect:(CGRect)a4 type:(int64_t)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double width;
  double height;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  -[MessageListCellView _sizeForChevronWithType:](self, "_sizeForChevronWithType:", a5);
  v13 = v12;
  v15 = v14;
  -[MessageListCellView _originForChevronBoxWithBounds:addressRect:sizeForChevron:](self, "_originForChevronBoxWithBounds:addressRect:sizeForChevron:", v10, v9, v8, v7, x, y, width, height, *(_QWORD *)&v12, *(_QWORD *)&v14);
  v18 = MFIntegralRectToViewScale(self, v16, v17, v13, v15);
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGSize)_sizeForChevronWithType:(int64_t)a3
{
  CGFloat width;
  CGFloat height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (a3)
  {
    if (a3 == 3)
      a3 = 2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_imageForChevronType:](UIImage, "mf_imageForChevronType:", a3));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "size");
      width = v7;
      height = v8;
    }

  }
  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_layoutDisclosureButton
{
  UIButton *disclosureButton;
  id v3;

  disclosureButton = self->_disclosureButton;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIImage mf_symbolConfigurationForView:](UIImage, "mf_symbolConfigurationForView:", 10));
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](disclosureButton, "setPreferredSymbolConfiguration:forImageInState:");

}

- (CGPoint)_dateOriginAlignedWithAddressBaselineForBounds:(CGRect)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.origin.y;
  x = a3.origin.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v6, "addressCapHeight");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateFont"));

  objc_msgSend(v10, "mf_originPointFromBaselinePoint:", x, y + v8);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (id)_dateForViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sendLaterDate"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v11 = objc_msgSend(v10, "ef_isEarlierThanDate:", v9);

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[MessageListCellView log](MessageListCellView, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        sub_100392F64((uint64_t)v9, (uint64_t)v4, v12);

      v7 = v9;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView readLaterDate](self, "readLaterDate"));
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "ef_isEarlierThanOrEqualDate:", v9))
          v15 = v9;
        else
          v15 = v14;
        v7 = v15;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "followUp"));
        if (v16)
          v17 = v8;
        else
          v17 = v9;
        v7 = v17;

      }
    }

  }
  return v7;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (CGRect)_adjustRect:(CGRect)a3 forTrailingRect:(CGRect)a4 padding:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned __int8 v14;
  CGFloat v15;
  CGFloat MinX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double bottom;
  CGFloat v24;
  double right;
  double left;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  if (CGRectGetWidth(a4) > 0.0)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    if (CGRectGetMinX(v27) > 0.0)
    {
      v14 = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
      left = UIEdgeInsetsZero.left;
      if ((v14 & 1) != 0)
      {
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        v15 = CGRectGetMaxX(v28) + a5;
        v29.origin.x = v12;
        v29.origin.y = v11;
        v29.size.width = v10;
        v29.size.height = v9;
        MinX = CGRectGetMinX(v29);
        v17 = right;
        v18 = left + v15 - MinX;
      }
      else
      {
        v30.origin.x = v12;
        v30.origin.y = v11;
        v30.size.width = v10;
        v30.size.height = v9;
        v24 = CGRectGetMaxX(v30) + a5;
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v17 = right + v24 - CGRectGetMinX(v31);
        v18 = left;
      }
      v12 = v12 + v18;
      v11 = v11 + UIEdgeInsetsZero.top;
      v10 = v10 - (v17 + v18);
      v9 = v9 - (UIEdgeInsetsZero.top + bottom);
    }
  }
  v19 = v12;
  v20 = v11;
  v21 = v10;
  v22 = v9;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)swiped
{
  return self->_swiped;
}

- (void)setRecipientLabelType:(int64_t)a3
{
  if (self->_recipientLabelType != a3)
  {
    self->_recipientLabelType = a3;
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setReadLaterDate:(id)a3
{
  objc_storeStrong((id *)&self->_readLaterDate, a3);
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (void)setNotify:(BOOL)a3
{
  self->_notify = a3;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (void)setLayoutValuesHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutValuesHelper, a3);
}

- (void)setIsReadLater:(BOOL)a3
{
  self->_isReadLater = a3;
}

- (void)setFlagged:(BOOL)a3
{
  self->_flagged = a3;
}

- (void)setFlagColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setDateStyle:(int64_t)a3
{
  self->_dateStyle = a3;
}

- (void)setChevronType:(int64_t)a3
{
  if (self->_chevronType != a3)
  {
    self->_chevronType = a3;
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAnnotatedRelationshipType:(int64_t)a3
{
  NSAttributedString *attributedPrimaryString;

  if (self->_annotatedRelationshipType != a3)
  {
    self->_annotatedRelationshipType = a3;
    attributedPrimaryString = self->_attributedPrimaryString;
    self->_attributedPrimaryString = 0;

    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)disclosureEnabled
{
  return self->_disclosureEnabled;
}

- (CGSize)_sizeForChevron
{
  double v2;
  double v3;
  CGSize result;

  -[MessageListCellView _sizeForChevronWithType:](self, "_sizeForChevronWithType:", self->_chevronType);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_resetDateLabel
{
  UILabel *dateLabel;

  -[UILabel removeFromSuperview](self->_dateLabel, "removeFromSuperview");
  dateLabel = self->_dateLabel;
  self->_dateLabel = 0;

}

- (CGRect)_rectForDisclosureButtonWithFrame:(CGRect)a3 boxFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  unsigned __int8 v12;
  CGFloat v13;
  double MinX;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double MinY;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v12 = -[MessageListCellView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v22 = v10;
  if ((v12 & 1) != 0)
  {
    v13 = v8;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MinX = CGRectGetMinX(v25);
  }
  else
  {
    v26.origin.x = v11;
    v26.origin.y = v10;
    v26.size.width = v9;
    v13 = v8;
    v26.size.height = v8;
    MaxX = CGRectGetMaxX(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MinX = MaxX - CGRectGetMaxX(v27);
  }
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v16 = CGRectGetWidth(v28) + MinX * 2.0;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v17 = CGRectGetHeight(v29);
  v18 = 0.0;
  if ((v12 & 1) == 0)
  {
    v30.origin.x = v11;
    v30.origin.y = v22;
    v30.size.width = v9;
    v30.size.height = v13;
    v18 = CGRectGetMaxX(v30) - v16;
  }
  v19 = v17 + MinY * 2.0;
  v20 = 0.0;
  v21 = v16;
  result.size.height = v19;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010AA90;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9F58 != -1)
    dispatch_once(&qword_1005A9F58, block);
  return (OS_os_log *)(id)qword_1005A9F50;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MessageListCellView;
  -[MessageListCellView dealloc](&v4, "dealloc");
}

- (void)_layoutValuesDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));

  if (v4 == v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10010ADDC;
    v7[3] = &unk_10051AA98;
    v7[4] = self;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    objc_msgSend(v6, "performBlock:", v7);

  }
}

- (void)_dynamicTypeDidChange:(id)a3
{
  -[MessageListCellView _resetDateLabel](self, "_resetDateLabel", a3);
  objc_msgSend((id)objc_opt_class(self->_statusIndicatorManager), "clearCache");
  -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_invalidateCachedValues
{
  NSAttributedString *attributedPrimaryString;
  NSAttributedString *attributedSecondaryString;
  NSString *accessibilitySecondaryLabel;
  NSAttributedString *attributedTertiaryString;

  attributedPrimaryString = self->_attributedPrimaryString;
  self->_attributedPrimaryString = 0;

  attributedSecondaryString = self->_attributedSecondaryString;
  self->_attributedSecondaryString = 0;

  accessibilitySecondaryLabel = self->_accessibilitySecondaryLabel;
  self->_accessibilitySecondaryLabel = 0;

  attributedTertiaryString = self->_attributedTertiaryString;
  self->_attributedTertiaryString = 0;

  self->_annotatedRelationshipType = 0;
}

- (void)setShouldAnnotateReplyOrForward:(BOOL)a3
{
  NSAttributedString *attributedPrimaryString;

  if (self->_shouldAnnotateReplyOrForward != a3)
  {
    self->_shouldAnnotateReplyOrForward = a3;
    attributedPrimaryString = self->_attributedPrimaryString;
    self->_attributedPrimaryString = 0;

    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCompact:(BOOL)a3
{
  if (self->_compact != a3)
  {
    self->_compact = a3;
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHasGeneratedSummary:(BOOL)a3
{
  MessageListCellLabel *tertiaryLabel;
  _QWORD *v4;

  if (self->_hasGeneratedSummary != a3)
  {
    self->_hasGeneratedSummary = a3;
    tertiaryLabel = self->_tertiaryLabel;
    v4 = &MSAccessibilityIdentifierMailMessageCellViewGeneratedSummaryLabel;
    if (!a3)
      v4 = &MSAccessibilityIdentifierMailMessageCellViewSummaryLabel;
    -[MessageListCellLabel setAccessibilityIdentifier:](tertiaryLabel, "setAccessibilityIdentifier:", *v4);
  }
}

- (void)setDisclosureEnabled:(BOOL)a3
{
  -[MessageListCellView setDisclosureEnabled:animated:](self, "setDisclosureEnabled:animated:", a3, 0);
}

- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;

  if (self->_disclosureEnabled != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_disclosureEnabled = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView disclosureButton](self, "disclosureButton"));
    objc_msgSend(v7, "setSelected:", v5);

    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
    -[MessageListCellView _layoutChevronForDisclosureStateAnimated:](self, "_layoutChevronForDisclosureStateAnimated:", v4);
  }
}

- (void)applyIndicatorPreviewChangeAction:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "action");
  v5 = 0;
  v6 = 0;
  switch((unint64_t)v4)
  {
    case 2uLL:
      -[MessageListCellView setRead:](self, "setRead:", objc_msgSend(v10, "flagState", 0));
      v5 = -[MessageListCellView isRead](self, "isRead") ^ 1;
      v6 = 1;
      break;
    case 3uLL:
      -[MessageListCellView setIsReadLater:](self, "setIsReadLater:", objc_msgSend(v10, "flagState", 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readLaterDate"));
      -[MessageListCellView setReadLaterDate:](self, "setReadLaterDate:", v7);

      v5 = -[MessageListCellView isReadLater](self, "isReadLater");
      -[MessageListCellView setDateStyle:](self, "setDateStyle:", -[MessageListCellView isReadLater](self, "isReadLater"));
      -[MessageListCellView _updateDateLabelWithDateStyle:](self, "_updateDateLabelWithDateStyle:", -[MessageListCellView dateStyle](self, "dateStyle"));
      v6 = 512;
      break;
    case 6uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flagColors", 0));
      v5 = v8 != 0;

      -[MessageListCellView setFlagged:](self, "setFlagged:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flagColors"));
      -[MessageListCellView setFlagColors:](self, "setFlagColors:", v9);

      v6 = 4;
      break;
    case 0xAuLL:
      -[MessageListCellView setNotify:](self, "setNotify:", objc_msgSend(v10, "flagState", 0));
      v5 = -[MessageListCellView isNotify](self, "isNotify") ^ 1;
      v6 = 64;
      break;
    case 0xBuLL:
      -[MessageListCellView setMute:](self, "setMute:", objc_msgSend(v10, "flagState", 0));
      v5 = -[MessageListCellView isMute](self, "isMute") ^ 1;
      v6 = 128;
      break;
    default:
      break;
  }
  -[MessageListCellView _animateIndicator:toState:](self, "_animateIndicator:toState:", v6, v5);

}

- (void)_animateIndicator:(unint64_t)a3 toState:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  MessageListCellView *v14;
  id v15;
  id v16;
  id v17;
  _UNKNOWN **v18;
  id v19;
  id v20;
  id *v21;
  NSString *v22;
  _BOOL4 IsAccessibilityCategory;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "statusIndicatorViews"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
  v10 = objc_msgSend(v9, "tierForIndicator:", a3);

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
    v12 = MSSendMailIntent_ptr;
    while (v11 < (unint64_t)objc_msgSend(v8, "count"))
    {
      if (v10 == (id)v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v10));
        v14 = (MessageListCellView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));

        if (v14 != self)
          -[MessageListCellView addSubview:](self, "addSubview:", v13);
        v15 = objc_alloc((Class)v12[278]);
        if (v4)
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10010B534;
          v28[3] = &unk_10051AA98;
          v16 = v13;
          v29 = v16;
          v17 = objc_msgSend(v15, "initWithDuration:curve:animations:", 0, v28, 0.4);
          v18 = v12;
          v19 = objc_alloc((Class)v12[278]);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10010B540;
          v26[3] = &unk_10051AA98;
          v27 = v16;
          v20 = objc_msgSend(v19, "initWithDuration:dampingRatio:animations:", v26, 0.8, 0.7);
          objc_msgSend(v17, "startAnimation");
          v12 = v18;
          objc_msgSend(v20, "startAnimation");

          v21 = &v29;
        }
        else
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10010B590;
          v24[3] = &unk_10051AA98;
          v25 = v13;
          v17 = objc_msgSend(v15, "initWithDuration:curve:animations:", 0, v24, 0.8);
          objc_msgSend(v17, "startAnimation");
          v21 = &v25;
        }

      }
      ++v11;
    }
    -[MessageListCellView _layoutStatusIndicatorViews](self, "_layoutStatusIndicatorViews");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

    if (IsAccessibilityCategory)
      -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[MessageListCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGPoint)_dateOriginUnderSummary:(CGRect)a3
{
  double y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unsigned int v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  __n128 v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a3.origin.y;
  x = a3.origin.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "summaryFont"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  objc_msgSend(v8, "addressAndSubjectHeight");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView tertiaryLabel](self, "tertiaryLabel"));
  v12 = -[MessageListCellView _isLabelValid:](self, "_isLabelValid:", v11);

  v13 = 0.0;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView summary](self, "summary"));
    -[MessageListCellView bounds](self, "bounds");
    v16 = objc_msgSend(v14, "actualLineCountForSummary:bounds:", v15);

    v13 = (double)(uint64_t)v16;
  }
  objc_msgSend(v7, "_bodyLeading");
  v18 = v17;
  objc_msgSend(v7, "descender");
  v20.n128_f64[0] = -(v19 - v13 * v18);
  v21 = y + v10 + UIRoundToViewScale(self, v20);

  v22 = x;
  v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGRect)_rectForAvatarWithBounds:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  double x;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __n128 v19;
  double v20;
  __n128 v21;
  double v22;
  CGRect v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory)
    goto LABEL_5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues"));
  objc_msgSend(v10, "avatarSize");
  v12 = v11;

  v13 = -v12;
  if (v12 >= 0.0)
    v13 = v12;
  if (v13 < 2.22044605e-16)
  {
LABEL_5:
    v14 = CGRectZero.origin.x;
    v15 = CGRectZero.origin.y;
    v16 = CGRectZero.size.width;
    v17 = CGRectZero.size.height;
  }
  else
  {
    v18 = y + (height - v12) * 0.5;
    if (-[MessageListCellView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1)
    {
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      x = CGRectGetMaxX(v23) - v12;
    }
    v19.n128_f64[0] = v12;
    v20 = UIRoundToViewScale(self, v19);
    v21.n128_f64[0] = v12;
    v22 = UIRoundToViewScale(self, v21);
    v14 = MFIntegralRectToViewScale(self, x, v18, v22, v20);
  }
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_rectForMultipleSubjectWithBounds:(CGRect)a3 position:(int64_t)a4
{
  double width;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double left;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __n128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView layoutValues](self, "layoutValues", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v9, "addressCapHeight");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "summaryFont"));
  objc_msgSend(v12, "lineHeight");
  left = UIEdgeInsetsZero.left;
  objc_msgSend(v12, "mf_originPointFromBaselinePoint:", x + left, y + UIEdgeInsetsZero.top + v11 + 2.0 + v14 * (double)(a4 + 1) + (double)(unint64_t)(2 * a4));
  v16 = v15;
  v18 = v17;
  objc_msgSend(v12, "lineHeight");
  v20 = v19;
  objc_msgSend(v12, "descender");
  v22.n128_f64[0] = v20 - v21;
  v23 = UIRoundToViewScale(self, v22);
  v24 = MFIntegralRectToViewScale(self, v16, v18, width - (left + UIEdgeInsetsZero.right), v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)_baselineLabelForIndicator
{
  void *v3;
  id v4;
  int *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView viewModel](self, "viewModel"));
  v4 = objc_msgSend(v3, "style");

  v5 = &OBJC_IVAR___MessageListCellView__secondaryLabel;
  if (v4 == (id)2)
    v5 = &OBJC_IVAR___MessageListCellView__tertiaryLabel;
  return *(id *)((char *)&self->super.super.super.isa + *v5);
}

- (BOOL)_hasPastReminderForReadLaterDate:(id)a3 displayDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  if ((objc_msgSend(v5, "ef_isEarlierThanOrEqualDate:", v7) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v5, "ef_isEarlierThanOrEqualDate:", v6);

  return v8;
}

- (void)prepareForReuse
{
  MessageListCellViewModel *viewModel;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  viewModel = self->_viewModel;
  self->_viewModel = 0;

  -[MessageListCellView setRead:](self, "setRead:", 1);
  -[MessageListCellView setFlagged:](self, "setFlagged:", 0);
  -[MessageListCellView setFlagColors:](self, "setFlagColors:", 0);
  -[MessageListCellView setNotify:](self, "setNotify:", 0);
  -[MessageListCellView setMute:](self, "setMute:", 0);
  -[MessageListCellView setReadLaterDate:](self, "setReadLaterDate:", 0);
  -[MessageListCellView setIsReadLater:](self, "setIsReadLater:", 0);
  -[MessageListCellView setRecipientLabelType:](self, "setRecipientLabelType:", 0);
  -[MessageListCellView setAttributedSecondaryString:](self, "setAttributedSecondaryString:", 0);
  -[MessageListCellView setAccessibilitySecondaryLabel:](self, "setAccessibilitySecondaryLabel:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v6, "setText:", 0);

  -[MessageListCellView setAttributedPrimaryString:](self, "setAttributedPrimaryString:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView primaryLabel](self, "primaryLabel"));
  objc_msgSend(v7, "setText:", 0);

  -[MessageListCellView setAttributedTertiaryString:](self, "setAttributedTertiaryString:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v8, "setText:", 0);

  -[MessageListCellView setSummary:](self, "setSummary:", &stru_100531B00);
  -[MessageListCellView setHasGeneratedSummary:](self, "setHasGeneratedSummary:", 0);
  -[MessageListCellView setSummarySymbolTextAttachment:](self, "setSummarySymbolTextAttachment:", 0);
  -[MessageListCellView setCompact:](self, "setCompact:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCellView dateLabel](self, "dateLabel"));
  objc_msgSend(v9, "_setTextEncapsulation:", 0);
  objc_msgSend(v9, "setAttributedText:", 0);
  objc_msgSend(v9, "setText:", 0);
  v4 = objc_opt_class(UIDateLabel);
  if ((objc_opt_isKindOfClass(v9, v4) & 1) != 0)
    objc_msgSend(v9, "setDate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellView statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v5, "prepareForReuse");

}

- (int64_t)annotatedRelationshipType
{
  return self->_annotatedRelationshipType;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (BOOL)shouldAnnotateReplyOrForward
{
  return self->_shouldAnnotateReplyOrForward;
}

- (BOOL)hasGeneratedSummary
{
  return self->_hasGeneratedSummary;
}

- (void)setSwiped:(BOOL)a3
{
  self->_swiped = a3;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (void)setAttributedPrimaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void)setAccessibilitySecondaryLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setAttributedSecondaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setTertiaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabel, a3);
}

- (void)setAttributedTertiaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setRecipientLabelImageView:(id)a3
{
  objc_storeStrong((id *)&self->_recipientLabelImageView, a3);
}

- (NSTextAttachment)summarySymbolTextAttachment
{
  return self->_summarySymbolTextAttachment;
}

- (void)setSummarySymbolTextAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_summarySymbolTextAttachment, a3);
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (void)setStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_summarySymbolTextAttachment, 0);
  objc_storeStrong((id *)&self->_recipientLabelImageView, 0);
  objc_storeStrong((id *)&self->_attributedTertiaryString, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_attributedSecondaryString, 0);
  objc_storeStrong((id *)&self->_accessibilitySecondaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_attributedPrimaryString, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_disclosureButton, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
  objc_storeStrong((id *)&self->_configurationState, 0);
  objc_storeStrong((id *)&self->_backgroundConfiguration, 0);
}

@end
