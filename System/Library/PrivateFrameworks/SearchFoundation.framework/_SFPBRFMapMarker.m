@implementation _SFPBRFMapMarker

- (_SFPBRFMapMarker)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFMapMarker *v5;
  void *v6;
  _SFPBRFMapMarkerIdentifier *v7;
  void *v8;
  _SFPBRFMapMarkerIdentifier *v9;
  void *v10;
  _SFPBRFMapMarkerText *v11;
  void *v12;
  _SFPBRFMapMarkerText *v13;
  void *v14;
  _SFPBRFMapMarkerImage *v15;
  void *v16;
  _SFPBRFMapMarkerImage *v17;
  void *v18;
  _SFPBRFColor *v19;
  void *v20;
  _SFPBRFColor *v21;
  _SFPBRFMapMarker *v22;

  v4 = a3;
  v5 = -[_SFPBRFMapMarker init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasIdentifier"))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFMapMarkerIdentifier alloc];
        objc_msgSend(v4, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFMapMarkerIdentifier initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFMapMarker setIdentifier:](v5, "setIdentifier:", v9);

      }
    }
    if (objc_msgSend(v4, "hasText"))
    {
      objc_msgSend(v4, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFMapMarkerText alloc];
        objc_msgSend(v4, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFMapMarkerText initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFMapMarker setText:](v5, "setText:", v13);

      }
    }
    if (objc_msgSend(v4, "hasImage"))
    {
      objc_msgSend(v4, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = [_SFPBRFMapMarkerImage alloc];
        objc_msgSend(v4, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[_SFPBRFMapMarkerImage initWithFacade:](v15, "initWithFacade:", v16);
        -[_SFPBRFMapMarker setImage:](v5, "setImage:", v17);

      }
    }
    objc_msgSend(v4, "tint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBRFColor alloc];
      objc_msgSend(v4, "tint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBRFColor initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBRFMapMarker setTint:](v5, "setTint:", v21);

    }
    v22 = v5;
  }

  return v5;
}

- (void)setIdentifier:(id)a3
{
  _SFPBRFMapMarkerIdentifier *v4;
  _SFPBRFMapMarkerText *text;
  _SFPBRFMapMarkerImage *image;
  _SFPBRFMapMarkerIdentifier *identifier;

  v4 = (_SFPBRFMapMarkerIdentifier *)a3;
  text = self->_text;
  self->_text = 0;

  image = self->_image;
  self->_image = 0;

  self->_whichValue = v4 != 0;
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (_SFPBRFMapMarkerIdentifier)identifier
{
  if (self->_whichValue == 1)
    return self->_identifier;
  else
    return (_SFPBRFMapMarkerIdentifier *)0;
}

- (void)setText:(id)a3
{
  _SFPBRFMapMarkerText *v4;
  _SFPBRFMapMarkerIdentifier *identifier;
  _SFPBRFMapMarkerImage *image;
  _SFPBRFMapMarkerText *text;

  v4 = (_SFPBRFMapMarkerText *)a3;
  identifier = self->_identifier;
  self->_identifier = 0;

  image = self->_image;
  self->_image = 0;

  self->_whichValue = 2 * (v4 != 0);
  text = self->_text;
  self->_text = v4;

}

- (_SFPBRFMapMarkerText)text
{
  if (self->_whichValue == 2)
    return self->_text;
  else
    return (_SFPBRFMapMarkerText *)0;
}

- (void)setImage:(id)a3
{
  _SFPBRFMapMarkerImage *v4;
  _SFPBRFMapMarkerIdentifier *identifier;
  _SFPBRFMapMarkerText *text;
  unint64_t v7;
  _SFPBRFMapMarkerImage *image;

  v4 = (_SFPBRFMapMarkerImage *)a3;
  identifier = self->_identifier;
  self->_identifier = 0;

  text = self->_text;
  self->_text = 0;

  v7 = 3;
  if (!v4)
    v7 = 0;
  self->_whichValue = v7;
  image = self->_image;
  self->_image = v4;

}

- (_SFPBRFMapMarkerImage)image
{
  if (self->_whichValue == 3)
    return self->_image;
  else
    return (_SFPBRFMapMarkerImage *)0;
}

- (void)setTint:(id)a3
{
  objc_storeStrong((id *)&self->_tint, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapMarkerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBRFMapMarker identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapMarker text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapMarker image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFMapMarker tint](self, "tint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBRFMapMarker identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBRFMapMarker identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFMapMarker identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBRFMapMarker text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBRFMapMarker text](self, "text");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFMapMarker text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBRFMapMarker image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBRFMapMarker image](self, "image");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFMapMarker image](self, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBRFMapMarker tint](self, "tint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFMapMarker tint](self, "tint");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBRFMapMarker tint](self, "tint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_SFPBRFMapMarkerIdentifier hash](self->_identifier, "hash");
  v4 = -[_SFPBRFMapMarkerText hash](self->_text, "hash") ^ v3;
  v5 = -[_SFPBRFMapMarkerImage hash](self->_image, "hash");
  return v4 ^ v5 ^ -[_SFPBRFColor hash](self->_tint, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_identifier)
  {
    -[_SFPBRFMapMarker identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identifier"));

    }
  }
  if (self->_image)
  {
    -[_SFPBRFMapMarker image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("image"));

    }
  }
  if (self->_text)
  {
    -[_SFPBRFMapMarker text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("text"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("text"));

    }
  }
  if (self->_tint)
  {
    -[_SFPBRFMapMarker tint](self, "tint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("tint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tint"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFMapMarker dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFMapMarker)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFMapMarker *v5;
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
    self = -[_SFPBRFMapMarker initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFMapMarker)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFMapMarker *v5;
  void *v6;
  _SFPBRFMapMarkerIdentifier *v7;
  void *v8;
  _SFPBRFMapMarkerText *v9;
  void *v10;
  _SFPBRFMapMarkerImage *v11;
  void *v12;
  _SFPBRFColor *v13;
  _SFPBRFMapMarker *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBRFMapMarker;
  v5 = -[_SFPBRFMapMarker init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFMapMarkerIdentifier initWithDictionary:]([_SFPBRFMapMarkerIdentifier alloc], "initWithDictionary:", v6);
      -[_SFPBRFMapMarker setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFMapMarkerText initWithDictionary:]([_SFPBRFMapMarkerText alloc], "initWithDictionary:", v8);
      -[_SFPBRFMapMarker setText:](v5, "setText:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFMapMarkerImage initWithDictionary:]([_SFPBRFMapMarkerImage alloc], "initWithDictionary:", v10);
      -[_SFPBRFMapMarker setImage:](v5, "setImage:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tint"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBRFColor initWithDictionary:]([_SFPBRFColor alloc], "initWithDictionary:", v12);
      -[_SFPBRFMapMarker setTint:](v5, "setTint:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (_SFPBRFColor)tint
{
  return self->_tint;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tint, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
