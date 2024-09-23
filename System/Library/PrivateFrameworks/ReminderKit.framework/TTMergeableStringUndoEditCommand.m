@implementation TTMergeableStringUndoEditCommand

- (TTMergeableStringUndoEditCommand)init
{
  TTMergeableStringUndoEditCommand *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTMergeableStringUndoEditCommand;
  v2 = -[TTMergeableStringUndoEditCommand init](&v6, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v2->_deleteRanges = v3;
    v4 = (_QWORD *)operator new();
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
    v2->_insertStrings = v4;
  }
  return v2;
}

- (void)dealloc
{
  void *deleteRanges;
  void *insertStrings;
  objc_super v5;
  void **v6;

  deleteRanges = self->_deleteRanges;
  if (deleteRanges)
  {
    v6 = (void **)self->_deleteRanges;
    std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x1B5E3DB94](deleteRanges, 0x20C40960023A9);
  }
  insertStrings = self->_insertStrings;
  if (insertStrings)
  {
    v6 = (void **)self->_insertStrings;
    std::vector<std::pair<TopoIDRange,NSDictionary * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x1B5E3DB94](insertStrings, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)TTMergeableStringUndoEditCommand;
  -[TTMergeableStringUndoEditCommand dealloc](&v5, sel_dealloc);
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t *deleteRanges;
  TopoIDRange *v8;
  TopoIDRange *v9;
  unsigned int var1;
  unsigned int v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  deleteRanges = (uint64_t *)self->_deleteRanges;
  v8 = (TopoIDRange *)*deleteRanges;
  v9 = (TopoIDRange *)deleteRanges[1];
  if ((TopoIDRange *)*deleteRanges != v9)
  {
    do
      updateTopoIDRange(v8++, a3, (uint64_t)a4, &v18);
    while (v8 != v9);
    deleteRanges = (uint64_t *)self->_deleteRanges;
  }
  if (deleteRanges != &v18)
    std::vector<TopoIDRange>::__assign_with_size[abi:ne180100]<TopoIDRange*,TopoIDRange*>((uint64_t)deleteRanges, v18, v19, 0xAAAAAAAAAAAAAAABLL * ((v19 - v18) >> 3));
  v15 = a3->var0.var0;
  var1 = a3->var1;
  v16 = a3->var0.var1;
  v17 = var1;
  v12 = a4->var0.var0;
  v11 = a4->var1;
  v13 = a4->var0.var1;
  v14 = v11;
  -[TTMergeableStringUndoEditCommand updateInsertTopoIDRange:toNewRangeID:](self, "updateInsertTopoIDRange:toNewRangeID:", &v15, &v12);
  v21 = (void **)&v18;
  std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v21);

}

- (BOOL)hasTopoIDsThatCanChange
{
  id **deleteRanges;
  id *v4;
  id *v5;
  id v6;
  id v7;
  id **insertStrings;
  id *v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  BOOL result;

  deleteRanges = (id **)self->_deleteRanges;
  v4 = *deleteRanges;
  v5 = deleteRanges[1];
  if (*deleteRanges == v5)
  {
LABEL_4:
    insertStrings = (id **)self->_insertStrings;
    v9 = *insertStrings;
    v10 = insertStrings[1];
    if (*insertStrings == v10)
    {
      return 0;
    }
    else
    {
      do
      {
        v11 = *v9;
        v12 = v9[3];
        +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        result = v11 == v13;
        v9 += 4;
      }
      while (v11 != v13 && v9 != v10);
    }
  }
  else
  {
    while (1)
    {
      v6 = *v4;
      +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
        return 1;
      v4 += 3;
      if (v4 == v5)
        goto LABEL_4;
    }
  }
  return result;
}

