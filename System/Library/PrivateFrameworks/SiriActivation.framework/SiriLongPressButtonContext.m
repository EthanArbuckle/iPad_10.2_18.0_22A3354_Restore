@implementation SiriLongPressButtonContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriLongPressButtonContext buttonDownTimestamp](self, "buttonDownTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SiriLongPressButtonContext longPressBehavior](self, "longPressBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriLongPressButtonContext activationEventInstrumentationIdentifier](self, "activationEventInstrumentationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriLongPressButtonContext contextOverride:%@ buttonDownTimestamp:%@ longPressBehavior: %@, activationEventInstrumentationIdentifier: %@>"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriLongPressButtonContext)initWithCoder:(id)a3
{
  id v4;
  SiriLongPressButtonContext *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  NSUUID *activationEventInstrumentationIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriLongPressButtonContext;
  v5 = -[SiriContext initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonDownTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_buttonDownTimestamp = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("longPressBehavior"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_longPressBehavior = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationEventIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    activationEventInstrumentationIdentifier = v5->_activationEventInstrumentationIdentifier;
    v5->_activationEventInstrumentationIdentifier = (NSUUID *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriLongPressButtonContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SiriLongPressButtonContext buttonDownTimestamp](self, "buttonDownTimestamp", v9.receiver, v9.super_class);
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("buttonDownTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SiriLongPressButtonContext longPressBehavior](self, "longPressBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("longPressBehavior"));

  -[SiriLongPressButtonContext activationEventInstrumentationIdentifier](self, "activationEventInstrumentationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("activationEventIdentifier"));

}

- (double)buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (int64_t)longPressBehavior
{
  return self->_longPressBehavior;
}

- (void)setLongPressBehavior:(int64_t)a3
{
  self->_longPressBehavior = a3;
}

- (NSUUID)activationEventInstrumentationIdentifier
{
  return self->_activationEventInstrumentationIdentifier;
}

- (void)setActivationEventInstrumentationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activationEventInstrumentationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationEventInstrumentationIdentifier, 0);
}

@end
