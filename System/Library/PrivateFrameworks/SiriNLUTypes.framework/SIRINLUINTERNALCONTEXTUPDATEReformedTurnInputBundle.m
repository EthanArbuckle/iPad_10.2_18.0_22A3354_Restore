@implementation SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E7BAF6B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFORM_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CORRECTION_BY_REPETITION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFERENCE_RESOLUTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_TO_EDIT")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCurrentTurn
{
  return self->_currentTurn != 0;
}

- (void)clearPreviousTurns
{
  -[NSMutableArray removeAllObjects](self->_previousTurns, "removeAllObjects");
}

- (void)addPreviousTurns:(id)a3
{
  id v4;
  NSMutableArray *previousTurns;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  previousTurns = self->_previousTurns;
  v8 = v4;
  if (!previousTurns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_previousTurns;
    self->_previousTurns = v6;

    v4 = v8;
    previousTurns = self->_previousTurns;
  }
  -[NSMutableArray addObject:](previousTurns, "addObject:", v4);

}

- (unint64_t)previousTurnsCount
{
  return -[NSMutableArray count](self->_previousTurns, "count");
}

- (id)previousTurnsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_previousTurns, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle;
  -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  SIRINLUEXTERNALTurnInput *currentTurn;
  void *v7;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E7BAF6B0[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  currentTurn = self->_currentTurn;
  if (currentTurn)
  {
    -[SIRINLUEXTERNALTurnInput dictionaryRepresentation](currentTurn, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("current_turn"));

  }
  if (-[NSMutableArray count](self->_previousTurns, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_previousTurns, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_previousTurns;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("previous_turns"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundleReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_currentTurn)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_previousTurns;
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
    v4[6] = self->_type;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v9 = v4;
  if (self->_currentTurn)
    objc_msgSend(v4, "setCurrentTurn:");
  if (-[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle previousTurnsCount](self, "previousTurnsCount"))
  {
    objc_msgSend(v9, "clearPreviousTurns");
    v5 = -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle previousTurnsCount](self, "previousTurnsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle previousTurnsAtIndex:](self, "previousTurnsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addPreviousTurns:", v8);

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
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[SIRINLUEXTERNALTurnInput copyWithZone:](self->_currentTurn, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_previousTurns;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v6, "addPreviousTurns:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALTurnInput *currentTurn;
  NSMutableArray *previousTurns;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  currentTurn = self->_currentTurn;
  if ((unint64_t)currentTurn | *((_QWORD *)v4 + 1)
    && !-[SIRINLUEXTERNALTurnInput isEqual:](currentTurn, "isEqual:"))
  {
    goto LABEL_11;
  }
  previousTurns = self->_previousTurns;
  if ((unint64_t)previousTurns | *((_QWORD *)v4 + 2))
    v7 = -[NSMutableArray isEqual:](previousTurns, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[SIRINLUEXTERNALTurnInput hash](self->_currentTurn, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_previousTurns, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  SIRINLUEXTERNALTurnInput *currentTurn;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[7] & 1) != 0)
  {
    self->_type = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  currentTurn = self->_currentTurn;
  v7 = *((_QWORD *)v5 + 1);
  if (currentTurn)
  {
    if (v7)
      -[SIRINLUEXTERNALTurnInput mergeFrom:](currentTurn, "mergeFrom:");
  }
  else if (v7)
  {
    -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle setCurrentTurn:](self, "setCurrentTurn:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v5 + 2);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle addPreviousTurns:](self, "addPreviousTurns:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (SIRINLUEXTERNALTurnInput)currentTurn
{
  return self->_currentTurn;
}

- (void)setCurrentTurn:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurn, a3);
}

- (NSMutableArray)previousTurns
{
  return self->_previousTurns;
}

- (void)setPreviousTurns:(id)a3
{
  objc_storeStrong((id *)&self->_previousTurns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTurns, 0);
  objc_storeStrong((id *)&self->_currentTurn, 0);
}

+ (Class)previousTurnsType
{
  return (Class)objc_opt_class();
}

@end
