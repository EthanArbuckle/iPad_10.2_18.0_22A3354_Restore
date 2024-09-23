@implementation PTVFXSoftAlphaMask

- (PTVFXSoftAlphaMask)initWithMetalContext:(id)a3 colorSize:(id *)a4
{
  id v7;
  char *v8;
  unint64_t v9;
  unint64_t var0;
  unint64_t var1;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  PTBoxFilter *v27;
  void *v28;
  PTVFXSoftAlphaMask *v29;
  NSObject *v30;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v60;

  v7 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PTVFXSoftAlphaMask;
  v8 = -[PTVFXSoftAlphaMask init](&v60, sel_init);
  if (!v8)
    goto LABEL_26;
  v9 = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)a4->var0, (double)a4->var1);
  var0 = a4->var0;
  var1 = a4->var1;
  v12 = 288;
  if (v9 == 1)
    v12 = 320;
  v13 = 216;
  if (v9 == 1)
    v13 = 176;
  if (var0 <= var1)
    v14 = v13;
  else
    v14 = v12;
  if (var0 <= var1)
    v15 = v12;
  else
    v15 = v13;
  objc_storeStrong((id *)v8 + 1, a3);
  objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("disparityToAlphaMask"), 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = v16;

  if (!*((_QWORD *)v8 + 2))
  {
    _PTLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_25;
  }
  objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("remapAlphaMask"), 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v18;

  if (!*((_QWORD *)v8 + 3))
  {
    _PTLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:].cold.2(v30, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_25;
  }
  objc_msgSend(v7, "textureUtil");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createWithWidth:height:pixelFormat:", v14, v15, 10);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v21;

  if (!*((_QWORD *)v8 + 4))
  {
    _PTLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:].cold.3(v30, v45, v46, v47, v48, v49, v50, v51);
    goto LABEL_25;
  }
  objc_msgSend(v7, "textureUtil");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "createWithWidth:height:pixelFormat:", v14, v15, 10);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)*((_QWORD *)v8 + 6);
  *((_QWORD *)v8 + 6) = v24;

  if (!*((_QWORD *)v8 + 6))
  {
    _PTLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[PTVFXSoftAlphaMask initWithMetalContext:colorSize:].cold.4(v30, v52, v53, v54, v55, v56, v57, v58);
LABEL_25:

LABEL_26:
    v29 = 0;
    goto LABEL_27;
  }
  v26 = *(_OWORD *)&a4->var0;
  *((_QWORD *)v8 + 9) = a4->var2;
  *(_OWORD *)(v8 + 56) = v26;
  v27 = -[PTBoxFilter initWithMetalContext:options:]([PTBoxFilter alloc], "initWithMetalContext:options:", v7, 1);
  v28 = (void *)*((_QWORD *)v8 + 10);
  *((_QWORD *)v8 + 10) = v27;

  v29 = v8;
LABEL_27:

  return v29;
}

- (int)updateSoftAlphaMask:(id)a3 inDisparity:(id)a4 focusDisparityModifiers:(id)a5 effectRenderRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[3];
  int v21;

  v21 = 1065353216;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setComputePipelineState:", self->_disparityToAlphaMask);
  objc_msgSend(v14, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v14, "setTexture:atIndex:", self->_alphaMask, 1);
  objc_msgSend(v14, "setBuffer:offset:atIndex:", v11, 0, 0);

  objc_msgSend(v14, "setBytes:length:atIndex:", &v21, 4, 1);
  v15 = -[MTLTexture width](self->_alphaMask, "width");
  v16 = -[MTLTexture height](self->_alphaMask, "height");
  v20[0] = v15;
  v20[1] = v16;
  v20[2] = 1;
  v18 = xmmword_1C9322A40;
  v19 = 1;
  objc_msgSend(v14, "dispatchThreads:threadsPerThreadgroup:", v20, &v18);
  objc_msgSend(v14, "endEncoding");
  LODWORD(v15) = -[PTVFXSoftAlphaMask boxFilter:mask:](self, "boxFilter:mask:", v13, self->_alphaMask);
  LODWORD(self) = -[PTVFXSoftAlphaMask remapAlphaMask:effectRenderRequest:](self, "remapAlphaMask:effectRenderRequest:", v13, v10);

  return self | v15;
}

- (int)remapAlphaMask:(id)a3 effectRenderRequest:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];
  __int128 v16;

  if (self->_remappedAlphaMask)
  {
    v6 = a4;
    objc_msgSend(a3, "computeCommandEncoder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setComputePipelineState:", self->_remapAlphaMask);
    objc_msgSend(v7, "setTexture:atIndex:", self->_alphaMask, 0);
    objc_msgSend(v7, "setTexture:atIndex:", self->_remappedAlphaMask, 1);
    objc_msgSend(v6, "reactionsCombinedCropRect");
    v12 = v8;

    v16 = v12;
    objc_msgSend(v7, "setBytes:length:atIndex:", &v16, 16, 0);
    v9 = -[MTLTexture width](self->_remappedAlphaMask, "width");
    v10 = -[MTLTexture height](self->_remappedAlphaMask, "height");
    v15[0] = v9;
    v15[1] = v10;
    v15[2] = 1;
    v13 = xmmword_1C9322A40;
    v14 = 1;
    objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", v15, &v13);
    objc_msgSend(v7, "endEncoding");

  }
  return 0;
}

