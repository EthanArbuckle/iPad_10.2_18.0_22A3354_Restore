@implementation UserProfileLink

- (UserProfileLink)initWithTitle:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  UserProfileLink *v8;
  NSString *v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UserProfileLink;
  v8 = -[UserProfileLink init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = v9;

    objc_storeStrong((id *)&v8->_icon, a4);
  }

  return v8;
}

- (id)description
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[UserProfileLink userProfileLinkType](self, "userProfileLinkType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink title](self, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink subtitle](self, "subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UserProfileLink <%p> type:%ld title:%@ subtitle:%@"), self, v3, v4, v5));

  return v6;
}

- (int64_t)userProfileLinkType
{
  return self->_userProfileLinkType;
}

- (void)setUserProfileLinkType:(int64_t)a3
{
  self->_userProfileLinkType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
