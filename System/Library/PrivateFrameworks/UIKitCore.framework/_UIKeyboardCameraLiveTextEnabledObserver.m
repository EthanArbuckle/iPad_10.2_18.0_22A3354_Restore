@implementation _UIKeyboardCameraLiveTextEnabledObserver

+ (_UIKeyboardCameraLiveTextEnabledObserver)sharedInstance
{
  if (qword_1ECD79F48 != -1)
    dispatch_once(&qword_1ECD79F48, &__block_literal_global_590);
  return (_UIKeyboardCameraLiveTextEnabledObserver *)(id)qword_1ECD79F40;
}

- (_UIKeyboardCameraLiveTextEnabledObserver)init
{
  _UIKeyboardCameraLiveTextEnabledObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardCameraLiveTextEnabledObserver;
  v2 = -[_UIKeyboardCameraLiveTextEnabledObserver init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("AppleLiveTextEnabled"), 1, _liveTextEnabledObserverContext);

  }
  return v2;
}

- (BOOL)isLiveTextEnabled
{
  _UIKeyboardCameraLiveTextEnabledObserver *v2;
  char isLiveTextEnabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_isLiveTextEnabledIsValid)
  {
    isLiveTextEnabled = v2->_isLiveTextEnabled;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:inDomain:", CFSTR("AppleLiveTextEnabled"), *MEMORY[0x1E0CB2B58]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      isLiveTextEnabled = objc_msgSend(v5, "BOOLValue");
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(&unk_1E1A95048, "arrayByAddingObjectsFromArray:", &unk_1E1A95060);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = &unk_1E1A95048;
      }
      v7 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      isLiveTextEnabled = objc_msgSend(v10, "count") != 0;
    }

    v2->_isLiveTextEnabled = isLiveTextEnabled;
    v2->_isLiveTextEnabledIsValid = 1;
  }
  objc_sync_exit(v2);

  return isLiveTextEnabled;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("AppleLiveTextEnabled"), _liveTextEnabledObserverContext);

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardCameraLiveTextEnabledObserver;
  -[_UIKeyboardCameraLiveTextEnabledObserver dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _UIKeyboardCameraLiveTextEnabledObserver *obj;
  objc_super v7;

  if ((void *)_liveTextEnabledObserverContext == a6)
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_isLiveTextEnabledIsValid = 0;
    objc_sync_exit(obj);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIKeyboardCameraLiveTextEnabledObserver;
    -[_UIKeyboardCameraLiveTextEnabledObserver observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

@end
