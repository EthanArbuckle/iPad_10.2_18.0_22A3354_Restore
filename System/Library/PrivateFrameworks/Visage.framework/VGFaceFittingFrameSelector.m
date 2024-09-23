@implementation VGFaceFittingFrameSelector

- (id)allPoseSelectors
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[VGFaceFittingFrameSelector neutralSelectors](self, "neutralSelectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[VGFaceFittingFrameSelector expressionSelectors](self, "expressionSelectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (id)neutralSelectors
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = v3;
  if (self->_poseSelector)
    objc_msgSend(v3, "addObject:");
  return v4;
}

- (id)expressionSelectors
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableDictionary count](self->_expressionsSelector, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_expressionsSelector;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_expressionsSelector, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

+ (vector<float)getFaceKitTrackedLandmarks:()(ext_vector_type(2
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> v15;
  uint8_t v16[16];

  v4 = v3;
  v5 = a3;
  VGLogVGFaceFittingFrameSelector();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetFaceKitTrackedLandmarks", (const char *)&unk_249D51699, v16, 2u);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("smooth_data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("geometry"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("landmarks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "bytes");
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(v4, v10 >> 3);
  if (v10 >= 8)
  {
    v13 = 0;
    if (v10 >> 3 <= 1)
      v14 = 1;
    else
      v14 = v10 >> 3;
    do
    {
      *(_QWORD *)(*v4 + 8 * v13) = *(_QWORD *)(v12 + 8 * v13);
      ++v13;
    }
    while (v14 != v13);
  }

  __57__VGFaceFittingFrameSelector_getFaceKitTrackedLandmarks___block_invoke();
  return v15;
}

void __57__VGFaceFittingFrameSelector_getFaceKitTrackedLandmarks___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFaceFittingFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetFaceKitTrackedLandmarks", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (void)checkDistanceFilter:(float32x4_t)a3@<Q3> frameTimestampMS:
{
  NSObject *v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  uint64_t v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  uint8_t buf[16];

  VGLogVGFaceFittingFrameSelector();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CheckDistanceFilter", (const char *)&unk_249D51699, buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "useSimpleSelector"))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 48), "distanceFilterCloseThreshold");
  v6 = vmuls_lane_f32(0.1, a3, 2);
  v7 = *(void **)(a1 + 48);
  if (v6 < v8)
  {
    objc_msgSend(v7, "distanceFilterCloseThreshold");
    v10 = v9;
    *(_DWORD *)a2 = 26;
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "distanceFilterCloseThreshold");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("face too close: %g cm < %g cm"), v6, v12);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    *(_QWORD *)(a2 + 8) = v13;
    *(_DWORD *)(a2 + 16) = 0;
    *(float *)(a2 + 20) = vabds_f32(v6, v10);
    *(_QWORD *)(a2 + 24) = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "distanceFilterFarThreshold");
  if (v6 > v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "distanceFilterFarThreshold");
    v10 = v15;
    *(_DWORD *)a2 = 27;
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "distanceFilterFarThreshold");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("face too far: %g cm > %g cm"), v6, v17);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_4:
  *(_DWORD *)a2 = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
LABEL_10:
  __67__VGFaceFittingFrameSelector_checkDistanceFilter_frameTimestampMS___block_invoke();
}

void __67__VGFaceFittingFrameSelector_checkDistanceFilter_frameTimestampMS___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFaceFittingFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CheckDistanceFilter", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (FrameRejectionState)checkMotionBlurFilter:(SEL)a3 frameTimestampMS:(id)a4
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  __CFString *v15;
  FrameRejectionState *result;
  unint64_t v17;
  void *__p;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v8 = a4;
  VGLogVGFaceFittingFrameSelector();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CheckMotionBlurFilter", (const char *)&unk_249D51699, (uint8_t *)&v17, 2u);
  }

  v10 = (void *)objc_opt_class();
  if (v10)
  {
    objc_msgSend(v10, "getFaceKitTrackedLandmarks:", v8);
    v11 = v21;
    v12 = (uint64_t)v22;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
  v17 = a5;
  __p = 0;
  v19 = 0;
  v20 = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v11, v12, (v12 - (uint64_t)v11) >> 3);
  v13 = vg::frame_selection::VGBlurDetector::detectMotionBlur((uint64_t *)self->_blurDetector.__ptr_.__value_, (double *)&v17);
  if (!v14)
  {
    retstr->reason = 7;
    v15 = CFSTR("motion blur is initializing temporal state from this frame");
    goto LABEL_10;
  }
  if (v13)
  {
    retstr->reason = 6;
    v15 = CFSTR("motion blur detected");
LABEL_10:
    *(_QWORD *)&retstr->outOfFovOffset = 0;
    retstr->debugDictionary = 0;
    retstr->description = &v15->isa;
    goto LABEL_12;
  }
  retstr->reason = 0;
  *(_QWORD *)&retstr->outOfFovOffset = 0;
  retstr->debugDictionary = 0;
  retstr->description = 0;
