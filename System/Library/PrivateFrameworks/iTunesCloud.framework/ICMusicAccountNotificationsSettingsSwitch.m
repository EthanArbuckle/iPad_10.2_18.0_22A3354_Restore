@implementation ICMusicAccountNotificationsSettingsSwitch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDictionary, 0);
  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

- (ICMusicAccountNotificationsSettingsSwitch)initWithItemResponseDictionary:(id)a3
{
  id v5;
  ICMusicAccountNotificationsSettingsSwitch *v6;
  ICMusicAccountNotificationsSettingsSwitch *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *valueDictionary;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicAccountNotificationsSettingsSwitch;
  v6 = -[ICMusicAccountNotificationsSettingsSwitch init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemResponseDictionary, a3);
    -[NSDictionary objectForKey:](v7->_itemResponseDictionary, "objectForKey:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v9 = objc_msgSend(v8, "mutableCopy");
      valueDictionary = v7->_valueDictionary;
      v7->_valueDictionary = (NSMutableDictionary *)v9;

    }
  }

  return v7;
}

- (BOOL)isToggled
{
  NSMutableDictionary *valueDictionary;
  void *v3;
  char v4;

  valueDictionary = self->_valueDictionary;
  if (!valueDictionary)
    return 0;
  -[NSMutableDictionary objectForKey:](valueDictionary, "objectForKey:", ICMusicAccountNotificationsSettingsSwitchIsToggledKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (ICMusicAccountNotificationsSettingsSwitch)initWithToggleState:(BOOL)a3 hasBeenToggled:(BOOL)a4 identifier:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  ICMusicAccountNotificationsSettingsSwitch *v9;
  id v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *itemResponseDictionary;
  NSDictionary *v17;
  NSMutableDictionary *valueDictionary;
  objc_super v20;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICMusicAccountNotificationsSettingsSwitch;
  v9 = -[ICMusicAccountNotificationsSettingsSwitch init](&v20, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    v11 = MEMORY[0x1E0C9AA70];
    v12 = (NSMutableDictionary *)objc_msgSend(v10, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, ICMusicAccountNotificationsSettingsSwitchIsToggledKey);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, CFSTR("dataUpdated"));

    v15 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v11);
    -[NSDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v8, ICMusicAccountNotificationsSettingsSwitchIdentifierKey);
    -[NSDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v12, CFSTR("value"));
    itemResponseDictionary = v9->_itemResponseDictionary;
    v9->_itemResponseDictionary = v15;
    v17 = v15;

    valueDictionary = v9->_valueDictionary;
    v9->_valueDictionary = v12;

  }
  return v9;
}

- (NSString)identifier
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", ICMusicAccountNotificationsSettingsSwitchIdentifierKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (_NSIsNSString())
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (void)setIsToggled:(BOOL)a3
{
  id v4;

  if (self->_valueDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueDictionary, "setObject:forKeyedSubscript:", v4, ICMusicAccountNotificationsSettingsSwitchIsToggledKey);

  }
}

- (BOOL)hasBeenPreviouslyToggled
{
  NSMutableDictionary *valueDictionary;
  void *v3;
  char v4;

  valueDictionary = self->_valueDictionary;
  if (!valueDictionary)
    return 0;
  -[NSMutableDictionary objectForKey:](valueDictionary, "objectForKey:", CFSTR("dataUpdated"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setHasBeenPreviouslyToggled:(BOOL)a3
{
  id v4;

  if (self->_valueDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("dataUpdated"));

  }
}

- (NSDictionary)itemResponseDictionary
{
  return self->_itemResponseDictionary;
}

@end
