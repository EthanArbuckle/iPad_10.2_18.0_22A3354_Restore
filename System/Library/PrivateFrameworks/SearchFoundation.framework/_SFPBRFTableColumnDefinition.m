@implementation _SFPBRFTableColumnDefinition

- (_SFPBRFTableColumnDefinition)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTableColumnDefinition *v5;
  void *v6;
  _SFPBRFTableSpacerColumnDefinition *v7;
  void *v8;
  _SFPBRFTableSpacerColumnDefinition *v9;
  void *v10;
  _SFPBRFTableContentColumnDefinition *v11;
  void *v12;
  _SFPBRFTableContentColumnDefinition *v13;
  _SFPBRFTableColumnDefinition *v14;

  v4 = a3;
  v5 = -[_SFPBRFTableColumnDefinition init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasSpacer"))
    {
      objc_msgSend(v4, "spacer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFTableSpacerColumnDefinition alloc];
        objc_msgSend(v4, "spacer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFTableSpacerColumnDefinition initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFTableColumnDefinition setSpacer:](v5, "setSpacer:", v9);

      }
    }
    if (objc_msgSend(v4, "hasContent"))
    {
      objc_msgSend(v4, "content");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFTableContentColumnDefinition alloc];
        objc_msgSend(v4, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFTableContentColumnDefinition initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFTableColumnDefinition setContent:](v5, "setContent:", v13);

      }
    }
    v14 = v5;
  }

  return v5;
}

- (void)setSpacer:(id)a3
{
  _SFPBRFTableSpacerColumnDefinition *v4;
  _SFPBRFTableContentColumnDefinition *content;
  _SFPBRFTableSpacerColumnDefinition *spacer;

  v4 = (_SFPBRFTableSpacerColumnDefinition *)a3;
  content = self->_content;
  self->_content = 0;

  self->_whichDefinition = v4 != 0;
  spacer = self->_spacer;
  self->_spacer = v4;

}

- (_SFPBRFTableSpacerColumnDefinition)spacer
{
  if (self->_whichDefinition == 1)
    return self->_spacer;
  else
    return (_SFPBRFTableSpacerColumnDefinition *)0;
}

- (void)setContent:(id)a3
{
  _SFPBRFTableContentColumnDefinition *v4;
  _SFPBRFTableSpacerColumnDefinition *spacer;
  _SFPBRFTableContentColumnDefinition *content;

  v4 = (_SFPBRFTableContentColumnDefinition *)a3;
  spacer = self->_spacer;
  self->_spacer = 0;

  self->_whichDefinition = 2 * (v4 != 0);
  content = self->_content;
  self->_content = v4;

}

- (_SFPBRFTableContentColumnDefinition)content
{
  if (self->_whichDefinition == 2)
    return self->_content;
  else
    return (_SFPBRFTableContentColumnDefinition *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableColumnDefinitionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFTableColumnDefinition spacer](self, "spacer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFTableColumnDefinition content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBRFTableColumnDefinition spacer](self, "spacer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spacer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFTableColumnDefinition spacer](self, "spacer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFTableColumnDefinition spacer](self, "spacer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spacer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFTableColumnDefinition content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFTableColumnDefinition content](self, "content");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFTableColumnDefinition content](self, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_SFPBRFTableSpacerColumnDefinition hash](self->_spacer, "hash");
  return -[_SFPBRFTableContentColumnDefinition hash](self->_content, "hash") ^ v3;
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
  if (self->_content)
  {
    -[_SFPBRFTableColumnDefinition content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("content"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("content"));

    }
  }
  if (self->_spacer)
  {
    -[_SFPBRFTableColumnDefinition spacer](self, "spacer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("spacer"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("spacer"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTableColumnDefinition dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTableColumnDefinition)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTableColumnDefinition *v5;
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
    self = -[_SFPBRFTableColumnDefinition initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTableColumnDefinition)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTableColumnDefinition *v5;
  void *v6;
  _SFPBRFTableSpacerColumnDefinition *v7;
  void *v8;
  _SFPBRFTableContentColumnDefinition *v9;
  _SFPBRFTableColumnDefinition *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFTableColumnDefinition;
  v5 = -[_SFPBRFTableColumnDefinition init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spacer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTableSpacerColumnDefinition initWithDictionary:]([_SFPBRFTableSpacerColumnDefinition alloc], "initWithDictionary:", v6);
      -[_SFPBRFTableColumnDefinition setSpacer:](v5, "setSpacer:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTableContentColumnDefinition initWithDictionary:]([_SFPBRFTableContentColumnDefinition alloc], "initWithDictionary:", v8);
      -[_SFPBRFTableColumnDefinition setContent:](v5, "setContent:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichDefinition
{
  return self->_whichDefinition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_spacer, 0);
}

@end
