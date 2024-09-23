@implementation RegDenseShared

+ (id)sharedInstance
{
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  return (id)qword_253DAF300;
}

- (id)getShaders:(id)a3
{
  id v4;
  RegDenseShaders **p_shaders;
  RegDenseShaders *shaders;
  RegDenseShaders *v7;

  v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v7 = -[RegDenseShaders initWithMetal:]([RegDenseShaders alloc], "initWithMetal:", v4);
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

void __32__RegDenseShared_sharedInstance__block_invoke()
{
  RegDenseShared *v0;
  void *v1;

  v0 = objc_alloc_init(RegDenseShared);
  v1 = (void *)qword_253DAF300;
  qword_253DAF300 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);
}

@end
