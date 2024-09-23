@implementation UAPasteboardItem

- (UAPasteboardItem)init
{
  UAPasteboardItem *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UAPasteboardItem;
  v2 = -[UAPasteboardItem init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    -[UAPasteboardItem setTypes:](v2, "setTypes:", v3);

  }
  return v2;
}

- (void)addType:(id)a3
{
  UAPasteboardItem *v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = 0;
  for (i = 0; ; ++i)
  {
    -[UAPasteboardItem types](v4, "types");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 <= i)
      goto LABEL_6;
    -[UAPasteboardItem types](v4, "types");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
      break;
    v5 += 0x100000000;
  }
  if ((_DWORD)i == -1)
  {
LABEL_6:
    -[UAPasteboardItem types](v4, "types");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAPasteboardItem setTypes:](v4, "setTypes:", v15);

    goto LABEL_8;
  }
  -[UAPasteboardItem types](v4, "types");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v14, "removeObjectAtIndex:", v5 >> 32);
  objc_msgSend(v14, "addObject:", v17);
  -[UAPasteboardItem setTypes:](v4, "setTypes:", v14);
LABEL_8:

  objc_sync_exit(v4);
}

- (id)description
{
  id v3;
  UAPasteboardItem *v4;
  unint64_t i;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = self;
  objc_sync_enter(v4);
  for (i = 0; ; ++i)
  {
    -[UAPasteboardItem types](v4, "types");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 <= i)
      break;
    -[UAPasteboardItem types](v4, "types");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (i)
    {
      -[UAPasteboardItem types](v4, "types");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count") - 1;

      objc_msgSend(v9, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (i == v11)
        objc_msgSend(v3, "appendFormat:", CFSTR("%@)"), v12);
      else
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v12);
    }
    else
    {
      objc_msgSend(v9, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("(%@, "), v12);
    }

  }
  objc_sync_exit(v4);

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (NSArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
}

@end
