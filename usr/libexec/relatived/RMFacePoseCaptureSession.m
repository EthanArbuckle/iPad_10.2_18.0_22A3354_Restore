@implementation RMFacePoseCaptureSession

- (RMFacePoseCaptureSession)init
{
  RMFacePoseCaptureSession *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  double defaultFieldOfView;
  int64_t maxNumberOfCameras;
  _BOOL4 allowBuiltInMetadataCameras;
  _BOOL4 allowBuiltInVideoCameras;
  _BOOL4 allowExternalVideoCameras;
  double networkFailureThresholdMultiplier;
  double trackingFailureFieldOfViewModifier;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *captureQueue;
  NSMutableArray *v20;
  NSMutableArray *captureContext;
  objc_super v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  _QWORD v38[8];
  _QWORD v39[8];

  v23.receiver = self;
  v23.super_class = (Class)RMFacePoseCaptureSession;
  v2 = -[RMFacePoseCaptureSession init](&v23, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.RelativeMotion"));
    v38[0] = CFSTR("TempestFacePoseDefaultFOV");
    v38[1] = CFSTR("TempestFacePoseFrameRate");
    v39[0] = &off_100025EE8;
    v39[1] = &off_100025F18;
    v38[2] = CFSTR("TempestFacePoseMaxNumberOfCameras");
    v38[3] = CFSTR("TempestFacePoseAllowBuiltInMetadataCameras");
    v39[2] = &off_100025F30;
    v39[3] = &__kCFBooleanTrue;
    v38[4] = CFSTR("TempestFacePoseAllowBuiltInVideoCameras");
    v38[5] = CFSTR("TempestFacePoseAllowExternalVideoCameras");
    v39[4] = &__kCFBooleanFalse;
    v39[5] = &__kCFBooleanFalse;
    v38[6] = CFSTR("TempestFacePoseNetworkFailureThresholdMultiplier");
    v38[7] = CFSTR("TempestFacePoseTrackingFailureFieldOfViewModifier");
    v39[6] = &off_100025EF8;
    v39[7] = &off_100025EF8;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 8));
    objc_msgSend(v3, "registerDefaults:", v4);

    objc_msgSend(v3, "doubleForKey:", CFSTR("TempestFacePoseDefaultFOV"));
    v2->_defaultFieldOfView = v5;
    v2->_frameRate = objc_msgSend(v3, "integerForKey:", CFSTR("TempestFacePoseFrameRate"));
    v2->_maxNumberOfCameras = (int64_t)objc_msgSend(v3, "integerForKey:", CFSTR("TempestFacePoseMaxNumberOfCameras"));
    v2->_allowBuiltInMetadataCameras = objc_msgSend(v3, "integerForKey:", CFSTR("TempestFacePoseAllowBuiltInMetadataCameras")) != 0;
    v2->_allowBuiltInVideoCameras = objc_msgSend(v3, "integerForKey:", CFSTR("TempestFacePoseAllowBuiltInVideoCameras")) != 0;
    v2->_allowExternalVideoCameras = objc_msgSend(v3, "integerForKey:", CFSTR("TempestFacePoseAllowExternalVideoCameras")) != 0;
    objc_msgSend(v3, "doubleForKey:", CFSTR("TempestFacePoseNetworkFailureThresholdMultiplier"));
    v2->_networkFailureThresholdMultiplier = v6;
    objc_msgSend(v3, "doubleForKey:", CFSTR("TempestFacePoseTrackingFailureFieldOfViewModifier"));
    v2->_trackingFailureFieldOfViewModifier = v7;
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v8 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      defaultFieldOfView = v2->_defaultFieldOfView;
      maxNumberOfCameras = v2->_maxNumberOfCameras;
      allowBuiltInMetadataCameras = v2->_allowBuiltInMetadataCameras;
      allowBuiltInVideoCameras = v2->_allowBuiltInVideoCameras;
      allowExternalVideoCameras = v2->_allowExternalVideoCameras;
      networkFailureThresholdMultiplier = v2->_networkFailureThresholdMultiplier;
      trackingFailureFieldOfViewModifier = v2->_trackingFailureFieldOfViewModifier;
      *(_DWORD *)buf = 134350592;
      v25 = defaultFieldOfView;
      v26 = 2050;
      v27 = maxNumberOfCameras;
      v28 = 1026;
      v29 = allowBuiltInMetadataCameras;
      v30 = 1026;
      v31 = allowBuiltInVideoCameras;
      v32 = 1026;
      v33 = allowExternalVideoCameras;
      v34 = 2050;
      v35 = networkFailureThresholdMultiplier;
      v36 = 2050;
      v37 = trackingFailureFieldOfViewModifier;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "defaultFieldOfView: %{public}f, maxNumberOfCameras: %{public}ld, allowBuiltInMetadataCameras: %{public}d, allowBuiltInCameras: %{public}d, allowExternalCameras: %{public}d, networkFailureThresholdMultiplier: %{public}f, trackingFailureFieldOfViewModifier: %{public}f", buf, 0x3Cu);
    }

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("RMFacePoseCaptureSessionCaptureQueue", v17);
    captureQueue = v2->_captureQueue;
    v2->_captureQueue = (OS_dispatch_queue *)v18;

    v20 = objc_opt_new(NSMutableArray);
    captureContext = v2->_captureContext;
    v2->_captureContext = v20;

  }
  return v2;
}

