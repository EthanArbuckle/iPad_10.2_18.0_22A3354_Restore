@implementation EDMergedCellCollection

- (id)referenceContainingRow:(int)a3 column:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[EDCollection count](self, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsRow:column:", v5, v4) & 1) != 0)
        break;

      if (v8 == ++v9)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
  return v10;
}

- (unint64_t)addObject:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isValidAreaReference") & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)EDMergedCellCollection;
    v5 = -[EDCollection addObject:](&v7, sel_addObject_, v4);
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

@end
