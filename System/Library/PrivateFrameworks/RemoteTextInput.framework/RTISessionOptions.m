@implementation RTISessionOptions

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldResign, CFSTR("shouldResign"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_animated, CFSTR("animated"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_offscreenDirection, CFSTR("offscreenDirection"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enhancedWindowingModeEnabled, CFSTR("enhancedWindowingModeEnabled"));

}

+ (id)defaultBeginOptions
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setAnimated:", 1);
  objc_msgSend(v2, "setOffscreenDirection:", 0);
  return v2;
}

- (void)setOffscreenDirection:(int64_t)a3
{
  self->_offscreenDirection = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void)setEnhancedWindowingModeEnabled:(BOOL)a3
{
  self->_enhancedWindowingModeEnabled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTISessionOptions)initWithCoder:(id)a3
{
  id v4;
  RTISessionOptions *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v7.receiver = self;
  v7.super_class = (Class)RTISessionOptions;
  v5 = -[RTISessionOptions init](&v7, sel_init);
  if (v5)
  {
    v5->_shouldResign = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldResign"));
    v5->_animated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("animated"));
    v5->_offscreenDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offscreenDirection"));
    v5->_enhancedWindowingModeEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enhancedWindowingModeEnabled"));
  }

  return v5;
}

- (void)setShouldResign:(BOOL)a3
{
  self->_shouldResign = a3;
}

+ (id)defaultOptions
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setShouldResign:", 1);
  objc_msgSend(v2, "setAnimated:", 1);
  objc_msgSend(v2, "setOffscreenDirection:", 0);
  return v2;
}

+ (id)defaultEndOptions
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setShouldResign:", 1);
  objc_msgSend(v2, "setAnimated:", 1);
  objc_msgSend(v2, "setOffscreenDirection:", 0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[RTISessionOptions init](+[RTISessionOptions allocWithZone:](RTISessionOptions, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_shouldResign;
  *((_BYTE *)result + 9) = self->_animated;
  *((_QWORD *)result + 2) = self->_offscreenDirection;
  *((_BYTE *)result + 10) = self->_enhancedWindowingModeEnabled;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  RTISessionOptions *v4;
  RTISessionOptions *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  int64_t v9;

  v4 = (RTISessionOptions *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTISessionOptions shouldResign](self, "shouldResign");
      if (v6 == -[RTISessionOptions shouldResign](v5, "shouldResign")
        && (v7 = -[RTISessionOptions animated](self, "animated"), v7 == -[RTISessionOptions animated](v5, "animated")))
      {
        v9 = -[RTISessionOptions offscreenDirection](self, "offscreenDirection");
        v8 = v9 == -[RTISessionOptions offscreenDirection](v5, "offscreenDirection");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  if (-[RTISessionOptions shouldResign](self, "shouldResign"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("; shouldResign = %@"), v4);
  if (-[RTISessionOptions animated](self, "animated"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("; animated = %@"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("; offscreenDirection = %lu"),
    -[RTISessionOptions offscreenDirection](self, "offscreenDirection"));
  if (-[RTISessionOptions enhancedWindowingModeEnabled](self, "enhancedWindowingModeEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("; enhancedWindowingModeEnabled = %@"), v6);
  return v3;
}

- (BOOL)shouldResign
{
  return self->_shouldResign;
}

- (BOOL)animated
{
  return self->_animated;
}

- (int64_t)offscreenDirection
{
  return self->_offscreenDirection;
}

- (BOOL)enhancedWindowingModeEnabled
{
  return self->_enhancedWindowingModeEnabled;
}

@end
