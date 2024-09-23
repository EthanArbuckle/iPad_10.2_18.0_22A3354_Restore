@implementation WKBokehMotionFilter

- (WKBokehMotionFilter)init
{
  char *v2;
  char *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKBokehMotionFilter;
  v2 = -[WKBokehMotionFilter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 2) = 0x3FEF0A3D80000000;
    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E0C9D538];
    *(_OWORD *)(v2 + 40) = *MEMORY[0x1E0C9D820];
    v4 = -[WKBokehMotionManager initWithCoefficient:threshold:]([WKBokehMotionManager alloc], 0.99000001, 0.00999999978);
    v5 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v4;

    -[WKBokehMotionManager setAccelerometerUpdateInterval:](*((_QWORD *)v3 + 1), 60.0);
    -[WKBokehMotionManager startDeviceAccelerometerUpdates](*((id **)v3 + 1));
  }
  return (WKBokehMotionFilter *)v3;
}

- (void)startDeviceMotionUpdates
{
  if (a1)
    -[WKBokehMotionManager startDeviceMotionUpdates](*(_QWORD *)(a1 + 8));
}

- (_QWORD)stopDeviceMotionUpdates
{
  if (result)
    return -[WKBokehMotionManager stopDeviceMotionUpdates]((_QWORD *)result[1]);
  return result;
}

- (_QWORD)pauseDeviceMotionUpdates
{
  if (result)
    return -[WKBokehMotionManager pauseDeviceMotionUpdates]((_QWORD *)result[1]);
  return result;
}

- (double)_rawPosition
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;

  if (!a1)
    return 0.0;
  v2 = -[WKBokehMotionManager x](*(_QWORD *)(a1 + 8));
  v3 = -[WKBokehMotionFilter filterCoefficient](*(_QWORD *)(a1 + 8));
  v4 = -[WKBokehMotionManager z](*(_QWORD *)(a1 + 8));
  v5 = sqrtf((float)((float)(v3 * v3) + (float)(v2 * v2)) + (float)(v4 * v4));
  if (v5 <= 0.0)
    v6 = 1.0;
  else
    v6 = 1.0 / v5;
  return (float)(roundf((float)(v6 * v2) * 70.0) / 70.0);
}

- (double)_orientPosition:(double)a3
{
  if (!a1)
    return 0.0;
  switch(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation"))
  {
    case 2:
      a3 = -a2;
      break;
    case 3:
      a3 = -a3;
      break;
    case 4:
      return a3;
    default:
      a3 = a2;
      break;
  }
  return a3;
}

- (float64_t)_transformPosition:(float64x2_t)a3
{
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;

  if (a1)
  {
    a3.f64[1] = a2;
    __asm { FMOV            V0.2D, #0.5 }
    v8 = vmulq_f64(a3, _Q0);
    v9 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    v10 = vdivq_f64(vrndaq_f64(vmulq_f64(v8, v9)), v9);
  }
  else
  {
    v10.f64[1] = 0.0;
  }
  return v10.f64[1];
}

- (double)_clampPosition:(uint64_t)a1
{
  if (!a1)
    return 0.0;
  if (a2 < -0.5)
    a2 = -0.5;
  return fmin(a2, 0.5);
}

- (double)_filterPosition:(double)a3
{
  float v3;
  double v4;
  double v5;
  double result;
  double v7;

  if (!a1)
    return 0.0;
  v3 = a1[2];
  v4 = v3;
  v5 = (float)(1.0 - v3);
  result = a2 * v5 + v4 * a1[3];
  v7 = a3 * v5 + v4 * a1[4];
  a1[3] = result;
  a1[4] = v7;
  return result;
}

- (double)position
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (double)displacement
{
  if (a1)
    return *(double *)(a1 + 40);
  else
    return 0.0;
}

- (float64x2_t)updatePosition
{
  double v2;
  double v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t result;
  float64x2_t v17;

  if (a1)
  {
    v17 = *(float64x2_t *)(a1 + 24);
    v2 = -[WKBokehMotionFilter _rawPosition](a1);
    v4.f64[0] = -[WKBokehMotionFilter _orientPosition:](a1, v2, v3);
    v4.f64[1] = v5;
    __asm { FMOV            V1.2D, #0.5 }
    v11 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    v12 = vdivq_f64(vrndaq_f64(vmulq_f64(vmulq_f64(v4, _Q1), v11)), v11);
    __asm { FMOV            V2.2D, #-0.5 }
    v14 = vminnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, v12), (int8x16_t)_Q2, (int8x16_t)v12), _Q1);
    *(float *)_Q1.f64 = *(double *)(a1 + 16);
    v15 = vmlaq_n_f64(vmulq_n_f64(v14, (float)(1.0 - *(float *)_Q1.f64)), *(float64x2_t *)(a1 + 24), *(float *)_Q1.f64);
    *(float64x2_t *)(a1 + 24) = v15;
    result = vsubq_f64(v15, v17);
    *(float64x2_t *)(a1 + 40) = result;
  }
  return result;
}

- (double)filterCoefficient
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (uint64_t)setFilterCoefficient:(uint64_t)result
{
  if (result)
    *(double *)(result + 16) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
}

@end
