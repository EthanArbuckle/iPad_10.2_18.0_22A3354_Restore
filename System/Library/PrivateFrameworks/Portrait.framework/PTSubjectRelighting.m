@implementation PTSubjectRelighting

- (PTSubjectRelighting)initWithMetalContext:(id)a3 effectUtil:(id)a4 prewarmOnly:(BOOL)a5
{
  id v7;
  PTSubjectRelighting *v8;
  uint64_t v9;
  MTLComputePipelineState *srlV2GlobalHistogramLivePhotos;
  uint64_t v11;
  MTLComputePipelineState *srlV2FaceHistogramLivePhotos;
  uint64_t v13;
  MTLComputePipelineState *srlV2CalcCoefficientsLivePhotos;
  void *v15;
  uint64_t v16;
  MTLBuffer *srlV2GlobalStatsBuffer;
  void *v18;
  uint64_t v19;
  MTLBuffer *srlV2FaceStatsBuffer;
  void *v21;
  uint64_t v22;
  MTLBuffer *srlV2CoeffsBuffer;
  MTLBuffer *v24;
  uint64_t v25;
  SRLv2Plist *srlV2Plist;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *plistSRL;
  NSObject *v37;
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
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  PTSubjectRelighting *v94;
  objc_super v96;

  v7 = a3;
  v96.receiver = self;
  v96.super_class = (Class)PTSubjectRelighting;
  v8 = -[PTSubjectRelighting init](&v96, sel_init);
  if (!v8)
    goto LABEL_30;
  objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("srlV2GlobalSparseHistogramLivePhotos"), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  srlV2GlobalHistogramLivePhotos = v8->_srlV2GlobalHistogramLivePhotos;
  v8->_srlV2GlobalHistogramLivePhotos = (MTLComputePipelineState *)v9;

  if (!v8->_srlV2GlobalHistogramLivePhotos)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.1(v28, v45, v46, v47, v48, v49, v50, v51);
    goto LABEL_29;
  }
  objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("srlV2FaceSparseHistogramLivePhotos"), 0);
  v11 = objc_claimAutoreleasedReturnValue();
  srlV2FaceHistogramLivePhotos = v8->_srlV2FaceHistogramLivePhotos;
  v8->_srlV2FaceHistogramLivePhotos = (MTLComputePipelineState *)v11;

  if (!v8->_srlV2FaceHistogramLivePhotos)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.2(v28, v52, v53, v54, v55, v56, v57, v58);
    goto LABEL_29;
  }
  objc_msgSend(v7, "computePipelineStateFor:withConstants:", CFSTR("srlV2CalcCoefficientsLivePhotos"), 0);
  v13 = objc_claimAutoreleasedReturnValue();
  srlV2CalcCoefficientsLivePhotos = v8->_srlV2CalcCoefficientsLivePhotos;
  v8->_srlV2CalcCoefficientsLivePhotos = (MTLComputePipelineState *)v13;

  if (!v8->_srlV2CalcCoefficientsLivePhotos)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.3(v28, v59, v60, v61, v62, v63, v64, v65);
    goto LABEL_29;
  }
  objc_msgSend(v7, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "newBufferWithLength:options:", 8460, 0);
  srlV2GlobalStatsBuffer = v8->_srlV2GlobalStatsBuffer;
  v8->_srlV2GlobalStatsBuffer = (MTLBuffer *)v16;

  if (!v8->_srlV2GlobalStatsBuffer)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.4(v28, v66, v67, v68, v69, v70, v71, v72);
    goto LABEL_29;
  }
  objc_msgSend(v7, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "newBufferWithLength:options:", 271680, 0);
  srlV2FaceStatsBuffer = v8->_srlV2FaceStatsBuffer;
  v8->_srlV2FaceStatsBuffer = (MTLBuffer *)v19;

  if (!v8->_srlV2FaceStatsBuffer)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.5(v28, v73, v74, v75, v76, v77, v78, v79);
    goto LABEL_29;
  }
  objc_msgSend(v7, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "newBufferWithLength:options:", 100, 0);
  srlV2CoeffsBuffer = v8->_srlV2CoeffsBuffer;
  v8->_srlV2CoeffsBuffer = (MTLBuffer *)v22;

  v24 = v8->_srlV2CoeffsBuffer;
  if (!v24)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.6(v28, v87, v88, v89, v90, v91, v92, v93);
    goto LABEL_29;
  }
  if (!v8->_srlV2GlobalStatsBuffer || !v8->_srlV2FaceStatsBuffer)
  {
    _PTLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.7(v28, v80, v81, v82, v83, v84, v85, v86);
    goto LABEL_29;
  }
  *(_DWORD *)(-[MTLBuffer contents](v24, "contents") + 96) = 1056964608;
  v25 = objc_opt_new();
  srlV2Plist = v8->_srlV2Plist;
  v8->_srlV2Plist = (SRLv2Plist *)v25;

  if (a5)
  {
LABEL_33:
    v94 = v8;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pathForResource:ofType:inDirectory:", CFSTR("BackWide-IQTuning"), CFSTR("plist"), &stru_1E822B200);
  v28 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryWithContentsOfURL:error:", v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DeepFusionParameters"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ToneMapping"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("DefaultParameters"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SRLv2"));
  v35 = objc_claimAutoreleasedReturnValue();
  plistSRL = v8->_plistSRL;
  v8->_plistSRL = (NSDictionary *)v35;

  if (!-[SRLv2Plist readPlist:](v8->_srlV2Plist, "readPlist:", v8->_plistSRL))
  {

    goto LABEL_33;
  }
  _PTLogSystem();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    -[PTSubjectRelighting initWithMetalContext:effectUtil:prewarmOnly:].cold.8(v37, v38, v39, v40, v41, v42, v43, v44);

