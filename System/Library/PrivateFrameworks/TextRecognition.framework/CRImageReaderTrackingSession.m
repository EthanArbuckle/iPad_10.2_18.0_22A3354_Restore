@implementation CRImageReaderTrackingSession

- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3 debuggingSession:(BOOL)a4
{
  self->_debuggingSession = a4;
  return -[CRImageReaderTrackingSession initWithTrackingLevel:](self, "initWithTrackingLevel:", a3);
}

- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3 ocrFrameInterval:(unint64_t)a4
{
  CRImageReaderTrackingSession *v6;
  CRImageReaderTrackingSession *v7;
  unint64_t v8;
  CRImageReaderTrackingResult *v9;
  CRImageReaderTrackingResult *latestResult;
  VisionCoreSparseOpticalFlowSession *v11;
  BOOL v12;
  VisionCoreSparseOpticalFlowSession *optFlowSession;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *ocrQueue;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CRImageReaderTrackingSession;
  v6 = -[CRImageReaderTrackingSession init](&v22, sel_init);
  v7 = v6;
  if (a3 <= 1)
    v8 = 1;
  else
    v8 = a3;
  v6->_shouldIncludeLinesInTrackingResult = 0;
  v9 = -[CRImageReaderTrackingResult initWithTrackingLevel:]([CRImageReaderTrackingResult alloc], "initWithTrackingLevel:", v8);
  latestResult = v7->_latestResult;
  v7->_latestResult = v9;

  v11 = (VisionCoreSparseOpticalFlowSession *)objc_alloc_init(MEMORY[0x1E0DC6CF0]);
  v12 = a3 == 0;
  optFlowSession = v7->_optFlowSession;
  v7->_optFlowSession = v11;

  v14 = (__int128 *)MEMORY[0x1E0C83FE8];
  *(_WORD *)&v7->_ocrInProgress = 256;
  v15 = *v14;
  v16 = v14[1];
  *(_OWORD *)v7->_anon_d0 = *v14;
  *(_OWORD *)&v7->_anon_d0[16] = v16;
  v17 = v14[2];
  *(_OWORD *)&v7->_anon_d0[32] = v17;
  *(_OWORD *)&v7[1].super.isa = v15;
  *(_OWORD *)&v7[1]._wasLastFrameUnstableForFirstAcquisition = v16;
  *(_OWORD *)&v7[1]._trackingLevel = v17;
  v7->_downscaleRate = 4.0;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = dispatch_queue_create("com.apple.CoreRecognition.trackingOCRQueue", v18);
  ocrQueue = v7->_ocrQueue;
  v7->_ocrQueue = (OS_dispatch_queue *)v19;

  v7->_ocrFrameInterval = a4;
  v7->_replacedQuadArea = 0.0;
  *(_OWORD *)&v7->_frameCount = 0u;
  v7->_ocrUpdateMode = 1;
  v7->_lowFrequencyOCRElapsedTimeAboveMinimumStability = 0.0;
  *(_WORD *)&v7->_didDispatchOCROnFrame = 0;
  *(_OWORD *)&v7->_lastOCRDispatchTime = 0u;
  v7->_trackingLevel = v8;
  v7->_usesGroupedRegions = v12;

  return v7;
}

- (CRImageReaderTrackingSession)initWithTrackingLevel:(unint64_t)a3
{
  return -[CRImageReaderTrackingSession initWithTrackingLevel:ocrFrameInterval:](self, "initWithTrackingLevel:ocrFrameInterval:", a3, 0);
}

- (uint64_t)dispatchIfReady:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 64))
      v4 = -[CRImageReaderTrackingSession _dispatchAtOCRFrameInterval:](a1, v3);
    else
      v4 = -[CRImageReaderTrackingSession _dispatchIfReady:](a1, v3);
    v5 = v4;
    ++*(_QWORD *)(a1 + 48);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_dispatchAtOCRFrameInterval:(uint64_t)a1
{
  const char *v3;
  id v4;
  NSObject *Property;
  id v7;
  SEL v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v4 = a2;
  if (a1)
  {
    if (!(*(_QWORD *)(a1 + 48) % *(_QWORD *)(a1 + 64)) && (*(_BYTE *)(a1 + 11) & 1) != 0)
    {
      Property = objc_getProperty((id)a1, v3, 40, 1);
      dispatch_barrier_sync(Property, &__block_literal_global_16);
    }
    if (*(_BYTE *)(a1 + 11) || *(_QWORD *)(a1 + 48) % *(_QWORD *)(a1 + 64))
    {
      a1 = 0;
    }
    else
    {
      v7 = objc_initWeak(&location, (id)a1);
      v9 = objc_getProperty((id)a1, v8, 40, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__CRImageReaderTrackingSession__dispatchAtOCRFrameInterval___block_invoke_2;
      block[3] = &unk_1E98DA630;
      v10 = v9;
      objc_copyWeak(&v13, &location);
      v12 = v4;
      dispatch_async(v10, block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      a1 = 1;
    }
  }

  return a1;
}

- (uint64_t)_dispatchIfReady:(uint64_t)a1
{
  id v3;
  id v4;
  SEL v5;
  id Property;
  NSObject *v7;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v3 = a2;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 11))
    {
      a1 = 0;
    }
    else
    {
      v4 = objc_initWeak(&location, (id)a1);
      Property = objc_getProperty((id)a1, v5, 40, 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__CRImageReaderTrackingSession__dispatchIfReady___block_invoke;
      block[3] = &unk_1E98DA630;
      v7 = Property;
      objc_copyWeak(&v11, &location);
      v10 = v3;
      dispatch_async(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
      a1 = 1;
    }
  }

  return a1;
}

- (uint64_t)trackedRegionType
{
  unint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 32);
    objc_opt_self();
    if (v1 > 2)
      return 0;
    else
      return qword_1D513A848[v1];
  }
  return result;
}

