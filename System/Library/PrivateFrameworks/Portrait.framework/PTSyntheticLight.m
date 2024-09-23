@implementation PTSyntheticLight

- (PTSyntheticLight)initWithMetalContext:(id)a3 faceAttributesNetwork:(id)a4 effectUtil:(id)a5 msrColorPyramid:(id)a6 colorSize:(id *)a7 prewarmOnly:(BOOL)a8 sharedResources:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  PTSyntheticLight *v18;
  PTSyntheticLight *v19;
  uint64_t v20;
  PTMetalContext *asyncMetalContext;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MTLComputePipelineState *lightEstimation;
  void *v27;
  void *v28;
  PTPersonSemanticsNetwork *personSemanticsNetwork;
  void *v30;
  PTSyntheticLight *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  PTPersonSemanticsNetwork *v50;
  PTPersonSemanticsNetwork *v51;
  PTSubjectRelighting *v52;
  PTSubjectRelighting *subjectRelighting;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  MTLBuffer *lightEstimationBuffer;
  const __CFAllocator *v65;
  void *v66;
  size_t v67;
  void *v68;
  size_t v69;
  uint64_t v70;
  CVReturn v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  size_t Width;
  void *v76;
  void *v77;
  uint64_t v78;
  MTLTexture *rgbaTextureCopy;
  void *v80;
  uint64_t v81;
  MTLTexture *quarterSizeLumaCopy;
  void *v83;
  uint64_t v84;
  MTLTexture *quarterSizeChromaCopy;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  MTLTexture *skinMaskRGBA;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v122;
  id v123;
  objc_super v124;
  _QWORD v125[2];
  _QWORD v126[3];

  v9 = a8;
  v126[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v122 = a4;
  v123 = a5;
  v16 = a6;
  v17 = a9;
  v124.receiver = self;
  v124.super_class = (Class)PTSyntheticLight;
  v18 = -[PTSyntheticLight init](&v124, sel_init);
  v19 = v18;
  if (!v18)
  {
    v31 = 0;
    v32 = v122;
    v28 = v123;
LABEL_10:
    v27 = v16;
LABEL_11:
    v30 = v17;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v18->_mainMetalContext, a3);
  v20 = objc_msgSend(v15, "copy");
  asyncMetalContext = v19->_asyncMetalContext;
  v19->_asyncMetalContext = (PTMetalContext *)v20;

  -[PTMetalContext device](v19->_asyncMetalContext, "device");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "newCommandQueue");
  -[PTMetalContext setCommandQueue:](v19->_asyncMetalContext, "setCommandQueue:", v23);

  -[PTMetalContext commandQueue](v19->_asyncMetalContext, "commandQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    _PTLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    v28 = v123;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.1(v33, v34, v35, v36, v37, v38, v39, v40);

    v31 = 0;
    v32 = v122;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v19->_effectUtil, a5);
  objc_storeStrong((id *)&v19->_msrColorPyramid, a6);
  v19->_config.firstFrame = 1;
  *(_QWORD *)&v19->_config.framesSinceLightEstimate = 0x1E00000000;
  v19->_config.emaCoefficient = 0.3;
  v19->_subjectRelightingRunning = 0;
  objc_msgSend(v15, "computePipelineStateFor:withConstants:", CFSTR("lightEstimation"), 0);
  v25 = objc_claimAutoreleasedReturnValue();
  lightEstimation = v19->_lightEstimation;
  v19->_lightEstimation = (MTLComputePipelineState *)v25;

  if (!v19->_lightEstimation)
  {
    _PTLogSystem();
    v42 = objc_claimAutoreleasedReturnValue();
    v27 = v16;
    v28 = v123;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.2(v42, v43, v44, v45, v46, v47, v48, v49);

    v31 = 0;
    v32 = v122;
    goto LABEL_11;
  }
  v27 = v16;
  v28 = v123;
  if (v9)
  {
    personSemanticsNetwork = v19->_personSemanticsNetwork;
    v19->_personSemanticsNetwork = 0;

    v30 = v17;
  }
  else
  {
    v30 = v17;
    v50 = -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:]([PTPersonSemanticsNetwork alloc], "initWithMetalContext:effectUtil:sharedResources:", v15, v123, v17);
    v51 = v19->_personSemanticsNetwork;
    v19->_personSemanticsNetwork = v50;

    if (!v19->_personSemanticsNetwork)
    {
      _PTLogSystem();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.9(v73);

      v31 = 0;
      goto LABEL_30;
    }
  }
  v52 = -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:]([PTSubjectRelighting alloc], "initWithMetalContext:effectUtil:prewarmOnly:", v15, v123, v9);
  subjectRelighting = v19->_subjectRelighting;
  v19->_subjectRelighting = v52;

  if (v19->_subjectRelighting)
  {
    objc_storeStrong((id *)&v19->_faceAttributesNetwork, a4);
    if (v9)
    {
LABEL_19:
      v31 = v19;
LABEL_30:
      v32 = v122;
      goto LABEL_12;
    }
    objc_msgSend(v15, "device");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "newBufferWithLength:options:", 64, 0);
    lightEstimationBuffer = v19->_lightEstimationBuffer;
    v19->_lightEstimationBuffer = (MTLBuffer *)v63;

    v65 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend(v27, "targetRGBA");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "width");
    objc_msgSend(v27, "targetRGBA");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "height");
    v70 = *MEMORY[0x1E0CA8F68];
    v125[0] = *MEMORY[0x1E0CA8FF0];
    v125[1] = v70;
    v126[0] = MEMORY[0x1E0C9AA70];
    v126[1] = &unk_1E82520A0;
    v71 = CVPixelBufferCreate(v65, v67, v69, 0x42475241u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2), &v19->_rgbaPixelBufferCopy);

    if (!v71)
    {
      v74 = (void *)MEMORY[0x1E0CC6BB0];
      Width = CVPixelBufferGetWidth(v19->_rgbaPixelBufferCopy);
      objc_msgSend(v74, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 81, Width, CVPixelBufferGetHeight(v19->_rgbaPixelBufferCopy), 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setUsage:", +[PTPixelBufferUtil getNoConcurrentAccessHint:](PTPixelBufferUtil, "getNoConcurrentAccessHint:", v19->_rgbaPixelBufferCopy) | 3);
      objc_msgSend(v15, "device");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "newTextureWithDescriptor:iosurface:plane:", v76, CVPixelBufferGetIOSurface(v19->_rgbaPixelBufferCopy), 0);
      rgbaTextureCopy = v19->_rgbaTextureCopy;
      v19->_rgbaTextureCopy = (MTLTexture *)v78;

      if (v19->_rgbaTextureCopy)
      {
        objc_msgSend(v15, "textureUtil");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "createWithWidth:height:pixelFormat:", a7->var0 >> 1, a7->var1 >> 1, 10);
        v81 = objc_claimAutoreleasedReturnValue();
        quarterSizeLumaCopy = v19->_quarterSizeLumaCopy;
        v19->_quarterSizeLumaCopy = (MTLTexture *)v81;

        if (v19->_quarterSizeLumaCopy)
        {
          objc_msgSend(v15, "textureUtil");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "createWithWidth:height:pixelFormat:", a7->var0 >> 2, a7->var1 >> 2, 30);
          v84 = objc_claimAutoreleasedReturnValue();
          quarterSizeChromaCopy = v19->_quarterSizeChromaCopy;
          v19->_quarterSizeChromaCopy = (MTLTexture *)v84;

          if (v19->_quarterSizeChromaCopy)
          {
            objc_msgSend(v15, "textureUtil");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[PTPersonSemanticsNetwork inRGBA](v19->_personSemanticsNetwork, "inRGBA");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "width");
            -[PTPersonSemanticsNetwork inRGBA](v19->_personSemanticsNetwork, "inRGBA");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "createWithWidth:height:pixelFormat:", v88, objc_msgSend(v89, "height"), 71);
            v90 = objc_claimAutoreleasedReturnValue();
            skinMaskRGBA = v19->_skinMaskRGBA;
            v19->_skinMaskRGBA = (MTLTexture *)v90;

            if (v19->_skinMaskRGBA)
            {

              v28 = v123;
              goto LABEL_19;
            }
            _PTLogSystem();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.7(v92, v114, v115, v116, v117, v118, v119, v120);
          }
          else
          {
            _PTLogSystem();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.6(v92, v107, v108, v109, v110, v111, v112, v113);
          }
        }
        else
        {
          _PTLogSystem();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.5(v92, v100, v101, v102, v103, v104, v105, v106);
        }
      }
      else
      {
        _PTLogSystem();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.4(v92, v93, v94, v95, v96, v97, v98, v99);
      }

      v31 = 0;
      v32 = v122;
      v28 = v123;
      goto LABEL_12;
    }
    _PTLogSystem();
    v72 = objc_claimAutoreleasedReturnValue();
    v32 = v122;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.8(v71, v72);

    v31 = 0;
    v28 = v123;
  }
  else
  {
    _PTLogSystem();
    v54 = objc_claimAutoreleasedReturnValue();
    v32 = v122;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:].cold.3(v54, v55, v56, v57, v58, v59, v60, v61);

    v31 = 0;
  }
