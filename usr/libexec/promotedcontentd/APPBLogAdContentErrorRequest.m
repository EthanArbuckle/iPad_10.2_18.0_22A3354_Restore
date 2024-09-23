@implementation APPBLogAdContentErrorRequest

+ (id)options
{
  if (qword_1002699C0 != -1)
    dispatch_once(&qword_1002699C0, &stru_100215528);
  return (id)qword_1002699B8;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (int)errorType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_errorType;
  else
    return 1;
}

- (void)setErrorType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorType = a3;
}

- (void)setHasErrorType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)errorTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ParseError");
  if (a3 == 2)
    v3 = CFSTR("Exception");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsErrorType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ParseError")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Exception")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)setLineNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lineNumber = a3;
}

- (void)setHasLineNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLineNumber
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)clearLines
{
  -[NSMutableArray removeAllObjects](self->_lines, "removeAllObjects");
}

- (void)addLines:(id)a3
{
  id v4;
  NSMutableArray *lines;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  lines = self->_lines;
  v8 = v4;
  if (!lines)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lines;
    self->_lines = v6;

    v4 = v8;
    lines = self->_lines;
  }
  -[NSMutableArray addObject:](lines, "addObject:", v4);

}

- (unint64_t)linesCount
{
  return (unint64_t)-[NSMutableArray count](self->_lines, "count");
}

- (id)linesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_lines, "objectAtIndex:", a3);
}

+ (Class)linesType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearFunctionNames
{
  -[NSMutableArray removeAllObjects](self->_functionNames, "removeAllObjects");
}

- (void)addFunctionNames:(id)a3
{
  id v4;
  NSMutableArray *functionNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  functionNames = self->_functionNames;
  v8 = v4;
  if (!functionNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_functionNames;
    self->_functionNames = v6;

    v4 = v8;
    functionNames = self->_functionNames;
  }
  -[NSMutableArray addObject:](functionNames, "addObject:", v4);

}

- (unint64_t)functionNamesCount
{
  return (unint64_t)-[NSMutableArray count](self->_functionNames, "count");
}

- (id)functionNamesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_functionNames, "objectAtIndex:", a3);
}

+ (Class)functionNamesType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogAdContentErrorRequest;
  v3 = -[APPBLogAdContentErrorRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAdContentErrorRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBLogMetaData *metaData;
  void *v5;
  int errorType;
  __CFString *v7;
  NSString *errorMessage;
  void *v9;
  NSString *uRL;
  NSMutableArray *lines;
  NSMutableArray *functionNames;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](metaData, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metaData"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    errorType = self->_errorType;
    if (errorType == 1)
    {
      v7 = CFSTR("ParseError");
    }
    else if (errorType == 2)
    {
      v7 = CFSTR("Exception");
    }
    else
    {
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_errorType));
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorType"));

  }
  errorMessage = self->_errorMessage;
  if (errorMessage)
    objc_msgSend(v3, "setObject:forKey:", errorMessage, CFSTR("errorMessage"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lineNumber));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("lineNumber"));

  }
  uRL = self->_uRL;
  if (uRL)
    objc_msgSend(v3, "setObject:forKey:", uRL, CFSTR("URL"));
  lines = self->_lines;
  if (lines)
    objc_msgSend(v3, "setObject:forKey:", lines, CFSTR("lines"));
  functionNames = self->_functionNames;
  if (functionNames)
    objc_msgSend(v3, "setObject:forKey:", functionNames, CFSTR("functionNames"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAdContentErrorRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  APPBLogMetaData *metaData;
  NSString *errorMessage;
  NSString *uRL;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = v4;
  metaData = self->_metaData;
  if (metaData)
    PBDataWriterWriteSubmessage(v4, metaData, 1);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(v5, self->_errorType, 2);
  errorMessage = self->_errorMessage;
  if (errorMessage)
    PBDataWriterWriteStringField(v5, errorMessage, 3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field(v5, self->_lineNumber, 4);
  uRL = self->_uRL;
  if (uRL)
    PBDataWriterWriteStringField(v5, uRL, 5);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self->_lines;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13), 6);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = self->_functionNames;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18), 7);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_metaData)
  {
    objc_msgSend(v4, "setMetaData:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_errorType;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_errorMessage)
  {
    objc_msgSend(v13, "setErrorMessage:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_lineNumber;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (self->_uRL)
    objc_msgSend(v13, "setURL:");
  if (-[APPBLogAdContentErrorRequest linesCount](self, "linesCount"))
  {
    objc_msgSend(v13, "clearLines");
    v5 = -[APPBLogAdContentErrorRequest linesCount](self, "linesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAdContentErrorRequest linesAtIndex:](self, "linesAtIndex:", i));
        objc_msgSend(v13, "addLines:", v8);

      }
    }
  }
  if (-[APPBLogAdContentErrorRequest functionNamesCount](self, "functionNamesCount"))
  {
    objc_msgSend(v13, "clearFunctionNames");
    v9 = -[APPBLogAdContentErrorRequest functionNamesCount](self, "functionNamesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAdContentErrorRequest functionNamesAtIndex:](self, "functionNamesAtIndex:", j));
        objc_msgSend(v13, "addFunctionNames:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBLogMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_errorType;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_errorMessage, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_lineNumber;
    *((_BYTE *)v5 + 64) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_uRL, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_lines;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addLines:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_functionNames;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addFunctionNames:", v23);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  char has;
  NSString *errorMessage;
  NSString *uRL;
  NSMutableArray *lines;
  NSMutableArray *functionNames;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_23;
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((_QWORD *)v4 + 6))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:"))
      goto LABEL_23;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_errorType != *((_DWORD *)v4 + 4))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_23;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](errorMessage, "isEqual:"))
    {
LABEL_23:
      v11 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_lineNumber != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_23;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((_QWORD *)v4 + 7) && !-[NSString isEqual:](uRL, "isEqual:"))
    goto LABEL_23;
  lines = self->_lines;
  if ((unint64_t)lines | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](lines, "isEqual:"))
      goto LABEL_23;
  }
  functionNames = self->_functionNames;
  if ((unint64_t)functionNames | *((_QWORD *)v4 + 3))
    v11 = -[NSMutableArray isEqual:](functionNames, "isEqual:");
  else
    v11 = 1;
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;

  v3 = -[APPBLogMetaData hash](self->_metaData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_errorType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_errorMessage, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_lineNumber;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSString hash](self->_uRL, "hash");
  v9 = v8 ^ (unint64_t)-[NSMutableArray hash](self->_lines, "hash");
  return v7 ^ v9 ^ (unint64_t)-[NSMutableArray hash](self->_functionNames, "hash");
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
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = a3;
  metaData = self->_metaData;
  v6 = *((_QWORD *)v4 + 6);
  if (metaData)
  {
    if (v6)
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else if (v6)
  {
    -[APPBLogAdContentErrorRequest setMetaData:](self, "setMetaData:");
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_errorType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
    -[APPBLogAdContentErrorRequest setErrorMessage:](self, "setErrorMessage:");
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    self->_lineNumber = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
    -[APPBLogAdContentErrorRequest setURL:](self, "setURL:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[APPBLogAdContentErrorRequest addLines:](self, "addLines:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[APPBLogAdContentErrorRequest addFunctionNames:](self, "addFunctionNames:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
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

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_uRL, a3);
}

- (NSMutableArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_storeStrong((id *)&self->_lines, a3);
}

- (NSMutableArray)functionNames
{
  return self->_functionNames;
}

- (void)setFunctionNames:(id)a3
{
  objc_storeStrong((id *)&self->_functionNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_functionNames, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