- (float)applyOpticalFlowTrackingForFrame:(uint64_t)a1
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  double Current;
  double v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  __CVBuffer *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  float v59;
  unsigned int v60;
  float32x4_t v61;
  int8x16_t v62;
  int8x16_t v63;
  uint64_t v64;
  float v65;
  double v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  void *v80;
  id *v81;
  id v82;
  id v83;
  unint64_t v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  __CVBuffer *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t k;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t m;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  float v109;
  os_signpost_id_t v111;
  unint64_t v112;
  unint64_t v113;
  os_signpost_id_t v114;
  CRImageReaderTrackingResult *v115;
  os_signpost_id_t spid;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  id *location;
  void *v122;
  void *v123;
  void *v124;
  CRImageReaderTrackingResult *obj;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  __CVBuffer *texture;
  CVPixelBufferRef texturea;
  void *v133;
  void *v134;
  _QWORD v135[10];
  _QWORD v136[9];
  id v137;
  uint64_t *v138;
  uint64_t v139;
  float *v140;
  uint64_t v141;
  int v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;
  _BYTE v162[128];
  _BYTE v163[5];
  _OWORD v164[8];
  uint8_t v165[4];
  uint64_t v166;
  uint8_t buf[16];
  __int128 v168;
  __int128 v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v126 = a2;
  if (a1)
  {
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v3 = (id)CRSignpostLog_signPostOSLog;
    v4 = os_signpost_id_generate(v3);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v5 = (id)CRSignpostLog_signPostOSLog;
    v6 = v5;
    v113 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "OCRTrackingApplyOpticalFlowE2E", ", buf, 2u);
    }
    v114 = v4;

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v7 = (id)CRSignpostLog_signPostOSLog;
    v8 = os_signpost_id_generate(v7);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v9 = (id)CRSignpostLog_signPostOSLog;
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "OCRTrackingInputPrep", ", buf, 2u);
    }

    ++*(_QWORD *)(a1 + 56);
    Current = CFAbsoluteTimeGetCurrent();
    v12 = *(double *)(a1 + 72);
    *(CFAbsoluteTime *)(a1 + 72) = CFAbsoluteTimeGetCurrent();
    v13 = objc_msgSend(v126, "width");
    v14 = *(float *)(a1 + 20);
    v15 = objc_msgSend(v126, "height");
    v16 = (float)v13 / v14;
    v17 = (float)v15 / *(float *)(a1 + 20);
    if (((int)v16 & 1) != 0)
      v18 = v16 + 1.0;
    else
      v18 = v16;
    if (((int)v17 & 1) != 0)
      v19 = v17 + 1.0;
    else
      v19 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (*(_BYTE *)(a1 + 12))
        v20 = 1278226488;
      else
        v20 = 1111970369;
      texture = (__CVBuffer *)objc_msgSend(v126, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", buf, 1, v20, 1, 1, 1.0 / *(float *)(a1 + 20), v18, v19);
    }
    else
    {
      if (*(_BYTE *)(a1 + 12))
      {
        objc_msgSend(v126, "imageByConvertingToColorSpace:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (__CVBuffer *)objc_msgSend(v21, "pixelBufferWithScale:paddedToSize:", 1.0 / *(float *)(a1 + 20), v18, v19);

      }
      else
      {
        v22 = (__CVBuffer *)objc_msgSend(v126, "pixelBufferWithScale:paddedToSize:", 1.0 / *(float *)(a1 + 20), v18, v19);
      }
      texture = CRCreateIOSurfacePixelBufferFromPixelBuffer(v22);
      CVPixelBufferRelease(v22);
    }
    v23 = (void *)MEMORY[0x1E0C99DE8];
    v24 = *(void **)(a1 + 24);
    location = (id *)(a1 + 24);
    if (*(_BYTE *)(a1 + 8))
      objc_msgSend(v24, "regionTrackingGroups");
    else
      objc_msgSend(v24, "trackedRegions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v25, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v133 = (void *)objc_opt_new();
    v134 = (void *)objc_opt_new();
    if (*(_BYTE *)(a1 + 8))
    {
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      objc_msgSend(*location, "regionTrackingGroups");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v148, v163, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v149;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v149 != v29)
              objc_enumerationMutation(v27);
            v31 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
            objc_msgSend(v31, "vcQuad");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v33 = 1.0 / *(float *)(a1 + 20);
            objc_msgSend(v32, "quadAfterScaling:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "addObject:", v34);
            objc_msgSend(v134, "setObject:forKeyedSubscript:", v31, v34);

          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v148, v163, 16);
        }
        while (v28);
      }
    }
    else
    {
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      objc_msgSend(*location, "trackedRegions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v144, v162, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v145;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v145 != v36)
              objc_enumerationMutation(v27);
            v38 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * j);
            objc_msgSend(v38, "vcImageSpaceQuad");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v40 = 1.0 / *(float *)(a1 + 20);
            objc_msgSend(v39, "quadAfterScaling:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "addObject:", v41);
            objc_msgSend(v133, "setObject:forKeyedSubscript:", v38, v41);

          }
          v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v144, v162, 16);
        }
        while (v35);
      }
    }

    v117 = (void *)objc_msgSend(v26, "copy");
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v42 = (id)CRSignpostLog_signPostOSLog;
    v43 = v42;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v43, OS_SIGNPOST_INTERVAL_END, v8, "OCRTrackingInputPrep", ", buf, 2u);
    }

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v44 = (id)CRSignpostLog_signPostOSLog;
    v45 = os_signpost_id_generate(v44);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v46 = (id)CRSignpostLog_signPostOSLog;
    v47 = v46;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "OCRTrackingComputeHomographies", ", buf, 2u);
    }

    if (*(_BYTE *)(a1 + 10))
    {
      v160 = *MEMORY[0x1E0DC6DC0];
      v161 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v118 = (void *)MEMORY[0x1E0C9AA70];
    }
    v48 = (void *)MEMORY[0x1D826E7B0]();
    v49 = *(_QWORD *)(a1 + 96);
    v143 = 0;
    objc_msgSend(MEMORY[0x1E0DC6CE8], "computeHomographiesForQuadrilaterals:inFrame:session:options:error:", v117, texture, v49, v118, &v143);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v143;
    objc_autoreleasePoolPop(v48);
    if (texture != (__CVBuffer *)objc_msgSend(v126, "pixelBuffer"))
      CVPixelBufferRelease(texture);
    if (*(_BYTE *)(a1 + 10))
    {
      objc_msgSend(*(id *)(a1 + 96), "debuggingResult");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v50;

      objc_msgSend(*(id *)(a1 + 96), "debuggingMemoryResult");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v52;

    }
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v54 = (id)CRSignpostLog_signPostOSLog;
    v55 = v54;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v55, OS_SIGNPOST_INTERVAL_END, v45, "OCRTrackingComputeHomographies", ", buf, 2u);
    }

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v56 = (id)CRSignpostLog_signPostOSLog;
    spid = os_signpost_id_generate(v56);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v57 = (id)CRSignpostLog_signPostOSLog;
    v58 = v57;
    v111 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v58, OS_SIGNPOST_INTERVAL_BEGIN, spid, "OCRTrackingApplyHomographies", ", buf, 2u);
    }

    obj = -[CRImageReaderTrackingResult initWithTrackingLevel:]([CRImageReaderTrackingResult alloc], "initWithTrackingLevel:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 96), "sceneHomography");
    v61.i64[0] = __PAIR64__(v60, v62.u32[1]);
    v62.i32[0] = v62.i32[2];
    v61.i64[1] = __PAIR64__(v63.u32[0], v62.u32[2]);
    v62.i64[0] = vextq_s8(v63, v62, 4uLL).u64[0];
    v62.i64[1] = v64;
    if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_f32(v61), (int16x8_t)vceqzq_f32((float32x4_t)v62))))) & 1) != 0|| v59 != 0.0)
    {
      objc_msgSend(*(id *)(a1 + 96), "sceneHomography", v111);
      *(float *)&v66 = v65;
      if (v65 != 0.0)
      {
        objc_msgSend(*(id *)(a1 + 96), "sceneHomography", v66);
        v70 = 0;
        v71 = *(_OWORD *)(a1 + 224);
        v72 = *(_OWORD *)(a1 + 240);
        v164[0] = *(_OWORD *)(a1 + 208);
        v164[1] = v71;
        v164[2] = v72;
        do
        {
          *(float32x4_t *)&buf[v70 * 16] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v67, COERCE_FLOAT(v164[v70])), v68, *(float32x2_t *)&v164[v70], 1), v69, (float32x4_t)v164[v70], 2);
          ++v70;
        }
        while (v70 != 3);
        v73 = *(_QWORD *)buf;
        v74 = v168;
        v75 = v169;
        *(_DWORD *)(a1 + 216) = *(_DWORD *)&buf[8];
        *(_DWORD *)(a1 + 232) = DWORD2(v74);
        *(_QWORD *)(a1 + 208) = v73;
        *(_QWORD *)(a1 + 224) = v74;
        *(_DWORD *)(a1 + 248) = DWORD2(v75);
        *(_QWORD *)(a1 + 240) = v75;
        *(float *)&v73 = 1.0 / *((float *)&v75 + 2);
        v76 = *(float32x4_t *)(a1 + 240);
        v77 = vmulq_n_f32(*(float32x4_t *)(a1 + 208), 1.0 / *((float *)&v75 + 2));
        v78 = vmulq_n_f32(*(float32x4_t *)(a1 + 224), 1.0 / *((float *)&v75 + 2));
        *(_DWORD *)(a1 + 216) = v77.i32[2];
        *(_DWORD *)(a1 + 232) = v78.i32[2];
        *(_QWORD *)(a1 + 208) = v77.i64[0];
        *(_QWORD *)(a1 + 224) = v78.i64[0];
        v79 = vmulq_n_f32(v76, *(float *)&v73);
        *(_DWORD *)(a1 + 248) = v79.i32[2];
        *(_QWORD *)(a1 + 240) = v79.i64[0];
      }
    }
    v80 = (void *)objc_opt_new();
    v120 = v80;
    v122 = (void *)objc_opt_new();
    v123 = (void *)objc_opt_new();
    v124 = (void *)objc_opt_new();
    v139 = 0;
    v140 = (float *)&v139;
    v141 = 0x2020000000;
    v142 = 0;
    if (*(_BYTE *)(a1 + 8))
    {
      v136[0] = MEMORY[0x1E0C809B0];
      v136[1] = 3221225472;
      v136[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke;
      v136[3] = &unk_1E98DA5B8;
      v81 = (id *)v136;
      v82 = v134;
      v138 = &v139;
      v136[4] = v82;
      v136[5] = a1;
      v136[6] = v124;
      v136[7] = v122;
      v136[8] = v123;
      v137 = v80;
      objc_msgSend(v127, "enumerateKeysAndObjectsUsingBlock:", v136);

    }
    else
    {
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_3;
      v135[3] = &unk_1E98DA608;
      v81 = (id *)v135;
      v83 = v133;
      v135[9] = &v139;
      v135[4] = v83;
      v135[5] = a1;
      v135[6] = v124;
      v135[7] = v80;
      v135[8] = v123;
      objc_msgSend(v127, "enumerateKeysAndObjectsUsingBlock:", v135);
    }

    -[CRImageReaderTrackingResult setTrackedRegions:](obj, "setTrackedRegions:", v80);
    -[CRImageReaderTrackingResult setRemovedRegionIDs:](obj, "setRemovedRegionIDs:", v124);
    -[CRImageReaderTrackingResult setUpdatedRegionIDs:](obj, "setUpdatedRegionIDs:", v123);
    -[CRImageReaderTrackingResult setRegionTrackingGroups:](obj, "setRegionTrackingGroups:", v122);
    v84 = *(_QWORD *)(a1 + 56);
    *(float *)&v85 = (float)v84;
    if (v84 >= 8)
      *(float *)&v85 = 7.5;
    -[CRImageReaderTrackingResult markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:ransacReprojError:markedQuadArea:](obj, "markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:ransacReprojError:markedQuadArea:", 0, v85, *(double *)(a1 + 80), v111);
    objc_msgSend(v126, "sceneStabilityMetric");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "updateOCRUpdateModeWithStability:frameDuration:", v86, Current - v12);

    if (*(_BYTE *)(a1 + 8) && (unint64_t)(*(_QWORD *)(a1 + 136) - 1) >= 2)
    {
      v115 = obj;
      -[CRImageReaderTrackingResult regionTrackingGroups](v115, "regionTrackingGroups");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = (void *)objc_msgSend(v87, "mutableCopy");

      -[CRImageReaderTrackingResult trackedRegions](v115, "trackedRegions");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = (void *)objc_msgSend(v88, "mutableCopy");

      -[CRImageReaderTrackingResult trackedRegions](v115, "trackedRegions");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = (void *)objc_msgSend(v90, "mutableCopy");

      -[CRImageReaderTrackingResult removedRegionIDs](v115, "removedRegionIDs");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = (void *)objc_msgSend(v91, "mutableCopy");

      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      -[CRImageReaderTrackingResult regionTrackingGroups](v115, "regionTrackingGroups");
      v92 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      texturea = v92;
      v93 = -[__CVBuffer countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v156, buf, 16);
      if (v93)
      {
        v94 = *(_QWORD *)v157;
        do
        {
          for (k = 0; k != v93; ++k)
          {
            if (*(_QWORD *)v157 != v94)
              objc_enumerationMutation(texturea);
            v96 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * k);
            if (objc_msgSend(v96, "trackNeedsReplacement"))
            {
              objc_msgSend(v128, "removeObject:", v96);
              CROSLogForCategory(1);
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                v98 = *(_QWORD *)(a1 + 48);
                *(_DWORD *)v165 = 134217984;
                v166 = v98;
                _os_log_impl(&dword_1D4FB8000, v97, OS_LOG_TYPE_DEFAULT, "Replaced a group due to ransac (frame %ld)", v165, 0xCu);
              }

              objc_msgSend(v96, "trackingID");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "removeObject:", v99);

              objc_msgSend(v96, "trackingID");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "addObject:", v100);

              v154 = 0u;
              v155 = 0u;
              v152 = 0u;
              v153 = 0u;
              objc_msgSend(v96, "children");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v152, v164, 16);
              if (v102)
              {
                v103 = *(_QWORD *)v153;
                do
                {
                  for (m = 0; m != v102; ++m)
                  {
                    if (*(_QWORD *)v153 != v103)
                      objc_enumerationMutation(v101);
                    objc_msgSend(v89, "removeObject:", *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * m));
                  }
                  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v152, v164, 16);
                }
                while (v102);
              }

            }
          }
          v92 = texturea;
          v93 = -[__CVBuffer countByEnumeratingWithState:objects:count:](texturea, "countByEnumeratingWithState:objects:count:", &v156, buf, 16);
        }
        while (v93);
      }

      -[CRImageReaderTrackingResult setTrackedRegions:](v115, "setTrackedRegions:", v89);
      -[CRImageReaderTrackingResult setRegionTrackingGroups:](v115, "setRegionTrackingGroups:", v128);
      -[CRImageReaderTrackingResult setUpdatedRegionIDs:](v115, "setUpdatedRegionIDs:", v129);
      -[CRImageReaderTrackingResult setRemovedRegionIDs:](v115, "setRemovedRegionIDs:", v130);

    }
    objc_storeStrong(location, obj);
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v105 = (id)CRSignpostLog_signPostOSLog;
    v106 = v105;
    if (v112 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v106, OS_SIGNPOST_INTERVAL_END, spid, "OCRTrackingApplyHomographies", ", buf, 2u);
    }

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v107 = (id)CRSignpostLog_signPostOSLog;
    v108 = v107;
    if (v113 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v108, OS_SIGNPOST_INTERVAL_END, v114, "OCRTrackingApplyOpticalFlowE2E", ", buf, 2u);
    }

    v109 = v140[6];
    _Block_object_dispose(&v139, 8);

  }
  else
  {
    v109 = 0.0;
  }

  return v109;
}

