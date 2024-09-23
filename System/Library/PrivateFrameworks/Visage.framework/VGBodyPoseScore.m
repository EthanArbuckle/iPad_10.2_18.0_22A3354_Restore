@implementation VGBodyPoseScore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGBodyPoseScore)initWithCoder:(id)a3
{
  id v4;
  VGBodyPoseScore *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  VGBodyPoseScore *v12;

  v4 = a3;
  v5 = -[VGBodyPoseScore init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("value"));
    v5->_value = v6;
    v5->_feedback = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("feedback"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rawValue"));
    v5->_rawValue = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rawValueTargetMin"));
    v5->_rawValueTargetMin = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rawValueTargetMax"));
    v5->_rawValueTargetMax = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rawValueMarginMin"));
    v5->_rawValueMarginMin = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rawValueMarginMax"));
    v5->_rawValueMarginMax = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  *(float *)&v5 = self->_value;
  v11 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("value"), v5);
  objc_msgSend(v11, "encodeInt:forKey:", LODWORD(self->_feedback), CFSTR("feedback"));
  *(float *)&v6 = self->_rawValue;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("rawValue"), v6);
  *(float *)&v7 = self->_rawValueTargetMin;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("rawValueTargetMin"), v7);
  *(float *)&v8 = self->_rawValueTargetMax;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("rawValueTargetMax"), v8);
  *(float *)&v9 = self->_rawValueMarginMin;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("rawValueMarginMin"), v9);
  *(float *)&v10 = self->_rawValueMarginMax;
  objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("rawValueMarginMax"), v10);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float *)v4;
    v6 = self->_value == v5[2]
      && self->_feedback == *((_QWORD *)v5 + 4)
      && self->_rawValue == v5[3]
      && self->_rawValueTargetMin == v5[4]
      && self->_rawValueTargetMax == v5[5]
      && self->_rawValueMarginMin == v5[6]
      && self->_rawValueMarginMax == v5[7];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (unint64_t)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(unint64_t)a3
{
  self->_feedback = a3;
}

- (float)rawValue
{
  return self->_rawValue;
}

- (void)setRawValue:(float)a3
{
  self->_rawValue = a3;
}

- (float)rawValueTargetMin
{
  return self->_rawValueTargetMin;
}

- (void)setRawValueTargetMin:(float)a3
{
  self->_rawValueTargetMin = a3;
}

- (float)rawValueTargetMax
{
  return self->_rawValueTargetMax;
}

- (void)setRawValueTargetMax:(float)a3
{
  self->_rawValueTargetMax = a3;
}

- (float)rawValueMarginMin
{
  return self->_rawValueMarginMin;
}

- (void)setRawValueMarginMin:(float)a3
{
  self->_rawValueMarginMin = a3;
}

- (float)rawValueMarginMax
{
  return self->_rawValueMarginMax;
}

- (void)setRawValueMarginMax:(float)a3
{
  self->_rawValueMarginMax = a3;
}

@end
