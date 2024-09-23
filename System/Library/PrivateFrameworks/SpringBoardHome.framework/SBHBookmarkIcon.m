@implementation SBHBookmarkIcon

- (SBHBookmarkIcon)initWithBookmark:(id)a3
{
  id v5;
  void *v6;
  SBHBookmarkIcon *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)SBHBookmarkIcon;
  v7 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v9, sel_initWithLeafIdentifier_applicationBundleID_, v6, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_bookmark, a3);
    -[SBLeafIcon addIconDataSource:](v7, "addIconDataSource:", v5);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBookmark:", self->_bookmark);
}

- (void)setBookmark:(id)a3
{
  SBHBookmark *v5;
  SBHBookmark *v6;

  v5 = (SBHBookmark *)a3;
  if (self->_bookmark != v5)
  {
    v6 = v5;
    -[SBLeafIcon removeIconDataSource:](self, "removeIconDataSource:");
    objc_storeStrong((id *)&self->_bookmark, a3);
    -[SBLeafIcon addIconDataSource:](self, "addIconDataSource:", self->_bookmark);
    -[SBIcon _notifyImageDidUpdate](self, "_notifyImageDidUpdate");
    -[SBIcon _notifyAccessoriesDidUpdate](self, "_notifyAccessoriesDidUpdate");
    v5 = v6;
  }

}

- (UIWebClip)webClip
{
  return -[SBHBookmark webClip](self->_bookmark, "webClip");
}

- (CPSWebClip)appClip
{
  return -[SBHBookmark appClip](self->_bookmark, "appClip");
}

- (NSURL)launchURL
{
  return -[SBHBookmark launchURL](self->_bookmark, "launchURL");
}

- (BOOL)displaysShareBookmarkShortcutItem
{
  char v3;
  void *v4;
  void *v5;

  if (!-[SBHBookmarkIcon _isSaneURL](self))
    return 0;
  if (-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
    return 1;
  -[SBHBookmarkIcon webClip](self, "webClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
  else
    v3 = 1;

  return v3;
}

- (uint64_t)_isSaneURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "webClip");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isFileURL") ^ 1;
  return v3;
}

- (BOOL)displaysAppStoreURLShortcutItem
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
    return 0;
  -[SBHBookmarkIcon appClip](self, "appClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullAppStoreURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 != 0;
  return v5;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  objc_super v4;

  if (-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBHBookmarkIcon;
  return -[SBIcon canBeAddedToMultiItemDrag](&v4, sel_canBeAddedToMultiItemDrag);
}

- (BOOL)canBeAddedToSubfolder
{
  objc_super v4;

  if (-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBHBookmarkIcon;
  return -[SBIcon canBeAddedToSubfolder](&v4, sel_canBeAddedToSubfolder);
}

- (id)uninstallAlertTitle
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
  {
    SBHBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("UNINSTALL_APPCLIP_TITLE");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!-[SBHBookmarkIcon isWebAppIcon](self, "isWebAppIcon"))
  {
    SBHBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("UNINSTALL_BOOKMARK_TITLE");
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  SBHBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNINSTALL_WEBAPP_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)uninstallAlertBody
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    SBHBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("UNINSTALL_APPCLIP_BODY_DELETE_DATA");
LABEL_6:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIcon displayName](self, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (!-[SBHBookmarkIcon isWebAppIcon](self, "isWebAppIcon"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    SBHBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("UNINSTALL_BOOKMARK_BODY_DELETE_DATA");
    goto LABEL_6;
  }
  SBHBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNINSTALL_WEBAPP_BODY_DELETE_DATA"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (id)draggingUserActivity
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SBHBookmarkIcon isAppClipIcon](self, "isAppClipIcon"))
  {
    -[SBHBookmarkIcon bookmark](self, "bookmark");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webClip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appClipUserActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isBookmarkIcon
{
  return 1;
}

- (BOOL)isAppClipIcon
{
  return -[SBHBookmark isAppClip](self->_bookmark, "isAppClip");
}

- (BOOL)isWebAppIcon
{
  void *v3;
  void *v4;
  char v5;

  -[SBHBookmarkIcon webClip](self, "webClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBHBookmarkIcon webClip](self, "webClip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "needsWebAppDeletionStrings");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_sbhIconLibraryOverrideCollationSectionTitle
{
  void *v3;
  int v4;
  objc_super v6;

  -[SBHBookmarkIcon webClip](self, "webClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppClip");

  if (v4)
    return (id)*MEMORY[0x1E0DC53E8];
  v6.receiver = self;
  v6.super_class = (Class)SBHBookmarkIcon;
  -[SBIcon _sbhIconLibraryOverrideCollationSectionTitle](&v6, sel__sbhIconLibraryOverrideCollationSectionTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBHBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end
