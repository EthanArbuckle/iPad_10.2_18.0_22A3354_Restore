@implementation PBLightTunnelFilter

- (void)setDefaults
{
  double v3;
  double v4;
  objc_super v5;

  -[PBLightTunnelFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = 0.5;
  -[PBLightTunnelFilter setInputAmount:](self, "setInputAmount:", v3);
  LODWORD(v4) = 0;
  -[PBLightTunnelFilter setInputRotation:](self, "setInputRotation:", v4);
  self->firstTime = 1;
  -[CIFilter setDefaults](self->super._ciFilter, "setDefaults");
  v5.receiver = self;
  v5.super_class = (Class)PBLightTunnelFilter;
  -[PBFilter setDefaults](&v5, sel_setDefaults);
}

- (float)inputAmount
{
  return self->_inputAmount;
}

- (void)setInputAmount:(float)a3
{
  float v3;

  v3 = fmin(fmax(a3, 0.2), 1.0);
  self->_inputAmount = v3;
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  float lastInputRotation;
  float v13;
  CIFilter *ciFilter;
  void *v15;
  float v16;
  float v17;
  float v18;
  CIFilter *v19;
  void *v20;
  float v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v27;
  float v28;

  height = a4.size.height;
  width = a4.size.width;
  -[PBLightTunnelFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  v9 = v8;
  -[PBLightTunnelFilter inputPoint](self, "inputPoint");
  v11 = v10;
  if (a3)
  {
    if (self->firstTime
      || (lastInputRotation = self->lastInputRotation,
          -[PBLightTunnelFilter inputRotation](self, "inputRotation"),
          lastInputRotation != v13))
    {
      ciFilter = self->super._ciFilter;
      v15 = (void *)MEMORY[0x24BDD16E0];
      -[PBLightTunnelFilter inputRotation](self, "inputRotation");
      -[CIFilter setValue:forKey:](ciFilter, "setValue:forKey:", objc_msgSend(v15, "numberWithFloat:"), CFSTR("inputRotation"));
      -[PBLightTunnelFilter inputRotation](self, "inputRotation");
LABEL_8:
      self->lastInputRotation = v16;
    }
  }
  else
  {
    v11 = 1.0 - v10;
    if (self->firstTime
      || (v17 = self->lastInputRotation, -[PBLightTunnelFilter inputRotation](self, "inputRotation"), v17 != (float)-v18))
    {
      v19 = self->super._ciFilter;
      v20 = (void *)MEMORY[0x24BDD16E0];
      -[PBLightTunnelFilter inputRotation](self, "inputRotation");
      *(float *)&v22 = -v21;
      -[CIFilter setValue:forKey:](v19, "setValue:forKey:", objc_msgSend(v20, "numberWithFloat:", v22), CFSTR("inputRotation"));
      -[PBLightTunnelFilter inputRotation](self, "inputRotation");
      v16 = -v23;
      goto LABEL_8;
    }
  }
  v24 = width * v9;
  v25 = height * v11;
  if (self->firstTime || self->lastInputX != v24 || self->lastInputY != v25)
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v24, v25), CFSTR("inputCenter"));
    self->lastInputX = v24;
    self->lastInputY = v25;
  }
  -[PBLightTunnelFilter inputAmount](self, "inputAmount");
  v27 = fmin(width, height) * 0.5 * v26;
  v28 = v27;
  if (self->firstTime || self->lastInputRadius != v28)
  {
    *(float *)&v27 = v27;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27), CFSTR("inputRadius"));
    self->lastInputRadius = v28;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return CFSTR("CILightTunnel");
}

- (BOOL)needsWrapMirror
{
  return 1;
}

- (CGPoint)inputPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->inputPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setInputPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->inputPoint, &v3, 16, 1, 0);
}

- (float)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(float)a3
{
  self->inputRotation = a3;
}

@end
