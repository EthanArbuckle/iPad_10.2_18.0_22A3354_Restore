@implementation VLLocalizer

- (void)determineAvailabilityAtLocation:(id)a3 purpose:(int64_t)a4 callbackQueue:(id)a5 callback:(id)a6
{
  void *v6;
  id v11;
  NSObject *v12;
  float64x2_t v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  double v19;
  double v21;
  __double2 v22;
  double v23;
  double v24;
  NSObject *v25;
  double v26;
  float64x2_t v27;
  long double __y;
  uint8_t buf[8];
  double v30;
  _QWORD block[4];
  id v32;

  v11 = v6;
  v12 = a6;
  if ((objc_msgSend((id)objc_opt_class(), "isVisualLocalizationSupported") & 1) == 0)
  {
    if (qword_253E9A288 == -1)
    {
      v25 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
      {
LABEL_15:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __78__VLLocalizer_determineAvailabilityAtLocation_purpose_callbackQueue_callback___block_invoke;
        block[3] = &unk_24CA9BA98;
        v32 = v11;
        dispatch_async(v12, block);

        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v25 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
        goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210B26000, v25, OS_LOG_TYPE_INFO, "Visual localization is not supported on this device", buf, 2u);
    goto LABEL_15;
  }
  v13 = *(float64x2_t *)a4;
  v14 = *(double *)(a4 + 8);
  v15 = sqrt(vmlad_n_f64(vmuld_lane_f64(v14, *(float64x2_t *)a4, 1), v13.f64[0], v13.f64[0]));
  v16 = v15 * 0.99330562;
  v17 = 1.57079633;
  if (v15 * 0.99330562 != 0.0)
  {
    v26 = *(double *)(a4 + 8);
    v27 = *(float64x2_t *)a4;
    v18 = 0;
    __y = *(double *)(a4 + 16);
    v17 = 0.0;
    v19 = 0.0;
    do
    {
      v21 = v17;
      v17 = atan2(__y, v16);
      v22 = __sincos_stret(v17);
      v23 = 6378137.0 / sqrt(v22.__sinval * -0.00669437999 * v22.__sinval + 1.0);
      v24 = v15 / v22.__cosval - v23;
      if (vabdd_f64(v21, v17) < 0.000001)
      {
        if (vabdd_f64(v19, v24) < 0.001 || v18 >= 9)
        {
LABEL_11:
          v13.f64[0] = v27.f64[0];
          v14 = v26;
          goto LABEL_17;
        }
      }
      else if (v18 > 8)
      {
        goto LABEL_11;
      }
      ++v18;
      v16 = v15 * (v23 / (v23 + v24) * -0.00669437999 + 1.0);
      v19 = v15 / v22.__cosval - v23;
    }
    while (v16 != 0.0);
    v13.f64[0] = v27.f64[0];
    v17 = 1.57079633;
    v14 = v26;
  }
LABEL_17:
  *(double *)buf = v17 / 0.0174532925;
  v30 = atan2(v14, v13.f64[0]) / 0.0174532925;
  -[VLLocalizationDataProvider determineAvailabilityForCoordinate:horizontalAccuracy:purpose:callbackQueue:callback:](self->_dataProvider, "determineAvailabilityForCoordinate:horizontalAccuracy:purpose:callbackQueue:callback:", buf, a5, v12, v11, *(double *)(a4 + 32));

LABEL_18:
}

+ (BOOL)isVisualLocalizationSupported
{
  if (qword_253E9A258 != -1)
    dispatch_once(&qword_253E9A258, &__block_literal_global_3);
  return _MergedGlobals_3;
}

- (VLLocalizer)initWithAuditToken:(id)a3
{
  id v4;
  VLLocalizer *v5;
  VLLocalizer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VLTileDataProvider *v14;
  VLLocalizationDataProvider *dataProvider;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  VLFilesystemDataProvider *v20;
  VLLocalizationDataProvider *backupDataProvider;
  VLLocalizer *v22;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VLLocalizer;
  v5 = -[VLLocalizer init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VLLocalizer _commonInit](v5, "_commonInit");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", vl_argo_support_data_ver);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254A77160);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254A77164);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254A77168);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254A7716C);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254A77170);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

    v14 = -[VLTileDataProvider initWithAuditToken:supportedFormatVersions:]([VLTileDataProvider alloc], "initWithAuditToken:supportedFormatVersions:", v4, v7);
    dataProvider = v6->_dataProvider;
    v6->_dataProvider = (VLLocalizationDataProvider *)v14;

    -[VLLocalizationDataProvider setDelegate:](v6->_dataProvider, "setDelegate:", v6);
    v16 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BE3CBE8], "geoServicesCacheDirectoryPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = CFSTR("VisualLocalization");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPathComponents:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[VLFilesystemDataProvider initWithBaseDirectory:]([VLFilesystemDataProvider alloc], "initWithBaseDirectory:", v19);
    backupDataProvider = v6->_backupDataProvider;
    v6->_backupDataProvider = (VLLocalizationDataProvider *)v20;

    v22 = v6;
  }

  return v6;
}

- (void)_commonInit
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VLFilesystemDataProvider *v10;
  VLLocalizationDataProvider *backupDataProvider;
  NSObject *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *recorderQueue;
  NSObject *v15;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *altitudeCalculationQueue;
  uint8_t v18[8];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  self->_signpostID = os_signpost_id_generate((os_log_t)qword_253E9A280);
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v3 = (id)qword_253E9A280;
  v4 = v3;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_210B26000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "Session", (const char *)&unk_210BCA1F1, v18, 2u);
  }

  self->_vlOnce.lock._os_unfair_lock_opaque = 0;
  self->_vlOnce.didRun = 0;
  self->_algorithmVersion = GEOConfigGetInteger();
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BE3CBE8], "geoServicesCacheDirectoryPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = CFSTR("VisualLocalization");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPathComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[VLFilesystemDataProvider initWithBaseDirectory:]([VLFilesystemDataProvider alloc], "initWithBaseDirectory:", v9);
  backupDataProvider = self->_backupDataProvider;
  self->_backupDataProvider = (VLLocalizationDataProvider *)v10;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VisualLocalization.Recorder", v12);
  recorderQueue = self->_recorderQueue;
  self->_recorderQueue = v13;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.VisualLocalization.AltitudeCalculation", v15);
  altitudeCalculationQueue = self->_altitudeCalculationQueue;
  self->_altitudeCalculationQueue = v16;

}

+ (double)maximumHorizontalAccuracyThreshold
{
  return *(double *)&vl_gps_max_horz_accuracy;
}

void __44__VLLocalizer_isVisualLocalizationSupported__block_invoke()
{
  id v0;

  v0 = MTLCreateSystemDefaultDevice();
  if ((objc_msgSend(v0, "supportsFamily:", 3003) & 1) != 0 || (objc_msgSend(v0, "supportsFamily:", 1004) & 1) != 0)
  {
    _MergedGlobals_3 = 1;

  }
  else
  {
    _MergedGlobals_3 = objc_msgSend(v0, "supportsFamily:", 2002);

  }
}

+ (id)_debugInfoRecorder
{
  return (id)MEMORY[0x212BCF2AC](qword_253E9A250, a2);
}

+ (void)_setDebugInfoRecorder:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)qword_253E9A250;
  qword_253E9A250 = v3;

}

+ (double)minimumTiltAngle
{
  return *(double *)&vl_camera_min_gravity_angle;
}

- (VLLocalizer)init
{
  return -[VLLocalizer initWithAuditToken:](self, "initWithAuditToken:", 0);
}

- (VLLocalizer)initWithDataProvider:(id)a3
{
  id v5;
  VLLocalizer *v6;
  VLLocalizer *v7;
  VLLocalizer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VLLocalizer;
  v6 = -[VLLocalizer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[VLLocalizer _commonInit](v6, "_commonInit");
    objc_storeStrong((id *)&v7->_dataProvider, a3);
    -[VLLocalizationDataProvider setDelegate:](v7->_dataProvider, "setDelegate:", v7);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  vl_t *vl;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostID;
  objc_super v7;
  uint8_t buf[16];

  vl = self->_vl;
  if (vl)
    vl_free((uint64_t)vl);
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v4 = (id)qword_253E9A280;
  v5 = v4;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210B26000, v5, OS_SIGNPOST_INTERVAL_END, signpostID, "Session", (const char *)&unk_210BCA1F1, buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)VLLocalizer;
  -[VLLocalizer dealloc](&v7, sel_dealloc);
}

- (vl_t)_vlHandle
{
  GEOOnce();
  return self->_vl;
}

void __24__VLLocalizer__vlHandle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  id v7;
  _BYTE __src[1008];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  v7 = objc_retainAutorelease(v3);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = vl_create((uint64_t)_vlTrackCallback, v4, 0, (uint64_t (*)(_QWORD, _QWORD, _QWORD))_vlLogCallback, v4, (_BYTE *)objc_msgSend(v7, "cStringUsingEncoding:", 1), 0);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD **)(v5 + 16);
  LODWORD(v4) = *(_DWORD *)(v5 + 48);
  vl_par_version(v4, (uint64_t)__src);
  memcpy(v6, __src, 0x3F0uLL);
  v6[252] = v4;

}

- (BOOL)shouldCacheMetadata
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[VLLocalizationDataProvider shouldCacheMetadata](self->_dataProvider, "shouldCacheMetadata");
  else
    return 0;
}

- (void)setShouldCacheMetadata:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VLLocalizationDataProvider setShouldCacheMetadata:](self->_dataProvider, "setShouldCacheMetadata:", v3);
}

- (void)_setAlgorithmVersion:(int)a3
{
  vl_t *v4;
  _BYTE v5[1008];

  self->_algorithmVersion = a3;
  v4 = -[VLLocalizer _vlHandle](self, "_vlHandle");
  vl_par_version(a3, (uint64_t)v5);
  memcpy(v4, v5, 0x3F0uLL);
  v4->var1 = a3;
}

