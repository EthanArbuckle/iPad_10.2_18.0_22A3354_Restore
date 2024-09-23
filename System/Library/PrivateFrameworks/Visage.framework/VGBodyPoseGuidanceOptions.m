@implementation VGBodyPoseGuidanceOptions

- (VGBodyPoseGuidanceOptions)init
{
  VGBodyPoseGuidanceOptions *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  VGBodyPoseGuidanceOptions *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VGBodyPoseGuidanceOptions;
  v2 = -[VGBodyPoseGuidanceOptions init](&v34, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadTargetMin");
    v2->_torsoHeadTargetMin = v3;
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadTargetMax");
    v2->_torsoHeadTargetMax = v4;
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadMarginMin");
    v2->_torsoHeadMarginMin = v5;
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadMarginMax");
    v2->_torsoHeadMarginMax = v6;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistTargetMin");
    v2->_shouldersTwistTargetMin = v7;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistTargetMax");
    v2->_shouldersTwistTargetMax = v8;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistMarginMin");
    v2->_shouldersTwistMarginMin = v9;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistMarginMax");
    v2->_shouldersTwistMarginMax = v10;
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowTargetMin");
    v2->_leftElbowTargetMin = v11;
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowTargetMax");
    v2->_leftElbowTargetMax = v12;
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowMarginMin");
    v2->_leftElbowMarginMin = v13;
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowMarginMax");
    v2->_leftElbowMarginMax = v14;
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowTargetMin");
    v2->_rightElbowTargetMin = v15;
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowTargetMax");
    v2->_rightElbowTargetMax = v16;
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowMarginMin");
    v2->_rightElbowMarginMin = v17;
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowMarginMax");
    v2->_rightElbowMarginMax = v18;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryTargetMin");
    v2->_shouldersHeightAsymmetryTargetMin = v19;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryTargetMax");
    v2->_shouldersHeightAsymmetryTargetMax = v20;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryMarginMin");
    v2->_shouldersHeightAsymmetryMarginMin = v21;
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryMarginMax");
    v2->_shouldersHeightAsymmetryMarginMax = v22;
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardTargetMin");
    v2->_leftShoulderForwardTargetMin = v23;
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardTargetMax");
    v2->_leftShoulderForwardTargetMax = v24;
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardMarginMin");
    v2->_leftShoulderForwardMarginMin = v25;
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardMarginMax");
    v2->_leftShoulderForwardMarginMax = v26;
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardTargetMin");
    v2->_rightShoulderForwardTargetMin = v27;
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardTargetMax");
    v2->_rightShoulderForwardTargetMax = v28;
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardMarginMin");
    v2->_rightShoulderForwardMarginMin = v29;
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardMarginMax");
    v2->_rightShoulderForwardMarginMax = v30;
    objc_msgSend((id)objc_opt_class(), "defaultBestAlignmentToleranceAngleFrontPose");
    v2->_bestAlignmentToleranceAngleFrontPose = v31;
    v32 = v2;
  }

  return v2;
}

