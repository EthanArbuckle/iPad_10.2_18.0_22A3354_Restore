@implementation RTCSecureHierarchyToken

- (RTCSecureHierarchyToken)initWithToken:(id)a3 level:(int)a4
{
  RTCSecureHierarchyToken *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RTCSecureHierarchyToken;
  v6 = -[RTCSecureHierarchyToken init](&v8, sel_init);
  if (v6)
  {
    v6->_token = (NSString *)objc_msgSend(a3, "copy");
    v6->_level = a4;
  }
  return v6;
}

- (RTCSecureHierarchyToken)initWithCoder:(id)a3
{
  RTCSecureHierarchyToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTCSecureHierarchyToken;
  v4 = -[RTCSecureHierarchyToken init](&v6, sel_init);
  if (v4)
  {
    v4->_token = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token")), "copy");
    v4->_level = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("level"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTCSecureHierarchyToken;
  -[RTCSecureHierarchyToken dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_level, CFSTR("level"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTCSecureHierarchyToken:%@-%d"), self->_token, self->_level);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RTCSecureHierarchyToken initWithToken:level:](+[RTCSecureHierarchyToken allocWithZone:](RTCSecureHierarchyToken, "allocWithZone:", a3), "initWithToken:level:", self->_token, self->_level);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)level
{
  return self->_level;
}

- (void)setLevel:(int)a3
{
  self->_level = a3;
}

@end
