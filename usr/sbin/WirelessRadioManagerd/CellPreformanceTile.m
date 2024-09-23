@implementation CellPreformanceTile

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
  }
  v4.receiver = self;
  v4.super_class = (Class)CellPreformanceTile;
  -[CellPreformanceTile dealloc](&v4, "dealloc");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CellPreformanceTile;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CellPreformanceTile description](&v3, "description"), -[CellPreformanceTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  id v4;
  NSMutableArray *lteCells;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  NSMutableArray *nrCells;
  id v12;
  id v13;
  uint64_t v14;
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

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_lteCells, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lteCells, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    lteCells = self->_lteCells;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCells, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(lteCells);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCells, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("lteCells"));

  }
  if (-[NSMutableArray count](self->_nrCells, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nrCells, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    nrCells = self->_nrCells;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nrCells, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(nrCells);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nrCells, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("nrCells"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10002C9C4(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *lteCells;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableArray *nrCells;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  lteCells = self->_lteCells;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCells, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(lteCells);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), 1);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCells, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  nrCells = self->_nrCells;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nrCells, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(nrCells);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), 2);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nrCells, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *lteCells;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  NSMutableArray *nrCells;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  lteCells = self->_lteCells;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCells, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(lteCells);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        sub_10002C5C0(v5, (uint64_t)v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCells, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  nrCells = self->_nrCells;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nrCells, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(nrCells);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        sub_10002C680(v5, (uint64_t)v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nrCells, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *lteCells;
  NSMutableArray *nrCells;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    lteCells = self->_lteCells;
    if (!((unint64_t)lteCells | *((_QWORD *)a3 + 1))
      || (v5 = -[NSMutableArray isEqual:](lteCells, "isEqual:")) != 0)
    {
      nrCells = self->_nrCells;
      if ((unint64_t)nrCells | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSMutableArray isEqual:](nrCells, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSMutableArray hash](self->_lteCells, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_nrCells, "hash") ^ v3;
}

@end
