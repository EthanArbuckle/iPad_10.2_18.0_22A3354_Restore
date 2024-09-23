@implementation SIRINLUINTERNALUtteranceRule

- (BOOL)hasPattern
{
  return self->_pattern != 0;
}

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
  if (a3 < 3)
    return off_1E7BAEB28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPARISON_TYPE_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPARISON_TYPE_EXACT_LITERAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPARISON_TYPE_REGULAR_EXPRESSION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCompareOptions
{
  return self->_compareOptions != 0;
}

- (void)clearSpansForNamedCaptureGroups
{
  -[NSMutableArray removeAllObjects](self->_spansForNamedCaptureGroups, "removeAllObjects");
}

- (void)addSpansForNamedCaptureGroups:(id)a3
{
  id v4;
  NSMutableArray *spansForNamedCaptureGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  spansForNamedCaptureGroups = self->_spansForNamedCaptureGroups;
  v8 = v4;
  if (!spansForNamedCaptureGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_spansForNamedCaptureGroups;
    self->_spansForNamedCaptureGroups = v6;

    v4 = v8;
    spansForNamedCaptureGroups = self->_spansForNamedCaptureGroups;
  }
  -[NSMutableArray addObject:](spansForNamedCaptureGroups, "addObject:", v4);

}

- (unint64_t)spansForNamedCaptureGroupsCount
{
  return -[NSMutableArray count](self->_spansForNamedCaptureGroups, "count");
}

- (id)spansForNamedCaptureGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_spansForNamedCaptureGroups, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALUtteranceRule;
  -[SIRINLUINTERNALUtteranceRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALUtteranceRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *pattern;
  uint64_t type;
  __CFString *v7;
  SIRINLUINTERNALCompareOptions *compareOptions;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  pattern = self->_pattern;
  if (pattern)
    objc_msgSend(v3, "setObject:forKey:", pattern, CFSTR("pattern"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E7BAEB28[type];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  }
  compareOptions = self->_compareOptions;
  if (compareOptions)
  {
    -[SIRINLUINTERNALCompareOptions dictionaryRepresentation](compareOptions, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("compare_options"));

  }
  if (-[NSMutableArray count](self->_spansForNamedCaptureGroups, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_spansForNamedCaptureGroups, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_spansForNamedCaptureGroups;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("spans_for_named_capture_groups"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALUtteranceRuleReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_pattern)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_compareOptions)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_spansForNamedCaptureGroups;
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
  if (self->_pattern)
  {
    objc_msgSend(v4, "setPattern:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_compareOptions)
    objc_msgSend(v9, "setCompareOptions:");
  if (-[SIRINLUINTERNALUtteranceRule spansForNamedCaptureGroupsCount](self, "spansForNamedCaptureGroupsCount"))
  {
    objc_msgSend(v9, "clearSpansForNamedCaptureGroups");
    v5 = -[SIRINLUINTERNALUtteranceRule spansForNamedCaptureGroupsCount](self, "spansForNamedCaptureGroupsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUINTERNALUtteranceRule spansForNamedCaptureGroupsAtIndex:](self, "spansForNamedCaptureGroupsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSpansForNamedCaptureGroups:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
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
  v6 = -[NSString copyWithZone:](self->_pattern, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v8 = -[SIRINLUINTERNALCompareOptions copyWithZone:](self->_compareOptions, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_spansForNamedCaptureGroups;
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
        objc_msgSend((id)v5, "addSpansForNamedCaptureGroups:", v15);

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
  NSString *pattern;
  SIRINLUINTERNALCompareOptions *compareOptions;
  NSMutableArray *spansForNamedCaptureGroups;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  pattern = self->_pattern;
  if ((unint64_t)pattern | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](pattern, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  compareOptions = self->_compareOptions;
  if ((unint64_t)compareOptions | *((_QWORD *)v4 + 1)
    && !-[SIRINLUINTERNALCompareOptions isEqual:](compareOptions, "isEqual:"))
  {
    goto LABEL_13;
  }
  spansForNamedCaptureGroups = self->_spansForNamedCaptureGroups;
  if ((unint64_t)spansForNamedCaptureGroups | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](spansForNamedCaptureGroups, "isEqual:");
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
  unint64_t v6;

  v3 = -[NSString hash](self->_pattern, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[SIRINLUINTERNALCompareOptions hash](self->_compareOptions, "hash");
  return v5 ^ v6 ^ -[NSMutableArray hash](self->_spansForNamedCaptureGroups, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUINTERNALCompareOptions *compareOptions;
  uint64_t v6;
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
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUINTERNALUtteranceRule setPattern:](self, "setPattern:");
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  compareOptions = self->_compareOptions;
  v6 = *((_QWORD *)v4 + 1);
  if (compareOptions)
  {
    if (v6)
      -[SIRINLUINTERNALCompareOptions mergeFrom:](compareOptions, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUINTERNALUtteranceRule setCompareOptions:](self, "setCompareOptions:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 3);
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
        -[SIRINLUINTERNALUtteranceRule addSpansForNamedCaptureGroups:](self, "addSpansForNamedCaptureGroups:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)setPattern:(id)a3
{
  objc_storeStrong((id *)&self->_pattern, a3);
}

- (SIRINLUINTERNALCompareOptions)compareOptions
{
  return self->_compareOptions;
}

- (void)setCompareOptions:(id)a3
{
  objc_storeStrong((id *)&self->_compareOptions, a3);
}

- (NSMutableArray)spansForNamedCaptureGroups
{
  return self->_spansForNamedCaptureGroups;
}

- (void)setSpansForNamedCaptureGroups:(id)a3
{
  objc_storeStrong((id *)&self->_spansForNamedCaptureGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spansForNamedCaptureGroups, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_compareOptions, 0);
}

+ (Class)spansForNamedCaptureGroupsType
{
  return (Class)objc_opt_class();
}

@end
