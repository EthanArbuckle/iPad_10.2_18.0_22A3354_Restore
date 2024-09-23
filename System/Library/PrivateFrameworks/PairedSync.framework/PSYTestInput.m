@implementation PSYTestInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)testInputWithAction:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setAction:", a3);
  return v4;
}

- (PSYTestInput)initWithCoder:(id)a3
{
  id v4;
  PSYTestInput *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PSYTestInput;
  v5 = -[PSYTestInput init](&v7, sel_init);
  if (v5)
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_action, CFSTR("action"));
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

@end
