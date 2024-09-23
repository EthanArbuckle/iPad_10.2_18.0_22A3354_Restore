@implementation MessageListCollectionViewCell

- (void)layoutMarginsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListCollectionViewCell;
  -[MessageListCollectionViewCell layoutMarginsDidChange](&v5, "layoutMarginsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellView"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (MessageListCollectionViewCell)initWithFrame:(CGRect)a3
{
  MessageListCollectionViewCell *v3;
  MessageListCellView *v4;
  void *v5;
  MessageListCellView *v6;
  id v7;
  void *v8;
  void *v9;
  MessageListCellHelper *v10;
  MessageListCellHelper *cellHelper;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MessageListCollectionViewCell;
  v3 = -[MessageListCollectionViewCell initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MessageListCellView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v5, "bounds");
    v6 = -[MessageListCellView initWithFrame:](v4, "initWithFrame:");

    v7 = objc_alloc((Class)MessageListCellHelper);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell contentView](v3, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListCellHelperMobileMailProxy sharedApplicationProxy](MessageListCellHelperMobileMailProxy, "sharedApplicationProxy"));
    v10 = (MessageListCellHelper *)objc_msgSend(v7, "initWithParentView:contentView:cellView:applicationProxy:", v3, v8, v6, v9);
    cellHelper = v3->_cellHelper;
    v3->_cellHelper = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCellHelper cellView](v3->_cellHelper, "cellView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "disclosureButton"));
    objc_msgSend(v13, "addTarget:action:forControlEvents:", v3, "_didTapDisclosureButton:", 64);

    -[MessageListCollectionViewCell _setFocusStyle:](v3, "_setFocusStyle:", 0);
    sub_10003206C(v3);

  }
  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell defaultBackgroundConfiguration](self, "defaultBackgroundConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutValuesHelper"));
  objc_msgSend(v7, "setDefaultBackgroundConfiguration:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentConfigurationForState:", v10));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundConfigurationForState:", v10));
  if (-[MessageListCollectionViewCell _backgroundViewConfigurationGrouping](self, "_backgroundViewConfigurationGrouping") == (id)4)objc_msgSend(v9, "setBackgroundInsets:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v4, "updateViewConfigurationForState:", v10);
  objc_msgSend(v4, "updateViewContentConfiguration:", v8);
  objc_msgSend(v4, "updateViewBackgroundConfiguration:", v9);
  -[MessageListCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v9);
  sub_10003206C(self);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  double v28;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutValuesHelper"));

  if (!v8)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCollectionCell.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutValuesHelper != nil"));

  }
  v9 = objc_msgSend(v6, "style");
  if (v9 == (id)3)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topHitsLayoutValues"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultLayoutValues"));
  objc_msgSend(v10, "defaultRowHeight");
  v12 = v11;

  if (objc_msgSend(v6, "isCompact"))
  {
    if (v9 == (id)3)
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topHitsLayoutValues"));
    else
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultLayoutValues"));
    objc_msgSend(v13, "compactRowHeight");
  }
  else
  {
    if (!objc_msgSend(v6, "isExpanded"))
      goto LABEL_17;
    if (v9 == (id)3)
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topHitsLayoutValues"));
    else
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expandedLayoutValues"));
    objc_msgSend(v13, "defaultRowHeight");
  }
  v12 = v14;

LABEL_17:
  if (objc_msgSend(v6, "disclosureEnabled"))
    v12 = v12 + 0.0;
  objc_msgSend(v5, "size");
  objc_msgSend(v5, "setSize:");
  v15 = objc_claimAutoreleasedReturnValue(+[MessageListCollectionViewCell log](MessageListCollectionViewCell, "log"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell itemID](self, "itemID"));
    *(_DWORD *)buf = 138544386;
    v20 = v16;
    v21 = 1024;
    v22 = v9 == (id)3;
    v23 = 1024;
    v24 = objc_msgSend(v6, "isCompact");
    v25 = 1024;
    v26 = objc_msgSend(v6, "isExpanded");
    v27 = 2048;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "preferredLayoutAttributesFittingAttributes - (itemID=%{public}@), isTopHit: %{BOOL}d, isCompact: %{BOOL}d, isExpanded: %{BOOL}d, height: %f", buf, 0x28u);

  }
  return v5;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellView"));
  objc_msgSend(v7, "setEditing:", v4);

  -[MessageListCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)layoutSubviews
{
  double v3;
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
  void *v14;
  objc_super v15;

  -[MessageListCollectionViewCell frame](self, "frame");
  if (v3 >= 1.0)
  {
    v15.receiver = self;
    v15.super_class = (Class)MessageListCollectionViewCell;
    -[MessageListCollectionViewCell layoutSubviews](&v15, "layoutSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellView"));
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  }
}

- (id)configurationState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MessageListCollectionViewCell;
  v3 = -[MessageListCollectionViewCell configurationState](&v8, "configurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationStateForCellConfigurationState:", v4));

  return v6;
}

- (MessageListCellHelper)cellHelper
{
  return self->_cellHelper;
}

- (void)setNeedsFlushSeparator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_needsFlushSeparator != a3)
  {
    v3 = a3;
    self->_needsFlushSeparator = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell separatorFlushLeadingConstraint](self, "separatorFlushLeadingConstraint"));
    objc_msgSend(v4, "setActive:", v3);

  }
}

