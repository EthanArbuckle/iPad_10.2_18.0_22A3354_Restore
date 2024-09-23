@implementation _OUFrame

- (_OUFrame)initWithFrame:(id)a3
{
  id v4;
  _OUFrame *v5;
  double v6;
  uint64_t v7;
  OUCamera *camera;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  OUCamera *sceneCamera;
  NSObject *v15;
  size_t Width;
  size_t Height;
  size_t v19;
  size_t v20;
  size_t v21;
  size_t v22;
  objc_super v23;
  uint8_t buf[4];
  size_t v25;
  __int16 v26;
  size_t v27;
  __int16 v28;
  size_t v29;
  __int16 v30;
  size_t v31;
  __int16 v32;
  size_t v33;
  __int16 v34;
  size_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_OUFrame;
  v5 = -[_OUFrame init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v6;
    objc_msgSend(v4, "camera");
    v7 = objc_claimAutoreleasedReturnValue();
    camera = v5->_camera;
    v5->_camera = (OUCamera *)v7;

    objc_msgSend(v4, "referenceOriginTransform");
    *(_OWORD *)&v5[1].super.isa = v9;
    *(_OWORD *)&v5[1]._timestamp = v10;
    *(_OWORD *)&v5[1]._colorBuffer = v11;
    *(_OWORD *)&v5[1]._sceneColorBuffer = v12;
    v5->_colorBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "colorBuffer"));
    objc_msgSend(v4, "sceneCamera");
    v13 = objc_claimAutoreleasedReturnValue();
    sceneCamera = v5->_sceneCamera;
    v5->_sceneCamera = (OUCamera *)v13;

    v5->_sceneColorBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "sceneColorBuffer"));
    v5->_sceneDepthBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "sceneDepthBuffer"));
    v5->_sceneDepthConfidenceBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "sceneDepthConfidenceBuffer"));
    v5->_semanticLabelBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "semanticLabelBuffer"));
    v5->_semanticConfidenceBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "semanticConfidenceBuffer"));
    v5->_deviceOrientation = objc_msgSend(v4, "deviceOrientation");
    v5->_semanticLabelBufferOnWideCamera = 0;
    v5->sceneColorBufferBGRA = 0;
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      Width = CVPixelBufferGetWidth(v5->_colorBuffer);
      Height = CVPixelBufferGetHeight(v5->_colorBuffer);
      v19 = CVPixelBufferGetWidth(v5->_sceneDepthBuffer);
      v20 = CVPixelBufferGetHeight(v5->_sceneDepthBuffer);
      v21 = CVPixelBufferGetWidth(v5->_semanticLabelBuffer);
      v22 = CVPixelBufferGetHeight(v5->_semanticLabelBuffer);
      *(_DWORD *)buf = 134219264;
      v25 = Width;
      v26 = 2048;
      v27 = Height;
      v28 = 2048;
      v29 = v19;
      v30 = 2048;
      v31 = v20;
      v32 = 2048;
      v33 = v21;
      v34 = 2048;
      v35 = v22;
      _os_log_debug_impl(&dword_2294C8000, v15, OS_LOG_TYPE_DEBUG, "The input arframe has rgb-image (%zu x %zu), sem-depth (%zu, %zu), sem (%zu, %zu)", buf, 0x3Eu);
    }

  }
  return v5;
}

