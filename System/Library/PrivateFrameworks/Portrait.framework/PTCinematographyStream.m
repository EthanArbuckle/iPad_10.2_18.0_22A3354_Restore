@implementation PTCinematographyStream

- (PTCinematographyStream)init
{
  return -[PTCinematographyStream initWithOptions:](self, "initWithOptions:", 0);
}

- (PTCinematographyStream)initWithOptions:(id)a3
{
  id v4;
  PTCinematographyStream *v5;
  uint64_t v6;
  PTCinematographyStreamOptions *options;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  PTCinematographyStream *v17;
  NSObject *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTCinematographyStream;
  v5 = -[PTCinematographyStream init](&v20, sel_init);
  if (!v5)
  {
LABEL_15:
    v17 = v5;
    goto LABEL_19;
  }
  if (v4)
    v6 = objc_msgSend(v4, "copy");
  else
    v6 = objc_opt_new();
  options = v5->_options;
  v5->_options = (PTCinematographyStreamOptions *)v6;

  v8 = -[PTCinematographyStreamOptions version](v5->_options, "version");
  if (!v8)
    v8 = objc_msgSend((id)objc_opt_class(), "latestVersion");
  v5->_activeVersion = v8;
  if ((objc_msgSend((id)objc_opt_class(), "isSupportedVersion:", v5->_activeVersion) & 1) != 0)
  {
    PTDefaultsGetDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CinematographySnapshotEveryFrame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[PTCinematographyStreamOptions _setSnapshotPolicy:](v5->_options, "_setSnapshotPolicy:", 1);
    objc_msgSend(v4, "cinematographyParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("detectionModel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_detectionModel = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "cinematographyParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("focusBlurMapMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_focusBlurMapMode = objc_msgSend(v14, "unsignedIntegerValue");

    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyStream initWithOptions:].cold.2(&v5->_detectionModel);

    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyStream initWithOptions:].cold.1(&v5->_focusBlurMapMode);

    -[PTCinematographyStream _reset](v5, "_reset");
    *(_WORD *)&v5->_autoFocusUseBlurMap = 256;
    v5->_autoFocusInFocusRegionSelect = 0;
    goto LABEL_15;
  }
  _PTLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[PTCinematographyStream initWithOptions:].cold.3(&v5->_activeVersion);

  v17 = 0;
LABEL_19:

  return v17;
}

- (void)_updateDetectionModelFromMetadata:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CinematographyParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detectionModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v6)
  {
    v7 = v6;
    if (self->_detectionModel != v6)
    {
      _PTLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_detectionModel);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1C9281000, v8, OS_LOG_TYPE_DEFAULT, "change from detection model %@ to %@", (uint8_t *)&v11, 0x16u);

      }
      self->_detectionModel = v7;
      -[PTCinematographyStream _reset](self, "_reset");
    }
  }

}

- (void)_updateFocusBlurMapModeFromMetadata:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CinematographyParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focusBlurMapMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v6)
  {
    v7 = v6;
    if (self->_focusBlurMapMode != v6)
    {
      _PTLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_focusBlurMapMode);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1C9281000, v8, OS_LOG_TYPE_DEFAULT, "change from focus blur map mode %@ to %@", (uint8_t *)&v11, 0x16u);

      }
      self->_focusBlurMapMode = v7;
    }
  }

}

- (id)processColorBuffer:(__CVBuffer *)a3 disparityBuffer:(__CVBuffer *)a4 metadataDictionary:(id)a5 presentationTime:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  NSObject *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;

  v9 = a5;
  -[PTCinematographyStream _updateDetectionModelFromMetadata:](self, "_updateDetectionModelFromMetadata:", v9);
  -[PTCinematographyStream _updateFocusBlurMapModeFromMetadata:](self, "_updateFocusBlurMapModeFromMetadata:", v9);
  v20 = *a6;
  -[PTCinematographyStream _frameDetectionsFromMetadata:time:disparityBuffer:](self, "_frameDetectionsFromMetadata:time:disparityBuffer:", v9, &v20, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyStream _userTapFromMetadata:frameDetections:disparityBuffer:](self, "_userTapFromMetadata:frameDetections:disparityBuffer:", v9, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PTCinematographyStream setActiveUserTap:](self, "setActiveUserTap:", v11);
    -[PTCinematographyStream _logUserTap:](self, "_logUserTap:", v11);
  }
  -[PTCinematographyStream userAperture](self, "userAperture");
  v13 = v12;
  -[PTCinematographyStream options](self, "options");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_snapshotPolicy");
  LODWORD(v16) = v13;
  -[PTCinematographyStream _frameFromDetections:userAperture:snapshotPolicy:disparityPixelBuffer:](self, "_frameFromDetections:userAperture:snapshotPolicy:disparityPixelBuffer:", v10, v15, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTCinematographyStream _logFocusChangeForFrame:](self, "_logFocusChangeForFrame:", v17);
  objc_msgSend(v17, "focusDistance");
  if (-[PTCinematographyStream _logUnusualDisparity:kind:info:](self, "_logUnusualDisparity:kind:info:", CFSTR("frame"), CFSTR("stream detection")))
  {
    _PTLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyStream processColorBuffer:disparityBuffer:metadataDictionary:presentationTime:].cold.1();

  }
  -[PTCinematographyStream setPreviousFrame:](self, "setPreviousFrame:", v17);

  return v17;
}

- (void)endOfStream
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9281000, v3, OS_LOG_TYPE_INFO, "end of cinematography stream", v5, 2u);
  }

  PTDefaultsFlush(v4);
  -[PTCinematographyStream _reset](self, "_reset");
}

- (void)adviseDidStartRecording
{
  -[PTCinematographyStream setPreviousRecordingState:](self, "setPreviousRecordingState:", 1);
}

- (void)adviseDidStopRecording
{
  -[PTCinematographyStream setPreviousRecordingState:](self, "setPreviousRecordingState:", 0);
}

+ (unint64_t)latestVersion
{
  return 1;
}

+ (BOOL)isSupportedVersion:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "latestVersion") >= a3;
}

