@implementation ICValueHistory

- (id)firstValueBeforeTimestamp:(unint64_t)a3
{
  NSMutableArray *items;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15175;
  v11 = __Block_byref_object_dispose__15176;
  v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__ICValueHistory_firstValueBeforeTimestamp___block_invoke;
  v6[3] = &unk_1E438C7D0;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](items, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)firstValueAfterOrEqualToTimestamp:(unint64_t)a3
{
  NSMutableArray *items;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15175;
  v11 = __Block_byref_object_dispose__15176;
  v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ICValueHistory_firstValueAfterOrEqualToTimestamp___block_invoke;
  v6[3] = &unk_1E438C7D0;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__ICValueHistory_enumerateValuesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v7, "value");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "timestamp");

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v9, v8, a3, a4);
}

uint64_t __39__ICValueHistory_addValuesFromHistory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:timestamp:", a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_items, CFSTR("items"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableArray mutableCopyWithZone:](self->_items, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)addValuesFromHistory:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__ICValueHistory_addValuesFromHistory___block_invoke;
  v3[3] = &unk_1E438C780;
  v3[4] = self;
  objc_msgSend(a3, "enumerateValuesUsingBlock:", v3);
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *items;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  items = self->_items;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICValueHistory_enumerateValuesUsingBlock___block_invoke;
  v7[3] = &unk_1E438C7A8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v7);

}

void __52__ICValueHistory_firstValueAfterOrEqualToTimestamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(v9, "timestamp") >= *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v9, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (void)addValue:(id)a3 timestamp:(unint64_t)a4
{
  _ICValueHistoryItem *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSMutableArray *items;
  NSMutableArray *v13;
  NSMutableArray *v14;
  uint64_t v15;
  NSMutableArray *v16;
  _ICValueHistoryItem *v17;
  id v18;

  v18 = a3;
  v6 = -[_ICValueHistoryItem initWithValue:timestamp:]([_ICValueHistoryItem alloc], "initWithValue:timestamp:", v18, a4);
  v7 = -[NSMutableArray count](self->_items, "count");
  if (!v7)
  {
    items = self->_items;
    if (!items)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = self->_items;
      self->_items = v13;

      items = self->_items;
    }
    -[NSMutableArray addObject:](items, "addObject:", v6);
    goto LABEL_15;
  }
  v8 = v7 - 1;
  if (v7 < 1)
    goto LABEL_15;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "timestamp");

    if (v10 == a4)
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_items, "replaceObjectAtIndex:withObject:", v8, v6);
      goto LABEL_8;
    }
    if (v10 < a4)
    {
      v15 = v8 + 1;
      v16 = self->_items;
      v17 = v6;
      goto LABEL_14;
    }
    if (!v8)
      break;
LABEL_8:
    v11 = v8-- + 1;
    if (v11 <= 1)
      goto LABEL_15;
  }
  v16 = self->_items;
  v17 = v6;
  v15 = 0;
LABEL_14:
  -[NSMutableArray insertObject:atIndex:](v16, "insertObject:atIndex:", v17, v15);
LABEL_15:

}

void __44__ICValueHistory_firstValueBeforeTimestamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(v9, "timestamp") < *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v9, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (ICValueHistory)initWithCoder:(id)a3
{
  id v4;
  ICValueHistory *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *items;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICValueHistory;
  v5 = -[ICValueHistory init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("items"));
    v9 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSMutableArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)count
{
  return -[NSMutableArray count](self->_items, "count");
}

- (id)firstValueBeforeOrEqualToTimestamp:(unint64_t)a3
{
  NSMutableArray *items;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15175;
  v11 = __Block_byref_object_dispose__15176;
  v12 = 0;
  items = self->_items;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ICValueHistory_firstValueBeforeOrEqualToTimestamp___block_invoke;
  v6[3] = &unk_1E438C7D0;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](items, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)lastValue
{
  void *v2;
  void *v3;

  -[NSMutableArray lastObject](self->_items, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastValueAndTimestamp:(unint64_t *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableArray lastObject](self->_items, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      *a3 = objc_msgSend(v5, "timestamp");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeAllValues
{
  NSMutableArray *items;

  items = self->_items;
  self->_items = 0;

}

- (void)removeValuesBeforeTimestamp:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v5 = -[NSMutableArray count](self->_items, "count");
  if (v5 >= 1)
  {
    v6 = v5 + 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", v6 - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "timestamp");

      if (v8 < a3)
        -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", v6 - 2);
      --v6;
    }
    while (v6 > 1);
  }
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_items, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    items = self->_items;
    v6 = (NSMutableArray *)v4[1];
    if (items == v6)
    {
      v7 = 1;
    }
    else
    {
      v7 = 0;
      if (items && v6)
        v7 = -[NSMutableArray isEqual:](items, "isEqual:");
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__ICValueHistory_firstValueBeforeOrEqualToTimestamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(v9, "timestamp") <= *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v9, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

@end
