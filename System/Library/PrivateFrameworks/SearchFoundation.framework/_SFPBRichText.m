@implementation _SFPBRichText

- (_SFPBRichText)initWithFacade:(id)a3
{
  id v4;
  _SFPBRichText *v5;
  _SFPBText *v6;
  _SFPBGraphicalFloat *v7;
  _SFPBGraphicalFloat *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _SFPBImage *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  _SFPBFormattedText *v26;
  _SFPBRichText *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRichText init](self, "init");
  if (v5)
  {
    v6 = -[_SFPBText initWithFacade:]([_SFPBText alloc], "initWithFacade:", v4);
    -[_SFPBRichText setText:](v5, "setText:", v6);

    if (objc_msgSend(v4, "hasStarRating"))
    {
      v7 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "starRating");
      v8 = -[_SFPBGraphicalFloat initWithCGFloat:](v7, "initWithCGFloat:");
      -[_SFPBRichText setStarRating:](v5, "setStarRating:", v8);

    }
    objc_msgSend(v4, "contentAdvisory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "contentAdvisory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBRichText setContentAdvisory:](v5, "setContentAdvisory:", v10);

    }
    objc_msgSend(v4, "icons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v12 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "icons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

    -[_SFPBRichText setIcons:](v5, "setIcons:", v12);
    objc_msgSend(v4, "formattedTextPieces");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v20 = 0;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v4, "formattedTextPieces", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = -[_SFPBFormattedText initWithFacade:]([_SFPBFormattedText alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
          if (v26)
            objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }

    -[_SFPBRichText setFormattedTextPieces:](v5, "setFormattedTextPieces:", v20);
    v27 = v5;

  }
  return v5;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void)setStarRating:(id)a3
{
  objc_storeStrong((id *)&self->_starRating, a3);
}

- (void)setContentAdvisory:(id)a3
{
  NSString *v4;
  NSString *contentAdvisory;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentAdvisory = self->_contentAdvisory;
  self->_contentAdvisory = v4;

}

- (void)setIcons:(id)a3
{
  NSArray *v4;
  NSArray *icons;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  icons = self->_icons;
  self->_icons = v4;

}

- (void)clearIcons
{
  -[NSArray removeAllObjects](self->_icons, "removeAllObjects");
}

- (void)addIcons:(id)a3
{
  id v4;
  NSArray *icons;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  icons = self->_icons;
  v8 = v4;
  if (!icons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_icons;
    self->_icons = v6;

    v4 = v8;
    icons = self->_icons;
  }
  -[NSArray addObject:](icons, "addObject:", v4);

}

- (unint64_t)iconsCount
{
  return -[NSArray count](self->_icons, "count");
}

- (id)iconsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_icons, "objectAtIndexedSubscript:", a3);
}

- (void)setFormattedTextPieces:(id)a3
{
  NSArray *v4;
  NSArray *formattedTextPieces;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  formattedTextPieces = self->_formattedTextPieces;
  self->_formattedTextPieces = v4;

}

- (void)clearFormattedTextPieces
{
  -[NSArray removeAllObjects](self->_formattedTextPieces, "removeAllObjects");
}

- (void)addFormattedTextPieces:(id)a3
{
  id v4;
  NSArray *formattedTextPieces;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  formattedTextPieces = self->_formattedTextPieces;
  v8 = v4;
  if (!formattedTextPieces)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_formattedTextPieces;
    self->_formattedTextPieces = v6;

    v4 = v8;
    formattedTextPieces = self->_formattedTextPieces;
  }
  -[NSArray addObject:](formattedTextPieces, "addObject:", v4);

}

- (unint64_t)formattedTextPiecesCount
{
  return -[NSArray count](self->_formattedTextPieces, "count");
}

- (id)formattedTextPiecesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_formattedTextPieces, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRichTextReadFrom(self, (uint64_t)a3);
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRichText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRichText starRating](self, "starRating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRichText contentAdvisory](self, "contentAdvisory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBRichText icons](self, "icons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  -[_SFPBRichText formattedTextPieces](self, "formattedTextPieces");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_SFPBRichText text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRichText text](self, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRichText text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRichText starRating](self, "starRating");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "starRating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRichText starRating](self, "starRating");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRichText starRating](self, "starRating");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "starRating");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRichText contentAdvisory](self, "contentAdvisory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAdvisory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRichText contentAdvisory](self, "contentAdvisory");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRichText contentAdvisory](self, "contentAdvisory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentAdvisory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRichText icons](self, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_SFPBRichText icons](self, "icons");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRichText icons](self, "icons");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icons");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_SFPBRichText formattedTextPieces](self, "formattedTextPieces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedTextPieces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRichText formattedTextPieces](self, "formattedTextPieces");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_SFPBRichText formattedTextPieces](self, "formattedTextPieces");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formattedTextPieces");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[_SFPBText hash](self->_text, "hash");
  v4 = -[_SFPBGraphicalFloat hash](self->_starRating, "hash") ^ v3;
  v5 = -[NSString hash](self->_contentAdvisory, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_icons, "hash");
  return v6 ^ -[NSArray hash](self->_formattedTextPieces, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contentAdvisory)
  {
    -[_SFPBRichText contentAdvisory](self, "contentAdvisory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contentAdvisory"));

  }
  if (-[NSArray count](self->_formattedTextPieces, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = self->_formattedTextPieces;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("formattedTextPieces"));
  }
  if (-[NSArray count](self->_icons, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = self->_icons;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v29);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v14, "addObject:", v20);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

          }
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("icons"));
  }
  if (self->_starRating)
  {
    -[_SFPBRichText starRating](self, "starRating");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("starRating"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("starRating"));

    }
  }
  if (self->_text)
  {
    -[_SFPBRichText text](self, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("text"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("text"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRichText dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRichText)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRichText *v5;
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
    self = -[_SFPBRichText initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRichText)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRichText *v5;
  void *v6;
  _SFPBText *v7;
  uint64_t v8;
  _SFPBGraphicalFloat *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _SFPBImage *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _SFPBFormattedText *v28;
  _SFPBRichText *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRichText;
  v5 = -[_SFPBRichText init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBText initWithDictionary:]([_SFPBText alloc], "initWithDictionary:", v6);
      -[_SFPBRichText setText:](v5, "setText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("starRating"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v8);
      -[_SFPBRichText setStarRating:](v5, "setStarRating:", v9);

    }
    v34 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentAdvisory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBRichText setContentAdvisory:](v5, "setContentAdvisory:", v12);

      v6 = v11;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icons"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v32 = v13;
    v33 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v40;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v19);
              -[_SFPBRichText addIcons:](v5, "addIcons:", v20);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v16);
      }

      v13 = v32;
      v10 = v33;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formattedTextPieces"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v6;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v36;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = -[_SFPBFormattedText initWithDictionary:]([_SFPBFormattedText alloc], "initWithDictionary:", v27);
              -[_SFPBRichText addFormattedTextPieces:](v5, "addFormattedTextPieces:", v28);

            }
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v24);
      }

      v6 = v31;
      v13 = v32;
      v10 = v33;
    }
    v29 = v5;

  }
  return v5;
}

- (_SFPBText)text
{
  return self->_text;
}

- (_SFPBGraphicalFloat)starRating
{
  return self->_starRating;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (NSArray)icons
{
  return self->_icons;
}

- (NSArray)formattedTextPieces
{
  return self->_formattedTextPieces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedTextPieces, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
