@implementation _UIKBRTFingerInfo

- (id)copyWithZone:(_NSZone *)a3
{
  _UIKBRTFingerInfo *v4;

  v4 = objc_alloc_init(_UIKBRTFingerInfo);
  -[_UIKBRTFingerInfo setLocation:](v4, "setLocation:", self->_location.x, self->_location.y);
  -[_UIKBRTFingerInfo setRadius:](v4, "setRadius:", self->_radius);
  -[_UIKBRTFingerInfo setIdentity:](v4, "setIdentity:", self->_identity);
  -[_UIKBRTFingerInfo setUnknownSeen:](v4, "setUnknownSeen:", self->_unknownSeen);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIKBRTFingerInfo *v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  BOOL v9;

  v4 = (_UIKBRTFingerInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    v9 = (objc_opt_isKindOfClass() & 1) != 0
      && ((-[_UIKBRTFingerInfo location](v4, "location"), v6 == self->_location.x)
        ? (v7 = v5 == self->_location.y)
        : (v7 = 0),
          v7 && (-[_UIKBRTFingerInfo radius](v4, "radius"), v8 == self->_radius))
      && -[_UIKBRTFingerInfo identity](v4, "identity") == self->_identity;
  }

  return v9;
}

- (void)setUnknownSeen:(BOOL)a3
{
  self->_unknownSeen = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (qword_1ECD7AD60 != -1)
    dispatch_once(&qword_1ECD7AD60, &__block_literal_global_152_2);
  v3 = (void *)_MergedGlobals_9_3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_identity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_UIKBRTFingerID(%d)"), self->_identity);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p, location={%.1f, %.1f}, radius=%.1f, id=%@>"), v8, self, *(_QWORD *)&self->_location.x, *(_QWORD *)&self->_location.y, *(_QWORD *)&self->_radius, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)feedbackAlpha
{
  return 1.0;
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

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)lastSeenTimestamp
{
  return self->_lastSeenTimestamp;
}

- (void)setLastSeenTimestamp:(double)a3
{
  self->_lastSeenTimestamp = a3;
}

- (unint64_t)identity
{
  return self->_identity;
}

- (void)setIdentity:(unint64_t)a3
{
  self->_identity = a3;
}

- (BOOL)unknownSeen
{
  return self->_unknownSeen;
}

@end