LABEL_12:

  return v31;
}

- (void)dealloc
{
  __CVBuffer *rgbaPixelBufferCopy;
  objc_super v4;

  rgbaPixelBufferCopy = self->_rgbaPixelBufferCopy;
  if (rgbaPixelBufferCopy)
    CVPixelBufferRelease(rgbaPixelBufferCopy);
  v4.receiver = self;
  v4.super_class = (Class)PTSyntheticLight;
  -[PTSyntheticLight dealloc](&v4, sel_dealloc);
}

- (void)updateSubjectRelighting:(uint64_t)a3 inLuma:(void *)a4 inChroma:(void *)a5 inFaceRects:(uint64_t)a6 runOnAsyncCommandQueue:(int)a7 transform:(__int128 *)a8 dependentCommandBuffer:(void *)a9
{
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  double v41;
  double v42;
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v15 = a5;
  v16 = a4;
  objc_msgSend(a9, "waitUntilScheduled");
  v17 = a8[1];
  v44 = *a8;
  v45 = v17;
  v46 = a8[2];
  v18 = +[PTUtil orientationFromTransform:inverse:](PTUtil, "orientationFromTransform:inverse:", &v44, 1);
  kdebug_trace();
  v43 = a7;
  v19 = 16;
  if (a7)
    v19 = 24;
  v20 = *(id *)(a1 + v19);
  objc_msgSend(*(id *)(a1 + 32), "executeNetwork:", v20);
  objc_msgSend(v20, "commandBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    _PTLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PTSyntheticLight updateSubjectRelighting:inLuma:inChroma:inFaceRects:runOnAsyncCommandQueue:transform:dependentCommandBuffer:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

  }
  v30 = *(unsigned int *)(a6 + 64);
  v31 = a8[1];
  v44 = *a8;
  v45 = v31;
  v46 = a8[2];
  +[PTEffectUtil faceRectsForVision:numberOfFaceRects:transform:](PTEffectUtil, "faceRectsForVision:numberOfFaceRects:transform:", a6, v30, &v44);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 104), "faceLandmarksInPixelBuffer:faceRects:orientation:", a3, v32, v18);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v33;

  v35 = *(void **)(a1 + 88);
  objc_msgSend(v20, "commandBuffer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outSkinMask");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "outPersonMask");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)(a1 + 96);
  v40 = a8[1];
  v44 = *a8;
  v45 = v40;
  v46 = a8[2];
  LODWORD(v41) = 0;
  LODWORD(v42) = 0;
  objc_msgSend(v35, "runSRLForLivePhotosWithInputBuffer:lumaTexture:chromaTexture:skinMaskTexture:personMaskTexture:skinToneClassification:validROI:expBias:faceExpRatio:transform:", v36, v16, v15, v37, v38, v39, 0.0, 0.0, 1.0, 1.0, v41, v42, &v44);

  if (v43)
    objc_msgSend(v20, "commitAndWaitUntilCompleted");
  else
    objc_msgSend(v20, "commit");
  objc_msgSend(v20, "commit");
  kdebug_trace();

}

