@implementation SXFullscreenVideoPlaybackManager

- (SXFullscreenVideoPlaybackManager)init
{
  SXFullscreenVideoPlaybackManager *v2;
  uint64_t v3;
  NSHashTable *candidates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXFullscreenVideoPlaybackManager;
  v2 = -[SXFullscreenVideoPlaybackManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v3 = objc_claimAutoreleasedReturnValue();
    candidates = v2->_candidates;
    v2->_candidates = (NSHashTable *)v3;

  }
  return v2;
}

- (uint64_t)addCandidate:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "addObject:", a2);
  return result;
}

- (uint64_t)removeCandidate:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "removeObject:", a2);
  return result;
}

- (uint64_t)enterFullscreenIfNeeded
{
  uint64_t v1;
  id v2;
  void *v3;
  _OWORD v4[4];
  _BYTE v5[128];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    memset(v4, 0, sizeof(v4));
    v2 = *(id *)(result + 16);
    if (objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", v4, v5, 16))
    {
      v3 = (void *)**((_QWORD **)&v4[0] + 1);
      if (objc_msgSend(**((id **)&v4[0] + 1), "canEnterFullscreen", *(_QWORD *)&v4[0]))
        objc_msgSend(v3, "enterFullscreen");
    }

    return objc_msgSend(*(id *)(v1 + 16), "removeAllObjects");
  }
  return result;
}

- (uint64_t)willLayoutAndTransitionToSize:(uint64_t)result
{
  if (result)
    *(_WORD *)(result + 8) = 257;
  return result;
}

- (uint64_t)didTransitionToSize:(uint64_t)result
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 8))
    {
      if (!*(_BYTE *)(result + 9))
        result = -[SXFullscreenVideoPlaybackManager enterFullscreenIfNeeded](result);
    }
    *(_BYTE *)(v1 + 8) = 0;
  }
  return result;
}

- (uint64_t)didLayoutForSize:(uint64_t)result
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 9))
    {
      if (!*(_BYTE *)(result + 8))
        result = -[SXFullscreenVideoPlaybackManager enterFullscreenIfNeeded](result);
    }
    *(_BYTE *)(v1 + 9) = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
