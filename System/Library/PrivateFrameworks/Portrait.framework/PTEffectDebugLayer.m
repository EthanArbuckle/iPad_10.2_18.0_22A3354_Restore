@implementation PTEffectDebugLayer

- (void)setReactionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reactionProvider, a3);
}

- (PTEffectDebugLayer)initWithMetalContext:(id)a3 effectRelighting:(id)a4 renderState:(id)a5 util:(id)a6 colorConversion:(id)a7 msrColorPyramid:(id)a8 vfxRenderEffect:(id)a9 depthConverter:(id)a10 disparityFixedFocus:(id)a11 faceDisparityArray:(id)a12 focusDisparityRaw:(id)a13 focusDisparityModifiers:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PTEffectDebugLayer *v24;
  PTEffectDebugLayer *v25;
  PTEffectDebugLayer *v26;
  id v29;
  id v30;
  id v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v39 = a3;
  v29 = a4;
  v38 = a4;
  v30 = a5;
  v37 = a5;
  v36 = a6;
  v31 = a7;
  v35 = a7;
  v34 = a8;
  v19 = a9;
  v33 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v40.receiver = self;
  v40.super_class = (Class)PTEffectDebugLayer;
  v24 = -[PTEffectDebugLayer init](&v40, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_metalContext, a3);
    objc_storeStrong((id *)&v25->_effectRelighting, v29);
    objc_storeStrong((id *)&v25->_renderState, v30);
    objc_storeStrong((id *)&v25->_util, a6);
    objc_storeStrong((id *)&v25->_colorConversion, v31);
    objc_storeStrong((id *)&v25->_msrColorPyramid, a8);
    objc_storeStrong((id *)&v25->_disparityFixedFocus, a11);
    objc_storeStrong((id *)&v25->_faceDisparityArray, a12);
    objc_storeStrong((id *)&v25->_focusDisparityRaw, a13);
    objc_storeStrong((id *)&v25->_focusDisparityModifier, a14);
    objc_storeStrong((id *)&v25->_vfxRenderEffect, a9);
    objc_storeStrong((id *)&v25->_depthConverter, a10);
    *(_QWORD *)&v25->_width = 0x3800000063;
    v26 = v25;
  }

  return v25;
}

- (void)renderDebugInformation:(int64_t)a3 effectRenderRequest:(id)a4 reactionStates:(id)a5 disparity:(id)a6 disparityCentered:(id)a7 normal:(id)a8 diffuse:(id)a9 temporalFilter:(id)a10 humanDetections:(id)a11 transform:(CGAffineTransform *)a12 fNumber:(float)a13 focusDisparityRaw:(id)a14 useDisparityBufferForReactions:(id)a15 outYUV:(id)a16
{
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  PTEffectRelighting *effectRelighting;
  uint64_t v29;
  uint64_t v30;
  uint64_t v36;
  float v37;
  float v38;
  float v39;
  PTUtil *util;
  void *v41;
  int v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  double v53;
  float v54[8];

  v52 = a6;
  v51 = a7;
  v50 = a8;
  v49 = a10;
  v48 = a11;
  v20 = a16;
  PTDefaultsPublicGetDictionary();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PTEffectDebug"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (a3 || objc_msgSend(v22, "intValue"))
  {
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PTEffectDebugLayer renderDebugInformation:effectRenderRequest:reactionStates:disparity:disparityCentered:normal:diffuse:temporalFilter:humanDetections:transform:fNumber:focusDisparityRaw:useDisparityBufferForReactions:outYUV:].cold.1(v25);

    }
    if (a3 == 1 || objc_msgSend(v23, "intValue"))
      -[PTEffectDebugLayer renderThumbnailsWithDisparity:disparityCentered:normal:temporalFilter:outYUV:](self, "renderThumbnailsWithDisparity:disparityCentered:normal:temporalFilter:outYUV:", v52, v51, v50, v49, v20);
    v46 = v23;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PTEffectShowFaceRects"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 2 || (v45 = objc_msgSend(v47, "intValue"), a3 == 1) || v45)
    {
      -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "texLuma");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "renderDebugRects:outTexture:debugFaceRects:", v26, v27, a3 == 2);

      effectRelighting = self->_effectRelighting;
      if (effectRelighting)
      {
        v29 = -[PTEffectRelighting smoothFaceRects](effectRelighting, "smoothFaceRects");
        v30 = 0;
        __asm { FMOV            V0.4S, #1.0 }
        v53 = *(double *)&_Q0;
        do
        {
          v36 = v29 + v30;
          if (*(float *)(v29 + v30 + 112) > 0.0)
          {
            *(_QWORD *)v54 = *(_QWORD *)(v36 + 48);
            v37 = *(float *)(v36 + 56);
            v38 = (float)(unint64_t)objc_msgSend(v20, "width");
            v39 = v38 / (float)(unint64_t)objc_msgSend(v20, "height");
            util = self->_util;
            -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (int)(float)((float)(v54[0] - v37) * (float)(unint64_t)objc_msgSend(v20, "width"));
            v43 = (int)(float)((float)(v54[1] - (float)(v37 * v39))
                             * (float)(unint64_t)objc_msgSend(v20, "height"));
            objc_msgSend(v20, "width");
            objc_msgSend(v20, "height");
            objc_msgSend(v20, "texLuma");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTUtil renderRect:rect:color:fill:outTexture:](util, "renderRect:rect:color:fill:outTexture:", v41, 0, v44, COERCE_DOUBLE(__PAIR64__(v43, v42)), v53);

          }
          v30 += 72;
        }
        while (v30 != 288);
      }
    }
    -[PTMetalContext commitAndWaitUntilScheduled](self->_metalContext, "commitAndWaitUntilScheduled");
    ++renderDebugInformation_effectRenderRequest_reactionStates_disparity_disparityCentered_normal_diffuse_temporalFilter_humanDetections_transform_fNumber_focusDisparityRaw_useDisparityBufferForReactions_outYUV__frameIndex;

    v23 = v46;
  }

}