- (void)determineAvailabilityAtLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = *((_OWORD *)a4 + 1);
  v7[0] = *(_OWORD *)a4;
  v7[1] = v6;
  v7[2] = *((_OWORD *)a4 + 2);
  -[VLLocalizer determineAvailabilityAtLocation:purpose:callbackQueue:callback:](self, "determineAvailabilityAtLocation:purpose:callbackQueue:callback:", v7, 0, a5, v5);
}

uint64_t __78__VLLocalizer_determineAvailabilityAtLocation_purpose_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)determineAltitudesAtLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _VLLocalizerAltitudeQuery *v15;
  NSObject *v16;
  uint64_t v17;
  os_signpost_id_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __double2 v24;
  __double2 v25;
  double v26;
  float64x2_t v27;
  OS_dispatch_queue *altitudeCalculationQueue;
  __int128 v29;
  id v30;
  id v31;
  _VLLocalizerAltitudeQuery *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  _VLLocalizerAltitudeQuery *v36;
  id v37;
  id v38;
  _BYTE buf[32];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "coordinate");
  v12 = v11;
  objc_msgSend(v8, "coordinate");
  v14 = v13;
  v15 = -[_VLLocalizerAltitudeQuery initWithLocation:callbackQueue:callback:]([_VLLocalizerAltitudeQuery alloc], "initWithLocation:callbackQueue:callback:", v8, v9, v10);
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v16 = (id)qword_253E9A280;
  v17 = -[_VLLocalizerAltitudeQuery signpostID](v15, "signpostID");
  if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "QueryAltitude", (const char *)&unk_210BCA1F1, buf, 2u);
    }
  }

  if (qword_253E9A288 != -1)
  {
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v19 = (void *)qword_253E9A280;
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    goto LABEL_8;
  }
  v19 = (void *)qword_253E9A280;
  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    v20 = v19;
    objc_msgSend(v8, "coordinate");
    v22 = v21;
    objc_msgSend(v8, "coordinate");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v23;
    _os_log_impl(&dword_210B26000, v20, OS_LOG_TYPE_DEBUG, "Determining altitudes at location: <%f, %f>", buf, 0x16u);

  }
LABEL_9:
  v24 = __sincos_stret(v14 * 0.0174532925);
  v25 = __sincos_stret(v12 * 0.0174532925);
  v26 = 6378137.0 / sqrt(v25.__sinval * -0.00669437999 * v25.__sinval + 1.0);
  v27.f64[0] = v24.__cosval;
  v27.f64[1] = v24.__sinval;
  altitudeCalculationQueue = self->_altitudeCalculationQueue;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke;
  v34[3] = &unk_24CA9BAE8;
  v34[4] = self;
  v35 = v8;
  v36 = v15;
  v37 = v9;
  v38 = v10;
  *(double *)&v29 = v25.__sinval * (v26 * 0.99330562 + 0.0);
  *(float64x2_t *)buf = vmulq_n_f64(v27, v25.__cosval * (v26 + 0.0));
  *(_OWORD *)&buf[16] = v29;
  v40 = 0;
  v41 = 0;
  v30 = v10;
  v31 = v9;
  v32 = v15;
  v33 = v8;
  -[VLLocalizer determineAvailabilityAtLocation:callbackQueue:callback:](self, "determineAvailabilityAtLocation:callbackQueue:callback:", buf, altitudeCalculationQueue, v34);

}

void __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  os_signpost_id_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
  if (v5)
  {
    if (qword_253E9A288 == -1)
    {
      v6 = (void *)qword_253E9A280;
      if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v6 = (void *)qword_253E9A280;
      if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        v7 = *(void **)(a1 + 40);
        v8 = v6;
        objc_msgSend(v7, "coordinate");
        v10 = v9;
        objc_msgSend(*(id *)(a1 + 40), "coordinate");
        *(_DWORD *)buf = 134218498;
        v43 = v10;
        v44 = 2048;
        v45 = v11;
        v46 = 2112;
        v47 = v5;
        _os_log_impl(&dword_210B26000, v8, OS_LOG_TYPE_ERROR, "Got an error determining availability of tiles at location: <%f, %f>: %@", buf, 0x20u);

        if (qword_253E9A288 != -1)
          dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      }
    }
    v12 = (id)qword_253E9A280;
    v13 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210B26000, v12, OS_SIGNPOST_INTERVAL_END, v14, "QueryAltitude", (const char *)&unk_210BCA1F1, buf, 2u);
      }
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_15;
    block[3] = &unk_24CA9BAC0;
    v15 = *(NSObject **)(a1 + 56);
    v41 = *(id *)(a1 + 64);
    v40 = v5;
    dispatch_async(v15, block);

    goto LABEL_24;
  }
  if ((a2 & 1) != 0)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(v16 + 88);
    v17 = (id *)(v16 + 88);
    if (v18)
    {
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      if (!v19)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(v21 + 80);
        *(_QWORD *)(v21 + 80) = v20;

        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      }
      objc_msgSend(v19, "addObject:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_storeStrong(v17, *(id *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_resolveCurrentAltitudeQuery");
    }
    goto LABEL_24;
  }
  if (qword_253E9A288 == -1)
  {
    v23 = (void *)qword_253E9A280;
    if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
      goto LABEL_17;
  }
  else
  {
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v23 = (void *)qword_253E9A280;
    if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
    {
LABEL_17:
      v24 = *(void **)(a1 + 40);
      v25 = v23;
      objc_msgSend(v24, "coordinate");
      v27 = v26;
      objc_msgSend(*(id *)(a1 + 40), "coordinate");
      *(_DWORD *)buf = 134218240;
      v43 = v27;
      v44 = 2048;
      v45 = v28;
      _os_log_impl(&dword_210B26000, v25, OS_LOG_TYPE_INFO, "VL is not available at location: <%f, %f>", buf, 0x16u);

      if (qword_253E9A288 != -1)
        dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    }
  }
  v29 = (id)qword_253E9A280;
  v30 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
  if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v29, OS_SIGNPOST_INTERVAL_END, v31, "QueryAltitude", (const char *)&unk_210BCA1F1, buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLAltitudeDataProviderError"), 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_17;
  v36[3] = &unk_24CA9BAC0;
  v33 = *(NSObject **)(a1 + 56);
  v34 = *(id *)(a1 + 64);
  v37 = v32;
  v38 = v34;
  v35 = v32;
  dispatch_async(v33, v36);

LABEL_24:
}

uint64_t __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __67__VLLocalizer_determineAltitudesAtLocation_callbackQueue_callback___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_resolveCurrentAltitudeQuery
{
  _VLLocalizerAltitudeQuery *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  vl_t *v12;
  OS_dispatch_queue *altitudeCalculationQueue;
  _OWORD v14[2];
  uint64_t v15;
  _QWORD v16[5];
  _VLLocalizerAltitudeQuery *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[32];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = self->_currentAltitudeQuery;
  if (v3)
  {
    if (qword_253E9A288 == -1)
    {
      v4 = (void *)qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        v22 = 0;
        memset(buf, 0, sizeof(buf));
        -[_VLLocalizerAltitudeQuery location](v3, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        VLLocationFromCLLocation(v11, (uint64_t)buf);

        LODWORD(v22) = 1;
        v12 = -[VLLocalizer _vlHandle](self, "_vlHandle");
        altitudeCalculationQueue = self->_altitudeCalculationQueue;
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke;
        v16[3] = &unk_24CA9BB38;
        v16[4] = self;
        v17 = v3;
        v18 = *(_OWORD *)buf;
        v19 = *(_OWORD *)&buf[16];
        v20 = v22;
        v14[0] = *(_OWORD *)buf;
        v14[1] = *(_OWORD *)&buf[16];
        v15 = v22;
        _prepareAltitudeQuery((uint64_t)v12, (uint64_t)v14, 0, altitudeCalculationQueue, v16);

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v4 = (void *)qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
    }
    v5 = v4;
    -[_VLLocalizerAltitudeQuery location](v3, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v8 = v7;
    -[_VLLocalizerAltitudeQuery location](v3, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_210B26000, v5, OS_LOG_TYPE_DEBUG, "Trying to get altitude at location: %f, %f", buf, 0x16u);

    goto LABEL_5;
  }
LABEL_6:

}

void __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  unsigned int v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  unsigned int v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  uint8_t buf[16];
  __int128 v50;
  uint64_t v51;
  id v52;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 72));
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v2 = (id)qword_253E9A280;
  v3 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CalculateAltitude", (const char *)&unk_210BCA1F1, buf, 2u);
    }
  }

  v5 = *(void **)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
  v50 = v6;
  v51 = *(_QWORD *)(a1 + 80);
  v52 = 0;
  objc_msgSend(v5, "_altitudesAtLocation:error:", buf, &v52);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v52;
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v9 = (id)qword_253E9A280;
  v10 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v9, OS_SIGNPOST_INTERVAL_END, v11, "CalculateAltitude", (const char *)&unk_210BCA1F1, buf, 2u);
    }
  }

  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v12 = (id)qword_253E9A280;
  v13 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210B26000, v12, OS_SIGNPOST_INTERVAL_END, v14, "QueryAltitude", (const char *)&unk_210BCA1F1, buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke_19;
  block[3] = &unk_24CA9BB10;
  v46 = *(id *)(a1 + 40);
  v16 = v7;
  v47 = v16;
  v17 = v8;
  v48 = v17;
  dispatch_async(v15, block);

  v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
  v19 = *(_QWORD *)(a1 + 32);
  if (v18)
  {
    v20 = *(_DWORD *)(*(_QWORD *)(v19 + 16) + 144);
    v21 = *(id *)(a1 + 40);
    objc_msgSend(v21, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "coordinate");
    objc_msgSend(v21, "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "coordinate");
    GEOMapPointForCoordinate();
    v25 = v24;
    v27 = v26;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
      goto LABEL_27;
    v28 = 0;
    v29 = (double)(1 << v20) / *(double *)(MEMORY[0x24BE3CA50] + 16);
    v30 = vcvtmd_u64_f64(v29 * v25);
    v31 = vcvtmd_u64_f64(v29 * v27);
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectAtIndexedSubscript:", v28);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "location");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "coordinate");
      objc_msgSend(v32, "location");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "coordinate");
      GEOMapPointForCoordinate();
      v36 = v35;
      v38 = v37;

      v39 = vcvtmd_u64_f64(v29 * v38);
      if (vcvtmd_u64_f64(v29 * v36) == v30 && v39 == v31)
        break;
      if (++v28 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
        goto LABEL_27;
    }
    if (v28 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_27:
      v28 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectAtIndexedSubscript:", v28);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(a1 + 32);
    v44 = *(void **)(v43 + 88);
    *(_QWORD *)(v43 + 88) = v42;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectAtIndex:", v28);
    objc_msgSend(*(id *)(a1 + 32), "_resolveCurrentAltitudeQuery");
  }
  else
  {
    v41 = *(void **)(v19 + 88);
    *(_QWORD *)(v19 + 88) = 0;

  }
}

