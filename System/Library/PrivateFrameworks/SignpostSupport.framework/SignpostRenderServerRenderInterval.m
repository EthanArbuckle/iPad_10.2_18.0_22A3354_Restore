@implementation SignpostRenderServerRenderInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_imageQueueSampleEvents, 0);
  objc_storeStrong((id *)&self->_fallbackShaderDrawCount, 0);
  objc_storeStrong((id *)&self->_cachingLayersRerenderCount, 0);
  objc_storeStrong((id *)&self->_synchronousMetalShaderCompileCount, 0);
  objc_storeStrong((id *)&self->_renderSkipReason, 0);
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)setImageQueueSampleEvents:(id)a3
{
  objc_storeStrong((id *)&self->_imageQueueSampleEvents, a3);
}

- (NSMutableArray)imageQueueSampleEvents
{
  return self->_imageQueueSampleEvents;
}

- (BOOL)didSkipRender
{
  void *v2;
  BOOL v3;

  -[SignpostRenderServerRenderInterval renderSkipReason](self, "renderSkipReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)renderSkipReason
{
  return self->_renderSkipReason;
}

- (SignpostRenderServerRenderInterval)initWithRenderServerRenderInterval:(id)a3
{
  id v4;
  SignpostRenderServerRenderInterval *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *renderSkipReason;
  void *v17;
  uint64_t v18;
  NSNumber *synchronousMetalShaderCompileCount;
  void *v20;
  uint64_t v21;
  NSNumber *cachingLayersRerenderCount;
  void *v23;
  uint64_t v24;
  NSNumber *fallbackShaderDrawCount;
  SignpostRenderServerRenderInterval *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SignpostRenderServerRenderInterval;
  v5 = -[SignpostAnimationSubInterval initWithInterval:](&v43, sel_initWithInterval_, v4);
  if (v5)
  {
    objc_msgSend(v4, "beginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderServerPID = objc_msgSend(v6, "processID");

    objc_msgSend(v4, "beginEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_renderServerTID = objc_msgSend(v7, "threadID");

    v5->_frameSeed = objc_msgSend(v4, "signpostId");
    objc_msgSend(v4, "beginEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_numberArgumentWithName:", CFSTR("refresh_interval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v5->_displayRefreshIntervalMachContinuousTime = objc_msgSend(v9, "unsignedLongLongValue");

      objc_msgSend(v4, "beginEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_numberArgumentWithName:", CFSTR("display_id"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v5->_displayID = objc_msgSend(v11, "unsignedLongLongValue");

        objc_msgSend(v4, "endEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_numberArgumentWithName:", CFSTR("pass_count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v5->_hasOffScreenPassCount = 1;
          v5->_offScreenPassCount = objc_msgSend(v13, "unsignedIntegerValue");
        }
        objc_msgSend(v4, "endEvent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_stringArgumentWithName:", CFSTR("skipped_render_reason"));
        v15 = objc_claimAutoreleasedReturnValue();
        renderSkipReason = v5->_renderSkipReason;
        v5->_renderSkipReason = (NSString *)v15;

        objc_msgSend(v4, "endEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_numberArgumentWithName:", CFSTR("compile_count"));
        v18 = objc_claimAutoreleasedReturnValue();
        synchronousMetalShaderCompileCount = v5->_synchronousMetalShaderCompileCount;
        v5->_synchronousMetalShaderCompileCount = (NSNumber *)v18;

        objc_msgSend(v4, "endEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_numberArgumentWithName:", CFSTR("cache_misses"));
        v21 = objc_claimAutoreleasedReturnValue();
        cachingLayersRerenderCount = v5->_cachingLayersRerenderCount;
        v5->_cachingLayersRerenderCount = (NSNumber *)v21;

        objc_msgSend(v4, "endEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_numberArgumentWithName:", CFSTR("fallback_draws"));
        v24 = objc_claimAutoreleasedReturnValue();
        fallbackShaderDrawCount = v5->_fallbackShaderDrawCount;
        v5->_fallbackShaderDrawCount = (NSNumber *)v24;

        goto LABEL_7;
      }
      _signpost_debug_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[SignpostRenderServerRenderInterval initWithRenderServerRenderInterval:].cold.2(v27, v35, v36, v37, v38, v39, v40, v41);
    }
    else
    {
      _signpost_debug_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[SignpostRenderServerRenderInterval initWithRenderServerRenderInterval:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    v26 = 0;
    goto LABEL_13;
  }
LABEL_7:
  v26 = v5;
LABEL_13:

  return v26;
}

- (unint64_t)displayRefreshIntervalMachContinuousTime
{
  return self->_displayRefreshIntervalMachContinuousTime;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (BOOL)hasOffScreenPassCount
{
  return self->_hasOffScreenPassCount;
}

- (unsigned)offScreenPassCount
{
  return self->_offScreenPassCount;
}

- (int)renderServerPID
{
  return self->_renderServerPID;
}

- (unint64_t)renderServerTID
{
  return self->_renderServerTID;
}

- (NSNumber)synchronousMetalShaderCompileCount
{
  return self->_synchronousMetalShaderCompileCount;
}

- (NSNumber)cachingLayersRerenderCount
{
  return self->_cachingLayersRerenderCount;
}

- (NSNumber)fallbackShaderDrawCount
{
  return self->_fallbackShaderDrawCount;
}

- (NSMutableArray)clientDrawableIntervals
{
  return self->_clientDrawableIntervals;
}

- (void)setClientDrawableIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_clientDrawableIntervals, a3);
}

- (void)initWithRenderServerRenderInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find refresh_interval in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithRenderServerRenderInterval:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find display_id in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
