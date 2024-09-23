@implementation TKTonePickerController

- (TKTonePickerController)initWithAlertType:(int64_t)a3
{
  TKTonePickerController *v4;
  TKTonePickerController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *defaultToneIdentifier;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)TKTonePickerController;
  v4 = -[TKTonePickerController init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)(a3 - 1) > 0x1C)
    {
      v6 = v4;
      v5 = 0;
    }
    else
    {
      v4->_alertType = a3;
      -[TKTonePickerController _reloadStateForBasicBehavior](v4, "_reloadStateForBasicBehavior");
      objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _setToneManager:](v5, "_setToneManager:", v6);
      v5->_showsDefault = 0;
      v5->_showsToneStore = 0;
      v5->_showsVibrations = 0;
      objc_msgSend(v6, "currentToneIdentifierForAlertType:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      defaultToneIdentifier = v5->_defaultToneIdentifier;
      v5->_defaultToneIdentifier = (NSString *)v8;

      v5->_defaultToneIdentifierWasExplicitlySet = 0;
      *(_WORD *)&v5->_showsIgnoreMute = 0;
      v5->_toneStoreDownloadButtonState = 3;
      objc_msgSend((id)objc_opt_class(), "_latestRedownloadAllTonesDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "timeIntervalSinceDate:", v10),
            v13 = v12,
            v11,
            v13 <= 900.0))
      {
        TLLogToneManagement();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v20 = 15;
          _os_log_impl(&dword_2157C4000, v14, OS_LOG_TYPE_DEFAULT, "Keeping redownload all tones functionality disabled for new tone picker because it was last triggered less than %ld minutes ago.", buf, 0xCu);
        }

      }
      else
      {
        v5->_isToneStoreDownloadButtonAllowed = 1;
      }
      -[TKTonePickerController _setSelectedClassicAlertToneIndex:](v5, "_setSelectedClassicAlertToneIndex:", 0x7FFFFFFFFFFFFFFFLL);
      -[TKTonePickerController _setSelectedClassicRingtoneIndex:](v5, "_setSelectedClassicRingtoneIndex:", 0x7FFFFFFFFFFFFFFFLL);
      -[TKTonePickerController _indexPathForNone](v5, "_indexPathForNone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _setSelectedToneIndexPath:](v5, "_setSelectedToneIndexPath:", v15);

      -[TKTonePickerController _resetSelectedVibrationIdentifierForcingUpdatingVibrationName:](v5, "_resetSelectedVibrationIdentifierForcingUpdatingVibrationName:", 1);
      -[TKTonePickerController _reloadTones](v5, "_reloadTones");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__handleAlertOverridePolicyDidChangeNotification_, *MEMORY[0x24BEB8DE8], 0);

    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB8DE8], 0);
  if (self->_showsVibrations)
    -[TKTonePickerController _unregisterForUserGeneratedVibrationsDidChangeNotification](self, "_unregisterForUserGeneratedVibrationsDidChangeNotification");
  -[TLToneStoreDownloadController removeObserver:](self->_toneStoreDownloadController, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TKTonePickerController;
  -[TKTonePickerController dealloc](&v4, sel_dealloc);
}

- (void)setTopic:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *topic;
  void *v7;
  NSString *v8;
  NSString *defaultToneIdentifier;
  NSString *v10;

  v4 = (NSString *)a3;
  if (self->_topic != v4)
  {
    v10 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    topic = self->_topic;
    self->_topic = v5;

    if (!self->_defaultToneIdentifierWasExplicitlySet)
    {
      -[TLToneManager currentToneIdentifierForAlertType:topic:](self->_toneManager, "currentToneIdentifierForAlertType:topic:", self->_alertType, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)objc_msgSend(v7, "copy");
      defaultToneIdentifier = self->_defaultToneIdentifier;
      self->_defaultToneIdentifier = v8;

    }
    if (!self->_selectedVibrationIdentifierWasExplicitlySet)
      -[TKTonePickerController _resetSelectedVibrationIdentifierForcingUpdatingVibrationName:](self, "_resetSelectedVibrationIdentifierForcingUpdatingVibrationName:", 0);
    -[TKTonePickerController _reloadStateForBasicBehavior](self, "_reloadStateForBasicBehavior");
    -[TKTonePickerController _reloadTones](self, "_reloadTones");
    v4 = v10;
  }

}

- (void)setDefaultToneIdentifier:(id)a3
{
  uint64_t v4;
  NSString *v5;
  TLToneManager *toneManager;
  int64_t alertType;
  void *v8;
  NSString *v9;
  NSString *defaultToneIdentifier;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "length");
  v5 = (NSString *)v11;
  if (!v4)
  {
    toneManager = self->_toneManager;
    alertType = self->_alertType;
    -[TKTonePickerController topic](self, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager currentToneIdentifierForAlertType:topic:](toneManager, "currentToneIdentifierForAlertType:topic:", alertType, v8);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_defaultToneIdentifier != v5)
  {
    v9 = (NSString *)-[NSString copy](v5, "copy");
    defaultToneIdentifier = self->_defaultToneIdentifier;
    self->_defaultToneIdentifier = v9;

    self->_defaultToneIdentifierWasExplicitlySet = v4 != 0;
    -[TKTonePickerController _reloadTones](self, "_reloadTones");
  }

}

- (void)setShowsToneStore:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (self->_showsToneStore != a3)
  {
    v3 = a3;
    self->_showsToneStore = a3;
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v5 = objc_msgSend(v9, "tk_section");
      v6 = objc_msgSend(v9, "tk_row");
      if (v5 <= 0)
        v7 = 0;
      else
        v7 = -1;
      if (v3)
        v7 = 1;
      objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", v6, v7 + v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v8);

    }
    -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
    -[TKTonePickerController _didReloadTones](self, "_didReloadTones");

  }
}

- (void)setShowsIgnoreMute:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (self->_showsIgnoreMute != a3)
  {
    v3 = a3;
    self->_showsIgnoreMute = a3;
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v5 = objc_msgSend(v9, "tk_section");
      v6 = objc_msgSend(v9, "tk_row");
      if (v5 <= 0)
        v7 = 0;
      else
        v7 = -1;
      if (v3)
        v7 = 1;
      objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", v6, v7 + v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v8);

    }
    -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
    -[TKTonePickerController _didReloadTones](self, "_didReloadTones");

  }
}

- (void)setIgnoreMute:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_ignoreMute != a3)
  {
    self->_ignoreMute = a3;
    -[TKTonePickerController _indexPathForIgnoreMuteGroup](self, "_indexPathForIgnoreMuteGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    if (v4)
    {
      -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", objc_msgSend(v4, "tk_section"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[TKTonePickerController _cachedPickerRowItemAtIndex:inSectionForItem:](self, "_cachedPickerRowItemAtIndex:inSectionForItem:", objc_msgSend(v8, "tk_row"), v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[TKTonePickerController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "tonePickerController:didUpdateIgnoreMute:forTonePickerItem:atIndexPath:", self, self->_ignoreMute, v6, v8);

      }
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }

  }
}

- (void)setShowsDefault:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (self->_showsDefault == a3)
    return;
  v3 = a3;
  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v13);
  v6 = -[TKTonePickerController _isDefaultGroupAtIndexPath:](self, "_isDefaultGroupAtIndexPath:", v13);
  self->_showsDefault = v3;
  if (v3)
  {
    if (v13)
      v7 = v5;
    else
      v7 = 1;
    if (v7 == 1)
    {
      -[TKTonePickerController _indexPathForDefaultGroup](self, "_indexPathForDefaultGroup");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v12 = (void *)v8;
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v8);

      goto LABEL_19;
    }
LABEL_12:
    v9 = objc_msgSend(v13, "tk_section");
    v10 = objc_msgSend(v13, "tk_row");
    if (v9 <= 0)
      v11 = 0;
    else
      v11 = -1;
    if (v3)
      v11 = 1;
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", v10, v11 + v9);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v6)
  {
    if (!self->_showsNone)
    {
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", 0);
      goto LABEL_19;
    }
    -[TKTonePickerController _indexPathForNone](self, "_indexPathForNone");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v13)
    goto LABEL_12;
LABEL_19:
  -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
  -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
  if (self->_selectedToneWasExplicitlySetToDefaultTone)
    -[TKTonePickerController setSelectedToneIdentifier:](self, "setSelectedToneIdentifier:", 0);

}

- (void)setShowsNone:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  id v7;

  if (self->_showsNone != a3)
  {
    v3 = a3;
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v7);
    self->_showsNone = v3;
    self->_showsNoneWasExplicitlySet = 1;
    if (v7 || !v3)
    {
      if (!v3 && v5)
        -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", 0);
    }
    else
    {
      -[TKTonePickerController _indexPathForNone](self, "_indexPathForNone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v6);

    }
    -[TKTonePickerController _reloadTones](self, "_reloadTones");

  }
}

- (void)setNoneAtTop:(BOOL)a3
{
  _BOOL4 v5;
  void *v6;
  id v8;

  if (self->_noneAtTop != a3)
  {
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v8);
    self->_noneAtTop = a3;
    if (v8 || !self->_showsNone)
    {
      if (!self->_showsNone && v5)
        -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", 0);
    }
    else
    {
      -[TKTonePickerController _indexPathForNone](self, "_indexPathForNone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v6);

    }
    -[TKTonePickerController _reloadTones](self, "_reloadTones");

  }
}

- (void)setNoneString:(id)a3
{
  NSString *v4;
  NSString *noneString;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  noneString = self->_noneString;
  if (noneString != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](noneString, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_noneString;
      self->_noneString = v7;

      -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
      -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
      v4 = v9;
    }
  }

}

- (void)setShowsNothingSelected:(BOOL)a3
{
  if (self->_showsNothingSelected != a3)
  {
    self->_showsNothingSelected = a3;
    -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
    -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
  }
}

- (void)setTargetDevice:(int64_t)a3
{
  if (self->_targetDevice != a3)
  {
    self->_targetDevice = a3;
    -[TKTonePickerController _reloadTones](self, "_reloadTones");
  }
}

- (int64_t)numberOfSections
{
  unint64_t v3;
  unint64_t v4;

  v3 = self->_showsVibrations
     + (unint64_t)self->_showsIgnoreMute
     + self->_showsToneStore
     + (unint64_t)self->_showsDefault;
  v4 = -[NSMutableArray count](self->_toneGroupLists, "count") + v3;
  if (self->_showsNone)
    v4 += -[TKTonePickerController isNoneAtTop](self, "isNoneAtTop") ^ 1;
  return v4 + -[TKTonePickerController _showsMedia](self, "_showsMedia");
}

- (id)pickerItemForSection:(int64_t)a3
{
  TKTonePickerSectionItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:");
  v5 = (TKTonePickerSectionItem *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (self->_showsIgnoreMute
      && (-[TKTonePickerController _indexPathForIgnoreMuteGroup](self, "_indexPathForIgnoreMuteGroup"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "tk_section"),
          v6,
          v7 == a3))
    {
      TLLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
    else
    {
      if (!self->_showsVibrations
        || (-[TKTonePickerController _indexPathForVibrationGroup](self, "_indexPathForVibrationGroup"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "tk_section"),
            v10,
            v11 != a3))
      {
        if (self->_showsToneStore)
        {
          -[TKTonePickerController _indexPathForToneStoreGroup](self, "_indexPathForToneStoreGroup");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "tk_section");

          if (v16 == a3)
          {
            if (self->_toneStoreDownloadButtonState == 3)
              v14 = 1;
            else
              v14 = 2;
            TLLocalizedString();
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[TKTonePickerController _footerTextForToneStoreGroup](self, "_footerTextForToneStoreGroup");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 0x7FFFFFFFFFFFFFFFLL;
            v12 = 4;
            goto LABEL_32;
          }
        }
        if (self->_showsDefault)
        {
          -[TKTonePickerController _indexPathForDefaultGroup](self, "_indexPathForDefaultGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "tk_section");

          if (v18 == a3)
          {
            TLLocalizedString();
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 0;
            v13 = 0x7FFFFFFFFFFFFFFFLL;
            v14 = 1;
            v12 = 1;
            goto LABEL_32;
          }
        }
        if (!self->_showsNone
          || -[TKTonePickerController isNoneAtTop](self, "isNoneAtTop")
          || (-[TKTonePickerController _indexPathForNone](self, "_indexPathForNone"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "tk_section"),
              v19,
              v20 != a3))
        {
          if (-[TKTonePickerController _showsMedia](self, "_showsMedia")
            && (-[TKTonePickerController _indexPathForMediaGroup](self, "_indexPathForMediaGroup"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v21, "tk_section"),
                v21,
                v22 == a3))
          {
            v14 = -[TKTonePickerController _mediaItemsCount](self, "_mediaItemsCount") + 1;
            TLLocalizedString();
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 0;
            v13 = 0x7FFFFFFFFFFFFFFFLL;
            v12 = 3;
          }
          else
          {
            -[TKTonePickerController _indexPathForFirstToneGroup](self, "_indexPathForFirstToneGroup");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23
              || (-[TKTonePickerController _indexPathForFirstToneGroup](self, "_indexPathForFirstToneGroup"),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  v13 = a3 - objc_msgSend(v24, "tk_section"),
                  v24,
                  v13 < 0)
              || v13 >= -[NSMutableArray count](self->_toneGroupLists, "count")
              || v13 >= -[NSMutableArray count](self->_toneGroupNames, "count"))
            {
              v9 = 0;
              v8 = 0;
              v14 = 0;
              v12 = 0;
              v13 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              -[NSMutableArray objectAtIndex:](self->_toneGroupLists, "objectAtIndex:", v13);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v25, "count");

              -[NSMutableArray objectAtIndex:](self->_toneGroupNames, "objectAtIndex:", v13);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v9, "length"))
              {

                v9 = 0;
              }
              v8 = 0;
              v12 = 2;
            }
          }
          goto LABEL_32;
        }
      }
      v9 = 0;
      v8 = 0;
    }
    v12 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = 1;
LABEL_32:
    v5 = objc_alloc_init(TKTonePickerSectionItem);
    -[TKPickerSectionItem _setText:](v5, "_setText:", v9);
    -[TKPickerSectionItem _setFooterText:](v5, "_setFooterText:", v8);
    -[TKTonePickerSectionItem _setNumberOfChildren:](v5, "_setNumberOfChildren:", v14);
    -[TKPickerItem _setSection:](v5, "_setSection:", a3);
    -[TKTonePickerSectionItem _setSectionHeader:](v5, "_setSectionHeader:", v12);
    -[TKTonePickerSectionItem _setRegularToneSectionIndex:](v5, "_setRegularToneSectionIndex:", v13);
    -[TKTonePickerSectionItem _setParentTonePickerController:](v5, "_setParentTonePickerController:", self);
    -[TKTonePickerController _cachePickerSectionItem:forSection:](self, "_cachePickerSectionItem:forSection:", v5, a3);

  }
  return v5;
}

