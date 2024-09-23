@implementation ICUITextSuggestion

+ (id)literalTextSuggestionWithInputText:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[UITextSuggestion textSuggestionWithInputText:](ICUITextSuggestion, "textSuggestionWithInputText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", 1);
  objc_msgSend(v3, "ic_quotedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDisplayText:", v5);
  return v4;
}

+ (id)hashtagTextSuggestionWithIdentifier:(id)a3 displayText:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  +[UITextSuggestion textSuggestionWithInputText:searchText:](ICUITextSuggestion, "textSuggestionWithInputText:searchText:", v5, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setType:", 2);
  objc_msgSend(v7, "setIdentifier:", v6);

  objc_msgSend(v7, "setDisplayText:", v5);
  return v7;
}

+ (id)mentionTextSuggestionWithIdentifier:(id)a3 displayText:(id)a4 inputText:(id)a5 image:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  +[UITextSuggestion textSuggestionWithInputText:](ICUITextSuggestion, "textSuggestionWithInputText:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setType:", 3);
  objc_msgSend(v12, "setIdentifier:", v11);

  objc_msgSend(v12, "setDisplayText:", v10);
  objc_msgSend(v12, "setImage:", v9);

  return v12;
}

+ (id)calculateResultTextSuggestionWithResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "formattedResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion textSuggestionWithInputText:searchText:](ICUITextSuggestion, "textSuggestionWithInputText:searchText:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setType:", 4);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "expression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ic_calculateEqualsSignString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayText:", v11);

  return v6;
}

+ (id)calculateResultLiteralTextSuggestionWithResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "formattedResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion textSuggestionWithInputText:searchText:](ICUITextSuggestion, "textSuggestionWithInputText:searchText:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setType:", 5);
  objc_msgSend(v3, "formattedResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDisplayText:", v7);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UITextSuggestion inputText](self, "inputText", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion textSuggestionWithInputText:](ICUITextSuggestion, "textSuggestionWithInputText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setType:", -[ICUITextSuggestion type](self, "type"));
  -[ICUITextSuggestion identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  -[UITextSuggestion displayText](self, "displayText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayText:", v7);

  -[UITextSuggestion searchText](self, "searchText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchText:", v8);

  -[UITextSuggestion image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v9);

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
