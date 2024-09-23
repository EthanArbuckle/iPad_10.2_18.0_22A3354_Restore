@implementation SBLeafIcon

- (int64_t)labelAccessoryType
{
  void *v3;
  id v4;
  int64_t v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (id)objc_msgSend(v3, "labelAccessoryTypeForIcon:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon labelAccessoryType](&v7, sel_labelAccessoryType);
  }
  v5 = (int64_t)v4;

  return v5;
}

- (int64_t)accessoryTypeForLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (id)objc_msgSend(v5, "accessoryTypeForIcon:", self);
  }
  else
  {
    if (-[SBLeafIcon isTimedOut](self, "isTimedOut"))
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[SBLeafIcon badgeNumberOrString](self, "badgeNumberOrString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v7 = 1;
      goto LABEL_8;
    }
    v10.receiver = self;
    v10.super_class = (Class)SBLeafIcon;
    v6 = -[SBIcon accessoryTypeForLocation:](&v10, sel_accessoryTypeForLocation_, v4);
  }
  v7 = (int64_t)v6;
LABEL_8:

  return v7;
}

- (id)badgeNumberOrString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon overrideBadgeNumberOrString](self, "overrideBadgeNumberOrString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBIcon overrideBadgeNumberOrString](self, "overrideBadgeNumberOrString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "badgeNumberOrStringForIcon:", self);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLeafIcon;
    -[SBIcon badgeNumberOrString](&v8, sel_badgeNumberOrString);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (-[SBLeafIcon isTimedOut](self, "isTimedOut"))
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(v6, "integerValue"))
    {
LABEL_12:

      v6 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "isEqualToString:", &stru_1E8D8E958))
      goto LABEL_12;
  }

  return v6;
}

- (BOOL)isTimedOut
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTimedOutForIcon:", self);

  return v6;
}

- (SBLeafIconDataSource)activeDataSource
{
  return self->_activeDataSource;
}

- (id)accessoryTextForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[SBLeafIcon badgeNumberOrString](self, "badgeNumberOrString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)objc_opt_class(),
        -[SBIcon overrideBadgeNumberOrString](self, "overrideBadgeNumberOrString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "formattedBadgeNumberOrString:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    -[SBLeafIcon activeDataSource](self, "activeDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_7:
      v11.receiver = self;
      v11.super_class = (Class)SBLeafIcon;
      -[SBIcon accessoryTextForLocation:](&v11, sel_accessoryTextForLocation_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v9, "formattedAccessoryStringForIcon:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_7;
  }
LABEL_8:

  return v8;
}

+ (id)formattedBadgeNumberOrString:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "integerValue") >= 1)
  {
    if (formattedBadgeNumberOrString__onceToken != -1)
      dispatch_once(&formattedBadgeNumberOrString__onceToken, &__block_literal_global_52);
    objc_msgSend((id)formattedBadgeNumberOrString__decimalFormatter, "stringFromNumber:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;

    v4 = v5;
  }
  if (!objc_msgSend(v4, "length") || objc_msgSend(v4, "isEqualToString:", CFSTR("*")))
  {

    v4 = 0;
  }

  return v4;
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLeafIcon;
  -[SBIcon removeObserver:](&v3, sel_removeObserver_, a3);
}

- (BOOL)isLaunchEnabled
{
  void *v3;
  char v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "iconAllowsLaunch:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)isLaunchDisabledForObscuredReason
{
  void *v3;
  char v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "iconDisallowsLaunchForObscuredReason:", self);
  else
    v4 = 0;

  return v4;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLeafIcon;
  -[SBIcon addObserver:](&v3, sel_addObserver_, a3);
}

- (NSString)applicationBundleID
{
  return self->_applicationBundleID;
}

- (id)displayNameForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icon:displayNameForLocation:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canTruncateLabel
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "iconCanTruncateLabel:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon canTruncateLabel](&v7, sel_canTruncateLabel);
  }
  v5 = v4;

  return v5;
}

- (BOOL)canTightenLabel
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "iconCanTightenLabel:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon canTightenLabel](&v7, sel_canTightenLabel);
  }
  v5 = v4;

  return v5;
}

