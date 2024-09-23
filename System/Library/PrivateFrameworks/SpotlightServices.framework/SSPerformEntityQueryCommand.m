@implementation SSPerformEntityQueryCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSPerformEntityQueryCommand;
  v4 = a3;
  -[SSPerformEntityQueryCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSPerformEntityQueryCommand fromSuggestion](self, "fromSuggestion", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_fromSuggestion"));

}

- (SSPerformEntityQueryCommand)initWithCoder:(id)a3
{
  id v4;
  SSPerformEntityQueryCommand *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSPerformEntityQueryCommand;
  v5 = -[SSPerformEntityQueryCommand initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fromSuggestion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPerformEntityQueryCommand setFromSuggestion:](v5, "setFromSuggestion:", objc_msgSend(v6, "BOOLValue"));

  }
  return v5;
}

- (BOOL)fromSuggestion
{
  return self->_fromSuggestion;
}

- (void)setFromSuggestion:(BOOL)a3
{
  self->_fromSuggestion = a3;
}

@end
