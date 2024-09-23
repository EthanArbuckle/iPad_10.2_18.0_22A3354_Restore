@implementation SFHUDBannerModel

+ (id)pairedUnlockModelWithWatchName:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  SFHUDBannerModel *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[SFHUDBannerModel initWithType:priority:watchName:needsLockButton:needsUpdate:]([SFHUDBannerModel alloc], "initWithType:priority:watchName:needsLockButton:needsUpdate:", 0, 2, v7, v6, v5);

  return v8;
}

+ (id)onenessUnlockedModel
{
  return -[SFHUDBannerModel initWithType:priority:watchName:needsLockButton:needsUpdate:]([SFHUDBannerModel alloc], "initWithType:priority:watchName:needsLockButton:needsUpdate:", 1, 1, 0, 0, 0);
}

+ (id)pencilModel
{
  return -[SFHUDBannerModel initWithType:priority:watchName:needsLockButton:needsUpdate:]([SFHUDBannerModel alloc], "initWithType:priority:watchName:needsLockButton:needsUpdate:", 2, 3, 0, 0, 0);
}

- (SFHUDBannerModel)initWithType:(int64_t)a3 priority:(int)a4 watchName:(id)a5 needsLockButton:(BOOL)a6 needsUpdate:(BOOL)a7
{
  id v13;
  SFHUDBannerModel *v14;
  SFHUDBannerModel *v15;
  objc_super v17;

  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFHUDBannerModel;
  v14 = -[SFHUDBannerModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_priority = a4;
    objc_storeStrong((id *)&v14->_watchName, a5);
    v15->_needsLockButton = a6;
    v15->_needsUpdate = a7;
  }

  return v15;
}

+ (id)descriptionForType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR(".pairedUnlock");
  if (a3 == 1)
    v3 = CFSTR(".onenessUnlocked");
  if (a3 == 2)
    return CFSTR(".pencil");
  else
    return (id)v3;
}

- (SFHUDBannerModel)initWithCoder:(id)a3
{
  id v4;
  SFHUDBannerModel *v5;
  void *v6;
  uint64_t v7;
  NSString *watchName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFHUDBannerModel;
  v5 = -[SFHUDBannerModel init](&v10, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_priority = objc_msgSend(v4, "decodeIntForKey:", CFSTR("priority"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    watchName = v5->_watchName;
    v5->_watchName = (NSString *)v7;

    v5->_needsLockButton = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsLockButton"));
    v5->_needsUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsUpdate"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_watchName, CFSTR("watchName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsLockButton, CFSTR("needsLockButton"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsUpdate, CFSTR("needsUpdate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)watchName
{
  return self->_watchName;
}

- (BOOL)needsLockButton
{
  return self->_needsLockButton;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchName, 0);
}

@end
