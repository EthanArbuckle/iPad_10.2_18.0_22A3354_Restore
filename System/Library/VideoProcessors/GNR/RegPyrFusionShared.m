@implementation RegPyrFusionShared

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  void *v4;
  void *v5;
  RegPyrFusionShared *v6;
  id v7;

  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton;
  if (a3)
  {
    v6 = 0;
LABEL_5:
    getSharedInstanceOrRelease__singleton = (uint64_t)v6;

    goto LABEL_6;
  }
  if (!getSharedInstanceOrRelease__singleton)
  {
    v6 = objc_alloc_init(RegPyrFusionShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton;
    goto LABEL_5;
  }
LABEL_6:
  v7 = (id)getSharedInstanceOrRelease__singleton;
  objc_sync_exit(v4);

  return v7;
}

+ (id)sharedInstance
{
  return +[RegPyrFusionShared getSharedInstanceOrRelease:](RegPyrFusionShared, "getSharedInstanceOrRelease:", 0);
}

- (id)getShaders:(id)a3
{
  id v4;
  RegPyrFusionShaders **p_shaders;
  RegPyrFusionShaders *shaders;
  RegPyrFusionShaders *v7;

  v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v7 = -[RegPyrFusionShaders initWithMetal:]([RegPyrFusionShaders alloc], "initWithMetal:", v4);
    if (v7)
    {
      objc_storeStrong((id *)p_shaders, v7);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v7;
}

+ (void)releaseSharedInstance
{
  id v2;

  v2 = +[RegPyrFusionShared getSharedInstanceOrRelease:](RegPyrFusionShared, "getSharedInstanceOrRelease:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);
}

@end
