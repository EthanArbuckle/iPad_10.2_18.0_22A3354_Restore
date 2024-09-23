@implementation PKTapToRadarPrompt

- (PKTapToRadarPrompt)initWithCoder:(id)a3
{
  id v4;
  PKTapToRadarPrompt *v5;
  uint64_t v6;
  NSString *reason;
  uint64_t v8;
  NSDate *lastPromptDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTapToRadarPrompt;
  v5 = -[PKTapToRadarPrompt init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastPromptDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastPromptDate = v5->_lastPromptDate;
    v5->_lastPromptDate = (NSDate *)v8;

    v5->_promptCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promptCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPromptDate, CFSTR("lastPromptDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_promptCount, CFSTR("promptCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), self->_reason);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastPromptDate: '%@'; "), self->_lastPromptDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("promptCount: '%ld'; "), self->_promptCount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)lastPromptDate
{
  return self->_lastPromptDate;
}

- (void)setLastPromptDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)promptCount
{
  return self->_promptCount;
}

- (void)setPromptCount:(int64_t)a3
{
  self->_promptCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPromptDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