- (void)startCaptureSessionWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureQueue](self, "captureQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010374;
  v7[3] = &unk_100024D80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)stopCaptureSession
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureQueue](self, "captureQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000107BC;
  block[3] = &unk_100024900;
  block[4] = self;
  dispatch_sync(v3, block);

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100025050);
  v4 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Stopped capture session", v5, 2u);
  }
}

- (void)setCameraPaused:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureQueue](self, "captureQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010C28;
  v6[3] = &unk_100024F90;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (unint64_t)numberOfCameras
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (BOOL)configureCaptureSession
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  AVMediaType v42;
  _BOOL4 v43;
  AVCaptureVideoDataOutput *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *k;
  void *v49;
  AVCaptureMetadataOutput *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *m;
  void *v57;
  AVCaptureSession *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *n;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  unsigned int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  id v91;
  uint64_t v92;
  CFStringRef v93;
  void *ii;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _BOOL4 v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  void *jj;
  void *v127;
  int v128;
  double v129;
  int v130;
  double v131;
  NSObject *v132;
  id v133;
  unsigned int v134;
  NSObject *v135;
  id v136;
  unsigned int v137;
  NSObject *v138;
  id v139;
  NSObject *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  uint64_t v145;
  void *kk;
  void *v147;
  void *v148;
  NSObject *v149;
  BOOL v150;
  NSObject *v151;
  id v152;
  const char *v153;
  NSObject *v154;
  uint32_t v155;
  id v156;
  void *v157;
  NSObject *v158;
  id v159;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  id obj;
  NSObject *obja;
  void *v167;
  uint64_t v168;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  CMTime v174;
  CMTime v175;
  CMTime v176;
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
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  _QWORD v214[6];
  CMTime v215;
  uint64_t v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  CFStringRef v220;
  _UNKNOWN **v221;
  _BYTE v222[128];
  uint64_t v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  CMTime buf;
  void *v230;
  __int16 v231;
  const char *v232;
  __int16 v233;
  void *v234;
  _BYTE v235[128];
  AVCaptureDeviceType v236;
  AVCaptureDeviceType v237;
  AVCaptureDeviceType v238;
  AVCaptureDeviceType v239;
  uint64_t v240;
  uint64_t v241;

  v215.value = 0;
  *(_QWORD *)&v215.timescale = &v215;
  v215.epoch = 0x2020000000;
  v216 = 0;
  v214[0] = _NSConcreteStackBlock;
  v214[1] = 3221225472;
  v214[2] = sub_100012704;
  v214[3] = &unk_100024FB8;
  v214[4] = self;
  v214[5] = &v215;
  v161 = objc_retainBlock(v214);
  if (-[RMFacePoseCaptureSession allowBuiltInMetadataCameras](self, "allowBuiltInMetadataCameras"))
  {
    v241 = AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v241, 1));
    ((void (*)(_QWORD *, void *, const AVMediaType))v161[2])(v161, v2, AVMediaTypeMetadataObject);

    v240 = AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v240, 1));
    ((void (*)(_QWORD *, void *, const AVMediaType))v161[2])(v161, v3, AVMediaTypeMetadataObject);

  }
  if (-[RMFacePoseCaptureSession allowBuiltInVideoCameras](self, "allowBuiltInVideoCameras"))
  {
    v239 = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v239, 1));
    ((void (*)(_QWORD *, void *, const AVMediaType))v161[2])(v161, v4, AVMediaTypeVideo);

    v238 = AVCaptureDeviceTypeBuiltInUltraWideCamera;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v238, 1));
    ((void (*)(_QWORD *, void *, const AVMediaType))v161[2])(v161, v5, AVMediaTypeVideo);

    v237 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v237, 1));
    ((void (*)(_QWORD *, void *, const AVMediaType))v161[2])(v161, v6, AVMediaTypeVideo);

  }
  if (-[RMFacePoseCaptureSession allowExternalVideoCameras](self, "allowExternalVideoCameras"))
  {
    v236 = AVCaptureDeviceTypeExternal;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v236, 1));
    ((void (*)(_QWORD *, void *, const AVMediaType))v161[2])(v161, v7, AVMediaTypeVideo);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v9 = objc_msgSend(v8, "count") == 0;

  if (v9)
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v27 = (id)qword_10002C4B8;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to find a capture device", (uint8_t *)&buf, 2u);
    }
