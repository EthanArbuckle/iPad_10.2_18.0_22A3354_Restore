@implementation VGExpressionIsEyesForwardFilter

- (int)rejectionReason
{
  return 19;
}

- (VGExpressionIsEyesForwardFilter)initWithEyesForwardYawSensitivity:(float)a3 eyesForwardPitchSensitivity:(float)a4
{
  VGExpressionIsEyesForwardFilter *v6;
  VGExpressionIsEyesForwardFilter *v7;
  VGExpressionIsEyesForwardFilter *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VGExpressionIsEyesForwardFilter;
  v6 = -[VGExpressionIsEyesForwardFilter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_eyesForwardYawSensitivityInRadians = a3;
    v6->_eyesForwardPitchSensitivityInRadians = a4;
    v8 = v6;
  }

  return v7;
}

- (float)filter:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  NSObject *v23;
  float v24;
  float eyesForwardPitchSensitivityInRadians;
  float eyesForwardYawSensitivityInRadians;
  int v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("tracked_faces"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.0;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("smooth_data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("animation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("left_eye_pitch"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("left_eye_yaw"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("right_eye_pitch"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v19 = v18;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("right_eye_yaw"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

      __VGLogSharedInstance();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v28 = 134218752;
        v29 = v16;
        v30 = 2048;
        v31 = v13;
        v32 = 2048;
        v33 = v22;
        v34 = 2048;
        v35 = v19;
        _os_log_impl(&dword_249CAD000, v23, OS_LOG_TYPE_DEBUG, " Left eye (yaw/pitch): %f %f, Right eye (yaw/pitch): %f %f ", (uint8_t *)&v28, 0x2Au);
      }

      v24 = fabsf(v13);
      eyesForwardPitchSensitivityInRadians = self->_eyesForwardPitchSensitivityInRadians;
      v6 = 0.0;
      if (v24 < eyesForwardPitchSensitivityInRadians)
      {
        eyesForwardYawSensitivityInRadians = self->_eyesForwardYawSensitivityInRadians;
        if (fabsf(v16) < eyesForwardYawSensitivityInRadians && fabsf(v19) < eyesForwardPitchSensitivityInRadians)
        {
          if (fabsf(v22) >= eyesForwardYawSensitivityInRadians)
            v6 = 0.0;
          else
            v6 = 1.0;
        }
      }

    }
  }

  return v6;
}

@end