- (VGBodyPoseGuidanceOptions)initWithSuiteName:(id)a3
{
  id v4;
  VGBodyPoseGuidanceOptions *v5;
  VGBodyPoseGuidanceOptions *v6;
  VGBodyPoseGuidanceOptions *v7;

  v4 = a3;
  v5 = -[VGBodyPoseGuidanceOptions init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[VGBodyPoseGuidanceOptions setDefaultsWithSuiteName:](v5, "setDefaultsWithSuiteName:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)setDefaultsWithSuiteName:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  void *v7;
  float v8;
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
  float v24;
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
  float v42;
  void *v43;
  float v44;
  void *v45;
  float v46;
  void *v47;
  float v48;
  void *v49;
  float v50;
  void *v51;
  float v52;
  void *v53;
  float v54;
  void *v55;
  float v56;
  void *v57;
  float v58;
  void *v59;
  float v60;
  void *v61;
  float v62;
  id v63;

  v63 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v63);
  objc_msgSend(v4, "objectForKey:", CFSTR("torsoHeadTargetMin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("torsoHeadTargetMin"));
    self->_torsoHeadTargetMin = v6;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("torsoHeadTargetMax"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("torsoHeadTargetMax"));
    self->_torsoHeadTargetMax = v8;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("torsoHeadMarginMin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("torsoHeadMarginMin"));
    self->_torsoHeadMarginMin = v10;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("torsoHeadMarginMax"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("torsoHeadMarginMax"));
    self->_torsoHeadMarginMax = v12;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersTwistTargetMin"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersTwistTargetMin"));
    self->_shouldersTwistTargetMin = v14;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersTwistTargetMax"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersTwistTargetMax"));
    self->_shouldersTwistTargetMax = v16;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersTwistMarginMin"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersTwistMarginMin"));
    self->_shouldersTwistMarginMin = v18;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersTwistMarginMax"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersTwistMarginMax"));
    self->_shouldersTwistMarginMax = v20;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftElbowTargetMin"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftElbowTargetMin"));
    self->_leftElbowTargetMin = v22;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftElbowTargetMax"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftElbowTargetMax"));
    self->_leftElbowTargetMax = v24;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftElbowMarginMin"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftElbowMarginMin"));
    self->_leftElbowMarginMin = v26;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftElbowMarginMax"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftElbowMarginMax"));
    self->_leftElbowMarginMax = v28;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightElbowTargetMin"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightElbowTargetMin"));
    self->_rightElbowTargetMin = v30;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightElbowTargetMax"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightElbowTargetMax"));
    self->_rightElbowTargetMax = v32;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightElbowMarginMin"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightElbowMarginMin"));
    self->_rightElbowMarginMin = v34;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightElbowMarginMax"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightElbowMarginMax"));
    self->_rightElbowMarginMax = v36;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersHeightAsymmetryTargetMin"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersHeightAsymmetryTargetMin"));
    self->_shouldersHeightAsymmetryTargetMin = v38;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersHeightAsymmetryTargetMax"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersHeightAsymmetryTargetMax"));
    self->_shouldersHeightAsymmetryTargetMax = v40;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersHeightAsymmetryMarginMin"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersHeightAsymmetryMarginMin"));
    self->_shouldersHeightAsymmetryMarginMin = v42;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldersHeightAsymmetryMarginMax"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("shouldersHeightAsymmetryMarginMax"));
    self->_shouldersHeightAsymmetryMarginMax = v44;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftShoulderForwardTargetMin"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftShoulderForwardTargetMin"));
    self->_leftShoulderForwardTargetMin = v46;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftShoulderForwardTargetMax"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftShoulderForwardTargetMax"));
    self->_leftShoulderForwardTargetMax = v48;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftShoulderForwardMarginMin"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftShoulderForwardMarginMin"));
    self->_leftShoulderForwardMarginMin = v50;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("leftShoulderForwardMarginMax"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("leftShoulderForwardMarginMax"));
    self->_leftShoulderForwardMarginMax = v52;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightShoulderForwardTargetMin"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightShoulderForwardTargetMin"));
    self->_rightShoulderForwardTargetMin = v54;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightShoulderForwardTargetMax"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightShoulderForwardTargetMax"));
    self->_rightShoulderForwardTargetMax = v56;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightShoulderForwardMarginMin"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightShoulderForwardMarginMin"));
    self->_rightShoulderForwardMarginMin = v58;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rightShoulderForwardMarginMax"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("rightShoulderForwardMarginMax"));
    self->_rightShoulderForwardMarginMax = v60;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("bestAlignmentToleranceAngleFrontPose"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v4, "floatForKey:", CFSTR("bestAlignmentToleranceAngleFrontPose"));
    self->_bestAlignmentToleranceAngleFrontPose = v62;
  }

}

+ (float)defaultTorsoHeadTargetMin
{
  return -15.0;
}

+ (float)defaultTorsoHeadTargetMax
{
  return 15.0;
}

+ (float)defaultTorsoHeadMarginMin
{
  return 5.0;
}

+ (float)defaultTorsoHeadMarginMax
{
  return 5.0;
}

+ (float)defaultShouldersTwistTargetMin
{
  return -10.0;
}

+ (float)defaultShouldersTwistTargetMax
{
  return 10.0;
}

+ (float)defaultShouldersTwistMarginMin
{
  return 5.0;
}

+ (float)defaultShouldersTwistMarginMax
{
  return 5.0;
}

+ (float)defaultLeftElbowTargetMin
{
  return 0.0;
}

+ (float)defaultLeftElbowTargetMax
{
  return 90.0;
}

+ (float)defaultLeftElbowMarginMin
{
  return 5.0;
}

+ (float)defaultLeftElbowMarginMax
{
  return 30.0;
}

+ (float)defaultRightElbowTargetMin
{
  return -90.0;
}

+ (float)defaultRightElbowTargetMax
{
  return 0.0;
}

+ (float)defaultRightElbowMarginMin
{
  return 30.0;
}

+ (float)defaultRightElbowMarginMax
{
  return 5.0;
}

+ (float)defaultShouldersHeightAsymmetryTargetMin
{
  return -4.0;
}

+ (float)defaultShouldersHeightAsymmetryTargetMax
{
  return 4.0;
}

+ (float)defaultShouldersHeightAsymmetryMarginMin
{
  return 1.0;
}

+ (float)defaultShouldersHeightAsymmetryMarginMax
{
  return 1.0;
}

+ (float)defaultLeftShoulderForwardTargetMin
{
  return -0.09;
}

+ (float)defaultLeftShoulderForwardTargetMax
{
  return 0.01;
}

+ (float)defaultLeftShoulderForwardMarginMin
{
  return 0.03;
}

+ (float)defaultLeftShoulderForwardMarginMax
{
  return 0.03;
}

+ (float)defaultRightShoulderForwardTargetMin
{
  return -0.09;
}

+ (float)defaultRightShoulderForwardTargetMax
{
  return 0.01;
}

+ (float)defaultRightShoulderForwardMarginMin
{
  return 0.03;
}

+ (float)defaultRightShoulderForwardMarginMax
{
  return 0.03;
}

