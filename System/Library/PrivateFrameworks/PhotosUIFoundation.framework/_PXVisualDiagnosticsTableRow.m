@implementation _PXVisualDiagnosticsTableRow

- (_PXVisualDiagnosticsTableRow)initWithTable:(id)a3 availableColumnIdentifiers:(id)a4
{
  id v6;
  id v7;
  _PXVisualDiagnosticsTableRow *v8;
  _PXVisualDiagnosticsTableRow *v9;
  uint64_t v10;
  NSSet *availableColumnIdentifiers;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *cellsByColumnIdentifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_PXVisualDiagnosticsTableRow;
  v8 = -[_PXVisualDiagnosticsTableRow init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_table, v6);
    v9->_height = 30.0;
    v10 = objc_msgSend(v7, "copy");
    availableColumnIdentifiers = v9->_availableColumnIdentifiers;
    v9->_availableColumnIdentifiers = (NSSet *)v10;

    v12 = objc_alloc(MEMORY[0x24BDBCED8]);
    v13 = -[NSSet count](v9->_availableColumnIdentifiers, "count");
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    v15 = objc_msgSend(v12, "initWithCapacity:", v14);
    cellsByColumnIdentifier = v9->_cellsByColumnIdentifier;
    v9->_cellsByColumnIdentifier = (NSMutableDictionary *)v15;

  }
  return v9;
}

- (void)addCellForColumnWithIdentifier:(id)a3 format:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v10);

  -[_PXVisualDiagnosticsTableRow addCellForColumnWithIdentifier:text:](self, "addCellForColumnWithIdentifier:text:", v8, v9);
}

- (void)addCellForColumnWithIdentifier:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  -[_PXVisualDiagnosticsTableRow table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultRowFontSize");
  v10 = v9;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke;
  v12[3] = &unk_2514CFFB8;
  v13 = v6;
  v14 = v10;
  v11 = v6;
  -[_PXVisualDiagnosticsTableRow addCellForColumnWithIdentifier:rendering:](self, "addCellForColumnWithIdentifier:rendering:", v7, v12);

}

- (void)addCellForColumnWithIdentifier:(id)a3 rendering:(id)a4
{
  id v7;
  NSSet *availableColumnIdentifiers;
  void *v9;
  void *v10;
  _PXVisualDiagnosticsTableCell *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  availableColumnIdentifiers = self->_availableColumnIdentifiers;
  if (availableColumnIdentifiers && !-[NSSet containsObject:](availableColumnIdentifiers, "containsObject:", v15))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_availableColumnIdentifiers containsObject:columnIdentifier]"));

  }
  -[_PXVisualDiagnosticsTableRow cellsByColumnIdentifier](self, "cellsByColumnIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVisualDiagnosticsTable.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.cellsByColumnIdentifier[columnIdentifier] == nil"));

  }
  v11 = -[_PXVisualDiagnosticsTableCell initWithRenderingBlock:]([_PXVisualDiagnosticsTableCell alloc], "initWithRenderingBlock:", v7);
  -[_PXVisualDiagnosticsTableRow cellsByColumnIdentifier](self, "cellsByColumnIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v15);

}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (PXVisualDiagnosticsTable)table
{
  return (PXVisualDiagnosticsTable *)objc_loadWeakRetained((id *)&self->_table);
}

- (NSMutableDictionary)cellsByColumnIdentifier
{
  return self->_cellsByColumnIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellsByColumnIdentifier, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_availableColumnIdentifiers, 0);
}

@end
