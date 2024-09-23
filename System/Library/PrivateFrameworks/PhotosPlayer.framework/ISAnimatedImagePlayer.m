@implementation ISAnimatedImagePlayer

- (ISAnimatedImagePlayer)initWithAnimatedImage:(id)a3
{
  id v5;
  ISAnimatedImagePlayer *v6;
  ISAnimatedImagePlayer *v7;
  uint64_t v8;
  NSHashTable *weakDestinations;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISAnimatedImagePlayer;
  v6 = -[ISAnimatedImagePlayer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    weakDestinations = v7->_weakDestinations;
    v7->_weakDestinations = (NSHashTable *)v8;

    v7->_allowFrameDrops = 1;
    -[ISAnimatedImagePlayer _seekToBeginning](v7, "_seekToBeginning");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_currentImage);
  self->_currentImage = 0;
  -[ISObservable unregisterChangeObserver:context:](self->_timer, "unregisterChangeObserver:context:", self, 0);
  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImagePlayer;
  -[ISAnimatedImagePlayer dealloc](&v3, sel_dealloc);
}

- (PFAnimatedImage)animatedImage
{
  return self->_image;
}

- (void)registerDestination:(id)a3
{
  NSHashTable *weakDestinations;
  id v5;

  weakDestinations = self->_weakDestinations;
  v5 = a3;
  -[NSHashTable addObject:](weakDestinations, "addObject:", v5);
  objc_msgSend(v5, "animatedImagePlayerFrameDidChange:", self);

  -[ISAnimatedImagePlayer updateAnimation](self, "updateAnimation");
}

- (void)unregisterDestination:(id)a3
{
  -[NSHashTable removeObject:](self->_weakDestinations, "removeObject:", a3);
  -[ISAnimatedImagePlayer updateAnimation](self, "updateAnimation");
}

- (void)_notifyDestinationsOfFrameChange
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_weakDestinations;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "animatedImagePlayerFrameDidChange:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_notifyDestinationsOfAnimationStart
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_weakDestinations;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "animatedImagePlayerDidBeginAnimating:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyDestinationsOfAnimationEnd
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_weakDestinations;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "animatedImagePlayerDidEndAnimating:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)_anyDestinationIsReady
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_weakDestinations;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "animatedImagePlayerIsReadyToDisplay:", self, (_QWORD)v10) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)_seekToBeginning
{
  PFAnimatedImage *image;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  image = self->_image;
  if (!image)
    goto LABEL_4;
  if (-[PFAnimatedImage frameCount](image, "frameCount"))
  {
    image = self->_image;
LABEL_4:
    -[PFAnimatedImage frameCache](image, "frameCache");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    self->_displayedFrameIndex = 0;
    -[ISAnimatedImagePlayer _setCurrentFrame:](self, "_setCurrentFrame:", objc_msgSend(v5, "frameAtIndex:", 0));
    -[ISAnimatedImagePlayer _resetAnimationState](self, "_resetAnimationState");

    return;
  }
  ISGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D2DCA000, v4, OS_LOG_TYPE_ERROR, "ISAnimatedImagePlayer: Attempted to seek an empty PFAnimatedImage to the beginning", buf, 2u);
  }

}

- (CGImage)currentImage
{
  return self->_currentImage;
}

- (void)_setCurrentFrame:(CGImage *)a3
{
  if (self->_currentImage != a3)
  {
    CGImageRetain(a3);
    CGImageRelease(self->_currentImage);
    self->_currentImage = a3;
    -[ISAnimatedImagePlayer _notifyDestinationsOfFrameChange](self, "_notifyDestinationsOfFrameChange");
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[ISAnimatedImagePlayer _resetAnimationState](self, "_resetAnimationState");
    -[ISAnimatedImagePlayer updateAnimation](self, "updateAnimation");
  }
}

- (void)setDisplayedFrameIndex:(unint64_t)a3
{
  id v4;

  if (self->_displayedFrameIndex != a3)
  {
    self->_displayedFrameIndex = a3;
    -[PFAnimatedImage frameCache](self->_image, "frameCache");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ISAnimatedImagePlayer _setCurrentFrame:](self, "_setCurrentFrame:", objc_msgSend(v4, "frameAtIndex:", self->_displayedFrameIndex));
    -[ISAnimatedImagePlayer _resetAnimationState](self, "_resetAnimationState");

  }
}

- (BOOL)_shouldAnimate
{
  PFAnimatedImage *image;
  unint64_t v4;
  BOOL v5;

  image = self->_image;
  if (image
    && ((v4 = -[PFAnimatedImage frameCount](image, "frameCount"), self->_playing) ? (v5 = v4 >= 2) : (v5 = 0),
        v5 && !self->_hasFinishedAnimating))
  {
    return -[ISAnimatedImagePlayer _anyDestinationIsReady](self, "_anyDestinationIsReady");
  }
  else
  {
    return 0;
  }
}

