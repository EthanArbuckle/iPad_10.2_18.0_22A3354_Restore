@implementation PTHandGestureDetector

- (VCPHandGestureVideoRequest)vcpHandGestureRequest
{
  return (VCPHandGestureVideoRequest *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PTHandGestureDetector)initWithFrameSize:(CGSize)a3 asyncInitQueue:(id)a4 externalHandDetectionsEnabled:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  NSObject *v9;
  PTHandGestureDetector *v10;
  NSObject *v11;
  const __CFString *v12;
  PTHandGestureDetector *v13;
  void *v14;
  PTHandGestureDetector *v15;
  _QWORD v17[4];
  PTHandGestureDetector *v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PTHandGestureDetector;
  v10 = -[PTHandGestureDetector init](&v21, sel_init);
  if (v10)
  {
    PTKTraceInit();
    v10->_frameSize.width = width;
    v10->_frameSize.height = height;
    v10->_numPendingRequests = 0;
    v10->_useExternalHandDetections = a5;
    _PTLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v10->_useExternalHandDetections)
        v12 = CFSTR("FW (ANST)");
      else
        v12 = CFSTR("MediaAnalysis");
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_1C9281000, v11, OS_LOG_TYPE_DEFAULT, "GestureDetector: Using hand detection from %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __88__PTHandGestureDetector_initWithFrameSize_asyncInitQueue_externalHandDetectionsEnabled___block_invoke;
    v17[3] = &unk_1E822A7E8;
    v19 = width;
    v20 = height;
    v13 = v10;
    v18 = v13;
    v14 = (void *)MEMORY[0x1CAA3AE80](v17);
    dispatch_async(v9, v14);
    v15 = v13;

  }
  return v10;
}

void __88__PTHandGestureDetector_initWithFrameSize_asyncInitQueue_externalHandDetectionsEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  getVCPRequestMaxNumOfPersonsPropertyKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E8252568, v2);

  getVCPRequestUseAsyncPropertyKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v3);

  +[PTInference ANEConfigForAsynchronousWork](PTInference, "ANEConfigForAsynchronousWork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "espressoPlanPriority"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, CFSTR("planPriority"));

  objc_msgSend(v4, "MLANEExecutionPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, CFSTR("MLAneQoS"));

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    getVCPRequestDisableHandDetectionPropertyKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getVCPRequestEnableANSTHandDetectionPropertyKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v8);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)*(double *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getVCPRequestFrameWidthPropertyKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)*(double *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  getVCPRequestFrameHeightPropertyKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v12);

  v13 = *(void **)(a1 + 32);
  v14 = (void *)objc_msgSend(objc_alloc((Class)getVCPHandGestureVideoRequestClass()), "initWithOptions:", v15);
  objc_msgSend(v13, "setVcpHandGestureRequest:", v14);

  kdebug_trace();
}

- (CGSize)frameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frameSize.width;
  height = self->_frameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)detectGesturesFromBuffer:(__CVBuffer *)a3 timeStamp:(id *)a4 withRotationDegrees:(int)a5 withDetectedHands:(id)a6 withDetectedFaces:(id)a7 asyncWork:(id)a8
{
  uint64_t v10;
  void *v12;
  PTHandGestureDetector *v13;
  os_unfair_lock_s *p_numPendingRequestsLock;
  int numPendingRequests;
  BOOL v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  os_unfair_lock_s *lock;
  BOOL v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  PTHandGestureDetector *val;
  void *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77[2];
  __int128 v78;
  int64_t v79;
  id location;
  _QWORD v81[5];
  __int128 v82;
  int64_t var3;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  NSRect v98;
  CGRect v99;

  v10 = *(_QWORD *)&a5;
  v94 = *MEMORY[0x1E0C80C00];
  v70 = a6;
  v71 = a7;
  v68 = a8;
  val = self;
  -[PTHandGestureDetector vcpHandGestureRequest](self, "vcpHandGestureRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self;
  p_numPendingRequestsLock = &self->_numPendingRequestsLock;
  os_unfair_lock_lock(p_numPendingRequestsLock);
  numPendingRequests = v13->_numPendingRequests;
  os_unfair_lock_unlock(p_numPendingRequestsLock);
  if (v12)
    v16 = numPendingRequests < 1;
  else
    v16 = 0;
  v17 = v16;
  v67 = v17;
  if (v17 != 1)
    goto LABEL_42;
  lock = p_numPendingRequestsLock;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  getVCPRequestRotationInDegreesPropertyKey();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v18, v19);

  if (!v70 || !val->_useExternalHandDetections)
    goto LABEL_32;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v20 = v70;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (!v21)
    goto LABEL_29;
  v22 = *(_QWORD *)v89;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v89 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
      v25 = objc_alloc_init((Class)getVCPHandObjectClass());
      v26 = v24;
      v27 = v25;
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Rect"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
        goto LABEL_26;
      objc_msgSend(v27, "setBounds:", CGRectFromRectDictionary(v28));
      objc_msgSend(v27, "bounds");
      v99.origin.x = 0.0;
      v99.origin.y = 0.0;
      v99.size.width = 1.0;
      v99.size.height = 1.0;
      v96 = CGRectIntersection(v95, v99);
      objc_msgSend(v27, "setBounds:", v96.origin.x, v96.origin.y, v96.size.width, v96.size.height);
      objc_msgSend(v27, "bounds");
      if (CGRectIsNull(v97))
        goto LABEL_26;
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Chirality"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_25;
      if (objc_msgSend(v30, "intValue"))
        v31 = 0xFFFFFFFFLL;
      else
        v31 = 1;
      objc_msgSend(v27, "setChirality:", v31);
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_26;
      objc_msgSend(v27, "setHandID:", objc_msgSend(v29, "intValue"));
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("GroupID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v27, "setGroupID:", objc_msgSend(v32, "intValue"));
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ConfidenceLevel"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          *(float *)&v33 = (float)(int)objc_msgSend(v29, "intValue") / 1000.0;
          objc_msgSend(v27, "setConfidence:", v33);

          objc_msgSend(v73, "addObject:", v27);
          goto LABEL_27;
        }
      }
      else
      {
LABEL_25:
        v29 = 0;
      }