- (id)_pickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TKPickerDividerItem *v9;
  TKTonePickerItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  TKTonePickerItem *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  int64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  id v41;
  TKTonePickerController *v42;
  id v43;
  void *v44;
  TKTonePickerController *v45;
  int64_t v46;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  TKTonePickerController *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  TKTonePickerController *v63;
  TKPickerDividerItem *v64;
  _QWORD v65[5];
  TKTonePickerItem *v66;
  id v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TKTonePickerController _cachedPickerRowItemAtIndex:inSectionForItem:](self, "_cachedPickerRowItemAtIndex:inSectionForItem:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_50;
  objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", a3, objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = self;
  if (!-[TKTonePickerController _isDividerAtIndexPath:](self, "_isDividerAtIndexPath:", v8))
  {
    v16 = objc_alloc_init(TKTonePickerItem);
    -[TKPickerItem _setSection:](v16, "_setSection:", objc_msgSend(v8, "tk_section"));
    -[TKPickerRowItem _setRow:](v16, "_setRow:", objc_msgSend(v8, "tk_row"));
    -[TKTonePickerItem _setParentSectionItem:](v16, "_setParentSectionItem:", v6);
    v10 = v16;
    v64 = (TKPickerDividerItem *)v10;
    if (-[TKTonePickerController _isIgnoreMuteGroupAtIndexPath:](self, "_isIgnoreMuteGroupAtIndexPath:", v8))
    {
      TLLocalizedString();
      v61 = 0;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      v15 = 0;
      v11 = 0;
      v12 = 0;
      v14 = 0;
      v60 = 0x100000000;
      v13 = 3;
      goto LABEL_43;
    }
    if (-[TKTonePickerController _isVibrationGroupAtIndexPath:](self, "_isVibrationGroupAtIndexPath:", v8))
    {
      -[TKTonePickerController _nameOfSelectedVibrationIdentifier](self, "_nameOfSelectedVibrationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TLLocalizedString();
      v59 = 0;
      v60 = 0;
      v15 = 0;
      v11 = 0;
      v13 = 0;
      v61 = 1;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
LABEL_42:
      v10 = (TKTonePickerItem *)v64;
      goto LABEL_43;
    }
    if (-[TKTonePickerController _isToneStoreGroupAtIndexPath:](self, "_isToneStoreGroupAtIndexPath:", v8))
    {
      v14 = 0;
      if (a3 == 1)
      {
        switch(self->_toneStoreDownloadButtonState)
        {
          case 0:
            goto LABEL_11;
          case 1:
          case 2:
            TLLocalizedString();
            v61 = 0;
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 0x100000000;
            v15 = 0;
            v11 = 0;
            v12 = 0;
            v13 = 0;
            v59 = 1;
            break;
          case 3:
            TLLocalizedString();
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 0;
            LODWORD(v59) = 0;
            v15 = 0;
            v11 = 0;
            v12 = 0;
            goto LABEL_23;
          default:
            goto LABEL_22;
        }
        goto LABEL_43;
      }
      if (a3)
      {
LABEL_22:
        v60 = 0;
        LODWORD(v59) = 0;
        v15 = 0;
        v11 = 0;
        v12 = 0;
        v62 = 0;
LABEL_23:
        HIDWORD(v59) = 0;
        v61 = 0;
        v13 = 0;
      }
      else
      {
LABEL_11:
        TLLocalizedString();
        v61 = 0;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        v15 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v60 = 1;
      }
      goto LABEL_42;
    }
    if (-[TKTonePickerController _isDefaultGroupAtIndexPath:](self, "_isDefaultGroupAtIndexPath:", v8))
    {
      -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v18 = v8;
        TLLogGeneral();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

        if (v20)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
          v21 = objc_claimAutoreleasedReturnValue();
          TLLogGeneral();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject lastPathComponent](v21, "lastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381443;
            v69 = "-[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:]";
            v70 = 2113;
            v71 = v23;
            v72 = 2049;
            v73 = 585;
            v74 = 2113;
            v75 = v24;
            _os_log_impl(&dword_2157C4000, v22, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            self = v63;
          }

        }
        else
        {
          TLLogGeneral();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
        }
        v8 = v18;

        TLLogGeneral();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.1();

      }
      -[TKTonePickerController _nameForToneIdentifier:](self, "_nameForToneIdentifier:", v17);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (-[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v8))
    {
      -[TKTonePickerController noneString](self, "noneString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v25;
      if (v25)
      {
        v26 = v25;
      }
      else
      {
        TLLocalizedString();
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!-[TKTonePickerController _isMediaGroupAtIndexPath:](self, "_isMediaGroupAtIndexPath:", v8))
      {
        -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v28, "length") && !self->_showsDefault)
        {
          -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
          v29 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v29;
        }
        if (objc_msgSend(v28, "isEqualToString:", CFSTR("<classic_alert_tone_identifier>")))
        {
          TLLocalizedString();
          v30 = objc_claimAutoreleasedReturnValue();
          -[TKTonePickerController _classicAlertToneIdentifiers](self, "_classicAlertToneIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex") == 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = 0;
          }
          else
          {
            -[TKTonePickerController selectedToneIdentifier](self, "selectedToneIdentifier");
            v48 = v8;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[TKTonePickerController _nameForToneIdentifier:](self, "_nameForToneIdentifier:", v49);
            v50 = objc_claimAutoreleasedReturnValue();

            v8 = v48;
            v12 = (void *)v50;
            self = v63;
          }
          v61 = 1;
          v13 = 2;
        }
        else if (objc_msgSend(v28, "isEqualToString:", CFSTR("<classic_ringtone_identifier>")))
        {
          TLLocalizedString();
          v30 = objc_claimAutoreleasedReturnValue();
          -[TKTonePickerController _classicRingtoneIdentifiers](self, "_classicRingtoneIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex") == 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = 0;
            v61 = 1;
            v13 = 1;
          }
          else
          {
            -[TKTonePickerController selectedToneIdentifier](self, "selectedToneIdentifier");
            v51 = v8;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[TKTonePickerController _nameForToneIdentifier:](self, "_nameForToneIdentifier:", v52);
            v53 = objc_claimAutoreleasedReturnValue();

            v8 = v51;
            v12 = (void *)v53;
            self = v63;
            v13 = 1;
            v61 = 1;
          }
        }
        else
        {
          -[TKTonePickerController _annotatedNameForToneIdentifier:](self, "_annotatedNameForToneIdentifier:", v28);
          v30 = objc_claimAutoreleasedReturnValue();
          v11 = 0;
          v12 = 0;
          v61 = 0;
          v13 = 0;
        }
        -[NSMutableDictionary objectForKey:](self->_activeToneStoreDownloadsByIdentifier, "objectForKey:", v28);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = self;
        v56 = v54;
        v62 = (void *)v30;
        if (v54)
        {
          objc_msgSend(v54, "downloadProgress");
          v14 = v57;
          HIDWORD(v59) = 1;
        }
        else
        {
          -[NSMutableDictionary objectForKey:](v55->_finishedToneStoreDownloadsByIdentifier, "objectForKey:", v28);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          HIDWORD(v59) = v58 != 0;

          v14 = 0;
        }

        v60 = 0;
        LODWORD(v59) = 0;
        v15 = 1;
        self = v63;
        v10 = (TKTonePickerItem *)v64;
        goto LABEL_43;
      }
      v27 = -[TKTonePickerController _mediaItemsCount](self, "_mediaItemsCount");
      if (objc_msgSend(v8, "tk_row") >= v27)
      {
        TLLocalizedString();
        v59 = 0;
        v60 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 1;
        v10 = (TKTonePickerItem *)v64;
        v61 = 1;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      -[TKTonePickerController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v62 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v17, "tonePickerController:titleOfMediaItemAtIndex:", self, objc_msgSend(v8, "tk_row"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = v26;
LABEL_41:

    v59 = 0;
    v60 = 0;
    v11 = 0;
    v12 = 0;
    v61 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 1;
    goto LABEL_42;
  }
  v9 = objc_alloc_init(TKPickerDividerItem);
  -[TKPickerItem _setSection:](v9, "_setSection:", objc_msgSend(v8, "tk_section"));
  v64 = v9;
  -[TKPickerRowItem _setRow:](v9, "_setRow:", objc_msgSend(v8, "tk_row"));
  v10 = 0;
  v59 = 0;
  v60 = 0;
  v11 = 0;
  v12 = 0;
  v61 = 0;
  v62 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 1;
LABEL_43:
  v32 = v6;
  v33 = a3;
  if (-[TKTonePickerController showsNothingSelected](self, "showsNothingSelected"))
  {
    v34 = v8;
    v35 = 0;
  }
  else
  {
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v36 = v11;
    v37 = v12;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8;
    v35 = objc_msgSend(v38, "isEqual:", v8);

    v12 = v37;
    v11 = v36;
  }
  -[TKPickerSelectableItem _setShowsCheckmark:](v10, "_setShowsCheckmark:", v35);
  -[TKTonePickerItem _setItemKind:](v10, "_setItemKind:", v13);
  -[TKPickerSelectableItem _setShowsDisclosureIndicator:](v10, "_setShowsDisclosureIndicator:", v61);
  -[TKTonePickerItem _setNeedsRoomForCheckmark:](v10, "_setNeedsRoomForCheckmark:", v15);
  -[TKTonePickerItem _setNeedsActivityIndicator:](v10, "_setNeedsActivityIndicator:", v59);
  -[TKTonePickerItem _setNeedsDownloadProgress:](v10, "_setNeedsDownloadProgress:", HIDWORD(v59));
  LODWORD(v39) = v14;
  -[TKTonePickerItem _setDownloadProgress:](v10, "_setDownloadProgress:", v39);
  -[TKPickerSelectableItem _setShouldTintText:](v10, "_setShouldTintText:", v60);
  -[TKPickerSelectableItem _setShouldPreventSelection:](v10, "_setShouldPreventSelection:", HIDWORD(v60));
  -[TKPickerSelectableItem _setText:](v10, "_setText:", v62);
  -[TKPickerSelectableItem _setDetailText:](v10, "_setDetailText:", v12);
  if (objc_msgSend(v11, "count"))
  {
    v40 = v12;
    v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __65__TKTonePickerController__pickerRowItemAtIndex_inSectionForItem___block_invoke;
    v65[3] = &unk_24D37FDC0;
    v42 = v63;
    v65[4] = v63;
    v66 = v10;
    v67 = v41;
    v43 = v41;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v65);
    v44 = (void *)objc_msgSend(v43, "copy");

    v12 = v40;
  }
  else
  {
    v44 = 0;
    v42 = v63;
  }
  -[TKTonePickerItem _setChildrenToneClassicsPickerItems:](v10, "_setChildrenToneClassicsPickerItems:", v44);
  v45 = v42;
  v7 = v64;
  v46 = v33;
  v6 = v32;
  -[TKTonePickerController _cachePickerRowItem:atIndex:inSectionForItem:](v45, "_cachePickerRowItem:atIndex:inSectionForItem:", v64, v46, v32);

LABEL_50:
  return v7;
}

void __65__TKTonePickerController__pickerRowItemAtIndex_inSectionForItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_toneClassicsPickerItemAtIndex:withToneIdentifier:belowTonePickerItem:", a3, a2, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

}

- (id)_toneClassicsPickerItemAtIndex:(int64_t)a3 withToneIdentifier:(id)a4 belowTonePickerItem:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  TKToneClassicsPickerItem *v14;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "itemKind");
  if (v10 == 2)
  {
    v11 = -[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex");
  }
  else
  {
    if (v10 != 1)
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    v11 = -[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex");
  }
  v12 = v11;
LABEL_7:
  -[TKTonePickerController _annotatedNameForToneIdentifier:](self, "_annotatedNameForToneIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(TKToneClassicsPickerItem);
  -[TKTonePickerItem _setItemKind:](v14, "_setItemKind:", 0);
  -[TKPickerSelectableItem _setText:](v14, "_setText:", v13);
  -[TKPickerSelectableItem _setShowsCheckmark:](v14, "_setShowsCheckmark:", v12 == a3);
  -[TKTonePickerItem _setNeedsRoomForCheckmark:](v14, "_setNeedsRoomForCheckmark:", 1);
  -[TKPickerItem _setSection:](v14, "_setSection:", objc_msgSend(v9, "section"));
  -[TKPickerRowItem _setRow:](v14, "_setRow:", objc_msgSend(v9, "row"));
  -[TKToneClassicsPickerItem _setClassicToneIndex:](v14, "_setClassicToneIndex:", a3);
  -[TKToneClassicsPickerItem _setParentItem:](v14, "_setParentItem:", v9);

  return v14;
}

- (id)_cachedPickerItemForSection:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[NSMutableArray count](self->_cachedPickerSectionItems, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_cachedPickerSectionItems, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  return v6;
}

- (void)_cachePickerSectionItem:(id)a3 forSection:(int64_t)a4
{
  id v6;
  NSMutableArray *cachedPickerSectionItems;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (v6)
  {
    v11 = v6;
    cachedPickerSectionItems = self->_cachedPickerSectionItems;
    if (!cachedPickerSectionItems)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->_cachedPickerSectionItems;
      self->_cachedPickerSectionItems = v8;

      cachedPickerSectionItems = self->_cachedPickerSectionItems;
    }
    -[NSMutableArray tk_ensureHasItemsOrNullUpToIndex:](cachedPickerSectionItems, "tk_ensureHasItemsOrNullUpToIndex:", a4);
    -[NSMutableArray objectAtIndex:](self->_cachedPickerSectionItems, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "_setParentTonePickerController:", 0);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_cachedPickerSectionItems, "replaceObjectAtIndex:withObject:", a4, v11);

    v6 = v11;
  }

}

- (id)_cachedPickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4
{
  unint64_t v6;
  id v7;
  id v8;
  void *v9;

  v6 = objc_msgSend(a4, "section");
  if (v6 >= -[NSMutableArray count](self->_cachedPickerRowItems, "count"))
  {
    v9 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_cachedPickerRowItems, "objectAtIndex:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      if (objc_msgSend(v8, "count") <= (unint64_t)a3)
      {
        v9 = 0;
        v7 = v8;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndex:", a3);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v7;
          v9 = v7;
        }
        else
        {
          v9 = 0;
        }
      }

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)_cachePickerRowItem:(id)a3 atIndex:(int64_t)a4 inSectionForItem:(id)a5
{
  id v8;
  NSMutableArray *v9;
  NSMutableArray *cachedPickerRowItems;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  if (!v14)
    goto LABEL_13;
  if (!self->_cachedPickerRowItems)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cachedPickerRowItems = self->_cachedPickerRowItems;
    self->_cachedPickerRowItems = v9;

  }
  v11 = objc_msgSend(v8, "section");
  if (v11 >= -[NSMutableArray count](self->_cachedPickerRowItems, "count"))
    goto LABEL_9;
  -[NSMutableArray objectAtIndex:](self->_cachedPickerRowItems, "objectAtIndex:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    -[NSMutableArray tk_ensureHasItemsOrNullUpToIndex:](self->_cachedPickerRowItems, "tk_ensureHasItemsOrNullUpToIndex:", v11);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_cachedPickerRowItems, "replaceObjectAtIndex:withObject:", v11, v12);
    goto LABEL_10;
  }
  if (!v12)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(v12, "tk_ensureHasItemsOrNullUpToIndex:", a4);
  objc_msgSend(v12, "objectAtIndex:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v13, "_setParentSectionItem:", 0);
  objc_msgSend(v12, "replaceObjectAtIndex:withObject:", a4, v14);

LABEL_13:
}

- (void)_uncachePickerRowItemAtIndex:(int64_t)a3 inSectionForItem:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = objc_msgSend(a4, "section");
  if (v6 >= -[NSMutableArray count](self->_cachedPickerRowItems, "count"))
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_cachedPickerRowItems, "objectAtIndex:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v10;
      v10 = 0;
      goto LABEL_10;
    }
    v7 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "count") <= (unint64_t)a3)
      {
LABEL_11:
        v7 = v10;
        goto LABEL_12;
      }
      objc_msgSend(v10, "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "_setParentSectionItem:", 0);
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", a3, v9);

LABEL_10:
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)_invalidatePickerItemCaches
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *cachedPickerSectionItems;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *cachedPickerRowItems;
  TKTonePickerController *v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = self->_cachedPickerSectionItems;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "_setParentTonePickerController:", 0);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  cachedPickerSectionItems = self->_cachedPickerSectionItems;
  self->_cachedPickerSectionItems = 0;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = self;
  obj = self->_cachedPickerRowItems;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v20, "_setParentSectionItem:", 0);
                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
            }
            while (v17);
          }

        }
        ++v13;
      }
      while (v13 != v11);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v11);
  }

  cachedPickerRowItems = v22->_cachedPickerRowItems;
  v22->_cachedPickerRowItems = 0;

}

