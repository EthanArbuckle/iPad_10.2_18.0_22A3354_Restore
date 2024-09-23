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
  -[PBFilter setDefaults](&v4, sel_setDefaults);
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  double height;
  double width;
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  float v18;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBMirrorFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  v9 = v8;
  -[PBMirrorFilter inputPoint](self, "inputPoint");
  v11 = 1.0 - v10;
  if (v6)
    v11 = v10;
  v12 = width * v9;
  v13 = height * v11;
  if (self->firstTime || self->lastInputX != v12 || self->lastInputY != v13)
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v12, v13), CFSTR("inputPoint"));
    self->lastInputX = v12;
    self->lastInputY = v13;
  }
  -[PBMirrorFilter inputOrientation](self, "inputOrientation");
  v15 = v14;
  v16 = 6.28318531 - v15;
  v17 = v15 + -3.14159265;
  if (v6)
    v17 = v16;
  if (self->firstTime || v17 != self->lastInputAngle)
  {
    v18 = v17;
    *(float *)&v17 = v18;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17), CFSTR("inputAngle"));
    self->lastInputAngle = v18;
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
