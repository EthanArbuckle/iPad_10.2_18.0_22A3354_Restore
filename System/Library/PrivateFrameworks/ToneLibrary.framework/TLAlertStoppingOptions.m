@implementation TLAlertStoppingOptions

- (TLAlertStoppingOptions)init
{
  TLAlertStoppingOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLAlertStoppingOptions;
  result = -[TLAlertStoppingOptions init](&v3, sel_init);
  if (result)
  {
    result->_fadeOutDuration = 0.0;
    result->_shouldWaitUntilEndOfCurrentRepetition = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_fadeOutDuration;
    *((_BYTE *)result + 8) = self->_shouldWaitUntilEndOfCurrentRepetition;
  }
  return result;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if (self->_fadeOutDuration > 0.00000011920929)
    objc_msgSend(v6, "appendFormat:", CFSTR("; fadeOutDuration = %f"), *(_QWORD *)&self->_fadeOutDuration);
  if (self->_shouldWaitUntilEndOfCurrentRepetition)
    objc_msgSend(v6, "appendString:", CFSTR("; shouldWaitUntilEndOfCurrentRepetition = YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TLAlertStoppingOptions *v4;
  BOOL v5;

  v4 = (TLAlertStoppingOptions *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && llround(self->_fadeOutDuration / 0.0001) == llround(v4->_fadeOutDuration / 0.0001))
    {
      v5 = !self->_shouldWaitUntilEndOfCurrentRepetition ^ v4->_shouldWaitUntilEndOfCurrentRepetition;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return llround(self->_fadeOutDuration / 0.0001) ^ self->_shouldWaitUntilEndOfCurrentRepetition;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLAlertStoppingOptions)initWithCoder:(id)a3
{
  id v4;
  TLAlertStoppingOptions *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TLAlertStoppingOptions;
  v5 = -[TLAlertStoppingOptions init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fadeOutDuration"));
    v5->_fadeOutDuration = v6;
    v5->_shouldWaitUntilEndOfCurrentRepetition = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldWaitUntilEndOfCurrentRepetition"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double fadeOutDuration;
  id v5;

  fadeOutDuration = self->_fadeOutDuration;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fadeOutDuration"), fadeOutDuration);
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldWaitUntilEndOfCurrentRepetition, CFSTR("shouldWaitUntilEndOfCurrentRepetition"));

}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (BOOL)shouldWaitUntilEndOfCurrentRepetition
{
  return self->_shouldWaitUntilEndOfCurrentRepetition;
}

- (void)setShouldWaitUntilEndOfCurrentRepetition:(BOOL)a3
{
  self->_shouldWaitUntilEndOfCurrentRepetition = a3;
}

@end
