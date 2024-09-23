@implementation _UIStatusBarVoiceControlItem

+ (id)pillCombinedDisplayIdentifier
{
  return (id)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("pillCombinedDisplayIdentifier"));
}

- (id)indicatorEntryKey
{
  return CFSTR("voiceControlEntry");
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "voiceControlEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  return -[_UIStatusBarVoiceControlItem _overriddenStyleAttributesForVoiceControlType:](self, "_overriddenStyleAttributesForVoiceControlType:", v6);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVoiceControlItem;
  -[_UIStatusBarIndicatorItem applyUpdate:toDisplayItem:](&v13, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataChanged"))
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voiceControlEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    -[_UIStatusBarVoiceControlItem imageOpacityForVoiceControlType:](self, "imageOpacityForVoiceControlType:", v11);
    objc_msgSend(v7, "setViewAlpha:");
  }

  return v8;
}

- (id)systemImageNameForUpdate:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceControlEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v4, "type") - 1) >= 2)
    v5 = CFSTR("mic.slash.fill");
  else
    v5 = CFSTR("mic.fill");

  return (id)v5;
}

- (id)imageForUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVoiceControlItem;
  -[_UIStatusBarIndicatorItem imageForUpdate:](&v13, sel_imageForUpdate_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v6 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v8 = _UIInternalPreference_EnableWorkaroundFor50826562;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_EnableWorkaroundFor50826562)
    {
      while (v6 >= v8)
      {
        _UIInternalPreferenceSync(v6, &_UIInternalPreference_EnableWorkaroundFor50826562, (uint64_t)CFSTR("EnableWorkaroundFor50826562"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v8 = _UIInternalPreference_EnableWorkaroundFor50826562;
        if (v6 == _UIInternalPreference_EnableWorkaroundFor50826562)
          goto LABEL_4;
      }
      if (byte_1EDDA7F8C)
      {
        objc_msgSend(v4, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "voiceControlEntry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "type");

        if (v11)
        {
          objc_msgSend(v5, "_contentInsets");
          objc_msgSend(v5, "_imageWithContentInsets:");
          v12 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v12;
        }
      }
    }
  }
LABEL_4:

  return v5;
}

- (double)imageOpacityForVoiceControlType:(int64_t)a3
{
  double result;

  result = 0.65;
  if ((unint64_t)(a3 - 1) < 2)
    return 1.0;
  return result;
}

- (id)_overriddenStyleAttributesForVoiceControlType:(int64_t)a3
{
  void *v3;
  void *v4;

  if ((unint64_t)(a3 - 1) > 1)
  {
    v3 = 0;
  }
  else
  {
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImageTintColor:", v4);

  }
  return v3;
}

@end
