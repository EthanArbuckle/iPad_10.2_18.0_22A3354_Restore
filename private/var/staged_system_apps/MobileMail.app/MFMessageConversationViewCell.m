@implementation MFMessageConversationViewCell

- (MFMessageConversationViewCell)initWithFrame:(CGRect)a3
{
  MFMessageConversationViewCell *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMessageConversationViewCell;
  result = -[MFConversationViewCell initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_shouldAddShadow = 1;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageConversationViewCell predictedMailbox](self, "predictedMailbox"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)MFMessageConversationViewCell;
  -[MFMessageConversationViewCell dealloc](&v4, "dealloc");
}

- (void)setMessageFlags:(unint64_t)a3 conversationNotificationLevel:(int64_t)a4
{
  id v5;
  id v6;
  _QWORD v7[6];

  v7[1] = 3221225472;
  v7[2] = sub_100178B14;
  v7[3] = &unk_1005218E0;
  v7[4] = a3;
  v7[5] = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v7[0] = _NSConcreteStackBlock;
  v5 = objc_msgSend(v6, "copyWithFlagsModelBuilder:", v7);
  -[MFConversationViewCell setViewModel:](self, "setViewModel:", v5);

}

- (BOOL)hasVisibleContent
{
  return 0;
}

- (void)setShouldAddShadow:(BOOL)a3
{
  if (self->_shouldAddShadow != a3)
  {
    self->_shouldAddShadow = a3;
    -[MFMessageConversationViewCell _updateShadow](self, "_updateShadow");
  }
}

- (void)setRoundsCellCorners:(BOOL)a3
{
  void *v4;
  double v5;
  id v6;

  if (self->_roundsCellCorners != a3)
  {
    self->_roundsCellCorners = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageConversationViewCell contentView](self, "contentView"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));

    objc_msgSend(v6, "setCornerCurve:", kCACornerCurveContinuous);
    if (self->_roundsCellCorners)
      objc_msgSend((id)objc_opt_class(self), "defaultCornerRadius");
    else
      v5 = 0.0;
    objc_msgSend(v6, "setCornerRadius:", v5);

  }
}

- (BOOL)expanded
{
  return 0;
}

+ (double)defaultCornerRadius
{
  return 12.0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageConversationViewCell;
  -[MFMessageConversationViewCell layoutSubviews](&v3, "layoutSubviews");
  -[MFMessageConversationViewCell _updateShadow](self, "_updateShadow");
}

- (void)_updateShadow
{
  _BOOL8 v3;
  _BOOL8 v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentWrapperView](self, "contentWrapperView"));
  v3 = -[MFMessageConversationViewCell shouldAddShadow](self, "shouldAddShadow");
  v4 = -[MFMessageConversationViewCell roundsCellCorners](self, "roundsCellCorners");
  objc_msgSend((id)objc_opt_class(self), "defaultCornerRadius");
  objc_msgSend(v5, "mf_applyingConversationMessageShadow:shouldRoundCorners:cornerRadius:", v3, v4);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageConversationViewCell predictedMailbox](self, "predictedMailbox"));
  objc_msgSend(v3, "cancel");

  -[MFMessageConversationViewCell setPredictedMailbox:](self, "setPredictedMailbox:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MFMessageConversationViewCell;
  -[MFConversationViewCell prepareForReuse](&v4, "prepareForReuse");
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)MFMessageConversationViewCell;
  v3 = -[MFMessageConversationViewCell description](&v30, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("baseClass = ([^;]*); "),
    &stru_100531B00,
    1024,
    0,
    objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "senderList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "emailAddressValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "simpleAddress"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  v14 = v13;

  v29 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFUIStateCaptor sharedCaptor](MFUIStateCaptor, "sharedCaptor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "redactedStringForString:", v14));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "messageContentRequest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "message"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  if (v19)
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "messageContentRequest"));
  else
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "messageLoadingContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "message"));

  v23 = objc_opt_class(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "date"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter ef_formatDate:shortStyle:](NSDateFormatter, "ef_formatDate:shortStyle:", v25, 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; message = <%@: %p; sender = \"%@\" dateSent = \"%@\">"),
                    v23,
                    v22,
                    v16,
                    v26));

  objc_msgSend(v5, "insertString:atIndex:", v27, (char *)objc_msgSend(v5, "length") - 1);
  return v5;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (BOOL)shouldAddShadow
{
  return self->_shouldAddShadow;
}

- (BOOL)roundsCellCorners
{
  return self->_roundsCellCorners;
}

- (BOOL)interactivelyResizing
{
  return self->_interactivelyResizing;
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  self->_interactivelyResizing = a3;
}

- (EFFuture)predictedMailbox
{
  return self->_predictedMailbox;
}

- (void)setPredictedMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_predictedMailbox, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedMailbox, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
