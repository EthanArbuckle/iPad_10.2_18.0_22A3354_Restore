@implementation _UIFontSystemCacheKey

- (BOOL)_isEqualToKey:(id)a3
{
  NSString *design;
  _BOOL4 v6;
  double weight;
  double v8;
  NSNumber *width;
  uint64_t v10;
  double pointSize;
  double v12;
  int monospacedDigits;
  int textLegibility;

  if (self->super._hash != *((_QWORD *)a3 + 1) || self->_traits != *((_DWORD *)a3 + 5))
    goto LABEL_14;
  design = self->_design;
  if (design == *((NSString **)a3 + 3) || (v6 = -[NSString isEqualToString:](design, "isEqualToString:")))
  {
    weight = self->_weight;
    objc_msgSend(a3, "weight");
    if (vabdd_f64(weight, v8) < 0.00000011920929)
    {
      width = self->_width;
      v10 = *((_QWORD *)a3 + 5);
      if (width)
      {
        if (!v10)
          goto LABEL_14;
        v6 = -[NSNumber isEqualToNumber:](width, "isEqualToNumber:");
        if (!v6)
          return v6;
      }
      else if (v10)
      {
        goto LABEL_14;
      }
      pointSize = self->_pointSize;
      objc_msgSend(a3, "pointSize");
      if (vabdd_f64(pointSize, v12) < 0.00000011920929)
      {
        monospacedDigits = self->_monospacedDigits;
        if (monospacedDigits == objc_msgSend(a3, "monospacedDigits"))
        {
          textLegibility = self->_textLegibility;
          LOBYTE(v6) = textLegibility == objc_msgSend(a3, "textLegibility");
          return v6;
        }
      }
    }
LABEL_14:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (double)weight
{
  return self->_weight;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (BOOL)textLegibility
{
  return self->_textLegibility;
}

- (BOOL)monospacedDigits
{
  return self->_monospacedDigits;
}

- (unint64_t)_hash
{
  uint64_t traits;
  NSUInteger v4;
  double weight;
  NSNumber *width;
  uint64_t v7;

  traits = self->_traits;
  v4 = -[NSString hash](self->_design, "hash");
  weight = self->_weight;
  width = self->_width;
  if (width)
    v7 = -[NSNumber hash](width, "hash");
  else
    v7 = -1;
  return v4 ^ traits ^ v7 ^ vcvtmd_u64_f64(weight * 100.0) ^ vcvtmd_u64_f64(self->_pointSize * 100.0) ^ self->_monospacedDigits ^ self->_textLegibility;
}

- (void)setWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setTextLegibility:(BOOL)a3
{
  self->_textLegibility = a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFontSystemCacheKey;
  -[_UIFontSystemCacheKey dealloc](&v3, sel_dealloc);
}

- (void)setTraits:(int)a3
{
  self->_traits = a3;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void)setMonospacedDigits:(BOOL)a3
{
  self->_monospacedDigits = a3;
}

- (void)setDesign:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("system, traits: %ld, pointSize: %g"), self->_traits, *(_QWORD *)&self->_pointSize);
}

- (int)traits
{
  return self->_traits;
}

- (NSString)design
{
  return self->_design;
}

- (NSNumber)width
{
  return self->_width;
}

@end