- (id)lazyInstantiateAlphaMaskForRenderRequest:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  MTLTexture *remappedAlphaMask;
  MTLTexture **p_alphaMask;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t width;
  double v29;
  unint64_t height;
  BOOL v31;
  float v32;
  unint64_t v33;
  float v34;
  unint64_t v35;
  float v36;
  void *v37;
  MTLTexture *v38;
  MTLTexture *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  MTLTexture *v48;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v4 = a3;
  objc_msgSend(v4, "inReactionVideoRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "outColorROI");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v52.origin.x = 0.0;
  v52.origin.y = 0.0;
  v52.size.width = 1.0;
  v52.size.height = 1.0;
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  if (!CGRectEqualToRect(v50, v52))
    goto LABEL_4;
  v53.origin.x = 0.0;
  v53.origin.y = 0.0;
  v53.size.width = 1.0;
  v53.size.height = 1.0;
  v51.origin.x = v14;
  v51.origin.y = v16;
  v51.size.width = v18;
  v51.size.height = v20;
  if (CGRectEqualToRect(v51, v53))
  {
    remappedAlphaMask = self->_remappedAlphaMask;
    self->_remappedAlphaMask = 0;

    p_alphaMask = &self->_alphaMask;
  }
  else
  {
LABEL_4:
    objc_msgSend(v4, "outColorROI");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v4, "inReactionColorSize");
    width = (unint64_t)v27;
    objc_msgSend(v4, "inReactionColorSize");
    height = (unint64_t)v29;
    if (width)
      v31 = height == 0;
    else
      v31 = 1;
    if (v31)
    {
      width = self->_colorSize.width;
      height = self->_colorSize.height;
    }
    v32 = v24 * (double)width;
    v33 = vcvtas_u32_f32(v32);
    v34 = v26 * (double)height;
    v35 = vcvtas_u32_f32(v34);
    if ((int)v35 * (int)v33 >= 62209)
    {
      v36 = (float)((int)v35 * (int)v33) / 62208.0;
      v33 = (unint64_t)(float)((float)v33 / v36);
      v35 = (unint64_t)(float)((float)v35 / v36);
    }
    p_alphaMask = &self->_remappedAlphaMask;
    if (-[MTLTexture width](self->_remappedAlphaMask, "width") != v33
      || -[MTLTexture height](*p_alphaMask, "height") != v35)
    {
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "createWithWidth:height:pixelFormat:", v33, v35, 10);
      v38 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v39 = self->_remappedAlphaMask;
      self->_remappedAlphaMask = v38;

      if (!self->_remappedAlphaMask)
      {
        _PTLogSystem();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[PTVFXSoftAlphaMask lazyInstantiateAlphaMaskForRenderRequest:].cold.1(v40, v41, v42, v43, v44, v45, v46, v47);

      }
    }
  }
  v48 = *p_alphaMask;

  return v48;
}

- (int)updateSoftAlphaMask:(id)a3 inSegmentation:(id)a4 effectRenderRequest:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  LODWORD(a4) = -[PTVFXSoftAlphaMask boxFilter:mask:](self, "boxFilter:mask:", v9, a4);
  LODWORD(self) = -[PTVFXSoftAlphaMask remapAlphaMask:effectRenderRequest:](self, "remapAlphaMask:effectRenderRequest:", v9, v8);

  return self | a4;
}

- (int)boxFilter:(id)a3 mask:(id)a4
{
  return -[PTBoxFilter boxFilter1Channel:inTex:intermediate:outTex:kernelWidth:outputRemapping:](self->_boxFilter, "boxFilter1Channel:inTex:intermediate:outTex:kernelWidth:outputRemapping:", a3, a4, self->_intermediateTextureBox, self->_alphaMask, 15, 2.0);
}

- (id)debugTextures
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_alphaMask, self->_intermediateTextureBox, self->_remappedAlphaMask, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxFilter, 0);
  objc_storeStrong((id *)&self->_intermediateTextureBox, 0);
  objc_storeStrong((id *)&self->_remappedAlphaMask, 0);
  objc_storeStrong((id *)&self->_alphaMask, 0);
  objc_storeStrong((id *)&self->_remapAlphaMask, 0);
  objc_storeStrong((id *)&self->_disparityToAlphaMask, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lazyInstantiateAlphaMaskForRenderRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
