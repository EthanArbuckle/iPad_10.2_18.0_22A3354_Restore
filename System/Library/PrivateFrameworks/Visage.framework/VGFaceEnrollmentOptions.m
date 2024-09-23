@implementation VGFaceEnrollmentOptions

- (VGFaceEnrollmentOptions)init
{
  VGFaceEnrollmentOptions *v2;
  VGFaceEnrollmentOptions *v3;
  VGFaceCaptureOptions *v4;
  VGFaceCaptureOptions *captureOptions;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  VGFaceEnrollmentOptions *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)VGFaceEnrollmentOptions;
  v2 = -[VGFaceEnrollmentOptions init](&v39, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_identityFittingOp = 0;
    *(_WORD *)&v2->_applyBaconLighting = 1;
    v2->_enrollmentMode = 0;
    *(_DWORD *)&v2->_generatePIFu = 16842753;
    v4 = objc_alloc_init(VGFaceCaptureOptions);
    captureOptions = v3->_captureOptions;
    v3->_captureOptions = v4;

    -[VGFaceCaptureOptions setRequiredYawPoses:](v3->_captureOptions, "setRequiredYawPoses:", 3);
    -[VGFaceCaptureOptions setRequiredPitchPoses:](v3->_captureOptions, "setRequiredPitchPoses:", 0);
    -[VGFaceCaptureOptions setRequiredExpressions:](v3->_captureOptions, "setRequiredExpressions:", MEMORY[0x24BDBD1A8]);
    LODWORD(v6) = 30.0;
    -[VGFaceCaptureOptions setYawLimit:](v3->_captureOptions, "setYawLimit:", v6);
    LODWORD(v7) = 1102315520;
    -[VGFaceCaptureOptions setPitchLimit:](v3->_captureOptions, "setPitchLimit:", v7);
    LODWORD(v8) = 4.0;
    -[VGFaceCaptureOptions setEyesForwardYawSensitivity:](v3->_captureOptions, "setEyesForwardYawSensitivity:", v8);
    LODWORD(v9) = 6.0;
    -[VGFaceCaptureOptions setEyesForwardPitchSensitivity:](v3->_captureOptions, "setEyesForwardPitchSensitivity:", v9);
    -[VGFaceCaptureOptions setUseFovMarginsFilterFrontPose:](v3->_captureOptions, "setUseFovMarginsFilterFrontPose:", 1);
    -[VGFaceCaptureOptions setUseFovMarginsFilterNonFrontPose:](v3->_captureOptions, "setUseFovMarginsFilterNonFrontPose:", 0);
    LODWORD(v10) = 0.25;
    -[VGFaceCaptureOptions setLeftMarginHeadRatio:](v3->_captureOptions, "setLeftMarginHeadRatio:", v10);
    LODWORD(v11) = 0.25;
    -[VGFaceCaptureOptions setRightMarginHeadRatio:](v3->_captureOptions, "setRightMarginHeadRatio:", v11);
    LODWORD(v12) = 0.25;
    -[VGFaceCaptureOptions setTopMarginHeadRatio:](v3->_captureOptions, "setTopMarginHeadRatio:", v12);
    LODWORD(v13) = 0.75;
    -[VGFaceCaptureOptions setBottomMarginHeadRatio:](v3->_captureOptions, "setBottomMarginHeadRatio:", v13);
    LODWORD(v14) = 0.25;
    -[VGFaceCaptureOptions setLeftMarginFrontPoseHeadRatio:](v3->_captureOptions, "setLeftMarginFrontPoseHeadRatio:", v14);
    LODWORD(v15) = 0.25;
    -[VGFaceCaptureOptions setRightMarginFrontPoseHeadRatio:](v3->_captureOptions, "setRightMarginFrontPoseHeadRatio:", v15);
    LODWORD(v16) = 0.25;
    -[VGFaceCaptureOptions setBottomMarginFrontPoseDelta:](v3->_captureOptions, "setBottomMarginFrontPoseDelta:", v16);
    LODWORD(v17) = -0.5;
    -[VGFaceCaptureOptions setBottomMarginPitchPoseDelta:](v3->_captureOptions, "setBottomMarginPitchPoseDelta:", v17);
    LODWORD(v18) = 1050253722;
    -[VGFaceCaptureOptions setEyesOpenSensitivity:](v3->_captureOptions, "setEyesOpenSensitivity:", v18);
    LODWORD(v19) = 0.5;
    -[VGFaceCaptureOptions setNeutralExpressionLowerBound:](v3->_captureOptions, "setNeutralExpressionLowerBound:", v19);
    LODWORD(v20) = 1058642330;
    -[VGFaceCaptureOptions setNeutralExpressionUpperBound:](v3->_captureOptions, "setNeutralExpressionUpperBound:", v20);
    -[VGFaceCaptureOptions setUseLookAtForEyesForward:](v3->_captureOptions, "setUseLookAtForEyesForward:", 1);
    -[VGFaceCaptureOptions setEnsureEyesForwardOnFrontPose:](v3->_captureOptions, "setEnsureEyesForwardOnFrontPose:", 1);
    -[VGFaceCaptureOptions setEnsureEyesOpenOnFrontPose:](v3->_captureOptions, "setEnsureEyesOpenOnFrontPose:", 1);
    -[VGFaceCaptureOptions setEnsureEyesOpenOnNonFrontPose:](v3->_captureOptions, "setEnsureEyesOpenOnNonFrontPose:", 0);
    -[VGFaceCaptureOptions setEnsureNeutralExpressionOnFrontPose:](v3->_captureOptions, "setEnsureNeutralExpressionOnFrontPose:", 1);
    -[VGFaceCaptureOptions setEnsureAlmostNeutralExpressionOnNonFrontPose:](v3->_captureOptions, "setEnsureAlmostNeutralExpressionOnNonFrontPose:", 0);
    -[VGFaceCaptureOptions setUseFaceTrackingDictionary:](v3->_captureOptions, "setUseFaceTrackingDictionary:", 1);
    -[VGFaceCaptureOptions setUseFKInternalFaceDetector:](v3->_captureOptions, "setUseFKInternalFaceDetector:", 0);
    -[VGFaceCaptureOptions setUseFKForceCPU:](v3->_captureOptions, "setUseFKForceCPU:", 0);
    -[VGFaceCaptureOptions setSendMetrics:](v3->_captureOptions, "setSendMetrics:", 1);
    -[VGFaceCaptureOptions setCameraImageColorSpaceName:](v3->_captureOptions, "setCameraImageColorSpaceName:", *MEMORY[0x24BDBF318]);
    -[VGFaceCaptureOptions setUseSimpleSelector:](v3->_captureOptions, "setUseSimpleSelector:", 0);
    LODWORD(v21) = 20.0;
    -[VGFaceCaptureOptions setSimpleSelectorMinOffsetAngle:](v3->_captureOptions, "setSimpleSelectorMinOffsetAngle:", v21);
    LODWORD(v22) = 1117782016;
    -[VGFaceCaptureOptions setSimpleSelectorMaxOffsetAngle:](v3->_captureOptions, "setSimpleSelectorMaxOffsetAngle:", v22);
    -[VGFaceCaptureOptions setUseDistanceFilter:](v3->_captureOptions, "setUseDistanceFilter:", 1);
    LODWORD(v23) = 20.0;
    -[VGFaceCaptureOptions setDistanceFilterCloseThreshold:](v3->_captureOptions, "setDistanceFilterCloseThreshold:", v23);
    LODWORD(v24) = 1114636288;
    -[VGFaceCaptureOptions setDistanceFilterFarThreshold:](v3->_captureOptions, "setDistanceFilterFarThreshold:", v24);
    -[VGFaceCaptureOptions setUseVNFilters:](v3->_captureOptions, "setUseVNFilters:", 1);
    -[VGFaceCaptureOptions setUseVNFiltersEnrollment:](v3->_captureOptions, "setUseVNFiltersEnrollment:", 0);
    LODWORD(v25) = 1058642330;
    -[VGFaceCaptureOptions setVnFrontPoseBlinkThreshold:](v3->_captureOptions, "setVnFrontPoseBlinkThreshold:", v25);
    -[VGFaceCaptureOptions setUseDepthFovFilter:](v3->_captureOptions, "setUseDepthFovFilter:", 1);
    v26 = (void *)objc_opt_new();
    -[VGFaceCaptureOptions setBodyPoseGuidanceOptions:](v3->_captureOptions, "setBodyPoseGuidanceOptions:", v26);

    v27 = (void *)objc_opt_new();
    -[VGFaceCaptureOptions setSelectionFrustum:](v3->_captureOptions, "setSelectionFrustum:", v27);

    v28 = (void *)objc_opt_new();
    -[VGFaceCaptureOptions setFrontPoseSelectionFrustum:](v3->_captureOptions, "setFrontPoseSelectionFrustum:", v28);

    -[VGFaceCaptureOptions frontPoseSelectionFrustum](v3->_captureOptions, "frontPoseSelectionFrustum");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 7.0;
    objc_msgSend(v29, "setYawOffsetLeft:", v30);

    -[VGFaceCaptureOptions frontPoseSelectionFrustum](v3->_captureOptions, "frontPoseSelectionFrustum");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 7.0;
    objc_msgSend(v31, "setYawOffsetRight:", v32);

    -[VGFaceCaptureOptions frontPoseSelectionFrustum](v3->_captureOptions, "frontPoseSelectionFrustum");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = 7.0;
    objc_msgSend(v33, "setPitchOffsetTop:", v34);

    -[VGFaceCaptureOptions frontPoseSelectionFrustum](v3->_captureOptions, "frontPoseSelectionFrustum");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 7.0;
    objc_msgSend(v35, "setPitchOffsetBottom:", v36);

    -[VGFaceEnrollmentOptions _setDefaultsWithSuiteName:](v3, "_setDefaultsWithSuiteName:", CFSTR("com.apple.visage"));
    v37 = v3;
  }

  return v3;
}

