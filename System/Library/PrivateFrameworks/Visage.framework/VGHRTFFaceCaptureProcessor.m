@implementation VGHRTFFaceCaptureProcessor

- (VGHRTFFaceCaptureProcessor)initWithDebugDataPath:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  double v7;
  VGFaceCapture *v8;
  void *v9;
  vg::hrtf::Rectify *v10;
  vg::hrtf::Rectify *v11;
  vg::hrtf::Rectify *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  VGHRTFFaceCaptureProcessor *v19;
  const char *v20;
  vg::hrtf::Rectify *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)VGHRTFFaceCaptureProcessor;
  v5 = -[VGHRTFFaceCaptureProcessor init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    LODWORD(v7) = 30.0;
    -[NSObject setYawLimit:](v6, "setYawLimit:", v7);
    -[NSObject setRequiredPitchPoses:](v6, "setRequiredPitchPoses:", 0);
    -[NSObject setWriteDebugData:](v6, "setWriteDebugData:", v4 != 0);
    -[NSObject setDebugDataPath:](v6, "setDebugDataPath:", v4);
    -[NSObject setUseFKInternalFaceDetector:](v6, "setUseFKInternalFaceDetector:", 1);
    v8 = -[VGFaceCapture initWithOptions:]([VGFaceCapture alloc], "initWithOptions:", v6);
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    if (*((_QWORD *)v5 + 1))
    {
      vg::hrtf::Rectify::create(v10, &v22);
      v11 = v22;
      v22 = 0;
      std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)v5 + 2, v11);
      v12 = v22;
      v22 = 0;
      if (v12)
      {
        vg::hrtf::Rectify::~Rectify(v12);
        MEMORY[0x24BD02D60](v13);
      }
      if (*((_QWORD *)v5 + 2))
      {
        *((_QWORD *)v5 + 3) = 0;
        *((_DWORD *)v5 + 8) = 0;
        v14 = objc_opt_new();
        v24[0] = v14;
        v24[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2, v22);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)*((_QWORD *)v5 + 5);
        *((_QWORD *)v5 + 5) = v15;

        v17 = dispatch_semaphore_create(0);
        v18 = (void *)*((_QWORD *)v5 + 6);
        *((_QWORD *)v5 + 6) = v17;

        v19 = (VGHRTFFaceCaptureProcessor *)v5;
