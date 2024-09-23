@implementation TICorrectionCandidates

- (TICorrectionCandidates)initWithAutocorrection:(id)a3 alternateCorrections:(id)a4
{
  return -[TICorrectionCandidates initWithAutocorrection:alternateCorrections:autocorrectionBlocked:](self, "initWithAutocorrection:alternateCorrections:autocorrectionBlocked:", a3, a4, 0);
}

- (TICorrectionCandidates)initWithAutocorrection:(id)a3 alternateCorrections:(id)a4 autocorrectionBlocked:(BOOL)a5
{
  id v9;
  id v10;
  TICorrectionCandidates *v11;
  TICorrectionCandidates *v12;
  uint64_t v13;
  NSArray *alternateCorrections;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TICorrectionCandidates;
  v11 = -[TICorrectionCandidates init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_autocorrection, a3);
    v13 = objc_msgSend(v10, "copy");
    alternateCorrections = v12->_alternateCorrections;
    v12->_alternateCorrections = (NSArray *)v13;

    v12->_autocorrectionBlocked = a5;
  }

  return v12;
}

- (TICorrectionCandidates)initWithCoder:(id)a3
{
  id v4;
  TICorrectionCandidates *v5;
  uint64_t v6;
  TIKeyboardCandidate *autocorrection;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *alternateCorrections;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TICorrectionCandidates;
  v5 = -[TICorrectionCandidates init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autocorrection"));
    v6 = objc_claimAutoreleasedReturnValue();
    autocorrection = v5->_autocorrection;
    v5->_autocorrection = (TIKeyboardCandidate *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("alternateCorrections"));
    v11 = objc_claimAutoreleasedReturnValue();
    alternateCorrections = v5->_alternateCorrections;
    v5->_alternateCorrections = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TIKeyboardCandidate *autocorrection;
  NSArray *alternateCorrections;
  id v7;

  v4 = a3;
  autocorrection = self->_autocorrection;
  v7 = v4;
  if (autocorrection)
  {
    objc_msgSend(v4, "encodeObject:forKey:", autocorrection, CFSTR("autocorrection"));
    v4 = v7;
  }
  alternateCorrections = self->_alternateCorrections;
  if (alternateCorrections)
  {
    objc_msgSend(v7, "encodeObject:forKey:", alternateCorrections, CFSTR("alternateCorrections"));
    v4 = v7;
  }

}

- (id)description
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p autocorrection=%@ alternate=%@"), objc_opt_class(), self, self->_autocorrection, self->_alternateCorrections);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR(">"));
  return v2;
}

- (TIKeyboardCandidate)autocorrection
{
  return self->_autocorrection;
}

- (NSArray)alternateCorrections
{
  return self->_alternateCorrections;
}

- (BOOL)autocorrectionBlocked
{
  return self->_autocorrectionBlocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateCorrections, 0);
  objc_storeStrong((id *)&self->_autocorrection, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
