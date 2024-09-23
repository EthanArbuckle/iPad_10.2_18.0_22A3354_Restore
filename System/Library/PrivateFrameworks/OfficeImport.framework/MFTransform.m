@implementation MFTransform

- (MFTransform)initWithDriver:(id)a3
{
  id v5;
  char *v6;
  MFTransform *v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFTransform;
  v6 = -[MFTransform init](&v18, sel_init);
  v7 = (MFTransform *)v6;
  if (v6)
  {
    v8 = (_OWORD *)MEMORY[0x24BDBD8B8];
    v9 = *MEMORY[0x24BDBD8B8];
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)(v6 + 40) = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    *(_OWORD *)(v6 + 24) = v10;
    *(_OWORD *)(v6 + 8) = v9;
    *((_QWORD *)v6 + 7) = 0;
    *((_QWORD *)v6 + 8) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v6 + 72) = _Q0;
    *((_QWORD *)v6 + 11) = 0;
    *((_QWORD *)v6 + 12) = 0;
    *(_OWORD *)(v6 + 104) = _Q0;
    v16 = v8[1];
    *(_OWORD *)(v6 + 120) = *v8;
    *(_OWORD *)(v6 + 136) = v16;
    *(_OWORD *)(v6 + 152) = v8[2];
    *((_DWORD *)v6 + 42) = 1;
    objc_storeStrong((id *)v6 + 22, a3);
  }

  return v7;
}

