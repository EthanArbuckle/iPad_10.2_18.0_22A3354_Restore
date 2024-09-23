@implementation VGHRTFEarPCACaptureProcessor

- (VGHRTFEarPCACaptureProcessor)initWithDebugDataPath:(id)a3 withModelsRootPath:(id)a4
{
  id v6;
  id v7;
  VGHRTFEarPCACaptureProcessor *v8;
  VGHRTFEarPCACaptureProcessor *v9;
  VGEarPCACaptureOptions *v10;
  VGEarPCACaptureOptions *earCaptureOptions;
  void *v12;
  VGEarPCAFrameSelector *v13;
  VGEarPCAFrameSelector *selector;
  vg::hrtf::Rectify *v15;
  vg::hrtf::Rectify **p_rectify;
  vg::hrtf::Rectify *v17;
  vg::hrtf::Rectify *v18;
  uint64_t v19;
  VGHRTFEarPCACaptureProcessor *v20;
  NSObject *v21;
  const char *v22;
  vg::hrtf::Rectify *v24[2];
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)VGHRTFEarPCACaptureProcessor;
  v8 = -[VGHRTFEarPCACaptureProcessor init](&v25, sel_init);
  v9 = v8;
  if (!v8)
  {
    __VGLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(v24[0]) = 0;
    v22 = " Failed to initialize VGHRTFCaptureProcessor ";
LABEL_15:
    _os_log_impl(&dword_249CAD000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)v24, 2u);
    goto LABEL_16;
  }
  v10 = -[VGEarPCACaptureOptions initWithSuiteName:]([VGEarPCACaptureOptions alloc], "initWithSuiteName:", CFSTR("com.apple.visage"));
  earCaptureOptions = v8->_earCaptureOptions;
  v8->_earCaptureOptions = v10;

  -[VGEarPCACaptureOptions setWriteDebugData:](v8->_earCaptureOptions, "setWriteDebugData:", v6 != 0);
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("EarPCACapture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGEarPCACaptureOptions setDebugDataPath:](v8->_earCaptureOptions, "setDebugDataPath:", v12);

  }
  -[VGEarPCACaptureOptions setModelsRootPath:](v8->_earCaptureOptions, "setModelsRootPath:", v7);
  v13 = -[VGEarPCAFrameSelector initWithOptions:]([VGEarPCAFrameSelector alloc], "initWithOptions:", v8->_earCaptureOptions);
  selector = v8->_selector;
  v8->_selector = v13;

  if (!v8->_selector)
  {
    __VGLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(v24[0]) = 0;
    v22 = " Failed to initialize ear frame selector. ";
    goto LABEL_15;
  }
  vg::hrtf::Rectify::create(v15, v24);
  p_rectify = (vg::hrtf::Rectify **)&v8->_rectify;
  v17 = v24[0];
  v24[0] = 0;
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100](p_rectify, v17);
  v18 = v24[0];
  v24[0] = 0;
  if (v18)
  {
    vg::hrtf::Rectify::~Rectify(v18);
    MEMORY[0x24BD02D60](v19);
  }
  if (!*p_rectify)
  {
    __VGLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24[0]) = 0;
      v22 = " Failed to initialize image rectify. ";
      goto LABEL_15;
    }
LABEL_16:

    v20 = 0;
    goto LABEL_17;
  }
  v20 = v9;
LABEL_17:

  return v20;
}

