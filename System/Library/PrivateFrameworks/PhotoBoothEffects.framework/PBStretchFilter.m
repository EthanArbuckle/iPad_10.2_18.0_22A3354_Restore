@implementation PBStretchFilter

- (void)setDefaults
{
  objc_super v3;

  -[PBStretchFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  -[CIFilter setDefaults](self->super._ciFilter, "setDefaults");
  self->firstTime = 1;
  v3.receiver = self;
  v3.super_class = (Class)PBStretchFilter;
  -[PBFilter setDefaults](&v3, sel_setDefaults);
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
  uint64_t v14;
  uint64_t v15;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBStretchFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  v9 = v8;
  -[PBStretchFilter inputPoint](self, "inputPoint");
  v11 = 1.0 - v10;
  if (v6)
    v11 = v10;
  v12 = width * v9;
  v13 = height * v11;
  if (self->firstTime || self->lastInputX != v12 || self->lastInputY != v13)
  {
    v14 = objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v12, v13);
    v15 = objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", width, height);
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", v14, CFSTR("inputPoint"));
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", v15, CFSTR("inputSize"));
    self->lastInputX = v12;
    self->lastInputY = v13;
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
