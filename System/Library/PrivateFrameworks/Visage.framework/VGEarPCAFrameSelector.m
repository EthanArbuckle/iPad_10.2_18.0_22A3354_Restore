@implementation VGEarPCAFrameSelector

- (VGEarPCAFrameSelector)initWithOptions:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  int v17;
  vg::ear_detection::EarBoundingBoxModel ***v18;
  vg::ear_detection::EarBoundingBoxModel ***v19;
  VGEarPCAFrameSelector *v20;
  NSObject *v21;
  NSObject *v22;
  vg::ear_detection::EarPCADetector *v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  void *__p;
  char v30;
  char v31;
  int v32;
  int v33;
  objc_super v34;
  _BYTE v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VGEarPCAFrameSelector;
  v6 = -[VGEarPCAFrameSelector init](&v34, sel_init);
  if (!v6)
  {
LABEL_14:
    v20 = 0;
    goto LABEL_20;
  }
  VGLogVGEarPCASelectionState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGEarPCAFrameSelector initWithOptions:].cold.3(v8, (uint64_t)v35, v7);
  }

  objc_msgSend(v5, "modelsRootPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    VGLogVGEarPCASelectionState();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[VGEarPCAFrameSelector initWithOptions:].cold.1();

    goto LABEL_14;
  }
  objc_msgSend(v5, "earPresenceThreshold");
  LODWORD(v25) = v11;
  objc_msgSend(v5, "earOcclusionThreshold");
  HIDWORD(v25) = v12;
  objc_msgSend(v5, "bboxVisibilityThreshold");
  v26 = v13;
  objc_msgSend(v5, "landmarkVisibilityThreshold");
  v27 = v14;
  objc_msgSend(v5, "faceYawLimit");
  v28 = v15;
  objc_msgSend(v5, "modelsRootPath");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v16, "UTF8String"));
  v31 = objc_msgSend(v5, "useEarSideSmoothPredictor");
  v32 = objc_msgSend(v5, "earSideSmoothPredictorBufferCapacity");
  objc_msgSend(v5, "earSideSmoothPredictorConfidenceThreshold");
  v33 = v17;

  vg::ear_detection::EarPCADetector::create(&v25, (uint64_t **)&v24);
  v18 = (vg::ear_detection::EarBoundingBoxModel ***)v24;
  v24 = 0;
  std::unique_ptr<vg::ear_detection::EarPCADetector>::reset[abi:ne180100]((vg::ear_detection::EarBoundingBoxModel ****)v6 + 2, v18);
  v19 = (vg::ear_detection::EarBoundingBoxModel ***)v24;
  v24 = 0;
  if (v19)
  {
    vg::ear_detection::EarPCADetector::~EarPCADetector(v19);
    MEMORY[0x24BD02D60]();
  }
  if (*((_QWORD *)v6 + 2))
  {
    objc_storeStrong((id *)v6 + 1, a3);
    *((_DWORD *)v6 + 305) = 0;
    *((_QWORD *)v6 + 153) = 0;
    *((_BYTE *)v6 + 1216) = 0;
    if (objc_msgSend(*((id *)v6 + 1), "useMotionBlurFilter"))
    {
      *((_BYTE *)v6 + 1232) = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v6 + 1240, 0x31uLL);
    }
    v20 = (VGEarPCAFrameSelector *)v6;
  }
  else
  {
    VGLogVGEarPCASelectionState();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[VGEarPCAFrameSelector initWithOptions:].cold.2();

    v20 = 0;
  }
  if (v30 < 0)
    operator delete(__p);
LABEL_20:

  return v20;
}

- (vector<EarFrame,)posesFromGroup:(VGEarPCAFrameSelector *)self
{
  uint64_t v6;
  EarFrame *var1;
  char *v8;
  vector<EarFrame, std::allocator<EarFrame>> *result;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  std::vector<EarFrame>::reserve((uint64_t *)retstr, 3uLL);
  v6 = 0;
  var1 = retstr->var1;
  do
  {
    v8 = (char *)a4 + v6;
    if (var1 >= retstr->var2.var0)
    {
      result = (vector<EarFrame, std::allocator<EarFrame>> *)std::vector<EarFrame>::__emplace_back_slow_path<EarFrame const&>((uint64_t *)retstr, (uint64_t)v8);
      var1 = (EarFrame *)result;
    }
    else
    {
      result = (vector<EarFrame, std::allocator<EarFrame>> *)std::construct_at[abi:ne180100]<EarFrame,EarFrame const&,EarFrame*>((uint64_t)var1, (uint64_t)v8);
      var1 += 4;
      retstr->var1 = var1;
    }
    retstr->var1 = var1;
    v6 += 192;
  }
  while (v6 != 576);
  return result;
}

