@implementation SFFeedback

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = -[SFFeedback timestamp](self, "timestamp");
  v4[2] = -[SFFeedback queryId](self, "queryId");
  return v4;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (SFFeedback)init
{
  SFFeedback *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFFeedback;
  v2 = -[SFFeedback init](&v4, sel_init);
  if (v2)
    v2->_timestamp = mach_absolute_time();
  return v2;
}

- (SFFeedback)initWithCoder:(id)a3
{
  id v4;
  SFFeedback *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFFeedback;
  v5 = -[SFFeedback init](&v7, sel_init);
  if (v5)
  {
    v5->_timestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timestamp"));
    v5->_queryId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_queryId"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_queryId, CFSTR("_queryId"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SFFeedback;
  -[SFFeedback description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (time: %llu)"), v4, -[SFFeedback timestamp](self, "timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
