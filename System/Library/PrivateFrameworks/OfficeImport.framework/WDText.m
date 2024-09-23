@implementation WDText

- (WDText)initWithDocument:(id)a3 textType:(int)a4
{
  return -[WDText initWithDocument:textType:tableCell:](self, "initWithDocument:textType:tableCell:", a3, *(_QWORD *)&a4, 0);
}

- (WDText)initWithDocument:(id)a3 textType:(int)a4 tableCell:(id)a5
{
  id v8;
  id v9;
  WDText *v10;
  WDText *v11;
  NSMutableArray *v12;
  NSMutableArray *mBlocks;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WDText;
  v10 = -[WDText init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mDocument, v8);
    v11->mTextType = a4;
    objc_storeWeak((id *)&v11->mTableCell, v9);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mBlocks = v11->mBlocks;
    v11->mBlocks = v12;

  }
  return v11;
}

- (int)tableNestingLevel
{
  WDTableCell **p_mTableCell;
  id WeakRetained;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  int v11;

  p_mTableCell = &self->mTableCell;
  WeakRetained = objc_loadWeakRetained((id *)&self->mTableCell);

  if (!WeakRetained)
    return 1;
  if (-[WDText textType](self, "textType") == 4)
  {
    v5 = objc_loadWeakRetained((id *)p_mTableCell);
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "textType");

    if (v7 != 4)
      return 1;
  }
  v8 = objc_loadWeakRetained((id *)p_mTableCell);
  objc_msgSend(v8, "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "nestingLevel") + 1;

  return v11;
}

- (int)textType
{
  return self->mTextType;
}

- (id)addParagraph
{
  WDParagraph *v3;

  v3 = -[WDParagraph initWithText:]([WDParagraph alloc], "initWithText:", self);
  -[NSMutableArray addObject:](self->mBlocks, "addObject:", v3);
  return v3;
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (id)addTable
{
  WDTable *v3;

  v3 = -[WDTable initWithText:]([WDTable alloc], "initWithText:", self);
  -[NSMutableArray addObject:](self->mBlocks, "addObject:", v3);
  return v3;
}

- (WDTableCell)tableCell
{
  return (WDTableCell *)objc_loadWeakRetained((id *)&self->mTableCell);
}

- (void)removeLastCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a3;
  v5 = -[NSMutableArray count](self->mBlocks, "count");
  if (v5)
  {
    -[NSMutableArray objectAtIndex:](self->mBlocks, "objectAtIndex:", v5 - 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "blockType"))
    {
      v6 = v7;
      objc_msgSend(v6, "removeLastCharacter:", v3);
      if (!objc_msgSend(v6, "runCount"))
        -[NSMutableArray removeLastObject](self->mBlocks, "removeLastObject");

    }
  }
}

- (unint64_t)blockCount
{
  return -[NSMutableArray count](self->mBlocks, "count");
}

- (id)blockAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mBlocks, "objectAtIndex:", a3);
}

- (void)removeLastBlock
{
  -[NSMutableArray removeLastObject](self->mBlocks, "removeLastObject");
}

- (id)lastBlock
{
  return (id)-[NSMutableArray lastObject](self->mBlocks, "lastObject");
}

- (id)blocks
{
  return self->mBlocks;
}

- (unint64_t)indexOfBlock:(id)a3
{
  return -[NSMutableArray indexOfObjectIdenticalTo:](self->mBlocks, "indexOfObjectIdenticalTo:", a3);
}

- (void)addBlock:(id)a3
{
  -[NSMutableArray addObject:](self->mBlocks, "addObject:", a3);
}

- (id)addParagraphAtIndex:(int)a3
{
  WDParagraph *v5;

  v5 = -[WDParagraph initWithText:]([WDParagraph alloc], "initWithText:", self);
  -[NSMutableArray insertObject:atIndex:](self->mBlocks, "insertObject:atIndex:", v5, a3);
  return v5;
}

- (id)firstParagraph
{
  NSMutableArray *mBlocks;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  mBlocks = self->mBlocks;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__WDText_firstParagraph__block_invoke;
  v5[3] = &unk_24F39B5B0;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](mBlocks, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__WDText_firstParagraph__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = objc_opt_class();
  TSUDynamicCast(v6, (uint64_t)v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "blockType"))
  {
    v9 = objc_opt_class();
    TSUDynamicCast(v9, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (id)paragraphs
{
  void *v3;
  NSMutableArray *mBlocks;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mBlocks = self->mBlocks;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __20__WDText_paragraphs__block_invoke;
  v7[3] = &unk_24F3B1CB8;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](mBlocks, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __20__WDText_paragraphs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_opt_class();
  TSUDynamicCast(v3, (uint64_t)v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "blockType"))
  {
    v6 = objc_opt_class();
    TSUDynamicCast(v6, (uint64_t)v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
}

- (id)addTableAtIndex:(int)a3
{
  WDTable *v5;

  v5 = -[WDTable initWithText:]([WDTable alloc], "initWithText:", self);
  -[NSMutableArray insertObject:atIndex:](self->mBlocks, "insertObject:atIndex:", v5, a3);
  return v5;
}

- (id)blockIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mBlocks);
}

- (id)newBlockIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mBlocks);
}

- (id)runIterator
{
  WDBlockRunIterator *v3;
  void *v4;
  WDBlockRunIterator *v5;

  v3 = [WDBlockRunIterator alloc];
  -[WDText blockIterator](self, "blockIterator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WDCombinedIterator initWithParentIterator:](v3, "initWithParentIterator:", v4);

  return v5;
}

- (id)newRunIterator
{
  id v2;
  WDBlockRunIterator *v3;

  v2 = -[WDText newBlockIterator](self, "newBlockIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDBlockRunIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (BOOL)isEmpty
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  char v6;

  if (!-[NSMutableArray count](self->mBlocks, "count"))
    return 1;
  v3 = 0;
  v4 = 1;
  do
  {
    -[NSMutableArray objectAtIndex:](self->mBlocks, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEmpty");

    if ((v6 & 1) == 0)
      break;
    v3 = v4;
  }
  while (-[NSMutableArray count](self->mBlocks, "count") > (unint64_t)v4++);
  return v6;
}

- (id)content
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WDText newRunIterator](self, "newRunIterator");
  while (objc_msgSend(v4, "hasNext"))
  {
    objc_msgSend(v4, "next");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v6);

    }
  }

  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDText;
  -[WDText description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mTableCell);
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mBlocks, 0);
}

@end
