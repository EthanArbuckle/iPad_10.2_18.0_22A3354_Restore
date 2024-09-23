@implementation SearchUIMusicStatusCache

- (SearchUIMusicStatusCache)init
{
  SearchUIMusicStatusCache *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  SearchUIMusicStatusCache *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUIMusicStatusCache;
  v2 = -[TLKAsyncCache init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_updateNowPlayingItem, *MEMORY[0x1E0CC21D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_updatePlaybackState, *MEMORY[0x1E0CC21D8], 0);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__SearchUIMusicStatusCache_init__block_invoke;
    v6[3] = &unk_1EA1F62F0;
    v7 = v2;
    +[SearchUIMediaUtilities dispatchOnMusicQueueIfNecessary:](SearchUIMediaUtilities, "dispatchOnMusicQueueIfNecessary:", v6);

  }
  return v2;
}

void __32__SearchUIMusicStatusCache_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SearchUIMediaUtilities musicPlayer](SearchUIMediaUtilities, "musicPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginGeneratingPlaybackNotifications");

  +[SearchUIMediaUtilities musicPlayer](SearchUIMediaUtilities, "musicPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNowPlayingItem:", v4);

  +[SearchUIMediaUtilities musicPlayer](SearchUIMediaUtilities, "musicPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackState:", objc_msgSend(v5, "playbackState"));

}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SearchUIMusicStatusCache_computeObjectForKey_completionHandler___block_invoke;
  v6[3] = &unk_1EA1F72D8;
  v7 = v4;
  v5 = v4;
  +[SearchUIMusicUtilities canPlayAppleMusicWithCompletionHandler:](SearchUIMusicUtilities, "canPlayAppleMusicWithCompletionHandler:", v6);

}

void __66__SearchUIMusicStatusCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)updateNowPlayingItem
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__SearchUIMusicStatusCache_updateNowPlayingItem__block_invoke;
  v2[3] = &unk_1EA1F62F0;
  v2[4] = self;
  +[SearchUIMediaUtilities dispatchOnMusicQueueIfNecessary:](SearchUIMediaUtilities, "dispatchOnMusicQueueIfNecessary:", v2);
}

void __48__SearchUIMusicStatusCache_updateNowPlayingItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  +[SearchUIMediaUtilities musicPlayer](SearchUIMediaUtilities, "musicPlayer");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "nowPlayingItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "nowPlayingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = +[SearchUIMediaUtilities isMediaItem:equalToMediaItem:](SearchUIMediaUtilities, "isMediaItem:equalToMediaItem:", v5, v3);

  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNowPlayingItem:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SearchUIMusicNowPlayingItemDidChangeNotification"), 0);

  }
}

- (void)updatePlaybackState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__SearchUIMusicStatusCache_updatePlaybackState__block_invoke;
  v2[3] = &unk_1EA1F62F0;
  v2[4] = self;
  +[SearchUIMediaUtilities dispatchOnMusicQueueIfNecessary:](SearchUIMediaUtilities, "dispatchOnMusicQueueIfNecessary:", v2);
}

void __47__SearchUIMusicStatusCache_updatePlaybackState__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  +[SearchUIMediaUtilities musicPlayer](SearchUIMediaUtilities, "musicPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackState");

  if (v3 != objc_msgSend(*(id *)(a1 + 32), "playbackState"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlaybackState:", v3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SearchUIMusicPlaybackStateDidChangeNotification"), 0);

  }
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
  v5.super_class = (Class)SearchUIMusicStatusCache;
  -[SearchUIMusicStatusCache dealloc](&v5, sel_dealloc);
}

- (MPMediaItem)nowPlayingItem
{
  return (MPMediaItem *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNowPlayingItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingItem, 0);
}

@end
