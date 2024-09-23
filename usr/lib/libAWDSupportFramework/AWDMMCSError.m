@implementation AWDMMCSError

- (void)dealloc
{
  objc_super v3;

  -[AWDMMCSError setDomain:](self, "setDomain:", 0);
  -[AWDMMCSError setUnderlyingErrors:](self, "setUnderlyingErrors:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSError;
  -[AWDMMCSError dealloc](&v3, sel_dealloc);
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearUnderlyingErrors
{
  -[NSMutableArray removeAllObjects](self->_underlyingErrors, "removeAllObjects");
}

- (void)addUnderlyingErrors:(id)a3
{
  NSMutableArray *underlyingErrors;

  underlyingErrors = self->_underlyingErrors;
  if (!underlyingErrors)
  {
    underlyingErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_underlyingErrors = underlyingErrors;
  }
  -[NSMutableArray addObject:](underlyingErrors, "addObject:", a3);
}

- (unint64_t)underlyingErrorsCount
{
  return -[NSMutableArray count](self->_underlyingErrors, "count");
}

- (id)underlyingErrorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_underlyingErrors, "objectAtIndex:", a3);
}

+ (Class)underlyingErrorsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSError;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMMCSError description](&v3, sel_description), -[AWDMMCSError dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  void *v6;
  NSMutableArray *underlyingErrors;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_code), CFSTR("code"));
  if (-[NSMutableArray count](self->_underlyingErrors, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_underlyingErrors, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    underlyingErrors = self->_underlyingErrors;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](underlyingErrors, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(underlyingErrors);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](underlyingErrors, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("underlyingErrors"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *underlyingErrors;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_domain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  underlyingErrors = self->_underlyingErrors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](underlyingErrors, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(underlyingErrors);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](underlyingErrors, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_domain)
    objc_msgSend(a3, "setDomain:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_code;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (-[AWDMMCSError underlyingErrorsCount](self, "underlyingErrorsCount"))
  {
    objc_msgSend(a3, "clearUnderlyingErrors");
    v5 = -[AWDMMCSError underlyingErrorsCount](self, "underlyingErrorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addUnderlyingErrors:", -[AWDMMCSError underlyingErrorsAtIndex:](self, "underlyingErrorsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *underlyingErrors;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  underlyingErrors = self->_underlyingErrors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](underlyingErrors, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(underlyingErrors);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addUnderlyingErrors:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](underlyingErrors, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *domain;
  NSMutableArray *underlyingErrors;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    domain = self->_domain;
    if (!((unint64_t)domain | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](domain, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_code != *((_DWORD *)a3 + 2))
          goto LABEL_11;
      }
      else if ((*((_BYTE *)a3 + 32) & 1) != 0)
      {
LABEL_11:
        LOBYTE(v5) = 0;
        return v5;
      }
      underlyingErrors = self->_underlyingErrors;
      if ((unint64_t)underlyingErrors | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSMutableArray isEqual:](underlyingErrors, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_domain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_code;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSMutableArray hash](self->_underlyingErrors, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a3 + 2))
    -[AWDMMCSError setDomain:](self, "setDomain:");
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_code = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
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
        -[AWDMMCSError addUnderlyingErrors:](self, "addUnderlyingErrors:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)code
{
  return self->_code;
}

- (NSMutableArray)underlyingErrors
{
  return self->_underlyingErrors;
}

- (void)setUnderlyingErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
