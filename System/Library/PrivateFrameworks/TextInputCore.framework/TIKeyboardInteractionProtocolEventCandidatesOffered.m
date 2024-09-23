@implementation TIKeyboardInteractionProtocolEventCandidatesOffered

- (TIKeyboardInteractionProtocolEventCandidatesOffered)initWithCandidatesOffered:(id)a3 keyboardState:(id)a4
{
  id v7;
  TIKeyboardInteractionProtocolEventCandidatesOffered *v8;
  TIKeyboardInteractionProtocolEventCandidatesOffered *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventCandidatesOffered;
  v8 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v11, sel_initWithKeyboardState_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_candidates, a3);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventCandidatesOffered;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidates, CFSTR("candidates"), v5.receiver, v5.super_class);

}

- (TIKeyboardInteractionProtocolEventCandidatesOffered)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventCandidatesOffered *v5;
  uint64_t v6;
  TIAutocorrectionList *candidates;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInteractionProtocolEventCandidatesOffered;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidates"));
    v6 = objc_claimAutoreleasedReturnValue();
    candidates = v5->_candidates;
    v5->_candidates = (TIAutocorrectionList *)v6;

  }
  -[TIAutocorrectionList corrections](v5->_candidates, "corrections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autocorrection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInteractionProtocolEventCandidatesOffered adjustSourceMaskForCandidate:](v5, "adjustSourceMaskForCandidate:", v9);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TIAutocorrectionList predictions](v5->_candidates, "predictions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[TIKeyboardInteractionProtocolEventCandidatesOffered adjustSourceMaskForCandidate:](v5, "adjustSourceMaskForCandidate:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (void)adjustSourceMaskForCandidate:(id)a3
{
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v3 = objc_msgSend(v10, "usageTrackingMask");
  v4 = objc_msgSend(v10, "sourceMask");
  if ((v3 & 0x40000) != 0)
    v5 = 0x20000;
  else
    v5 = 0x8000;
  v6 = v5 | v4 & 0xFFFFFFFE;
  if ((v3 & 0x40000) != 0)
    v7 = 0x40000;
  else
    v7 = 0x10000;
  if ((v4 & 1) == 0)
    v6 = v4;
  v8 = v6 & 0xFFFFFFFD | v7;
  if ((v6 & 2) != 0)
    v9 = v8;
  else
    v9 = v6;
  objc_msgSend(v10, "setSourceMask:", v9);

}

- (void)sendTo:(id)a3
{
  TIAutocorrectionList *candidates;
  id v5;
  id v6;

  candidates = self->_candidates;
  v5 = a3;
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidatesOffered:keyboardState:", candidates, v6);

}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAutocorrectionList corrections](self->_candidates, "corrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[TIAutocorrectionList corrections](self->_candidates, "corrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autocorrection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[TIAutocorrectionList corrections](self->_candidates, "corrections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "autocorrection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "candidate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v13);

      objc_msgSend(v3, "appendString:", CFSTR(": "));
    }
  }
  else
  {

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TIAutocorrectionList predictions](self->_candidates, "predictions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "candidate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v19);

        objc_msgSend(v3, "appendString:", CFSTR(" "));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Candidates Offered: %@>"), v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (TIAutocorrectionList)candidates
{
  return self->_candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