- (void)_resetAnimationState
{
  *(_WORD *)&self->_hasStartedAnimating = 0;
  self->_timeAccumulator = 0.0;
  self->_infiniteLoop = -[PFAnimatedImage loopCount](self->_image, "loopCount") == 0;
  self->_remainingLoopCount = -[PFAnimatedImage loopCount](self->_image, "loopCount");
}

- (void)updateAnimation
{
  _BOOL4 v3;
  ISAnimatedImageTimer *timer;
  ISAnimatedImageTimer *v5;
  ISAnimatedImageTimer *v6;
  ISAnimatedImageTimer *v7;

  v3 = -[ISAnimatedImagePlayer _shouldAnimate](self, "_shouldAnimate");
  timer = self->_timer;
  if (v3)
  {
    if (!timer)
    {
      +[ISAnimatedImageTimer sharedTimer](ISAnimatedImageTimer, "sharedTimer");
      v5 = (ISAnimatedImageTimer *)objc_claimAutoreleasedReturnValue();
      v6 = self->_timer;
      self->_timer = v5;

      -[ISObservable registerChangeObserver:context:](self->_timer, "registerChangeObserver:context:", self, 0);
      -[ISAnimatedImagePlayer _notifyDestinationsOfAnimationStart](self, "_notifyDestinationsOfAnimationStart");
    }
  }
  else if (timer)
  {
    -[ISObservable unregisterChangeObserver:context:](timer, "unregisterChangeObserver:context:", self, 0);
    v7 = self->_timer;
    self->_timer = 0;

    -[ISAnimatedImagePlayer _resetAnimationState](self, "_resetAnimationState");
    -[ISAnimatedImagePlayer _notifyDestinationsOfAnimationEnd](self, "_notifyDestinationsOfAnimationEnd");
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0)
  {
    objc_msgSend(a3, "timestamp");
    -[ISAnimatedImagePlayer animationTimerFired:](self, "animationTimerFired:");
  }
}

- (void)animationTimerFired:(double)a3
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double timeAccumulator;
  uint64_t v10;
  NSObject *v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[ISAnimatedImagePlayer _shouldAnimate](self, "_shouldAnimate"))
  {
    if (!self->_hasStartedAnimating)
    {
      self->_timeAccumulator = 0.0;
      self->_previousFrameTime = a3;
      self->_hasStartedAnimating = 1;
    }
    -[PFAnimatedImage frameDelayAtIndex:](self->_image, "frameDelayAtIndex:", self->_displayedFrameIndex);
    v6 = v5;
    -[PFAnimatedImage frameCache](self->_image, "frameCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "frameAtIndexIfReady:", self->_displayedFrameIndex);

    if (v8)
    {
      -[ISAnimatedImagePlayer _setCurrentFrame:](self, "_setCurrentFrame:", v8);
      timeAccumulator = self->_timeAccumulator + a3 - self->_previousFrameTime;
      self->_timeAccumulator = timeAccumulator;
      self->_previousFrameTime = a3;
      if (timeAccumulator >= fmax(v6 + 1.0, 5.0))
      {
        self->_timeAccumulator = 0.0;
        timeAccumulator = 0.0;
      }
      if (timeAccumulator >= v6)
      {
        v10 = MEMORY[0x1E0C809B0];
        v11 = MEMORY[0x1E0C80D38];
        do
        {
          v12 = timeAccumulator - v6;
          if (!self->_allowFrameDrops)
            v12 = 0.0;
          self->_timeAccumulator = v12;
          v13 = self->_displayedFrameIndex + 1;
          self->_displayedFrameIndex = v13;
          if (v13 >= -[PFAnimatedImage frameCount](self->_image, "frameCount"))
          {
            self->_displayedFrameIndex = 0;
            if (!self->_infiniteLoop)
            {
              v14 = self->_remainingLoopCount - 1;
              self->_remainingLoopCount = v14;
              if (!v14)
              {
                self->_hasFinishedAnimating = 1;
                ISGetLog();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D2DCA000, v15, OS_LOG_TYPE_INFO, "ISAnimatedImagePlayer: Reached end of loop. Stopping", buf, 2u);
                }

                block[0] = v10;
                block[1] = 3221225472;
                block[2] = __45__ISAnimatedImagePlayer_animationTimerFired___block_invoke;
                block[3] = &unk_1E9453F48;
                block[4] = self;
                dispatch_async(v11, block);
              }
            }
          }
          timeAccumulator = self->_timeAccumulator;
        }
        while (timeAccumulator >= v6);
      }
    }
    else
    {
      ISGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D2DCA000, v16, OS_LOG_TYPE_DEBUG, "ISAnimatedImagePlayer: Dropped a frame", buf, 2u);
      }

    }
  }
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (unint64_t)displayedFrameIndex
{
  return self->_displayedFrameIndex;
}

- (BOOL)allowFrameDrops
{
  return self->_allowFrameDrops;
}

- (void)setAllowFrameDrops:(BOOL)a3
{
  self->_allowFrameDrops = a3;
}

- (void)setCurrentImage:(CGImage *)a3
{
  self->_currentImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_weakDestinations, 0);
}

uint64_t __45__ISAnimatedImagePlayer_animationTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAnimation");
}

@end