LABEL_12:
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
  __69__VGFaceFittingFrameSelector_checkMotionBlurFilter_frameTimestampMS___block_invoke();

  return result;
}

void __69__VGFaceFittingFrameSelector_checkMotionBlurFilter_frameTimestampMS___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFaceFittingFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CheckMotionBlurFilter", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (CGRect)getValidDataFrameBounds:(id)a3
{
  id v3;
  NSObject *v4;
  size_t Width;
  size_t Height;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int32x2_t v16;
  uint8_t buf[16];
  CGRect result;

  v3 = a3;
  VGLogVGFaceFittingFrameSelector();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetValidDataFrameBounds", (const char *)&unk_249D51699, buf, 2u);
  }

  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v3, "depth"));
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v3, "depth"));
  v16 = (int32x2_t)getImageBBoxAboveThreshold((__CVBuffer *)objc_msgSend(v3, "depth"), 0.015).n128_u64[0];
  v8 = v7;
  __54__VGFaceFittingFrameSelector_getValidDataFrameBounds___block_invoke();
  v9 = vsub_s32(v8, v16);
  v10 = (float)((float)v9.i32[0] / (float)Width);
  v11 = (float)((float)v9.i32[1] / (float)Height);

  v12 = (float)((float)v16.i32[0] / (float)Width);
  v13 = (float)((float)v16.i32[1] / (float)Height);
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