void __43__VLLocalizer__resolveCurrentAltitudeQuery__block_invoke_19(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)_altitudesAtLocation:(id *)a3 error:(id *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __double2 v11;
  double v12;
  double v13;
  vl_t *v14;
  float v15;
  float v16;
  int altitudes;
  int v18;
  NSObject *v19;
  uint64_t v20;
  vl_t *v21;
  _DWORD *v22;
  NSObject *v23;
  void *v24;
  double v25;
  vl_t *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  vl_t *v31;
  NSObject *v32;
  int v34;
  void *v35;
  uint8_t buf[4];
  vl_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3->var0[0];
  v7 = a3->var0[1];
  v8 = a3->var0[2];
  v9 = sqrt(v7 * v7 + v6 * v6);
  if (v9 >= 0.001)
  {
    v10 = atan2(a3->var0[2], v9 * 0.996647189);
  }
  else
  {
    v10 = dbl_210BCAB20[v8 < 0.0];
    v9 = 0.001;
  }
  v11 = __sincos_stret(v10);
  v12 = atan2(v7, v6);
  v13 = atan2(v8 + v11.__sinval * (v11.__sinval * v11.__sinval) * 42841.3115, v9 + v11.__cosval * (v11.__cosval * v11.__cosval) * -42697.6727);
  v35 = 0;
  v34 = 0;
  v14 = -[VLLocalizer _vlHandle](self, "_vlHandle");
  v15 = v13;
  v16 = v12;
  altitudes = vl_get_altitudes((uint64_t)v14, &v34, &v35, v15, v16);
  if (altitudes)
  {
    v18 = altitudes;
    if (qword_253E9A288 == -1)
    {
      v19 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v19 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        if (!a4)
          goto LABEL_37;
        if (v18 == 1)
        {
          v20 = 1;
          goto LABEL_36;
        }
        if (v18 != 2)
        {
          if (v18 == 3)
          {
            v20 = 2;
LABEL_36:
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLAltitudeDataProviderError"), v20, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
            if (v35)
              free(v35);
LABEL_39:
            v24 = 0;
            return v24;
          }
          if (qword_253E9A288 != -1)
          {
            dispatch_once(&qword_253E9A288, &__block_literal_global_201);
            v32 = qword_253E9A280;
            if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            goto LABEL_34;
          }
          v32 = qword_253E9A280;
          if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_ERROR))
          {
LABEL_34:
            *(_DWORD *)buf = 67109120;
            LODWORD(v37) = v18;
            _os_log_impl(&dword_210B26000, v32, OS_LOG_TYPE_ERROR, "Invalid VL status: %d", buf, 8u);
          }
LABEL_35:
          v20 = -1;
          goto LABEL_36;
        }
        if (qword_253E9A288 == -1)
        {
          v29 = (void *)qword_253E9A280;
          if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
        }
        else
        {
          dispatch_once(&qword_253E9A288, &__block_literal_global_201);
          v29 = (void *)qword_253E9A280;
          if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
        }
        v30 = v29;
        v31 = -[VLLocalizer _vlHandle](self, "_vlHandle");
        *(_DWORD *)buf = 134217984;
        v37 = v31;
        _os_log_impl(&dword_210B26000, v30, OS_LOG_TYPE_FAULT, "vl_get_altitudes returned error vl_not_init with vlHandle: %p", buf, 0xCu);

        goto LABEL_35;
      }
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v18;
    _os_log_impl(&dword_210B26000, v19, OS_LOG_TYPE_DEFAULT, "vl_get_altitudes returned status: %d", buf, 8u);
    goto LABEL_8;
  }
  v21 = (vl_t *)v34;
  v22 = v35;
  if (v34 >= 1 && v35)
  {
    if (qword_253E9A288 == -1)
    {
      v23 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v23 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        do
        {
          LODWORD(v25) = v22[(_QWORD)v26];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v27);

          v26 = (vl_t *)((char *)v26 + 1);
        }
        while (v21 != v26);
        free(v22);
        return v24;
      }
    }
    *(_DWORD *)buf = 134349056;
    v37 = v21;
    _os_log_impl(&dword_210B26000, v23, OS_LOG_TYPE_DEFAULT, "vl_get_altitudes returned %{public}llu altitudes", buf, 0xCu);
    goto LABEL_18;
  }
  if (qword_253E9A288 != -1)
  {
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v28 = qword_253E9A280;
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    goto LABEL_23;
  }
  v28 = qword_253E9A280;
  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_ERROR))
  {
LABEL_23:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210B26000, v28, OS_LOG_TYPE_ERROR, "Received <= 0 altitudes", buf, 2u);
  }
LABEL_24:
  if (v22)
    free(v22);
  if (!a4)
    goto LABEL_39;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLAltitudeDataProviderError"), -1, 0);
  v24 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v24;
}

- (id)_fileURLForTile:(const vl_tile_t *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  vl_tile_t v12;

  v12 = *a3;
  -[VLLocalizationDataProvider fileURLForKey:error:](self->_dataProvider, "fileURLForKey:error:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[VLLocalizationDataProvider fileURLForKey:error:](self->_backupDataProvider, "fileURLForKey:error:", &v12, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VLLocalizationDataProviderErrorDomain"), 2, 0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = v6;
  v6 = v10;
LABEL_8:

  return v10;
}

- (void)prepareWithLocation:(id)a3
{
  float64x2_t *v3;
  float64x2_t *v4;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  __double2 v14;
  double v15;
  NSObject *v17;
  long double v18;
  float64x2_t v19;
  float64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t signpostID;
  unsigned int v24;
  NSObject *v26;
  float64x2_t __x;
  long double __y;
  _BYTE buf[24];
  double v31;
  _BYTE v32[10];
  __int16 v33;
  float64_t v34;
  __int16 v35;
  float64_t v36;
  uint64_t v37;

  v4 = v3;
  v37 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)objc_opt_class(), "isVisualLocalizationSupported") & 1) == 0)
  {
    if (qword_253E9A288 == -1)
    {
      v26 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
        return;
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v26 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
        return;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210B26000, v26, OS_LOG_TYPE_INFO, "prepareWithLocation: Visual localization is not supported on this device", buf, 2u);
    return;
  }
  if (qword_253E9A288 == -1)
  {
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
  }
  else
  {
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
  }
  v6 = v4->f64[1];
  __x = *v4;
  v7 = sqrt(vmlad_n_f64(vmuld_lane_f64(v6, *v4, 1), __x.f64[0], __x.f64[0]));
  v8 = v7 * 0.99330562;
  v9 = 0.0;
  v10 = 1.57079633;
  if (v7 * 0.99330562 != 0.0)
  {
    v11 = 0;
    __y = v4[1].f64[0];
    v10 = 0.0;
    v12 = 0.0;
    while (1)
    {
      v13 = v10;
      v10 = atan2(__y, v8);
      v14 = __sincos_stret(v10);
      v15 = 6378137.0 / sqrt(v14.__sinval * -0.00669437999 * v14.__sinval + 1.0);
      v9 = v7 / v14.__cosval - v15;
      if (vabdd_f64(v13, v10) >= 0.000001)
      {
        if (v11 > 8)
        {
          v17 = qword_253E9A280;
          if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          goto LABEL_25;
        }
      }
      else if (vabdd_f64(v12, v9) < 0.001 || v11 >= 9)
      {
        v17 = qword_253E9A280;
        if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
          goto LABEL_23;
        goto LABEL_25;
      }
      ++v11;
      v8 = v7 * (v15 / (v15 + v9) * -0.00669437999 + 1.0);
      v12 = v7 / v14.__cosval - v15;
      if (v8 == 0.0)
      {
        v10 = 1.57079633;
        break;
      }
    }
  }
  v17 = qword_253E9A280;
  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
  {
LABEL_23:
    v18 = atan2(v6, __x.f64[0]);
    *(_DWORD *)buf = 134284801;
    v19 = *v4;
    v20 = v4[1].f64[0];
    *(double *)&buf[4] = v10 / 0.0174532925;
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = v18 / 0.0174532925;
    *(_WORD *)&buf[22] = 2049;
    v31 = v9;
    *(_WORD *)v32 = 2049;
    *(float64_t *)&v32[2] = v19.f64[0];
    v33 = 2049;
    v34 = v19.f64[1];
    v35 = 2049;
    v36 = v20;
    _os_log_impl(&dword_210B26000, v17, OS_LOG_TYPE_DEBUG, "prepare: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f)", buf, 0x3Eu);
    if (qword_253E9A288 != -1)
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  }
LABEL_25:
  v21 = (id)qword_253E9A280;
  v22 = v21;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210B26000, v22, OS_SIGNPOST_EVENT, signpostID, "Update", (const char *)&unk_210BCA1F1, buf, 2u);
  }

  *(_QWORD *)v32 = 0;
  *(float64x2_t *)buf = *v4;
  *(float64_t *)&buf[16] = v4[1].f64[0];
  *(float *)&v24 = v4[2].f64[0];
  *(_QWORD *)&v31 = v24;
  vl_update((uint64_t)-[VLLocalizer _vlHandle](self, "_vlHandle"), (uint64_t)buf);
}

