@implementation PSGInputSuggestionsResponseItem

- (PSGInputSuggestionsResponseItem)initWithTextualResponseSuggestion:(id)a3 structuredInfoSuggestion:(id)a4
{
  id v7;
  id v8;
  PSGInputSuggestionsResponseItem *v9;
  PSGInputSuggestionsResponseItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGInputSuggestionsResponseItem;
  v9 = -[PSGInputSuggestionsResponseItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textualResponseSuggestion, a3);
    objc_storeStrong((id *)&v10->_structuredInfoSuggestion, a4);
  }

  return v10;
}

- (id)predictedValue
{
  PSGTextualResponseSuggestion *textualResponseSuggestion;
  __CFString *v4;
  PSGStructuredInfoSuggestion *structuredInfoSuggestion;

  textualResponseSuggestion = self->_textualResponseSuggestion;
  if (textualResponseSuggestion)
  {
    -[PSGTextualResponseSuggestion responseText](textualResponseSuggestion, "responseText");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    structuredInfoSuggestion = self->_structuredInfoSuggestion;
    if (structuredInfoSuggestion)
    {
      -[PSGStructuredInfoSuggestion predictedValue](structuredInfoSuggestion, "predictedValue");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_1EA3F1D80;
    }
  }
  return v4;
}

- (PSGInputSuggestionsResponseItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PSGInputSuggestionsResponseItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:](self, "initWithTextualResponseSuggestion:structuredInfoSuggestion:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  PSGTextualResponseSuggestion *textualResponseSuggestion;
  id v5;

  textualResponseSuggestion = self->_textualResponseSuggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", textualResponseSuggestion, CFSTR("trs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_structuredInfoSuggestion, CFSTR("sis"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[PSGTextualResponseSuggestion copyWithZone:](self->_textualResponseSuggestion, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[PSGStructuredInfoSuggestion copyWithZone:](self->_structuredInfoSuggestion, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4;
  _QWORD *v5;
  PSGTextualResponseSuggestion *textualResponseSuggestion;
  PSGTextualResponseSuggestion *v7;
  PSGTextualResponseSuggestion *v8;
  PSGTextualResponseSuggestion *v9;
  BOOL v10;
  char v11;
  PSGStructuredInfoSuggestion *v12;
  PSGStructuredInfoSuggestion *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  textualResponseSuggestion = self->_textualResponseSuggestion;
  v7 = (PSGTextualResponseSuggestion *)*((id *)v4 + 1);
  if (textualResponseSuggestion == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = textualResponseSuggestion;
    v10 = -[PSGTextualResponseSuggestion isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_structuredInfoSuggestion;
  v13 = v12;
  if (v12 == (PSGStructuredInfoSuggestion *)v5[2])
    v11 = 1;
  else
    v11 = -[PSGStructuredInfoSuggestion isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PSGInputSuggestionsResponseItem *v4;
  PSGInputSuggestionsResponseItem *v5;
  BOOL v6;

  v4 = (PSGInputSuggestionsResponseItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGInputSuggestionsResponseItem isEqualToItem:](self, "isEqualToItem:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[PSGTextualResponseSuggestion hash](self->_textualResponseSuggestion, "hash");
  return -[PSGStructuredInfoSuggestion hash](self->_structuredInfoSuggestion, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PSGInputSuggestionsResponseItem trs:%@ sis:%@>"), self->_textualResponseSuggestion, self->_structuredInfoSuggestion);
}

- (PSGTextualResponseSuggestion)textualResponseSuggestion
{
  return self->_textualResponseSuggestion;
}

- (PSGStructuredInfoSuggestion)structuredInfoSuggestion
{
  return self->_structuredInfoSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredInfoSuggestion, 0);
  objc_storeStrong((id *)&self->_textualResponseSuggestion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