void __54__VGFaceFittingFrameSelector_getValidDataFrameBounds___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFaceFittingFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetValidDataFrameBounds", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (VGFaceFittingFrameSelector)initWithOptions:(id)a3 faceKitSemantics:(__CFDictionary *)a4
{
  id v6;
  void *v7;
  VGFrameSelector *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t i;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  VGFrameSelector *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  int v30;
  vg::frame_selection::VGBlurDetector *v31;
  vg::frame_selection::VGBlurDetector *v32;
  NSObject *v33;
  id v34;
  VGFaceFittingFrameSelector *v35;
  NSObject *v37;
  void *v39;
  char *v40;
  uint8_t v41[16];
  objc_super v42;
  uint8_t buf[4];
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)VGFaceFittingFrameSelector;
  v40 = -[VGFaceFittingFrameSelector init](&v42, sel_init);
  if (v40)
  {
    if (a4)
    {
      CFRetain(a4);
      v7 = (void *)*((_QWORD *)v40 + 5);
      *((_QWORD *)v40 + 5) = a4;

    }
    +[VGFrameSelectorOptions optionsWithCaptureOptions:](VGFrameSelectorOptions, "optionsWithCaptureOptions:", v6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VGFrameSelector initWithOptions:]([VGFrameSelector alloc], "initWithOptions:", v39);
    v9 = (void *)*((_QWORD *)v40 + 1);
    *((_QWORD *)v40 + 1) = v8;

    v10 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v6, "requiredExpressions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v40 + 2);
    *((_QWORD *)v40 + 2) = v12;

    for (i = 0; ; ++i)
    {
      objc_msgSend(v6, "requiredExpressions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = i < objc_msgSend(v15, "count");

      if (!v16)
        break;
      objc_msgSend(v6, "requiredExpressions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");

      v20 = v19;
      v21 = (void *)objc_opt_new();
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setYawFrameCount:", 1);
      LODWORD(v23) = 1057360530;
      objc_msgSend(v22, "setYawLimit:", v23);
      v45[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setYawExpressionFilters:", v24);

      v25 = -[VGFrameSelector initWithOptions:]([VGFrameSelector alloc], "initWithOptions:", v22);
      v26 = (void *)*((_QWORD *)v40 + 2);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

    }
    *((_QWORD *)v40 + 4) = 0;
    v28 = (id *)(v40 + 48);
    objc_storeStrong((id *)v40 + 6, a3);
    v29 = (void *)*((_QWORD *)v40 + 7);
    *((_QWORD *)v40 + 7) = 0;

    if (!objc_msgSend(*((id *)v40 + 6), "useMotionBlurFilter"))
      goto LABEL_11;
    *(_DWORD *)buf = 1106247680;
    objc_msgSend(*v28, "motionBlurThreshold");
    LODWORD(v44) = v30;
    BYTE4(v44) = 0;
    vg::frame_selection::VGBlurDetector::create((uint64_t)buf, v41);
    v31 = *(vg::frame_selection::VGBlurDetector **)v41;
    *(_QWORD *)v41 = 0;
    std::unique_ptr<vg::frame_selection::VGBlurDetector>::reset[abi:ne180100]((vg::frame_selection::VGBlurDetector **)v40 + 8, v31);
    v32 = *(vg::frame_selection::VGBlurDetector **)v41;
    *(_QWORD *)v41 = 0;
    if (v32)
    {
      vg::frame_selection::VGBlurDetector::~VGBlurDetector(v32);
      MEMORY[0x24BD02D60]();
    }
    if (!*((_QWORD *)v40 + 8))
    {
      __VGLogSharedInstance();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_249CAD000, v37, OS_LOG_TYPE_ERROR, " Unable to instantiate VGBlurDetector ", v41, 2u);
      }

      v35 = 0;
    }
    else
    {
LABEL_11:
      __VGLogSharedInstance();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = *v28;
        *(_DWORD *)buf = 138412290;
        v44 = v34;
        _os_log_impl(&dword_249CAD000, v33, OS_LOG_TYPE_DEBUG, " Initialized FaceFittingSelector with face capture options:\n%@ ", buf, 0xCu);
      }

      v35 = v40;
    }

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BOOL)startFaceExpressionCapture:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  VGFrameSelector *v9;
  NSMutableDictionary *expressionsSelector;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setYawFrameCount:", 1);
  LODWORD(v7) = 1057360530;
  objc_msgSend(v6, "setYawLimit:", v7);
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setYawExpressionFilters:", v8);

  v9 = -[VGFrameSelector initWithOptions:]([VGFrameSelector alloc], "initWithOptions:", v6);
  expressionsSelector = self->_expressionsSelector;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](expressionsSelector, "setObject:forKeyedSubscript:", v9, v11);

  return 1;
}

