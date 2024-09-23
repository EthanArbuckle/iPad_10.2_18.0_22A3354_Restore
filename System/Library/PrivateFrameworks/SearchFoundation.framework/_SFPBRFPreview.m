@implementation _SFPBRFPreview

- (_SFPBRFPreview)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFPreview *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBCommandReference *v9;
  void *v10;
  _SFPBCommandReference *v11;
  _SFPBRFPreview *v12;

  v4 = a3;
  v5 = -[_SFPBRFPreview init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFPreview setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "command_reference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBCommandReference alloc];
      objc_msgSend(v4, "command_reference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBCommandReference initWithFacade:](v9, "initWithFacade:", v10);
      -[_SFPBRFPreview setCommand_reference:](v5, "setCommand_reference:", v11);

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

- (void)setCommand_reference:(id)a3
{
  objc_storeStrong((id *)&self->_command_reference, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFPreviewReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFPreview text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBRFPreview command_reference](self, "command_reference");
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
  -[_SFPBRFPreview text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFPreview text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFPreview text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFPreview command_reference](self, "command_reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command_reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFPreview command_reference](self, "command_reference");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFPreview command_reference](self, "command_reference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "command_reference");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_text, "hash");
  return -[_SFPBCommandReference hash](self->_command_reference, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_command_reference)
  {
    -[_SFPBRFPreview command_reference](self, "command_reference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("commandReference"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("commandReference"));

    }
  }
  if (self->_text)
  {
    -[_SFPBRFPreview text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("text"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFPreview dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFPreview)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFPreview *v5;
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
    self = -[_SFPBRFPreview initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFPreview)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFPreview *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBCommandReference *v9;
  _SFPBRFPreview *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFPreview;
  v5 = -[_SFPBRFPreview init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBRFPreview setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandReference"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBCommandReference initWithDictionary:]([_SFPBCommandReference alloc], "initWithDictionary:", v8);
      -[_SFPBRFPreview setCommand_reference:](v5, "setCommand_reference:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (_SFPBCommandReference)command_reference
{
  return self->_command_reference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command_reference, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
