@implementation _SFPBSplitCardSection

- (_SFPBSplitCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBSplitCardSection *v5;
  void *v6;
  _SFPBRichText *v7;
  void *v8;
  _SFPBRichText *v9;
  void *v10;
  _SFPBRichText *v11;
  void *v12;
  _SFPBRichText *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  _SFPBRichText *v26;
  void *v27;
  _SFPBRichText *v28;
  void *v29;
  _SFPBRichText *v30;
  void *v31;
  _SFPBRichText *v32;
  _SFPBSplitCardSection *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBSplitCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "topTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBRichText alloc];
      objc_msgSend(v4, "topTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBRichText initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBSplitCardSection setTopTitle:](v5, "setTopTitle:", v9);

    }
    objc_msgSend(v4, "secondaryTopTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBRichText alloc];
      objc_msgSend(v4, "secondaryTopTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBRichText initWithFacade:](v11, "initWithFacade:", v12);
      -[_SFPBSplitCardSection setSecondaryTopTitle:](v5, "setSecondaryTopTitle:", v13);

    }
    objc_msgSend(v4, "listPrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "listPrefix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSplitCardSection setListPrefix:](v5, "setListPrefix:", v15);

    }
    objc_msgSend(v4, "listItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v4, "listItems", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          if (*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i))
            objc_msgSend(v17, "addObject:");
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v20);
    }

    -[_SFPBSplitCardSection setListItems:](v5, "setListItems:", v17);
    objc_msgSend(v4, "listMoreString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "listMoreString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBSplitCardSection setListMoreString:](v5, "setListMoreString:", v24);

    }
    objc_msgSend(v4, "bottomTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = [_SFPBRichText alloc];
      objc_msgSend(v4, "bottomTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[_SFPBRichText initWithFacade:](v26, "initWithFacade:", v27);
      -[_SFPBSplitCardSection setBottomTitle:](v5, "setBottomTitle:", v28);

    }
    objc_msgSend(v4, "body");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [_SFPBRichText alloc];
      objc_msgSend(v4, "body");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[_SFPBRichText initWithFacade:](v30, "initWithFacade:", v31);
      -[_SFPBSplitCardSection setBody:](v5, "setBody:", v32);

    }
    v33 = v5;

  }
  return v5;
}

- (void)setTopTitle:(id)a3
{
  objc_storeStrong((id *)&self->_topTitle, a3);
}

- (void)setSecondaryTopTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTopTitle, a3);
}

- (void)setListPrefix:(id)a3
{
  NSString *v4;
  NSString *listPrefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  listPrefix = self->_listPrefix;
  self->_listPrefix = v4;

}

- (void)setListItems:(id)a3
{
  NSArray *v4;
  NSArray *listItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  listItems = self->_listItems;
  self->_listItems = v4;

}

- (void)clearListItems
{
  -[NSArray removeAllObjects](self->_listItems, "removeAllObjects");
}

- (void)addListItems:(id)a3
{
  id v4;
  NSArray *listItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  listItems = self->_listItems;
  v8 = v4;
  if (!listItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_listItems;
    self->_listItems = v6;

    v4 = v8;
    listItems = self->_listItems;
  }
  -[NSArray addObject:](listItems, "addObject:", v4);

}

- (unint64_t)listItemsCount
{
  return -[NSArray count](self->_listItems, "count");
}

- (id)listItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_listItems, "objectAtIndexedSubscript:", a3);
}

- (void)setListMoreString:(id)a3
{
  NSString *v4;
  NSString *listMoreString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  listMoreString = self->_listMoreString;
  self->_listMoreString = v4;

}

