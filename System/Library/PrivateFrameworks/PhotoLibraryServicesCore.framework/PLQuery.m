@implementation PLQuery

- (BOOL)readFrom:(id)a3
{
  return PLQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)logDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLQuery conjunction](self, "conjunction");
  v7 = CFSTR("kPLQueryConjunction_OR");
  if (v6 == 1)
    v7 = CFSTR("kPLQueryConjunction_AND");
  if (v6 == 2)
    v7 = CFSTR("kPLQueryConjunction_NOT");
  v8 = v7;
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p> { conjunction = %@;"), v5, self, v8);

  if (-[PLQuery hasFirst](self, "hasFirst"))
  {
    -[PLQuery first](self, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" first = %@;"), v10);

  }
  if (-[PLQuery hasSecond](self, "hasSecond"))
  {
    -[PLQuery second](self, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" second = %@;"), v12);

  }
  if (-[PLQuery singleQueriesCount](self, "singleQueriesCount"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PLQuery singleQueries](self, "singleQueries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __36__PLQuery_Utilities__logDescription__block_invoke;
    v18[3] = &unk_1E3768860;
    v19 = v13;
    v15 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);

    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" singles = (%@);"), v16);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n}"));
  return v3;
}

void __36__PLQuery_Utilities__logDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "logDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)setConjunction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_conjunction = a3;
}

- (void)setHasConjunction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConjunction
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFirst
{
  return self->_first != 0;
}

- (BOOL)hasSecond
{
  return self->_second != 0;
}

- (void)clearSingleQueries
{
  -[NSMutableArray removeAllObjects](self->_singleQueries, "removeAllObjects");
}

- (void)addSingleQueries:(id)a3
{
  id v4;
  NSMutableArray *singleQueries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  singleQueries = self->_singleQueries;
  v8 = v4;
  if (!singleQueries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_singleQueries;
    self->_singleQueries = v6;

    v4 = v8;
    singleQueries = self->_singleQueries;
  }
  -[NSMutableArray addObject:](singleQueries, "addObject:", v4);

}

- (unint64_t)singleQueriesCount
{
  return -[NSMutableArray count](self->_singleQueries, "count");
}

- (id)singleQueriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_singleQueries, "objectAtIndex:", a3);
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
  v8.super_class = (Class)PLQuery;
  -[PLQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  PLQuery *first;
  void *v6;
  PLQuery *second;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_conjunction);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("conjunction"));

  }
  first = self->_first;
  if (first)
  {
    -[PLQuery dictionaryRepresentation](first, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("first"));

  }
  second = self->_second;
  if (second)
  {
    -[PLQuery dictionaryRepresentation](second, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("second"));

  }
  if (-[NSMutableArray count](self->_singleQueries, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_singleQueries, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_singleQueries;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("singleQueries"));
  }
  return v3;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_first)
    PBDataWriterWriteSubmessage();
  if (self->_second)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_singleQueries;
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
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_conjunction;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v9 = v4;
  if (self->_first)
    objc_msgSend(v4, "setFirst:");
  if (self->_second)
    objc_msgSend(v9, "setSecond:");
  if (-[PLQuery singleQueriesCount](self, "singleQueriesCount"))
  {
    objc_msgSend(v9, "clearSingleQueries");
    v5 = -[PLQuery singleQueriesCount](self, "singleQueriesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PLQuery singleQueriesAtIndex:](self, "singleQueriesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSingleQueries:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_conjunction;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[PLQuery copyWithZone:](self->_first, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[PLQuery copyWithZone:](self->_second, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_singleQueries;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addSingleQueries:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PLQuery *first;
  PLQuery *second;
  NSMutableArray *singleQueries;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_conjunction != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  first = self->_first;
  if ((unint64_t)first | *((_QWORD *)v4 + 2) && !-[PLQuery isEqual:](first, "isEqual:"))
    goto LABEL_13;
  second = self->_second;
  if ((unint64_t)second | *((_QWORD *)v4 + 3))
  {
    if (!-[PLQuery isEqual:](second, "isEqual:"))
      goto LABEL_13;
  }
  singleQueries = self->_singleQueries;
  if ((unint64_t)singleQueries | *((_QWORD *)v4 + 4))
    v8 = -[NSMutableArray isEqual:](singleQueries, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_conjunction;
  else
    v3 = 0;
  v4 = -[PLQuery hash](self->_first, "hash") ^ v3;
  v5 = -[PLQuery hash](self->_second, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_singleQueries, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  PLQuery *first;
  uint64_t v7;
  PLQuery *second;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[10] & 1) != 0)
  {
    self->_conjunction = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  first = self->_first;
  v7 = *((_QWORD *)v5 + 2);
  if (first)
  {
    if (v7)
      -[PLQuery mergeFrom:](first, "mergeFrom:");
  }
  else if (v7)
  {
    -[PLQuery setFirst:](self, "setFirst:");
  }
  second = self->_second;
  v9 = *((_QWORD *)v5 + 3);
  if (second)
  {
    if (v9)
      -[PLQuery mergeFrom:](second, "mergeFrom:");
  }
  else if (v9)
  {
    -[PLQuery setSecond:](self, "setSecond:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v5 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[PLQuery addSingleQueries:](self, "addSingleQueries:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (int)conjunction
{
  return self->_conjunction;
}

- (PLQuery)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong((id *)&self->_first, a3);
}

- (PLQuery)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong((id *)&self->_second, a3);
}

- (NSMutableArray)singleQueries
{
  return self->_singleQueries;
}

- (void)setSingleQueries:(id)a3
{
  objc_storeStrong((id *)&self->_singleQueries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleQueries, 0);
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

+ (Class)singleQueriesType
{
  return (Class)objc_opt_class();
}

@end
