@implementation SKHandleInvitability

- (SKHandleInvitability)initWithIsInvitable:(BOOL)a3 wasRemoved:(BOOL)a4
{
  SKHandleInvitability *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKHandleInvitability;
  result = -[SKHandleInvitability init](&v7, sel_init);
  if (result)
  {
    result->_isInvitable = a3;
    result->_wasRemoved = a4;
  }
  return result;
}

+ (id)logger
{
  if (logger_onceToken_7 != -1)
    dispatch_once(&logger_onceToken_7, &__block_literal_global_7);
  return (id)logger__logger_7;
}

void __30__SKHandleInvitability_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKHandleInvitability");
  v1 = (void *)logger__logger_7;
  logger__logger_7 = (uint64_t)v0;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; isInvitable = \"%d\"; wasRemoved = \"%d\">;"),
               objc_opt_class(),
               self,
               -[SKHandleInvitability isInvitable](self, "isInvitable"),
               -[SKHandleInvitability wasRemoved](self, "wasRemoved"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isInvitable;
  id v5;

  isInvitable = self->_isInvitable;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isInvitable, CFSTR("IsInvitable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wasRemoved, CFSTR("WasRemoved"));

}

- (SKHandleInvitability)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsInvitable"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WasRemoved"));

  return -[SKHandleInvitability initWithIsInvitable:wasRemoved:](self, "initWithIsInvitable:wasRemoved:", v5, v6);
}

- (BOOL)isInvitable
{
  return self->_isInvitable;
}

- (BOOL)wasRemoved
{
  return self->_wasRemoved;
}

@end
