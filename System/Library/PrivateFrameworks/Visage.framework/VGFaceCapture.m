@implementation VGFaceCapture

- (VGFaceCapture)initWithOptions:(id)a3
{
  id v5;
  VGFaceCapture *v6;
  VGFaceCapture *v7;
  id *p_options;
  VGFaceKitTracker *v9;
  VGFaceKitTracker *faceTracker;
  VGFaceFittingFrameSelector *v11;
  VGFaceFittingFrameSelector *faceFrameSelector;
  vg::frame_selection::metrics *v13;
  VGFaceKitTracker *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t value;
  VGFaceCapture *v21;
  NSObject *v22;
  __int16 v24[7];
  __int16 v25;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VGFaceCapture;
  v6 = -[VGFaceCapture init](&v26, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_13:
    v21 = v7;
    goto LABEL_17;
  }
  p_options = (id *)&v6->_options;
  objc_storeStrong((id *)&v6->_options, a3);
  v25 = 0;
  LOBYTE(v25) = -[VGFaceCaptureOptions useFKInternalFaceDetector](v7->_options, "useFKInternalFaceDetector");
  HIBYTE(v25) = objc_msgSend(*p_options, "useFKForceCPU");
  v9 = -[VGFaceKitTracker initWithOptions:]([VGFaceKitTracker alloc], "initWithOptions:", &v25);
  faceTracker = v7->_faceTracker;
  v7->_faceTracker = v9;

  if (v7->_faceTracker)
  {
    v11 = -[VGFaceFittingFrameSelector initWithOptions:faceKitSemantics:]([VGFaceFittingFrameSelector alloc], "initWithOptions:faceKitSemantics:", v7->_options, -[VGFaceKitTracker semantics](v7->_faceTracker, "semantics"));
    faceFrameSelector = v7->_faceFrameSelector;
    v7->_faceFrameSelector = v11;

    v13 = (vg::frame_selection::metrics *)-[VGFaceCaptureOptions useFaceTrackingDictionary](v7->_options, "useFaceTrackingDictionary");
    if ((_DWORD)v13)
    {
      v14 = v7->_faceTracker;
      v7->_faceTracker = 0;

    }
    if (vg::frame_selection::metrics::isSupported(v13))
    {
      if (objc_msgSend(*p_options, "sendMetrics"))
      {
        v15 = operator new();
        v16 = 0;
        *(_QWORD *)(v15 + 480) = 0;
        *(_OWORD *)(v15 + 448) = 0u;
        *(_OWORD *)(v15 + 464) = 0u;
        *(_OWORD *)(v15 + 416) = 0u;
        *(_OWORD *)(v15 + 432) = 0u;
        *(_OWORD *)(v15 + 384) = 0u;
        *(_OWORD *)(v15 + 400) = 0u;
        *(_OWORD *)(v15 + 352) = 0u;
        *(_OWORD *)(v15 + 368) = 0u;
        *(_OWORD *)(v15 + 320) = 0u;
        *(_OWORD *)(v15 + 336) = 0u;
        *(_OWORD *)(v15 + 288) = 0u;
        *(_OWORD *)(v15 + 304) = 0u;
        *(_OWORD *)(v15 + 256) = 0u;
        *(_OWORD *)(v15 + 272) = 0u;
        *(_OWORD *)(v15 + 224) = 0u;
        *(_OWORD *)(v15 + 240) = 0u;
        *(_OWORD *)(v15 + 192) = 0u;
        *(_OWORD *)(v15 + 208) = 0u;
        *(_OWORD *)(v15 + 160) = 0u;
        *(_OWORD *)(v15 + 176) = 0u;
        *(_OWORD *)(v15 + 128) = 0u;
        *(_OWORD *)(v15 + 144) = 0u;
        *(_OWORD *)(v15 + 96) = 0u;
        *(_OWORD *)(v15 + 112) = 0u;
        *(_OWORD *)(v15 + 64) = 0u;
        *(_OWORD *)(v15 + 80) = 0u;
        *(_OWORD *)(v15 + 32) = 0u;
        *(_OWORD *)(v15 + 48) = 0u;
        *(_OWORD *)v15 = 0u;
        *(_OWORD *)(v15 + 16) = 0u;
        do
        {
          v17 = (_QWORD *)(v15 + v16);
          v17[45] = 0;
          v17[46] = 0;
          v17[44] = v17 + 45;
          v16 += 24;
        }
        while (v16 != 48);
        v18 = 0;
        *(_QWORD *)(v15 + 432) = 0;
        *(_OWORD *)(v15 + 400) = 0u;
        *(_OWORD *)(v15 + 416) = 0u;
        do
        {
          v19 = (_QWORD *)(v15 + v18);
          v19[56] = 0;
          v19[57] = 0;
          v19[55] = v19 + 56;
          v18 += 24;
        }
        while (v18 != 48);
        *(_QWORD *)(v15 + 488) = 0;
        *(_QWORD *)(v15 + 496) = 0;
        value = (uint64_t)v7->_metricsData.__ptr_.__value_;
        v7->_metricsData.__ptr_.__value_ = (Data *)v15;
        if (value)
          std::default_delete<vg::frame_selection::metrics::Data>::operator()[abi:ne180100]((uint64_t)&v7->_metricsData, value);
      }
    }
    goto LABEL_13;
  }
  __VGLogSharedInstance();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v24[0] = 0;
    _os_log_impl(&dword_249CAD000, v22, OS_LOG_TYPE_ERROR, " Failed to initialize FaceKit Tracker ", (uint8_t *)v24, 2u);
  }

  v21 = 0;