- (void)_setDefaultsWithSuiteName:(id)a3
{
  VGFaceCaptureOptions *captureOptions;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t identityFittingOp;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  NSObject *v33;
  int v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  captureOptions = self->_captureOptions;
  v5 = a3;
  -[VGFaceCaptureOptions setDefaultsWithSuiteName:](captureOptions, "setDefaultsWithSuiteName:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v5);

  objc_msgSend(v6, "objectForKey:", CFSTR("identityFittingOp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v6, "integerForKey:", CFSTR("identityFittingOp"));
    if (v8 < 3)
    {
      self->_identityFittingOp = v8;
    }
    else
    {
      __VGLogSharedInstance();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        identityFittingOp = self->_identityFittingOp;
        v34 = 134218240;
        v35 = identityFittingOp;
        v36 = 2048;
        v37 = 3;
        _os_log_impl(&dword_249CAD000, v9, OS_LOG_TYPE_ERROR, " Unsupported VGidentityFittingOp. Value set for <identityFittingOp : %lu> higher than max options [%lu]. ", (uint8_t *)&v34, 0x16u);
      }

    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("generatePIFu"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    self->_generatePIFu = objc_msgSend(v6, "BOOLForKey:", CFSTR("generatePIFu"));
  self->_generateSplats = objc_msgSend(v6, "BOOLForKey:", CFSTR("generateSplats"));
  objc_msgSend(v6, "objectForKey:", CFSTR("generateBaconPanel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    self->_generateBaconPanel = objc_msgSend(v6, "BOOLForKey:", CFSTR("generateBaconPanel"));
  objc_msgSend(v6, "objectForKey:", CFSTR("useHighResCameraImage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    self->_useHighResCameraImage = objc_msgSend(v6, "BOOLForKey:", CFSTR("useHighResCameraImage"));
  objc_msgSend(v6, "objectForKey:", CFSTR("applyBaconLighting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    self->_applyBaconLighting = objc_msgSend(v6, "BOOLForKey:", CFSTR("applyBaconLighting"));
  objc_msgSend(v6, "objectForKey:", CFSTR("deterministicMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    self->_deterministicMode = objc_msgSend(v6, "BOOLForKey:", CFSTR("deterministicMode"));
  objc_msgSend(v6, "objectForKey:", CFSTR("useFovMarginsFilterFrontPose"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[VGFaceCaptureOptions setUseFovMarginsFilterFrontPose:](self->_captureOptions, "setUseFovMarginsFilterFrontPose:", objc_msgSend(v6, "BOOLForKey:", CFSTR("useFovMarginsFilterFrontPose")));
  objc_msgSend(v6, "objectForKey:", CFSTR("useFovMarginsFilterNonFrontPose"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    -[VGFaceCaptureOptions setUseFovMarginsFilterNonFrontPose:](self->_captureOptions, "setUseFovMarginsFilterNonFrontPose:", objc_msgSend(v6, "BOOLForKey:", CFSTR("useFovMarginsFilterNonFrontPose")));
  objc_msgSend(v6, "objectForKey:", CFSTR("leftMarginHeadRatio"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("leftMarginHeadRatio"));
    -[VGFaceCaptureOptions setLeftMarginHeadRatio:](self->_captureOptions, "setLeftMarginHeadRatio:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("rightMarginHeadRatio"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("rightMarginHeadRatio"));
    -[VGFaceCaptureOptions setRightMarginHeadRatio:](self->_captureOptions, "setRightMarginHeadRatio:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("topMarginHeadRatio"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("topMarginHeadRatio"));
    -[VGFaceCaptureOptions setTopMarginHeadRatio:](self->_captureOptions, "setTopMarginHeadRatio:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("bottomMarginHeadRatio"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("bottomMarginHeadRatio"));
    -[VGFaceCaptureOptions setBottomMarginHeadRatio:](self->_captureOptions, "setBottomMarginHeadRatio:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("leftMarginFrontPoseHeadRatio"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("leftMarginFrontPoseHeadRatio"));
    -[VGFaceCaptureOptions setLeftMarginFrontPoseHeadRatio:](self->_captureOptions, "setLeftMarginFrontPoseHeadRatio:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("rightMarginFrontPoseHeadRatio"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("rightMarginFrontPoseHeadRatio"));
    -[VGFaceCaptureOptions setRightMarginFrontPoseHeadRatio:](self->_captureOptions, "setRightMarginFrontPoseHeadRatio:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("bottomMarginFrontPoseDelta"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("bottomMarginFrontPoseDelta"));
    -[VGFaceCaptureOptions setBottomMarginFrontPoseDelta:](self->_captureOptions, "setBottomMarginFrontPoseDelta:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("bottomMarginPitchPoseDelta"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v6, "floatForKey:", CFSTR("bottomMarginPitchPoseDelta"));
    -[VGFaceCaptureOptions setBottomMarginPitchPoseDelta:](self->_captureOptions, "setBottomMarginPitchPoseDelta:");
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("symmetricFrontPose"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26 && objc_msgSend(v6, "BOOLForKey:", CFSTR("symmetricFrontPose")))
  {
    __VGLogSharedInstance();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_249CAD000, v27, OS_LOG_TYPE_DEBUG, " Using capture option settings (margin head ratio) for ensuring symmetric front pose ", (uint8_t *)&v34, 2u);
    }

    LODWORD(v28) = 1059481190;
    -[VGFaceCaptureOptions setLeftMarginFrontPoseHeadRatio:](self->_captureOptions, "setLeftMarginFrontPoseHeadRatio:", v28);
    LODWORD(v29) = 1059481190;
    -[VGFaceCaptureOptions setRightMarginFrontPoseHeadRatio:](self->_captureOptions, "setRightMarginFrontPoseHeadRatio:", v29);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("enrollmentMode"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_msgSend(v6, "integerForKey:", CFSTR("enrollmentMode"));
    v32 = v31;
    if (v31 < 2)
    {
      self->_enrollmentMode = v31;
    }
    else
    {
      __VGLogSharedInstance();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = 134218240;
        v35 = v32;
        v36 = 2048;
        v37 = 2;
        _os_log_impl(&dword_249CAD000, v33, OS_LOG_TYPE_ERROR, " Unsupported VGEnrollmentMode. Value set for <enrollmentMode : %lu> higher than max options [%lu]. ", (uint8_t *)&v34, 0x16u);
      }

    }
  }

}

- (unint64_t)requiredYawPoses
{
  void *v2;
  unint64_t v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiredYawPoses");

  return v3;
}

- (void)setRequiredYawPoses:(unint64_t)a3
{
  id v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiredYawPoses:", a3);

}

- (unint64_t)requiredPitchPoses
{
  void *v2;
  unint64_t v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiredPitchPoses");

  return v3;
}

- (void)setRequiredPitchPoses:(unint64_t)a3
{
  id v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiredPitchPoses:", a3);

}

- (NSArray)requiredExpressions
{
  void *v2;
  void *v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requiredExpressions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setRequiredExpressions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequiredExpressions:", v4);

}

- (float)yawLimit
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yawLimit");
  v4 = v3;

  return v4;
}

- (void)setYawLimit:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setYawLimit:", v4);

}

- (float)pitchLimit
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pitchLimit");
  v4 = v3;

  return v4;
}

- (void)setPitchLimit:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setPitchLimit:", v4);

}

- (float)eyesForwardYawSensitivity
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eyesForwardYawSensitivity");
  v4 = v3;

  return v4;
}

- (float)eyesForwardPitchSensitivity
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eyesForwardPitchSensitivity");
  v4 = v3;

  return v4;
}

- (float)eyesOpenSensitivity
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eyesOpenSensitivity");
  v4 = v3;

  return v4;
}

- (void)setEyesForwardYawSensitivity:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setEyesForwardYawSensitivity:", v4);

}

- (float)neutralExpressionLowerBound
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "neutralExpressionLowerBound");
  v4 = v3;

  return v4;
}

- (void)setNeutralExpressionLowerBound:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setNeutralExpressionLowerBound:", v4);

}

- (float)neutralExpressionUpperBound
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "neutralExpressionUpperBound");
  v4 = v3;

  return v4;
}

- (void)setNeutralExpressionUpperBound:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setNeutralExpressionUpperBound:", v4);

}

- (void)setEyesForwardPitchSensitivity:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setEyesForwardPitchSensitivity:", v4);

}

- (BOOL)useFovMarginsFilterFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useFovMarginsFilterFrontPose");

  return v3;
}

- (void)setUseFovMarginsFilterFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseFovMarginsFilterFrontPose:", v3);

}

- (BOOL)useFovMarginsFilterNonFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useFovMarginsFilterNonFrontPose");

  return v3;
}

- (void)setUseFovMarginsFilterNonFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseFovMarginsFilterNonFrontPose:", v3);

}

- (float)leftMarginHeadRatio
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftMarginHeadRatio");
  v4 = v3;

  return v4;
}

- (void)setLeftMarginHeadRatio:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setLeftMarginHeadRatio:", v4);

}

- (float)rightMarginHeadRatio
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightMarginHeadRatio");
  v4 = v3;

  return v4;
}

