@implementation TIKeyboardSecureCandidateRGBColor

- (TIKeyboardSecureCandidateRGBColor)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardSecureCandidateRGBColor *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardSecureCandidateRGBColor;
  v5 = -[TIKeyboardSecureCandidateRGBColor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("colorR"));
    v5->_colorR = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("colorG"));
    v5->_colorG = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("colorB"));
    v5->_colorB = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("colorA"));
    v5->_colorA = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float colorR;
  double v5;
  double colorG;
  double colorB;
  double colorA;
  id v9;

  colorR = self->_colorR;
  v9 = a3;
  *(float *)&v5 = colorR;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("colorR"), v5);
  colorG = self->_colorG;
  *(float *)&colorG = colorG;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("colorG"), colorG);
  colorB = self->_colorB;
  *(float *)&colorB = colorB;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("colorB"), colorB);
  colorA = self->_colorA;
  *(float *)&colorA = colorA;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("colorA"), colorA);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)whiteColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithR:G:B:A:", 1.0, 1.0, 1.0, 1.0);
}

+ (id)blackColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithR:G:B:A:", 0.0, 0.0, 0.0, 1.0);
}

- (TIKeyboardSecureCandidateRGBColor)initWithR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
  TIKeyboardSecureCandidateRGBColor *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardSecureCandidateRGBColor;
  result = -[TIKeyboardSecureCandidateRGBColor init](&v11, sel_init);
  if (result)
  {
    result->_colorR = a3;
    result->_colorG = a4;
    result->_colorB = a5;
    result->_colorA = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(TIKeyboardSecureCandidateRGBColor);
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_colorR;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_colorG;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_colorB;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_colorA;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TIKeyboardSecureCandidateRGBColor colorR](self, "colorR");
  v5 = v4;
  -[TIKeyboardSecureCandidateRGBColor colorG](self, "colorG");
  v7 = v6;
  -[TIKeyboardSecureCandidateRGBColor colorB](self, "colorB");
  v9 = v8;
  -[TIKeyboardSecureCandidateRGBColor colorA](self, "colorA");
  objc_msgSend(v3, "appendFormat:", CFSTR("; textColor = [R:%f, G:%f, B:%f, A:%f]"), v5, v7, v9, v10);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TIKeyboardSecureCandidateRGBColor colorR](self, "colorR");
    v7 = v6;
    objc_msgSend(v5, "colorR");
    if (v7 == v8
      && (-[TIKeyboardSecureCandidateRGBColor colorG](self, "colorG"), v10 = v9, objc_msgSend(v5, "colorG"), v10 == v11)
      && (-[TIKeyboardSecureCandidateRGBColor colorB](self, "colorB"), v13 = v12, objc_msgSend(v5, "colorB"), v13 == v14))
    {
      -[TIKeyboardSecureCandidateRGBColor colorA](self, "colorA");
      v16 = v15;
      objc_msgSend(v5, "colorA");
      v18 = v16 == v17;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (double)colorR
{
  return self->_colorR;
}

- (void)setColorR:(double)a3
{
  self->_colorR = a3;
}

- (double)colorG
{
  return self->_colorG;
}

- (void)setColorG:(double)a3
{
  self->_colorG = a3;
}

- (double)colorB
{
  return self->_colorB;
}

- (void)setColorB:(double)a3
{
  self->_colorB = a3;
}

- (double)colorA
{
  return self->_colorA;
}

- (void)setColorA:(double)a3
{
  self->_colorA = a3;
}

+ (id)lightGrayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithR:G:B:A:", 0.898039216, 0.909803922, 0.917647059, 1.0);
}

@end
