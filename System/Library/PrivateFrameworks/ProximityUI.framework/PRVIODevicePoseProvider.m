@implementation PRVIODevicePoseProvider

- (PRVIODevicePoseProvider)initWithARSession:(id)a3
{
  id v4;
  PRVIODevicePoseProvider *v5;
  PRDevicePoseValidator *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRVIODevicePoseProvider;
  v5 = -[PRVIODevicePoseProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PRDevicePoseValidator initWithMaximumSpeed:]([PRDevicePoseValidator alloc], "initWithMaximumSpeed:", 4.0);
    -[PRVIODevicePoseProvider setPoseValidator:](v5, "setPoseValidator:", v6);

    -[PRVIODevicePoseProvider setTrackingNormal:](v5, "setTrackingNormal:", 0);
    -[PRVIODevicePoseProvider setSession:](v5, "setSession:", v4);
    -[PRVIODevicePoseProvider session](v5, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v5);

  }
  return v5;
}

- (void)reset
{
  void *v3;
  void *v4;
  id v5;

  -[PRVIODevicePoseProvider setTrackingNormal:](self, "setTrackingNormal:", 0);
  -[PRVIODevicePoseProvider session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRVIODevicePoseProvider session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runWithConfiguration:options:", v4, 15);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  id v23;
  _OWORD v24[5];

  v23 = a4;
  objc_msgSend(v23, "camera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "trackingState");

  if (v6 == 2)
  {
    -[PRVIODevicePoseProvider setTrackingNormal:](self, "setTrackingNormal:", 1);
    objc_msgSend(v23, "camera");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transform");
    v21 = v9;
    v22 = v8;
    v19 = v11;
    v20 = v10;

    objc_msgSend(v23, "timestamp");
    v12 = 0;
    v24[0] = xmmword_223119380;
    v24[1] = xmmword_223119390;
    v24[2] = xmmword_2231193A0;
    v24[3] = xmmword_223119290;
    do
    {
      v24[v12 + 4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(v24[v12])), v21, *(float32x2_t *)&v24[v12], 1), v20, (float32x4_t)v24[v12], 2), v19, (float32x4_t)v24[v12], 3);
      ++v12;
    }
    while (v12 != 4);
    +[PRPose poseWithTime:pose:](PRPose, "poseWithTime:pose:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRVIODevicePoseProvider poseValidator](self, "poseValidator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "validatePose:", v13);

    -[PRDevicePoseProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "devicePoseUpdated:", v13);
    }
    else
    {
      -[PRVIODevicePoseProvider reset](self, "reset");
      objc_msgSend(v17, "invalidPoseDetected");
    }

  }
  else
  {
    NSLog(CFSTR("camera tracking state not normal"));
    if (-[PRVIODevicePoseProvider trackingNormal](self, "trackingNormal"))
    {
      -[PRDevicePoseProvider delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "invalidPoseDetected");

      -[PRVIODevicePoseProvider setTrackingNormal:](self, "setTrackingNormal:", 0);
    }
  }

}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (PRDevicePoseValidator)poseValidator
{
  return self->_poseValidator;
}

- (void)setPoseValidator:(id)a3
{
  objc_storeStrong((id *)&self->_poseValidator, a3);
}

- (BOOL)trackingNormal
{
  return self->_trackingNormal;
}

- (void)setTrackingNormal:(BOOL)a3
{
  self->_trackingNormal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poseValidator, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
