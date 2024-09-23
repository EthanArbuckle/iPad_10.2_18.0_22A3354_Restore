@implementation ICIAMMetricEvent

- (BOOL)hasPageId
{
  return self->_pageId != 0;
}

- (int)pageType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_pageType;
  else
    return 0;
}

- (void)setPageType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pageType = a3;
}

- (void)setHasPageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPageType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)pageTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 5 && ((0x17u >> a3) & 1) != 0)
  {
    v3 = off_1E438C440[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Modal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Native")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Notification")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearPageDetails
{
  -[NSMutableArray removeAllObjects](self->_pageDetails, "removeAllObjects");
}

- (void)addPageDetails:(id)a3
{
  id v4;
  NSMutableArray *pageDetails;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pageDetails = self->_pageDetails;
  v8 = v4;
  if (!pageDetails)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pageDetails;
    self->_pageDetails = v6;

    v4 = v8;
    pageDetails = self->_pageDetails;
  }
  -[NSMutableArray addObject:](pageDetails, "addObject:", v4);

}

- (unint64_t)pageDetailsCount
{
  return -[NSMutableArray count](self->_pageDetails, "count");
}

- (id)pageDetailsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pageDetails, "objectAtIndex:", a3);
}

- (BOOL)hasTargetId
{
  return self->_targetId != 0;
}

- (int)targetType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_targetType;
  else
    return 0;
}

- (void)setTargetType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_targetType = a3;
}

- (void)setHasTargetType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTargetType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)targetTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E438C468[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTargetType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Card")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Button")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Slider")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Close")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)actionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E438C490[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Navigate")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Swipe")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Select")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (void)clearActionDetails
{
  -[NSMutableArray removeAllObjects](self->_actionDetails, "removeAllObjects");
}

- (void)addActionDetails:(id)a3
{
  id v4;
  NSMutableArray *actionDetails;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actionDetails = self->_actionDetails;
  v8 = v4;
  if (!actionDetails)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_actionDetails;
    self->_actionDetails = v6;

    v4 = v8;
    actionDetails = self->_actionDetails;
  }
  -[NSMutableArray addObject:](actionDetails, "addObject:", v4);

}

- (unint64_t)actionDetailsCount
{
  return -[NSMutableArray count](self->_actionDetails, "count");
}

- (id)actionDetailsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actionDetails, "objectAtIndex:", a3);
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (BOOL)hasPageUrl
{
  return self->_pageUrl != 0;
}

- (BOOL)hasImpressionType
{
  return self->_impressionType != 0;
}