- (id)statusDescriptionForLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "icon:statusDescriptionForLocation:", self, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLeafIcon;
    -[SBIcon statusDescriptionForLocation:](&v9, sel_statusDescriptionForLocation_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)leafIdentifier
{
  return self->_leafIdentifier;
}

- (BOOL)isLeafIcon
{
  return 1;
}

- (id)tags
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "tagsForIcon:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    -[SBIcon tags](&v7, sel_tags);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__SBLeafIcon_enumerateObserversUsingBlock___block_invoke;
    v7[3] = &unk_1E8D8ADF0;
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)SBLeafIcon;
    -[SBIcon enumerateObserversUsingBlock:](&v6, sel_enumerateObserversUsingBlock_, v7);

  }
}

- (void)_noteActiveDataSourceDidChangeNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  SBLeafIcon *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218754;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    v14 = 2112;
    v15 = v4;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p-%{public}@ Data source did change: %@ (%{public}@)", (uint8_t *)&v10, 0x2Au);

  }
  -[SBLeafIcon _noteActiveDataSourceDidChangeAndReloadIcon:](self, "_noteActiveDataSourceDidChangeAndReloadIcon:", 0);

}

- (void)_noteActiveDataSourceDidChangeAndReloadIcon:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[SBIcon _notifyAccessoriesDidUpdate](self, "_notifyAccessoriesDidUpdate");
  -[SBIcon _notifyLaunchEnabledDidChange](self, "_notifyLaunchEnabledDidChange");
  if (v3)
    -[SBIcon reloadIconImage](self, "reloadIconImage");
}

- (int64_t)progressState
{
  void *v3;
  id v4;
  int64_t v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (id)objc_msgSend(v3, "progressStateForIcon:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon progressState](&v7, sel_progressState);
  }
  v5 = (int64_t)v4;

  return v5;
}

- (double)progressPercent
{
  void *v3;
  double v4;
  double v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "progressPercentForIcon:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    -[SBIcon progressPercent](&v7, sel_progressPercent);
  }
  v5 = v4;

  return v5;
}

- (BOOL)isProgressPaused
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "isProgressPausedForIcon:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon isProgressPaused](&v7, sel_isProgressPaused);
  }
  v5 = v4;

  return v5;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    SBLogIcon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBLeafIcon generateIconImageWithInfo:].cold.1();

  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "icon:imageWithInfo:", self, v10, v9, v8, v7),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v16.receiver = self;
    v16.super_class = (Class)SBLeafIcon;
    -[SBIcon generateIconImageWithInfo:](&v16, sel_generateIconImageWithInfo_, v10, v9, v8, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (BOOL)leafIdentifierAndApplicationBundleIDMatches
{
  NSString *leafIdentifier;

  leafIdentifier = self->_leafIdentifier;
  return leafIdentifier
      && self->_applicationBundleID
      && -[NSString isEqualToString:](leafIdentifier, "isEqualToString:");
}

- (SBLeafIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  id v6;
  id v7;
  SBLeafIcon *v8;
  uint64_t v9;
  NSString *leafIdentifier;
  uint64_t v11;
  NSString *applicationBundleID;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *dataSources;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBLeafIcon;
  v8 = -[SBIcon init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    leafIdentifier = v8->_leafIdentifier;
    v8->_leafIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    applicationBundleID = v8->_applicationBundleID;
    v8->_applicationBundleID = (NSString *)v11;

    v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    dataSources = v8->_dataSources;
    v8->_dataSources = v13;

  }
  return v8;
}

- (void)_updateActiveDataSource
{
  SBLeafIconDataSource *v3;
  SBLeafIconDataSource **p_activeDataSource;
  void *v5;
  SBLeafIconDataSource *v6;
  SBLeafIconDataSource *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  SBLeafIconDataSource *v12;
  SBLeafIcon *v13;
  SBLeafIconDataSource *v14;
  int v15;
  SBLeafIcon *v16;
  __int16 v17;
  SBLeafIconDataSource *v18;
  __int16 v19;
  SBLeafIcon *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_coalescedDataSourceUpdates)
  {
    -[SBLeafIcon _bestDataSource](self, "_bestDataSource");
    v3 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
    p_activeDataSource = &self->_activeDataSource;
    if (v3 != self->_activeDataSource)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *p_activeDataSource;
      if (*p_activeDataSource)
      {
        objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidChangeNotification"));
        objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidGenerateImageNotification"), *p_activeDataSource);
        v7 = *p_activeDataSource;
        *p_activeDataSource = 0;

      }
      if (v3)
      {
        SBLogIcon();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

        SBLogIcon();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v12 = *p_activeDataSource;
            v15 = 138412802;
            v16 = (SBLeafIcon *)v12;
            v17 = 2112;
            v18 = v3;
            v19 = 2112;
            v20 = self;
            _os_log_debug_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEBUG, "Changing active data source from %@ to %@: %@", (uint8_t *)&v15, 0x20u);
          }
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 138412290;
            v16 = self;
            _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Changing active data source: %@", (uint8_t *)&v15, 0xCu);
          }

          SBLogIcon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            SBHUniqueIdentifierOfDataSource(v6);
            v13 = (SBLeafIcon *)objc_claimAutoreleasedReturnValue();
            SBHUniqueIdentifierOfDataSource(v3);
            v14 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
            v15 = 138543618;
            v16 = v13;
            v17 = 2114;
            v18 = v14;
            _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Changing from data souce: %{public}@ to data source:%{public}@.", (uint8_t *)&v15, 0x16u);

          }
        }

        objc_storeStrong((id *)&self->_activeDataSource, v3);
        objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__noteActiveDataSourceDidChangeNotification_, CFSTR("SBLeafIconDataSourceDidChangeNotification"), *p_activeDataSource);
        objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__noteActiveDataSourceDidGenerateImageNotification_, CFSTR("SBLeafIconDataSourceDidGenerateImageNotification"), *p_activeDataSource);
      }
      -[SBLeafIcon didChangeActiveDataSource:](self, "didChangeActiveDataSource:", v6);
      -[SBLeafIcon _noteActiveDataSourceDidChangeAndReloadIcon:](self, "_noteActiveDataSourceDidChangeAndReloadIcon:", 1);

    }
  }
}

