@implementation _SFPBCommandButtonItem

- (_SFPBCommandButtonItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBCommandButtonItem *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  _SFPBImage *v9;
  void *v10;
  void *v11;
  void *v12;
  _SFPBCommand *v13;
  void *v14;
  _SFPBCommand *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _SFPBButtonItem *v23;
  _SFPBCommandButtonItem *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBCommandButtonItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBImage alloc];
      objc_msgSend(v4, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBImage initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBCommandButtonItem setImage:](v5, "setImage:", v9);

    }
    objc_msgSend(v4, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBCommandButtonItem setTitle:](v5, "setTitle:", v11);

    }
    objc_msgSend(v4, "command");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBCommand alloc];
      objc_msgSend(v4, "command");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBCommand initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBCommandButtonItem setCommand:](v5, "setCommand:", v15);

    }
    objc_msgSend(v4, "previewButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "previewButtonItems", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = -[_SFPBButtonItem initWithFacade:]([_SFPBButtonItem alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    -[_SFPBCommandButtonItem setPreviewButtonItems:](v5, "setPreviewButtonItems:", v17);
    if (objc_msgSend(v4, "hasIsDestructive"))
      -[_SFPBCommandButtonItem setIsDestructive:](v5, "setIsDestructive:", objc_msgSend(v4, "isDestructive"));
    if (objc_msgSend(v4, "hasUniqueId"))
      -[_SFPBCommandButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v4, "uniqueId"));
    v24 = v5;

  }
  return v5;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (void)setPreviewButtonItems:(id)a3
{
  NSArray *v4;
  NSArray *previewButtonItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  previewButtonItems = self->_previewButtonItems;
  self->_previewButtonItems = v4;

}

- (void)clearPreviewButtonItems
{
  -[NSArray removeAllObjects](self->_previewButtonItems, "removeAllObjects");
}

- (void)addPreviewButtonItems:(id)a3
{
  id v4;
  NSArray *previewButtonItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  previewButtonItems = self->_previewButtonItems;
  v8 = v4;
  if (!previewButtonItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_previewButtonItems;
    self->_previewButtonItems = v6;

    v4 = v8;
    previewButtonItems = self->_previewButtonItems;
  }
  -[NSArray addObject:](previewButtonItems, "addObject:", v4);

}

- (unint64_t)previewButtonItemsCount
{
  return -[NSArray count](self->_previewButtonItems, "count");
}

- (id)previewButtonItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_previewButtonItems, "objectAtIndexedSubscript:", a3);
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCommandButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBCommandButtonItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommandButtonItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBCommandButtonItem command](self, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBCommandButtonItem previewButtonItems](self, "previewButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if (-[_SFPBCommandButtonItem isDestructive](self, "isDestructive"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBCommandButtonItem uniqueId](self, "uniqueId"))
    PBDataWriterWriteUint64Field();

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  int isDestructive;
  unint64_t uniqueId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBCommandButtonItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCommandButtonItem image](self, "image");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBCommandButtonItem image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCommandButtonItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCommandButtonItem title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBCommandButtonItem title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCommandButtonItem command](self, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBCommandButtonItem command](self, "command");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBCommandButtonItem command](self, "command");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "command");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBCommandButtonItem previewButtonItems](self, "previewButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[_SFPBCommandButtonItem previewButtonItems](self, "previewButtonItems");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBCommandButtonItem previewButtonItems](self, "previewButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  isDestructive = self->_isDestructive;
  if (isDestructive == objc_msgSend(v4, "isDestructive"))
  {
    uniqueId = self->_uniqueId;
    v27 = uniqueId == objc_msgSend(v4, "uniqueId");
    goto LABEL_23;
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_SFPBImage hash](self->_image, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[_SFPBCommand hash](self->_command, "hash");
  v6 = -[NSArray hash](self->_previewButtonItems, "hash");
  if (self->_isDestructive)
    v7 = 2654435761;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (2654435761u * self->_uniqueId);
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
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_command)
  {
    -[_SFPBCommandButtonItem command](self, "command");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("command"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("command"));

    }
  }
  if (self->_image)
  {
    -[_SFPBCommandButtonItem image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("image"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("image"));

    }
  }
  if (self->_isDestructive)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBCommandButtonItem isDestructive](self, "isDestructive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isDestructive"));

  }
  if (-[NSArray count](self->_previewButtonItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = self->_previewButtonItems;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("previewButtonItems"));
  }
  if (self->_title)
  {
    -[_SFPBCommandButtonItem title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("title"));

  }
  if (self->_uniqueId)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_SFPBCommandButtonItem uniqueId](self, "uniqueId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("uniqueId"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBCommandButtonItem dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBCommandButtonItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBCommandButtonItem *v5;
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
    self = -[_SFPBCommandButtonItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBCommandButtonItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBCommandButtonItem *v5;
  void *v6;
  _SFPBImage *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBCommand *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  _SFPBButtonItem *v19;
  void *v20;
  void *v21;
  _SFPBCommandButtonItem *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SFPBCommandButtonItem;
  v5 = -[_SFPBCommandButtonItem init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v6);
      -[_SFPBCommandButtonItem setImage:](v5, "setImage:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBCommandButtonItem setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("command"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBCommand initWithDictionary:]([_SFPBCommand alloc], "initWithDictionary:", v10);
      -[_SFPBCommandButtonItem setCommand:](v5, "setCommand:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewButtonItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v10;
      v25 = v6;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[_SFPBButtonItem initWithDictionary:]([_SFPBButtonItem alloc], "initWithDictionary:", v18);
              -[_SFPBCommandButtonItem addPreviewButtonItems:](v5, "addPreviewButtonItems:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v15);
      }

      v6 = v25;
      v10 = v24;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDestructive"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCommandButtonItem setIsDestructive:](v5, "setIsDestructive:", objc_msgSend(v20, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBCommandButtonItem setUniqueId:](v5, "setUniqueId:", objc_msgSend(v21, "unsignedLongLongValue"));
    v22 = v5;

  }
  return v5;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBCommand)command
{
  return self->_command;
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
