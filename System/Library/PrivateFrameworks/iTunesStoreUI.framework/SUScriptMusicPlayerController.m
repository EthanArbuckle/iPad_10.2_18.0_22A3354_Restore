@implementation SUScriptMusicPlayerController

- (SUScriptMusicPlayerController)initWithPlayerType:(id)a3
{
  SUScriptMusicPlayerController *v4;

  v4 = -[SUScriptObject init](self, "init");
  if (v4)
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("app")) & 1) != 0
      || objc_msgSend(a3, "isEqualToString:", CFSTR("iPod")))
    {
      v4->_playerType = (NSString *)a3;
      WebThreadRunOnMainThread();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Unknown player type"));

      return 0;
    }
  }
  return v4;
}

uint64_t __52__SUScriptMusicPlayerController_initWithPlayerType___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("app")))
  {
    result = objc_msgSend(MEMORY[0x24BDDCA60], "applicationMusicPlayer");
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("iPod"));
    if (!(_DWORD)result)
      return result;
    result = objc_msgSend(MEMORY[0x24BDDCA60], "systemMusicPlayer");
  }
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptMusicPlayerNativeObject, "objectWithNativeObject:", result));
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMusicPlayerController;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

+ (id)scriptPlaybackStateForNativePlaybackState:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return off_24DE7CCA8[a3];
}

- (void)beginSeekingBackward
{
  WebThreadRunOnMainThread();
}

uint64_t __53__SUScriptMusicPlayerController_beginSeekingBackward__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "beginSeekingBackward");
}

- (void)beginSeekingForward
{
  WebThreadRunOnMainThread();
}

uint64_t __52__SUScriptMusicPlayerController_beginSeekingForward__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "beginSeekingForward");
}

- (void)endSeeking
{
  WebThreadRunOnMainThread();
}

uint64_t __43__SUScriptMusicPlayerController_endSeeking__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "endSeeking");
}

- (void)pause
{
  WebThreadRunOnMainThread();
}

uint64_t __38__SUScriptMusicPlayerController_pause__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "pause");
}

- (void)play
{
  WebThreadRunOnMainThread();
}

uint64_t __37__SUScriptMusicPlayerController_play__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "play");
}

- (void)setQueueWithItemCollection:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __60__SUScriptMusicPlayerController_setQueueWithItemCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "setQueueWithItemCollection:", objc_msgSend(*(id *)(a1 + 40), "nativeCollection"));
}

- (void)setQueueWithQuery:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __51__SUScriptMusicPlayerController_setQueueWithQuery___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "setQueueWithQuery:", objc_msgSend(*(id *)(a1 + 40), "nativeQuery"));
}

- (void)skipToBeginning
{
  WebThreadRunOnMainThread();
}

uint64_t __48__SUScriptMusicPlayerController_skipToBeginning__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "skipToBeginning");
}

- (void)skipToNextItem
{
  WebThreadRunOnMainThread();
}

uint64_t __47__SUScriptMusicPlayerController_skipToNextItem__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "skipToNextItem");
}

- (void)skipToPreviousItem
{
  WebThreadRunOnMainThread();
}

uint64_t __51__SUScriptMusicPlayerController_skipToPreviousItem__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "skipToPreviousItem");
}

- (void)stop
{
  WebThreadRunOnMainThread();
}

uint64_t __37__SUScriptMusicPlayerController_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "stop");
}

- (id)_className
{
  return CFSTR("iTunesMusicPlayerController");
}