- (void)prepareWithDeviceLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __double2 v11;
  __double2 v12;
  NSObject *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t signpostID;
  NSObject *v20;
  _OWORD v22[2];
  _BYTE v23[10];
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isVisualLocalizationSupported") & 1) == 0)
  {
    if (qword_253E9A288 == -1)
    {
      v20 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
        goto LABEL_17;
    }
    else
    {
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
      v20 = qword_253E9A280;
      if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
        goto LABEL_17;
    }
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_210B26000, v20, OS_LOG_TYPE_INFO, "prepareWithLocation: Visual localization is not supported on this device", (uint8_t *)v22, 2u);
    goto LABEL_17;
  }
  if (qword_253E9A288 == -1)
  {
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
  }
  else
  {
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
  }
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  objc_msgSend(v4, "altitude");
  v10 = v9;
  v11 = __sincos_stret(v6 * 0.0174532925);
  v12 = __sincos_stret(v8 * 0.0174532925);
  if (qword_253E9A288 == -1)
  {
    v13 = qword_253E9A280;
    if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v13 = qword_253E9A280;
    if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_DEBUG))
    {
LABEL_7:
      v14 = 6378137.0 / sqrt(v11.__sinval * -0.00669437999 * v11.__sinval + 1.0);
      v15 = v11.__cosval * (v10 + v14);
      LODWORD(v22[0]) = 134284801;
      *(double *)((char *)v22 + 4) = v6;
      WORD6(v22[0]) = 2049;
      *(double *)((char *)v22 + 14) = v8;
      WORD3(v22[1]) = 2049;
      *((double *)&v22[1] + 1) = v10;
      *(_WORD *)v23 = 2049;
      *(double *)&v23[2] = v12.__cosval * v15;
      v24 = 2049;
      v25 = v12.__sinval * v15;
      v26 = 2049;
      v27 = v11.__sinval * (v10 + v14 * 0.99330562);
      _os_log_impl(&dword_210B26000, v13, OS_LOG_TYPE_DEBUG, "prepare: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f)", (uint8_t *)v22, 0x3Eu);
      if (qword_253E9A288 != -1)
        dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    }
  }
LABEL_9:
  v16 = (id)qword_253E9A280;
  v17 = v16;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v22[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_210B26000, v17, OS_SIGNPOST_EVENT, signpostID, "Update", (const char *)&unk_210BCA1F1, (uint8_t *)v22, 2u);
  }

  *(_QWORD *)v23 = 0;
  memset(v22, 0, sizeof(v22));
  VLLocationFromCLLocation(v4, (uint64_t)v22);
  vl_update((uint64_t)-[VLLocalizer _vlHandle](self, "_vlHandle"), (uint64_t)v22);
LABEL_17:

}

- (id)locateWithPixelBuffer:(double)a3 timestamp:(double)a4 location:(double)a5 gravity:(__n128)a6 transform:(__n128)a7 cameraIntrinsics:(__n128)a8 radialDistortion:(double)a9 error:(uint64_t)a10
{
  double v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v26;
  __int128 v27;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  _OWORD v32[2];
  _OWORD v33[3];
  uint64_t v34;

  v19 = a2;
  v34 = *MEMORY[0x24BDAC8D0];
  v23 = *a14;
  v22 = a14[1];
  if (qword_253E9A268 != -1)
  {
    v30 = a7;
    v31 = a8;
    v29 = a6;
    v26 = *a14;
    v27 = a14[1];
    dispatch_once(&qword_253E9A268, &__block_literal_global_21);
    v23 = v26;
    v22 = v27;
    v19 = a2;
    a6 = v29;
    a7 = v30;
    a8 = v31;
  }
  v24 = a13[1];
  v33[0] = *a13;
  v33[1] = v24;
  v33[2] = a13[2];
  v32[0] = v23;
  v32[1] = v22;
  objc_msgSend(a1, "locateWithPixelBuffer:location:heading:gravity:transform:cameraIntrinsics:radialDistortion:timestamp:error:", a11, v33, v32, a15, -1.0, -1.0, v19, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8, *(_QWORD *)&a9, *(double *)&qword_253E9A260 * (double)a12);
  return (id)objc_claimAutoreleasedReturnValue();
}

double __114__VLLocalizer_locateWithPixelBuffer_timestamp_location_gravity_transform_cameraIntrinsics_radialDistortion_error___block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    qword_253E9A260 = *(_QWORD *)&result;
  }
  return result;
}

- (id)locateWithPixelBuffer:(double)a3 timestamp:(uint64_t)a4 location:(uint64_t)a5 heading:(unint64_t)a6 gravity:(_OWORD *)a7 transform:(__int128 *)a8 cameraIntrinsics:(uint64_t)a9 radialDistortion:(uint64_t)a10 error:(__int128)a11
{
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];
  _OWORD v31[3];
  uint64_t v32;

  v22 = a12;
  v21 = a13;
  v23 = a11;
  v32 = *MEMORY[0x24BDAC8D0];
  v25 = *a8;
  v24 = a8[1];
  if (qword_253E9A278 != -1)
  {
    v29 = a8[1];
    v28 = *a8;
    dispatch_once(&qword_253E9A278, &__block_literal_global_22);
    v25 = v28;
    v24 = v29;
    v23 = a11;
    v22 = a12;
    v21 = a13;
  }
  v26 = a7[1];
  v31[0] = *a7;
  v31[1] = v26;
  v31[2] = a7[2];
  v30[0] = v25;
  v30[1] = v24;
  objc_msgSend(a1, "locateWithPixelBuffer:location:heading:gravity:transform:cameraIntrinsics:radialDistortion:timestamp:error:", a5, v31, v30, a9, a2, a3, v23, v22, v21, a14, *(double *)&qword_253E9A270 * (double)a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

double __122__VLLocalizer_locateWithPixelBuffer_timestamp_location_heading_gravity_transform_cameraIntrinsics_radialDistortion_error___block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 / 1000000000.0;
    qword_253E9A270 = *(_QWORD *)&result;
  }
  return result;
}

