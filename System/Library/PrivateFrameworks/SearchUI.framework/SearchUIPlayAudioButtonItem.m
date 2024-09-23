@implementation SearchUIPlayAudioButtonItem

+ (BOOL)isSingleItemMedia:(id)a3
{
  unsigned int v3;
  BOOL result;

  v3 = objc_msgSend(a3, "mediaType");
  result = 1;
  if (v3 > 0x14 || ((1 << v3) & 0x102CC2) == 0)
    return v3 == 100;
  return result;
}

- (SearchUIPlayAudioButtonItem)initWithSFButtonItem:(id)a3
{
  SearchUIPlayAudioButtonItem *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIPlayAudioButtonItem;
  v3 = -[SearchUIButtonItem initWithSFButtonItem:](&v6, sel_initWithSFButtonItem_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_playbackStateDidChange, CFSTR("SearchUIMusicPlaybackStateDidChangeNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_nowPlayingItemDidChange, CFSTR("SearchUIMusicNowPlayingItemDidChangeNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_nowPlayingItemDidChange, CFSTR("SearchUIMusicDidResetNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_playbackDidFinish, *MEMORY[0x1E0C8AC48], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_newPlayButtonPressedWithNotification_, CFSTR("SearchUIPlayButtonDidBeginPlayingNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_playbackDidFinish, CFSTR("SearchUITTSPlaybackDidFinishNotification"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CC2480], "systemMusicPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endGeneratingPlaybackNotifications");

  v5.receiver = self;
  v5.super_class = (Class)SearchUIPlayAudioButtonItem;
  -[SearchUIPlayAudioButtonItem dealloc](&v5, sel_dealloc);
}

- (unint64_t)status
{
  objc_super v4;

  if (!-[SearchUIPlayAudioButtonItem hasState](self, "hasState"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SearchUIPlayAudioButtonItem;
  return -[SearchUIButtonItem status](&v4, sel_status);
}

- (BOOL)hasState
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend((id)objc_opt_class(), "isSingleItemMedia:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "audioData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (id)untoggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("PLAY"));
}

- (id)toggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("PAUSE"));
}

- (id)offStateSymbolName
{
  return CFSTR("play");
}

- (id)onStateSymbolName
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = CFSTR("stop");
  else
    v4 = CFSTR("pause");
  v5 = v4;

  return v5;
}

- (id)commandForStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_opt_new();
  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaMetadata:", v7);

  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudioData:", v9);

  if (-[SearchUIPlayAudioButtonItem hasState](self, "hasState"))
    objc_msgSend(v5, "setShouldPause:", a3 == 1);
  return v5;
}

- (void)buttonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!-[SearchUIPlayAudioButtonItem status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("senderItem");
    v9[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SearchUIPlayButtonDidBeginPlayingNotification"), 0, v4);

  }
  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7.receiver = self;
  v7.super_class = (Class)SearchUIPlayAudioButtonItem;
  -[SearchUIToggleButtonItem buttonPressed](&v7, sel_buttonPressed);
  if (-[SearchUIPlayAudioButtonItem status](self, "status") == 1
    || !-[SearchUIPlayAudioButtonItem hasState](self, "hasState"))
  {
    +[SearchUIMediaUtilities setCurrentMedia:](SearchUIMediaUtilities, "setCurrentMedia:", v6);
    +[SearchUIMediaUtilities setIsPlaying:](SearchUIMediaUtilities, "setIsPlaying:", 1);
    -[SearchUIPlayAudioButtonItem setGotNowPlayingChangedNotificationAfterPlaying:](self, "setGotNowPlayingChangedNotificationAfterPlaying:", 0);
  }
  else if (+[SearchUIMediaUtilities isCurrentMedia:](SearchUIMediaUtilities, "isCurrentMedia:", v6))
  {
    +[SearchUIMediaUtilities setIsPlaying:](SearchUIMediaUtilities, "setIsPlaying:", 0);
  }
  -[SearchUIPlayAudioButtonItem setNeedsUpdate:](self, "setNeedsUpdate:", 1);
  _searchUIDebounceStateChanges = 1;

}

- (void)updatePlayState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__SearchUIPlayAudioButtonItem_updatePlayState__block_invoke;
  v2[3] = &unk_1EA1F62F0;
  v2[4] = self;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v2);
}

