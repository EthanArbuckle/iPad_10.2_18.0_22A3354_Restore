@implementation _UIPencilPreferences

+ (uint64_t)prefersPencilOnlyDrawing
{
  _BYTE *v0;
  uint64_t v1;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v0 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = v0[24] & 1;
  else
    v1 = 0;

  return v1;
}

+ (uint64_t)preferredSqueezeAction
{
  _QWORD *v0;
  uint64_t v1;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v0 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = v0[2];
  else
    v1 = 0;

  return v1;
}

+ (uint64_t)preferredTapAction
{
  _QWORD *v0;
  uint64_t v1;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v0 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = v0[1];
  else
    v1 = 0;

  return v1;
}

+ (id)sharedPreferences
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___UIPencilPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ECD80138 != -1)
    dispatch_once(&qword_1ECD80138, block);
  return (id)_MergedGlobals_1203;
}

- (_UIPencilPreferences)init
{
  _UIPencilPreferences *v2;
  void *v3;
  char v4;
  char v5;
  char v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPencilPreferences;
  v2 = -[_UIPencilPreferences init](&v9, sel_init);
  if (v2)
  {
    v2->_cachedPreferredTapAction = _UIPencilPreferredActionForKey(CFSTR("UIPencilPreferredTapAction"));
    v2->_cachedPreferredSqueezeAction = _UIPencilPreferredActionForKey(CFSTR("UIPencilPreferredSqueezeAction"));
    _UIKitUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)&v2->_preferenceFlags = *(_BYTE *)&v2->_preferenceFlags & 0xFE | _UIPencilPrefersPencilOnlyDrawingForKey();
    if (_UIPencilPrefersHoverToolPreview())
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&v2->_preferenceFlags = *(_BYTE *)&v2->_preferenceFlags & 0xFD | v4;
    if (objc_msgSend(v3, "BOOLForKey:", CFSTR("PKHasEverShownEduUI")))
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)&v2->_preferenceFlags = *(_BYTE *)&v2->_preferenceFlags & 0xFB | v5;
    if (objc_msgSend(v3, "BOOLForKey:", CFSTR("UIPencilHasUsedPassivePencilKey")))
      v6 = 8;
    else
      v6 = 0;
    *(_BYTE *)&v2->_preferenceFlags = *(_BYTE *)&v2->_preferenceFlags & 0xF7 | v6;
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("UIPencilPreferredTapAction"), 0, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("UIPencilPreferredSqueezeAction"), 0, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("UIPencilOnlyDrawWithPencilKey"), 0, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("PKUIPencilHoverPreviewEnabledKey"), 0, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("PKHasEverShownEduUI"), 0, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, CFSTR("UIPencilHasUsedPassivePencilKey"), 0, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityOpaqueTouchGestureValueChangedCallback, (CFStringRef)*MEMORY[0x1E0DDDFD8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

+ (uint64_t)hasSeenPencilPairingUI
{
  unsigned __int8 *v0;
  uint64_t v1;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v0 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = (v0[24] >> 2) & 1;
  else
    v1 = 0;

  return v1;
}

+ (uint64_t)hasUsedPassivePencil
{
  unsigned __int8 *v0;
  uint64_t v1;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v0 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = (v0[24] >> 3) & 1;
  else
    v1 = 0;

  return v1;
}

+ (void)setHasUsedPassivePencil:(uint64_t)a1
{
  _BYTE *v3;
  void *v4;
  _BYTE *v5;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3 && ((((v3[24] & 8) == 0) ^ a2) & 1) == 0)
  {
    v5 = v3;
    _UIKitUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", a2, CFSTR("UIPencilHasUsedPassivePencilKey"));

    -[_UIPencilPreferences _hasUsedPassivePencilDidChange]((uint64_t)v5);
    v3 = v5;
  }

}

+ (void)setPrefersPencilOnlyDrawing:(uint64_t)a1
{
  _BYTE *v3;
  void *v4;
  id val;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3 && ((((v3[24] & 1) == 0) ^ a2) & 1) == 0)
  {
    val = v3;
    _UIKitUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", a2, CFSTR("UIPencilOnlyDrawWithPencilKey"));

    -[_UIPencilPreferences _prefersPencilOnlyDrawingDidChange](val);
    v3 = val;
  }

}

