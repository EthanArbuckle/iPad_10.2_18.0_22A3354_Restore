@implementation PKPaymentSetupListItem

- (PKPaymentSetupListItem)init
{
  PKPaymentSetupListItem *v2;
  id v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupListItem;
  v2 = -[PKPaymentSetupListItem init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (PKPaymentSetupListItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPaymentSetupListItem *v12;
  PKPaymentSetupListItem *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[PKPaymentSetupListItem init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_icon, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_badgeText, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_labelText, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[UIImage copy](self->_icon, "copy");
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  *(_BYTE *)(v5 + 11) = self->_selected;
  *(_BYTE *)(v5 + 10) = self->_loadingIndicatorVisible;
  *(_BYTE *)(v5 + 9) = self->_displayChevron;
  *(_BYTE *)(v5 + 8) = self->_displayInfo;
  *(_BYTE *)(v5 + 13) = self->_reserverSpaceForSelectedAccessory;
  *(_BYTE *)(v5 + 12) = self->_useMultiSelectAccessory;
  return (id)v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  objc_msgSend(v3, "safelyAddObject:", self->_badgeText);
  objc_msgSend(v3, "safelyAddObject:", self->_labelText);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && self->_selected == v4[11]
    && self->_loadingIndicatorVisible == v4[10]
    && self->_displayChevron == v4[9]
    && self->_displayInfo == v4[8]
    && self->_reserverSpaceForSelectedAccessory == v4[13]
    && self->_useMultiSelectAccessory == v4[12];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
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

- (BOOL)displayInfo
{
  return self->_displayInfo;
}

- (void)setDisplayInfo:(BOOL)a3
{
  self->_displayInfo = a3;
}

- (BOOL)displayChevron
{
  return self->_displayChevron;
}

- (void)setDisplayChevron:(BOOL)a3
{
  self->_displayChevron = a3;
}

- (BOOL)loadingIndicatorVisible
{
  return self->_loadingIndicatorVisible;
}

- (void)setLoadingIndicatorVisible:(BOOL)a3
{
  self->_loadingIndicatorVisible = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)useMultiSelectAccessory
{
  return self->_useMultiSelectAccessory;
}

- (void)setUseMultiSelectAccessory:(BOOL)a3
{
  self->_useMultiSelectAccessory = a3;
}

- (BOOL)reserverSpaceForSelectedAccessory
{
  return self->_reserverSpaceForSelectedAccessory;
}

- (void)setReserverSpaceForSelectedAccessory:(BOOL)a3
{
  self->_reserverSpaceForSelectedAccessory = a3;
}

- (NSString)badgeText
{
  return self->_badgeText;
}

- (void)setBadgeText:(id)a3
{
  objc_storeStrong((id *)&self->_badgeText, a3);
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_labelText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
