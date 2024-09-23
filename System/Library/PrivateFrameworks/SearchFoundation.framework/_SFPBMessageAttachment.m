@implementation _SFPBMessageAttachment

- (_SFPBMessageAttachment)initWithFacade:(id)a3
{
  id v4;
  _SFPBMessageAttachment *v5;
  void *v6;
  _SFPBURL *v7;
  void *v8;
  _SFPBURL *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBPhotosLibraryImage *v13;
  void *v14;
  _SFPBPhotosLibraryImage *v15;
  _SFPBMessageAttachment *v16;

  v4 = a3;
  v5 = -[_SFPBMessageAttachment init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasType"))
      -[_SFPBMessageAttachment setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBURL alloc];
      objc_msgSend(v4, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBURL initWithNSURL:](v7, "initWithNSURL:", v8);
      -[_SFPBMessageAttachment setUrl:](v5, "setUrl:", v9);

    }
    objc_msgSend(v4, "linkMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "linkMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBMessageAttachment setLinkMetadata:](v5, "setLinkMetadata:", v11);

    }
    objc_msgSend(v4, "photosLibraryImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBPhotosLibraryImage alloc];
      objc_msgSend(v4, "photosLibraryImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBPhotosLibraryImage initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBMessageAttachment setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v15);

    }
    v16 = v5;
  }

  return v5;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setLinkMetadata:(id)a3
{
  NSData *v4;
  NSData *linkMetadata;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  linkMetadata = self->_linkMetadata;
  self->_linkMetadata = v4;

}

- (void)setPhotosLibraryImage:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibraryImage, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMessageAttachmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_SFPBMessageAttachment type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_SFPBMessageAttachment url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBMessageAttachment linkMetadata](self, "linkMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteDataField();

  -[_SFPBMessageAttachment photosLibraryImage](self, "photosLibraryImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int type;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_18;
  -[_SFPBMessageAttachment url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_SFPBMessageAttachment url](self, "url");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBMessageAttachment url](self, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBMessageAttachment linkMetadata](self, "linkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[_SFPBMessageAttachment linkMetadata](self, "linkMetadata");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBMessageAttachment linkMetadata](self, "linkMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[_SFPBMessageAttachment photosLibraryImage](self, "photosLibraryImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosLibraryImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_SFPBMessageAttachment photosLibraryImage](self, "photosLibraryImage");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[_SFPBMessageAttachment photosLibraryImage](self, "photosLibraryImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photosLibraryImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = 2654435761 * self->_type;
  v4 = -[_SFPBURL hash](self->_url, "hash");
  v5 = v4 ^ -[NSData hash](self->_linkMetadata, "hash");
  return v5 ^ -[_SFPBPhotosLibraryImage hash](self->_photosLibraryImage, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_linkMetadata)
  {
    -[_SFPBMessageAttachment linkMetadata](self, "linkMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("linkMetadata"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("linkMetadata"));

    }
  }
  if (self->_photosLibraryImage)
  {
    -[_SFPBMessageAttachment photosLibraryImage](self, "photosLibraryImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("photosLibraryImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("photosLibraryImage"));

    }
  }
  if (self->_type)
  {
    v10 = -[_SFPBMessageAttachment type](self, "type");
    if (v10 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E4042078 + v10);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("type"));

  }
  if (self->_url)
  {
    -[_SFPBMessageAttachment url](self, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("url"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("url"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBMessageAttachment dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBMessageAttachment)initWithJSON:(id)a3
{
  void *v4;
  _SFPBMessageAttachment *v5;
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
    self = -[_SFPBMessageAttachment initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBMessageAttachment)initWithDictionary:(id)a3
{
  id v4;
  _SFPBMessageAttachment *v5;
  void *v6;
  void *v7;
  _SFPBURL *v8;
  void *v9;
  void *v10;
  void *v11;
  _SFPBPhotosLibraryImage *v12;
  _SFPBMessageAttachment *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBMessageAttachment;
  v5 = -[_SFPBMessageAttachment init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBMessageAttachment setType:](v5, "setType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v7);
      -[_SFPBMessageAttachment setUrl:](v5, "setUrl:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("linkMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v9, 0);
      -[_SFPBMessageAttachment setLinkMetadata:](v5, "setLinkMetadata:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosLibraryImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[_SFPBPhotosLibraryImage initWithDictionary:]([_SFPBPhotosLibraryImage alloc], "initWithDictionary:", v11);
      -[_SFPBMessageAttachment setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (int)type
{
  return self->_type;
}

- (_SFPBURL)url
{
  return self->_url;
}

- (NSData)linkMetadata
{
  return self->_linkMetadata;
}

- (_SFPBPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
