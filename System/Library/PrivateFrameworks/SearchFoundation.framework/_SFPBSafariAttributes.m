@implementation _SFPBSafariAttributes

- (_SFPBSafariAttributes)initWithFacade:(id)a3
{
  id v4;
  _SFPBSafariAttributes *v5;
  _SFPBSafariAttributes *v6;

  v4 = a3;
  v5 = -[_SFPBSafariAttributes init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasHideReason"))
      -[_SFPBSafariAttributes setHideReason:](v5, "setHideReason:", objc_msgSend(v4, "hideReason"));
    v6 = v5;
  }

  return v5;
}

- (void)setHideReason:(int)a3
{
  self->_hideReason = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSafariAttributesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_SFPBSafariAttributes hideReason](self, "hideReason"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int hideReason;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    hideReason = self->_hideReason;
    v6 = hideReason == objc_msgSend(v4, "hideReason");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761 * self->_hideReason;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hideReason)
  {
    v4 = -[_SFPBSafariAttributes hideReason](self, "hideReason");
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 == 1)
      {
        v5 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("0");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hideReason"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSafariAttributes dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSafariAttributes)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSafariAttributes *v5;
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
    self = -[_SFPBSafariAttributes initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSafariAttributes)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSafariAttributes *v5;
  void *v6;
  _SFPBSafariAttributes *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBSafariAttributes;
  v5 = -[_SFPBSafariAttributes init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hideReason"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBSafariAttributes setHideReason:](v5, "setHideReason:", objc_msgSend(v6, "intValue"));
    v7 = v5;

  }
  return v5;
}

- (int)hideReason
{
  return self->_hideReason;
}

@end
