@implementation PTRenderEffectContainer

- (PTRenderEffectContainer)initWithMetalContext:(id)a3 rgbaOutputPixelFormat:(unint64_t)a4 depthOutputPixelFormat:(unint64_t)a5 colorSize:(id *)a6
{
  id v10;
  PTRenderEffectContainer *v11;
  uint64_t v12;
  PTRenderEffectInput *renderEffectInput;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  PTRenderEffectOutput *v18;
  PTRenderEffectOutput *renderEffectOutput;
  PTRenderEffectContainer *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PTRenderEffectContainer;
  v11 = -[PTRenderEffectContainer init](&v37, sel_init);
  if (v11)
  {
    v12 = objc_opt_new();
    renderEffectInput = v11->_renderEffectInput;
    v11->_renderEffectInput = (PTRenderEffectInput *)v12;

    if (!v11->_renderEffectInput)
    {
      _PTLogSystem();
      a4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_ERROR))
        -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:].cold.1(a4, v21, v22, v23, v24, v25, v26, v27);
      goto LABEL_19;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, a6->var0, a6->var1, 0);
      a4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a4, "setTextureType:", 2);
      objc_msgSend((id)a4, "setUsage:", 7);
      objc_msgSend((id)a4, "setStorageMode:", 0);
      objc_msgSend(v10, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "newTextureWithDescriptor:", a4);

      if (!v15)
      {
        _PTLogSystem();
        a5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)a5, OS_LOG_TYPE_ERROR))
          -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:].cold.3((os_log_t)a5);
LABEL_18:

LABEL_19:
        v20 = 0;
        goto LABEL_20;
      }

      a4 = v15;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a5, a6->var0, a6->var1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextureType:", 2);
      objc_msgSend(v16, "setUsage:", 7);
      objc_msgSend(v16, "setStorageMode:", 0);
      objc_msgSend(v10, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      a5 = objc_msgSend(v17, "newTextureWithDescriptor:", v16);

    }
    v18 = -[PTRenderEffectOutput initWithEffectRGBA:effectDepth:]([PTRenderEffectOutput alloc], "initWithEffectRGBA:effectDepth:", a4, a5);
    renderEffectOutput = v11->_renderEffectOutput;
    v11->_renderEffectOutput = v18;

    if (v11->_renderEffectOutput)
    {
      v20 = v11;

LABEL_20:
      goto LABEL_21;
    }
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

    goto LABEL_18;
  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (PTRenderEffectContainer)initWithMetalContext:(id)a3 renderEffect:(id)a4 colorSize:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  PTRenderEffectContainer *v13;
  PTRenderEffectContainer *v14;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16;

  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v9, "rgbaOutputPixelFormat");
  v12 = objc_msgSend(v9, "depthOutputPixelFormat");
  v16 = *a5;
  v13 = -[PTRenderEffectContainer initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:](self, "initWithMetalContext:rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:", v10, v11, v12, &v16);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_renderEffect, a4);
    v14 = v13;
  }

  return v13;
}

- (PTRenderEffect)renderEffect
{
  return self->_renderEffect;
}

- (void)setRenderEffect:(id)a3
{
  objc_storeStrong((id *)&self->_renderEffect, a3);
}

- (PTRenderEffectInput)renderEffectInput
{
  return self->_renderEffectInput;
}

- (void)setRenderEffectInput:(id)a3
{
  objc_storeStrong((id *)&self->_renderEffectInput, a3);
}

- (PTRenderEffectOutput)renderEffectOutput
{
  return self->_renderEffectOutput;
}

- (void)setRenderEffectOutput:(id)a3
{
  objc_storeStrong((id *)&self->_renderEffectOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderEffectOutput, 0);
  objc_storeStrong((id *)&self->_renderEffectInput, 0);
  objc_storeStrong((id *)&self->_renderEffect, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 rgbaOutputPixelFormat:(uint64_t)a4 depthOutputPixelFormat:(uint64_t)a5 colorSize:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)initWithMetalContext:(uint64_t)a3 rgbaOutputPixelFormat:(uint64_t)a4 depthOutputPixelFormat:(uint64_t)a5 colorSize:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)initWithMetalContext:(os_log_t)log rgbaOutputPixelFormat:depthOutputPixelFormat:colorSize:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Cannot create texture", v1, 2u);
}

@end
