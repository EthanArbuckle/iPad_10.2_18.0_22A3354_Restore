@implementation PBSqueezeFilter

- (void)setDefaults
{
  double v3;
  objc_super v4;

  -[PBSqueezeFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = 0.5;
  -[PBSqueezeFilter setInputAmount:](self, "setInputAmount:", v3);
  self->firstTime = 1;
  -[CIFilter setDefaults](self->super._ciFilter, "setDefaults");
  v4.receiver = self;
  v4.super_class = (Class)PBSqueezeFilter;
  -[PBFilter setDefaults](&v4, "setDefaults");
}

- (float)inputAmount
{
  return self->_inputAmount;
}

- (void)setInputAmount:(float)a3
{
  float v3;

  v3 = fmin(fmax(a3, 0.1), 1.0);
  self->_inputAmount = v3;
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  _BOOL8 v6;
  double v8;
  float v9;
  double v10;
  float v11;
  _BOOL4 v12;
  float v13;
  float inputAmount;
  float v15;
  double v16;
  float v17;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBSqueezeFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  -[PBFilter adjustedInputPoint:mirrored:](self, "adjustedInputPoint:mirrored:", v6);
  v9 = width * v8;
  v11 = height * v10;
  if (!self->firstTime && self->lastInputX == v9 && self->lastInputY == v11)
  {
    v12 = 1;
  }
  else
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v9, v11), CFSTR("inputCenter"));
    self->lastInputX = v9;
    self->lastInputY = v11;
    v12 = !self->firstTime;
  }
  v13 = hypot(width, height);
  inputAmount = self->_inputAmount;
  v15 = (float)(inputAmount * v13) * 0.215;
  v16 = inputAmount * 1.413;
  v17 = v16;
  if ((!v12 || self->lastInputRadius != v15)
    && (*(float *)&v16 = v15,
        -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16), CFSTR("inputRadius")), self->lastInputRadius = v15, self->firstTime)|| self->lastInputScale != v17)
  {
    *(float *)&v16 = v17;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16), CFSTR("inputScale"));
    self->lastInputScale = v17;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return CFSTR("CIPinchDistortion");
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

@end