void __46__SearchUIPlayAudioButtonItem_updatePlayState__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "hasState"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sfButtonItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mediaMetadata");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    LODWORD(v2) = +[SearchUIMediaUtilities isNowPlayingMedia:](SearchUIMediaUtilities, "isNowPlayingMedia:", v5);
    v3 = objc_msgSend(*(id *)(a1 + 32), "status");
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", v2);
    if (v3 != objc_msgSend(*(id *)(a1 + 32), "status"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stateDidChangeForButtonItem:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)playbackDidFinish
{
  if (!-[SearchUIPlayAudioButtonItem shouldSkipUpdate](self, "shouldSkipUpdate"))
  {
    +[SearchUIMediaUtilities setCurrentMedia:](SearchUIMediaUtilities, "setCurrentMedia:", 0);
    -[SearchUIPlayAudioButtonItem toggleOff](self, "toggleOff");
  }
}

- (void)playbackStateDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (!-[SearchUIPlayAudioButtonItem shouldSkipUpdate](self, "shouldSkipUpdate"))
  {
    +[SearchUIMediaUtilities musicStatusCache](SearchUIMediaUtilities, "musicStatusCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "playbackState");

    if ((unint64_t)(v4 - 2) >= 4)
    {
      if (v4 != 1)
      {
        if (!v4)
        {
          -[SearchUIPlayAudioButtonItem playbackDidFinish](self, "playbackDidFinish");
          return;
        }
        goto LABEL_9;
      }
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
    +[SearchUIMediaUtilities setIsPlaying:](SearchUIMediaUtilities, "setIsPlaying:", v5);
LABEL_9:
    -[SearchUIPlayAudioButtonItem updatePlayState](self, "updatePlayState");
  }
}

- (BOOL)shouldSkipUpdate
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;

  +[SearchUIMediaUtilities musicStatusCache](SearchUIMediaUtilities, "musicStatusCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playbackState");

  if (v4 == 1)
    goto LABEL_4;
  if (v4 == 2)
  {
    v4 = 0;
LABEL_4:
    v5 = -[SearchUIPlayAudioButtonItem status](self, "status") == v4;
    goto LABEL_6;
  }
  v5 = 0;
LABEL_6:
  v6 = -[SearchUIPlayAudioButtonItem needsUpdate](self, "needsUpdate");
  v7 = (!v6 || !v5) & _searchUIDebounceStateChanges;
  if (!v7)
  {
    -[SearchUIPlayAudioButtonItem setNeedsUpdate:](self, "setNeedsUpdate:", 0);
    _searchUIDebounceStateChanges = 0;
  }
  return v7;
}

- (void)nowPlayingItemDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SearchUIPlayAudioButtonItem_nowPlayingItemDidChange__block_invoke;
  v2[3] = &unk_1EA1F62F0;
  v2[4] = self;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v2);
}

uint64_t __54__SearchUIPlayAudioButtonItem_nowPlayingItemDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "sfButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SearchUIMediaUtilities isNowPlayingMedia:](SearchUIMediaUtilities, "isNowPlayingMedia:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "gotNowPlayingChangedNotificationAfterPlaying");

    if ((v4 & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "setGotNowPlayingChangedNotificationAfterPlaying:", 1);
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 32), "updatePlayState");
}

- (void)newPlayButtonPressedWithNotification:(id)a3
{
  void *v4;
  SearchUIPlayAudioButtonItem *v5;
  _QWORD v6[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("senderItem"));
  v5 = (SearchUIPlayAudioButtonItem *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__SearchUIPlayAudioButtonItem_newPlayButtonPressedWithNotification___block_invoke;
    v6[3] = &unk_1EA1F62F0;
    v6[4] = self;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v6);
  }
}

uint64_t __68__SearchUIPlayAudioButtonItem_newPlayButtonPressedWithNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleOff");
}

- (void)toggleOff
{
  id v3;

  -[SearchUIButtonItem setStatus:](self, "setStatus:", 0);
  -[SearchUIButtonItem delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateDidChangeForButtonItem:", self);

}

- (BOOL)allowsContextMenu
{
  return 0;
}

- (BOOL)gotNowPlayingChangedNotificationAfterPlaying
{
  return self->_gotNowPlayingChangedNotificationAfterPlaying;
}

- (void)setGotNowPlayingChangedNotificationAfterPlaying:(BOOL)a3
{
  self->_gotNowPlayingChangedNotificationAfterPlaying = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

@end
