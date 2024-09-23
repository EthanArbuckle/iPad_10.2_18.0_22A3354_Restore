@implementation PTCinematographyFocusFramesOptions

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_defaultMinimumRackFocusPullTime
{
  if (_defaultMinimumRackFocusPullTime_onceToken != -1)
    dispatch_once(&_defaultMinimumRackFocusPullTime_onceToken, &__block_literal_global_2);
  *(_OWORD *)&retstr->var0 = _defaultMinimumRackFocusPullTime_sDefaultMinimumRackFocusPullTime;
  retstr->var3 = qword_1EF903630;
  return result;
}

void __70__PTCinematographyFocusFramesOptions__defaultMinimumRackFocusPullTime__block_invoke()
{
  NSObject *v0;
  void *v1;
  CMTime v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  CMTimeMake(&v2, 1, 3);
  *(CMTime *)_defaultMinimumRackFocusPullTime_sDefaultMinimumRackFocusPullTime = v2;
  _PTLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(CMTime *)_defaultMinimumRackFocusPullTime_sDefaultMinimumRackFocusPullTime;
    NSStringFromCMTime(&v2);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2.value) = 138412290;
    *(CMTimeValue *)((char *)&v2.value + 4) = (CMTimeValue)v1;
    _os_log_impl(&dword_1C9281000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyMinPullTime: %@", (uint8_t *)&v2, 0xCu);

  }
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_defaultMaximumRackFocusPullTime
{
  if (_defaultMaximumRackFocusPullTime_onceToken != -1)
    dispatch_once(&_defaultMaximumRackFocusPullTime_onceToken, &__block_literal_global_1);
  *(_OWORD *)&retstr->var0 = _defaultMaximumRackFocusPullTime_sDefaultMaximumRackFocusPullTime;
  retstr->var3 = qword_1EF903610;
  return result;
}

void __70__PTCinematographyFocusFramesOptions__defaultMaximumRackFocusPullTime__block_invoke()
{
  NSObject *v0;
  void *v1;
  CMTime v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  CMTimeMake(&v2, 1, 1);
  *(CMTime *)_defaultMaximumRackFocusPullTime_sDefaultMaximumRackFocusPullTime = v2;
  _PTLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(CMTime *)_defaultMaximumRackFocusPullTime_sDefaultMaximumRackFocusPullTime;
    NSStringFromCMTime(&v2);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2.value) = 138412290;
    *(CMTimeValue *)((char *)&v2.value + 4) = (CMTimeValue)v1;
    _os_log_impl(&dword_1C9281000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyMaxPullTime: %@", (uint8_t *)&v2, 0xCu);

  }
}

+ (float)_defaultMaximumDisparityPerSecond
{
  if (_defaultMaximumDisparityPerSecond_onceToken != -1)
    dispatch_once(&_defaultMaximumDisparityPerSecond_onceToken, &__block_literal_global_2);
  return *(float *)&_defaultMaximumDisparityPerSecond_sDefaultMaximumDisparityPerSecond;
}

void __71__PTCinematographyFocusFramesOptions__defaultMaximumDisparityPerSecond__block_invoke()
{
  NSObject *v0;
  double v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  _defaultMaximumDisparityPerSecond_sDefaultMaximumDisparityPerSecond = 1056964608;
  _PTLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v1) = 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1C9281000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyMaxDisparityPerSecond: %@", (uint8_t *)&v3, 0xCu);

  }
}

- (PTCinematographyFocusFramesOptions)init
{
  char *v2;
  void *v3;
  void *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyFocusFramesOptions;
  v2 = -[PTCinematographyFocusFramesOptions init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_class();
    if (v3)
    {
      objc_msgSend(v3, "_defaultMinimumRackFocusPullTime");
    }
    else
    {
      v7 = 0uLL;
      v8 = 0;
    }
    *(_QWORD *)(v2 + 28) = v8;
    *(_OWORD *)(v2 + 12) = v7;
    v4 = (void *)objc_opt_class();
    if (v4)
    {
      objc_msgSend(v4, "_defaultMaximumRackFocusPullTime");
    }
    else
    {
      v7 = 0uLL;
      v8 = 0;
    }
    *(_OWORD *)(v2 + 36) = v7;
    *(_QWORD *)(v2 + 52) = v8;
    objc_msgSend((id)objc_opt_class(), "_defaultMaximumDisparityPerSecond");
    *((_DWORD *)v2 + 2) = v5;
  }
  return (PTCinematographyFocusFramesOptions *)v2;
}

