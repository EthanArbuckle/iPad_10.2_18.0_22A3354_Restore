@implementation ICIAMMessageContent

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (void)clearImages
{
  -[NSMutableArray removeAllObjects](self->_images, "removeAllObjects");
}

- (void)addImages:(id)a3
{
  id v4;
  NSMutableArray *images;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  images = self->_images;
  v8 = v4;
  if (!images)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_images;
    self->_images = v6;

    v4 = v8;
    images = self->_images;
  }
  -[NSMutableArray addObject:](images, "addObject:", v4);

}

- (unint64_t)imagesCount
{
  return -[NSMutableArray count](self->_images, "count");
}

- (id)imagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_images, "objectAtIndex:", a3);
}

- (void)clearMessageActions
{
  -[NSMutableArray removeAllObjects](self->_messageActions, "removeAllObjects");
}

- (void)addMessageActions:(id)a3
{
  id v4;
  NSMutableArray *messageActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageActions = self->_messageActions;
  v8 = v4;
  if (!messageActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_messageActions;
    self->_messageActions = v6;

    v4 = v8;
    messageActions = self->_messageActions;
  }
  -[NSMutableArray addObject:](messageActions, "addObject:", v4);

}

- (unint64_t)messageActionsCount
{
  return -[NSMutableArray count](self->_messageActions, "count");
}

- (id)messageActionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageActions, "objectAtIndex:", a3);
}

- (void)clearContentParameters
{
  -[NSMutableArray removeAllObjects](self->_contentParameters, "removeAllObjects");
}

- (void)addContentParameters:(id)a3
{
  id v4;
  NSMutableArray *contentParameters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contentParameters = self->_contentParameters;
  v8 = v4;
  if (!contentParameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contentParameters;
    self->_contentParameters = v6;

    v4 = v8;
    contentParameters = self->_contentParameters;
  }
  -[NSMutableArray addObject:](contentParameters, "addObject:", v4);

}

- (unint64_t)contentParametersCount
{
  return -[NSMutableArray count](self->_contentParameters, "count");
}

- (id)contentParametersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentParameters, "objectAtIndex:", a3);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPageEvent
{
  return self->_pageEvent != 0;
}

- (BOOL)hasCloseClickEvent
{
  return self->_closeClickEvent != 0;
}