- (id)_currentState
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  double v29;
  void *v30;
  BOOL v31;
  double v32;
  double v33;
  float v34;
  NSObject *v35;
  NSMutableDictionary *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  VGFaceSelectionState *obja;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  VGFaceSelectionState *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  VGFrameSelector *poseSelector;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[VGFaceFittingFrameSelector allPoseSelectors](self, "allPoseSelectors");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  v3 = 0;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v56 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v3 += objc_msgSend(v7, "remainingPosesCount");
        v2 += objc_msgSend(v7, "requiredPosesCount");
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v4);
  }

  obja = objc_alloc_init(VGFaceSelectionState);
  -[VGSelectionState setFailed:](obja, "setFailed:", v2 == 0);
  if (!-[VGSelectionState failed](obja, "failed"))
  {
    -[VGSelectionState setCompleted:](obja, "setCompleted:", v3 == 0);
    if (v2)
    {
      *(float *)&v8 = (float)(v2 - v3) / (float)v2;
      -[VGSelectionState setProgress:](obja, "setProgress:", v8);
    }
    -[VGFrameSelector yawResults](self->_poseSelector, "yawResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceSelectionState setYawAngleCapturedPoses:](obja, "setYawAngleCapturedPoses:", v9);

    -[VGFrameSelector pitchResults](self->_poseSelector, "pitchResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceSelectionState setPitchAngleCapturedPoses:](obja, "setPitchAngleCapturedPoses:", v10);

    -[VGFrameSelector yawResults](self->_poseSelector, "yawResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceSelectionState setPosesForHairCapturedPoses:](obja, "setPosesForHairCapturedPoses:", v11);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    poseSelector = self->_poseSelector;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &poseSelector, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceFittingFrameSelector posesFromSelectors:](self, "posesFromSelectors:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v52;
      while (2)
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          if (objc_msgSend(v17, "frontPose"))
          {
            -[VGFaceSelectionState setCapturedFrontPose:](obja, "setCapturedFrontPose:", v17);
            goto LABEL_21;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_21:

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = self->_expressionsSelector;
    v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
    if (v19)
    {
      v38 = *(_QWORD *)v48;
      do
      {
        v39 = v19;
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v37);
          v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
          -[NSMutableDictionary objectForKey:](self->_expressionsSelector, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "results");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v44;
            do
            {
              for (m = 0; m != v25; ++m)
              {
                if (*(_QWORD *)v44 != v26)
                  objc_enumerationMutation(v24);
                objc_msgSend(v24, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, v21);

              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
            }
            while (v25);
          }

        }
        v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
      }
      while (v19);
    }

    -[VGFaceSelectionState setExpressionCapturedPoses:](obja, "setExpressionCapturedPoses:", v18);
    LODWORD(v29) = 0;
    -[VGFaceSelectionState setCompletionScore:](obja, "setCompletionScore:", v29);
    -[VGFaceSelectionState capturedFrontPose](obja, "capturedFrontPose");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (!v31)
    {
      LODWORD(v32) = 0.25;
      -[VGFaceSelectionState setCompletionScore:](obja, "setCompletionScore:", v32);
      v34 = 1.0;
      if (-[VGFrameSelector completed](self->_poseSelector, "completed")
        || (v34 = 0.5, -[VGFrameSelector completedYaw](self->_poseSelector, "completedYaw"))
        || -[VGFrameSelector completedPitch](self->_poseSelector, "completedPitch"))
      {
        *(float *)&v33 = v34;
        -[VGFaceSelectionState setCompletionScore:](obja, "setCompletionScore:", v33);
      }
    }

  }
  __VGLogSharedInstance();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v60 = v3;
    v61 = 2048;
    v62 = v2;
    v63 = 2112;
    v64 = obja;
    _os_log_impl(&dword_249CAD000, v35, OS_LOG_TYPE_DEBUG, " %lu/%lu %@ ", buf, 0x20u);
  }

  return obja;
}

