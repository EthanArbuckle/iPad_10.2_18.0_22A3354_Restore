@implementation PBStretchFilter

- (void)setDefaults
{
  objc_super v3;

  -[PBStretchFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  -[CIFilter setDefaults](self->super._ciFilter, "setDefaults");
  self->firstTime = 1;
  v3.receiver = self;
  v3.super_class = (Class)PBStretchFilter;
  -[PBFilter setDefaults](&v3, "setDefaults");
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  double height;
  double width;
  _BOOL8 v6;
  double v8;
  float v9;
  double v10;
  float v11;
  CIVector *v12;
  CIVector *v13;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBStretchFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  -[PBFilter adjustedInputPoint:mirrored:](self, "adjustedInputPoint:mirrored:", v6);
  v9 = width * v8;
  v11 = height * v10;
  if (self->firstTime || self->lastInputX != v9 || self->lastInputY != v11)
  {
    v12 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v9, v11);
    v13 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", width, height);
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", v12, CFSTR("inputPoint"));
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", v13, CFSTR("inputSize"));
    self->lastInputX = v9;
    self->lastInputY = v11;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return CFSTR("CIStretch");
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
