@implementation VGExpressionFilterLegacy

+ (id)getFrontExpressionFiltersForCaptureOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VGExpressionIsEyesNeutralOpenFilter *v6;
  VGExpressionIsEyesNeutralOpenFilter *v7;
  VGExpressionIsEyesForwardLookAtFilter *v8;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  double v14;
  VGExpressionIsEyesForwardLookAtFilter *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "ensureNeutralExpressionOnFrontPose"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (objc_msgSend(v3, "ensureEyesOpenOnFrontPose"))
  {
    v6 = [VGExpressionIsEyesNeutralOpenFilter alloc];
    objc_msgSend(v3, "eyesOpenSensitivity");
    v7 = -[VGExpressionIsEyesNeutralOpenFilter initWithEyesOpenSensitivity:](v6, "initWithEyesOpenSensitivity:");
    objc_msgSend(v4, "addObject:", v7);

  }
  if (objc_msgSend(v3, "ensureEyesForwardOnFrontPose"))
  {
    if (objc_msgSend(v3, "useLookAtForEyesForward"))
      v8 = [VGExpressionIsEyesForwardLookAtFilter alloc];
    else
      v8 = [VGExpressionIsEyesForwardFilter alloc];
    objc_msgSend(v3, "eyesForwardYawSensitivity");
    v10 = v9;
    objc_msgSend(v3, "eyesForwardPitchSensitivity");
    v11 = v10 * 3.14159265 / 180.0;
    v12 = v11;
    v14 = v13 * 3.14159265 / 180.0;
    *(float *)&v11 = v14;
    *(float *)&v14 = v12;
    v15 = -[VGExpressionIsEyesForwardLookAtFilter initWithEyesForwardYawSensitivity:eyesForwardPitchSensitivity:](v8, "initWithEyesForwardYawSensitivity:eyesForwardPitchSensitivity:", v14, v11);
    objc_msgSend(v4, "addObject:", v15);

  }
  return v4;
}

+ (id)getExpressionFiltersForCaptureOptions:(id)a3
{
  id v3;
  void *v4;
  VGExpressionIsAlmostNeutralFilter *v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  VGExpressionIsAlmostNeutralFilter *v11;
  VGExpressionIsEyesNeutralOpenFilter *v12;
  VGExpressionIsEyesNeutralOpenFilter *v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "ensureAlmostNeutralExpressionOnNonFrontPose"))
  {
    v5 = [VGExpressionIsAlmostNeutralFilter alloc];
    objc_msgSend(v3, "neutralExpressionLowerBound");
    v7 = v6;
    objc_msgSend(v3, "neutralExpressionUpperBound");
    LODWORD(v9) = v8;
    LODWORD(v10) = v7;
    v11 = -[VGExpressionIsAlmostNeutralFilter initWithLowerBound:withUpperBound:](v5, "initWithLowerBound:withUpperBound:", v10, v9);
    objc_msgSend(v4, "addObject:", v11);

  }
  if (objc_msgSend(v3, "ensureEyesOpenOnNonFrontPose"))
  {
    v12 = [VGExpressionIsEyesNeutralOpenFilter alloc];
    objc_msgSend(v3, "eyesOpenSensitivity");
    v13 = -[VGExpressionIsEyesNeutralOpenFilter initWithEyesOpenSensitivity:](v12, "initWithEyesOpenSensitivity:");
    objc_msgSend(v4, "addObject:", v13);

  }
  return v4;
}

- (int)rejectionReason
{
  return 16;
}

+ (id)getBlendshapes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("tracked_faces"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("smooth_data"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("animation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("blendshapes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "length");
      +[VGFaceTrackerHelper blendshapeNames](VGFaceTrackerHelper, "blendshapeNames");

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (float)clip_to_01:(float)a3 min_val:(float)a4 max_val:(float)a5
{
  float result;
  BOOL v6;

  if (a3 <= a4)
    a3 = a4;
  if (a4 >= a5)
  {
    if (a4 == a5)
    {
      v6 = a3 < a5;
      result = 1.0;
      if (v6)
        return 0.0;
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    if (a3 >= a5)
      a3 = a5;
    return (float)(a3 - a4) / (float)(a5 - a4);
  }
  return result;
}

- (float)filter:(id)a3
{
  return 1.0;
}

@end
