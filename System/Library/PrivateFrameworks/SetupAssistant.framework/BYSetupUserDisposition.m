@implementation BYSetupUserDisposition

- (BYSetupUserDisposition)init
{
  void *v3;
  BYSetupUserDisposition *v4;

  +[BYPreferencesController buddyPreferencesExcludedFromBackup](BYPreferencesController, "buddyPreferencesExcludedFromBackup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BYSetupUserDisposition initWithPreferences:](self, "initWithPreferences:", v3);

  return v4;
}

- (BYSetupUserDisposition)initWithPreferences:(id)a3
{
  id v4;
  BYSetupUserDisposition *v5;
  BYSetupUserDisposition *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYSetupUserDisposition;
  v5 = -[BYSetupUserDisposition init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BYSetupUserDisposition _loadDataFromPreferences:](v5, "_loadDataFromPreferences:", v4);

  return v6;
}

- (BYSetupUserDisposition)initWithProductVersion:(id)a3 buildVersion:(id)a4 date:(id)a5
{
  id v9;
  id v10;
  id v11;
  BYSetupUserDisposition *v12;
  BYSetupUserDisposition *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BYSetupUserDisposition;
  v12 = -[BYSetupUserDisposition init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_productVersion, a3);
    objc_storeStrong((id *)&v13->_buildVersion, a4);
    objc_storeStrong((id *)&v13->_date, a5);
  }

  return v13;
}

- (BYSetupUserDisposition)initWithProductVersion:(id)a3 buildVersion:(id)a4 date:(id)a5 newUser:(BOOL)a6 child:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  BYSetupUserDisposition *v9;
  uint64_t v10;
  NSNumber *newUser;
  uint64_t v12;
  NSNumber *child;

  v7 = a7;
  v8 = a6;
  v9 = -[BYSetupUserDisposition initWithProductVersion:buildVersion:date:](self, "initWithProductVersion:buildVersion:date:", a3, a4, a5);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    newUser = v9->_newUser;
    v9->_newUser = (NSNumber *)v10;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    child = v9->_child;
    v9->_child = (NSNumber *)v12;

  }
  return v9;
}

- (BYSetupUserDisposition)initWithNewUser:(BOOL)a3 child:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BYSetupUserDisposition *v12;

  v4 = a4;
  v5 = a3;
  +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BYSetupUserDisposition initWithProductVersion:buildVersion:date:newUser:child:](self, "initWithProductVersion:buildVersion:date:newUser:child:", v8, v10, v11, v5, v4);

  return v12;
}

- (BYSetupUserDisposition)initWithChild:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BYSetupUserDisposition *v10;
  uint64_t v11;
  NSNumber *child;

  v3 = a3;
  +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[BYDeviceConfiguration currentConfiguration](BYDeviceConfiguration, "currentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BYSetupUserDisposition initWithProductVersion:buildVersion:date:](self, "initWithProductVersion:buildVersion:date:", v6, v8, v9);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = objc_claimAutoreleasedReturnValue();
    child = v10->_child;
    v10->_child = (NSNumber *)v11;

  }
  return v10;
}

+ (id)current
{
  if (current_onceToken != -1)
    dispatch_once(&current_onceToken, &__block_literal_global_11);
  return (id)current_disposition;
}

void __33__BYSetupUserDisposition_current__block_invoke()
{
  BYSetupUserDisposition *v0;
  void *v1;

  v0 = objc_alloc_init(BYSetupUserDisposition);
  v1 = (void *)current_disposition;
  current_disposition = (uint64_t)v0;

}

- (void)persistUsingPreferences:(id)a3
{
  id v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = a3;
  -[BYSetupUserDisposition _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:persistImmediately:", v5, CFSTR("disposition"), 1);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.purplebuddy.userdisposition.updated"), 0, 0, 1u);
}

- (void)_loadDataFromPreferences:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "objectForKey:", CFSTR("disposition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "valueForKey:", CFSTR("date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[BYSetupUserDisposition setDate:](self, "setDate:", v5);
    objc_msgSend(v10, "valueForKey:", CFSTR("productVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[BYSetupUserDisposition setProductVersion:](self, "setProductVersion:", v6);
    objc_msgSend(v10, "valueForKey:", CFSTR("buildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[BYSetupUserDisposition setBuildVersion:](self, "setBuildVersion:", v7);
    objc_msgSend(v10, "valueForKey:", CFSTR("child"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[BYSetupUserDisposition setChild:](self, "setChild:", v8);
    objc_msgSend(v10, "valueForKey:", CFSTR("newUser"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[BYSetupUserDisposition setNewUser:](self, "setNewUser:", v9);

    v4 = v10;
  }

}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[BYSetupUserDisposition date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BYSetupUserDisposition date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("date"));

  }
  -[BYSetupUserDisposition productVersion](self, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BYSetupUserDisposition productVersion](self, "productVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("productVersion"));

  }
  -[BYSetupUserDisposition buildVersion](self, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BYSetupUserDisposition buildVersion](self, "buildVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("buildVersion"));

  }
  -[BYSetupUserDisposition isChild](self, "isChild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[BYSetupUserDisposition isChild](self, "isChild");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("child"));

  }
  -[BYSetupUserDisposition isNewUser](self, "isNewUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[BYSetupUserDisposition isNewUser](self, "isNewUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("newUser"));

  }
  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSNumber)isNewUser
{
  return self->_newUser;
}

- (void)setNewUser:(id)a3
{
  objc_storeStrong((id *)&self->_newUser, a3);
}

- (NSNumber)isChild
{
  return self->_child;
}

- (void)setChild:(id)a3
{
  objc_storeStrong((id *)&self->_child, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_child, 0);
  objc_storeStrong((id *)&self->_newUser, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
