@implementation APPBLogAdEventRequest

+ (id)options
{
  if (qword_1002698F0 != -1)
    dispatch_once(&qword_1002698F0, &stru_1002150C0);
  return (id)qword_1002698E8;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (void)clearEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvent:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventsCount
{
  return (unint64_t)-[NSMutableArray count](self->_events, "count");
}

- (id)eventAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", a3);
}

+ (Class)eventType
{
  return (Class)objc_opt_class(APPBAdEvent, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogAdEventRequest;
  v3 = -[APPBLogAdEventRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAdEventRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBLogMetaData *metaData;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](metaData, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metaData"));

  }
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_events;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v14));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("event"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAdEventRequestReadFrom((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  APPBLogMetaData *metaData;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  metaData = self->_metaData;
  if (metaData)
    PBDataWriterWriteSubmessage(v4, metaData, 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_events;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), 2);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_metaData)
    objc_msgSend(v8, "setMetaData:");
  if (-[APPBLogAdEventRequest eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v8, "clearEvents");
    v4 = -[APPBLogAdEventRequest eventsCount](self, "eventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAdEventRequest eventAtIndex:](self, "eventAtIndex:", i));
        objc_msgSend(v8, "addEvent:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBLogMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_events;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addEvent:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  APPBLogMetaData *metaData;
  NSMutableArray *events;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((metaData = self->_metaData, !((unint64_t)metaData | v4[2]))
     || -[APPBLogMetaData isEqual:](metaData, "isEqual:")))
  {
    events = self->_events;
    if ((unint64_t)events | v4[1])
      v7 = -[NSMutableArray isEqual:](events, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[APPBLogMetaData hash](self->_metaData, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_events, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  metaData = self->_metaData;
  v6 = *((_QWORD *)v4 + 2);
  if (metaData)
  {
    if (v6)
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else if (v6)
  {
    -[APPBLogAdEventRequest setMetaData:](self, "setMetaData:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[APPBLogAdEventRequest addEvent:](self, "addEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