- (void)updateInsertTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t *insertStrings;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int var1;
  id v11;
  void *v12;
  BOOL v13;
  id v14[2];

  insertStrings = (uint64_t *)self->_insertStrings;
  v7 = *insertStrings;
  v8 = insertStrings[1];
  while (v7 != v8)
  {
    if ((objc_msgSend(*(id *)v7, "isEqual:", a3->var0.var0) & 1) != 0)
    {
      v9 = *(_DWORD *)(v7 + 8);
      var1 = a3->var0.var1;
      if (v9 >= var1 && (v9 != var1 || objc_msgSend(*(id *)v7, "TTCompare:", a3->var0.var0) != -1))
      {
        v11 = a3->var0.var0;
        v12 = (void *)(a3->var1 + a3->var0.var1);
        v14[0] = v11;
        v14[1] = v12;
        v13 = TopoID::operator>=(v7, v14);

        if (!v13)
        {
          objc_storeStrong((id *)v7, a4->var0.var0);
          *(_DWORD *)(v7 + 8) = *(_DWORD *)(v7 + 8) + a4->var0.var1 - a3->var0.var1;
        }
      }
    }
    v7 += 32;
  }

}

- (void)applyToString:(id)a3
{
  id v4;
  uint64_t *deleteRanges;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  void *__p;
  void *v14;
  uint64_t v15;
  id v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v4 = a3;
  deleteRanges = (uint64_t *)self->_deleteRanges;
  v7 = *deleteRanges;
  v6 = deleteRanges[1];
  if (v6 != *deleteRanges)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    do
    {
      v8 = *(id *)v7;
      v9 = *(_DWORD *)(v7 + 8);
      v10 = *(_DWORD *)(v7 + 16);
      v11 = v8;
      v12 = v11;
      v16 = v11;
      v17 = v9;
      v18 = v10;
      if (v4)
        objc_msgSend(v4, "getSubstrings:forTopoIDRange:", &v19, &v16);
      else

      v7 += 24;
    }
    while (v7 != v6);
    __p = 0;
    v14 = 0;
    v15 = 0;
    objc_msgSend(v4, "getCharacterRanges:forSubstrings:", &__p, &v19);
    objc_msgSend(v4, "deleteSubstrings:withCharacterRanges:", &v19, &__p);
    if (__p)
    {
      v14 = __p;
      operator delete(__p);
    }
    if (v19)
    {
      v20 = v19;
      operator delete(v19);
    }
  }
  if (*((_QWORD *)self->_insertStrings + 1) != *(_QWORD *)self->_insertStrings)
    objc_msgSend(v4, "undeleteSubstrings:");

}

- (BOOL)addToGroup:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  id v11;
  int v12;
  int v13;

  v4 = a3;
  v5 = -[TTMergeableStringUndoEditCommand deleteRanges](self, "deleteRanges");
  v6 = *v5;
  v7 = v5[1];
  while (v6 != v7)
  {
    v8 = *(id *)v6;
    v11 = v8;
    v9 = *(_DWORD *)(v6 + 16);
    v12 = *(_DWORD *)(v6 + 8);
    v13 = v9;
    if (v4)
      objc_msgSend(v4, "addSeenRange:", &v11);
    else

    v6 += 24;
  }

  return 1;
}

- (NSString)description
{
  id v3;
  uint64_t *deleteRanges;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t *insertStrings;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<TTMergeableStringUndoEditCommand %p Delete:"), self);
  deleteRanges = (uint64_t *)self->_deleteRanges;
  v5 = *deleteRanges;
  v6 = deleteRanges[1];
  if (*deleteRanges != v6)
  {
    do
    {
      objc_msgSend(*(id *)v5, "TTShortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@:%d-%u, "), v7, *(unsigned int *)(v5 + 8), (*(_DWORD *)(v5 + 8) + *(_DWORD *)(v5 + 16) - 1));

      v5 += 24;
    }
    while (v5 != v6);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("  Insert:"));
  insertStrings = (uint64_t *)self->_insertStrings;
  v9 = *insertStrings;
  v10 = insertStrings[1];
  if (*insertStrings != v10)
  {
    do
    {
      objc_msgSend(*(id *)v9, "TTShortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@:%d-%u=>'%@', "), v11, *(unsigned int *)(v9 + 8), (*(_DWORD *)(v9 + 8) + *(_DWORD *)(v9 + 16) - 1), *(_QWORD *)(v9 + 24));

      v9 += 32;
    }
    while (v9 != v10);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)deleteRanges
{
  return self->_deleteRanges;
}

- (void)insertStrings
{
  return self->_insertStrings;
}

@end
