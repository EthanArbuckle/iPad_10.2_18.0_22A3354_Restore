@implementation SiriContext

- (SiriContext)initWithSpeechRequestOptions:(id)a3
{
  id v5;
  SiriContext *v6;
  SiriContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriContext;
  v6 = -[SiriContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_speechRequestOptions, a3);

  return v7;
}

- (SiriContext)initWithContextOverride:(id)a3
{
  id v4;
  SiriContext *v5;
  SiriContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriContext;
  v5 = -[SiriContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SiriContext setContextOverride:](v5, "setContextOverride:", v4);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContext speechRequestOptions](self, "speechRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriContext contextOverride:%@ speechRequestOptions:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SiriContext *v4;
  void *v5;
  SiriContext *v6;
  void *v7;

  v4 = [SiriContext alloc];
  -[SiriContext speechRequestOptions](self, "speechRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SiriContext initWithSpeechRequestOptions:](v4, "initWithSpeechRequestOptions:", v5);

  -[SiriContext contextOverride](self, "contextOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContext setContextOverride:](v6, "setContextOverride:", v7);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriContext)initWithCoder:(id)a3
{
  id v4;
  SiriContext *v5;
  uint64_t v6;
  AFSpeechRequestOptions *speechRequestOptions;
  uint64_t v8;
  SiriContextOverride *contextOverride;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriContext;
  v5 = -[SiriContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechRequestOptions"));
    v6 = objc_claimAutoreleasedReturnValue();
    speechRequestOptions = v5->_speechRequestOptions;
    v5->_speechRequestOptions = (AFSpeechRequestOptions *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextOverride"));
    v8 = objc_claimAutoreleasedReturnValue();
    contextOverride = v5->_contextOverride;
    v5->_contextOverride = (SiriContextOverride *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SiriContext speechRequestOptions](self, "speechRequestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("speechRequestOptions"));

  -[SiriContext contextOverride](self, "contextOverride");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("contextOverride"));

}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (SiriContextOverride)contextOverride
{
  return self->_contextOverride;
}

- (void)setContextOverride:(id)a3
{
  objc_storeStrong((id *)&self->_contextOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextOverride, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
}

@end