- (void)setRightMarginHeadRatio:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRightMarginHeadRatio:", v4);

}

- (float)topMarginHeadRatio
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topMarginHeadRatio");
  v4 = v3;

  return v4;
}

- (void)setTopMarginHeadRatio:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setTopMarginHeadRatio:", v4);

}

- (float)bottomMarginHeadRatio
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomMarginHeadRatio");
  v4 = v3;

  return v4;
}

- (void)setBottomMarginHeadRatio:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setBottomMarginHeadRatio:", v4);

}

- (float)leftMarginFrontPoseHeadRatio
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leftMarginFrontPoseHeadRatio");
  v4 = v3;

  return v4;
}

- (void)setLeftMarginFrontPoseHeadRatio:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setLeftMarginFrontPoseHeadRatio:", v4);

}

- (float)rightMarginFrontPoseHeadRatio
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightMarginFrontPoseHeadRatio");
  v4 = v3;

  return v4;
}

- (void)setRightMarginFrontPoseHeadRatio:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRightMarginFrontPoseHeadRatio:", v4);

}

- (float)bottomMarginFrontPoseDelta
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomMarginFrontPoseDelta");
  v4 = v3;

  return v4;
}

- (void)setBottomMarginFrontPoseDelta:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setBottomMarginFrontPoseDelta:", v4);

}

