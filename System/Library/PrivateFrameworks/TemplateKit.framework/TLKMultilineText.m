@implementation TLKMultilineText

- (NSString)text
{
  return self->_text;
}

- (unint64_t)maxLines
{
  return self->_maxLines;
}

+ (TLKMultilineText)textWithString:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setText:", v3);

    objc_msgSend(v4, "setMaxLines:", 0);
  }
  else
  {
    v4 = 0;
  }
  return (TLKMultilineText *)v4;
}

- (void)setMaxLines:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_maxLines != a3)
  {
    self->_maxLines = a3;
    -[TLKObject observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKObject observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKObject observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setText:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_text != v10)
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[TLKObject observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKObject observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKObject observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TLKMultilineText;
  -[TLKMultilineText description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKMultilineText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
