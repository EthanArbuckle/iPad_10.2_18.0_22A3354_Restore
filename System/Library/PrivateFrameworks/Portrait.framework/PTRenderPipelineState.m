@implementation PTRenderPipelineState

- (PTRenderPipelineState)initWithPipelineDescriptor:(id)a3 metalContext:(id)a4 quality:(int)a5
{
  id v8;
  id v9;
  PTRenderPipelineState *v10;
  PTRenderPipelineState *v11;
  uint64_t v12;
  PTRenderPipelineDescriptor *pipelineDescritor;
  double v14;
  CGFloat v15;
  CGFloat v16;
  PTRenderPipelineState *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTRenderPipelineState;
  v10 = -[PTRenderPipelineState init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_metalContext, a4);
    v12 = objc_msgSend(v8, "copy");
    pipelineDescritor = v11->_pipelineDescritor;
    v11->_pipelineDescritor = (PTRenderPipelineDescriptor *)v12;

    v11->_quality = a5;
    v11->_renderingVersion = objc_msgSend(v8, "version");
    *(_QWORD *)&v11->noiseScaleFactor = 2143289344;
    objc_msgSend(v8, "colorInputSize");
    v15 = v14;
    objc_msgSend(v8, "colorInputSize");
    v11->_colorInputSize.width = v15;
    v11->_colorInputSize.height = v16;
    v17 = v11;
  }

  return v11;
}

