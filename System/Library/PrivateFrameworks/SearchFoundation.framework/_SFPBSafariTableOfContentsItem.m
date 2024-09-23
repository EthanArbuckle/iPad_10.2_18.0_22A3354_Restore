@implementation _SFPBSafariTableOfContentsItem

- (_SFPBSafariTableOfContentsItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBSafariTableOfContentsItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBSafariTableOfContentsItem *v12;

  v4 = a3;
  v5 = -[_SFPBSafariTableOfContentsItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSafariTableOfContentsItem setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "elementPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "elementPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSafariTableOfContentsItem setElementPath:](v5, "setElementPath:", v9);

    }
    objc_msgSend(v4, "trailingText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "trailingText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSafariTableOfContentsItem setTrailingText:](v5, "setTrailingText:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  text = self->_text;
  self->_text = v4;

}

- (void)setElementPath:(id)a3
{
  NSString *v4;
  NSString *elementPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  elementPath = self->_elementPath;
  self->_elementPath = v4;

}

- (void)setTrailingText:(id)a3
{
  NSString *v4;
  NSString *trailingText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  trailingText = self->_trailingText;
  self->_trailingText = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSafariTableOfContentsItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBSafariTableOfContentsItem text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBSafariTableOfContentsItem elementPath](self, "elementPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBSafariTableOfContentsItem trailingText](self, "trailingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBSafariTableOfContentsItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBSafariTableOfContentsItem text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSafariTableOfContentsItem text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBSafariTableOfContentsItem elementPath](self, "elementPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBSafariTableOfContentsItem elementPath](self, "elementPath");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSafariTableOfContentsItem elementPath](self, "elementPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "elementPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBSafariTableOfContentsItem trailingText](self, "trailingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBSafariTableOfContentsItem trailingText](self, "trailingText");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_SFPBSafariTableOfContentsItem trailingText](self, "trailingText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_text, "hash");
  v4 = -[NSString hash](self->_elementPath, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_trailingText, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_elementPath)
  {
    -[_SFPBSafariTableOfContentsItem elementPath](self, "elementPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("elementPath"));

  }
  if (self->_text)
  {
    -[_SFPBSafariTableOfContentsItem text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("text"));

  }
  if (self->_trailingText)
  {
    -[_SFPBSafariTableOfContentsItem trailingText](self, "trailingText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("trailingText"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSafariTableOfContentsItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBSafariTableOfContentsItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSafariTableOfContentsItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBSafariTableOfContentsItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSafariTableOfContentsItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSafariTableOfContentsItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBSafariTableOfContentsItem *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBSafariTableOfContentsItem;
  v5 = -[_SFPBSafariTableOfContentsItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBSafariTableOfContentsItem setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("elementPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBSafariTableOfContentsItem setElementPath:](v5, "setElementPath:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBSafariTableOfContentsItem setTrailingText:](v5, "setTrailingText:", v11);

    }
    v12 = v5;

  }
  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)elementPath
{
  return self->_elementPath;
}

- (NSString)trailingText
{
  return self->_trailingText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_elementPath, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