LABEL_16:

        goto LABEL_17;
      }
      __VGLogSharedInstance();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        v20 = " Failed to initialize image rectify. ";
        goto LABEL_14;
      }
    }
    else
    {
      __VGLogSharedInstance();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        v20 = " Failed to initialize VGFaceCapture ";
LABEL_14:
        _os_log_impl(&dword_249CAD000, v14, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v22, 2u);
      }
    }
    v19 = 0;
    goto LABEL_16;
  }
  __VGLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_249CAD000, v6, OS_LOG_TYPE_ERROR, " Failed to initialize VGHRTFCaptureProcessor ", (uint8_t *)&v22, 2u);
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  Rectify *value;
  IOSurface *v12;
  IOSurface *v13;
  simd_float3 v14;
  simd_float3 v15;
  simd_float3 v16;
  VGHRTFDepthCalibrationData *v17;
  NSObject *v18;
  void *v19;
  CVPixelBufferRef CVPixelBufferFromIOSurface;
  CVPixelBufferRef v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  VGFaceMetadata *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  VGFaceMetadata *v48;
  Float64 v49;
  OS_dispatch_semaphore *v50;
  NSObject *v51;
  id v52;
  void *v53;
  float v54;
  id v55;
  void *v56;
  NSArray *v57;
  NSArray *poseStatus;
  IOSurfaceRef IOSurface;
  void *v60;
  IOSurfaceRef v61;
  NSObject *v62;
  id v63;
  simd_float3 v65;
  simd_float3 v66;
  void (**v67)(_QWORD);
  simd_float3 v68;
  void (**v69)(_QWORD);
  _QWORD v70[4];
  NSObject *v71;
  VGHRTFFaceCaptureProcessor *v72;
  id v73;
  CMTime v74;
  CMTime v75;
  _QWORD v76[5];
  _QWORD v77[5];
  uint8_t buf[16];
  uint8_t v79[8];
  double v80;
  double v81;
  double v82;
  IOSurface *v83;
  double v84;
  double v85;
  double v86;
  char v87;
  uint64_t v88;
  simd_float3x3 v89;

  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[VGHRTFFaceCaptureUpdateData initEmpty]([VGHRTFFaceCaptureUpdateData alloc], "initEmpty");
  objc_msgSend(v8, "setProgressType:", self->_captureState);
  *(float *)&v9 = self->_progress;
  objc_msgSend(v8, "setProgress:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_poseStatus, 1);
  objc_msgSend(v8, "setPoseStatusList:", v10);

  objc_msgSend(v8, "setTrackedData:", 0);
  objc_msgSend(v8, "setResult:", self->_resultsCache);
  if (v7)
  {
    value = self->_rectify.__ptr_.__value_;
    objc_msgSend(v6, "colorBuffer");
    v12 = (IOSurface *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "depthBuffer");
    v13 = (IOSurface *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorIntrinsics");
    v66 = v15;
    v68 = v14;
    v65 = v16;
    objc_msgSend(v6, "depthCalibrationData");
    v17 = (VGHRTFDepthCalibrationData *)objc_claimAutoreleasedReturnValue();
    v89.columns[1] = v66;
    v89.columns[0] = v68;
    v89.columns[2] = v65;
    vg::hrtf::Rectify::process((vg::hrtf::Rectify *)value, v12, v13, v89, v17, (uint64_t)v79);

    if (v87)
    {
      __VGLogSharedInstance();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v18, OS_LOG_TYPE_DEBUG, " Rectified face images. ", buf, 2u);
      }

      v19 = (void *)objc_opt_new();
      if (!v87)
        std::__throw_bad_optional_access[abi:ne180100]();
      CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v83);
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke;
      v77[3] = &__block_descriptor_40_e5_v8__0l;
      v77[4] = CVPixelBufferFromIOSurface;
      v67 = (void (**)(_QWORD))MEMORY[0x24BD03294](v77);
      objc_msgSend(v19, "setDepth:", CVPixelBufferFromIOSurface);
      if (!v87)
        std::__throw_bad_optional_access[abi:ne180100]();
      objc_msgSend(v19, "setDepthIntrinsics:", v84, v85, v86);
      if (!v87)
        std::__throw_bad_optional_access[abi:ne180100]();
      v21 = createCVPixelBufferFromIOSurface(*(IOSurface **)v79);
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_2;
      v76[3] = &__block_descriptor_40_e5_v8__0l;
      v76[4] = v21;
      v69 = (void (**)(_QWORD))MEMORY[0x24BD03294](v76);
      objc_msgSend(v19, "setYuvRectified:", v21);
      if (!v87)
        std::__throw_bad_optional_access[abi:ne180100]();
      objc_msgSend(v19, "setVideoIntrinsics:", v80, v81, v82);
      objc_msgSend(v7, "yawAngle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v7, "yawAngle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        v25 = v24;

      }
      else
      {
        v25 = 0.0;
      }

      objc_msgSend(v7, "rollAngle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(v7, "rollAngle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v33 = v32;

      }
      else
      {
        v33 = 0.0;
      }

      v34 = [VGFaceMetadata alloc];
      v35 = objc_msgSend(v7, "trackedId");
      objc_msgSend(v7, "boundingBox");
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      objc_msgSend(v6, "colorBuffer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "width");
      objc_msgSend(v6, "colorBuffer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "height");
      v48 = -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:](v34, "initWithFaceId:bounds:yawAngle:rollAngle:", v35, v37 / (double)v45, v39 / (double)v47, v41 / (double)v45, v43 / (double)v47, v25, v33);
      objc_msgSend(v19, "setFace:", v48);

      objc_msgSend(v6, "timestamp");
      CMTimeMakeWithSeconds(&v75, v49, 1000000);
      v74 = v75;
      objc_msgSend(v19, "setTimestamp:", &v74);
      v50 = self->_semaphore;
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_3;
      v70[3] = &unk_251B22CE0;
      v51 = v50;
      v71 = v51;
      v72 = self;
      v52 = v8;
      v73 = v52;
      v53 = (void *)MEMORY[0x24BD03294](v70);
      if (-[VGFaceCapture processWithCaptureData:callback:](self->_capturer, "processWithCaptureData:callback:", v19, v53))
      {
        dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend(v52, "progress");
        self->_progress = v54;
        self->_captureState = objc_msgSend(v52, "progressType");
        v55 = objc_alloc(MEMORY[0x24BDBCE30]);
        objc_msgSend(v52, "poseStatusList");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (NSArray *)objc_msgSend(v55, "initWithArray:copyItems:", v56, 1);
        poseStatus = self->_poseStatus;
        self->_poseStatus = v57;

        IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v19, "yuvRectified"));
        objc_msgSend(v52, "trackedData");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setRectifiedColorBuffer:", IOSurface);

        v61 = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v19, "depth"));
        objc_msgSend(v52, "trackedData");
        v62 = objc_claimAutoreleasedReturnValue();
        -[NSObject setRectifiedDepthBuffer:](v62, "setRectifiedDepthBuffer:", v61);
      }
      else
      {
        __VGLogSharedInstance();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v62, OS_LOG_TYPE_ERROR, " Face tracking failed ", buf, 2u);
        }
      }

      v63 = v52;
      v69[2](v69);

      v67[2](v67);
    }
    else
    {
      __VGLogSharedInstance();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_249CAD000, v28, OS_LOG_TYPE_ERROR, " Failed to rectify face images. ", buf, 2u);
      }

      v29 = v8;
    }
    if (v87)
    {

    }
  }
  else
  {
    __VGLogSharedInstance();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v79 = 0;
      _os_log_impl(&dword_249CAD000, v26, OS_LOG_TYPE_ERROR, " Face not found. ", v79, 2u);
    }

    v27 = v8;
  }

  return v8;
}