- (_OUFrame)initWithDictionary:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFDictionary *v27;
  void *v28;
  BOOL v29;
  CFAllocatorRef *v30;
  void *v31;
  size_t v32;
  void *v33;
  size_t v34;
  CVPixelBufferRef *v35;
  void *v36;
  void *BaseAddress;
  size_t DataSize;
  id v39;
  void *v40;
  BOOL v41;
  void *v42;
  size_t v43;
  void *v44;
  size_t v45;
  CVPixelBufferRef *v46;
  void *v47;
  void *v48;
  size_t v49;
  id v50;
  void *v51;
  BOOL v52;
  void *v53;
  size_t v54;
  void *v55;
  size_t v56;
  CVPixelBufferRef *v57;
  void *v58;
  void *v59;
  size_t v60;
  id v61;
  void *v62;
  BOOL v63;
  void *v64;
  size_t v65;
  void *v66;
  size_t v67;
  CVPixelBufferRef *v68;
  void *v69;
  void *v70;
  size_t v71;
  id v72;
  void *v73;
  BOOL v74;
  void *v75;
  size_t v76;
  void *v77;
  size_t v78;
  CVPixelBufferRef *v79;
  void *v80;
  void *v81;
  size_t v82;
  id v83;
  void *v84;
  BOOL v85;
  void *v86;
  size_t v87;
  void *v88;
  size_t v89;
  CVPixelBufferRef *v90;
  void *v91;
  void *v92;
  size_t v93;
  id v94;
  void *v95;
  BOOL v96;
  void *v97;
  size_t v98;
  void *v99;
  size_t v100;
  CVPixelBufferRef *v101;
  _OUFrame *v102;
  void *v103;
  void *v104;
  size_t v105;
  id v106;
  objc_super v108;
  uint64_t v109;
  _QWORD v110[2];

  v110[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)_OUFrame;
  v5 = -[_OUFrame init](&v108, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_36;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "doubleValue");
  *((_QWORD *)v5 + 2) = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reference_origin_transform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v9 == 0;

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reference_origin_transform"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    float4x4FromNSArray(v10, (simd_float4x4 *)(v5 + 112));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vio_tracking_state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vio_tracking_state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 11) = (int)objc_msgSend(v13, "intValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_orientation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_orientation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 12) = (int)objc_msgSend(v16, "intValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("camera"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("camera"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    OUCameraFromDictionary(v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v20;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_camera"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_camera"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    OUCameraFromDictionary(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v25;

  }
  v109 = *MEMORY[0x24BDC5668];
  v110[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
  v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_buffer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  v30 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!v29)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_width"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_height"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "unsignedIntegerValue");

    v35 = (CVPixelBufferRef *)(v5 + 32);
    if (CVPixelBufferCreate(*v30, v32, v34, 0x34323066u, v27, (CVPixelBufferRef *)v5 + 4))
      goto LABEL_33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color_buffer"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferLockBaseAddress(*v35, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(*v35);
    DataSize = CVPixelBufferGetDataSize(*v35);
    v39 = objc_retainAutorelease(v36);
    memcpy(BaseAddress, (const void *)objc_msgSend(v39, "bytes"), DataSize);
    CVPixelBufferUnlockBaseAddress(*v35, 0);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_buffer"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (!v41)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_width"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_height"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntegerValue");

    v46 = (CVPixelBufferRef *)(v5 + 48);
    if (CVPixelBufferCreate(*v30, v43, v45, 0x34323066u, v27, (CVPixelBufferRef *)v5 + 6))
      goto LABEL_33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_buffer"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferLockBaseAddress(*v46, 0);
    v48 = CVPixelBufferGetBaseAddress(*v46);
    v49 = CVPixelBufferGetDataSize(*v46);
    v50 = objc_retainAutorelease(v47);
    memcpy(v48, (const void *)objc_msgSend(v50, "bytes"), v49);
    CVPixelBufferUnlockBaseAddress(*v46, 0);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_buffer_bgra"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 == 0;

  if (v52)
  {
    *((_QWORD *)v5 + 1) = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_width"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_height"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "unsignedIntegerValue");

    v57 = (CVPixelBufferRef *)(v5 + 8);
    if (CVPixelBufferCreate(*v30, v54, v56, 0x42475241u, v27, (CVPixelBufferRef *)v5 + 1))
      goto LABEL_33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_color_buffer_bgra"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferLockBaseAddress(*v57, 0);
    v59 = CVPixelBufferGetBaseAddress(*v57);
    v60 = CVPixelBufferGetDataSize(*v57);
    v61 = objc_retainAutorelease(v58);
    memcpy(v59, (const void *)objc_msgSend(v61, "bytes"), v60);
    CVPixelBufferUnlockBaseAddress(*v57, 0);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_label_buffer"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62 == 0;

  if (!v63)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_label_width"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_label_height"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "unsignedIntegerValue");

    v68 = (CVPixelBufferRef *)(v5 + 72);
    if (CVPixelBufferCreate(*v30, v65, v67, 0x4C303038u, v27, (CVPixelBufferRef *)v5 + 9))
      goto LABEL_33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_label_buffer"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferLockBaseAddress(*v68, 0);
    v70 = CVPixelBufferGetBaseAddress(*v68);
    v71 = CVPixelBufferGetDataSize(*v68);
    v72 = objc_retainAutorelease(v69);
    memcpy(v70, (const void *)objc_msgSend(v72, "bytes"), v71);
    CVPixelBufferUnlockBaseAddress(*v68, 0);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_confidence_buffer"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73 == 0;

  if (!v74)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_confidence_width"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_confidence_height"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "unsignedIntegerValue");

    v79 = (CVPixelBufferRef *)(v5 + 80);
    if (CVPixelBufferCreate(*v30, v76, v78, 0x4C303066u, v27, (CVPixelBufferRef *)v5 + 10))
      goto LABEL_33;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semantic_confidence_buffer"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferLockBaseAddress(*v79, 0);
    v81 = CVPixelBufferGetBaseAddress(*v79);
    v82 = CVPixelBufferGetDataSize(*v79);
    v83 = objc_retainAutorelease(v80);
    memcpy(v81, (const void *)objc_msgSend(v83, "bytes"), v82);
    CVPixelBufferUnlockBaseAddress(*v79, 0);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_buffer"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84 == 0;

  if (v85)
  {
LABEL_31:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_confidence_buffer"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95 == 0;

    if (!v96)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_confidence_width"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "unsignedIntegerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_confidence_height"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "unsignedIntegerValue");

      v101 = (CVPixelBufferRef *)(v5 + 64);
      if (CVPixelBufferCreate(*v30, v98, v100, 0x66646570u, v27, v101))
        goto LABEL_33;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_confidence_buffer"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      CVPixelBufferLockBaseAddress(*v101, 0);
      v104 = CVPixelBufferGetBaseAddress(*v101);
      v105 = CVPixelBufferGetDataSize(*v101);
      v106 = objc_retainAutorelease(v103);
      memcpy(v104, (const void *)objc_msgSend(v106, "bytes"), v105);
      CVPixelBufferUnlockBaseAddress(*v101, 0);

    }