- (void)didChangeActiveDataSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SBLeafIcon_didChangeActiveDataSource___block_invoke;
  v6[3] = &unk_1E8D8AE18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBLeafIcon enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

- (void)addIconDataSource:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5 && (-[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_dataSources, "addObject:", v5);
    -[SBLeafIcon didAddIconDataSource:](self, "didAddIconDataSource:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__noteDataSourceDidInvalidateNotification_, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v5);

  }
  -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");

}

- (SBLeafIconDataSource)_bestDataSource
{
  SBLeafIconDataSource *manuallySetDataSource;

  manuallySetDataSource = self->_manuallySetDataSource;
  if (manuallySetDataSource)
    return manuallySetDataSource;
  -[SBLeafIcon _fallbackBestDataSource](self, "_fallbackBestDataSource");
  return (SBLeafIconDataSource *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBLeafIconDataSource)_fallbackBestDataSource
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_dataSources;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v6)
        {
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "priorityForIcon:", self, (_QWORD)v13);
          if (v10 <= objc_msgSend(v6, "priorityForIcon:", self))
            continue;
        }
        v11 = v9;

        v6 = v11;
      }
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return (SBLeafIconDataSource *)v6;
}

- (BOOL)canGenerateIconsInBackground
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "canGenerateIconsInBackgroundForIcon:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon canGenerateIconsInBackground](&v7, sel_canGenerateIconsInBackground);
  }
  v5 = v4;

  return v5;
}

- (BOOL)performLaunchFromLocation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIcon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "SBLeafIcon launchFromLocation:%@ context:%@ activeDataSource:%@", (uint8_t *)&v12, 0x20u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v8, "icon:launchFromLocation:context:", self, v6, v7);
  else
    v10 = 0;

  return v10;
}

- (BOOL)isUninstallSupported
{
  void *v3;
  char v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "iconSupportsUninstall:", self);
  else
    v4 = 1;

  return v4;
}

- (SBLeafIcon)init
{

  return 0;
}

