@implementation CLCKVO2MaxSessionOutput

- (void)dealloc
{
  objc_super v3;

  -[CLCKVO2MaxSessionOutput setSessionId:](self, "setSessionId:", 0);
  -[CLCKVO2MaxSessionOutput setSessionAttributes:](self, "setSessionAttributes:", 0);
  -[CLCKVO2MaxSessionOutput setEstimate:](self, "setEstimate:", 0);
  -[CLCKVO2MaxSessionOutput setSummaries:](self, "setSummaries:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionOutput;
  -[CLCKVO2MaxSessionOutput dealloc](&v3, "dealloc");
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasSessionAttributes
{
  return self->_sessionAttributes != 0;
}

- (BOOL)hasEstimate
{
  return self->_estimate != 0;
}

- (void)clearSummaries
{
  -[NSMutableArray removeAllObjects](self->_summaries, "removeAllObjects");
}

- (void)addSummaries:(id)a3
{
  NSMutableArray *summaries;

  summaries = self->_summaries;
  if (!summaries)
  {
    summaries = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_summaries = summaries;
  }
  -[NSMutableArray addObject:](summaries, "addObject:", a3);
}

- (unint64_t)summariesCount
{
  return (unint64_t)-[NSMutableArray count](self->_summaries, "count");
}

- (id)summariesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_summaries, "objectAtIndex:", a3);
}

+ (Class)summariesType
{
  return (Class)objc_opt_class(CLCKVO2MaxSummary, a2);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionOutput;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLCKVO2MaxSessionOutput description](&v3, "description"), -[CLCKVO2MaxSessionOutput dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *sessionId;
  CLCKVO2MaxSessionAttributes *sessionAttributes;
  CLCKVO2MaxEstimate *estimate;
  id v8;
  NSMutableArray *summaries;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  sessionAttributes = self->_sessionAttributes;
  if (sessionAttributes)
    objc_msgSend(v4, "setObject:forKey:", -[CLCKVO2MaxSessionAttributes dictionaryRepresentation](sessionAttributes, "dictionaryRepresentation"), CFSTR("sessionAttributes"));
  estimate = self->_estimate;
  if (estimate)
    objc_msgSend(v4, "setObject:forKey:", -[CLCKVO2MaxEstimate dictionaryRepresentation](estimate, "dictionaryRepresentation"), CFSTR("estimate"));
  if (-[NSMutableArray count](self->_summaries, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_summaries, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    summaries = self->_summaries;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](summaries, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(summaries);
          objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](summaries, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("summaries"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100E3EF14((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *sessionId;
  CLCKVO2MaxSessionAttributes *sessionAttributes;
  CLCKVO2MaxEstimate *estimate;
  NSMutableArray *summaries;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  sessionId = self->_sessionId;
  if (sessionId)
    PBDataWriterWriteStringField(a3, sessionId, 1);
  sessionAttributes = self->_sessionAttributes;
  if (sessionAttributes)
    PBDataWriterWriteSubmessage(a3, sessionAttributes, 2);
  estimate = self->_estimate;
  if (estimate)
    PBDataWriterWriteSubmessage(a3, estimate, 3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  summaries = self->_summaries;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](summaries, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(summaries);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), 4);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](summaries, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_sessionId)
    objc_msgSend(a3, "setSessionId:");
  if (self->_sessionAttributes)
    objc_msgSend(a3, "setSessionAttributes:");
  if (self->_estimate)
    objc_msgSend(a3, "setEstimate:");
  if (-[CLCKVO2MaxSessionOutput summariesCount](self, "summariesCount"))
  {
    objc_msgSend(a3, "clearSummaries");
    v5 = -[CLCKVO2MaxSessionOutput summariesCount](self, "summariesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSummaries:", -[CLCKVO2MaxSessionOutput summariesAtIndex:](self, "summariesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *summaries;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[3] = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v5[2] = -[CLCKVO2MaxSessionAttributes copyWithZone:](self->_sessionAttributes, "copyWithZone:", a3);

  v5[1] = -[CLCKVO2MaxEstimate copyWithZone:](self->_estimate, "copyWithZone:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  summaries = self->_summaries;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](summaries, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(summaries);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addSummaries:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](summaries, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *sessionId;
  CLCKVO2MaxSessionAttributes *sessionAttributes;
  CLCKVO2MaxEstimate *estimate;
  NSMutableArray *summaries;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    sessionId = self->_sessionId;
    if (!((unint64_t)sessionId | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](sessionId, "isEqual:")) != 0)
    {
      sessionAttributes = self->_sessionAttributes;
      if (!((unint64_t)sessionAttributes | *((_QWORD *)a3 + 2))
        || (v5 = -[CLCKVO2MaxSessionAttributes isEqual:](sessionAttributes, "isEqual:")) != 0)
      {
        estimate = self->_estimate;
        if (!((unint64_t)estimate | *((_QWORD *)a3 + 1))
          || (v5 = -[CLCKVO2MaxEstimate isEqual:](estimate, "isEqual:")) != 0)
        {
          summaries = self->_summaries;
          if ((unint64_t)summaries | *((_QWORD *)a3 + 4))
            LOBYTE(v5) = -[NSMutableArray isEqual:](summaries, "isEqual:");
          else
            LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_sessionId, "hash");
  v4 = -[CLCKVO2MaxSessionAttributes hash](self->_sessionAttributes, "hash") ^ v3;
  v5 = -[CLCKVO2MaxEstimate hash](self->_estimate, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_summaries, "hash");
}

- (void)mergeFrom:(id)a3
{
  CLCKVO2MaxSessionAttributes *sessionAttributes;
  uint64_t v6;
  CLCKVO2MaxEstimate *estimate;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (*((_QWORD *)a3 + 3))
    -[CLCKVO2MaxSessionOutput setSessionId:](self, "setSessionId:");
  sessionAttributes = self->_sessionAttributes;
  v6 = *((_QWORD *)a3 + 2);
  if (sessionAttributes)
  {
    if (v6)
      -[CLCKVO2MaxSessionAttributes mergeFrom:](sessionAttributes, "mergeFrom:");
  }
  else if (v6)
  {
    -[CLCKVO2MaxSessionOutput setSessionAttributes:](self, "setSessionAttributes:");
  }
  estimate = self->_estimate;
  v8 = *((_QWORD *)a3 + 1);
  if (estimate)
  {
    if (v8)
      -[CLCKVO2MaxEstimate mergeFrom:](estimate, "mergeFrom:");
  }
  else if (v8)
  {
    -[CLCKVO2MaxSessionOutput setEstimate:](self, "setEstimate:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)*((_QWORD *)a3 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CLCKVO2MaxSessionOutput addSummaries:](self, "addSummaries:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CLCKVO2MaxSessionAttributes)sessionAttributes
{
  return self->_sessionAttributes;
}

- (void)setSessionAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CLCKVO2MaxEstimate)estimate
{
  return self->_estimate;
}

- (void)setEstimate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableArray)summaries
{
  return self->_summaries;
}

- (void)setSummaries:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
