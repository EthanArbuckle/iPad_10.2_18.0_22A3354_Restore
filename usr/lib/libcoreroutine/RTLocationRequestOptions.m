@implementation RTLocationRequestOptions

- (double)timeout
{
  return self->_timeout;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (BOOL)yieldLastLocation
{
  return self->_yieldLastLocation;
}

- (RTLocationRequestOptions)initWithDesiredAccuracy:(double)a3 horizontalAccuracy:(double)a4 maxAge:(double)a5 yieldLastLocation:(BOOL)a6 timeout:(double)a7 fallback:(BOOL)a8 fallbackHorizontalAccuracy:(double)a9 fallbackMaxAge:(double)a10
{
  RTLocationRequestOptions *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RTLocationRequestOptions;
  result = -[RTLocationRequestOptions init](&v19, sel_init);
  if (result)
  {
    result->_desiredAccuracy = a3;
    result->_horizontalAccuracy = a4;
    result->_yieldLastLocation = a6;
    result->_fallback = a8;
    result->_maxAge = a5;
    result->_fallbackHorizontalAccuracy = a9;
    result->_fallbackMaxAge = a10;
    result->_timeout = a7;
  }
  return result;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_yieldLastLocation)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_fallback)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("desired accuracy, %.2f, horizontalAccuracy, %.2f, maxAge, %.2f, yieldLastLocation, %@, fallback, %@, fallbackHorizontalAccuracy, %.2f, fallbackMaxAge, %.2f, timeout, %.2f"), *(_OWORD *)&self->_desiredAccuracy, *(_QWORD *)&self->_maxAge, v3, v2, *(_QWORD *)&self->_fallbackHorizontalAccuracy, *(_QWORD *)&self->_fallbackMaxAge, *(_QWORD *)&self->_timeout);
}

- (BOOL)fallback
{
  return self->_fallback;
}

- (double)fallbackHorizontalAccuracy
{
  return self->_fallbackHorizontalAccuracy;
}

- (double)fallbackMaxAge
{
  return self->_fallbackMaxAge;
}

@end