- (id)_indexPathForIgnoreMuteGroup
{
  void *v2;

  if (self->_showsIgnoreMute)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSIndexPath)_indexPathForVibrationGroup
{
  void *v2;

  if (self->_showsVibrations)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, self->_showsIgnoreMute);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSIndexPath *)v2;
}

- (NSIndexPath)_indexPathForToneStoreGroup
{
  void *v2;

  if (self->_showsToneStore)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, self->_showsVibrations + (unint64_t)self->_showsIgnoreMute);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSIndexPath *)v2;
}

- (id)_indexPathForToneStoreDownloadItem
{
  void *v2;
  void *v3;
  void *v4;

  -[TKTonePickerController _indexPathForToneStoreGroup](self, "_indexPathForToneStoreGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 1, objc_msgSend(v2, "tk_section"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSIndexPath)_indexPathForDefaultGroup
{
  void *v2;

  if (self->_showsDefault)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, self->_showsVibrations + (unint64_t)self->_showsIgnoreMute + self->_showsToneStore);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSIndexPath *)v2;
}

- (NSIndexPath)_indexPathForFirstToneGroup
{
  void *v3;
  unint64_t v4;

  v3 = (void *)-[NSMutableArray count](self->_toneGroupLists, "count");
  if (v3)
  {
    v4 = self->_showsVibrations
       + (unint64_t)self->_showsIgnoreMute
       + self->_showsToneStore
       + (unint64_t)self->_showsDefault;
    if (-[TKTonePickerController _showsMedia](self, "_showsMedia"))
      v4 += -[TKTonePickerController _isMediaAtTop](self, "_isMediaAtTop");
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSIndexPath *)v3;
}

- (NSIndexPath)_indexPathForMediaGroup
{
  unint64_t v3;
  void *v4;

  if (-[TKTonePickerController _showsMedia](self, "_showsMedia"))
  {
    v3 = self->_showsVibrations + (unint64_t)self->_showsIgnoreMute + self->_showsToneStore;
    if (!-[TKTonePickerController _isMediaAtTop](self, "_isMediaAtTop"))
      v3 += -[NSMutableArray count](self->_toneGroupLists, "count") + self->_showsDefault;
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSIndexPath *)v4;
}

- (NSIndexPath)_indexPathForNone
{
  void *v3;
  unint64_t v4;
  _BOOL4 v5;

  if (self->_showsNone && !-[TKTonePickerController isNoneAtTop](self, "isNoneAtTop"))
  {
    v4 = -[NSMutableArray count](self->_toneGroupLists, "count")
       + self->_showsIgnoreMute
       + (unint64_t)self->_showsVibrations
       + self->_showsToneStore
       + (unint64_t)self->_showsDefault;
    v5 = -[TKTonePickerController _showsMedia](self, "_showsMedia");
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", 0, v4 + v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", *MEMORY[0x24BEB8DD0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSIndexPath *)v3;
}

- (BOOL)_isIgnoreMuteGroupAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (v4 && self->_showsIgnoreMute)
  {
    if (objc_msgSend(v4, "tk_row"))
      v6 = 0;
    else
      v6 = objc_msgSend(v5, "tk_section") == 0;
  }

  return v6;
}

- (BOOL)_isVibrationGroupAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t showsIgnoreMute;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (v4 && self->_showsVibrations)
  {
    showsIgnoreMute = self->_showsIgnoreMute;
    if (objc_msgSend(v4, "tk_row"))
      v6 = 0;
    else
      v6 = objc_msgSend(v5, "tk_section") == showsIgnoreMute;
  }

  return v6;
}

- (BOOL)_isToneStoreGroupAtIndexPath:(id)a3
{
  BOOL result;
  unint64_t v5;

  result = 0;
  if (a3)
  {
    if (self->_showsToneStore)
    {
      v5 = self->_showsVibrations + (unint64_t)self->_showsIgnoreMute;
      return objc_msgSend(a3, "tk_section") == v5;
    }
  }
  return result;
}

- (BOOL)_isDefaultGroupAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _BOOL8 showsIgnoreMute;
  _BOOL8 showsVibrations;
  _BOOL8 showsToneStore;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (v4 && self->_showsDefault)
  {
    showsIgnoreMute = self->_showsIgnoreMute;
    showsVibrations = self->_showsVibrations;
    showsToneStore = self->_showsToneStore;
    if (objc_msgSend(v4, "tk_row"))
      v6 = 0;
    else
      v6 = objc_msgSend(v5, "tk_section") == showsVibrations + showsIgnoreMute + showsToneStore;
  }

  return v6;
}

- (BOOL)_isNoneGroupAtIndexPath:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  _BOOL8 showsIgnoreMute;
  _BOOL8 showsVibrations;
  _BOOL8 showsToneStore;
  _BOOL8 showsDefault;
  _BOOL4 v12;

  v4 = a3;
  if (!self->_showsNone)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = -[TKTonePickerController isNoneAtTop](self, "isNoneAtTop");
  v6 = 0;
  if (v4 && !v5)
  {
    v7 = -[NSMutableArray count](self->_toneGroupLists, "count");
    showsIgnoreMute = self->_showsIgnoreMute;
    showsVibrations = self->_showsVibrations;
    showsToneStore = self->_showsToneStore;
    showsDefault = self->_showsDefault;
    v12 = -[TKTonePickerController _showsMedia](self, "_showsMedia");
    if (!objc_msgSend(v4, "tk_row"))
    {
      v6 = objc_msgSend(v4, "tk_section") == v7
                                           + showsIgnoreMute
                                           + showsVibrations
                                           + showsToneStore
                                           + showsDefault
                                           + v12;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (BOOL)_isMediaGroupAtIndexPath:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[TKTonePickerController _showsMedia](self, "_showsMedia");
  v6 = 0;
  if (v4 && v5)
  {
    v7 = self->_showsVibrations + (unint64_t)self->_showsIgnoreMute + self->_showsToneStore;
    if (!-[TKTonePickerController _isMediaAtTop](self, "_isMediaAtTop"))
      v7 += -[NSMutableArray count](self->_toneGroupLists, "count") + self->_showsDefault;
    v6 = objc_msgSend(v4, "tk_section") == v7;
  }

  return v6;
}

- (BOOL)_isDividerAtIndexPath:(id)a3
{
  void *v3;
  char v4;

  -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", &stru_24D3804C8);

  return v4;
}

- (id)_indexPathForToneWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  uint64_t v17;
  _BOOL8 showsIgnoreMute;
  _BOOL8 showsVibrations;
  _BOOL8 showsToneStore;
  _BOOL8 v21;
  uint64_t v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;

  v4 = a3;
  if (!-[NSMutableArray count](self->_toneGroupLists, "count"))
    goto LABEL_19;
  v5 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_toneGroupLists, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      break;
    if (objc_msgSend(v6, "indexOfObject:", CFSTR("<classic_alert_tone_identifier>")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TKTonePickerController _classicAlertToneIdentifiers](self, "_classicAlertToneIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexOfObject:", v4);

      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
    }
    if (objc_msgSend(v6, "indexOfObject:", CFSTR("<classic_ringtone_identifier>")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TKTonePickerController _classicRingtoneIdentifiers](self, "_classicRingtoneIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v4);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_12:
        showsIgnoreMute = self->_showsIgnoreMute;
        showsVibrations = self->_showsVibrations;
        showsToneStore = self->_showsToneStore;
        if (-[TKTonePickerController _showsMedia](self, "_showsMedia"))
        {
          v21 = showsIgnoreMute + -[TKTonePickerController _isMediaAtTop](self, "_isMediaAtTop");
          v22 = showsVibrations + showsToneStore + v5;
        }
        else
        {
          v21 = showsIgnoreMute + showsVibrations;
          v22 = showsToneStore + v5;
        }
        v26 = v21 + v22 + self->_showsDefault;
        v27 = (void *)MEMORY[0x24BDD15D8];
        v25 = objc_msgSend(v6, "count") - 1;
        v24 = v27;
        v23 = v26;
        goto LABEL_18;
      }
    }

    if (++v5 >= (unint64_t)-[NSMutableArray count](self->_toneGroupLists, "count"))
      goto LABEL_19;
  }
  v12 = v7;
  v13 = self->_showsIgnoreMute;
  v14 = self->_showsVibrations;
  v15 = self->_showsToneStore;
  if (-[TKTonePickerController _showsMedia](self, "_showsMedia"))
  {
    v16 = v13 + -[TKTonePickerController _isMediaAtTop](self, "_isMediaAtTop");
    v17 = v14 + v15 + v5;
  }
  else
  {
    v16 = v13 + v14;
    v17 = v15 + v5;
  }
  v23 = v16 + v17 + self->_showsDefault;
  v24 = (void *)MEMORY[0x24BDD15D8];
  v25 = v12;
LABEL_18:
  objc_msgSend(v24, "tk_indexPathForRow:inSection:", v25, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_19:
    if (-[TKTonePickerController _showsMedia](self, "_showsMedia")
      && (v29 = -[TKTonePickerController _indexOfMediaItemWithIdentifier:](self, "_indexOfMediaItemWithIdentifier:", v4),
          v29 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v30 = v29;
      v31 = (void *)MEMORY[0x24BDD15D8];
      -[TKTonePickerController _indexPathForMediaGroup](self, "_indexPathForMediaGroup");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "tk_indexPathForRow:inSection:", v30, objc_msgSend(v32, "tk_section"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (id)_identifierOfToneAtIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (!v4 || -[TKTonePickerController _isDefaultGroupAtIndexPath:](self, "_isDefaultGroupAtIndexPath:", v4))
    goto LABEL_3;
  if (-[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v4))
  {
    v5 = (id)*MEMORY[0x24BEB8DD0];
    goto LABEL_4;
  }
  v7 = objc_msgSend(v4, "tk_section");
  v8 = objc_msgSend(v4, "tk_row");
  if (-[TKTonePickerController _showsMedia](self, "_showsMedia"))
    v7 -= -[TKTonePickerController _isMediaAtTop](self, "_isMediaAtTop");
  v9 = v7 - self->_showsIgnoreMute - self->_showsVibrations - self->_showsToneStore - self->_showsDefault;
  if (v9 < 0 || v9 >= -[NSMutableArray count](self->_toneGroupLists, "count"))
  {
LABEL_3:
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_toneGroupLists, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 < 0 || v8 >= objc_msgSend(v10, "count"))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v11, "objectAtIndex:", v8);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!self->_showsDefault)
      {
        -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLToneManager _aliasForToneIdentifier:](self->_toneManager, "_aliasForToneIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length") && objc_msgSend(v5, "isEqualToString:", v13))
        {

          v5 = 0;
        }

      }
    }

  }
LABEL_4:

  return v5;
}

- (id)_identifierAtIndexPath:(id)a3 isMediaItem:(BOOL *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "tk_row");
  if (-[TKTonePickerController _isMediaGroupAtIndexPath:](self, "_isMediaGroupAtIndexPath:", v7)
    && v8 < -[TKTonePickerController _mediaItemsCount](self, "_mediaItemsCount"))
  {
    -[TKTonePickerController _identifierOfMediaItemAtIndex:](self, "_identifierOfMediaItemAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v10 = 1;
LABEL_8:
      *a4 = v10;
    }
  }
  else
  {
    -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v10 = 0;
      goto LABEL_8;
    }
  }
LABEL_10:

  return v9;
}

- (TKTonePickerItem)_topLevelSelectedTonePickerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v3, "tk_section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childItemAtIndex:", objc_msgSend(v4, "tk_row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return (TKTonePickerItem *)v7;
}

- (TKTonePickerItem)selectedTonePickerItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  void *v8;

  -[TKTonePickerController _topLevelSelectedTonePickerItem](self, "_topLevelSelectedTonePickerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  v5 = objc_msgSend(v3, "itemKind");
  switch(v5)
  {
    case 2:
      v7 = -[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex");
      break;
    case 1:
      v7 = -[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex");
      break;
    case 0:
      v6 = v4;
LABEL_11:
      v8 = v6;
      goto LABEL_12;
    default:
      goto LABEL_9;
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "childItemAtIndex:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_9:
  v8 = 0;
LABEL_12:

  return (TKTonePickerItem *)v8;
}

- (NSString)selectedToneIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("<classic_alert_tone_identifier>")))
  {
    -[TKTonePickerController _identifierOfSelectedClassicAlertTone](self, "_identifierOfSelectedClassicAlertTone");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    v4 = v6;
    return (NSString *)v4;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("<classic_ringtone_identifier>")))
  {
    -[TKTonePickerController _identifierOfSelectedClassicRingtone](self, "_identifierOfSelectedClassicRingtone");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return (NSString *)v4;
}