- (id)defaultUpdateData
{
  unsigned int v2;
  void *v3;
  unsigned int i;
  void *v5;
  id v6;
  double v7;

  v2 = -[VGEarPCACaptureOptions frameCountThreshold](self->_earCaptureOptions, "frameCountThreshold");
  v3 = (void *)objc_opt_new();
  if (v2)
  {
    for (i = 0; i != v2; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v5);

    }
  }
  v6 = -[VGHRTFEarCaptureUpdateData initEmpty]([VGHRTFEarCaptureUpdateData alloc], "initEmpty");
  objc_msgSend(v6, "setProgressType:", 0);
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setProgress:", v7);
  objc_msgSend(v6, "setLeftEarStatusList:", v3);
  objc_msgSend(v6, "setRightEarStatusList:", v3);
  objc_msgSend(v6, "setTrackedData:", 0);
  objc_msgSend(v6, "setResult:", 0);

  return v6;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4
{
  id v6;
  void *v7;
  Rectify *value;
  IOSurface *v9;
  IOSurface *v10;
  simd_float3 v11;
  simd_float3 v12;
  simd_float3 v13;
  VGHRTFDepthCalibrationData *v14;
  CVPixelBufferRef CVPixelBufferFromIOSurface;
  uint64_t v16;
  CVPixelBufferRef v17;
  Float64 v18;
  VGEarPCAFrameSelector *selector;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  int v24;
  int v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  size_t Width;
  size_t Height;
  __int128 v35;
  BOOL v36;
  uint64_t v37;
  BOOL v38;
  float v39;
  float v40;
  NSObject *v41;
  double v42;
  _DWORD *i;
  _DWORD *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  VGEarPCAFrameSelector *v50;
  void *v51;
  VGEarPCAFrameSelector *v52;
  void *v53;
  void (**v55)(_QWORD);
  void (**v56)(_QWORD);
  id v57;
  id v58;
  simd_float3 v59;
  void *v60;
  simd_float3 v61;
  id v62;
  simd_float3 v63;
  void *v64;
  CMTime v65;
  CMTime v66;
  _QWORD v67[5];
  _QWORD v68[5];
  uint8_t v69[16];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void *v77[2];
  __int128 v78;
  __int128 v79;
  uint8_t buf[16];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void *v88[2];
  void *v89[2];
  __int128 v90;
  IOSurface *v91[8];
  IOSurface *v92;
  __int128 v93;
  __int128 v94;
  double v95;
  char v96;
  uint64_t v97;
  simd_float3x3 v98;

  v97 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v58 = a4;
  -[VGHRTFEarPCACaptureProcessor defaultUpdateData](self, "defaultUpdateData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_rectify.__ptr_.__value_;
  objc_msgSend(v6, "colorBuffer");
  v9 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "depthBuffer");
  v10 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorIntrinsics");
  v61 = v12;
  v63 = v11;
  v59 = v13;
  objc_msgSend(v6, "depthCalibrationData");
  v14 = (VGHRTFDepthCalibrationData *)objc_claimAutoreleasedReturnValue();
  v98.columns[1] = v61;
  v98.columns[0] = v63;
  v98.columns[2] = v59;
  vg::hrtf::Rectify::process((vg::hrtf::Rectify *)value, v9, v10, v98, v14, (uint64_t)v91);

  if (v96)
  {
    v64 = (void *)objc_opt_new();
    if (!v96)
      std::__throw_bad_optional_access[abi:ne180100]();
    CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v92);
    v16 = MEMORY[0x24BDAC760];
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke;
    v68[3] = &__block_descriptor_40_e5_v8__0l;
    v68[4] = CVPixelBufferFromIOSurface;
    v55 = (void (**)(_QWORD))MEMORY[0x24BD03294](v68);
    objc_msgSend(v64, "setDepth:", CVPixelBufferFromIOSurface);
    if (!v96)
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v64, "setDepthIntrinsics:", *(double *)&v93, *(double *)&v94, v95);
    if (!v96)
      std::__throw_bad_optional_access[abi:ne180100]();
    v17 = createCVPixelBufferFromIOSurface(v91[0]);
    v67[0] = v16;
    v67[1] = 3221225472;
    v67[2] = __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke_2;
    v67[3] = &__block_descriptor_40_e5_v8__0l;
    v67[4] = v17;
    v56 = (void (**)(_QWORD))MEMORY[0x24BD03294](v67);
    objc_msgSend(v64, "setYuvRectified:", v17);
    if (!v96)
      std::__throw_bad_optional_access[abi:ne180100]();
    objc_msgSend(v64, "setVideoIntrinsics:", *(double *)&v91[2], *(double *)&v91[4], *(double *)&v91[6]);
    objc_msgSend(v6, "timestamp");
    CMTimeMakeWithSeconds(&v66, v18, 1000000);
    v65 = v66;
    objc_msgSend(v64, "setTimestamp:", &v65);
    selector = self->_selector;
    objc_msgSend(v58, "yawAngle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:](selector, "addPoseWithCaptureData:faceYaw:", v64, v20);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v60, "completed"))
    {
      if (objc_msgSend(v60, "failed"))
        v21 = 2;
      else
        v21 = 3;
    }
    else
    {
      v21 = 1;
    }
    objc_msgSend(v60, "progress");
    v25 = v24;
    objc_msgSend(v7, "setProgressType:", v21);
    LODWORD(v26) = v25;
    objc_msgSend(v7, "setProgress:", v26);
    -[VGEarPCAFrameSelector currentState](self->_selector, "currentState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    detail::getEarPoseList((detail *)objc_msgSend(v27, "leftFrameCount"), -[VGEarPCAFrameSelector requiredPosesCount](self->_selector, "requiredPosesCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftEarStatusList:", v28);

    -[VGEarPCAFrameSelector currentState](self->_selector, "currentState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    detail::getEarPoseList((detail *)objc_msgSend(v29, "rightFrameCount"), -[VGEarPCAFrameSelector requiredPosesCount](self->_selector, "requiredPosesCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightEarStatusList:", v30);

    v62 = -[VGHRTFEarCaptureProcessedData initEmpty]([VGHRTFEarCaptureProcessedData alloc], "initEmpty");
    v31 = v60;
    v22 = v64;
    if (objc_msgSend(v31, "detectionError"))
    {
      v32 = 0;
LABEL_67:

      objc_msgSend(v62, "setDetectionData:", v32);
      objc_msgSend(v6, "colorBuffer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setRectifiedColorBuffer:", v46);

      v47 = 8;
      switch(objc_msgSend(v31, "detectionError"))
      {
        case 0u:
          goto LABEL_92;
        case 1u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear not found. ", buf, 2u);
          }
          v47 = 0;
          goto LABEL_91;
        case 2u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear detection failed: low landmark confidence. ", buf, 2u);
          }
          v47 = 5;
          goto LABEL_91;
        case 3u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Front facing pose ", buf, 2u);
          }
          v47 = 6;
          goto LABEL_91;
        case 4u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear occluded. ", buf, 2u);
          }
          v47 = 1;
          goto LABEL_91;
        case 5u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          v47 = 2;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v47 = 2;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear motion blur detected. ", buf, 2u);
          }
          goto LABEL_91;
        case 6u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear too close to camera. ", buf, 2u);
          }
          v47 = 3;
          goto LABEL_91;
        case 7u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear too far from camera. ", buf, 2u);
          }
          v47 = 4;
          goto LABEL_91;
        case 8u:
          __VGLogSharedInstance();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_249CAD000, v48, OS_LOG_TYPE_DEBUG, " Ear out of frame ", buf, 2u);
          }
          v47 = 7;
