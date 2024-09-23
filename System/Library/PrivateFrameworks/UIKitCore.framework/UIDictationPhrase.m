@implementation UIDictationPhrase

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationPhrase)initWithText:(id)a3 alternativeInterpretations:(id)a4 style:(int64_t)a5
{
  id v9;
  id v10;
  UIDictationPhrase *v11;
  UIDictationPhrase *v12;
  UIDictationPhrase *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationPhrase;
  v11 = -[UIDictationPhrase init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    objc_storeStrong((id *)&v12->_alternativeInterpretations, a4);
    v12->_style = a5;
    v13 = v12;
  }

  return v12;
}

- (UIDictationPhrase)initWithCoder:(id)a3
{
  id v4;
  UIDictationPhrase *v5;
  uint64_t v6;
  NSString *text;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *alternativeInterpretations;
  objc_super v14;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v14.receiver = self;
  v14.super_class = (Class)UIDictationPhrase;
  v5 = -[UIDictationPhrase init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("AlternativeInterpretations"));
    v11 = objc_claimAutoreleasedReturnValue();
    alternativeInterpretations = v5->_alternativeInterpretations;
    v5->_alternativeInterpretations = (NSArray *)v11;

    v5->_style = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("AlternativeStyle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  NSArray *alternativeInterpretations;
  void *v6;
  int64_t style;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  text = self->_text;
  if (text)
    objc_msgSend(v8, "encodeObject:forKey:", text, CFSTR("Text"));
  alternativeInterpretations = self->_alternativeInterpretations;
  v6 = v8;
  if (alternativeInterpretations)
  {
    objc_msgSend(v8, "encodeObject:forKey:", alternativeInterpretations, CFSTR("AlternativeInterpretations"));
    v6 = v8;
  }
  style = self->_style;
  if (style)
  {
    objc_msgSend(v8, "encodeInt32:forKey:", style, CFSTR("AlternativeStyle"));
    v6 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  UIDictationPhrase *v4;
  UIDictationPhrase *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int64_t v19;

  v4 = (UIDictationPhrase *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIDictationPhrase text](self, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationPhrase text](v5, "text");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[UIDictationPhrase text](self, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationPhrase text](v5, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_11;
      }
      -[UIDictationPhrase alternativeInterpretations](self, "alternativeInterpretations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationPhrase alternativeInterpretations](v5, "alternativeInterpretations");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[UIDictationPhrase alternativeInterpretations](self, "alternativeInterpretations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationPhrase alternativeInterpretations](v5, "alternativeInterpretations");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
        {
LABEL_11:
          v12 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v19 = -[UIDictationPhrase style](self, "style");
      v12 = v19 == -[UIDictationPhrase style](v5, "style");
      goto LABEL_14;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

+ (UIDictationPhrase)phraseWithText:(id)a3 alternativeInterpretations:(id)a4
{
  id v5;
  id v6;
  UIDictationPhrase *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[UIDictationPhrase initWithText:alternativeInterpretations:style:]([UIDictationPhrase alloc], "initWithText:alternativeInterpretations:style:", v6, v5, 1);

  return v7;
}

+ (UIDictationPhrase)phraseWithText:(id)a3 alternativeInterpretations:(id)a4 style:(int64_t)a5
{
  id v7;
  id v8;
  UIDictationPhrase *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[UIDictationPhrase initWithText:alternativeInterpretations:style:]([UIDictationPhrase alloc], "initWithText:alternativeInterpretations:style:", v8, v7, a5);

  return v9;
}

- (id)description
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = -[NSArray count](self->_alternativeInterpretations, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = &stru_1E16EDF20;
    do
    {
      -[NSArray objectAtIndex:](self->_alternativeInterpretations, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v7);
          v8 = objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v8);
          v9 = objc_claimAutoreleasedReturnValue();

          v6 = (__CFString *)v8;
        }
        else
        {
          -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v7);
          v9 = objc_claimAutoreleasedReturnValue();
        }

        v6 = (__CFString *)v9;
      }

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    v6 = &stru_1E16EDF20;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIDictationPhrase ... text: (%@), alternativeInterpretations: (%@)"), self->_text, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)alternativeInterpretations
{
  return self->_alternativeInterpretations;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeInterpretations, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
