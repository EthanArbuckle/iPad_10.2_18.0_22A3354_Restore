@implementation _SFPBRFTableRowCardSection

- (_SFPBRFTableRowCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTableRowCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBRFTableCell *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  _SFPBRFTableCell *v21;
  _SFPBRFTableRowCardSection *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFTableRowCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "cells");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "cells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    -[_SFPBRFTableRowCardSection setCells:](v5, "setCells:", v7);
    if (objc_msgSend(v4, "hasVertical_alignment"))
      -[_SFPBRFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    if (objc_msgSend(v4, "hasScale_to_fit"))
      -[_SFPBRFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", objc_msgSend(v4, "scale_to_fit"));
    objc_msgSend(v4, "compact_cells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "compact_cells", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }

    -[_SFPBRFTableRowCardSection setCompact_cells:](v5, "setCompact_cells:", v15);
    v22 = v5;

  }
  return v5;
}

- (void)setCells:(id)a3
{
  NSArray *v4;
  NSArray *cells;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cells = self->_cells;
  self->_cells = v4;

}

- (void)clearCells
{
  -[NSArray removeAllObjects](self->_cells, "removeAllObjects");
}

- (void)addCells:(id)a3
{
  id v4;
  NSArray *cells;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  cells = self->_cells;
  v8 = v4;
  if (!cells)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cells;
    self->_cells = v6;

    v4 = v8;
    cells = self->_cells;
  }
  -[NSArray addObject:](cells, "addObject:", v4);

}

- (unint64_t)cellsCount
{
  return -[NSArray count](self->_cells, "count");
}

- (id)cellsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", a3);
}

- (void)setVertical_alignment:(int)a3
{
  self->_vertical_alignment = a3;
}

- (void)setScale_to_fit:(BOOL)a3
{
  self->_scale_to_fit = a3;
}

- (void)setCompact_cells:(id)a3
{
  NSArray *v4;
  NSArray *compact_cells;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  compact_cells = self->_compact_cells;
  self->_compact_cells = v4;

}

- (void)clearCompact_cells
{
  -[NSArray removeAllObjects](self->_compact_cells, "removeAllObjects");
}

- (void)addCompact_cells:(id)a3
{
  id v4;
  NSArray *compact_cells;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  compact_cells = self->_compact_cells;
  v8 = v4;
  if (!compact_cells)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_compact_cells;
    self->_compact_cells = v6;

    v4 = v8;
    compact_cells = self->_compact_cells;
  }
  -[NSArray addObject:](compact_cells, "addObject:", v4);

}

- (unint64_t)compact_cellsCount
{
  return -[NSArray count](self->_compact_cells, "count");
}

- (id)compact_cellsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_compact_cells, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableRowCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFTableRowCardSection cells](self, "cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (-[_SFPBRFTableRowCardSection vertical_alignment](self, "vertical_alignment"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableRowCardSection scale_to_fit](self, "scale_to_fit"))
    PBDataWriterWriteBOOLField();
  -[_SFPBRFTableRowCardSection compact_cells](self, "compact_cells");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int vertical_alignment;
  int scale_to_fit;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[_SFPBRFTableRowCardSection cells](self, "cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_13;
  -[_SFPBRFTableRowCardSection cells](self, "cells");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFTableRowCardSection cells](self, "cells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_14;
  }
  else
  {

  }
  vertical_alignment = self->_vertical_alignment;
  if (vertical_alignment != objc_msgSend(v4, "vertical_alignment"))
    goto LABEL_14;
  scale_to_fit = self->_scale_to_fit;
  if (scale_to_fit != objc_msgSend(v4, "scale_to_fit"))
    goto LABEL_14;
  -[_SFPBRFTableRowCardSection compact_cells](self, "compact_cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compact_cells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFTableRowCardSection compact_cells](self, "compact_cells");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_17:
      v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    -[_SFPBRFTableRowCardSection compact_cells](self, "compact_cells");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compact_cells");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
LABEL_13:

  }
LABEL_14:
  v19 = 0;
LABEL_15:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_cells, "hash");
  if (self->_scale_to_fit)
    v5 = 2654435761;
  else
    v5 = 0;
  v4 = 2654435761 * self->_vertical_alignment;
  return v4 ^ v3 ^ v5 ^ -[NSArray hash](self->_compact_cells, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_cells, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = self->_cells;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("cells"));
  }
  if (-[NSArray count](self->_compact_cells, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = self->_compact_cells;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v12, "addObject:", v18);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("compactCells"));
  }
  if (self->_scale_to_fit)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFTableRowCardSection scale_to_fit](self, "scale_to_fit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("scaleToFit"));

  }
  if (self->_vertical_alignment)
  {
    v21 = -[_SFPBRFTableRowCardSection vertical_alignment](self, "vertical_alignment");
    if (v21 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E40420F8 + v21);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("verticalAlignment"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTableRowCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBRFTableRowCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTableRowCardSection *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBRFTableRowCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTableRowCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTableRowCardSection *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _SFPBRFTableCell *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  _SFPBRFTableCell *v24;
  _SFPBRFTableRowCardSection *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_SFPBRFTableRowCardSection;
  v5 = -[_SFPBRFTableRowCardSection init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cells"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v7 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v34 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[_SFPBRFTableCell initWithDictionary:]([_SFPBRFTableCell alloc], "initWithDictionary:", v13);
              -[_SFPBRFTableRowCardSection addCells:](v5, "addCells:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v10);
      }

      v6 = v7;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalAlignment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", objc_msgSend(v15, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scaleToFit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compactCells"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v16;
      v28 = v15;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = -[_SFPBRFTableCell initWithDictionary:]([_SFPBRFTableCell alloc], "initWithDictionary:", v23);
              -[_SFPBRFTableRowCardSection addCompact_cells:](v5, "addCompact_cells:", v24);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v20);
      }

      v15 = v28;
      v16 = v27;
    }
    v25 = v5;

  }
  return v5;
}

- (NSArray)cells
{
  return self->_cells;
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (BOOL)scale_to_fit
{
  return self->_scale_to_fit;
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

@end