- (id)addPoseWithCaptureData:(id)a3 tracking:(id)a4 externalTracking:(BOOL)a5 metricsData:(void *)a6
{
  id v10;
  NSObject *v11;
  double Seconds;
  void *v13;
  unint64_t v14;
  VGFaceFittingFrameSelector *v15;
  unint64_t frameCount;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  float v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  uint64_t i;
  void *v37;
  uint64_t j;
  void *v39;
  __int32 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  unsigned __int8 v45;
  uint64_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t *v57;
  __uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  void *v91;
  void *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  float32x4_t v102;
  double v103;
  void *v104;
  id v105;
  float32x4_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _OWORD v111[2];
  uint64_t v112;
  int v113;
  id v114;
  uint64_t v115;
  id v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  int v121;
  id v122;
  double v123;
  id v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  const __CFString *v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  const __CFString *v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  const __CFString *v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  const __CFString *v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD v157[2];
  CMTime time;
  uint8_t buf[16];
  double v160;
  id v161;
  __int128 v162;
  __int128 v163;
  VGFrameSelector *poseSelector;
  uint8_t v165[128];
  _BYTE v166[32];
  __int128 v167;
  __int128 v168;
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v105 = a4;
  VGLogVGFaceFittingFrameSelector();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddPoseWithCaptureData", (const char *)&unk_249D51699, buf, 2u);
  }

  ++self->_frameCount;
  if (v10)
    objc_msgSend(v10, "timestamp");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  -[VGFaceFittingFrameSelector _currentState](self, "_currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (unint64_t)(Seconds * 1000.0);
  v157[0] = a6;
  v157[1] = v14;
  v15 = self;
  if (objc_msgSend(v13, "failed"))
  {
    v153 = 1;
    v156 = 0;
    v154 = CFSTR("enrollment failed");
    v155 = 0;
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v153);
    if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
      vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
    goto LABEL_27;
  }
  if (a5 || (frameCount = self->_frameCount, frameCount > 0x32))
  {
    if (!v105)
    {
      v145 = 2;
      v148 = 0;
      v146 = CFSTR("no tracking data");
      v147 = 0;
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v145);
      if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
        vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
      goto LABEL_27;
    }
    objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("tracked_faces"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v101 || !objc_msgSend(v101, "count"))
    {
      v141 = 3;
      v144 = 0;
      v142 = CFSTR("no tracked face");
      v143 = 0;
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v141);
      if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
        vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
      v26 = v13;
      goto LABEL_111;
    }
    objc_msgSend(v101, "objectAtIndexedSubscript:", 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v99)
    {
      v137 = 3;
      v140 = 0;
      v138 = CFSTR("null tracked face");
      v139 = 0;
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v137);
      if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
        vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
      v26 = v13;
      goto LABEL_110;
    }
    if (-[VGFaceCaptureOptions useAmbientLightFilter](v15->_options, "useAmbientLightFilter"))
    {
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("vg_ambient_light"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "floatValue");
        v20 = v19;
        -[VGFaceCaptureOptions ambientLightFilterLowThreshold](v15->_options, "ambientLightFilterLowThreshold");
        if (v20 < v21)
        {
          v133 = 5;
          v22 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v18, "floatValue");
          v24 = v23;
          -[VGFaceCaptureOptions ambientLightFilterLowThreshold](v15->_options, "ambientLightFilterLowThreshold");
          objc_msgSend(v22, "stringWithFormat:", CFSTR("low ambient light [%g < %g]"), v24, v25);
          v135 = 0;
          v136 = 0;
          v134 = objc_claimAutoreleasedReturnValue();
          -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v133);
          if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
            vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
          v26 = v13;

          goto LABEL_110;
        }
      }

    }
    if (-[VGFaceCaptureOptions useTrackedFaceIdentifierFilter](v15->_options, "useTrackedFaceIdentifierFilter"))
    {
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("identifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        if (v15->_trackedFaceIdentifier)
        {
          if ((objc_msgSend(v27, "isEqualToString:") & 1) == 0)
          {
            v129 = 4;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tracked face changed [%@ != %@]"), v28, v15->_trackedFaceIdentifier);
            v131 = 0;
            v132 = 0;
            v130 = objc_claimAutoreleasedReturnValue();
            -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v129);
            if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
              vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
            v26 = v13;

            goto LABEL_110;
          }
        }
        else
        {
          objc_storeStrong((id *)&v15->_trackedFaceIdentifier, v27);
        }
      }

    }
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("confidence"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    if (v30 < 0.95)
    {
      v125 = 8;
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v29, "floatValue");
      objc_msgSend(v31, "stringWithFormat:", CFSTR("low confidence [%g < %g]"), v32, 0x3FEE666660000000);
      v127 = 0;
      v128 = 0;
      v126 = objc_claimAutoreleasedReturnValue();
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v125);
      if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
        vg::frame_selection::VGBlurDetector::resetPreviousState((vg::frame_selection::VGBlurDetectorImpl **)v15->_blurDetector.__ptr_.__value_);
      v26 = v13;
      goto LABEL_109;
    }
    v97 = v29;
    if (-[VGFaceCaptureOptions useMotionBlurFilter](v15->_options, "useMotionBlurFilter"))
    {
      -[VGFaceFittingFrameSelector checkMotionBlurFilter:frameTimestampMS:](v15, "checkMotionBlurFilter:frameTimestampMS:", v99, v14);
      if (*(_DWORD *)buf)
      {
        v121 = *(_DWORD *)buf;
        v122 = *(id *)&buf[8];
        v123 = v160;
        v124 = v161;
        -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v121);
        v26 = v13;

LABEL_108:
        v29 = v97;
LABEL_109:

LABEL_110:
LABEL_111:

        goto LABEL_112;
      }

    }
    v33 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16);
    v34 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32);
    v35 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
    v117 = *(float32x4_t *)MEMORY[0x24BDAEE00];
    v118 = v33;
    v119 = v34;
    v120 = v35;
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("smooth_data"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("pose"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("rotation"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 3; ++i)
    {
      objc_msgSend(v100, "objectAtIndex:", i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j != 3; ++j)
      {
        objc_msgSend(v37, "objectAtIndex:", j);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        v117.i32[4 * j + i] = v40;

      }
    }
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("translation"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v102 = v120;
    do
    {
      objc_msgSend(v41, "objectAtIndexedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v106 = v102;
      *(_DWORD *)((unint64_t)&v106 & 0xFFFFFFFFFFFFFFF3 | (4 * (v42 & 3))) = v44;
      v102 = v106;

      ++v42;
    }
    while (v42 != 3);
    v120 = v102;
    if ((v45 & 1) == 0
    {
      -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::kRotateBy180AroundX = xmmword_249D3AC80;
      unk_2578D36A0 = xmmword_249D3AC90;
      xmmword_2578D36B0 = xmmword_249D3ACA0;
      unk_2578D36C0 = xmmword_249D3ACB0;
    }
    v46 = 0;
    v47 = v117;
    v48 = v118;
    v49 = v119;
    v50 = v120;
    *(_OWORD *)v166 = -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::kRotateBy180AroundX;
    *(_OWORD *)&v166[16] = unk_2578D36A0;
    v167 = xmmword_2578D36B0;
    v168 = unk_2578D36C0;
    do
    {
      *(float32x4_t *)&buf[v46] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(_OWORD *)&v166[v46])), v48, *(float32x2_t *)&v166[v46], 1), v49, *(float32x4_t *)&v166[v46], 2), v50, *(float32x4_t *)&v166[v46], 3);
      v46 += 16;
    }
    while (v46 != 64);
    v103 = *(double *)buf;
    v95 = *(double *)&v162;
    v96 = v160;
    v94 = *(double *)&v163;
    buf[0] = 0;
    LOBYTE(v162) = 0;
    if (-[VGFaceCaptureOptions useDepthFovFilter](v15->_options, "useDepthFovFilter"))
    {
      -[VGFaceFittingFrameSelector getValidDataFrameBounds:](v15, "getValidDataFrameBounds:", v10);
      *(_QWORD *)buf = v51;
      *(_QWORD *)&buf[8] = v52;
      v160 = v53;
      v161 = v54;
      if (!(_BYTE)v162)
        LOBYTE(v162) = 1;
    }
    if (-[VGFaceCaptureOptions useDistanceFilter](v15->_options, "useDistanceFilter"))
    {
      -[VGFaceFittingFrameSelector checkDistanceFilter:frameTimestampMS:](v15, "checkDistanceFilter:frameTimestampMS:", v14, v103, v96, v95, v94);
      if (*(_DWORD *)v166)
      {
        v113 = *(_DWORD *)v166;
        v114 = *(id *)&v166[8];
        v115 = *(_QWORD *)&v166[16];
        v116 = *(id *)&v166[24];
        -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v113);
        v26 = v13;

LABEL_107:
        goto LABEL_108;
      }

    }
    -[VGFrameSelector processCaptureData:trackingData:framePose:validDataFrameBounds:](v15->_poseSelector, "processCaptureData:trackingData:framePose:validDataFrameBounds:", v10, v105, buf, v103, v96, v95, v94);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v55;
    if (objc_msgSend(v55, "isSuccessful"))
    {
      if (a6)
      {
        v56 = objc_msgSend(v55, "motionType");
        v112 = objc_msgSend(v55, "targetAngleId");
        *(_QWORD *)v166 = &v112;
        v57 = std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t **)a6 + 3 * v56 + 44, (unint64_t *)&v112, (uint64_t)&std::piecewise_construct, (uint64_t **)v166);
        if (!v57[5])
        {
          v58 = vg::shared::Time((vg::shared *)v57);
          v112 = objc_msgSend(v55, "targetAngleId");
          *(_QWORD *)v166 = &v112;
          std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t **)a6 + 3 * v56 + 55, (unint64_t *)&v112, (uint64_t)&std::piecewise_construct, (uint64_t **)v166)[5] = v58;
        }
        v112 = objc_msgSend(v55, "targetAngleId");
        *(_QWORD *)v166 = &v112;
        v59 = std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t **)a6 + 3 * v56 + 44, (unint64_t *)&v112, (uint64_t)&std::piecewise_construct, (uint64_t **)v166);
        ++v59[5];
      }
      -[VGFaceFittingFrameSelector _currentState](v15, "_currentState");
      v60 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v60;
    }
    if (v55)
      objc_msgSend(v55, "rejectionState");
    else
      memset(v111, 0, sizeof(v111));
    -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, (int *)v111);
    objc_msgSend(v13, "setPoseIndex:", objc_msgSend(v55, "poseIndex"));
    objc_msgSend(v55, "yawInDegrees");
    objc_msgSend(v13, "setYawAngle:");
    objc_msgSend(v55, "pitchInDegrees");
    objc_msgSend(v13, "setPitchAngle:");
    v61 = objc_msgSend(v55, "motionType");
    if (v61)
    {
      v62 = 0;
    }
    else
    {
      v63 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v55, "angleInDegrees");
      objc_msgSend(v63, "numberWithFloat:");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "setYawTargetAngle:", v62);
    if (!v61)

    v64 = objc_msgSend(v55, "motionType");
    if (v64 == 1)
    {
      v65 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v55, "angleInDegrees");
      objc_msgSend(v65, "numberWithFloat:");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v13, "setPitchTargetAngle:", v66);
    if (v64 == 1)

    objc_msgSend(v55, "debugData");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDebugData:", v67);

    objc_msgSend(v55, "bodyPoseFrameState");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBodyPoseFrameState:", v68);

    objc_msgSend(v13, "yawTargetAngle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v13, "yawAngleCapturedPoses");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "yawTargetAngle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKey:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v72 == 0;

      if (v73)
      {
        __VGLogSharedInstance();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v13, "yawTargetAngle");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v166 = 134218242;
          *(_QWORD *)&v166[4] = v14;
          *(_WORD *)&v166[12] = 2112;
          *(_QWORD *)&v166[14] = v75;
          _os_log_impl(&dword_249CAD000, v74, OS_LOG_TYPE_DEBUG, " Frame#%zu reported target angle %@ (yaw) through selection state is not present in keys of yaw captured poses dictionary ", v166, 0x16u);

        }
      }
    }
    objc_msgSend(v13, "pitchTargetAngle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76)
    {
      objc_msgSend(v13, "pitchAngleCapturedPoses");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pitchTargetAngle");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKey:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v79 == 0;

      if (v80)
      {
        __VGLogSharedInstance();
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v13, "pitchTargetAngle");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v166 = 134218242;
          *(_QWORD *)&v166[4] = v14;
          *(_WORD *)&v166[12] = 2112;
          *(_QWORD *)&v166[14] = v82;
          _os_log_impl(&dword_249CAD000, v81, OS_LOG_TYPE_DEBUG, " Frame#%zu reported target angle %@ (pitch) through selection state is not present in keys of pitch captured poses dictionary ", v166, 0x16u);

        }
      }
    }
    -[VGFaceFittingFrameSelector allPoseSelectors](v15, "allPoseSelectors");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceFittingFrameSelector posesFromSelectors:](v15, "posesFromSelectors:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTronPoses:", v84);

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    poseSelector = v15->_poseSelector;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &poseSelector, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceFittingFrameSelector posesFromSelectors:](v15, "posesFromSelectors:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v107, v165, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v108;
      while (2)
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v108 != v88)
            objc_enumerationMutation(v86);
          v90 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
          if (objc_msgSend(v90, "frontPose"))
          {
            objc_msgSend(v13, "setCapturedFrontPose:", v90);
            v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v90, 0);
            objc_msgSend(v13, "setHairPoses:", v91);

            goto LABEL_104;
          }
        }
        v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v107, v165, 16);
        if (v87)
          continue;
        break;
      }
    }
