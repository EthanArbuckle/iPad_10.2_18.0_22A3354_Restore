@implementation _SFPBClearProactiveCategoryCommand

- (_SFPBClearProactiveCategoryCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBClearProactiveCategoryCommand *v5;
  void *v6;
  void *v7;
  _SFPBClearProactiveCategoryCommand *v8;

  v4 = a3;
  v5 = -[_SFPBClearProactiveCategoryCommand init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasCategory"))
      -[_SFPBClearProactiveCategoryCommand setCategory:](v5, "setCategory:", objc_msgSend(v4, "category"));
    if (objc_msgSend(v4, "hasShouldClearWholeSection"))
      -[_SFPBClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", objc_msgSend(v4, "shouldClearWholeSection"));
    objc_msgSend(v4, "proactiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "proactiveIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBClearProactiveCategoryCommand setProactiveIdentifier:](v5, "setProactiveIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (void)setCategory:(int)a3
{
  self->_category = a3;
}

- (void)setShouldClearWholeSection:(BOOL)a3
{
  self->_shouldClearWholeSection = a3;
}

- (void)setProactiveIdentifier:(id)a3
{
  NSString *v4;
  NSString *proactiveIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  proactiveIdentifier = self->_proactiveIdentifier;
  self->_proactiveIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBClearProactiveCategoryCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_SFPBClearProactiveCategoryCommand category](self, "category"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection"))
    PBDataWriterWriteBOOLField();
  -[_SFPBClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int category;
  int shouldClearWholeSection;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    category = self->_category;
    if (category == objc_msgSend(v4, "category"))
    {
      shouldClearWholeSection = self->_shouldClearWholeSection;
      if (shouldClearWholeSection == objc_msgSend(v4, "shouldClearWholeSection"))
      {
        -[_SFPBClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "proactiveIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_SFPBClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_12:
            v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          -[_SFPBClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "proactiveIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if (self->_shouldClearWholeSection)
    v3 = 2654435761;
  else
    v3 = 0;
  v2 = 2654435761 * self->_category;
  return v3 ^ -[NSString hash](self->_proactiveIdentifier, "hash") ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_category)
  {
    v4 = -[_SFPBClearProactiveCategoryCommand category](self, "category");
    if (v4 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E40420F8 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("category"));

  }
  if (self->_proactiveIdentifier)
  {
    -[_SFPBClearProactiveCategoryCommand proactiveIdentifier](self, "proactiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("proactiveIdentifier"));

  }
  if (self->_shouldClearWholeSection)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBClearProactiveCategoryCommand shouldClearWholeSection](self, "shouldClearWholeSection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("shouldClearWholeSection"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBClearProactiveCategoryCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBClearProactiveCategoryCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBClearProactiveCategoryCommand *v5;
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
    self = -[_SFPBClearProactiveCategoryCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBClearProactiveCategoryCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBClearProactiveCategoryCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFPBClearProactiveCategoryCommand *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBClearProactiveCategoryCommand;
  v5 = -[_SFPBClearProactiveCategoryCommand init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBClearProactiveCategoryCommand setCategory:](v5, "setCategory:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldClearWholeSection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBClearProactiveCategoryCommand setShouldClearWholeSection:](v5, "setShouldClearWholeSection:", objc_msgSend(v7, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("proactiveIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBClearProactiveCategoryCommand setProactiveIdentifier:](v5, "setProactiveIdentifier:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (int)category
{
  return self->_category;
}

- (BOOL)shouldClearWholeSection
{
  return self->_shouldClearWholeSection;
}

- (NSString)proactiveIdentifier
{
  return self->_proactiveIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveIdentifier, 0);
}

@end