void __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  id v15;
  id v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reprojectionError");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v8;
  if (v6)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    objc_msgSend(v7, "boundingQuad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "denormalizedQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "warpTransform");
    v35 = v12;
    v36 = v11;
    v34 = v13;
    v14 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 20);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_2;
    v41[3] = &unk_1E98DA590;
    v44 = &v45;
    v15 = v10;
    v42 = v15;
    v16 = v7;
    v43 = v16;
    LODWORD(v17) = v14;
    objc_msgSend(v16, "applyHomographyTransform:downscaleRate:shouldApply:", v41, *(double *)&v36, *(double *)&v35, *(double *)&v34, v17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "groupID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHomographyGroupID:", v18);

    v19 = objc_msgSend(v6, "groupID");
    objc_msgSend(v16, "vcQuad");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHomographyGroupID:", v19);

    if (*((_BYTE *)v46 + 24))
    {
      objc_msgSend(v15, "area");
      *(double *)(*(_QWORD *)(a1 + 40) + 80) = v21 + *(double *)(*(_QWORD *)(a1 + 40) + 80);
      v22 = *(void **)(a1 + 48);
      objc_msgSend(v16, "trackingID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v23);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);
      v29 = *(void **)(a1 + 64);
      objc_msgSend(v16, "trackingID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v30);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v16, "children");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v38 != v32)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(a1 + 72), "addObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v34, v35, v36);
          }
          v31 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v31);
      }
    }

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    objc_msgSend(v7, "boundingQuad");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "denormalizedQuad");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "area");
    *(double *)(*(_QWORD *)(a1 + 40) + 80) = v26 + *(double *)(*(_QWORD *)(a1 + 40) + 80);

    v27 = *(void **)(a1 + 48);
    objc_msgSend(v7, "trackingID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

  }
}

