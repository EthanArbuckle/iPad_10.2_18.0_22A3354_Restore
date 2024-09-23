@implementation CLCKVO2MaxSessionInput

- (void)dealloc
{
  objc_super v3;

  -[CLCKVO2MaxSessionInput setSessionId:](self, "setSessionId:", 0);
  -[CLCKVO2MaxSessionInput setInputs:](self, "setInputs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionInput;
  -[CLCKVO2MaxSessionInput dealloc](&v3, "dealloc");
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)clearInputs
{
  -[NSMutableArray removeAllObjects](self->_inputs, "removeAllObjects");
}

- (void)addInputs:(id)a3
{
  NSMutableArray *inputs;

  inputs = self->_inputs;
  if (!inputs)
  {
    inputs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_inputs = inputs;
  }
  -[NSMutableArray addObject:](inputs, "addObject:", a3);
}

- (unint64_t)inputsCount
{
  return (unint64_t)-[NSMutableArray count](self->_inputs, "count");
}

- (id)inputsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_inputs, "objectAtIndex:", a3);
}

+ (Class)inputsType
{
  return (Class)objc_opt_class(CLCKVO2MaxCalorimetryInput, a2);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionInput;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CLCKVO2MaxSessionInput description](&v3, "description"), -[CLCKVO2MaxSessionInput dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *sessionId;
  id v6;
  NSMutableArray *inputs;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  if (-[NSMutableArray count](self->_inputs, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_inputs, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    inputs = self->_inputs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(inputs);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("inputs"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B22470((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *sessionId;
  NSMutableArray *inputs;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  sessionId = self->_sessionId;
  if (sessionId)
    PBDataWriterWriteStringField(a3, sessionId, 1);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  inputs = self->_inputs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(inputs);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), 2);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_sessionId)
    objc_msgSend(a3, "setSessionId:");
  if (-[CLCKVO2MaxSessionInput inputsCount](self, "inputsCount"))
  {
    objc_msgSend(a3, "clearInputs");
    v5 = -[CLCKVO2MaxSessionInput inputsCount](self, "inputsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addInputs:", -[CLCKVO2MaxSessionInput inputsAtIndex:](self, "inputsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *inputs;
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

  v5[2] = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  inputs = self->_inputs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(inputs);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addInputs:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *sessionId;
  NSMutableArray *inputs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    sessionId = self->_sessionId;
    if (!((unint64_t)sessionId | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](sessionId, "isEqual:")) != 0)
    {
      inputs = self->_inputs;
      if ((unint64_t)inputs | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSMutableArray isEqual:](inputs, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_sessionId, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_inputs, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (*((_QWORD *)a3 + 2))
    -[CLCKVO2MaxSessionInput setSessionId:](self, "setSessionId:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CLCKVO2MaxSessionInput addInputs:](self, "addInputs:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
