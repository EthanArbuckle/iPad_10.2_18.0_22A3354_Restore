@implementation _SFPBRFAvatarImage

- (_SFPBRFAvatarImage)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFAvatarImage *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBRFAvatarImage *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFAvatarImage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "contact_ids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "contact_ids", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i))
            objc_msgSend(v7, "addObject:");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    -[_SFPBRFAvatarImage setContact_ids:](v5, "setContact_ids:", v7);
    if (objc_msgSend(v4, "hasImage_style"))
      -[_SFPBRFAvatarImage setImage_style:](v5, "setImage_style:", objc_msgSend(v4, "image_style"));
    v13 = v5;

  }
  return v5;
}

- (void)setContact_ids:(id)a3
{
  NSArray *v4;
  NSArray *contact_ids;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  contact_ids = self->_contact_ids;
  self->_contact_ids = v4;

}

- (void)clearContact_ids
{
  -[NSArray removeAllObjects](self->_contact_ids, "removeAllObjects");
}

- (void)addContact_ids:(id)a3
{
  id v4;
  NSArray *contact_ids;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contact_ids = self->_contact_ids;
  v8 = v4;
  if (!contact_ids)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contact_ids;
    self->_contact_ids = v6;

    v4 = v8;
    contact_ids = self->_contact_ids;
  }
  -[NSArray addObject:](contact_ids, "addObject:", v4);

}

- (unint64_t)contact_idsCount
{
  return -[NSArray count](self->_contact_ids, "count");
}

- (id)contact_idsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contact_ids, "objectAtIndexedSubscript:", a3);
}

- (void)setImage_style:(int)a3
{
  self->_image_style = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAvatarImageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFAvatarImage contact_ids](self, "contact_ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (-[_SFPBRFAvatarImage image_style](self, "image_style"))
    PBDataWriterWriteInt32Field();

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
  int v12;
  BOOL v13;
  int image_style;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBRFAvatarImage contact_ids](self, "contact_ids");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact_ids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBRFAvatarImage contact_ids](self, "contact_ids");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        image_style = self->_image_style;
        v13 = image_style == objc_msgSend(v4, "image_style");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBRFAvatarImage contact_ids](self, "contact_ids");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contact_ids");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
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
  return (2654435761 * self->_image_style) ^ -[NSArray hash](self->_contact_ids, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contact_ids)
  {
    -[_SFPBRFAvatarImage contact_ids](self, "contact_ids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactIds"));

  }
  if (self->_image_style)
  {
    v6 = -[_SFPBRFAvatarImage image_style](self, "image_style");
    if (v6 < 0x2A && ((0x3FFDFFFFFFFuLL >> v6) & 1) != 0)
    {
      v7 = *(&off_1E4041EA0 + v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("imageStyle"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFAvatarImage dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFAvatarImage)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFAvatarImage *v5;
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
    self = -[_SFPBRFAvatarImage initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFAvatarImage)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFAvatarImage *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _SFPBRFAvatarImage *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBRFAvatarImage;
  v5 = -[_SFPBRFAvatarImage init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactIds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v17);
              -[_SFPBRFAvatarImage addContact_ids:](v5, "addContact_ids:", v13);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageStyle"), (_QWORD)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFAvatarImage setImage_style:](v5, "setImage_style:", objc_msgSend(v14, "intValue"));
    v15 = v5;

  }
  return v5;
}

- (NSArray)contact_ids
{
  return self->_contact_ids;
}

- (int)image_style
{
  return self->_image_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact_ids, 0);
}

@end