- (NSString)modelVersionString
{
  void *v2;
  void *v3;

  -[PTCinematographyStream network](self, "network");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "versionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)getGlobalMetadata:(id)a3
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  PTCinematographyFocusFramesOptions *v8;
  BOOL v9;
  NSObject *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setFocusPullerAlpha:", v5);
    LODWORD(v6) = 0;
    objc_msgSend(v4, "setFocusPullerMaxV:", v6);
    LODWORD(v7) = 0;
    objc_msgSend(v4, "setFocusPullerResistance:", v7);
    v8 = objc_alloc_init(PTCinematographyFocusFramesOptions);
    v9 = -[PTCinematographyFocusFramesOptions writeToGlobalMetadata:](v8, "writeToGlobalMetadata:", v4);

  }
  else
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTCinematographyStream getGlobalMetadata:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (id)_frameFromDetections:(id)a3 userAperture:(float)a4 snapshotPolicy:(unint64_t)a5 disparityPixelBuffer:(__CVBuffer *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  const char *v21;
  id v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PTCinematographyFocusPuller *previewFocusPuller;
  unsigned int v33;
  unsigned int v34;
  PTCinematographyFrame *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v58;
  void *v59;
  __int128 v60;
  uint64_t v61;
  _QWORD v62[3];
  uint8_t buf[16];
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  v65 = 0uLL;
  v66 = 0;
  if (v10)
    objc_msgSend(v10, "presentationTime");
  -[PTCinematographyStream _nextSnapshotForPolicy:](self, "_nextSnapshotForPolicy:", a5);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyStream _chooseFocusDetection:](self, "_chooseFocusDetection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "detection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isFixedFocusDetection"))
    {

    }
    else
    {
      -[PTCinematographyStream activeUserTap](self, "activeUserTap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PTCinematographyStream _isUserTap:inFrameDetections:](self, "_isUserTap:inFrameDetections:", v16, v11);

      if (!v17)
      {
        _PTLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "user focus: no longer detected";
          goto LABEL_15;
        }
LABEL_16:
        v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isStrong") & 1) != 0)
    {

      goto LABEL_23;
    }
    *(_OWORD *)buf = v65;
    v64 = v66;
    v19 = -[PTCinematographyStream _userTapLockEndsAtTime:](self, "_userTapLockEndsAtTime:", buf);

    if (v19)
    {
      if (-[PTCinematographyStream _userTapEndsForBaseFocusDetection:](self, "_userTapEndsForBaseFocusDetection:", v12))
      {
        _PTLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "user focus: base focus changed after user focus lock expired";
LABEL_15:
          _os_log_impl(&dword_1C9281000, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (-[PTCinematographyStream _userTapEndsForChangedFocusWithDisparityBuffer:](self, "_userTapEndsForChangedFocusWithDisparityBuffer:", a6))
      {
        _PTLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        v13 = 1;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9281000, v20, OS_LOG_TYPE_INFO, "user focus: fixed focus depth changed after lock expired", buf, 2u);
        }
        goto LABEL_17;
      }
    }
LABEL_23:
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "detection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isFixedFocusDetection");

    if (v27)
    {
      -[PTCinematographyStream activeUserTap](self, "activeUserTap");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "detection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v29, "copy");

      if (v11)
        objc_msgSend(v11, "presentationTime");
      else
        memset(v62, 0, sizeof(v62));
      objc_msgSend(v30, "_detectionByChangingTime:", v62);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addDetection:", v31);
    }
    v22 = -[PTCinematographyStream _copyUserFocusDetectionFromDetections:](self, "_copyUserFocusDetectionFromDetections:", v11);
    v13 = 0;
    if (!v22)
      goto LABEL_29;
LABEL_19:
    objc_msgSend(v22, "focusDistance");
    v24 = v23;
    goto LABEL_30;
  }
LABEL_18:
  v22 = v12;
  -[PTCinematographyStream setActiveUserTap:](self, "setActiveUserTap:", 0);
  if (v22)
    goto LABEL_19;
LABEL_29:
  v24 = 0;
LABEL_30:
  previewFocusPuller = self->_previewFocusPuller;
  v33 = v24;
  if (previewFocusPuller)
  {
    *(_OWORD *)buf = v65;
    v64 = v66;
    -[PTCinematographyFocusPuller pullTowardFocusDistance:time:missing:](previewFocusPuller, "pullTowardFocusDistance:time:missing:", buf, v22 == 0, COERCE_DOUBLE(__PAIR64__(DWORD1(v65), v24)));
    v33 = v34;
  }
  v35 = objc_alloc_init(PTCinematographyFrame);
  v60 = v65;
  v61 = v66;
  -[PTCinematographyFrame setTime:](v35, "setTime:", &v60);
  objc_msgSend(v11, "detections");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copy");
  -[PTCinematographyFrame setAllDetections:](v35, "setAllDetections:", v37);

  -[PTCinematographyFrame setFocusDetection:](v35, "setFocusDetection:", v22);
  *(float *)&v38 = a4;
  -[PTCinematographyFrame setAperture:](v35, "setAperture:", v38);
  LODWORD(v39) = v33;
  -[PTCinematographyFrame setFocusDistance:](v35, "setFocusDistance:", v39);
  LODWORD(v40) = v24;
  -[PTCinematographyFrame setRawFocusDistance:](v35, "setRawFocusDistance:", v40);
  objc_msgSend(v22, "trackNumber");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrame setFocusTrackNumber:](v35, "setFocusTrackNumber:", v41);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "trackIdentifier", v12));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setBaseFocusTrackNumber:](v35, "setBaseFocusTrackNumber:", v42);

  }
  else
  {
    -[PTCinematographyFrame setBaseFocusTrackNumber:](v35, "setBaseFocusTrackNumber:", 0, 0);
  }
  v43 = a5;
  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "trackIdentifier"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setUserFocusTrackNumber:](v35, "setUserFocusTrackNumber:", v47);

  }
  else
  {
    -[PTCinematographyFrame setUserFocusTrackNumber:](v35, "setUserFocusTrackNumber:", 0);
  }

  objc_msgSend(v11, "detectorDidRun");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrame _setDetectorDidRun:](v35, "_setDetectorDidRun:", v48);

  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrame setUserFocusStrong:](v35, "setUserFocusStrong:", objc_msgSend(v49, "isStrong"));

  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrame setUserFocusGroup:](v35, "setUserFocusGroup:", objc_msgSend(v50, "isGroupTap"));

  -[PTCinematographyFrame setUserFocusEnd:](v35, "setUserFocusEnd:", v13);
  v51 = (void *)MEMORY[0x1E0CB37E8];
  v52 = -[PTCinematographyStream frameIndex](self, "frameIndex");
  -[PTCinematographyStream setFrameIndex:](self, "setFrameIndex:", v52 + 1);
  objc_msgSend(v51, "numberWithUnsignedInteger:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrame _setFrameNumber:](v35, "_setFrameNumber:", v53);

  -[PTCinematographyFrame _setSnapshot:](v35, "_setSnapshot:", v59);
  -[PTCinematographyFrame _setSnapshotPolicy:](v35, "_setSnapshotPolicy:", v43);
  _PTLogSystem();
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);

  if (v55)
  {
    v67[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyFrame _debugLogFrames:label:](PTCinematographyFrame, "_debugLogFrames:label:", v56, CFSTR("Raw Cinematography"));

  }
  return v35;
}

- (id)_copyUserFocusDetectionFromDetections:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGroupTap");

  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "groupIdentifier");

    objc_msgSend(v4, "bestDetectionForGroupIdentifier:options:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PTCinematographyStream _copyUserFocusDetectionFromDetections:].cold.1();
LABEL_8:

      v10 = 0;
    }
  }
  else
  {
    v12 = objc_msgSend(v7, "trackIdentifier");

    objc_msgSend(v4, "detectionForTrackIdentifier:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      _PTLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PTCinematographyStream _copyUserFocusDetectionFromDetections:].cold.2();
      goto LABEL_8;
    }
  }
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

- (id)_copyInternalState
{
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
  void *v15;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyStream activeVersion](self, "activeVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_version"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyStream userAperture](self, "userAperture");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("user_aperture"));

  -[PTCinematographyStream previewFocusPuller](self, "previewFocusPuller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_asCinematographyDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("focus_puller"));

  -[PTCinematographyStream network](self, "network");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_asCinematographyDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("_network_state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyStream frameIndex](self, "frameIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("_frame_index"));

  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_asCinematographyDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "removeObjectForKey:", CFSTR("_snapshot"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("_previous_frame_serialized"));
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (void)_restoreInternalState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("_version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if ((objc_msgSend((id)objc_opt_class(), "isSupportedVersion:", v7) & 1) != 0)
    {
      self->_activeVersion = v7;
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("user_aperture"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      -[PTCinematographyStream setUserAperture:](self, "setUserAperture:");

      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("_frame_index"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTCinematographyStream setFrameIndex:](self, "setFrameIndex:", objc_msgSend(v9, "unsignedIntegerValue"));

      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("_previous_frame_serialized"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = -[PTCinematographyFrame _initWithCinematographyDictionary:]([PTCinematographyFrame alloc], "_initWithCinematographyDictionary:", v10);
        -[PTCinematographyStream setPreviousFrame:](self, "setPreviousFrame:", v11);

      }
      else
      {
        -[PTCinematographyStream setPreviousFrame:](self, "setPreviousFrame:", 0);
      }
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("focus_puller"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[PTCinematographyFocusPuller _initWithCinematographyDictionary:]([PTCinematographyFocusPuller alloc], "_initWithCinematographyDictionary:", v12);
        -[PTCinematographyStream setPreviewFocusPuller:](self, "setPreviewFocusPuller:", v13);

      }
      else
      {
        -[PTCinematographyStream setPreviewFocusPuller:](self, "setPreviewFocusPuller:", 0);
      }
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("_network_state"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = -[PTCinematographyNetwork _initWithCinematographyDictionary:]([PTCinematographyNetwork alloc], "_initWithCinematographyDictionary:", v14);
        if (v15)
        {
          objc_storeStrong((id *)&self->_network, v15);
          _PTLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            -[NSObject versionString](v15, "versionString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 138412290;
            v19 = v17;
            _os_log_impl(&dword_1C9281000, v16, OS_LOG_TYPE_INFO, "Cinematography network version %@ (restored)", (uint8_t *)&v18, 0xCu);

          }
        }
        else
        {
          _PTLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[PTCinematographyStream _restoreInternalState:].cold.2();
        }

      }
      else
      {
        _PTLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[PTCinematographyStream _restoreInternalState:].cold.1();
      }

    }
    else
    {
      _PTLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PTCinematographyStream _restoreInternalState:].cold.3();
    }

  }
  else
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTCinematographyStream _restoreInternalState:].cold.4();
  }

}

- (id)_nextSnapshotForPolicy:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[PTCinematographyStream previousRecordingState](self, "previousRecordingState");
  if (v5 == 2)
  {
    if ((a3 | 2) != 2)
      return -[PTCinematographyStream _copyInternalState](self, "_copyInternalState");
    return 0;
  }
  if (v5 != 1)
  {
    if (a3 != 2)
      return -[PTCinematographyStream _copyInternalState](self, "_copyInternalState");
    return 0;
  }
  if (a3 == 2)
    return 0;
  -[PTCinematographyStream setPreviousRecordingState:](self, "setPreviousRecordingState:", 2);
  return -[PTCinematographyStream _copyInternalState](self, "_copyInternalState");
}

- (float)_defaultAperture
{
  if (_defaultAperture_onceToken != -1)
    dispatch_once(&_defaultAperture_onceToken, &__block_literal_global_0);
  return *(float *)&_defaultAperture_sDefaultAperture;
}

