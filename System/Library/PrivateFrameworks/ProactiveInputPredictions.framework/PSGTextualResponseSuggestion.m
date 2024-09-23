@implementation PSGTextualResponseSuggestion

- (PSGTextualResponseSuggestion)initWithText:(id)a3 category:(id)a4
{
  id v7;
  id v8;
  PSGTextualResponseSuggestion *v9;
  PSGTextualResponseSuggestion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGTextualResponseSuggestion;
  v9 = -[PSGTextualResponseSuggestion init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseText, a3);
    objc_storeStrong((id *)&v10->_responseCategory, a4);
  }

  return v10;
}

- (PSGTextualResponseSuggestion)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  PSGTextualResponseSuggestion *v9;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("txt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("cat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[PSGTextualResponseSuggestion initWithText:category:](self, "initWithText:category:", v6, v7);
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *responseText;
  id v5;

  responseText = self->_responseText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", responseText, CFSTR("txt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseCategory, CFSTR("cat"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_responseText, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_responseCategory, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (BOOL)isEqualToTextualSuggestion:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *responseText;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *v12;
  NSString *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  responseText = self->_responseText;
  v7 = (NSString *)*((id *)v4 + 1);
  if (responseText == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = responseText;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_responseCategory;
  v13 = v12;
  if (v12 == (NSString *)v5[2])
    v11 = 1;
  else
    v11 = -[NSString isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PSGTextualResponseSuggestion *v4;
  PSGTextualResponseSuggestion *v5;
  BOOL v6;

  v4 = (PSGTextualResponseSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGTextualResponseSuggestion isEqualToTextualSuggestion:](self, "isEqualToTextualSuggestion:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_responseText, "hash");
  return -[NSString hash](self->_responseCategory, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PSGTextualResponseSuggestion txt:%@ cat:%@>"), self->_responseText, self->_responseCategory);
}

- (NSString)responseText
{
  return self->_responseText;
}

- (NSString)responseCategory
{
  return self->_responseCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCategory, 0);
  objc_storeStrong((id *)&self->_responseText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
