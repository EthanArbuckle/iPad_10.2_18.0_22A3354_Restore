@implementation _SFPBRFSummaryItemPairCardSection

- (_SFPBRFSummaryItemPairCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFSummaryItemPairCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  _SFPBRFTextProperty *v13;
  void *v14;
  _SFPBRFTextProperty *v15;
  void *v16;
  _SFPBRFTextProperty *v17;
  void *v18;
  _SFPBRFVisualProperty *v19;
  void *v20;
  _SFPBRFVisualProperty *v21;
  void *v22;
  _SFPBRFVisualProperty *v23;
  void *v24;
  _SFPBRFVisualProperty *v25;
  _SFPBRFSummaryItemPairCardSection *v26;

  v4 = a3;
  v5 = -[_SFPBRFSummaryItemPairCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRFTextProperty initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBRFSummaryItemPairCardSection setText_1:](v5, "setText_1:", v9);

    }
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRFTextProperty initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBRFSummaryItemPairCardSection setText_2:](v5, "setText_2:", v13);

    }
    objc_msgSend(v4, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      objc_msgSend(v4, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[_SFPBRFTextProperty initWithFacade:](v15, "initWithFacade:", v16);
      -[_SFPBRFSummaryItemPairCardSection setText_3:](v5, "setText_3:", v17);

    }
    objc_msgSend(v4, "thumbnail");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBRFVisualProperty initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBRFSummaryItemPairCardSection setThumbnail_1:](v5, "setThumbnail_1:", v21);

    }
    objc_msgSend(v4, "thumbnail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [_SFPBRFVisualProperty alloc];
      objc_msgSend(v4, "thumbnail");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_SFPBRFVisualProperty initWithFacade:](v23, "initWithFacade:", v24);
      -[_SFPBRFSummaryItemPairCardSection setThumbnail_2:](v5, "setThumbnail_2:", v25);

    }
    v26 = v5;
  }

  return v5;
}

- (void)setText_1:(id)a3
{
  objc_storeStrong((id *)&self->_text_1, a3);
}

- (void)setText_2:(id)a3
{
  objc_storeStrong((id *)&self->_text_2, a3);
}

- (void)setText_3:(id)a3
{
  objc_storeStrong((id *)&self->_text_3, a3);
}

- (void)setThumbnail_1:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_1, a3);
}

- (void)setThumbnail_2:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail_2, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemPairCardSectionReadFrom(self, (uint64_t)a3);
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
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFSummaryItemPairCardSection text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFSummaryItemPairCardSection text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFSummaryItemPairCardSection text](self, "text");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFSummaryItemPairCardSection text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[_SFPBRFTextProperty hash](self->_text_1, "hash");
  v4 = -[_SFPBRFTextProperty hash](self->_text_2, "hash") ^ v3;
  v5 = -[_SFPBRFTextProperty hash](self->_text_3, "hash");
  v6 = v4 ^ v5 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail_1, "hash");
  return v6 ^ -[_SFPBRFVisualProperty hash](self->_thumbnail_2, "hash");
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
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_text_1)
  {
    -[_SFPBRFSummaryItemPairCardSection text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("text1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("text1"));

    }
  }
  if (self->_text_2)
  {
    -[_SFPBRFSummaryItemPairCardSection text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("text2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("text2"));

    }
  }
  if (self->_text_3)
  {
    -[_SFPBRFSummaryItemPairCardSection text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("text3"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("text3"));

    }
  }
  if (self->_thumbnail_1)
  {
    -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("thumbnail1"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("thumbnail1"));

    }
  }
  if (self->_thumbnail_2)
  {
    -[_SFPBRFSummaryItemPairCardSection thumbnail](self, "thumbnail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("thumbnail2"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("thumbnail2"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFSummaryItemPairCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFSummaryItemPairCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFSummaryItemPairCardSection *v5;
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
    self = -[_SFPBRFSummaryItemPairCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFSummaryItemPairCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFSummaryItemPairCardSection *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFTextProperty *v11;
  void *v12;
  _SFPBRFVisualProperty *v13;
  void *v14;
  _SFPBRFVisualProperty *v15;
  _SFPBRFSummaryItemPairCardSection *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFPBRFSummaryItemPairCardSection;
  v5 = -[_SFPBRFSummaryItemPairCardSection init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFSummaryItemPairCardSection setText_1:](v5, "setText_1:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFSummaryItemPairCardSection setText_2:](v5, "setText_2:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text3"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v10);
      -[_SFPBRFSummaryItemPairCardSection setText_3:](v5, "setText_3:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v12);
      -[_SFPBRFSummaryItemPairCardSection setThumbnail_1:](v5, "setThumbnail_1:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumbnail2"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v14);
      -[_SFPBRFSummaryItemPairCardSection setThumbnail_2:](v5, "setThumbnail_2:", v15);

    }
    v16 = v5;

  }
  return v5;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_3
{
  return self->_text_3;
}

- (_SFPBRFVisualProperty)thumbnail_1
{
  return self->_thumbnail_1;
}

- (_SFPBRFVisualProperty)thumbnail_2
{
  return self->_thumbnail_2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail_2, 0);
  objc_storeStrong((id *)&self->_thumbnail_1, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

@end
