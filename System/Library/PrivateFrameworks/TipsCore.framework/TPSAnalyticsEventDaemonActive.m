@implementation TPSAnalyticsEventDaemonActive

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_reason, CFSTR("reason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_alreadyRunning);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("already_running"));

  return v3;
}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("daemon_active"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

+ (id)eventWithReason:(id)a3 alreadyRunning:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithReason:alreadyRunning:", v6, v4);

  return v7;
}

- (id)_initWithReason:(id)a3 alreadyRunning:(BOOL)a4
{
  id v7;
  TPSAnalyticsEventDaemonActive *v8;
  TPSAnalyticsEventDaemonActive *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsEventDaemonActive;
  v8 = -[TPSAnalyticsEvent initWithDate:](&v11, sel_initWithDate_, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_alreadyRunning = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventDaemonActive)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventDaemonActive *v5;
  uint64_t v6;
  NSString *reason;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAnalyticsEventDaemonActive;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v6 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    v5->_alreadyRunning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("already_running"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventDaemonActive;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_reason, CFSTR("reason"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_alreadyRunning, CFSTR("already_running"));

}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

@end
