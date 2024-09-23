@implementation STAuthenticationResult

- (STAuthenticationResult)initWithResult:(BOOL)a3
{
  STAuthenticationResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAuthenticationResult;
  result = -[STAuthenticationResult init](&v5, sel_init);
  result->_authenticated = a3;
  return result;
}

- (STAuthenticationResult)initWithCoder:(id)a3
{
  return -[STAuthenticationResult initWithResult:](self, "initWithResult:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("authenticated")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_authenticated, CFSTR("authenticated"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  STAuthenticationResult *v4;
  BOOL v5;

  v4 = (STAuthenticationResult *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STAuthenticationResult isEqualToAuthenticationResult:](self, "isEqualToAuthenticationResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAuthenticationResult:(id)a3
{
  char v4;

  if (a3 == self)
    return 1;
  v4 = objc_msgSend(a3, "authenticated");
  return v4 ^ -[STAuthenticationResult authenticated](self, "authenticated") ^ 1;
}

- (unint64_t)hash
{
  return -[STAuthenticationResult authenticated](self, "authenticated");
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

@end