BOOL __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  v7 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[CRTrackingFilter shouldFilterHomographyWithResultQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldFilterHomographyWithResultQuad:originalQuad:imageSize:", v7, *(_QWORD *)(a1 + 32), a3, a4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "originalBoundingQuad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "denormalizedQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[CRTrackingFilter shouldEdgeIntersectionFilterQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldEdgeIntersectionFilterQuad:originalQuad:imageSize:", v7, v10, a3, a4);

    v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;
  }

  return v8;
}

void __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  int v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reprojectionError");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
  if (v6)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    objc_msgSend(v7, "boundingQuad");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "denormalizedQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "warpTransform");
    v22 = v12;
    v23 = v11;
    v21 = v13;
    v14 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 20);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_4;
    v24[3] = &unk_1E98DA5E0;
    v26 = &v27;
    v15 = v10;
    v25 = v15;
    LODWORD(v16) = v14;
    objc_msgSend(v7, "applyHomographyTransform:downscaleRate:shouldApply:", v24, v23, v22, v21, v16);
    objc_msgSend(v7, "setSignificantTranscriptChange:", 0);
    if (*((_BYTE *)v28 + 24))
    {
      v17 = *(void **)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
      v17 = *(void **)(a1 + 64);
    }
    objc_msgSend(v7, "trackingID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v19 = *(void **)(a1 + 48);
    objc_msgSend(v7, "trackingID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
}

BOOL __65__CRImageReaderTrackingSession_applyOpticalFlowTrackingForFrame___block_invoke_4(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  _BOOL8 v8;

  v7 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[CRTrackingFilter shouldFilterHomographyWithResultQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldFilterHomographyWithResultQuad:originalQuad:imageSize:", v7, *(_QWORD *)(a1 + 32), a3, a4);
  v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;

  return v8;
}

- (void)updateOCRUpdateModeWithStability:(id)a3 frameDuration:(double)a4
{
  void *v4;
  id v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double Current;
  double lastFrameTime;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  NSObject *v33;
  unint64_t frameCount;
  double v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode");
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    if (v9 < 0.976)
    {
      v10 = 0;
LABEL_26:
      -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", v10);
      goto LABEL_27;
    }
  }
  if (self && a4 > 0.100000001 && self->_frameCount)
  {
    v11 = 4;
LABEL_8:
    -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", v11);
    goto LABEL_27;
  }
  if (v7 && (objc_msgSend(v7, "doubleValue"), v12 > 0.984))
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (self)
      lastFrameTime = self->_lastFrameTime;
    else
      lastFrameTime = 0.0;
    -[CRImageReaderTrackingSession lowFrequencyOCRElapsedTimeAboveMinimumStability](self, "lowFrequencyOCRElapsedTimeAboveMinimumStability");
    -[CRImageReaderTrackingSession setLowFrequencyOCRElapsedTimeAboveMinimumStability:](self, "setLowFrequencyOCRElapsedTimeAboveMinimumStability:", v15 + Current - lastFrameTime);
    objc_msgSend(v7, "doubleValue");
    if (v16 > 0.988)
    {
      -[CRImageReaderTrackingSession lowFrequencyOCRElapsedTimeAboveMinimumStability](self, "lowFrequencyOCRElapsedTimeAboveMinimumStability");
      if (v17 > 1.0)
        -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", 4);
    }
  }
  else
  {
    -[CRImageReaderTrackingSession setLowFrequencyOCRElapsedTimeAboveMinimumStability:](self, "setLowFrequencyOCRElapsedTimeAboveMinimumStability:", 0.0);
  }
  if (v8 == -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode")
    || -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode") == 4)
  {
    -[CRImageReaderTrackingSession lowFrequencyOCRElapsedTimeAboveMinimumStability](self, "lowFrequencyOCRElapsedTimeAboveMinimumStability");
    if (v18 == 0.0)
    {
      if (!v7 || (objc_msgSend(v7, "doubleValue"), v19 <= 0.978))
      {
        v10 = 1;
        goto LABEL_26;
      }
      -[CRImageReaderTrackingSession latestResult](self, "latestResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trackedRegions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        v21 = self->_replacedQuadArea / self->_totalQuadArea;

        if (v21 <= 0.2)
        {
          v11 = 2;
          goto LABEL_8;
        }
      }
      else
      {

      }
      if (self->_replacedQuadArea / self->_totalQuadArea > 0.2)
      {
        CROSLogForCategory(1);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          frameCount = self->_frameCount;
          v35 = self->_replacedQuadArea / self->_totalQuadArea;
          v36 = 134218240;
          v37 = frameCount;
          v38 = 2048;
          v39 = v35;
          _os_log_impl(&dword_1D4FB8000, v33, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: switching to as fast as possible: (frame %ld, replaced area ratio %f)", (uint8_t *)&v36, 0x16u);
        }

      }
      v11 = 1;
      goto LABEL_8;
    }
  }
LABEL_27:
  if (v8 != -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode"))
  {
    CROSLogForCategory(1);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode");
      if (self)
        v24 = self->_frameCount;
      else
        v24 = 0;
      v36 = 134218754;
      v37 = v8;
      v38 = 2048;
      v39 = *(double *)&v23;
      v40 = 2048;
      v41 = v24;
      v42 = 2112;
      v43 = v7;
      _os_log_impl(&dword_1D4FB8000, v22, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: %ld -> %ld (frame %ld, scene %@)", (uint8_t *)&v36, 0x2Au);
    }

  }
  if (-[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode") == 1)
  {
    v25 = CFAbsoluteTimeGetCurrent();
    if (self->_ocrDispatchTimestamps.c.__size_.__value_ >= 5
      && (*(double **)((char *)self->_ocrDispatchTimestamps.c.__map_.__begin_
                     + ((self->_ocrDispatchTimestamps.c.__start_ >> 6) & 0x3FFFFFFFFFFFFF8)))[self->_ocrDispatchTimestamps.c.__start_ & 0x1FF] > v25 + -5.0)
    {
      -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", 2);
      CROSLogForCategory(1);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode");
        v36 = 134217984;
        v37 = v27;
        _os_log_impl(&dword_1D4FB8000, v26, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: [KILL SWITCH] %lu", (uint8_t *)&v36, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = -[NSObject thermalState](v28, "thermalState") > 1;

  if (v29
    && -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode") <= 2
    && -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode"))
  {
    -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", 3);
    CROSLogForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode");
      v36 = 134217984;
      v37 = v30;
      _os_log_impl(&dword_1D4FB8000, v28, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: [THERMAL PRESSURE OVERRIDE] %lu", (uint8_t *)&v36, 0xCu);
    }

  }
  if (qword_1ED0B43D0 != -1)
    dispatch_once(&qword_1ED0B43D0, &__block_literal_global_8);
  if (_MergedGlobals_12)
  {
    v28 = -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode");
    if (v28 != objc_msgSend((id)_MergedGlobals_12, "unsignedIntegerValue"))
    {
      if (-[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode"))
      {
        CROSLogForCategory(1);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 138412290;
          v37 = _MergedGlobals_12;
          _os_log_impl(&dword_1D4FB8000, v28, OS_LOG_TYPE_DEFAULT, "OCR Update Mode: [DEFAULTS OVERRIDE] %@", (uint8_t *)&v36, 0xCu);
        }

        -[CRImageReaderTrackingSession setOcrUpdateMode:](self, "setOcrUpdateMode:", objc_msgSend((id)_MergedGlobals_12, "unsignedIntegerValue"));
      }
    }
  }
  v31 = -[CRImageReaderTrackingSession ocrUpdateMode](self, "ocrUpdateMode");
  if (v31)
  {
    v32 = 0;
    if (!self)
      goto LABEL_56;
    goto LABEL_55;
  }
  -[CRImageReaderTrackingSession latestResult](self, "latestResult");
  v28 = objc_claimAutoreleasedReturnValue();
  -[NSObject trackedRegions](v28, "trackedRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v4, "count") == 0;
  if (self)
LABEL_55:
    self->_wasLastFrameUnstableForFirstAcquisition = v32;
LABEL_56:
  if (!v31)
  {

  }
}

void __79__CRImageReaderTrackingSession_updateOCRUpdateModeWithStability_frameDuration___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.CoreRecognition.tracking_ocr_update_mode_override"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v0;

}

- (uint64_t)shouldRunOCROnCurrentFrame
{
  double *v1;
  double Current;
  double v3;
  uint64_t v4;
  double v5;

  if (result)
  {
    v1 = (double *)result;
    if (*(_QWORD *)(result + 64))
    {
      return 1;
    }
    else
    {
      Current = CFAbsoluteTimeGetCurrent();
      v3 = v1[15];
      v4 = objc_msgSend(v1, "ocrUpdateMode");
      result = 1;
      switch(v4)
      {
        case 0:
          return 0;
        case 2:
          v5 = 1.5;
          goto LABEL_9;
        case 3:
          v5 = 2.0;
          goto LABEL_9;
        case 4:
          v5 = 3.0;
LABEL_9:
          result = Current - v3 > v5;
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

- (void)prepareSessionForOCRDispatch
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  char *v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  char *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  int64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  void **v37;
  void *v38;
  void *v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  void **v67;
  void **v68;
  uint64_t v69;
  uint64_t v70;
  void **v71;
  void *v72;
  void *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  int64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t k;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  void *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  *(CFAbsoluteTime *)(a1 + 120) = CFAbsoluteTimeGetCurrent();
  v2 = MEMORY[0x1E0C83FE8];
  v3 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)(a1 + 208) = *MEMORY[0x1E0C83FE8];
  *(_OWORD *)(a1 + 224) = v3;
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(v2 + 32);
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  objc_msgSend(*(id *)(a1 + 24), "trackedRegions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v124 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "updatePreviousAssociationQuad");
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
    }
    while (v5);
  }

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  objc_msgSend(*(id *)(a1 + 24), "regionTrackingGroups", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v120;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v120 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * j), "updatePreviousAssociationQuad");
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
    }
    while (v9);
  }

  v12 = *(char **)(a1 + 168);
  v13 = *(void ***)(a1 + 160);
  v14 = v12 - (char *)v13;
  if (v12 == (char *)v13)
    v15 = 0;
  else
    v15 = ((v12 - (char *)v13) << 6) - 1;
  v16 = *(_QWORD *)(a1 + 184);
  v17 = *(_QWORD *)(a1 + 192);
  v18 = v17 + v16;
  if (v15 == v17 + v16)
  {
    v19 = v16 >= 0x200;
    v20 = v16 - 512;
    if (v19)
    {
      *(_QWORD *)(a1 + 184) = v20;
      v23 = *v13;
      v21 = (char *)(v13 + 1);
      v22 = v23;
      *(_QWORD *)(a1 + 160) = v21;
      if (v12 == *(char **)(a1 + 176))
      {
        v24 = *(_QWORD *)(a1 + 152);
        v25 = (uint64_t)&v21[-v24];
        if ((unint64_t)v21 <= v24)
        {
          v51 = (uint64_t)&v12[-v24];
          v50 = v51 == 0;
          v52 = v51 >> 2;
          if (v50)
            v53 = 1;
          else
            v53 = v52;
          v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v53);
          v56 = &v54[8 * (v53 >> 2)];
          v57 = *(uint64_t **)(a1 + 160);
          v12 = v56;
          v58 = *(_QWORD *)(a1 + 168) - (_QWORD)v57;
          if (v58)
          {
            v12 = &v56[v58 & 0xFFFFFFFFFFFFFFF8];
            v59 = 8 * (v58 >> 3);
            v60 = &v54[8 * (v53 >> 2)];
            do
            {
              v61 = *v57++;
              *(_QWORD *)v60 = v61;
              v60 += 8;
              v59 -= 8;
            }
            while (v59);
          }
          v62 = *(void **)(a1 + 152);
          *(_QWORD *)(a1 + 152) = v54;
          *(_QWORD *)(a1 + 160) = v56;
          *(_QWORD *)(a1 + 168) = v12;
          *(_QWORD *)(a1 + 176) = &v54[8 * v55];
          if (v62)
          {
            operator delete(v62);
            v12 = *(char **)(a1 + 168);
          }
        }
        else
        {
          v26 = v25 >> 3;
          v27 = v25 >> 3 < -1;
          v28 = (v25 >> 3) + 2;
          if (v27)
            v29 = v28;
          else
            v29 = v26 + 1;
          v30 = -(v29 >> 1);
          v31 = v29 >> 1;
          v32 = &v21[-8 * v31];
          v33 = v12 - v21;
          if (v12 != v21)
          {
            memmove(&v21[-8 * v31], v21, v12 - v21);
            v12 = *(char **)(a1 + 160);
          }
          v34 = &v12[8 * v30];
          v12 = &v32[v33];
          *(_QWORD *)(a1 + 160) = v34;
          *(_QWORD *)(a1 + 168) = &v32[v33];
        }
      }
      *(_QWORD *)v12 = v22;
    }
    else
    {
      v35 = v14 >> 3;
      v36 = *(char **)(a1 + 176);
      v37 = *(void ***)(a1 + 152);
      if (v14 >> 3 >= (unint64_t)((v36 - (char *)v37) >> 3))
      {
        if (v36 == (char *)v37)
          v40 = 1;
        else
          v40 = (v36 - (char *)v37) >> 2;
        v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v40);
        v43 = v42;
        v44 = operator new(0x1000uLL);
        v45 = &v41[8 * v35];
        v46 = &v41[8 * v43];
        if (v35 == v43)
        {
          v47 = 8 * v35;
          if (v14 < 1)
          {
            v86 = v47 >> 2;
            if (v12 == (char *)v13)
              v87 = 1;
            else
              v87 = v86;
            v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v87);
            v45 = &v88[8 * (v87 >> 2)];
            v46 = &v88[8 * v89];
            if (v41)
              operator delete(v41);
            v41 = v88;
          }
          else
          {
            v48 = v47 >> 3;
            if (v48 >= -1)
              v49 = v48 + 1;
            else
              v49 = v48 + 2;
            v45 -= 8 * (v49 >> 1);
          }
        }
        *(_QWORD *)v45 = v44;
        v90 = v45 + 8;
        for (k = *(_QWORD *)(a1 + 168); k != *(_QWORD *)(a1 + 160); k -= 8)
        {
          if (v45 == v41)
          {
            if (v90 >= v46)
            {
              if (v46 == v41)
                v96 = 1;
              else
                v96 = (v46 - v41) >> 2;
              v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v96);
              v99 = v97;
              v45 = &v97[(2 * v96 + 6) & 0xFFFFFFFFFFFFFFF8];
              v100 = v90 - v41;
              v50 = v90 == v41;
              v90 = v45;
              if (!v50)
              {
                v90 = &v45[v100 & 0xFFFFFFFFFFFFFFF8];
                v101 = 8 * (v100 >> 3);
                v102 = v45;
                v103 = (uint64_t *)v41;
                do
                {
                  v104 = *v103++;
                  *(_QWORD *)v102 = v104;
                  v102 += 8;
                  v101 -= 8;
                }
                while (v101);
              }
              v46 = &v97[8 * v98];
              if (v41)
                operator delete(v41);
              v41 = v99;
            }
            else
            {
              v92 = (v46 - v90) >> 3;
              if (v92 >= -1)
                v93 = v92 + 1;
              else
                v93 = v92 + 2;
              v94 = v93 >> 1;
              v45 = &v41[8 * (v93 >> 1)];
              v95 = v41;
              if (v90 != v41)
              {
                memmove(v45, v41, v90 - v41);
                v95 = v90;
              }
              v90 = &v95[8 * v94];
            }
          }
          v105 = *(_QWORD *)(k - 8);
          *((_QWORD *)v45 - 1) = v105;
          v45 -= 8;
        }
        v106 = *(void **)(a1 + 152);
        *(_QWORD *)(a1 + 152) = v41;
        *(_QWORD *)(a1 + 160) = v45;
        *(_QWORD *)(a1 + 168) = v90;
        *(_QWORD *)(a1 + 176) = v46;
        if (v106)
          operator delete(v106);
        goto LABEL_52;
      }
      v38 = operator new(0x1000uLL);
      v39 = v38;
      if (v36 == v12)
      {
        if (v13 == v37)
        {
          if (v12 == (char *)v13)
            v64 = 1;
          else
            v64 = (v36 - (char *)v13) >> 2;
          v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v64);
          v13 = (void **)&v65[8 * ((v64 + 3) >> 2)];
          v67 = *(void ***)(a1 + 160);
          v68 = v13;
          v69 = *(_QWORD *)(a1 + 168) - (_QWORD)v67;
          if (v69)
          {
            v68 = (void **)((char *)v13 + (v69 & 0xFFFFFFFFFFFFFFF8));
            v70 = 8 * (v69 >> 3);
            v71 = v13;
            do
            {
              v72 = *v67++;
              *v71++ = v72;
              v70 -= 8;
            }
            while (v70);
          }
          v73 = *(void **)(a1 + 152);
          *(_QWORD *)(a1 + 152) = v65;
          *(_QWORD *)(a1 + 160) = v13;
          *(_QWORD *)(a1 + 168) = v68;
          *(_QWORD *)(a1 + 176) = &v65[8 * v66];
          if (v73)
          {
            operator delete(v73);
            v13 = *(void ***)(a1 + 160);
          }
        }
        *(v13 - 1) = v39;
        v74 = *(char **)(a1 + 160);
        v75 = *(char **)(a1 + 168);
        *(_QWORD *)(a1 + 160) = v74 - 8;
        v76 = *((_QWORD *)v74 - 1);
        *(_QWORD *)(a1 + 160) = v74;
        if (v75 == *(char **)(a1 + 176))
        {
          v77 = *(_QWORD *)(a1 + 152);
          v78 = (uint64_t)&v74[-v77];
          if ((unint64_t)v74 <= v77)
          {
            v107 = (uint64_t)&v75[-v77];
            v50 = v107 == 0;
            v108 = v107 >> 2;
            if (v50)
              v109 = 1;
            else
              v109 = v108;
            v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v109);
            v112 = &v110[8 * (v109 >> 2)];
            v113 = *(uint64_t **)(a1 + 160);
            v75 = v112;
            v114 = *(_QWORD *)(a1 + 168) - (_QWORD)v113;
            if (v114)
            {
              v75 = &v112[v114 & 0xFFFFFFFFFFFFFFF8];
              v115 = 8 * (v114 >> 3);
              v116 = &v110[8 * (v109 >> 2)];
              do
              {
                v117 = *v113++;
                *(_QWORD *)v116 = v117;
                v116 += 8;
                v115 -= 8;
              }
              while (v115);
            }
            v118 = *(void **)(a1 + 152);
            *(_QWORD *)(a1 + 152) = v110;
            *(_QWORD *)(a1 + 160) = v112;
            *(_QWORD *)(a1 + 168) = v75;
            *(_QWORD *)(a1 + 176) = &v110[8 * v111];
            if (v118)
            {
              operator delete(v118);
              v75 = *(char **)(a1 + 168);
            }
          }
          else
          {
            v79 = v78 >> 3;
            v27 = v78 >> 3 < -1;
            v80 = (v78 >> 3) + 2;
            if (v27)
              v81 = v80;
            else
              v81 = v79 + 1;
            v82 = -(v81 >> 1);
            v83 = v81 >> 1;
            v84 = &v74[-8 * v83];
            v85 = v75 - v74;
            if (v75 != v74)
            {
              memmove(&v74[-8 * v83], v74, v75 - v74);
              v74 = *(char **)(a1 + 160);
            }
            v75 = &v84[v85];
            *(_QWORD *)(a1 + 160) = &v74[8 * v82];
            *(_QWORD *)(a1 + 168) = &v84[v85];
          }
        }
        *(_QWORD *)v75 = v76;
      }
      else
      {
        *(_QWORD *)v12 = v38;
      }
    }
    *(_QWORD *)(a1 + 168) += 8;
LABEL_52:
    v13 = *(void ***)(a1 + 160);
    v16 = *(_QWORD *)(a1 + 184);
    v17 = *(_QWORD *)(a1 + 192);
    v18 = v16 + v17;
  }
  (*(_QWORD **)((char *)v13 + ((v18 >> 6) & 0x3FFFFFFFFFFFFF8)))[v18 & 0x1FF] = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 192) = v17 + 1;
  if ((unint64_t)(v17 + 1) >= 6)
  {
    v63 = v16 + 1;
    *(_QWORD *)(a1 + 184) = v63;
    *(_QWORD *)(a1 + 192) = v17;
    if (v63 >= 0x400)
    {
      operator delete(*v13);
      *(_QWORD *)(a1 + 160) += 8;
      *(_QWORD *)(a1 + 184) -= 512;
    }
  }
}

