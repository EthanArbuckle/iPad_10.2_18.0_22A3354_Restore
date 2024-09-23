@implementation PTEffectManagerDebug

- (PTEffectManagerDebug)initWithMetalContext:(id)a3 colorSize:(id *)a4
{
  id v5;
  PTEffectManagerDebug *v6;
  PTEffectManagerDebug *v7;
  uint64_t v8;
  MTLComputePipelineState *effectDepthDebug;
  PTUtil *v10;
  PTUtil *util;
  PTEffectManagerDebug *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PTEffectManagerDebug;
  v6 = -[PTEffectManagerDebug init](&v29, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  *(_QWORD *)&v6->depthNearFar[4] = 0x3F8000003DCCCCCDLL;
  v6->rgbaOutputPixelFormat = 81;
  v6->depthOutputPixelFormat = 260;
  v6->effectType = 1;
  v6->reverseZ = 1;
  objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("effectDepthDebug"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  effectDepthDebug = v7->_effectDepthDebug;
  v7->_effectDepthDebug = (MTLComputePipelineState *)v8;

  if (!v7->_effectDepthDebug)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTEffectManagerDebug initWithMetalContext:colorSize:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_9;
  }
  v10 = -[PTUtil initWithMetalContext:]([PTUtil alloc], "initWithMetalContext:", v5);
  util = v7->_util;
  v7->_util = v10;

  if (!v7->_util)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTEffectManagerDebug initWithMetalContext:colorSize:].cold.2(v13, v21, v22, v23, v24, v25, v26, v27);
LABEL_9:

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v7->maxDepth = 3.0;
  v12 = v7;
LABEL_11:

  return v12;
}

- (void)render:(id)a3 renderRequest:(id)a4 input:(id)a5 output:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PTUtil *util;
  void *v17;
  _OWORD v18[3];
  __int128 v19;
  uint64_t v20;
  _QWORD v21[3];

  v8 = a6;
  v9 = a3;
  objc_msgSend(v9, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_effectDepthDebug);
  objc_msgSend(v8, "effectRGBA");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v11, 0);

  objc_msgSend(v8, "effectDepth");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:atIndex:", v12, 1);

  objc_msgSend(v10, "setBytes:length:atIndex:", &self->depthNearFar[4], 8, 0);
  objc_msgSend(v10, "setBytes:length:atIndex:", &self->reverseZ, 1, 1);
  objc_msgSend(v10, "setBytes:length:atIndex:", &self->maxDepth, 4, 2);
  objc_msgSend(v8, "effectRGBA");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "width");
  objc_msgSend(v8, "effectRGBA");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = objc_msgSend(v15, "height");
  v21[2] = 1;
  v19 = xmmword_1C9322A40;
  v20 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v21, &v19);

  objc_msgSend(v10, "endEncoding");
  util = self->_util;
  objc_msgSend(v8, "effectRGBA");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = vdupq_n_s64(0xAuLL);
  v18[1] = xmmword_1C9322EB0;
  v18[2] = xmmword_1C9322EC0;
  -[PTUtil drawTurboLegend:outRGBA:rect:maxValue:](util, "drawTurboLegend:outRGBA:rect:maxValue:", v9, v17, v18, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(3.0)));

}

- (double)depthNearFar
{
  return *(double *)(a1 + 40);
}

- (void)setDepthNearFar:(PTEffectManagerDebug *)self
{
  uint64_t v2;

  *(_QWORD *)&self->depthNearFar[4] = v2;
}

- (unint64_t)depthOutputPixelFormat
{
  return self->depthOutputPixelFormat;
}

- (unint64_t)effectPriority
{
  return self->effectPriority;
}

- (signed)effectType
{
  return self->effectType;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (BOOL)reverseZ
{
  return self->reverseZ;
}

- (void)setReverseZ:(BOOL)a3
{
  self->reverseZ = a3;
}

- (unint64_t)rgbaOutputPixelFormat
{
  return self->rgbaOutputPixelFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_effectDepthDebug, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

@end
