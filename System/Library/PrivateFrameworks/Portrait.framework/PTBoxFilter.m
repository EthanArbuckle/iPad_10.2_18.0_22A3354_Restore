@implementation PTBoxFilter

- (PTBoxFilter)initWithMetalContext:(id)a3 options:(int)a4
{
  id v7;
  PTBoxFilter *v8;
  PTBoxFilter *v9;
  void *v10;
  uint64_t v11;
  MTLComputePipelineState *boxFilter1ChannelHorizontal;
  uint64_t v13;
  MTLComputePipelineState *boxFilter1ChannelVertical;
  PTBoxFilter *v15;
  NSObject *v16;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;
  int v33;

  v7 = a3;
  v33 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PTBoxFilter;
  v8 = -[PTBoxFilter init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalContext, a3);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setConstantValue:type:withName:", &v33, 29, CFSTR("kBoxFilterOutputMapping"));
    objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("boxFilter1ChannelHorizontal"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    boxFilter1ChannelHorizontal = v9->_boxFilter1ChannelHorizontal;
    v9->_boxFilter1ChannelHorizontal = (MTLComputePipelineState *)v11;

    if (v9->_boxFilter1ChannelHorizontal)
    {
      objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("boxFilter1ChannelVertical"), v10);
      v13 = objc_claimAutoreleasedReturnValue();
      boxFilter1ChannelVertical = v9->_boxFilter1ChannelVertical;
      v9->_boxFilter1ChannelVertical = (MTLComputePipelineState *)v13;

      if (v9->_boxFilter1ChannelVertical)
      {
        v15 = v9;
LABEL_11:

        goto LABEL_12;
      }
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PTBoxFilter initWithMetalContext:options:].cold.2(v16, v24, v25, v26, v27, v28, v29, v30);
    }
    else
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PTBoxFilter initWithMetalContext:options:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v15 = 0;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (int)boxFilter1Channel:(id)a3 inTex:(id)a4 intermediate:(id)a5 outTex:(id)a6 kernelWidth:(int)a7 outputRemapping:
{
  uint64_t v7;
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  _QWORD v20[3];
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  int v25;

  v8 = v7;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v25 = a7;
  v24 = v8;
  if ((a7 & 0x80000001) == 1)
  {
    objc_msgSend(a3, "computeCommandEncoder");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject setComputePipelineState:](v17, "setComputePipelineState:", self->_boxFilter1ChannelVertical);
    -[NSObject setTexture:atIndex:](v17, "setTexture:atIndex:", v14, 0);
    -[NSObject setTexture:atIndex:](v17, "setTexture:atIndex:", v15, 1);
    -[NSObject setBytes:length:atIndex:](v17, "setBytes:length:atIndex:", &v25, 4, 0);
    v23[0] = objc_msgSend(v15, "width");
    v23[1] = objc_msgSend(v15, "height");
    v23[2] = 1;
    v21 = xmmword_1C9323050;
    v22 = 1;
    -[NSObject dispatchThreads:threadsPerThreadgroup:](v17, "dispatchThreads:threadsPerThreadgroup:", v23, &v21);
    -[NSObject setComputePipelineState:](v17, "setComputePipelineState:", self->_boxFilter1ChannelHorizontal);
    -[NSObject setTexture:atIndex:](v17, "setTexture:atIndex:", v15, 0);
    -[NSObject setTexture:atIndex:](v17, "setTexture:atIndex:", v16, 1);
    -[NSObject setBytes:length:atIndex:](v17, "setBytes:length:atIndex:", &v25, 4, 0);
    -[NSObject setBytes:length:atIndex:](v17, "setBytes:length:atIndex:", &v24, 8, 1);
    v20[0] = objc_msgSend(v16, "width");
    v20[1] = objc_msgSend(v16, "height");
    v20[2] = 1;
    v21 = xmmword_1C9323050;
    v22 = 1;
    -[NSObject dispatchThreads:threadsPerThreadgroup:](v17, "dispatchThreads:threadsPerThreadgroup:", v20, &v21);
    -[NSObject endEncoding](v17, "endEncoding");
    v18 = 0;
  }
  else
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTBoxFilter boxFilter1Channel:inTex:intermediate:outTex:kernelWidth:outputRemapping:].cold.1(v17);
    v18 = -10;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxFilter1ChannelVertical, 0);
  objc_storeStrong((id *)&self->_boxFilter1ChannelHorizontal, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)initWithMetalContext:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)boxFilter1Channel:(os_log_t)log inTex:intermediate:outTex:kernelWidth:outputRemapping:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "kernelWidth must be uneven", v1, 2u);
}

@end
