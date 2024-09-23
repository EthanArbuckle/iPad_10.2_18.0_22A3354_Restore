@implementation _SFPBRFTableHeaderCardSection

- (_SFPBRFTableHeaderCardSection)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFTableHeaderCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _SFPBRFTableColumnDefinition *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  _SFPBRFTableCell *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  _SFPBRFTableCell *v29;
  _SFPBRFTableHeaderCardSection *v30;
  _SFPBRFTableHeaderCardSection *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBRFTableHeaderCardSection init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "columns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v4, "columns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = -[_SFPBRFTableColumnDefinition initWithFacade:]([_SFPBRFTableColumnDefinition alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v10);
    }

    -[_SFPBRFTableHeaderCardSection setColumns:](v5, "setColumns:", v7);
    objc_msgSend(v4, "cells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "cells");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v18);
    }

    -[_SFPBRFTableHeaderCardSection setCells:](v5, "setCells:", v15);
    objc_msgSend(v4, "compact_cells");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "compact_cells");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = -[_SFPBRFTableCell initWithFacade:]([_SFPBRFTableCell alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v26);
    }

    v5 = v32;
    -[_SFPBRFTableHeaderCardSection setCompact_cells:](v32, "setCompact_cells:", v23);
    if (objc_msgSend(v4, "hasShould_repeat_header_in_flow_layout"))
      -[_SFPBRFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v32, "setShould_repeat_header_in_flow_layout:", objc_msgSend(v4, "should_repeat_header_in_flow_layout"));
    if (objc_msgSend(v4, "hasVertical_alignment"))
      -[_SFPBRFTableHeaderCardSection setVertical_alignment:](v32, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    v30 = v32;

  }
  return v5;
}

- (void)setColumns:(id)a3
{
  NSArray *v4;
  NSArray *columns;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  columns = self->_columns;
  self->_columns = v4;

}

- (void)clearColumns
{
  -[NSArray removeAllObjects](self->_columns, "removeAllObjects");
}

- (void)addColumns:(id)a3
{
  id v4;
  NSArray *columns;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  columns = self->_columns;
  v8 = v4;
  if (!columns)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_columns;
    self->_columns = v6;

    v4 = v8;
    columns = self->_columns;
  }
  -[NSArray addObject:](columns, "addObject:", v4);

}

- (unint64_t)columnsCount
{
  return -[NSArray count](self->_columns, "count");
}

- (id)columnsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_columns, "objectAtIndexedSubscript:", a3);
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

- (void)setShould_repeat_header_in_flow_layout:(int)a3
{
  self->_should_repeat_header_in_flow_layout = a3;
}

