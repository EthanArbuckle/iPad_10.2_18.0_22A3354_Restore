@implementation SUCorePowerAssertion

- (SUCorePowerAssertion)init
{
  SUCorePowerAssertion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCorePowerAssertion;
  result = -[SUCorePowerAssertion init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_activeAssertionCount = 0xFFFFFFFF00000000;
  return result;
}

- (SUCorePowerAssertion)initWithCoder:(id)a3
{
  id v4;
  SUCorePowerAssertion *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePowerAssertion;
  v5 = -[SUCorePowerAssertion init](&v7, sel_init);
  if (v5)
  {
    v5->_activeAssertionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeAssertionCount"));
    v5->_assertionID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assertionID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"), CFSTR("activeAssertionCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", (int)-[SUCorePowerAssertion assertionID](self, "assertionID"), CFSTR("assertionID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePowerAssertion *v4;
  SUCorePowerAssertion *v5;
  int v6;
  unsigned int v7;
  BOOL v8;

  v4 = (SUCorePowerAssertion *)a3;
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
      v6 = -[SUCorePowerAssertion activeAssertionCount](v5, "activeAssertionCount");
      if (v6 == -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"))
      {
        v7 = -[SUCorePowerAssertion assertionID](v5, "assertionID");
        v8 = v7 == -[SUCorePowerAssertion assertionID](self, "assertionID");
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
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n[>>>\n    activeAssertionCount: %d\n             assertionID: %d\n<<<]"), -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"), -[SUCorePowerAssertion assertionID](self, "assertionID"));
}

- (id)summary
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("active:%d ID:%d"), -[SUCorePowerAssertion activeAssertionCount](self, "activeAssertionCount"), -[SUCorePowerAssertion assertionID](self, "assertionID"));
}

- (int)activeAssertionCount
{
  return self->_activeAssertionCount;
}

- (void)setActiveAssertionCount:(int)a3
{
  self->_activeAssertionCount = a3;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

@end
