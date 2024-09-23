@implementation TICandidateRequestToken

- (TICandidateRequestToken)init
{
  TIKeyboardState *v3;
  TICandidateRequestToken *v4;

  v3 = objc_alloc_init(TIKeyboardState);
  v4 = -[TICandidateRequestToken initForKeyboardState:](self, "initForKeyboardState:", v3);

  return v4;
}

- (id)initForKeyboardState:(id)a3
{
  id v4;
  TICandidateRequestToken *v5;
  uint64_t v6;
  NSUUID *UUID;
  void *v8;
  void *v9;
  TIDocumentState *v10;
  TIDocumentState *documentState;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TICandidateRequestToken;
  v5 = -[TICandidateRequestToken init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = -[TIDocumentState initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:]([TIDocumentState alloc], "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", 0, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    documentState = v5->_documentState;
    v5->_documentState = v10;

    v5->_shiftState = objc_msgSend(v4, "shiftState");
  }

  return v5;
}

- (TICandidateRequestToken)initWithCoder:(id)a3
{
  id v4;
  TICandidateRequestToken *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  TIDocumentState *documentState;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TICandidateRequestToken;
  v5 = -[TICandidateRequestToken init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v8 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v8;

    v5->_shiftState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shiftState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *UUID;
  TIDocumentState *documentState;
  id v7;

  v4 = a3;
  UUID = self->_UUID;
  v7 = v4;
  if (UUID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", UUID, CFSTR("UUID"));
    v4 = v7;
  }
  documentState = self->_documentState;
  if (documentState)
  {
    objc_msgSend(v7, "encodeObject:forKey:", documentState, CFSTR("documentState"));
    v4 = v7;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_shiftState, CFSTR("shiftState"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[TICandidateRequestToken UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TICandidateRequestToken documentState](self, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 257 * v4;

  return 257 * v6 + self->_shiftState;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
    v6 = -[TICandidateRequestToken isSameRequestAs:](self, "isSameRequestAs:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isSameRequestAs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;

  v4 = a3;
  -[TICandidateRequestToken UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7
    && (-[TICandidateRequestToken documentState](self, "documentState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "documentState"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        v10))
  {
    v11 = -[TICandidateRequestToken shiftState](self, "shiftState");
    v12 = v11 == objc_msgSend(v4, "shiftState");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  unsigned int v3;
  const char *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[TICandidateRequestToken shiftState](self, "shiftState");
  if (v3 > 3)
    v4 = "unknown";
  else
    v4 = off_1E243A578[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICandidateRequestToken UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICandidateRequestToken documentState](self, "documentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; UUID=%@ docState=%@ shiftState=%s>"), v7, self, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)shortIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[TICandidateRequestToken UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "substringToIndex:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (int)shiftState
{
  return self->_shiftState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)tokenForKeyboardState:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TICandidateRequestToken initForKeyboardState:]([TICandidateRequestToken alloc], "initForKeyboardState:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
