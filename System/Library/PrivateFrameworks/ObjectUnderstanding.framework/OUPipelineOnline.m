@implementation OUPipelineOnline

- (OUPipelineOnline)init
{
  OUPipelineOnline *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OUPipelineOnline;
  v2 = -[OUPipelineOnline init](&v4, sel_init);
  v2->enable_3dor_ = 1;
  -[OUPipelineOnline CommonInit](v2, "CommonInit");
  return v2;
}

- (OUPipelineOnline)initWithConfig:(id)a3
{
  id v4;
  OUPipelineOnline *v5;
  OUPipelineOnline *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OUPipelineOnline;
  v5 = -[OUPipelineOnline init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[OU3DObjectDetector setRgbRefinementEnabled:](v5->ou3dod_, "setRgbRefinementEnabled:", objc_msgSend(v4, "enableRgbRefinement"));
    -[OU3DObjectDetector setObjectRepresentationEnabled:](v6->ou3dod_, "setObjectRepresentationEnabled:", objc_msgSend(v4, "enable3DOROnline"));
    v6->enable_3dor_ = objc_msgSend(v4, "enable3DOROnline");
    -[OUPipelineOnline CommonInit](v6, "CommonInit");
  }

  return v6;
}

- (void)CommonInit
{
  OUObjectAsset *v3;
  OUObjectAsset *objectAsset;
  NSArray *allObjects;
  NSMutableDictionary *v6;
  NSMutableDictionary *accumulatedPointCloud;
  OU3DObjectDetector *v8;
  OU3DObjectDetector *ou3dod;
  NSObject *v10;
  ou3dor::OU3DObjectRepresentation *v11;
  void *v12;
  char v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = objc_alloc_init(OUObjectAsset);
  objectAsset = self->objectAsset_;
  self->objectAsset_ = v3;

  *(_QWORD *)&self->num_pre_key_frames_ = 0;
  self->depth_confidence_threshold_ = 0.8;
  allObjects = self->allObjects;
  self->allObjects = (NSArray *)MEMORY[0x24BDBD1A8];

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  accumulatedPointCloud = self->accumulatedPointCloud_;
  self->accumulatedPointCloud_ = v6;

  v8 = -[OU3DObjectDetector init:]([OU3DObjectDetector alloc], "init:", 1);
  ou3dod = self->ou3dod_;
  self->ou3dod_ = v8;

  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2294C8000, v10, OS_LOG_TYPE_INFO, "Init 3D Object Detection online [done].", buf, 2u);
  }

  if (self->enable_3dor_)
  {
    v11 = (ou3dor::OU3DObjectRepresentation *)operator new();
    ou3dor::OU3DObjectRepresentation::OU3DObjectRepresentation(v11, 1);
    std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100]((ou3dor::OU3DObjectRepresentation **)&self->ou3dor_, v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2294C8000, v10, OS_LOG_TYPE_INFO, "Init 3D Object Representation online [done].", v14, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("com.apple.ObjectUnderstanding.write_debug_data"));

  self->write_debug_output_ = v13;
}

- (void)clear
{
  NSMutableDictionary *v3;
  NSMutableDictionary *accumulatedPointCloud;

  -[OUPipelineOnline CommonInit](self, "CommonInit");
  -[OU3DObjectDetector clear](self->ou3dod_, "clear");
  v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 128);
  accumulatedPointCloud = self->accumulatedPointCloud_;
  self->accumulatedPointCloud_ = v3;

  *(_QWORD *)&self->num_pre_key_frames_ = 0;
}

- (id)getObjectAsset
{
  return self->objectAsset_;
}

- (BOOL)updateCameraWithValid:(id)a3 ouframe:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  OUCamera *v12;
  OUCamera *camera;
  _OUFrame *v14;
  _OUFrame *arframe;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v7, "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "sceneCamera");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && objc_msgSend(v8, "sceneColorBuffer") && objc_msgSend(v8, "semanticLabelBuffer"))
    {
      v11 = objc_msgSend(v8, "sceneColorBuffer");

      if (v11)
      {
        objc_msgSend(v8, "camera");
        v12 = (OUCamera *)objc_claimAutoreleasedReturnValue();
        camera = self->camera_;
        self->camera_ = v12;

        v14 = -[_OUFrame initWithFrame:]([_OUFrame alloc], "initWithFrame:", v8);
        arframe = self->arframe_;
        self->arframe_ = v14;

        -[_OUFrame GetCameraPoseInVisionWorld](self->arframe_, "GetCameraPoseInVisionWorld");
        *(_OWORD *)self->_anon_30 = v16;
        *(_OWORD *)&self->_anon_30[16] = v17;
        *(_OWORD *)&self->_anon_30[32] = v18;
        *(_OWORD *)&self->_anon_30[48] = v19;
        -[_OUFrame GetSceneCameraPoseInVisionWorld](self->arframe_, "GetSceneCameraPoseInVisionWorld");
        *(_OWORD *)self->_anon_70 = v20;
        *(_OWORD *)&self->_anon_70[16] = v21;
        LOBYTE(v9) = 1;
        *(_OWORD *)&self->_anon_70[32] = v22;
        *(_OWORD *)&self->_anon_70[48] = v23;
        goto LABEL_10;
      }
    }
    else
    {

    }