- (PTCinematographyFocusFramesOptions)initWithGlobalMetadata:(id)a3
{
  id v4;
  char *v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  __int128 v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PTCinematographyFocusFramesOptions;
  v5 = -[PTCinematographyFocusFramesOptions init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      if (objc_msgSend(v4, "majorVersion") == 1)
      {
        v6 = v4;
        objc_msgSend(v6, "minimumRackFocusPullTime");
        *(_QWORD *)(v5 + 28) = v12;
        *(_OWORD *)(v5 + 12) = v11;
        objc_msgSend(v6, "maximumRackFocusPullTime");
        *(_OWORD *)(v5 + 36) = v11;
        *(_QWORD *)(v5 + 52) = v12;
        objc_msgSend(v6, "maximumDisparityPerSecond");
        v8 = v7;

        *((_DWORD *)v5 + 2) = v8;
        v5 = v5;

        goto LABEL_9;
      }
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PTCinematographyFocusFramesOptions initWithGlobalMetadata:].cold.1(v4);

    }
    v5 = (char *)objc_msgSend(v5, "init");
  }
LABEL_9:

  return (PTCinematographyFocusFramesOptions *)v5;
}

- (BOOL)writeToGlobalMetadata:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  double v7;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "majorVersion");
  if (v5 == 1)
  {
    v11 = *(_OWORD *)(&self->_maximumDisparityPerSecond + 1);
    v12 = *(_QWORD *)&self->_minimumRackFocusPullTime.flags;
    v6 = v4;
    -[NSObject setMinimumRackFocusPullTime:](v6, "setMinimumRackFocusPullTime:", &v11);
    v9 = *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4);
    v10 = *(_QWORD *)&self->_maximumRackFocusPullTime.flags;
    -[NSObject setMaximumRackFocusPullTime:](v6, "setMaximumRackFocusPullTime:", &v9);
    *(float *)&v7 = self->_maximumDisparityPerSecond;
    -[NSObject setMaximumDisparityPerSecond:](v6, "setMaximumDisparityPerSecond:", v7);
  }
  else
  {
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PTCinematographyFocusFramesOptions initWithGlobalMetadata:].cold.1(v4);
  }

  return v5 == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[PTCinematographyFocusFramesOptions minimumRackFocusPullTime](self, "minimumRackFocusPullTime");
  v10 = v12;
  v11 = v13;
  objc_msgSend(v4, "setMinimumRackFocusPullTime:", &v10);
  -[PTCinematographyFocusFramesOptions maximumRackFocusPullTime](self, "maximumRackFocusPullTime");
  v6 = v8;
  v7 = v9;
  objc_msgSend(v4, "setMaximumRackFocusPullTime:", &v6);
  -[PTCinematographyFocusFramesOptions maximumDisparityPerSecond](self, "maximumDisparityPerSecond");
  objc_msgSend(v4, "setMaximumDisparityPerSecond:");
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (void)setMinimumRackFocusPullTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_minimumRackFocusPullTime.flags = a3->var3;
  *(_OWORD *)(&self->_maximumDisparityPerSecond + 1) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  retstr->var3 = *(int64_t *)((char *)&self[2].var0 + 4);
  return self;
}

- (void)setMaximumRackFocusPullTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_maximumRackFocusPullTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4) = v3;
}

- (float)maximumDisparityPerSecond
{
  return self->_maximumDisparityPerSecond;
}

- (void)setMaximumDisparityPerSecond:(float)a3
{
  self->_maximumDisparityPerSecond = a3;
}

- (void)initWithGlobalMetadata:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "majorVersion");
  OUTLINED_FUNCTION_0_5(&dword_1C9281000, v1, v2, "focus frames does not support global cinematography metadata version %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_2();
}

@end
