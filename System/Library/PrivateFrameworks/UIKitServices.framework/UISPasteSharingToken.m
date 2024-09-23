@implementation UISPasteSharingToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISPasteSharingToken)init
{
  uint64_t __buf;

  __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  return -[UISPasteSharingToken initWithTokenValue:](self, "initWithTokenValue:", __buf);
}

- (UISPasteSharingToken)initWithTokenValue:(unint64_t)a3
{
  UISPasteSharingToken *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISPasteSharingToken;
  result = -[UISPasteSharingToken init](&v5, sel_init);
  if (result)
    result->_tokenValue = a3;
  return result;
}

- (UISPasteSharingToken)initWithCoder:(id)a3
{
  return -[UISPasteSharingToken initWithTokenValue:](self, "initWithTokenValue:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("sharingTokenValue")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_tokenValue, CFSTR("sharingTokenValue"));
}

- (BOOL)isEqual:(id)a3
{
  UISPasteSharingToken *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (UISPasteSharingToken *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[UISPasteSharingToken tokenValue](v4, "tokenValue");
      v6 = v5 == -[UISPasteSharingToken tokenValue](self, "tokenValue");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)tokenValue
{
  return self->_tokenValue;
}

@end
