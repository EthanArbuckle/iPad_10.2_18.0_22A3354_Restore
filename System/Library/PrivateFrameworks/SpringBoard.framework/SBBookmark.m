@implementation SBBookmark

- (SBBookmark)initWithWebClip:(id)a3
{
  id v4;
  SBBookmark *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBookmark;
  v5 = -[SBHBookmark initWithWebClip:](&v9, sel_initWithWebClip_, v4);
  if (v5)
  {
    objc_msgSend(v4, "placeholderBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&v5->_dataStore, v7);
    if (v6)

  }
  return v5;
}

- (NSCopying)badgeValue
{
  void *v2;
  char v4;

  if ((*((_BYTE *)self + 32) & 6) != 0)
  {
    v2 = 0;
  }
  else
  {
    -[FBSApplicationDataStore safeObjectForKey:ofType:](self->_dataStore, "safeObjectForKey:ofType:", CFSTR("SBBookmarkBadgeKey"), objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v4 = 1;
    else
      v4 = 2;
    *((_BYTE *)self + 32) = *((_BYTE *)self + 32) & 0xF8 | v4;
  }
  return (NSCopying *)v2;
}

- (void)setBadgeValue:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  void *v7;
  FBSApplicationDataStore *dataStore;
  char v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (!v4
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v4 = v10, (isKindOfClass & 1) != 0)
    || (objc_opt_class(), v6 = objc_opt_isKindOfClass(), v4 = v10, (v6 & 1) != 0))
  {
    if (objc_msgSend(v4, "isEqual:", &unk_1E91D2078))
    {

      v10 = 0;
    }
    -[SBBookmark badgeValue](self, "badgeValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v10) & 1) == 0)
    {
      dataStore = self->_dataStore;
      if (v10 && dataStore)
      {
        -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:");
        v9 = 1;
      }
      else
      {
        -[FBSApplicationDataStore removeObjectForKey:](dataStore, "removeObjectForKey:", CFSTR("SBBookmarkBadgeKey"));
        v9 = 2;
      }
      *((_BYTE *)self + 32) = *((_BYTE *)self + 32) & 0xF8 | v9;
      -[SBBookmark _noteIconDataSourceDidChange](self, "_noteIconDataSourceDidChange");
    }

  }
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isBookmarkIcon"))
  {
    objc_msgSend(v8, "applicationToLaunch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[SBHBookmark webClip](self, "webClip"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isAppClip"),
          v12,
          v13))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "actions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      objc_opt_self();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "activationSettings");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateApplication:fromIcon:location:activationSettings:actions:", v11, v8, v9, v17, v14);

    }
  }

  return 1;
}

- (BOOL)isTimedOutForIcon:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SBHBookmark webClip](self, "webClip", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAppClip"))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationWithBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "isBlockedForScreenTimeExpiration");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_noteIconDataSourceDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAAA60], self, 0);

}

- (FBSApplicationDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
