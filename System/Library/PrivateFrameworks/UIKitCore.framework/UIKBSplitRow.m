@implementation UIKBSplitRow

- (UIKBSplitRow)init
{
  UIKBSplitRow *v2;
  uint64_t v3;
  NSMutableArray *keys;
  uint64_t v5;
  UIKBTree *keylistLeft;
  uint64_t v7;
  UIKBTree *geolistLeft;
  uint64_t v9;
  UIKBTree *attrlistLeft;
  uint64_t v11;
  UIKBTree *keylistRight;
  uint64_t v13;
  UIKBTree *geolistRight;
  uint64_t v15;
  UIKBTree *attrlistRight;
  UIKBSplitRow *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UIKBSplitRow;
  v2 = -[UIKBSplitRow init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    keys = v2->_keys;
    v2->_keys = (NSMutableArray *)v3;

    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 7);
    v5 = objc_claimAutoreleasedReturnValue();
    keylistLeft = v2->_keylistLeft;
    v2->_keylistLeft = (UIKBTree *)v5;

    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 7);
    v7 = objc_claimAutoreleasedReturnValue();
    geolistLeft = v2->_geolistLeft;
    v2->_geolistLeft = (UIKBTree *)v7;

    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 7);
    v9 = objc_claimAutoreleasedReturnValue();
    attrlistLeft = v2->_attrlistLeft;
    v2->_attrlistLeft = (UIKBTree *)v9;

    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 7);
    v11 = objc_claimAutoreleasedReturnValue();
    keylistRight = v2->_keylistRight;
    v2->_keylistRight = (UIKBTree *)v11;

    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 7);
    v13 = objc_claimAutoreleasedReturnValue();
    geolistRight = v2->_geolistRight;
    v2->_geolistRight = (UIKBTree *)v13;

    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 7);
    v15 = objc_claimAutoreleasedReturnValue();
    attrlistRight = v2->_attrlistRight;
    v2->_attrlistRight = (UIKBTree *)v15;

    v17 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UIKBSplitRow setHints:](self, "setHints:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIKBSplitRow;
  -[UIKBSplitRow dealloc](&v3, sel_dealloc);
}

- (void)addKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKBSplitRow keys](self, "keys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)setRowIndex:(unsigned __int8)a3
{
  uint64_t v4;

  self->_rowIndex = a3;
  v4 = (a3 + 1);
  -[UIKBTree setDisplayRowHint:](self->_keylistLeft, "setDisplayRowHint:", v4);
  -[UIKBTree setDisplayRowHint:](self->_keylistRight, "setDisplayRowHint:", v4);
  -[UIKBTree setDisplayRowHint:](self->_geolistLeft, "setDisplayRowHint:", v4);
  -[UIKBTree setDisplayRowHint:](self->_geolistRight, "setDisplayRowHint:", v4);
}

- (id)keyAtIndex:(int)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[UIKBSplitRow keys](self, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[UIKBSplitRow keys](self, "keys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)listOfType:(int)a3 left:(BOOL)a4
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  if (a3 == 2)
  {
    v4 = !a4;
    v5 = 112;
    v6 = 88;
  }
  else if (a3 == 1)
  {
    v4 = !a4;
    v5 = 104;
    v6 = 80;
  }
  else
  {
    if (a3)
      return 0;
    v4 = !a4;
    v5 = 96;
    v6 = 72;
  }
  if (!v4)
    v5 = v6;
  return *(id *)((char *)&self->super.isa + v5);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("row : %d\n"), -[UIKBSplitRow rowIndex](self, "rowIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIKBSplitRow keys](self, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (unsigned)rowIndex
{
  return self->_rowIndex;
}

- (double)rowOffset
{
  return self->_rowOffset;
}

- (void)setRowOffset:(double)a3
{
  self->_rowOffset = a3;
}

- (NSMutableArray)keys
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (double)rowWidth
{
  return self->_rowWidth;
}

- (void)setRowWidth:(double)a3
{
  self->_rowWidth = a3;
}

- (CGSize)defaultKeySize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_defaultKeySize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDefaultKeySize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_defaultKeySize, &v3, 16, 1, 0);
}

- (NSDictionary)hints
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attrlistRight, 0);
  objc_storeStrong((id *)&self->_geolistRight, 0);
  objc_storeStrong((id *)&self->_keylistRight, 0);
  objc_storeStrong((id *)&self->_attrlistLeft, 0);
  objc_storeStrong((id *)&self->_geolistLeft, 0);
  objc_storeStrong((id *)&self->_keylistLeft, 0);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_vacancies, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
