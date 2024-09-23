@implementation SUOverlayTransition

- (SUOverlayTransition)init
{
  SUOverlayTransition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUOverlayTransition;
  result = -[SUOverlayTransition init](&v3, sel_init);
  if (result)
    result->_duration = 0.5;
  return result;
}

- (SUOverlayTransition)initWithCoder:(id)a3
{
  SUOverlayTransition *v4;
  double v5;

  v4 = -[SUOverlayTransition init](self, "init");
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("duration"));
    v4->_duration = v5;
    v4->_type = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  self->_sourceElement = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayTransition;
  -[SUOverlayTransition dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 8) = self->_duration;
  *(_QWORD *)(v4 + 16) = self->_sourceElement;
  *(_QWORD *)(v4 + 24) = self->_type;
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
}

+ (int64_t)transitionTypeFromString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("flip")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("slide-from-right")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("slide-from-bottom")))
    return 3;
  return 0;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (SUDOMElement)sourceElement
{
  return self->_sourceElement;
}

- (void)setSourceElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
