@implementation PTScreenCaptureComposite

- (PTScreenCaptureComposite)initWithMetalContext:(id)a3
{
  id v5;
  PTScreenCaptureComposite *v6;
  PTScreenCaptureComposite *v7;
  uint64_t v8;
  MTLComputePipelineState *floatingAlphaCutout;
  PTScreenCaptureComposite *v10;
  NSObject *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PTScreenCaptureComposite;
  v6 = -[PTScreenCaptureComposite init](&v13, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  -[PTMetalContext computePipelineStateFor:withConstants:](v7->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("floatingAlphaCutout"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  floatingAlphaCutout = v7->_floatingAlphaCutout;
  v7->_floatingAlphaCutout = (MTLComputePipelineState *)v8;

  if (!v7->_floatingAlphaCutout)
  {
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PTScreenCaptureComposite initWithMetalContext:].cold.1(v11);

    goto LABEL_7;
  }
  v10 = v7;
LABEL_8:

  return v10;
}

- (int)floatingAlphaCutout:(id)a3 inPersonSegmentation:(id)a4 bilbyPersonMask:(id)a5 bilbyEffectMask:(id)a6 bilbyFloatingBackgroundRGBA:(id)a7 outVideoColorBufferRGBA:(id)a8
{
  PTMetalContext *metalContext;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];

  metalContext = self->_metalContext;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setComputePipelineState:", self->_floatingAlphaCutout);
  objc_msgSend(v22, "setTexture:atIndex:", v20, 0);

  objc_msgSend(v22, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 2);

  objc_msgSend(v22, "setTexture:atIndex:", v17, 3);
  objc_msgSend(v22, "setTexture:atIndex:", v16, 4);

  objc_msgSend(v22, "setTexture:atIndex:", v15, 5);
  v23 = objc_msgSend(v15, "width");
  v24 = objc_msgSend(v15, "height");

  v28[0] = v23;
  v28[1] = v24;
  v28[2] = 1;
  v26 = xmmword_1C9322A40;
  v27 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v28, &v26);
  objc_msgSend(v22, "endEncoding");

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAlphaCutout, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_floatingAlphaCutout";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

@end