LABEL_155:

    _Block_object_dispose(&v215, 8);
    return 0;
  }
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100025050);
  v10 = (id)qword_10002C4B8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
    v12 = objc_msgSend(v11, "count");
    LODWORD(buf.value) = 134349056;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Number of face tracking cameras: %{public}lu", (uint8_t *)&buf, 0xCu);

  }
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v210, v235, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v211;
    v164 = v13;
    v163 = *(_QWORD *)v211;
    do
    {
      v16 = 0;
      obj = v14;
      do
      {
        if (*(_QWORD *)v211 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * (_QWORD)v16);
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100025050);
        v18 = (id)qword_10002C4B8;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend(v17, "cameraID");
          v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "captureDevice"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "uniqueID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "captureDevice"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedName"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "captureDevice"));
          if (objc_msgSend(v23, "isContinuityCamera"))
            v24 = " (Continuity Camera)";
          else
            v24 = (const char *)&unk_10001F8D2;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "captureDevice"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "deviceType"));
          LODWORD(buf.value) = 134350082;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v19;
          LOWORD(buf.flags) = 2114;
          *(_QWORD *)((char *)&buf.flags + 2) = v20;
          HIWORD(buf.epoch) = 2114;
          v230 = v22;
          v231 = 2082;
          v232 = v24;
          v233 = 2114;
          v234 = v26;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Found camera: %{public}@ \"%{public}@\"%{public}s, type: %{public}@", (uint8_t *)&buf, 0x34u);

          v13 = v164;
          v15 = v163;
          v14 = obj;

        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v210, v235, 16);
    }
    while (v14);
  }

  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  v27 = objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v206, v228, 16);
  if (!v28)
    goto LABEL_35;
  v29 = *(_QWORD *)v207;
  while (2)
  {
    for (i = 0; i != v28; i = (char *)i + 1)
    {
      if (*(_QWORD *)v207 != v29)
        objc_enumerationMutation(v27);
      v31 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * (_QWORD)i);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "captureDevice"));
      v205 = 0;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDeviceInput deviceInputWithDevice:error:](AVCaptureDeviceInput, "deviceInputWithDevice:error:", v32, &v205));
      v34 = v205;
      objc_msgSend(v31, "setCaptureDeviceInput:", v33);

      if (v34)
      {
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100025050);
        v151 = (id)qword_10002C4B8;
        if (!os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
          goto LABEL_154;
        v152 = objc_msgSend(v31, "cameraID");
        LODWORD(buf.value) = 134349314;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v152;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v34;
        v153 = "[Cam %{public}lu] Capture device error: %{public}@";
        v154 = v151;
        v155 = 22;
        goto LABEL_153;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "captureDeviceInput"));
      v36 = v35 == 0;

      if (v36)
      {
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100025050);
        v151 = (id)qword_10002C4B8;
        if (!os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
          goto LABEL_154;
        v156 = objc_msgSend(v31, "cameraID");
        LODWORD(buf.value) = 134349056;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v156;
        v153 = "[Cam %{public}lu] Failed to create capture input";
        v154 = v151;
        v155 = 12;
LABEL_153:
        _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, v153, (uint8_t *)&buf, v155);
LABEL_154:

        goto LABEL_155;
      }
    }
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v206, v228, 16);
    if (v28)
      continue;
    break;
  }
