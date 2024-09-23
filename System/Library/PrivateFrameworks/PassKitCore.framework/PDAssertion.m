@implementation PDAssertion

- (PDAssertion)initWithType:(unint64_t)a3 identifier:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  PDAssertion *v10;
  PDAssertion *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *reason;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PDAssertion;
  v10 = -[PDAssertion init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    v11->_invalidateWhenBackgrounded = 1;
    v11->_createdAt = CFAbsoluteTimeGetCurrent();
  }

  return v11;
}

- (id)description
{
  unint64_t type;
  const __CFString *v3;
  const __CFString *v4;

  type = self->_type;
  if (type > 8)
    v3 = CFSTR("unknown");
  else
    v3 = off_1E2ADB5E8[type];
  if (self->_invalidateWhenBackgrounded)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PDAssertion: Type: %@, Identifier: %@, Reason: \"%@\", invalidateWhenBackgrounded: %@, ageInSeconds: %f>"), v3, self->_identifier, self->_reason, v4, CFAbsoluteTimeGetCurrent() - self->_createdAt);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)invalidateWhenBackgrounded
{
  return self->_invalidateWhenBackgrounded;
}

- (void)setInvalidateWhenBackgrounded:(BOOL)a3
{
  self->_invalidateWhenBackgrounded = a3;
}

- (double)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
