@implementation UIDictationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationToken)initWithText:(id)a3 removeSpaceBefore:(BOOL)a4 removeSpaceAfter:(BOOL)a5
{
  id v9;
  UIDictationToken *v10;
  UIDictationToken *v11;
  UIDictationToken *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationToken;
  v10 = -[UIDictationToken init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_text, a3);
    v11->_removeSpaceBefore = a4;
    v11->_removeSpaceAfter = a5;
    v12 = v11;
  }

  return v11;
}

- (UIDictationToken)initWithCoder:(id)a3
{
  id v4;
  UIDictationToken *v5;
  uint64_t v6;
  NSString *text;
  UIDictationToken *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationToken;
  v5 = -[UIDictationToken init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_removeSpaceBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removeSpaceBefore"));
    v5->_removeSpaceAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("removeSpaceAfter"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_removeSpaceBefore, CFSTR("removeSpaceBefore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_removeSpaceAfter, CFSTR("removeSpaceAfter"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *text;
  void *v6;
  int removeSpaceBefore;
  int removeSpaceAfter;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    text = self->_text;
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](text, "isEqualToString:", v6)
      && (removeSpaceBefore = self->_removeSpaceBefore,
          removeSpaceBefore == objc_msgSend(v4, "removeSpaceBefore")))
    {
      removeSpaceAfter = self->_removeSpaceAfter;
      v9 = removeSpaceAfter == objc_msgSend(v4, "removeSpaceAfter");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *text;
  const char *v7;
  const char *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  if (self->_removeSpaceBefore)
    v7 = "YES";
  else
    v7 = "NO";
  if (self->_removeSpaceAfter)
    v8 = "YES";
  else
    v8 = "NO";
  -[UIDictationToken _descriptionExtra](self, "_descriptionExtra");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ token=\"%@\", removeSpaceBefore/After=%s/%s%@>"), v5, text, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_descriptionExtra
{
  return &stru_1E16EDF20;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  self->_removeSpaceBefore = a3;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