- (id)locateWithPixelBuffer:(double)a3 location:(double)a4 heading:(double)a5 gravity:(double)a6 transform:(double)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(uint64_t)a9 timestamp:(float64x2_t *)a10 error:(__int128 *)a11
{
  uint64_t v25;
  float64x2_t v26;
  long double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unsigned int v32;
  double v33;
  double v35;
  __double2 v36;
  double v37;
  long double v38;
  double v39;
  id v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  double v48;
  float64x2_t v49;
  double v50;
  __int128 v51;
  __int128 v52;
  long double __y;
  _OWORD v58[2];
  _OWORD v59[8];
  _OWORD v60[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[2];

  v25 = a18;
  v26 = *a10;
  v27 = a10->f64[1];
  v28 = sqrt(vmlad_n_f64(vmuld_lane_f64(v27, *a10, 1), v26.f64[0], v26.f64[0]));
  v29 = v28 * 0.99330562;
  v30 = 0.0;
  v31 = 1.57079633;
  v51 = a11[1];
  v52 = *a11;
  if (v28 * 0.99330562 != 0.0)
  {
    v48 = a10->f64[1];
    v49 = *a10;
    v50 = a3;
    v32 = 0;
    __y = a10[1].f64[0];
    v31 = 0.0;
    v33 = 0.0;
    do
    {
      v35 = v31;
      v31 = atan2(__y, v29);
      v36 = __sincos_stret(v31);
      v37 = 6378137.0 / sqrt(v36.__sinval * -0.00669437999 * v36.__sinval + 1.0);
      v30 = v28 / v36.__cosval - v37;
      if (vabdd_f64(v35, v31) < 0.000001)
      {
        if (vabdd_f64(v33, v30) < 0.001 || v32 >= 9)
        {
LABEL_10:
          a3 = v50;
          v25 = a18;
          v26.f64[0] = v49.f64[0];
          v27 = v48;
          goto LABEL_12;
        }
      }
      else if (v32 > 8)
      {
        goto LABEL_10;
      }
      ++v32;
      v29 = v28 * (v37 / (v37 + v30) * -0.00669437999 + 1.0);
      v33 = v28 / v36.__cosval - v37;
    }
    while (v29 != 0.0);
    a3 = v50;
    v25 = a18;
    v26.f64[0] = v49.f64[0];
    v31 = 1.57079633;
    v27 = v48;
  }
LABEL_12:
  v38 = atan2(v27, v26.f64[0]) / 0.0174532925;
  v39 = v31 / 0.0174532925;
  v40 = objc_alloc((Class)getCLLocationClass());
  v41 = a10[2].f64[0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v40, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v42, v39, (double)v38, v30, v41, 0.0);

  v68 = 0u;
  memset(v69, 0, 28);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  if (v43)
    objc_msgSend(v43, "clientLocation");
  LODWORD(v67) = 1;
  v44 = objc_alloc((Class)getCLLocationClass());
  v59[6] = v67;
  v59[7] = v68;
  v60[0] = v69[0];
  *(_OWORD *)((char *)v60 + 12) = *(_OWORD *)((char *)v69 + 12);
  v59[2] = v63;
  v59[3] = v64;
  v59[4] = v65;
  v59[5] = v66;
  v59[0] = v61;
  v59[1] = v62;
  v45 = (void *)objc_msgSend(v44, "initWithClientLocation:", v59);

  v58[0] = v52;
  v58[1] = v51;
  objc_msgSend(a1, "locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:error:", a9, v45, v58, a12, a2, a3, a4, a5, a6, a7, a15, a16, a17, v25, 0xBFF0000000000000, a19);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (id)locateWithPixelBuffer:(uint64_t)a3 deviceLocation:(uint64_t)a4 heading:(_OWORD *)a5 gravity:(uint64_t)a6 transform:(uint64_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(__int128)a9 ambientLightIntensity:(__int128)a10 timestamp:(__int128)a11 error:(uint64_t)a12
{
  __int128 v14;
  _OWORD v16[2];

  v14 = a5[1];
  v16[0] = *a5;
  v16[1] = v14;
  objc_msgSend(a1, "locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:error:", a3, a4, v16, a9, a10, a11, a12, a13, a14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)locateWithPixelBuffer:(uint64_t)a3 deviceLocation:(uint64_t)a4 heading:(_OWORD *)a5 gravity:(uint64_t)a6 transform:(uint64_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(__int128)a9 exposureTargetOffset:(__int128)a10 timestamp:(__int128)a11 error:(uint64_t)a12
{
  __int128 v14;
  _OWORD v16[2];

  v14 = a5[1];
  v16[0] = *a5;
  v16[1] = v14;
  objc_msgSend(a1, "_locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:calculationBlock:error:", a3, a4, v16, &__block_literal_global_25, a6, a9, a10, a11, a12, a13, a14);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __149__VLLocalizer_locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, __int128 *a4, uint64_t a5)
{
  return vl_locate(a2, a3, a4, a5);
}

- (VLLocalizationResult)_locateWithPixelBuffer:(float64_t)a3 deviceLocation:(int8x16_t)a4 heading:(int8x16_t)a5 gravity:(int32x4_t)a6 transform:(int8x16_t)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(void *)a9 exposureTargetOffset:(void *)a10 timestamp:(float64x2_t *)a11 calculationBlock:(void *)a12 error:(unint64_t)a13
{
  uint64_t v23;
  double v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __double2 v34;
  __double2 v35;
  NSObject *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  signed int PixelFormatType;
  unsigned int v46;
  void *v47;
  NSObject *v48;
  VLLocalizationDebugInfo *v49;
  double v50;
  VLLocalizationDebugInfo *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  VLLocalizationResult *v56;
  size_t WidthOfPlane;
  unsigned int HeightOfPlane;
  uint64_t v59;
  void (**v60)(_QWORD);
  char BOOL;
  char v62;
  size_t Width;
  unsigned int Height;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  objc_class *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  float64x2_t v84;
  uint64_t v85;
  uint64_t v86;
  VLLocalizationDebugInfo *v87;
  double v88;
  VLLocalizationDebugInfo *v89;
  float64x2_t v90;
  void *v91;
  _QWORD *v92;
  CVPixelBufferRef v93;
  NSObject *v94;
  __CVBuffer *v95;
  size_t BytesPerRow;
  VLLocalizationDebugInfo *v97;
  double v98;
  VLLocalizationDebugInfo *v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  VLLocalizationDebugInfo *v108;
  double v109;
  uint64_t v110;
  VLLocalizationDebugInfo *v111;
  void *v112;
  _QWORD *v113;
  long double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  unsigned int v119;
  double v120;
  double v122;
  __double2 v123;
  double v124;
  double v125;
  double v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  NSObject *v134;
  uint64_t v135;
  NSObject *v136;
  id *v137;
  id *v138;
  void *v139;
  VLLocalizationDebugInfo *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  NSObject *v145;
  uint64_t v147;
  unint64_t v148;
  os_signpost_id_t spid;
  char v150;
  float64x2_t v151;
  float64x2_t v152;
  double v154;
  float64_t v156;
  long double __ya;
  void *__yb;
  uint64_t (**v163)(id, uint64_t, void **, CVPixelBufferRef *, _OWORD *);
  uint64_t v165;
  _QWORD v166[4];
  VLLocalizationDebugInfo *v167;
  id v168;
  _OWORD v169[2];
  _QWORD v170[4];
  VLLocalizationDebugInfo *v171;
  id v172;
  _OWORD v173[2];
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint64_t v189;
  CVPixelBufferRef pixelBufferOut[4];
  int v191;
  uint64_t v192;
  int v193;
  __int128 v194;
  __int128 v195;
  uint64_t v196;
  double v197;
  float32x4_t v198;
  int v199;
  int32x2_t v200;
  unint64_t v201;
  int32x2_t v202;
  int32x2_t v203;
  int8x16_t v204;
  int v205;
  _QWORD v206[5];
  _QWORD v207[4];
  VLLocalizationDebugInfo *v208;
  id v209;
  _OWORD v210[2];
  _QWORD v211[5];
  _QWORD v212[5];
  void *BaseAddress;
  unint64_t v214;
  uint64_t v215;
  _QWORD block[4];
  VLLocalizationDebugInfo *v217;
  id v218;
  _OWORD v219[2];
  __int128 v220;
  __int128 v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _BYTE v232[32];
  _BYTE v233[10];
  __int16 v234;
  uint64_t v235;
  __int16 v236;
  uint64_t v237;
  __int16 v238;
  uint64_t v239;
  __int16 v240;
  double v241;
  float64x2_t v242;
  __int128 v243;
  __int128 v244;
  uint8_t buf[64];
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  uint64_t v273;
  _QWORD v274[2];
  _QWORD v275[2];
  uint64_t v276;
  void *v277;
  _QWORD v278[2];
  _QWORD v279[2];
  _QWORD v280[5];

  v23 = a21;
  v24 = a22;
  v280[2] = *MEMORY[0x24BDAC8D0];
  v151 = *a11;
  v152 = a11[1];
  v25 = a10;
  v163 = a12;
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v26 = (id)qword_253E9A280;
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

  if (v27)
  {
    objc_msgSend(v25, "coordinate");
    v29 = v28;
    objc_msgSend(v25, "coordinate");
    v31 = v30;
    objc_msgSend(v25, "altitude");
    v33 = v32;
    v34 = __sincos_stret(v29 * 0.0174532925);
    v35 = __sincos_stret(v31 * 0.0174532925);
    if (qword_253E9A288 != -1)
      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v36 = (id)qword_253E9A280;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = 6378137.0 / sqrt(v34.__sinval * -0.00669437999 * v34.__sinval + 1.0);
      v38 = v34.__cosval * (v33 + v37);
      *(_DWORD *)buf = 134285057;
      *(double *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2049;
      *(double *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2049;
      *(double *)&buf[24] = v33;
      *(_WORD *)&buf[32] = 2049;
      *(double *)&buf[34] = v35.__cosval * v38;
      *(_WORD *)&buf[42] = 2049;
      *(double *)&buf[44] = v35.__sinval * v38;
      *(_WORD *)&buf[52] = 2049;
      *(double *)&buf[54] = v34.__sinval * (v33 + v37 * 0.99330562);
      *(_WORD *)&buf[62] = 2050;
      *(double *)&v246 = a22;
      _os_log_impl(&dword_210B26000, v36, OS_LOG_TYPE_DEBUG, "locate: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f) @ %{public}.2f", buf, 0x48u);
    }

    v24 = a22;
    v23 = a21;
  }
  GEOGetMonotonicTime();
  v40 = v39;
  v222 = 0;
  v221 = 0u;
  v220 = 0u;
  VLLocationFromCLLocation(v25, (uint64_t)&v220);
  v165 = objc_msgSend((id)qword_253E9A250, "copy");
  if ((objc_msgSend((id)objc_opt_class(), "isVisualLocalizationSupported") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v150 = 1;
      if (qword_253E9A288 == -1)
        goto LABEL_12;
    }
    else
    {
      BOOL = GEOConfigGetBOOL();
      if (v165)
        v62 = 1;
      else
        v62 = BOOL;
      v150 = v62;
      if (qword_253E9A288 == -1)
      {
LABEL_12:
        v41 = (id)qword_253E9A280;
        spid = os_signpost_id_make_with_pointer(v41, a9);

        if (qword_253E9A288 != -1)
          dispatch_once(&qword_253E9A288, &__block_literal_global_201);
        v42 = (id)qword_253E9A280;
        v43 = v42;
        v148 = spid - 1;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          v44 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v44;
          _os_signpost_emit_with_name_impl(&dword_210B26000, v43, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Locate", "parent_signpost=%llu", buf, 0xCu);
        }

        v214 = 0;
        BaseAddress = 0;
        v215 = 0;
        PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)a9);
        v46 = PixelFormatType;
        if (PixelFormatType <= 1278226487)
        {
          if (PixelFormatType != 875704422 && PixelFormatType != 875704438)
          {
LABEL_46:
            if (qword_253E9A288 != -1)
              dispatch_once(&qword_253E9A288, &__block_literal_global_201);
            v65 = (id)qword_253E9A280;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = HIBYTE(v46);
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = BYTE2(v46);
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = BYTE1(v46);
              *(_WORD *)&buf[20] = 1024;
              *(_DWORD *)&buf[22] = v46;
              _os_log_impl(&dword_210B26000, v65, OS_LOG_TYPE_INFO, "Input pixel format (%c%c%c%c) requires conversion", buf, 0x1Au);
            }

            if (qword_253E9A288 != -1)
              dispatch_once(&qword_253E9A288, &__block_literal_global_201);
            v66 = (id)qword_253E9A280;
            v67 = v66;
            if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210B26000, v67, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ConvertImage", (const char *)&unk_210BCA1F1, buf, 2u);
            }

            *(_QWORD *)&v174 = 0;
            *((_QWORD *)&v174 + 1) = &v174;
            *(_QWORD *)&v175 = 0x2050000000;
            v68 = (void *)qword_253E9A2B0;
            *((_QWORD *)&v175 + 1) = qword_253E9A2B0;
            if (!qword_253E9A2B0)
            {
              *(_QWORD *)buf = MEMORY[0x24BDAC760];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __getCIImageClass_block_invoke_0;
              *(_QWORD *)&buf[24] = &unk_24CA9B760;
              *(_QWORD *)&buf[32] = &v174;
              __getCIImageClass_block_invoke_0((uint64_t)buf);
              v68 = *(void **)(*((_QWORD *)&v174 + 1) + 24);
            }
            v69 = objc_retainAutorelease(v68);
            _Block_object_dispose(&v174, 8);
            v70 = (void *)objc_msgSend([v69 alloc], "initWithCVPixelBuffer:", a9);
            objc_msgSend(v70, "extent");
            v72 = v71;
            objc_msgSend(v70, "extent");
            v74 = v73;
            v75 = (unint64_t)v72;
            pixelBufferOut[0] = 0;
            v276 = *MEMORY[0x24BDC5600];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)v72);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v277 = v76;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v277, &v276, 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v72, (unint64_t)v74, 0x4C303038u, (CFDictionaryRef)v77, pixelBufferOut)&& CVPixelBufferGetBytesPerRow(pixelBufferOut[0]) == v75)
            {
              *(_QWORD *)&v174 = 0;
              *((_QWORD *)&v174 + 1) = &v174;
              *(_QWORD *)&v175 = 0x2050000000;
              v78 = (void *)qword_253E9A2C0;
              *((_QWORD *)&v175 + 1) = qword_253E9A2C0;
              if (!qword_253E9A2C0)
              {
                *(_QWORD *)buf = MEMORY[0x24BDAC760];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = __getCIContextClass_block_invoke_0;
                *(_QWORD *)&buf[24] = &unk_24CA9B760;
                *(_QWORD *)&buf[32] = &v174;
                __getCIContextClass_block_invoke_0((uint64_t)buf);
                v78 = *(void **)(*((_QWORD *)&v174 + 1) + 24);
              }
              v79 = objc_retainAutorelease(v78);
              _Block_object_dispose(&v174, 8);
              objc_msgSend(v79, "context");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "render:toCVPixelBuffer:", v70, pixelBufferOut[0]);

              CVPixelBufferLockBaseAddress(pixelBufferOut[0], 1uLL);
              BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut[0]);
              v214 = __PAIR64__((unint64_t)v74, v75);
              LODWORD(v215) = 0;
              v206[0] = MEMORY[0x24BDAC760];
              v206[1] = 3221225472;
              v206[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2_35;
              v206[3] = &__block_descriptor_40_e5_v8__0l;
              v206[4] = pixelBufferOut[0];
              v60 = (void (**)(_QWORD))MEMORY[0x212BCF2AC](v206);
              if (qword_253E9A288 != -1)
                dispatch_once(&qword_253E9A288, &__block_literal_global_201);
              v81 = (id)qword_253E9A280;
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_210B26000, v81, OS_LOG_TYPE_DEBUG, "Successfully converted image to grayscale", buf, 2u);
              }

              if (qword_253E9A288 != -1)
                dispatch_once(&qword_253E9A288, &__block_literal_global_201);
              v82 = (id)qword_253E9A280;
              v83 = v82;
              if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_210B26000, v83, OS_SIGNPOST_INTERVAL_END, spid, "ConvertImage", (const char *)&unk_210BCA1F1, buf, 2u);
              }