LABEL_36:
    v102 = v6;
    goto LABEL_37;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_width"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_height"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "unsignedIntegerValue");

  v90 = (CVPixelBufferRef *)(v5 + 56);
  if (!CVPixelBufferCreate(*v30, v87, v89, 0x66646570u, v27, (CVPixelBufferRef *)v5 + 7))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scene_depth_buffer"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferLockBaseAddress(*v90, 0);
    v92 = CVPixelBufferGetBaseAddress(*v90);
    v93 = CVPixelBufferGetDataSize(*v90);
    v94 = objc_retainAutorelease(v91);
    memcpy(v92, (const void *)objc_msgSend(v94, "bytes"), v93);
    CVPixelBufferUnlockBaseAddress(*v90, 0);

    goto LABEL_31;
  }
LABEL_33:

  v102 = 0;
LABEL_37:

  return v102;
}

- (void)ReleaseBuffer
{
  __CVBuffer *sceneDepthBuffer;
  __CVBuffer *sceneDepthConfidenceBuffer;
  __CVBuffer *semanticLabelBuffer;
  __CVBuffer *semanticLabelBufferOnWideCamera;
  __CVBuffer *semanticConfidenceBuffer;
  __CVBuffer *colorBuffer;
  __CVBuffer *sceneColorBuffer;
  __CVBuffer *sceneColorBufferBGRA;

  sceneDepthBuffer = self->_sceneDepthBuffer;
  if (sceneDepthBuffer)
  {
    CVPixelBufferRelease(sceneDepthBuffer);
    self->_sceneDepthBuffer = 0;
  }
  sceneDepthConfidenceBuffer = self->_sceneDepthConfidenceBuffer;
  if (sceneDepthConfidenceBuffer)
  {
    CVPixelBufferRelease(sceneDepthConfidenceBuffer);
    self->_sceneDepthConfidenceBuffer = 0;
  }
  semanticLabelBuffer = self->_semanticLabelBuffer;
  if (semanticLabelBuffer)
  {
    CVPixelBufferRelease(semanticLabelBuffer);
    self->_semanticLabelBuffer = 0;
  }
  semanticLabelBufferOnWideCamera = self->_semanticLabelBufferOnWideCamera;
  if (semanticLabelBufferOnWideCamera)
  {
    CVPixelBufferRelease(semanticLabelBufferOnWideCamera);
    self->_semanticLabelBufferOnWideCamera = 0;
  }
  semanticConfidenceBuffer = self->_semanticConfidenceBuffer;
  if (semanticConfidenceBuffer)
  {
    CVPixelBufferRelease(semanticConfidenceBuffer);
    self->_semanticConfidenceBuffer = 0;
  }
  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
  {
    CVPixelBufferRelease(colorBuffer);
    self->_colorBuffer = 0;
  }
  sceneColorBuffer = self->_sceneColorBuffer;
  if (sceneColorBuffer)
  {
    CVPixelBufferRelease(sceneColorBuffer);
    self->_sceneColorBuffer = 0;
  }
  sceneColorBufferBGRA = self->sceneColorBufferBGRA;
  if (sceneColorBufferBGRA)
  {
    CVPixelBufferRelease(sceneColorBufferBGRA);
    self->sceneColorBufferBGRA = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_OUFrame ReleaseBuffer](self, "ReleaseBuffer");
  v3.receiver = self;
  v3.super_class = (Class)_OUFrame;
  -[_OUFrame dealloc](&v3, sel_dealloc);
}

