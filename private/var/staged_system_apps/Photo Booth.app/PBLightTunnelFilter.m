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
  -[PBFilter setDefaults](&v5, "setDefaults");
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
  _BOOL8 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  float v19;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBLightTunnelFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  -[PBFilter adjustedInputPoint:mirrored:](self, "adjustedInputPoint:mirrored:", v6);
  v9 = v8;
  v11 = v10;
  -[PBLightTunnelFilter inputRotation](self, "inputRotation");
  -[PBFilter adjustedInputRotation:mirrored:](self, "adjustedInputRotation:mirrored:", v6);
  v13 = v12;
  v14 = width * v9;
  v15 = height * v11;
  v16 = height * v11;
  if ((self->firstTime || self->lastInputRotation != v13)
    && (*(float *)&v15 = v13,
        -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15), CFSTR("inputRotation")), self->lastInputRotation = v13, self->firstTime)|| self->lastInputX != v14|| self->lastInputY != v16)
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v14, v16), CFSTR("inputCenter"));
    self->lastInputX = v14;
    self->lastInputY = v16;
  }
  -[PBLightTunnelFilter inputAmount](self, "inputAmount");
  v18 = fmin(width, height) * 0.5 * v17;
  v19 = v18;
  if (self->firstTime || self->lastInputRadius != v19)
  {
    *(float *)&v18 = v18;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18), CFSTR("inputRadius"));
    self->lastInputRadius = v19;
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
