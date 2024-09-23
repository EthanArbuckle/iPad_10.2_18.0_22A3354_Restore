@implementation TypistKeyplane

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TypistKeyplane)initWithCoder:(id)a3
{
  id v4;
  TypistKeyplane *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyplane;
  v5 = -[TypistKeyplane init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_isLetters = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLetters"));
    v5->_isAlphabeticPlane = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAlphabeticPlane"));
    v5->_isShiftKeyplane = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isShiftKeyplane"));
    v5->_usesAutoShift = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesAutoShift"));
    v5->_ignoresShiftState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresShiftState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *name;
  id v6;

  v4 = a3;
  name = self->_name;
  v6 = v4;
  if (name)
  {
    objc_msgSend(v4, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_isLetters, CFSTR("isLetters"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAlphabeticPlane, CFSTR("isAlphabeticPlane"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isShiftKeyplane, CFSTR("isShiftKeyplane"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_usesAutoShift, CFSTR("usesAutoShift"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_ignoresShiftState, CFSTR("ignoresShiftState"));

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isLetters
{
  return self->_isLetters;
}

- (void)setIsLetters:(BOOL)a3
{
  self->_isLetters = a3;
}

- (BOOL)isAlphabeticPlane
{
  return self->_isAlphabeticPlane;
}

- (void)setIsAlphabeticPlane:(BOOL)a3
{
  self->_isAlphabeticPlane = a3;
}

- (BOOL)isShiftKeyplane
{
  return self->_isShiftKeyplane;
}

- (void)setIsShiftKeyplane:(BOOL)a3
{
  self->_isShiftKeyplane = a3;
}

- (BOOL)usesAutoShift
{
  return self->_usesAutoShift;
}

- (void)setUsesAutoShift:(BOOL)a3
{
  self->_usesAutoShift = a3;
}

- (BOOL)ignoresShiftState
{
  return self->_ignoresShiftState;
}

- (void)setIgnoresShiftState:(BOOL)a3
{
  self->_ignoresShiftState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