LABEL_35:

  _Block_object_dispose(&v215, 8);
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v201, v227, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v202;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v202 != v39)
          objc_enumerationMutation(v37);
        v41 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * (_QWORD)j);
        v42 = (AVMediaType)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mediaType"));
        v43 = v42 == AVMediaTypeVideo;

        if (v43)
        {
          v44 = objc_opt_new(AVCaptureVideoDataOutput);
          objc_msgSend(v41, "setVideoDataOutput:", v44);

        }
      }
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v201, v227, 16);
    }
    while (v38);
  }

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v197, v226, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v198;
    do
    {
      for (k = 0; k != v46; k = (char *)k + 1)
      {
        if (*(_QWORD *)v198 != v47)
          objc_enumerationMutation(v45);
        v49 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * (_QWORD)k);
        v50 = objc_opt_new(AVCaptureMetadataOutput);
        objc_msgSend(v49, "setMetadataOutput:", v50);

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "metadataOutput"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureQueue](self, "captureQueue"));
        objc_msgSend(v51, "setMetadataObjectsDelegate:queue:", self, v52);

      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v197, v226, 16);
    }
    while (v46);
  }

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v193, v225, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v194;
    do
    {
      for (m = 0; m != v54; m = (char *)m + 1)
      {
        if (*(_QWORD *)v194 != v55)
          objc_enumerationMutation(v53);
        v57 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * (_QWORD)m);
        v58 = objc_opt_new(AVCaptureSession);
        objc_msgSend(v57, "setCaptureSession:", v58);

        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "captureSession"));
        objc_msgSend(v59, "beginConfiguration");

        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "captureSession"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "captureDeviceInput"));
        objc_msgSend(v60, "addInput:", v61);

        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "metadataOutput"));
        LODWORD(v61) = v62 == 0;

        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "captureSession"));
        if ((_DWORD)v61)
          v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "videoDataOutput"));
        else
          v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "metadataOutput"));
        v65 = (void *)v64;
        objc_msgSend(v63, "addOutput:", v64);

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "captureSession"));
        objc_msgSend(v66, "commitConfiguration");

      }
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v193, v225, 16);
    }
    while (v54);
  }

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v189, v224, 16);
  if (v68)
  {
    v69 = *(_QWORD *)v190;
    v70 = AVMetadataObjectTypeTrackedFaces;
    do
    {
      for (n = 0; n != v68; n = (char *)n + 1)
      {
        if (*(_QWORD *)v190 != v69)
          objc_enumerationMutation(v67);
        v72 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * (_QWORD)n);
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
        v74 = v73 == 0;

        if (!v74)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
          v76 = objc_msgSend(v75, "isFaceTrackingSupported");

          if (v76)
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
            objc_msgSend(v77, "setFaceTrackingMetadataObjectTypesAvailable:", 1);

            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
            objc_msgSend(v78, "setFaceTrackingMaxFaces:", 1);

            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
            objc_msgSend(v79, "setFaceTrackingUsesFaceRecognition:", 0);

            v223 = v70;
            v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v223, 1));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
            objc_msgSend(v81, "setMetadataObjectTypes:", v80);

            -[RMFacePoseCaptureSession networkFailureThresholdMultiplier](self, "networkFailureThresholdMultiplier");
            v83 = v82;
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
            *(float *)&v85 = v83;
            objc_msgSend(v84, "setFaceTrackingNetworkFailureThresholdMultiplier:", v85);

            -[RMFacePoseCaptureSession trackingFailureFieldOfViewModifier](self, "trackingFailureFieldOfViewModifier");
            v87 = v86;
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "metadataOutput"));
            *(float *)&v89 = v87;
            objc_msgSend(v88, "setFaceTrackingFailureFieldOfViewModifier:", v89);

            objc_msgSend(v72, "setSupportsFaceKitMetadata:", 1);
          }
        }
      }
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v189, v224, 16);
    }
    while (v68);
  }

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v185, v222, 16);
  if (v91)
  {
    v92 = *(_QWORD *)v186;
    v93 = kCVPixelBufferPixelFormatTypeKey;
    do
    {
      for (ii = 0; ii != v91; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v186 != v92)
          objc_enumerationMutation(v90);
        v95 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)ii);
        if ((objc_msgSend(v95, "supportsFaceKitMetadata") & 1) == 0)
        {
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "captureSession"));
          objc_msgSend(v96, "beginConfiguration");

          v220 = v93;
          v221 = &off_100025F48;
          v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v221, &v220, 1));
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "videoDataOutput"));
          objc_msgSend(v98, "setVideoSettings:", v97);

          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "videoDataOutput"));
          objc_msgSend(v99, "setAlwaysDiscardsLateVideoFrames:", 1);

          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "videoDataOutput"));
          v101 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureQueue](self, "captureQueue"));
          objc_msgSend(v100, "setSampleBufferDelegate:queue:", self, v101);

          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "captureSession"));
          objc_msgSend(v102, "commitConfiguration");

        }
      }
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v185, v222, 16);
    }
    while (v91);
  }

  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  obja = objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v103 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v181, v219, 16);
  if (v103)
  {
    v168 = *(_QWORD *)v182;
    v162 = 134349568;
    while (2)
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v182 != v168)
          objc_enumerationMutation(obja);
        v105 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * (_QWORD)v104);
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "captureDeviceInput", v162));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "device"));

        if ((objc_msgSend(v107, "lockForConfiguration:", 0) & 1) == 0)
        {
          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_100025050);
          v157 = (void *)qword_10002C4B8;
          if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
          {
            v158 = v157;
            v159 = objc_msgSend(v105, "cameraID");
            LODWORD(buf.value) = 134349056;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v159;
            _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_ERROR, "[Cam %{public}lu] Failed to acquire the lock for device configuration", (uint8_t *)&buf, 0xCu);

          }
          v150 = 0;
          v149 = obja;
          goto LABEL_161;
        }
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "captureSession"));
        objc_msgSend(v108, "beginConfiguration");

        if ((objc_msgSend(v105, "supportsFaceKitMetadata") & 1) != 0
          || (v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "activeFormat")),
              v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "supportedDepthDataFormats")),
              v111 = objc_msgSend(v110, "count") == 0,
              v110,
              v109,
              v111))
        {
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "formats"));
          v114 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession chooseBestFormatForFaceKit:forCameraID:](self, "chooseBestFormatForFaceKit:forCameraID:", v115, objc_msgSend(v105, "cameraID")));

          if (v114)
            objc_msgSend(v107, "setActiveFormat:", v114);
        }
        else
        {
          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "activeFormat"));
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "supportedDepthDataFormats"));
          v114 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession chooseBestFormatForFaceKit:forCameraID:](self, "chooseBestFormatForFaceKit:forCameraID:", v113, objc_msgSend(v105, "cameraID")));

          if (v114)
            objc_msgSend(v107, "setActiveDepthDataFormat:", v114);
        }

        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100025050);
        v116 = (id)qword_10002C4B8;
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          v117 = objc_msgSend(v105, "cameraID");
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "activeFormat"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "description"));
          v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "activeDepthDataFormat"));
          v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "description"));
          LODWORD(buf.value) = 134349570;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v117;
          LOWORD(buf.flags) = 2114;
          *(_QWORD *)((char *)&buf.flags + 2) = v119;
          HIWORD(buf.epoch) = 2114;
          v230 = v121;
          _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] activeFormat: %{public}@, activeDepthDataFormat: %{public}@", (uint8_t *)&buf, 0x20u);

        }
        if (-[RMFacePoseCaptureSession frameRate](self, "frameRate") >= 1)
        {
          v179 = 0u;
          v180 = 0u;
          v177 = 0u;
          v178 = 0u;
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "activeFormat"));
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "videoSupportedFrameRateRanges"));

          v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v177, v218, 16);
          if (v124)
          {
            v125 = *(_QWORD *)v178;
            while (2)
            {
              for (jj = 0; jj != v124; jj = (char *)jj + 1)
              {
                if (*(_QWORD *)v178 != v125)
                  objc_enumerationMutation(v123);
                v127 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * (_QWORD)jj);
                v128 = -[RMFacePoseCaptureSession frameRate](self, "frameRate");
                objc_msgSend(v127, "minFrameRate");
                if (v129 <= (double)v128)
                {
                  v130 = -[RMFacePoseCaptureSession frameRate](self, "frameRate");
                  objc_msgSend(v127, "maxFrameRate");
                  if (v131 >= (double)v130)
                  {

                    if (qword_10002C4B0 != -1)
                      dispatch_once(&qword_10002C4B0, &stru_100025050);
                    v135 = (id)qword_10002C4B8;
                    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                    {
                      v136 = objc_msgSend(v105, "cameraID");
                      v137 = -[RMFacePoseCaptureSession frameRate](self, "frameRate");
                      LODWORD(buf.value) = 134349312;
                      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v136;
                      LOWORD(buf.flags) = 1026;
                      *(CMTimeFlags *)((char *)&buf.flags + 2) = v137;
                      _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Setting frame rate to %{public}d fps", (uint8_t *)&buf, 0x12u);
                    }

                    memset(&buf, 0, sizeof(buf));
                    CMTimeMake(&buf, 1, -[RMFacePoseCaptureSession frameRate](self, "frameRate"));
                    v176 = buf;
                    objc_msgSend(v107, "setActiveVideoMaxFrameDuration:", &v176);
                    v175 = buf;
                    objc_msgSend(v107, "setActiveVideoMinFrameDuration:", &v175);
                    goto LABEL_116;
                  }
                }
              }
              v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v177, v218, 16);
              if (v124)
                continue;
              break;
            }
          }

          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_100025050);
          v132 = (id)qword_10002C4B8;
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
          {
            v133 = objc_msgSend(v105, "cameraID");
            v134 = -[RMFacePoseCaptureSession frameRate](self, "frameRate");
            LODWORD(buf.value) = 134349312;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v133;
            LOWORD(buf.flags) = 1026;
            *(CMTimeFlags *)((char *)&buf.flags + 2) = v134;
            _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Frame rate of %{public}d fps is not supported", (uint8_t *)&buf, 0x12u);
          }

        }
