@implementation UITextAutofillSuggestion

+ (id)autofillSuggestionWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUsername:password:", v7, v6);

  return v8;
}

- (UITextAutofillSuggestion)initWithUsername:(id)a3 password:(id)a4
{
  id v7;
  id v8;
  UITextAutofillSuggestion *v9;
  UITextAutofillSuggestion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UITextAutofillSuggestion;
  v9 = -[UITextSuggestion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_username, a3);
    objc_storeStrong((id *)&v10->_password, a4);
  }

  return v10;
}

- (id)_keyboardCandidate
{
  return +[TIKeyboardCandidateSuggestion candidateWithSuggestion:customInfoType:](TIKeyboardCandidateSuggestion, "candidateWithSuggestion:customInfoType:", self, 24);
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
