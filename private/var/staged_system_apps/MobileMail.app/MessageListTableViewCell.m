@implementation MessageListTableViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MessageListCollectionViewCell");
}

- (MessageListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  MessageListTableViewCell *v7;
  MessageListCellView *v8;
  void *v9;
  MessageListCellView *v10;
  id v11;
  void *v12;
  void *v13;
  MessageListCellHelper *v14;
  MessageListCellHelper *cellHelper;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MessageListTableViewCell;
  v7 = -[MessageListTableViewCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, v6);
  if (v7)
  {
    v8 = [MessageListCellView alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell contentView](v7, "contentView"));
    objc_msgSend(v9, "bounds");
    v10 = -[MessageListCellView initWithFrame:](v8, "initWithFrame:");

    v11 = objc_alloc((Class)MessageListCellHelper);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell contentView](v7, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListCellHelperMobileMailProxy sharedApplicationProxy](MessageListCellHelperMobileMailProxy, "sharedApplicationProxy"));
    v14 = (MessageListCellHelper *)objc_msgSend(v11, "initWithParentView:contentView:cellView:applicationProxy:", v7, v12, v10, v13);
    cellHelper = v7->_cellHelper;
    v7->_cellHelper = v14;

    -[MessageListTableViewCell setAccessoryType:](v7, "setAccessoryType:", 0);
  }

  return v7;
}

- (id)configurationState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MessageListTableViewCell;
  v3 = -[MessageListTableViewCell configurationState](&v8, "configurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell cellHelper](self, "cellHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationStateForCellConfigurationState:", v4));

  return v6;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell cellHelper](self, "cellHelper"));
  objc_msgSend(v7, "setHighlighted:", v5);

  v8.receiver = self;
  v8.super_class = (Class)MessageListTableViewCell;
  -[MessageListTableViewCell setHighlighted:animated:](&v8, "setHighlighted:animated:", v5, v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell cellHelper](self, "cellHelper"));
  objc_msgSend(v7, "setSelected:", v5);

  v8.receiver = self;
  v8.super_class = (Class)MessageListTableViewCell;
  -[MessageListTableViewCell setSelected:animated:](&v8, "setSelected:animated:", v5, v4);
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell cellHelper](self, "cellHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentConfigurationForState:", v7));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundConfigurationForState:", v7));
  objc_msgSend(v4, "updateViewConfigurationForState:", v7);
  objc_msgSend(v4, "updateViewContentConfiguration:", v5);
  objc_msgSend(v4, "updateViewBackgroundConfiguration:", v6);
  -[MessageListTableViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v6);

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

  -[MessageListTableViewCell frame](self, "frame");
  if (v3 >= 1.0)
  {
    v15.receiver = self;
    v15.super_class = (Class)MessageListTableViewCell;
    -[MessageListTableViewCell layoutSubviews](&v15, "layoutSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell contentView](self, "contentView"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageListTableViewCell cellHelper](self, "cellHelper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellView"));
    objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  }
}

- (MessageListCellHelper)cellHelper
{
  return self->_cellHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellHelper, 0);
}

@end