- (void)estimateLightIntensityWithFaceRects:(PTSyntheticLight *)self inTex:(SEL)a2 numberOfFaceRects:transform:humanDetections:asyncWork:
{
  __int128 *v2;
  void *v3;
  int v4;
  _OWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD *v10;
  int v11;
  __int128 *v12;
  id v14;
  id v15;
  id v16;
  _BOOL4 subjectRelightingRunning;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __CVBuffer *rgbaPixelBufferCopy;
  MTLTexture *quarterSizeLumaCopy;
  MTLTexture *quarterSizeChromaCopy;
  __int128 v52;
  __int128 v53;
  __CVBuffer *v54;
  __int128 v55;
  void *v56;
  __int128 *v57;
  _OWORD *v58;
  _QWORD v59[5];
  id v60;
  uint64_t *v61;
  id v62[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[3];
  _OWORD location[5];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = v2;
  v14 = v3;
  v15 = v9;
  v16 = v8;
  os_unfair_lock_lock(&sSRLAsyncLock);
  subjectRelightingRunning = self->_subjectRelightingRunning;
  os_unfair_lock_unlock(&sSRLAsyncLock);
  if (!subjectRelightingRunning
    && (self->_config.firstFrame
     || v11 >= 1 && self->_config.framesSinceLightEstimate >= self->_config.lightEstimateFrequency)
    && (int)objc_msgSend(v15, "detectionsRawCount") >= 1)
  {
    v57 = v12;
    v58 = v10;
    v18 = 0;
    v19 = 0;
    v20 = 64;
    do
    {
      v19 |= fabsf(fmodf(*(float *)(objc_msgSend(v15, "detectionsRaw") + v20) + 180.0, 360.0) + -180.0) < 60.0;
      ++v18;
      v20 += 144;
    }
    while (v18 < (int)objc_msgSend(v15, "detectionsRawCount"));
    if (((v11 > 0) & v19) != 0)
    {
      v68 = 0;
      v69 = &v68;
      v70 = 0x7010000000;
      v71 = &unk_1C9352B0A;
      v76 = 0;
      v77 = 0;
      v21 = v57[1];
      v72 = *v57;
      v73 = v21;
      v22 = v57[3];
      v74 = v57[2];
      v75 = v22;
      LODWORD(v76) = v11;
      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        _PTLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[PTSyntheticLight estimateLightIntensityWithFaceRects:inTex:numberOfFaceRects:transform:humanDetections:asyncWork:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

      }
      -[PTMetalContext textureUtil](self->_mainMetalContext, "textureUtil");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMSRResize targetRGBA](self->_msrColorPyramid, "targetRGBA");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTPersonSemanticsNetwork inRGBA](self->_personSemanticsNetwork, "inRGBA");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "copy:inTex:outTex:", v33, v34, v35);

      self->_config.framesSinceLightEstimate = 0;
      -[PTMetalContext textureUtil](self->_mainMetalContext, "textureUtil");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMSRResize targetRGBA](self->_msrColorPyramid, "targetRGBA");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "copy:inTex:outTex:", v37, v38, self->_rgbaTextureCopy);

      -[PTMetalContext textureUtil](self->_mainMetalContext, "textureUtil");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "texLuma");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "copy:inTex:outTex:", v40, v41, self->_quarterSizeLumaCopy);

      -[PTMetalContext textureUtil](self->_mainMetalContext, "textureUtil");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "texChroma");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "copy:inTex:outTex:", v43, v44, self->_quarterSizeChromaCopy);

      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext commit](self->_mainMetalContext, "commit");
      if (self->_config.firstFrame || sPTEffectDisableAsyncWork == 1)
      {
        self->_subjectRelightingRunning = 0;
        v46 = *((_OWORD *)v69 + 3);
        v47 = *((_OWORD *)v69 + 5);
        v48 = *((_OWORD *)v69 + 6);
        location[2] = *((_OWORD *)v69 + 4);
        location[3] = v47;
        rgbaPixelBufferCopy = self->_rgbaPixelBufferCopy;
        quarterSizeLumaCopy = self->_quarterSizeLumaCopy;
        quarterSizeChromaCopy = self->_quarterSizeChromaCopy;
        location[4] = v48;
        location[0] = *((_OWORD *)v69 + 2);
        location[1] = v46;
        v52 = v58[1];
        v66[0] = *v58;
        v53 = v58[2];
        v66[1] = v52;
        v66[2] = v53;
        -[PTSyntheticLight updateSubjectRelighting:inLuma:inChroma:inFaceRects:runOnAsyncCommandQueue:transform:dependentCommandBuffer:](self, "updateSubjectRelighting:inLuma:inChroma:inFaceRects:runOnAsyncCommandQueue:transform:dependentCommandBuffer:", rgbaPixelBufferCopy, quarterSizeLumaCopy, quarterSizeChromaCopy, location, 0, v66, v45);
      }
      else
      {
        v54 = self->_rgbaPixelBufferCopy;
        CVPixelBufferRetain(v54);
        self->_subjectRelightingRunning = 1;
        objc_initWeak((id *)location, self);
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __116__PTSyntheticLight_estimateLightIntensityWithFaceRects_inTex_numberOfFaceRects_transform_humanDetections_asyncWork___block_invoke;
        v59[3] = &unk_1E822A650;
        objc_copyWeak(v62, (id *)location);
        v62[1] = v54;
        v59[4] = self;
        v61 = &v68;
        v55 = v58[1];
        v63 = *v58;
        v64 = v55;
        v65 = v58[2];
        v60 = v45;
        v56 = (void *)MEMORY[0x1CAA3AE80](v59);
        objc_msgSend(v16, "addObject:", v56);

        objc_destroyWeak(v62);
        objc_destroyWeak((id *)location);
      }

      _Block_object_dispose(&v68, 8);
    }
  }

}

