@implementation _UIBlurEffectAverageImpl

+ (id)sharedInstance
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_sharedAverageImplementation;
  if (!_sharedAverageImplementation)
  {
    v3 = objc_opt_new();
    v4 = (void *)_sharedAverageImplementation;
    _sharedAverageImplementation = v3;

    v2 = (void *)_sharedAverageImplementation;
  }
  return v2;
}

- (_UIBlurEffectAverageImpl)initWithScale:(double)a3
{
  _UIBlurEffectAverageImpl *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBlurEffectAverageImpl;
  result = -[_UIBlurEffectAverageImpl init](&v5, sel_init);
  if (result)
    result->_scale = fmax(fmin(a3, 1.0), 0.0);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("UIBlurEffectInfiniteRadius"));
}

- (unint64_t)hash
{
  return vcvtd_n_u64_f64(self->_scale, 5uLL);
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4[1] == self->_scale;
  else
    v5 = 0;

  return v5;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  _UIBlurEffectAddAverageColorFilterEntry(a3, a4, self->_scale);
}

- (void)appendDescriptionTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR(" infiniteBlurRadius"));
  if (self->_scale > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scale=%f"), *(_QWORD *)&self->_scale);

}

@end