- (void)setSelectedToneIdentifier:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  if (!objc_msgSend(v5, "length"))
  {
    v4 = v5;
    if (!self->_showsDefault)
    {
      -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  self->_selectedToneWasExplicitlySetToDefaultTone = v4 != v5;
  -[TKTonePickerController _setSelectedToneIdentifier:currentlyReloadingTones:](self, "_setSelectedToneIdentifier:currentlyReloadingTones:", v4, 0);

}

- (void)_setSelectedToneIdentifier:(id)a3 currentlyReloadingTones:(BOOL)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  char v24;
  id v25;
  id v26;

  -[TLToneManager _aliasForToneIdentifier:](self->_toneManager, "_aliasForToneIdentifier:", a3);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v25, "length")
    || self->_targetDevice
    || (-[TLToneManager toneWithIdentifierIsValid:](self->_toneManager, "toneWithIdentifierIsValid:", v25) & 1) != 0)
  {
    v6 = v25;
  }
  else
  {

    v6 = 0;
  }
  v26 = v6;
  if (objc_msgSend(v6, "length"))
  {
    -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (self->_showsNone
    && !-[TKTonePickerController isNoneAtTop](self, "isNoneAtTop")
    && objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BEB8DD0]))
  {
    -[TKTonePickerController _indexPathForNone](self, "_indexPathForNone");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (!v7)
  {
    if (self->_showsDefault)
    {
      -[TKTonePickerController _indexPathForDefaultGroup](self, "_indexPathForDefaultGroup");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!self->_showsNone)
      {
        v7 = 0;
        goto LABEL_30;
      }
      -[TKTonePickerController _indexPathForNone](self, "_indexPathForNone");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v9;
    if (v9)
      goto LABEL_18;
LABEL_30:
    v14 = 0;
    v10 = 0;
    goto LABEL_31;
  }
LABEL_18:
  -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("<classic_alert_tone_identifier>")))
  {
    -[TKTonePickerController _classicAlertToneIdentifiers](self, "_classicAlertToneIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v26);

    v13 = -[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex");
    v14 = v12 != v13;
    if (v12 != v13)
      -[TKTonePickerController _setSelectedClassicAlertToneIndex:](self, "_setSelectedClassicAlertToneIndex:", v12);
    -[TKTonePickerController _setSelectedClassicRingtoneIndex:](self, "_setSelectedClassicRingtoneIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("<classic_ringtone_identifier>")))
    {
      -[TKTonePickerController _setSelectedClassicAlertToneIndex:](self, "_setSelectedClassicAlertToneIndex:", 0x7FFFFFFFFFFFFFFFLL);
      -[TKTonePickerController _setSelectedClassicRingtoneIndex:](self, "_setSelectedClassicRingtoneIndex:", 0x7FFFFFFFFFFFFFFFLL);
      v14 = 0;
      goto LABEL_31;
    }
    -[TKTonePickerController _classicRingtoneIdentifiers](self, "_classicRingtoneIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexOfObject:", v26);

    v17 = -[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex");
    v14 = v16 != v17;
    if (v16 != v17)
      -[TKTonePickerController _setSelectedClassicRingtoneIndex:](self, "_setSelectedClassicRingtoneIndex:", v16);
    -[TKTonePickerController _setSelectedClassicAlertToneIndex:](self, "_setSelectedClassicAlertToneIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  v18 = v26;

  v10 = v18;
LABEL_31:
  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v7);

  if (v14 || !v20)
  {
    -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v7);
    v21 = (unint64_t)v26;
    v22 = v10;
    v23 = (void *)v22;
    if (!(v21 | v22))
      goto LABEL_39;
    if (!v21 || !v22)
    {

      goto LABEL_44;
    }
    if (v21 == v22)
    {
LABEL_39:

    }
    else
    {
      v24 = objc_msgSend((id)v21, "isEqualToString:", v22);

      if ((v24 & 1) == 0)
      {
LABEL_44:
        -[TKTonePickerController _didSelectToneWithIdentifier:](self, "_didSelectToneWithIdentifier:", v23);
        if (a4)
          goto LABEL_42;
        goto LABEL_41;
      }
    }
    if (!a4)
    {
LABEL_41:
      -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
      -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
    }
  }
LABEL_42:

}

- (id)_identifierOfSelectedClassicAlertTone
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = (id)*MEMORY[0x24BEB8DD0];
  v4 = -[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[TKTonePickerController _classicAlertToneIdentifiers](self, "_classicAlertToneIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  return v3;
}

- (id)_identifierOfSelectedClassicRingtone
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = (id)*MEMORY[0x24BEB8DD0];
  v4 = -[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[TKTonePickerController _classicRingtoneIdentifiers](self, "_classicRingtoneIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v7;
  }
  return v3;
}

- (id)_selectedIdentifier:(BOOL *)a3
{
  void *v5;
  void *v6;

  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _identifierAtIndexPath:isMediaItem:](self, "_identifierAtIndexPath:isMediaItem:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)didSelectTonePickerItem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  unint64_t v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", objc_msgSend(v4, "row"), objc_msgSend(v4, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController setShowsNothingSelected:](self, "setShowsNothingSelected:", 0);
    if (-[TKTonePickerController _isIgnoreMuteGroupAtIndexPath:](self, "_isIgnoreMuteGroupAtIndexPath:", v6))
    {
LABEL_4:
      v7 = 0;
LABEL_5:
      v8 = 0;
LABEL_6:
      v5 = 1;
LABEL_12:

      goto LABEL_13;
    }
    if (-[TKTonePickerController _isVibrationGroupAtIndexPath:](self, "_isVibrationGroupAtIndexPath:", v6))
    {
      -[TKTonePickerController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "tonePickerControllerRequestsPresentingVibrationPicker:", self);

      goto LABEL_11;
    }
    if (-[TKTonePickerController _isToneStoreGroupAtIndexPath:](self, "_isToneStoreGroupAtIndexPath:", v6))
    {
      v11 = objc_msgSend(v6, "tk_row");
      if (v11 == 1)
      {
        -[TKTonePickerController _redownloadAllTones](self, "_redownloadAllTones");
      }
      else if (!v11)
      {
        -[TKTonePickerController _goToStore](self, "_goToStore");
      }
      goto LABEL_4;
    }
    if (-[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v6))
    {
      -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v12);

      v7 = (id)*MEMORY[0x24BEB8DD0];
      -[TKTonePickerController stopPlayingWithFadeOut:](self, "stopPlayingWithFadeOut:", 0);
      v8 = 0;
      if (v13)
        goto LABEL_6;
    }
    else
    {
      if (!-[TKTonePickerController _isMediaGroupAtIndexPath:](self, "_isMediaGroupAtIndexPath:", v6))
      {
        if (-[TKTonePickerController _isDividerAtIndexPath:](self, "_isDividerAtIndexPath:", v6))
        {
LABEL_11:
          v7 = 0;
          v8 = 0;
          v5 = 0;
          goto LABEL_12;
        }
        -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v6);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("<classic_ringtone_identifier>")) & 1) != 0
          || objc_msgSend(v7, "isEqualToString:", CFSTR("<classic_alert_tone_identifier>")))
        {
          -[TKTonePickerController stopPlayingWithFadeOut:](self, "stopPlayingWithFadeOut:", 0);
          -[TKTonePickerController delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "tonePickerController:requestsPresentingToneClassicsPickerForItem:", self, v4);

          goto LABEL_5;
        }
        -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "isEqual:", v21);

        if ((v22 & 1) != 0)
        {
          -[TKTonePickerController _togglePlayForToneWithIdentifier:](self, "_togglePlayForToneWithIdentifier:", v7);
          goto LABEL_5;
        }
        v8 = 0;
        v18 = 1;
LABEL_27:
        -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTonePickerController _didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:](self, "_didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:", 0, v19);
        -[TKTonePickerController _didUpdateDetailText:ofPickerItemForRowAtIndexPath:](self, "_didUpdateDetailText:ofPickerItemForRowAtIndexPath:", 0, v19);
        -[TKTonePickerController _didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:](self, "_didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:", 1, v6);
        -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v6);
        -[TKTonePickerController _resetSelectedClassicRingtoneIndex](self, "_resetSelectedClassicRingtoneIndex");
        -[TKTonePickerController _resetSelectedClassicAlertToneIndex](self, "_resetSelectedClassicAlertToneIndex");
        -[TKTonePickerController _updateDetailTextOfVibrationItem](self, "_updateDetailTextOfVibrationItem");
        if (v8)
          -[TKTonePickerController _didSelectMediaItemWithIdentifier:](self, "_didSelectMediaItemWithIdentifier:", v8);
        else
          -[TKTonePickerController _didSelectToneWithIdentifier:](self, "_didSelectToneWithIdentifier:", v7);

        if (v18)
          -[TKTonePickerController _playToneWithIdentifier:](self, "_playToneWithIdentifier:", v7);
        goto LABEL_6;
      }
      -[TKTonePickerController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "tk_row");
      if (v15 >= -[TKTonePickerController _mediaItemsCount](self, "_mediaItemsCount"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "tonePickerControllerRequestsPresentingMediaItemPicker:", self);

        goto LABEL_4;
      }
      -[TKTonePickerController _identifierOfMediaItemAtIndex:](self, "_identifierOfMediaItemAtIndex:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "isEqual:", v16);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "tonePickerController:didSelectMediaItemAtIndex:selectionDidChange:", self, v15, v17 ^ 1u);

      v7 = 0;
      if ((v17 & 1) != 0)
        goto LABEL_6;
    }
    v18 = 0;
    goto LABEL_27;
  }
  v5 = -[TKTonePickerController _didSelectToneClassicsPickerItem:](self, "_didSelectToneClassicsPickerItem:", v4);
LABEL_13:

  return v5;
}

- (BOOL)_didSelectToneClassicsPickerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", CFSTR("<classic_ringtone_identifier>"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", CFSTR("<classic_alert_tone_identifier>"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "section");
  v8 = objc_msgSend(v4, "classicToneIndex");
  v17 = v7;
  if (v5 && v7 == objc_msgSend(v5, "tk_section"))
  {
    v9 = v5;
    -[TKTonePickerController _classicRingtoneIdentifiers](self, "_classicRingtoneIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex");
  }
  else
  {
    if (!v6 || v7 != objc_msgSend(v6, "tk_section"))
    {
      v10 = 0;
      v9 = 0;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }
    v9 = v6;
    -[TKTonePickerController _classicAlertToneIdentifiers](self, "_classicAlertToneIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex");
  }
  v12 = v11;
LABEL_9:
  objc_msgSend(v10, "objectAtIndex:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v14) && v8 == v12)
  {
    -[TKTonePickerController _togglePlayForToneWithIdentifier:](self, "_togglePlayForToneWithIdentifier:", v13);
  }
  else
  {
    -[TKTonePickerController _nameForToneIdentifier:](self, "_nameForToneIdentifier:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _didUpdateDetailText:ofPickerItemForRowAtIndexPath:](self, "_didUpdateDetailText:ofPickerItemForRowAtIndexPath:", v15, v9);

    if ((objc_msgSend(v9, "isEqual:", v14) & 1) == 0)
    {
      -[TKTonePickerController _didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:](self, "_didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:", 0, v14);
      -[TKTonePickerController _didUpdateDetailText:ofPickerItemForRowAtIndexPath:](self, "_didUpdateDetailText:ofPickerItemForRowAtIndexPath:", 0, v14);
      -[TKTonePickerController _didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:](self, "_didUpdateCheckedStatus:ofPickerItemForRowAtIndexPath:", 1, v9);
      -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v9);
    }
    -[TKTonePickerController _resetSelectedClassicRingtoneIndex](self, "_resetSelectedClassicRingtoneIndex");
    -[TKTonePickerController _resetSelectedClassicAlertToneIndex](self, "_resetSelectedClassicAlertToneIndex");
    if (v5 && v17 == objc_msgSend(v5, "tk_section"))
    {
      -[TKTonePickerController _setSelectedClassicRingtoneIndex:](self, "_setSelectedClassicRingtoneIndex:", v8);
    }
    else if (v6 && v17 == objc_msgSend(v6, "tk_section"))
    {
      -[TKTonePickerController _setSelectedClassicAlertToneIndex:](self, "_setSelectedClassicAlertToneIndex:", v8);
    }
    -[TKTonePickerController _didUpdateCheckedStatus:ofToneClassicsPickerItem:](self, "_didUpdateCheckedStatus:ofToneClassicsPickerItem:", 1, v4);
    -[TKTonePickerController _updateDetailTextOfVibrationItem](self, "_updateDetailTextOfVibrationItem");
    -[TKTonePickerController _didSelectToneWithIdentifier:](self, "_didSelectToneWithIdentifier:", v13);
    -[TKTonePickerController _playToneWithIdentifier:](self, "_playToneWithIdentifier:", v13);
  }

  return 1;
}

- (BOOL)canDeleteTonePickerItem:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v11;

  v4 = (void *)MEMORY[0x24BDD15D8];
  v5 = a3;
  v6 = objc_msgSend(v5, "row");
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v4, "tk_indexPathForRow:inSection:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TKTonePickerController _isIgnoreMuteGroupAtIndexPath:](self, "_isIgnoreMuteGroupAtIndexPath:", v8)
    || -[TKTonePickerController _isVibrationGroupAtIndexPath:](self, "_isVibrationGroupAtIndexPath:", v8)
    || -[TKTonePickerController _isToneStoreGroupAtIndexPath:](self, "_isToneStoreGroupAtIndexPath:", v8)
    || -[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v8)
    || -[TKTonePickerController _isMediaGroupAtIndexPath:](self, "_isMediaGroupAtIndexPath:", v8)
    || -[TKTonePickerController _isDividerAtIndexPath:](self, "_isDividerAtIndexPath:", v8))
  {
    v9 = 0;
  }
  else
  {
    -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v9 = -[NSMutableSet containsObject:](self->_identifiersOfRemovableTones, "containsObject:", v11);
    else
      v9 = 0;

  }
  return v9;
}

- (void)deleteTonePickerItem:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[TKTonePickerController canDeleteTonePickerItem:](self, "canDeleteTonePickerItem:", v4))
  {
    TLLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
      v7 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v7, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v23 = "-[TKTonePickerController deleteTonePickerItem:]";
        v24 = 2113;
        v25 = v9;
        v26 = 2049;
        v27 = 1505;
        v28 = 2113;
        v29 = v10;
        _os_log_impl(&dword_2157C4000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
    }

    TLLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TKTonePickerController deleteTonePickerItem:].cold.1((uint64_t)v4, v11);

  }
  v12 = objc_msgSend(v4, "section");
  v13 = objc_msgSend(v4, "row");
  objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _identifierOfToneAtIndexPath:](self, "_identifierOfToneAtIndexPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __47__TKTonePickerController_deleteTonePickerItem___block_invoke;
    v17[3] = &unk_24D37FDE8;
    v17[4] = self;
    v20 = v12;
    v21 = v13;
    v18 = v15;
    v19 = v4;
    -[TKTonePickerController _performBatchUpdates:completion:](self, "_performBatchUpdates:completion:", v17, 0);

  }
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  objc_msgSend(*(id *)(a1 + 32), "pickerItemForSection:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForFirstToneGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tk_section");

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v5 < v2)
  {
    v7 = v5;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "pickerItemForSection:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v2 != v7);
  }
  v9 = objc_msgSend(v3, "numberOfChildren");
  if (*(_QWORD *)(a1 + 64) + 1 >= v9)
  {
    v57 = 0;
  }
  else
  {
    objc_msgSend(v3, "childItemAtIndex:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(v10 + 56);
  *(_BYTE *)(v10 + 56) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_removeToneWithIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_reloadTonesForExternalChange:shouldSkipDelegateFullReload:", 0, 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = v11;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  v15 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "mutableCopy");
  if (v14 + 1 == v2)
  {
    objc_msgSend(v13, "addObject:", v3);
    v16 = (void *)v55;
    objc_msgSend(v15, "insertObject:atIndex:", v55, *(_QWORD *)(a1 + 56) - v5);
    v53 = v3;
    v17 = (void *)v56;
  }
  else
  {
    if (v14 != v2)
    {
      TLLogGeneral();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
        v20 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v20, "lastPathComponent");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          *(_DWORD *)buf = 136381443;
          v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
          v64 = 2113;
          v65 = v54;
          v66 = 2049;
          v67 = 1543;
          v68 = 2113;
          v69 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v69;
          _os_log_impl(&dword_2157C4000, v21, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
      }

      TLLogGeneral();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_7();

    }
    objc_msgSend(*(id *)(a1 + 32), "pickerItemForSection:", *(_QWORD *)(a1 + 56));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v24;
    v25 = objc_msgSend(v24, "numberOfChildren");
    objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 48));
    if (v25 + 2 == v9)
    {
      v16 = (void *)v55;
      v17 = (void *)v56;
      v26 = v57;
      if (!v57)
      {
        TLLogGeneral();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

        if (v28)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
          v29 = objc_claimAutoreleasedReturnValue();
          TLLogGeneral();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject lastPathComponent](v29, "lastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381443;
            v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
            v64 = 2113;
            v65 = v31;
            v66 = 2049;
            v67 = 1549;
            v68 = 2113;
            v69 = (uint64_t)v32;
            _os_log_impl(&dword_2157C4000, v30, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            v17 = (void *)v56;
          }

        }
        else
        {
          TLLogGeneral();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
        }
        v26 = 0;

        TLLogGeneral();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_3();

      }
      objc_msgSend(v12, "addObject:", v26);
    }
    else
    {
      v16 = (void *)v55;
      v17 = (void *)v56;
      if (v25 + 1 != v9)
      {
        TLLogGeneral();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

        if (v34)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
          v35 = objc_claimAutoreleasedReturnValue();
          TLLogGeneral();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject lastPathComponent](v35, "lastPathComponent");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381443;
            v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
            v64 = 2113;
            v65 = v37;
            v66 = 2049;
            v67 = 1552;
            v68 = 2113;
            v69 = (uint64_t)v38;
            _os_log_impl(&dword_2157C4000, v36, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            v17 = (void *)v56;
          }

        }
        else
        {
          TLLogGeneral();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
        }

        TLLogGeneral();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_5();

      }
    }
  }
  v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v42 = objc_msgSend(v17, "count");
  if (v42 != objc_msgSend(v15, "count"))
  {
    TLLogGeneral();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);

    if (v44)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
      v45 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v45, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v63 = "-[TKTonePickerController deleteTonePickerItem:]_block_invoke";
        v64 = 2113;
        v65 = v47;
        v66 = 2049;
        v67 = 1557;
        v68 = 2113;
        v69 = (uint64_t)v48;
        _os_log_impl(&dword_2157C4000, v46, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        v16 = (void *)v55;
      }

      v17 = (void *)v56;
    }
    else
    {
      TLLogGeneral();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
    }

    TLLogGeneral();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_1();

  }
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __47__TKTonePickerController_deleteTonePickerItem___block_invoke_73;
  v58[3] = &unk_24D37FDC0;
  v59 = v15;
  v60 = v6;
  v61 = v41;
  v50 = v41;
  v51 = v6;
  v52 = v15;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v58);
  objc_msgSend(*(id *)(a1 + 32), "_applyBatchUpdatesWithDeletedPickerRowItems:deletedTonePickerSectionItems:insertedPickerRowItems:insertedTonePickerSectionItems:tonePickerSectionItemsWithUpdatedHeaderText:tonePickerSectionItemsWithUpdatedFooterText:", v12, v13, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v50, MEMORY[0x24BDBD1A8]);

}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_73(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setText:", v8);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

  }
}

