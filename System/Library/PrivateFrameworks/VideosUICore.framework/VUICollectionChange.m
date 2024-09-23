@implementation VUICollectionChange

- (VUICollectionChange)initWithChangeKind:(unint64_t)a3 sourceIndexes:(id)a4 destinationIndexes:(id)a5
{
  id v8;
  id v9;
  VUICollectionChange *v10;
  VUICollectionChange *v11;
  uint64_t v12;
  NSIndexSet *sourceIndexes;
  uint64_t v14;
  NSIndexSet *destinationIndexes;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUICollectionChange;
  v10 = -[VUICollectionChange init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_changeKind = a3;
    v12 = objc_msgSend(v8, "copy");
    sourceIndexes = v11->_sourceIndexes;
    v11->_sourceIndexes = (NSIndexSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    destinationIndexes = v11->_destinationIndexes;
    v11->_destinationIndexes = (NSIndexSet *)v14;

  }
  return v11;
}

- (NSIndexSet)destinationIndexes
{
  return self->_destinationIndexes;
}

- (unint64_t)changeKind
{
  return self->_changeKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateChangeSet, 0);
  objc_storeStrong((id *)&self->_destinationIndexes, 0);
  objc_storeStrong((id *)&self->_sourceIndexes, 0);
}

- (VUICollectionChange)init
{
  return -[VUICollectionChange initWithChangeKind:sourceIndexes:destinationIndexes:](self, "initWithChangeKind:sourceIndexes:destinationIndexes:", 0, 0, 0);
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
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
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21.receiver = self;
  v21.super_class = (Class)VUICollectionChange;
  -[VUICollectionChange description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = -[VUICollectionChange changeKind](self, "changeKind");
  if (v5 > 4)
    v6 = 0;
  else
    v6 = off_1E9F2BD78[v5];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("changeKind"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChange sourceIndexes](self, "sourceIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sourceIndexes"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChange destinationIndexes](self, "destinationIndexes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("destinationIndexes"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollectionChange updateChangeSet](self, "updateChangeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("updateChangeSet"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@>"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSIndexSet)sourceIndexes
{
  return self->_sourceIndexes;
}

- (VUICollectionChangeSet)updateChangeSet
{
  return self->_updateChangeSet;
}

- (void)setUpdateChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_updateChangeSet, a3);
}

@end