LABEL_116:
        if (objc_msgSend(v107, "isExposureModeSupported:", 3))
        {
          memset(&v215, 0, sizeof(v215));
          CMTimeMake(&v215, 1, 60);
          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_100025050);
          v138 = (id)qword_10002C4B8;
          if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
          {
            v139 = objc_msgSend(v105, "cameraID");
            LODWORD(buf.value) = v162;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v139;
            LOWORD(buf.flags) = 2048;
            *(_QWORD *)((char *)&buf.flags + 2) = v215.value;
            HIWORD(buf.epoch) = 1026;
            LODWORD(v230) = v215.timescale;
            _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Setting max exposure duration to %lld/%{public}d sec", (uint8_t *)&buf, 0x1Cu);
          }

          v174 = v215;
          objc_msgSend(v107, "setActiveMaxExposureDuration:", &v174);
        }
        else
        {
          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_100025050);
          v140 = (id)qword_10002C4B8;
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
          {
            v141 = objc_msgSend(v105, "cameraID");
            LODWORD(buf.value) = 134349056;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v141;
            _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Max exposure duration setting is not supported", (uint8_t *)&buf, 0xCu);
          }

        }
        objc_msgSend(v107, "setGeometricDistortionCorrectionEnabled:", 0);
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "captureSession"));
        objc_msgSend(v142, "commitConfiguration");

        objc_msgSend(v107, "unlockForConfiguration");
        v104 = (char *)v104 + 1;
      }
      while (v104 != v103);
      v103 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v181, v219, 16);
      if (v103)
        continue;
      break;
    }
  }

  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v170, v217, 16);
  if (v144)
  {
    v145 = *(_QWORD *)v171;
    do
    {
      for (kk = 0; kk != v144; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v171 != v145)
          objc_enumerationMutation(v143);
        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)kk), "videoDataOutput"));
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "connectionWithMediaType:", AVMediaTypeVideo));

        objc_msgSend(v148, "setVideoMirrored:", 0);
      }
      v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v170, v217, 16);
    }
    while (v144);
  }

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100025050);
  v149 = (id)qword_10002C4B8;
  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_DEFAULT, "Capture session configuration finished", (uint8_t *)&buf, 2u);
  }
  v150 = 1;
