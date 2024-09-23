@implementation TRMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *userInfo;

  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(a3, "encodeObject:forKey:", userInfo, CFSTR("TRMessage_userInfo"));
}

- (TRMessage)initWithCoder:(id)a3
{
  id v4;
  TRMessage *v5;
  void *v6;

  v4 = a3;
  v5 = -[TRMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("TRMessage_userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_userInfo, v6);

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_userInfo)
    v5 = CFSTR("present");
  else
    v5 = CFSTR("absent");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> userInfo: [-%@-]"), v4, self, v5);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