void __116__PTSyntheticLight_estimateLightIntensityWithFaceRects_inTex_numberOfFaceRects_transform_humanDetections_asyncWork___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  _OWORD v14[3];
  _OWORD v15[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_OWORD **)(*(_QWORD *)(a1 + 48) + 8);
    v6 = v5[3];
    v7 = v5[5];
    v8 = v5[6];
    v15[2] = v5[4];
    v15[3] = v7;
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *((_QWORD *)WeakRetained + 17);
    v11 = *((_QWORD *)WeakRetained + 18);
    v12 = *(void **)(a1 + 32);
    v15[4] = v8;
    v15[0] = v5[2];
    v15[1] = v6;
    v13 = *(_OWORD *)(a1 + 88);
    v14[0] = *(_OWORD *)(a1 + 72);
    v14[1] = v13;
    v14[2] = *(_OWORD *)(a1 + 104);
    objc_msgSend(v12, "updateSubjectRelighting:inLuma:inChroma:inFaceRects:runOnAsyncCommandQueue:transform:dependentCommandBuffer:", v9, v10, v11, v15, 1, v14, v4);
    os_unfair_lock_lock(&sSRLAsyncLock);
    v3[112] = 0;
    os_unfair_lock_unlock(&sSRLAsyncLock);
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));

}

