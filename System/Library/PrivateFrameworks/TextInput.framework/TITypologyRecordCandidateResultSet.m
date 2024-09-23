@implementation TITypologyRecordCandidateResultSet

- (TITypologyRecordCandidateResultSet)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordCandidateResultSet *v5;
  uint64_t v6;
  TIKeyboardState *keyboardState;
  uint64_t v8;
  TIKeyboardCandidateResultSet *resultSet;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordCandidateResultSet;
  v5 = -[TITypologyRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resultSet"));
    v8 = objc_claimAutoreleasedReturnValue();
    resultSet = v5->_resultSet;
    v5->_resultSet = (TIKeyboardCandidateResultSet *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TITypologyRecordCandidateResultSet;
  v5 = -[TITypologyRecord encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x18D7835DC](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultSet, CFSTR("resultSet"));
  objc_autoreleasePoolPop(v6);

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordCandidateResultSet keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordCandidateResultSet setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  TITypologyRecordCandidateResultSet *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[TITypologyRecordCandidateResultSet resultSet](self, "resultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uncommittedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CANDIDATES for %@:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyRecordCandidateResultSet resultSet](self, "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__TITypologyRecordCandidateResultSet_shortDescription__block_invoke;
  v12[3] = &unk_1E24396F8;
  v9 = v6;
  v13 = v9;
  v14 = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  v10 = v9;
  return v10;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordCandidateResultSet keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TIKeyboardCandidateResultSet)resultSet
{
  return self->_resultSet;
}

- (void)setResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_resultSet, a3);
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_requestToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_resultSet, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
}

void __54__TITypologyRecordCandidateResultSet_shortDescription__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (a3 > 7)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "resultSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "candidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" (%lu total)"), objc_msgSend(v13, "count"));

    *a4 = 1;
  }
  else
  {
    v7 = CFSTR(", %@");
    if (!a3)
      v7 = CFSTR(" %@");
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v14, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", v9, v10);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordCandidateResultSet:", self);
}

@end