- (BOOL)hasCardClickEvent
{
  return self->_cardClickEvent != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMessageContent;
  -[ICIAMMessageContent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMessageContent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *subtitle;
  NSString *body;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  NSString *identifier;
  ICIAMMetricEvent *pageEvent;
  void *v31;
  ICIAMMetricEvent *closeClickEvent;
  void *v33;
  ICIAMMetricEvent *cardClickEvent;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  body = self->_body;
  if (body)
    objc_msgSend(v4, "setObject:forKey:", body, CFSTR("body"));
  if (-[NSMutableArray count](self->_images, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_images, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v9 = self->_images;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("images"));
  }
  if (-[NSMutableArray count](self->_messageActions, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_messageActions, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = self->_messageActions;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("messageActions"));
  }
  if (-[NSMutableArray count](self->_contentParameters, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contentParameters, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v23 = self->_contentParameters;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v37);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("contentParameters"));
  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  pageEvent = self->_pageEvent;
  if (pageEvent)
  {
    -[ICIAMMetricEvent dictionaryRepresentation](pageEvent, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("pageEvent"));

  }
  closeClickEvent = self->_closeClickEvent;
  if (closeClickEvent)
  {
    -[ICIAMMetricEvent dictionaryRepresentation](closeClickEvent, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("closeClickEvent"));

  }
  cardClickEvent = self->_cardClickEvent;
  if (cardClickEvent)
  {
    -[ICIAMMetricEvent dictionaryRepresentation](cardClickEvent, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("cardClickEvent"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessageContentReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_body)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_images;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_messageActions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_contentParameters;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_pageEvent)
    PBDataWriterWriteSubmessage();
  if (self->_closeClickEvent)
    PBDataWriterWriteSubmessage();
  if (self->_cardClickEvent)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (self->_title)
    objc_msgSend(v17, "setTitle:");
  if (self->_subtitle)
    objc_msgSend(v17, "setSubtitle:");
  if (self->_body)
    objc_msgSend(v17, "setBody:");
  if (-[ICIAMMessageContent imagesCount](self, "imagesCount"))
  {
    objc_msgSend(v17, "clearImages");
    v4 = -[ICIAMMessageContent imagesCount](self, "imagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ICIAMMessageContent imagesAtIndex:](self, "imagesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addImages:", v7);

      }
    }
  }
  if (-[ICIAMMessageContent messageActionsCount](self, "messageActionsCount"))
  {
    objc_msgSend(v17, "clearMessageActions");
    v8 = -[ICIAMMessageContent messageActionsCount](self, "messageActionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ICIAMMessageContent messageActionsAtIndex:](self, "messageActionsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addMessageActions:", v11);

      }
    }
  }
  if (-[ICIAMMessageContent contentParametersCount](self, "contentParametersCount"))
  {
    objc_msgSend(v17, "clearContentParameters");
    v12 = -[ICIAMMessageContent contentParametersCount](self, "contentParametersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[ICIAMMessageContent contentParametersAtIndex:](self, "contentParametersAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addContentParameters:", v15);

      }
    }
  }
  if (self->_identifier)
    objc_msgSend(v17, "setIdentifier:");
  v16 = v17;
  if (self->_pageEvent)
  {
    objc_msgSend(v17, "setPageEvent:");
    v16 = v17;
  }
  if (self->_closeClickEvent)
  {
    objc_msgSend(v17, "setCloseClickEvent:");
    v16 = v17;
  }
  if (self->_cardClickEvent)
  {
    objc_msgSend(v17, "setCardClickEvent:");
    v16 = v17;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = (void *)v5[10];
  v5[10] = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = (void *)v5[9];
  v5[9] = v8;

  v10 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v12 = self->_images;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v48;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addImages:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v14);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = self->_messageActions;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v44;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addMessageActions:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v20);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = self->_contentParameters;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend(v5, "addContentParameters:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v26);
  }

  v30 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v31 = (void *)v5[5];
  v5[5] = v30;

  v32 = -[ICIAMMetricEvent copyWithZone:](self->_pageEvent, "copyWithZone:", a3);
  v33 = (void *)v5[8];
  v5[8] = v32;

  v34 = -[ICIAMMetricEvent copyWithZone:](self->_closeClickEvent, "copyWithZone:", a3);
  v35 = (void *)v5[3];
  v5[3] = v34;

  v36 = -[ICIAMMetricEvent copyWithZone:](self->_cardClickEvent, "copyWithZone:", a3);
  v37 = (void *)v5[2];
  v5[2] = v36;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *subtitle;
  NSString *body;
  NSMutableArray *images;
  NSMutableArray *messageActions;
  NSMutableArray *contentParameters;
  NSString *identifier;
  ICIAMMetricEvent *pageEvent;
  ICIAMMetricEvent *closeClickEvent;
  ICIAMMetricEvent *cardClickEvent;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  title = self->_title;
  if ((unint64_t)title | v4[10])
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_22;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | v4[9] && !-[NSString isEqual:](subtitle, "isEqual:"))
    goto LABEL_22;
  if (((body = self->_body, !((unint64_t)body | v4[1])) || -[NSString isEqual:](body, "isEqual:"))
    && ((images = self->_images, !((unint64_t)images | v4[6]))
     || -[NSMutableArray isEqual:](images, "isEqual:"))
    && ((messageActions = self->_messageActions, !((unint64_t)messageActions | v4[7]))
     || -[NSMutableArray isEqual:](messageActions, "isEqual:"))
    && ((contentParameters = self->_contentParameters, !((unint64_t)contentParameters | v4[4]))
     || -[NSMutableArray isEqual:](contentParameters, "isEqual:"))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[5]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((pageEvent = self->_pageEvent, !((unint64_t)pageEvent | v4[8]))
     || -[ICIAMMetricEvent isEqual:](pageEvent, "isEqual:"))
    && ((closeClickEvent = self->_closeClickEvent, !((unint64_t)closeClickEvent | v4[3]))
     || -[ICIAMMetricEvent isEqual:](closeClickEvent, "isEqual:")))
  {
    cardClickEvent = self->_cardClickEvent;
    if ((unint64_t)cardClickEvent | v4[2])
      v15 = -[ICIAMMetricEvent isEqual:](cardClickEvent, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_subtitle, "hash") ^ v3;
  v5 = -[NSString hash](self->_body, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_images, "hash");
  v7 = -[NSMutableArray hash](self->_messageActions, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_contentParameters, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_identifier, "hash");
  v10 = -[ICIAMMetricEvent hash](self->_pageEvent, "hash");
  v11 = v10 ^ -[ICIAMMetricEvent hash](self->_closeClickEvent, "hash");
  return v9 ^ v11 ^ -[ICIAMMetricEvent hash](self->_cardClickEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  ICIAMMetricEvent *pageEvent;
  uint64_t v21;
  ICIAMMetricEvent *closeClickEvent;
  uint64_t v23;
  ICIAMMetricEvent *cardClickEvent;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[ICIAMMessageContent setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 9))
    -[ICIAMMessageContent setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)v4 + 1))
    -[ICIAMMessageContent setBody:](self, "setBody:");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        -[ICIAMMessageContent addImages:](self, "addImages:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v7);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = *((id *)v4 + 7);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        -[ICIAMMessageContent addMessageActions:](self, "addMessageActions:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v12);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = *((id *)v4 + 4);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        -[ICIAMMessageContent addContentParameters:](self, "addContentParameters:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k), (_QWORD)v26);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v4 + 5))
    -[ICIAMMessageContent setIdentifier:](self, "setIdentifier:");
  pageEvent = self->_pageEvent;
  v21 = *((_QWORD *)v4 + 8);
  if (pageEvent)
  {
    if (v21)
      -[ICIAMMetricEvent mergeFrom:](pageEvent, "mergeFrom:");
  }
  else if (v21)
  {
    -[ICIAMMessageContent setPageEvent:](self, "setPageEvent:");
  }
  closeClickEvent = self->_closeClickEvent;
  v23 = *((_QWORD *)v4 + 3);
  if (closeClickEvent)
  {
    if (v23)
      -[ICIAMMetricEvent mergeFrom:](closeClickEvent, "mergeFrom:");
  }
  else if (v23)
  {
    -[ICIAMMessageContent setCloseClickEvent:](self, "setCloseClickEvent:");
  }
  cardClickEvent = self->_cardClickEvent;
  v25 = *((_QWORD *)v4 + 2);
  if (cardClickEvent)
  {
    if (v25)
      -[ICIAMMetricEvent mergeFrom:](cardClickEvent, "mergeFrom:");
  }
  else if (v25)
  {
    -[ICIAMMessageContent setCardClickEvent:](self, "setCardClickEvent:");
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSMutableArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (NSMutableArray)messageActions
{
  return self->_messageActions;
}

- (void)setMessageActions:(id)a3
{
  objc_storeStrong((id *)&self->_messageActions, a3);
}

- (NSMutableArray)contentParameters
{
  return self->_contentParameters;
}

- (void)setContentParameters:(id)a3
{
  objc_storeStrong((id *)&self->_contentParameters, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (ICIAMMetricEvent)pageEvent
{
  return self->_pageEvent;
}

- (void)setPageEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pageEvent, a3);
}

- (ICIAMMetricEvent)closeClickEvent
{
  return self->_closeClickEvent;
}

- (void)setCloseClickEvent:(id)a3
{
  objc_storeStrong((id *)&self->_closeClickEvent, a3);
}

- (ICIAMMetricEvent)cardClickEvent
{
  return self->_cardClickEvent;
}

- (void)setCardClickEvent:(id)a3
{
  objc_storeStrong((id *)&self->_cardClickEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_pageEvent, 0);
  objc_storeStrong((id *)&self->_messageActions, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentParameters, 0);
  objc_storeStrong((id *)&self->_closeClickEvent, 0);
  objc_storeStrong((id *)&self->_cardClickEvent, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

+ (Class)imagesType
{
  return (Class)objc_opt_class();
}

+ (Class)messageActionsType
{
  return (Class)objc_opt_class();
}

+ (Class)contentParametersType
{
  return (Class)objc_opt_class();
}

@end