- (int)setMapMode:(int)a3
{
  double v8;

  self->m_mapMode = a3;
  if ((a3 - 7) >= 2)
  {
    if (a3 == 1)
    {
      __asm { FMOV            V0.2D, #1.0 }
      self->m_windowExt = _Q0;
      v8 = 1.0;
LABEL_6:
      self->m_viewportExt.x = v8;
      self->m_viewportExt.y = v8;
      return -[MFTransform updateTransform](self, "updateTransform");
    }
    if ((a3 - 2) <= 4)
    {
      self->m_windowExt = (CGPoint)xmmword_22A4C0D90;
      v8 = -[MFTransform setMapMode:]::metricSize[a3 - 2] * 72.0;
      goto LABEL_6;
    }
  }
  return 0;
}

- (int)updateTransform
{
  __int128 v3;
  float64x2_t v4;
  float64x2_t v5;
  __int128 v6;
  MFDeviceDriver *m_deviceDriver;
  __int128 v8;
  _OWORD v10[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v13;

  v3 = *(_OWORD *)&self->m_world.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->m_world.a;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->m_world.tx;
  t2.b = 0.0;
  t2.c = 0.0;
  v4 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64((float64x2_t)self->m_viewportExt, (float64x2_t)self->m_windowExt)));
  v5 = vmlsq_f64((float64x2_t)self->m_viewportOrg, v4, (float64x2_t)self->m_windowOrg);
  t2.d = v4.f64[1];
  t2.a = v4.f64[0];
  *(float64x2_t *)&t2.tx = v5;
  CGAffineTransformConcat(&v13, &t1, &t2);
  v6 = *(_OWORD *)&v13.c;
  *(_OWORD *)&self->m_combinedTransform.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&self->m_combinedTransform.c = v6;
  *(_OWORD *)&self->m_combinedTransform.tx = *(_OWORD *)&v13.tx;
  m_deviceDriver = self->m_deviceDriver;
  v8 = *(_OWORD *)&self->m_combinedTransform.c;
  v10[0] = *(_OWORD *)&self->m_combinedTransform.a;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&self->m_combinedTransform.tx;
  return -[MFDeviceDriver activateTransform:](m_deviceDriver, "activateTransform:", v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MFTransform *v4;
  uint64_t v6;
  _BYTE v7[48];

  v4 = -[MFTransform initWithDriver:](+[MFTransform allocWithZone:](MFTransform, "allocWithZone:", a3), "initWithDriver:", self->m_deviceDriver);
  -[MFTransform getWorldMatrix](self, "getWorldMatrix");
  -[MFTransform setWorldMatrix:](v4, "setWorldMatrix:", v7);
  -[MFTransform getWindowOrg](self, "getWindowOrg");
  -[MFTransform setWindowOrg:](v4, "setWindowOrg:");
  -[MFTransform getWindowExtent](self, "getWindowExtent");
  -[MFTransform setWindowExt:](v4, "setWindowExt:");
  -[MFTransform getViewportOrg](self, "getViewportOrg");
  -[MFTransform setViewportOrg:](v4, "setViewportOrg:");
  -[MFTransform getViewportExtent](self, "getViewportExtent");
  -[MFTransform setViewportExt:](v4, "setViewportExt:");
  -[MFTransform getTransformMatrix](self, "getTransformMatrix");
  -[MFTransform setTransformMatrix:](v4, "setTransformMatrix:", &v6);
  -[MFTransform setMapMode:](v4, "setMapMode:", -[MFTransform getMapMode](self, "getMapMode"));
  return v4;
}

- (CGAffineTransform)getWorldMatrix
{
  __int128 v3;

  v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

- (void)setWorldMatrix:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_world.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_world.c = v4;
  *(_OWORD *)&self->m_world.a = v3;
}

- (CGPoint)getWindowOrg
{
  double x;
  double y;
  CGPoint result;

  x = self->m_windowOrg.x;
  y = self->m_windowOrg.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setWindowOrg:(CGPoint)a3
{
  self->m_windowOrg = a3;
}

- (CGPoint)getWindowExtent
{
  double x;
  double y;
  CGPoint result;

  x = self->m_windowExt.x;
  y = self->m_windowExt.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setWindowExt:(CGPoint)a3
{
  self->m_windowExt = a3;
}

- (CGPoint)getViewportOrg
{
  double x;
  double y;
  CGPoint result;

  x = self->m_viewportOrg.x;
  y = self->m_viewportOrg.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setViewportOrg:(CGPoint)a3
{
  self->m_viewportOrg = a3;
}

- (CGPoint)getViewportExtent
{
  double x;
  double y;
  CGPoint result;

  x = self->m_viewportExt.x;
  y = self->m_viewportExt.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setViewportExt:(CGPoint)a3
{
  self->m_viewportExt = a3;
}

- (CGAffineTransform)getTransformMatrix
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].b;
  return self;
}

- (void)setTransformMatrix:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_combinedTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_combinedTransform.c = v4;
  *(_OWORD *)&self->m_combinedTransform.a = v3;
}

- (int)getMapMode
{
  return self->m_mapMode;
}

- (int)setWorldTransform:(const CGAffineTransform *)a3
{
  __int128 v4;
  __int128 v5;

  if (fabs(a3->a * a3->d - a3->b * a3->c) < 1.00000001e-10)
    return -1;
  v4 = *(_OWORD *)&a3->a;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_world.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_world.c = v5;
  *(_OWORD *)&self->m_world.a = v4;
  return -[MFTransform updateTransform](self, "updateTransform");
}

- (int)modifyWorldTransform:(const CGAffineTransform *)a3 in_command:(int)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform *p_t1;
  CGAffineTransform *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform t1;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;

  if (a4 == 3)
  {
    if (fabs(a3->a * a3->d - a3->b * a3->c) >= 1.00000001e-10)
    {
      v12 = *(_OWORD *)&self->m_world.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&self->m_world.a;
      *(_OWORD *)&t1.c = v12;
      *(_OWORD *)&t1.tx = *(_OWORD *)&self->m_world.tx;
      v13 = *(_OWORD *)&a3->c;
      v15 = *(_OWORD *)&a3->a;
      v16 = v13;
      v17 = *(_OWORD *)&a3->tx;
      p_t1 = &t1;
      v10 = (CGAffineTransform *)&v15;
      goto LABEL_10;
    }
    return -1;
  }
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      v5 = *MEMORY[0x24BDBD8B8];
      v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&self->m_world.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      *(_OWORD *)&self->m_world.c = v6;
      *(_OWORD *)&self->m_world.a = v5;
    }
    return -[MFTransform updateTransform](self, "updateTransform", a3, v15, v16, v17, *(_QWORD *)&t1.a, *(_QWORD *)&t1.b, *(_QWORD *)&t1.c, *(_QWORD *)&t1.d, *(_QWORD *)&t1.tx, *(_QWORD *)&t1.ty, v19, v20, v21, v22, v23, v24);
  }
  if (fabs(a3->a * a3->d - a3->b * a3->c) < 1.00000001e-10)
    return -1;
  v7 = *(_OWORD *)&a3->c;
  v22 = *(_OWORD *)&a3->a;
  v23 = v7;
  v24 = *(_OWORD *)&a3->tx;
  v8 = *(_OWORD *)&self->m_world.c;
  v19 = *(_OWORD *)&self->m_world.a;
  v20 = v8;
  v21 = *(_OWORD *)&self->m_world.tx;
  p_t1 = (CGAffineTransform *)&v22;
  v10 = (CGAffineTransform *)&v19;
