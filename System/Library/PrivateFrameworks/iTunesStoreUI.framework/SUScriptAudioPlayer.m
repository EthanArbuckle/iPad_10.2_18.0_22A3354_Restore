@implementation SUScriptAudioPlayer

- (SUScriptAudioPlayer)initWithURL:(id)a3 keyURL:(id)a4 certificateURL:(id)a5
{
  SUScriptAudioPlayer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUScriptAudioPlayer;
  v8 = -[SUScriptObject init](&v10, sel_init);
  if (v8)
  {
    v8->_url = (NSURL *)a3;
    v8->_keyUrl = (NSURL *)a4;
    v8->_certificateUrl = (NSURL *)a5;
    WebThreadRunOnMainThread();
  }
  return v8;
}

uint64_t __57__SUScriptAudioPlayer_initWithURL_keyURL_certificateURL___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "startSessionWithURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v2, "setKeyURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(v2, "setCertificateURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = (id)objc_msgSend(v2, "playerStatus");
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__audioPlayerStateChangeNotification_, CFSTR("SUAudioPlayerStatusChangeNotification"), v2);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUAudioPlayerStatusChangeNotification"), 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAudioPlayer;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)play
{
  WebThreadRunOnMainThread();
}

uint64_t __27__SUScriptAudioPlayer_play__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "startSessionWithURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("SUAudioPlayerStatusChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__audioPlayerStateChangeNotification_, CFSTR("SUAudioPlayerStatusChangeNotification"), v2);
  return objc_msgSend(v2, "play");
}

- (void)pause
{
  WebThreadRunOnMainThread();
}

uint64_t __28__SUScriptAudioPlayer_pause__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "audioPlayerForURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)), "pause");
}

- (void)setValue:(id)a3 forNowPlayingKey:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __49__SUScriptAudioPlayer_setValue_forNowPlayingKey___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a1[4];
  if (objc_msgSend(a1[5], "isEqualToString:", *MEMORY[0x24BDDBB20]))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a1[4]);
    v3 = (void *)objc_msgSend(a1[6], "newImageWithURL:", v2);

    if (v3)
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7C0]), "initWithImage:", v3);
    else
      v4 = 0;

  }
  objc_msgSend((id)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "startSessionWithURL:", *((_QWORD *)a1[6] + 10)), "setValue:forNowPlayingKey:", v4, a1[5]);

}

- (void)stop
{
  WebThreadRunOnMainThread();
}

uint64_t __27__SUScriptAudioPlayer_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "endSessionForURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)), "stop");
}

- (id)_className
{
  return CFSTR("iTunesAudioPlayer");
}

- (NSString)certificateURL
{
  return -[NSURL absoluteString](self->_certificateUrl, "absoluteString");
}

