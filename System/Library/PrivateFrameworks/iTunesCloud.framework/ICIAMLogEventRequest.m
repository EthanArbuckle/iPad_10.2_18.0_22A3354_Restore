@implementation ICIAMLogEventRequest

- (BOOL)hasApplicationMessageIdentifier
{
  return self->_applicationMessageIdentifier != 0;
}

- (void)setDSID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dSID = a3;
}

- (void)setHasDSID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDSID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (void)clearEventParameters
{
  -[NSMutableArray removeAllObjects](self->_eventParameters, "removeAllObjects");
}

- (void)addEventParameters:(id)a3
{
  id v4;
  NSMutableArray *eventParameters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  eventParameters = self->_eventParameters;
  v8 = v4;
  if (!eventParameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_eventParameters;
    self->_eventParameters = v6;

    v4 = v8;
    eventParameters = self->_eventParameters;
  }
  -[NSMutableArray addObject:](eventParameters, "addObject:", v4);

}

- (unint64_t)eventParametersCount
{
  return -[NSMutableArray count](self->_eventParameters, "count");
}

- (id)eventParametersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_eventParameters, "objectAtIndex:", a3);
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
  v8.super_class = (Class)ICIAMLogEventRequest;
  -[ICIAMLogEventRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMLogEventRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *applicationMessageIdentifier;
  void *v6;
  NSString *deviceID;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  applicationMessageIdentifier = self->_applicationMessageIdentifier;
  if (applicationMessageIdentifier)
    objc_msgSend(v3, "setObject:forKey:", applicationMessageIdentifier, CFSTR("applicationMessageIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dSID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("DSID"));

  }
  deviceID = self->_deviceID;
  if (deviceID)
    objc_msgSend(v4, "setObject:forKey:", deviceID, CFSTR("deviceID"));
  if (-[NSMutableArray count](self->_eventParameters, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_eventParameters, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_eventParameters;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("eventParameters"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMLogEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  if (self->_applicationMessageIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_deviceID)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_eventParameters;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_applicationMessageIdentifier)
  {
    objc_msgSend(v4, "setApplicationMessageIdentifier:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_dSID;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_deviceID)
    objc_msgSend(v9, "setDeviceID:");
  if (-[ICIAMLogEventRequest eventParametersCount](self, "eventParametersCount"))
  {
    objc_msgSend(v9, "clearEventParameters");
    v5 = -[ICIAMLogEventRequest eventParametersCount](self, "eventParametersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ICIAMLogEventRequest eventParametersAtIndex:](self, "eventParametersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addEventParameters:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_applicationMessageIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_dSID;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_deviceID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_eventParameters;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addEventParameters:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *applicationMessageIdentifier;
  NSString *deviceID;
  NSMutableArray *eventParameters;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  applicationMessageIdentifier = self->_applicationMessageIdentifier;
  if ((unint64_t)applicationMessageIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](applicationMessageIdentifier, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_dSID != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](deviceID, "isEqual:"))
    goto LABEL_13;
  eventParameters = self->_eventParameters;
  if ((unint64_t)eventParameters | *((_QWORD *)v4 + 4))
    v8 = -[NSMutableArray isEqual:](eventParameters, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_applicationMessageIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_dSID;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_deviceID, "hash");
  return v5 ^ v6 ^ -[NSMutableArray hash](self->_eventParameters, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[ICIAMLogEventRequest setApplicationMessageIdentifier:](self, "setApplicationMessageIdentifier:");
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_dSID = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[ICIAMLogEventRequest setDeviceID:](self, "setDeviceID:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ICIAMLogEventRequest addEventParameters:](self, "addEventParameters:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)applicationMessageIdentifier
{
  return self->_applicationMessageIdentifier;
}

- (void)setApplicationMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationMessageIdentifier, a3);
}

- (int64_t)dSID
{
  return self->_dSID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSMutableArray)eventParameters
{
  return self->_eventParameters;
}

- (void)setEventParameters:(id)a3
{
  objc_storeStrong((id *)&self->_eventParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventParameters, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_applicationMessageIdentifier, 0);
}

+ (Class)eventParametersType
{
  return (Class)objc_opt_class();
}

@end