LABEL_161:

  return v150;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  id v17;
  CVImageBufferRef ImageBuffer;
  id v19;
  id v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  CFDictionaryRef v38;
  NSObject *v39;
  id v40;
  int v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  _QWORD *v51;
  CFDictionaryRef v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  CMTimeFlags v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  CFDictionaryRef DictionaryRepresentation;
  void *v62;
  void *v63;
  RMFacePoseCaptureSession *v64;
  CMSampleBufferRef sbufa;
  id v67;
  _QWORD v68[4];
  id v69;
  RMFacePoseCaptureSession *v70;
  CMTime v71;
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  CMTime v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  CMSampleBufferRef v81;
  _QWORD v82[5];
  _QWORD v83[5];
  CMTime time;
  _QWORD v85[6];
  _QWORD v86[6];
  id v87;
  void *v88;
  id v89;
  CMTime buf;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _BYTE v94[128];
  CGRect v95;

  v67 = a3;
  v7 = a5;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v64 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "videoDataOutput"));
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "connectionWithMediaType:", AVMediaTypeVideo));
        v16 = v15 == v7;

        if (v16)
        {
          v17 = v13;

          v10 = v17;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
    }
    while (v9);

    if (v10)
    {
      memset(&v76, 0, sizeof(v76));
      CMSampleBufferGetPresentationTimeStamp(&v76, a4);
      ImageBuffer = CMSampleBufferGetImageBuffer(a4);
      if (!ImageBuffer)
      {
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100025050);
        v43 = (void *)qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
        {
          v44 = v43;
          v45 = objc_msgSend(v10, "cameraID");
          LODWORD(buf.value) = 134349056;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[Cam %{public}lu] Failed to obtain the RGB buffer", (uint8_t *)&buf, 0xCu);

        }
        goto LABEL_41;
      }
      buf.value = 0;
      *(_QWORD *)&buf.timescale = &buf;
      buf.epoch = 0x3032000000;
      v91 = sub_100013318;
      v92 = sub_100013328;
      v93 = 0;
      v19 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCVPixelBuffer:orientation:options:", ImageBuffer, 1, &__NSDictionary0__struct);
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_100013330;
      v75[3] = &unk_100024FE0;
      v75[4] = &buf;
      v20 = objc_msgSend(objc_alloc((Class)VNDetectFaceRectanglesRequest), "initWithCompletionHandler:", v75);
      v89 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
      v74 = 0;
      v22 = objc_msgSend(v19, "performRequests:error:", v21, &v74);
      v23 = v74;

      if (v22 && objc_msgSend(*(id *)(*(_QWORD *)&buf.timescale + 40), "count"))
      {

        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_100013368;
        v73[3] = &unk_100024FE0;
        v73[4] = &buf;
        v20 = objc_msgSend(objc_alloc((Class)VNDetectFacePoseRequest), "initWithCompletionHandler:", v73);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf.timescale + 40), "firstObject"));
        v88 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
        objc_msgSend(v20, "setInputFaceObservations:", v25);

        v87 = v20;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v87, 1));
        v72 = v23;
        LODWORD(v25) = objc_msgSend(v19, "performRequests:error:", v26, &v72);
        v27 = v72;

        if ((_DWORD)v25 && objc_msgSend(*(id *)(*(_QWORD *)&buf.timescale + 40), "count"))
        {

          v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf.timescale + 40), "firstObject"));
          objc_msgSend(v20, "boundingBox");
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v85[0] = kCVAFaceTracking_DetectedFaceFaceID;
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "faceId")));
          v95.origin.y = 1.0 - v35 - v31;
          v86[0] = v62;
          v85[1] = kCVAFaceTracking_DetectedFaceRect;
          v95.origin.x = v29;
          v95.size.width = v33;
          v95.size.height = v35;
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v95);
          v86[1] = DictionaryRepresentation;
          v85[2] = kCVAFaceTracking_DetectedFaceAngleInfoRoll;
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "roll"));
          v86[2] = v60;
          v85[3] = CFSTR("AngleInfoPitch");
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pitch"));
          v86[3] = v36;
          v85[4] = CFSTR("AngleInfoYaw");
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "yaw"));
          v86[4] = v37;
          v85[5] = kCVAFaceTracking_Timestamp;
          time = v76;
          v38 = CMTimeCopyAsDictionary(&time, 0);
          v86[5] = v38;
          sbufa = (CMSampleBufferRef)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 6));

          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_100025050);
          v39 = (id)qword_10002C4B8;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v40 = objc_msgSend(v10, "cameraID");
            LODWORD(time.value) = 134349315;
            *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v40;
            LOWORD(time.flags) = 2113;
            *(_QWORD *)((char *)&time.flags + 2) = sbufa;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "[Cam %{public}ld] Face detected: %{private}@", (uint8_t *)&time, 0x16u);
          }

          v23 = v27;
          v41 = 1;
          goto LABEL_33;
        }
        sbufa = 0;
        v23 = v27;
      }
      else
      {
        sbufa = 0;
      }
      v41 = 0;
