@implementation VGFaceCaptureOptions

- (VGFaceCaptureOptions)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  char *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VGFaceCaptureOptions;
  v2 = -[VGFaceCaptureOptions init](&v27, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 15) = objc_msgSend((id)objc_opt_class(), "defaultRequiredYawPoses");
    v3 = objc_msgSend((id)objc_opt_class(), "defaultRequiredPitchPoses");
    v4 = (void *)*((_QWORD *)v2 + 17);
    v5 = MEMORY[0x24BDBD1A8];
    *((_QWORD *)v2 + 16) = v3;
    *((_QWORD *)v2 + 17) = v5;

    objc_msgSend((id)objc_opt_class(), "defaultYawLimit");
    *((_DWORD *)v2 + 8) = v6;
    objc_msgSend((id)objc_opt_class(), "defaultPitchLimit");
    *((_DWORD *)v2 + 9) = v7;
    objc_msgSend((id)objc_opt_class(), "defaultEyesForwardAngleSensitivity");
    *((_DWORD *)v2 + 10) = v8;
    objc_msgSend((id)objc_opt_class(), "defaultEyesForwardAngleSensitivity");
    *((_DWORD *)v2 + 11) = v9;
    objc_msgSend((id)objc_opt_class(), "defaultEyesOpenSensitivity");
    *((_DWORD *)v2 + 12) = v10;
    objc_msgSend((id)objc_opt_class(), "defaultNeutralExpressionLowerBound");
    *((_DWORD *)v2 + 13) = v11;
    objc_msgSend((id)objc_opt_class(), "defaultNeutralExpressionUpperBound");
    *((_DWORD *)v2 + 14) = v12;
    *(_DWORD *)(v2 + 11) = 0;
    v2[15] = 1;
    *((_DWORD *)v2 + 4) = 0;
    *((_WORD *)v2 + 10) = 0;
    objc_storeStrong((id *)v2 + 19, (id)*MEMORY[0x24BDBF318]);
    v2[22] = 0;
    objc_msgSend((id)objc_opt_class(), "defaultSimpleSelectorMinOffsetAngle");
    *((_DWORD *)v2 + 23) = v13;
    objc_msgSend((id)objc_opt_class(), "defaultSimpleSelectorMaxOffsetAngle");
    *((_DWORD *)v2 + 24) = v14;
    *((_WORD *)v2 + 12) = 0;
    objc_msgSend((id)objc_opt_class(), "defaultVNFrontPoseBlinkThreshold");
    *((_DWORD *)v2 + 27) = v15;
    *((_WORD *)v2 + 13) = 0;
    v2[28] = 0;
    objc_msgSend((id)objc_opt_class(), "defaultAmbientLightFilterLowThreshold");
    *((_DWORD *)v2 + 28) = v16;
    *(_WORD *)(v2 + 29) = 0;
    v2[31] = 0;
    objc_msgSend((id)objc_opt_class(), "defaultMotionBlurThreshold");
    *((_DWORD *)v2 + 29) = v17;
    *((_WORD *)v2 + 4) = 0;
    v18 = objc_opt_new();
    v19 = (void *)*((_QWORD *)v2 + 21);
    *((_QWORD *)v2 + 21) = v18;

    v20 = objc_opt_new();
    v21 = (void *)*((_QWORD *)v2 + 22);
    *((_QWORD *)v2 + 22) = v20;

    v2[23] = 1;
    objc_msgSend((id)objc_opt_class(), "defaultDistanceFilterCloseThreshold");
    *((_DWORD *)v2 + 25) = v22;
    objc_msgSend((id)objc_opt_class(), "defaultDistanceFilterFarThreshold");
    *((_DWORD *)v2 + 26) = v23;
    v24 = (void *)*((_QWORD *)v2 + 20);
    *((_QWORD *)v2 + 20) = 0;

    v25 = v2;
  }

  return (VGFaceCaptureOptions *)v2;
}