LABEL_71:
              v193 = 0;
              pixelBufferOut[0] = (CVPixelBufferRef)vzip1_s32(*(int32x2_t *)a17.i8, *(int32x2_t *)a18.i8);
              pixelBufferOut[1] = (CVPixelBufferRef)__PAIR64__(a17.u32[1], a19);
              pixelBufferOut[2] = (CVPixelBufferRef)vzip2_s32(*(int32x2_t *)a18.i8, *(int32x2_t *)&a19);
              pixelBufferOut[3] = (CVPixelBufferRef)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a17, a17, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a18, a18, 8uLL));
              v191 = DWORD2(a19);
              v192 = a20;
              v194 = v220;
              v195 = v221;
              v196 = v222;
              v197 = v24;
              v84.f64[0] = a2;
              v84.f64[1] = a3;
              v198 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v84), v151);
              *(float *)v84.f64 = v152.f64[0];
              v199 = LODWORD(v84.f64[0]);
              v200 = vzip1_s32(*(int32x2_t *)a4.i8, *(int32x2_t *)a5.i8);
              v201 = __PAIR64__(a4.u32[1], a6.u32[0]);
              v202 = vzip2_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8);
              v203 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a4, a4, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a5, a5, 8uLL));
              v204 = vextq_s8((int8x16_t)vuzp1q_s32(a6, a6), a7, 0xCuLL);
              v205 = -1;
              v85 = objc_msgSend((id)a1, "_vlHandle");
              v189 = 0;
              v187 = 0u;
              v188 = 0u;
              v185 = 0u;
              v186 = 0u;
              v183 = 0u;
              v184 = 0u;
              v181 = 0u;
              v182 = 0u;
              v179 = 0u;
              v180 = 0u;
              v177 = 0u;
              v178 = 0u;
              v175 = 0u;
              v176 = 0u;
              v174 = 0u;
              v86 = v163[2](v163, v85, &BaseAddress, pixelBufferOut, &v174);
              v60[2](v60);
              v273 = 0;
              v272 = 0u;
              v271 = 0u;
              v270 = 0u;
              v269 = 0u;
              v268 = 0u;
              v267 = 0u;
              v266 = 0u;
              v265 = 0u;
              v264 = 0u;
              v263 = 0u;
              v262 = 0u;
              v261 = 0u;
              v260 = 0u;
              v259 = 0u;
              v258 = 0u;
              v257 = 0u;
              v256 = 0u;
              v255 = 0u;
              v254 = 0u;
              v253 = 0u;
              v252 = 0u;
              v251 = 0u;
              v250 = 0u;
              v249 = 0u;
              v248 = 0u;
              v247 = 0u;
              v246 = 0u;
              memset(buf, 0, sizeof(buf));
              vl_stats_get(v85, (void **)buf);
              if ((_DWORD)v86 == 1)
              {
                v87 = [VLLocalizationDebugInfo alloc];
                GEOGetMonotonicTime();
                *(_OWORD *)v232 = v220;
                *(_OWORD *)&v232[16] = v221;
                *(_QWORD *)v233 = v222;
                v173[0] = v151;
                v173[1] = v152;
                LOBYTE(v147) = v150;
                v89 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v87, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", a9, v232, v25, v173, buf, 1, v40, v24, v88 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7,
                        *(_OWORD *)&a17,
                        *(_OWORD *)&a18,
                        a19,
                        a20,
                        v23,
                        &v174,
                        v147);
                v56 = -[VLLocalizationResult initWithTimestamp:pose:debugInfo:]([VLLocalizationResult alloc], "initWithTimestamp:pose:debugInfo:", &v174, v89, v24);
                if (qword_253E9A288 == -1)
                {
                  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
                  {
LABEL_74:
                    objc_msgSend(v25, "coordinate");
                    objc_msgSend(v25, "coordinate");
                    if (v56)
                    {
                      -[VLLocalizationResult location](v56, "location");
                      __ya = *(double *)&v243;
                      v90 = v242;
                    }
                    else
                    {
                      v90 = 0uLL;
                      v244 = 0u;
                      v243 = 0u;
                      v242 = 0u;
                      __ya = 0.0;
                    }
                    v114 = v90.f64[1];
                    v115 = sqrt(vmlad_n_f64(vmuld_lane_f64(v90.f64[1], v90, 1), v90.f64[0], v90.f64[0]));
                    v116 = v115 * 0.99330562;
                    v117 = 0.0;
                    v118 = 1.57079633;
                    if (v115 * 0.99330562 != 0.0)
                    {
                      v154 = v90.f64[1];
                      v156 = v90.f64[0];
                      v119 = 0;
                      v118 = 0.0;
                      v120 = 0.0;
                      do
                      {
                        v122 = v118;
                        v118 = atan2(__ya, v116);
                        v123 = __sincos_stret(v118);
                        v124 = 6378137.0 / sqrt(v123.__sinval * -0.00669437999 * v123.__sinval + 1.0);
                        v117 = v115 / v123.__cosval - v124;
                        if (vabdd_f64(v122, v118) < 0.000001)
                        {
                          if (vabdd_f64(v120, v117) < 0.001 || v119 >= 9)
                          {
LABEL_114:
                            v90.f64[0] = v156;
                            v114 = v154;
                            goto LABEL_123;
                          }
                        }
                        else if (v119 > 8)
                        {
                          goto LABEL_114;
                        }
                        ++v119;
                        v116 = v115 * (v124 / (v124 + v117) * -0.00669437999 + 1.0);
                        v120 = v115 / v123.__cosval - v124;
                      }
                      while (v116 != 0.0);
                      v90.f64[0] = v156;
                      v114 = v154;
                      v118 = 1.57079633;
                    }
LABEL_123:
                    v125 = atan2(v114, v90.f64[0]) / 0.0174532925;
                    v126 = v118 / 0.0174532925;
                    GEOCalculateDistance();
                    v128 = v127;
                    if (qword_253E9A288 != -1)
                      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
                    v129 = (id)qword_253E9A280;
                    if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
                    {
                      if (v56)
                      {
                        -[VLLocalizationResult location](v56, "location");
                        v130 = v229;
                        -[VLLocalizationResult location](v56, "location");
                        v131 = *((_QWORD *)&v226 + 1);
                        -[VLLocalizationResult location](v56, "location");
                        v132 = v224;
                      }
                      else
                      {
                        v131 = 0;
                        v130 = 0;
                        v231 = 0u;
                        v230 = 0u;
                        v229 = 0u;
                        v226 = 0u;
                        v227 = 0u;
                        v228 = 0u;
                        v223 = 0u;
                        v224 = 0u;
                        v132 = 0;
                        v225 = 0u;
                      }
                      *(_DWORD *)v232 = 134285313;
                      *(double *)&v232[4] = v126;
                      *(_WORD *)&v232[12] = 2049;
                      *(double *)&v232[14] = v125;
                      *(_WORD *)&v232[22] = 2049;
                      *(double *)&v232[24] = v117;
                      *(_WORD *)v233 = 2049;
                      *(_QWORD *)&v233[2] = v130;
                      v234 = 2049;
                      v235 = v131;
                      v236 = 2049;
                      v237 = v132;
                      v238 = 2050;
                      v239 = v128;
                      v240 = 2048;
                      v241 = v24;
                      _os_log_impl(&dword_210B26000, v129, OS_LOG_TYPE_INFO, "locate result: (%{private}f, %{private}f, %{private}.2f) / ECEF: (%{private}f, %{private}f, %{private}f) -- Correction: %{public}.1f meters @ %.2f", v232, 0x52u);
                    }

                    if (qword_253E9A288 != -1)
                      dispatch_once(&qword_253E9A288, &__block_literal_global_201);
                  }
                }
                else
                {
                  dispatch_once(&qword_253E9A288, &__block_literal_global_201);
                  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
                    goto LABEL_74;
                }
                v133 = (id)qword_253E9A280;
                v134 = v133;
                if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
                {
                  v135 = *(_QWORD *)(a1 + 40);
                  *(_DWORD *)v232 = 134217984;
                  *(_QWORD *)&v232[4] = v135;
                  _os_signpost_emit_with_name_impl(&dword_210B26000, v134, OS_SIGNPOST_INTERVAL_END, spid, "Locate", "parent_signpost=%llu", v232, 0xCu);
                }

                if (!v165)
                  goto LABEL_198;
                v136 = *(NSObject **)(a1 + 56);
                v170[0] = MEMORY[0x24BDAC760];
                v170[1] = 3221225472;
                v170[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_37;
                v170[3] = &unk_24CA9BAC0;
                v137 = &v172;
                v172 = (id)v165;
                v138 = (id *)&v171;
                v89 = v89;
                v171 = v89;
                dispatch_async(v136, v170);
                goto LABEL_197;
              }
              if (qword_253E9A288 != -1)
                dispatch_once(&qword_253E9A288, &__block_literal_global_201);
              v104 = (id)qword_253E9A280;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v232 = 134349312;
                *(_QWORD *)&v232[4] = v86;
                *(_WORD *)&v232[12] = 2048;
                *(double *)&v232[14] = v24;
                _os_log_impl(&dword_210B26000, v104, OS_LOG_TYPE_INFO, "locate failed: %{public}llu @ %.2f", v232, 0x16u);
              }

              if (qword_253E9A288 != -1)
                dispatch_once(&qword_253E9A288, &__block_literal_global_201);
              v105 = (id)qword_253E9A280;
              v106 = v105;
              if (v148 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
              {
                v107 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)v232 = 134217984;
                *(_QWORD *)&v232[4] = v107;
                _os_signpost_emit_with_name_impl(&dword_210B26000, v106, OS_SIGNPOST_INTERVAL_END, spid, "Locate", "parent_signpost=%llu", v232, 0xCu);
              }

              if (!(a13 | v165))
              {
                v56 = 0;
LABEL_199:

LABEL_200:
                v47 = (void *)v165;
                goto LABEL_201;
              }
              v108 = [VLLocalizationDebugInfo alloc];
              GEOGetMonotonicTime();
              v110 = v86;
              *(_OWORD *)v232 = v220;
              *(_OWORD *)&v232[16] = v221;
              *(_QWORD *)v233 = v222;
              v169[0] = v151;
              v169[1] = v152;
              LOBYTE(v147) = v150;
              v111 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v108, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", a9, v232, v25, v169, buf, v86, v40, v24, v109 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7,
                       *(_OWORD *)&a17,
                       *(_OWORD *)&a18,
                       a19,
                       a20,
                       v23,
                       0,
                       v147);
              v89 = v111;
              if (!a13)
              {
LABEL_195:
                if (!v165)
                {
                  v56 = 0;
                  goto LABEL_198;
                }
                v145 = *(NSObject **)(a1 + 56);
                v166[0] = MEMORY[0x24BDAC760];
                v166[1] = 3221225472;
                v166[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_38;
                v166[3] = &unk_24CA9BAC0;
                v137 = &v168;
                v168 = (id)v165;
                v138 = (id *)&v167;
                v89 = v89;
                v167 = v89;
                dispatch_async(v145, v166);
                v56 = 0;
LABEL_197:

LABEL_198:
                goto LABEL_199;
              }
              v112 = (void *)MEMORY[0x24BDD1540];
              if (v111)
              {
                __yb = (void *)MEMORY[0x24BDD1540];
                if ((int)v86 <= 1023)
                {
                  v113 = (_QWORD *)a13;
                  if ((int)v86 <= 63)
                  {
                    switch((int)v86)
                    {
                      case 2:
                        goto LABEL_180;
                      case 4:
                      case 8:
                        v110 = 100;
                        break;
                      case 16:
                        v110 = 101;
                        break;
                      case 32:
                        v110 = 200;
                        break;
                      default:
                        goto LABEL_174;
                    }
                    goto LABEL_180;
                  }
                  if ((int)v86 > 255)
                  {
                    if ((_DWORD)v86 == 256)
                    {
                      v110 = 203;
                      goto LABEL_180;
                    }
                    if ((_DWORD)v86 == 512)
                    {
                      v110 = 204;
                      goto LABEL_180;
                    }
                  }
                  else
                  {
                    if ((_DWORD)v86 == 64)
                    {
                      v110 = 201;
                      goto LABEL_180;
                    }
                    if ((_DWORD)v86 == 128)
                    {
                      v110 = 202;
                      goto LABEL_180;
                    }
                  }
                }
                else
                {
                  if ((int)v86 >= 0x2000)
                  {
                    v113 = (_QWORD *)a13;
                    switch((int)v86)
                    {
                      case 16384:
                        v110 = 400;
                        break;
                      case 16385:
                        v110 = 401;
                        break;
                      case 16386:
                        v110 = 402;
                        break;
                      case 16387:
                        v110 = 403;
                        break;
                      case 16388:
                        v110 = 404;
                        break;
                      default:
                        if ((_DWORD)v86 == 0x2000)
                        {
                          v110 = 207;
                        }
                        else
                        {
                          if ((_DWORD)v86 != 0x8000)
                            goto LABEL_174;
                          v110 = 405;
                        }
                        break;
                    }
                    goto LABEL_180;
                  }
                  v113 = (_QWORD *)a13;
                  switch((_DWORD)v86)
                  {
                    case 0x400:
                      v110 = 205;
                      goto LABEL_180;
                    case 0x800:
                      v110 = 300;
                      goto LABEL_180;
                    case 0x1000:
                      v110 = 206;
LABEL_180:
                      v280[0] = CFSTR("UnderlyingVLStatus");
                      v139 = (void *)MEMORY[0x24BDD16E0];
                      v140 = v111;
                      objc_msgSend(v139, "numberWithUnsignedInt:", v86);
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      a13 = (unint64_t)v113;
                      v280[1] = CFSTR("VLLocalizerDebugInfo");
                      *(_QWORD *)v232 = v141;
                      *(_QWORD *)&v232[8] = v140;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v232, v280, 2);
                      v142 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(__yb, "errorWithDomain:code:userInfo:", CFSTR("VLLocalizerError"), v110, v142);
                      v143 = objc_claimAutoreleasedReturnValue();
LABEL_194:
                      v144 = (void *)v143;

                      *(_QWORD *)a13 = v144;
                      goto LABEL_195;
                  }
                }
LABEL_174:
                v110 = 1000;
                goto LABEL_180;
              }
              if ((int)v86 <= 1023)
              {
                if ((int)v86 <= 63)
                {
                  switch((int)v86)
                  {
                    case 2:
                      goto LABEL_193;
                    case 4:
                    case 8:
                      v110 = 100;
                      break;
                    case 16:
                      v110 = 101;
                      break;
                    case 32:
                      v110 = 200;
                      break;
                    default:
                      goto LABEL_187;
                  }
                  goto LABEL_193;
                }
                if ((int)v86 > 255)
                {
                  if ((_DWORD)v86 == 256)
                  {
                    v110 = 203;
                    goto LABEL_193;
                  }
                  if ((_DWORD)v86 == 512)
                  {
                    v110 = 204;
                    goto LABEL_193;
                  }
                }
                else
                {
                  if ((_DWORD)v86 == 64)
                  {
                    v110 = 201;
                    goto LABEL_193;
                  }
                  if ((_DWORD)v86 == 128)
                  {
                    v110 = 202;
                    goto LABEL_193;
                  }
                }
              }
              else
              {
                if ((int)v86 >= 0x2000)
                {
                  switch((int)v86)
                  {
                    case 16384:
                      v110 = 400;
                      break;
                    case 16385:
                      v110 = 401;
                      break;
                    case 16386:
                      v110 = 402;
                      break;
                    case 16387:
                      v110 = 403;
                      break;
                    case 16388:
                      v110 = 404;
                      break;
                    default:
                      if ((_DWORD)v86 == 0x2000)
                      {
                        v110 = 207;
                      }
                      else
                      {
                        if ((_DWORD)v86 != 0x8000)
                          goto LABEL_187;
                        v110 = 405;
                      }
                      break;
                  }
                  goto LABEL_193;
                }
                switch((_DWORD)v86)
                {
                  case 0x400:
                    v110 = 205;
                    goto LABEL_193;
                  case 0x800:
                    v110 = 300;
                    goto LABEL_193;
                  case 0x1000:
                    v110 = 206;
LABEL_193:
                    v280[0] = CFSTR("UnderlyingVLStatus");
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v86);
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)v232 = v141;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v232, v280, 1);
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v112, "errorWithDomain:code:userInfo:", CFSTR("VLLocalizerError"), v110, v142);
                    v143 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_194;
                }
              }