LABEL_33:

      _Block_object_dispose(&buf, 8);
      if (v41)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "captureDeviceInput"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "device"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "activeFormat"));

        v48 = -[RMFacePoseCaptureSession computeCameraParametersFromDimensions:](v64, "computeCameraParametersFromDimensions:", CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v63, "formatDescription")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_1000133A0;
        v68[3] = &unk_100025030;
        v50 = v10;
        v69 = v50;
        v70 = v64;
        v71 = v76;
        v51 = objc_retainBlock(v68);
        v82[0] = kCVAFaceTracking_Timestamp;
        buf = v76;
        v52 = CMTimeCopyAsDictionary(&buf, 0);
        v83[0] = v52;
        v82[1] = kCVAFaceTracking_DetectedFacesArray;
        v81 = sbufa;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
        v83[1] = v53;
        v82[2] = kCVAFaceTracking_Color;
        v82[3] = kCVAFaceTracking_CameraColor;
        v83[2] = ImageBuffer;
        v83[3] = v49;
        v82[4] = kCVAFaceTracking_Callback;
        v54 = objc_retainBlock(v51);
        v83[4] = v54;
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 5));

        v56 = CVAFaceTrackingProcess(objc_msgSend(v50, "faceKit"), v55);
        if (v56)
        {
          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_100025050);
          v57 = (void *)qword_10002C4B8;
          if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
          {
            v58 = v57;
            v59 = objc_msgSend(v50, "cameraID");
            LODWORD(buf.value) = 134349312;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v59;
            LOWORD(buf.flags) = 1026;
            *(CMTimeFlags *)((char *)&buf.flags + 2) = v56;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "[Cam %{public}ld] FaceKit failed %{public}d", (uint8_t *)&buf, 0x12u);

          }
        }

      }
LABEL_41:

      goto LABEL_42;
    }
  }
  else
  {

  }
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100025050);
  v42 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Received sample buffer call back for unknown connection", (uint8_t *)&buf, 2u);
  }
LABEL_42:

}

- (id)chooseBestFormatForFaceKit:(id)a3 forCameraID:(unint64_t)a4
{
  id v4;
  __int128 v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  int32_t height;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  _BYTE v33[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    v9 = 1.79769313e308;
    *(_QWORD *)&v5 = 134349570;
    v20 = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10);
        height = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v11, "formatDescription", v20)).height;
        if (objc_msgSend(v11, "isVideoBinned"))
          v13 = 0.0;
        else
          v13 = 1000.0;
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100025050);
        v14 = v13 + fabs(1080.0 / (double)height + -1.0) * 100.0 + 0.0;
        v15 = (void *)qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
        {
          v16 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
          *(_DWORD *)buf = v20;
          v28 = a4;
          v29 = 2114;
          v30 = v17;
          v31 = 2050;
          v32 = v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[Cam %{public}lu] Format candidate: %{public}@, cost: %{public}.0f", buf, 0x20u);

        }
        if (v9 > v14)
        {
          v18 = v11;

          v9 = v14;
          v7 = v18;
        }
        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  void *v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id obj;
  RMFacePoseCaptureSession *v52;
  _QWORD v53[3];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[16];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v46 = a3;
  v47 = a4;
  v8 = a5;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v52 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession captureContext](self, "captureContext"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (!v10)
  {

LABEL_28:
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v44 = v46;
    v45 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Received sample buffer call back for unknown connection", buf, 2u);
    }
    goto LABEL_32;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v60 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metadataOutput", v46));
      v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectionWithMediaType:", AVMediaTypeMetadataObject));

      if (v17 == v8)
      {
        v18 = v15;

        v12 = v18;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  }
  while (v11);

  if (!v12)
    goto LABEL_28;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v47;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v55;
    v22 = AVMetadataObjectTypeTrackedFaces;
    v48 = AVMetadataObjectTypeTrackedFaces;
    v49 = kCVAFaceTracking_TrackedFacesArray;
    do
    {
      v23 = 0;
      v50 = v20;
      do
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "type"));
        v26 = objc_msgSend(v25, "isEqualToString:", v22);

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "payload"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v49));

          if (!v28)
            goto LABEL_26;
          v29 = objc_opt_new(NSMutableDictionary);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "cameraID")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v30, CFSTR("rm_camera_id"));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureDevice"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedName"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v32, CFSTR("rm_camera_device_name"));

          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureDevice"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "modelID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v34, CFSTR("rm_camera_device_model_id"));

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureDevice"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "uniqueID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v36, CFSTR("rm_camera_device_id"));

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isBuiltInCamera")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v37, CFSTR("rm_built_in"));

          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v28, CFSTR("rm_tracked_faces"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoDataOutput"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v38 != 0));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v39, CFSTR("rm_has_video_data_output"));

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "metadataOutput"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v40 != 0));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v41, CFSTR("rm_has_metadata_output"));

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession handler](v52, "handler"));
          if (v42)
          {
            v43 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RMFacePoseCaptureSession handler](v52, "handler"));
            if (v24)
              objc_msgSend(v24, "time");
            else
              memset(v53, 0, sizeof(v53));
            ((void (**)(_QWORD, NSMutableDictionary *, _QWORD *))v43)[2](v43, v29, v53);

          }
          v22 = v48;
          v20 = v50;
        }
        v23 = (char *)v23 + 1;
      }
      while (v20 != v23);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v20);
  }
LABEL_26:

  v44 = v46;
LABEL_32:

}