- (VGFaceCaptureOptions)initWithSuiteName:(id)a3
{
  id v4;
  VGFaceCaptureOptions *v5;
  VGFaceCaptureOptions *v6;
  VGFaceCaptureOptions *v7;

  v4 = a3;
  v5 = -[VGFaceCaptureOptions init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[VGFaceCaptureOptions setDefaultsWithSuiteName:](v5, "setDefaultsWithSuiteName:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)setDefaultsWithSuiteName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *requiredExpressions;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  void *v37;
  float v38;
  void *v39;
  float v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSString *v53;
  NSString *cameraImageColorSpaceName;
  void *v55;
  void *v56;
  float v57;
  void *v58;
  float v59;
  void *v60;
  void *v61;
  float v62;
  void *v63;
  float v64;
  uint64_t v65;
  void *v66;
  char v67;
  VGBodyPoseGuidanceOptions *bodyPoseGuidanceOptions;
  VGBodyPoseGuidanceOptions *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  float v77;
  void *v78;
  void *v79;
  float v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;

  v93 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v93);
  objc_msgSend(v4, "objectForKey:", CFSTR("requiredYawPoses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    self->_requiredYawPoses = objc_msgSend(v4, "integerForKey:", CFSTR("requiredYawPoses"));
  objc_msgSend(v4, "objectForKey:", CFSTR("requiredPitchPoses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    self->_requiredPitchPoses = objc_msgSend(v4, "integerForKey:", CFSTR("requiredPitchPoses"));
  objc_msgSend(v4, "objectForKey:", CFSTR("requiredExpressions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    requiredExpressions = self->_requiredExpressions;
    self->_requiredExpressions = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("yawLimit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("yawLimit"));
    self->_yawLimit = v10;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("pitchLimit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("pitchLimit"));
    self->_pitchLimit = v12;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("eyesForwardYawSensitivity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("eyesForwardYawSensitivity"));
    self->_eyesForwardYawSensitivity = v14;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("eyesOpenSensitivity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("eyesOpenSensitivity"));
    self->_eyesOpenSensitivity = v16;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("neutralExpressionLowerBound"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("neutralExpressionLowerBound"));
    self->_neutralExpressionLowerBound = v18;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("neutralExpressionUpperBound"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("neutralExpressionUpperBound"));
    self->_neutralExpressionUpperBound = v20;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("eyesForwardPitchSensitivity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("eyesForwardPitchSensitivity"));
    self->_eyesForwardPitchSensitivity = v22;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useLookAtForEyesForward"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    self->_useLookAtForEyesForward = objc_msgSend(v4, "BOOLForKey:", CFSTR("useLookAtForEyesForward"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureEyesForwardOnFrontPose"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    self->_ensureEyesForwardOnFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureEyesForwardOnFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("leftMarginHeadRatio"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftMarginHeadRatio"));
    self->_leftMarginHeadRatio = v26;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightMarginHeadRatio"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightMarginHeadRatio"));
    self->_rightMarginHeadRatio = v28;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("topMarginHeadRatio"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("topMarginHeadRatio"));
    self->_topMarginHeadRatio = v30;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("bottomMarginHeadRatio"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("bottomMarginHeadRatio"));
    self->_bottomMarginHeadRatio = v32;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftMarginFrontPoseHeadRatio"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftMarginFrontPoseHeadRatio"));
    self->_leftMarginFrontPoseHeadRatio = v34;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightMarginFrontPoseHeadRatio"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightMarginFrontPoseHeadRatio"));
    self->_rightMarginFrontPoseHeadRatio = v36;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("bottomMarginFrontPoseDelta"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("bottomMarginFrontPoseDelta"));
    self->_bottomMarginFrontPoseDelta = v38;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("bottomMarginPitchPoseDelta"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("bottomMarginPitchPoseDelta"));
    self->_bottomMarginPitchPoseDelta = v40;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureEyesOpenOnFrontPose"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    self->_ensureEyesOpenOnFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureEyesOpenOnFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureEyesOpenOnAllPoses"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    self->_ensureEyesOpenOnNonFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureEyesOpenOnAllPoses"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureEyesOpenOnNonFrontPose"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    self->_ensureEyesOpenOnNonFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureEyesOpenOnNonFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureAlmostNeutralExpressionOnAllPoses"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    self->_ensureAlmostNeutralExpressionOnNonFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureAlmostNeutralExpressionOnAllPoses"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureNeutralExpressionOnFrontPose"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    self->_ensureNeutralExpressionOnFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureNeutralExpressionOnFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ensureAlmostNeutralExpressionOnNonFrontPose"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
    self->_ensureAlmostNeutralExpressionOnNonFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("ensureAlmostNeutralExpressionOnNonFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useFaceTrackingDictionary"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    self->_useFaceTrackingDictionary = objc_msgSend(v4, "BOOLForKey:", CFSTR("useFaceTrackingDictionary"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useFKInternalFaceDetector"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    self->_useFKInternalFaceDetector = objc_msgSend(v4, "BOOLForKey:", CFSTR("useFKInternalFaceDetector"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useFKForceCPU"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
    self->_useFKForceCPU = objc_msgSend(v4, "BOOLForKey:", CFSTR("useFKForceCPU"));
  objc_msgSend(v4, "objectForKey:", CFSTR("convertFKTrackingDictToARKitDict"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
    self->_convertFKTrackingDictToARKitDict = objc_msgSend(v4, "BOOLForKey:", CFSTR("convertFKTrackingDictToARKitDict"));
  objc_msgSend(v4, "objectForKey:", CFSTR("sendMetrics"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    self->_sendMetrics = objc_msgSend(v4, "BOOLForKey:", CFSTR("sendMetrics"));
  objc_msgSend(v4, "objectForKey:", CFSTR("cameraImageColorSpaceName"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v4, "stringForKey:", CFSTR("cameraImageColorSpaceName"));
    v53 = (NSString *)objc_claimAutoreleasedReturnValue();
    cameraImageColorSpaceName = self->_cameraImageColorSpaceName;
    self->_cameraImageColorSpaceName = v53;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useSimpleSelector"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
    self->_useSimpleSelector = objc_msgSend(v4, "BOOLForKey:", CFSTR("useSimpleSelector"));
  objc_msgSend(v4, "objectForKey:", CFSTR("simpleSelectorMinOffsetAngle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("simpleSelectorMinOffsetAngle"));
    self->_simpleSelectorMinOffsetAngle = v57;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("simpleSelectorMaxOffsetAngle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("simpleSelectorMaxOffsetAngle"));
    self->_simpleSelectorMaxOffsetAngle = v59;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useDistanceFilter"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
    self->_useDistanceFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useDistanceFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("distanceFilterCloseThreshold"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("distanceFilterCloseThreshold"));
    self->_distanceFilterCloseThreshold = v62;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("distanceFilterFarThreshold"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("distanceFilterFarThreshold"));
    self->_distanceFilterFarThreshold = v64;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useBodyPoseGuidanceFilter"));
  v65 = objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    v66 = (void *)v65;
    v67 = objc_msgSend(v4, "BOOLForKey:", CFSTR("useBodyPoseGuidanceFilter"));

    if ((v67 & 1) == 0)
    {
      bodyPoseGuidanceOptions = self->_bodyPoseGuidanceOptions;
      self->_bodyPoseGuidanceOptions = 0;

    }
  }
  v69 = self->_bodyPoseGuidanceOptions;
  if (v69)
    -[VGBodyPoseGuidanceOptions setDefaultsWithSuiteName:](v69, "setDefaultsWithSuiteName:", v93);
  objc_msgSend(v4, "objectForKey:", CFSTR("useVNFilters"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
    self->_useVNFilters = objc_msgSend(v4, "BOOLForKey:", CFSTR("useVNFilters"));
  objc_msgSend(v4, "objectForKey:", CFSTR("_useVNFiltersEnrollment"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
    self->_useVNFiltersEnrollment = objc_msgSend(v4, "BOOLForKey:", CFSTR("_useVNFiltersEnrollment"));
  objc_msgSend(v4, "objectForKey:", CFSTR("vnFrontPoseBlinkThreshold"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
    self->_vnFrontPoseBlinkThreshold = (float)objc_msgSend(v4, "BOOLForKey:", CFSTR("vnFrontPoseBlinkThreshold"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useDepthFovFilter"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
    self->_useDepthFovFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useDepthFovFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useDepthFovFilterForBadAlignment"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
    self->_useDepthFovFilterForBadAlignment = objc_msgSend(v4, "BOOLForKey:", CFSTR("useDepthFovFilterForBadAlignment"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useAmbientLightFilter"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
    self->_useAmbientLightFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useAmbientLightFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("ambientLightFilterLowThreshold"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("ambientLightFilterLowThreshold"));
    self->_ambientLightFilterLowThreshold = v77;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useMotionBlurFilter"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
    self->_useMotionBlurFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useMotionBlurFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("motionBlurThreshold"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("motionBlurThreshold"));
    self->_motionBlurThreshold = v80;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("useTrackedFaceIdentifierFilter"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
    self->_useTrackedFaceIdentifierFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useTrackedFaceIdentifierFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useVNFaceLandmarksFilter"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
    self->_useVNFaceLandmarksFilter = objc_msgSend(v4, "BOOLForKey:", CFSTR("useVNFaceLandmarksFilter"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useFovMarginsFilterFrontPose"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
    self->_useFovMarginsFilterFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("useFovMarginsFilterFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("useFovMarginsFilterNonFrontPose"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
    self->_useFovMarginsFilterNonFrontPose = objc_msgSend(v4, "BOOLForKey:", CFSTR("useFovMarginsFilterNonFrontPose"));
  objc_msgSend(v4, "objectForKey:", CFSTR("selectionFrustumYawOffsetLeft"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("selectionFrustumYawOffsetLeft"));
    -[VGFaceSelectionFrustum setYawOffsetLeft:](self->_selectionFrustum, "setYawOffsetLeft:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("selectionFrustumYawOffsetRight"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("selectionFrustumYawOffsetRight"));
    -[VGFaceSelectionFrustum setYawOffsetRight:](self->_selectionFrustum, "setYawOffsetRight:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("selectionFrustumPitchOffsetTop"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("selectionFrustumPitchOffsetTop"));
    -[VGFaceSelectionFrustum setPitchOffsetTop:](self->_selectionFrustum, "setPitchOffsetTop:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("selectionFrustumPitchOffsetBottom"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (v88)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("selectionFrustumPitchOffsetBottom"));
    -[VGFaceSelectionFrustum setPitchOffsetBottom:](self->_selectionFrustum, "setPitchOffsetBottom:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("frontPoseSelectionFrustumYawOffsetLeft"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("frontPoseSelectionFrustumYawOffsetLeft"));
    -[VGFaceSelectionFrustum setYawOffsetLeft:](self->_frontPoseSelectionFrustum, "setYawOffsetLeft:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("frontPoseSelectionFrustumYawOffsetRight"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("frontPoseSelectionFrustumYawOffsetRight"));
    -[VGFaceSelectionFrustum setYawOffsetRight:](self->_frontPoseSelectionFrustum, "setYawOffsetRight:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("frontPoseSelectionFrustumPitchOffsetTop"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("frontPoseSelectionFrustumPitchOffsetTop"));
    -[VGFaceSelectionFrustum setPitchOffsetTop:](self->_frontPoseSelectionFrustum, "setPitchOffsetTop:");
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("frontPoseSelectionFrustumPitchOffsetBottom"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("frontPoseSelectionFrustumPitchOffsetBottom"));
    -[VGFaceSelectionFrustum setPitchOffsetBottom:](self->_frontPoseSelectionFrustum, "setPitchOffsetBottom:");
  }

}

+ (unint64_t)defaultRequiredYawPoses
{
  return 3;
}

+ (unint64_t)defaultRequiredPitchPoses
{
  return 2;
}

+ (float)defaultYawLimit
{
  return 30.0;
}

+ (float)defaultPitchLimit
{
  return 22.5;
}

+ (float)defaultEyesForwardAngleSensitivity
{
  return 10.0;
}

+ (float)defaultEyesOpenSensitivity
{
  return 0.3;
}

+ (float)defaultNeutralExpressionLowerBound
{
  return 0.5;
}

+ (float)defaultNeutralExpressionUpperBound
{
  return 0.6;
}

+ (float)defaultSimpleSelectorMinOffsetAngle
{
  return 20.0;
}

+ (float)defaultSimpleSelectorMaxOffsetAngle
{
  return 80.0;
}

+ (float)defaultDistanceFilterCloseThreshold
{
  return 20.0;
}

+ (float)defaultDistanceFilterFarThreshold
{
  return 60.0;
}

+ (float)defaultAmbientLightFilterLowThreshold
{
  return 400.0;
}

+ (float)defaultVNFrontPoseBlinkThreshold
{
  return 0.6;
}

+ (float)defaultMotionBlurThreshold
{
  return 1.0;
}

- (id)description
{
  float pitchLimit;
  double yawLimit;
  unint64_t requiredYawPoses;
  double v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;

  pitchLimit = self->_pitchLimit;
  yawLimit = self->_yawLimit;
  requiredYawPoses = self->_requiredYawPoses;
  v6 = pitchLimit;
  v7 = CFSTR("YES");
  if (self->_useFovMarginsFilterFrontPose)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_useFovMarginsFilterNonFrontPose)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_ensureEyesForwardOnFrontPose)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_useLookAtForEyesForward)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_ensureEyesOpenOnFrontPose)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_ensureEyesOpenOnNonFrontPose)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_ensureNeutralExpressionOnFrontPose)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_ensureAlmostNeutralExpressionOnNonFrontPose)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (self->_useFaceTrackingDictionary)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (self->_useFKInternalFaceDetector)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (self->_useFKForceCPU)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  if (self->_convertFKTrackingDictToARKitDict)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  if (self->_sendMetrics)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  if (self->_useSimpleSelector)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (self->_useDistanceFilter)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  if (self->_useVNFilters)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  if (self->_useVNFiltersEnrollment)
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  if (self->_useDepthFovFilter)
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  if (self->_useDepthFovFilterForBadAlignment)
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  if (self->_useAmbientLightFilter)
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  if (self->_useTrackedFaceIdentifierFilter)
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  if (self->_useVNFaceLandmarksFilter)
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  if (!self->_useMotionBlurFilter)
    v7 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Yaw Poses %lu (limit %.f) Pitch Poses %lu (limit %.f) Expressions %@ Eyes Forward Sensitivity (yaw %g, pitch %g) Selection Frustum Offsets (non-front poses): { %@ } Selection Frustum Offsets (front pose): { %@ } Use FoV Margin: front pose [%@], non front poses [%@] Margins Head Ratio (left %g, right %g, top %g, bottom %g) Margins Head Ratio Front Pose (left %g, right %g, top %g, bottom %g) Bottom margin front pose delta %g Bottom margin pitch pose delta %g Ensure Eyes Forward On Front Pose %@ (use look-at check: %@) Eyes Open Sensitivity %g Neutral Expression Lower Bound %g Neutral Expression Upper Bound %g Ensure Eyes Open On Front Pose %@ Ensure Eyes Open On Non Front Pose %@ Ensure Almost Neutral Expression On Front Pose %@ Ensure Almost Neutral Expression On Non Front Pose %@ Face Tracking Result Set in VGCaptureData %@ Use FaceKit Tracker internal Face Detector %@ Use FaceKit Force CPU %@ Convert FaceKit tracking dictionary to ARKit tracking dictionary %@ Send Metrics %@ Use simple selector: %@ (min offset: %g, max offset: %g) Use distance filter: %@ (close threshold: %g cm, far threshold: %g cm) Body Pose Guidance Options: { %@ } Use Vision Filters %@ (during Frame Selection) Use Vision Filters %@ (during Enrollment) Vision Front Pose Blink Confidence Threshold %g Use computed depth bounding box %@ Use computed depth bounding box for poses with bad alignment %@ Use ambient light filter %@ (low threshold: %g) Use tracked face identifier filter %@ Use Vision face landmarks filter %@ Use Motion Blur Filter %@ (threshold: %g)"), requiredYawPoses, *(_QWORD *)&yawLimit, self->_requiredPitchPoses, *(_QWORD *)&v6, self->_requiredExpressions, self->_eyesForwardYawSensitivity, self->_eyesForwardPitchSensitivity, self->_selectionFrustum, self->_frontPoseSelectionFrustum, v8, v9, self->_leftMarginHeadRatio, self->_rightMarginHeadRatio, self->_topMarginHeadRatio, self->_bottomMarginHeadRatio, self->_leftMarginFrontPoseHeadRatio,
               self->_rightMarginFrontPoseHeadRatio,
               self->_topMarginHeadRatio,
               self->_bottomMarginHeadRatio,
               self->_bottomMarginFrontPoseDelta,
               self->_bottomMarginPitchPoseDelta,
               v10,
               v11,
               self->_eyesOpenSensitivity,
               self->_neutralExpressionLowerBound,
               self->_neutralExpressionUpperBound,
               v12,
               v13,
               v14,
               v15,
               v16,
               v17,
               v18,
               v19,
               v20,
               v21,
               self->_simpleSelectorMinOffsetAngle,
               self->_simpleSelectorMaxOffsetAngle,
               v22,
               self->_distanceFilterCloseThreshold,
               self->_distanceFilterFarThreshold,
               self->_bodyPoseGuidanceOptions,
               v23,
               v24,
               self->_vnFrontPoseBlinkThreshold,
               v25,
               v26,
               v27,
               self->_ambientLightFilterLowThreshold,
               v28,
               v29,
               v7,
               self->_motionBlurThreshold);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFaceCaptureOptions)initWithCoder:(id)a3
{
  id v4;
  VGFaceCaptureOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *requiredExpressions;
  float v11;
  float v12;
  float v13;
  float v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  VGFaceSelectionFrustum *selectionFrustum;
  uint64_t v21;
  VGFaceSelectionFrustum *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  VGFaceSelectionFrustum *frontPoseSelectionFrustum;
  uint64_t v29;
  VGFaceSelectionFrustum *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float leftMarginHeadRatio;
  float rightMarginHeadRatio;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  NSString *debugDataPath;
  const __CFString *v48;
  const __CFString *v49;
  uint64_t v50;
  NSString *cameraImageColorSpaceName;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  uint64_t v58;
  VGBodyPoseGuidanceOptions *bodyPoseGuidanceOptions;
  char v60;
  char v61;
  char v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  float v68;
  VGFaceCaptureOptions *v69;
  _QWORD v71[3];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[VGFaceCaptureOptions init](self, "init");
  if (v5)
  {
    v5->_requiredYawPoses = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requiredYawPoses"));
    v5->_requiredPitchPoses = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requiredPitchPoses"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("requiredExpressions"));
    v9 = objc_claimAutoreleasedReturnValue();
    requiredExpressions = v5->_requiredExpressions;
    v5->_requiredExpressions = (NSArray *)v9;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("yawLimit"));
    v5->_yawLimit = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pitchLimit"));
    v5->_pitchLimit = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("eyesForwardYawSensitivity"));
    v5->_eyesForwardYawSensitivity = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("eyesForwardPitchSensitivity"));
    v5->_eyesForwardPitchSensitivity = v14;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("yawSensitivity"));
    v16 = v15;
    v17 = v15;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("yawSensitivityFrontPose")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("yawSensitivityFrontPose"));
      v17 = v18;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectionFrustum")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectionFrustum"));
      v19 = objc_claimAutoreleasedReturnValue();
      selectionFrustum = v5->_selectionFrustum;
      v5->_selectionFrustum = (VGFaceSelectionFrustum *)v19;

    }
    else
    {
      v21 = objc_opt_new();
      v22 = v5->_selectionFrustum;
      v5->_selectionFrustum = (VGFaceSelectionFrustum *)v21;

      LODWORD(v23) = v16;
      -[VGFaceSelectionFrustum setYawOffsetLeft:](v5->_selectionFrustum, "setYawOffsetLeft:", v23);
      LODWORD(v24) = v16;
      -[VGFaceSelectionFrustum setYawOffsetRight:](v5->_selectionFrustum, "setYawOffsetRight:", v24);
      LODWORD(v25) = v16;
      -[VGFaceSelectionFrustum setPitchOffsetTop:](v5->_selectionFrustum, "setPitchOffsetTop:", v25);
      LODWORD(v26) = v16;
      -[VGFaceSelectionFrustum setPitchOffsetBottom:](v5->_selectionFrustum, "setPitchOffsetBottom:", v26);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("frontPoseSelectionFrustum")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frontPoseSelectionFrustum"));
      v27 = objc_claimAutoreleasedReturnValue();
      frontPoseSelectionFrustum = v5->_frontPoseSelectionFrustum;
      v5->_frontPoseSelectionFrustum = (VGFaceSelectionFrustum *)v27;

    }
    else
    {
      v29 = objc_opt_new();
      v30 = v5->_frontPoseSelectionFrustum;
      v5->_frontPoseSelectionFrustum = (VGFaceSelectionFrustum *)v29;

      LODWORD(v31) = v17;
      -[VGFaceSelectionFrustum setYawOffsetLeft:](v5->_frontPoseSelectionFrustum, "setYawOffsetLeft:", v31);
      LODWORD(v32) = v17;
      -[VGFaceSelectionFrustum setYawOffsetRight:](v5->_frontPoseSelectionFrustum, "setYawOffsetRight:", v32);
      LODWORD(v33) = v17;
      -[VGFaceSelectionFrustum setPitchOffsetTop:](v5->_frontPoseSelectionFrustum, "setPitchOffsetTop:", v33);
      LODWORD(v34) = v17;
      -[VGFaceSelectionFrustum setPitchOffsetBottom:](v5->_frontPoseSelectionFrustum, "setPitchOffsetBottom:", v34);
    }
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftMarginHeadRatio"));
    v5->_leftMarginHeadRatio = v35;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightMarginHeadRatio"));
    v5->_rightMarginHeadRatio = v36;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("topMarginHeadRatio"));
    v5->_topMarginHeadRatio = v37;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bottomMarginHeadRatio"));
    v5->_bottomMarginHeadRatio = v38;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftMarginFrontPoseHeadRatio")))
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftMarginFrontPoseHeadRatio"));
    else
      leftMarginHeadRatio = v5->_leftMarginHeadRatio;
    v5->_leftMarginFrontPoseHeadRatio = leftMarginHeadRatio;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightMarginFrontPoseHeadRatio")))
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightMarginFrontPoseHeadRatio"));
    else
      rightMarginHeadRatio = v5->_rightMarginHeadRatio;
    v5->_rightMarginFrontPoseHeadRatio = rightMarginHeadRatio;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bottomMarginFrontPoseDelta"));
    v5->_bottomMarginFrontPoseDelta = v41;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bottomMarginPitchPoseDelta"));
    v5->_bottomMarginPitchPoseDelta = v42;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("eyesOpenSensitivity"));
    v5->_eyesOpenSensitivity = v43;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("neutralExpressionLowerBound"));
    v5->_neutralExpressionLowerBound = v44;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("neutralExpressionUpperBound"));
    v5->_neutralExpressionUpperBound = v45;
    v5->_writeDebugData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("writeDebugData"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugDataPath"));
    v46 = objc_claimAutoreleasedReturnValue();
    debugDataPath = v5->_debugDataPath;
    v5->_debugDataPath = (NSString *)v46;

    v5->_useLookAtForEyesForward = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLookAtForEyesForward"));
    v5->_ensureEyesForwardOnFrontPose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ensureEyesForwardOnFrontPose"));
    v5->_ensureEyesOpenOnFrontPose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ensureEyesOpenOnFrontPose"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ensureEyesOpenOnAllPoses")))
      v48 = CFSTR("ensureEyesOpenOnAllPoses");
    else
      v48 = CFSTR("ensureEyesOpenOnNonFrontPose");
    v5->_ensureEyesOpenOnNonFrontPose = objc_msgSend(v4, "decodeBoolForKey:", v48);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ensureNeutralExpressionOnFrontPose")))
      v5->_ensureNeutralExpressionOnFrontPose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ensureNeutralExpressionOnFrontPose"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ensureAlmostNeutralExpressionOnAllPoses")))
      v49 = CFSTR("ensureAlmostNeutralExpressionOnAllPoses");
    else
      v49 = CFSTR("ensureAlmostNeutralExpressionOnNonFrontPose");
    v5->_ensureAlmostNeutralExpressionOnNonFrontPose = objc_msgSend(v4, "decodeBoolForKey:", v49);
    v5->_useFaceTrackingDictionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFaceTrackingDictionary"));
    v5->_useFKInternalFaceDetector = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFKInternalFaceDetector"));
    v5->_useFKForceCPU = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFKForceCPU"));
    v5->_convertFKTrackingDictToARKitDict = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("convertFKTrackingDictToARKitDict"));
    v5->_sendMetrics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sendMetrics"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraImageColorSpaceName"));
    v50 = objc_claimAutoreleasedReturnValue();
    cameraImageColorSpaceName = v5->_cameraImageColorSpaceName;
    v5->_cameraImageColorSpaceName = (NSString *)v50;

    v5->_useSimpleSelector = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useSimpleSelector"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("simpleSelectorMinOffsetAngle"));
    v5->_simpleSelectorMinOffsetAngle = v52;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("simpleSelectorMaxOffsetAngle"));
    v5->_simpleSelectorMaxOffsetAngle = v53;
    v5->_useDistanceFilter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDistanceFilter"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("distanceFilterCloseThreshold"));
    v5->_distanceFilterCloseThreshold = v54;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("distanceFilterFarThreshold"));
    v5->_distanceFilterFarThreshold = v55;
    v5->_useAmbientLightFilter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useAmbientLightFilter"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ambientLightFilterLowThreshold"));
    v5->_ambientLightFilterLowThreshold = v56;
    v5->_useVNFilters = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useVNFilters"));
    v5->_useVNFiltersEnrollment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useVNFiltersEnrollment"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("vnFrontPoseBlinkThreshold"));
    v5->_vnFrontPoseBlinkThreshold = v57;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bodyPoseGuidanceOptions")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyPoseGuidanceOptions"));
      v58 = objc_claimAutoreleasedReturnValue();
      bodyPoseGuidanceOptions = v5->_bodyPoseGuidanceOptions;
      v5->_bodyPoseGuidanceOptions = (VGBodyPoseGuidanceOptions *)v58;
    }
    else
    {
      bodyPoseGuidanceOptions = v5->_bodyPoseGuidanceOptions;
      v5->_bodyPoseGuidanceOptions = 0;
    }

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("useFovMarginsFilterFrontPose")))
      v60 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFovMarginsFilterFrontPose"));
    else
      v60 = 1;
    v5->_useFovMarginsFilterFrontPose = v60;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("useFovMarginsFilterNonFrontPose")))
      v61 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFovMarginsFilterNonFrontPose"));
    else
      v61 = 1;
    v5->_useFovMarginsFilterNonFrontPose = v61;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("useDepthFovFilter")))
      v62 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDepthFovFilter"));
    else
      v62 = 1;
    v5->_useDepthFovFilter = v62;
    v63 = objc_msgSend(v4, "containsValueForKey:", CFSTR("useDepthFovFilterForBadAlignment"));
    if (v63)
      LOBYTE(v63) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDepthFovFilterForBadAlignment"));
    v5->_useDepthFovFilterForBadAlignment = v63;
    v64 = objc_msgSend(v4, "containsValueForKey:", CFSTR("useAmbientLightFilter"));
    if (v64)
      LOBYTE(v64) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useAmbientLightFilter"));
    v5->_useAmbientLightFilter = v64;
    v65 = objc_msgSend(v4, "containsValueForKey:", CFSTR("useTrackedFaceIdentifierFilter"));
    if (v65)
      LOBYTE(v65) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useTrackedFaceIdentifierFilter"));
    v5->_useTrackedFaceIdentifierFilter = v65;
    v66 = objc_msgSend(v4, "containsValueForKey:", CFSTR("useVNFaceLandmarksFilter"));
    if (v66)
      LOBYTE(v66) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useVNFaceLandmarksFilter"));
    v5->_useVNFaceLandmarksFilter = v66;
    v67 = objc_msgSend(v4, "containsValueForKey:", CFSTR("useMotionBlurFilter"));
    if (v67)
      LOBYTE(v67) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useMotionBlurFilter"));
    v5->_useMotionBlurFilter = v67;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("motionBlurThreshold")))
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("motionBlurThreshold"));
    else
      objc_msgSend((id)objc_opt_class(), "defaultMotionBlurThreshold");
    v5->_motionBlurThreshold = v68;
    v69 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t requiredYawPoses;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  requiredYawPoses = self->_requiredYawPoses;
  v27 = a3;
  objc_msgSend(v27, "encodeInteger:forKey:", requiredYawPoses, CFSTR("requiredYawPoses"));
  objc_msgSend(v27, "encodeInteger:forKey:", self->_requiredPitchPoses, CFSTR("requiredPitchPoses"));
  objc_msgSend(v27, "encodeObject:forKey:", self->_requiredExpressions, CFSTR("requiredExpressions"));
  *(float *)&v5 = self->_yawLimit;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("yawLimit"), v5);
  *(float *)&v6 = self->_pitchLimit;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("pitchLimit"), v6);
  *(float *)&v7 = self->_eyesForwardYawSensitivity;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("eyesForwardYawSensitivity"), v7);
  *(float *)&v8 = self->_eyesForwardPitchSensitivity;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("eyesForwardPitchSensitivity"), v8);
  *(float *)&v9 = self->_leftMarginHeadRatio;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("leftMarginHeadRatio"), v9);
  *(float *)&v10 = self->_rightMarginHeadRatio;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("rightMarginHeadRatio"), v10);
  *(float *)&v11 = self->_topMarginHeadRatio;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("topMarginHeadRatio"), v11);
  *(float *)&v12 = self->_bottomMarginHeadRatio;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("bottomMarginHeadRatio"), v12);
  *(float *)&v13 = self->_leftMarginFrontPoseHeadRatio;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("leftMarginFrontPoseHeadRatio"), v13);
  *(float *)&v14 = self->_rightMarginFrontPoseHeadRatio;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("rightMarginFrontPoseHeadRatio"), v14);
  *(float *)&v15 = self->_bottomMarginFrontPoseDelta;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("bottomMarginFrontPoseDelta"), v15);
  *(float *)&v16 = self->_bottomMarginPitchPoseDelta;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("bottomMarginPitchPoseDelta"), v16);
  *(float *)&v17 = self->_eyesOpenSensitivity;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("eyesOpenSensitivity"), v17);
  *(float *)&v18 = self->_neutralExpressionLowerBound;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("neutralExpressionLowerBound"), v18);
  *(float *)&v19 = self->_neutralExpressionUpperBound;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("neutralExpressionUpperBound"), v19);
  objc_msgSend(v27, "encodeBool:forKey:", self->_writeDebugData, CFSTR("writeDebugData"));
  objc_msgSend(v27, "encodeObject:forKey:", self->_debugDataPath, CFSTR("debugDataPath"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useLookAtForEyesForward, CFSTR("useLookAtForEyesForward"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_ensureEyesForwardOnFrontPose, CFSTR("ensureEyesForwardOnFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_ensureEyesOpenOnFrontPose, CFSTR("ensureEyesOpenOnFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_ensureEyesOpenOnNonFrontPose, CFSTR("ensureEyesOpenOnNonFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_ensureNeutralExpressionOnFrontPose, CFSTR("ensureNeutralExpressionOnFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_ensureAlmostNeutralExpressionOnNonFrontPose, CFSTR("ensureAlmostNeutralExpressionOnNonFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useFaceTrackingDictionary, CFSTR("useFaceTrackingDictionary"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useFKInternalFaceDetector, CFSTR("useFKInternalFaceDetector"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useFKForceCPU, CFSTR("useFKForceCPU"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_convertFKTrackingDictToARKitDict, CFSTR("convertFKTrackingDictToARKitDict"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_sendMetrics, CFSTR("sendMetrics"));
  objc_msgSend(v27, "encodeObject:forKey:", self->_cameraImageColorSpaceName, CFSTR("cameraImageColorSpaceName"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useSimpleSelector, CFSTR("useSimpleSelector"));
  *(float *)&v20 = self->_simpleSelectorMinOffsetAngle;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("simpleSelectorMinOffsetAngle"), v20);
  *(float *)&v21 = self->_simpleSelectorMaxOffsetAngle;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("simpleSelectorMaxOffsetAngle"), v21);
  objc_msgSend(v27, "encodeBool:forKey:", self->_useDistanceFilter, CFSTR("useDistanceFilter"));
  *(float *)&v22 = self->_distanceFilterCloseThreshold;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("distanceFilterCloseThreshold"), v22);
  *(float *)&v23 = self->_distanceFilterFarThreshold;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("distanceFilterFarThreshold"), v23);
  objc_msgSend(v27, "encodeBool:forKey:", self->_useVNFilters, CFSTR("useVNFilters"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useVNFiltersEnrollment, CFSTR("useVNFiltersEnrollment"));
  *(float *)&v24 = self->_vnFrontPoseBlinkThreshold;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("vnFrontPoseBlinkThreshold"), v24);
  objc_msgSend(v27, "encodeObject:forKey:", self->_bodyPoseGuidanceOptions, CFSTR("bodyPoseGuidanceOptions"));
  objc_msgSend(v27, "encodeObject:forKey:", self->_selectionFrustum, CFSTR("selectionFrustum"));
  objc_msgSend(v27, "encodeObject:forKey:", self->_frontPoseSelectionFrustum, CFSTR("frontPoseSelectionFrustum"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useFovMarginsFilterFrontPose, CFSTR("useFovMarginsFilterFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useFovMarginsFilterNonFrontPose, CFSTR("useFovMarginsFilterNonFrontPose"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useDepthFovFilter, CFSTR("useDepthFovFilter"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useDepthFovFilterForBadAlignment, CFSTR("useDepthFovFilterForBadAlignment"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useAmbientLightFilter, CFSTR("useAmbientLightFilter"));
  *(float *)&v25 = self->_ambientLightFilterLowThreshold;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("ambientLightFilterLowThreshold"), v25);
  objc_msgSend(v27, "encodeBool:forKey:", self->_useTrackedFaceIdentifierFilter, CFSTR("useTrackedFaceIdentifierFilter"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useVNFaceLandmarksFilter, CFSTR("useVNFaceLandmarksFilter"));
  objc_msgSend(v27, "encodeBool:forKey:", self->_useMotionBlurFilter, CFSTR("useMotionBlurFilter"));
  *(float *)&v26 = self->_motionBlurThreshold;
  objc_msgSend(v27, "encodeFloat:forKey:", CFSTR("motionBlurThreshold"), v26);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t requiredYawPoses;
  unint64_t requiredPitchPoses;
  void *requiredExpressions;
  void *v9;
  float yawLimit;
  float v11;
  float pitchLimit;
  float v13;
  float eyesForwardYawSensitivity;
  float v15;
  float eyesForwardPitchSensitivity;
  float v17;
  float leftMarginHeadRatio;
  float v19;
  float rightMarginHeadRatio;
  float v21;
  float topMarginHeadRatio;
  float v23;
  float bottomMarginHeadRatio;
  float v25;
  float leftMarginFrontPoseHeadRatio;
  float v27;
  float rightMarginFrontPoseHeadRatio;
  float v29;
  float bottomMarginFrontPoseDelta;
  float v31;
  float bottomMarginPitchPoseDelta;
  float v33;
  float eyesOpenSensitivity;
  float v35;
  float neutralExpressionLowerBound;
  float v37;
  float neutralExpressionUpperBound;
  float v39;
  VGFaceCaptureOptions *v40;
  uint64_t writeDebugData;
  NSString *debugDataPath;
  NSString *v43;
  int v44;
  BOOL v45;
  int useLookAtForEyesForward;
  int ensureEyesForwardOnFrontPose;
  int ensureEyesOpenOnFrontPose;
  int ensureEyesOpenOnNonFrontPose;
  int ensureNeutralExpressionOnFrontPose;
  int ensureAlmostNeutralExpressionOnNonFrontPose;
  int useFaceTrackingDictionary;
  int useFKInternalFaceDetector;
  int useFKForceCPU;
  int convertFKTrackingDictToARKitDict;
  int sendMetrics;
  NSString *cameraImageColorSpaceName;
  NSString *v59;
  int useSimpleSelector;
  float simpleSelectorMinOffsetAngle;
  float v62;
  float simpleSelectorMaxOffsetAngle;
  float v64;
  int useDistanceFilter;
  float distanceFilterCloseThreshold;
  float v67;
  float distanceFilterFarThreshold;
  float v69;
  int useVNFilters;
  int useVNFiltersEnrollment;
  float vnFrontPoseBlinkThreshold;
  float v73;
  VGBodyPoseGuidanceOptions *bodyPoseGuidanceOptions;
  VGFaceSelectionFrustum *selectionFrustum;
  VGFaceSelectionFrustum *frontPoseSelectionFrustum;
  int useFovMarginsFilterFrontPose;
  int useFovMarginsFilterNonFrontPose;
  int useDepthFovFilter;
  int useDepthFovFilterForBadAlignment;
  int useAmbientLightFilter;
  float ambientLightFilterLowThreshold;
  float v83;
  int useTrackedFaceIdentifierFilter;
  int useVNFaceLandmarksFilter;
  int useMotionBlurFilter;
  float motionBlurThreshold;
  float v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  int v93;
  VGFaceSelectionFrustum *v94;
  void *v95;
  void *v96;
  VGFaceSelectionFrustum *v97;
  int v98;
  void *v99;
  VGBodyPoseGuidanceOptions *v100;
  void *v101;
  int v102;
  void *v103;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    requiredYawPoses = self->_requiredYawPoses;
    if (requiredYawPoses != objc_msgSend(v5, "requiredYawPoses")
      || (requiredPitchPoses = self->_requiredPitchPoses, requiredPitchPoses != objc_msgSend(v5, "requiredPitchPoses")))
    {
      v45 = 0;
LABEL_30:

      goto LABEL_31;
    }
    requiredExpressions = self->_requiredExpressions;
    objc_msgSend(v5, "requiredExpressions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(requiredExpressions, "isEqualToArray:", v9))
      goto LABEL_28;
    yawLimit = self->_yawLimit;
    objc_msgSend(v5, "yawLimit");
    if (yawLimit != v11)
      goto LABEL_28;
    pitchLimit = self->_pitchLimit;
    objc_msgSend(v5, "pitchLimit");
    if (pitchLimit != v13)
      goto LABEL_28;
    eyesForwardYawSensitivity = self->_eyesForwardYawSensitivity;
    objc_msgSend(v5, "eyesForwardYawSensitivity");
    if (eyesForwardYawSensitivity != v15)
      goto LABEL_28;
    eyesForwardPitchSensitivity = self->_eyesForwardPitchSensitivity;
    objc_msgSend(v5, "eyesForwardPitchSensitivity");
    if (eyesForwardPitchSensitivity != v17)
      goto LABEL_28;
    leftMarginHeadRatio = self->_leftMarginHeadRatio;
    objc_msgSend(v5, "leftMarginHeadRatio");
    if (leftMarginHeadRatio != v19)
      goto LABEL_28;
    rightMarginHeadRatio = self->_rightMarginHeadRatio;
    objc_msgSend(v5, "rightMarginHeadRatio");
    if (rightMarginHeadRatio != v21)
      goto LABEL_28;
    topMarginHeadRatio = self->_topMarginHeadRatio;
    objc_msgSend(v5, "topMarginHeadRatio");
    if (topMarginHeadRatio != v23)
      goto LABEL_28;
    bottomMarginHeadRatio = self->_bottomMarginHeadRatio;
    objc_msgSend(v5, "bottomMarginHeadRatio");
    if (bottomMarginHeadRatio != v25)
      goto LABEL_28;
    leftMarginFrontPoseHeadRatio = self->_leftMarginFrontPoseHeadRatio;
    objc_msgSend(v5, "leftMarginFrontPoseHeadRatio");
    if (leftMarginFrontPoseHeadRatio != v27)
      goto LABEL_28;
    rightMarginFrontPoseHeadRatio = self->_rightMarginFrontPoseHeadRatio;
    objc_msgSend(v5, "rightMarginFrontPoseHeadRatio");
    if (rightMarginFrontPoseHeadRatio != v29)
      goto LABEL_28;
    bottomMarginFrontPoseDelta = self->_bottomMarginFrontPoseDelta;
    objc_msgSend(v5, "bottomMarginFrontPoseDelta");
    if (bottomMarginFrontPoseDelta != v31)
      goto LABEL_28;
    bottomMarginPitchPoseDelta = self->_bottomMarginPitchPoseDelta;
    objc_msgSend(v5, "bottomMarginPitchPoseDelta");
    if (bottomMarginPitchPoseDelta != v33)
      goto LABEL_28;
    eyesOpenSensitivity = self->_eyesOpenSensitivity;
    objc_msgSend(v5, "eyesOpenSensitivity");
    if (eyesOpenSensitivity != v35
      || (neutralExpressionLowerBound = self->_neutralExpressionLowerBound,
          objc_msgSend(v5, "neutralExpressionLowerBound"),
          neutralExpressionLowerBound != v37)
      || (neutralExpressionUpperBound = self->_neutralExpressionUpperBound,
          objc_msgSend(v5, "neutralExpressionUpperBound"),
          neutralExpressionUpperBound != v39)
      || (v40 = self,
          writeDebugData = self->_writeDebugData,
          (_DWORD)writeDebugData != objc_msgSend(v5, "writeDebugData")))
    {
LABEL_28:
      v45 = 0;
LABEL_29:

      goto LABEL_30;
    }
    debugDataPath = v40->_debugDataPath;
    v43 = debugDataPath;
    if (!debugDataPath)
    {
      objc_msgSend(v5, "debugDataPath");
      writeDebugData = objc_claimAutoreleasedReturnValue();
      if (!writeDebugData)
      {
        v44 = 0;
        goto LABEL_34;
      }
      v43 = v40->_debugDataPath;
    }
    objc_msgSend(v5, "debugDataPath");
    requiredExpressions = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v43, "isEqualToString:", requiredExpressions))
    {

      v45 = 0;
      goto LABEL_52;
    }
    v44 = 1;
LABEL_34:
    useLookAtForEyesForward = v40->_useLookAtForEyesForward;
    if (useLookAtForEyesForward != objc_msgSend(v5, "useLookAtForEyesForward"))
      goto LABEL_50;
    ensureEyesForwardOnFrontPose = v40->_ensureEyesForwardOnFrontPose;
    if (ensureEyesForwardOnFrontPose != objc_msgSend(v5, "ensureEyesForwardOnFrontPose"))
      goto LABEL_50;
    ensureEyesOpenOnFrontPose = v40->_ensureEyesOpenOnFrontPose;
    if (ensureEyesOpenOnFrontPose != objc_msgSend(v5, "ensureEyesOpenOnFrontPose"))
      goto LABEL_50;
    ensureEyesOpenOnNonFrontPose = v40->_ensureEyesOpenOnNonFrontPose;
    if (ensureEyesOpenOnNonFrontPose != objc_msgSend(v5, "ensureEyesOpenOnNonFrontPose")
      || (ensureNeutralExpressionOnFrontPose = v40->_ensureNeutralExpressionOnFrontPose,
          ensureNeutralExpressionOnFrontPose != objc_msgSend(v5, "ensureNeutralExpressionOnFrontPose"))
      || (ensureAlmostNeutralExpressionOnNonFrontPose = v40->_ensureAlmostNeutralExpressionOnNonFrontPose,
          ensureAlmostNeutralExpressionOnNonFrontPose != objc_msgSend(v5, "ensureAlmostNeutralExpressionOnNonFrontPose"))|| (useFaceTrackingDictionary = v40->_useFaceTrackingDictionary, useFaceTrackingDictionary != objc_msgSend(v5, "useFaceTrackingDictionary"))|| (useFKInternalFaceDetector = v40->_useFKInternalFaceDetector, useFKInternalFaceDetector != objc_msgSend(v5, "useFKInternalFaceDetector"))|| (useFKForceCPU = v40->_useFKForceCPU, useFKForceCPU != objc_msgSend(v5, "useFKForceCPU"))|| (convertFKTrackingDictToARKitDict = v40->_convertFKTrackingDictToARKitDict, convertFKTrackingDictToARKitDict != objc_msgSend(v5, "convertFKTrackingDictToARKitDict"))|| (sendMetrics = v40->_sendMetrics, sendMetrics != objc_msgSend(v5, "sendMetrics")))
    {
LABEL_50:
      v45 = 0;
      if ((v44 & 1) == 0)
        goto LABEL_52;
      goto LABEL_51;
    }
    cameraImageColorSpaceName = v40->_cameraImageColorSpaceName;
    v59 = cameraImageColorSpaceName;
    if (!cameraImageColorSpaceName)
    {
      objc_msgSend(v5, "cameraImageColorSpaceName");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v101)
      {
        v101 = 0;
        v102 = 0;
        goto LABEL_56;
      }
      v59 = v40->_cameraImageColorSpaceName;
    }
    objc_msgSend(v5, "cameraImageColorSpaceName");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v59, "isEqualToString:"))
    {

      v45 = 0;
      goto LABEL_73;
    }
    v102 = 1;
LABEL_56:
    useSimpleSelector = v40->_useSimpleSelector;
    if (useSimpleSelector != objc_msgSend(v5, "useSimpleSelector"))
      goto LABEL_70;
    simpleSelectorMinOffsetAngle = v40->_simpleSelectorMinOffsetAngle;
    objc_msgSend(v5, "simpleSelectorMinOffsetAngle");
    if (simpleSelectorMinOffsetAngle != v62)
      goto LABEL_70;
    simpleSelectorMaxOffsetAngle = v40->_simpleSelectorMaxOffsetAngle;
    objc_msgSend(v5, "simpleSelectorMaxOffsetAngle");
    if (simpleSelectorMaxOffsetAngle != v64)
      goto LABEL_70;
    useDistanceFilter = v40->_useDistanceFilter;
    if (useDistanceFilter != objc_msgSend(v5, "useDistanceFilter"))
      goto LABEL_70;
    distanceFilterCloseThreshold = v40->_distanceFilterCloseThreshold;
    objc_msgSend(v5, "distanceFilterCloseThreshold");
    if (distanceFilterCloseThreshold != v67
      || (distanceFilterFarThreshold = v40->_distanceFilterFarThreshold,
          objc_msgSend(v5, "distanceFilterFarThreshold"),
          distanceFilterFarThreshold != v69)
      || (useVNFilters = v40->_useVNFilters, useVNFilters != objc_msgSend(v5, "useVNFilters"))
      || (useVNFiltersEnrollment = v40->_useVNFiltersEnrollment,
          useVNFiltersEnrollment != objc_msgSend(v5, "useVNFiltersEnrollment"))
      || (vnFrontPoseBlinkThreshold = v40->_vnFrontPoseBlinkThreshold,
          objc_msgSend(v5, "vnFrontPoseBlinkThreshold"),
          vnFrontPoseBlinkThreshold != v73))
    {
LABEL_70:
      v45 = 0;
      goto LABEL_71;
    }
    bodyPoseGuidanceOptions = v40->_bodyPoseGuidanceOptions;
    v100 = bodyPoseGuidanceOptions;
    if (!bodyPoseGuidanceOptions)
    {
      objc_msgSend(v5, "bodyPoseGuidanceOptions");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v95)
      {
        v95 = 0;
        v98 = 0;
        goto LABEL_80;
      }
      bodyPoseGuidanceOptions = v40->_bodyPoseGuidanceOptions;
    }
    objc_msgSend(v5, "bodyPoseGuidanceOptions");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[VGBodyPoseGuidanceOptions isEqual:](bodyPoseGuidanceOptions, "isEqual:"))
    {
      v45 = 0;
      goto LABEL_112;
    }
    v98 = 1;
