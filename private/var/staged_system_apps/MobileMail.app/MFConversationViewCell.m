@implementation MFConversationViewCell

- (MFConversationViewCell)initWithFrame:(CGRect)a3
{
  MFConversationViewCell *v3;
  MFConversationViewCell *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MFConversationViewCell;
  v3 = -[MFConversationViewCell initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](v3, "contentView"));
    objc_msgSend(v5, "setClipsToBounds:", 1);

    -[MFConversationViewCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    v6 = objc_alloc((Class)UIView);
    -[MFConversationViewCell bounds](v4, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    -[MFConversationViewCell setContentWrapperView:](v4, "setContentWrapperView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentWrapperView](v4, "contentWrapperView"));
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentWrapperView](v4, "contentWrapperView"));
    -[MFConversationViewCell addSubview:](v4, "addSubview:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentWrapperView](v4, "contentWrapperView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](v4, "contentView"));
    objc_msgSend(v10, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentWrapperView](v4, "contentWrapperView"));
    objc_msgSend(v12, "setInsetsLayoutMarginsFromSafeArea:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](v4, "contentView"));
    objc_msgSend(v13, "setPreservesSuperviewLayoutMargins:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](v4, "contentView"));
    objc_msgSend(v14, "setInsetsLayoutMarginsFromSafeArea:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](v4, "contentView"));
    objc_msgSend(v15, "setLayoutMargins:", 0.0, 31.0, 0.0, 31.0);

    if (qword_1005AA120 != -1)
      dispatch_once(&qword_1005AA120, &stru_100520E70);
    if (byte_1005AA118)
    {
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor")));
      v17 = objc_msgSend(v16, "CGColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell layer](v4, "layer"));
      objc_msgSend(v18, "setBorderColor:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v19, "scale");
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell layer](v4, "layer"));
      objc_msgSend(v22, "setBorderWidth:", 1.0 / v21);

    }
    -[MFConversationViewCell setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
  }
  return v4;
}

- (void)setDisplayMetrics:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFConversationViewCell _displayMetricsDidChange](self, "_displayMetricsDidChange");
  }

}

- (void)_displayMetricsDidChange
{
  -[MFConversationViewCell doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFConversationViewCell _displayMetricsDidChange]", "MFConversationViewCell.m", 80, "0");
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MFConversationViewCell;
  -[MFConversationViewCell layoutMarginsDidChange](&v20, "layoutMarginsDidChange");
  -[MFConversationViewCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](self, "contentView"));
  objc_msgSend(v11, "layoutMargins");
  v16 = v15;
  if (v10 < 31.0)
    v10 = 31.0;
  if (v6 < 31.0)
    v6 = 31.0;
  if (v6 == v13 && v4 == v12 && v10 == v14)
  {

    if (v8 == v16)
      return;
  }
  else
  {

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentView](self, "contentView"));
  objc_msgSend(v19, "setLayoutMargins:", v4, v6, v8, v10);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFConversationViewCell;
  -[MFConversationViewCell applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = objc_msgSend(v4, "zIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell layer](self, "layer"));
  objc_msgSend(v6, "setZPosition:", (double)(uint64_t)v5);

}

- (void)prepareForReuse
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  -[MFConversationViewCell setItemID:](self, "setItemID:", 0);
  -[MFConversationViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell contentWrapperView](self, "contentWrapperView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12.receiver = self;
  v12.super_class = (Class)MFConversationViewCell;
  -[MFConversationViewCell prepareForReuse](&v12, "prepareForReuse");
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3
{
  return 1;
}

- (UIView)contentWrapperView
{
  return self->_contentWrapperView;
}

- (void)setContentWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_contentWrapperView, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (BOOL)disallowsHighlighting
{
  return self->_disallowsHighlighting;
}

- (void)setDisallowsHighlighting:(BOOL)a3
{
  self->_disallowsHighlighting = a3;
}

- (ConversationCellViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

@end