+ (float)defaultBestAlignmentToleranceAngleFrontPose
{
  return 2.0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Torso Head targets [min %g, max %g] margins [min %g, max %g] Shoulders Twist targets [min %g, max %g] margins [min %g, max %g] Left Elbow targets [min %g, max %g] margins [min %g, max %g] Right Elbow targets [min %g, max %g] margins [min %g, max %g] Shoulders Height Assymetry targets [min %g, max %g] margins [min %g, max %g] Left Shoulder Forward targets [min %g, max %g] margins [min %g, max %g] Right Shoulder Forward targets [min %g, max %g] margins [min %g, max %g] Best Alignment Tolerance Angle (front pose) %g "), self->_torsoHeadTargetMin, self->_torsoHeadTargetMax, self->_torsoHeadMarginMin, self->_torsoHeadMarginMax, self->_shouldersTwistTargetMin, self->_shouldersTwistTargetMax, self->_shouldersTwistMarginMin, self->_shouldersTwistMarginMax, self->_leftElbowTargetMin, self->_leftElbowTargetMax, self->_leftElbowMarginMin, self->_leftElbowMarginMax, self->_rightElbowTargetMin, self->_rightElbowTargetMax, self->_rightElbowMarginMin, self->_rightElbowMarginMax,
               self->_shouldersHeightAsymmetryTargetMin,
               self->_shouldersHeightAsymmetryTargetMax,
               self->_shouldersHeightAsymmetryMarginMin,
               self->_shouldersHeightAsymmetryMarginMax,
               self->_leftShoulderForwardTargetMin,
               self->_leftShoulderForwardTargetMax,
               self->_leftShoulderForwardMarginMin,
               self->_leftShoulderForwardMarginMax,
               self->_rightShoulderForwardTargetMin,
               self->_rightShoulderForwardTargetMax,
               self->_rightShoulderForwardMarginMin,
               self->_rightShoulderForwardMarginMax,
               self->_bestAlignmentToleranceAngleFrontPose);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGBodyPoseGuidanceOptions)initWithCoder:(id)a3
{
  id v4;
  VGBodyPoseGuidanceOptions *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  VGBodyPoseGuidanceOptions *v64;

  v4 = a3;
  v5 = -[VGBodyPoseGuidanceOptions init](self, "init");
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadTargetMin");
    v5->_torsoHeadTargetMin = v6;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("torsoHeadTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("torsoHeadTargetMin"));
      v5->_torsoHeadTargetMin = v7;
    }
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadTargetMax");
    v5->_torsoHeadTargetMax = v8;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("torsoHeadTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("torsoHeadTargetMax"));
      v5->_torsoHeadTargetMax = v9;
    }
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadMarginMin");
    v5->_torsoHeadMarginMin = v10;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("torsoHeadMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("torsoHeadMarginMin"));
      v5->_torsoHeadMarginMin = v11;
    }
    objc_msgSend((id)objc_opt_class(), "defaultTorsoHeadMarginMax");
    v5->_torsoHeadMarginMax = v12;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("torsoHeadMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("torsoHeadMarginMax"));
      v5->_torsoHeadMarginMax = v13;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistTargetMin");
    v5->_shouldersTwistTargetMin = v14;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersTwistTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersTwistTargetMin"));
      v5->_shouldersTwistTargetMin = v15;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistTargetMax");
    v5->_shouldersTwistTargetMax = v16;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersTwistTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersTwistTargetMax"));
      v5->_shouldersTwistTargetMax = v17;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistMarginMin");
    v5->_shouldersTwistMarginMin = v18;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersTwistMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersTwistMarginMin"));
      v5->_shouldersTwistMarginMin = v19;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersTwistMarginMax");
    v5->_shouldersTwistMarginMax = v20;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersTwistMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersTwistMarginMax"));
      v5->_shouldersTwistMarginMax = v21;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowTargetMin");
    v5->_leftElbowTargetMin = v22;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftElbowTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftElbowTargetMin"));
      v5->_leftElbowTargetMin = v23;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowTargetMax");
    v5->_leftElbowTargetMax = v24;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftElbowTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftElbowTargetMax"));
      v5->_leftElbowTargetMax = v25;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowMarginMin");
    v5->_leftElbowMarginMin = v26;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftElbowMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftElbowMarginMin"));
      v5->_leftElbowMarginMin = v27;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftElbowMarginMax");
    v5->_leftElbowMarginMax = v28;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftElbowMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftElbowMarginMax"));
      v5->_leftElbowMarginMax = v29;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowTargetMin");
    v5->_rightElbowTargetMin = v30;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightElbowTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightElbowTargetMin"));
      v5->_rightElbowTargetMin = v31;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowTargetMax");
    v5->_rightElbowTargetMax = v32;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightElbowTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightElbowTargetMax"));
      v5->_rightElbowTargetMax = v33;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowMarginMin");
    v5->_rightElbowMarginMin = v34;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightElbowMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightElbowMarginMin"));
      v5->_rightElbowMarginMin = v35;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightElbowMarginMax");
    v5->_rightElbowMarginMax = v36;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightElbowMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightElbowMarginMax"));
      v5->_rightElbowMarginMax = v37;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryTargetMin");
    v5->_shouldersHeightAsymmetryTargetMin = v38;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersHeightAsymmetryTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersHeightAsymmetryTargetMin"));
      v5->_shouldersHeightAsymmetryTargetMin = v39;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryTargetMax");
    v5->_shouldersHeightAsymmetryTargetMax = v40;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersHeightAsymmetryTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersHeightAsymmetryTargetMax"));
      v5->_shouldersHeightAsymmetryTargetMax = v41;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryMarginMin");
    v5->_shouldersHeightAsymmetryMarginMin = v42;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersHeightAsymmetryMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersHeightAsymmetryMarginMin"));
      v5->_shouldersHeightAsymmetryMarginMin = v43;
    }
    objc_msgSend((id)objc_opt_class(), "defaultShouldersHeightAsymmetryMarginMax");
    v5->_shouldersHeightAsymmetryMarginMax = v44;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldersHeightAsymmetryMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("shouldersHeightAsymmetryMarginMax"));
      v5->_shouldersHeightAsymmetryMarginMax = v45;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardTargetMin");
    v5->_leftShoulderForwardTargetMin = v46;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftShoulderForwardTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftShoulderForwardTargetMin"));
      v5->_leftShoulderForwardTargetMin = v47;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardTargetMax");
    v5->_leftShoulderForwardTargetMax = v48;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftShoulderForwardTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftShoulderForwardTargetMax"));
      v5->_leftShoulderForwardTargetMax = v49;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardMarginMin");
    v5->_leftShoulderForwardMarginMin = v50;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftShoulderForwardMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftShoulderForwardMarginMin"));
      v5->_leftShoulderForwardMarginMin = v51;
    }
    objc_msgSend((id)objc_opt_class(), "defaultLeftShoulderForwardMarginMax");
    v5->_leftShoulderForwardMarginMax = v52;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("leftShoulderForwardMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("leftShoulderForwardMarginMax"));
      v5->_leftShoulderForwardMarginMax = v53;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardTargetMin");
    v5->_rightShoulderForwardTargetMin = v54;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightShoulderForwardTargetMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightShoulderForwardTargetMin"));
      v5->_rightShoulderForwardTargetMin = v55;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardTargetMax");
    v5->_rightShoulderForwardTargetMax = v56;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightShoulderForwardTargetMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightShoulderForwardTargetMax"));
      v5->_rightShoulderForwardTargetMax = v57;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardMarginMin");
    v5->_rightShoulderForwardMarginMin = v58;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightShoulderForwardMarginMin")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightShoulderForwardMarginMin"));
      v5->_rightShoulderForwardMarginMin = v59;
    }
    objc_msgSend((id)objc_opt_class(), "defaultRightShoulderForwardMarginMax");
    v5->_rightShoulderForwardMarginMax = v60;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rightShoulderForwardMarginMax")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rightShoulderForwardMarginMax"));
      v5->_rightShoulderForwardMarginMax = v61;
    }
    objc_msgSend((id)objc_opt_class(), "defaultBestAlignmentToleranceAngleFrontPose");
    v5->_bestAlignmentToleranceAngleFrontPose = v62;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bestAlignmentToleranceAngleFrontPose")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("bestAlignmentToleranceAngleFrontPose"));
      v5->_bestAlignmentToleranceAngleFrontPose = v63;
    }
    v64 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v4 = a3;
  *(float *)&v5 = self->_torsoHeadTargetMin;
  v34 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("torsoHeadTargetMin"), v5);
  *(float *)&v6 = self->_torsoHeadTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("torsoHeadTargetMax"), v6);
  *(float *)&v7 = self->_torsoHeadMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("torsoHeadMarginMin"), v7);
  *(float *)&v8 = self->_torsoHeadMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("torsoHeadMarginMax"), v8);
  *(float *)&v9 = self->_shouldersTwistTargetMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersTwistTargetMin"), v9);
  *(float *)&v10 = self->_shouldersTwistTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersTwistTargetMax"), v10);
  *(float *)&v11 = self->_shouldersTwistMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersTwistMarginMin"), v11);
  *(float *)&v12 = self->_shouldersTwistMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersTwistMarginMax"), v12);
  *(float *)&v13 = self->_leftElbowTargetMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftElbowTargetMin"), v13);
  *(float *)&v14 = self->_leftElbowTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftElbowTargetMax"), v14);
  *(float *)&v15 = self->_leftElbowMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftElbowMarginMin"), v15);
  *(float *)&v16 = self->_leftElbowMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftElbowMarginMax"), v16);
  *(float *)&v17 = self->_rightElbowTargetMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightElbowTargetMin"), v17);
  *(float *)&v18 = self->_rightElbowTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightElbowTargetMax"), v18);
  *(float *)&v19 = self->_rightElbowMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightElbowMarginMin"), v19);
  *(float *)&v20 = self->_rightElbowMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightElbowMarginMax"), v20);
  *(float *)&v21 = self->_shouldersHeightAsymmetryTargetMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersHeightAsymmetryTargetMin"), v21);
  *(float *)&v22 = self->_shouldersHeightAsymmetryTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersHeightAsymmetryTargetMax"), v22);
  *(float *)&v23 = self->_shouldersHeightAsymmetryMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersHeightAsymmetryMarginMin"), v23);
  *(float *)&v24 = self->_shouldersHeightAsymmetryMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("shouldersHeightAsymmetryMarginMax"), v24);
  *(float *)&v25 = self->_leftShoulderForwardTargetMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftShoulderForwardTargetMin"), v25);
  *(float *)&v26 = self->_leftShoulderForwardTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftShoulderForwardTargetMax"), v26);
  *(float *)&v27 = self->_leftShoulderForwardMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftShoulderForwardMarginMin"), v27);
  *(float *)&v28 = self->_leftShoulderForwardMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("leftShoulderForwardMarginMax"), v28);
  *(float *)&v29 = self->_rightShoulderForwardTargetMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightShoulderForwardTargetMin"), v29);
  *(float *)&v30 = self->_rightShoulderForwardTargetMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightShoulderForwardTargetMax"), v30);
  *(float *)&v31 = self->_rightShoulderForwardMarginMin;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightShoulderForwardMarginMin"), v31);
  *(float *)&v32 = self->_rightShoulderForwardMarginMax;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("rightShoulderForwardMarginMax"), v32);
  *(float *)&v33 = self->_bestAlignmentToleranceAngleFrontPose;
  objc_msgSend(v34, "encodeFloat:forKey:", CFSTR("bestAlignmentToleranceAngleFrontPose"), v33);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float torsoHeadTargetMin;
  float v7;
  float torsoHeadTargetMax;
  float v9;
  float torsoHeadMarginMin;
  float v11;
  float torsoHeadMarginMax;
  float v13;
  float shouldersTwistTargetMin;
  float v15;
  float shouldersTwistTargetMax;
  float v17;
  float shouldersTwistMarginMin;
  float v19;
  float shouldersTwistMarginMax;
  float v21;
  float leftElbowTargetMin;
  float v23;
  float leftElbowTargetMax;
  float v25;
  float leftElbowMarginMin;
  float v27;
  float leftElbowMarginMax;
  float v29;
  float rightElbowTargetMin;
  float v31;
  float rightElbowTargetMax;
  float v33;
  float rightElbowMarginMin;
  float v35;
  float rightElbowMarginMax;
  float v37;
  float shouldersHeightAsymmetryTargetMin;
  float v39;
  float shouldersHeightAsymmetryTargetMax;
  float v41;
  float shouldersHeightAsymmetryMarginMin;
  float v43;
  float shouldersHeightAsymmetryMarginMax;
  float v45;
  float leftShoulderForwardTargetMin;
  float v47;
  float leftShoulderForwardTargetMax;
  float v49;
  float leftShoulderForwardMarginMin;
  float v51;
  float leftShoulderForwardMarginMax;
  float v53;
  float rightShoulderForwardTargetMin;
  float v55;
  float rightShoulderForwardTargetMax;
  float v57;
  float rightShoulderForwardMarginMin;
  float v59;
  float rightShoulderForwardMarginMax;
  float v61;
  float bestAlignmentToleranceAngleFrontPose;
  float v63;
  BOOL v64;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    torsoHeadTargetMin = self->_torsoHeadTargetMin;
    objc_msgSend(v5, "torsoHeadTargetMin");
    if (torsoHeadTargetMin != v7)
      goto LABEL_32;
    torsoHeadTargetMax = self->_torsoHeadTargetMax;
    objc_msgSend(v5, "torsoHeadTargetMax");
    if (torsoHeadTargetMax != v9)
      goto LABEL_32;
    torsoHeadMarginMin = self->_torsoHeadMarginMin;
    objc_msgSend(v5, "torsoHeadMarginMin");
    if (torsoHeadMarginMin != v11)
      goto LABEL_32;
    torsoHeadMarginMax = self->_torsoHeadMarginMax;
    objc_msgSend(v5, "torsoHeadMarginMax");
    if (torsoHeadMarginMax != v13)
      goto LABEL_32;
    shouldersTwistTargetMin = self->_shouldersTwistTargetMin;
    objc_msgSend(v5, "shouldersTwistTargetMin");
    if (shouldersTwistTargetMin != v15)
      goto LABEL_32;
    shouldersTwistTargetMax = self->_shouldersTwistTargetMax;
    objc_msgSend(v5, "shouldersTwistTargetMax");
    if (shouldersTwistTargetMax != v17)
      goto LABEL_32;
    shouldersTwistMarginMin = self->_shouldersTwistMarginMin;
    objc_msgSend(v5, "shouldersTwistMarginMin");
    if (shouldersTwistMarginMin != v19)
      goto LABEL_32;
    shouldersTwistMarginMax = self->_shouldersTwistMarginMax;
    objc_msgSend(v5, "shouldersTwistMarginMax");
    if (shouldersTwistMarginMax != v21)
      goto LABEL_32;
    leftElbowTargetMin = self->_leftElbowTargetMin;
    objc_msgSend(v5, "leftElbowTargetMin");
    if (leftElbowTargetMin != v23)
      goto LABEL_32;
    leftElbowTargetMax = self->_leftElbowTargetMax;
    objc_msgSend(v5, "leftElbowTargetMax");
    if (leftElbowTargetMax != v25)
      goto LABEL_32;
    leftElbowMarginMin = self->_leftElbowMarginMin;
    objc_msgSend(v5, "leftElbowMarginMin");
    if (leftElbowMarginMin != v27)
      goto LABEL_32;
    leftElbowMarginMax = self->_leftElbowMarginMax;
    objc_msgSend(v5, "leftElbowMarginMax");
    if (leftElbowMarginMax != v29)
      goto LABEL_32;
    rightElbowTargetMin = self->_rightElbowTargetMin;
    objc_msgSend(v5, "rightElbowTargetMin");
    if (rightElbowTargetMin != v31)
      goto LABEL_32;
    rightElbowTargetMax = self->_rightElbowTargetMax;
    objc_msgSend(v5, "rightElbowTargetMax");
    if (rightElbowTargetMax != v33)
      goto LABEL_32;
    rightElbowMarginMin = self->_rightElbowMarginMin;
    objc_msgSend(v5, "rightElbowMarginMin");
    if (rightElbowMarginMin != v35)
      goto LABEL_32;
    rightElbowMarginMax = self->_rightElbowMarginMax;
    objc_msgSend(v5, "rightElbowMarginMax");
    if (rightElbowMarginMax != v37)
      goto LABEL_32;
    shouldersHeightAsymmetryTargetMin = self->_shouldersHeightAsymmetryTargetMin;
    objc_msgSend(v5, "shouldersHeightAsymmetryTargetMin");
    if (shouldersHeightAsymmetryTargetMin != v39)
      goto LABEL_32;
    shouldersHeightAsymmetryTargetMax = self->_shouldersHeightAsymmetryTargetMax;
    objc_msgSend(v5, "shouldersHeightAsymmetryTargetMax");
    if (shouldersHeightAsymmetryTargetMax != v41)
      goto LABEL_32;
    shouldersHeightAsymmetryMarginMin = self->_shouldersHeightAsymmetryMarginMin;
    objc_msgSend(v5, "shouldersHeightAsymmetryMarginMin");
    if (shouldersHeightAsymmetryMarginMin != v43)
      goto LABEL_32;
    shouldersHeightAsymmetryMarginMax = self->_shouldersHeightAsymmetryMarginMax;
    objc_msgSend(v5, "shouldersHeightAsymmetryMarginMax");
    if (shouldersHeightAsymmetryMarginMax != v45)
      goto LABEL_32;
    leftShoulderForwardTargetMin = self->_leftShoulderForwardTargetMin;
    objc_msgSend(v5, "leftShoulderForwardTargetMin");
    if (leftShoulderForwardTargetMin != v47)
      goto LABEL_32;
    leftShoulderForwardTargetMax = self->_leftShoulderForwardTargetMax;
    objc_msgSend(v5, "leftShoulderForwardTargetMax");
    if (leftShoulderForwardTargetMax != v49)
      goto LABEL_32;
    leftShoulderForwardMarginMin = self->_leftShoulderForwardMarginMin;
    objc_msgSend(v5, "leftShoulderForwardMarginMin");
    if (leftShoulderForwardMarginMin != v51)
      goto LABEL_32;
    leftShoulderForwardMarginMax = self->_leftShoulderForwardMarginMax;
    objc_msgSend(v5, "leftShoulderForwardMarginMax");
    if (leftShoulderForwardMarginMax != v53)
      goto LABEL_32;
    rightShoulderForwardTargetMin = self->_rightShoulderForwardTargetMin;
    objc_msgSend(v5, "rightShoulderForwardTargetMin");
    if (rightShoulderForwardTargetMin != v55)
      goto LABEL_32;
    rightShoulderForwardTargetMax = self->_rightShoulderForwardTargetMax;
    objc_msgSend(v5, "rightShoulderForwardTargetMax");
    if (rightShoulderForwardTargetMax == v57
      && (rightShoulderForwardMarginMin = self->_rightShoulderForwardMarginMin,
          objc_msgSend(v5, "rightShoulderForwardMarginMin"),
          rightShoulderForwardMarginMin == v59)
      && (rightShoulderForwardMarginMax = self->_rightShoulderForwardMarginMax,
          objc_msgSend(v5, "rightShoulderForwardMarginMax"),
          rightShoulderForwardMarginMax == v61))
    {
      bestAlignmentToleranceAngleFrontPose = self->_bestAlignmentToleranceAngleFrontPose;
      objc_msgSend(v5, "bestAlignmentToleranceAngleFrontPose");
      v64 = bestAlignmentToleranceAngleFrontPose == v63;
    }
    else
    {
LABEL_32:
      v64 = 0;
    }

  }
  else
  {
    v64 = 0;
  }

  return v64;
}

