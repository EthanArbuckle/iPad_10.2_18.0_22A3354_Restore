@implementation TITypologyRecordSync

- (void)setKeyboardConfig:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardConfig, a3);
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfig, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (TITypologyRecordSync)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordSync *v5;
  uint64_t v6;
  TIKeyboardState *keyboardState;
  uint64_t v8;
  TIKeyboardConfiguration *keyboardConfig;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordSync;
  v5 = -[TITypologyRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardConfig"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordSync;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardConfig, CFSTR("keyboardConfig"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordSync keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordSync setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)textSummary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n<context"));
  -[TITypologyRecordSync keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TITypologyRecordSync keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextBeforeInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __35__TITypologyRecordSync_textSummary__block_invoke(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" before=\"%@\"), v10);

  }
  -[TITypologyRecordSync keyboardState](self, "keyboardState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TITypologyRecordSync keyboardState](self, "keyboardState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "documentState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __35__TITypologyRecordSync_textSummary__block_invoke(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" selected=\"%@\"), v17);

  }
  -[TITypologyRecordSync keyboardState](self, "keyboardState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "documentState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contextAfterInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TITypologyRecordSync keyboardState](self, "keyboardState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "documentState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contextAfterInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    __35__TITypologyRecordSync_textSummary__block_invoke(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" after=\"%@\"), v24);

  }
  objc_msgSend(v3, "appendString:", CFSTR("> "));
  return v3;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordSync keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SYNC TO %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordSync keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

id __35__TITypologyRecordSync_textSummary__block_invoke(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), CFSTR("\\\\"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordSync:", self);
}

@end
