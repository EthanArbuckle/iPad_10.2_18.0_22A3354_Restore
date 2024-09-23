@implementation VGFrameSelectorOptions

- (void)_setOptionsForFrontPose:(id)a3
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  double v24;
  void *v25;
  id v26;

  v26 = a3;
  -[VGFrameSelectorOptions setDetectFrontPose:](self, "setDetectFrontPose:", 1);
  objc_msgSend(v26, "frontPoseSelectionFrustum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "yawOffsetLeft");
  v6 = v5;
  objc_msgSend(v26, "frontPoseSelectionFrustum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "yawOffsetRight");
  v9 = v8;
  objc_msgSend(v26, "frontPoseSelectionFrustum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pitchOffsetTop");
  v12 = v11;
  objc_msgSend(v26, "frontPoseSelectionFrustum");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pitchOffsetBottom");
  LODWORD(v15) = v14;
  LODWORD(v16) = v6;
  LODWORD(v17) = v9;
  LODWORD(v18) = v12;
  -[VGFrameSelectorOptions setFrontPoseFrustumOffsets:](self, "setFrontPoseFrustumOffsets:", v16, v17, v18, v15);

  +[VGExpressionFilterLegacy getFrontExpressionFiltersForCaptureOptions:](VGExpressionFilterLegacy, "getFrontExpressionFiltersForCaptureOptions:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFrameSelectorOptions setFrontExpressionFilters:](self, "setFrontExpressionFilters:", v19);

  if (objc_msgSend(v26, "useFovMarginsFilterFrontPose"))
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v26, "topMarginHeadRatio");
    objc_msgSend(v20, "setTopMarginHeadRatio:");
    objc_msgSend(v26, "leftMarginFrontPoseHeadRatio");
    objc_msgSend(v20, "setLeftMarginHeadRatio:");
    objc_msgSend(v26, "rightMarginFrontPoseHeadRatio");
    objc_msgSend(v20, "setRightMarginHeadRatio:");
    objc_msgSend(v26, "bottomMarginHeadRatio");
    v22 = v21;
    objc_msgSend(v26, "bottomMarginFrontPoseDelta");
    *(float *)&v24 = v22 + v23;
    objc_msgSend(v20, "setBottomMarginHeadRatio:", v24);
    -[VGFrameSelectorOptions setFrontPoseMarginRatio:](self, "setFrontPoseMarginRatio:", v20);

  }
  objc_msgSend(v26, "bodyPoseGuidanceOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFrameSelectorOptions setBodyPoseGuidanceOptions:](self, "setBodyPoseGuidanceOptions:", v25);

}

- (void)_setOptionsForYawPoses:(id)a3
{
  float v4;
  double v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[VGFrameSelectorOptions setYawFrameCount:](self, "setYawFrameCount:", objc_msgSend(v23, "requiredYawPoses"));
  objc_msgSend(v23, "yawLimit");
  v5 = v4 * 3.14159265 / 180.0;
  *(float *)&v5 = v5;
  -[VGFrameSelectorOptions setYawLimit:](self, "setYawLimit:", v5);
  objc_msgSend(v23, "selectionFrustum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yawOffsetLeft");
  v8 = v7;
  objc_msgSend(v23, "selectionFrustum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yawOffsetRight");
  v11 = v10;
  objc_msgSend(v23, "selectionFrustum");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pitchOffsetTop");
  v14 = v13;
  objc_msgSend(v23, "selectionFrustum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pitchOffsetBottom");
  LODWORD(v17) = v16;
  LODWORD(v18) = v8;
  LODWORD(v19) = v11;
  LODWORD(v20) = v14;
  -[VGFrameSelectorOptions setYawPosesFrustumOffsets:](self, "setYawPosesFrustumOffsets:", v18, v19, v20, v17);

  +[VGExpressionFilterLegacy getExpressionFiltersForCaptureOptions:](VGExpressionFilterLegacy, "getExpressionFiltersForCaptureOptions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFrameSelectorOptions setYawExpressionFilters:](self, "setYawExpressionFilters:", v21);

  if (objc_msgSend(v23, "useFovMarginsFilterNonFrontPose"))
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v23, "topMarginHeadRatio");
    objc_msgSend(v22, "setTopMarginHeadRatio:");
    objc_msgSend(v23, "leftMarginHeadRatio");
    objc_msgSend(v22, "setLeftMarginHeadRatio:");
    objc_msgSend(v23, "rightMarginHeadRatio");
    objc_msgSend(v22, "setRightMarginHeadRatio:");
    objc_msgSend(v23, "bottomMarginHeadRatio");
    objc_msgSend(v22, "setBottomMarginHeadRatio:");
    -[VGFrameSelectorOptions setYawMarginRatio:](self, "setYawMarginRatio:", v22);

  }
}