LABEL_80:
    selectionFrustum = v40->_selectionFrustum;
    v97 = selectionFrustum;
    if (!selectionFrustum)
    {
      objc_msgSend(v5, "selectionFrustum");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v91)
      {
        v91 = 0;
        v93 = 0;
        goto LABEL_87;
      }
      selectionFrustum = v40->_selectionFrustum;
    }
    objc_msgSend(v5, "selectionFrustum");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[VGFaceSelectionFrustum isEqual:](selectionFrustum, "isEqual:"))
    {
      v45 = 0;
      goto LABEL_109;
    }
    v93 = 1;
LABEL_87:
    frontPoseSelectionFrustum = v40->_frontPoseSelectionFrustum;
    v94 = frontPoseSelectionFrustum;
    if (!frontPoseSelectionFrustum)
    {
      objc_msgSend(v5, "frontPoseSelectionFrustum");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v89)
      {
        v89 = 0;
        v90 = 0;
        goto LABEL_94;
      }
      frontPoseSelectionFrustum = v40->_frontPoseSelectionFrustum;
    }
    objc_msgSend(v5, "frontPoseSelectionFrustum");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[VGFaceSelectionFrustum isEqual:](frontPoseSelectionFrustum, "isEqual:"))
    {
      v45 = 0;
      goto LABEL_106;
    }
    v90 = 1;
