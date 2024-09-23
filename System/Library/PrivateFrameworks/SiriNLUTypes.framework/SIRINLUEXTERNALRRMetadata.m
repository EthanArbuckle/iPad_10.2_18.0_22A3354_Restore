@implementation SIRINLUEXTERNALRRMetadata

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

- (void)clearSurroundingTexts
{
  -[NSMutableArray removeAllObjects](self->_surroundingTexts, "removeAllObjects");
}

- (void)addSurroundingTexts:(id)a3
{
  id v4;
  NSMutableArray *surroundingTexts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  surroundingTexts = self->_surroundingTexts;
  v8 = v4;
  if (!surroundingTexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_surroundingTexts;
    self->_surroundingTexts = v6;

    v4 = v8;
    surroundingTexts = self->_surroundingTexts;
  }
  -[NSMutableArray addObject:](surroundingTexts, "addObject:", v4);

}

- (unint64_t)surroundingTextsCount
{
  return -[NSMutableArray count](self->_surroundingTexts, "count");
}

- (id)surroundingTextsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_surroundingTexts, "objectAtIndex:", a3);
}

- (int)dataSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_dataSource;
  else
    return 0;
}

- (void)setDataSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataSource = a3;
}

- (void)setHasDataSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)dataSourceAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7BB12D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDataSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONVERSATIONAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_SCREEN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VISUAL")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)SIRINLUEXTERNALRRMetadata;
  -[SIRINLUEXTERNALRRMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALRRMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALRRBoundingBox *boundingBox;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t dataSource;
  __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    -[SIRINLUEXTERNALRRBoundingBox dictionaryRepresentation](boundingBox, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bounding_box"));

  }
  if (-[NSMutableArray count](self->_surroundingTexts, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_surroundingTexts, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_surroundingTexts;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("surrounding_texts"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dataSource = self->_dataSource;
    if (dataSource >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dataSource);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E7BB12D0[dataSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("data_source"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRRMetadataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_boundingBox)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_surroundingTexts;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_boundingBox)
    objc_msgSend(v8, "setBoundingBox:");
  if (-[SIRINLUEXTERNALRRMetadata surroundingTextsCount](self, "surroundingTextsCount"))
  {
    objc_msgSend(v8, "clearSurroundingTexts");
    v4 = -[SIRINLUEXTERNALRRMetadata surroundingTextsCount](self, "surroundingTextsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUEXTERNALRRMetadata surroundingTextsAtIndex:](self, "surroundingTextsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSurroundingTexts:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v8 + 4) = self->_dataSource;
    *((_BYTE *)v8 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALRRBoundingBox copyWithZone:](self->_boundingBox, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_surroundingTexts;
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
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addSurroundingTexts:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_dataSource;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SIRINLUEXTERNALRRBoundingBox *boundingBox;
  NSMutableArray *surroundingTexts;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  boundingBox = self->_boundingBox;
  if ((unint64_t)boundingBox | *((_QWORD *)v4 + 1))
  {
    if (!-[SIRINLUEXTERNALRRBoundingBox isEqual:](boundingBox, "isEqual:"))
      goto LABEL_10;
  }
  surroundingTexts = self->_surroundingTexts;
  if ((unint64_t)surroundingTexts | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](surroundingTexts, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_dataSource == *((_DWORD *)v4 + 4))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SIRINLUEXTERNALRRBoundingBox hash](self->_boundingBox, "hash");
  v4 = -[NSMutableArray hash](self->_surroundingTexts, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_dataSource;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SIRINLUEXTERNALRRBoundingBox *boundingBox;
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
  boundingBox = self->_boundingBox;
  v6 = *((_QWORD *)v4 + 1);
  if (boundingBox)
  {
    if (v6)
      -[SIRINLUEXTERNALRRBoundingBox mergeFrom:](boundingBox, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALRRMetadata setBoundingBox:](self, "setBoundingBox:");
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
        -[SIRINLUEXTERNALRRMetadata addSurroundingTexts:](self, "addSurroundingTexts:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_dataSource = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (SIRINLUEXTERNALRRBoundingBox)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBox, a3);
}

- (NSMutableArray)surroundingTexts
{
  return self->_surroundingTexts;
}

- (void)setSurroundingTexts:(id)a3
{
  objc_storeStrong((id *)&self->_surroundingTexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surroundingTexts, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

+ (Class)surroundingTextsType
{
  return (Class)objc_opt_class();
}

@end