- (vector<EarFrame,)leftEarEnrolledPoses
{
  return -[VGEarPCAFrameSelector posesFromGroup:](self, "posesFromGroup:", &self->_leftEarGroup);
}

- (vector<EarFrame,)rightEarEnrolledPoses
{
  return -[VGEarPCAFrameSelector posesFromGroup:](self, "posesFromGroup:", &self->_rightEarGroup);
}

- (unsigned)requiredPosesCount
{
  return -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold");
}

- (id)currentState
{
  unsigned int v3;
  unsigned int v4;
  unsigned int leftFrameCount;
  unsigned int v6;
  unsigned int v7;
  unsigned int rightFrameCount;
  unsigned int v9;
  VGEarPCASelectionState *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  _DWORD v16[2];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  VGEarPCASelectionState *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold");
  v4 = -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold");
  if (v4 >= self->_leftFrameCount)
    leftFrameCount = self->_leftFrameCount;
  else
    leftFrameCount = v4;
  v6 = -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold");
  v7 = -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold");
  if (v7 >= self->_rightFrameCount)
    rightFrameCount = self->_rightFrameCount;
  else
    rightFrameCount = v7;
  v9 = 2 * -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold");
  v10 = objc_alloc_init(VGEarPCASelectionState);
  -[VGEarPCASelectionState setFailed:](v10, "setFailed:", v9 == 0);
  v11 = v6 - rightFrameCount + v3 - leftFrameCount;
  VGLogVGEarPCASelectionState();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = v11;
    v17 = 1024;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_249CAD000, v12, OS_LOG_TYPE_DEBUG, "%u/%u %@", (uint8_t *)v16, 0x18u);
  }

  -[VGEarPCASelectionState setLeftFrameCount:](v10, "setLeftFrameCount:", self->_leftFrameCount);
  -[VGEarPCASelectionState setRightFrameCount:](v10, "setRightFrameCount:", self->_rightFrameCount);
  -[VGEarPCASelectionState setLeftEarCompleted:](v10, "setLeftEarCompleted:", self->_leftFrameCount >= -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold"));
  -[VGEarPCASelectionState setRightEarCompleted:](v10, "setRightEarCompleted:", self->_rightFrameCount >= -[VGEarPCACaptureOptions frameCountThreshold](self->_options, "frameCountThreshold"));
  if (!-[VGEarPCASelectionState failed](v10, "failed"))
  {
    if (-[VGEarPCASelectionState leftEarCompleted](v10, "leftEarCompleted"))
      v13 = -[VGEarPCASelectionState rightEarCompleted](v10, "rightEarCompleted");
    else
      v13 = 0;
    -[VGEarPCASelectionState setCompleted:](v10, "setCompleted:", v13);
    if (v9)
    {
      *(float *)&v14 = (float)(v9 - v11) / (float)v9;
      -[VGEarPCASelectionState setProgress:](v10, "setProgress:", v14);
    }
  }
  return v10;
}

