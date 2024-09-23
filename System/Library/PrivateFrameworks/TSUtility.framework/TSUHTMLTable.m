@implementation TSUHTMLTable

+ (id)htmlTable
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (TSUHTMLTable)init
{
  TSUHTMLTable *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUHTMLTable;
  v2 = -[TSUHTMLTable init](&v4, sel_init);
  if (v2)
  {
    v2->_columnAttributes = (NSMutableDictionary *)objc_opt_new();
    v2->_cellAttributes = (NSMutableDictionary *)objc_opt_new();
    v2->_rowClasses = (NSMutableDictionary *)objc_opt_new();
    v2->_columnHeaders = (NSMutableArray *)objc_opt_new();
    v2->_rows = (NSMutableArray *)objc_opt_new();
    v2->_rowClassStride = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUHTMLTable;
  -[TSUHTMLTable dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_rows, "count");
}

- (unint64_t)lastRowIndex
{
  return -[NSMutableArray count](self->_rows, "count") - 1;
}

+ (id)_keyForCell:(unint64_t)a3 :(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu,%lu"), a3, a4);
}

+ (id)_attributesStringFromAttributes:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(a3, "count"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__TSUHTMLTable__attributesStringFromAttributes___block_invoke;
    v6[3] = &unk_24D61B130;
    v6[4] = v4;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return v4;
}

uint64_t __48__TSUHTMLTable__attributesStringFromAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@='%@'"), a2, a3);
}

- (id)markup
{
  void *v3;
  NSMutableArray *columnHeaders;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  unint64_t rowClassStride;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *context;
  NSMutableArray *obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  __int128 v32;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  context = (void *)MEMORY[0x219A023B0]();
  objc_msgSend(v3, "appendFormat:", CFSTR("<table>\n"));
  if (-[NSMutableArray count](self->_columnHeaders, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("<thead>\n"));
    objc_msgSend(v3, "appendFormat:", CFSTR("<tr class='header'>\n"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    columnHeaders = self->_columnHeaders;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columnHeaders, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v41 != v7)
            objc_enumerationMutation(columnHeaders);
          objc_msgSend(v3, "appendFormat:", CFSTR("<td>%@</td>"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columnHeaders, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v6);
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("</tr>\n"));
    objc_msgSend(v3, "appendFormat:", CFSTR("</thead>\n"));
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_rows;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v29)
  {
    v31 = 0;
    v28 = *(_QWORD *)v37;
    v9 = v3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        v12 = (const __CFString *)-[NSMutableDictionary objectForKey:](self->_rowClasses, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31));
        if (!v12)
        {
          rowClassStride = self->_rowClassStride;
          if (rowClassStride)
          {
            if (((v31 / rowClassStride) & 1) != 0)
              v12 = CFSTR("b");
            else
              v12 = CFSTR("a");
          }
          else
          {
            v12 = CFSTR("a");
          }
        }
        v30 = v10;
        objc_msgSend(v3, "appendFormat:", CFSTR("<tr class='%@'>"), v12);
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v11);
              v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
              v20 = (void *)-[NSMutableDictionary objectForKey:](self->_columnAttributes, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16 + j));
              if (v20)
                v21 = (id)objc_msgSend(v20, "mutableCopy");
              else
                v21 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v22 = v21;
              v23 = -[NSMutableDictionary objectForKey:](self->_cellAttributes, "objectForKey:", objc_msgSend((id)objc_opt_class(), "_keyForCell::", v31, v16 + j));
              if (v23)
                objc_msgSend(v22, "addEntriesFromDictionary:", v23);
              v24 = objc_msgSend((id)objc_opt_class(), "_attributesStringFromAttributes:", v22);
              v3 = v9;
              objc_msgSend(v9, "appendFormat:", CFSTR("<td%@>%@</td>"), v24, v19);
            }
            v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            v16 += j;
          }
          while (v15);
        }
        objc_msgSend(v3, "appendFormat:", CFSTR("</tr>\n"));
        ++v31;
        v10 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v29);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("</table>\n"));
  objc_autoreleasePoolPop(context);
  return v3;
}