- (SBLeafIcon)initWithUniqueLeafIdentifier
{
  void *v3;
  void *v4;
  SBLeafIcon *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](self, "initWithLeafIdentifier:applicationBundleID:", v4, 0);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidGenerateImageNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBLeafIcon;
  -[SBLeafIcon dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBLeafIcon copyWithLeafIdentifier:](self, "copyWithLeafIdentifier:", self->_leafIdentifier);
}

- (id)copyWithLeafIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSMutableOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLeafIdentifier:applicationBundleID:", v4, self->_applicationBundleID);
  objc_msgSend(v5, "_setPropertiesFromIcon:", self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_dataSources;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addIconDataSource:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_setPropertiesFromIcon:(id)a3
{
  id *v4;
  void *v5;
  char isKindOfClass;
  objc_super v7;

  v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SBLeafIcon;
  -[SBIcon _setPropertiesFromIcon:](&v7, sel__setPropertiesFromIcon_, v4);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_storeStrong((id *)&self->_dataSourceAtUninstallation, v4[13]);

}

- (BOOL)hasObserver:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLeafIcon;
  return -[SBIcon hasObserver:](&v4, sel_hasObserver_, a3);
}

uint64_t __43__SBLeafIcon_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performCoalescedDataSourceUpdate:(id)a3
{
  unint64_t v4;

  ++self->_coalescedDataSourceUpdates;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = self->_coalescedDataSourceUpdates - 1;
  self->_coalescedDataSourceUpdates = v4;
  if (!v4)
    -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");
}