LABEL_104:

    if (objc_msgSend(v13, "completed"))
      v15->_selectionCompleted = 1;
    v26 = v13;

    goto LABEL_107;
  }
  v149 = 10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("not ready [%lu / %lu]"), frameCount, 50);
  v152 = 0;
  v150 = objc_claimAutoreleasedReturnValue();
  v151 = 0;
  -[VGFaceFittingFrameSelector addPoseWithCaptureData:tracking:externalTracking:metricsData:]::$_0::operator()(v157, v13, &v149);
LABEL_27:
  v26 = v13;
LABEL_112:

  __91__VGFaceFittingFrameSelector_addPoseWithCaptureData_tracking_externalTracking_metricsData___block_invoke();
  return v26;
}

void __91__VGFaceFittingFrameSelector_addPoseWithCaptureData_tracking_externalTracking_metricsData___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGLogVGFaceFittingFrameSelector();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_249CAD000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddPoseWithCaptureData", (const char *)&unk_249D51699, v1, 2u);
  }

}

- (void)addPoseWithCaptureData:tracking:externalTracking:metricsData:
{
  id v5;
  uint64_t v6;
  VGFrameRejectionState *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  std::string *p_p;
  uint64_t v15;
  std::string __p;
  int v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  std::string *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (*a1)
  {
    v6 = *a1 + 8 * *a3;
    ++*(_QWORD *)(v6 + 16);
  }
  v7 = [VGFrameRejectionState alloc];
  v17 = *a3;
  v8 = *((id *)a3 + 1);
  v9 = *((_QWORD *)a3 + 2);
  v10 = (void *)*((_QWORD *)a3 + 3);
  v18 = v8;
  v19 = v9;
  v11 = v10;
  v20 = v11;
  if (v7)
  {
    v7 = -[VGFrameRejectionState initFromInternalRejectionState:](v7, "initFromInternalRejectionState:", &v17);
  }
  else
  {

  }
  objc_msgSend(v5, "setRejectionState:", v7);

  __VGLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = a1[1];
    vg::frame_selection::frameRejectionReasonToString(*a3, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v15 = *((_QWORD *)a3 + 1);
    *(_DWORD *)buf = 134218498;
    v22 = v13;
    v23 = 2080;
    v24 = p_p;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_DEBUG, " Frame#%zu rejection state: %s description: %@ ", buf, 0x20u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }

}