- (void)addRowWithCellMarkup:(id)a3
{
  -[NSMutableArray addObject:](self->_rows, "addObject:", (id)objc_msgSend(a3, "copy"));
}

- (void)addRowWithCellText:(id)a3
{
  -[TSUHTMLTable addRowWithCellMarkup:](self, "addRowWithCellMarkup:", objc_msgSend(a3, "tsu_arrayByTransformingWithBlock:", &__block_literal_global_6));
}

uint64_t __35__TSUHTMLTable_addRowWithCellText___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_msgSend(a2, "tsu_arrayByFlattening"), "componentsJoinedByString:", &stru_24D61C228);
  else
    return objc_msgSend(a2, "tsu_escapeXML");
}

- (void)setColumnClasses:(id)a3
{
  unint64_t v5;

  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    do
    {
      -[TSUHTMLTable setClass:ofColumnIndex:](self, "setClass:ofColumnIndex:", objc_msgSend(a3, "objectAtIndexedSubscript:", v5), v5);
      ++v5;
    }
    while (v5 < objc_msgSend(a3, "count"));
  }
}

- (void)setRowClass:(id)a3 atRowIndex:(unint64_t)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_rowClasses, "setObject:forKey:", a3, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4));
}

- (void)setColumnHeaders:(id)a3
{
  unint64_t v5;

  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_columnHeaders, "setObject:atIndexedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", v5), v5);
      ++v5;
    }
    while (v5 < objc_msgSend(a3, "count"));
  }
}

- (void)setClass:(id)a3 ofColumnIndex:(unint64_t)a4
{
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[NSMutableDictionary tsu_objectForKey:withDefaultOfClass:](self->_columnAttributes, "tsu_objectForKey:withDefaultOfClass:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4), objc_opt_class());
  v6 = CFSTR("class");
  v7[0] = a3;
  objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (void)setCellMarkup:(id)a3 atRowIndex:(unint64_t)a4 columnIndex:(unint64_t)a5
{
  id v9;

  v9 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a4), "mutableCopy");
  objc_msgSend(v9, "setObject:atIndexedSubscript:", a3, a5);
  -[NSMutableArray setObject:atIndexedSubscript:](self->_rows, "setObject:atIndexedSubscript:", v9, a4);
}

- (void)setCellAttributes:(id)a3 rowIndex:(unint64_t)a4 columnIndex:(unint64_t)a5
{
  -[NSMutableDictionary setObject:forKey:](self->_cellAttributes, "setObject:forKey:", a3, objc_msgSend((id)objc_opt_class(), "_keyForCell::", a4, a5));
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  NSMutableArray *rows;
  _QWORD v4[5];

  rows = self->_rows;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__TSUHTMLTable_enumerateRowsUsingBlock___block_invoke;
  v4[3] = &unk_24D61B480;
  v4[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](rows, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __40__TSUHTMLTable_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)indexOfColumnWithTitle:(id)a3
{
  unint64_t v5;

  if (!-[NSMutableArray count](self->_columnHeaders, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  while ((objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_columnHeaders, "objectAtIndexedSubscript:", v5), "isEqualToString:", a3) & 1) == 0)
  {
    if (++v5 >= -[NSMutableArray count](self->_columnHeaders, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)deleteColumnWithTitle:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;

  v4 = -[TSUHTMLTable indexOfColumnWithTitle:](self, "indexOfColumnWithTitle:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[NSMutableArray removeObjectAtIndex:](self->_columnHeaders, "removeObjectAtIndex:", v4);
    v6 = -[NSMutableArray count](self->_rows, "count");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", i), "mutableCopy");
        objc_msgSend(v9, "removeObjectAtIndex:", v5);
        -[NSMutableArray setObject:atIndexedSubscript:](self->_rows, "setObject:atIndexedSubscript:", v9, i);
      }
    }
  }
}

- (unint64_t)rowClassStride
{
  return self->_rowClassStride;
}

- (void)setRowClassStride:(unint64_t)a3
{
  self->_rowClassStride = a3;
}

@end
