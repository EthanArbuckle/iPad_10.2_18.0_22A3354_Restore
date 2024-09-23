@implementation TVRCTouchEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCTouchEvent)initWithCoder:(id)a3
{
  id v4;
  TVRCTouchEvent *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRCTouchEvent;
  v5 = -[TVRCTouchEvent init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    v5->_finger = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("finger"));
    v5->_phase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("phase"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("digitizerLocation.x"));
    v5->_digitizerLocation.x = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("digitizerLocation.y"));
    v5->_digitizerLocation.y = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_finger, CFSTR("finger"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_phase, CFSTR("phase"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("digitizerLocation.x"), self->_digitizerLocation.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("digitizerLocation.y"), self->_digitizerLocation.y);

}

- (id)_initWithTimestamp:(double)a3 finger:(int64_t)a4 phase:(int64_t)a5 digitizerLocation:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  id result;
  objc_super v12;

  y = a6.y;
  x = a6.x;
  v12.receiver = self;
  v12.super_class = (Class)TVRCTouchEvent;
  result = -[TVRCTouchEvent init](&v12, sel_init);
  if (result)
  {
    *((double *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
    *((_QWORD *)result + 3) = a5;
    *((CGFloat *)result + 4) = x;
    *((CGFloat *)result + 5) = y;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t phase;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  phase = self->_phase;
  if (phase > 5)
    v6 = CFSTR("Undefined");
  else
    v6 = off_24DCD8BB0[phase];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; finger=%d; phase=%@; location={%g, %g}>"),
               v4,
               self,
               self->_finger,
               v6,
               *(_QWORD *)&self->_digitizerLocation.x,
               *(_QWORD *)&self->_digitizerLocation.y);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)finger
{
  return self->_finger;
}

- (int64_t)phase
{
  return self->_phase;
}

- (CGPoint)digitizerLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_digitizerLocation.x;
  y = self->_digitizerLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