- (id)posesFromSelectors:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v22 = *(_QWORD *)v35;
    do
    {
      v23 = v5;
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v7, "yawResults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pitchResults");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "keysSortedByValueUsingComparator:", &__block_literal_global_210);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "keysSortedByValueUsingComparator:", &__block_literal_global_211);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = v25;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v14);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v11);
        }

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = v24;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v27;
          do
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v19);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v16);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v5);
  }

  return v4;
}

uint64_t __49__VGFaceFittingFrameSelector_posesFromSelectors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "selectedAngle");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "selectedAngle");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

uint64_t __49__VGFaceFittingFrameSelector_posesFromSelectors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "selectedAngle");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "selectedAngle");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

- (id)enrolledPoses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VGFrameSelector completedYaw](self->_poseSelector, "completedYaw"))
  {
    -[VGFrameSelector selectedYawValidPoses](self->_poseSelector, "selectedYawValidPoses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[VGFrameSelector selectedYawValidPoses](self->_poseSelector, "selectedYawValidPoses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v11, "frontPose"))
            objc_msgSend(v3, "addObject:", v11);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

  }
  if (-[VGFrameSelector completedPitch](self->_poseSelector, "completedPitch"))
  {
    -[VGFrameSelector selectedPitchValidPoses](self->_poseSelector, "selectedPitchValidPoses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v13);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "setTrackingData:", self->_facekitSemantics, (_QWORD)v19);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  return v14;
}

- (id)finish
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_selectionCompleted)
  {
    -[VGFaceFittingFrameSelector neutralSelectors](self, "neutralSelectors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGFaceFittingFrameSelector posesFromSelectors:](self, "posesFromSelectors:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setTrackingData:", self->_facekitSemantics, (_QWORD)v10);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  else
  {
    -[VGFaceFittingFrameSelector enrolledPoses](self, "enrolledPoses");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  std::unique_ptr<vg::frame_selection::VGBlurDetector>::reset[abi:ne180100]((vg::frame_selection::VGBlurDetector **)&self->_blurDetector, 0);
  objc_storeStrong((id *)&self->_trackedFaceIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_facekitSemantics, 0);
  objc_storeStrong((id *)&self->_expressionsSelector, 0);
  objc_storeStrong((id *)&self->_poseSelector, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