- (BOOL)prepareForRendering:(BOOL)a3
{
  RenderingIntegration *renderIntegration;
  BOOL v4;
  objc_class *v6;
  CGFloat v7;
  CGFloat v8;
  int8x16_t *p_colorOutputSize;
  PTRenderPipelineDescriptor *pipelineDescritor;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double height;
  double width;
  int v23;
  double v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  PTTexture *v32;
  void *intermediateOutput;
  void *v34;
  PTTexture *v35;
  PTTexture *v36;
  PTUtil *v37;
  PTUtil *util;
  RenderingIntegration *v39;
  RenderingIntegration *v40;
  RenderingIntegration *v41;
  PTRenderEffectManager *renderEffects;
  PTMetalContext *metalContext;
  double v44;
  double v45;
  double v46;
  double v47;
  int64_t v48;
  _BOOL8 v49;
  void *v50;
  RenderingIntegration *v51;
  RenderingIntegration *v52;
  _OWORD v53[3];

  renderIntegration = self->_renderIntegration;
  if (renderIntegration)
    v4 = !a3;
  else
    v4 = 0;
  if (v4)
    return renderIntegration != 0;
  kdebug_trace();
  v6 = +[PTRenderPipelineState classForVersion:](PTRenderPipelineState, "classForVersion:", -[PTRenderPipelineState renderingVersion](self, "renderingVersion"));
  -[PTRenderPipelineDescriptor colorOutputSize](self->_pipelineDescritor, "colorOutputSize");
  self->_colorOutputSize.width = v7;
  self->_colorOutputSize.height = v8;
  p_colorOutputSize = (int8x16_t *)&self->_colorOutputSize;
  pipelineDescritor = self->_pipelineDescritor;
  if (pipelineDescritor)
    -[PTRenderPipelineDescriptor preferredTransform](pipelineDescritor, "preferredTransform");
  else
    memset(v53, 0, sizeof(v53));
  v11 = +[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", v53);
  self->_colorOutputRotationDegrees = v11;
  if (v11 == 270 || v11 == 90)
  {
    *p_colorOutputSize = vextq_s8(*p_colorOutputSize, *p_colorOutputSize, 8uLL);
    goto LABEL_15;
  }
  if (v11 != -1)
  {
LABEL_15:
    self->_colorOutputSizeCropped = (CGSize)*p_colorOutputSize;
    width = self->_colorOutputSizeCropped.width;
    height = self->_colorOutputSizeCropped.height;
    if ((int)height >= 0)
      v23 = (int)height & 1;
    else
      v23 = -((int)height & 1);
    v24 = height - (double)v23;
    if ((int)width >= 0)
      v25 = (int)width & 1;
    else
      v25 = -((int)width & 1);
    self->_colorOutputSizeCropped.width = width - (double)v25;
    self->_colorOutputSizeCropped.height = v24;
    if (v11)
    {
      v26 = -[PTRenderPipelineDescriptor useRGBA](self->_pipelineDescritor, "useRGBA");
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = (unint64_t)self->_colorOutputSize.width;
      v30 = (unint64_t)self->_colorOutputSize.height;
      if (v26)
      {
        objc_msgSend(v27, "createWithWidth:height:pixelFormat:", v29, v30, 115);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTTexture createRGBA:](PTTexture, "createRGBA:", v31);
        v32 = (PTTexture *)objc_claimAutoreleasedReturnValue();
        intermediateOutput = self->_intermediateOutput;
        self->_intermediateOutput = v32;
      }
      else
      {
        objc_msgSend(v27, "createWithWidth:height:pixelFormat:", v29, v30, 25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
        intermediateOutput = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(intermediateOutput, "createWithWidth:height:pixelFormat:", (unint64_t)(self->_colorOutputSize.width * 0.5), (unint64_t)(self->_colorOutputSize.height * 0.5), 65);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v31, v34);
        v35 = (PTTexture *)objc_claimAutoreleasedReturnValue();
        v36 = self->_intermediateOutput;
        self->_intermediateOutput = v35;

      }
      v37 = -[PTUtil initWithMetalContext:]([PTUtil alloc], "initWithMetalContext:", self->_metalContext);
      util = self->_util;
      self->_util = v37;

    }
    v39 = (RenderingIntegration *)[v6 alloc];
    v40 = self->_renderIntegration;
    self->_renderIntegration = v39;

    v41 = self->_renderIntegration;
    renderEffects = self->_renderEffects;
    metalContext = self->_metalContext;
    -[PTRenderPipelineDescriptor disparitySize](self->_pipelineDescritor, "disparitySize");
    v45 = v44;
    v47 = v46;
    v48 = -[PTRenderPipelineDescriptor debugRendering](self->_pipelineDescritor, "debugRendering");
    v49 = -[PTRenderPipelineDescriptor verbose](self->_pipelineDescritor, "verbose");
    -[PTRenderPipelineDescriptor options](self->_pipelineDescritor, "options");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[RenderingIntegration initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v41, "initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:", metalContext, renderEffects, v48, v49, v50, self->_quality, self->_colorOutputSizeCropped.width, self->_colorOutputSizeCropped.height, v45, v47);
    v52 = self->_renderIntegration;
    self->_renderIntegration = v51;

    kdebug_trace();
    renderIntegration = self->_renderIntegration;
    return renderIntegration != 0;
  }
  _PTLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[PTRenderPipelineState prepareForRendering:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  return 0;
}

- (unint64_t)renderingVersion
{
  return self->_renderingVersion;
}

- (void)setSourceColorBitDepth:(int)a3
{
  self->sourceColorBitDepth = a3;
}

- (void)setRenderingVersion:(unint64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->_renderIntegration)
  {
    if (self->_renderingVersion != a3)
    {
      _PTLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[PTRenderPipelineState setRenderingVersion:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    }
  }
  else
  {
    self->_renderingVersion = a3;
  }
}

+ (Class)classForVersion:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E82520B8;
  v9[0] = objc_opt_class();
  v8[1] = &unk_1E82520D0;
  v9[1] = objc_opt_class();
  v8[2] = &unk_1E82520E8;
  v9[2] = objc_opt_class();
  v8[3] = &unk_1E8252100;
  v9[3] = objc_opt_class();
  v8[4] = &unk_1E8252118;
  v9[4] = objc_opt_class();
  v8[5] = &unk_1E8252130;
  v9[5] = objc_opt_class();
  v8[6] = &unk_1E8252148;
  v9[6] = objc_opt_class();
  v8[7] = &unk_1E8252160;
  v9[7] = objc_opt_class();
  v8[8] = &unk_1E8252178;
  v9[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (void)adjustScissorRect:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int32x2_t v8;
  int64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  void *v12;
  void *v13;
  _OWORD v14[2];
  __int128 v15;
  int64x2_t v16;

  v4 = a3;
  v5 = v4;
  v15 = 0u;
  v16 = 0u;
  if (!v4)
  {
    v16 = 0uLL;
LABEL_10:
    v15 = 0uLL;
    objc_msgSend(v5, "destinationColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16.i64[0] = objc_msgSend(v12, "width");

    objc_msgSend(v5, "destinationColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16.i64[1] = objc_msgSend(v13, "height");

    goto LABEL_11;
  }
  objc_msgSend(v4, "scissorRect");
  if (*(_OWORD *)&v16 == 0 || !-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    goto LABEL_10;
  v6 = v15;
  if ((v15 & 1) != 0)
  {
    v6 = v15 - 1;
    *(_QWORD *)&v15 = v15 - 1;
    ++v16.i64[0];
  }
  v7 = DWORD2(v15);
  if ((BYTE8(v15) & 1) != 0)
  {
    v7 = DWORD2(v15) - 1;
    --*((_QWORD *)&v15 + 1);
    ++v16.i64[1];
  }
  v8 = vmovn_s64(v16);
  v9.i64[0] = v6;
  v9.i64[1] = v7;
  v10 = vsubq_f64((float64x2_t)self->_colorOutputSizeCropped, vcvtq_f64_s64(v9));
  v9.i64[0] = v8.i32[0] | 1;
  v9.i64[1] = v8.i32[1] | 1;
  v11 = vcvtq_f64_s64(v9);
  v16 = (int64x2_t)vcvtq_u64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v10, v11), (int8x16_t)v11, (int8x16_t)v10));
LABEL_11:
  v14[0] = v15;
  v14[1] = v16;
  objc_msgSend(v5, "setScissorRect:", v14);

}

- (int)encodeRenderTo:(id)a3 withRenderRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double height;
  double width;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  _BOOL4 v51;
  PTTexture *intermediateOutput;
  PTUtil *util;
  PTTexture *v54;
  PTTexture *v55;
  void *v56;
  void *v57;
  uint64_t colorOutputRotationDegrees;
  PTUtil *v59;
  void *v60;
  void *v61;
  PTUtil *v62;
  CGFloat v64;
  CGFloat v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  _OWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[32];
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PTRenderPipelineState prepareForRendering:](self, "prepareForRendering:", 0))
  {
    if (!objc_msgSend(v6, "status") || objc_msgSend(v6, "status") == 1)
    {
      if (!self->_intermediateOutput)
      {
        -[PTRenderPipelineState adjustScissorRect:](self, "adjustScissorRect:", v7);
        v9 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v7, "destinationColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "copyMetadataTo:", self->_intermediateOutput);

      objc_msgSend(v7, "destinationColor");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDestinationColor:", self->_intermediateOutput);
      if (v7)
      {
        width = self->_colorOutputSize.width;
        height = self->_colorOutputSize.height;
        objc_msgSend(v7, "scissorRect");
        if (!(_QWORD)v74
          && __PAIR128__(*((unint64_t *)&v74 + 1), 0) == (unint64_t)v75
          && !*((_QWORD *)&v75 + 1))
        {
          memset(buf, 0, sizeof(buf));
          goto LABEL_24;
        }
        objc_msgSend(v7, "scissorRect");
        if (v71[2] != 0 || v72 != (unint64_t)width || v73 != (unint64_t)height)
        {
          _PTLogSystem();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.6(v12, v13, v14, v15, v16, v17, v18, v19);

LABEL_16:
          v20 = -2;
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {
        v74 = 0u;
        v75 = 0u;
      }
      memset(buf, 0, sizeof(buf));
      if (!v7)
      {
        *(_OWORD *)&buf[16] = 0uLL;
LABEL_25:
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[16] = -[PTTexture width](self->_intermediateOutput, "width");
        *(_QWORD *)&buf[24] = -[PTTexture height](self->_intermediateOutput, "height");
        v71[0] = *(_OWORD *)buf;
        v71[1] = *(_OWORD *)&buf[16];
        objc_msgSend(v7, "setScissorRect:", v71);
LABEL_26:
        objc_msgSend(v7, "sourceColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "width");
        -[PTRenderPipelineDescriptor colorInputSize](self->_pipelineDescritor, "colorInputSize");
        if (v22 == (int)v23)
        {
          objc_msgSend(v7, "sourceColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "height");
          -[PTRenderPipelineDescriptor colorInputSize](self->_pipelineDescritor, "colorInputSize");
          v27 = (int)v26;

          if (v25 == v27)
            goto LABEL_35;
        }
        else
        {

        }
        _PTLogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.5((id *)&self->_pipelineDescritor, v7, v28);

        _PTLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.4(v29, v30, v31);

LABEL_35:
        objc_msgSend(v7, "destinationColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "width") == (int)self->_colorOutputSize.width)
        {
          objc_msgSend(v7, "destinationColor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "height");
          v35 = (int)self->_colorOutputSize.height;

          if (v34 == v35)
            goto LABEL_44;
        }
        else
        {

        }
        _PTLogSystem();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v64 = self->_colorOutputSize.width;
          v65 = self->_colorOutputSize.height;
          objc_msgSend(v7, "destinationColor");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "width");
          objc_msgSend(v7, "destinationColor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "height");
          *(_DWORD *)buf = 134218752;
          *(CGFloat *)&buf[4] = v64;
          *(_WORD *)&buf[12] = 2048;
          *(CGFloat *)&buf[14] = v65;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v67;
          v77 = 2048;
          v78 = v69;
          _os_log_error_impl(&dword_1C9281000, v36, OS_LOG_TYPE_ERROR, "Invalid output size. Expected %f %f. Was %lu %lu", buf, 0x2Au);

        }
        _PTLogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.3(v37, v38, v39);

LABEL_44:
        objc_msgSend(v7, "sourceColor");
        v40 = objc_claimAutoreleasedReturnValue();
        -[NSObject transferFunction](v40, "transferFunction");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "destinationColor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "transferFunction");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v41, "isEqual:", v43) & 1) != 0)
        {

        }
        else
        {
          objc_msgSend(v7, "sourceColor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "transferFunction");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {

          }
          else
          {
            objc_msgSend(v7, "destinationColor");
            v70 = v9;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "transferFunction");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v70;
            if (!v47)
              goto LABEL_54;
          }
          _PTLogSystem();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.2(v7, v48);

          _PTLogSystem();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.1(v40, v49, v50);
        }

LABEL_54:
        v20 = -[RenderingIntegration renderContinuousWithSource:renderRequest:](self->_renderIntegration, "renderContinuousWithSource:renderRequest:", v6, v7);
        if (self->_intermediateOutput)
        {
          v51 = -[PTRenderPipelineDescriptor useRGBA](self->_pipelineDescritor, "useRGBA");
          util = self->_util;
          intermediateOutput = self->_intermediateOutput;
          v9 = v9;
          v54 = intermediateOutput;
          v55 = v54;
          if (v51)
          {
            -[PTTexture texRGBA](v54, "texRGBA");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject texRGBA](v9, "texRGBA");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            colorOutputRotationDegrees = self->_colorOutputRotationDegrees;
            v59 = util;
          }
          else
          {
            -[PTTexture texLuma](v54, "texLuma");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject texLuma](v9, "texLuma");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTUtil rotateTexture:inTex:outTex:rotationDegrees:](util, "rotateTexture:inTex:outTex:rotationDegrees:", v6, v60, v61, self->_colorOutputRotationDegrees);

            v62 = self->_util;
            -[PTTexture texChroma](v55, "texChroma");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject texChroma](v9, "texChroma");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            colorOutputRotationDegrees = self->_colorOutputRotationDegrees;
            v59 = v62;
          }
          -[PTUtil rotateTexture:inTex:outTex:rotationDegrees:](v59, "rotateTexture:inTex:outTex:rotationDegrees:", v6, v56, v57, colorOutputRotationDegrees);

          objc_msgSend(v7, "setDestinationColor:", v9);
        }
        goto LABEL_59;
      }
LABEL_24:
      objc_msgSend(v7, "scissorRect");
      goto LABEL_25;
    }
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.7(v6, v9);
    goto LABEL_16;
  }
  v20 = -1;
LABEL_60:

  return v20;
}

