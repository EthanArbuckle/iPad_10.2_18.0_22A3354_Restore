@implementation TITypologyRecordRefinements

- (TITypologyRecordRefinements)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordRefinements *v5;
  uint64_t v6;
  TIKeyboardCandidate *candidate;
  uint64_t v8;
  TIKeyboardState *keyboardState;
  uint64_t v10;
  TIAutocorrectionList *refinements;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITypologyRecordRefinements;
  v5 = -[TITypologyRecord initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate"));
    v6 = objc_claimAutoreleasedReturnValue();
    candidate = v5->_candidate;
    v5->_candidate = (TIKeyboardCandidate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refinements"));
    v10 = objc_claimAutoreleasedReturnValue();
    refinements = v5->_refinements;
    v5->_refinements = (TIAutocorrectionList *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordRefinements;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, CFSTR("candidate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_refinements, CFSTR("refinements"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordRefinements keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordRefinements setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)shortDescription
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TITypologyRecordRefinements refinements](self, "refinements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "candidate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" \"%@\"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordRefinements candidate](self, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("REFINEMENTS for \"%@\": %@"), v13, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordRefinements keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TIAutocorrectionList)refinements
{
  return self->_refinements;
}

- (void)setRefinements:(id)a3
{
  objc_storeStrong((id *)&self->_refinements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinements, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordRefinements:", self);
}

@end