LABEL_26:

LABEL_27:
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  }
  while (v21);
LABEL_29:

  if (objc_msgSend(v73, "count"))
  {
    getVCPRequestHandObjectsPropertyKey();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v73, v34);

  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v37 = v71;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v85 != v39)
          objc_enumerationMutation(v37);
        v41 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("Rect"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = CGRectFromRectDictionary(v42);
        v45 = v44;
        v47 = v46;
        v49 = v48;

        v98.origin.x = v43;
        v98.origin.y = v45;
        v98.size.width = v47;
        v98.size.height = v49;
        NSStringFromRect(v98);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v50);

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("AngleInfoYaw"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "doubleValue");
        v53 = v52 * 3.14159265 / 180.0;
        if (v53 > 3.14159265)
          v53 = v53 + -6.28318531;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(fmax(v53, -1.57079633), 1.57079633));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v54);

      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    }
    while (v38);
  }

  getVCPRequestFaceRectsPropertyKey();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v35, v55);

  getVCPRequestFaceYawsPropertyKey();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v36, v56);

  v57 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke;
  v81[3] = &unk_1E822A810;
  v81[4] = val;
  v82 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v58 = (void *)MEMORY[0x1CAA3AE80](v81);
  CVPixelBufferRetain(a3);
  objc_initWeak(&location, val);
  v74[0] = v57;
  v74[1] = 3221225472;
  v74[2] = __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_105;
  v74[3] = &unk_1E822A838;
  objc_copyWeak(v77, &location);
  v77[1] = a3;
  v78 = *(_OWORD *)&a4->var0;
  v79 = a4->var3;
  v59 = v69;
  v75 = v59;
  v60 = v58;
  v76 = v60;
  v61 = (void *)MEMORY[0x1CAA3AE80](v74);
  os_unfair_lock_lock(lock);
  ++val->_numPendingRequests;
  os_unfair_lock_unlock(lock);
  v62 = (void *)MEMORY[0x1CAA3AE80](v61);
  objc_msgSend(v68, "addObject:", v62);

  objc_destroyWeak(v77);
  objc_destroyWeak(&location);

LABEL_42:
  return v67;
}

void __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE buf[24];
  int v43;
  __int16 v44;
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 28);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  if (v6)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_cold_1(v6, v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      v12 = &off_1E8229000;
      v32 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(obj);
          v14 = (void *)objc_msgSend(objc_alloc((Class)v12[173]), "initWithVCPHandObservation:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          objc_msgSend(v8, "addObject:", v14);

          _PTLogSystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v12[173];
            objc_msgSend(v8, "lastObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "gestureTypeToString:", objc_msgSend(v37, "type"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "lastObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "confidence");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "floatValue");
            v18 = v17;
            objc_msgSend(v8, "lastObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "intValue");
            objc_msgSend(v8, "lastObject");
            v22 = v8;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "personID");
            v24 = v10;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "intValue");
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 1024;
            v43 = v21;
            v44 = 1024;
            v45 = v26;
            _os_log_impl(&dword_1C9281000, v15, OS_LOG_TYPE_DEFAULT, "GestureDetector: Recieved gesture (type: %@) (confidence: %.2f) (HandID: %i) (PersonID: %i)", buf, 0x22u);

            v10 = v24;
            v8 = v22;

            v12 = &off_1E8229000;
            v11 = v32;

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v10);
    }

    v6 = 0;
    v5 = v31;
    a1 = v30;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    *(_OWORD *)buf = *(_OWORD *)(a1 + 40);
    *(_QWORD *)&buf[16] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v27, "gesturesAvailable:forTimeStamp:", v8, buf);
  }
  else
  {
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9281000, v29, OS_LOG_TYPE_INFO, "PTHandGestureDelegate not available to update with new gestures", buf, 2u);
    }

  }
  objc_msgSend(v6, "code");
  objc_msgSend(v8, "count");
  kdebug_trace();

}

void __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_105(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
    CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
    CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 56));
    kdebug_trace();
    v3 = (void *)WeakRetained[6];
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v3, "processBuffer:timestamp:withOptions:completion:", v4, &v7, v5, v6);
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));

}

- (PTHandGestureDelegate)delegate
{
  return (PTHandGestureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setVcpHandGestureRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcpHandGestureRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __126__PTHandGestureDetector_detectGesturesFromBuffer_timeStamp_withRotationDegrees_withDetectedHands_withDetectedFaces_asyncWork___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Error processing gesture request in MediaAnalysis: %@", (uint8_t *)&v4, 0xCu);

}

@end
