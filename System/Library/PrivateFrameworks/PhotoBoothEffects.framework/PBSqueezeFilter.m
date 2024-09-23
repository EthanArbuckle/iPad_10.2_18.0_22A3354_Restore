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
  -[PBFilter setDefaults](&v4, sel_setDefaults);
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
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  _BOOL4 v14;
  float v15;
  float inputAmount;
  float v17;
  double v18;
  float v19;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3;
  -[PBSqueezeFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  v9 = v8;
  -[PBSqueezeFilter inputPoint](self, "inputPoint");
  v11 = 1.0 - v10;
  if (v6)
    v11 = v10;
  v12 = width * v9;
  v13 = height * v11;
  if (!self->firstTime && self->lastInputX == v12 && self->lastInputY == v13)
  {
    v14 = 1;
  }
  else
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v12, v13), CFSTR("inputCenter"));
    self->lastInputX = v12;
    self->lastInputY = v13;
    v14 = !self->firstTime;
  }
  v15 = hypot(width, height);
  inputAmount = self->_inputAmount;
  v17 = (float)(inputAmount * v15) * 0.215;
  v18 = inputAmount * 1.413;
  v19 = v18;
  if ((!v14 || self->lastInputRadius != v17)
    && (*(float *)&v18 = v17,
        -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18), CFSTR("inputRadius")), self->lastInputRadius = v17, self->firstTime)|| self->lastInputScale != v19)
  {
    *(float *)&v18 = v19;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18), CFSTR("inputScale"));
    self->lastInputScale = v19;
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
