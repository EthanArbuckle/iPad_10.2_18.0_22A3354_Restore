@implementation TITypologyRecordGroupMarker

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textChange, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (TITypologyRecordGroupMarker)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordGroupMarker *v5;
  uint64_t v6;
  TIKeyboardState *keyboardState;
  uint64_t v8;
  NSString *textChange;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordGroupMarker;
  v5 = -[TITypologyRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textChange"));
    v8 = objc_claimAutoreleasedReturnValue();
    textChange = v5->_textChange;
    v5->_textChange = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordGroupMarker;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_textChange, CFSTR("textChange"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordGroupMarker keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordGroupMarker setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordGroupMarker textChange](self, "textChange");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E243B990;
  -[TITypologyRecordGroupMarker keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RECORD GROUP (%@): \"%@\"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordGroupMarker keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (NSString)textChange
{
  return self->_textChange;
}

- (void)setTextChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
