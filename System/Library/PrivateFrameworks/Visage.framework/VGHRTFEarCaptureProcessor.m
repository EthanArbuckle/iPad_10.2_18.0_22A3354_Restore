@implementation VGHRTFEarCaptureProcessor

- (VGHRTFEarCaptureProcessor)initWithDebugDataPath:(id)a3 withModelsRootPath:(id)a4
{
  id v6;
  id v7;
  VGHRTFEarCaptureProcessor *v8;
  VGHRTFEarCaptureProcessor *v9;
  VGHRTFEarCaptureProcessor *v10;
  id v11;
  void **p_debugDataPath;
  vg::frame_selection::VGEarFrameSelectorImpl **v13;
  vg::frame_selection::VGEarFrameSelectorImpl **v14;
  vg::hrtf::Rectify **p_rectify;
  vg::hrtf::Rectify *v16;
  vg::hrtf::Rectify *v17;
  uint64_t v18;
  uint64_t v19;
  NSDictionary *leftPoseStatus;
  uint64_t v21;
  NSDictionary *rightPoseStatus;
  VGHRTFEarCaptureProcessor *v23;
  NSObject *v24;
  const char *v25;
  vg::hrtf::Rectify *v27[2];
  uint64_t v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)VGHRTFEarCaptureProcessor;
  v8 = -[VGHRTFEarCaptureProcessor init](&v29, sel_init);
  v9 = v8;
  v10 = v8;
  if (!v8)
  {
    __VGLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    LOWORD(v27[0]) = 0;
    v25 = " Failed to initialize VGHRTFCaptureProcessor ";
LABEL_19:
    _os_log_impl(&dword_249CAD000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)v27, 2u);
    goto LABEL_20;
  }
  v8->_earCaptureOptions.writeDebugData = v6 != 0;
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("EarCapture"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(v27, (char *)objc_msgSend(v11, "UTF8String"));
    p_debugDataPath = (void **)&v9->_earCaptureOptions.debugDataPath;
    if (*((char *)&v10->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l + 23) < 0)
      operator delete(*p_debugDataPath);
    *(_OWORD *)p_debugDataPath = *(_OWORD *)v27;
    *((_QWORD *)&v9->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l + 2) = v28;
    HIBYTE(v28) = 0;
    LOBYTE(v27[0]) = 0;

  }
  std::string::__assign_external((std::string *)&v9->_earCaptureOptions.debugDataPath.__r_.var0, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  vg::frame_selection::VGEarFrameSelector::create((vg::frame_selection::VGEarFrameSelector *)&v9->_earCaptureOptions, (vg::frame_selection::VGEarFrameSelectorImpl ***)v27);
  v13 = (vg::frame_selection::VGEarFrameSelectorImpl **)v27[0];
  v27[0] = 0;
  std::unique_ptr<vg::frame_selection::VGEarFrameSelector>::reset[abi:ne180100]((vg::frame_selection::VGEarFrameSelectorImpl ***)&v9->_selector, v13);
  v14 = (vg::frame_selection::VGEarFrameSelectorImpl **)v27[0];
  v27[0] = 0;
  if (v14)
  {
    vg::frame_selection::VGEarFrameSelector::~VGEarFrameSelector(v14);
    v14 = (vg::frame_selection::VGEarFrameSelectorImpl **)MEMORY[0x24BD02D60]();
  }
  if (!v9->_selector.__ptr_.__value_)
  {
    __VGLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    LOWORD(v27[0]) = 0;
    v25 = " Failed to initialize ear frame selector. ";
    goto LABEL_19;
  }
  vg::hrtf::Rectify::create((vg::hrtf::Rectify *)v14, v27);
  p_rectify = (vg::hrtf::Rectify **)&v9->_rectify;
  v16 = v27[0];
  v27[0] = 0;
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100](p_rectify, v16);
  v17 = v27[0];
  v27[0] = 0;
  if (v17)
  {
    vg::hrtf::Rectify::~Rectify(v17);
    MEMORY[0x24BD02D60](v18);
  }
  if (!*p_rectify)
  {
    __VGLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      v25 = " Failed to initialize image rectify. ";
      goto LABEL_19;
    }