- (BOOL)_showsNoneInSeparateToneGroup
{
  if (self->_showsNone)
    return !-[TKTonePickerController isNoneAtTop](self, "isNoneAtTop");
  else
    return 0;
}

- (void)_reloadStateForBasicBehavior
{
  int64_t alertType;
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  unint64_t v11;
  id v12;

  alertType = self->_alertType;
  if (alertType > 13)
  {
    if (alertType == 14)
    {
      v5 = 0;
      v9 = 1;
      v7 = 28;
      v6 = 30;
    }
    else
    {
      if (alertType != 28)
        goto LABEL_14;
      v5 = 0;
      v9 = 1;
      v7 = 28;
      v6 = 31;
    }
LABEL_22:
    v8 = 1;
    goto LABEL_23;
  }
  if (alertType == 1)
  {
    if (-[NSString isEqualToString:](self->_topic, "isEqualToString:", *MEMORY[0x24BEB8D18]))
    {
      v9 = 0;
      v5 = 0;
      v8 = 1;
      v6 = 31;
      v7 = 31;
      goto LABEL_23;
    }
    v10 = -[NSString isEqualToString:](self->_topic, "isEqualToString:", *MEMORY[0x24BEB8D20]);
    v5 = 0;
    v6 = 31;
    if (v10)
      v7 = 31;
    else
      v7 = 28;
    v9 = !v10;
    goto LABEL_22;
  }
  if (alertType != 13)
  {
LABEL_14:
    v9 = 0;
    v5 = 0;
    v8 = 1;
    v7 = 27;
    v6 = 31;
    goto LABEL_23;
  }
  v4 = -[NSString isEqualToString:](self->_topic, "isEqualToString:", *MEMORY[0x24BEB8CF0]);
  v5 = v4;
  if (v4)
    v6 = 4;
  else
    v6 = 30;
  if (v4)
    v7 = 4;
  else
    v7 = 28;
  v8 = !v4;
  v9 = 1;
LABEL_23:
  if (_os_feature_enabled_impl())
    v11 = v7;
  else
    v11 = v6;
  self->_toneTypes = v11;
  -[TKTonePickerController _setBehavesAsRingtonePicker:](self, "_setBehavesAsRingtonePicker:", v9);
  if (self->_showsNoneWasExplicitlySet)
  {
    if (v5)
    {
LABEL_28:
      -[TLToneManager currentToneIdentifierForAlertType:topic:](self->_toneManager, "currentToneIdentifierForAlertType:topic:", self->_alertType, self->_topic);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController setSelectedToneIdentifier:](self, "setSelectedToneIdentifier:", v12);

    }
  }
  else if (self->_hasLoadedTonesOnce)
  {
    -[TKTonePickerController setShowsNone:](self, "setShowsNone:", v8);
    self->_showsNoneWasExplicitlySet = 0;
    if (v5)
      goto LABEL_28;
  }
  else
  {
    self->_showsNone = v8;
    if (v5)
      goto LABEL_28;
  }
}

- (void)_reloadTones
{
  -[TKTonePickerController _reloadTonesForExternalChange:shouldSkipDelegateFullReload:](self, "_reloadTonesForExternalChange:shouldSkipDelegateFullReload:", 0, 0);
}

- (void)_reloadTonesForExternalChange:(BOOL)a3 shouldSkipDelegateFullReload:(BOOL)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *toneGroupLists;
  NSMutableArray *v15;
  NSMutableArray *toneGroupNames;
  NSMutableArray *v17;
  NSMutableArray *toneGroupBucketIdentifiers;
  id v19;
  id v20;
  NSArray *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  int v30;
  unint64_t toneTypes;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  int v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  __CFString *v59;
  const __CFString *v60;
  id v61;
  __CFString *v62;
  NSMutableArray *v63;
  NSMutableArray *v64;
  const __CFString *v65;
  uint64_t v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  int v75;
  int v76;
  NSArray *obj;
  int v78;
  id v79;
  _BOOL4 v80;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  __CFString *v89;
  _BOOL4 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  _BYTE v103[128];
  uint64_t v104;

  v80 = a3;
  v104 = *MEMORY[0x24BDAC8D0];
  v99 = 0;
  if (!self->_shouldFreezeContentsOriginatingFromToneManager)
    -[TKTonePickerController _reloadMediaItems](self, "_reloadMediaItems");
  -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKTonePickerController _isDefaultGroupAtIndexPath:](self, "_isDefaultGroupAtIndexPath:", v5);

  HIDWORD(v74) = v6;
  if (v6)
  {
    LODWORD(v74) = 0;
    v78 = 0;
    v83 = 0;
    goto LABEL_14;
  }
  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TKTonePickerController _isNoneGroupAtIndexPath:](self, "_isNoneGroupAtIndexPath:", v7);

  if (v8)
  {
    v78 = 0;
    v83 = 0;
    LODWORD(v74) = 1;
    goto LABEL_14;
  }
  -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _identifierAtIndexPath:isMediaItem:](self, "_identifierAtIndexPath:isMediaItem:", v9, &v99);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v99)
  {
    if (objc_msgSend(v10, "length"))
      goto LABEL_9;
LABEL_11:
    if (self->_showsDefault)
    {
      v83 = v10;
      LODWORD(v74) = 0;
      v78 = 0;
    }
    else
    {
      -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();

      LODWORD(v74) = 0;
      v78 = 0;
      v83 = (void *)v11;
    }
    goto LABEL_14;
  }
  if (!v10)
    goto LABEL_11;
LABEL_9:
  v83 = v10;
  LODWORD(v74) = 0;
  v78 = 1;
LABEL_14:
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v82 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v86 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  toneGroupLists = self->_toneGroupLists;
  self->_toneGroupLists = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  toneGroupNames = self->_toneGroupNames;
  self->_toneGroupNames = v15;

  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  toneGroupBucketIdentifiers = self->_toneGroupBucketIdentifiers;
  self->_toneGroupBucketIdentifiers = v17;

  v90 = -[TKTonePickerController _behavesAsRingtonePicker](self, "_behavesAsRingtonePicker");
  v87 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v88 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v84 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v85 = v12;
  v79 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_shouldFreezeContentsOriginatingFromToneManager)
  {
    v21 = self->_installedTones;
  }
  else
  {
    -[TLToneManager _installedTones](self->_toneManager, "_installedTones");
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v21;
  v22 = v21;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v96 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend(v27, "identifier", v74, obj);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "isPrivateTone") & 1) == 0)
        {
          if ((-[TLToneManager toneWithIdentifierIsValid:](self->_toneManager, "toneWithIdentifierIsValid:", v28) & 1) != 0)
          {
            if (v90
              || (objc_msgSend(v27, "duration"), v29 <= 30.0) && (objc_msgSend(v27, "isProtectedContent") & 1) == 0)
            {
              if ((objc_msgSend(v27, "isRingtone") & 1) != 0)
              {
                v30 = objc_msgSend(v27, "isPurchased");
                toneTypes = self->_toneTypes;
                if (v30)
                {
                  if ((toneTypes & 0x10) == 0)
                    goto LABEL_41;
                  v32 = v19;
                }
                else
                {
                  if ((toneTypes & 8) == 0)
                    goto LABEL_41;
                  v32 = v87;
                }
              }
              else
              {
                if ((self->_toneTypes & 2) == 0)
                  goto LABEL_41;
                if (objc_msgSend(v27, "isPurchased"))
                  v32 = v20;
                else
                  v32 = v88;
              }
              objc_msgSend(v32, "addObject:", v28);
            }
          }
          else
          {
            TLLogToneManagement();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v102 = v27;
              _os_log_impl(&dword_2157C4000, v33, OS_LOG_TYPE_DEFAULT, "Skipping %{public}@ in tone picker because this tone is not valid.", buf, 0xCu);
            }

          }
        }
LABEL_41:

      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    }
    while (v24);
  }

  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[NSMutableDictionary count](self->_activeToneStoreDownloadsByIdentifier, "count"))
  {
    -[NSMutableDictionary allValues](self->_activeToneStoreDownloadsByIdentifier, "allValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v35);

  }
  if (-[NSMutableDictionary count](self->_finishedToneStoreDownloadsByIdentifier, "count", v74))
  {
    -[NSMutableDictionary allValues](self->_finishedToneStoreDownloadsByIdentifier, "allValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v36);

  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v37 = v34;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v92 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
        objc_msgSend(v42, "toneIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          objc_msgSend(v42, "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v44 = objc_msgSend(v42, "isRingtone");
        v45 = self->_toneTypes;
        if (!v44)
        {
          v46 = v20;
          if ((v45 & 2) == 0)
            goto LABEL_59;
LABEL_58:
          objc_msgSend(v46, "addObject:", v43);
          goto LABEL_59;
        }
        v46 = v19;
        if ((v45 & 0x10) != 0)
          goto LABEL_58;
LABEL_59:

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
    }
    while (v39);
  }

  v47 = self->_toneTypes;
  v48 = v85;
  if ((v47 & 4) != 0)
  {
    -[TKTonePickerController _loadRingtonesFromPlist](self, "_loadRingtonesFromPlist");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKey:", CFSTR("modern"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addObjectsFromArray:", v50);
    objc_msgSend(v49, "objectForKey:", CFSTR("classic"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _setClassicRingtoneIdentifiers:](self, "_setClassicRingtoneIdentifiers:", v51);
    if (v51)
      objc_msgSend(v84, "addObject:", CFSTR("<classic_ringtone_identifier>"));

    v47 = self->_toneTypes;
    v48 = v85;
  }
  if ((v47 & 1) != 0)
  {
    -[TKTonePickerController _loadAlertTonesFromPlist](self, "_loadAlertTonesFromPlist");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKey:", CFSTR("modern"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObjectsFromArray:", v53);
    objc_msgSend(v52, "objectForKey:", CFSTR("classic"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _setClassicAlertToneIdentifiers:](self, "_setClassicAlertToneIdentifiers:", v54);
    if (v54)
      objc_msgSend(v79, "addObject:", CFSTR("<classic_alert_tone_identifier>"));

    v48 = v85;
  }
  -[TKTonePickerController _sortToneIdentifiersArray:](self, "_sortToneIdentifiersArray:", v19);
  -[TKTonePickerController _sortToneIdentifiersArray:](self, "_sortToneIdentifiersArray:", v87);
  -[TKTonePickerController _sortToneIdentifiersArray:](self, "_sortToneIdentifiersArray:", v20);
  -[TKTonePickerController _sortToneIdentifiersArray:](self, "_sortToneIdentifiersArray:", v88);
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v82, "addObjectsFromArray:", v19);
    objc_msgSend(v86, "addObjectsFromArray:", v19);
  }
  if (objc_msgSend(v87, "count"))
  {
    objc_msgSend(v82, "addObjectsFromArray:", v87);
    objc_msgSend(v86, "addObjectsFromArray:", v87);
  }
  if (objc_msgSend(v84, "count"))
  {
    if (objc_msgSend(v82, "count"))
      objc_msgSend(v82, "addObject:", &stru_24D3804C8);
    objc_msgSend(v82, "addObjectsFromArray:", v84);
  }
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(v48, "addObjectsFromArray:", v20);
    objc_msgSend(v86, "addObjectsFromArray:", v20);
  }
  if (objc_msgSend(v88, "count"))
  {
    objc_msgSend(v48, "addObjectsFromArray:", v88);
    objc_msgSend(v86, "addObjectsFromArray:", v88);
  }
  if (objc_msgSend(v79, "count"))
  {
    if (objc_msgSend(v48, "count"))
      objc_msgSend(v48, "addObject:", &stru_24D3804C8);
    objc_msgSend(v48, "addObjectsFromArray:", v79);
  }
  v55 = -[TKTonePickerController _showsMedia](self, "_showsMedia");
  v56 = objc_msgSend(v82, "count");
  v57 = objc_msgSend(v48, "count");
  if (v57)
    v58 = v56 == 0;
  else
    v58 = 1;
  if (!v58 || v55)
  {
    TLLocalizedString();
    v89 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    TLLocalizedString();
    v59 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v59 = &stru_24D3804C8;
    v89 = &stru_24D3804C8;
  }
  if (v90)
  {
    if (v56)
    {
      -[NSMutableArray addObject:](self->_toneGroupLists, "addObject:", v82);
      -[NSMutableArray addObject:](self->_toneGroupNames, "addObject:", v89);
      -[NSMutableArray addObject:](self->_toneGroupBucketIdentifiers, "addObject:", CFSTR("ringtones"));
    }
    if (v57)
    {
      v60 = CFSTR("alert tones");
      v61 = v85;
      v62 = v59;
LABEL_102:
      -[NSMutableArray addObject:](self->_toneGroupLists, "addObject:", v61);
      -[NSMutableArray addObject:](self->_toneGroupNames, "addObject:", v62);
      -[NSMutableArray addObject:](self->_toneGroupBucketIdentifiers, "addObject:", v60);
    }
  }
  else
  {
    if (v57)
    {
      -[NSMutableArray addObject:](self->_toneGroupLists, "addObject:", v85);
      -[NSMutableArray addObject:](self->_toneGroupNames, "addObject:", v59);
      -[NSMutableArray addObject:](self->_toneGroupBucketIdentifiers, "addObject:", CFSTR("alert tones"));
    }
    if (v56)
    {
      v60 = CFSTR("ringtones");
      v61 = v82;
      v62 = v89;
      goto LABEL_102;
    }
  }
  if (self->_overrideFirstToneSectionTitle)
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_toneGroupNames, "replaceObjectAtIndex:withObject:", 0);
  if (self->_showsNone && -[TKTonePickerController isNoneAtTop](self, "isNoneAtTop"))
  {
    if (-[TKTonePickerController _showsNoneInSeparateToneGroup](self, "_showsNoneInSeparateToneGroup"))
    {
      v63 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NSMutableArray addObject:](v63, "addObject:", *MEMORY[0x24BEB8DD0]);
      -[NSMutableArray insertObject:atIndex:](self->_toneGroupLists, "insertObject:atIndex:", v63, 0);
      -[NSMutableArray insertObject:atIndex:](self->_toneGroupNames, "insertObject:atIndex:", &stru_24D3804C8, 0);
      v64 = self->_toneGroupBucketIdentifiers;
      v65 = CFSTR("none");
    }
    else
    {
      -[NSMutableArray firstObject](self->_toneGroupLists, "firstObject");
      v63 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray insertObject:atIndex:](v63, "insertObject:atIndex:", &stru_24D3804C8, 0);
      v65 = (const __CFString *)*MEMORY[0x24BEB8DD0];
      v64 = v63;
    }
    -[NSMutableArray insertObject:atIndex:](v64, "insertObject:atIndex:", v65, 0);

  }
  objc_storeStrong((id *)&self->_installedTones, obj);
  objc_storeStrong((id *)&self->_identifiersOfRemovableTones, v86);
  if (!v78)
  {
    if (v76)
    {
      -[TKTonePickerController _indexPathForDefaultGroup](self, "_indexPathForDefaultGroup");
      v66 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v75)
      {
        -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", v72);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_120;
      }
      -[TKTonePickerController _indexPathForNone](self, "_indexPathForNone");
      v66 = objc_claimAutoreleasedReturnValue();
    }
LABEL_119:
    v67 = (void *)v66;