void __42__PTCinematographyStream__defaultAperture__block_invoke()
{
  NSObject *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  _defaultAperture_sDefaultAperture = 1082130432;
  _PTLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 134217984;
    v2 = 0x4010000000000000;
    _os_log_impl(&dword_1C9281000, v0, OS_LOG_TYPE_DEFAULT, "CinematographyAperture: %g", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_reset
{
  float v3;
  PTCinematographyTrackAllocator *v4;
  PTCinematographyTrackAllocator *trackAllocator;
  PTCinematographyFocusPuller *v6;
  PTCinematographyFocusPuller *previewFocusPuller;
  void *v8;
  PTCinematographyNetwork *v9;
  PTCinematographyNetwork *network;
  PTCinematographyFrame *previousFrame;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PTCinematographyStream _defaultAperture](self, "_defaultAperture");
  self->_userAperture = v3;
  v4 = -[PTCinematographyTrackAllocator initWithTrackIdentifier:]([PTCinematographyTrackAllocator alloc], "initWithTrackIdentifier:", 0x1100000000);
  trackAllocator = self->_trackAllocator;
  self->_trackAllocator = v4;

  v6 = objc_alloc_init(PTCinematographyFocusPuller);
  previewFocusPuller = self->_previewFocusPuller;
  self->_previewFocusPuller = v6;

  -[PTCinematographyStream _userDefaultNetworkVersion](self, "_userDefaultNetworkVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[PTCinematographyNetwork defaultVersionStringForDetectionModel:](PTCinematographyNetwork, "defaultVersionStringForDetectionModel:", self->_detectionModel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[PTCinematographyNetwork initWithVersionString:]([PTCinematographyNetwork alloc], "initWithVersionString:", v8);
  network = self->_network;
  self->_network = v9;

  self->_frameIndex = 0;
  previousFrame = self->_previousFrame;
  self->_previousFrame = 0;

  -[PTCinematographyStream setPreviousRecordingState:](self, "setPreviousRecordingState:", 0);
  _PTLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[PTCinematographyStream network](self, "network");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "versionString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v14;
    _os_log_impl(&dword_1C9281000, v12, OS_LOG_TYPE_INFO, "Cinematography network version %@", (uint8_t *)&v17, 0xCu);

  }
  _PTLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[PTCinematographyFocusPuller _asCinematographyDictionary](self->_previewFocusPuller, "_asCinematographyDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_1C9281000, v15, OS_LOG_TYPE_INFO, "focus puller: %@", (uint8_t *)&v17, 0xCu);

  }
}

- (id)_chooseClosestObjectDetection:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  void *v10;
  float v11;
  float v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "focusDistance");
        if (v8 < v11)
        {
          v12 = v11;
          v13 = v10;

          v8 = v12;
          v6 = v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_chooseLargestAreaDetection:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  float Area;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "rect");
        Area = CGRectGetArea(v11, v12, v13, v14);
        if (v8 < Area)
        {
          v16 = v10;

          v8 = Area;
          v6 = v16;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_detectionForFixedFocusDistance:(float)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  PTCinematographyDetection *v10;
  double v11;
  PTCinematographyDetection *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = [PTCinematographyDetection alloc];
  v15 = *MEMORY[0x1E0CA2E10];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  *(float *)&v11 = a3;
  v12 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v10, "initWithTime:rect:focusDistance:", &v15, x, y, width, height, v11);
  -[PTCinematographyDetection setDetectionType:](v12, "setDetectionType:", 101);
  -[PTCinematographyStream trackAllocator](self, "trackAllocator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyDetection setTrackIdentifier:](v12, "setTrackIdentifier:", objc_msgSend(v13, "nextTrackIdentifier"));

  return v12;
}

- (float)_floatValueForAssignmentString:(id)a3
{
  void *v3;
  float v4;
  void *v5;
  float v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("="));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v4 = v6;

  }
  return v4;
}

- (id)_stringValueForAssignmentString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("="));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_getFocusStrategyIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  PTCinematographyStream *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[PTCinematographyStream didReadFocusStrategyDefault](self, "didReadFocusStrategyDefault"))
  {
    -[PTCinematographyStream setDidReadFocusStrategyDefault:](self, "setDidReadFocusStrategyDefault:", 1);
    PTDefaultsGetDictionary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CinematographyFocus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _PTLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1C9281000, v5, OS_LOG_TYPE_INFO, "defaults: CinematographyFocus %@", (uint8_t *)&v9, 0xCu);
      }

      if (objc_msgSend(v4, "hasPrefix:", CFSTR("network")))
      {
        -[PTCinematographyStream setInternalDefaultFocusStrategy:](self, "setInternalDefaultFocusStrategy:", 0);
        -[PTCinematographyStream _stringValueForAssignmentString:](self, "_stringValueForAssignmentString:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTCinematographyStream setInternalDefaultNetworkVersion:](self, "setInternalDefaultNetworkVersion:", v6);

      }
      else
      {
        if (!objc_msgSend(v4, "hasPrefix:", CFSTR("fixed")))
        {
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("closest")))
          {
            v7 = self;
            v8 = 2;
          }
          else
          {
            if (!objc_msgSend(v4, "isEqualToString:", CFSTR("largest")))
              goto LABEL_14;
            v7 = self;
            v8 = 3;
          }
          -[PTCinematographyStream setInternalDefaultFocusStrategy:](v7, "setInternalDefaultFocusStrategy:", v8);
          goto LABEL_14;
        }
        -[PTCinematographyStream setInternalDefaultFocusStrategy:](self, "setInternalDefaultFocusStrategy:", 1);
        -[PTCinematographyStream _floatValueForAssignmentString:](self, "_floatValueForAssignmentString:", v4);
        -[PTCinematographyStream setInternalDefaultFixedFocusDisparity:](self, "setInternalDefaultFixedFocusDisparity:");
      }
    }
LABEL_14:

  }
}

- (unint64_t)_userDefaultFocusStrategy
{
  -[PTCinematographyStream _getFocusStrategyIfNeeded](self, "_getFocusStrategyIfNeeded");
  return -[PTCinematographyStream internalDefaultFocusStrategy](self, "internalDefaultFocusStrategy");
}

- (id)_userDefaultNetworkVersion
{
  -[PTCinematographyStream _getFocusStrategyIfNeeded](self, "_getFocusStrategyIfNeeded");
  return -[PTCinematographyStream internalDefaultNetworkVersion](self, "internalDefaultNetworkVersion");
}

- (float)_userDefaultFixedFocusDisparity
{
  float result;

  -[PTCinematographyStream _getFocusStrategyIfNeeded](self, "_getFocusStrategyIfNeeded");
  -[PTCinematographyStream internalDefaultFixedFocusDisparity](self, "internalDefaultFixedFocusDisparity");
  return result;
}

- (id)_chooseFocusDetection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  switch(-[PTCinematographyStream _userDefaultFocusStrategy](self, "_userDefaultFocusStrategy"))
  {
    case 0uLL:
      -[PTCinematographyStream network](self, "network");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stepWithFrameDetections:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[PTCinematographyStream _userDefaultFixedFocusDisparity](self, "_userDefaultFixedFocusDisparity");
      -[PTCinematographyStream _detectionForFixedFocusDistance:rect:](self, "_detectionForFixedFocusDistance:rect:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(v4, "detections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTCinematographyStream _chooseClosestObjectDetection:](self, "_chooseClosestObjectDetection:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(v4, "detections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTCinematographyStream _chooseLargestAreaDetection:](self, "_chooseLargestAreaDetection:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;

      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v4, "baseFocusTrackNumberOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "baseFocusTrackNumberOverride");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "detectionForTrackIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }

  return v7;
}

- (float)_minimumUserTapSeconds
{
  if (_minimumUserTapSeconds_onceToken != -1)
    dispatch_once(&_minimumUserTapSeconds_onceToken, &__block_literal_global_127);
  return *(float *)&_minimumUserTapSeconds_sMinimumUserTapSeconds;
}

void __48__PTCinematographyStream__minimumUserTapSeconds__block_invoke()
{
  _minimumUserTapSeconds_sMinimumUserTapSeconds = 0x40000000;
}

