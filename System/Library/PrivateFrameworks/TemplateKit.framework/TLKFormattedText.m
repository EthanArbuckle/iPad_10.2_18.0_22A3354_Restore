@implementation TLKFormattedText

+ (id)formattedTextWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setString:", v3);

  return v4;
}

- (NSString)string
{
  return self->_string;
}

- (int64_t)encapsulationStyle
{
  return self->_encapsulationStyle;
}

- (void)setString:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_string != v10)
  {
    objc_storeStrong((id *)&self->_string, a3);
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
  objc_storeStrong((id *)&self->_string, 0);
}

- (void)setVerticalTextAlignment:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_verticalTextAlignment != a3)
  {
    self->_verticalTextAlignment = a3;
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

- (void)setEncapsulationStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_encapsulationStyle != a3)
  {
    self->_encapsulationStyle = a3;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TLKFormattedText;
  -[TLKFormattedText description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKFormattedText string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ string:%@ isBold:%d isEmphasized:%d"), v4, v5, -[TLKFormattedTextItem isBold](self, "isBold"), -[TLKFormattedTextItem isEmphasized](self, "isEmphasized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[TLKFormattedText string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (int64_t)verticalTextAlignment
{
  return self->_verticalTextAlignment;
}

- (unint64_t)maxLines
{
  return self->_maxLines;
}

- (void)setMaxLines:(unint64_t)a3
{
  self->_maxLines = a3;
}

@end