void __40__SBLeafIcon_didChangeActiveDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "leafIcon:didChangeActiveDataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setActiveDataSource:(id)a3
{
  SBLeafIconDataSource *v4;
  SBLeafIconDataSource *manuallySetDataSource;
  id v6;

  v4 = (SBLeafIconDataSource *)a3;
  if (v4 && (-[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't set an active data source with a data source that isn't in the list"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  manuallySetDataSource = self->_manuallySetDataSource;
  self->_manuallySetDataSource = v4;

  -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");
}

- (void)selectNextActiveDataSource
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  -[SBLeafIcon iconDataSources](self, "iconDataSources");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "indexOfObject:", v3) + 1;
  if (v4 >= objc_msgSend(v6, "count"))
    objc_msgSend(v6, "firstObject");
  else
    objc_msgSend(v6, "objectAtIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon setActiveDataSource:](self, "setActiveDataSource:", v5);

}

- (unint64_t)indexOfActiveDataSource
{
  void *v3;
  unint64_t v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[NSMutableOrderedSet indexOfObject:](self->_dataSources, "indexOfObject:", v3);
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)addIconDataSources:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v9
          && (-[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) == 0)
        {
          -[NSMutableOrderedSet addObject:](self->_dataSources, "addObject:", v9);
          -[SBLeafIcon didAddIconDataSource:](self, "didAddIconDataSource:", v9);
          objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__noteDataSourceDidInvalidateNotification_, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");

}

- (void)insertIconDataSource:(id)a3 beforeIconDataSource:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && (-[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", v9) & 1) == 0)
  {
    if (!v6
      || (v7 = -[NSMutableOrderedSet indexOfObject:](self->_dataSources, "indexOfObject:", v6),
          v7 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v7 = 0;
    }
    -[NSMutableOrderedSet insertObject:atIndex:](self->_dataSources, "insertObject:atIndex:", v9, v7);
    -[SBLeafIcon didAddIconDataSource:](self, "didAddIconDataSource:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__noteDataSourceDidInvalidateNotification_, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v9);

  }
  -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");

}

- (void)insertIconDataSources:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)-[NSMutableOrderedSet copy](self->_dataSources, "copy");
  v16 = v7;
  -[NSMutableOrderedSet insertObjects:atIndexes:](self->_dataSources, "insertObjects:atIndexes:", v6, v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
        {
          -[SBLeafIcon didAddIconDataSource:](self, "didAddIconDataSource:", v14);
          objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__noteDataSourceDidInvalidateNotification_, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");
}

- (void)removeIconDataSource:(id)a3
{
  void *v4;
  SBLeafIconDataSource *v5;
  SBLeafIconDataSource *activeDataSource;
  SBLeafIconDataSource *v7;

  v7 = (SBLeafIconDataSource *)a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", v7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v7);
    -[NSMutableOrderedSet removeObject:](self->_dataSources, "removeObject:", v7);
    v5 = v7;
    if (self->_activeDataSource == v7)
    {
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidChangeNotification"), v7);
      objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidGenerateImageNotification"), self->_activeDataSource);
      activeDataSource = self->_activeDataSource;
      self->_activeDataSource = 0;

      v5 = v7;
    }
    if (self->_manuallySetDataSource == v5)
    {
      self->_manuallySetDataSource = 0;

      v5 = v7;
    }
    -[SBLeafIcon didRemoveIconDataSource:](self, "didRemoveIconDataSource:", v5);

  }
  if (!self->_activeDataSource)
    -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");

}

- (void)removeIconDataSourcesOfClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSMutableOrderedSet copy](self->_dataSources, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SBLeafIcon removeIconDataSource:](self, "removeIconDataSource:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)removeIconDataSourcesPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSMutableOrderedSet copy](self->_dataSources, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v10))
          -[SBLeafIcon removeIconDataSource:](self, "removeIconDataSource:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)removeAllIconDataSources
{
  SBLeafIcon *i;
  uint64_t v3;
  void *v4;

  for (i = self; -[SBLeafIcon iconDataSourceCount](self, "iconDataSourceCount"); self = i)
  {
    -[SBLeafIcon firstIconDataSource](i, "firstIconDataSource");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
      break;
    v4 = (void *)v3;
    -[SBLeafIcon removeIconDataSource:](i, "removeIconDataSource:", v3);

  }
}

- (void)replaceIconDataSource:(id)a3 withIconDataSource:(id)a4
{
  SBLeafIconDataSource *v6;
  id v7;
  void *v8;
  SBLeafIconDataSource *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SBLeafIconDataSource *activeDataSource;
  NSObject *v14;
  uint8_t v15[16];

  v6 = (SBLeafIconDataSource *)a3;
  v7 = a4;
  v8 = v7;
  if (v6
    && v7
    && (-[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", v7) & 1) == 0
    && -[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", v6))
  {
    -[SBLeafIcon activeDataSource](self, "activeDataSource");
    v9 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();

    v10 = -[NSMutableOrderedSet indexOfObject:](self->_dataSources, "indexOfObject:", v6);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = 0;
    else
      v11 = v10;
    -[NSMutableOrderedSet insertObject:atIndex:](self->_dataSources, "insertObject:atIndex:", v8, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__noteDataSourceDidInvalidateNotification_, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v8);
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidInvalidateNotification"), v6);
    -[NSMutableOrderedSet removeObject:](self->_dataSources, "removeObject:", v6);
    if (self->_activeDataSource == v6)
    {
      objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidChangeNotification"), v6);
      objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("SBLeafIconDataSourceDidGenerateImageNotification"), self->_activeDataSource);
      activeDataSource = self->_activeDataSource;
      self->_activeDataSource = 0;

    }
    if (self->_manuallySetDataSource == v6)
    {
      self->_manuallySetDataSource = 0;

    }
    -[SBLeafIcon didReplaceIconDataSource:withIconDataSource:](self, "didReplaceIconDataSource:withIconDataSource:", v6, v8);
    if (v9 == v6)
    {
      SBLogIcon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEFAULT, "Activating data source due to icon replacement", v15, 2u);
      }

      -[SBLeafIcon setActiveDataSource:](self, "setActiveDataSource:", v8);
    }

  }
  if (!self->_activeDataSource)
    -[SBLeafIcon _updateActiveDataSource](self, "_updateActiveDataSource");

}

- (void)notifyObserversOfAddedIconDataSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBLeafIcon_notifyObserversOfAddedIconDataSource___block_invoke;
  v6[3] = &unk_1E8D8AE18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBLeafIcon enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

void __51__SBLeafIcon_notifyObserversOfAddedIconDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "leafIcon:didAddIconDataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyObserversOfRemovedIconDataSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SBLeafIcon_notifyObserversOfRemovedIconDataSource___block_invoke;
  v6[3] = &unk_1E8D8AE18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBLeafIcon enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

void __53__SBLeafIcon_notifyObserversOfRemovedIconDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "leafIcon:didRemoveIconDataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didReplaceIconDataSource:(id)a3 withIconDataSource:(id)a4
{
  id v6;

  v6 = a4;
  -[SBLeafIcon notifyObserversOfRemovedIconDataSource:](self, "notifyObserversOfRemovedIconDataSource:", a3);
  -[SBLeafIcon notifyObserversOfAddedIconDataSource:](self, "notifyObserversOfAddedIconDataSource:", v6);

}

- (NSArray)iconDataSources
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_dataSources, "array");
}

- (SBLeafIconDataSource)firstIconDataSource
{
  return (SBLeafIconDataSource *)-[NSMutableOrderedSet firstObject](self->_dataSources, "firstObject");
}

- (SBLeafIconDataSource)lastIconDataSource
{
  return (SBLeafIconDataSource *)-[NSMutableOrderedSet lastObject](self->_dataSources, "lastObject");
}

- (unint64_t)iconDataSourceCount
{
  return -[NSMutableOrderedSet count](self->_dataSources, "count");
}

- (BOOL)hasIconDataSource:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_dataSources, "containsObject:", a3);
}

- (id)iconDataSourcesOfClass:(Class)a3
{
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_dataSources;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)firstIconDataSourceOfClass:(Class)a3
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_dataSources;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)firstIconDataSourceWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SBLeafIcon_firstIconDataSourceWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E8D8AE40;
  v9 = v4;
  v5 = v4;
  -[SBLeafIcon firstIconDataSourcePassingTest:](self, "firstIconDataSourcePassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__SBLeafIcon_firstIconDataSourceWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)firstIconDataSourcePassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSMutableOrderedSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_dataSources;
  v6 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_noteActiveDataSourceDidGenerateImageNotification:(id)a3
{
  NSObject *v4;

  SBLogIcon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SBLeafIcon _noteActiveDataSourceDidGenerateImageNotification:].cold.1();

  -[SBIcon reloadIconImage](self, "reloadIconImage");
}

- (void)_noteDataSourceDidInvalidateNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon removeIconDataSource:](self, "removeIconDataSource:", v4);

}

- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    SBLogIcon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SBLeafIcon makeIconImageWithInfo:traitCollection:options:].cold.1();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "icon:imageWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_10:
      v21.receiver = self;
      v21.super_class = (Class)SBLeafIcon;
      -[SBIcon makeIconImageWithInfo:traitCollection:options:](&v21, sel_makeIconImageWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v16, "icon:imageWithInfo:", self, v13, v12, v11, v10);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  if (!v18)
    goto LABEL_10;
LABEL_11:

  return v19;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    SBLogIcon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SBLeafIcon makeIconImageWithInfo:traitCollection:options:].cold.1();

  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v16, "icon:layerWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10),
        (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v20.receiver = self;
    v20.super_class = (Class)SBLeafIcon;
    -[SBIcon makeIconLayerWithInfo:traitCollection:options:](&v20, sel_makeIconLayerWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  unsigned __int8 v17;
  BOOL v18;
  objc_super v20;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = objc_msgSend(v16, "icon:canMakeIconLayerQuicklyWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBLeafIcon;
    v17 = -[SBIcon canMakeIconLayerQuicklyWithInfo:traitCollection:options:](&v20, sel_canMakeIconLayerQuicklyWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
  }
  v18 = v17;

  return v18;
}

- (void)prepareToMakeLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  objc_super v17;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "icon:prepareToMakeLayerWithInfo:traitCollection:options:", self, v15, a4, v13, v12, v11, v10);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBLeafIcon;
    -[SBIcon prepareToMakeLayerWithInfo:traitCollection:options:](&v17, sel_prepareToMakeLayerWithInfo_traitCollection_options_, v15, a4, v13, v12, v11, v10);
  }

}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "icon:defaultImageWithInfo:", self, v10, v9, v8, v7),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBLeafIcon;
    -[SBIcon genericIconImageWithInfo:](&v15, sel_genericIconImageWithInfo_, v10, v9, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "icon:unmaskedImageWithInfo:", self, v10, v9, v8, v7),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBLeafIcon;
    -[SBIcon unmaskedIconImageWithInfo:](&v15, sel_unmaskedIconImageWithInfo_, v10, v9, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)supportedGridSizeClasses
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "supportedGridSizeClassesForIcon:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    -[SBIcon supportedGridSizeClasses](&v7, sel_supportedGridSizeClasses);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)folderTitleOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "folderTitleOptionsForIcon:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    -[SBIcon folderTitleOptions](&v7, sel_folderTitleOptions);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)folderFallbackTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "folderFallbackTitleForIcon:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    -[SBIcon folderFallbackTitle](&v7, sel_folderFallbackTitle);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)iTunesCategoriesOrderedByRelevancy
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "iTunesCategoriesOrderedByRelevancyForIcon:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    -[SBIcon iTunesCategoriesOrderedByRelevancy](&v7, sel_iTunesCategoriesOrderedByRelevancy);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)setUninstalled
{
  SBLeafIconDataSource *v3;
  SBLeafIconDataSource *dataSourceAtUninstallation;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLeafIcon;
  -[SBIcon setUninstalled](&v5, sel_setUninstalled);
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
  dataSourceAtUninstallation = self->_dataSourceAtUninstallation;
  self->_dataSourceAtUninstallation = v3;

}

