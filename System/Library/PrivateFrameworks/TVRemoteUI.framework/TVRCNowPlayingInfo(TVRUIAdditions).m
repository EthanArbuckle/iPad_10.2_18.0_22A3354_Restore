@implementation TVRCNowPlayingInfo(TVRUIAdditions)

- (BOOL)tvrui_hasMetadata
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)tvrui_hasArtworkImage
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "imageData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)tvrui_artworkImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "imageData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)tvrui_hasActivePlayer
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(a1, "playerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "playerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB4138]);

  if (v2)
    return v4 ^ 1u;
  else
    return 0;
}

- (uint64_t)tvrui_isSimpleCaptionStateUpdate
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = objc_msgSend(a1, "tvrui_hasArtworkImage");
  v3 = objc_msgSend(a1, "tvrui_hasMetadata");
  objc_msgSend(a1, "captionsEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hasValidCaptionOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 0;
  else
    return (v2 | v3) ^ 1u;
}

- (uint64_t)tvrui_isSimplePlaybackRateUpdate
{
  int v2;
  int v3;
  void *v4;

  v2 = objc_msgSend(a1, "tvrui_hasArtworkImage");
  v3 = objc_msgSend(a1, "tvrui_hasMetadata");
  objc_msgSend(a1, "playbackRate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return (v2 | v3) ^ 1u;
  else
    return 0;
}

- (uint64_t)tvrui_isSimplePlaybackStateUpdate
{
  int v2;
  int v3;
  void *v4;

  v2 = objc_msgSend(a1, "tvrui_hasArtworkImage");
  v3 = objc_msgSend(a1, "tvrui_hasMetadata");
  objc_msgSend(a1, "playbackState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return (v2 | v3) ^ 1u;
  else
    return 0;
}

- (BOOL)tvrui_mediaIsStopped
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "playbackState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue") == 3;

  return v2;
}

- (BOOL)tvrui_mediaIsIsPlaying
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "playbackState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue") == 1;

  return v2;
}

- (uint64_t)tvrui_hasCanonicalID
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canonicalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(a1, "tvrui_hasUnknownCanonicalID") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (uint64_t)tvrui_hasUnknownCanonicalID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "canonicalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEB4148]);
  return v3;
}

- (id)tvrui_effectiveCanonicalID
{
  void *v2;
  void *v3;

  if ((objc_msgSend(a1, "tvrui_hasUnknownCanonicalID") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "canonicalID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