void __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  _DWORD *v14;
  unint64_t v15;
  unsigned int v16;
  _DWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _DWORD *v20;
  unint64_t v21;
  BOOL v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  _DWORD *v29;
  unint64_t v30;
  BOOL v31;
  _DWORD *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  double v36;
  unsigned int v37;
  unsigned int v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void (**v67)(_QWORD);
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  void *memptr[4];

  memptr[2] = *(void **)MEMORY[0x24BDAC8D0];
  v69 = a2;
  v68 = a3;
  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 3221225472;
  v85[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_4;
  v85[3] = &unk_251B22CB8;
  v70 = a1;
  v86 = *(id *)(a1 + 32);
  v67 = (void (**)(_QWORD))MEMORY[0x24BD03294](v85);
  LODWORD(a3) = objc_msgSend(v69, "failed");
  v5 = objc_msgSend(v69, "completed");
  if ((_DWORD)a3)
    v6 = 3;
  else
    v6 = 2;
  if (v5)
  {
    if (v68)
    {
      v77 = v68;
      v76 = objc_msgSend(v77, "count");
      v75 = (void *)objc_opt_new();
      if (v76)
      {
        v7 = 0;
        v74 = *MEMORY[0x24BE05A48];
        v73 = *MEMORY[0x24BE05A30];
        v72 = *MEMORY[0x24BE05A00];
        v71 = *MEMORY[0x24BE05A08];
        do
        {
          objc_msgSend(v77, "objectAtIndexedSubscript:", v7);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[VGHRTFFaceFrameData initEmpty]([VGHRTFFaceFrameData alloc], "initEmpty");
          objc_msgSend(v83, "captureData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "faceTrackingResult");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v74);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v81, "objectAtIndex:", 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKey:", v73);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKey:", v72);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectForKey:", v71);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");
          v13 = objc_retainAutorelease(v11);
          v14 = (_DWORD *)objc_msgSend(v13, "bytes");
          v15 = v12 >> 3;
          v16 = 2 * (v12 >> 3);
          memptr[0] = 0;
          malloc_type_posix_memalign(memptr, 0x20uLL, (4 * v16 + 31) & 0x7FFFFFFE0, 0x49090899uLL);
          v17 = memptr[0];
          if (v14 == memptr[0])
          {
            memptr[0] = 0;
            malloc_type_posix_memalign(memptr, 0x20uLL, ((v12 & 0x3FFFFFFF8) + 31) & 0x7FFFFFFE0, 0x49090899uLL);
            v17 = memptr[0];
            if (v16)
            {
              v26 = 0;
              if ((v15 & 0x7FFFFFFF) != 0)
                v27 = v14;
              else
                v27 = 0;
              v28 = v12 & 0x3FFFFFFF8;
              v29 = memptr[0];
              do
              {
                *v29++ = *v27;
                v30 = HIDWORD(v26);
                v31 = (int)v26 < 1;
                if ((int)v26 < 1)
                  v30 = 0;
                v32 = &v27[v30];
                v33 = (v26 + 1);
                v34 = v26 & 0xFFFFFFFF00000000;
                if (!v31)
                  v33 = 0;
                v26 = v33 | v34;
                v27 = v32 + 1;
                v28 -= 4;
              }
              while (v28);
            }
            free(v14);
          }
          else if (v16)
          {
            v18 = 0;
            v19 = 0;
            if ((v15 & 0x7FFFFFFF) != 0)
              v20 = v14;
            else
              v20 = 0;
            do
            {
              v17[v18 / 4] = *v20;
              v21 = HIDWORD(v19);
              v22 = (int)v19 < 1;
              if ((int)v19 < 1)
                v21 = 0;
              v23 = &v20[v21];
              v24 = (v19 + 1);
              v25 = v19 & 0xFFFFFFFF00000000;
              if (!v22)
                v24 = 0;
              v19 = v24 | v25;
              v20 = v23 + 1;
              v18 += 4;
            }
            while ((v12 & 0x3FFFFFFF8) != v18);
          }
          v35 = (void *)objc_opt_new();
          if (v12 >= 8)
          {
            v37 = 1;
            v38 = 1;
            do
            {
              LODWORD(v36) = v17[v37 - 1];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "addObject:", v39);

              LODWORD(v40) = v17[v37];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "addObject:", v41);

              v22 = v15 > v38++;
              v37 += 2;
            }
            while (v22);
          }
          objc_msgSend(v83, "captureData");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setRgbImage:", CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v42, "rgbRectified")));

          objc_msgSend(v83, "captureData");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setDepthImage:", CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v43, "depth")));

          objc_msgSend(v83, "captureData");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "depthIntrinsics");
          objc_msgSend(v8, "setDepthIntrinsics:", v45, v46, v47);

          objc_msgSend(v8, "setLandmarks:", v35);
          objc_msgSend(v75, "addObject:", v8);

          free(v17);
          ++v7;
        }
        while (v7 != v76);
      }

      v48 = *(_QWORD *)(v70 + 40);
      v49 = *(void **)(v48 + 56);
      *(_QWORD *)(v48 + 56) = v75;

    }
    v6 = 4;
  }
  v50 = -[VGHRTFFaceCaptureProcessedData initEmpty]([VGHRTFFaceCaptureProcessedData alloc], "initEmpty");
  objc_msgSend(v69, "rejectionState");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "reason") == 1)
    goto LABEL_51;
  objc_msgSend(v69, "rejectionState");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "reason") == 5)
  {
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  objc_msgSend(v69, "rejectionState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "reason") == 2)
  {
LABEL_49:

    goto LABEL_50;
  }
  objc_msgSend(v69, "rejectionState");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "reason") == 3)
  {
LABEL_48:

    goto LABEL_49;
  }
  objc_msgSend(v69, "rejectionState");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "reason") == 4)
  {
LABEL_47:

    goto LABEL_48;
  }
  objc_msgSend(v69, "rejectionState");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "reason") == 33)
  {
LABEL_46:

    goto LABEL_47;
  }
  objc_msgSend(v69, "rejectionState");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "reason") == 36)
  {
LABEL_45:

    goto LABEL_46;
  }
  objc_msgSend(v69, "rejectionState");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v84, "reason") == 35)
  {

    goto LABEL_45;
  }
  objc_msgSend(v69, "rejectionState");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v62, "reason") == 36;

  if (!v82)
  {
    v63 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v69, "yawAngle");
    objc_msgSend(v63, "numberWithFloat:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setYawAngle:", v64);

    v65 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v69, "pitchAngle");
    objc_msgSend(v65, "numberWithFloat:");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPitchAngle:", v66);

    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v50, "setYawAngle:", 0);
  objc_msgSend(v50, "setPitchAngle:", 0);
LABEL_53:
  objc_msgSend(*(id *)(v70 + 48), "setProgressType:", v6);
  objc_msgSend(v69, "progress");
  objc_msgSend(*(id *)(v70 + 48), "setProgress:");
  v58 = v69;
  detail::getFacePoseList(v58, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  memptr[0] = v59;
  detail::getFacePoseList(v58, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  memptr[1] = v60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", memptr, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v70 + 48), "setPoseStatusList:", v61);
  objc_msgSend(*(id *)(v70 + 48), "setTrackedData:", v50);
  objc_msgSend(*(id *)(v70 + 48), "setResult:", *(_QWORD *)(*(_QWORD *)(v70 + 40) + 56));

  v67[2](v67);
}

intptr_t __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_poseStatus, 0);
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)&self->_rectify, 0);
  objc_storeStrong((id *)&self->_capturer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