- (BOOL)_userTapLockEndsAtTime:(id *)a3
{
  void *v5;
  void *v6;
  double Seconds;
  float v8;
  BOOL v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  CMTime rhs;
  CMTime time;

  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(&rhs, 0, sizeof(rhs));
  v11 = *a3;
  CMTimeSubtract(&time, (CMTime *)&v11, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  -[PTCinematographyStream _minimumUserTapSeconds](self, "_minimumUserTapSeconds");
  v9 = Seconds >= v8;

  return v9;
}

- (BOOL)_userTapEndsForChangedFocusWithDisparityBuffer:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  NSObject *v19;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  int v25;
  void *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (_userTapEndsForChangedFocusWithDisparityBuffer__onceToken != -1)
  {
    dispatch_once(&_userTapEndsForChangedFocusWithDisparityBuffer__onceToken, &__block_literal_global_128);
    if (a3)
      goto LABEL_3;
    return 0;
  }
  if (!a3)
    return 0;
LABEL_3:
  if (0xCCCCCCCCCCCCCCCDLL * -[PTCinematographyStream frameIndex](self, "frameIndex") > 0x3333333333333333)
    return 0;
  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFixedFocusDetection");

  if (!v7)
    return 0;
  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rect");
  v14 = PTDisparityInNormalizedRectFromPixelBuffer(101, a3, v10, v11, v12, v13);

  -[PTCinematographyStream activeUserTap](self, "activeUserTap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "focusDistance");
  v18 = fabsf((float)(v17 / fmaxf(v14, 0.0001)) + -1.0);

  if (v18 <= *(float *)&_userTapEndsForChangedFocusWithDisparityBuffer__sSoftFixedFocusTerminateThreshold)
    return 0;
  _PTLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "detection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "focusDistance");
    v25 = 138413058;
    v26 = v21;
    v27 = 2048;
    v28 = (float)(v18 * 100.0);
    v29 = 2048;
    v30 = v24;
    v31 = 2048;
    v32 = v14;
    _os_log_debug_impl(&dword_1C9281000, v19, OS_LOG_TYPE_DEBUG, "user tap %@ ends due to depth change of %.1f%% (from disparity %.3f to %.3f)", (uint8_t *)&v25, 0x2Au);

  }
  return 1;
}

void __73__PTCinematographyStream__userTapEndsForChangedFocusWithDisparityBuffer___block_invoke()
{
  _userTapEndsForChangedFocusWithDisparityBuffer__sSoftFixedFocusTerminateThreshold = 1036831949;
}

- (BOOL)_userTapEndsForBaseFocusDetection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  objc_msgSend(v4, "trackNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "groupIdentifier");

  if (PTGroupIDIsValid(v6))
  {
    -[PTCinematographyStream previousFrame](self, "previousFrame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyStream previousFrame](self, "previousFrame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baseFocusTrackNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detectionForTrackNumber:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == objc_msgSend(v10, "groupIdentifier"))
    {

      goto LABEL_6;
    }
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "groupIdentifier");

    if (v6 == v12)
      goto LABEL_6;
  }
  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "baseFocusTrackNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "isEqualToNumber:", v14);

  if ((v15 & 1) == 0)
  {
    -[PTCinematographyStream activeUserTap](self, "activeUserTap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v5, "isEqualToNumber:", v18);

    v16 = v19 ^ 1;
    goto LABEL_8;
  }
LABEL_6:
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)_userTapFromMetadata:(id)a3 frameDetections:(id)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  if (-[PTCinematographyStream _hasFusionTrackerMetadata:](self, "_hasFusionTrackerMetadata:", v8))
  {
    -[PTCinematographyStream _trackingResultFromFusionTrackerMetadata:](self, "_trackingResultFromFusionTrackerMetadata:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tapResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyStream _userTapFromFTTapResponse:frameDetections:disparityBuffer:](self, "_userTapFromFTTapResponse:frameDetections:disparityBuffer:", v11, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isValidNormalizedPoint:(CGPoint)a3
{
  BOOL v3;

  v3 = a3.x >= 0.0;
  if (a3.x > 1.0)
    v3 = 0;
  if (a3.y < 0.0)
    v3 = 0;
  return a3.y <= 1.0 && v3;
}

- (BOOL)_isFixedFocusFTTapRequestMetadata:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", PTCinematographyTapRequestIsFixedPlaneFocus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isFixedFocus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (BOOL)_isFixedFocusFTTapRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PTCinematographyStream _isFixedFocusFTTapRequestMetadata:](self, "_isFixedFocusFTTapRequestMetadata:", v5))
  {
    objc_msgSend(v4, "tapPoint");
    v6 = -[PTCinematographyStream _isValidNormalizedPoint:](self, "_isValidNormalizedPoint:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isTapToTrackFTTapRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PTCinematographyStream _isFixedFocusFTTapRequestMetadata:](self, "_isFixedFocusFTTapRequestMetadata:", v5))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "tapPoint");
    v6 = -[PTCinematographyStream _isValidNormalizedPoint:](self, "_isValidNormalizedPoint:");
  }

  return v6;
}

- (BOOL)_isSuccessfulTapToTrackFTTapResponse:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "wasSuccessful"))
  {
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PTCinematographyStream _isTapToTrackFTTapRequest:](self, "_isTapToTrackFTTapRequest:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isFailedTapToTrackFTTapResponse:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "wasSuccessful") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PTCinematographyStream _isTapToTrackFTTapRequest:](self, "_isTapToTrackFTTapRequest:", v6);

  }
  return v5;
}

- (CGRect)_fixedFocusRectForPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  y = a3.y;
  x = a3.x;
  -[PTCinematographyStream options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fixedFocusNormalizedRectSize");
  v10 = v9;
  v12 = v11;

  v13 = v10 <= 0.0 || v10 > 1.0;
  if (v13 || (v12 > 0.0 ? (v14 = v12 > 1.0) : (v14 = 1), v14))
  {
    -[PTCinematographyStream _defaultFixedFocusRectForPoint:disparityBuffer:](self, "_defaultFixedFocusRectForPoint:disparityBuffer:", a4, x, y);
    v10 = v17;
    v12 = v18;
  }
  else
  {
    v15 = x - v10 * 0.5;
    v16 = y - v12 * 0.5;
  }
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_defaultFixedFocusRectForPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4
{
  double y;
  double x;
  double Width;
  double Height;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  y = a3.y;
  x = a3.x;
  Width = (double)CVPixelBufferGetWidth(a4);
  Height = (double)CVPixelBufferGetHeight(a4);
  v9 = 0.125;
  v10 = 0.125;
  if (Width > Height)
    v10 = Height * 0.125 / Width;
  if (Width < Height)
    v9 = Width * 0.125 / Height;
  v11 = x - v10 * 0.5;
  v12 = y - v9 * 0.5;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_detectionForFixedFocusAtNormalizedPoint:(CGPoint)a3 disparityBuffer:(__CVBuffer *)a4
{
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  NSPoint v31;
  NSRect v32;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x1E0C80C00];
  -[PTCinematographyStream _fixedFocusRectForPoint:disparityBuffer:](self, "_fixedFocusRectForPoint:disparityBuffer:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = PTDisparityInNormalizedRectFromPixelBuffer(101, a4, v8, v10, v12, v14);
  _PTLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v31.x = x;
    v31.y = y;
    NSStringFromPoint(v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32.origin.x = v9;
    v32.origin.y = v11;
    v32.size.width = v13;
    v32.size.height = v15;
    NSStringFromRect(v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v20 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_1C9281000, v17, OS_LOG_TYPE_DEFAULT, "fixed focus user tap at point %@ (rect %@; disparity %@)",
      (uint8_t *)&v24,
      0x20u);

  }
  *(float *)&v22 = v16;
  -[PTCinematographyStream _detectionForFixedFocusDistance:rect:](self, "_detectionForFixedFocusDistance:rect:", v22, v9, v11, v13, v15);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_userTapFromFTTapResponse:(id)a3 frameDetections:(id)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  PTCinematographyUserTap *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  PTCinematographyUserTap *v21;
  _QWORD v23[3];

  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_8;
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTCinematographyStream _userTapFromFTTapResponse:frameDetections:disparityBuffer:].cold.1();
    goto LABEL_7;
  }
  if ((objc_msgSend(v10, "trackId") & 0x8000000000000000) == 0)
  {
    objc_msgSend(v9, "detectionForTrackIdentifier:", objc_msgSend(v11, "trackId"));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v12;
    goto LABEL_13;
  }
  if (-[PTCinematographyStream _isSuccessfulTapToTrackFTTapResponse:](self, "_isSuccessfulTapToTrackFTTapResponse:", v8))
  {
    objc_msgSend(v9, "customDetection");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!-[PTCinematographyStream _isFixedFocusFTTapRequest:](self, "_isFixedFocusFTTapRequest:", v11)
    && !-[PTCinematographyStream _isFailedTapToTrackFTTapResponse:](self, "_isFailedTapToTrackFTTapResponse:", v8))
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTCinematographyStream _userTapFromFTTapResponse:frameDetections:disparityBuffer:].cold.2();
LABEL_7:

LABEL_8:
    v14 = 0;
LABEL_9:
    v15 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v11, "tapPoint");
  -[PTCinematographyStream _detectionForFixedFocusAtNormalizedPoint:disparityBuffer:](self, "_detectionForFixedFocusAtNormalizedPoint:disparityBuffer:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDetection:", v14);
