@implementation TIKeyboardInteractionProtocolEventContextDidChange

- (TIKeyboardInteractionProtocolEventContextDidChange)initWithContext:(id)a3 wordDelete:(BOOL)a4 cursorMoved:(BOOL)a5 extendsPriorWord:(BOOL)a6 inWord:(id)a7 range:(_NSRange)a8 selectionLocation:(unint64_t)a9 keyboardState:(id)a10
{
  id v16;
  id v17;
  TIKeyboardInteractionProtocolEventContextDidChange *v18;
  TIKeyboardInteractionProtocolEventContextDidChange *v19;
  objc_super v21;

  v16 = a3;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInteractionProtocolEventContextDidChange;
  v18 = -[TIKeyboardInteractionProtocolBase initWithKeyboardState:](&v21, sel_initWithKeyboardState_, a10);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_documentState, a3);
    v19->_wordDelete = a4;
    v19->_cursorMoved = a5;
    v19->_extendsPriorWord = a6;
    objc_storeStrong((id *)&v19->_word, a7);
    v19->_inWordRange = a8;
    v19->_selectionLocation = a9;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInteractionProtocolEventContextDidChange;
  v4 = a3;
  -[TIKeyboardInteractionProtocolBase encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentState, CFSTR("documentState"), v10.receiver, v10.super_class);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wordDelete);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("wordDelete"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cursorMoved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cursorMoved"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_extendsPriorWord);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("extendsPriorWord"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_word, CFSTR("word"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_inWordRange.location, self->_inWordRange.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("inWordRange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_selectionLocation);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("selectionLocation"));

}

- (TIKeyboardInteractionProtocolEventContextDidChange)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventContextDidChange *v5;
  uint64_t v6;
  TIDocumentState *documentState;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *word;
  void *v13;
  NSUInteger v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInteractionProtocolEventContextDidChange;
  v5 = -[TIKeyboardInteractionProtocolBase initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v6 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wordDelete"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wordDelete = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cursorMoved"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cursorMoved = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendsPriorWord"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_extendsPriorWord = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("word"));
    v11 = objc_claimAutoreleasedReturnValue();
    word = v5->_word;
    v5->_word = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inWordRange"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_inWordRange.location = objc_msgSend(v13, "rangeValue");
    v5->_inWordRange.length = v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectionLocation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectionLocation = objc_msgSend(v15, "integerValue");

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  TIDocumentState *documentState;
  _BOOL8 wordDelete;
  _BOOL8 cursorMoved;
  _BOOL8 extendsPriorWord;
  NSString *word;
  _NSRange *p_inWordRange;
  unint64_t selectionLocation;
  id v11;
  id v12;

  documentState = self->_documentState;
  wordDelete = self->_wordDelete;
  cursorMoved = self->_cursorMoved;
  extendsPriorWord = self->_extendsPriorWord;
  word = self->_word;
  p_inWordRange = &self->_inWordRange;
  selectionLocation = self->_selectionLocation;
  v11 = a3;
  -[TIKeyboardInteractionProtocolBase keyboardState](self, "keyboardState");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", documentState, wordDelete, cursorMoved, extendsPriorWord, word, p_inWordRange->location, p_inWordRange->length, selectionLocation, v12);

}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TIDocumentState contextAfterInput](self->_documentState, "contextAfterInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<ContextDidChange: before=[%@], todo...>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (BOOL)wordDelete
{
  return self->_wordDelete;
}

- (BOOL)cursorMoved
{
  return self->_cursorMoved;
}

- (BOOL)extendsPriorWord
{
  return self->_extendsPriorWord;
}

- (NSString)word
{
  return self->_word;
}

- (_NSRange)inWordRange
{
  _NSRange *p_inWordRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_inWordRange = &self->_inWordRange;
  location = self->_inWordRange.location;
  length = p_inWordRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)selectionLocation
{
  return self->_selectionLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