- (BOOL)hasImpression
{
  return self->_impression != 0;
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
  v8.super_class = (Class)ICIAMMetricEvent;
  -[ICIAMMetricEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMetricEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *pageId;
  uint64_t pageType;
  __CFString *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSString *targetId;
  char has;
  uint64_t targetType;
  __CFString *v18;
  uint64_t actionType;
  __CFString *v20;
  NSString *actionURL;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSString *eventType;
  NSString *pageUrl;
  NSString *impressionType;
  ICIAMImpressionNode *impression;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  pageId = self->_pageId;
  if (pageId)
    objc_msgSend(v3, "setObject:forKey:", pageId, CFSTR("pageId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    pageType = self->_pageType;
    if (pageType < 5 && ((0x17u >> pageType) & 1) != 0)
    {
      v7 = off_1E438C440[pageType];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_pageType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("pageType"));

  }
  if (-[NSMutableArray count](self->_pageDetails, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pageDetails, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = self->_pageDetails;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("pageDetails"));
  }
  targetId = self->_targetId;
  if (targetId)
    objc_msgSend(v4, "setObject:forKey:", targetId, CFSTR("targetId"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    targetType = self->_targetType;
    if (targetType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_targetType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E438C468[targetType];
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("targetType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    actionType = self->_actionType;
    if (actionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_actionType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E438C490[actionType];
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("actionType"));

  }
  actionURL = self->_actionURL;
  if (actionURL)
    objc_msgSend(v4, "setObject:forKey:", actionURL, CFSTR("actionURL"));
  if (-[NSMutableArray count](self->_actionDetails, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_actionDetails, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = self->_actionDetails;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("actionDetails"));
  }
  eventType = self->_eventType;
  if (eventType)
    objc_msgSend(v4, "setObject:forKey:", eventType, CFSTR("eventType"));
  pageUrl = self->_pageUrl;
  if (pageUrl)
    objc_msgSend(v4, "setObject:forKey:", pageUrl, CFSTR("pageUrl"));
  impressionType = self->_impressionType;
  if (impressionType)
    objc_msgSend(v4, "setObject:forKey:", impressionType, CFSTR("impressionType"));
  impression = self->_impression;
  if (impression)
  {
    -[ICIAMImpressionNode dictionaryRepresentation](impression, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("impression"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMetricEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_pageId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_pageDetails;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  if (self->_targetId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_actionURL)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_actionDetails;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (self->_eventType)
    PBDataWriterWriteStringField();
  if (self->_pageUrl)
    PBDataWriterWriteStringField();
  if (self->_impressionType)
    PBDataWriterWriteStringField();
  if (self->_impression)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_pageId)
  {
    objc_msgSend(v4, "setPageId:");
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_pageType;
    *((_BYTE *)v4 + 100) |= 2u;
  }
  if (-[ICIAMMetricEvent pageDetailsCount](self, "pageDetailsCount"))
  {
    objc_msgSend(v15, "clearPageDetails");
    v5 = -[ICIAMMetricEvent pageDetailsCount](self, "pageDetailsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ICIAMMetricEvent pageDetailsAtIndex:](self, "pageDetailsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addPageDetails:", v8);

      }
    }
  }
  if (self->_targetId)
    objc_msgSend(v15, "setTargetId:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v15 + 24) = self->_targetType;
    *((_BYTE *)v15 + 100) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v15 + 4) = self->_actionType;
    *((_BYTE *)v15 + 100) |= 1u;
  }
  if (self->_actionURL)
    objc_msgSend(v15, "setActionURL:");
  if (-[ICIAMMetricEvent actionDetailsCount](self, "actionDetailsCount"))
  {
    objc_msgSend(v15, "clearActionDetails");
    v10 = -[ICIAMMetricEvent actionDetailsCount](self, "actionDetailsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[ICIAMMetricEvent actionDetailsAtIndex:](self, "actionDetailsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addActionDetails:", v13);

      }
    }
  }
  if (self->_eventType)
    objc_msgSend(v15, "setEventType:");
  v14 = v15;
  if (self->_pageUrl)
  {
    objc_msgSend(v15, "setPageUrl:");
    v14 = v15;
  }
  if (self->_impressionType)
  {
    objc_msgSend(v15, "setImpressionType:");
    v14 = v15;
  }
  if (self->_impression)
  {
    objc_msgSend(v15, "setImpression:");
    v14 = v15;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  char has;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_pageId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_pageType;
    *(_BYTE *)(v5 + 100) |= 2u;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = self->_pageDetails;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPageDetails:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_targetId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v14;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_targetType;
    *(_BYTE *)(v5 + 100) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_actionType;
    *(_BYTE *)(v5 + 100) |= 1u;
  }
  v17 = -[NSString copyWithZone:](self->_actionURL, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = self->_actionDetails;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addActionDetails:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v21);
  }

  v25 = -[NSString copyWithZone:](self->_eventType, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v25;

  v27 = -[NSString copyWithZone:](self->_pageUrl, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v27;

  v29 = -[NSString copyWithZone:](self->_impressionType, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v29;

  v31 = -[ICIAMImpressionNode copyWithZone:](self->_impression, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v31;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *pageId;
  NSMutableArray *pageDetails;
  NSString *targetId;
  NSString *actionURL;
  NSMutableArray *actionDetails;
  NSString *eventType;
  NSString *pageUrl;
  NSString *impressionType;
  ICIAMImpressionNode *impression;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  pageId = self->_pageId;
  if ((unint64_t)pageId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](pageId, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_pageType != *((_DWORD *)v4 + 18))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
LABEL_35:
    v14 = 0;
    goto LABEL_36;
  }
  pageDetails = self->_pageDetails;
  if ((unint64_t)pageDetails | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](pageDetails, "isEqual:"))
  {
    goto LABEL_35;
  }
  targetId = self->_targetId;
  if ((unint64_t)targetId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](targetId, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_targetType != *((_DWORD *)v4 + 24))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_35;
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](actionURL, "isEqual:"))
    goto LABEL_35;
  actionDetails = self->_actionDetails;
  if ((unint64_t)actionDetails | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](actionDetails, "isEqual:"))
      goto LABEL_35;
  }
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](eventType, "isEqual:"))
      goto LABEL_35;
  }
  pageUrl = self->_pageUrl;
  if ((unint64_t)pageUrl | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](pageUrl, "isEqual:"))
      goto LABEL_35;
  }
  impressionType = self->_impressionType;
  if ((unint64_t)impressionType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](impressionType, "isEqual:"))
      goto LABEL_35;
  }
  impression = self->_impression;
  if ((unint64_t)impression | *((_QWORD *)v4 + 5))
    v14 = -[ICIAMImpressionNode isEqual:](impression, "isEqual:");
  else
    v14 = 1;
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;

  v3 = -[NSString hash](self->_pageId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_pageType;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_pageDetails, "hash");
  v6 = -[NSString hash](self->_targetId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = 2654435761 * self->_targetType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_actionType;
LABEL_9:
  v9 = v4 ^ v3 ^ v5 ^ v6;
  v10 = v7 ^ v8 ^ -[NSString hash](self->_actionURL, "hash");
  v11 = v9 ^ v10 ^ -[NSMutableArray hash](self->_actionDetails, "hash");
  v12 = -[NSString hash](self->_eventType, "hash");
  v13 = v12 ^ -[NSString hash](self->_pageUrl, "hash");
  v14 = v13 ^ -[NSString hash](self->_impressionType, "hash");
  return v11 ^ v14 ^ -[ICIAMImpressionNode hash](self->_impression, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  ICIAMImpressionNode *impression;
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
  if (*((_QWORD *)v4 + 8))
    -[ICIAMMetricEvent setPageId:](self, "setPageId:");
  if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    self->_pageType = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 2u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[ICIAMMetricEvent addPageDetails:](self, "addPageDetails:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 11))
    -[ICIAMMetricEvent setTargetId:](self, "setTargetId:");
  v10 = *((_BYTE *)v4 + 100);
  if ((v10 & 4) != 0)
  {
    self->_targetType = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)v4 + 100);
  }
  if ((v10 & 1) != 0)
  {
    self->_actionType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[ICIAMMetricEvent setActionURL:](self, "setActionURL:");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *((id *)v4 + 1);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[ICIAMMetricEvent addActionDetails:](self, "addActionDetails:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 4))
    -[ICIAMMetricEvent setEventType:](self, "setEventType:");
  if (*((_QWORD *)v4 + 10))
    -[ICIAMMetricEvent setPageUrl:](self, "setPageUrl:");
  if (*((_QWORD *)v4 + 6))
    -[ICIAMMetricEvent setImpressionType:](self, "setImpressionType:");
  impression = self->_impression;
  v17 = *((_QWORD *)v4 + 5);
  if (impression)
  {
    if (v17)
      -[ICIAMImpressionNode mergeFrom:](impression, "mergeFrom:");
  }
  else if (v17)
  {
    -[ICIAMMetricEvent setImpression:](self, "setImpression:");
  }

}

- (NSString)pageId
{
  return self->_pageId;
}

- (void)setPageId:(id)a3
{
  objc_storeStrong((id *)&self->_pageId, a3);
}

- (NSMutableArray)pageDetails
{
  return self->_pageDetails;
}

- (void)setPageDetails:(id)a3
{
  objc_storeStrong((id *)&self->_pageDetails, a3);
}

- (NSString)targetId
{
  return self->_targetId;
}

- (void)setTargetId:(id)a3
{
  objc_storeStrong((id *)&self->_targetId, a3);
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSMutableArray)actionDetails
{
  return self->_actionDetails;
}

- (void)setActionDetails:(id)a3
{
  objc_storeStrong((id *)&self->_actionDetails, a3);
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (NSString)pageUrl
{
  return self->_pageUrl;
}

- (void)setPageUrl:(id)a3
{
  objc_storeStrong((id *)&self->_pageUrl, a3);
}

- (NSString)impressionType
{
  return self->_impressionType;
}

- (void)setImpressionType:(id)a3
{
  objc_storeStrong((id *)&self->_impressionType, a3);
}

- (ICIAMImpressionNode)impression
{
  return self->_impression;
}

- (void)setImpression:(id)a3
{
  objc_storeStrong((id *)&self->_impression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetId, 0);
  objc_storeStrong((id *)&self->_pageUrl, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_pageDetails, 0);
  objc_storeStrong((id *)&self->_impressionType, 0);
  objc_storeStrong((id *)&self->_impression, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionDetails, 0);
}

+ (Class)pageDetailsType
{
  return (Class)objc_opt_class();
}

+ (Class)actionDetailsType
{
  return (Class)objc_opt_class();
}

@end