LABEL_120:
    v68 = 0;
    goto LABEL_121;
  }
  -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", v83);
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
    goto LABEL_119;
  if (self->_showsDefault)
  {
    -[TKTonePickerController _indexPathForDefaultGroup](self, "_indexPathForDefaultGroup");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", v73);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v68 = 1;
LABEL_121:
  -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v67);
  if (v80)
  {
    -[TLToneManager currentToneIdentifierForAlertType:](self->_toneManager, "currentToneIdentifierForAlertType:", -[TKTonePickerController alertType](self, "alertType"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _setSelectedToneIdentifier:currentlyReloadingTones:](self, "_setSelectedToneIdentifier:currentlyReloadingTones:", v69, 1);
    if (!v83 || (objc_msgSend(v69, "isEqualToString:", v83) & 1) == 0)
      v68 = 1;

  }
  self->_hasLoadedTonesOnce = 1;
  if (!a4)
    -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
  if (v68)
  {
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _identifierAtIndexPath:isMediaItem:](self, "_identifierAtIndexPath:isMediaItem:", v70, &v99);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
      -[TKTonePickerController _didSelectMediaItemWithIdentifier:](self, "_didSelectMediaItemWithIdentifier:", v71);
    else
      -[TKTonePickerController _didSelectToneWithIdentifier:](self, "_didSelectToneWithIdentifier:", v71);

  }
}

- (id)_platformSpecificAdjustedPlistName:(id)a3
{
  id v4;
  int64_t targetDevice;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  targetDevice = self->_targetDevice;
  v6 = v4;
  v7 = v6;
  v8 = v6;
  if (targetDevice == 1)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("-watchOS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)_alertTonesPlistName
{
  return (NSString *)-[TKTonePickerController _platformSpecificAdjustedPlistName:](self, "_platformSpecificAdjustedPlistName:", CFSTR("TKAlertTones"));
}

- (NSString)_ringtonesPlistName
{
  __CFString *v3;

  if (self->_alertType == 13 && -[NSString isEqualToString:](self->_topic, "isEqualToString:", *MEMORY[0x24BEB8CF0]))
  {
    v3 = CFSTR("TKAlarmWakeUpRingtones");
  }
  else
  {
    -[TKTonePickerController _platformSpecificAdjustedPlistName:](self, "_platformSpecificAdjustedPlistName:", CFSTR("TKRingtones"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (id)_loadTonesFromPlistNamed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  TLToneManager *toneManager;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  int v31;
  TKTonePickerController *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TKRingtones")) & 1) != 0
      || (v5 = v4, objc_msgSend(v4, "isEqualToString:", CFSTR("TKAlertTones"))))
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("-EncoreInfinitum"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  TLLogToneManagement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138543618;
    v32 = self;
    v33 = 2114;
    v34 = v5;
    _os_log_impl(&dword_2157C4000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Loading tones from plist named: %{public}@.", (uint8_t *)&v31, 0x16u);
  }

  v7 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v5, CFSTR("plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithContentsOfFile:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", CFSTR("modern"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v10, "objectForKey:", CFSTR("classic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x24BEB8CB8], "sharedCapabilitiesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "wantsModernDefaultRingtone"))
  {
    v16 = objc_msgSend(v4, "isEqualToString:", CFSTR("TKRingtones"));

    if ((v16 & 1) != 0)
    {
      if (_os_feature_enabled_impl())
        v17 = v14;
      else
        v17 = v12;
      objc_msgSend(v17, "addObject:", CFSTR("system:Opening"));
    }
  }
  else
  {

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("sort"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && objc_msgSend(v18, "BOOLValue"))
  {
    -[TKTonePickerController _sortToneIdentifiersArray:](self, "_sortToneIdentifiersArray:", v12);
    -[TKTonePickerController _sortToneIdentifiersArray:](self, "_sortToneIdentifiersArray:", v14);
  }
  toneManager = self->_toneManager;
  -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLToneManager _aliasForToneIdentifier:](toneManager, "_aliasForToneIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v12, "indexOfObject:", v22);
  if (self->_alertType == 17 && v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14)
    {
      v24 = objc_msgSend(v14, "indexOfObject:", CFSTR("texttone:Tri-tone"));
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v14, "removeObjectAtIndex:", v24);
        objc_msgSend(v12, "insertObject:atIndex:", CFSTR("texttone:Tri-tone"), 0);
      }
    }
  }
  v25 = objc_msgSend(v12, "indexOfObject:", v22);
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "removeObjectAtIndex:", v25);
    v27 = v12;
    goto LABEL_27;
  }
  if (v14)
  {
    v26 = objc_msgSend(v14, "indexOfObject:", v22);
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v14, "removeObjectAtIndex:", v26);
      v27 = v14;
LABEL_27:
      objc_msgSend(v27, "insertObject:atIndex:", v22, 0);
    }
  }
  v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v29 = v28;
  if (v12)
    objc_msgSend(v28, "setObject:forKey:", v12, CFSTR("modern"));
  if (v14)
    objc_msgSend(v29, "setObject:forKey:", v14, CFSTR("classic"));

  return v29;
}

- (id)_loadAlertTonesFromPlist
{
  void *v3;
  void *v4;

  -[TKTonePickerController _alertTonesPlistName](self, "_alertTonesPlistName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _loadTonesFromPlistNamed:](self, "_loadTonesFromPlistNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_loadRingtonesFromPlist
{
  void *v3;
  void *v4;

  -[TKTonePickerController _ringtonesPlistName](self, "_ringtonesPlistName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _loadTonesFromPlistNamed:](self, "_loadTonesFromPlistNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_sortToneIdentifiersArray:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__TKTonePickerController__sortToneIdentifiersArray___block_invoke;
  v3[3] = &unk_24D37FE10;
  v3[4] = self;
  objc_msgSend(a3, "sortUsingComparator:", v3);
}

uint64_t __52__TKTonePickerController__sortToneIdentifiersArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_nameForToneIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_nameForToneIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v8);
  return v9;
}

- (TLToneManager)_toneManager
{
  return self->_toneManager;
}

- (void)_setToneManager:(id)a3
{
  TLToneManager *v5;
  TLToneManager **p_toneManager;
  void *v7;
  void *v8;
  _QWORD *v9;
  TLToneManager *v10;

  v5 = (TLToneManager *)a3;
  p_toneManager = &self->_toneManager;
  if (self->_toneManager != v5)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x24BEB8DF0];
    if (*p_toneManager)
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BEB8DF0]);
    objc_storeStrong((id *)&self->_toneManager, a3);
    if (*p_toneManager)
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__toneManagerContentsChanged_, *v9);

    v5 = v10;
  }

}

- (void)_performBatchUpdates:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a4;
  v6 = (void (**)(_QWORD))a3;
  -[TKTonePickerController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "tonePickerController:requestsPerformingBatchUpdates:completion:", self, v6, v8);

  }
  else
  {
    v6[2](v6);

    if (v8)
      v8[2](v8, 1);
  }

}

- (void)_applyBatchUpdatesWithDeletedPickerRowItems:(id)a3 deletedTonePickerSectionItems:(id)a4 insertedPickerRowItems:(id)a5 insertedTonePickerSectionItems:(id)a6 tonePickerSectionItemsWithUpdatedHeaderText:(id)a7 tonePickerSectionItemsWithUpdatedFooterText:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[TKTonePickerController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "tonePickerController:didDeletePickerRowItems:", self, v20);
  if (objc_msgSend(v14, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "tonePickerController:didDeleteTonePickerSectionItems:", self, v14);
  if (objc_msgSend(v15, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "tonePickerController:didInsertPickerRowItems:", self, v15);
  if (objc_msgSend(v16, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "tonePickerController:didInsertTonePickerSectionItems:", self, v16);
  if (objc_msgSend(v17, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "tonePickerController:didUpdateHeaderTextOfTonePickerSectionItems:", self, v17);
  if (objc_msgSend(v18, "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v19, "tonePickerController:didUpdateFooterTextOfTonePickerSectionItems:", self, v18);

}

- (BOOL)canShowStore
{
  TLToneStoreDownloadController *toneStoreDownloadController;
  unint64_t toneTypes;
  char v4;
  void *v5;
  char v6;
  void *v8;

  toneStoreDownloadController = self->_toneStoreDownloadController;
  toneTypes = self->_toneTypes;
  if ((toneTypes & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BEB8CB8], "sharedCapabilitiesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "isRingtoneStoreAvailable");

    if ((self->_toneTypes & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((toneTypes & 2) != 0)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BEB8CB8], "sharedCapabilitiesManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isAlertToneStoreAvailable");

      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  if (toneStoreDownloadController)
    return v4 | v6;
  else
    return 0;
}

- (void)setToneStoreDownloadController:(id)a3
{
  TLToneStoreDownloadController *v5;
  TLToneStoreDownloadController *toneStoreDownloadController;
  TLToneStoreDownloadController *v7;

  v5 = (TLToneStoreDownloadController *)a3;
  toneStoreDownloadController = self->_toneStoreDownloadController;
  if (toneStoreDownloadController != v5)
  {
    v7 = v5;
    -[TLToneStoreDownloadController removeObserver:](toneStoreDownloadController, "removeObserver:", self);
    objc_storeStrong((id *)&self->_toneStoreDownloadController, a3);
    -[TLToneStoreDownloadController addObserver:](self->_toneStoreDownloadController, "addObserver:", self);
    -[TKTonePickerController _enableToneStoreDownloadItemIfAppropriate](self, "_enableToneStoreDownloadItemIfAppropriate");
    v5 = v7;
  }

}

- (void)storeAccountNameDidChange:(id)a3
{
  _QWORD block[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  TKTonePickerController *v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v4 = __52__TKTonePickerController_storeAccountNameDidChange___block_invoke;
  v5 = &unk_24D37FE38;
  v6 = self;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__TKTonePickerController_storeAccountNameDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_enableToneStoreDownloadItemIfAppropriate");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_didUpdateFooterTextForToneStoreGroup");
  return result;
}

- (void)didFinishCheckingForAvailableToneStoreDownloads:(BOOL)a3
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  void *v5;
  TKTonePickerController *v6;
  BOOL v7;

  v4 = __74__TKTonePickerController_didFinishCheckingForAvailableToneStoreDownloads___block_invoke;
  v5 = &unk_24D37FE60;
  v7 = a3;
  v6 = self;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", MEMORY[0x24BDAC760], 3221225472))
    v4((uint64_t)&v3);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], &v3);
}

uint64_t __74__TKTonePickerController_didFinishCheckingForAvailableToneStoreDownloads___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_disableToneStoreDownloadItem");
  return result;
}

- (void)toneStoreDownloadsDidStart:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  TKTonePickerController *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke;
  v9 = &unk_24D37FF00;
  v10 = self;
  v11 = v4;
  v5 = (void *)MEMORY[0x24BDD17F0];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472))
    v8((uint64_t)&v7);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], &v7);

}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 2;
  objc_msgSend(*(id *)(a1 + 32), "_didUpdateToneStoreDownloadItem");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_2;
  v3[3] = &unk_24D37FF00;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "_performBatchUpdates:completion:", v3, 0);

}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v11, v12);
        objc_msgSend(v2, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  objc_msgSend(*(id *)(a1 + 32), "_reloadTonesForExternalChange:shouldSkipDelegateFullReload:", 0, 1);
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForFirstToneGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "tk_section");

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 88);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3;
  v26[3] = &unk_24D37FED8;
  v31 = v15;
  v32 = v18;
  v26[4] = v19;
  v27 = v14;
  v28 = v16;
  v29 = v13;
  v30 = v2;
  v21 = v15;
  v22 = v2;
  v23 = v13;
  v24 = v16;
  v25 = v14;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v26);
  objc_msgSend(*(id *)(a1 + 32), "_applyBatchUpdatesWithDeletedPickerRowItems:deletedTonePickerSectionItems:insertedPickerRowItems:insertedTonePickerSectionItems:tonePickerSectionItemsWithUpdatedHeaderText:tonePickerSectionItemsWithUpdatedFooterText:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v21, v24, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);

}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pickerItemForSection:", *(_QWORD *)(a1 + 80) + a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v10 = MEMORY[0x24BDAC760];
    v43 = 0;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_4;
    v39[3] = &unk_24D37FE88;
    v39[4] = &v40;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v39);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_5;
    v24[3] = &unk_24D37FEB0;
    v29 = &v35;
    v30 = &v31;
    v11 = *(id *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 32);
    v25 = v11;
    v26 = v12;
    v13 = v6;
    v27 = v13;
    v28 = *(id *)(a1 + 72);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v24);
    v14 = v36[3];
    v15 = v41[3];
    if (v14 != v15)
    {
      if (v14 != v15 + 1)
      {
        TLLogGeneral();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

        if (v17)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
          v18 = objc_claimAutoreleasedReturnValue();
          TLLogGeneral();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject lastPathComponent](v18, "lastPathComponent");
            v20 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136381443;
            v45 = "-[TKTonePickerController toneStoreDownloadsDidStart:]_block_invoke_3";
            v46 = 2113;
            v47 = v20;
            v48 = 2049;
            v49 = 2240;
            v50 = 2113;
            v51 = v21;
            _os_log_impl(&dword_2157C4000, v19, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

          }
        }
        else
        {
          TLLogGeneral();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
        }

        TLLogGeneral();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3_cold_1();

      }
      objc_msgSend(*(id *)(a1 + 32), "_pickerRowItemAtIndex:inSectionForItem:", v32[3], v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v23);

    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v40, 8);

  }
}

uint64_t __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", &stru_24D3804C8);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isEqualToString:", &stru_24D3804C8))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a3;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "_pickerRowItemAtIndex:inSectionForItem:", a3, *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

  }
}

- (void)toneStoreDownloadsDidProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  TKTonePickerController *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke;
  v9 = &unk_24D37FF00;
  v10 = self;
  v11 = v4;
  v5 = (void *)MEMORY[0x24BDD17F0];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472))
    v8((uint64_t)&v7);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], &v7);

}

void __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForFirstToneGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tk_section");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 40);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = &v20;
        v22 = 0x3032000000;
        v23 = __Block_byref_object_copy_;
        v24 = __Block_byref_object_dispose_;
        v25 = 0;
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke_120;
        v15[3] = &unk_24D37FF28;
        v10 = v8;
        v11 = *(_QWORD *)(a1 + 32);
        v16 = v10;
        v17 = v11;
        v18 = &v20;
        v19 = v3;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
        v12 = (void *)v21[5];
        if (v12)
        {
          objc_msgSend(v7, "downloadProgress");
          objc_msgSend(v12, "_setDownloadProgress:");
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "tonePickerController:didUpdateDownloadProgressOfTonePickerItem:", *(_QWORD *)(a1 + 32), v21[5]);

        }
        _Block_object_dispose(&v20, 8);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v4);
  }

}

void __56__TKTonePickerController_toneStoreDownloadsDidProgress___block_invoke_120(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = objc_msgSend(a2, "indexOfObject:", *(_QWORD *)(a1 + 32));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "_cachedPickerItemForSection:", *(_QWORD *)(a1 + 56) + a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = v9;
      objc_msgSend(*(id *)(a1 + 40), "_cachedPickerRowItemAtIndex:inSectionForItem:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);

      v9 = v11;
    }
    *a4 = 1;

  }
}

- (void)toneStoreDownloadsDidFinish:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  TKTonePickerController *v10;
  id v11;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke;
  v9 = &unk_24D37FF00;
  v10 = self;
  v11 = v4;
  v5 = (void *)MEMORY[0x24BDD17F0];
  v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472))
    v8((uint64_t)&v7);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], &v7);

}

