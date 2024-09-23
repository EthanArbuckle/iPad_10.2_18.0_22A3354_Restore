@implementation VUILibraryMediaItem

void __37__VUILibraryMediaItem_iOS_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUILibraryMediaItem_iOS");
  v1 = (void *)sLogObject_17;
  sLogObject_17 = (uint64_t)v0;

}

void __67__VUILibraryMediaItem_iOS__schedulePlaybackPositionInfoPersistence__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "playbackPositionInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackPositionInfo:", 0);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "ml3Track");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      +[VUIPlaybackPositionController sharedInstance](VUIPlaybackPositionController, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ml3Track");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "persistPlaybackPositionInfo:forTrack:", v5, v4);

    }
  }

}

@end
