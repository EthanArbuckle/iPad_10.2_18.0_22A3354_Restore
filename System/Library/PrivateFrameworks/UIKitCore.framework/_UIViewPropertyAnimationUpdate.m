@implementation _UIViewPropertyAnimationUpdate

- (_UIViewPropertyAnimationUpdate)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIViewPropertyAnimationUpdate init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (_UIViewPropertyAnimationUpdate)initWithPropertyName:(id)a3 implicit:(BOOL)a4 additive:(BOOL)a5
{
  id v8;
  _UIViewPropertyAnimationUpdate *v9;
  uint64_t v10;
  NSString *propertyName;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIViewPropertyAnimationUpdate;
  v9 = -[_UIViewPropertyAnimationUpdate init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    propertyName = v9->_propertyName;
    v9->_propertyName = (NSString *)v10;

    v9->_implicit = a4;
    v9->_additive = a5;
    v9->_duration = 0.0;
    v9->_delay = 0.0;
    v9->_startTime = 0.0;
  }

  return v9;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)isAdditive
{
  return self->_additive;
}

- (NSValue)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
  objc_storeStrong((id *)&self->_fromValue, a3);
}

- (NSValue)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
  objc_storeStrong((id *)&self->_toValue, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)isImplicit
{
  return self->_implicit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toValue, 0);
  objc_storeStrong((id *)&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end