uint64_t __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t result;
  __int128 v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  id v35;
  _BYTE *v36;
  uint64_t v37;
  uint8_t v38;
  _BYTE v39[15];
  uint8_t v40;
  _BYTE v41[15];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE buf[24];
  uint64_t v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_indexPathForFirstToneGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v2, "tk_section");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v3)
  {
    v30 = *(_QWORD *)v43;
    *(_QWORD *)&v4 = 136381443;
    v28 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v6, "identifier", v28);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "toneIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          TLLogGeneral();
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

          if (v10)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
            v11 = objc_claimAutoreleasedReturnValue();
            TLLogGeneral();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject lastPathComponent](v11, "lastPathComponent");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              *(_QWORD *)&buf[4] = "-[TKTonePickerController toneStoreDownloadsDidFinish:]_block_invoke";
              *(_WORD *)&buf[12] = 2113;
              *(_QWORD *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 2049;
              v47 = 2297;
              LOWORD(v48) = 2113;
              *(_QWORD *)((char *)&v48 + 2) = v14;
              _os_log_impl(&dword_2157C4000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

            }
          }
          else
          {
            TLLogGeneral();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_2(&v40, v41, v11);
          }

          TLLogGeneral();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_1(&v38, v39, v15);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", v7);
        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        if (!v16)
        {
          v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(void **)(v18 + 48);
          *(_QWORD *)(v18 + 48) = v17;

          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        }
        objc_msgSend(v16, "setObject:forKey:", v6, v8);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v47 = (uint64_t)__Block_byref_object_copy_;
        *(_QWORD *)&v48 = __Block_byref_object_dispose_;
        *((_QWORD *)&v48 + 1) = 0;
        v20 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_123;
        v32[3] = &unk_24D37FF50;
        v21 = v7;
        v22 = *(_QWORD *)(a1 + 32);
        v33 = v21;
        v34 = v22;
        v36 = buf;
        v37 = v31;
        v23 = v8;
        v35 = v23;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v32);
        v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v24)
        {
          objc_msgSend(v24, "_setShouldPreventSelection:", 0);
          LODWORD(v25) = 1.0;
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_setDownloadProgress:", v25);
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "tonePickerController:didUpdateDownloadProgressOfTonePickerItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

        }
        _Block_object_dispose(buf, 8);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v3);
  }

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_disableToneStoreDownloadItem");
  return result;
}

void __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_123(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(a1 + 32));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "_cachedPickerItemForSection:", *(_QWORD *)(a1 + 64) + a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "_cachedPickerRowItemAtIndex:inSectionForItem:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v10);

    }
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v8, *(_QWORD *)(a1 + 48));
    *a4 = 1;

  }
}

- (void)_didUpdateFooterTextForToneStoreGroup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TKTonePickerController _indexPathForToneStoreGroup](self, "_indexPathForToneStoreGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tk_section");

  -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TKTonePickerController _footerTextForToneStoreGroup](self, "_footerTextForToneStoreGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setFooterText:", v6);
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _applyBatchUpdatesWithDeletedPickerRowItems:deletedTonePickerSectionItems:insertedPickerRowItems:insertedTonePickerSectionItems:tonePickerSectionItemsWithUpdatedHeaderText:tonePickerSectionItemsWithUpdatedFooterText:](self, "_applyBatchUpdatesWithDeletedPickerRowItems:deletedTonePickerSectionItems:insertedPickerRowItems:insertedTonePickerSectionItems:tonePickerSectionItemsWithUpdatedHeaderText:tonePickerSectionItemsWithUpdatedFooterText:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v7);

  }
}

- (void)_didUpdateToneStoreDownloadItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[TKTonePickerController _indexPathForToneStoreDownloadItem](self, "_indexPathForToneStoreDownloadItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = v3;
    -[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", objc_msgSend(v3, "tk_section"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_msgSend(v11, "tk_row");
      -[TKTonePickerController _cachedPickerRowItemAtIndex:inSectionForItem:](self, "_cachedPickerRowItemAtIndex:inSectionForItem:", v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[TKTonePickerController _uncachePickerRowItemAtIndex:inSectionForItem:](self, "_uncachePickerRowItemAtIndex:inSectionForItem:", v5, v4);
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:](self, "_pickerRowItemAtIndex:inSectionForItem:", v5, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_setParentTonePickerController:", self);
        objc_msgSend(v8, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setText:", v9);

        objc_msgSend(v7, "_setShouldTintText:", objc_msgSend(v8, "shouldTintText"));
        objc_msgSend(v7, "_setNeedsActivityIndicator:", objc_msgSend(v8, "needsActivityIndicator"));
        objc_msgSend(v7, "_setShouldPreventSelection:", objc_msgSend(v8, "shouldPreventSelection"));
        -[TKTonePickerController _cachePickerRowItem:atIndex:inSectionForItem:](self, "_cachePickerRowItem:atIndex:inSectionForItem:", v7, v5, v4);
        -[TKTonePickerController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "tonePickerController:didUpdateTonePickerItem:", self, v7);

      }
    }

    v3 = v11;
  }

}

- (BOOL)_enableToneStoreDownloadItemIfAppropriate
{
  void *v3;
  uint64_t v4;

  if (!self->_isToneStoreDownloadButtonAllowed)
    return 0;
  if (self->_toneStoreDownloadButtonState != 3)
    return 0;
  -[TLToneStoreDownloadController storeAccountName](self->_toneStoreDownloadController, "storeAccountName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  self->_toneStoreDownloadButtonState = 0;
  -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
  -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
  return 1;
}

- (void)_disableToneStoreDownloadItem
{
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];

  v3 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke;
  v17[3] = &unk_24D37FE38;
  v17[4] = self;
  v4 = MEMORY[0x2199E5D50](v17, a2);
  v5 = (void (**)(_QWORD))v4;
  if (self->_toneStoreDownloadButtonState == 3)
  {
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    -[TKTonePickerController _indexPathForToneStoreDownloadItem](self, "_indexPathForToneStoreDownloadItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (-[TKTonePickerController _cachedPickerItemForSection:](self, "_cachedPickerItemForSection:", objc_msgSend(v6, "tk_section")), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:](self, "_pickerRowItemAtIndex:inSectionForItem:", objc_msgSend(v7, "tk_row"), v8);
      v14[0] = v3;
      v14[1] = 3221225472;
      v14[2] = __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_2;
      v14[3] = &unk_24D37FF78;
      v14[4] = self;
      v15 = v9;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_3;
      v12[3] = &unk_24D37FFA0;
      v12[4] = self;
      v13 = v5;
      v10 = v16;
      v11 = v9;
      -[TKTonePickerController _performBatchUpdates:completion:](self, "_performBatchUpdates:completion:", v14, v12);

    }
    else
    {
      self->_toneStoreDownloadButtonState = 3;
      self->_isToneStoreDownloadButtonAllowed = 0;
      if (v5)
        v5[2](v5);
    }

  }
}

uint64_t __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_reloadTonesForExternalChange:shouldSkipDelegateFullReload:", 1, 0);
}

void __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_setNumberOfChildren:", objc_msgSend(*(id *)(a1 + 40), "numberOfChildren") - 1);
  v2 = *(void **)(a1 + 32);
  v4[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applyBatchUpdatesWithDeletedPickerRowItems:deletedTonePickerSectionItems:insertedPickerRowItems:insertedTonePickerSectionItems:tonePickerSectionItemsWithUpdatedHeaderText:tonePickerSectionItemsWithUpdatedFooterText:", v3, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);

}

uint64_t __55__TKTonePickerController__disableToneStoreDownloadItem__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend((id)objc_opt_class(), "_updateLatestRedownloadAllTonesDate");
}

- (id)_footerTextForToneStoreGroup
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_toneStoreDownloadButtonState)
  {
    v2 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    TLLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneStoreDownloadController storeAccountName](self->_toneStoreDownloadController, "storeAccountName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_nameForToneIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4
    && ((-[NSMutableDictionary objectForKey:](self->_activeToneStoreDownloadsByIdentifier, "objectForKey:", v4),
         (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[NSMutableDictionary objectForKey:](self->_finishedToneStoreDownloadsByIdentifier, "objectForKey:", v4),
         (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TLToneManager nameForToneIdentifier:](self->_toneManager, "nameForToneIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_goToStore
{
  _BOOL4 v3;
  TLToneStoreDownloadController *toneStoreDownloadController;

  -[TKTonePickerController stopPlayingWithFadeOut:](self, "stopPlayingWithFadeOut:", 0);
  v3 = -[TKTonePickerController _behavesAsRingtonePicker](self, "_behavesAsRingtonePicker");
  toneStoreDownloadController = self->_toneStoreDownloadController;
  if (v3)
    -[TLToneStoreDownloadController openRingtoneStore](toneStoreDownloadController, "openRingtoneStore");
  else
    -[TLToneStoreDownloadController openAlertToneStore](toneStoreDownloadController, "openAlertToneStore");
}

- (void)_redownloadAllTones
{
  self->_toneStoreDownloadButtonState = 1;
  self->_shouldFreezeContentsOriginatingFromToneManager = 1;
  -[TKTonePickerController _didUpdateFooterTextForToneStoreGroup](self, "_didUpdateFooterTextForToneStoreGroup");
  -[TKTonePickerController _didUpdateToneStoreDownloadItem](self, "_didUpdateToneStoreDownloadItem");
  -[TLToneStoreDownloadController redownloadAllTones](self->_toneStoreDownloadController, "redownloadAllTones");
}

+ (id)_latestRedownloadAllTonesDate
{
  const __CFString *v2;
  const __CFString *v3;
  CFPropertyListRef v4;
  void *v5;
  CFTypeID v6;

  v2 = (const __CFString *)objc_msgSend(MEMORY[0x24BEB8CC0], "copySharedResourcesPreferencesDomain");
  if (v2)
  {
    v3 = v2;
    v4 = CFPreferencesCopyAppValue(CFSTR("tonePickerLatestRedownloadAllDate"), v2);
    v5 = (void *)v4;
    if (v4)
    {
      v6 = CFGetTypeID(v4);
      if (v6 != CFDateGetTypeID())
      {
        CFRelease(v5);
        v5 = 0;
      }
    }
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)_updateLatestRedownloadAllTonesDate
{
  const __CFString *v2;
  const __CFString *v3;
  void *value;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  value = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (const __CFString *)objc_msgSend(MEMORY[0x24BEB8CC0], "copySharedResourcesPreferencesDomain");
  if (v2)
  {
    v3 = v2;
    CFPreferencesSetAppValue(CFSTR("tonePickerLatestRedownloadAllDate"), value, v2);
    CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    CFRelease(v3);
  }

}

- (void)_playToneWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  TLAlert *v15;
  TLAlert *v16;
  TLAlert *playingAlert;
  TLAlert *v18;
  TLAlert *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "length"))
    {
      TLLogGeneral();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Tones/TKTonePickerController.m");
        v8 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v8, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136381443;
          v25 = "-[TKTonePickerController _playToneWithIdentifier:]";
          v26 = 2113;
          v27 = v10;
          v28 = 2049;
          v29 = 2517;
          v30 = 2113;
          v31 = v11;
          _os_log_impl(&dword_2157C4000, v9, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.2();
      }

      TLLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TKTonePickerController _pickerRowItemAtIndex:inSectionForItem:].cold.1();

    }
  }
  -[TKTonePickerController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "tonePickerController:willBeginPlaybackOfToneWithIdentifier:", self, v5);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8CA8]), "initWithType:", self->_alertType);
  objc_msgSend(v14, "setTopic:", self->_topic);
  objc_msgSend(v14, "setToneIdentifier:", v5);
  objc_msgSend(v14, "setVibrationIdentifier:", self->_selectedVibrationIdentifier);
  objc_msgSend(v14, "setShouldRepeat:", 0);
  objc_msgSend(v14, "setForPreview:", 1);
  objc_msgSend(v14, "setTargetDevice:", self->_targetDevice);
  v15 = self->_playingAlert;
  objc_msgSend(MEMORY[0x24BEB8CA0], "alertWithConfiguration:", v14);
  v16 = (TLAlert *)objc_claimAutoreleasedReturnValue();
  playingAlert = self->_playingAlert;
  self->_playingAlert = v16;

  v18 = self->_playingAlert;
  if (v18)
  {
    objc_initWeak((id *)buf, v18);
    objc_initWeak(&location, self);
    v19 = self->_playingAlert;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __50__TKTonePickerController__playToneWithIdentifier___block_invoke;
    v20[3] = &unk_24D37FFF0;
    objc_copyWeak(&v21, (id *)buf);
    objc_copyWeak(&v22, &location);
    -[TLAlert playWithCompletionHandler:](v19, "playWithCompletionHandler:", v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[TLAlert stop](v15, "stop");
  }

}

void __50__TKTonePickerController__playToneWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __50__TKTonePickerController__playToneWithIdentifier___block_invoke_2;
  v9 = &unk_24D37FFC8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v5 = &v6;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v6, v7))
    v8((uint64_t)v5);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);

}

void __50__TKTonePickerController__playToneWithIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(v2, "_didFinishPlayingAlert:", WeakRetained);

}

- (void)_togglePlayForToneWithIdentifier:(id)a3
{
  if (self->_playingAlert)
    -[TKTonePickerController stopPlayingWithFadeOut:](self, "stopPlayingWithFadeOut:", 0);
  else
    -[TKTonePickerController _playToneWithIdentifier:](self, "_playToneWithIdentifier:", a3);
}

- (BOOL)stopPlayingWithFadeOut:(BOOL)a3
{
  double v4;
  TLAlert *playingAlert;
  BOOL v6;
  id v7;
  void *v8;
  char v9;

  if (a3)
    v4 = 0.5;
  else
    v4 = 0.0;
  playingAlert = self->_playingAlert;
  v6 = playingAlert != 0;
  if (playingAlert)
  {
    v7 = objc_alloc_init(MEMORY[0x24BEB8CB0]);
    objc_msgSend(v7, "setFadeOutDuration:", v4);
    -[TLAlert stopWithOptions:](self->_playingAlert, "stopWithOptions:", v7);

  }
  -[TKTonePickerController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "tonePickerControllerDidStopPlaying:withFadeOutDuration:", self, v4);
    if (playingAlert)
      v6 = 1;
    else
      v6 = v9;
  }

  return v6;
}

- (void)_didFinishPlayingAlert:(id)a3
{
  TLAlert *v4;
  TLAlert *v5;

  v4 = (TLAlert *)a3;
  if (self->_playingAlert == v4)
  {
    self->_playingAlert = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (void)finishedWithPicker
{
  -[TKTonePickerController stopPlayingWithFadeOut:](self, "stopPlayingWithFadeOut:", 1);
}

- (BOOL)_showsMedia
{
  void *v3;
  char v4;

  -[TKTonePickerController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "tonePickerControllerShouldShowMedia:", self);
  else
    v4 = 0;

  return v4;
}

- (void)setMediaAtTop:(BOOL)a3
{
  if (self->_mediaAtTop != a3)
  {
    self->_mediaAtTop = a3;
    -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
    -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
  }
}

- (unint64_t)_mediaItemsCount
{
  void *v3;
  unint64_t v4;

  -[TKTonePickerController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "numberOfMediaItemsInTonePickerController:", self);
  else
    v4 = 0;

  return v4;
}

- (id)_identifierOfMediaItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[TKTonePickerController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "tonePickerController:identifierOfMediaItemAtIndex:", self, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_indexOfMediaItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[TKTonePickerController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "tonePickerController:indexOfMediaItemWithIdentifier:", self, v4);
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (void)_didSelectMediaItemWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TKTonePickerController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tonePickerController:selectedMediaItemWithIdentifier:", self, v5);

}

- (void)_reloadMediaItems
{
  id v3;

  -[TKTonePickerController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "tonePickerControllerRequestsMediaItemsRefresh:", self);

}

- (void)setShowsVibrations:(BOOL)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEB8CB8], "sharedCapabilitiesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasVibratorCapability");

  }
  else
  {
    v5 = 0;
  }
  if (self->_showsVibrations != v5)
  {
    self->_showsVibrations = v5;
    -[TKTonePickerController _selectedToneIndexPath](self, "_selectedToneIndexPath");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "tk_section");
    if (v5)
      v7 = v6 + 1;
    else
      v7 = v6 - 1;
    objc_msgSend(MEMORY[0x24BDD15D8], "tk_indexPathForRow:inSection:", objc_msgSend(v9, "tk_row"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _setSelectedToneIndexPath:](self, "_setSelectedToneIndexPath:", v8);

    -[TKTonePickerController _invalidatePickerItemCaches](self, "_invalidatePickerItemCaches");
    -[TKTonePickerController _didReloadTones](self, "_didReloadTones");
    if (v5)
      -[TKTonePickerController _registerForUserGeneratedVibrationsDidChangeNotification](self, "_registerForUserGeneratedVibrationsDidChangeNotification");
    else
      -[TKTonePickerController _unregisterForUserGeneratedVibrationsDidChangeNotification](self, "_unregisterForUserGeneratedVibrationsDidChangeNotification");

  }
}

