@implementation VGFaceSelectionFrustum

- (VGFaceSelectionFrustum)init
{
  VGFaceSelectionFrustum *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  VGFaceSelectionFrustum *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VGFaceSelectionFrustum;
  v2 = -[VGFaceSelectionFrustum init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultYawOffsetLeft");
    v2->_yawOffsetLeft = v3;
    objc_msgSend((id)objc_opt_class(), "defaultYawOffsetRight");
    v2->_yawOffsetRight = v4;
    objc_msgSend((id)objc_opt_class(), "defaultPitchOffsetTop");
    v2->_pitchOffsetTop = v5;
    objc_msgSend((id)objc_opt_class(), "defaultPitchOffsetBottom");
    v2->_pitchOffsetBottom = v6;
    v7 = v2;
  }

  return v2;
}

+ (float)defaultYawOffsetLeft
{
  return 10.0;
}

+ (float)defaultYawOffsetRight
{
  return 10.0;
}

+ (float)defaultPitchOffsetTop
{
  return 10.0;
}

+ (float)defaultPitchOffsetBottom
{
  return 10.0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Pose frustum offsets [yaw left %g, yaw right %g, pitch top %g, pitch bottom %g] "), self->_yawOffsetLeft, self->_yawOffsetRight, self->_pitchOffsetTop, self->_pitchOffsetBottom);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGFaceSelectionFrustum)initWithCoder:(id)a3
{
  id v4;
  VGFaceSelectionFrustum *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  VGFaceSelectionFrustum *v10;

  v4 = a3;
  v5 = -[VGFaceSelectionFrustum init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectionFrustumYawOffsetLeft")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectionFrustumYawOffsetLeft"));
      v5->_yawOffsetLeft = v6;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectionFrustumYawOffsetRight")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectionFrustumYawOffsetRight"));
      v5->_yawOffsetRight = v7;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectionFrustumPitchOffsetTop")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectionFrustumPitchOffsetTop"));
      v5->_pitchOffsetTop = v8;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("selectionFrustumPitchOffsetBottom")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("selectionFrustumPitchOffsetBottom"));
      v5->_pitchOffsetBottom = v9;
    }
    v10 = v5;
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
  id v9;

  v4 = a3;
  *(float *)&v5 = self->_yawOffsetLeft;
  v9 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("selectionFrustumYawOffsetLeft"), v5);
  *(float *)&v6 = self->_yawOffsetRight;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("selectionFrustumYawOffsetRight"), v6);
  *(float *)&v7 = self->_pitchOffsetTop;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("selectionFrustumPitchOffsetTop"), v7);
  *(float *)&v8 = self->_pitchOffsetBottom;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("selectionFrustumPitchOffsetBottom"), v8);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float yawOffsetLeft;
  float v7;
  float yawOffsetRight;
  float v9;
  float pitchOffsetTop;
  float v11;
  float pitchOffsetBottom;
  float v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    yawOffsetLeft = self->_yawOffsetLeft;
    objc_msgSend(v5, "yawOffsetLeft");
    if (yawOffsetLeft == v7
      && (yawOffsetRight = self->_yawOffsetRight, objc_msgSend(v5, "yawOffsetRight"), yawOffsetRight == v9)
      && (pitchOffsetTop = self->_pitchOffsetTop, objc_msgSend(v5, "pitchOffsetTop"), pitchOffsetTop == v11))
    {
      pitchOffsetBottom = self->_pitchOffsetBottom;
      objc_msgSend(v5, "pitchOffsetBottom");
      v14 = pitchOffsetBottom == v13;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)toDictionary
{
  double v2;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("yawOffsetLeft");
  *(float *)&v2 = self->_yawOffsetLeft;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("yawOffsetRight");
  *(float *)&v5 = self->_yawOffsetRight;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("pitchOffsetTop");
  *(float *)&v7 = self->_pitchOffsetTop;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = CFSTR("pitchOffsetBottom");
  *(float *)&v9 = self->_pitchOffsetBottom;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (float)yawOffsetLeft
{
  return self->_yawOffsetLeft;
}

- (void)setYawOffsetLeft:(float)a3
{
  self->_yawOffsetLeft = a3;
}

- (float)yawOffsetRight
{
  return self->_yawOffsetRight;
}

- (void)setYawOffsetRight:(float)a3
{
  self->_yawOffsetRight = a3;
}

- (float)pitchOffsetTop
{
  return self->_pitchOffsetTop;
}

- (void)setPitchOffsetTop:(float)a3
{
  self->_pitchOffsetTop = a3;
}

- (float)pitchOffsetBottom
{
  return self->_pitchOffsetBottom;
}

- (void)setPitchOffsetBottom:(float)a3
{
  self->_pitchOffsetBottom = a3;
}

@end