LABEL_13:

  if (!v14)
    goto LABEL_9;
  objc_msgSend(v8, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", PTCinematographyTapRequestIsHardFocus);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = PTGroupIDIsValid(objc_msgSend(v14, "groupIdentifier"));
  v21 = [PTCinematographyUserTap alloc];
  if (v9)
    objc_msgSend(v9, "presentationTime");
  else
    memset(v23, 0, sizeof(v23));
  v15 = -[PTCinematographyUserTap initWithTime:tappedDetection:strong:group:](v21, "initWithTime:tappedDetection:strong:group:", v23, v14, v19, v20);
LABEL_18:

  return v15;
}

- (BOOL)_isUserTap:(id)a3 inFrameDetections:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isGroupTap"))
  {
    objc_msgSend(v6, "bestDetectionForGroupIdentifier:options:", objc_msgSend(v5, "groupIdentifier"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7 != 0;
  }
  else
  {
    objc_msgSend(v6, "detectionForTrackIdentifier:", objc_msgSend(v5, "trackIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!objc_msgSend(v7, "_isExcludedAsCinematicChoice"))
      {
        v8 = 1;
        goto LABEL_10;
      }
      _PTLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PTCinematographyStream _isUserTap:inFrameDetections:].cold.1();

    }
    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)_frameDetectionsFromMetadata:(id)a3 time:(id *)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __int128 v13;
  int64_t var3;

  v8 = a3;
  if (!-[PTCinematographyStream _hasFusionTrackerMetadata:](self, "_hasFusionTrackerMetadata:", v8))
  {
    _PTLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PTCinematographyStream _frameDetectionsFromMetadata:time:disparityBuffer:].cold.1();

  }
  v13 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  -[PTCinematographyStream _frameDetectionsFromFusionTrackerMetadata:time:disparityBuffer:](self, "_frameDetectionsFromFusionTrackerMetadata:time:disparityBuffer:", v8, &v13, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__BaseFocusTrackNumberOverride"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setBaseFocusTrackNumberOverride:", v11);
  return v10;
}

- (BOOL)_hasFusionTrackerMetadata:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FTCinematicTrackingResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FTTrackingResult"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (id)_trackingResultFromFusionTrackerMetadata:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FTCinematicTrackingResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FTTrackingResult"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_useSyntheticDDR
{
  if (_useSyntheticDDR_onceToken != -1)
    dispatch_once(&_useSyntheticDDR_onceToken, &__block_literal_global_131);
  return 0;
}

- (BOOL)_detectorDidRunFromFTTrackingResult:(id)a3 time:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  float v14;
  int32_t v15;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime time2;
  CMTime v21;
  CMTime time;
  CMTime lhs;
  CMTime rhs;
  CMTime v25;
  __int128 v26;
  int64_t var3;

  v6 = a3;
  if (-[PTCinematographyStream _useSyntheticDDR](self, "_useSyntheticDDR"))
  {
    -[PTCinematographyStream previousFrame](self, "previousFrame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      memset(&v25, 0, sizeof(v25));
      -[PTCinematographyStream previousFrame](self, "previousFrame");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "time");
      else
        memset(&rhs, 0, sizeof(rhs));
      lhs = (CMTime)*a4;
      CMTimeSubtract(&v25, &lhs, &rhs);

      time = v25;
      CMTimeMultiplyByRatio(&lhs, &time, 1, 4);
      v25 = lhs;
      memset(&lhs, 0, sizeof(lhs));
      -[PTCinematographyStream detectorDidRunNextExpectedTime](self, "detectorDidRunNextExpectedTime");
      time = v25;
      CMTimeSubtract(&lhs, &v21, &time);
      time = (CMTime)*a4;
      time2 = lhs;
      if (CMTimeCompare(&time, &time2) < 0)
      {
        v10 = 0;
LABEL_17:
        _PTLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PTCinematographyStream _detectorDidRunFromFTTrackingResult:time:].cold.1(v10, v12);
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v26 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      -[PTCinematographyStream setDetectorDidRunNextExpectedTime:](self, "setDetectorDidRunNextExpectedTime:", &v26);
    }
    -[PTCinematographyStream network](self, "network");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "expectedFPS");
    if (v14 == 0.0)
      v14 = 6.0;
    v15 = (int)v14;

    memset(&v25, 0, sizeof(v25));
    v10 = 1;
    CMTimeMake(&v25, 1, v15);
    -[PTCinematographyStream detectorDidRunNextExpectedTime](self, "detectorDidRunNextExpectedTime");
    lhs = v25;
    CMTimeAdd(&v19, &v18, &lhs);
    v17 = v19;
    -[PTCinematographyStream setDetectorDidRunNextExpectedTime:](self, "setDetectorDidRunNextExpectedTime:", &v17);
    goto LABEL_17;
  }
  v10 = objc_msgSend(v6, "detectorDidRun");
  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && (v10 & 1) == 0)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyStream _detectorDidRunFromFTTrackingResult:time:].cold.2();
    v10 = 1;
    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

- (id)_frameDetectionsFromFusionTrackerMetadata:(id)a3 time:(id *)a4 disparityBuffer:(__CVBuffer *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  int v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *log;
  __CVBuffer *v56;
  PTCinematographyStream *v57;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v58;
  void *v59;
  id v60;
  id obj;
  uint64_t v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[16];
  int64_t var3;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PTCinematographyStream _trackingResultFromFusionTrackerMetadata:](self, "_trackingResultFromFusionTrackerMetadata:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _PTLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    log = v10;
    v56 = a5;
    v57 = self;
    v58 = a4;
    v59 = v9;
    v60 = v8;
    v27 = v9;
    v63 = (void *)objc_opt_new();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v27, "tracks");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
    if (v28)
    {
      v29 = v28;
      v62 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v65 != v62)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (v27)
            objc_msgSend(v27, "sourceFrameTimestamp");
          v32 = v31;
          v33 = PTGroupIDFromFTTrack(v32);
          v34 = &stru_1E822B200;
          if (PTGroupIDIsValid(v33))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("G%ld"), v33);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v32, "metadata");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", PTCinematographyExcludeAsCinematicChoice);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "BOOLValue");
          v38 = CFSTR("(excluded)");
          if (!v37)
            v38 = &stru_1E822B200;
          v39 = v38;

          objc_msgSend(v32, "box");
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          v48 = (void *)MEMORY[0x1E0CB3940];
          v49 = objc_msgSend(v32, "identifier");
          v50 = objc_msgSend(v32, "objectKind");

          objc_msgSend(v48, "stringWithFormat:", CFSTR("T%ld%@(%zd)%@: (%g,%g,%g,%g)"), v49, v34, v50, v39, v41, v43, v45, v47);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "addObject:", v51);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
      }
      while (v29);
    }

    v52 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v27, "tracks");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringWithFormat:", CFSTR("FTCinematicTrackingResult (%ld) [DDR:%d]: %@"), objc_msgSend(v53, "count"), objc_msgSend(v27, "detectorDidRun"), v63);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v54;
    v10 = log;
    _os_log_debug_impl(&dword_1C9281000, log, OS_LOG_TYPE_DEBUG, "FusionTracker: %@", buf, 0xCu);

    v9 = v59;
    v8 = v60;
    self = v57;
    a4 = v58;
    a5 = v56;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MLSignals"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyStream _autoFocusRectFromMetadata:](self, "_autoFocusRectFromMetadata:", v8);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PTCinematographyStream _autoFocusBlurMapFromMetadata:](self, "_autoFocusBlurMapFromMetadata:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    objc_msgSend(v20, "setAutoFocusRect:", v13, v15, v17, v19);
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  -[PTCinematographyStream _detectionsFromFTTrackingResult:autoFocusRect:focusBlurMap:namedSignalsPerTrack:time:disparityBuffer:](self, "_detectionsFromFTTrackingResult:autoFocusRect:focusBlurMap:namedSignalsPerTrack:time:disparityBuffer:", v9, v21, v11, buf, a5, v13, v15, v17, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v23 = -[PTCinematographyStream _detectorDidRunFromFTTrackingResult:time:](self, "_detectorDidRunFromFTTrackingResult:time:", v9, buf);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  +[PTCinematographyFrameDetections frameDetections:detectorDidRun:presentationTime:](PTCinematographyFrameDetections, "frameDetections:detectorDidRun:presentationTime:", v22, v24, buf);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)_isInvalidFTTrack:(id)a3
{
  id v3;
  _BOOL4 IsEmpty;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  CGRect v15;

  v3 = a3;
  objc_msgSend(v3, "box");
  IsEmpty = CGRectIsEmpty(v15);
  if (IsEmpty)
  {
    objc_msgSend(v3, "box");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTCinematographyStream _isInvalidFTTrack:].cold.1(v3, v13, v6, v8, v10, v12);

  }
  return IsEmpty;
}

