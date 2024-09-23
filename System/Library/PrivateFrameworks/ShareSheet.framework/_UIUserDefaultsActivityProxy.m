@implementation _UIUserDefaultsActivityProxy

- (_UIUserDefaultsActivityProxy)initWithIdentifier:(id)a3
{
  id v4;
  _UIUserDefaultsActivityProxy *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIUserDefaultsActivityProxy;
  v5 = -[_UIUserDefaultsActivityProxy init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIUserDefaultsActivityProxy)initWithCoder:(id)a3
{
  id v4;
  _UIUserDefaultsActivityProxy *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  SFProxyText *activityTitle;
  uint64_t v10;
  NSString *applicationBundleIdentifier;

  v4 = a3;
  v5 = -[_UIUserDefaultsActivityProxy init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_isDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDisabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    activityTitle = v5->_activityTitle;
    v5->_activityTitle = (SFProxyText *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

    v5->_iconImageSlotID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("iconImageSlotID"));
    v5->_canEdit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canEdit"));
    v5->_canMove = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canMove"));
    v5->_canHide = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canHide"));
    v5->_isHidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHidden"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDisabled, CFSTR("isDisabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityTitle, CFSTR("activityTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_iconImageSlotID, CFSTR("iconImageSlotID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canEdit, CFSTR("canEdit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canMove, CFSTR("canMove"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canHide, CFSTR("canHide"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isHidden, CFSTR("isHidden"));

}

- (id)labelSlot
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIUserDefaultsActivityProxy activityTitle](self, "activityTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "slotIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (SFProxyText)activityTitle
{
  return self->_activityTitle;
}

- (void)setActivityTitle:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitle, a3);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)iconImageSlotID
{
  return self->_iconImageSlotID;
}

- (void)setIconImageSlotID:(unsigned int)a3
{
  self->_iconImageSlotID = a3;
}

- (BOOL)canEdit
{
  return self->_canEdit;
}

- (void)setCanEdit:(BOOL)a3
{
  self->_canEdit = a3;
}

- (BOOL)canMove
{
  return self->_canMove;
}

- (void)setCanMove:(BOOL)a3
{
  self->_canMove = a3;
}

- (BOOL)canHide
{
  return self->_canHide;
}

- (void)setCanHide:(BOOL)a3
{
  self->_canHide = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
