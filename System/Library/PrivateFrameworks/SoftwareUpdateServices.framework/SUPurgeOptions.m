@implementation SUPurgeOptions

- (SUPurgeOptions)init
{
  SUPurgeOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPurgeOptions;
  result = -[SUOptionsBase init](&v3, sel_init);
  if (result)
  {
    result->_notifyUser = 0;
    result->_userRequested = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUPurgeOptions)initWithCoder:(id)a3
{
  id v4;
  SUPurgeOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUPurgeOptions;
  v5 = -[SUOptionsBase init](&v7, sel_init);
  if (v5)
  {
    -[SUPurgeOptions setNotifyUser:](v5, "setNotifyUser:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notify")));
    -[SUPurgeOptions setUserRequested:](v5, "setUserRequested:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userRequested")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUPurgeOptions notifyUser](self, "notifyUser"), CFSTR("notify"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUPurgeOptions userRequested](self, "userRequested"), CFSTR("userRequested"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setNotifyUser:", -[SUPurgeOptions notifyUser](self, "notifyUser"));
  objc_msgSend(v4, "setUserRequested:", -[SUPurgeOptions userRequested](self, "userRequested"));
  return v4;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUPurgeOptions notifyUser](self, "notifyUser"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[SUPurgeOptions userRequested](self, "userRequested"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("        SUPurgeOptions:\n        notifyUser:%@\n        userRequested:%@"), v4, v5);
}

- (BOOL)notifyUser
{
  return self->_notifyUser;
}

- (void)setNotifyUser:(BOOL)a3
{
  self->_notifyUser = a3;
}

- (BOOL)userRequested
{
  return self->_userRequested;
}

- (void)setUserRequested:(BOOL)a3
{
  self->_userRequested = a3;
}

@end