- (void)startFaceKitForContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  int v17;
  _QWORD v18[7];
  _QWORD v19[7];

  v4 = a3;
  if (!objc_msgSend(v4, "faceKit"))
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v5 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting FaceKit", buf, 2u);
    }
    v18[0] = kCVAFaceTracking_ColorOnly;
    v18[1] = kCVAFaceTracking_UseTongue;
    v19[0] = &__kCFBooleanTrue;
    v19[1] = &__kCFBooleanFalse;
    v18[2] = kCVAFaceTracking_RobustTongue;
    v18[3] = kCVAFaceTracking_NumTrackedFaces;
    v19[2] = &__kCFBooleanFalse;
    v19[3] = &off_100025F30;
    v18[4] = kCVAFaceTracking_NetworkFailureThresholdMultiplier;
    -[RMFacePoseCaptureSession networkFailureThresholdMultiplier](self, "networkFailureThresholdMultiplier");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v19[4] = v6;
    v18[5] = kCVAFaceTracking_TrackingFailureFieldOfViewModifier;
    -[RMFacePoseCaptureSession trackingFailureFieldOfViewModifier](self, "trackingFailureFieldOfViewModifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[6] = kCVAFaceTracking_UseRecognition;
    v19[5] = v7;
    v19[6] = &__kCFBooleanFalse;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 7));

    v13 = 0;
    v9 = CVAFaceTrackingCreate(0, v8, &v13);
    objc_msgSend(v4, "setFaceKit:", v13);
    if (v9)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100025050);
      v10 = (void *)qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = objc_msgSend(v4, "cameraID");
        *(_DWORD *)buf = 134349312;
        v15 = v12;
        v16 = 1026;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[Cam %{public}lu] Failed to create FaceKit instance: error: %{public}d", buf, 0x12u);

      }
      objc_msgSend(v4, "setFaceKit:", 0);
    }

  }
}

- (void)stopFaceKitForContext:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "faceKit"))
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v4 = (void *)qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = 134349056;
      v7 = objc_msgSend(v3, "cameraID");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Cam %{public}lu] Stopping FaceKit", (uint8_t *)&v6, 0xCu);

    }
    CFRelease(objc_msgSend(v3, "faceKit"));
    objc_msgSend(v3, "setFaceKit:", 0);
  }

}

- (id)computeCameraParametersFromDimensions:(id)a3
{
  double var0;
  double var1;
  double v5;
  long double v6;
  long double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];

  var0 = (double)a3.var0;
  var1 = (double)a3.var1;
  -[RMFacePoseCaptureSession defaultFieldOfView](self, "defaultFieldOfView");
  v6 = tan(v5 * 3.14159265 / 180.0 * 0.5);
  v7 = sqrt(var1 * var1 + var0 * var0) / (v6 + v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v7));
  v49[0] = v8;
  v49[1] = &off_100025F08;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", var0 * 0.5 + -0.5));
  v49[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));
  v50[0] = v10;
  v48[0] = &off_100025F08;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v7));
  v48[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", var1 * 0.5 + -0.5));
  v48[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
  v50[1] = v13;
  v50[2] = &off_100025F90;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 3));

  LODWORD(v14) = 844757668;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  v46[0] = v38;
  LODWORD(v15) = -1082130433;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15));
  v46[1] = v37;
  LODWORD(v16) = 0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v46[2] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
  v47[0] = v35;
  LODWORD(v17) = 1065353215;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
  v45[0] = v18;
  LODWORD(v19) = 844757668;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
  v45[1] = v20;
  LODWORD(v21) = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
  v45[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3));
  v47[1] = v23;
  LODWORD(v24) = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24));
  v44[0] = v25;
  LODWORD(v26) = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26));
  v44[1] = v27;
  LODWORD(v28) = 1065353215;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
  v44[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 3));
  v47[2] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));

  v42[0] = kCVAFaceTracking_Rotation;
  v42[1] = kCVAFaceTracking_Translation;
  v43[0] = v31;
  v43[1] = &off_100025FA8;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
  v40[0] = kCVAFaceTracking_Intrinsics;
  v40[1] = kCVAFaceTracking_Extrinsics;
  v41[0] = v39;
  v41[1] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));

  return v33;
}

- (RMFacePoseCaptureSessionDelegate)delegate
{
  return (RMFacePoseCaptureSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isCameraPaused
{
  return self->_cameraPaused;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)defaultFieldOfView
{
  return self->_defaultFieldOfView;
}

- (int)frameRate
{
  return self->_frameRate;
}

- (int64_t)maxNumberOfCameras
{
  return self->_maxNumberOfCameras;
}

- (BOOL)allowBuiltInMetadataCameras
{
  return self->_allowBuiltInMetadataCameras;
}

- (BOOL)allowBuiltInVideoCameras
{
  return self->_allowBuiltInVideoCameras;
}

- (BOOL)allowExternalVideoCameras
{
  return self->_allowExternalVideoCameras;
}

- (double)networkFailureThresholdMultiplier
{
  return self->_networkFailureThresholdMultiplier;
}

- (double)trackingFailureFieldOfViewModifier
{
  return self->_trackingFailureFieldOfViewModifier;
}

- (OS_dispatch_queue)captureQueue
{
  return self->_captureQueue;
}

- (void)setCaptureQueue:(id)a3
{
  objc_storeStrong((id *)&self->_captureQueue, a3);
}

- (NSMutableArray)captureContext
{
  return self->_captureContext;
}

- (void)setCaptureContext:(id)a3
{
  objc_storeStrong((id *)&self->_captureContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureContext, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