LABEL_91:

LABEL_92:
          objc_msgSend(v62, "setError:", v47);
          break;
        default:
          break;
      }
      objc_msgSend(v7, "setTrackedData:", v62);
      if (objc_msgSend(v7, "progressType") == 3)
      {
        v49 = -[VGHRTFEarsFrameData initEmpty]([VGHRTFEarsFrameData alloc], "initEmpty");
        v50 = self->_selector;
        if (v50)
        {
          -[VGEarPCAFrameSelector leftEarEnrolledPoses](v50, "leftEarEnrolledPoses");
        }
        else
        {
          memset(buf, 0, sizeof(buf));
          *(_QWORD *)&v81 = 0;
        }
        detail::getEarFrameData((uint64_t *)buf);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setLeftEarFrames:", v51);

        *(_QWORD *)v69 = buf;
        std::vector<EarFrame>::__destroy_vector::operator()[abi:ne180100]((void ***)v69);
        v52 = self->_selector;
        if (v52)
        {
          -[VGEarPCAFrameSelector rightEarEnrolledPoses](v52, "rightEarEnrolledPoses");
        }
        else
        {
          memset(buf, 0, sizeof(buf));
          *(_QWORD *)&v81 = 0;
        }
        detail::getEarFrameData((uint64_t *)buf);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setRightEarFrames:", v53);

        *(_QWORD *)v69 = buf;
        std::vector<EarFrame>::__destroy_vector::operator()[abi:ne180100]((void ***)v69);
        objc_msgSend(v7, "setResult:", v49);

      }
      v23 = v7;

      v56[2](v56);
      v55[2](v55);

      goto LABEL_102;
    }
    v57 = -[VGHRTFEarCaptureDetectionData initEmpty]([VGHRTFEarCaptureDetectionData alloc], "initEmpty");
    if (v31)
    {
      objc_msgSend(v31, "pose");
    }
    else
    {
      *(_OWORD *)v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      *(_OWORD *)v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      *(_OWORD *)buf = 0u;
    }
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)-[NSObject yuvRectified](v22, "yuvRectified"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)-[NSObject yuvRectified](v22, "yuvRectified"));
    v35 = v87;
    if (v31)
    {
      objc_msgSend(v31, "pose");
      v36 = *(_DWORD *)v69 == 0;
      if (*((_QWORD *)&v78 + 1))
      {
        *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
        operator delete(*((void **)&v78 + 1));
      }
    }
    else
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      *(_OWORD *)v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v36 = 1;
      *(_OWORD *)v69 = 0u;
    }
    if (v77[0])
    {
      v77[1] = v77[0];
      operator delete(v77[0]);
    }
    if (v36)
    {
      v37 = 0;
    }
    else
    {
      if (v31)
      {
        objc_msgSend(v31, "pose");
        v38 = *(_DWORD *)v69 == 1;
        if (*((_QWORD *)&v78 + 1))
        {
          *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
          operator delete(*((void **)&v78 + 1));
        }
      }
      else
      {
        v38 = 0;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        *(_OWORD *)v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        *(_OWORD *)v69 = 0u;
      }
      if (v77[0])
      {
        v77[1] = v77[0];
        operator delete(v77[0]);
      }
      if (!v38)
      {
        __VGLogSharedInstance();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_249CAD000, v41, OS_LOG_TYPE_ERROR, " No suitable conversion supported for ear side. ", v69, 2u);
        }
        v32 = 0;
        goto LABEL_62;
      }
      v37 = 1;
    }
    objc_msgSend(v57, "setEarSide:", v37);
    if (v31)
    {
      objc_msgSend(v31, "pose");
      v39 = *((float *)&v75 + 1);
    }
    else
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      *(_OWORD *)v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v39 = 0.0;
      *(_OWORD *)v69 = 0u;
    }
    objc_msgSend(v57, "setYawAngle:", v39);
    if (*((_QWORD *)&v78 + 1))
    {
      *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
      operator delete(*((void **)&v78 + 1));
    }
    if (v77[0])
    {
      v77[1] = v77[0];
      operator delete(v77[0]);
    }
    if (v31)
    {
      objc_msgSend(v31, "pose");
      v40 = *((float *)&v75 + 2);
    }
    else
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      *(_OWORD *)v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v40 = 0.0;
      *(_OWORD *)v69 = 0u;
    }
    objc_msgSend(v57, "setPitchAngle:", v40);
    if (*((_QWORD *)&v78 + 1))
    {
      *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
      operator delete(*((void **)&v78 + 1));
    }
    if (v77[0])
    {
      v77[1] = v77[0];
      operator delete(v77[0]);
    }
    objc_msgSend(v57, "setBoundingBox:", (float)(*(float *)&v35 * (float)Width), (float)(*((float *)&v35 + 1) * (float)Height), (float)((float)(*((float *)&v35 + 2) - *(float *)&v35) * (float)Width), (float)((float)(*((float *)&v35 + 3) - *((float *)&v35 + 1)) * (float)Height));
    v41 = objc_opt_new();
    if (v31)
    {
      objc_msgSend(v31, "pose");
      v44 = v77[0];
      for (i = v77[1]; v44 != i; ++v44)
      {
        LODWORD(v42) = *v44;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v41, "addObject:", v45);

      }
    }
    else
    {
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      *(_OWORD *)v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      *(_OWORD *)v69 = 0u;
    }
    if (*((_QWORD *)&v78 + 1))
    {
      *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
      operator delete(*((void **)&v78 + 1));
    }
    if (v77[0])
    {
      v77[1] = v77[0];
      operator delete(v77[0]);
    }
    objc_msgSend(v57, "setLandmarkPoints:", v41);
    v32 = v57;
LABEL_62:

    if (v89[1])
    {
      *(void **)&v90 = v89[1];
      operator delete(v89[1]);
    }
    if (v88[0])
    {
      v88[1] = v88[0];
      operator delete(v88[0]);
    }

    goto LABEL_67;
  }
  __VGLogSharedInstance();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249CAD000, v22, OS_LOG_TYPE_ERROR, " Failed to rectify ear images. ", buf, 2u);
  }
  v23 = 0;
LABEL_102:

  if (v96)
  {

  }
  return v23;
}

void __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

- (void).cxx_destruct
{
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)&self->_rectify, 0);
  objc_storeStrong((id *)&self->_earCaptureOptions, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
