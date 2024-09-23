@implementation SFClientTimingFeedback

- (SFClientTimingFeedback)initWithEvent:(id)a3 timeInterval:(unint64_t)a4 queryId:(unint64_t)a5
{
  id v9;
  SFClientTimingFeedback *v10;
  SFClientTimingFeedback *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFClientTimingFeedback;
  v10 = -[SFFeedback init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_eventName, a3);
    v11->_nanosecondInterval = a4;
    v11->super._queryId = a5;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %llu"), self->_eventName, self->_nanosecondInterval);
}

- (SFClientTimingFeedback)initWithCoder:(id)a3
{
  id v4;
  SFClientTimingFeedback *v5;
  uint64_t v6;
  NSString *eventName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFClientTimingFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_eventName"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    v5->_nanosecondInterval = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_nanosecondInterval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFClientTimingFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventName, CFSTR("_eventName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_nanosecondInterval, CFSTR("_nanosecondInterval"));

}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)nanosecondInterval
{
  return self->_nanosecondInterval;
}

- (void)setNanosecondInterval:(unint64_t)a3
{
  self->_nanosecondInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
