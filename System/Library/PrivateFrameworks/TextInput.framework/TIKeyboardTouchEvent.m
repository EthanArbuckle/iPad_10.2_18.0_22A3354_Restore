@implementation TIKeyboardTouchEvent

- (TIKeyboardTouchEvent)initWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9 continuousPathState:(int)a10
{
  char v10;
  CGFloat y;
  CGFloat x;
  TIKeyboardTouchEvent *result;
  objc_super v20;

  v10 = a10;
  y = a4.y;
  x = a4.x;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardTouchEvent;
  result = -[TIKeyboardTouchEvent init](&v20, sel_init);
  if (result)
  {
    result->_location.x = x;
    result->_location.y = y;
    result->_radius = a5;
    result->_timestamp = a6;
    result->_stage = a3;
    result->_fingerID = a8;
    result->_pathIndex = a7;
    result->_forcedKeyCode = a9;
    LOBYTE(result->_mask.integerValue) = result->_mask.integerValue & 0xF0 | v10 & 0xF;
  }
  return result;
}

- (TIKeyboardTouchEvent)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardTouchEvent *v5;
  float v6;
  CGFloat v7;
  float v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardTouchEvent;
  v5 = -[TIKeyboardTouchEvent init](&v12, sel_init);
  if (v5)
  {
    v5->_stage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stage"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("location.x"));
    v7 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("location.y"));
    v5->_location.x = v7;
    v5->_location.y = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
    v5->_radius = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v10;
    v5->_pathIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pathIndex"));
    v5->_fingerID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fingerID"));
    v5->_forcedKeyCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("forcedKeyCode"));
    v5->_mask.integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t stage;
  CGFloat x;
  CGFloat y;
  int64_t pathIndex;
  uint64_t fingerID;
  int64_t forcedKeyCode;
  int64_t integerValue;
  id v12;

  v4 = a3;
  stage = self->_stage;
  v12 = v4;
  if ((_DWORD)stage)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", stage, CFSTR("stage"));
    v4 = v12;
  }
  x = self->_location.x;
  if (x != 0.0)
  {
    *(float *)&x = x;
    objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("location.x"), x);
    v4 = v12;
  }
  y = self->_location.y;
  if (y != 0.0)
  {
    *(float *)&y = y;
    objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("location.y"), y);
    v4 = v12;
  }
  if (self->_radius != 0.0)
  {
    objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("radius"));
    v4 = v12;
  }
  if (self->_timestamp != 0.0)
  {
    objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("timestamp"));
    v4 = v12;
  }
  pathIndex = self->_pathIndex;
  if (pathIndex)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", pathIndex, CFSTR("pathIndex"));
    v4 = v12;
  }
  fingerID = self->_fingerID;
  if ((_DWORD)fingerID)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", fingerID, CFSTR("fingerID"));
    v4 = v12;
  }
  forcedKeyCode = self->_forcedKeyCode;
  if (forcedKeyCode)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", forcedKeyCode, CFSTR("forcedKeyCode"));
    v4 = v12;
  }
  integerValue = self->_mask.integerValue;
  if (integerValue)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", integerValue, CFSTR("flags"));
    v4 = v12;
  }

}

- (id)description
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v4 = -[TIKeyboardTouchEvent stage](self, "stage");
  if (v4 <= 5)
    objc_msgSend(v3, "appendString:", *((_QWORD *)&off_1E243A740 + v4));
  -[TIKeyboardTouchEvent location](self, "location");
  v6 = v5;
  -[TIKeyboardTouchEvent location](self, "location");
  objc_msgSend(v3, "appendFormat:", CFSTR("; location = (%.1f,%.1f)"), v6, v7);
  -[TIKeyboardTouchEvent radius](self, "radius");
  objc_msgSend(v3, "appendFormat:", CFSTR("; radius = %f"), v8);
  -[TIKeyboardTouchEvent timestamp](self, "timestamp");
  objc_msgSend(v3, "appendFormat:", CFSTR("; timestamp = %f"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("; pathIndex = %ld"), -[TIKeyboardTouchEvent pathIndex](self, "pathIndex"));
  v10 = -[TIKeyboardTouchEvent fingerID](self, "fingerID");
  if (v10 <= 0xC && ((0x1F7Du >> v10) & 1) != 0)
    objc_msgSend(v3, "appendString:", *((_QWORD *)&off_1E243A770 + v10));
  objc_msgSend(v3, "appendFormat:", CFSTR("; forcedKeyCode = %ld"),
    -[TIKeyboardTouchEvent forcedKeyCode](self, "forcedKeyCode"));
  v11 = -[TIKeyboardTouchEvent continuousPathState](self, "continuousPathState");
  if (v11 <= 6)
    objc_msgSend(v3, "appendString:", *((_QWORD *)&off_1E243A7D8 + v11));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)shortDescription
{
  unsigned int v3;
  const char *v4;
  unsigned int v5;
  const char *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;

  v3 = -[TIKeyboardTouchEvent stage](self, "stage");
  if (v3 > 3)
    v4 = "?";
  else
    v4 = off_1E243A810[v3];
  v5 = -[TIKeyboardTouchEvent continuousPathState](self, "continuousPathState");
  if (v5 > 6)
    v6 = "";
  else
    v6 = off_1E243A830[v5];
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardTouchEvent location](self, "location");
  *(float *)&v8 = v8;
  v9 = *(float *)&v8;
  -[TIKeyboardTouchEvent location](self, "location");
  v11 = v10;
  v12 = v11;
  -[TIKeyboardTouchEvent timestamp](self, "timestamp");
  *(float *)&v13 = v13;
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("(x=%.1f,y=%.1f,t=%.2f,%s,idx=%lu,cp=%s)"), *(_QWORD *)&v9, *(_QWORD *)&v12, *(float *)&v13, v4, -[TIKeyboardTouchEvent pathIndex](self, "pathIndex"), v6);
}

- (int)continuousPathState
{
  return self->_mask.integerValue & 0xF;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

- (int)stage
{
  return self->_stage;
}

- (int)fingerID
{
  return self->_fingerID;
}

- (int64_t)forcedKeyCode
{
  return self->_forcedKeyCode;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 forcedKeyCode:(int64_t)a8
{
  return (TIKeyboardTouchEvent *)objc_msgSend(a1, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", *(_QWORD *)&a3, a7, 0, a8, 2, a4.x, a4.y, a5, a6);
}

+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9
{
  return -[TIKeyboardTouchEvent initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]([TIKeyboardTouchEvent alloc], "initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", *(_QWORD *)&a3, a7, *(_QWORD *)&a8, a9, 2, a4.x, a4.y, a5, a6);
}

+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9 continuousPathState:(int)a10
{
  return -[TIKeyboardTouchEvent initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]([TIKeyboardTouchEvent alloc], "initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", *(_QWORD *)&a3, a7, *(_QWORD *)&a8, a9, *(_QWORD *)&a10, a4.x, a4.y, a5, a6);
}

@end
