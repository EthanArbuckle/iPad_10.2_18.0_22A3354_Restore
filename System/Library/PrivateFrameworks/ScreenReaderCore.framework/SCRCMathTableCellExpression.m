@implementation SCRCMathTableCellExpression

- (void)_getTableDataIfNecessary
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_didGetTablePosition)
  {
    -[SCRCMathExpression parent](self, "parent");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "children");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObjectIdenticalTo:", self) + 1;
    objc_msgSend(v7, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_rowIndex = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v7) + 1;
    self->_columnIndex = v4;
    self->_tableRowCount = objc_msgSend(v6, "count");
    self->_tableColumnCount = objc_msgSend(v3, "count");
    self->_didGetTablePosition = 1;

  }
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v29;
  objc_super v30;

  v4 = a4;
  -[SCRCMathTableCellExpression _getTableDataIfNecessary](self, "_getTableDataIfNecessary");
  if (self->_tableColumnCount == 1)
  {
    v7 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("math.row.formatter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1458];
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = 48;
LABEL_5:
    objc_msgSend(v10, "numberWithInteger:", *(Class *)((char *)&self->super.super.super.super.isa + v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrcStringWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrcStringWithFormat:", v8, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x24BDD1458];
  if (self->_tableRowCount == 1)
  {
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("math.column.formatter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1458];
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = 56;
    goto LABEL_5;
  }
  -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("math.row.and.column.formatter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD1458];
  v29 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_rowIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scrcStringWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD1458];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_columnIndex);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scrcStringWithString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrcStringWithFormat:", v8, v14, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v29;
LABEL_7:

  v30.receiver = self;
  v30.super_class = (Class)SCRCMathTableCellExpression;
  -[SCRCMathRowExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](&v30, sel_speakableDescriptionWithSpeakingStyle_arePausesAllowed_, a3, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "length"))
  {
    v22 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("empty.content"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scrcStringWithString:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v24;
  }
  v25 = (void *)MEMORY[0x24BDD1458];
  -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("math.row.column.with.content.formatter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scrcStringWithFormat:", v26, v15, v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SCRCMathTableCellExpression;
  -[SCRCMathArrayExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v21, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x24BDD1458];
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[SCRCMathTableCellExpression _prefixForCell](self, "_prefixForCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("empty.content"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathTableCellExpression _suffixForCell](self, "_suffixForCell");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@%@"), v13, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scrcStringWithString:treePosition:", v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v19;
  }

  return v9;
}

- (id)_prefixForCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[SCRCMathTableCellExpression _getTableDataIfNecessary](self, "_getTableDataIfNecessary");
  if (self->_tableColumnCount == 1)
  {
    v3 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("segment.table.row.prefix.formatter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1458];
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = 48;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1458];
    if (self->_tableRowCount != 1)
    {
      -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("segment.table.row.column.prefix.formatter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD1458];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_rowIndex);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrcStringWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1458];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_columnIndex);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scrcStringWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scrcStringWithFormat:", v4, v10, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("segment.table.column.prefix.formatter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1458];
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = 56;
  }
  objc_msgSend(v6, "numberWithInteger:", *(Class *)((char *)&self->super.super.super.super.isa + v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrcStringWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrcStringWithFormat:", v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

- (id)_suffixForCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[SCRCMathTableCellExpression _getTableDataIfNecessary](self, "_getTableDataIfNecessary");
  if (self->_tableColumnCount == 1)
  {
    v3 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("segment.table.row.suffix.formatter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1458];
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = 48;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1458];
    if (self->_tableRowCount != 1)
    {
      -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("segment.table.row.column.suffix.formatter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD1458];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_rowIndex);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrcStringWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1458];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_columnIndex);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scrcStringWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scrcStringWithFormat:", v4, v10, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("segment.table.column.suffix.formatter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1458];
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = 56;
  }
  objc_msgSend(v6, "numberWithInteger:", *(Class *)((char *)&self->super.super.super.super.isa + v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrcStringWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrcStringWithFormat:", v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v11;
}

- (id)mathMLTag
{
  return CFSTR("mtd");
}

@end
