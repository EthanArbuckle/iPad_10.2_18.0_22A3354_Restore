@implementation SIRINLUSystemInformed

- (SIRINLUSystemInformed)initWithEntities:(id)a3
{
  id v5;
  SIRINLUSystemInformed *v6;
  SIRINLUSystemInformed *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemInformed;
  v6 = -[SIRINLUSystemInformed init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entities, a3);

  return v7;
}

- (SIRINLUSystemInformed)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSystemInformed *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *entities;
  uint64_t v11;
  NSString *renderedText;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SIRINLUSystemInformed;
  v5 = -[SIRINLUSystemInformed init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("entities"));
    v9 = objc_claimAutoreleasedReturnValue();
    entities = v5->_entities;
    v5->_entities = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renderedText"));
    v11 = objc_claimAutoreleasedReturnValue();
    renderedText = v5->renderedText;
    v5->renderedText = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUSystemInformed entities](self, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entities"));

  -[SIRINLUSystemInformed renderedText](self, "renderedText");
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

  -[SIRINLUSystemInformed entities](self, "entities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v3, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSystemInformed renderedText](self, "renderedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{SystemInformed\n  entities:\n%@\n  renderedText: %@\n}"), v4, v6);
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

- (NSArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
