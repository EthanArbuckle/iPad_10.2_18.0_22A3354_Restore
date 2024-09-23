@implementation _SFPBTrack

- (_SFPBTrack)initWithFacade:(id)a3
{
  id v4;
  _SFPBTrack *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBURL *v13;
  void *v14;
  _SFPBURL *v15;
  void *v16;
  _SFPBActionItem *v17;
  void *v18;
  _SFPBActionItem *v19;
  _SFPBTrack *v20;

  v4 = a3;
  v5 = -[_SFPBTrack init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTrack setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "number");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "number");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTrack setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "duration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "duration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBTrack setDuration:](v5, "setDuration:", v11);

    }
    if (objc_msgSend(v4, "hasHighlighted"))
      -[_SFPBTrack setHighlighted:](v5, "setHighlighted:", objc_msgSend(v4, "highlighted"));
    objc_msgSend(v4, "preview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBURL alloc];
      objc_msgSend(v4, "preview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBURL initWithNSURL:](v13, "initWithNSURL:", v14);
      -[_SFPBTrack setPreview:](v5, "setPreview:", v15);

    }
    objc_msgSend(v4, "playAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [_SFPBActionItem alloc];
      objc_msgSend(v4, "playAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_SFPBActionItem initWithFacade:](v17, "initWithFacade:", v18);
      -[_SFPBTrack setPlayAction:](v5, "setPlayAction:", v19);

    }
    v20 = v5;
  }

  return v5;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setNumber:(id)a3
{
  NSString *v4;
  NSString *number;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  number = self->_number;
  self->_number = v4;

}

- (void)setDuration:(id)a3
{
  NSString *v4;
  NSString *duration;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  duration = self->_duration;
  self->_duration = v4;

}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (void)setPlayAction:(id)a3
{
  objc_storeStrong((id *)&self->_playAction, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTrackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_SFPBTrack title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBTrack number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBTrack duration](self, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  if (-[_SFPBTrack highlighted](self, "highlighted"))
    PBDataWriterWriteBOOLField();
  -[_SFPBTrack preview](self, "preview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBTrack playAction](self, "playAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int highlighted;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BOOL v33;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[_SFPBTrack title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTrack title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBTrack title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBTrack number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTrack number](self, "number");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBTrack number](self, "number");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "number");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBTrack duration](self, "duration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTrack duration](self, "duration");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBTrack duration](self, "duration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_28;
  }
  else
  {

  }
  highlighted = self->_highlighted;
  if (highlighted != objc_msgSend(v4, "highlighted"))
    goto LABEL_28;
  -[_SFPBTrack preview](self, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_27;
  -[_SFPBTrack preview](self, "preview");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBTrack preview](self, "preview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_28;
  }
  else
  {

  }
  -[_SFPBTrack playAction](self, "playAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  -[_SFPBTrack playAction](self, "playAction");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_31:
    v33 = 1;
    goto LABEL_29;
  }
  v29 = (void *)v28;
  -[_SFPBTrack playAction](self, "playAction");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playAction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if ((v32 & 1) != 0)
    goto LABEL_31;
LABEL_28:
  v33 = 0;
LABEL_29:

  return v33;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_number, "hash");
  v5 = -[NSString hash](self->_duration, "hash");
  if (self->_highlighted)
    v6 = 2654435761;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[_SFPBURL hash](self->_preview, "hash");
  return v7 ^ -[_SFPBActionItem hash](self->_playAction, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_duration)
  {
    -[_SFPBTrack duration](self, "duration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  }
  if (self->_highlighted)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBTrack highlighted](self, "highlighted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("highlighted"));

  }
  if (self->_number)
  {
    -[_SFPBTrack number](self, "number");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("number"));

  }
  if (self->_playAction)
  {
    -[_SFPBTrack playAction](self, "playAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("playAction"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("playAction"));

    }
  }
  if (self->_preview)
  {
    -[_SFPBTrack preview](self, "preview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("preview"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("preview"));

    }
  }
  if (self->_title)
  {
    -[_SFPBTrack title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBTrack dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBTrack)initWithJSON:(id)a3
{
  void *v4;
  _SFPBTrack *v5;
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
    self = -[_SFPBTrack initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBTrack)initWithDictionary:(id)a3
{
  id v4;
  _SFPBTrack *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBURL *v14;
  void *v15;
  _SFPBActionItem *v16;
  _SFPBTrack *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBTrack;
  v5 = -[_SFPBTrack init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBTrack setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("number"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBTrack setNumber:](v5, "setNumber:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBTrack setDuration:](v5, "setDuration:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("highlighted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBTrack setHighlighted:](v5, "setHighlighted:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preview"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v13);
      -[_SFPBTrack setPreview:](v5, "setPreview:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playAction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBActionItem initWithDictionary:]([_SFPBActionItem alloc], "initWithDictionary:", v15);
      -[_SFPBTrack setPlayAction:](v5, "setPlayAction:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)number
{
  return self->_number;
}

- (NSString)duration
{
  return self->_duration;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (_SFPBURL)preview
{
  return self->_preview;
}

- (_SFPBActionItem)playAction
{
  return self->_playAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
