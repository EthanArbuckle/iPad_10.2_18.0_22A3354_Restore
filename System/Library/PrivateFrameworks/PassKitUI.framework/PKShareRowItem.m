@implementation PKShareRowItem

- (NSCopying)identifier
{
  void *title;
  void *v4;
  NSCopying *v5;

  -[PKPassShare identifier](self->_share, "identifier");
  title = (void *)objc_claimAutoreleasedReturnValue();
  v4 = title;
  if (!title)
    title = self->_title;
  v5 = title;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKShareRowItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (self->_title)
    objc_msgSend(v3, "addObject:");
  if (self->_subtitle)
    objc_msgSend(v3, "addObject:");
  if (self->_icon)
    objc_msgSend(v3, "addObject:");
  v5 = PKCombinedHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKShareRowItem *v4;
  PKShareRowItem *v5;
  BOOL v6;

  v4 = (PKShareRowItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKShareRowItem isEqualToareRowItem:](self, "isEqualToareRowItem:", v5);

  return v6;
}

- (BOOL)isEqualToareRowItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    -[PKShareRowItem identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKEqualObjects() && PKEqualObjects() && PKEqualObjects())
      v7 = PKEqualObjects();
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAddShareItem
{
  return self->_isAddShareItem;
}

- (void)setIsAddShareItem:(BOOL)a3
{
  self->_isAddShareItem = a3;
}

- (BOOL)isStopSharingItem
{
  return self->_isStopSharingItem;
}

- (void)setIsStopSharingItem:(BOOL)a3
{
  self->_isStopSharingItem = a3;
}

- (PKPassShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (BOOL)showContactAvatar
{
  return self->_showContactAvatar;
}

- (void)setShowContactAvatar:(BOOL)a3
{
  self->_showContactAvatar = a3;
}

- (BOOL)hasFetchedContact
{
  return self->_hasFetchedContact;
}

- (void)setHasFetchedContact:(BOOL)a3
{
  self->_hasFetchedContact = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (BOOL)shouldCenterText
{
  return self->_shouldCenterText;
}

- (void)setShouldCenterText:(BOOL)a3
{
  self->_shouldCenterText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
