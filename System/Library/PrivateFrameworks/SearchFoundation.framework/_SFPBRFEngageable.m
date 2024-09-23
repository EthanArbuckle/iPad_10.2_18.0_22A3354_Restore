@implementation _SFPBRFEngageable

- (_SFPBRFEngageable)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFEngageable *v5;
  void *v6;
  _SFPBCommandReference *v7;
  void *v8;
  _SFPBCommandReference *v9;
  void *v10;
  _SFPBRFPreviewList *v11;
  void *v12;
  _SFPBRFPreviewList *v13;
  _SFPBRFEngageable *v14;

  v4 = a3;
  v5 = -[_SFPBRFEngageable init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasCommand_reference"))
    {
      objc_msgSend(v4, "command_reference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBCommandReference alloc];
        objc_msgSend(v4, "command_reference");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBCommandReference initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFEngageable setCommand_reference:](v5, "setCommand_reference:", v9);

      }
    }
    if (objc_msgSend(v4, "hasPreview_list"))
    {
      objc_msgSend(v4, "preview_list");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFPreviewList alloc];
        objc_msgSend(v4, "preview_list");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFPreviewList initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFEngageable setPreview_list:](v5, "setPreview_list:", v13);

      }
    }
    v14 = v5;
  }

  return v5;
}

- (void)setCommand_reference:(id)a3
{
  _SFPBCommandReference *v4;
  _SFPBRFPreviewList *preview_list;
  _SFPBCommandReference *command_reference;

  v4 = (_SFPBCommandReference *)a3;
  preview_list = self->_preview_list;
  self->_preview_list = 0;

  self->_whichEngageable_Oneof = v4 != 0;
  command_reference = self->_command_reference;
  self->_command_reference = v4;

}

- (_SFPBCommandReference)command_reference
{
  if (self->_whichEngageable_Oneof == 1)
    return self->_command_reference;
  else
    return (_SFPBCommandReference *)0;
}

- (void)setPreview_list:(id)a3
{
  _SFPBRFPreviewList *v4;
  _SFPBCommandReference *command_reference;
  _SFPBRFPreviewList *preview_list;

  v4 = (_SFPBRFPreviewList *)a3;
  command_reference = self->_command_reference;
  self->_command_reference = 0;

  self->_whichEngageable_Oneof = 2 * (v4 != 0);
  preview_list = self->_preview_list;
  self->_preview_list = v4;

}

- (_SFPBRFPreviewList)preview_list
{
  if (self->_whichEngageable_Oneof == 2)
    return self->_preview_list;
  else
    return (_SFPBRFPreviewList *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFEngageableReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFEngageable command_reference](self, "command_reference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFEngageable preview_list](self, "preview_list");
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
  -[_SFPBRFEngageable command_reference](self, "command_reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command_reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFEngageable command_reference](self, "command_reference");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFEngageable command_reference](self, "command_reference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "command_reference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFEngageable preview_list](self, "preview_list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preview_list");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFEngageable preview_list](self, "preview_list");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFEngageable preview_list](self, "preview_list");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preview_list");
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

  v3 = -[_SFPBCommandReference hash](self->_command_reference, "hash");
  return -[_SFPBRFPreviewList hash](self->_preview_list, "hash") ^ v3;
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
  if (self->_command_reference)
  {
    -[_SFPBRFEngageable command_reference](self, "command_reference");
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
  if (self->_preview_list)
  {
    -[_SFPBRFEngageable preview_list](self, "preview_list");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("previewList"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("previewList"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFEngageable dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFEngageable)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFEngageable *v5;
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
    self = -[_SFPBRFEngageable initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFEngageable)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFEngageable *v5;
  void *v6;
  _SFPBCommandReference *v7;
  void *v8;
  _SFPBRFPreviewList *v9;
  _SFPBRFEngageable *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFEngageable;
  v5 = -[_SFPBRFEngageable init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandReference"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBCommandReference initWithDictionary:]([_SFPBCommandReference alloc], "initWithDictionary:", v6);
      -[_SFPBRFEngageable setCommand_reference:](v5, "setCommand_reference:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFPreviewList initWithDictionary:]([_SFPBRFPreviewList alloc], "initWithDictionary:", v8);
      -[_SFPBRFEngageable setPreview_list:](v5, "setPreview_list:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichEngageable_Oneof
{
  return self->_whichEngageable_Oneof;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview_list, 0);
  objc_storeStrong((id *)&self->_command_reference, 0);
}

@end