- (float)getMotionBlurScoreFromLandmarks:()vector<float isEarDetected:(std:(BOOL)a4 :(id *)a5 allocator<float>> *)a3 frameTimestamp:
{
  float v9;
  float v10;
  unint64_t v11;
  uint64_t *p_previousFrameTimestampMS;
  NSObject *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  float v27;
  float v28;
  char *v29;
  unint64_t v30;
  float *v31;
  float32x2_t v32;
  float v33;
  float *v34;
  float *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  float *v41;
  int v42;
  NSObject *v43;
  void *__p;
  float *v46;
  float *v47;
  void *__src;
  char *v49;
  char *v50;
  CMTime time;
  uint8_t buf[4];
  unint64_t v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[VGEarPCACaptureOptions motionBlurFilterThreshold](self->_options, "motionBlurFilterThreshold");
  v10 = v9;
  if (a4)
  {
    time = (CMTime)*a5;
    v11 = (unint64_t)(CMTimeGetSeconds(&time) * 1000.0);
    p_previousFrameTimestampMS = (uint64_t *)&self->_previousFrameTimestampMS;
    if (self->_previousFrameTimestampMS <= v11)
    {
      __src = 0;
      v49 = 0;
      v50 = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__src, 0x31uLL);
      v14 = 0;
      v15 = v49;
      do
      {
        v16 = *(_QWORD *)&a3->var0[2 * v14];
        if (v15 >= v50)
        {
          v17 = (v15 - (_BYTE *)__src) >> 3;
          if ((unint64_t)(v17 + 1) >> 61)
            std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
          v18 = (v50 - (_BYTE *)__src) >> 2;
          if (v18 <= v17 + 1)
            v18 = v17 + 1;
          if ((unint64_t)(v50 - (_BYTE *)__src) >= 0x7FFFFFFFFFFFFFF8)
            v19 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOSurface * {__strong}>>((uint64_t)&v50, v19);
          else
            v20 = 0;
          v21 = &v20[8 * v17];
          *(_QWORD *)v21 = v16;
          v15 = v21 + 8;
          v23 = (char *)__src;
          v22 = v49;
          if (v49 != __src)
          {
            do
            {
              v24 = *((_QWORD *)v22 - 1);
              v22 -= 8;
              *((_QWORD *)v21 - 1) = v24;
              v21 -= 8;
            }
            while (v22 != v23);
            v22 = (char *)__src;
          }
          __src = v21;
          v49 = v15;
          v50 = &v20[8 * v19];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *(_QWORD *)v15 = v16;
          v15 += 8;
        }
        v49 = v15;
        ++v14;
      }
      while (v14 != 49);
      v25 = (char *)__src;
      if (self->_hasPreviousLandmarks)
      {
        v26 = *p_previousFrameTimestampMS;
        __p = 0;
        v46 = 0;
        v47 = 0;
        std::vector<float>::reserve(&__p, (v15 - (_BYTE *)__src) >> 3);
        v27 = (float)(v11 - v26);
        v28 = v27 / 30.0;
        v29 = (char *)__src;
        if (v49 != __src)
        {
          v30 = 0;
          v31 = v46;
          do
          {
            v32 = vsub_f32(*(float32x2_t *)&v29[8 * v30], (float32x2_t)self->_previousLandmarksCoords.var0[v30]);
            v33 = (float)(vaddv_f32(vmul_f32(v32, v32)) / v27) / v28;
            if (v31 >= v47)
            {
              v35 = (float *)__p;
              v36 = ((char *)v31 - (_BYTE *)__p) >> 2;
              v37 = v36 + 1;
              if ((unint64_t)(v36 + 1) >> 62)
                std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
              v38 = (char *)v47 - (_BYTE *)__p;
              if (((char *)v47 - (_BYTE *)__p) >> 1 > v37)
                v37 = v38 >> 1;
              if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
                v39 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v39 = v37;
              if (v39)
              {
                v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v47, v39);
                v35 = (float *)__p;
                v31 = v46;
              }
              else
              {
                v40 = 0;
              }
              v41 = (float *)&v40[4 * v36];
              *v41 = v33;
              v34 = v41 + 1;
              while (v31 != v35)
              {
                v42 = *((_DWORD *)v31-- - 1);
                *((_DWORD *)v41-- - 1) = v42;
              }
              __p = v41;
              v46 = v34;
              v47 = (float *)&v40[4 * v39];
              if (v35)
                operator delete(v35);
            }
            else
            {
              *v31 = v33;
              v34 = v31 + 1;
            }
            v46 = v34;
            ++v30;
            v29 = (char *)__src;
            v31 = v34;
          }
          while (v30 < (v49 - (_BYTE *)__src) >> 3);
        }
        v10 = vg::shared::computeMedian<float>((uint64_t)&__p);
        VGLogVGEarPCASelectionState();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218496;
          v53 = v11;
          v54 = 2048;
          v55 = v10;
          v56 = 2048;
          v57 = v28;
          _os_log_debug_impl(&dword_249CAD000, v43, OS_LOG_TYPE_DEBUG, "Frame#%zu has median velocity of landmarks: %g (averaged over %g frames)", buf, 0x20u);
        }

        if (__p)
        {
          v46 = (float *)__p;
          operator delete(__p);
        }
        v25 = (char *)__src;
      }
      if (&self->_previousLandmarksCoords != (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)&__src)
      {
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)&self->_previousLandmarksCoords, v25, (uint64_t)v49, (v49 - v25) >> 3);
        v25 = (char *)__src;
      }
      self->_hasPreviousLandmarks = 1;
      self->_previousFrameTimestampMS = v11;
      if (v25)
      {
        v49 = v25;
        operator delete(v25);
      }
    }
    else
    {
      VGLogVGEarPCASelectionState();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[VGEarPCAFrameSelector getMotionBlurScoreFromLandmarks:isEarDetected:frameTimestamp:].cold.1(p_previousFrameTimestampMS, v11, v13);

    }
  }
  else
  {
    self->_hasPreviousLandmarks = 0;
  }
  return v10;
}