- (float)bottomMarginPitchPoseDelta
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomMarginPitchPoseDelta");
  v4 = v3;

  return v4;
}

- (void)setBottomMarginPitchPoseDelta:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setBottomMarginPitchPoseDelta:", v4);

}

- (void)setEyesOpenSensitivity:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setEyesOpenSensitivity:", v4);

}

- (BOOL)useLookAtForEyesForward
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useLookAtForEyesForward");

  return v3;
}

- (void)setUseLookAtForEyesForward:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseLookAtForEyesForward:", v3);

}

- (BOOL)ensureEyesForwardOnFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureEyesForwardOnFrontPose");

  return v3;
}

- (void)setEnsureEyesForwardOnFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureEyesForwardOnFrontPose:", v3);

}

- (BOOL)ensureEyesOpenOnFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureEyesOpenOnFrontPose");

  return v3;
}

- (void)setEnsureEyesOpenOnFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureEyesOpenOnFrontPose:", v3);

}

- (BOOL)ensureEyesOpenOnAllPoses
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureEyesOpenOnNonFrontPose");

  return v3;
}

- (void)setEnsureEyesOpenOnAllPoses:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureEyesOpenOnNonFrontPose:", v3);

}

- (BOOL)ensureEyesOpenOnNonFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureEyesOpenOnNonFrontPose");

  return v3;
}

- (void)setEnsureEyesOpenOnNonFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureEyesOpenOnNonFrontPose:", v3);

}

- (BOOL)ensureAlmostNeutralExpressionOnAllPoses
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureAlmostNeutralExpressionOnNonFrontPose");

  return v3;
}

- (void)setEnsureAlmostNeutralExpressionOnAllPoses:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureAlmostNeutralExpressionOnNonFrontPose:", v3);

}

- (BOOL)ensureNeutralExpressionOnFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureNeutralExpressionOnFrontPose");

  return v3;
}

- (void)setEnsureNeutralExpressionOnFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureNeutralExpressionOnFrontPose:", v3);

}

- (BOOL)ensureAlmostNeutralExpressionOnNonFrontPose
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ensureAlmostNeutralExpressionOnNonFrontPose");

  return v3;
}

- (void)setEnsureAlmostNeutralExpressionOnNonFrontPose:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnsureAlmostNeutralExpressionOnNonFrontPose:", v3);

}

- (BOOL)useFaceTrackingDictionary
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useFaceTrackingDictionary");

  return v3;
}

- (void)setUseFaceTrackingDictionary:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseFaceTrackingDictionary:", v3);

}

- (BOOL)useFKInternalFaceDetector
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useFKInternalFaceDetector");

  return v3;
}