LABEL_187:
              v110 = 1000;
              goto LABEL_193;
            }
            if (CVPixelBufferGetBytesPerRow(pixelBufferOut[0]) != v75)
            {
              if (qword_253E9A288 != -1)
              {
                dispatch_once(&qword_253E9A288, &__block_literal_global_201);
                v91 = (void *)qword_253E9A280;
                if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_FAULT))
                  goto LABEL_80;
                goto LABEL_79;
              }
              v91 = (void *)qword_253E9A280;
              if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_FAULT))
              {
LABEL_79:
                v92 = (_QWORD *)a13;
                v93 = pixelBufferOut[0];
                v94 = v91;
                v95 = v93;
                a13 = (unint64_t)v92;
                BytesPerRow = CVPixelBufferGetBytesPerRow(v95);
                *(_DWORD *)buf = 134349312;
                *(_QWORD *)&buf[4] = BytesPerRow;
                *(_WORD *)&buf[12] = 2050;
                *(_QWORD *)&buf[14] = (unint64_t)v72;
                _os_log_impl(&dword_210B26000, v94, OS_LOG_TYPE_FAULT, "Image conversion failed to produce desired stride: %{public}zu vs %{public}zu", buf, 0x16u);

              }
            }
LABEL_80:
            if (a13 | v165)
            {
              v97 = [VLLocalizationDebugInfo alloc];
              GEOGetMonotonicTime();
              *(_OWORD *)buf = v220;
              *(_OWORD *)&buf[16] = v221;
              *(_QWORD *)&buf[32] = v222;
              v210[0] = v151;
              v210[1] = v152;
              LOBYTE(v147) = v150;
              v99 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v97, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", a9, buf, v25, v210, 0, 0, v40, v24, v98 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7,
                      *(_OWORD *)&a17,
                      *(_OWORD *)&a18,
                      a19,
                      a20,
                      v23,
                      0,
                      v147);
              v100 = (void *)MEMORY[0x24BDD1540];
              v274[0] = *MEMORY[0x24BDBD370];
              v274[1] = CFSTR("VLLocalizerDebugInfo");
              v275[0] = CFSTR("Failed to convert image format");
              v275[1] = v99;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v275, v274, 2);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "errorWithDomain:code:userInfo:", CFSTR("VLLocalizerError"), 2, v101);
              v102 = (void *)objc_claimAutoreleasedReturnValue();

              if (a13)
                *(_QWORD *)a13 = objc_retainAutorelease(v102);
              if (v165)
              {
                v103 = *(NSObject **)(a1 + 56);
                v207[0] = MEMORY[0x24BDAC760];
                v207[1] = 3221225472;
                v207[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_34;
                v207[3] = &unk_24CA9BAC0;
                v209 = (id)v165;
                v208 = v99;
                dispatch_async(v103, v207);

              }
            }

            v56 = 0;
            v60 = (void (**)(_QWORD))&__block_literal_global_31;
            goto LABEL_199;
          }
        }
        else
        {
          if (PixelFormatType == 1278226488)
          {
            CVPixelBufferLockBaseAddress((CVPixelBufferRef)a9, 1uLL);
            Width = CVPixelBufferGetWidth((CVPixelBufferRef)a9);
            Height = CVPixelBufferGetHeight((CVPixelBufferRef)a9);
            if (CVPixelBufferGetBytesPerRow((CVPixelBufferRef)a9) == Width)
            {
              BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)a9);
              v214 = __PAIR64__(Height, Width);
              LODWORD(v215) = 0;
              v211[0] = MEMORY[0x24BDAC760];
              v211[1] = 3221225472;
              v211[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_3;
              v211[3] = &__block_descriptor_40_e5_v8__0l;
              v211[4] = a9;
              v59 = MEMORY[0x212BCF2AC](v211);
              goto LABEL_37;
            }
LABEL_45:
            CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)a9, 1uLL);
            goto LABEL_46;
          }
          if (PixelFormatType != 2033463856 && PixelFormatType != 1714696752)
            goto LABEL_46;
        }
        CVPixelBufferLockBaseAddress((CVPixelBufferRef)a9, 1uLL);
        WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)a9, 0);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)a9, 0);
        if (CVPixelBufferGetBytesPerRowOfPlane((CVPixelBufferRef)a9, 0) == WidthOfPlane)
        {
          BaseAddress = CVPixelBufferGetBaseAddressOfPlane((CVPixelBufferRef)a9, 0);
          v214 = __PAIR64__(HeightOfPlane, WidthOfPlane);
          LODWORD(v215) = 0;
          v212[0] = MEMORY[0x24BDAC760];
          v212[1] = 3221225472;
          v212[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2;
          v212[3] = &__block_descriptor_40_e5_v8__0l;
          v212[4] = a9;
          v59 = MEMORY[0x212BCF2AC](v212);
LABEL_37:
          v60 = (void (**)(_QWORD))v59;
          goto LABEL_71;
        }
        goto LABEL_45;
      }
    }
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    goto LABEL_12;
  }
  if (qword_253E9A288 != -1)
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
  v47 = (void *)v165;
  v48 = qword_253E9A280;
  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210B26000, v48, OS_LOG_TYPE_INFO, "locateWithPixelBuffer: Visual localization is not supported on this device", buf, 2u);
  }
  if (a13 | v165)
  {
    v49 = [VLLocalizationDebugInfo alloc];
    GEOGetMonotonicTime();
    *(_OWORD *)buf = v220;
    *(_OWORD *)&buf[16] = v221;
    *(_QWORD *)&buf[32] = v222;
    v219[0] = v151;
    v219[1] = v152;
    LOBYTE(v147) = 0;
    v51 = -[VLLocalizationDebugInfo initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:](v49, "initWithPixelBuffer:monotonicTimestamp:timestamp:duration:location:clLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:statistics:resultStatus:resultPose:preserveImageData:", 0, buf, v25, v219, 0, 0, v40, v24, v50 - v40, a2, a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a17,
            *(_OWORD *)&a18,
            a19,
            a20,
            v23,
            0,
            v147);
    v52 = (void *)MEMORY[0x24BDD1540];
    v278[0] = *MEMORY[0x24BDBD370];
    v278[1] = CFSTR("VLLocalizerDebugInfo");
    v279[0] = CFSTR("Not supported");
    v279[1] = v51;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v279, v278, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("VLLocalizerError"), 1, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (a13)
      *(_QWORD *)a13 = objc_retainAutorelease(v54);
    if (v165)
    {
      v55 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke;
      block[3] = &unk_24CA9BAC0;
      v218 = (id)v165;
      v217 = v51;
      dispatch_async(v55, block);

    }
    v56 = 0;
    goto LABEL_200;
  }
  v56 = 0;
