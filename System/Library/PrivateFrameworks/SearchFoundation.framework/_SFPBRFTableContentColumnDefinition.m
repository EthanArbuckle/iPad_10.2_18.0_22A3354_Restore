@implementation _SFPBRFTableContentColumnDefinition

- (_SFPBRFTableContentColumnDefinition)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTableContentColumnDefinition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBRFTableContentColumnDefinition *v12;

  v4 = a3;
  v5 = -[_SFPBRFTableContentColumnDefinition init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "size_percent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "size_percent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[_SFPBRFTableContentColumnDefinition setSize_percent:](v5, "setSize_percent:");

    }
    if (objc_msgSend(v4, "hasHorizontal_alignment"))
      -[_SFPBRFTableContentColumnDefinition setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    objc_msgSend(v4, "drop_order");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "drop_order");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFTableContentColumnDefinition setDrop_order:](v5, "setDrop_order:", objc_msgSend(v9, "intValue"));

    }
    objc_msgSend(v4, "equal_size_column_group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "equal_size_column_group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRFTableContentColumnDefinition setEqual_size_column_group:](v5, "setEqual_size_column_group:", objc_msgSend(v11, "intValue"));

    }
    if (objc_msgSend(v4, "hasDisable_truncation"))
      -[_SFPBRFTableContentColumnDefinition setDisable_truncation:](v5, "setDisable_truncation:", objc_msgSend(v4, "disable_truncation"));
    if (objc_msgSend(v4, "hasShould_drop_in_flow_layout"))
      -[_SFPBRFTableContentColumnDefinition setShould_drop_in_flow_layout:](v5, "setShould_drop_in_flow_layout:", objc_msgSend(v4, "should_drop_in_flow_layout"));
    v12 = v5;
  }

  return v5;
}

- (void)setSize_percent:(float)a3
{
  self->_size_percent = a3;
}

- (void)setHorizontal_alignment:(int)a3
{
  self->_horizontal_alignment = a3;
}

- (void)setDrop_order:(int)a3
{
  self->_drop_order = a3;
}

- (void)setEqual_size_column_group:(int)a3
{
  self->_equal_size_column_group = a3;
}

- (void)setDisable_truncation:(BOOL)a3
{
  self->_disable_truncation = a3;
}

- (void)setShould_drop_in_flow_layout:(BOOL)a3
{
  self->_should_drop_in_flow_layout = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _SFPBRFTableContentColumnDefinitionReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  -[_SFPBRFTableContentColumnDefinition size_percent](self, "size_percent");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_SFPBRFTableContentColumnDefinition horizontal_alignment](self, "horizontal_alignment"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableContentColumnDefinition drop_order](self, "drop_order"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableContentColumnDefinition disable_truncation](self, "disable_truncation"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBRFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float size_percent;
  float v6;
  int horizontal_alignment;
  int drop_order;
  int equal_size_column_group;
  int disable_truncation;
  int should_drop_in_flow_layout;
  BOOL v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (size_percent = self->_size_percent, objc_msgSend(v4, "size_percent"), size_percent == v6)
    && (horizontal_alignment = self->_horizontal_alignment,
        horizontal_alignment == objc_msgSend(v4, "horizontal_alignment"))
    && (drop_order = self->_drop_order, drop_order == objc_msgSend(v4, "drop_order"))
    && (equal_size_column_group = self->_equal_size_column_group,
        equal_size_column_group == objc_msgSend(v4, "equal_size_column_group"))
    && (disable_truncation = self->_disable_truncation,
        disable_truncation == objc_msgSend(v4, "disable_truncation")))
  {
    should_drop_in_flow_layout = self->_should_drop_in_flow_layout;
    v12 = should_drop_in_flow_layout == objc_msgSend(v4, "should_drop_in_flow_layout");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  float size_percent;
  BOOL v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  size_percent = self->_size_percent;
  v4 = size_percent < 0.0;
  if (size_percent == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v5 = size_percent;
    v6 = -v5;
    if (!v4)
      v6 = v5;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v9 += (unint64_t)v8;
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  if (self->_disable_truncation)
    v10 = 2654435761;
  else
    v10 = 0;
  if (self->_should_drop_in_flow_layout)
    v11 = 2654435761;
  else
    v11 = 0;
  return (2654435761 * self->_horizontal_alignment) ^ v9 ^ (2654435761 * self->_drop_order) ^ (2654435761
                                                                                                 * self->_equal_size_column_group) ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_disable_truncation)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFTableContentColumnDefinition disable_truncation](self, "disable_truncation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("disableTruncation"));

  }
  if (self->_drop_order)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRFTableContentColumnDefinition drop_order](self, "drop_order"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dropOrder"));

  }
  if (self->_equal_size_column_group)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBRFTableContentColumnDefinition equal_size_column_group](self, "equal_size_column_group"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("equalSizeColumnGroup"));

  }
  if (self->_horizontal_alignment)
  {
    v7 = -[_SFPBRFTableContentColumnDefinition horizontal_alignment](self, "horizontal_alignment");
    if (v7 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *(&off_1E4042190 + v7);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("horizontalAlignment"));

  }
  if (self->_should_drop_in_flow_layout)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("shouldDropInFlowLayout"));

  }
  if (self->_size_percent != 0.0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[_SFPBRFTableContentColumnDefinition size_percent](self, "size_percent");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sizePercent"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTableContentColumnDefinition dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTableContentColumnDefinition)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTableContentColumnDefinition *v5;
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
    self = -[_SFPBRFTableContentColumnDefinition initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTableContentColumnDefinition)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTableContentColumnDefinition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBRFTableContentColumnDefinition *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBRFTableContentColumnDefinition;
  v5 = -[_SFPBRFTableContentColumnDefinition init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sizePercent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[_SFPBRFTableContentColumnDefinition setSize_percent:](v5, "setSize_percent:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("horizontalAlignment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableContentColumnDefinition setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dropOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableContentColumnDefinition setDrop_order:](v5, "setDrop_order:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("equalSizeColumnGroup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableContentColumnDefinition setEqual_size_column_group:](v5, "setEqual_size_column_group:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disableTruncation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableContentColumnDefinition setDisable_truncation:](v5, "setDisable_truncation:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldDropInFlowLayout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableContentColumnDefinition setShould_drop_in_flow_layout:](v5, "setShould_drop_in_flow_layout:", objc_msgSend(v11, "BOOLValue"));
    v12 = v5;

  }
  return v5;
}

- (float)size_percent
{
  return self->_size_percent;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (int)drop_order
{
  return self->_drop_order;
}

- (int)equal_size_column_group
{
  return self->_equal_size_column_group;
}

- (BOOL)disable_truncation
{
  return self->_disable_truncation;
}

- (BOOL)should_drop_in_flow_layout
{
  return self->_should_drop_in_flow_layout;
}

@end
