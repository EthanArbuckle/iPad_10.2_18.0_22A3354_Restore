@implementation SIRINLUSystemGaveOptions

- (SIRINLUSystemGaveOptions)initWithChoices:(id)a3
{
  id v5;
  SIRINLUSystemGaveOptions *v6;
  SIRINLUSystemGaveOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemGaveOptions;
  v6 = -[SIRINLUSystemGaveOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_choices, a3);

  return v7;
}

- (SIRINLUSystemGaveOptions)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSystemGaveOptions *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *choices;
  uint64_t v17;
  NSString *renderedText;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SIRINLUSystemGaveOptions;
  v5 = -[SIRINLUSystemGaveOptions init](&v23, sel_init);
  if (v5)
  {
    v22 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v21, v20, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("choices"));
    v15 = objc_claimAutoreleasedReturnValue();
    choices = v5->_choices;
    v5->_choices = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderedText"));
    v17 = objc_claimAutoreleasedReturnValue();
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUSystemGaveOptions choices](self, "choices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("choices"));

  -[SIRINLUSystemGaveOptions renderedText](self, "renderedText");
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

  -[SIRINLUSystemGaveOptions choices](self, "choices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSystemGaveOptions renderedText](self, "renderedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{SystemGaveOptions\n  choices:\n%@\n  renderedText: %@\n}"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)renderedText
{
  return self->renderedText;
}

- (void)setRenderedText:(id)a3
{
  objc_storeStrong((id *)&self->renderedText, a3);
}

- (NSArray)choices
{
  return self->_choices;
}

- (void)setChoices:(id)a3
{
  objc_storeStrong((id *)&self->_choices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
