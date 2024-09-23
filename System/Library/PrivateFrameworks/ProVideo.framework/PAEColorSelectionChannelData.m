@implementation PAEColorSelectionChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEColorSelectionChannelData)initWithCoder:(id)a3
{
  PAEColorSelectionChannelData *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEColorSelectionChannelData;
  v4 = -[PAEColorSelectionChannelData init](&v11, sel_init);
  if (v4)
  {
    v4->_mode = objc_msgSend(a3, "decodeIntForKey:", CFSTR("mode"));
    v4->_state = objc_msgSend(a3, "decodeIntForKey:", CFSTR("state"));
    v4->_action = objc_msgSend(a3, "decodeIntForKey:", CFSTR("action"));
    v4->_style = objc_msgSend(a3, "decodeIntForKey:", CFSTR("style"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("x"));
    v4->_x = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("y"));
    v4->_y = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("radius"));
    v4->_radius = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("radiusScale"));
    v4->_radiusScale = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("frame"));
    v4->_frame = v9;
    v4->_timeScale = objc_msgSend(a3, "decodeIntForKey:", CFSTR("timeScale"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t mode;
  uint64_t state;
  int v7;
  uint64_t action;
  uint64_t timeScale;
  uint64_t style;

  mode = self->_mode;
  if ((_DWORD)mode)
    objc_msgSend(a3, "encodeInt:forKey:", mode, CFSTR("mode"));
  state = self->_state;
  if ((_DWORD)state)
  {
    objc_msgSend(a3, "encodeInt:forKey:", state, CFSTR("state"));
    v7 = self->_state;
    if (v7)
    {
      if (v7 != 3)
      {
        action = self->_action;
        if ((_DWORD)action)
          objc_msgSend(a3, "encodeInt:forKey:", action, CFSTR("action"));
        if (self->_x != 0.0)
          objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("x"));
        if (self->_y != 0.0)
          objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("y"));
        if (self->_radius != 0.0)
          objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("radius"));
        if (self->_radiusScale != 0.0)
          objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("radiusScale"));
      }
    }
  }
  if (self->_frame != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("frame"));
  timeScale = self->_timeScale;
  if ((_DWORD)timeScale)
    objc_msgSend(a3, "encodeInt:forKey:", timeScale, CFSTR("timeScale"));
  style = self->_style;
  if ((_DWORD)style)
    objc_msgSend(a3, "encodeInt:forKey:", style, CFSTR("style"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_DWORD *)result + 2) = self->_mode;
    *((_DWORD *)result + 3) = self->_state;
    *((_DWORD *)result + 4) = self->_action;
    *((_DWORD *)result + 5) = self->_style;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_x;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_y;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_radius;
    *((_QWORD *)result + 6) = *(_QWORD *)&self->_radiusScale;
    *((_QWORD *)result + 7) = *(_QWORD *)&self->_frame;
    *((_DWORD *)result + 16) = self->_timeScale;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> mode=%x, state=%x, action=%x, style=%x, x=%.3f, y=%.3f, radius=%.3f, radiusScale=%.3f, frame=%.3f, timeScale=%d"), NSStringFromClass(v4), self, self->_mode, self->_state, self->_action, self->_style, *(_QWORD *)&self->_x, *(_QWORD *)&self->_y, *(_QWORD *)&self->_radius, *(_QWORD *)&self->_radiusScale, *(_QWORD *)&self->_frame, self->_timeScale);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)radiusScale
{
  return self->_radiusScale;
}

- (void)setRadiusScale:(double)a3
{
  self->_radiusScale = a3;
}

- (double)frame
{
  return self->_frame;
}

- (void)setFrame:(double)a3
{
  self->_frame = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

@end