LABEL_20:

    v23 = 0;
    goto LABEL_21;
  }
  v10->_progress = 0.0;
  v10->_captureState = 0;
  -[VGHRTFEarCaptureProcessor initWithDebugDataPath:withModelsRootPath:]::$_0::operator()(*(void **)&v10->_anon_78[16]);
  v19 = objc_claimAutoreleasedReturnValue();
  leftPoseStatus = v10->_leftPoseStatus;
  v10->_leftPoseStatus = (NSDictionary *)v19;

  -[VGHRTFEarCaptureProcessor initWithDebugDataPath:withModelsRootPath:]::$_0::operator()(*(void **)&v10->_anon_78[16]);
  v21 = objc_claimAutoreleasedReturnValue();
  rightPoseStatus = v10->_rightPoseStatus;
  v10->_rightPoseStatus = (NSDictionary *)v21;

  v23 = v10;
LABEL_21:

  return v23;
}

- (id)initWithDebugDataPath:withModelsRootPath:
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "doubleValue", (_QWORD)v10);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", ceil(v7 * 100.0) / 100.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)currentUpdateData
{
  id v3;
  double v4;
  void *v5;
  void *v6;

  v3 = -[VGHRTFEarCaptureUpdateData initEmpty]([VGHRTFEarCaptureUpdateData alloc], "initEmpty");
  objc_msgSend(v3, "setProgressType:", self->_captureState);
  *(float *)&v4 = self->_progress;
  objc_msgSend(v3, "setProgress:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", self->_leftPoseStatus, 1);
  objc_msgSend(v3, "setLeftEarStatusList:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", self->_rightPoseStatus, 1);
  objc_msgSend(v3, "setRightEarStatusList:", v6);

  objc_msgSend(v3, "setTrackedData:", 0);
  objc_msgSend(v3, "setResult:", 0);
  return v3;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4
{
  id v6;
  void *v7;
  Rectify *value;
  IOSurface *v9;
  IOSurface *v10;
  __int128 v11;
  simd_float3 v12;
  simd_float3 v13;
  VGHRTFDepthCalibrationData *v14;
  CVPixelBufferRef CVPixelBufferFromIOSurface;
  uint64_t v16;
  CVPixelBufferRef v17;
  Float64 v18;
  unint64_t v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *leftPoseStatus;
  void *v23;
  NSDictionary *v24;
  NSDictionary *rightPoseStatus;
  double v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  size_t Width;
  size_t Height;
  float v36;
  float v37;
  float v38;
  float v39;
  NSObject *v40;
  double v41;
  _DWORD *v42;
  _DWORD *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void (**v56)(_QWORD);
  id v57;
  simd_float3 v58;
  void (**v59)(_QWORD);
  simd_float3 v60;
  VGCaptureData *v61;
  VGCaptureData *v62[2];
  VGCaptureData *v63;
  CMTime v64;
  CMTime v65;
  _QWORD v66[5];
  _QWORD v67[5];
  uint8_t v68[16];
  uint8_t buf[16];
  unsigned int v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  void *v77;
  _DWORD *v78;
  void *__p;
  void *v80;
  int v81;
  id v82;
  id v83;
  IOSurface *v84[8];
  IOSurface *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char v89;
  uint64_t v90;
  simd_float3x3 v91;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v57 = a4;
  -[VGHRTFEarCaptureProcessor currentUpdateData](self, "currentUpdateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_rectify.__ptr_.__value_;
  objc_msgSend(v6, "colorBuffer");
  v9 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "depthBuffer");
  v10 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorIntrinsics");
  v60 = v12;
  *(_OWORD *)v62 = v11;
  v58 = v13;
  objc_msgSend(v6, "depthCalibrationData");
  v14 = (VGHRTFDepthCalibrationData *)objc_claimAutoreleasedReturnValue();
  v91.columns[1] = v60;
  v91.columns[0] = *(simd_float3 *)v62;
  v91.columns[2] = v58;
  vg::hrtf::Rectify::process((vg::hrtf::Rectify *)value, v9, v10, v91, v14, (uint64_t)v84);

  if (v89)
  {
    v63 = (VGCaptureData *)objc_opt_new();
    if (!v89)
      std::__throw_bad_optional_access[abi:ne180100]();
    CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v85);
    v16 = MEMORY[0x24BDAC760];
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke;
    v67[3] = &__block_descriptor_40_e5_v8__0l;
    v67[4] = CVPixelBufferFromIOSurface;
    v56 = (void (**)(_QWORD))MEMORY[0x24BD03294](v67);
    -[VGCaptureData setDepth:](v63, "setDepth:", CVPixelBufferFromIOSurface);
    if (!v89)
      std::__throw_bad_optional_access[abi:ne180100]();
    -[VGCaptureData setDepthIntrinsics:](v63, "setDepthIntrinsics:", *(double *)&v86, *(double *)&v87, *(double *)&v88);
    if (!v89)
      std::__throw_bad_optional_access[abi:ne180100]();
    v17 = createCVPixelBufferFromIOSurface(v84[0]);
    v66[0] = v16;
    v66[1] = 3221225472;
    v66[2] = __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke_2;
    v66[3] = &__block_descriptor_40_e5_v8__0l;
    v66[4] = v17;
    v59 = (void (**)(_QWORD))MEMORY[0x24BD03294](v66);
    -[VGCaptureData setYuvRectified:](v63, "setYuvRectified:", v17);
    if (!v89)
      std::__throw_bad_optional_access[abi:ne180100]();
    -[VGCaptureData setVideoIntrinsics:](v63, "setVideoIntrinsics:", *(double *)&v84[2], *(double *)&v84[4], *(double *)&v84[6]);
    objc_msgSend(v6, "timestamp");
    CMTimeMakeWithSeconds(&v65, v18, 1000000);
    v64 = v65;
    -[VGCaptureData setTimestamp:](v63, "setTimestamp:", &v64);
    vg::frame_selection::VGEarFrameSelector::addPoseWithCaptureData((vg::frame_selection::VGEarFrameSelectorImpl **)self->_selector.__ptr_.__value_, v63, (uint64_t)buf);
    self->_captureState = 1;
    if (buf[0])
    {
      v19 = 2;
      if (!buf[1])
        v19 = 3;
      self->_captureState = v19;
    }
    self->_progress = *(float *)&buf[4];
    vg::frame_selection::VGEarSelectionState::leftEarYawAngleCaptured((void **)buf);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    detail::getEarPoseList(v20);
    v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    leftPoseStatus = self->_leftPoseStatus;
    self->_leftPoseStatus = v21;

    vg::frame_selection::VGEarSelectionState::rightEarYawAngleCaptured((void **)buf);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    detail::getEarPoseList(v23);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    rightPoseStatus = self->_rightPoseStatus;
    self->_rightPoseStatus = v24;

    objc_msgSend(v7, "setProgressType:", self->_captureState);
    *(float *)&v26 = self->_progress;
    objc_msgSend(v7, "setProgress:", v26);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", self->_leftPoseStatus, 1);
    objc_msgSend(v7, "setLeftEarStatusList:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", self->_rightPoseStatus, 1);
    objc_msgSend(v7, "setRightEarStatusList:", v28);

    v29 = -[VGHRTFEarCaptureProcessedData initEmpty]([VGHRTFEarCaptureProcessedData alloc], "initEmpty");
    v61 = v63;
    if (v81)
    {
      v30 = 0;
    }
    else
    {
      v33 = -[VGHRTFEarCaptureDetectionData initEmpty]([VGHRTFEarCaptureDetectionData alloc], "initEmpty");
      Width = CVPixelBufferGetWidth(-[VGCaptureData yuvRectified](v61, "yuvRectified"));
      Height = CVPixelBufferGetHeight(-[VGCaptureData yuvRectified](v61, "yuvRectified"));
      v36 = v73;
      v37 = v74;
      v38 = v75;
      v39 = v76;
      if (v70 > 1)
      {
        __VGLogSharedInstance();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v40, OS_LOG_TYPE_ERROR, " No suitable conversion supported for ear side. ", v68, 2u);
        }
        v30 = 0;
      }
      else
      {
        objc_msgSend(v33, "setEarSide:");
        objc_msgSend(v33, "setYawAngle:", v71);
        objc_msgSend(v33, "setPitchAngle:", v72);
        objc_msgSend(v33, "setBoundingBox:", (float)(v36 * (float)Width), (float)(v37 * (float)Height), (float)((float)(v38 - v36) * (float)Width), (float)((float)(v39 - v37) * (float)Height));
        v40 = objc_opt_new();
        v42 = v77;
        v43 = v78;
        if (v77 != v78)
        {
          do
          {
            LODWORD(v41) = *v42;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v40, "addObject:", v44);

            ++v42;
          }
          while (v42 != v43);
        }
        objc_msgSend(v33, "setLandmarkPoints:", v40);
        v30 = v33;
      }

    }
    objc_msgSend(v29, "setDetectionData:", v30);

    if (!v89)
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v29, "setRectifiedColorBuffer:", v84[0]);
    v45 = 8;
    switch(v81)
    {
      case 0:
        goto LABEL_49;
      case 1:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear not found. ", v68, 2u);
        }
        v45 = 0;
        goto LABEL_48;
      case 2:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear detection failed: low landmark confidence. ", v68, 2u);
        }
        v45 = 5;
        goto LABEL_48;
      case 3:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Front facing pose ", v68, 2u);
        }
        v45 = 6;
        goto LABEL_48;
      case 4:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear occluded. ", v68, 2u);
        }
        v45 = 1;
        goto LABEL_48;
      case 5:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        v45 = 2;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          v45 = 2;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear motion blur detected. ", v68, 2u);
        }
        goto LABEL_48;
      case 6:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear too close to camera. ", v68, 2u);
        }
        v45 = 3;
        goto LABEL_48;
      case 7:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear too far from camera. ", v68, 2u);
        }
        v45 = 4;
        goto LABEL_48;
      case 8:
        __VGLogSharedInstance();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_249CAD000, v46, OS_LOG_TYPE_DEBUG, " Ear out of frame ", v68, 2u);
        }
        v45 = 7;