- (void)renderThumbnailsWithDisparity:(id)a3 disparityCentered:(id)a4 normal:(id)a5 temporalFilter:(id)a6 outYUV:(id)a7
{
  id v9;
  PTUtil *util;
  void *v11;
  PTUtil *v12;
  void *v13;
  void *v14;
  PTUtil *v15;
  void *v16;
  void *v17;
  double v23;
  double v24;
  id v25;

  v25 = a3;
  v9 = a7;
  if (objc_msgSend(v25, "width"))
  {
    util = self->_util;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUtil renderDisparity:inDisparity:outYUV:region:drawLegend:](util, "renderDisparity:inDisparity:outYUV:region:drawLegend:", v11, v25, v9, ((unint64_t)LOWORD(self->_width) << 32) | ((unint64_t)self->_height << 48), 0);

    v12 = self->_util;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(double *)&self->_width;
    objc_msgSend(v9, "texLuma");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUtil renderRect:rect:color:fill:outTexture:](v12, "renderRect:rect:color:fill:outTexture:", v13, 1, v14, v23, 0.0);

    v15 = self->_util;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&self->_width, (int32x2_t)0x200000002));
    objc_msgSend(v9, "texLuma");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __asm { FMOV            V1.4S, #1.0 }
    -[PTUtil renderRect:rect:color:fill:outTexture:](v15, "renderRect:rect:color:fill:outTexture:", v16, 1, v17, v24, *(double *)&_Q1);

  }
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_depthConverter, 0);
  objc_storeStrong((id *)&self->_vfxRenderEffect, 0);
  objc_storeStrong((id *)&self->_brightSceneDetector, 0);
  for (i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_faceDisparityGraphs[i + 3], 0);
  objc_storeStrong((id *)&self->_focusDisparityGraph, 0);
  objc_storeStrong((id *)&self->_focusDisparityRelightingGraph, 0);
  objc_storeStrong((id *)&self->_srlGraph, 0);
  objc_storeStrong((id *)&self->_focusDisparityModifier, 0);
  objc_storeStrong((id *)&self->_focusDisparityRaw, 0);
  objc_storeStrong((id *)&self->_faceDisparityArray, 0);
  objc_storeStrong((id *)&self->_disparityFixedFocus, 0);
  objc_storeStrong((id *)&self->_reactionProvider, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_effectRelighting, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)renderDebugInformation:(os_log_t)log effectRenderRequest:reactionStates:disparity:disparityCentered:normal:diffuse:temporalFilter:humanDetections:transform:fNumber:focusDisparityRaw:useDisparityBufferForReactions:outYUV:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_metalContext.commandBuffer";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

@end
