@implementation CHFriendInboxTableViewCell

- (void)_setupCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  -[CHFriendInboxTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v7, "setFont:", v6);

  -[CHFriendInboxTableViewCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (CHFriendInboxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHFriendInboxTableViewCell *v4;
  CHFriendInboxTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHFriendInboxTableViewCell;
  v4 = -[CHFriendInboxTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[CHFriendInboxTableViewCell _setupCell](v4, "_setupCell");
  return v5;
}

- (CHFriendInboxTableViewCell)initWithFrame:(CGRect)a3
{
  CHFriendInboxTableViewCell *v3;
  CHFriendInboxTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendInboxTableViewCell;
  v3 = -[CHFriendInboxTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendInboxTableViewCell _setupCell](v3, "_setupCell");
  return v4;
}

+ (double)preferredHeight
{
  return UITableViewAutomaticDimension;
}

- (void)setFriend:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHActivitySharingAvatarProvider fetchAvatarImageForFriend:diameter:](CHActivitySharingAvatarProvider, "fetchAvatarImageForFriend:diameter:", v6, 30.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxTableViewCell imageView](self, "imageView"));
  objc_msgSend(v10, "setImage:", v9);

  -[CHFriendInboxTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

@end
