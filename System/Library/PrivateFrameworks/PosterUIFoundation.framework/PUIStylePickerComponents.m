@implementation PUIStylePickerComponents

- (PUIStylePickerComponents)initWithIndexSet:(id)a3
{
  id v4;
  PUIStylePickerComponents *v5;
  void *v6;
  void *v7;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *indexSet;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIStylePickerComponents;
  v5 = -[PUIStylePickerComponents init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (NSMutableIndexSet *)objc_opt_new();
    indexSet = v5->_indexSet;
    v5->_indexSet = v8;

  }
  return v5;
}

- (PUIStylePickerComponents)initWithComponents:(unint64_t)a3
{
  PUIStylePickerComponents *v3;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *indexSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIStylePickerComponents;
  v3 = -[PUIStylePickerComponents init](&v7, sel_init, a3);
  if (v3)
  {
    v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    indexSet = v3->_indexSet;
    v3->_indexSet = v4;

  }
  return v3;
}

- (PUIStylePickerComponents)init
{
  void *v3;
  PUIStylePickerComponents *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addIndex:", 1);
  objc_msgSend(v3, "addIndex:", 16);
  objc_msgSend(v3, "addIndex:", 8);
  objc_msgSend(v3, "addIndex:", 2);
  objc_msgSend(v3, "addIndex:", 4);
  v4 = -[PUIStylePickerComponents initWithIndexSet:](self, "initWithIndexSet:", v3);

  return v4;
}

- (PUIStylePickerComponents)initWithComponent:(unint64_t)a3
{
  void *v5;
  PUIStylePickerComponents *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addIndex:", a3);
  v6 = -[PUIStylePickerComponents initWithIndexSet:](self, "initWithIndexSet:", v5);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__PUIStylePickerComponents_description__block_invoke;
  v8[3] = &unk_25154C7C0;
  v9 = v4;
  v5 = v4;
  -[PUIStylePickerComponents enumerateComponents:](self, "enumerateComponents:", v8);
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("components"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __39__PUIStylePickerComponents_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  const __CFString *v3;

  v2 = *(void **)(a1 + 32);
  v3 = CFSTR("PUIStylePickerComponentFont");
  switch(a2)
  {
    case 1:
      return objc_msgSend(v2, "addObject:", v3);
    case 2:
      v3 = CFSTR("PUIStylePickerComponentNumberingSystem");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      v3 = CFSTR("PUIStylePickerComponentStyle");
      break;
    case 8:
      v3 = CFSTR("PUIStylePickerComponentTextLayout");
      break;
    default:
      if (a2 == 16)
        v3 = CFSTR("PUIStylePickerComponentTextAlignment");
      else
LABEL_6:
        v3 = CFSTR("(unknown PUIStylePickerComponent)");
      break;
  }
  return objc_msgSend(v2, "addObject:", v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIndexSet:", self->_indexSet);
}

- (id)componentsByAddingComponent:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)-[NSMutableIndexSet mutableCopy](self->_indexSet, "mutableCopy");
  objc_msgSend(v4, "addIndex:", a3);
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v4);

  return v5;
}

- (BOOL)containsComponent:(unint64_t)a3
{
  return -[NSMutableIndexSet containsIndex:](self->_indexSet, "containsIndex:", a3);
}

- (void)enumerateComponents:(id)a3
{
  id v4;
  NSMutableIndexSet *indexSet;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  indexSet = self->_indexSet;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__PUIStylePickerComponents_enumerateComponents___block_invoke;
  v7[3] = &unk_25154C7E8;
  v8 = v4;
  v6 = v4;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](indexSet, "enumerateIndexesUsingBlock:", v7);

}

uint64_t __48__PUIStylePickerComponents_enumerateComponents___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)numberOfComponents
{
  return -[NSMutableIndexSet count](self->_indexSet, "count");
}

- (unint64_t)hash
{
  return -[NSMutableIndexSet hash](self->_indexSet, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
}

@end