LABEL_48:

LABEL_49:
        objc_msgSend(v29, "setError:", v45);
        break;
      default:
        break;
    }
    objc_msgSend(v7, "setTrackedData:", v29);
    if (objc_msgSend(v7, "progressType") == 3)
    {
      v47 = -[VGHRTFEarsFrameData initEmpty]([VGHRTFEarsFrameData alloc], "initEmpty");
      vg::frame_selection::VGEarFrameSelector::leftEarEnrolledPoses((vg::frame_selection::VGEarFrameSelectorImpl **)self->_selector.__ptr_.__value_);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      vg::frame_selection::VGEarFrameSelector::leftEarEnrolledYawToBoundingBox((vg::frame_selection::VGEarFrameSelector *)self->_selector.__ptr_.__value_);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      detail::getEarFrameData(v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setLeftEarFrames:", v50);

      vg::frame_selection::VGEarFrameSelector::rightEarEnrolledPoses((vg::frame_selection::VGEarFrameSelectorImpl **)self->_selector.__ptr_.__value_);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      vg::frame_selection::VGEarFrameSelector::rightEarEnrolledYawToBoundingBox((vg::frame_selection::VGEarFrameSelector *)self->_selector.__ptr_.__value_);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      detail::getEarFrameData(v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setRightEarFrames:", v53);

      objc_msgSend(v7, "setResult:", v47);
    }
    v54 = v7;

    if (__p)
    {
      v80 = __p;
      operator delete(__p);
    }
    if (v77)
    {
      v78 = v77;
      operator delete(v77);
    }
    v59[2](v59);

    v56[2](v56);
  }
  else
  {
    __VGLogSharedInstance();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_249CAD000, v31, OS_LOG_TYPE_ERROR, " Failed to rectify ear images. ", buf, 2u);
    }

    v32 = v7;
  }
  if (v89)
  {

  }
  return v7;
}