LABEL_9:
    LOBYTE(v9) = 0;
  }
LABEL_10:

  return (char)v9;
}

- (void)getPointCloudFromOUFrame:(simd_float4)a3 scenUnderstandingPose:(simd_float4)a4
{
  id v8;
  void *v9;
  float32x2_t *v10;
  float32x2_t *v11;
  float32x2_t *v12;
  unint64_t v13;
  OUPointCloud *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *__p[3];
  void *v26[3];
  void *v27;
  void *v28;
  float32x2_t *v29;
  float32x2_t *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a7;
  kdebug_trace();
  CameraPCFromARFrameSceneCamera(v8, 4u, (void **)&v29, *(float *)(a1 + 200));
  objc_msgSend(v8, "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SampleSemantics((uint64_t *)&v29, v9, (__CVBuffer *)objc_msgSend(v8, "semanticLabelBuffer"), (__CVBuffer *)objc_msgSend(v8, "semanticConfidenceBuffer"), v26, a2, a3, a4, a5);

  v10 = v29;
  v11 = v30;
  if (v29 == v30)
  {
    v12 = v29;
  }
  else
  {
    do
    {
      *(float32x4_t *)v10->f32 = vaddq_f32((float32x4_t)a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)a2, COERCE_FLOAT(*(_OWORD *)v10->f32)), (float32x4_t)a3, *v10, 1), (float32x4_t)a4, *(float32x4_t *)v10->f32, 2));
      v10 += 2;
    }
    while (v10 != v11);
    v10 = v29;
    v12 = v30;
  }
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(__p, ((char *)v12 - (char *)v10) >> 4);
  if (v30 != v29)
  {
    v13 = 0;
    do
      *((_OWORD *)__p[0] + v13++) = xmmword_2295604C0;
    while (v13 < ((char *)v30 - (char *)v29) >> 4);
  }
  v14 = [OUPointCloud alloc];
  v15 = -[OUPointCloud initWithCount:points:semanticLabels:semanticVotes:colors:](v14, "initWithCount:points:semanticLabels:semanticVotes:colors:", ((char *)v30 - (char *)v29) >> 4);
  v16 = *(void **)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v15;

  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "timestamp");
    v19 = v18;
    v20 = objc_msgSend(*(id *)(a1 + 184), "count");
    *(_DWORD *)buf = 134218240;
    v32 = v19;
    v33 = 2048;
    v34 = v20;
    _os_log_impl(&dword_2294C8000, v17, OS_LOG_TYPE_INFO, "Updating world point cloud with frame at time %f with %zu points.", buf, 0x16u);
  }

  kdebug_trace();
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  if (v29)
  {
    v30 = v29;
    operator delete(v29);
  }

}

- (BOOL)updateWorldPCWithKeyframes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  OUPointCloud *v11;
  uint64_t v12;
  OUPointCloud *v13;
  NSMutableDictionary *accumulatedPointCloud;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id obj;
  void *__p;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = (const void *)objc_msgSend(v7, "pointsToWorld");
        v9 = objc_msgSend(v7, "pointsToWorld");
        v10 = objc_msgSend(v7, "count");
        __p = 0;
        v23 = 0;
        v24 = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v8, v9 + 16 * v10, (v9 + 16 * v10 - (uint64_t)v8) >> 4);
        v11 = [OUPointCloud alloc];
        v12 = objc_msgSend(v7, "count");
        v13 = -[OUPointCloud initWithCount:points:semanticLabels:semanticVotes:colors:](v11, "initWithCount:points:semanticLabels:semanticVotes:colors:", v12, __p, objc_msgSend(v7, "semanticLabels"), objc_msgSend(v7, "semanticVotes"), objc_msgSend(v7, "colors"));
        accumulatedPointCloud = self->accumulatedPointCloud_;
        objc_msgSend(v7, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](accumulatedPointCloud, "setObject:forKey:", v13, v15);

        if (__p)
        {
          v23 = __p;
          operator delete(__p);
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary allKeys](self->accumulatedPointCloud_, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->num_cur_key_frames_ = objc_msgSend(v16, "count");

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("3dod_earlyout_accumulation"));

  if (v18)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[OUPipelineOnline updateWorldPCWithKeyframes:].cold.1(v19);

  }
  return v18 ^ 1;
}