- (void)_setOptionsForPitchPoses:(id)a3
{
  float v4;
  double v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  double v26;
  id v27;

  v27 = a3;
  -[VGFrameSelectorOptions setPitchFrameCount:](self, "setPitchFrameCount:", objc_msgSend(v27, "requiredPitchPoses"));
  objc_msgSend(v27, "pitchLimit");
  v5 = v4 * 3.14159265 / 180.0;
  *(float *)&v5 = v5;
  -[VGFrameSelectorOptions setPitchLimit:](self, "setPitchLimit:", v5);
  objc_msgSend(v27, "selectionFrustum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yawOffsetLeft");
  v8 = v7;
  objc_msgSend(v27, "selectionFrustum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yawOffsetRight");
  v11 = v10;
  objc_msgSend(v27, "selectionFrustum");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pitchOffsetTop");
  v14 = v13;
  objc_msgSend(v27, "selectionFrustum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pitchOffsetBottom");
  LODWORD(v17) = v16;
  LODWORD(v18) = v8;
  LODWORD(v19) = v11;
  LODWORD(v20) = v14;
  -[VGFrameSelectorOptions setPitchPosesFrustumOffsets:](self, "setPitchPosesFrustumOffsets:", v18, v19, v20, v17);

  +[VGExpressionFilterLegacy getExpressionFiltersForCaptureOptions:](VGExpressionFilterLegacy, "getExpressionFiltersForCaptureOptions:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFrameSelectorOptions setPitchExpressionFilters:](self, "setPitchExpressionFilters:", v21);

  if (objc_msgSend(v27, "useFovMarginsFilterNonFrontPose"))
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v27, "topMarginHeadRatio");
    objc_msgSend(v22, "setTopMarginHeadRatio:");
    objc_msgSend(v27, "leftMarginHeadRatio");
    objc_msgSend(v22, "setLeftMarginHeadRatio:");
    objc_msgSend(v27, "rightMarginHeadRatio");
    objc_msgSend(v22, "setRightMarginHeadRatio:");
    objc_msgSend(v27, "bottomMarginHeadRatio");
    v24 = v23;
    objc_msgSend(v27, "bottomMarginPitchPoseDelta");
    *(float *)&v26 = fmaxf(v24 + v25, 0.0);
    objc_msgSend(v22, "setBottomMarginHeadRatio:", v26);
    -[VGFrameSelectorOptions setPitchMarginRatio:](self, "setPitchMarginRatio:", v22);

  }
}

+ (id)optionsWithCaptureOptions:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUseSimpleSelector:", objc_msgSend(v3, "useSimpleSelector"));
  objc_msgSend(v3, "simpleSelectorMinOffsetAngle");
  objc_msgSend(v4, "setSimpleSelectorMinOffsetAngle:");
  objc_msgSend(v3, "simpleSelectorMaxOffsetAngle");
  objc_msgSend(v4, "setSimpleSelectorMaxOffsetAngle:");
  objc_msgSend(v4, "setUseVNFilters:", objc_msgSend(v3, "useVNFilters"));
  objc_msgSend(v3, "vnFrontPoseBlinkThreshold");
  objc_msgSend(v4, "setVnFrontPoseBlinkThreshold:");
  objc_msgSend(v4, "setUseVNFaceLandmarksFilter:", objc_msgSend(v3, "useVNFaceLandmarksFilter"));
  objc_msgSend(v4, "setUseDepthFovFilterForBadAlignment:", objc_msgSend(v3, "useDepthFovFilterForBadAlignment"));
  objc_msgSend(v4, "_setOptionsForFrontPose:", v3);
  objc_msgSend(v4, "_setOptionsForYawPoses:", v3);
  objc_msgSend(v4, "_setOptionsForPitchPoses:", v3);

  return v4;
}

