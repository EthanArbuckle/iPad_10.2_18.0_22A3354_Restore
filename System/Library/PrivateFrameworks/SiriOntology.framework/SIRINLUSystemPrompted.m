@implementation SIRINLUSystemPrompted

- (SIRINLUSystemPrompted)initWithReference:(id)a3
{
  id v5;
  SIRINLUSystemPrompted *v6;
  SIRINLUSystemPrompted *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemPrompted;
  v6 = -[SIRINLUSystemPrompted init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reference, a3);

  return v7;
}

- (SIRINLUSystemPrompted)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSystemPrompted *v5;
  uint64_t v6;
  USOSerializedGraph *reference;
  uint64_t v8;
  NSString *renderedText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUSystemPrompted;
  v5 = -[SIRINLUSystemPrompted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reference"));
    v6 = objc_claimAutoreleasedReturnValue();
    reference = v5->_reference;
    v5->_reference = (USOSerializedGraph *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderedText"));
    v8 = objc_claimAutoreleasedReturnValue();
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUSystemPrompted reference](self, "reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("reference"));

  -[SIRINLUSystemPrompted renderedText](self, "renderedText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("renderedText"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SIRINLUSystemPrompted reference](self, "reference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printedForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSystemPrompted renderedText](self, "renderedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{SystemPrompted\n  reference:\n%@\n  renderedText: %@\n}"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)renderedText
{
  return self->renderedText;
}

- (void)setRenderedText:(id)a3
{
  objc_storeStrong((id *)&self->renderedText, a3);
}

- (USOSerializedGraph)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
