@implementation PRDevicePoseValidator

- (PRDevicePoseValidator)initWithMaximumSpeed:(double)a3
{
  PRDevicePoseValidator *v4;
  PRDevicePoseValidator *v5;
  os_log_t v6;
  OS_os_log *logger;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRDevicePoseValidator;
  v4 = -[PRDevicePoseValidator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PRDevicePoseValidator setMaximumSpeed:](v4, "setMaximumSpeed:", a3);
    v6 = os_log_create("com.apple.proximity", "posevalidator");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v6;

  }
  return v5;
}

- (BOOL)validatePose:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  float32x4_t v11;
  void *v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  double v16;
  double v17;
  NSObject *logger;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  float32x4_t v23;
  float32x4_t v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PRDevicePoseValidator previousPose](self, "previousPose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PRDevicePoseValidator setPreviousPose:](self, "setPreviousPose:", v4);
    goto LABEL_9;
  }
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  -[PRDevicePoseValidator previousPose](self, "previousPose");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v10 = v7 - v9;

  if (v10 <= 0.0)
  {
LABEL_7:
    v19 = 0;
    goto LABEL_10;
  }
  if (v10 < 1.0)
    goto LABEL_9;
  objc_msgSend(v4, "pose");
  v24 = v11;
  -[PRDevicePoseValidator previousPose](self, "previousPose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pose");
  v23 = v13;

  v14 = vsubq_f32(v24, v23);
  v15 = vmulq_f32(v14, v14);
  v16 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0])/ v10;
  -[PRDevicePoseValidator setPreviousPose:](self, "setPreviousPose:", v4);
  -[PRDevicePoseValidator maximumSpeed](self, "maximumSpeed");
  if (v16 <= v17)
  {
LABEL_9:
    v19 = 1;
    goto LABEL_10;
  }
  logger = self->_logger;
  v19 = 0;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v20 = logger;
    -[PRDevicePoseValidator maximumSpeed](self, "maximumSpeed");
    *(_DWORD *)buf = 134218240;
    v26 = v16;
    v27 = 2048;
    v28 = v21;
    _os_log_impl(&dword_2230E5000, v20, OS_LOG_TYPE_DEFAULT, "PoseValidator found invalid pose. speed = %f m/s, threshold = %f m/s", buf, 0x16u);

    goto LABEL_7;
  }
LABEL_10:

  return v19;
}

- (double)maximumSpeed
{
  return self->_maximumSpeed;
}

- (void)setMaximumSpeed:(double)a3
{
  self->_maximumSpeed = a3;
}

- (PRPose)previousPose
{
  return self->_previousPose;
}

- (void)setPreviousPose:(id)a3
{
  objc_storeStrong((id *)&self->_previousPose, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPose, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