- (void)completeUninstall
{
  SBLeafIconDataSource *dataSourceAtUninstallation;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLeafIcon;
  -[SBIcon completeUninstall](&v4, sel_completeUninstall);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBLeafIconDataSource iconCompleteUninstall:](self->_dataSourceAtUninstallation, "iconCompleteUninstall:", self);
  dataSourceAtUninstallation = self->_dataSourceAtUninstallation;
  self->_dataSourceAtUninstallation = 0;

}

- (id)displayNameForObscuredDisabledLaunchForLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "icon:displayNameForObscuredDisabledLaunchForLocation:", self, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBLeafIcon;
    -[SBIcon displayNameForObscuredDisabledLaunchForLocation:](&v9, sel_displayNameForObscuredDisabledLaunchForLocation_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)supportsRasterization
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "iconSupportsRasterization:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBLeafIcon;
    v4 = -[SBIcon supportsRasterization](&v7, sel_supportsRasterization);
  }
  v5 = v4;

  return v5;
}

+ (id)iconImageForDataSource:(id)a3 ofIcon:(id)a4 info:(SBIconImageInfo *)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v9 = v8;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  v15 = a3;
  v16 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v15, "icon:imageWithInfo:", v16, v12, v11, v10, v9),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "icon:unmaskedImageWithInfo:", v16, v12, v11, v10, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(a1, "iconImageFromUnmaskedImage:info:", v18, v12, v11, v10, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

+ (id)iconLayerForDataSource:(id)a3 ofIcon:(id)a4 info:(SBIconImageInfo *)a5 traitCollection:(id)a6 options:(unint64_t)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v13;
  double v14;
  double v15;
  double v16;
  id v18;
  id v19;
  SBIconImageInfo *v20;
  void *v21;

  v13 = v10;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "icon:layerWithInfo:traitCollection:options:", v19, v20, a6, v16, v15, v14, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __43__SBLeafIcon_formattedBadgeNumberOrString___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)formattedBadgeNumberOrString__decimalFormatter;
  formattedBadgeNumberOrString__decimalFormatter = (uint64_t)v0;

  v2 = (void *)formattedBadgeNumberOrString__decimalFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)formattedBadgeNumberOrString__decimalFormatter, "setNumberStyle:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceAtUninstallation, 0);
  objc_storeStrong((id *)&self->_manuallySetDataSource, 0);
  objc_storeStrong((id *)&self->_activeDataSource, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_leafIdentifier, 0);
}

- (NSString)sbh_iconLibraryItemIdentifier
{
  void *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  -[SBLeafIcon leafIdentifier](self, "leafIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v4 = (void *)*MEMORY[0x1E0DC55F8];
  if (v3 > objc_msgSend((id)*MEMORY[0x1E0DC55F8], "length") && objc_msgSend(v2, "hasPrefix:", v4))
  {
    objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return (NSString *)v2;
}

- (void)_noteActiveDataSourceDidGenerateImageNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Data source did generate icon: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateIconImageWithInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "No active data source when trying to generate image for icon: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)makeIconImageWithInfo:traitCollection:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "No active data source when trying to generate layer for icon: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