- (CGSize)_sensorSizeFromMetadata:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RawSensorWidth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RawSensorHeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = v6;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)_validSensorRectFromMetadata:(id)a3
{
  CGSize v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  double x;
  double y;
  double width;
  double height;
  CGRect v10;
  CGRect result;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v10.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v10.size = v3;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SensorRawValidBufferRect"));
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    CGRectMakeWithDictionaryRepresentation(v4, &v10);

  y = v10.origin.y;
  x = v10.origin.x;
  height = v10.size.height;
  width = v10.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_autoFocusBlurMapFromMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  PTFocusBlurMap *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a3;
  v5 = v4;
  if (!self->_autoFocusUseBlurMap)
    goto LABEL_13;
  if (!self->_focusBlurMapMode)
    goto LABEL_13;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FocusMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
    goto LABEL_13;
  _PTLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyStream _autoFocusBlurMapFromMetadata:].cold.1();

  if (v7 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FocusBlurMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[PTCinematographyStream _sensorSizeFromMetadata:](self, "_sensorSizeFromMetadata:", v5);
      v12 = 0;
      if (v10 > 0.0)
      {
        v13 = v11;
        if (v11 > 0.0)
        {
          v14 = v10;
          -[PTCinematographyStream _validSensorRectFromMetadata:](self, "_validSensorRectFromMetadata:", v5);
          v12 = 0;
          if (v17 > 0.0 && v18 > 0.0)
            v12 = -[PTFocusBlurMap initWithFocusBlurMapData:sensorSize:validSensorRect:]([PTFocusBlurMap alloc], "initWithFocusBlurMapData:sensorSize:validSensorRect:", v9, v14, v13, v15, v16, v17, v18);
        }
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_13:
    v12 = 0;
  }

  return v12;
}

- (CGRect)_autoFocusRectFromMetadata:(id)a3
{
  CGSize v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  NSObject *v6;
  double x;
  double y;
  double width;
  double height;
  CGRect v11;
  CGRect result;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v11.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v11.size = v3;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("FocusRegion"));
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    CGRectMakeWithDictionaryRepresentation(v4, &v11);
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyStream _autoFocusRectFromMetadata:].cold.1(&v11.origin.x);

  }
  y = v11.origin.y;
  x = v11.origin.x;
  height = v11.size.height;
  width = v11.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)_autoFocusDetectionWithTime:(id *)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  PTCinematographyDetection *v9;
  double v10;
  PTCinematographyDetection *v11;
  __int128 v13;
  int64_t var3;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (CGRectIsEmpty(a4))
  {
    x = 0.0;
    y = 0.0;
    width = 1.0;
    height = 1.0;
  }
  v9 = [PTCinematographyDetection alloc];
  v13 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  LODWORD(v10) = 0;
  v11 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v9, "initWithTime:rect:focusDistance:", &v13, x, y, width, height, v10);
  -[PTCinematographyDetection setDetectionType:](v11, "setDetectionType:", 100);
  -[PTCinematographyDetection setTrackIdentifier:](v11, "setTrackIdentifier:", 0x1000000001);
  return v11;
}

- (void)_copyPreviousISPDetections:(id)a3 toDetections:(id)a4 time:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  int64_t var3;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v13, "detectionType") - 1) <= 0xB)
        {
          v15 = *(_OWORD *)&a5->var0;
          var3 = a5->var3;
          objc_msgSend(v13, "_detectionByChangingTime:", &v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)_updateDetections:(id)a3 ifMissingISPDetectionsFromTrackingResult:(id)a4 time:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int64_t var3;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a4, "tracks", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, &v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "objectKind") != 912559)
        {

          v17 = 1;
          goto LABEL_14;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, &v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (-[PTCinematographyStream canCopyISPDetectionsIfMissing](self, "canCopyISPDetectionsIfMissing"))
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyStream _updateDetections:ifMissingISPDetectionsFromTrackingResult:time:].cold.1();

    -[PTCinematographyStream previousFrame](self, "previousFrame");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allDetections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[PTCinematographyStream _copyPreviousISPDetections:toDetections:time:](self, "_copyPreviousISPDetections:toDetections:time:", v16, v8, &v22);

    v17 = 0;
LABEL_14:
    -[PTCinematographyStream setCanCopyISPDetectionsIfMissing:](self, "setCanCopyISPDetectionsIfMissing:", v17);
  }

}

- (id)_detectionsFromFTTrackingResult:(id)a3 autoFocusRect:(CGRect)a4 focusBlurMap:(id)a5 namedSignalsPerTrack:(id)a6 time:(id *)a7 disparityBuffer:(__CVBuffer *)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v23 = *a7;
  v17 = a5;
  v18 = a3;
  -[PTCinematographyStream _mutableDetectionsFromFTTrackingResult:namedSignalsPerTrack:time:](self, "_mutableDetectionsFromFTTrackingResult:namedSignalsPerTrack:time:", v18, a6, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *a7;
  -[PTCinematographyStream _autoFocusDetectionWithTime:rect:](self, "_autoFocusDetectionWithTime:rect:", &v23, x, y, width, height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);
  -[PTCinematographyStream _setDisparityOfDetections:disparityBuffer:focusBlurMap:](self, "_setDisparityOfDetections:disparityBuffer:focusBlurMap:", v19, a8, v17);

  v23 = *a7;
  -[PTCinematographyStream _updateDetections:ifMissingISPDetectionsFromTrackingResult:time:](self, "_updateDetections:ifMissingISPDetectionsFromTrackingResult:time:", v19, v18, &v23);

  v21 = (void *)objc_msgSend(v19, "copy");
  return v21;
}

- (unint64_t)_detectionTypeForFTObjectKind:(unint64_t)a3
{
  unint64_t result;

  if ((uint64_t)a3 > 1999)
  {
    if ((uint64_t)a3 > 3000)
    {
      switch(a3)
      {
        case 0xBB9uLL:
          return 10;
        case 0xA411uLL:
          return 11;
        case 0xDECAFuLL:
          return 102;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x7D0uLL:
          return 4;
        case 0x7D1uLL:
          return 9;
        case 0xBB8uLL:
          return 5;
      }
    }
    return 0;
  }
  else
  {
    result = 1;
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
LABEL_15:
        result = 2;
        break;
      case 3uLL:
LABEL_9:
        result = 3;
        break;
      case 4uLL:
        return 4;
      case 5uLL:
        return 5;
      default:
        switch(a3)
        {
          case 0x3E8uLL:
            goto LABEL_9;
          case 0x3E9uLL:
            goto LABEL_15;
          case 0x3EAuLL:
            return result;
          case 0x3EBuLL:
            result = 12;
            break;
          default:
            return 0;
        }
        break;
    }
  }
  return result;
}

- (id)_ANODPoseFromFTTrackMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AngleInfoRoll"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AngleInfoPitch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AngleInfoYaw"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v4, "floatValue");
        v8 = v7;
        objc_msgSend(v5, "floatValue");
        v10 = v9;
        objc_msgSend(v6, "floatValue");
        v12 = v11;
        LODWORD(v13) = v8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v16;
        LODWORD(v17) = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_namedSignals:(id)a3 addingANODPoseFromFTTrackMetadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[PTCinematographyStream _ANODPoseFromFTTrackMetadata:](self, "_ANODPoseFromFTTrackMetadata:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (!v6)
      v6 = (id)MEMORY[0x1E0C9AA70];
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("anod_pose"));
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v6 = v6;
    v9 = v6;
  }

  return v9;
}

- (id)_mutableDetectionsFromFTTrackingResult:(id)a3 namedSignalsPerTrack:(id)a4 time:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PTCinematographyDetection *v13;
  PTCinematographyDetection *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v31;
  id v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[4];
  uint64_t v41;
  _BYTE buf[24];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = a4;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = v7;
  objc_msgSend(v7, "tracks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (!-[PTCinematographyStream _isInvalidFTTrack:](self, "_isInvalidFTTrack:", v12))
        {
          v13 = [PTCinematographyDetection alloc];
          objc_msgSend(v12, "box");
          *(_OWORD *)buf = *(_OWORD *)&a5->var0;
          *(_QWORD *)&buf[16] = a5->var3;
          v14 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v13, "initWithTime:rect:focusDistance:", buf);
          -[PTCinematographyDetection setDetectionType:](v14, "setDetectionType:", -[PTCinematographyStream _detectionTypeForFTObjectKind:](self, "_detectionTypeForFTObjectKind:", objc_msgSend(v12, "objectKind")));
          -[PTCinematographyDetection setTrackIdentifier:](v14, "setTrackIdentifier:", objc_msgSend(v12, "identifier"));
          -[PTCinematographyDetection setGroupIdentifier:](v14, "setGroupIdentifier:", PTGroupIDFromFTTrack(v12));
          objc_msgSend(v12, "metadata");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", PTCinematographyExcludeAsCinematicChoice);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyDetection _setExcludedAsCinematicChoice:](v14, "_setExcludedAsCinematicChoice:", objc_msgSend(v16, "BOOLValue"));

          if (-[PTCinematographyDetection trackIdentifier](v14, "trackIdentifier") < 0)
          {
            _PTLogSystem();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[PTCinematographyStream _mutableDetectionsFromFTTrackingResult:namedSignalsPerTrack:time:].cold.1(v40, v14, &v41, v17);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "metadata");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyStream _namedSignals:addingANODPoseFromFTTrackMetadata:](self, "_namedSignals:addingANODPoseFromFTTrackMetadata:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyDetection set_namedSignals:](v14, "set_namedSignals:", v21);

          -[PTCinematographyDetection _namedSignals](v14, "_namedSignals");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            PTDefaultsGetDictionary();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CinematographyDebugLogMLSignals"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "BOOLValue");

            if (v26)
            {
              _PTLogSystem();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                -[PTCinematographyDetection focusIdentifier](v14, "focusIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[PTCinematographyDetection _namedSignals](v14, "_namedSignals");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v28;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v29;
                _os_log_debug_impl(&dword_1C9281000, v27, OS_LOG_TYPE_DEBUG, "%@ named signals: %@", buf, 0x16u);

              }
            }
          }
          objc_msgSend(v34, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v9);
  }

  return v34;
}