- (double)GetCameraPoseInVisionWorld
{
  uint64_t v2;
  uint64_t v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  uint64_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  simd_float4x4 v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  simd_float4x4 v27;

  v18 = (float32x4_t)ARKit_VW_RW;
  v20 = (float32x4_t)xmmword_2540C9590;
  v14 = (float32x4_t)xmmword_2540C95B0;
  v16 = (float32x4_t)xmmword_2540C95A0;
  v27 = __invert_f4(*(simd_float4x4 *)(a1 + 112));
  v2 = 0;
  v22 = v27;
  do
  {
    *(float32x4_t *)((char *)&v23 + v2 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&v22.columns[v2])), v20, *(float32x2_t *)v22.columns[v2].f32, 1), v16, (float32x4_t)v22.columns[v2], 2), v14, (float32x4_t)v22.columns[v2], 3);
    ++v2;
  }
  while (v2 != 4);
  v19 = v23;
  v21 = v24;
  v15 = v26;
  v17 = v25;
  objc_msgSend(*(id *)(a1 + 24), "transform");
  v3 = 0;
  v22.columns[0] = v4;
  v22.columns[1] = v5;
  v22.columns[2] = v6;
  v22.columns[3] = v7;
  do
  {
    *(float32x4_t *)((char *)&v23 + v3 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)&v22.columns[v3])), v21, *(float32x2_t *)v22.columns[v3].f32, 1), v17, (float32x4_t)v22.columns[v3], 2), v15, (float32x4_t)v22.columns[v3], 3);
    ++v3;
  }
  while (v3 != 4);
  v8 = 0;
  v9 = v23;
  v10 = v24;
  v11 = v25;
  v12 = v26;
  v22 = *(simd_float4x4 *)RC_VC;
  do
  {
    *(float32x4_t *)((char *)&v23 + v8 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v22.columns[v8])), v10, *(float32x2_t *)v22.columns[v8].f32, 1), v11, (float32x4_t)v22.columns[v8], 2), v12, (float32x4_t)v22.columns[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  return *(double *)v23.i64;
}