LABEL_29:
LABEL_30:
  v94 = 0;
LABEL_31:

  return v94;
}

- (int)runSRLForLivePhotosWithInputBuffer:(id)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 skinMaskTexture:(id)a6 personMaskTexture:(id)a7 skinToneClassification:(id)a8 validROI:(CGRect)a9 expBias:(float)a10 faceExpRatio:(float)a11 transform:(CGAffineTransform *)a12
{
  unint64_t v20;
  uint64_t v21;
  SRLv2Plist *srlV2Plist;
  uint64_t v28;
  MTLComputePipelineState **p_srlV2FaceHistogramLivePhotos;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  float v40;
  double v41;
  float v42;
  __int128 v43;
  float64_t v44;
  float64x2_t v45;
  float32x2_t *v46;
  float64_t v47;
  float64x2_t v48;
  void *v49;
  float v50;
  float32_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  int v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  float v61;
  float v62;
  unint64_t v63;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  PTSubjectRelighting *v70;
  id v71;
  int64x2_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  int64x2_t v76;
  int64x2_t v77;
  uint64_t v78;
  _QWORD v79[3];
  uint64_t v80;
  int64x2_t v81;
  _QWORD v82[3];
  int64x2_t v83;
  uint64_t v84;
  _OWORD v85[3];
  _DWORD v86[2];
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  float v96;
  float v97[5];

  v71 = a3;
  v69 = a4;
  v68 = a5;
  v67 = a6;
  v65 = a7;
  v96 = a11;
  v97[0] = a10;
  v74 = a8;
  v20 = objc_msgSend(v74, "count");
  if (v20 >= 4)
    v21 = 4;
  else
    v21 = v20;
  v87 = 0u;
  v88 = 0;
  v95 = 0;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v90 = 0u;
  v86[0] = v21;
  v86[1] = 6;
  *(_QWORD *)((char *)&v87 + 4) = 0x3F8000003F000000;
  __asm { FMOV            V0.2S, #1.0 }
  v89 = _D0;
  v70 = self;
  srlV2Plist = self->_srlV2Plist;
  *(float *)&v90 = srlV2Plist->maskThreshold;
  *(_QWORD *)((char *)&v90 + 4) = *(_QWORD *)&srlV2Plist->targetMedian_I;
  HIDWORD(v90) = LODWORD(srlV2Plist->targetMedian_III);
  v91 = *(_OWORD *)&srlV2Plist->targetMedian_IV;
  v92 = *(_OWORD *)&srlV2Plist->maxBoost_II;
  *(float *)&v93 = srlV2Plist->maxBoost_VI;
  *(_QWORD *)((char *)&v93 + 4) = *(_QWORD *)&srlV2Plist->minFaceSize;
  HIDWORD(v93) = LODWORD(srlV2Plist->minCurveBoost);
  v94 = *(_OWORD *)&srlV2Plist->maxTargetRatioDarkening;
  *(float *)&v95 = srlV2Plist->faceExpDifThreshold;
  BYTE4(v95) = srlV2Plist->relightOnlyPersonMask;
  BYTE5(v95) = 1;
  v73 = v21;
  if (v21)
  {
    v28 = 0;
    p_srlV2FaceHistogramLivePhotos = &self[1]._srlV2FaceHistogramLivePhotos;
    do
    {
      objc_msgSend(v74, "objectAtIndexedSubscript:", v28, v65);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "faceAttributes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "boundingBox");
      v33 = v32;
      objc_msgSend(v31, "facemaskCategory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "label");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("UNKNOWN_17_unknown0"));

      objc_msgSend(v30, "boundingBox");
      v39 = v38;
      if (v37)
      {
        objc_msgSend(v30, "boundingBox");
        v42 = v41;
        v40 = v39;
        v39 = fminf((float)(v42 / 2.5) + v40, 1.0);
      }
      objc_msgSend(v30, "boundingBox");
      objc_msgSend(v30, "boundingBox");
      v43 = *(_OWORD *)&a12->c;
      v85[0] = *(_OWORD *)&a12->a;
      v85[1] = v43;
      v85[2] = *(_OWORD *)&a12->tx;
      +[PTEffectUtil rotateNormalizedRect:transform:inverse:](PTEffectUtil, "rotateNormalizedRect:transform:inverse:", v85, 1, v33, v39);
      v45.f64[1] = v44;
      v46 = (float32x2_t *)((char *)&v70[1] + 48 * v28);
      v48.f64[1] = v47;
      *v46 = vcvt_f32_f64(v45);
      v46[1] = vcvt_f32_f64(v48);
      objc_msgSend(v30, "yaw");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "floatValue");
      v51 = (float)(v50 * 3.0) / 1.57079633;
      v46[5].f32[0] = v51;

      objc_msgSend(v31, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "allLabelsWithConfidences");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v53, "count"))
      {
        v54 = 0;
        do
        {
          objc_msgSend(v53, "objectAtIndexedSubscript:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "confidence");
          *((_DWORD *)p_srlV2FaceHistogramLivePhotos + v54) = v56;

          ++v54;
        }
        while (v54 < objc_msgSend(v53, "count"));
      }

      ++v28;
      p_srlV2FaceHistogramLivePhotos += 6;
    }
    while (v28 != v73);
  }
  objc_msgSend(v71, "computeCommandEncoder", v65);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v70->_srlV2GlobalHistogramLivePhotos, "maxTotalThreadsPerThreadgroup");
  v59 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v70->_srlV2FaceHistogramLivePhotos, "maxTotalThreadsPerThreadgroup");
  if (v58 >= v59)
    v60 = v59;
  else
    v60 = v58;
  v61 = log2f((float)(v60 >> 6));
  v62 = exp2f(floorf(v61));
  if ((unint64_t)v62 >= 0x40)
    v63 = 64;
  else
    v63 = (unint64_t)v62;
  objc_msgSend(v57, "setTexture:atIndex:", v69, 1);
  objc_msgSend(v57, "setTexture:atIndex:", v68, 2);
  objc_msgSend(v57, "setTexture:atIndex:", v67, 5);
  objc_msgSend(v57, "setTexture:atIndex:", v66, 6);
  objc_msgSend(v57, "setBytes:length:atIndex:", v86, 128, 0);
  objc_msgSend(v57, "setBytes:length:atIndex:", &v70[1], 48 * v73, 1);
  objc_msgSend(v57, "setBytes:length:atIndex:", v97, 4, 7);
  objc_msgSend(v57, "setBytes:length:atIndex:", &v96, 4, 8);
  objc_msgSend(v57, "setBuffer:offset:atIndex:", v70->_srlV2GlobalStatsBuffer, 0, 2);
  objc_msgSend(v57, "setBuffer:offset:atIndex:", v70->_srlV2FaceStatsBuffer, 0, 3);
  objc_msgSend(v57, "setBuffer:offset:atIndex:", v70->_srlV2CoeffsBuffer, 0, 4);
  objc_msgSend(v57, "setComputePipelineState:", v70->_srlV2GlobalHistogramLivePhotos);
  v72 = vdupq_n_s64(1uLL);
  v83 = v72;
  v84 = 1;
  v82[0] = 64;
  v82[1] = v63;
  v82[2] = 1;
  objc_msgSend(v57, "dispatchThreadgroups:threadsPerThreadgroup:", &v83, v82);
  objc_msgSend(v57, "setComputePipelineState:", v70->_srlV2FaceHistogramLivePhotos);
  v79[2] = 1;
  v80 = v73;
  v81 = v72;
  v79[0] = 64;
  v79[1] = v63;
  objc_msgSend(v57, "dispatchThreadgroups:threadsPerThreadgroup:", &v80, v79);
  objc_msgSend(v57, "setComputePipelineState:", v70->_srlV2CalcCoefficientsLivePhotos);
  v77 = v72;
  v78 = 1;
  v75 = -[MTLComputePipelineState threadExecutionWidth](v70->_srlV2CalcCoefficientsLivePhotos, "threadExecutionWidth");
  v76 = v72;
  objc_msgSend(v57, "dispatchThreadgroups:threadsPerThreadgroup:", &v77, &v75);
  objc_msgSend(v57, "endEncoding");

  return 0;
}

- (id)srlV2CoeffsBuffer
{
  return self->_srlV2CoeffsBuffer;
}

- (id)samplePosDebug
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistSRL, 0);
  objc_storeStrong((id *)&self->_srlV2Plist, 0);
  objc_storeStrong((id *)&self->_srlV2CoeffsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2FaceStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2CalcCoefficientsLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2FaceHistogramLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlV2GlobalHistogramLivePhotos, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "newBufferWithLength failed", a5, a6, a7, a8, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 prewarmOnly:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Cannot load plist", a5, a6, a7, a8, 0);
}

@end