- (void)setUseFKInternalFaceDetector:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseFKInternalFaceDetector:", v3);

}

- (BOOL)useFKForceCPU
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useFKForceCPU");

  return v3;
}

- (void)setUseFKForceCPU:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseFKForceCPU:", v3);

}

- (BOOL)sendMetrics
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sendMetrics");

  return v3;
}

- (void)setSendMetrics:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendMetrics:", v3);

}

- (NSString)cameraImageColorSpaceName
{
  void *v2;
  void *v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraImageColorSpaceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCameraImageColorSpaceName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCameraImageColorSpaceName:", v4);

}

- (BOOL)useSimpleSelector
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useSimpleSelector");

  return v3;
}

- (void)setUseSimpleSelector:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseSimpleSelector:", v3);

}

- (float)simpleSelectorMinOffsetAngle
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleSelectorMinOffsetAngle");
  v4 = v3;

  return v4;
}

- (void)setSimpleSelectorMinOffsetAngle:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setSimpleSelectorMinOffsetAngle:", v4);

}

- (float)simpleSelectorMaxOffsetAngle
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simpleSelectorMaxOffsetAngle");
  v4 = v3;

  return v4;
}

- (void)setSimpleSelectorMaxOffsetAngle:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setSimpleSelectorMaxOffsetAngle:", v4);

}

- (BOOL)useDistanceFilter
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useDistanceFilter");

  return v3;
}

- (void)setUseDistanceFilter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseDistanceFilter:", v3);

}

- (float)distanceFilterCloseThreshold
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceFilterCloseThreshold");
  v4 = v3;

  return v4;
}

- (void)setDistanceFilterCloseThreshold:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setDistanceFilterCloseThreshold:", v4);

}

- (float)distanceFilterFarThreshold
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceFilterFarThreshold");
  v4 = v3;

  return v4;
}

- (void)setDistanceFilterFarThreshold:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setDistanceFilterFarThreshold:", v4);

}