- (id)_disparityWeightingValue
{
  if (_disparityWeightingValue_onceToken != -1)
    dispatch_once(&_disparityWeightingValue_onceToken, &__block_literal_global_140);
  return (id)_disparityWeightingValue_sDisparityWeightingValue;
}

void __50__PTCinematographyStream__disparityWeightingValue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PTDefaultsGetDictionary();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("CinematographyDisparityWeighting"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_disparityWeightingValue_sDisparityWeightingValue;
  _disparityWeightingValue_sDisparityWeightingValue = v1;

  if (!_disparityWeightingValue_sDisparityWeightingValue)
    goto LABEL_5;
  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = _disparityWeightingValue_sDisparityWeightingValue;
    _os_log_impl(&dword_1C9281000, v3, OS_LOG_TYPE_INFO, "defaults: CinematographyDisparityWeighting: %@", (uint8_t *)&v5, 0xCu);
  }

  if (!_disparityWeightingValue_sDisparityWeightingValue)
  {
LABEL_5:
    v4 = (void *)_disparityWeightingValue_sDisparityWeightingValue;
    _disparityWeightingValue_sDisparityWeightingValue = (uint64_t)&unk_1E8252EC8;

  }
}

- (float)_focusDistanceForDetection:(id)a3 lockedDisparityBufferAddress:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 bytesPerRow:(unint64_t)a7 formatType:(unsigned int)a8
{
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float *v23;
  float v24;
  NSObject *v25;
  int v27;

  v14 = a3;
  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detectionForTrackIdentifier:", objc_msgSend(v14, "trackIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "focusDistance");
  v27 = v17;
  v18 = objc_msgSend(v14, "detectionType");
  objc_msgSend(v14, "rect");
  if (v16)
    v23 = (float *)&v27;
  else
    v23 = 0;
  v24 = PTDisparityInNormalizedRectFromLockedPixelBufferInfoWithPrior(v18, (uint64_t)a4, a5, a6, a7, a8, v23, v19, v20, v21, v22);
  _PTLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyStream _focusDistanceForDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:].cold.1(v14, v25);

  return v24;
}

- (id)_inFocusRegionForFocusBlurMap:(id)a3
{
  if (self->_autoFocusInFocusRegionSelect == 1)
    objc_msgSend(a3, "largestFocusRegion");
  else
    objc_msgSend(a3, "inFocusRegion");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (float)_focusDistanceForAutoFocusDetection:(id)a3 lockedDisparityBufferAddress:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 bytesPerRow:(unint64_t)a7 formatType:(unsigned int)a8 focusBlurMap:(id)a9
{
  uint64_t v9;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;

  v9 = *(_QWORD *)&a8;
  v15 = a3;
  v16 = a9;
  if (v16)
  {
    -[PTCinematographyStream _inFocusRegionForFocusBlurMap:](self, "_inFocusRegionForFocusBlurMap:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_autoFocusUseMask)
    {
      objc_msgSend(v16, "inputValidNormalizedRect");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      +[PTScanlineMask scanlineMaskWithFocusBlurMap:region:](PTScanlineMask, "scanlineMaskWithFocusBlurMap:region:", v16, v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "validNormalizedRectFromRegion:", v17);
      objc_msgSend(v15, "setRect:");
    }
    else
    {
      objc_msgSend(v16, "validNormalizedRectFromRegion:", v17);
      v19 = v33;
      v21 = v34;
      v23 = v35;
      v25 = v36;
      objc_msgSend(v15, "setRect:");
      v26 = 0;
    }
    v32 = _PTDisparityInNormalizedRectFromLockedPixelBufferInfoWithMask(objc_msgSend(v15, "detectionType"), a4, a5, a6, a7, v9, 0, v26, v19, v21, v23, v25);

  }
  else
  {
    v27 = objc_msgSend(v15, "detectionType");
    objc_msgSend(v15, "rect");
    v32 = PTDisparityInNormalizedRectFromLockedPixelBufferInfo(v27, (uint64_t)a4, a5, a6, a7, v9, v28, v29, v30, v31);
  }
  _PTLogSystem();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    -[PTCinematographyStream _focusDistanceForAutoFocusDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:].cold.1(v15, v37);

  return v32;
}

- (void)_setDisparityOfDetections:(id)a3 disparityBuffer:(__CVBuffer *)a4 focusBlurMap:(id)a5
{
  id v8;
  void *BaseAddress;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  uint64_t PixelFormatType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  CVPixelBufferRef pixelBuffer;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20 = a5;
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a4);
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  pixelBuffer = a4;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v18, "isAutoFocusDetection"))
          -[PTCinematographyStream _focusDistanceForAutoFocusDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:](self, "_focusDistanceForAutoFocusDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:focusBlurMap:", v18, BaseAddress, Width, Height, BytesPerRow, PixelFormatType, v20, pixelBuffer);
        else
          -[PTCinematographyStream _focusDistanceForDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:](self, "_focusDistanceForDetection:lockedDisparityBufferAddress:width:height:bytesPerRow:formatType:", v18, BaseAddress, Width, Height, BytesPerRow, PixelFormatType);
        objc_msgSend(v18, "setFocusDistance:");
        -[PTCinematographyStream _logUnusualDetection:info:](self, "_logUnusualDetection:info:", v18, CFSTR("reading disparity buffer"));
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
}

- (float)smoothFocusDistance:(float)a3 trackIdentifier:(int64_t)a4 sampleCount:(unint64_t)a5
{
  void *v8;
  void *v9;
  float v10;

  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detectionForTrackIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "focusDistance");
    a3 = v10 + (float)((float)(2.0 / (float)((float)a5 + 1.0)) * (float)(a3 - v10));
  }

  return a3;
}

- (void)_logFocusChangeForFrame:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  objc_msgSend(v6, "focusDetection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v9, "trackIdentifier");
  -[PTCinematographyStream previousFrame](self, "previousFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusDetection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "trackIdentifier");

  if (v3 != (void *)v11)
  {
LABEL_3:
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[PTCinematographyStream previousFrame](self, "previousFrame");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[PTCinematographyStream previousFrame](self, "previousFrame");
        self = (PTCinematographyStream *)objc_claimAutoreleasedReturnValue();
        -[PTCinematographyStream focusDetection](self, "focusDetection");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "focusIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR(" from %@"), v4);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = &stru_1E822B200;
      }
      objc_msgSend(v6, "focusDetection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "focusIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_1C9281000, v12, OS_LOG_TYPE_INFO, "cinematography focus change%@ to %@", buf, 0x16u);

      if (v13)
      {

      }
    }

  }
}

- (void)_logUserTap:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  CGFloat MidX;
  void *v8;
  CGFloat MidY;
  void *v10;
  float v11;
  float v12;
  NSObject *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  int v17;
  CGFloat v18;
  __int16 v19;
  CGFloat v20;
  __int16 v21;
  double v22;
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "detection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFixedFocusDetection");

  if (v5)
  {
    objc_msgSend(v3, "detection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rect");
    MidX = CGRectGetMidX(v24);

    objc_msgSend(v3, "detection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rect");
    MidY = CGRectGetMidY(v25);

    objc_msgSend(v3, "detection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "focusDistance");
    v12 = v11;

    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 134218496;
      v18 = MidX;
      v19 = 2048;
      v20 = MidY;
      v21 = 2048;
      v22 = v12;
      _os_log_impl(&dword_1C9281000, v13, OS_LOG_TYPE_DEFAULT, "user tap at (%g,%g) focus distance %g", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "trackIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v3, "isStrong");
      v16 = &stru_1E822B200;
      if (v15)
        v16 = CFSTR(" (strong)");
      v17 = 138412546;
      v18 = *(double *)&v14;
      v19 = 2112;
      v20 = *(double *)&v16;
      _os_log_impl(&dword_1C9281000, v13, OS_LOG_TYPE_DEFAULT, "user tap on track %@%@", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (BOOL)_logUnusualDisparity:(float)a3 kind:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  double v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3 > 100.0 || a3 < 0.0;
  if (v9)
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(float *)&v11 = a3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1C9281000, v10, OS_LOG_TYPE_INFO, "unusual %@ disparity %@ (%@)", (uint8_t *)&v14, 0x20u);

    }
  }

  return v9;
}