- (void)interpolateLightIntensity:(float)a3
{
  _BOOL4 subjectRelightingRunning;
  int framesSinceLightEstimate;
  void *v7;
  double v8;

  os_unfair_lock_lock(&sSRLAsyncLock);
  subjectRelightingRunning = self->_subjectRelightingRunning;
  os_unfair_lock_unlock(&sSRLAsyncLock);
  if (!subjectRelightingRunning)
  {
    framesSinceLightEstimate = self->_config.framesSinceLightEstimate;
    if (framesSinceLightEstimate < self->_config.lightEstimateFrequency)
    {
      -[PTMetalContext commandBuffer](self->_mainMetalContext, "commandBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v8 = a3;
      -[PTSyntheticLight estimateLightIntensity:relightStrength:](self, "estimateLightIntensity:relightStrength:", v7, v8);

      framesSinceLightEstimate = self->_config.framesSinceLightEstimate;
    }
    self->_config.firstFrame = 0;
    self->_config.framesSinceLightEstimate = framesSinceLightEstimate + 1;
  }
}

- (void)estimateLightIntensity:(id)a3 relightStrength:(float)a4
{
  float v5;
  PTSyntheticLightConfig *p_config;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v10[3];
  int64x2_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  int32x4_t v15;

  v5 = (float)(a4 * 0.6) + 0.5;
  p_config = &self->_config;
  if (!self->_config.firstFrame && v5 != self->_lastRelightStrength)
  {
    self->_config.firstFrame = 1;
    self->_config.framesSinceLightEstimate = 0;
  }
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComputePipelineState:", self->_lightEstimation);
  -[PTSubjectRelighting srlV2CoeffsBuffer](self->_subjectRelighting, "srlV2CoeffsBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBuffer:offset:atIndex:", v8, 0, 0);

  objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_lightEstimationBuffer, 0, 1);
  objc_msgSend(v7, "setBytes:length:atIndex:", p_config, 16, 2);
  v13 = 0x3F4CCCCD3F19999ALL;
  v15 = vdupq_n_s32(0x3EB33333u);
  v14 = v5;
  objc_msgSend(v7, "setBytes:length:atIndex:", &v13, 28, 3);
  v11 = vdupq_n_s64(1uLL);
  v12 = 1;
  v9 = -[MTLComputePipelineState threadExecutionWidth](self->_lightEstimation, "threadExecutionWidth");
  v10[0] = 8;
  v10[1] = v9 >> 3;
  v10[2] = 1;
  objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", &v11, v10);
  objc_msgSend(v7, "endEncoding");
  self->_lastRelightStrength = v5;

}

