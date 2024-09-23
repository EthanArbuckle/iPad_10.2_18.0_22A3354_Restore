@implementation _SFPBToggleAudioCommand

- (_SFPBToggleAudioCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBToggleAudioCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBToggleAudioCommand *v12;

  v4 = a3;
  v5 = -[_SFPBToggleAudioCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "localMediaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "localMediaIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBToggleAudioCommand setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v7);

    }
    objc_msgSend(v4, "persistentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "persistentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBToggleAudioCommand setPersistentIdentifier:](v5, "setPersistentIdentifier:", v9);

    }
    if (objc_msgSend(v4, "hasMediaEntityType"))
      -[_SFPBToggleAudioCommand setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v4, "mediaEntityType"));
    objc_msgSend(v4, "universalLibraryIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "universalLibraryIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBToggleAudioCommand setUniversalLibraryIdentifier:](v5, "setUniversalLibraryIdentifier:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setLocalMediaIdentifier:(id)a3
{
  NSString *v4;
  NSString *localMediaIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localMediaIdentifier = self->_localMediaIdentifier;
  self->_localMediaIdentifier = v4;

}

- (void)setPersistentIdentifier:(id)a3
{
  NSString *v4;
  NSString *persistentIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  persistentIdentifier = self->_persistentIdentifier;
  self->_persistentIdentifier = v4;

}

- (void)setMediaEntityType:(int)a3
{
  self->_mediaEntityType = a3;
}

- (void)setUniversalLibraryIdentifier:(id)a3
{
  NSString *v4;
  NSString *universalLibraryIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  universalLibraryIdentifier = self->_universalLibraryIdentifier;
  self->_universalLibraryIdentifier = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBToggleAudioCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBToggleAudioCommand mediaEntityType](self, "mediaEntityType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
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
  int v16;
  int mediaEntityType;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[_SFPBToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localMediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localMediaIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_18;
  }
  else
  {

  }
  mediaEntityType = self->_mediaEntityType;
  if (mediaEntityType != objc_msgSend(v4, "mediaEntityType"))
    goto LABEL_18;
  -[_SFPBToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalLibraryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_SFPBToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_21:
    v23 = 1;
    goto LABEL_19;
  }
  v19 = (void *)v18;
  -[_SFPBToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalLibraryIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) != 0)
    goto LABEL_21;
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_localMediaIdentifier, "hash");
  v4 = -[NSString hash](self->_persistentIdentifier, "hash");
  v5 = 2654435761 * self->_mediaEntityType;
  return v4 ^ v3 ^ -[NSString hash](self->_universalLibraryIdentifier, "hash") ^ v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_localMediaIdentifier)
  {
    -[_SFPBToggleAudioCommand localMediaIdentifier](self, "localMediaIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("localMediaIdentifier"));

  }
  if (self->_mediaEntityType)
  {
    v6 = -[_SFPBToggleAudioCommand mediaEntityType](self, "mediaEntityType");
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E40420F8 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mediaEntityType"));

  }
  if (self->_persistentIdentifier)
  {
    -[_SFPBToggleAudioCommand persistentIdentifier](self, "persistentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("persistentIdentifier"));

  }
  if (self->_universalLibraryIdentifier)
  {
    -[_SFPBToggleAudioCommand universalLibraryIdentifier](self, "universalLibraryIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("universalLibraryIdentifier"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBToggleAudioCommand dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBToggleAudioCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBToggleAudioCommand *v5;
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
    self = -[_SFPBToggleAudioCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBToggleAudioCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBToggleAudioCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBToggleAudioCommand *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBToggleAudioCommand;
  v5 = -[_SFPBToggleAudioCommand init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localMediaIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBToggleAudioCommand setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBToggleAudioCommand setPersistentIdentifier:](v5, "setPersistentIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaEntityType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBToggleAudioCommand setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("universalLibraryIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[_SFPBToggleAudioCommand setUniversalLibraryIdentifier:](v5, "setUniversalLibraryIdentifier:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)universalLibraryIdentifier
{
  return self->_universalLibraryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalLibraryIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_localMediaIdentifier, 0);
}

@end
