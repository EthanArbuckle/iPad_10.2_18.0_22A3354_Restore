@implementation SiriVocalShortcutContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriVocalShortcutContext utteranceText](self, "utteranceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriVocalShortcutContext contextOverride:%@, utteranceText:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriVocalShortcutContext)initWithCoder:(id)a3
{
  id v4;
  SiriVocalShortcutContext *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SiriVocalShortcutContext;
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

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriVocalShortcutContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SiriVocalShortcutContext utteranceText](self, "utteranceText", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("utteranceText"));

}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setUtteranceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceText, 0);
}

@end