- (VGFaceSelectionFrustum)selectionFrustum
{
  void *v2;
  void *v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionFrustum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VGFaceSelectionFrustum *)v3;
}

- (void)setSelectionFrustum:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectionFrustum:", v4);

}

- (VGFaceSelectionFrustum)frontPoseSelectionFrustum
{
  void *v2;
  void *v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontPoseSelectionFrustum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VGFaceSelectionFrustum *)v3;
}

- (void)setFrontPoseSelectionFrustum:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectionFrustum:", v4);

}

- (BOOL)useVNFilters
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useVNFilters");

  return v3;
}

- (void)setUseVNFilters:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseVNFilters:", v3);

}

- (BOOL)useVNFiltersEnrollment
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useVNFiltersEnrollment");

  return v3;
}

- (void)setUseVNFiltersEnrollment:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseVNFiltersEnrollment:", v3);

}

- (float)vnFrontPoseBlinkThreshold
{
  void *v2;
  float v3;
  float v4;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vnFrontPoseBlinkThreshold");
  v4 = v3;

  return v4;
}

- (void)setVnFrontPoseBlinkThreshold:(float)a3
{
  double v4;
  id v5;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVnFrontPoseBlinkThreshold:", v4);

}

- (BOOL)useDepthFovFilter
{
  void *v2;
  char v3;

  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useDepthFovFilter");

  return v3;
}