- (void)setBottomTitle:(id)a3
{
  objc_storeStrong((id *)&self->_bottomTitle, a3);
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSplitCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBSplitCardSection topTitle](self, "topTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBSplitCardSection listPrefix](self, "listPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBSplitCardSection listItems](self, "listItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[_SFPBSplitCardSection listMoreString](self, "listMoreString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteStringField();

  -[_SFPBSplitCardSection bottomTitle](self, "bottomTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBSplitCardSection body](self, "body");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

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
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  BOOL v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[_SFPBSplitCardSection topTitle](self, "topTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBSplitCardSection topTitle](self, "topTitle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBSplitCardSection topTitle](self, "topTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryTopTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryTopTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBSplitCardSection listPrefix](self, "listPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBSplitCardSection listPrefix](self, "listPrefix");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBSplitCardSection listPrefix](self, "listPrefix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listPrefix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBSplitCardSection listItems](self, "listItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBSplitCardSection listItems](self, "listItems");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBSplitCardSection listItems](self, "listItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBSplitCardSection listMoreString](self, "listMoreString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listMoreString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBSplitCardSection listMoreString](self, "listMoreString");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBSplitCardSection listMoreString](self, "listMoreString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listMoreString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBSplitCardSection bottomTitle](self, "bottomTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBSplitCardSection bottomTitle](self, "bottomTitle");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBSplitCardSection bottomTitle](self, "bottomTitle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBSplitCardSection body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBSplitCardSection body](self, "body");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[_SFPBSplitCardSection body](self, "body");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "body");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if ((v41 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;

  v3 = -[_SFPBRichText hash](self->_topTitle, "hash");
  v4 = -[_SFPBRichText hash](self->_secondaryTopTitle, "hash") ^ v3;
  v5 = -[NSString hash](self->_listPrefix, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_listItems, "hash");
  v7 = -[NSString hash](self->_listMoreString, "hash");
  v8 = v7 ^ -[_SFPBRichText hash](self->_bottomTitle, "hash");
  return v6 ^ v8 ^ -[_SFPBRichText hash](self->_body, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_body)
  {
    -[_SFPBSplitCardSection body](self, "body");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("body"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("body"));

    }
  }
  if (self->_bottomTitle)
  {
    -[_SFPBSplitCardSection bottomTitle](self, "bottomTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("bottomTitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bottomTitle"));

    }
  }
  if (self->_listItems)
  {
    -[_SFPBSplitCardSection listItems](self, "listItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("listItems"));

  }
  if (self->_listMoreString)
  {
    -[_SFPBSplitCardSection listMoreString](self, "listMoreString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("listMoreString"));

  }
  if (self->_listPrefix)
  {
    -[_SFPBSplitCardSection listPrefix](self, "listPrefix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("listPrefix"));

  }
  if (self->_secondaryTopTitle)
  {
    -[_SFPBSplitCardSection secondaryTopTitle](self, "secondaryTopTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("secondaryTopTitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("secondaryTopTitle"));

    }
  }
  if (self->_topTitle)
  {
    -[_SFPBSplitCardSection topTitle](self, "topTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("topTitle"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("topTitle"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBSplitCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBSplitCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBSplitCardSection *v5;
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
    self = -[_SFPBSplitCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBSplitCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBSplitCardSection *v5;
  void *v6;
  _SFPBRichText *v7;
  void *v8;
  _SFPBRichText *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _SFPBRichText *v23;
  void *v24;
  _SFPBRichText *v25;
  _SFPBSplitCardSection *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SFPBSplitCardSection;
  v5 = -[_SFPBSplitCardSection init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("topTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v6);
      -[_SFPBSplitCardSection setTopTitle:](v5, "setTopTitle:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryTopTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v8);
      -[_SFPBSplitCardSection setSecondaryTopTitle:](v5, "setSecondaryTopTitle:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listPrefix"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBSplitCardSection setListPrefix:](v5, "setListPrefix:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v8;
      v29 = v6;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = (void *)objc_msgSend(v18, "copy");
              -[_SFPBSplitCardSection addListItems:](v5, "addListItems:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v15);
      }

      v8 = v28;
      v6 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listMoreString"), v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[_SFPBSplitCardSection setListMoreString:](v5, "setListMoreString:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bottomTitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v22);
      -[_SFPBSplitCardSection setBottomTitle:](v5, "setBottomTitle:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("body"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[_SFPBRichText initWithDictionary:]([_SFPBRichText alloc], "initWithDictionary:", v24);
      -[_SFPBSplitCardSection setBody:](v5, "setBody:", v25);

    }
    v26 = v5;

  }
  return v5;
}

- (_SFPBRichText)topTitle
{
  return self->_topTitle;
}

- (_SFPBRichText)secondaryTopTitle
{
  return self->_secondaryTopTitle;
}

- (NSString)listPrefix
{
  return self->_listPrefix;
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (NSString)listMoreString
{
  return self->_listMoreString;
}

- (_SFPBRichText)bottomTitle
{
  return self->_bottomTitle;
}

- (_SFPBRichText)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bottomTitle, 0);
  objc_storeStrong((id *)&self->_listMoreString, 0);
  objc_storeStrong((id *)&self->_listItems, 0);
  objc_storeStrong((id *)&self->_listPrefix, 0);
  objc_storeStrong((id *)&self->_secondaryTopTitle, 0);
  objc_storeStrong((id *)&self->_topTitle, 0);
}

@end