LABEL_201:

  return v56;
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_3(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_2_35(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __167__VLLocalizer__locateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_calculationBlock_error___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_deterministicLocateWithPixelBuffer:(double)a3 deviceLocation:(__n128)a4 heading:(__n128)a5 gravity:(__n128)a6 transform:(__n128)a7 cameraIntrinsics:(uint64_t)a8 radialDistortion:(uint64_t)a9 exposureTargetOffset:(void *)a10 timestamp:(__int128 *)a11 completionHandler:(void *)a12
{
  id v25;
  id v26;
  qos_class_t v27;
  NSObject *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[4];
  __int128 v38;
  __int128 v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v32 = *a11;
  v31 = a11[1];
  v25 = a10;
  v26 = a12;
  v27 = qos_class_self();
  dispatch_get_global_queue(v27, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __175__VLLocalizer__deterministicLocateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_completionHandler___block_invoke;
  block[3] = &unk_24CA9BC20;
  v47 = a1;
  v48 = v25;
  v51 = a2;
  v52 = a3;
  v38 = v32;
  v39 = v31;
  v40 = a4;
  v41 = a5;
  v42 = a6;
  v43 = a7;
  v44 = a15;
  v45 = a16;
  v46 = a17;
  v53 = a18;
  v54 = a19;
  v55 = a20;
  v49 = v26;
  v50 = a9;
  v29 = v26;
  v30 = v25;
  dispatch_async(v28, block);

}

void __175__VLLocalizer__deterministicLocateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  _OWORD v14[2];
  id v15;

  v2 = *(_QWORD *)(a1 + 200);
  v3 = *(void **)(a1 + 176);
  v4 = *(_QWORD *)(a1 + 184);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 232);
  v9 = *(_QWORD *)(a1 + 240);
  v15 = 0;
  v10 = *(double *)(a1 + 208);
  v11 = *(double *)(a1 + 216);
  v14[0] = v5;
  v14[1] = v6;
  objc_msgSend(v3, "_locateWithPixelBuffer:deviceLocation:heading:gravity:transform:cameraIntrinsics:radialDistortion:exposureTargetOffset:timestamp:calculationBlock:error:", v2, v4, v14, &__block_literal_global_40, &v15, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 96), *(double *)(a1 + 112), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    v7,
    v8,
    v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  (*(void (**)(void))(*(_QWORD *)(a1 + 192) + 16))();

}

uint64_t __175__VLLocalizer__deterministicLocateWithPixelBuffer_deviceLocation_heading_gravity_transform_cameraIntrinsics_radialDistortion_exposureTargetOffset_timestamp_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  __int128 v9;
  _OWORD v11[2];
  uint64_t v12;

  v9 = *(_OWORD *)(a4 + 64);
  v11[0] = *(_OWORD *)(a4 + 48);
  v11[1] = v9;
  v12 = *(_QWORD *)(a4 + 80);
  while (vl_update(a2, (uint64_t)v11))
    ;
  return vl_locate(a2, a3, (__int128 *)a4, a5);
}

- (void)dataProvider:(id)a3 didChangeFormatVersion:(unsigned int)a4
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  vl_t *v8;
  _DWORD v9[254];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (vl_argo_support_data_ver == a4)
  {
    v5 = 0;
    goto LABEL_13;
  }
  if (dword_254A77160 == a4)
  {
    v5 = 1;
    goto LABEL_13;
  }
  if (dword_254A77164 == a4)
  {
    v5 = 2;
    goto LABEL_13;
  }
  if (dword_254A77168 == a4)
  {
    v5 = 3;
    goto LABEL_13;
  }
  if (dword_254A7716C == a4)
  {
    v5 = 4;
    goto LABEL_13;
  }
  if (dword_254A77170 == a4)
  {
    v5 = 5;
LABEL_13:
    v6 = vl_argo_support_algorithm_ver[v5];
    if (qword_253E9A288 == -1)
      goto LABEL_14;
LABEL_18:
    dispatch_once(&qword_253E9A288, &__block_literal_global_201);
    v7 = qword_253E9A280;
    if (!os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    goto LABEL_15;
  }
  v6 = -1;
  if (qword_253E9A288 != -1)
    goto LABEL_18;
LABEL_14:
  v7 = qword_253E9A280;
  if (os_log_type_enabled((os_log_t)qword_253E9A280, OS_LOG_TYPE_INFO))
  {
LABEL_15:
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_210B26000, v7, OS_LOG_TYPE_INFO, "Setting algorithm version: %i", (uint8_t *)v9, 8u);
  }
LABEL_16:
  self->_algorithmVersion = v6;
  v8 = -[VLLocalizer _vlHandle](self, "_vlHandle");
  vl_par_version(v6, (uint64_t)v9);
  memcpy(v8, v9, 0x3F0uLL);
  v8->var1 = v6;
}

- (int)_algorithmVersion
{
  return self->_debug_algorithmVersion;
}

- (BOOL)_debugInfoShouldPreserveImageData
{
  return self->_debugInfoShouldPreserveImageData;
}

- (void)_setDebugInfoShouldPreserveImageData:(BOOL)a3
{
  self->_debugInfoShouldPreserveImageData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAltitudeQuery, 0);
  objc_storeStrong((id *)&self->_pendingAltitudeQueries, 0);
  objc_storeStrong((id *)&self->_altitudeCalculationQueue, 0);
  objc_storeStrong((id *)&self->_recorderQueue, 0);
  objc_storeStrong((id *)&self->_backupDataProvider, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
