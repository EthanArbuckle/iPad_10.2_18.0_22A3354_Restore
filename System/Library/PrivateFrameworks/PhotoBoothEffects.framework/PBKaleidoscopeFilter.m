@implementation PBKaleidoscopeFilter

- (BOOL)allowAbsoluteGestures
{
  return 0;
}

- (void)setDefaults
{
  double v3;
  double v4;
  objc_super v5;

  -[PBKaleidoscopeFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = -1095253570;
  -[PBKaleidoscopeFilter setInputRotation:](self, "setInputRotation:", v3);
  LODWORD(v4) = 1060320051;
  -[PBKaleidoscopeFilter setInputAmount:](self, "setInputAmount:", v4);
  self->firstTime = 1;
  -[CIFilter setDefaults](self->super._ciFilter, "setDefaults");
  v5.receiver = self;
  v5.super_class = (Class)PBKaleidoscopeFilter;
  -[PBFilter setDefaults](&v5, sel_setDefaults);
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
  double v25;
  float v26;
  _BOOL4 v27;
  float inputAmount;
  double v29;
  double v30;
  float v31;
  float v32;

  height = a4.size.height;
  width = a4.size.width;
  -[PBKaleidoscopeFilter inputPoint](self, "inputPoint", a4.origin.x, a4.origin.y);
  v9 = v8;
  -[PBKaleidoscopeFilter inputPoint](self, "inputPoint");
  v11 = v10;
  if (a3)
  {
    if (self->firstTime
      || (lastInputRotation = self->lastInputRotation,
          -[PBKaleidoscopeFilter inputRotation](self, "inputRotation"),
          lastInputRotation != v13))
    {
      ciFilter = self->super._ciFilter;
      v15 = (void *)MEMORY[0x24BDD16E0];
      -[PBKaleidoscopeFilter inputRotation](self, "inputRotation");
      -[CIFilter setValue:forKey:](ciFilter, "setValue:forKey:", objc_msgSend(v15, "numberWithFloat:"), CFSTR("inputRotation"));
      -[PBKaleidoscopeFilter inputRotation](self, "inputRotation");
LABEL_8:
      self->lastInputRotation = v16;
    }
  }
  else
  {
    v11 = 1.0 - v10;
    if (self->firstTime
      || (v17 = self->lastInputRotation, -[PBKaleidoscopeFilter inputRotation](self, "inputRotation"),
                                         v17 != (float)-v18))
    {
      v19 = self->super._ciFilter;
      v20 = (void *)MEMORY[0x24BDD16E0];
      -[PBKaleidoscopeFilter inputRotation](self, "inputRotation");
      *(float *)&v22 = -v21;
      -[CIFilter setValue:forKey:](v19, "setValue:forKey:", objc_msgSend(v20, "numberWithFloat:", v22), CFSTR("inputRotation"));
      -[PBKaleidoscopeFilter inputRotation](self, "inputRotation");
      v16 = -v23;
      goto LABEL_8;
    }
  }
  v24 = width * v9;
  v25 = height * v11;
  v26 = height * v11;
  if (!self->firstTime && self->lastInputX == v24 && self->lastInputY == v26)
  {
    v27 = 1;
  }
  else
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v24, v26), CFSTR("inputPoint"));
    self->lastInputX = v24;
    self->lastInputY = v26;
    v27 = !self->firstTime;
  }
  inputAmount = self->_inputAmount;
  if (width >= height)
    v29 = height;
  else
    v29 = width;
  v30 = v29 * inputAmount * 1.73205081;
  v31 = v30 * 0.5;
  if (v27 && self->lastInputSize == v31)
  {
    v32 = (float)(inputAmount * -0.1) + 0.95;
  }
  else
  {
    *(float *)&v25 = v30 * 0.5;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25), CFSTR("inputSize"));
    self->lastInputSize = v31;
    v32 = (float)(self->_inputAmount * -0.1) + 0.95;
    if (self->firstTime)
    {
LABEL_22:
      *(float *)&v25 = v32;
      -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25), CFSTR("inputDecay"));
      self->lastInputDecay = v32;
      goto LABEL_23;
    }
  }
  if (self->lastInputDecay != v32)
    goto LABEL_22;
LABEL_23:
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return CFSTR("CITriangleKaleidoscope");
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