LABEL_94:
    useFovMarginsFilterFrontPose = v40->_useFovMarginsFilterFrontPose;
    if (useFovMarginsFilterFrontPose != objc_msgSend(v5, "useFovMarginsFilterFrontPose"))
      goto LABEL_105;
    useFovMarginsFilterNonFrontPose = v40->_useFovMarginsFilterNonFrontPose;
    if (useFovMarginsFilterNonFrontPose != objc_msgSend(v5, "useFovMarginsFilterNonFrontPose"))
      goto LABEL_105;
    useDepthFovFilter = v40->_useDepthFovFilter;
    if (useDepthFovFilter != objc_msgSend(v5, "useDepthFovFilter"))
      goto LABEL_105;
    useDepthFovFilterForBadAlignment = v40->_useDepthFovFilterForBadAlignment;
    if (useDepthFovFilterForBadAlignment == objc_msgSend(v5, "useDepthFovFilterForBadAlignment")
      && (useAmbientLightFilter = v40->_useAmbientLightFilter,
          useAmbientLightFilter == objc_msgSend(v5, "useAmbientLightFilter"))
      && (ambientLightFilterLowThreshold = v40->_ambientLightFilterLowThreshold,
          objc_msgSend(v5, "ambientLightFilterLowThreshold"),
          ambientLightFilterLowThreshold == v83)
      && (useTrackedFaceIdentifierFilter = v40->_useTrackedFaceIdentifierFilter,
          useTrackedFaceIdentifierFilter == objc_msgSend(v5, "useTrackedFaceIdentifierFilter"))
      && (useVNFaceLandmarksFilter = v40->_useVNFaceLandmarksFilter,
          useVNFaceLandmarksFilter == objc_msgSend(v5, "useVNFaceLandmarksFilter"))
      && (useMotionBlurFilter = v40->_useMotionBlurFilter,
          useMotionBlurFilter == objc_msgSend(v5, "useMotionBlurFilter")))
    {
      motionBlurThreshold = v40->_motionBlurThreshold;
      objc_msgSend(v5, "motionBlurThreshold");
      v45 = motionBlurThreshold == v88;
      if ((v90 & 1) == 0)
      {
LABEL_107:
        if (v94)
        {
          if (!v93)
            goto LABEL_110;
        }
        else
        {

          if ((v93 & 1) == 0)
          {
LABEL_110:
            if (v97)
            {
              if (!v98)
              {
LABEL_113:
                if (v100)
                {
                  if (!v102)
                  {
LABEL_73:
                    if (cameraImageColorSpaceName)
                    {
                      if (!v44)
                        goto LABEL_52;
                    }
                    else
                    {

                      if ((v44 & 1) == 0)
                      {
LABEL_52:
                        if (!debugDataPath)

                        goto LABEL_29;
                      }
                    }
LABEL_51:

                    goto LABEL_52;
                  }
LABEL_72:

                  goto LABEL_73;
                }

LABEL_71:
                if ((v102 & 1) == 0)
                  goto LABEL_73;
                goto LABEL_72;
              }
            }
            else
            {

              if ((v98 & 1) == 0)
                goto LABEL_113;
            }
LABEL_112:

            goto LABEL_113;
          }
        }
LABEL_109:

        goto LABEL_110;
      }
    }
    else
    {
LABEL_105:
      v45 = 0;
      if (!v90)
        goto LABEL_107;
    }
