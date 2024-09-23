@implementation REDiffOperation

- (REDiffOperation)initWithType:(unint64_t)a3 item:(id)a4 toIndex:(int64_t)a5 fromIndex:(int64_t)a6
{
  id v11;
  REDiffOperation *v12;
  REDiffOperation *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)REDiffOperation;
  v12 = -[REDiffOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    objc_storeStrong(&v12->_item, a4);
    v13->_toIndex = a5;
    v13->_fromIndex = a6;
  }

  return v13;
}

+ (id)reloadWithItem:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:item:toIndex:fromIndex:", 0, v6, a4, 0x7FFFFFFFFFFFFFFFLL);

  return v7;
}

+ (id)insertWithItem:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:item:toIndex:fromIndex:", 1, v6, a4, 0x7FFFFFFFFFFFFFFFLL);

  return v7;
}

+ (id)deleteWithItem:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:item:toIndex:fromIndex:", 2, v6, 0x7FFFFFFFFFFFFFFFLL, a4);

  return v7;
}

+ (id)moveWithItem:(id)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:item:toIndex:fromIndex:", 3, v8, a5, a4);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  objc_super v13;

  switch(self->_type)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x24BDD17C8];
      -[REDiffOperation item](self, "item");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR(" Reload %@ (%ld)"), v4, -[REDiffOperation toIndex](self, "toIndex"), v12);
      goto LABEL_7;
    case 1uLL:
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[REDiffOperation item](self, "item");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR(" Insert %@ (%ld)"), v4, -[REDiffOperation toIndex](self, "toIndex"), v12);
      goto LABEL_7;
    case 2uLL:
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[REDiffOperation item](self, "item");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" Delete %@ (%ld)"), v4, -[REDiffOperation fromIndex](self, "fromIndex"), v12);
      goto LABEL_7;
    case 3uLL:
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[REDiffOperation item](self, "item");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR(" Move %@ (%ld → %ld)"), v4, -[REDiffOperation toIndex](self, "toIndex"), -[REDiffOperation fromIndex](self, "fromIndex"));
LABEL_7:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v5 = &stru_24CF92178;
      break;
  }
  v13.receiver = self;
  v13.super_class = (Class)REDiffOperation;
  -[REDiffOperation description](&v13, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)toIndex
{
  return self->_toIndex;
}

- (int64_t)fromIndex
{
  return self->_fromIndex;
}

- (id)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
}

@end
