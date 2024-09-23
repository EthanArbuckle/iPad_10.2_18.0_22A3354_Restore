@implementation SIRINLUSystemOffered

- (SIRINLUSystemOffered)initWithOfferedAct:(id)a3
{
  id v5;
  SIRINLUSystemOffered *v6;
  SIRINLUSystemOffered *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUSystemOffered;
  v6 = -[SIRINLUSystemOffered init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_offeredAct, a3);

  return v7;
}

- (SIRINLUSystemOffered)initWithCoder:(id)a3
{
  id v4;
  SIRINLUSystemOffered *v5;
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
  SIRINLUUserDialogAct *offeredAct;
  uint64_t v17;
  NSString *renderedText;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SIRINLUSystemOffered;
  v5 = -[SIRINLUSystemOffered init](&v21, sel_init);
  if (v5)
  {
    v20 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("offeredAct"));
    v15 = objc_claimAutoreleasedReturnValue();
    offeredAct = v5->_offeredAct;
    v5->_offeredAct = (SIRINLUUserDialogAct *)v15;

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
  -[SIRINLUSystemOffered offeredAct](self, "offeredAct");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("offeredAct"));

  -[SIRINLUSystemOffered renderedText](self, "renderedText");
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

  -[SIRINLUSystemOffered offeredAct](self, "offeredAct");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUSystemOffered renderedText](self, "renderedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{SystemOffered\n  offeredAct:\n%@  renderedText: %@\n}"), v5, v7);
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

- (SIRINLUUserDialogAct)offeredAct
{
  return self->_offeredAct;
}

- (void)setOfferedAct:(id)a3
{
  objc_storeStrong((id *)&self->_offeredAct, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offeredAct, 0);
  objc_storeStrong((id *)&self->renderedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