void __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightPoseStatus, 0);
  objc_storeStrong((id *)&self->_leftPoseStatus, 0);
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)&self->_rectify, 0);

  if ((char)self->_anon_78[7] < 0)
    operator delete(*(void **)&self->_earCaptureOptions.debugDataPath.__r_.var0);
  if (*((char *)&self->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l.__data_);
  std::unique_ptr<vg::frame_selection::VGEarFrameSelector>::reset[abi:ne180100]((vg::frame_selection::VGEarFrameSelectorImpl ***)&self->_selector, 0);
}

- (id).cxx_construct
{
  self->_selector.__ptr_.__value_ = 0;
  *(_OWORD *)&self->_earCaptureOptions.earPresenceThreshold = xmmword_249D3A610;
  self->_earCaptureOptions.percentileDetectionConfidence = 0.8;
  *(_OWORD *)&self->_earCaptureOptions.yawCount = xmmword_249D3A620;
  *(_OWORD *)&self->_earCaptureOptions.yawLimit = xmmword_249D3A630;
  self->_earCaptureOptions.writeDebugData = 0;
  std::string::basic_string[abi:ne180100]<0>(&self->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l.__data_, "");
  std::string::basic_string[abi:ne180100]<0>(&self->_earCaptureOptions.debugDataPath.__r_.var0, "");
  self->_anon_78[8] = 1;
  *(_DWORD *)&self->_anon_78[12] = 1083808154;
  *(_QWORD *)&self->_anon_78[16] = &unk_251B34958;
  self->_rectify.__ptr_.__value_ = 0;
  return self;
}

@end