- (id)addPoseWithCaptureData:(id)a3 faceYaw:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  double Seconds;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int v18;
  double v19;
  VGCaptureData *v20;
  VGEarPCACaptureOptions *options;
  NSObject *v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  float v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47[3];
  void *v48;
  void *v49;
  uint64_t v50;
  _OWORD v51[8];
  void *v52;
  void *v53;
  uint64_t v54;
  void *__p;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66[2];
  void *v67[2];
  __int128 v68;
  CMTime time;
  EarFrame location;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void *v77[2];
  void *v78[2];
  __int128 v79;
  _OWORD v80[8];
  void *__src;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  char v85;
  unsigned int v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[VGEarPCAFrameSelector currentState](self, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetectionError:", 1);
  if (!objc_msgSend(v9, "failed"))
  {
    if (v7)
      objc_msgSend(v7, "timestamp");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v7, "yuvRectified"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      VGLogVGEarPCASelectionState();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:].cold.1();

      v10 = v9;
      goto LABEL_65;
    }
    CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v7, "depth"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      VGLogVGEarPCASelectionState();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:].cold.2();

      v10 = v9;
      goto LABEL_64;
    }
    if (v8)
    {
      objc_msgSend(v8, "floatValue");
      v15 = 0x100000000;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    vg::ear_detection::EarPCADetector::detectPCA((uint64_t *)self->_earPCADetector.__ptr_.__value_, v12, v13, v15 | v14, (uint64_t)v80);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    BYTE12(v63) = 0;
    LOBYTE(v64) = 0;
    *(_OWORD *)v66 = 0u;
    *(_OWORD *)v67 = 0u;
    v68 = 0u;
    if (v85)
    {
      v62 = v80[4];
      v63 = v80[5];
      v64 = v80[6];
      v65 = v80[7];
      v58 = v80[0];
      v59 = v80[1];
      v60 = v80[2];
      v61 = v80[3];
      std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v66, (char *)__src, v82, (v82 - (uint64_t)__src) >> 2);
      std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v67[1], (char *)v83, v84, (v84 - (uint64_t)v83) >> 2);
    }
    v18 = v86;
    objc_msgSend(v9, "setDetectionError:", v86);
    v51[4] = v62;
    v51[5] = v63;
    v51[6] = v64;
    v51[7] = v65;
    v51[0] = v58;
    v51[1] = v59;
    v51[2] = v60;
    v51[3] = v61;
    v53 = 0;
    v54 = 0;
    v52 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v52, v66[0], (uint64_t)v66[1], ((char *)v66[1] - (char *)v66[0]) >> 2);
    __p = 0;
    v56 = 0;
    v57 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v67[1], v68, (uint64_t)(v68 - (unint64_t)v67[1]) >> 2);
    objc_msgSend(v9, "setPose:", v51);
    if (__p)
    {
      v56 = __p;
      operator delete(__p);
    }
    v19 = Seconds * 1000.0;
    if (v52)
    {
      v53 = v52;
      operator delete(v52);
    }
    v20 = (VGCaptureData *)v19;
    options = self->_options;
    if (v18)
    {
      if (-[VGEarPCACaptureOptions useMotionBlurFilter](options, "useMotionBlurFilter"))
        self->_hasPreviousLandmarks = 0;
      VGLogVGEarPCASelectionState();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:].cold.4((unint64_t)v19, v22, v23);

LABEL_29:
      v10 = v9;
LABEL_59:
      if (v67[1])
      {
        *(void **)&v68 = v67[1];
        operator delete(v67[1]);
      }
      if (v66[0])
      {
        v66[1] = v66[0];
        operator delete(v66[0]);
      }
      std::__optional_destruct_base<vg::ear_detection::EarPose,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v80);
LABEL_64:

LABEL_65:
      goto LABEL_66;
    }
    if (-[VGEarPCACaptureOptions useMotionBlurFilter](options, "useMotionBlurFilter"))
    {
      v48 = 0;
      v49 = 0;
      v50 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v48, v66[0], (uint64_t)v66[1], ((char *)v66[1] - (char *)v66[0]) >> 2);
      if (v7)
        objc_msgSend(v7, "timestamp");
      else
        memset(v47, 0, sizeof(v47));
      -[VGEarPCAFrameSelector getMotionBlurScoreFromLandmarks:isEarDetected:frameTimestamp:](self, "getMotionBlurScoreFromLandmarks:isEarDetected:frameTimestamp:", &v48, 1, v47);
      v25 = v24;
      if (v48)
      {
        v49 = v48;
        operator delete(v48);
      }
      -[VGEarPCACaptureOptions motionBlurFilterThreshold](self->_options, "motionBlurFilterThreshold");
      v27 = v26;
      VGLogVGEarPCASelectionState();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      if (v25 >= v27)
      {
        if (v29)
        {
          -[VGEarPCACaptureOptions motionBlurFilterThreshold](self->_options, "motionBlurFilterThreshold");
          LODWORD(location.captureData) = 134218496;
          *(VGCaptureData **)((char *)&location.captureData + 4) = v20;
          LOWORD(location.pose.lmPCA.__elems_[0]) = 2048;
          *(double *)((char *)location.pose.lmPCA.__elems_ + 2) = v25;
          HIWORD(location.pose.lmPCA.__elems_[2]) = 2048;
          *(double *)&location.pose.faceYawAngle = v32;
          _os_log_debug_impl(&dword_249CAD000, v28, OS_LOG_TYPE_DEBUG, "Frame#%zu rejected because of motion blur score greater or equal to threshold (%g >= %g)", (uint8_t *)&location, 0x20u);
        }

        objc_msgSend(v9, "setDetectionError:", 5);
        goto LABEL_29;
      }
      if (v29)
        -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:].cold.3((uint64_t)v20, v28, v25);

    }
    ++self->_frameCount;
    location.captureData = 0;
    *(_OWORD *)&location.pose.yawAngle = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    BYTE12(v74) = 0;
    LOBYTE(v75) = 0;
    *(_OWORD *)v77 = 0u;
    *(_OWORD *)v78 = 0u;
    v79 = 0u;
    objc_storeStrong((id *)&location.captureData, a3);
    v73 = v62;
    v74 = v63;
    v75 = v64;
    v76 = v65;
    *(_OWORD *)&location.pose.lmPCA.__elems_[1] = v58;
    *(_OWORD *)&location.pose.yawAngle = v59;
    v71 = v60;
    v72 = v61;
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v77, (char *)v66[0], (uint64_t)v66[1], ((char *)v66[1] - (char *)v66[0]) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v78[1], (char *)v67[1], v68, (uint64_t)(v68 - (unint64_t)v67[1]) >> 2);
    if ((_DWORD)v58 == 1)
    {
      v30 = 1224;
    }
    else
    {
      if ((_DWORD)v58)
      {
LABEL_48:
        -[VGEarPCAFrameSelector currentState](self, "currentState");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDetectionError:", 0);
        v37 = v62;
        v38 = v63;
        v39 = v64;
        v40 = v65;
        v33 = v58;
        v34 = v59;
        v35 = v60;
        v36 = v61;
        v42 = 0;
        v43 = 0;
        v41 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v41, v66[0], (uint64_t)v66[1], ((char *)v66[1] - (char *)v66[0]) >> 2);
        v44 = 0;
        v45 = 0;
        v46 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v44, v67[1], v68, (uint64_t)(v68 - (unint64_t)v67[1]) >> 2);
        objc_msgSend(v10, "setPose:", &v33);
        if (v44)
        {
          v45 = v44;
          operator delete(v44);
        }
        if (v41)
        {
          v42 = v41;
          operator delete(v41);
        }
        objc_msgSend(v10, "setLeftEarCompleted:", objc_msgSend(v9, "leftEarCompleted", v33, v34, v35, v36, v37, v38, v39, v40));
        objc_msgSend(v10, "setRightEarCompleted:", objc_msgSend(v9, "rightEarCompleted"));
        if (objc_msgSend(v10, "completed"))
          self->_selectionCompleted = 1;
        if (v78[1])
        {
          *(void **)&v79 = v78[1];
          operator delete(v78[1]);
        }
        if (v77[0])
        {
          v77[1] = v77[0];
          operator delete(v77[0]);
        }

        goto LABEL_59;
      }
      v30 = 1228;
    }
    ++*(_DWORD *)((char *)&self->super.isa + v30);
    goto LABEL_48;
  }
  v10 = v9;
