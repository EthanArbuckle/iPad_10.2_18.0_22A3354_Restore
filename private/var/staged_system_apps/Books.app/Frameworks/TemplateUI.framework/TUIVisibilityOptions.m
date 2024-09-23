@implementation TUIVisibilityOptions

+ (id)defaultOptions
{
  return objc_alloc_init((Class)a1);
}

+ (id)modalAnchorOptions
{
  char *v2;

  v2 = (char *)objc_alloc_init((Class)a1);
  *(_OWORD *)(v2 + 8) = xmmword_22F0A0;
  *((_QWORD *)v2 + 3) = 1;
  return v2;
}

- (TUIVisibilityOptions)init
{
  TUIVisibilityOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIVisibilityOptions;
  result = -[TUIVisibilityOptions init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->_fraction = xmmword_22F0B0;
    result->_flags = 0;
  }
  return result;
}

- (TUIVisibilityOptions)initWithOther:(id)a3
{
  id v4;
  TUIVisibilityOptions *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIVisibilityOptions;
  v5 = -[TUIVisibilityOptions init](&v9, "init");
  if (v5)
  {
    objc_msgSend(v4, "fraction");
    v5->_fraction = v6;
    objc_msgSend(v4, "duration");
    v5->_duration = v7;
    v5->_flags = (unint64_t)objc_msgSend(v4, "flags");
  }

  return v5;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end