- (double)currentPlaybackTime
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __52__SUScriptMusicPlayerController_currentPlaybackTime__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "currentPlaybackTime");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (SUScriptMediaItem)nowPlayingItem
{
  void *v2;
  SUScriptMediaItem *v3;
  SUScriptMediaItem *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (SUScriptMediaItem *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __47__SUScriptMusicPlayerController_nowPlayingItem__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __47__SUScriptMusicPlayerController_nowPlayingItem__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "nowPlayingItem");
  if (result)
  {
    v3 = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_alloc_init(SUScriptMediaItem);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v3));
    return objc_msgSend(*(id *)(a1 + 32), "checkInScriptObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (NSString)playbackState
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __46__SUScriptMusicPlayerController_playbackState__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __46__SUScriptMusicPlayerController_playbackState__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if (result)
  {
    result = (id)objc_msgSend((id)objc_opt_class(), "scriptPlaybackStateForNativePlaybackState:", objc_msgSend(result, "playbackState"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)playerType
{
  NSString *playerType;

  playerType = self->_playerType;
  if (playerType)
    return playerType;
  else
    return (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (NSString)repeatMode
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __43__SUScriptMusicPlayerController_repeatMode__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__43__SUScriptMusicPlayerController_repeatMode__block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if (result)
  {
    result = (void *)objc_msgSend(result, "repeatMode");
    switch((unint64_t)result)
    {
      case 0uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "repeatModeDefault");
        goto LABEL_7;
      case 1uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "repeatModeNone");
        goto LABEL_7;
      case 2uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "repeatModeOne");
        goto LABEL_7;
      case 3uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "repeatModeAll");
LABEL_7:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (NSString)shuffleMode
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __44__SUScriptMusicPlayerController_shuffleMode__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__44__SUScriptMusicPlayerController_shuffleMode__block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if (result)
  {
    result = (void *)objc_msgSend(result, "shuffleMode");
    switch((unint64_t)result)
    {
      case 0uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "shuffleModeDefault");
        goto LABEL_7;
      case 1uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "shuffleModeOff");
        goto LABEL_7;
      case 2uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "shuffleModeSongs");
        goto LABEL_7;
      case 3uLL:
        result = (void *)objc_msgSend(*(id *)(a1 + 32), "shuffleModeAlbums");
LABEL_7:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (void)setRepeatMode:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeDefault](self, "repeatModeDefault")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeNone](self, "repeatModeNone")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeOne](self, "repeatModeOne")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeAll](self, "repeatModeAll")) & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __47__SUScriptMusicPlayerController_setRepeatMode___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "setRepeatMode:", *(_QWORD *)(a1 + 40));
}

- (void)setShuffleMode:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeDefault](self, "shuffleModeDefault"))|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeOff](self, "shuffleModeOff")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeSongs](self, "shuffleModeSongs")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeAlbums](self, "shuffleModeAlbums")) & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __48__SUScriptMusicPlayerController_setShuffleMode___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "setShuffleMode:", *(_QWORD *)(a1 + 40));
}

- (void)setVolume:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __43__SUScriptMusicPlayerController_setVolume___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  objc_msgSend(*(id *)(a1 + 40), "floatValue");
  return objc_msgSend(v2, "setVolumePrivate:");
}

- (NSNumber)volume
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

- (NSString)playbackStateInterrupted
{
  return (NSString *)CFSTR("interrupted");
}

- (NSString)playbackStatePaused
{
  return (NSString *)CFSTR("paused");
}

- (NSString)playbackStatePlaying
{
  return (NSString *)CFSTR("playing");
}

- (NSString)playbackStateSeekingBackward
{
  return (NSString *)CFSTR("seeking-backward");
}

- (NSString)playbackStateSeekingForward
{
  return (NSString *)CFSTR("seeking-forward");
}

- (NSString)playbackStateStopped
{
  return (NSString *)CFSTR("stopped");
}

- (NSString)repeatModeAll
{
  return (NSString *)CFSTR("all");
}

- (NSString)repeatModeDefault
{
  return (NSString *)CFSTR("default");
}

- (NSString)repeatModeNone
{
  return (NSString *)CFSTR("none");
}

- (NSString)repeatModeOne
{
  return (NSString *)CFSTR("one");
}

- (NSString)shuffleModeAlbums
{
  return (NSString *)CFSTR("albums");
}