LABEL_17:

  return v21;
}

- (void)dealloc
{
  Data *value;
  objc_super v4;

  value = self->_metricsData.__ptr_.__value_;
  if (value)
    vg::frame_selection::metrics::sendCompleteEvent((vg::frame_selection::metrics *)value, (const Data *)a2);
  v4.receiver = self;
  v4.super_class = (Class)VGFaceCapture;
  -[VGFaceCapture dealloc](&v4, sel_dealloc);
}

- (id)enrolledPoses
{
  void *faceFrameSelector;

  faceFrameSelector = self->_faceFrameSelector;
  if (faceFrameSelector)
  {
    objc_msgSend(faceFrameSelector, "enrolledPoses");
    faceFrameSelector = (void *)objc_claimAutoreleasedReturnValue();
  }
  return faceFrameSelector;
}

- (BOOL)startFaceExpressionCapture:(unint64_t)a3
{
  return -[VGFaceFittingFrameSelector startFaceExpressionCapture:](self->_faceFrameSelector, "startFaceExpressionCapture:", a3);
}

- (BOOL)processWithCaptureData:(id)a3 callback:(id)a4
{
  id v6;
  vg::shared *v7;
  vg::shared *v8;
  vg::shared *v9;
  vg::frame_selection::metrics *v10;
  vg::frame_selection::metrics *v11;
  Data *value;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  char v20;
  VGFaceKitTracker *faceTracker;
  NSObject *v22;
  _QWORD v24[5];
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[8];
  _QWORD v28[4];
  id v29;
  vg::shared *v30;
  id v31[2];
  id location;

  v6 = a3;
  v7 = (vg::shared *)a4;
  v8 = (vg::shared *)vg::shared::Time(v7);
  v9 = v8;
  if (self->_metricsData.__ptr_.__value_)
  {
    v10 = (vg::frame_selection::metrics *)vg::shared::MemoryUsage(v8);
    v11 = v10;
    value = self->_metricsData.__ptr_.__value_;
    v13 = *((_QWORD *)value + 1);
    if (!v13)
    {
      vg::frame_selection::metrics::sendStartEvent(v10);
      value = self->_metricsData.__ptr_.__value_;
      *((_QWORD *)value + 50) = v9;
      *((_QWORD *)value + 61) = v11;
      v13 = *((_QWORD *)value + 1);
    }
    *((_QWORD *)value + 1) = v13 + 1;
    *((_QWORD *)value + 51) = v9;
    *((_QWORD *)value + 62) = v11;
  }
  if (v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "getFaceCaptureData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __49__VGFaceCapture_processWithCaptureData_callback___block_invoke;
    v28[3] = &unk_251B22E88;
    objc_copyWeak(v31, &location);
    v31[1] = v9;
    v16 = v6;
    v29 = v16;
    v30 = v7;
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x24BD03294](v28);
    if (-[VGFaceCaptureOptions useFaceTrackingDictionary](self->_options, "useFaceTrackingDictionary"))
    {
      objc_msgSend(v16, "faceTrackingResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v16, "faceTrackingResult");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, BOOL))v17)[2](v17, v19, -[VGFaceCaptureOptions useFaceTrackingDictionary](self->_options, "useFaceTrackingDictionary"));

        v20 = 1;
      }
      else
      {
        __VGLogSharedInstance();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v22, OS_LOG_TYPE_ERROR, " useFaceTrackingDictionary is set to TRUE, but faceTrackingResult is empty in capture data. ", buf, 2u);
        }

        v20 = 0;
      }
    }
    else
    {
      faceTracker = self->_faceTracker;
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __49__VGFaceCapture_processWithCaptureData_callback___block_invoke_4;
      v24[3] = &unk_251B22EB0;
      v24[4] = self;
      v25 = v16;
      v26 = v17;
      v20 = -[VGFaceKitTracker processWithCaptureData:callback:](faceTracker, "processWithCaptureData:callback:", v14, v24);

    }
    objc_destroyWeak(v31);

    objc_destroyWeak(&location);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __49__VGFaceCapture_processWithCaptureData_callback___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  vg::shared *WeakRetained;
  vg::shared *v7;
  __uint64_t v8;
  __uint64_t v9;
  uint64_t v10;
  vg::shared *v11;
  vg::shared *v12;
  __uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;
  NSObject *v17;
  void *v18;
  float v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v5 = a2;
  WeakRetained = (vg::shared *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = vg::shared::Time(WeakRetained);
    v9 = v8;
    v10 = *((_QWORD *)v7 + 4);
    if (v10)
      *(_QWORD *)(v10 + 424) += v8 - *(_QWORD *)(a1 + 56);
    objc_msgSend(*((id *)v7 + 1), "addPoseWithCaptureData:tracking:externalTracking:metricsData:", *(_QWORD *)(a1 + 32), v5, a3);
    v11 = (vg::shared *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (*((_QWORD *)v7 + 4))
    {
      v13 = vg::shared::Time(v11);
      v14 = *((_QWORD *)v7 + 4);
      *(_QWORD *)(v14 + 432) += v13 - v9;
      *(_QWORD *)(v14 + 416) += v13 - *(_QWORD *)(a1 + 56);
    }
    objc_msgSend(*(id *)(a1 + 32), "faceTrackingResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[vg::shared setFaceTrackingResultCurrentFrame:](v12, "setFaceTrackingResultCurrentFrame:", v15);

    if (-[vg::shared updated](v12, "updated"))
    {
      if (-[vg::shared completed](v12, "completed"))
      {
        v16 = (_BYTE *)*((_QWORD *)v7 + 4);
        if (v16)
          *v16 = 1;
        __VGLogSharedInstance();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_249CAD000, v17, OS_LOG_TYPE_DEBUG, " Pose capture fully complete and updated. ", buf, 2u);
        }

        objc_msgSend(*((id *)v7 + 1), "finish");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

LABEL_19:
        goto LABEL_20;
      }
      -[vg::shared completionScore](v12, "completionScore");
      if (v19 > 0.0)
      {
        __VGLogSharedInstance();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_249CAD000, v20, OS_LOG_TYPE_DEBUG, " Pose capture partially complete and updated. ", v21, 2u);
        }

        objc_msgSend(*((id *)v7 + 1), "enrolledPoses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_17;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
LABEL_20:

}

void __49__VGFaceCapture_processWithCaptureData_callback___block_invoke_4(uint64_t a1, void *a2)
{
  vg::frame_selection::face_tracker *v3;
  void *v4;
  size_t Width;
  size_t Height;
  const CGSize *v7;
  void *v8;
  void *v9;
  NSDictionary v10[2];

  v3 = a2;
  v4 = v3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "convertFKTrackingDictToARKitDict"))
  {
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 40), "yuvRectified"));
    Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(*(id *)(a1 + 40), "yuvRectified"));
    *(double *)&v10[0].super.isa = (double)Width;
    *(double *)&v10[1].super.isa = (double)Height;
    vg::frame_selection::face_tracker::createARKitDictFromFaceKitDict(v3, v10, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "setFaceTrackingResult:", v4);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "useFKInternalFaceDetector"))
  {
    objc_msgSend(*(id *)(a1 + 40), "face");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[VGFaceCapture getFaceMetadata:](VGFaceCapture, "getFaceMetadata:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setFace:", v9);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)getFaceMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFDictionary *v9;
  NSObject *v10;
  VGFaceMetadata *v11;
  VGFaceMetadata *v12;
  NSObject *v13;
  const char *v14;
  CGRect *p_rect;
  __int16 v17;
  CGRect rect;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE05A48]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || !objc_msgSend(v5, "count"))
    {
      __VGLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(rect.origin.x) = 0;
        _os_log_impl(&dword_249CAD000, v7, OS_LOG_TYPE_ERROR, " No tracked faces found in tracking dictionary ", (uint8_t *)&rect, 2u);
      }
      v12 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x24BE05A30]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      __VGLogSharedInstance();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(rect.origin.x) = 0;
        _os_log_impl(&dword_249CAD000, v10, OS_LOG_TYPE_ERROR, " No smooth data found in tracking dictionary ", (uint8_t *)&rect, 2u);
      }
      goto LABEL_20;
    }
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x24BE059C8]);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (CGRectMakeWithDictionaryRepresentation(v9, &rect))
      {
        v11 = [VGFaceMetadata alloc];
        v12 = -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:](v11, "initWithFaceId:bounds:yawAngle:rollAngle:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 0.0, 0.0);
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      __VGLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v17 = 0;
      v14 = " Unable to construct bbox rect from tracking dictionary ";
      p_rect = (CGRect *)&v17;
    }
    else
    {
      __VGLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

LABEL_20:
        v12 = 0;
        goto LABEL_21;
      }
      LOWORD(rect.origin.x) = 0;
      v14 = " No face rect found in tracking dictionary ";
      p_rect = &rect;
    }
    _os_log_impl(&dword_249CAD000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)p_rect, 2u);
    goto LABEL_19;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_storeStrong((id *)&self->_rootPath, a3);
}

- (void).cxx_destruct
{
  Data *value;

  objc_storeStrong((id *)&self->_rootPath, 0);
  value = self->_metricsData.__ptr_.__value_;
  self->_metricsData.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<vg::frame_selection::metrics::Data>::operator()[abi:ne180100]((uint64_t)&self->_metricsData, (uint64_t)value);
  objc_storeStrong((id *)&self->_faceTracker, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_faceFrameSelector, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
