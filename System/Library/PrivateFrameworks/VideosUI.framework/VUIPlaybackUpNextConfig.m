@implementation VUIPlaybackUpNextConfig

- (void)setMinTimeIntervalFromEndToDisplay:(double)a3
{
  self->_minTimeIntervalFromEndToDisplay = a3;
}

- (void)setMinAutoPlayStopTime:(double)a3
{
  self->_minAutoPlayStopTime = a3;
}

- (void)setMaximumAutoPlayableItems:(unint64_t)a3
{
  self->_maximumAutoPlayableItems = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setDocumentUpdateOffsetInterval:(double)a3
{
  self->_documentUpdateOffsetInterval = a3;
}

- (void)setBootstrapInterval:(double)a3
{
  self->_bootstrapInterval = a3;
}

- (void)setAutoPlayTimerDuration:(double)a3
{
  self->_autoPlayTimerDuration = a3;
}

- (VUIPlaybackUpNextConfig)init
{
  VUIPlaybackUpNextConfig *v2;
  VUIPlaybackUpNextConfig *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)VUIPlaybackUpNextConfig;
  v2 = -[VUIPlaybackUpNextConfig init](&v26, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_documentUpdateOffsetInterval = 1.0;
    v2->_duration = 30.0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("maximumAutoPlayableItemsQAOverride"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v5;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIFeaturesConfiguration:: overriding max auto playable items from user defaults %@", buf, 0xCu);
      }

      v3->_maximumAutoPlayableItems = objc_msgSend(v5, "unsignedIntegerValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("maximumAutoPlayableItems"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v9 = objc_msgSend(v8, "unsignedIntegerValue");
      else
        v9 = 3;
      v3->_maximumAutoPlayableItems = v9;

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("autoPlayTimerDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v11, "doubleValue");
    else
      v12 = 15.0;
    v3->_autoPlayTimerDuration = v12;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("bootStrapInterval"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "doubleValue");
    else
      v15 = 30.0;
    v3->_bootstrapInterval = v15;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("minAutoPlayStopTimeQAOverride"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      v3->_minAutoPlayStopTime = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", CFSTR("minAutoPlayStopTime"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        objc_msgSend(v20, "doubleValue");
      else
        v21 = 0x40BC200000000000;
      *(_QWORD *)&v3->_minAutoPlayStopTime = v21;

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("minTimeIntervalFromEndToDisplay"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v23, "doubleValue");
    else
      v24 = 20.0;
    v3->_minTimeIntervalFromEndToDisplay = v24;

  }
  return v3;
}

- (double)bootstrapInterval
{
  return self->_bootstrapInterval;
}

- (double)documentUpdateOffsetInterval
{
  return self->_documentUpdateOffsetInterval;
}

- (unint64_t)maximumAutoPlayableItems
{
  return self->_maximumAutoPlayableItems;
}

- (double)minAutoPlayStopTime
{
  return self->_minAutoPlayStopTime;
}

- (double)duration
{
  return self->_duration;
}

- (double)autoPlayTimerDuration
{
  return self->_autoPlayTimerDuration;
}

- (double)minTimeIntervalFromEndToDisplay
{
  return self->_minTimeIntervalFromEndToDisplay;
}

@end
