@implementation _SFPBRFExpandingComponentContent

- (_SFPBRFExpandingComponentContent)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFExpandingComponentContent *v5;
  void *v6;
  _SFPBRFLongItemStandardCardSection *v7;
  void *v8;
  _SFPBRFLongItemStandardCardSection *v9;
  void *v10;
  _SFPBRFReferenceFootnoteCardSection *v11;
  void *v12;
  _SFPBRFReferenceFootnoteCardSection *v13;
  _SFPBRFExpandingComponentContent *v14;

  v4 = a3;
  v5 = -[_SFPBRFExpandingComponentContent init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasLong_item_standard_card_section"))
    {
      objc_msgSend(v4, "long_item_standard_card_section");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFLongItemStandardCardSection alloc];
        objc_msgSend(v4, "long_item_standard_card_section");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFLongItemStandardCardSection initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFExpandingComponentContent setLong_item_standard_card_section:](v5, "setLong_item_standard_card_section:", v9);

      }
    }
    if (objc_msgSend(v4, "hasReference_footnote_card_section"))
    {
      objc_msgSend(v4, "reference_footnote_card_section");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFReferenceFootnoteCardSection alloc];
        objc_msgSend(v4, "reference_footnote_card_section");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFReferenceFootnoteCardSection initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFExpandingComponentContent setReference_footnote_card_section:](v5, "setReference_footnote_card_section:", v13);

      }
    }
    v14 = v5;
  }

  return v5;
}

- (void)setLong_item_standard_card_section:(id)a3
{
  _SFPBRFLongItemStandardCardSection *v4;
  _SFPBRFReferenceFootnoteCardSection *reference_footnote_card_section;
  _SFPBRFLongItemStandardCardSection *long_item_standard_card_section;

  v4 = (_SFPBRFLongItemStandardCardSection *)a3;
  reference_footnote_card_section = self->_reference_footnote_card_section;
  self->_reference_footnote_card_section = 0;

  self->_whichValue = v4 != 0;
  long_item_standard_card_section = self->_long_item_standard_card_section;
  self->_long_item_standard_card_section = v4;

}

- (_SFPBRFLongItemStandardCardSection)long_item_standard_card_section
{
  if (self->_whichValue == 1)
    return self->_long_item_standard_card_section;
  else
    return (_SFPBRFLongItemStandardCardSection *)0;
}

- (void)setReference_footnote_card_section:(id)a3
{
  _SFPBRFReferenceFootnoteCardSection *v4;
  _SFPBRFLongItemStandardCardSection *long_item_standard_card_section;
  _SFPBRFReferenceFootnoteCardSection *reference_footnote_card_section;

  v4 = (_SFPBRFReferenceFootnoteCardSection *)a3;
  long_item_standard_card_section = self->_long_item_standard_card_section;
  self->_long_item_standard_card_section = 0;

  self->_whichValue = 2 * (v4 != 0);
  reference_footnote_card_section = self->_reference_footnote_card_section;
  self->_reference_footnote_card_section = v4;

}

- (_SFPBRFReferenceFootnoteCardSection)reference_footnote_card_section
{
  if (self->_whichValue == 2)
    return self->_reference_footnote_card_section;
  else
    return (_SFPBRFReferenceFootnoteCardSection *)0;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFExpandingComponentContentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
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
  -[_SFPBRFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "long_item_standard_card_section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "long_item_standard_card_section");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBRFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reference_footnote_card_section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBRFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reference_footnote_card_section");
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

  v3 = -[_SFPBRFLongItemStandardCardSection hash](self->_long_item_standard_card_section, "hash");
  return -[_SFPBRFReferenceFootnoteCardSection hash](self->_reference_footnote_card_section, "hash") ^ v3;
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
  if (self->_long_item_standard_card_section)
  {
    -[_SFPBRFExpandingComponentContent long_item_standard_card_section](self, "long_item_standard_card_section");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("longItemStandardCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("longItemStandardCardSection"));

    }
  }
  if (self->_reference_footnote_card_section)
  {
    -[_SFPBRFExpandingComponentContent reference_footnote_card_section](self, "reference_footnote_card_section");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("referenceFootnoteCardSection"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("referenceFootnoteCardSection"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFExpandingComponentContent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFExpandingComponentContent)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFExpandingComponentContent *v5;
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
    self = -[_SFPBRFExpandingComponentContent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFExpandingComponentContent)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFExpandingComponentContent *v5;
  void *v6;
  _SFPBRFLongItemStandardCardSection *v7;
  void *v8;
  _SFPBRFReferenceFootnoteCardSection *v9;
  _SFPBRFExpandingComponentContent *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFExpandingComponentContent;
  v5 = -[_SFPBRFExpandingComponentContent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longItemStandardCardSection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFLongItemStandardCardSection initWithDictionary:]([_SFPBRFLongItemStandardCardSection alloc], "initWithDictionary:", v6);
      -[_SFPBRFExpandingComponentContent setLong_item_standard_card_section:](v5, "setLong_item_standard_card_section:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceFootnoteCardSection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFReferenceFootnoteCardSection initWithDictionary:]([_SFPBRFReferenceFootnoteCardSection alloc], "initWithDictionary:", v8);
      -[_SFPBRFExpandingComponentContent setReference_footnote_card_section:](v5, "setReference_footnote_card_section:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference_footnote_card_section, 0);
  objc_storeStrong((id *)&self->_long_item_standard_card_section, 0);
}

@end