- (void)setMessageListItemFuture:(id)a3
{
  objc_storeStrong((id *)&self->_messageListItemFuture, a3);
}

- (void)setMessageListItemFetchTimeoutCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_messageListItemFetchTimeoutCancelable, a3);
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void)setDisclosureDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_disclosureDelegate, a3);
}

- (void)setBackgroundViewConfigurationGrouping:(int64_t)a3
{
  self->_backgroundViewConfigurationGrouping = a3;
  if ((unint64_t)(a3 - 1) >= 4)
    a3 = 0;
  -[MessageListCollectionViewCell _setBackgroundViewConfigurationGrouping:](self, "_setBackgroundViewConfigurationGrouping:", a3);
}

- (EFFuture)messageListItemFuture
{
  return self->_messageListItemFuture;
}

- (EFCancelable)messageListItemFetchTimeoutCancelable
{
  return self->_messageListItemFetchTimeoutCancelable;
}

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MessageListCollectionViewListCell");
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010C214;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9F88 != -1)
    dispatch_once(&qword_1005A9F88, block);
  return (OS_os_log *)(id)qword_1005A9F80;
}

- (void)_didTapDisclosureButton:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper", a3));
  v5 = objc_msgSend(v4, "disclosureEnabled");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell disclosureDelegate](self, "disclosureDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageListItem"));
  objc_msgSend(v6, "didSelectDisclosureButtonForMessageListItem:disclosureEnabled:", v8, v5);

  -[MessageListCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageListCollectionViewCell;
  -[MessageListCollectionViewCell traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  sub_10003206C(self);

}

- (NSLayoutConstraint)separatorFlushLeadingConstraint
{
  NSLayoutConstraint *separatorFlushLeadingConstraint;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *v8;

  separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  if (!separatorFlushLeadingConstraint)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell separatorLayoutGuide](self, "separatorLayoutGuide"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell leadingAnchor](self, "leadingAnchor"));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    v8 = self->_separatorFlushLeadingConstraint;
    self->_separatorFlushLeadingConstraint = v7;

    separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  }
  return separatorFlushLeadingConstraint;
}

- (void)prepareForReuse
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;

  -[MessageListCollectionViewCell setHighlighted:](self, "setHighlighted:", 0);
  -[MessageListCollectionViewCell setSelected:](self, "setSelected:", 0);
  -[MessageListCollectionViewCell setDisclosureDelegate:](self, "setDisclosureDelegate:", 0);
  -[MessageListCollectionViewCell setNeedsFlushSeparator:](self, "setNeedsFlushSeparator:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell messageListItemFetchTimeoutCancelable](self, "messageListItemFetchTimeoutCancelable"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MessageListCollectionViewCell log](MessageListCollectionViewCell, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell itemID](self, "itemID"));
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "prepareForReuse - cancel message list item fetch timeout (itemID=%{public}@)", buf, 0xCu);

    }
    objc_msgSend(v3, "cancel");
    -[MessageListCollectionViewCell setMessageListItemFetchTimeoutCancelable:](self, "setMessageListItemFetchTimeoutCancelable:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell messageListItemFuture](self, "messageListItemFuture"));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MessageListCollectionViewCell log](MessageListCollectionViewCell, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell itemID](self, "itemID"));
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "prepareForReuse - cancel message list item fetch (itemID=%{public}@)", buf, 0xCu);

    }
    objc_msgSend(v6, "cancel");
    -[MessageListCollectionViewCell setMessageListItemFuture:](self, "setMessageListItemFuture:", 0);
  }
  -[MessageListCollectionViewCell setItemID:](self, "setItemID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellView"));
  objc_msgSend(v10, "setChevronType:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  objc_msgSend(v11, "prepareForReuse");

  v12.receiver = self;
  v12.super_class = (Class)MessageListCollectionViewCell;
  -[MessageListCollectionViewCell prepareForReuse](&v12, "prepareForReuse");

}

- (EMMessageListItem)messageListItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItem"));

  return (EMMessageListItem *)v3;
}

- (void)setDisclosureEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  objc_msgSend(v6, "setDisclosureEnabled:animated:", v5, v4);

}

- (void)applyIndicatorPreviewChangeAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListCollectionViewCell cellHelper](self, "cellHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellView"));
  objc_msgSend(v5, "applyIndicatorPreviewChangeAction:", v6);

}

- (int64_t)backgroundViewConfigurationGrouping
{
  return self->_backgroundViewConfigurationGrouping;
}

- (MessageListCellDisclosureDelegate)disclosureDelegate
{
  return (MessageListCellDisclosureDelegate *)objc_loadWeakRetained((id *)&self->_disclosureDelegate);
}

- (BOOL)needsFlushSeparator
{
  return self->_needsFlushSeparator;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setCellHelper:(id)a3
{
  objc_storeStrong((id *)&self->_cellHelper, a3);
}

- (void)setSeparatorFlushLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorFlushLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorFlushLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_cellHelper, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_messageListItemFetchTimeoutCancelable, 0);
  objc_storeStrong((id *)&self->_messageListItemFuture, 0);
  objc_destroyWeak((id *)&self->_disclosureDelegate);
}

@end