- (double)currentTime
{
  SUPlayerStatus *playerStatus;
  double v4;
  double v5;

  -[SUScriptObject lock](self, "lock");
  playerStatus = self->_playerStatus;
  if (playerStatus)
  {
    -[SUPlayerStatus currentTime](playerStatus, "currentTime");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }
  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

- (double)duration
{
  SUPlayerStatus *playerStatus;
  double v4;
  double v5;

  -[SUScriptObject lock](self, "lock");
  playerStatus = self->_playerStatus;
  if (playerStatus)
  {
    -[SUPlayerStatus duration](playerStatus, "duration");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }
  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

- (NSString)keyURL
{
  return -[NSURL absoluteString](self->_keyUrl, "absoluteString");
}

- (int64_t)state
{
  int64_t v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUPlayerStatus playerState](self->_playerStatus, "playerState");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)URL
{
  return -[NSURL absoluteString](self->_url, "absoluteString");
}

- (NSString)nowPlayingKeyAlbumTitle
{
  return (NSString *)*MEMORY[0x24BDDBAF8];
}

- (NSString)nowPlayingKeyAlbumTrackCount
{
  return (NSString *)*MEMORY[0x24BDDBB00];
}

- (NSString)nowPlayingKeyAlbumTrackNumber
{
  return (NSString *)*MEMORY[0x24BDDBB08];
}

- (NSString)nowPlayingKeyArtist
{
  return (NSString *)*MEMORY[0x24BDDBB10];
}

- (NSString)nowPlayingKeyArtwork
{
  return (NSString *)*MEMORY[0x24BDDBB20];
}

- (NSString)nowPlayingKeyComposer
{
  return (NSString *)*MEMORY[0x24BDDBB38];
}

- (NSString)nowPlayingKeyDiscCount
{
  return (NSString *)*MEMORY[0x24BDDBB48];
}

- (NSString)nowPlayingKeyDiscNumber
{
  return (NSString *)*MEMORY[0x24BDDBB50];
}

- (NSString)nowPlayingKeyGenre
{
  return (NSString *)*MEMORY[0x24BDDBB78];
}

- (NSString)nowPlayingKeyPersistentID
{
  return (NSString *)*MEMORY[0x24BDDBC40];
}

- (NSString)nowPlayingKeyPlaybackDuration
{
  return (NSString *)*MEMORY[0x24BDDBC58];
}

- (NSString)nowPlayingKeyTitle
{
  return (NSString *)*MEMORY[0x24BDDBCD8];
}

- (int64_t)playerStateActive
{
  return 2;
}

- (int64_t)playerStateBuffering
{
  return 1;
}

- (int64_t)playerStateFailed
{
  return 4;
}

- (int64_t)playerStateFinished
{
  return 5;
}

- (int64_t)playerStatePaused
{
  return 3;
}

- (int64_t)playerStateUnplayed
{
  return 0;
}

- (void)_audioPlayerStateChangeNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "object");
  -[SUScriptObject lock](self, "lock");

  self->_playerStatus = (SUPlayerStatus *)(id)objc_msgSend(v4, "playerStatus");
  -[SUScriptObject unlock](self, "unlock");
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("statechange"));
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_60, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAudioPlayer;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_46, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAudioPlayer;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAudioPlayer;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_60, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_46 = (uint64_t)sel_play;
    *(_QWORD *)algn_255186E28 = CFSTR("play");
    qword_255186E30 = (uint64_t)sel_pause;
    unk_255186E38 = CFSTR("pause");
    qword_255186E40 = (uint64_t)sel_setValue_forNowPlayingKey_;
    unk_255186E48 = CFSTR("setNowPlayingValue");
    qword_255186E50 = (uint64_t)sel_stop;
    unk_255186E58 = CFSTR("stop");
    __KeyMapping_60 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("certificateURL"), CFSTR("currentTime"), CFSTR("currentTime"), CFSTR("duration"), CFSTR("duration"), CFSTR("keyURL"), CFSTR("keyURL"), CFSTR("state"), CFSTR("state"), CFSTR("URL"), CFSTR("URL"), CFSTR("NOW_PLAYING_KEY_ALBUM_TITLE"), CFSTR("nowPlayingKeyAlbumTitle"), CFSTR("NOW_PLAYING_KEY_ALBUM_TRACK_COUNT"), CFSTR("nowPlayingKeyAlbumTrackCount"), CFSTR("NOW_PLAYING_KEY_ALBUM_TRACK_NUMBER"), CFSTR("nowPlayingKeyAlbumTrackNumber"),
                        CFSTR("NOW_PLAYING_KEY_ARTIST"),
                        CFSTR("nowPlayingKeyArtist"),
                        CFSTR("NOW_PLAYING_KEY_ARTWORK"),
                        CFSTR("nowPlayingKeyArtwork"),
                        CFSTR("NOW_PLAYING_KEY_COMPOSER"),
                        CFSTR("nowPlayingKeyComposer"),
                        CFSTR("NOW_PLAYING_KEY_DISC_COUNT"),
                        CFSTR("nowPlayingKeyDiscCount"),
                        CFSTR("NOW_PLAYING_KEY_DISC_NUMBER"),
                        CFSTR("nowPlayingKeyDiscNumber"),
                        CFSTR("NOW_PLAYING_KEY_GENRE"),
                        CFSTR("nowPlayingKeyGenre"),
                        CFSTR("NOW_PLAYING_KEY_PERSISTENT_ID"),
                        CFSTR("nowPlayingKeyPersistentID"),
                        CFSTR("NOW_PLAYING_KEY_PLAYBACK_DURATION"),
                        CFSTR("nowPlayingKeyPlaybackDuration"),
                        CFSTR("NOW_PLAYING_KEY_TITLE"),
                        CFSTR("nowPlayingKeyTitle"),
                        CFSTR("PLAYER_STATE_ACTIVE"),
                        CFSTR("playerStateActive"),
                        CFSTR("PLAYER_STATE_BUFFERING"),
                        CFSTR("playerStateBuffering"),
                        CFSTR("PLAYER_STATE_FAILED"),
                        CFSTR("playerStateFailed"),
                        CFSTR("PLAYER_STATE_FINISHED"),
                        CFSTR("playerStateFinished"),
                        CFSTR("PLAYER_STATE_PAUSED"),
                        CFSTR("playerStatePaused"),
                        CFSTR("PLAYER_STATE_UNPLAYED"),
                        CFSTR("playerStateUnplayed"),
                        0);
  }
}

@end