- (unint64_t)yawFrameCount
{
  return self->_yawFrameCount;
}

- (void)setYawFrameCount:(unint64_t)a3
{
  self->_yawFrameCount = a3;
}

- (unint64_t)pitchFrameCount
{
  return self->_pitchFrameCount;
}

- (void)setPitchFrameCount:(unint64_t)a3
{
  self->_pitchFrameCount = a3;
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

- (BOOL)detectFrontPose
{
  return self->_detectFrontPose;
}

- (void)setDetectFrontPose:(BOOL)a3
{
  self->_detectFrontPose = a3;
}

- (NSArray)frontExpressionFilters
{
  return self->_frontExpressionFilters;
}

- (void)setFrontExpressionFilters:(id)a3
{
  objc_storeStrong((id *)&self->_frontExpressionFilters, a3);
}

- (NSArray)yawExpressionFilters
{
  return self->_yawExpressionFilters;
}

- (void)setYawExpressionFilters:(id)a3
{
  objc_storeStrong((id *)&self->_yawExpressionFilters, a3);
}

- (NSArray)pitchExpressionFilters
{
  return self->_pitchExpressionFilters;
}

- (void)setPitchExpressionFilters:(id)a3
{
  objc_storeStrong((id *)&self->_pitchExpressionFilters, a3);
}

- (NSArray)yawAngles
{
  return self->_yawAngles;
}

- (void)setYawAngles:(id)a3
{
  objc_storeStrong((id *)&self->_yawAngles, a3);
}

- (NSArray)pitchAngles
{
  return self->_pitchAngles;
}

- (void)setPitchAngles:(id)a3
{
  objc_storeStrong((id *)&self->_pitchAngles, a3);
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

- (VGFrameSelectorMarginRatio)yawMarginRatio
{
  return self->_yawMarginRatio;
}

- (void)setYawMarginRatio:(id)a3
{
  objc_storeStrong((id *)&self->_yawMarginRatio, a3);
}

- (VGFrameSelectorMarginRatio)pitchMarginRatio
{
  return self->_pitchMarginRatio;
}

- (void)setPitchMarginRatio:(id)a3
{
  objc_storeStrong((id *)&self->_pitchMarginRatio, a3);
}

- (VGFrameSelectorMarginRatio)frontPoseMarginRatio
{
  return self->_frontPoseMarginRatio;
}

- (void)setFrontPoseMarginRatio:(id)a3
{
  objc_storeStrong((id *)&self->_frontPoseMarginRatio, a3);
}

- (VGFrameSelectorFrustumOffsets)frontPoseFrustumOffsets
{
  float yawOffsetDegreesLeft;
  float yawOffsetDegreesRight;
  float pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom;
  VGFrameSelectorFrustumOffsets result;

  yawOffsetDegreesLeft = self->_frontPoseFrustumOffsets.yawOffsetDegreesLeft;
  yawOffsetDegreesRight = self->_frontPoseFrustumOffsets.yawOffsetDegreesRight;
  pitchOffsetDegreesTop = self->_frontPoseFrustumOffsets.pitchOffsetDegreesTop;
  pitchOffsetDegreesBottom = self->_frontPoseFrustumOffsets.pitchOffsetDegreesBottom;
  result.pitchOffsetDegreesBottom = pitchOffsetDegreesBottom;
  result.pitchOffsetDegreesTop = pitchOffsetDegreesTop;
  result.yawOffsetDegreesRight = yawOffsetDegreesRight;
  result.yawOffsetDegreesLeft = yawOffsetDegreesLeft;
  return result;
}

- (void)setFrontPoseFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3
{
  self->_frontPoseFrustumOffsets = a3;
}

- (VGFrameSelectorFrustumOffsets)yawPosesFrustumOffsets
{
  float yawOffsetDegreesLeft;
  float yawOffsetDegreesRight;
  float pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom;
  VGFrameSelectorFrustumOffsets result;

  yawOffsetDegreesLeft = self->_yawPosesFrustumOffsets.yawOffsetDegreesLeft;
  yawOffsetDegreesRight = self->_yawPosesFrustumOffsets.yawOffsetDegreesRight;
  pitchOffsetDegreesTop = self->_yawPosesFrustumOffsets.pitchOffsetDegreesTop;
  pitchOffsetDegreesBottom = self->_yawPosesFrustumOffsets.pitchOffsetDegreesBottom;
  result.pitchOffsetDegreesBottom = pitchOffsetDegreesBottom;
  result.pitchOffsetDegreesTop = pitchOffsetDegreesTop;
  result.yawOffsetDegreesRight = yawOffsetDegreesRight;
  result.yawOffsetDegreesLeft = yawOffsetDegreesLeft;
  return result;
}

- (void)setYawPosesFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3
{
  self->_yawPosesFrustumOffsets = a3;
}

- (VGFrameSelectorFrustumOffsets)pitchPosesFrustumOffsets
{
  float yawOffsetDegreesLeft;
  float yawOffsetDegreesRight;
  float pitchOffsetDegreesTop;
  float pitchOffsetDegreesBottom;
  VGFrameSelectorFrustumOffsets result;

  yawOffsetDegreesLeft = self->_pitchPosesFrustumOffsets.yawOffsetDegreesLeft;
  yawOffsetDegreesRight = self->_pitchPosesFrustumOffsets.yawOffsetDegreesRight;
  pitchOffsetDegreesTop = self->_pitchPosesFrustumOffsets.pitchOffsetDegreesTop;
  pitchOffsetDegreesBottom = self->_pitchPosesFrustumOffsets.pitchOffsetDegreesBottom;
  result.pitchOffsetDegreesBottom = pitchOffsetDegreesBottom;
  result.pitchOffsetDegreesTop = pitchOffsetDegreesTop;
  result.yawOffsetDegreesRight = yawOffsetDegreesRight;
  result.yawOffsetDegreesLeft = yawOffsetDegreesLeft;
  return result;
}

- (void)setPitchPosesFrustumOffsets:(VGFrameSelectorFrustumOffsets)a3
{
  self->_pitchPosesFrustumOffsets = a3;
}

- (BOOL)useVNFilters
{
  return self->_useVNFilters;
}

- (void)setUseVNFilters:(BOOL)a3
{
  self->_useVNFilters = a3;
}

- (float)vnFrontPoseBlinkThreshold
{
  return self->_vnFrontPoseBlinkThreshold;
}

- (void)setVnFrontPoseBlinkThreshold:(float)a3
{
  self->_vnFrontPoseBlinkThreshold = a3;
}

- (BOOL)useVNFaceLandmarksFilter
{
  return self->_useVNFaceLandmarksFilter;
}

- (void)setUseVNFaceLandmarksFilter:(BOOL)a3
{
  self->_useVNFaceLandmarksFilter = a3;
}

- (BOOL)useDepthFovFilterForBadAlignment
{
  return self->_useDepthFovFilterForBadAlignment;
}

- (void)setUseDepthFovFilterForBadAlignment:(BOOL)a3
{
  self->_useDepthFovFilterForBadAlignment = a3;
}

- (VGBodyPoseGuidanceOptions)bodyPoseGuidanceOptions
{
  return self->_bodyPoseGuidanceOptions;
}

- (void)setBodyPoseGuidanceOptions:(id)a3
{
  objc_storeStrong((id *)&self->_bodyPoseGuidanceOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPoseGuidanceOptions, 0);
  objc_storeStrong((id *)&self->_frontPoseMarginRatio, 0);
  objc_storeStrong((id *)&self->_pitchMarginRatio, 0);
  objc_storeStrong((id *)&self->_yawMarginRatio, 0);
  objc_storeStrong((id *)&self->_pitchAngles, 0);
  objc_storeStrong((id *)&self->_yawAngles, 0);
  objc_storeStrong((id *)&self->_pitchExpressionFilters, 0);
  objc_storeStrong((id *)&self->_yawExpressionFilters, 0);
  objc_storeStrong((id *)&self->_frontExpressionFilters, 0);
}

@end
