@implementation CHFriendInboxOutgoingTableViewCell

- (void)_setupCell
{
  void *v3;
  UIListContentConfiguration *v4;
  UIListContentConfiguration *currentContentConfiguration;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  -[CHFriendInboxOutgoingTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (UIListContentConfiguration *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxOutgoingTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration"));
  currentContentConfiguration = self->_currentContentConfiguration;
  self->_currentContentConfiguration = v4;

  -[CHFriendInboxOutgoingTableViewCell setContentConfiguration:](self, "setContentConfiguration:", self->_currentContentConfiguration);
}

- (CHFriendInboxOutgoingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHFriendInboxOutgoingTableViewCell *v4;
  CHFriendInboxOutgoingTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  v4 = -[CHFriendInboxOutgoingTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[CHFriendInboxOutgoingTableViewCell _setupCell](v4, "_setupCell");
  return v5;
}

- (CHFriendInboxOutgoingTableViewCell)initWithFrame:(CGRect)a3
{
  CHFriendInboxOutgoingTableViewCell *v3;
  CHFriendInboxOutgoingTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  v3 = -[CHFriendInboxOutgoingTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendInboxOutgoingTableViewCell _setupCell](v3, "_setupCell");
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  -[CHFriendInboxOutgoingTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[CHFriendInboxOutgoingTableViewCell _setupCell](self, "_setupCell");
}

- (id)defaultContentConfiguration
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHFriendInboxOutgoingTableViewCell;
  v2 = -[CHFriendInboxOutgoingTableViewCell defaultContentConfiguration](&v10, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textProperties"));
  objc_msgSend(v4, "setLineBreakMode:", 4);

  objc_msgSend(v3, "setPrefersSideBySideTextAndSecondaryText:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "secondaryTextProperties"));
  objc_msgSend(v6, "setColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "secondaryTextProperties"));
  objc_msgSend(v8, "setFont:", v7);

  return v3;
}

+ (double)preferredHeight
{
  return 50.0;
}

- (void)setFriend:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_friend, a3);
  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullName"));
  -[UIListContentConfiguration setText:](self->_currentContentConfiguration, "setText:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CHActivitySharingAvatarProvider fetchAvatarImageForFriend:diameter:](CHActivitySharingAvatarProvider, "fetchAvatarImageForFriend:diameter:", v7, 30.0));
  -[UIListContentConfiguration setImage:](self->_currentContentConfiguration, "setImage:", v6);

  -[CHFriendInboxOutgoingTableViewCell setContentConfiguration:](self, "setContentConfiguration:", self->_currentContentConfiguration);
}

- (void)setDetailText:(id)a3
{
  -[UIListContentConfiguration setSecondaryText:](self->_currentContentConfiguration, "setSecondaryText:", a3);
  -[CHFriendInboxOutgoingTableViewCell setContentConfiguration:](self, "setContentConfiguration:", self->_currentContentConfiguration);
}

- (ASFriend)friend
{
  return self->_friend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_storeStrong((id *)&self->_currentContentConfiguration, 0);
}

@end