- (void)saveQuadsAfterAssociation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "trackedRegions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v19 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "updateBoundingQuadAfterOCR");
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v3);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "regionTrackingGroups", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (j = 0; j != v7; ++j)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * j);
          objc_msgSend(v10, "updateBoundingQuadAfterOCR");
          objc_msgSend(v10, "boundingQuad");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "denormalizedQuad");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "area");
          *(double *)(a1 + 88) = v13 + *(double *)(a1 + 88);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v7);
    }

    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 56) = 0;
  }
}

void __49__CRImageReaderTrackingSession__dispatchIfReady___block_invoke(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    WeakRetained[11] = 1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_loadWeakRetained(v2);
  if (v4)
    v4[11] = 0;

}

void __60__CRImageReaderTrackingSession__dispatchAtOCRFrameInterval___block_invoke_2(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  _BYTE *v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    WeakRetained[11] = 1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_loadWeakRetained(v2);
  if (v4)
    v4[11] = 0;

}

- (BOOL)usesGroupedRegions
{
  return self->_usesGroupedRegions;
}

- (CRImageReaderTrackingResult)latestResult
{
  return (CRImageReaderTrackingResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLatestResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)wasLatestFrameUnstableForFirstAcquisition
{
  return self->_wasLatestFrameUnstableForFirstAcquisition;
}

- (BOOL)shouldIncludeLinesInTrackingResult
{
  return self->_shouldIncludeLinesInTrackingResult;
}

- (void)setShouldIncludeLinesInTrackingResult:(BOOL)a3
{
  self->_shouldIncludeLinesInTrackingResult = a3;
}

- (BOOL)didDispatchOCROnFrame
{
  return self->_didDispatchOCROnFrame;
}

- (void)setDidDispatchOCROnFrame:(BOOL)a3
{
  self->_didDispatchOCROnFrame = a3;
}

- (BOOL)didRunAssociationOnFrame
{
  return self->_didRunAssociationOnFrame;
}

- (void)setDidRunAssociationOnFrame:(BOOL)a3
{
  self->_didRunAssociationOnFrame = a3;
}

- (unint64_t)ocrUpdateMode
{
  return self->_ocrUpdateMode;
}

- (void)setOcrUpdateMode:(unint64_t)a3
{
  self->_ocrUpdateMode = a3;
}

- (double)lowFrequencyOCRElapsedTimeAboveMinimumStability
{
  return self->_lowFrequencyOCRElapsedTimeAboveMinimumStability;
}

- (void)setLowFrequencyOCRElapsedTimeAboveMinimumStability:(double)a3
{
  self->_lowFrequencyOCRElapsedTimeAboveMinimumStability = a3;
}

- (void).cxx_destruct
{
  double **begin;
  double **end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  double **v9;
  double **v10;
  double **first;

  begin = self->_ocrDispatchTimestamps.c.__map_.__begin_;
  end = self->_ocrDispatchTimestamps.c.__map_.__end_;
  self->_ocrDispatchTimestamps.c.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_ocrDispatchTimestamps.c.__map_.__end_;
      begin = self->_ocrDispatchTimestamps.c.__map_.__begin_ + 1;
      self->_ocrDispatchTimestamps.c.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 256;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 512;
LABEL_7:
    self->_ocrDispatchTimestamps.c.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_ocrDispatchTimestamps.c.__map_.__begin_;
    v9 = self->_ocrDispatchTimestamps.c.__map_.__end_;
    if (v9 != v10)
      self->_ocrDispatchTimestamps.c.__map_.__end_ = (double **)((char *)v9
                                                               + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_ocrDispatchTimestamps.c.__map_.__first_;
  if (first)
    operator delete(first);
  objc_storeStrong((id *)&self->_debuggingMemoryResult, 0);
  objc_storeStrong((id *)&self->_debuggingResult, 0);
  objc_storeStrong((id *)&self->_optFlowSession, 0);
  objc_storeStrong((id *)&self->_ocrQueue, 0);
  objc_storeStrong((id *)&self->_latestResult, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  return self;
}

@end
