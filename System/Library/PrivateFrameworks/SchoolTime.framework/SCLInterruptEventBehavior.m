@implementation SCLInterruptEventBehavior

- (SCLInterruptEventBehavior)initWithEvent:(id)a3 interruptEligibility:(unint64_t)a4
{
  id v6;
  SCLInterruptEventBehavior *v7;
  uint64_t v8;
  SCLInterruptEvent *event;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLInterruptEventBehavior;
  v7 = -[SCLInterruptEventBehavior init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    event = v7->_event;
    v7->_event = (SCLInterruptEvent *)v8;

    v7->_eligibility = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[SCLInterruptEventBehavior event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SCLInterruptEventBehavior eligibility](self, "eligibility") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SCLInterruptEventBehavior *v4;
  SCLInterruptEventBehavior *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = (SCLInterruptEventBehavior *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCLInterruptEventBehavior event](self, "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLInterruptEventBehavior event](v5, "event");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        v8 = -[SCLInterruptEventBehavior eligibility](self, "eligibility");
        v9 = v8 == -[SCLInterruptEventBehavior eligibility](v5, "eligibility");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLInterruptEventBehavior event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("event"), 1);

  v6 = -[SCLInterruptEventBehavior eligibility](self, "eligibility");
  v7 = CFSTR("<unknown>");
  if (v6 == 1)
    v7 = CFSTR("eligible");
  if (v6)
    v8 = v7;
  else
    v8 = CFSTR("none");
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("eligibleToInterrupt"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLInterruptEventBehavior)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SCLInterruptEventBehavior *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interruptEligible"));

  v7 = -[SCLInterruptEventBehavior initWithEvent:interruptEligibility:](self, "initWithEvent:interruptEligibility:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SCLInterruptEventBehavior event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("event"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[SCLInterruptEventBehavior eligibility](self, "eligibility"), CFSTR("interruptEligible"));
}

- (SCLInterruptEvent)event
{
  return self->_event;
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
