@implementation SOSButtonPressState

- (SOSButtonPressState)initWithVolumeUpPressed:(BOOL)a3 Timestamp:(double)a4 VolumeDownPressed:(BOOL)a5 Timestamp:(double)a6 LockPressedTimestamp:(double)a7
{
  SOSButtonPressState *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SOSButtonPressState;
  result = -[SOSButtonPressState init](&v13, sel_init);
  if (result)
  {
    result->_volumeUpPressed = a3;
    result->_volumeDownPressed = a5;
    result->_volumeUpPressedMCTTimestamp = a4;
    result->_volumeDownPressedMCTTimestamp = a6;
    result->_lockPressedMCTTimestamp = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 volumeUpPressed;
  id v5;

  volumeUpPressed = self->_volumeUpPressed;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", volumeUpPressed, CFSTR("volumeUpPressed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_volumeDownPressed, CFSTR("volumeDownPressed"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("volumeUpPressedMCTTimestamp"), self->_volumeUpPressedMCTTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("volumeDownPressedMCTTimestamp"), self->_volumeDownPressedMCTTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lockPressedMCTTimestamp"), self->_lockPressedMCTTimestamp);

}

- (SOSButtonPressState)initWithCoder:(id)a3
{
  id v4;
  SOSButtonPressState *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSButtonPressState;
  v5 = -[SOSButtonPressState init](&v10, sel_init);
  if (v5)
  {
    v5->_volumeUpPressed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("volumeUpPressed"));
    v5->_volumeDownPressed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("volumeDownPressed"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("volumeUpPressedMCTTimestamp"));
    v5->_volumeUpPressedMCTTimestamp = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("volumeDownPressedMCTTimestamp"));
    v5->_volumeDownPressedMCTTimestamp = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lockPressedMCTTimestamp"));
    v5->_lockPressedMCTTimestamp = v8;
  }

  return v5;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SOSButtonPressState volumeUpPressed](self, "volumeUpPressed");
  -[SOSButtonPressState volumeUpPressedMCTTimestamp](self, "volumeUpPressedMCTTimestamp");
  v6 = v5;
  v7 = -[SOSButtonPressState volumeDownPressed](self, "volumeDownPressed");
  -[SOSButtonPressState volumeDownPressedMCTTimestamp](self, "volumeDownPressedMCTTimestamp");
  v9 = v8;
  -[SOSButtonPressState lockPressedMCTTimestamp](self, "lockPressedMCTTimestamp");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("SOSButtonPressState,volumeUpPressed,%d,volumeUpPressedMCTTimestamp,%f,volumeDownPressed,%d,volumeDownPressedMCTTimestamp,%f,lockPressedMCTTimestamp,%f"), v4, v6, v7, v9, v10);
}

- (double)getButtonPressGap
{
  double v3;
  _BOOL4 v4;
  double v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (-[SOSButtonPressState volumeUpPressed](self, "volumeUpPressed"))
  {
    -[SOSButtonPressState volumeUpPressedMCTTimestamp](self, "volumeUpPressedMCTTimestamp");
    v4 = v3 > 0.0;
  }
  else
  {
    v4 = 0;
  }
  if (-[SOSButtonPressState volumeDownPressed](self, "volumeDownPressed"))
  {
    -[SOSButtonPressState volumeDownPressedMCTTimestamp](self, "volumeDownPressedMCTTimestamp");
    v6 = v5 > 0.0;
  }
  else
  {
    v6 = 0;
  }
  -[SOSButtonPressState lockPressedMCTTimestamp](self, "lockPressedMCTTimestamp");
  if (v7 <= 0.0 || !v4 && !v6)
    return -1.0;
  if (!v6)
  {
    -[SOSButtonPressState lockPressedMCTTimestamp](self, "lockPressedMCTTimestamp");
    v14 = v13;
    -[SOSButtonPressState volumeUpPressedMCTTimestamp](self, "volumeUpPressedMCTTimestamp");
    return vabdd_f64(v14, v15);
  }
  if (!v4)
  {
    -[SOSButtonPressState lockPressedMCTTimestamp](self, "lockPressedMCTTimestamp");
    v14 = v16;
    -[SOSButtonPressState volumeDownPressedMCTTimestamp](self, "volumeDownPressedMCTTimestamp");
    return vabdd_f64(v14, v15);
  }
  -[SOSButtonPressState volumeUpPressedMCTTimestamp](self, "volumeUpPressedMCTTimestamp");
  v9 = v8;
  -[SOSButtonPressState volumeDownPressedMCTTimestamp](self, "volumeDownPressedMCTTimestamp");
  if (v9 <= v10)
    -[SOSButtonPressState volumeUpPressedMCTTimestamp](self, "volumeUpPressedMCTTimestamp");
  else
    -[SOSButtonPressState volumeDownPressedMCTTimestamp](self, "volumeDownPressedMCTTimestamp");
  v17 = v11;
  -[SOSButtonPressState lockPressedMCTTimestamp](self, "lockPressedMCTTimestamp");
  return vabdd_f64(v18, v17);
}

- (BOOL)volumeUpPressed
{
  return self->_volumeUpPressed;
}

- (BOOL)volumeDownPressed
{
  return self->_volumeDownPressed;
}

- (double)volumeUpPressedMCTTimestamp
{
  return self->_volumeUpPressedMCTTimestamp;
}

- (double)volumeDownPressedMCTTimestamp
{
  return self->_volumeDownPressedMCTTimestamp;
}

- (double)lockPressedMCTTimestamp
{
  return self->_lockPressedMCTTimestamp;
}

@end
