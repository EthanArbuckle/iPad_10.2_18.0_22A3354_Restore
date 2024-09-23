@implementation _SFPBAppEntityAnnotation

- (_SFPBAppEntityAnnotation)initWithFacade:(id)a3
{
  id v4;
  _SFPBAppEntityAnnotation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBAppEntityAnnotation *v10;

  v4 = a3;
  v5 = -[_SFPBAppEntityAnnotation init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "typeIdentifer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "typeIdentifer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAppEntityAnnotation setTypeIdentifer:](v5, "setTypeIdentifer:", v7);

    }
    objc_msgSend(v4, "entityIdentifer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "entityIdentifer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAppEntityAnnotation setEntityIdentifer:](v5, "setEntityIdentifer:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (void)setTypeIdentifer:(id)a3
{
  NSString *v4;
  NSString *typeIdentifer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  typeIdentifer = self->_typeIdentifer;
  self->_typeIdentifer = v4;

}

- (void)setEntityIdentifer:(id)a3
{
  NSString *v4;
  NSString *entityIdentifer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  entityIdentifer = self->_entityIdentifer;
  self->_entityIdentifer = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppEntityAnnotationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFPBAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

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
  -[_SFPBAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeIdentifer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentifer");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_typeIdentifer, "hash");
  return -[NSString hash](self->_entityIdentifer, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_entityIdentifer)
  {
    -[_SFPBAppEntityAnnotation entityIdentifer](self, "entityIdentifer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityIdentifer"));

  }
  if (self->_typeIdentifer)
  {
    -[_SFPBAppEntityAnnotation typeIdentifer](self, "typeIdentifer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("typeIdentifer"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAppEntityAnnotation dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBAppEntityAnnotation)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAppEntityAnnotation *v5;
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
    self = -[_SFPBAppEntityAnnotation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAppEntityAnnotation)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAppEntityAnnotation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBAppEntityAnnotation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBAppEntityAnnotation;
  v5 = -[_SFPBAppEntityAnnotation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typeIdentifer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBAppEntityAnnotation setTypeIdentifer:](v5, "setTypeIdentifer:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entityIdentifer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBAppEntityAnnotation setEntityIdentifer:](v5, "setEntityIdentifer:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)typeIdentifer
{
  return self->_typeIdentifer;
}

- (NSString)entityIdentifer
{
  return self->_entityIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifer, 0);
  objc_storeStrong((id *)&self->_typeIdentifer, 0);
}

@end
