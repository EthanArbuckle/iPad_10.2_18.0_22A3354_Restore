@implementation VGFaceSelectionState

- (VGFaceSelectionState)init
{
  VGFaceSelectionState *v2;
  VGFaceSelectionState *v3;
  VGFaceSelectionState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGFaceSelectionState;
  v2 = -[VGFaceSelectionState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_poseIndex = -1;
    v4 = v2;
  }

  return v3;
}

- (NSDictionary)yawAngleCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:](VGSelectionState, "capturedStatesFromCapturedPoses:", self->_yawAngleCapturedPoses);
}

- (NSDictionary)pitchAngleCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:](VGSelectionState, "capturedStatesFromCapturedPoses:", self->_pitchAngleCapturedPoses);
}

- (NSDictionary)posesForHairCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:](VGSelectionState, "capturedStatesFromCapturedPoses:", self->_posesForHairCapturedPoses);
}

- (NSDictionary)expressionCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:](VGSelectionState, "capturedStatesFromCapturedPoses:", self->_expressionCapturedPoses);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t poseIndex_low;
  float v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  const __CFString *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;

  -[VGFaceSelectionState capturedFrontPose](self, "capturedFrontPose");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VGFaceSelectionState capturedFrontPose](self, "capturedFrontPose");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "valid"))
    {
      -[VGFaceSelectionState capturedFrontPose](self, "capturedFrontPose");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captureData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "timestamp");
        v22 = v25;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = -1;
    }

  }
  else
  {
    v22 = -1;
  }

  v24 = (void *)MEMORY[0x24BDD17C8];
  if (-[VGSelectionState completed](self, "completed"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v23 = v8;
  if (-[VGSelectionState failed](self, "failed"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[VGFaceSelectionState updated](self, "updated"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  poseIndex_low = LODWORD(self->_poseIndex);
  -[VGSelectionState progress](self, "progress");
  v13 = v12;
  -[VGFaceSelectionState yawAngleCaptured](self, "yawAngleCaptured");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFaceSelectionState pitchAngleCaptured](self, "pitchAngleCaptured");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFaceSelectionState expressionCaptured](self, "expressionCaptured");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFaceSelectionState capturedFrontPose](self, "capturedFrontPose");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGFaceSelectionState completionScore](self, "completionScore");
  if (v17)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("Face frame selection state: completed %@ failed %@ updated %@ poseIndex %d progress %f yaw %@ pitch %@ expr %@ frontPose %@ (%lld) completionScore %.3f"), v23, v9, v10, poseIndex_low, v13, v14, v15, v16, v19, v22, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)updated
{
  VGFrameRejectionState *rejectionState;

  rejectionState = self->_rejectionState;
  if (rejectionState)
    LOBYTE(rejectionState) = -[VGFrameRejectionState reason](rejectionState, "reason") == 0;
  return (char)rejectionState;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (float)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(float)a3
{
  self->_pitchAngle = a3;
}

- (NSNumber)yawTargetAngle
{
  return self->_yawTargetAngle;
}

- (void)setYawTargetAngle:(id)a3
{
  objc_storeStrong((id *)&self->_yawTargetAngle, a3);
}

- (NSNumber)pitchTargetAngle
{
  return self->_pitchTargetAngle;
}

- (void)setPitchTargetAngle:(id)a3
{
  objc_storeStrong((id *)&self->_pitchTargetAngle, a3);
}

- (NSDictionary)yawAngleCapturedPoses
{
  return self->_yawAngleCapturedPoses;
}

- (void)setYawAngleCapturedPoses:(id)a3
{
  objc_storeStrong((id *)&self->_yawAngleCapturedPoses, a3);
}

- (NSDictionary)pitchAngleCapturedPoses
{
  return self->_pitchAngleCapturedPoses;
}

- (void)setPitchAngleCapturedPoses:(id)a3
{
  objc_storeStrong((id *)&self->_pitchAngleCapturedPoses, a3);
}

- (NSDictionary)posesForHairCapturedPoses
{
  return self->_posesForHairCapturedPoses;
}

- (void)setPosesForHairCapturedPoses:(id)a3
{
  objc_storeStrong((id *)&self->_posesForHairCapturedPoses, a3);
}

- (NSDictionary)expressionCapturedPoses
{
  return self->_expressionCapturedPoses;
}

- (void)setExpressionCapturedPoses:(id)a3
{
  objc_storeStrong((id *)&self->_expressionCapturedPoses, a3);
}

- (NSArray)tronPoses
{
  return self->_tronPoses;
}

- (void)setTronPoses:(id)a3
{
  objc_storeStrong((id *)&self->_tronPoses, a3);
}

- (NSArray)hairPoses
{
  return self->_hairPoses;
}

- (void)setHairPoses:(id)a3
{
  objc_storeStrong((id *)&self->_hairPoses, a3);
}

- (VGCapturedPose)capturedFrontPose
{
  return self->_capturedFrontPose;
}

- (void)setCapturedFrontPose:(id)a3
{
  objc_storeStrong((id *)&self->_capturedFrontPose, a3);
}

- (float)completionScore
{
  return self->_completionScore;
}

- (void)setCompletionScore:(float)a3
{
  self->_completionScore = a3;
}

- (VGFrameRejectionState)rejectionState
{
  return self->_rejectionState;
}

- (void)setRejectionState:(id)a3
{
  objc_storeStrong((id *)&self->_rejectionState, a3);
}

- (VGBodyPoseFrameState)bodyPoseFrameState
{
  return self->_bodyPoseFrameState;
}

- (void)setBodyPoseFrameState:(id)a3
{
  objc_storeStrong((id *)&self->_bodyPoseFrameState, a3);
}

- (NSDictionary)faceTrackingResultCurrentFrame
{
  return self->_faceTrackingResultCurrentFrame;
}

- (void)setFaceTrackingResultCurrentFrame:(id)a3
{
  objc_storeStrong((id *)&self->_faceTrackingResultCurrentFrame, a3);
}

- (unint64_t)poseIndex
{
  return self->_poseIndex;
}

- (void)setPoseIndex:(unint64_t)a3
{
  self->_poseIndex = a3;
}

- (NSDictionary)debugData
{
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (VGCaptureData)captureData
{
  return self->_captureData;
}

- (void)setCaptureData:(id)a3
{
  objc_storeStrong((id *)&self->_captureData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureData, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_faceTrackingResultCurrentFrame, 0);
  objc_storeStrong((id *)&self->_bodyPoseFrameState, 0);
  objc_storeStrong((id *)&self->_rejectionState, 0);
  objc_storeStrong((id *)&self->_capturedFrontPose, 0);
  objc_storeStrong((id *)&self->_hairPoses, 0);
  objc_storeStrong((id *)&self->_tronPoses, 0);
  objc_storeStrong((id *)&self->_expressionCapturedPoses, 0);
  objc_storeStrong((id *)&self->_posesForHairCapturedPoses, 0);
  objc_storeStrong((id *)&self->_pitchAngleCapturedPoses, 0);
  objc_storeStrong((id *)&self->_yawAngleCapturedPoses, 0);
  objc_storeStrong((id *)&self->_pitchTargetAngle, 0);
  objc_storeStrong((id *)&self->_yawTargetAngle, 0);
}

@end