- (void)setUseDepthFovFilter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseDepthFovFilter:", v3);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[VGFaceEnrollmentOptions captureOptions](self, "captureOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Deterministic mode %d Generate Pifu %d Generate Bacon Panel %d Use high-res camera image %d Apply Bacon Lighting %d "), v5, self->_deterministicMode, self->_generatePIFu, self->_generateBaconPanel, self->_useHighResCameraImage, self->_applyBaconLighting);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFaceEnrollmentOptions)initWithCoder:(id)a3
{
  id v4;
  VGFaceEnrollmentOptions *v5;
  char v6;
  uint64_t v7;
  NSString *saveDirectory;
  uint64_t v9;
  VGFaceCaptureOptions *captureOptions;
  VGFaceEnrollmentOptions *v11;

  v4 = a3;
  v5 = -[VGFaceEnrollmentOptions init](self, "init");
  if (v5)
  {
    v5->_identityFittingOp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("identityFittingOp"));
    v5->_useHighResCameraImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useHighResCameraImage"));
    v5->_applyBaconLighting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("applyBaconLighting"));
    v5->_generatePIFu = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("generatePIFu"));
    v5->_generateSplats = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("generateSplats"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("generateBaconPanel")))
      v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("generateBaconPanel"));
    else
      v6 = 1;
    v5->_generateBaconPanel = v6;
    v5->_deterministicMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deterministicMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saveDirectory"));
    v7 = objc_claimAutoreleasedReturnValue();
    saveDirectory = v5->_saveDirectory;
    v5->_saveDirectory = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureOptions"));
    v9 = objc_claimAutoreleasedReturnValue();
    captureOptions = v5->_captureOptions;
    v5->_captureOptions = (VGFaceCaptureOptions *)v9;

    v5->_enrollmentMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enrollmentMode"));
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identityFittingOp;
  id v5;

  identityFittingOp = self->_identityFittingOp;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", identityFittingOp, CFSTR("identityFittingOp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useHighResCameraImage, CFSTR("useHighResCameraImage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_applyBaconLighting, CFSTR("applyBaconLighting"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_generatePIFu, CFSTR("generatePIFu"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_generateSplats, CFSTR("generateSplats"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_generateBaconPanel, CFSTR("generateBaconPanel"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deterministicMode, CFSTR("deterministicMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_saveDirectory, CFSTR("saveDirectory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_captureOptions, CFSTR("captureOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_enrollmentMode, CFSTR("enrollmentMode"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unint64_t identityFittingOp;
  int useHighResCameraImage;
  int applyBaconLighting;
  int generatePIFu;
  int generateSplats;
  int generateBaconPanel;
  uint64_t deterministicMode;
  NSString *saveDirectory;
  NSString *v15;
  int v16;
  BOOL v17;
  VGFaceCaptureOptions *captureOptions;
  void *v20;
  unint64_t enrollmentMode;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    identityFittingOp = self->_identityFittingOp;
    if (identityFittingOp != objc_msgSend(v6, "identityFittingOp")
      || (useHighResCameraImage = self->_useHighResCameraImage,
          useHighResCameraImage != objc_msgSend(v6, "useHighResCameraImage"))
      || (applyBaconLighting = self->_applyBaconLighting,
          applyBaconLighting != objc_msgSend(v6, "applyBaconLighting"))
      || (generatePIFu = self->_generatePIFu, generatePIFu != objc_msgSend(v6, "generatePIFu"))
      || (generateSplats = self->_generateSplats, generateSplats != objc_msgSend(v6, "generateSplats"))
      || (generateBaconPanel = self->_generateBaconPanel,
          generateBaconPanel != objc_msgSend(v6, "generateBaconPanel"))
      || (deterministicMode = self->_deterministicMode,
          (_DWORD)deterministicMode != objc_msgSend(v6, "deterministicMode")))
    {
      v17 = 0;
LABEL_16:

      goto LABEL_17;
    }
    saveDirectory = self->_saveDirectory;
    v15 = saveDirectory;
    if (!saveDirectory)
    {
      objc_msgSend(v6, "saveDirectory");
      deterministicMode = objc_claimAutoreleasedReturnValue();
      if (!deterministicMode)
      {
        v16 = 0;
        goto LABEL_20;
      }
      v15 = self->_saveDirectory;
    }
    objc_msgSend(v6, "saveDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v15, "isEqualToString:", v3))
    {
      v17 = 0;
      goto LABEL_22;
    }
    v16 = 1;
LABEL_20:
    captureOptions = self->_captureOptions;
    objc_msgSend(v6, "captureOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VGFaceCaptureOptions isEqual:](captureOptions, "isEqual:", v20))
    {
      enrollmentMode = self->_enrollmentMode;
      v17 = enrollmentMode == objc_msgSend(v6, "enrollmentMode");

      if ((v16 & 1) == 0)
        goto LABEL_23;
    }
    else
    {

      v17 = 0;
      if (!v16)
      {
LABEL_23:
        if (!saveDirectory)

        goto LABEL_16;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (unint64_t)identityFittingOp
{
  return self->_identityFittingOp;
}

- (void)setIdentityFittingOp:(unint64_t)a3
{
  self->_identityFittingOp = a3;
}

- (BOOL)generatePIFu
{
  return self->_generatePIFu;
}

- (void)setGeneratePIFu:(BOOL)a3
{
  self->_generatePIFu = a3;
}

- (BOOL)generateSplats
{
  return self->_generateSplats;
}

- (void)setGenerateSplats:(BOOL)a3
{
  self->_generateSplats = a3;
}

- (BOOL)generateBaconPanel
{
  return self->_generateBaconPanel;
}

- (void)setGenerateBaconPanel:(BOOL)a3
{
  self->_generateBaconPanel = a3;
}

- (BOOL)useHighResCameraImage
{
  return self->_useHighResCameraImage;
}

- (void)setUseHighResCameraImage:(BOOL)a3
{
  self->_useHighResCameraImage = a3;
}

- (BOOL)applyBaconLighting
{
  return self->_applyBaconLighting;
}

- (void)setApplyBaconLighting:(BOOL)a3
{
  self->_applyBaconLighting = a3;
}

- (BOOL)deterministicMode
{
  return self->_deterministicMode;
}

- (void)setDeterministicMode:(BOOL)a3
{
  self->_deterministicMode = a3;
}

- (NSString)saveDirectory
{
  return self->_saveDirectory;
}

- (void)setSaveDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_saveDirectory, a3);
}

- (unint64_t)enrollmentMode
{
  return self->_enrollmentMode;
}

- (void)setEnrollmentMode:(unint64_t)a3
{
  self->_enrollmentMode = a3;
}

- (VGFaceCaptureOptions)captureOptions
{
  return self->_captureOptions;
}

- (void)setCaptureOptions:(id)a3
{
  objc_storeStrong((id *)&self->_captureOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureOptions, 0);
  objc_storeStrong((id *)&self->_saveDirectory, 0);
}

@end