- (id)toDictionary
{
  double v2;
  double v4;
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
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[29];
  _QWORD v64[31];

  v64[29] = *MEMORY[0x24BDAC8D0];
  v63[0] = CFSTR("torsoHeadTargetMin");
  *(float *)&v2 = self->_torsoHeadTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v62;
  v63[1] = CFSTR("torsoHeadTargetMax");
  *(float *)&v4 = self->_torsoHeadTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v61;
  v63[2] = CFSTR("torsoHeadMarginMin");
  *(float *)&v5 = self->_torsoHeadMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v60;
  v63[3] = CFSTR("torsoHeadMarginMax");
  *(float *)&v6 = self->_torsoHeadMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v59;
  v63[4] = CFSTR("shouldersTwistTargetMin");
  *(float *)&v7 = self->_shouldersTwistTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v58;
  v63[5] = CFSTR("shouldersTwistTargetMax");
  *(float *)&v8 = self->_shouldersTwistTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v57;
  v63[6] = CFSTR("shouldersTwistMarginMin");
  *(float *)&v9 = self->_shouldersTwistMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v56;
  v63[7] = CFSTR("shouldersTwistMarginMax");
  *(float *)&v10 = self->_shouldersTwistMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v55;
  v63[8] = CFSTR("leftElbowTargetMin");
  *(float *)&v11 = self->_leftElbowTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v54;
  v63[9] = CFSTR("leftElbowTargetMax");
  *(float *)&v12 = self->_leftElbowTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v53;
  v63[10] = CFSTR("leftElbowMarginMin");
  *(float *)&v13 = self->_leftElbowMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v52;
  v63[11] = CFSTR("leftElbowMarginMax");
  *(float *)&v14 = self->_leftElbowMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v51;
  v63[12] = CFSTR("rightElbowTargetMin");
  *(float *)&v15 = self->_rightElbowTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v50;
  v63[13] = CFSTR("rightElbowTargetMax");
  *(float *)&v16 = self->_rightElbowTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v49;
  v63[14] = CFSTR("rightElbowMarginMin");
  *(float *)&v17 = self->_rightElbowMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v48;
  v63[15] = CFSTR("rightElbowMarginMax");
  *(float *)&v18 = self->_rightElbowMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v47;
  v63[16] = CFSTR("shouldersHeightAsymmetryTargetMin");
  *(float *)&v19 = self->_shouldersHeightAsymmetryTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[16] = v46;
  v63[17] = CFSTR("shouldersHeightAsymmetryTargetMax");
  *(float *)&v20 = self->_shouldersHeightAsymmetryTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64[17] = v45;
  v63[18] = CFSTR("shouldersHeightAsymmetryMarginMin");
  *(float *)&v21 = self->_shouldersHeightAsymmetryMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[18] = v44;
  v63[19] = CFSTR("shouldersHeightAsymmetryMarginMax");
  *(float *)&v22 = self->_shouldersHeightAsymmetryMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v64[19] = v43;
  v63[20] = CFSTR("leftShoulderForwardTargetMin");
  *(float *)&v23 = self->_leftShoulderForwardTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64[20] = v24;
  v63[21] = CFSTR("leftShoulderForwardTargetMax");
  *(float *)&v25 = self->_leftShoulderForwardTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64[21] = v26;
  v63[22] = CFSTR("leftShoulderForwardMarginMin");
  *(float *)&v27 = self->_leftShoulderForwardMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v64[22] = v28;
  v63[23] = CFSTR("leftShoulderForwardMarginMax");
  *(float *)&v29 = self->_leftShoulderForwardMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[23] = v30;
  v63[24] = CFSTR("rightShoulderForwardTargetMin");
  *(float *)&v31 = self->_rightShoulderForwardTargetMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v64[24] = v32;
  v63[25] = CFSTR("rightShoulderForwardTargetMax");
  *(float *)&v33 = self->_rightShoulderForwardTargetMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[25] = v34;
  v63[26] = CFSTR("rightShoulderForwardMarginMin");
  *(float *)&v35 = self->_rightShoulderForwardMarginMin;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[26] = v36;
  v63[27] = CFSTR("rightShoulderForwardMarginMax");
  *(float *)&v37 = self->_rightShoulderForwardMarginMax;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[27] = v38;
  v63[28] = CFSTR("bestAlignmentToleranceAngleFrontPose");
  *(float *)&v39 = self->_bestAlignmentToleranceAngleFrontPose;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[28] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (float)torsoHeadTargetMin
{
  return self->_torsoHeadTargetMin;
}

- (void)setTorsoHeadTargetMin:(float)a3
{
  self->_torsoHeadTargetMin = a3;
}

- (float)torsoHeadTargetMax
{
  return self->_torsoHeadTargetMax;
}

- (void)setTorsoHeadTargetMax:(float)a3
{
  self->_torsoHeadTargetMax = a3;
}

- (float)torsoHeadMarginMin
{
  return self->_torsoHeadMarginMin;
}

- (void)setTorsoHeadMarginMin:(float)a3
{
  self->_torsoHeadMarginMin = a3;
}

- (float)torsoHeadMarginMax
{
  return self->_torsoHeadMarginMax;
}

- (void)setTorsoHeadMarginMax:(float)a3
{
  self->_torsoHeadMarginMax = a3;
}

- (float)shouldersTwistTargetMin
{
  return self->_shouldersTwistTargetMin;
}

- (void)setShouldersTwistTargetMin:(float)a3
{
  self->_shouldersTwistTargetMin = a3;
}

- (float)shouldersTwistTargetMax
{
  return self->_shouldersTwistTargetMax;
}

- (void)setShouldersTwistTargetMax:(float)a3
{
  self->_shouldersTwistTargetMax = a3;
}

- (float)shouldersTwistMarginMin
{
  return self->_shouldersTwistMarginMin;
}

- (void)setShouldersTwistMarginMin:(float)a3
{
  self->_shouldersTwistMarginMin = a3;
}

- (float)shouldersTwistMarginMax
{
  return self->_shouldersTwistMarginMax;
}

- (void)setShouldersTwistMarginMax:(float)a3
{
  self->_shouldersTwistMarginMax = a3;
}

- (float)leftElbowTargetMin
{
  return self->_leftElbowTargetMin;
}

- (void)setLeftElbowTargetMin:(float)a3
{
  self->_leftElbowTargetMin = a3;
}

- (float)leftElbowTargetMax
{
  return self->_leftElbowTargetMax;
}

- (void)setLeftElbowTargetMax:(float)a3
{
  self->_leftElbowTargetMax = a3;
}

- (float)leftElbowMarginMin
{
  return self->_leftElbowMarginMin;
}

- (void)setLeftElbowMarginMin:(float)a3
{
  self->_leftElbowMarginMin = a3;
}

- (float)leftElbowMarginMax
{
  return self->_leftElbowMarginMax;
}

- (void)setLeftElbowMarginMax:(float)a3
{
  self->_leftElbowMarginMax = a3;
}

- (float)rightElbowTargetMin
{
  return self->_rightElbowTargetMin;
}

- (void)setRightElbowTargetMin:(float)a3
{
  self->_rightElbowTargetMin = a3;
}

- (float)rightElbowTargetMax
{
  return self->_rightElbowTargetMax;
}

- (void)setRightElbowTargetMax:(float)a3
{
  self->_rightElbowTargetMax = a3;
}

- (float)rightElbowMarginMin
{
  return self->_rightElbowMarginMin;
}

- (void)setRightElbowMarginMin:(float)a3
{
  self->_rightElbowMarginMin = a3;
}

- (float)rightElbowMarginMax
{
  return self->_rightElbowMarginMax;
}

- (void)setRightElbowMarginMax:(float)a3
{
  self->_rightElbowMarginMax = a3;
}

- (float)shouldersHeightAsymmetryTargetMin
{
  return self->_shouldersHeightAsymmetryTargetMin;
}

- (void)setShouldersHeightAsymmetryTargetMin:(float)a3
{
  self->_shouldersHeightAsymmetryTargetMin = a3;
}

- (float)shouldersHeightAsymmetryTargetMax
{
  return self->_shouldersHeightAsymmetryTargetMax;
}

- (void)setShouldersHeightAsymmetryTargetMax:(float)a3
{
  self->_shouldersHeightAsymmetryTargetMax = a3;
}

- (float)shouldersHeightAsymmetryMarginMin
{
  return self->_shouldersHeightAsymmetryMarginMin;
}

- (void)setShouldersHeightAsymmetryMarginMin:(float)a3
{
  self->_shouldersHeightAsymmetryMarginMin = a3;
}

- (float)shouldersHeightAsymmetryMarginMax
{
  return self->_shouldersHeightAsymmetryMarginMax;
}

- (void)setShouldersHeightAsymmetryMarginMax:(float)a3
{
  self->_shouldersHeightAsymmetryMarginMax = a3;
}

- (float)leftShoulderForwardTargetMin
{
  return self->_leftShoulderForwardTargetMin;
}

- (void)setLeftShoulderForwardTargetMin:(float)a3
{
  self->_leftShoulderForwardTargetMin = a3;
}

- (float)leftShoulderForwardTargetMax
{
  return self->_leftShoulderForwardTargetMax;
}

- (void)setLeftShoulderForwardTargetMax:(float)a3
{
  self->_leftShoulderForwardTargetMax = a3;
}

- (float)leftShoulderForwardMarginMin
{
  return self->_leftShoulderForwardMarginMin;
}

- (void)setLeftShoulderForwardMarginMin:(float)a3
{
  self->_leftShoulderForwardMarginMin = a3;
}

- (float)leftShoulderForwardMarginMax
{
  return self->_leftShoulderForwardMarginMax;
}

- (void)setLeftShoulderForwardMarginMax:(float)a3
{
  self->_leftShoulderForwardMarginMax = a3;
}

- (float)rightShoulderForwardTargetMin
{
  return self->_rightShoulderForwardTargetMin;
}

- (void)setRightShoulderForwardTargetMin:(float)a3
{
  self->_rightShoulderForwardTargetMin = a3;
}

- (float)rightShoulderForwardTargetMax
{
  return self->_rightShoulderForwardTargetMax;
}

- (void)setRightShoulderForwardTargetMax:(float)a3
{
  self->_rightShoulderForwardTargetMax = a3;
}

- (float)rightShoulderForwardMarginMin
{
  return self->_rightShoulderForwardMarginMin;
}

- (void)setRightShoulderForwardMarginMin:(float)a3
{
  self->_rightShoulderForwardMarginMin = a3;
}

- (float)rightShoulderForwardMarginMax
{
  return self->_rightShoulderForwardMarginMax;
}

- (void)setRightShoulderForwardMarginMax:(float)a3
{
  self->_rightShoulderForwardMarginMax = a3;
}

- (float)bestAlignmentToleranceAngleFrontPose
{
  return self->_bestAlignmentToleranceAngleFrontPose;
}

- (void)setBestAlignmentToleranceAngleFrontPose:(float)a3
{
  self->_bestAlignmentToleranceAngleFrontPose = a3;
}

@end
