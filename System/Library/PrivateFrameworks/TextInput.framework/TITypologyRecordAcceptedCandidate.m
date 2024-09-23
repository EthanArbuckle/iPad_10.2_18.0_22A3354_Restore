@implementation TITypologyRecordAcceptedCandidate

- (TITypologyRecordAcceptedCandidate)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordAcceptedCandidate *v5;
  uint64_t v6;
  TIKeyboardCandidate *candidate;
  uint64_t v8;
  TIKeyboardState *keyboardState;
  uint64_t v10;
  TIKeyboardConfiguration *keyboardConfig;
  void *v12;
  uint64_t v13;
  NSString *textToCommit;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TITypologyRecordAcceptedCandidate;
  v5 = -[TITypologyRecord initWithCoder:](&v16, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardConfig"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textToCommit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    textToCommit = v5->_textToCommit;
    v5->_textToCommit = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordAcceptedCandidate;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, CFSTR("candidate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardConfig, CFSTR("keyboardConfig"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_textToCommit, CFSTR("textToCommit"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordAcceptedCandidate keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordAcceptedCandidate setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)textSummary
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidate");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E243B990;
  v5 = v3;

  return v5;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ACCEPTED %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyRecordAcceptedCandidate textToCommit](self, "textToCommit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TITypologyRecordAcceptedCandidate textToCommit](self, "textToCommit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; COMMIT \"%@\"), v8);

  }
  -[TITypologyRecordAcceptedCandidate keyboardConfig](self, "keyboardConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intermediateText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TITypologyRecordAcceptedCandidate keyboardConfig](self, "keyboardConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "intermediateText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; %@"), v12);

  }
  return v6;
}

- (id)changedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "input");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "candidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@->%@"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  else
  {

  }
  -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "candidate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v15 = 0;
    return v15;
  }
  -[TITypologyRecordAcceptedCandidate candidate](self, "candidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v15;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordAcceptedCandidate keyboardState](self, "keyboardState");
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

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

- (void)setKeyboardConfig:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardConfig, a3);
}

- (NSString)textToCommit
{
  return self->_textToCommit;
}

- (void)setTextToCommit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToCommit, 0);
  objc_storeStrong((id *)&self->_keyboardConfig, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordAcceptedCandidate:", self);
}

@end