- (void)setSelectedVibrationIdentifier:(id)a3
{
  -[TKTonePickerController _setSelectedVibrationIdentifier:explicitlySet:](self, "_setSelectedVibrationIdentifier:explicitlySet:", a3, 1);
}

- (void)_setSelectedVibrationIdentifier:(id)a3 explicitlySet:(BOOL)a4
{
  -[TKTonePickerController _setSelectedVibrationIdentifier:forceUpdatingVibrationName:explicitlySet:](self, "_setSelectedVibrationIdentifier:forceUpdatingVibrationName:explicitlySet:", a3, 0, a4);
}

- (void)_setSelectedVibrationIdentifier:(id)a3 forceUpdatingVibrationName:(BOOL)a4 explicitlySet:(BOOL)a5
{
  _BOOL4 v6;
  NSString *v8;
  NSString *selectedVibrationIdentifier;
  BOOL v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;

  v6 = a4;
  v8 = (NSString *)a3;
  selectedVibrationIdentifier = self->_selectedVibrationIdentifier;
  v15 = v8;
  if (selectedVibrationIdentifier == v8
    || (v10 = -[NSString isEqualToString:](selectedVibrationIdentifier, "isEqualToString:", v8), v8 = v15, v10))
  {
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v11 = (NSString *)-[NSString copy](v15, "copy");
    v12 = self->_selectedVibrationIdentifier;
    self->_selectedVibrationIdentifier = v11;

    v8 = v15;
  }
  if (self->_showsVibrations)
  {
    -[TKTonePickerController _nameOfSelectedVibrationIdentifier](self, "_nameOfSelectedVibrationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _indexPathForVibrationGroup](self, "_indexPathForVibrationGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _didUpdateDetailText:ofPickerItemForRowAtIndexPath:](self, "_didUpdateDetailText:ofPickerItemForRowAtIndexPath:", v13, v14);

    v8 = v15;
  }
LABEL_8:
  self->_selectedVibrationIdentifierWasExplicitlySet = a5;

}

- (void)_resetSelectedVibrationIdentifierForcingUpdatingVibrationName:(BOOL)a3
{
  void *v4;
  int64_t alertType;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  alertType = self->_alertType;
  -[TKTonePickerController topic](self, "topic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_currentVibrationIdentifierForAlertType:topic:", alertType, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BEB8CA0], "_currentOverridePolicyForType:", self->_alertType) == 1)
  {
    v7 = (id)*MEMORY[0x24BEB8DD8];

    v8 = v7;
  }
  else
  {
    v8 = v9;
  }
  v10 = v8;
  -[TKTonePickerController _setSelectedVibrationIdentifier:forceUpdatingVibrationName:explicitlySet:](self, "_setSelectedVibrationIdentifier:forceUpdatingVibrationName:explicitlySet:", v8, 1, 0);

}

- (id)_sanitizedSelectedVibrationIdentifierAllowingNilForDefault:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t alertType;
  void *v11;
  void *v12;
  char v14;

  v3 = a3;
  v5 = self->_selectedVibrationIdentifier;
  v6 = v5;
  if (-[NSString length](v5, "length"))
  {
    -[TKTonePickerController selectedToneIdentifier](self, "selectedToneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "length"))
    {
      -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    v14 = 0;
    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    alertType = self->_alertType;
    -[TKTonePickerController topic](self, "topic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sanitizeVibrationIdentifier:forAlertType:topic:targetDevice:correspondingToneIdentifier:didFallbackToCurrentVibrationIdentifier:", v5, alertType, v11, -[TKTonePickerController targetDevice](self, "targetDevice"), v7, &v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_9;
    if (v14)
    {
      v12 = v6;
    }
    else
    {
      if ((unint64_t)(self->_alertType - 13) > 1)
        goto LABEL_9;
      objc_msgSend(v9, "defaultVibrationIdentifierForAlertType:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", v12))
      {
LABEL_8:

LABEL_9:
        goto LABEL_10;
      }

    }
    v6 = 0;
    goto LABEL_8;
  }
LABEL_10:

  return v6;
}

- (id)_nameOfSelectedVibrationIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[TKTonePickerController _sanitizedSelectedVibrationIdentifierAllowingNilForDefault:](self, "_sanitizedSelectedVibrationIdentifierAllowingNilForDefault:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nameOfVibrationWithIdentifier:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TLLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_registerForUserGeneratedVibrationsDidChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_TKTonePickerControllerHandleUserGeneratedVibrationsDidChangeNotification, (CFStringRef)*MEMORY[0x24BEB8DE0], 0, (CFNotificationSuspensionBehavior)1026);
}

- (void)_unregisterForUserGeneratedVibrationsDidChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB8DE0], 0);
}

- (void)_updateDetailTextOfVibrationItem
{
  void *v3;
  id v4;

  if (self->_showsVibrations)
  {
    -[TKTonePickerController _nameOfSelectedVibrationIdentifier](self, "_nameOfSelectedVibrationIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _indexPathForVibrationGroup](self, "_indexPathForVibrationGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController _didUpdateDetailText:ofPickerItemForRowAtIndexPath:](self, "_didUpdateDetailText:ofPickerItemForRowAtIndexPath:", v4, v3);

  }
}

- (id)_annotatedNameForToneIdentifier:(id)a3
{
  void *v4;
  void *v5;
  TLToneManager *toneManager;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[TLToneManager _aliasForToneIdentifier:](self->_toneManager, "_aliasForToneIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTonePickerController _nameForToneIdentifier:](self, "_nameForToneIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_showsDefault
    && (self->_alertType != 13 || !-[NSString isEqualToString:](self->_topic, "isEqualToString:", *MEMORY[0x24BEB8CF0])))
  {
    toneManager = self->_toneManager;
    -[TKTonePickerController defaultToneIdentifier](self, "defaultToneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLToneManager _aliasForToneIdentifier:](toneManager, "_aliasForToneIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      TLLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v5);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
    }
  }

  return v5;
}

- (void)_didReloadTones
{
  id v3;

  -[TKTonePickerController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "tonePickerControllerDidReloadTones:", self);

}

- (void)_didSelectToneWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TKTonePickerController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "tonePickerController:selectedToneWithIdentifier:", self, v5);

}

- (void)_didUpdateCheckedStatus:(BOOL)a3 ofPickerItemForRowAtIndexPath:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v6, "tk_section"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "tk_row");

  objc_msgSend(v11, "childItemAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "_setShowsCheckmark:", v4);
    -[TKTonePickerController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "tonePickerController:didUpdateCheckedStatus:ofTonePickerItem:", self, v4, v9);

  }
}

- (void)_didUpdateDetailText:(id)a3 ofPickerItemForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v6, "tk_section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "tk_row");

  objc_msgSend(v7, "childItemAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    objc_msgSend(v10, "_setDetailText:", v12);
    -[TKTonePickerController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "tonePickerController:didUpdateDetailText:ofTonePickerItem:", self, v12, v10);

  }
}

- (void)_didUpdateCheckedStatus:(BOOL)a3 ofToneClassicsPickerItem:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(v7, "_setShowsCheckmark:", v4);
  -[TKTonePickerController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "tonePickerController:didUpdateCheckedStatus:ofTonePickerItem:", self, v4, v7);

}

- (void)_resetSelectedClassicRingtoneIndex
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[TKTonePickerController _selectedClassicRingtoneIndex](self, "_selectedClassicRingtoneIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    -[TKTonePickerController _setSelectedClassicRingtoneIndex:](self, "_setSelectedClassicRingtoneIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", CFSTR("<classic_ringtone_identifier>"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v8, "tk_section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childItemAtIndex:", objc_msgSend(v8, "tk_row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "childItemAtIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _didUpdateCheckedStatus:ofToneClassicsPickerItem:](self, "_didUpdateCheckedStatus:ofToneClassicsPickerItem:", 0, v7);

    }
  }
}

- (void)_resetSelectedClassicAlertToneIndex
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[TKTonePickerController _selectedClassicAlertToneIndex](self, "_selectedClassicAlertToneIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    -[TKTonePickerController _setSelectedClassicAlertToneIndex:](self, "_setSelectedClassicAlertToneIndex:", 0x7FFFFFFFFFFFFFFFLL);
    -[TKTonePickerController _indexPathForToneWithIdentifier:](self, "_indexPathForToneWithIdentifier:", CFSTR("<classic_alert_tone_identifier>"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerController pickerItemForSection:](self, "pickerItemForSection:", objc_msgSend(v8, "tk_section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childItemAtIndex:", objc_msgSend(v8, "tk_row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "childItemAtIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerController _didUpdateCheckedStatus:ofToneClassicsPickerItem:](self, "_didUpdateCheckedStatus:ofToneClassicsPickerItem:", 0, v7);

    }
  }
}

- (void)_toneManagerContentsChanged:(id)a3
{
  _QWORD block[2];
  _BYTE *(*v4)(uint64_t);
  void *v5;
  TKTonePickerController *v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v4 = __54__TKTonePickerController__toneManagerContentsChanged___block_invoke;
  v5 = &unk_24D37FE38;
  v6 = self;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);
}

_BYTE *__54__TKTonePickerController__toneManagerContentsChanged___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[56])
  {
    objc_msgSend(result, "stopPlayingWithFadeOut:", 0);
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_reloadTonesForExternalChange:shouldSkipDelegateFullReload:", 1, 0);
  }
  return result;
}

- (void)_handleAlertOverridePolicyDidChangeNotification:(id)a3
{
  _QWORD block[2];
  _BYTE *(*v4)(uint64_t);
  void *v5;
  TKTonePickerController *v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v4 = __74__TKTonePickerController__handleAlertOverridePolicyDidChangeNotification___block_invoke;
  v5 = &unk_24D37FE38;
  v6 = self;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);
}

_BYTE *__74__TKTonePickerController__handleAlertOverridePolicyDidChangeNotification___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[26])
    return (_BYTE *)objc_msgSend(result, "_resetSelectedVibrationIdentifierForcingUpdatingVibrationName:", 0);
  return result;
}

- (TKTonePickerControllerDelegate)delegate
{
  return (TKTonePickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)defaultToneIdentifier
{
  return self->_defaultToneIdentifier;
}

- (BOOL)showsDefault
{
  return self->_showsDefault;
}

- (BOOL)showsNone
{
  return self->_showsNone;
}

- (BOOL)isNoneAtTop
{
  return self->_noneAtTop;
}

- (NSString)noneString
{
  return self->_noneString;
}

- (BOOL)showsNothingSelected
{
  return self->_showsNothingSelected;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (BOOL)showsToneStore
{
  return self->_showsToneStore;
}

- (BOOL)isMediaAtTop
{
  return self->_mediaAtTop;
}

- (BOOL)showsVibrations
{
  return self->_showsVibrations;
}

- (NSString)selectedVibrationIdentifier
{
  return self->_selectedVibrationIdentifier;
}

- (BOOL)showsIgnoreMute
{
  return self->_showsIgnoreMute;
}

- (BOOL)ignoreMute
{
  return self->_ignoreMute;
}

- (NSString)overrideFirstToneSectionTitle
{
  return self->_overrideFirstToneSectionTitle;
}

- (void)setOverrideFirstToneSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (TLToneStoreDownloadController)toneStoreDownloadController
{
  return self->_toneStoreDownloadController;
}

- (NSArray)_classicRingtoneIdentifiers
{
  return self->__classicRingtoneIdentifiers;
}

- (void)_setClassicRingtoneIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__classicRingtoneIdentifiers, a3);
}

- (NSArray)_classicAlertToneIdentifiers
{
  return self->__classicAlertToneIdentifiers;
}

- (void)_setClassicAlertToneIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__classicAlertToneIdentifiers, a3);
}

- (unint64_t)_selectedClassicRingtoneIndex
{
  return self->__selectedClassicRingtoneIndex;
}

- (void)_setSelectedClassicRingtoneIndex:(unint64_t)a3
{
  self->__selectedClassicRingtoneIndex = a3;
}

- (unint64_t)_selectedClassicAlertToneIndex
{
  return self->__selectedClassicAlertToneIndex;
}

- (void)_setSelectedClassicAlertToneIndex:(unint64_t)a3
{
  self->__selectedClassicAlertToneIndex = a3;
}

- (NSIndexPath)_selectedToneIndexPath
{
  return self->__selectedToneIndexPath;
}

- (void)_setSelectedToneIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->__selectedToneIndexPath, a3);
}

- (BOOL)_behavesAsRingtonePicker
{
  return self->__behavesAsRingtonePicker;
}

- (void)_setBehavesAsRingtonePicker:(BOOL)a3
{
  self->__behavesAsRingtonePicker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectedToneIndexPath, 0);
  objc_storeStrong((id *)&self->__classicAlertToneIdentifiers, 0);
  objc_storeStrong((id *)&self->__classicRingtoneIdentifiers, 0);
  objc_storeStrong((id *)&self->_toneStoreDownloadController, 0);
  objc_storeStrong((id *)&self->_overrideFirstToneSectionTitle, 0);
  objc_storeStrong((id *)&self->_selectedVibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_noneString, 0);
  objc_storeStrong((id *)&self->_defaultToneIdentifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playingAlert, 0);
  objc_storeStrong((id *)&self->_identifiersOfRemovableTones, 0);
  objc_storeStrong((id *)&self->_toneGroupBucketIdentifiers, 0);
  objc_storeStrong((id *)&self->_toneGroupNames, 0);
  objc_storeStrong((id *)&self->_toneGroupLists, 0);
  objc_storeStrong((id *)&self->_installedTones, 0);
  objc_storeStrong((id *)&self->_cachedPickerRowItems, 0);
  objc_storeStrong((id *)&self->_cachedPickerSectionItems, 0);
  objc_storeStrong((id *)&self->_finishedToneStoreDownloadsByIdentifier, 0);
  objc_storeStrong((id *)&self->_activeToneStoreDownloadsByIdentifier, 0);
  objc_storeStrong((id *)&self->_toneManager, 0);
}

- (void)_pickerRowItemAtIndex:inSectionForItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "We expect to have a default tone identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_pickerRowItemAtIndex:inSectionForItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "*** Assertion failure.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteTonePickerItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2157C4000, a2, OS_LOG_TYPE_ERROR, "Cannot delete %{public}@.", (uint8_t *)&v2, 0xCu);
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "Unexpected.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "Unexpected nil value for next picker row item.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "Unexpected number of items.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__TKTonePickerController_deleteTonePickerItem___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "Unexpected updated number of sections.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__TKTonePickerController_toneStoreDownloadsDidStart___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2157C4000, v0, v1, "This is the only scenario we know how to handle properly.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1(&dword_2157C4000, a3, (uint64_t)a3, "Unexpected.", a1);
}

void __54__TKTonePickerController_toneStoreDownloadsDidFinish___block_invoke_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1(&dword_2157C4000, a3, (uint64_t)a3, "*** Assertion failure.", a1);
}

@end
