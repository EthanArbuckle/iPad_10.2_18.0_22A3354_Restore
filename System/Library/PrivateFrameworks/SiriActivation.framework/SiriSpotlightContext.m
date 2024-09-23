@implementation SiriSpotlightContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSpotlightContext utteranceText](self, "utteranceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriSpotlightContextSource:", -[SiriSpotlightContext source](self, "source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriLongPressButtonContext contextOverride:%@, utteranceText:%@, source:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriSpotlightContext)initWithCoder:(id)a3
{
  id v4;
  SiriSpotlightContext *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriSpotlightContext;
  v5 = -[SiriContext initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("utteranceText"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E91FDE50;
    objc_storeStrong((id *)&v5->_utteranceText, v8);

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriSpotlightContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SiriSpotlightContext utteranceText](self, "utteranceText", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("utteranceText"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SiriSpotlightContext source](self, "source"), CFSTR("source"));
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setUtteranceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceText, 0);
}

@end
