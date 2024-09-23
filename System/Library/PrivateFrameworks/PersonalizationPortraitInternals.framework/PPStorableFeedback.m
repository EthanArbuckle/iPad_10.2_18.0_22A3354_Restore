@implementation PPStorableFeedback

- (void)setSecondsFrom1970:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secondsFrom1970 = a3;
}

- (void)setHasSecondsFrom1970:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsFrom1970
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStoreType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_storeType = a3;
}

- (void)setHasStoreType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStoreType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientBundleIdentifier
{
  return self->_clientBundleIdentifier != 0;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (void)setIsMapped:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isMapped = a3;
}

- (void)setHasIsMapped:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsMapped
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)clearFeedbackItems
{
  -[NSMutableArray removeAllObjects](self->_feedbackItems, "removeAllObjects");
}

- (void)addFeedbackItems:(id)a3
{
  id v4;
  NSMutableArray *feedbackItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  feedbackItems = self->_feedbackItems;
  v8 = v4;
  if (!feedbackItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_feedbackItems;
    self->_feedbackItems = v6;

    v4 = v8;
    feedbackItems = self->_feedbackItems;
  }
  -[NSMutableArray addObject:](feedbackItems, "addObject:", v4);

}

- (unint64_t)feedbackItemsCount
{
  return -[NSMutableArray count](self->_feedbackItems, "count");
}

- (id)feedbackItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_feedbackItems, "objectAtIndex:", a3);
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
  v8.super_class = (Class)PPStorableFeedback;
  -[PPStorableFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPStorableFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *clientBundleIdentifier;
  NSString *clientIdentifier;
  NSString *mappingId;
  void *v10;
  NSString *build;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsFrom1970);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("secondsFrom1970"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_storeType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("storeType"));

  }
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if (clientBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientBundleIdentifier, CFSTR("clientBundleIdentifier"));
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  mappingId = self->_mappingId;
  if (mappingId)
    objc_msgSend(v3, "setObject:forKey:", mappingId, CFSTR("mappingId"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMapped);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isMapped"));

  }
  build = self->_build;
  if (build)
    objc_msgSend(v3, "setObject:forKey:", build, CFSTR("build"));
  if (-[NSMutableArray count](self->_feedbackItems, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_feedbackItems, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_feedbackItems;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("feedbackItems"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPStorableFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_clientBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_clientIdentifier)
    PBDataWriterWriteStringField();
  if (self->_mappingId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_build)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_feedbackItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_secondsFrom1970;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_storeType;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  v10 = v4;
  if (self->_clientBundleIdentifier)
  {
    objc_msgSend(v4, "setClientBundleIdentifier:");
    v4 = v10;
  }
  if (self->_clientIdentifier)
  {
    objc_msgSend(v10, "setClientIdentifier:");
    v4 = v10;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v10, "setMappingId:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 60) = self->_isMapped;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  if (self->_build)
    objc_msgSend(v10, "setBuild:");
  if (-[PPStorableFeedback feedbackItemsCount](self, "feedbackItemsCount"))
  {
    objc_msgSend(v10, "clearFeedbackItems");
    v6 = -[PPStorableFeedback feedbackItemsCount](self, "feedbackItemsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[PPStorableFeedback feedbackItemsAtIndex:](self, "feedbackItemsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addFeedbackItems:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_secondsFrom1970;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_storeType;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_clientBundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_mappingId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 60) = self->_isMapped;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_feedbackItems;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v6, "addFeedbackItems:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientBundleIdentifier;
  NSString *clientIdentifier;
  NSString *mappingId;
  NSString *build;
  NSMutableArray *feedbackItems;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_secondsFrom1970 != *((double *)v4 + 1))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_storeType != *((_DWORD *)v4 + 14))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if ((unint64_t)clientBundleIdentifier | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](clientBundleIdentifier, "isEqual:"))
  {
    goto LABEL_30;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) != 0)
    {
      if (self->_isMapped)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_30;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_26;
    }
LABEL_30:
    v10 = 0;
    goto LABEL_31;
  }
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
    goto LABEL_30;
LABEL_26:
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](build, "isEqual:"))
    goto LABEL_30;
  feedbackItems = self->_feedbackItems;
  if ((unint64_t)feedbackItems | *((_QWORD *)v4 + 5))
    v10 = -[NSMutableArray isEqual:](feedbackItems, "isEqual:");
  else
    v10 = 1;
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double secondsFrom1970;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t v14;
  NSUInteger v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    secondsFrom1970 = self->_secondsFrom1970;
    v6 = -secondsFrom1970;
    if (secondsFrom1970 >= 0.0)
      v6 = self->_secondsFrom1970;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_storeType;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_clientBundleIdentifier, "hash");
  v11 = -[NSString hash](self->_clientIdentifier, "hash");
  v12 = -[NSString hash](self->_mappingId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v13 = 2654435761 * self->_isMapped;
  else
    v13 = 0;
  v14 = v9 ^ v4 ^ v10 ^ v11 ^ v12;
  v15 = v13 ^ -[NSString hash](self->_build, "hash");
  return v14 ^ v15 ^ -[NSMutableArray hash](self->_feedbackItems, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 1) != 0)
  {
    self->_secondsFrom1970 = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 64);
  }
  if ((v6 & 2) != 0)
  {
    self->_storeType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
    -[PPStorableFeedback setClientBundleIdentifier:](self, "setClientBundleIdentifier:");
  if (*((_QWORD *)v5 + 4))
    -[PPStorableFeedback setClientIdentifier:](self, "setClientIdentifier:");
  if (*((_QWORD *)v5 + 6))
    -[PPStorableFeedback setMappingId:](self, "setMappingId:");
  if ((*((_BYTE *)v5 + 64) & 4) != 0)
  {
    self->_isMapped = *((_BYTE *)v5 + 60);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 2))
    -[PPStorableFeedback setBuild:](self, "setBuild:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[PPStorableFeedback addFeedbackItems:](self, "addFeedbackItems:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (double)secondsFrom1970
{
  return self->_secondsFrom1970;
}

- (unsigned)storeType
{
  return self->_storeType;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(id)a3
{
  objc_storeStrong((id *)&self->_mappingId, a3);
}

- (BOOL)isMapped
{
  return self->_isMapped;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSMutableArray)feedbackItems
{
  return self->_feedbackItems;
}

- (void)setFeedbackItems:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_feedbackItems, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

+ (Class)feedbackItemsType
{
  return (Class)objc_opt_class();
}

@end