LABEL_10:
  CGAffineTransformConcat(&v25, p_t1, v10);
  v14 = *(_OWORD *)&v25.c;
  *(_OWORD *)&self->m_world.a = *(_OWORD *)&v25.a;
  *(_OWORD *)&self->m_world.c = v14;
  *(_OWORD *)&self->m_world.tx = *(_OWORD *)&v25.tx;
  return -[MFTransform updateTransform](self, "updateTransform", a3, v15, v16, v17, *(_QWORD *)&t1.a, *(_QWORD *)&t1.b, *(_QWORD *)&t1.c, *(_QWORD *)&t1.d, *(_QWORD *)&t1.tx, *(_QWORD *)&t1.ty, v19, v20, v21, v22, v23, v24);
}

- (BOOL)isUpsideDown
{
  return self->m_combinedTransform.d < 0.0;
}

- (int)setWindowExt:(int)a3 in_y:(int)a4
{
  int v4;

  v4 = -1;
  if (a3 && a4)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      self->m_windowExt.x = (double)a3;
      self->m_windowExt.y = (double)a4;
      return -[MFTransform updateTransform](self, "updateTransform");
    }
    return 0;
  }
  return v4;
}

- (int)setViewportExt:(int)a3 in_y:(int)a4
{
  int v4;

  v4 = -1;
  if (a3 && a4)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      self->m_viewportExt.x = (double)a3;
      self->m_viewportExt.y = (double)a4;
      return -[MFTransform updateTransform](self, "updateTransform");
    }
    return 0;
  }
  return v4;
}

- (int)scaleWindowExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  int v6;
  CGFloat v7;

  v6 = -1;
  if (a3 && a4 && a5 && a6)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      v7 = self->m_windowExt.y * (double)a5 / (double)a6;
      self->m_windowExt.x = self->m_windowExt.x * (double)a3 / (double)a4;
      self->m_windowExt.y = v7;
      return -[MFTransform updateTransform](self, "updateTransform");
    }
    return 0;
  }
  return v6;
}

- (int)scaleViewportExt:(int)a3 in_xDenom:(int)a4 in_yNum:(int)a5 in_yDenom:(int)a6
{
  int v6;
  CGFloat v7;

  v6 = -1;
  if (a3 && a4 && a5 && a6)
  {
    if ((self->m_mapMode - 7) <= 1)
    {
      v7 = self->m_viewportExt.y * (double)a5 / (double)a6;
      self->m_viewportExt.x = self->m_viewportExt.x * (double)a3 / (double)a4;
      self->m_viewportExt.y = v7;
      return -[MFTransform updateTransform](self, "updateTransform");
    }
    return 0;
  }
  return v6;
}

- (int)setWindowOrg:(int)a3 in_y:(int)a4
{
  self->m_windowOrg.x = (double)a3;
  self->m_windowOrg.y = (double)a4;
  return -[MFTransform updateTransform](self, "updateTransform");
}

- (int)setViewportOrg:(int)a3 in_y:(int)a4
{
  self->m_viewportOrg.x = (double)a3;
  self->m_viewportOrg.y = (double)a4;
  return -[MFTransform updateTransform](self, "updateTransform");
}

- (int)offsetWindowOrg:(int)a3 in_y:(int)a4
{
  CGFloat v4;

  v4 = self->m_windowOrg.y + (double)a4;
  self->m_windowOrg.x = self->m_windowOrg.x + (double)a3;
  self->m_windowOrg.y = v4;
  return -[MFTransform updateTransform](self, "updateTransform");
}

- (int)offsetViewportOrg:(int)a3 in_y:(int)a4
{
  CGFloat v4;

  v4 = self->m_viewportOrg.y + (double)a4;
  self->m_viewportOrg.x = self->m_viewportOrg.x + (double)a3;
  self->m_viewportOrg.y = v4;
  return -[MFTransform updateTransform](self, "updateTransform");
}

- (CGPoint)DPtoLP:(CGPoint)a3
{
  __int128 v3;
  float64x2_t v4;
  double v5;
  double y;
  double x;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  memset(&v9, 0, sizeof(v9));
  v3 = *(_OWORD *)&self->m_combinedTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->m_combinedTransform.a;
  *(_OWORD *)&v8.c = v3;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->m_combinedTransform.tx;
  CGAffineTransformInvert(&v9, &v8);
  v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  v5 = v4.f64[1];
  result.x = v4.f64[0];
  result.y = v5;
  return result;
}

- (CGPoint)LPtoDP:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  CGPoint result;

  v3 = vaddq_f64(*(float64x2_t *)&self->m_combinedTransform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->m_combinedTransform.c, a3.y), *(float64x2_t *)&self->m_combinedTransform.a, a3.x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_deviceDriver, 0);
}

@end
