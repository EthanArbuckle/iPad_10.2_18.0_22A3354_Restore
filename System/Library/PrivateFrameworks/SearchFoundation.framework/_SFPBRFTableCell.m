@implementation _SFPBRFTableCell

- (_SFPBRFTableCell)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTableCell *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFTextProperty *v9;
  void *v10;
  _SFPBRFVisualProperty *v11;
  void *v12;
  _SFPBRFVisualProperty *v13;
  void *v14;
  void *v15;
  _SFPBRFTableCell *v16;

  v4 = a3;
  v5 = -[_SFPBRFTableCell init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasText"))
    {
      objc_msgSend(v4, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFTextProperty alloc];
        objc_msgSend(v4, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFTextProperty initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFTableCell setText:](v5, "setText:", v9);

      }
    }
    if (objc_msgSend(v4, "hasVisual"))
    {
      objc_msgSend(v4, "visual");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFVisualProperty alloc];
        objc_msgSend(v4, "visual");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFVisualProperty initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFTableCell setVisual:](v5, "setVisual:", v13);

      }
    }
    objc_msgSend(v4, "column_span");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "column_span");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFTableCell setColumn_span:](v5, "setColumn_span:", objc_msgSend(v15, "intValue"));

    }
    if (objc_msgSend(v4, "hasHorizontal_alignment"))
      -[_SFPBRFTableCell setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    if (objc_msgSend(v4, "hasApplySmallCaps"))
      -[_SFPBRFTableCell setApplySmallCaps:](v5, "setApplySmallCaps:", objc_msgSend(v4, "applySmallCaps"));
    v16 = v5;
  }

  return v5;
}

- (void)setText:(id)a3
{
  _SFPBRFTextProperty *v4;
  _SFPBRFVisualProperty *visual;
  _SFPBRFTextProperty *text;

  v4 = (_SFPBRFTextProperty *)a3;
  visual = self->_visual;
  self->_visual = 0;

  self->_whichContent = v4 != 0;
  text = self->_text;
  self->_text = v4;

}

- (_SFPBRFTextProperty)text
{
  if (self->_whichContent == 1)
    return self->_text;
  else
    return (_SFPBRFTextProperty *)0;
}

- (void)setVisual:(id)a3
{
  _SFPBRFVisualProperty *v4;
  _SFPBRFTextProperty *text;
  _SFPBRFVisualProperty *visual;

  v4 = (_SFPBRFVisualProperty *)a3;
  text = self->_text;
  self->_text = 0;

  self->_whichContent = 2 * (v4 != 0);
  visual = self->_visual;
  self->_visual = v4;

}

- (_SFPBRFVisualProperty)visual
{
  if (self->_whichContent == 2)
    return self->_visual;
  else
    return (_SFPBRFVisualProperty *)0;
}

- (void)setColumn_span:(int)a3
{
  self->_column_span = a3;
}

- (void)setHorizontal_alignment:(int)a3
{
  self->_horizontal_alignment = a3;
}

- (void)setApplySmallCaps:(BOOL)a3
{
  self->_applySmallCaps = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableCellReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBRFTableCell text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFTableCell visual](self, "visual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFTableCell column_span](self, "column_span"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableCell horizontal_alignment](self, "horizontal_alignment"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableCell applySmallCaps](self, "applySmallCaps"))
    PBDataWriterWriteBOOLField();

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
  BOOL v17;
  int column_span;
  int horizontal_alignment;
  int applySmallCaps;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBRFTableCell text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBRFTableCell text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFTableCell text](self, "text");
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
  -[_SFPBRFTableCell visual](self, "visual");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visual");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_SFPBRFTableCell visual](self, "visual");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFTableCell visual](self, "visual");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visual");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  column_span = self->_column_span;
  if (column_span == objc_msgSend(v4, "column_span"))
  {
    horizontal_alignment = self->_horizontal_alignment;
    if (horizontal_alignment == objc_msgSend(v4, "horizontal_alignment"))
    {
      applySmallCaps = self->_applySmallCaps;
      v17 = applySmallCaps == objc_msgSend(v4, "applySmallCaps");
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[_SFPBRFTextProperty hash](self->_text, "hash");
  v4 = -[_SFPBRFVisualProperty hash](self->_visual, "hash");
  v5 = 2654435761;
  if (!self->_applySmallCaps)
    v5 = 0;
  return v4 ^ v3 ^ (2654435761 * self->_column_span) ^ (2654435761 * self->_horizontal_alignment) ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applySmallCaps)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFTableCell applySmallCaps](self, "applySmallCaps"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("applySmallCaps"));

  }
  if (self->_column_span)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRFTableCell column_span](self, "column_span"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("columnSpan"));

  }
  if (self->_horizontal_alignment)
  {
    v6 = -[_SFPBRFTableCell horizontal_alignment](self, "horizontal_alignment");
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E4042190 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("horizontalAlignment"));

  }
  if (self->_text)
  {
    -[_SFPBRFTableCell text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("text"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("text"));

    }
  }
  if (self->_visual)
  {
    -[_SFPBRFTableCell visual](self, "visual");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("visual"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("visual"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTableCell dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTableCell)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTableCell *v5;
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
    self = -[_SFPBRFTableCell initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTableCell)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTableCell *v5;
  void *v6;
  _SFPBRFTextProperty *v7;
  void *v8;
  _SFPBRFVisualProperty *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBRFTableCell *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBRFTableCell;
  v5 = -[_SFPBRFTableCell init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFTextProperty initWithDictionary:]([_SFPBRFTextProperty alloc], "initWithDictionary:", v6);
      -[_SFPBRFTableCell setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visual"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFVisualProperty initWithDictionary:]([_SFPBRFVisualProperty alloc], "initWithDictionary:", v8);
      -[_SFPBRFTableCell setVisual:](v5, "setVisual:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("columnSpan"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableCell setColumn_span:](v5, "setColumn_span:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalAlignment"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableCell setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applySmallCaps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableCell setApplySmallCaps:](v5, "setApplySmallCaps:", objc_msgSend(v12, "BOOLValue"));
    v13 = v5;

  }
  return v5;
}

- (int)column_span
{
  return self->_column_span;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (unint64_t)whichContent
{
  return self->_whichContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visual, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
