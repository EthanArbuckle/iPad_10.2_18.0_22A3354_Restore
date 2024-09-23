@implementation PKPassLiveRender

- (PKPassLiveRender)initWithEnabled:(BOOL)a3
{
  PKPassLiveRender *result;

  result = -[PKPassLiveRender _init](self, "_init");
  if (result)
    result->_enabled = a3;
  return result;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassLiveRender;
  return -[PKPassLiveRender init](&v3, sel_init);
}

- (PKPassLiveRender)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
}

- (PKPassLiveRender)initWithCoder:(id)a3
{
  id v4;
  PKPassLiveRender *v5;

  v4 = a3;
  v5 = -[PKPassLiveRender _init](self, "_init");
  if (v5)
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_enabled)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("enabled: %@"), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