- (NSString)shuffleModeDefault
{
  return (NSString *)CFSTR("default");
}

- (NSString)shuffleModeOff
{
  return (NSString *)CFSTR("off");
}

- (NSString)shuffleModeSongs
{
  return (NSString *)CFSTR("songs");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_40, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMusicPlayerController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_32, 11);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMusicPlayerController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMusicPlayerController;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_40, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_32 = (uint64_t)sel_beginSeekingBackward;
    unk_2551868F0 = CFSTR("beginSeekingBackward");
    qword_2551868F8 = (uint64_t)sel_beginSeekingForward;
    unk_255186900 = CFSTR("beginSeekingForward");
    qword_255186908 = (uint64_t)sel_endSeeking;
    unk_255186910 = CFSTR("endSeeking");
    qword_255186918 = (uint64_t)sel_pause;
    unk_255186920 = CFSTR("pause");
    qword_255186928 = (uint64_t)sel_play;
    unk_255186930 = CFSTR("play");
    qword_255186938 = (uint64_t)sel_setQueueWithItemCollection_;
    unk_255186940 = CFSTR("setQueueWithItemCollection");
    qword_255186948 = (uint64_t)sel_setQueueWithQuery_;
    unk_255186950 = CFSTR("setQueueWithQuery");
    qword_255186958 = (uint64_t)sel_skipToBeginning;
    unk_255186960 = CFSTR("skipToBeginning");
    qword_255186968 = (uint64_t)sel_skipToNextItem;
    unk_255186970 = CFSTR("skipToNextItem");
    qword_255186978 = (uint64_t)sel_skipToPreviousItem;
    unk_255186980 = CFSTR("skipToPreviousItem");
    qword_255186988 = (uint64_t)sel_stop;
    unk_255186990 = CFSTR("stop");
    __KeyMapping_40 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("currentPlaybackTime"), CFSTR("nowPlayingItem"), CFSTR("nowPlayingItem"), CFSTR("playbackState"), CFSTR("playbackState"), CFSTR("playerType"), CFSTR("playerType"), CFSTR("repeatMode"), CFSTR("repeatMode"), CFSTR("shuffleMode"), CFSTR("shuffleMode"), CFSTR("volume"), CFSTR("volume"), CFSTR("PLAYBACK_STATE_INTERRUPTED"), CFSTR("playbackStateInterrupted"), CFSTR("PLAYBACK_STATE_PAUSED"), CFSTR("playbackStatePaused"),
                        CFSTR("PLAYBACK_STATE_PLAYING"),
                        CFSTR("playbackStatePlaying"),
                        CFSTR("PLAYBACK_STATE_SEEKING_BACKWARD"),
                        CFSTR("playbackStateSeekingBackward"),
                        CFSTR("PLAYBACK_STATE_SEEKING_FORWARD"),
                        CFSTR("playbackStateSeekingForward"),
                        CFSTR("PLAYBACK_STATE_STOPPED"),
                        CFSTR("playbackStateStopped"),
                        CFSTR("REPEAT_MODE_ALL"),
                        CFSTR("repeatModeAll"),
                        CFSTR("REPEAT_MODE_DEFAULT"),
                        CFSTR("repeatModeDefault"),
                        CFSTR("REPEAT_MODE_NONE"),
                        CFSTR("repeatModeNone"),
                        CFSTR("REPEAT_MODE_ONE"),
                        CFSTR("repeatModeOne"),
                        CFSTR("SHUFFLE_MODE_ALBUMS"),
                        CFSTR("shuffleModeAlbums"),
                        CFSTR("SHUFFLE_MODE_DEFAULT"),
                        CFSTR("shuffleModeDefault"),
                        CFSTR("SHUFFLE_MODE_OFF"),
                        CFSTR("shuffleModeOff"),
                        CFSTR("SHUFFLE_MODE_SONGS"),
                        CFSTR("shuffleModeSongs"),
                        0);
  }
}

@end
