@implementation UIAutoFillTextSuggestion

+ (id)autoFillSuggestionWithContents:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__UIAutoFillTextSuggestion_autoFillSuggestionWithContents___block_invoke;
  v10[3] = &unk_1E16B5BD8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContents:", v7);
  return v8;
}

void __59__UIAutoFillTextSuggestion_autoFillSuggestionWithContents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
  }

}

- (UIAutoFillTextSuggestion)initWithContents:(id)a3
{
  id v4;
  UIAutoFillTextSuggestion *v5;
  uint64_t v6;
  NSDictionary *contents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAutoFillTextSuggestion;
  v5 = -[UITextSuggestion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contents = v5->_contents;
    v5->_contents = (NSDictionary *)v6;

  }
  return v5;
}

- (id)_keyboardCandidate
{
  return +[TIKeyboardCandidateSuggestion candidateWithSuggestion:customInfoType:](TIKeyboardCandidateSuggestion, "candidateWithSuggestion:customInfoType:", self, 256);
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