LABEL_106:

    goto LABEL_107;
  }
  v45 = 0;
LABEL_31:

  return v45;
}

- (id)toDictionary
{
  uint64_t v3;
  NSArray *requiredExpressions;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  const __CFString *debugDataPath;
  const __CFString *v22;
  uint64_t v23;
  NSString *cameraImageColorSpaceName;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  VGBodyPoseGuidanceOptions *bodyPoseGuidanceOptions;
  VGFaceSelectionFrustum *selectionFrustum;
  const __CFString *v32;
  VGFaceSelectionFrustum *frontPoseSelectionFrustum;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v48;
  __CFString *v49;
  void *v50;
  VGFaceSelectionFrustum *v51;
  VGFaceSelectionFrustum *v52;
  VGBodyPoseGuidanceOptions *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[53];
  _QWORD v93[55];

  v93[53] = *MEMORY[0x24BDAC8D0];
  v92[0] = CFSTR("requiredYawPoses");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_requiredYawPoses);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v91;
  v92[1] = CFSTR("requiredPitchPoses");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_requiredPitchPoses);
  v3 = objc_claimAutoreleasedReturnValue();
  requiredExpressions = self->_requiredExpressions;
  v90 = (void *)v3;
  v93[1] = v3;
  v93[2] = requiredExpressions;
  v92[2] = CFSTR("requiredExpressions");
  v92[3] = CFSTR("yawLimit");
  *(float *)&v5 = self->_yawLimit;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v89;
  v92[4] = CFSTR("pitchLimit");
  *(float *)&v6 = self->_pitchLimit;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v88;
  v92[5] = CFSTR("eyesForwardYawSensitivity");
  *(float *)&v7 = self->_eyesForwardYawSensitivity;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v87;
  v92[6] = CFSTR("eyesForwardPitchSensitivity");
  *(float *)&v8 = self->_eyesForwardPitchSensitivity;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = v86;
  v92[7] = CFSTR("leftMarginHeadRatio");
  *(float *)&v9 = self->_leftMarginHeadRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v93[7] = v85;
  v92[8] = CFSTR("rightMarginHeadRatio");
  *(float *)&v10 = self->_rightMarginHeadRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v93[8] = v84;
  v92[9] = CFSTR("topMarginHeadRatio");
  *(float *)&v11 = self->_topMarginHeadRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v93[9] = v83;
  v92[10] = CFSTR("bottomMarginHeadRatio");
  *(float *)&v12 = self->_bottomMarginHeadRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v93[10] = v82;
  v92[11] = CFSTR("leftMarginFrontPoseHeadRatio");
  *(float *)&v13 = self->_leftMarginFrontPoseHeadRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v93[11] = v81;
  v92[12] = CFSTR("rightMarginFrontPoseHeadRatio");
  *(float *)&v14 = self->_rightMarginFrontPoseHeadRatio;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v93[12] = v80;
  v92[13] = CFSTR("bottomMarginFrontPoseDelta");
  *(float *)&v15 = self->_bottomMarginFrontPoseDelta;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v93[13] = v79;
  v92[14] = CFSTR("bottomMarginPitchPoseDelta");
  *(float *)&v16 = self->_bottomMarginPitchPoseDelta;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v93[14] = v78;
  v92[15] = CFSTR("eyesOpenSensitivity");
  *(float *)&v17 = self->_eyesOpenSensitivity;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v93[15] = v77;
  v92[16] = CFSTR("neutralExpressionLowerBound");
  *(float *)&v18 = self->_neutralExpressionLowerBound;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v93[16] = v76;
  v92[17] = CFSTR("neutralExpressionUpperBound");
  *(float *)&v19 = self->_neutralExpressionUpperBound;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v93[17] = v75;
  v92[18] = CFSTR("writeDebugData");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_writeDebugData);
  v20 = objc_claimAutoreleasedReturnValue();
  debugDataPath = (const __CFString *)self->_debugDataPath;
  v22 = CFSTR("nil");
  if (!debugDataPath)
    debugDataPath = CFSTR("nil");
  v74 = (void *)v20;
  v93[18] = v20;
  v93[19] = debugDataPath;
  v92[19] = CFSTR("debugDataPath");
  v92[20] = CFSTR("useLookAtForEyesForward");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useLookAtForEyesForward);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v93[20] = v73;
  v92[21] = CFSTR("ensureEyesForwardOnFrontPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ensureEyesForwardOnFrontPose);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v93[21] = v72;
  v92[22] = CFSTR("ensureEyesOpenOnFrontPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ensureEyesOpenOnFrontPose);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v93[22] = v71;
  v92[23] = CFSTR("ensureEyesOpenOnNonFrontPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ensureEyesOpenOnNonFrontPose);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v93[23] = v70;
  v92[24] = CFSTR("ensureAlmostNeutralExpressionOnNonFrontPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_ensureAlmostNeutralExpressionOnNonFrontPose);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v93[24] = v69;
  v92[25] = CFSTR("useFaceTrackingDictionary");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useFaceTrackingDictionary);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v93[25] = v67;
  v92[26] = CFSTR("useFKInternalFaceDetector");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useFKInternalFaceDetector);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v93[26] = v66;
  v92[27] = CFSTR("useFKForceCPU");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useFKForceCPU);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v93[27] = v65;
  v92[28] = CFSTR("convertFKTrackingDictToARKitDict");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_convertFKTrackingDictToARKitDict);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v93[28] = v64;
  v92[29] = CFSTR("sendMetrics");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sendMetrics);
  v23 = objc_claimAutoreleasedReturnValue();
  cameraImageColorSpaceName = self->_cameraImageColorSpaceName;
  v63 = (void *)v23;
  v93[29] = v23;
  v93[30] = cameraImageColorSpaceName;
  v92[30] = CFSTR("cameraImageColorSpaceName");
  v92[31] = CFSTR("useSimpleSelector");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useSimpleSelector);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v93[31] = v62;
  v92[32] = CFSTR("simpleSelectorMinOffsetAngle");
  *(float *)&v25 = self->_simpleSelectorMinOffsetAngle;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v93[32] = v61;
  v92[33] = CFSTR("simpleSelectorMaxOffsetAngle");
  *(float *)&v26 = self->_simpleSelectorMaxOffsetAngle;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v93[33] = v60;
  v92[34] = CFSTR("useDistanceFilter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useDistanceFilter);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v93[34] = v59;
  v92[35] = CFSTR("distanceFilterCloseThreshold");
  *(float *)&v27 = self->_distanceFilterCloseThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v93[35] = v58;
  v92[36] = CFSTR("distanceFilterFarThreshold");
  *(float *)&v28 = self->_distanceFilterFarThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v93[36] = v57;
  v92[37] = CFSTR("useVNFilters");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useVNFilters);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v93[37] = v56;
  v92[38] = CFSTR("useVNFiltersEnrollment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useVNFiltersEnrollment);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v93[38] = v55;
  v92[39] = CFSTR("vnFrontPoseBlinkThreshold");
  *(float *)&v29 = self->_vnFrontPoseBlinkThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v93[39] = v54;
  v92[40] = CFSTR("bodyPoseGuidanceOptions");
  bodyPoseGuidanceOptions = self->_bodyPoseGuidanceOptions;
  v53 = bodyPoseGuidanceOptions;
  if (bodyPoseGuidanceOptions)
  {
    -[VGBodyPoseGuidanceOptions toDictionary](bodyPoseGuidanceOptions, "toDictionary");
    v22 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v93[40] = v22;
  v92[41] = CFSTR("selectionFrustum");
  selectionFrustum = self->_selectionFrustum;
  v52 = selectionFrustum;
  if (selectionFrustum)
  {
    -[VGFaceSelectionFrustum toDictionary](selectionFrustum, "toDictionary");
    v32 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = CFSTR("nil");
  }
  v49 = (__CFString *)v32;
  v93[41] = v32;
  v92[42] = CFSTR("frontPoseSelectionFrustum");
  frontPoseSelectionFrustum = self->_frontPoseSelectionFrustum;
  v68 = (__CFString *)v22;
  v51 = frontPoseSelectionFrustum;
  if (frontPoseSelectionFrustum)
  {
    -[VGFaceSelectionFrustum toDictionary](frontPoseSelectionFrustum, "toDictionary");
    v34 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = CFSTR("nil");
  }
  v93[42] = v34;
  v92[43] = CFSTR("useFovMarginsFilterFrontPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useFovMarginsFilterFrontPose, v34);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v93[43] = v50;
  v92[44] = CFSTR("useFovMarginsFilterNonFrontPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useFovMarginsFilterNonFrontPose);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v93[44] = v35;
  v92[45] = CFSTR("useDepthFovFilter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useDepthFovFilter);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v93[45] = v36;
  v92[46] = CFSTR("useDepthFovFilterForBadAlignment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useDepthFovFilterForBadAlignment);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v93[46] = v37;
  v92[47] = CFSTR("useAmbientLightFilter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useAmbientLightFilter);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v93[47] = v38;
  v92[48] = CFSTR("ambientLightFilterLowThreshold");
  *(float *)&v39 = self->_ambientLightFilterLowThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v93[48] = v40;
  v92[49] = CFSTR("useTrackedFaceIdentifierFilter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useTrackedFaceIdentifierFilter);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v93[49] = v41;
  v92[50] = CFSTR("useVNFaceLandmarksFilter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useVNFaceLandmarksFilter);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v93[50] = v42;
  v92[51] = CFSTR("useMotionBlurFilter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useMotionBlurFilter);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v93[51] = v43;
  v92[52] = CFSTR("motionBlurThreshold");
  *(float *)&v44 = self->_motionBlurThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v93[52] = v45;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 53);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  if (v52)

  if (v53)
  return v46;
}

- (unint64_t)requiredYawPoses
{
  return self->_requiredYawPoses;
}

- (void)setRequiredYawPoses:(unint64_t)a3
{
  self->_requiredYawPoses = a3;
}

- (unint64_t)requiredPitchPoses
{
  return self->_requiredPitchPoses;
}

- (void)setRequiredPitchPoses:(unint64_t)a3
{
  self->_requiredPitchPoses = a3;
}

- (NSArray)requiredExpressions
{
  return self->_requiredExpressions;
}

- (void)setRequiredExpressions:(id)a3
{
  objc_storeStrong((id *)&self->_requiredExpressions, a3);
}

- (float)yawLimit
{
  return self->_yawLimit;
}

- (void)setYawLimit:(float)a3
{
  self->_yawLimit = a3;
}

- (float)pitchLimit
{
  return self->_pitchLimit;
}

- (void)setPitchLimit:(float)a3
{
  self->_pitchLimit = a3;
}

- (float)eyesForwardYawSensitivity
{
  return self->_eyesForwardYawSensitivity;
}

- (void)setEyesForwardYawSensitivity:(float)a3
{
  self->_eyesForwardYawSensitivity = a3;
}

- (float)eyesForwardPitchSensitivity
{
  return self->_eyesForwardPitchSensitivity;
}

- (void)setEyesForwardPitchSensitivity:(float)a3
{
  self->_eyesForwardPitchSensitivity = a3;
}

- (float)eyesOpenSensitivity
{
  return self->_eyesOpenSensitivity;
}

- (void)setEyesOpenSensitivity:(float)a3
{
  self->_eyesOpenSensitivity = a3;
}

- (float)neutralExpressionLowerBound
{
  return self->_neutralExpressionLowerBound;
}

- (void)setNeutralExpressionLowerBound:(float)a3
{
  self->_neutralExpressionLowerBound = a3;
}

- (float)neutralExpressionUpperBound
{
  return self->_neutralExpressionUpperBound;
}

- (void)setNeutralExpressionUpperBound:(float)a3
{
  self->_neutralExpressionUpperBound = a3;
}

- (BOOL)useFovMarginsFilterFrontPose
{
  return self->_useFovMarginsFilterFrontPose;
}

- (void)setUseFovMarginsFilterFrontPose:(BOOL)a3
{
  self->_useFovMarginsFilterFrontPose = a3;
}

- (BOOL)useFovMarginsFilterNonFrontPose
{
  return self->_useFovMarginsFilterNonFrontPose;
}

- (void)setUseFovMarginsFilterNonFrontPose:(BOOL)a3
{
  self->_useFovMarginsFilterNonFrontPose = a3;
}

- (float)leftMarginHeadRatio
{
  return self->_leftMarginHeadRatio;
}

- (void)setLeftMarginHeadRatio:(float)a3
{
  self->_leftMarginHeadRatio = a3;
}

- (float)rightMarginHeadRatio
{
  return self->_rightMarginHeadRatio;
}

- (void)setRightMarginHeadRatio:(float)a3
{
  self->_rightMarginHeadRatio = a3;
}

- (float)topMarginHeadRatio
{
  return self->_topMarginHeadRatio;
}

- (void)setTopMarginHeadRatio:(float)a3
{
  self->_topMarginHeadRatio = a3;
}

- (float)bottomMarginHeadRatio
{
  return self->_bottomMarginHeadRatio;
}

- (void)setBottomMarginHeadRatio:(float)a3
{
  self->_bottomMarginHeadRatio = a3;
}

- (float)leftMarginFrontPoseHeadRatio
{
  return self->_leftMarginFrontPoseHeadRatio;
}

- (void)setLeftMarginFrontPoseHeadRatio:(float)a3
{
  self->_leftMarginFrontPoseHeadRatio = a3;
}

- (float)rightMarginFrontPoseHeadRatio
{
  return self->_rightMarginFrontPoseHeadRatio;
}

- (void)setRightMarginFrontPoseHeadRatio:(float)a3
{
  self->_rightMarginFrontPoseHeadRatio = a3;
}

- (float)bottomMarginFrontPoseDelta
{
  return self->_bottomMarginFrontPoseDelta;
}

- (void)setBottomMarginFrontPoseDelta:(float)a3
{
  self->_bottomMarginFrontPoseDelta = a3;
}

- (float)bottomMarginPitchPoseDelta
{
  return self->_bottomMarginPitchPoseDelta;
}

- (void)setBottomMarginPitchPoseDelta:(float)a3
{
  self->_bottomMarginPitchPoseDelta = a3;
}

- (BOOL)writeDebugData
{
  return self->_writeDebugData;
}

- (void)setWriteDebugData:(BOOL)a3
{
  self->_writeDebugData = a3;
}

- (NSString)debugDataPath
{
  return self->_debugDataPath;
}

- (void)setDebugDataPath:(id)a3
{
  objc_storeStrong((id *)&self->_debugDataPath, a3);
}

- (BOOL)useLookAtForEyesForward
{
  return self->_useLookAtForEyesForward;
}

- (void)setUseLookAtForEyesForward:(BOOL)a3
{
  self->_useLookAtForEyesForward = a3;
}

- (BOOL)ensureEyesForwardOnFrontPose
{
  return self->_ensureEyesForwardOnFrontPose;
}

- (void)setEnsureEyesForwardOnFrontPose:(BOOL)a3
{
  self->_ensureEyesForwardOnFrontPose = a3;
}

- (BOOL)ensureEyesOpenOnFrontPose
{
  return self->_ensureEyesOpenOnFrontPose;
}

- (void)setEnsureEyesOpenOnFrontPose:(BOOL)a3
{
  self->_ensureEyesOpenOnFrontPose = a3;
}

- (BOOL)ensureEyesOpenOnNonFrontPose
{
  return self->_ensureEyesOpenOnNonFrontPose;
}

- (void)setEnsureEyesOpenOnNonFrontPose:(BOOL)a3
{
  self->_ensureEyesOpenOnNonFrontPose = a3;
}

- (BOOL)ensureNeutralExpressionOnFrontPose
{
  return self->_ensureNeutralExpressionOnFrontPose;
}

- (void)setEnsureNeutralExpressionOnFrontPose:(BOOL)a3
{
  self->_ensureNeutralExpressionOnFrontPose = a3;
}

- (BOOL)ensureAlmostNeutralExpressionOnNonFrontPose
{
  return self->_ensureAlmostNeutralExpressionOnNonFrontPose;
}

- (void)setEnsureAlmostNeutralExpressionOnNonFrontPose:(BOOL)a3
{
  self->_ensureAlmostNeutralExpressionOnNonFrontPose = a3;
}

- (BOOL)useFaceTrackingDictionary
{
  return self->_useFaceTrackingDictionary;
}

- (void)setUseFaceTrackingDictionary:(BOOL)a3
{
  self->_useFaceTrackingDictionary = a3;
}

- (BOOL)useFKInternalFaceDetector
{
  return self->_useFKInternalFaceDetector;
}

- (void)setUseFKInternalFaceDetector:(BOOL)a3
{
  self->_useFKInternalFaceDetector = a3;
}

- (BOOL)useFKForceCPU
{
  return self->_useFKForceCPU;
}

- (void)setUseFKForceCPU:(BOOL)a3
{
  self->_useFKForceCPU = a3;
}

- (BOOL)convertFKTrackingDictToARKitDict
{
  return self->_convertFKTrackingDictToARKitDict;
}

- (void)setConvertFKTrackingDictToARKitDict:(BOOL)a3
{
  self->_convertFKTrackingDictToARKitDict = a3;
}

- (BOOL)sendMetrics
{
  return self->_sendMetrics;
}

- (void)setSendMetrics:(BOOL)a3
{
  self->_sendMetrics = a3;
}

- (NSString)cameraImageColorSpaceName
{
  return self->_cameraImageColorSpaceName;
}

- (void)setCameraImageColorSpaceName:(id)a3
{
  objc_storeStrong((id *)&self->_cameraImageColorSpaceName, a3);
}

- (BOOL)useSimpleSelector
{
  return self->_useSimpleSelector;
}

- (void)setUseSimpleSelector:(BOOL)a3
{
  self->_useSimpleSelector = a3;
}

- (float)simpleSelectorMinOffsetAngle
{
  return self->_simpleSelectorMinOffsetAngle;
}

- (void)setSimpleSelectorMinOffsetAngle:(float)a3
{
  self->_simpleSelectorMinOffsetAngle = a3;
}

- (float)simpleSelectorMaxOffsetAngle
{
  return self->_simpleSelectorMaxOffsetAngle;
}

- (void)setSimpleSelectorMaxOffsetAngle:(float)a3
{
  self->_simpleSelectorMaxOffsetAngle = a3;
}

- (BOOL)useDistanceFilter
{
  return self->_useDistanceFilter;
}

- (void)setUseDistanceFilter:(BOOL)a3
{
  self->_useDistanceFilter = a3;
}

- (float)distanceFilterCloseThreshold
{
  return self->_distanceFilterCloseThreshold;
}

- (void)setDistanceFilterCloseThreshold:(float)a3
{
  self->_distanceFilterCloseThreshold = a3;
}

- (float)distanceFilterFarThreshold
{
  return self->_distanceFilterFarThreshold;
}

- (void)setDistanceFilterFarThreshold:(float)a3
{
  self->_distanceFilterFarThreshold = a3;
}

- (VGBodyPoseGuidanceOptions)bodyPoseGuidanceOptions
{
  return self->_bodyPoseGuidanceOptions;
}

- (void)setBodyPoseGuidanceOptions:(id)a3
{
  objc_storeStrong((id *)&self->_bodyPoseGuidanceOptions, a3);
}

- (VGFaceSelectionFrustum)selectionFrustum
{
  return self->_selectionFrustum;
}

- (void)setSelectionFrustum:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFrustum, a3);
}

- (VGFaceSelectionFrustum)frontPoseSelectionFrustum
{
  return self->_frontPoseSelectionFrustum;
}

- (void)setFrontPoseSelectionFrustum:(id)a3
{
  objc_storeStrong((id *)&self->_frontPoseSelectionFrustum, a3);
}

- (BOOL)useVNFilters
{
  return self->_useVNFilters;
}

- (void)setUseVNFilters:(BOOL)a3
{
  self->_useVNFilters = a3;
}

- (BOOL)useVNFiltersEnrollment
{
  return self->_useVNFiltersEnrollment;
}

- (void)setUseVNFiltersEnrollment:(BOOL)a3
{
  self->_useVNFiltersEnrollment = a3;
}

- (float)vnFrontPoseBlinkThreshold
{
  return self->_vnFrontPoseBlinkThreshold;
}

- (void)setVnFrontPoseBlinkThreshold:(float)a3
{
  self->_vnFrontPoseBlinkThreshold = a3;
}

- (BOOL)useDepthFovFilter
{
  return self->_useDepthFovFilter;
}

- (void)setUseDepthFovFilter:(BOOL)a3
{
  self->_useDepthFovFilter = a3;
}

- (BOOL)useDepthFovFilterForBadAlignment
{
  return self->_useDepthFovFilterForBadAlignment;
}

- (void)setUseDepthFovFilterForBadAlignment:(BOOL)a3
{
  self->_useDepthFovFilterForBadAlignment = a3;
}

- (BOOL)useAmbientLightFilter
{
  return self->_useAmbientLightFilter;
}

- (void)setUseAmbientLightFilter:(BOOL)a3
{
  self->_useAmbientLightFilter = a3;
}

- (float)ambientLightFilterLowThreshold
{
  return self->_ambientLightFilterLowThreshold;
}

- (void)setAmbientLightFilterLowThreshold:(float)a3
{
  self->_ambientLightFilterLowThreshold = a3;
}

- (BOOL)useTrackedFaceIdentifierFilter
{
  return self->_useTrackedFaceIdentifierFilter;
}

- (void)setUseTrackedFaceIdentifierFilter:(BOOL)a3
{
  self->_useTrackedFaceIdentifierFilter = a3;
}

- (BOOL)useVNFaceLandmarksFilter
{
  return self->_useVNFaceLandmarksFilter;
}

- (void)setUseVNFaceLandmarksFilter:(BOOL)a3
{
  self->_useVNFaceLandmarksFilter = a3;
}

- (BOOL)useMotionBlurFilter
{
  return self->_useMotionBlurFilter;
}

- (void)setUseMotionBlurFilter:(BOOL)a3
{
  self->_useMotionBlurFilter = a3;
}

- (float)motionBlurThreshold
{
  return self->_motionBlurThreshold;
}

- (void)setMotionBlurThreshold:(float)a3
{
  self->_motionBlurThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontPoseSelectionFrustum, 0);
  objc_storeStrong((id *)&self->_selectionFrustum, 0);
  objc_storeStrong((id *)&self->_bodyPoseGuidanceOptions, 0);
  objc_storeStrong((id *)&self->_cameraImageColorSpaceName, 0);
  objc_storeStrong((id *)&self->_debugDataPath, 0);
  objc_storeStrong((id *)&self->_requiredExpressions, 0);
}

@end
