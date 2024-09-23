@implementation BilateralGridShared

+ (id)sharedInstance
{
  return +[BilateralGridShared getSharedInstanceOrRelease:](BilateralGridShared, "getSharedInstanceOrRelease:", 0);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  void *v4;
  void *v5;
  BilateralGridShared *v6;
  id v7;

  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_0;
  if (a3)
  {
    v6 = 0;
LABEL_5:
    getSharedInstanceOrRelease__singleton_0 = (uint64_t)v6;

    goto LABEL_6;
  }
  if (!getSharedInstanceOrRelease__singleton_0)
  {
    v6 = objc_alloc_init(BilateralGridShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_0;
    goto LABEL_5;
  }
LABEL_6:
  v7 = (id)getSharedInstanceOrRelease__singleton_0;
  objc_sync_exit(v4);

  return v7;
}

- (id)getShaders:(id)a3 normalizeGridConfidence:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BilateralGridShaders **p_shaders;
  BilateralGridShaders *shaders;
  BilateralGridShaders *v9;

  v4 = a4;
  v6 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v9 = shaders;
  if (!v9)
  {
    v9 = -[BilateralGridShaders initWithMetal:normalizeGridConfidence:]([BilateralGridShaders alloc], "initWithMetal:normalizeGridConfidence:", v6, v4);
    if (v9)
    {
      objc_storeStrong((id *)p_shaders, v9);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v9;
}

+ (void)releaseSharedInstance
{
  id v2;

  v2 = +[BilateralGridShared getSharedInstanceOrRelease:](BilateralGridShared, "getSharedInstanceOrRelease:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);
}

@end