- (double)GetSceneCameraPoseInVisionWorld
{
  uint64_t v2;
  uint64_t v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  uint64_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  simd_float4x4 v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  simd_float4x4 v27;

  v18 = (float32x4_t)ARKit_VW_RW;
  v20 = (float32x4_t)xmmword_2540C9590;
  v14 = (float32x4_t)xmmword_2540C95B0;
  v16 = (float32x4_t)xmmword_2540C95A0;
  v27 = __invert_f4(*(simd_float4x4 *)(a1 + 112));
  v2 = 0;
  v22 = v27;
  do
  {
    *(float32x4_t *)((char *)&v23 + v2 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&v22.columns[v2])), v20, *(float32x2_t *)v22.columns[v2].f32, 1), v16, (float32x4_t)v22.columns[v2], 2), v14, (float32x4_t)v22.columns[v2], 3);
    ++v2;
  }
  while (v2 != 4);
  v19 = v23;
  v21 = v24;
  v15 = v26;
  v17 = v25;
  objc_msgSend(*(id *)(a1 + 40), "transform");
  v3 = 0;
  v22.columns[0] = v4;
  v22.columns[1] = v5;
  v22.columns[2] = v6;
  v22.columns[3] = v7;
  do
  {
    *(float32x4_t *)((char *)&v23 + v3 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)&v22.columns[v3])), v21, *(float32x2_t *)v22.columns[v3].f32, 1), v17, (float32x4_t)v22.columns[v3], 2), v15, (float32x4_t)v22.columns[v3], 3);
    ++v3;
  }
  while (v3 != 4);
  v8 = 0;
  v9 = v23;
  v10 = v24;
  v11 = v25;
  v12 = v26;
  v22 = *(simd_float4x4 *)RC_VC;
  do
  {
    *(float32x4_t *)((char *)&v23 + v8 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v22.columns[v8])), v10, *(float32x2_t *)v22.columns[v8].f32, 1), v11, (float32x4_t)v22.columns[v8], 2), v12, (float32x4_t)v22.columns[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  return *(double *)v23.i64;
}

- (double)GetProjectionMatrixInVisionWorld
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  uint64_t v5;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  simd_float4x4 v10;
  __int128 v11;
  simd_float4x4 v12;
  simd_float4x4 v13;

  objc_msgSend(a1[3], "intrinsics");
  v2.i32[3] = 0;
  v3.i32[3] = 0;
  v8 = v3;
  v9 = v2;
  v4.i32[3] = 0;
  v7 = v4;
  objc_msgSend(a1, "GetCameraPoseInVisionWorld");
  v13 = __invert_f4(v12);
  v5 = 0;
  v10 = v13;
  do
  {
    *(__int128 *)((char *)&v11 + v5 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v10.columns[v5])), v8, *(float32x2_t *)v10.columns[v5].f32, 1), v7, (float32x4_t)v10.columns[v5], 2), (float32x4_t)xmmword_229560490, (float32x4_t)v10.columns[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  return *(double *)&v11;
}

- (double)GetSceneCameraProjectionMatrixInVisionWorld
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  uint64_t v5;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  simd_float4x4 v10;
  __int128 v11;
  simd_float4x4 v12;
  simd_float4x4 v13;

  objc_msgSend(a1[5], "intrinsics");
  v2.i32[3] = 0;
  v3.i32[3] = 0;
  v8 = v3;
  v9 = v2;
  v4.i32[3] = 0;
  v7 = v4;
  objc_msgSend(a1, "GetSceneCameraPoseInVisionWorld");
  v13 = __invert_f4(v12);
  v5 = 0;
  v10 = v13;
  do
  {
    *(__int128 *)((char *)&v11 + v5 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v10.columns[v5])), v8, *(float32x2_t *)v10.columns[v5].f32, 1), v7, (float32x4_t)v10.columns[v5], 2), (float32x4_t)xmmword_229560490, (float32x4_t)v10.columns[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  return *(double *)&v11;
}