- (BOOL)_logUnusualDetection:(id)a3 info:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "focusDistance");
  LOBYTE(a3) = -[PTCinematographyStream _logUnusualDisparity:kind:info:](self, "_logUnusualDisparity:kind:info:", CFSTR("detection"), v6);

  return (char)a3;
}

- (PTCinematographyStreamDelegate)delegate
{
  return (PTCinematographyStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)userAperture
{
  return self->_userAperture;
}

- (void)setUserAperture:(float)a3
{
  self->_userAperture = a3;
}

- (unint64_t)activeVersion
{
  return self->_activeVersion;
}

- (PTCinematographyStreamOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (PTCinematographyTrackAllocator)trackAllocator
{
  return self->_trackAllocator;
}

- (void)setTrackAllocator:(id)a3
{
  objc_storeStrong((id *)&self->_trackAllocator, a3);
}

- (PTCinematographyNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (PTCinematographyFocusPuller)previewFocusPuller
{
  return self->_previewFocusPuller;
}

- (void)setPreviewFocusPuller:(id)a3
{
  objc_storeStrong((id *)&self->_previewFocusPuller, a3);
}

- (unint64_t)detectionModel
{
  return self->_detectionModel;
}

- (void)setDetectionModel:(unint64_t)a3
{
  self->_detectionModel = a3;
}

- (unint64_t)focusBlurMapMode
{
  return self->_focusBlurMapMode;
}

- (void)setFocusBlurMapMode:(unint64_t)a3
{
  self->_focusBlurMapMode = a3;
}

- (BOOL)autoFocusUseBlurMap
{
  return self->_autoFocusUseBlurMap;
}

- (void)setAutoFocusUseBlurMap:(BOOL)a3
{
  self->_autoFocusUseBlurMap = a3;
}

- (BOOL)autoFocusUseMask
{
  return self->_autoFocusUseMask;
}

- (void)setAutoFocusUseMask:(BOOL)a3
{
  self->_autoFocusUseMask = a3;
}

- (unint64_t)autoFocusInFocusRegionSelect
{
  return self->_autoFocusInFocusRegionSelect;
}

- (void)setAutoFocusInFocusRegionSelect:(unint64_t)a3
{
  self->_autoFocusInFocusRegionSelect = a3;
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (void)setFrameIndex:(unint64_t)a3
{
  self->_frameIndex = a3;
}

- (unint64_t)previousRecordingState
{
  return self->_previousRecordingState;
}

- (void)setPreviousRecordingState:(unint64_t)a3
{
  self->_previousRecordingState = a3;
}

- (PTCinematographyFrame)previousFrame
{
  return self->_previousFrame;
}

- (void)setPreviousFrame:(id)a3
{
  objc_storeStrong((id *)&self->_previousFrame, a3);
}

- (BOOL)canCopyISPDetectionsIfMissing
{
  return self->_canCopyISPDetectionsIfMissing;
}

- (void)setCanCopyISPDetectionsIfMissing:(BOOL)a3
{
  self->_canCopyISPDetectionsIfMissing = a3;
}

- (PTCinematographyUserTap)activeUserTap
{
  return self->_activeUserTap;
}

- (void)setActiveUserTap:(id)a3
{
  objc_storeStrong((id *)&self->_activeUserTap, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)detectorDidRunNextExpectedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (void)setDetectorDidRunNextExpectedTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_detectorDidRunNextExpectedTime.epoch = a3->var3;
  *(_OWORD *)&self->_detectorDidRunNextExpectedTime.value = v3;
}

- (BOOL)didReadFocusStrategyDefault
{
  return self->_didReadFocusStrategyDefault;
}

- (void)setDidReadFocusStrategyDefault:(BOOL)a3
{
  self->_didReadFocusStrategyDefault = a3;
}

- (unint64_t)internalDefaultFocusStrategy
{
  return self->_internalDefaultFocusStrategy;
}

- (void)setInternalDefaultFocusStrategy:(unint64_t)a3
{
  self->_internalDefaultFocusStrategy = a3;
}

- (float)internalDefaultFixedFocusDisparity
{
  return self->_internalDefaultFixedFocusDisparity;
}

- (void)setInternalDefaultFixedFocusDisparity:(float)a3
{
  self->_internalDefaultFixedFocusDisparity = a3;
}

- (NSString)internalDefaultNetworkVersion
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInternalDefaultNetworkVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaultNetworkVersion, 0);
  objc_storeStrong((id *)&self->_activeUserTap, 0);
  objc_storeStrong((id *)&self->_previousFrame, 0);
  objc_storeStrong((id *)&self->_previewFocusPuller, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_trackAllocator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithOptions:(_QWORD *)a1 .cold.1(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "init with focus blur map mode %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithOptions:(_QWORD *)a1 .cold.2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "init with detection model %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithOptions:(_QWORD *)a1 .cold.3(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v2, v3, "stream options requested unsupported version %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)processColorBuffer:disparityBuffer:metadataDictionary:presentationTime:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1C9281000, v0, OS_LOG_TYPE_DEBUG, "Frame: %@", v1, 0xCu);
}

- (void)getGlobalMetadata:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v2, v3, "unexpected global metadata class %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_copyUserFocusDetectionFromDetections:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11_0();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v1, v2, "error: user focus on unknown group %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_copyUserFocusDetectionFromDetections:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11_0();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v1, v2, "error: user focus on unknown track %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_restoreInternalState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "stream state missing network state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_restoreInternalState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "stream state has invalid network", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_restoreInternalState:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11_0();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v1, v2, "attempt to restore internal state to unsupported version %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_restoreInternalState:.cold.4()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_opt_class();
  OUTLINED_FUNCTION_8();
  v1 = v0;
  OUTLINED_FUNCTION_0_4(&dword_1C9281000, v2, v3, "unable to restore internal state of class %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_userTapFromFTTapResponse:frameDetections:disparityBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "user tap response missing request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_userTapFromFTTapResponse:frameDetections:disparityBuffer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "user tap response/request unknown (ignored)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_isUserTap:inFrameDetections:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_13(&dword_1C9281000, v1, (uint64_t)v1, "user tap %@ abandoned since detection %@ is marked as excluded as cinematic choice", v2);
}

- (void)_frameDetectionsFromMetadata:time:disparityBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "error: FusionTracker information not provided in metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_detectorDidRunFromFTTrackingResult:(char)a1 time:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1C9281000, a2, OS_LOG_TYPE_DEBUG, "Synthetic DDR:%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_12();
}

- (void)_detectorDidRunFromFTTrackingResult:time:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_1C9281000, v0, v1, "Setting DDR:1 for the first frame seen by cinematography", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)_isInvalidFTTrack:(double)a3 .cold.1(void *a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = 134219264;
  v13 = objc_msgSend(a1, "identifier");
  v14 = 2048;
  v15 = objc_msgSend(a1, "objectKind");
  v16 = 2048;
  v17 = a3;
  v18 = 2048;
  v19 = a4;
  v20 = 2048;
  v21 = a5;
  v22 = 2048;
  v23 = a6;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "*** error: FT track %ld(%zd) with empty box (%g,%g,%g,%g) - skipping", (uint8_t *)&v12, 0x3Eu);
}

- (void)_autoFocusBlurMapFromMetadata:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11_0();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v1, v2, "auto focus mode: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_autoFocusRectFromMetadata:(double *)a1 .cold.1(double *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", *a1, a1[1], a1[2], a1[3]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "auto focus rect: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_updateDetections:ifMissingISPDetectionsFromTrackingResult:time:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_1C9281000, v0, v1, "no ISP detections; copying from prior frame (once)",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_12();
}

- (void)_mutableDetectionsFromFTTrackingResult:(_QWORD *)a3 namedSignalsPerTrack:(NSObject *)a4 time:.cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "trackIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1C9281000, a4, OS_LOG_TYPE_ERROR, "error: FusionTracker: track with negative identifier (%@)", a1, 0xCu);

}

- (void)_focusDistanceForDetection:(void *)a1 lockedDisparityBufferAddress:(NSObject *)a2 width:height:bytesPerRow:formatType:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "trackIdentifier");
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13(&dword_1C9281000, a2, v3, "raw focus %zd: %g", v4);
  OUTLINED_FUNCTION_9_0();
}

- (void)_focusDistanceForAutoFocusDetection:(void *)a1 lockedDisparityBufferAddress:(NSObject *)a2 width:height:bytesPerRow:formatType:focusBlurMap:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "trackIdentifier");
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13(&dword_1C9281000, a2, v3, "auto focus %zd: %g", v4);
  OUTLINED_FUNCTION_9_0();
}

@end