- (float)cameraIntrinsicMatrix
{
  float v2;
  float v3;
  uint64_t v4;
  float v5;

  +[PTRaytracingUtils frameWidth](PTRaytracingUtils, "frameWidth");
  v3 = v2 / *(double *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 184);
  if (*(float *)&v4 < *((float *)&v4 + 1))
    LODWORD(v4) = HIDWORD(*(_QWORD *)(a1 + 184));
  v5 = *(float *)(a1 + 144) / 1000.0 * *(float *)&v4;
  __asm { FMOV            V2.4S, #1.0 }
  return v5 / v3;
}

- (BOOL)prepareForRendering
{
  return -[PTRenderPipelineState prepareForRendering:](self, "prepareForRendering:", 0);
}

- (int)quality
{
  return self->quality;
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (int)sourceColorBitDepth
{
  return self->sourceColorBitDepth;
}

- (float)noiseScaleFactor
{
  return self->noiseScaleFactor;
}

- (void)setNoiseScaleFactor:(float)a3
{
  self->noiseScaleFactor = a3;
}

- (int)hwModelID
{
  return self->hwModelID;
}

- (void)setHwModelID:(int)a3
{
  self->hwModelID = a3;
}

- (float)focalLenIn35mmFilm
{
  return self->focalLenIn35mmFilm;
}

- (void)setFocalLenIn35mmFilm:(float)a3
{
  self->focalLenIn35mmFilm = a3;
}

- (int)conversionGain
{
  return self->conversionGain;
}

- (void)setConversionGain:(int)a3
{
  self->conversionGain = a3;
}

- (int)readNoise_1x
{
  return self->readNoise_1x;
}

- (void)setReadNoise_1x:(int)a3
{
  self->readNoise_1x = a3;
}

- (int)readNoise_8x
{
  return self->readNoise_8x;
}

- (void)setReadNoise_8x:(int)a3
{
  self->readNoise_8x = a3;
}

- (int)rawSensorHeight
{
  return self->rawSensorHeight;
}

- (void)setRawSensorHeight:(int)a3
{
  self->rawSensorHeight = a3;
}

- (int)rawSensorWidth
{
  return self->rawSensorWidth;
}

- (void)setRawSensorWidth:(int)a3
{
  self->rawSensorWidth = a3;
}

- (CGRect)totalSensorCrop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->totalSensorCrop.origin.x;
  y = self->totalSensorCrop.origin.y;
  width = self->totalSensorCrop.size.width;
  height = self->totalSensorCrop.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTotalSensorCrop:(CGRect)a3
{
  self->totalSensorCrop = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 184);
}

- (void)setVisCropFactor:(PTRenderPipelineState *)self
{
  uint64_t v2;

  *(_QWORD *)self->visCropFactor = v2;
}

- (int)sensorID
{
  return self->sensorID;
}

- (void)setSensorID:(int)a3
{
  self->sensorID = a3;
}

- (float)networkBias
{
  return self->networkBias;
}

- (void)setNetworkBias:(float)a3
{
  self->networkBias = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->description, 0);
  objc_storeStrong((id *)&self->_intermediateOutput, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_renderEffects, 0);
  objc_storeStrong((id *)&self->_renderIntegration, 0);
  objc_storeStrong((id *)&self->_pipelineDescritor, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)setRenderingVersion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Changing renderingVersion after initialization not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)prepareForRendering:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Invalid preferredTransform. Only 90 degrees rotations supported.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "isValidTransferFunction";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, a3, "Assertion failed %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)encodeRenderTo:(void *)a1 withRenderRequest:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sourceColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "destinationColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transferFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Invalid transferfunction. Input %@ output %@", (uint8_t *)&v8, 0x16u);

}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "isValidOutputSize";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, a3, "Assertion failed %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "isValidInputSize";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a1, a3, "Assertion failed %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)encodeRenderTo:(NSObject *)a3 withRenderRequest:.cold.5(id *a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "colorInputSize");
  v7 = v6;
  objc_msgSend(*a1, "colorInputSize");
  v9 = v8;
  objc_msgSend(a2, "sourceColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "width");
  objc_msgSend(a2, "sourceColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 134218752;
  v14 = v7;
  v15 = 2048;
  v16 = v9;
  v17 = 2048;
  v18 = v11;
  v19 = 2048;
  v20 = objc_msgSend(v12, "height");
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "Invalid input size. Expected %f %f. Was %lu %lu", (uint8_t *)&v13, 0x2Au);

}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Scissor rect unsupported for rotation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)encodeRenderTo:(void *)a1 withRenderRequest:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "status");
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a2, v3, "Invalid commandbuffer state %lu", (uint8_t *)&v4);
}

@end