+ (uint64_t)prefersHoverToolPreview
{
  unsigned __int8 *v0;
  uint64_t v1;

  objc_opt_self();
  +[_UIPencilPreferences sharedPreferences]();
  v0 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = (v0[24] >> 1) & 1;
  else
    v1 = 0;

  return v1;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  _UIKitUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("UIPencilPreferredTapAction"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("UIPencilPreferredSqueezeAction"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("UIPencilOnlyDrawWithPencilKey"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("PKUIPencilHoverPreviewEnabledKey"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("PKHasEverShownEduUI"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("UIPencilHasUsedPassivePencilKey"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DDDFD8], 0);

  v5.receiver = self;
  v5.super_class = (Class)_UIPencilPreferences;
  -[_UIPencilPreferences dealloc](&v5, sel_dealloc);
}

- (void)_prefersPencilOnlyDrawingDidChange
{
  uint64_t v1;
  void (**v2)(_QWORD);
  _QWORD block[4];
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v1 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58___UIPencilPreferences__prefersPencilOnlyDrawingDidChange__block_invoke;
    aBlock[3] = &unk_1E16B3F40;
    objc_copyWeak(&v6, &location);
    v2 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (pthread_main_np() == 1)
    {
      v2[2](v2);
    }
    else
    {
      block[0] = v1;
      block[1] = 3221225472;
      block[2] = __58___UIPencilPreferences__prefersPencilOnlyDrawingDidChange__block_invoke_2;
      block[3] = &unk_1E16B1BF8;
      v4 = v2;
      dispatch_sync(MEMORY[0x1E0C80D38], block);

    }
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_hasUsedPassivePencilDidChange
{
  void *v2;
  char v3;
  id v4;

  if (a1)
  {
    _UIKitUserDefaults();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "BOOLForKey:", CFSTR("UIPencilHasUsedPassivePencilKey")))
      v3 = 8;
    else
      v3 = 0;
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a1 + 24) & 0xF7 | v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("_UIPencilHasUsedPassivePencilChangedNotification"), a1);

  }
}

- (void)_preferredTapActionDidChange
{
  uint64_t v1;
  void (**v2)(_QWORD);
  _QWORD block[4];
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v1 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52___UIPencilPreferences__preferredTapActionDidChange__block_invoke;
    aBlock[3] = &unk_1E16B3F40;
    objc_copyWeak(&v6, &location);
    v2 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (pthread_main_np() == 1)
    {
      v2[2](v2);
    }
    else
    {
      block[0] = v1;
      block[1] = 3221225472;
      block[2] = __52___UIPencilPreferences__preferredTapActionDidChange__block_invoke_2;
      block[3] = &unk_1E16B1BF8;
      v4 = v2;
      dispatch_sync(MEMORY[0x1E0C80D38], block);

    }
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_preferredSqueezeActionDidChange
{
  uint64_t v1;
  void (**v2)(_QWORD);
  _QWORD block[4];
  void (**v4)(_QWORD);
  _QWORD aBlock[4];
  id v6;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    v1 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56___UIPencilPreferences__preferredSqueezeActionDidChange__block_invoke;
    aBlock[3] = &unk_1E16B3F40;
    objc_copyWeak(&v6, &location);
    v2 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (pthread_main_np() == 1)
    {
      v2[2](v2);
    }
    else
    {
      block[0] = v1;
      block[1] = 3221225472;
      block[2] = __56___UIPencilPreferences__preferredSqueezeActionDidChange__block_invoke_2;
      block[3] = &unk_1E16B1BF8;
      v4 = v2;
      dispatch_sync(MEMORY[0x1E0C80D38], block);

    }
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  id location;
  __int128 aBlock;
  void (*v19)(uint64_t);
  void *v20;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = observeValueForKeyPath_ofObject_change_context____s_category;
  if (!observeValueForKeyPath_ofObject_change_context____s_category)
  {
    v8 = __UILogCategoryGetNode("PencilPreferences", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&observeValueForKeyPath_ofObject_change_context____s_category);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v14 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(aBlock) = 138412290;
      *(_QWORD *)((char *)&aBlock + 4) = a3;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "KVO callback received for key: %@", (uint8_t *)&aBlock, 0xCu);
    }
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("UIPencilPreferredTapAction"), a4, a5, a6))
  {
    -[_UIPencilPreferences _preferredTapActionDidChange](self);
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("UIPencilPreferredSqueezeAction")))
  {
    -[_UIPencilPreferences _preferredSqueezeActionDidChange](self);
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("UIPencilOnlyDrawWithPencilKey")))
  {
    -[_UIPencilPreferences _prefersPencilOnlyDrawingDidChange](self);
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("PKUIPencilHoverPreviewEnabledKey")))
  {
    if (self)
    {
      objc_initWeak(&location, self);
      v9 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 3221225472;
      v19 = __57___UIPencilPreferences__prefersHoverToolPreviewDidChange__block_invoke;
      v20 = &unk_1E16B3F40;
      objc_copyWeak(v21, &location);
      v10 = (void (**)(_QWORD))_Block_copy(&aBlock);
      if (pthread_main_np() == 1)
      {
        v10[2](v10);
      }
      else
      {
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __57___UIPencilPreferences__prefersHoverToolPreviewDidChange__block_invoke_2;
        v15[3] = &unk_1E16B1BF8;
        v16 = v10;
        dispatch_sync(MEMORY[0x1E0C80D38], v15);

      }
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
    }
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("PKHasEverShownEduUI")))
  {
    if (self)
    {
      _UIKitUserDefaults();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "BOOLForKey:", CFSTR("PKHasEverShownEduUI")))
        v12 = 4;
      else
        v12 = 0;
      *(_BYTE *)&self->_preferenceFlags = *(_BYTE *)&self->_preferenceFlags & 0xFB | v12;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("_UIPencilHasSeenPencilPairingUIChangedNotification"), self);

    }
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("UIPencilHasUsedPassivePencilKey")))
  {
    -[_UIPencilPreferences _hasUsedPassivePencilDidChange]((uint64_t)self);
  }
}

@end