- (void)updateObjectAsset
{
  OUPointCloud *v3;

  -[OUObjectAsset setObjects:](self->objectAsset_, "setObjects:", self->allObjects);
  v3 = objc_alloc_init(OUPointCloud);
  -[OUObjectAsset setFrustumPointCloud:](self->objectAsset_, "setFrustumPointCloud:");

}

- (id)updatePipelineWithKeyframes:(double)a3 currentCameraPose:(double)a4
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v8 = a7;
  if ((objc_msgSend((id)a1, "updateWorldPCWithKeyframes:", v8) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 216), "updateWithAccumulatePC:currentCameraPose:", *(_QWORD *)(a1 + 176), a2, a3, a4, a5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 208);
    *(_QWORD *)(a1 + 208) = v9;

    objc_msgSend((id)a1, "updateObjectAsset");
    v11 = *(id *)(a1 + 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)updatePipelineWithKeyframes:(id)a3 ouframe:(id)a4
{
  id v6;
  id v7;
  OUFrameWriter *value;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  char *v16;
  int v17;
  utils::OUFrameWriter *v18;
  _OUFrame **p_arframe;
  NSArray *v20;
  NSArray *allObjects;
  OUObjectAsset *v22;
  void *__p[2];
  char v25;

  v6 = a3;
  v7 = a4;
  if (-[OUPipelineOnline updateCameraWithValid:ouframe:](self, "updateCameraWithValid:ouframe:", v6, v7))
  {
    if (!-[OUPipelineOnline updateWorldPCWithKeyframes:](self, "updateWorldPCWithKeyframes:", v6))
    {
      -[_OUFrame ReleaseBuffer](self->arframe_, "ReleaseBuffer");
      v22 = 0;
      goto LABEL_15;
    }
    if (self->write_debug_output_)
    {
      value = self->frame_writer_.__ptr_.__value_;
      if (!value)
      {
        v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v9, "setDateFormat:", CFSTR("MM_dd_yyyy_HH_mm_ss_SSS"));
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringFromDate:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Documents/Rooms/OU_dump"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = time(0);
        srand(v14);
        v15 = objc_retainAutorelease(v13);
        v16 = (char *)objc_msgSend(v15, "UTF8String");
        v17 = rand();
        v18 = (utils::OUFrameWriter *)operator new();
        std::string::basic_string[abi:ne180100]<0>(__p, v16);
        utils::OUFrameWriter::OUFrameWriter(v18, __p, v17 % 100000000, 0);
        if (v25 < 0)
          operator delete(__p[0]);
        std::unique_ptr<utils::OUFrameWriter>::reset[abi:ne180100]((utils::OUFrameWriter **)&self->frame_writer_, v18);

        value = self->frame_writer_.__ptr_.__value_;
      }
      utils::OUFrameWriter::Write((utils::OUFrameWriter *)value, self->arframe_, v6);
    }
    p_arframe = &self->arframe_;
    -[OU3DObjectDetector updateWithAccumulatePC:ouframe:](self->ou3dod_, "updateWithAccumulatePC:ouframe:", self->accumulatedPointCloud_, self->arframe_);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allObjects = self->allObjects;
    self->allObjects = v20;

    if (self->enable_3dor_)
      ou3dor::OU3DObjectRepresentation::AddObjects2DFeatures((ou3dor::OU3DObjectRepresentation *)self->ou3dor_.__ptr_.__value_, self->arframe_, self->allObjects);
    -[OUPipelineOnline updateObjectAsset](self, "updateObjectAsset");
  }
  else
  {
    p_arframe = &self->arframe_;
  }
  -[_OUFrame ReleaseBuffer](*p_arframe, "ReleaseBuffer");
  v22 = self->objectAsset_;
LABEL_15:

  return v22;
}

- (void).cxx_destruct
{
  std::unique_ptr<utils::OUFrameWriter>::reset[abi:ne180100]((utils::OUFrameWriter **)&self->frame_writer_, 0);
  std::unique_ptr<ou3dor::OU3DObjectRepresentation>::reset[abi:ne180100]((ou3dor::OU3DObjectRepresentation **)&self->ou3dor_, 0);
  objc_storeStrong((id *)&self->ou3dod_, 0);
  objc_storeStrong((id *)&self->allObjects, 0);
  objc_storeStrong((id *)&self->arframePointCloud_, 0);
  objc_storeStrong((id *)&self->accumulatedPointCloud_, 0);
  objc_storeStrong((id *)&self->arframe_, 0);
  objc_storeStrong((id *)&self->camera_, 0);
  objc_storeStrong((id *)&self->objectAsset_, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  return self;
}

- (void)updateWorldPCWithKeyframes:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = CFSTR("3dod_earlyout_accumulation");
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "pnp measurement: %@", (uint8_t *)&v1, 0xCu);
}

@end