- (void)setVertical_alignment:(int)a3
{
  self->_vertical_alignment = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableHeaderCardSectionReadFrom(self, (uint64_t)a3);
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBRFTableHeaderCardSection columns](self, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  -[_SFPBRFTableHeaderCardSection cells](self, "cells");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  -[_SFPBRFTableHeaderCardSection compact_cells](self, "compact_cells");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (-[_SFPBRFTableHeaderCardSection should_repeat_header_in_flow_layout](self, "should_repeat_header_in_flow_layout"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBRFTableHeaderCardSection vertical_alignment](self, "vertical_alignment"))
    PBDataWriterWriteInt32Field();

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int should_repeat_header_in_flow_layout;
  int vertical_alignment;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_SFPBRFTableHeaderCardSection columns](self, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBRFTableHeaderCardSection columns](self, "columns");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFTableHeaderCardSection columns](self, "columns");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "columns");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBRFTableHeaderCardSection cells](self, "cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_SFPBRFTableHeaderCardSection cells](self, "cells");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFTableHeaderCardSection cells](self, "cells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cells");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_SFPBRFTableHeaderCardSection compact_cells](self, "compact_cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compact_cells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_SFPBRFTableHeaderCardSection compact_cells](self, "compact_cells");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFTableHeaderCardSection compact_cells](self, "compact_cells");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compact_cells");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  should_repeat_header_in_flow_layout = self->_should_repeat_header_in_flow_layout;
  if (should_repeat_header_in_flow_layout == objc_msgSend(v4, "should_repeat_header_in_flow_layout"))
  {
    vertical_alignment = self->_vertical_alignment;
    v22 = vertical_alignment == objc_msgSend(v4, "vertical_alignment");
    goto LABEL_18;
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_columns, "hash");
  v4 = -[NSArray hash](self->_cells, "hash");
  return v4 ^ v3 ^ -[NSArray hash](self->_compact_cells, "hash") ^ (2654435761
                                                                  * self->_should_repeat_header_in_flow_layout) ^ (2654435761 * self->_vertical_alignment);
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
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_cells, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v5 = self->_cells;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "dictionaryRepresentation");
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
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("cells"));
  }
  if (-[NSArray count](self->_columns, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = self->_columns;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "dictionaryRepresentation");
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
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("columns"));
  }
  if (-[NSArray count](self->_compact_cells, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = self->_compact_cells;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v20, "addObject:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("compactCells"));
  }
  if (self->_should_repeat_header_in_flow_layout)
  {
    v28 = -[_SFPBRFTableHeaderCardSection should_repeat_header_in_flow_layout](self, "should_repeat_header_in_flow_layout");
    if (v28 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = *(&off_1E4042178 + v28);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("shouldRepeatHeaderInFlowLayout"));

  }
  if (self->_vertical_alignment)
  {
    v30 = -[_SFPBRFTableHeaderCardSection vertical_alignment](self, "vertical_alignment");
    if (v30 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = *(&off_1E40420F8 + v30);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("verticalAlignment"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFTableHeaderCardSection dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBRFTableHeaderCardSection)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFTableHeaderCardSection *v5;
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
    self = -[_SFPBRFTableHeaderCardSection initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFTableHeaderCardSection)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFTableHeaderCardSection *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _SFPBRFTableColumnDefinition *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  _SFPBRFTableCell *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  _SFPBRFTableCell *v30;
  void *v31;
  void *v32;
  _SFPBRFTableHeaderCardSection *v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBRFTableHeaderCardSection;
  v5 = -[_SFPBRFTableHeaderCardSection init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("columns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v7 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v46 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = -[_SFPBRFTableColumnDefinition initWithDictionary:]([_SFPBRFTableColumnDefinition alloc], "initWithDictionary:", v13);
              -[_SFPBRFTableHeaderCardSection addColumns:](v5, "addColumns:", v14);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        }
        while (v10);
      }

      v6 = v7;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cells"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v42 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = -[_SFPBRFTableCell initWithDictionary:]([_SFPBRFTableCell alloc], "initWithDictionary:", v21);
              -[_SFPBRFTableHeaderCardSection addCells:](v5, "addCells:", v22);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        }
        while (v18);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compactCells"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v6;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v38;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = -[_SFPBRFTableCell initWithDictionary:]([_SFPBRFTableCell alloc], "initWithDictionary:", v29);
              -[_SFPBRFTableHeaderCardSection addCompact_cells:](v5, "addCompact_cells:", v30);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        }
        while (v26);
      }

      v6 = v35;
      v15 = v36;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldRepeatHeaderInFlowLayout"), v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v5, "setShould_repeat_header_in_flow_layout:", objc_msgSend(v31, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("verticalAlignment"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFTableHeaderCardSection setVertical_alignment:](v5, "setVertical_alignment:", objc_msgSend(v32, "intValue"));
    v33 = v5;

  }
  return v5;
}

- (NSArray)columns
{
  return self->_columns;
}

- (NSArray)cells
{
  return self->_cells;
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (int)should_repeat_header_in_flow_layout
{
  return self->_should_repeat_header_in_flow_layout;
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
