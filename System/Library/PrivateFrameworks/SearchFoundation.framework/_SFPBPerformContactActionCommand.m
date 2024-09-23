@implementation _SFPBPerformContactActionCommand

- (_SFPBPerformContactActionCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBPerformContactActionCommand *v5;
  _SFPBPerformContactActionCommand *v6;

  v4 = a3;
  v5 = -[_SFPBPerformContactActionCommand init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasContactActionType"))
      -[_SFPBPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", objc_msgSend(v4, "contactActionType"));
    if (objc_msgSend(v4, "hasDidDisplayHandleOptions"))
      -[_SFPBPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", objc_msgSend(v4, "didDisplayHandleOptions"));
    if (objc_msgSend(v4, "hasDidSelectFromOptionsMenu"))
      -[_SFPBPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", objc_msgSend(v4, "didSelectFromOptionsMenu"));
    v6 = v5;
  }

  return v5;
}

- (void)setContactActionType:(int)a3
{
  self->_contactActionType = a3;
}

- (void)setDidDisplayHandleOptions:(BOOL)a3
{
  self->_didDisplayHandleOptions = a3;
}

- (void)setDidSelectFromOptionsMenu:(BOOL)a3
{
  self->_didSelectFromOptionsMenu = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPerformContactActionCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBPerformContactActionCommand contactActionType](self, "contactActionType"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int contactActionType;
  int didDisplayHandleOptions;
  int didSelectFromOptionsMenu;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (contactActionType = self->_contactActionType,
        contactActionType == objc_msgSend(v4, "contactActionType"))
    && (didDisplayHandleOptions = self->_didDisplayHandleOptions,
        didDisplayHandleOptions == objc_msgSend(v4, "didDisplayHandleOptions")))
  {
    didSelectFromOptionsMenu = self->_didSelectFromOptionsMenu;
    v8 = didSelectFromOptionsMenu == objc_msgSend(v4, "didSelectFromOptionsMenu");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = 2654435761;
  if (self->_didDisplayHandleOptions)
    v3 = 2654435761;
  else
    v3 = 0;
  if (!self->_didSelectFromOptionsMenu)
    v2 = 0;
  return v3 ^ v2 ^ (2654435761 * self->_contactActionType);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contactActionType)
  {
    v4 = -[_SFPBPerformContactActionCommand contactActionType](self, "contactActionType");
    if (v4 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E4041E50 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactActionType"));

  }
  if (self->_didDisplayHandleOptions)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("didDisplayHandleOptions"));

  }
  if (self->_didSelectFromOptionsMenu)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("didSelectFromOptionsMenu"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPerformContactActionCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPerformContactActionCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPerformContactActionCommand *v5;
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
    self = -[_SFPBPerformContactActionCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPerformContactActionCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPerformContactActionCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBPerformContactActionCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBPerformContactActionCommand;
  v5 = -[_SFPBPerformContactActionCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactActionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didDisplayHandleOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didSelectFromOptionsMenu"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (int)contactActionType
{
  return self->_contactActionType;
}

- (BOOL)didDisplayHandleOptions
{
  return self->_didDisplayHandleOptions;
}

- (BOOL)didSelectFromOptionsMenu
{
  return self->_didSelectFromOptionsMenu;
}

@end
