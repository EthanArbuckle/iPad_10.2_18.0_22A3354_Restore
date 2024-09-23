@implementation MFMailboxFilterPickerCell

- (void)bindWithMailboxFilter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filterDescription"));
  -[MFMailboxFilterPickerCell setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iconTintColor"));
  -[MFMailboxFilterPickerCell setIconTintColor:](self, "setIconTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iconImageName"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iconImageName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", v7, 6));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "icon"));
  }
  -[MFMailboxFilterPickerCell setIcon:](self, "setIcon:", v8);

}

- (MFMailboxFilterPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  MFMailboxFilterPickerCell *v7;
  MFMailboxFilterPickerCell *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MFMailboxFilterPickerCell;
  v7 = -[MFMailboxFilterPickerCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, v6);
  v8 = v7;
  if (v7)
    -[MFMailboxFilterPickerCell setSelectionStyle:](v7, "setSelectionStyle:", 0);

  return v8;
}

- (void)setTitle:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100168C3C;
  v5[3] = &unk_10051D9C0;
  v6 = a3;
  v4 = v6;
  -[MFMailboxFilterPickerCell mf_updateContentConfigurationWithBlock:](self, "mf_updateContentConfigurationWithBlock:", v5);

}

- (void)setIcon:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100168CD8;
  v5[3] = &unk_10051D9C0;
  v6 = a3;
  v4 = v6;
  -[MFMailboxFilterPickerCell mf_updateContentConfigurationWithBlock:](self, "mf_updateContentConfigurationWithBlock:", v5);

}

- (void)setIconTintColor:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100168D74;
  v5[3] = &unk_10051D9C0;
  v6 = a3;
  v4 = v6;
  -[MFMailboxFilterPickerCell mf_updateContentConfigurationWithBlock:](self, "mf_updateContentConfigurationWithBlock:", v5);

}

@end