LABEL_66:

  return v10;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  uint64_t i;
  char *v5;
  void *v6;
  void *v7;
  uint64_t j;
  char *v9;
  void *v10;
  void *v11;

  var0 = self->_previousLandmarksCoords.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_4e0 = var0;
    operator delete(var0);
  }
  for (i = 0; i != -576; i -= 192)
  {
    v5 = (char *)self + i;
    v6 = *(void **)&self->_anon_308[i + 400];
    if (v6)
    {
      *((_QWORD *)v5 + 148) = v6;
      operator delete(v6);
    }
    v7 = (void *)*((_QWORD *)v5 + 144);
    if (v7)
    {
      *(_QWORD *)&self->_anon_308[i + 384] = v7;
      operator delete(v7);
    }

  }
  for (j = 0; j != -576; j -= 192)
  {
    v9 = (char *)self + j;
    v10 = *(void **)&self->_anon_b8[j + 400];
    if (v10)
    {
      *((_QWORD *)v9 + 74) = v10;
      operator delete(v10);
    }
    v11 = (void *)*((_QWORD *)v9 + 70);
    if (v11)
    {
      *(_QWORD *)&self->_anon_b8[j + 384] = v11;
      operator delete(v11);
    }

  }
  std::unique_ptr<vg::ear_detection::EarPCADetector>::reset[abi:ne180100]((vg::ear_detection::EarBoundingBoxModel ****)&self->_earPCADetector, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id).cxx_construct
{
  uint64_t v2;
  char *v3;
  uint64_t i;
  char *v5;

  v2 = 0;
  *((_QWORD *)self + 2) = 0;
  do
  {
    v3 = (char *)self + v2;
    *((_QWORD *)v3 + 4) = 0;
    *((_OWORD *)v3 + 4) = 0uLL;
    *((_OWORD *)v3 + 5) = 0uLL;
    *((_OWORD *)v3 + 6) = 0uLL;
    *((_OWORD *)v3 + 7) = 0uLL;
    v3[140] = 0;
    v3[144] = 0;
    *((_OWORD *)v3 + 11) = 0uLL;
    *((_OWORD *)v3 + 12) = 0uLL;
    v2 += 192;
    *((_OWORD *)v3 + 13) = 0uLL;
  }
  while (v2 != 576);
  for (i = 0; i != 576; i += 192)
  {
    v5 = (char *)self + i;
    *((_QWORD *)v5 + 78) = 0;
    *((_OWORD *)v5 + 41) = 0uLL;
    *((_OWORD *)v5 + 42) = 0uLL;
    *((_OWORD *)v5 + 43) = 0uLL;
    *((_OWORD *)v5 + 44) = 0uLL;
    v5[732] = 0;
    v5[736] = 0;
    *((_OWORD *)v5 + 48) = 0uLL;
    *((_OWORD *)v5 + 49) = 0uLL;
    *((_OWORD *)v5 + 50) = 0uLL;
  }
  *((_QWORD *)self + 157) = 0;
  *(_OWORD *)((char *)self + 1240) = 0u;
  return self;
}

- (void)initWithOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_249CAD000, v0, v1, "Unable to initialize due to nil models root path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_249CAD000, v0, v1, "Failed to create earPCADetector.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithOptions:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_249CAD000, a3, (uint64_t)a3, "Ear frame selection options: %@", (uint8_t *)a2);

}

- (void)getMotionBlurScoreFromLandmarks:(uint64_t *)a1 isEarDetected:(uint64_t)a2 frameTimestamp:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218496;
  v5 = a2;
  v6 = 2048;
  v7 = a2;
  v8 = 2048;
  v9 = v3;
  _os_log_error_impl(&dword_249CAD000, log, OS_LOG_TYPE_ERROR, "Frame#%zu has timestamp value lower than the timestamp of the previously processed frame (%zu < %zu)", (uint8_t *)&v4, 0x20u);
}

- (void)addPoseWithCaptureData:faceYaw:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_249CAD000, v0, v1, "color image must be IOSurface backend.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addPoseWithCaptureData:faceYaw:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_249CAD000, v0, v1, "depth image must be IOSurface backend.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)addPoseWithCaptureData:(float)a3 faceYaw:.cold.3(uint64_t a1, NSObject *a2, float a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_249CAD000, a2, OS_LOG_TYPE_DEBUG, "Frame#%zu selected by motion blur filter with score: %g", (uint8_t *)&v3, 0x16u);
}

- (void)addPoseWithCaptureData:(uint64_t)a3 faceYaw:.cold.4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_249CAD000, a2, a3, "Frame#%zu rejected because No Ear detected", (uint8_t *)&v3);
}

@end