- (__n64)GetSceneRgbToDepthRatio
{
  float Width;
  float Height;
  float v4;
  size_t v5;
  __n64 result;

  Width = (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  Height = (float)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  v4 = (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
  v5 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
  result.n64_f32[0] = Width / v4;
  result.n64_f32[1] = Height / (float)v5;
  return result;
}

- (__CVBuffer)GetSceneColorBufferBGRA
{
  __CVBuffer **v2;
  __CVBuffer *result;
  __CVBuffer **p_sceneColorBufferBGRA;
  NSObject *v6;
  void *exception;

  p_sceneColorBufferBGRA = &self->sceneColorBufferBGRA;
  result = self->sceneColorBufferBGRA;
  if (!result)
  {
    if (utils::ConvertColor420fTo32BGRA(self->_sceneColorBuffer, p_sceneColorBufferBGRA, v2))
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[_OUFrame GetSceneColorBufferBGRA].cold.1();

      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22E2CA890](exception, &unk_22956FEC2);
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    return *p_sceneColorBufferBGRA;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (OUCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->_camera, a3);
}

- (__n128)referenceOriginTransform
{
  return a1[7];
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (__CVBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  self->_colorBuffer = a3;
}

- (OUCamera)sceneCamera
{
  return self->_sceneCamera;
}

- (void)setSceneCamera:(id)a3
{
  objc_storeStrong((id *)&self->_sceneCamera, a3);
}

- (__CVBuffer)sceneColorBuffer
{
  return self->_sceneColorBuffer;
}

- (void)setSceneColorBuffer:(__CVBuffer *)a3
{
  self->_sceneColorBuffer = a3;
}

- (__CVBuffer)sceneDepthBuffer
{
  return self->_sceneDepthBuffer;
}

- (void)setSceneDepthBuffer:(__CVBuffer *)a3
{
  self->_sceneDepthBuffer = a3;
}

- (__CVBuffer)sceneDepthConfidenceBuffer
{
  return self->_sceneDepthConfidenceBuffer;
}

- (void)setSceneDepthConfidenceBuffer:(__CVBuffer *)a3
{
  self->_sceneDepthConfidenceBuffer = a3;
}

- (__CVBuffer)semanticLabelBuffer
{
  return self->_semanticLabelBuffer;
}

- (void)setSemanticLabelBuffer:(__CVBuffer *)a3
{
  self->_semanticLabelBuffer = a3;
}

- (__CVBuffer)semanticConfidenceBuffer
{
  return self->_semanticConfidenceBuffer;
}

- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3
{
  self->_semanticConfidenceBuffer = a3;
}

- (int64_t)vioTrackingState
{
  return self->_vioTrackingState;
}

- (void)setVioTrackingState:(int64_t)a3
{
  self->_vioTrackingState = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (__CVBuffer)semanticLabelBufferOnWideCamera
{
  return self->_semanticLabelBufferOnWideCamera;
}

- (void)setSemanticLabelBufferOnWideCamera:(__CVBuffer *)a3
{
  self->_semanticLabelBufferOnWideCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneCamera, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

- (__n128)initWithSceneYUV:(__n128)a3 sceneDepth:(__n128)a4 referenceOriginTranform:(__n128)a5 OUCamera:(uint64_t)a6
{
  id v13;
  _OUFrame *v14;
  __n128 *v15;
  objc_super v21;

  v13 = a9;
  v21.receiver = a1;
  v21.super_class = (Class)_OUFrame;
  v14 = -[_OUFrame init](&v21, sel_init);
  v15 = (__n128 *)v14;
  if (v14)
  {
    v14->_sceneColorBuffer = a7;
    v14->_sceneDepthBuffer = a8;
    objc_storeStrong((id *)&v14->_sceneCamera, a9);
    v15[7] = a2;
    v15[8] = a3;
    v15[9] = a4;
    v15[10] = a5;
    v15->n128_u64[1] = 0;
  }

  return v15;
}

- (id)LoadDepth:(id)a3
{
  NSString *v3;
  NSMutableDictionary *v4;

  v3 = (NSString *)a3;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  LoadDepthToDictionary(v3, v4);

  return v4;
}

- (id)LoadRgb:(id)a3
{
  NSString *v3;
  NSMutableDictionary *v4;

  v3 = (NSString *)a3;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  LoadRGBToDictionary(v3, v4);

  return v4;
}

- (id)LoadLabel:(id)a3
{
  NSString *v3;
  NSMutableDictionary *v4;

  v3 = (NSString *)a3;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  LoadSemanticToDictionary(v3, v4);

  return v4;
}

- (id)LoadVote:(id)a3
{
  NSString *v3;
  NSMutableDictionary *v4;

  v3 = (NSString *)a3;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  LoadSemanticConfToDictionary(v3, v4);

  return v4;
}

- (__CVBuffer)LoadImageToCVPixelBufferTest:(id)a3 PixelType:(unsigned int)a4
{
  return LoadImageToCVPixelBuffer((NSString *)a3, a4);
}

- (void)GetSceneColorBufferBGRA
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "Failed to convert yuv buffer to bgra buffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
