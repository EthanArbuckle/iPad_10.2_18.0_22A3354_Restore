@implementation _SFPBMediaArtworkImage

- (_SFPBMediaArtworkImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBMediaArtworkImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBMediaArtworkImage *v12;

  v4 = a3;
  v5 = -[_SFPBMediaArtworkImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "persistentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "persistentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaArtworkImage setPersistentID:](v5, "setPersistentID:", v7);

    }
    objc_msgSend(v4, "spotlightIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "spotlightIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaArtworkImage setSpotlightIdentifier:](v5, "setSpotlightIdentifier:", v9);

    }
    if (objc_msgSend(v4, "hasMediaEntityType"))
      -[_SFPBMediaArtworkImage setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v4, "mediaEntityType"));
    objc_msgSend(v4, "universalLibraryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "universalLibraryID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMediaArtworkImage setUniversalLibraryID:](v5, "setUniversalLibraryID:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setPersistentID:(id)a3
{
  NSString *v4;
  NSString *persistentID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  persistentID = self->_persistentID;
  self->_persistentID = v4;

}

- (void)setSpotlightIdentifier:(id)a3
{
  NSString *v4;
  NSString *spotlightIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  spotlightIdentifier = self->_spotlightIdentifier;
  self->_spotlightIdentifier = v4;

}

- (void)setMediaEntityType:(int)a3
{
  self->_mediaEntityType = a3;
}

- (void)setUniversalLibraryID:(id)a3
{
  NSString *v4;
  NSString *universalLibraryID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  universalLibraryID = self->_universalLibraryID;
  self->_universalLibraryID = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaArtworkImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFPBMediaArtworkImage persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBMediaArtworkImage mediaEntityType](self, "mediaEntityType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMediaArtworkImage universalLibraryID](self, "universalLibraryID");
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
  -[_SFPBMediaArtworkImage persistentID](self, "persistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBMediaArtworkImage persistentID](self, "persistentID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBMediaArtworkImage persistentID](self, "persistentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_17;
  -[_SFPBMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spotlightIdentifier");
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
  -[_SFPBMediaArtworkImage universalLibraryID](self, "universalLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[_SFPBMediaArtworkImage universalLibraryID](self, "universalLibraryID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_21:
    v23 = 1;
    goto LABEL_19;
  }
  v19 = (void *)v18;
  -[_SFPBMediaArtworkImage universalLibraryID](self, "universalLibraryID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalLibraryID");
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

  v3 = -[NSString hash](self->_persistentID, "hash");
  v4 = -[NSString hash](self->_spotlightIdentifier, "hash");
  v5 = 2654435761 * self->_mediaEntityType;
  return v4 ^ v3 ^ -[NSString hash](self->_universalLibraryID, "hash") ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mediaEntityType)
  {
    v4 = -[_SFPBMediaArtworkImage mediaEntityType](self, "mediaEntityType");
    if (v4 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E40420F8 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mediaEntityType"));

  }
  if (self->_persistentID)
  {
    -[_SFPBMediaArtworkImage persistentID](self, "persistentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("persistentID"));

  }
  if (self->_spotlightIdentifier)
  {
    -[_SFPBMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("spotlightIdentifier"));

  }
  if (self->_universalLibraryID)
  {
    -[_SFPBMediaArtworkImage universalLibraryID](self, "universalLibraryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("universalLibraryID"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMediaArtworkImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMediaArtworkImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMediaArtworkImage *v5;
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
    self = -[_SFPBMediaArtworkImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMediaArtworkImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMediaArtworkImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBMediaArtworkImage *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBMediaArtworkImage;
  v5 = -[_SFPBMediaArtworkImage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBMediaArtworkImage setPersistentID:](v5, "setPersistentID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spotlightIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBMediaArtworkImage setSpotlightIdentifier:](v5, "setSpotlightIdentifier:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaEntityType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMediaArtworkImage setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("universalLibraryID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[_SFPBMediaArtworkImage setUniversalLibraryID:](v5, "setUniversalLibraryID:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
