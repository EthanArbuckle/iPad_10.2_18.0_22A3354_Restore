@implementation PBMirrorFilter

- (void)setDefaults
{
  double v3;
  objc_super v4;

  -[PBMirrorFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = 1070141403;
  -[PBMirrorFilter setInputOrientation:](self, "setInputOrientation:", v3);
  self->firstTime = 1;
  -[CIFilter setDefaults](self->super._ciFilter, "setDefaults");
  v4.receiver = self;
  v4.super_class = (Class)PBMirrorFilter;
  -[PBFilter setDefaults](&v4, "setDefaults");
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
  float v15;
  double v16;
  float v17;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBMirrorFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  -[PBFilter adjustedInputPoint:mirrored:](self, "adjustedInputPoint:mirrored:", v6);
  v9 = v8;
  v11 = v10;
  -[PBMirrorFilter inputOrientation](self, "inputOrientation");
  -[PBFilter adjustedInputOrientation:mirrored:](self, "adjustedInputOrientation:mirrored:", v6);
  v13 = v12;
  v14 = width * v9;
  v15 = height * v11;
  if (!self->firstTime && self->lastInputX == v14 && self->lastInputY == v15)
  {
    v16 = v12 + -3.14159265;
    if (v6)
      v16 = 6.28318531 - v13;
  }
  else
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v14, v15), CFSTR("inputPoint"));
    self->lastInputX = v14;
    self->lastInputY = v15;
    v16 = v13 + -3.14159265;
    if (v6)
      v16 = 6.28318531 - v13;
    if (self->firstTime)
      goto LABEL_8;
  }
  if (v16 != self->lastInputAngle)
  {
LABEL_8:
    v17 = v16;
    *(float *)&v16 = v17;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16), CFSTR("inputAngle"));
    self->lastInputAngle = v17;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return CFSTR("CIMirror");
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

- (float)inputOrientation
{
  return self->inputOrientation;
}

- (void)setInputOrientation:(float)a3
{
  self->inputOrientation = a3;
}

@end
