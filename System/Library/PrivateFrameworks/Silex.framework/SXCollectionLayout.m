@implementation SXCollectionLayout

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXCollectionLayout spaceBetweenRows](self, "spaceBetweenRows");
  objc_msgSend(v3, "appendFormat:", CFSTR("spaceBetweenRows: %f; "), v4);
  -[SXCollectionLayout rowsLayouts](self, "rowsLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rowLayouts (%lu)"), objc_msgSend(v5, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXCollectionLayout rowsLayouts](self, "rowsLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[SXCollectionLayout rowsLayouts](self, "rowsLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (double)spaceBetweenRows
{
  return self->_spaceBetweenRows;
}

- (void)setSpaceBetweenRows:(double)a3
{
  self->_spaceBetweenRows = a3;
}

- (NSArray)rowsLayouts
{
  return self->_rowsLayouts;
}

- (void)setRowsLayouts:(id)a3
{
  objc_storeStrong((id *)&self->_rowsLayouts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowsLayouts, 0);
}

@end
