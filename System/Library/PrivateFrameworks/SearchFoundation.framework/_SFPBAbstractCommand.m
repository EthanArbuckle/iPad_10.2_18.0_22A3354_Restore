@implementation _SFPBAbstractCommand

- (_SFPBAbstractCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBAbstractCommand *v5;
  void *v6;
  _SFPBCommandValue *v7;
  void *v8;
  _SFPBCommandValue *v9;
  _SFPBAbstractCommand *v10;

  v4 = a3;
  v5 = -[_SFPBAbstractCommand init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasType"))
      -[_SFPBAbstractCommand setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBCommandValue alloc];
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBCommandValue initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBAbstractCommand setValue:](v5, "setValue:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAbstractCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_SFPBAbstractCommand type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBAbstractCommand value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int type;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    type = self->_type;
    if (type == objc_msgSend(v4, "type"))
    {
      -[_SFPBAbstractCommand value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_SFPBAbstractCommand value](self, "value");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_SFPBAbstractCommand value](self, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_type;
  return -[_SFPBCommandValue hash](self->_value, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_type)
  {
    v4 = -[_SFPBAbstractCommand type](self, "type");
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
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  }
  if (self->_value)
  {
    -[_SFPBAbstractCommand value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("value"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAbstractCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBAbstractCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAbstractCommand *v5;
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
    self = -[_SFPBAbstractCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAbstractCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAbstractCommand *v5;
  void *v6;
  void *v7;
  _SFPBCommandValue *v8;
  _SFPBAbstractCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBAbstractCommand;
  v5 = -[_SFPBAbstractCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBAbstractCommand setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBCommandValue initWithDictionary:]([_SFPBCommandValue alloc], "initWithDictionary:", v7);
      -[_SFPBAbstractCommand setValue:](v5, "setValue:", v8);

    }
    v9 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (_SFPBCommandValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
