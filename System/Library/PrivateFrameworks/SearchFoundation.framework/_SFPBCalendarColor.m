@implementation _SFPBCalendarColor

- (_SFPBCalendarColor)initWithFacade:(id)a3
{
  id v4;
  _SFPBCalendarColor *v5;
  void *v6;
  void *v7;
  _SFPBCalendarColor *v8;

  v4 = a3;
  v5 = -[_SFPBCalendarColor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "eventIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCalendarColor setEventIdentifier:](v5, "setEventIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setEventIdentifier:(id)a3
{
  NSString *v4;
  NSString *eventIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  eventIdentifier = self->_eventIdentifier;
  self->_eventIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCalendarColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBCalendarColor eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBCalendarColor eventIdentifier](self, "eventIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBCalendarColor eventIdentifier](self, "eventIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBCalendarColor eventIdentifier](self, "eventIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eventIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_eventIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_eventIdentifier)
  {
    -[_SFPBCalendarColor eventIdentifier](self, "eventIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("eventIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCalendarColor dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCalendarColor)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCalendarColor *v5;
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
    self = -[_SFPBCalendarColor initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCalendarColor)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCalendarColor *v5;
  void *v6;
  void *v7;
  _SFPBCalendarColor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBCalendarColor;
  v5 = -[_SFPBCalendarColor init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBCalendarColor setEventIdentifier:](v5, "setEventIdentifier:", v7);

    }
    v8 = v5;

  }
  return v5;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