- (id)debugTextures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D20];
  -[PTPersonSemanticsNetwork outSkinMask](self->_personSemanticsNetwork, "outSkinMask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTPersonSemanticsNetwork outPersonMask](self->_personSemanticsNetwork, "outPersonMask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSubjectRelighting samplePosDebug](self->_subjectRelighting, "samplePosDebug");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)srlV2CoeffsBuffer
{
  return -[PTSubjectRelighting srlV2CoeffsBuffer](self->_subjectRelighting, "srlV2CoeffsBuffer");
}

- (void)reset
{
  self->_config.framesSinceLightEstimate = 0;
}

- (id)debugDescription
{
  return self->_description;
}

- (id)lightEstimation
{
  return self->_lightEstimationBuffer;
}

- (id)faceObservations
{
  return self->_faceObservations;
}

+ (void)disableAsynchronousWork
{
  sPTEffectDisableAsyncWork = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightEstimationBuffer, 0);
  objc_storeStrong((id *)&self->_quarterSizeChromaCopy, 0);
  objc_storeStrong((id *)&self->_quarterSizeLumaCopy, 0);
  objc_storeStrong((id *)&self->_rgbaTextureCopy, 0);
  objc_storeStrong((id *)&self->_faceAttributesNetwork, 0);
  objc_storeStrong((id *)&self->_faceObservations, 0);
  objc_storeStrong((id *)&self->_subjectRelighting, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_skinMaskRGBA, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_personSemanticsNetwork, 0);
  objc_storeStrong((id *)&self->_asyncMetalContext, 0);
  objc_storeStrong((id *)&self->_mainMetalContext, 0);
  objc_storeStrong((id *)&self->_lightEstimation, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 effectUtil:(uint64_t)a5 msrColorPyramid:(uint64_t)a6 colorSize:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(int)a1 faceAttributesNetwork:(NSObject *)a2 effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:.cold.8(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "CVPixelBufferCreate failed %i", (uint8_t *)v2, 8u);
}

- (void)initWithMetalContext:(os_log_t)log faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:.cold.9(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Failed allocating PTSegmentationNetwork", v1, 2u);
}

- (void)updateSubjectRelighting:(uint64_t)a3 inLuma:(uint64_t)a4 inChroma:(uint64_t)a5 inFaceRects:(uint64_t)a6 runOnAsyncCommandQueue:(uint64_t)a7 transform:(uint64_t)a8 dependentCommandBuffer:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)estimateLightIntensityWithFaceRects:(uint64_t)a3 inTex:(uint64_t)a4 numberOfFaceRects:(uint64_t)a5 transform:(uint64_t)a6 humanDetections:(uint64_t)a7 asyncWork:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
