@implementation VGCapturedPose

- (BOOL)valid
{
  return self->_captureData != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[VGCapturedPose captureData](self, "captureData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("captureData"));

  -[VGCapturedPose trackingData](self, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("trackingData"));

  objc_msgSend(v8, "encodeBool:forKey:", -[VGCapturedPose frontPose](self, "frontPose"), CFSTR("frontPose"));
  -[VGCapturedPose selectedAngle](self, "selectedAngle");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("selectedAngle"));
  -[VGCapturedPose selectedPitch](self, "selectedPitch");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("selectedPitch"));
  -[VGCapturedPose selectedYaw](self, "selectedYaw");
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("selectedYaw"));
  -[VGCapturedPose bodyPoseFrameState](self, "bodyPoseFrameState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VGCapturedPose bodyPoseFrameState](self, "bodyPoseFrameState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("bodyPoseFrameState"));

  }
}

- (VGCapturedPose)initWithCoder:(id)a3
{
  id v4;
  VGCapturedPose *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  VGCapturedPose *v14;
  objc_super v16;
  _QWORD v17[8];

  v17[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VGCapturedPose;
  v5 = -[VGCapturedPose init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGCapturedPose setCaptureData:](v5, "setCaptureData:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("trackingData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VGCapturedPose setTrackingData:](v5, "setTrackingData:", v10);

    -[VGCapturedPose setFrontPose:](v5, "setFrontPose:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("frontPose")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectedAngle"));
    -[VGCapturedPose setSelectedAngle:](v5, "setSelectedAngle:");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectedPitch")))
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectedPitch"));
    else
      LODWORD(v11) = 2139095040;
    -[VGCapturedPose setSelectedPitch:](v5, "setSelectedPitch:", v11);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectedYaw")))
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectedYaw"));
    else
      LODWORD(v12) = 2139095040;
    -[VGCapturedPose setSelectedYaw:](v5, "setSelectedYaw:", v12);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bodyPoseFrameState")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyPoseFrameState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGCapturedPose setBodyPoseFrameState:](v5, "setBodyPoseFrameState:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  VGCaptureData *captureData;
  VGCaptureData *v11;
  int v12;
  char v13;
  NSDictionary *trackingData;
  NSDictionary *v15;
  int v16;
  int frontPose;
  float selectedAngle;
  float v19;
  float selectedPitch;
  float v21;
  float selectedYaw;
  float v23;
  VGBodyPoseFrameState *bodyPoseFrameState;
  VGBodyPoseFrameState *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  void *v30;
  VGBodyPoseFrameState *v31;
  void *v32;
  void *v33;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_35;
  }
  v8 = v7;
  v9 = v8;
  captureData = self->_captureData;
  v11 = captureData;
  if (!captureData)
  {
    objc_msgSend(v8, "captureData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v12 = 0;
      goto LABEL_10;
    }
    v11 = self->_captureData;
  }
  objc_msgSend(v9, "captureData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VGCaptureData isEqual:](v11, "isEqual:", v4))
  {

    v13 = 0;
    goto LABEL_32;
  }
  v12 = 1;
LABEL_10:
  trackingData = self->_trackingData;
  v15 = trackingData;
  if (!trackingData)
  {
    objc_msgSend(v9, "trackingData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v32 = 0;
      v33 = v3;
      v16 = 0;
      goto LABEL_17;
    }
    v15 = self->_trackingData;
  }
  objc_msgSend(v9, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSDictionary isEqual:](v15, "isEqual:", v5) & 1) == 0)
  {

    v13 = 0;
    goto LABEL_29;
  }
  v33 = v3;
  v16 = 1;
LABEL_17:
  frontPose = self->_frontPose;
  if (frontPose == objc_msgSend(v9, "frontPose"))
  {
    selectedAngle = self->_selectedAngle;
    objc_msgSend(v9, "selectedAngle");
    if (selectedAngle == v19)
    {
      selectedPitch = self->_selectedPitch;
      objc_msgSend(v9, "selectedPitch");
      if (selectedPitch == v21)
      {
        selectedYaw = self->_selectedYaw;
        objc_msgSend(v9, "selectedYaw");
        if (selectedYaw == v23)
        {
          bodyPoseFrameState = self->_bodyPoseFrameState;
          v25 = bodyPoseFrameState;
          if (!bodyPoseFrameState)
          {
            objc_msgSend(v9, "bodyPoseFrameState");
            v26 = objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              v27 = 0;
              v13 = 1;
              v3 = v33;
LABEL_39:

              if ((v16 & 1) == 0)
                goto LABEL_29;
              goto LABEL_28;
            }
            v29 = v26;
            v25 = self->_bodyPoseFrameState;
          }
          v31 = bodyPoseFrameState;
          v13 = -[VGBodyPoseFrameState isEqual:](v25, "isEqual:", v9[5], v29);
          v3 = v33;
          v27 = v30;
          if (v31)
          {
            if (!v16)
              goto LABEL_29;
            goto LABEL_28;
          }
          goto LABEL_39;
        }
      }
    }
  }
  v13 = 0;
  v3 = v33;
  if ((v16 & 1) != 0)
LABEL_28:

LABEL_29:
  if (!trackingData)
  {

    if ((v12 & 1) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  if (v12)
LABEL_31:

LABEL_32:
  if (!captureData)

LABEL_35:
  return v13;
}

- (VGCaptureData)captureData
{
  return self->_captureData;
}

- (void)setCaptureData:(id)a3
{
  objc_storeStrong((id *)&self->_captureData, a3);
}

- (NSDictionary)trackingData
{
  return self->_trackingData;
}

- (void)setTrackingData:(id)a3
{
  objc_storeStrong((id *)&self->_trackingData, a3);
}

- (BOOL)frontPose
{
  return self->_frontPose;
}

- (void)setFrontPose:(BOOL)a3
{
  self->_frontPose = a3;
}

- (float)selectedAngle
{
  return self->_selectedAngle;
}

- (void)setSelectedAngle:(float)a3
{
  self->_selectedAngle = a3;
}

- (VGBodyPoseFrameState)bodyPoseFrameState
{
  return self->_bodyPoseFrameState;
}

- (void)setBodyPoseFrameState:(id)a3
{
  objc_storeStrong((id *)&self->_bodyPoseFrameState, a3);
}

- (float)selectedPitch
{
  return self->_selectedPitch;
}

- (void)setSelectedPitch:(float)a3
{
  self->_selectedPitch = a3;
}

- (float)selectedYaw
{
  return self->_selectedYaw;
}

- (void)setSelectedYaw:(float)a3
{
  self->_selectedYaw = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPoseFrameState, 0);
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_captureData, 0);
}

@end
