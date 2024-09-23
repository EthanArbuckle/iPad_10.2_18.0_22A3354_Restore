@implementation TIKeyboardCandidateSuggestion

- (id)candidate
{
  return -[UITextSuggestion inputText](self->_textSuggestion, "inputText");
}

- (id)input
{
  return -[UITextSuggestion searchText](self->_textSuggestion, "searchText");
}

- (id)label
{
  return -[UITextSuggestion displayText](self->_textSuggestion, "displayText");
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

+ (id)candidateWithSuggestion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuggestion:customInfoType:", v4, 0);

  return v5;
}

+ (id)candidateWithSuggestion:(id)a3 customInfoType:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuggestion:customInfoType:", v6, a4);

  return v7;
}

- (TIKeyboardCandidateSuggestion)initWithSuggestion:(id)a3 customInfoType:(unint64_t)a4
{
  id v7;
  TIKeyboardCandidateSuggestion *v8;
  TIKeyboardCandidateSuggestion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardCandidateSuggestion;
  v8 = -[TIKeyboardCandidateSuggestion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_textSuggestion, a3);
    v9->_customInfoType = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardCandidateSuggestion;
  v4 = -[TIKeyboardCandidateSuggestion copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[UITextSuggestion copy](self->_textSuggestion, "copy");
  v6 = (void *)v4[19];
  v4[19] = v5;

  v4[18] = self->_customInfoType;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UITextSuggestion *textSuggestion;
  UITextSuggestion *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardCandidateSuggestion;
  if (-[TIKeyboardCandidateSuggestion isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    textSuggestion = self->_textSuggestion;
    objc_msgSend(v4, "textSuggestion");
    v6 = (UITextSuggestion *)objc_claimAutoreleasedReturnValue();
    v7 = textSuggestion == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UITextSuggestion)textSuggestion
{
  return self->_textSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textSuggestion, 0);
}

@end
