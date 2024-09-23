@implementation TTMergeableString

- (CRTTCompatibleDocument)document
{
  return (CRTTCompatibleDocument *)objc_getAssociatedObject(self, (const void *)TTMergeableStringCRDataTypeCRDocumentKey);
}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "replica");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMergeableString setReplicaUUID:](self, "setReplicaUUID:", v5);

  v6 = objc_opt_class();
  REMDynamicCast(v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sharedTopotextTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTMergeableString setTimestamp:](self, "setTimestamp:", v9);

    objc_setAssociatedObject(self, (const void *)TTMergeableStringCRDataTypeCRDocumentKey, v8, 0);
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[TTMergeableString(CRDataType) setDocument:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)mergeWith:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid merge, classes must be equal for merge."), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
    -[TTMergeableString mergeWithString:mergeTimestamps:](self, "mergeWithString:mergeTimestamps:", v8, 0);
    -[TTMergeableString document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TTMergeableString document](self, "document");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringsWithClocksNeedingUpdating");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", self);

    }
  }

}

- (void)realizeLocalChangesIn:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[TTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges", a3);
  -[TTMergeableString document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TTMergeableString document](self, "document");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringsWithClocksToResetAfterRealizingLocalChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", self);

  }
}

- (TTMergeableString)init
{
  return -[TTMergeableString initWithReplicaID:asFragment:](self, "initWithReplicaID:asFragment:", 0, 0);
}

- (TTMergeableString)initWithReplicaID:(id)a3
{
  return -[TTMergeableString initWithReplicaID:asFragment:](self, "initWithReplicaID:asFragment:", a3, 0);
}

- (TTMergeableString)initWithReplicaID:(id)a3 asFragment:(BOOL)a4
{
  id v7;
  TTMergeableString *v8;
  TTMergeableString *v9;
  TTMergeableString *v10;
  uint64_t v11;
  uint64_t v12;
  TTVectorMultiTimestamp *v13;
  TTVectorMultiTimestamp *timestamp;
  uint64_t v15;
  NSHashTable *objectsNeedingUpdatedRanges;
  NSMutableAttributedString *v17;
  NSMutableAttributedString *attributedString;
  objc_super v20;
  uint64_t __src;
  uint64_t v22;
  TopoID v23;
  TopoID v24;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TTMergeableString;
  v8 = -[TTMergeableString init](&v20, sel_init);
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replicaUUID, a3);
    v10->_unserializedClock = 0;
    if (!a4)
    {
      v11 = operator new();
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v23.var0 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v23.var1 = 0;
      TopoSubstring::TopoSubstring((TopoSubstring *)v11, v23, 0, 0);
      v12 = operator new();
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v24.var0 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v24.var1 = 0xFFFFFFFFLL;
      TopoSubstring::TopoSubstring((TopoSubstring *)v12, v24, 0, 0);
      __src = v12;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v11 + 48), (char *)&__src, (uint64_t)&v22, 1uLL);
      *(_DWORD *)(v12 + 72) = 1;
      __src = v11;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)&v9->_startNodes, (char *)&__src, (uint64_t)&v22, 1uLL);
      __src = v12;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)&v9->_endNodes, (char *)&__src, (uint64_t)&v22, 1uLL);
    }
    v13 = -[TTVectorMultiTimestamp initWithCapacity:]([TTVectorMultiTimestamp alloc], "initWithCapacity:", 2);
    timestamp = v10->_timestamp;
    v10->_timestamp = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
    objectsNeedingUpdatedRanges = v10->_objectsNeedingUpdatedRanges;
    v10->_objectsNeedingUpdatedRanges = (NSHashTable *)v15;

    v10->_cacheInvalid = 1;
    v17 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
    attributedString = v10->_attributedString;
    v10->_attributedString = v17;

  }
  return v10;
}

- (void)dealloc
{
  TopoSubstring **begin;
  TopoSubstring **end;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t);
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  int v21;

  v13 = 0;
  v14 = &v13;
  v15 = 0x5812000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  v21 = 1065353216;
  begin = self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  if (begin == end)
  {
    v7 = (_QWORD *)&v19 + 1;
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = (uint64_t)*begin;
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __28__TTMergeableString_dealloc__block_invoke;
      v12[3] = &unk_1E67FA860;
      v12[4] = &v13;
      traverseUnordered(v6, v12);
      ++begin;
    }
    while (begin != end);
    v7 = v14 + 8;
  }
  v8 = (_QWORD *)*v7;
  if (*v7)
  {
    do
    {
      v9 = v8[2];
      if (v9)
      {
        v10 = *(void **)(v9 + 48);
        if (v10)
        {
          *(_QWORD *)(v9 + 56) = v10;
          operator delete(v10);
        }

        MEMORY[0x1B5E3DB94](v9, 0x1080C40D9F1C51ELL);
      }
      v8 = (_QWORD *)*v8;
    }
    while (v8);
  }
  _Block_object_dispose(&v13, 8);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v18 + 8);
  v11.receiver = self;
  v11.super_class = (Class)TTMergeableString;
  -[TTMergeableString dealloc](&v11, sel_dealloc);
}

_QWORD *__28__TTMergeableString_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v3, &v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  _BYTE v8[128];

  topotext::String::String((topotext::String *)v8);
  -[TTMergeableString saveToArchive:](self, "saveToArchive:", v8);
  v4 = objc_alloc((Class)objc_opt_class());
  -[TTMergeableString replicaUUID](self, "replicaUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArchive:andReplicaID:", v8, v5);

  topotext::String::~String((topotext::String *)v8);
  return v6;
}

+ (id)unserialisedReplicaID
{
  if (+[TTMergeableString unserialisedReplicaID]::predicate != -1)
    dispatch_once(&+[TTMergeableString unserialisedReplicaID]::predicate, &__block_literal_global_43);
  return (id)+[TTMergeableString unserialisedReplicaID]::TTUnserialisedReplicaID;
}

void __42__TTMergeableString_unserialisedReplicaID__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[TTMergeableString unserialisedReplicaID]::TTUnserialisedReplicaID;
  +[TTMergeableString unserialisedReplicaID]::TTUnserialisedReplicaID = v0;

}

- (id)string
{
  return self->_attributedString;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[TTMergeableString string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
  -[TTMergeableString insertAttributedString:atIndex:](self, "insertAttributedString:atIndex:", v6, a4);

}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  -[TTMergeableString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", location, length, v7);

}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  id v9;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  -[TTMergeableString delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "beginEditing");
  -[TTMergeableString beginEditing](self, "beginEditing");
  -[TTMergeableString deleteCharactersInRange:](self, "deleteCharactersInRange:", location, length);
  -[TTMergeableString insertAttributedString:atIndex:](self, "insertAttributedString:atIndex:", v9, location);
  -[TTMergeableString endEditing](self, "endEditing");
  if (v8)
    objc_msgSend(v8, "endEditing");

}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  void *__p;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v6 = operator new(0x10uLL);
    v8 = v6 + 2;
    v9 = v6 + 2;
    *v6 = location;
    v6[1] = length;
    __p = v6;
    -[TTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &v10, location, length);
    -[TTMergeableString deleteSubstrings:withCharacterRanges:](self, "deleteSubstrings:withCharacterRanges:", &v10, &__p);
    if (__p)
    {
      v8 = __p;
      operator delete(__p);
    }
    if (v10)
    {
      v11 = v10;
      operator delete(v10);
    }
  }
}

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  TopoSubstring *v9;
  TopoSubstring **begin;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  TopoSubstring *v17;
  void *v18;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
    goto LABEL_16;
  if (a4)
  {
    if (-[TTMergeableString length](self, "length") == a4)
    {
      v7 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v8 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v9 = *(TopoSubstring **)(v8[1] - *v8 + *v7 - 16);
      begin = self->_endNodes.__begin_;
      goto LABEL_14;
    }
    v12 = TTBoundedCheckedCastNSUIntegerToUInt32(a4);
    for (i = 0; ; i += 8)
    {
      v9 = *(TopoSubstring **)(*(_QWORD *)-[TTMergeableString orderedSubstrings](self, "orderedSubstrings") + i);
      if (!*((_BYTE *)v9 + 44))
      {
        v14 = *((_DWORD *)v9 + 4);
        v15 = v12 >= v14;
        v16 = v12 - v14;
        if (!v15)
        {
          v17 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v9, v12);
          -[TTMergeableString invalidateCache](self, "invalidateCache");
          goto LABEL_15;
        }
        v12 = v16;
        if (!(_DWORD)v16)
          break;
      }
    }
    v11 = *(_QWORD *)-[TTMergeableString orderedSubstrings](self, "orderedSubstrings") + i;
  }
  else
  {
    v9 = *self->_startNodes.__begin_;
    v11 = *(_QWORD *)-[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  }
  begin = (TopoSubstring **)(v11 + 8);
LABEL_14:
  v17 = *begin;
LABEL_15:
  -[TTMergeableString insertAttributedString:after:before:](self, "insertAttributedString:after:before:", v6, v9, v17);

LABEL_16:
}

- (void)beginEditing
{
  ++self->_editCount;
}

- (void)endEditing
{
  unint64_t editCount;
  unint64_t v3;

  editCount = self->_editCount;
  if (editCount)
  {
    v3 = editCount - 1;
    self->_editCount = v3;
    if (!v3)
      -[TTMergeableString coalesce](self, "coalesce");
  }
}

- (id)replicaUUIDForCharacterAtIndex:(unint64_t)a3
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  id v13;

  v4 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v5 = *v4;
  v6 = v4[1];
  if (*v4 != v6)
  {
    v7 = 0;
    do
    {
      v8 = *v5;
      if (*(_BYTE *)(*v5 + 44))
      {
        v9 = v7;
      }
      else
      {
        v10 = *(unsigned int *)(v8 + 16);
        v9 = v7 + v10;
        v11 = a3 >= v7;
        v12 = a3 - v7;
        if (v11 && v12 < v10)
        {
          v13 = *(id *)v8;
          return v13;
        }
      }
      ++v5;
      v7 = v9;
    }
    while (v5 != v6);
  }
  v13 = 0;
  return v13;
}

- (id)selectionForCharacterRanges:(id)a3
{
  -[TTMergeableString selectionForCharacterRanges:selectionAffinity:](self, "selectionForCharacterRanges:selectionAffinity:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4
{
  id v6;
  TTMergeableStringSelection *v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  BOOL v20;
  _BOOL4 v21;
  int v22;
  id v23;
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  TTMergeableStringSelection *v30;
  id v31;
  int v32;
  void *v33;
  int v34;
  uint64_t *v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v40;
  id v41;
  unint64_t v42;
  uint64_t *v43;
  id v44;
  int v45;
  id v46;
  int v47;

  v6 = a3;
  v7 = objc_alloc_init(TTMergeableStringSelection);
  v42 = a4;
  -[TTMergeableStringSelection setSelectionAffinity:](v7, "setSelectionAffinity:", a4);
  if (!objc_msgSend(v6, "count"))
    goto LABEL_36;
  v8 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v9 = *v8;
  v40 = v8[1];
  if (*v8 == v40)
    goto LABEL_36;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  v41 = v6;
  do
  {
    v13 = *v9;
    if (*(_BYTE *)(*v9 + 44))
      goto LABEL_35;
    v43 = v9;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "rangeValue");
      v17 = v16;

      if (v12)
        break;
      v22 = v15 + v17;
      if (v10 + (unint64_t)*(unsigned int *)(v13 + 16) <= v15 + v17 - 1)
      {
        v12 = 0;
        goto LABEL_33;
      }
      v23 = *(id *)v13;
      v24 = *(_DWORD *)(v13 + 8) + v22 + ~(_DWORD)v10;
      v25 = *(_QWORD *)(-[TTMergeableStringSelection selectionRanges](v7, "selectionRanges") + 8);
      v26 = *(void **)(v25 - 16);
      *(_QWORD *)(v25 - 16) = v23;
      v27 = v23;

      *(_DWORD *)(v25 - 8) = v24;
      v28 = 1;
      v12 = 1;
LABEL_29:

      v9 = v43;
      v11 += v28;
      if (v11 >= objc_msgSend(v6, "count"))
        goto LABEL_33;
    }
    v12 = v17 == 0;
    if (v17 | v42)
      v18 = 1;
    else
      v18 = v15 == 0;
    v19 = !v18;
    if (v42 || v10 != v15)
    {
      v21 = 0;
      if (v42 == 1)
      {
        v20 = 0;
        if (v10 == v15)
        {
          v21 = 0;
          v20 = *(_QWORD *)(v13 + 56) == *(_QWORD *)(v13 + 48);
        }
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
      v21 = *(_DWORD *)(v13 + 72) == 0;
    }
    v29 = v15 - v19;
    if (v10 + (unint64_t)*(unsigned int *)(v13 + 16) > v29 || v20 || v21)
    {
      v30 = v7;
      v31 = *(id *)v13;
      v32 = *(_DWORD *)(v13 + 8);
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32 + v29 - v10;
      v27 = v31;
      v44 = v27;
      v45 = v34;
      v46 = v33;
      v47 = 0;
      v35 = -[TTMergeableStringSelection selectionRanges](v30, "selectionRanges");
      v36 = v35;
      v37 = v35[1];
      if (v37 >= v35[2])
      {
        v38 = std::vector<std::pair<TopoID,TopoID>>::__push_back_slow_path<std::pair<TopoID,TopoID> const&>(v35, (uint64_t)&v44);
      }
      else
      {
        *(_QWORD *)v37 = v44;
        *(_DWORD *)(v37 + 8) = v45;
        *(_QWORD *)(v37 + 16) = v46;
        *(_DWORD *)(v37 + 24) = v47;
        v38 = v37 + 32;
        v36[1] = v37 + 32;
      }
      v7 = v30;
      v28 = v17 == 0;
      v36[1] = v38;

      v6 = v41;
      goto LABEL_29;
    }
    v12 = 1;
    v6 = v41;
LABEL_33:
    if (v11 >= objc_msgSend(v6, "count"))
      break;
    v10 += *(unsigned int *)(v13 + 16);
LABEL_35:
    ++v9;
  }
  while (v9 != v40);
LABEL_36:

  return v7;
}

- (id)characterRangesForSelection:(id)a3
{
  -[TTMergeableString characterRangesForSelection:selectedSubstringsBlock:](self, "characterRangesForSelection:selectedSubstringsBlock:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4
{
  NSUInteger v4;
  id v6;
  void (**v7)(id, _QWORD, NSUInteger, NSUInteger);
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  NSUInteger v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  void (**v15)(id, _QWORD, NSUInteger, NSUInteger);
  uint64_t v16;
  id v17;
  unsigned int v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  int v23;
  unsigned int v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  NSUInteger v35;
  NSUInteger v36;
  NSRange v37;
  uint64_t v38;
  void *v39;
  _QWORD *v42;
  _QWORD *v43;
  id v44;
  void *v45;
  _QWORD v46[2];
  NSRange v47;
  NSRange v48;

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSUInteger, NSUInteger))a4;
  v45 = v6;
  v8 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
  if (v8[1] == *v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v44 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_50;
  }
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v10 = (_QWORD *)*v9;
  v42 = (_QWORD *)v9[1];
  if ((_QWORD *)*v9 != v42)
  {
    v11 = 0;
    v12 = 0;
    v13 = 1;
    while (1)
    {
      v43 = v10;
      v14 = *v10;
      while (1)
      {
        v15 = v7;
        v16 = *(_QWORD *)objc_msgSend(v45, "selectionRanges") + 32 * v12;
        v17 = *(id *)v16;
        v18 = *(_DWORD *)(v16 + 8);
        v19 = *(id *)(v16 + 16);
        v20 = v19;
        v21 = *(_DWORD *)(v16 + 24);
        v22 = *(id *)v14;
        if ((v13 & 1) != 0)
          break;
        if (!objc_msgSend(v19, "isEqual:", v22))
          goto LABEL_37;
        v30 = *(_DWORD *)(v14 + 8);
        if (v21 < v30 || v21 >= *(_DWORD *)(v14 + 16) + v30)
          goto LABEL_37;
        if (*(_BYTE *)(v14 + 44))
          v31 = 0;
        else
          v31 = v21 - v30 + 1;
        v7 = v15;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, v11 + v31 - v4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v32);

        ++v12;
        if (v15)
          v15[2](v15, v14, 0, v31);
        v13 = 1;
LABEL_35:

        v33 = (_QWORD *)objc_msgSend(v45, "selectionRanges");
        if (v12 >= (uint64_t)(v33[1] - *v33) >> 5)
          goto LABEL_38;
      }
      v23 = objc_msgSend(v17, "isEqual:", v22);
      v24 = *(_DWORD *)(v14 + 8);
      v25 = v18 >= v24 ? v23 : 0;
      if (v25 == 1 && v18 < *(_DWORD *)(v14 + 16) + v24
        || v24 == v18 && objc_msgSend(*(id *)v14, "isEqual:", v17))
      {
        break;
      }
LABEL_37:

      v7 = v15;
LABEL_38:
      v34 = (_QWORD *)objc_msgSend(v45, "selectionRanges");
      if (v12 < (uint64_t)(v34[1] - *v34) >> 5)
      {
        if (!((v7 == 0) | v13 & 1))
        {
          if (*(_BYTE *)(v14 + 44))
            v35 = 0;
          else
            v35 = *(unsigned int *)(v14 + 16);
          v36 = *(unsigned int *)(v14 + 40);
          v48.length = -[TTMergeableString length](self, "length") - v4;
          v47.location = v36;
          v47.length = v35;
          v48.location = v4;
          v37 = NSIntersectionRange(v47, v48);
          v7[2](v7, v14, v37.location, v37.length);
        }
        v38 = *(_BYTE *)(v14 + 44) ? 0 : *(unsigned int *)(v14 + 16);
        v11 += v38;
        v10 = v43 + 1;
        if (v43 + 1 != v42)
          continue;
      }
      goto LABEL_50;
    }
    v4 = v11;
    if (!*(_BYTE *)(v14 + 44))
      v4 = v11 + v18 - *(_DWORD *)(v14 + 8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v20, "isEqual:", v26);
    if (v21)
      v28 = 0;
    else
      v28 = v27;

    if (v28 == 1)
    {
      if (!*(_BYTE *)(v14 + 44) && !objc_msgSend(v45, "selectionAffinity") && *(_DWORD *)(v14 + 72))
        ++v4;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v29);

      ++v12;
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    v7 = v15;
    goto LABEL_35;
  }
LABEL_50:

  return v44;
}

- (BOOL)shouldInvalidateCachedSubstringsWithTimestamp:(id)a3
{
  return 0;
}

- (void)setTimestamp:(id)a3
{
  unint64_t replicaTextClock;
  unint64_t v6;
  unint64_t v7;
  unint64_t replicaStyleClock;
  unint64_t v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_timestamp, a3);
  if (-[TTMergeableString shouldInvalidateCachedSubstringsWithTimestamp:](self, "shouldInvalidateCachedSubstringsWithTimestamp:", v11))
  {
    -[TTMergeableString invalidateCache](self, "invalidateCache");
    -[TTMergeableString updateClock](self, "updateClock");
    replicaTextClock = self->_replicaTextClock;
    v6 = -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0);
    if (replicaTextClock <= v6)
      v7 = v6;
    else
      v7 = replicaTextClock;
    self->_replicaTextClock = v7;
    replicaStyleClock = self->_replicaStyleClock;
    v9 = -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 1);
    if (replicaStyleClock <= v9)
      v10 = v9;
    else
      v10 = replicaStyleClock;
    self->_replicaStyleClock = v10;
  }

}

- (void)resetLocalReplicaClocksToTimestampValues
{
  self->_replicaTextClock = -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0);
  self->_replicaStyleClock = -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 1);
}

- (void)_testSetTextTimestamp:(unint64_t)a3
{
  self->_replicaTextClock = a3;
}

- (BOOL)isFragment
{
  TopoSubstring **begin;
  TopoSubstring *v4;
  void *v5;
  int v6;
  char v7;
  TopoSubstring *v8;

  begin = self->_startNodes.__begin_;
  if ((TopoSubstring **)((char *)self->_startNodes.__end_ - (char *)begin) != (TopoSubstring **)8
    || (TopoSubstring **)((char *)self->_endNodes.__end_ - (char *)self->_endNodes.__begin_) != (TopoSubstring **)8)
  {
    goto LABEL_9;
  }
  v4 = *begin;
  objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_DWORD *)v4 + 2))
    goto LABEL_4;
  v7 = objc_msgSend(*(id *)v4, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
LABEL_9:
    LOBYTE(v6) = 1;
    return v6;
  }
  v8 = *self->_endNodes.__begin_;
  objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_DWORD *)v8 + 2) == -1)
  {
    v6 = objc_msgSend(*(id *)v8, "isEqual:", v5) ^ 1;
    goto LABEL_5;
  }
LABEL_4:
  LOBYTE(v6) = 1;
LABEL_5:

  return v6;
}

- (void)startNodes
{
  return &self->_startNodes;
}

- (void)endNodes
{
  return &self->_endNodes;
}

- (void)updateTimestampsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  void *__p;
  uint64_t *v11;
  uint64_t v12;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __p = 0;
    v11 = 0;
    v12 = 0;
    -[TTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, location, length);
    v7 = (uint64_t *)__p;
    v8 = v11;
    while (v7 != v8)
    {
      v9 = *v7++;
      objc_storeStrong((id *)(v9 + 24), v6);
    }
    -[TTMergeableString coalesce](self, "coalesce");
    self->_hasLocalChanges = 1;
    if (__p)
    {
      v11 = (uint64_t *)__p;
      operator delete(__p);
    }

  }
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t *i;
  uint64_t *v8;
  uint64_t v9;
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  NSUInteger *v17;
  NSUInteger *v18;
  NSRange v19;
  NSUInteger location;
  uint64_t v21;
  NSUInteger v22;
  id obj;
  NSRange v24;

  +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(uint64_t **)a3;
  for (i = (uint64_t *)*((_QWORD *)a3 + 1); v8 != i; ++v8)
  {
    v9 = *v8;
    if (!*(_BYTE *)(*v8 + 44))
    {
      *(_BYTE *)(v9 + 44) = 1;
      objc_storeStrong((id *)(v9 + 24), obj);
    }
  }
  v10 = (__int128 *)*((_QWORD *)a4 + 1);
  v11 = 126 - 2 * __clz(((uint64_t)v10 - *(_QWORD *)a4) >> 4);
  if (v10 == *(__int128 **)a4)
    v12 = 0;
  else
    v12 = v11;
  std::__introsort<std::_ClassicAlgPolicy,-[TTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *,false>(*(_QWORD *)a4, v10, v12, 1);
  v13 = *(_QWORD **)a4;
  v14 = (_QWORD *)*((_QWORD *)a4 + 1);
  while (v13 != v14)
  {
    -[NSMutableAttributedString deleteCharactersInRange:](self->_attributedString, "deleteCharactersInRange:", *v13, v13[1]);
    v13 += 2;
  }
  -[TTMergeableString delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "beginEditing");
    v17 = *(NSUInteger **)a4;
    v18 = (NSUInteger *)*((_QWORD *)a4 + 1);
    location = **(_QWORD **)a4;
    v19.length = *(_QWORD *)(*(_QWORD *)a4 + 8);
    if (*(NSUInteger **)a4 == v18)
    {
      v21 = 0;
    }
    else
    {
      v21 = 0;
      do
      {
        v24.location = *v17;
        v22 = v17[1];
        v19.location = location;
        v24.length = v22;
        v19 = NSUnionRange(v19, v24);
        location = v19.location;
        v21 += v22;
        v17 += 2;
      }
      while (v17 != v18);
    }
    objc_msgSend(v16, "edited:range:changeInLength:", 2, location, v19.length, -v21);
  }
  -[TTMergeableString coalesce](self, "coalesce");
  -[TTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
  self->_hasLocalChanges = 1;
  if (v16)
    objc_msgSend(v16, "endEditing");

}

- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t unserializedClock;
  int v15;
  int v16;
  id *v17;
  char *v18;
  uint64_t v19;
  void **v20;
  void **v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id updateRangeBlock;
  id v28;
  id *v29;
  TopoIDRange *result;
  _QWORD v31[5];
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t __src;
  uint64_t v43;
  TopoID v44;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v41 = 0;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x4812000000;
  v35 = __Block_byref_object_copy__15;
  v36 = __Block_byref_object_dispose__16;
  v37 = 256;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  if (objc_msgSend(v10, "length"))
  {
    +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = operator new();
    v13 = v11;
    unserializedClock = self->_unserializedClock;
    v15 = *((_DWORD *)a6 + 10);
    v16 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v10, "length"));
    v44.var0 = v13;
    *(_QWORD *)&v44.var1 = unserializedClock;
    TopoSubstring::TopoSubstring((TopoSubstring *)v12, v44, v15, v16);
    v41 = v12;
    objc_storeStrong((id *)(v12 + 24), v11);
    *(_DWORD *)(v12 + 32) = 0;
    self->_unserializedClock += objc_msgSend(v10, "length");
    v17 = v33;
    objc_storeStrong(v33 + 6, *(id *)v12);
    *((_DWORD *)v17 + 14) = *(_DWORD *)(v12 + 8);
    *((_DWORD *)v17 + 16) = *(_DWORD *)(v12 + 16);
    v18 = (char *)*((_QWORD *)a5 + 6);
    v19 = *((_QWORD *)a5 + 7);
    v20 = (void **)v18;
    if (v18 != (char *)v19)
    {
      while (*v20 != a6)
      {
        if (++v20 == (void **)v19)
        {
          v20 = (void **)*((_QWORD *)a5 + 7);
          break;
        }
      }
    }
    if (v20 == (void **)v19)
    {
      if ((void *)v12 != a5)
        std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v12 + 48), v18, v19, (v19 - (uint64_t)v18) >> 3);
      __src = v12;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a5 + 48, (char *)&__src, (uint64_t)&v43, 1uLL);
    }
    else
    {
      *v20 = (void *)v12;
      __src = (uint64_t)a6;
      std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v12 + 48), (char *)&__src, (uint64_t)&v43, 1uLL);
    }
    *(_DWORD *)(v12 + 72) = 1;
    if (!self->_cacheInvalid)
    {
      v21 = *(void ***)-[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
      v22 = (char *)(v21 + 1);
      while (v21 != *(void ***)(-[TTMergeableString orderedSubstrings](self, "orderedSubstrings") + 8))
      {
        if (*v21 == a5)
        {
          std::vector<TopoSubstring *>::insert((uint64_t)-[TTMergeableString orderedSubstrings](self, "orderedSubstrings"), v22, (char *)&v41);
          break;
        }
        ++v21;
        v22 += 8;
      }
    }
    -[TTMergeableString attributedString](self, "attributedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertAttributedString:atIndex:", v10, *(unsigned int *)(v41 + 40));

    -[TTMergeableString delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "beginEditing");
      objc_msgSend(v25, "edited:range:changeInLength:", 2, *(unsigned int *)(v41 + 40), 0, *(unsigned int *)(v41 + 16));
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __57__TTMergeableString_insertAttributedString_after_before___block_invoke;
    v31[3] = &unk_1E67FA8A8;
    v31[4] = &v32;
    v26 = (void *)MEMORY[0x1B5E3E098](v31);
    updateRangeBlock = self->_updateRangeBlock;
    self->_updateRangeBlock = v26;

    -[TTMergeableString coalesce](self, "coalesce");
    -[TTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
    self->_hasLocalChanges = 1;
    v28 = self->_updateRangeBlock;
    self->_updateRangeBlock = 0;

    if (v25)
      objc_msgSend(v25, "endEditing");

  }
  v29 = v33;
  retstr->var0.var0 = v33[6];
  retstr->var0.var1 = *((_DWORD *)v29 + 14);
  retstr->var1 = *((_DWORD *)v29 + 16);
  _Block_object_dispose(&v32, 8);

  return result;
}

void __57__TTMergeableString_insertAttributedString_after_before___block_invoke(uint64_t a1, id *a2, id *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8[3];
  void **v9;

  memset(v8, 0, sizeof(v8));
  updateTopoIDRange((TopoIDRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), a2, (uint64_t)a3, v8);
  v6 = v8[0];
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  objc_storeStrong((id *)(v7 + 48), *(id *)v8[0]);
  *(_DWORD *)(v7 + 56) = *(_DWORD *)(v6 + 8);
  *(_DWORD *)(v7 + 64) = *(_DWORD *)(v6 + 16);
  v9 = (void **)v8;
  std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v9);

}

- (void)moveRange:(_NSRange)a3 toIndex:(unint64_t)a4
{
  void *__p;
  void *v5;
  uint64_t v6;

  if (a3.length)
  {
    __p = 0;
    v5 = 0;
    v6 = 0;
    -[TTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, a3.location, a3.length);
    if (__p)
    {
      v5 = __p;
      operator delete(__p);
    }
  }
}

- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4
{
  -[TTMergeableString getSubstrings:inOrderedSubstrings:forCharacterRange:](self, "getSubstrings:inOrderedSubstrings:forCharacterRange:", a3, -[TTMergeableString orderedSubstrings](self, "orderedSubstrings"), a4.location, a4.length);
}

- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5
{
  char *v7;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  BOOL v16;
  NSUInteger v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  _QWORD *v44;
  char *v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  void *v58;
  void *v59;

  if (!a5.length)
    return;
  v7 = *(char **)a4;
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
    goto LABEL_47;
  length = a5.length;
  location = a5.location;
  v11 = 0;
  v12 = a5.location + a5.length;
  v57 = (char *)a3 + 16;
  while (1)
  {
    v13 = *(_QWORD *)v7;
    if (*(_BYTE *)(*(_QWORD *)v7 + 44))
    {
      v14 = v11;
      goto LABEL_46;
    }
    v14 = v11 + *(unsigned int *)(v13 + 16);
    if (v14 <= location)
      goto LABEL_46;
    v15 = v12 - v11;
    if (v12 <= v11)
      goto LABEL_47;
    v16 = location >= v11;
    v17 = location - v11;
    if (v17 == 0 || !v16)
      break;
    v59 = 0;
    v59 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v13, TTBoundedCheckedCastNSUIntegerToUInt32(v17));
    v7 = std::vector<TopoSubstring *>::insert((uint64_t)a4, v7 + 8, (char *)&v59);
    v19 = (_QWORD *)*((_QWORD *)a3 + 1);
    v18 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v19 >= v18)
    {
      v24 = ((uint64_t)v19 - *(_QWORD *)a3) >> 3;
      if ((unint64_t)(v24 + 1) >> 61)
        goto LABEL_67;
      v25 = v18 - *(_QWORD *)a3;
      v26 = v25 >> 2;
      if (v25 >> 2 <= (unint64_t)(v24 + 1))
        v26 = v24 + 1;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
        v27 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v27 = v26;
      if (v27)
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v57, v27);
      else
        v28 = 0;
      v34 = &v28[8 * v24];
      *(_QWORD *)v34 = v59;
      v20 = v34 + 8;
      v36 = *(char **)a3;
      v35 = (char *)*((_QWORD *)a3 + 1);
      if (v35 != *(char **)a3)
      {
        do
        {
          v37 = *((_QWORD *)v35 - 1);
          v35 -= 8;
          *((_QWORD *)v34 - 1) = v37;
          v34 -= 8;
        }
        while (v35 != v36);
        v35 = *(char **)a3;
      }
      *(_QWORD *)a3 = v34;
      *((_QWORD *)a3 + 1) = v20;
      *((_QWORD *)a3 + 2) = &v28[8 * v27];
      if (v35)
        operator delete(v35);
    }
    else
    {
      *v19 = v59;
      v20 = v19 + 1;
    }
    *((_QWORD *)a3 + 1) = v20;
    if (v12 < v14)
    {
      v58 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v59, TTBoundedCheckedCastNSUIntegerToUInt32(length));
      v45 = v7 + 8;
      v46 = &v58;
      goto LABEL_66;
    }
LABEL_46:
    v7 += 8;
    v11 = v14;
    if (v7 == *((char **)a4 + 1))
      goto LABEL_47;
  }
  if (v14 <= v12)
  {
    v22 = (uint64_t *)*((_QWORD *)a3 + 1);
    v21 = *((_QWORD *)a3 + 2);
    if ((unint64_t)v22 >= v21)
    {
      v29 = ((uint64_t)v22 - *(_QWORD *)a3) >> 3;
      if ((unint64_t)(v29 + 1) >> 61)
        goto LABEL_67;
      v30 = v21 - *(_QWORD *)a3;
      v31 = v30 >> 2;
      if (v30 >> 2 <= (unint64_t)(v29 + 1))
        v31 = v29 + 1;
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
        v32 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v32 = v31;
      if (v32)
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v57, v32);
      else
        v33 = 0;
      v38 = &v33[8 * v29];
      *(_QWORD *)v38 = v13;
      v23 = v38 + 8;
      v40 = *(char **)a3;
      v39 = (char *)*((_QWORD *)a3 + 1);
      if (v39 != *(char **)a3)
      {
        do
        {
          v41 = *((_QWORD *)v39 - 1);
          v39 -= 8;
          *((_QWORD *)v38 - 1) = v41;
          v38 -= 8;
        }
        while (v39 != v40);
        v39 = *(char **)a3;
      }
      *(_QWORD *)a3 = v38;
      *((_QWORD *)a3 + 1) = v23;
      *((_QWORD *)a3 + 2) = &v33[8 * v32];
      if (v39)
        operator delete(v39);
    }
    else
    {
      *v22 = v13;
      v23 = v22 + 1;
    }
    *((_QWORD *)a3 + 1) = v23;
    goto LABEL_46;
  }
  v59 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v13, TTBoundedCheckedCastNSUIntegerToUInt32(v15));
  v43 = (uint64_t *)*((_QWORD *)a3 + 1);
  v42 = *((_QWORD *)a3 + 2);
  if ((unint64_t)v43 >= v42)
  {
    v47 = ((uint64_t)v43 - *(_QWORD *)a3) >> 3;
    if ((unint64_t)(v47 + 1) >> 61)
LABEL_67:
      std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
    v48 = v42 - *(_QWORD *)a3;
    v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1))
      v49 = v47 + 1;
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
      v50 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v50 = v49;
    if (v50)
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v57, v50);
    else
      v51 = 0;
    v52 = &v51[8 * v47];
    v53 = &v51[8 * v50];
    *(_QWORD *)v52 = v13;
    v44 = v52 + 8;
    v55 = *(char **)a3;
    v54 = (char *)*((_QWORD *)a3 + 1);
    if (v54 != *(char **)a3)
    {
      do
      {
        v56 = *((_QWORD *)v54 - 1);
        v54 -= 8;
        *((_QWORD *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      v54 = *(char **)a3;
    }
    *(_QWORD *)a3 = v52;
    *((_QWORD *)a3 + 1) = v44;
    *((_QWORD *)a3 + 2) = v53;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v43 = v13;
    v44 = v43 + 1;
  }
  *((_QWORD *)a3 + 1) = v44;
  v45 = v7 + 8;
  v46 = &v59;
LABEL_66:
  std::vector<TopoSubstring *>::insert((uint64_t)a4, v45, (char *)v46);
LABEL_47:
  -[TTMergeableString invalidateCache](self, "invalidateCache");
}

- (void)getSubstringBeforeTopoID:(TopoID)a3
{
  unsigned int var1;
  id var0;
  TopoSubstring *v6;
  id ***v7;
  id **v8;
  id **v9;
  id *v10;
  id v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  TTMergeableString *v19;
  id v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = *self->_startNodes.__begin_;
  v20 = a3.var0;
  v7 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v9 = *v7;
  v8 = v7[1];
  if (*v7 == v8)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_18;
  }
  v19 = self;
  while (1)
  {
    v10 = *v9;
    v11 = **v9;
    v12 = *((_DWORD *)v10 + 2);
    v13 = *((_DWORD *)v10 + 4);
    if (!objc_msgSend(var0, "isEqual:", v11))
      goto LABEL_10;
    v14 = var1 - v12;
    if (var1 == v12)
      goto LABEL_17;
    if (var1 <= v12)
      goto LABEL_10;
    v15 = v11;
    v16 = v15;
    if (v13 + v12 > var1)
      break;
    if (v13 + v12 == var1)
    {
      v17 = objc_msgSend(v20, "TTCompare:", v15);

      var0 = v20;
      if (v17 == -1)
        goto LABEL_15;
    }
    else
    {

      var0 = v20;
    }
LABEL_10:
    if (!*((_BYTE *)v10 + 44))
      v6 = (TopoSubstring *)v10;

    if (++v9 == v8)
      goto LABEL_13;
  }

  var0 = v20;
LABEL_15:
  if (!*((_BYTE *)v10 + 44))
  {
    -[TTMergeableString splitTopoSubstring:atIndex:](v19, "splitTopoSubstring:atIndex:", v10, v14);
    -[TTMergeableString invalidateCache](v19, "invalidateCache");
    v6 = (TopoSubstring *)v10;
  }
LABEL_17:

LABEL_18:
  return v6;
}

- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4
{
  id ***v6;
  id **v7;
  id *v8;
  id v9;
  unsigned int v10;
  int v11;
  id v12;
  unint64_t v13;
  void **v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int var1;
  id v20;
  unsigned int v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  unsigned int v27;
  id v28;
  unint64_t v29;
  id **v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id **v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  id **v51;
  char *v52;
  char *v53;
  id *v54;
  char *v55;
  id *v56;
  id **v57;
  char *v58;
  char *v59;
  id *v60;
  char *v61;
  char v62;
  id **v64;
  id v65[2];

  if (!a4->var1)
    goto LABEL_80;
  v6 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v7 = *v6;
  v64 = v6[1];
  if (*v6 == v64)
    goto LABEL_80;
  v62 = 0;
  v61 = (char *)a3 + 16;
  do
  {
    v8 = *v7;
    v9 = **v7;
    v10 = *((_DWORD *)v8 + 2);
    v11 = *((_DWORD *)v8 + 4);
    if ((objc_msgSend(a4->var0.var0, "isEqual:", v9) & 1) == 0)
      goto LABEL_69;
    v12 = v9;
    v13 = v11 + v10;
    v65[0] = v12;
    v65[1] = (id)v13;
    if (TopoID::operator<=((uint64_t)v65, a4))
    {

      goto LABEL_69;
    }
    v14 = (void **)a3;
    v15 = a4->var0.var0;
    v16 = v15;
    v17 = a4->var1 + a4->var0.var1;
    if (v10 == v17)
    {
      if ((objc_msgSend(v12, "isEqual:", v15) & 1) != 0)
        goto LABEL_13;
      v18 = objc_msgSend(v12, "TTCompare:", v16);

      if (v18 == 1)
        goto LABEL_14;
    }
    else
    {
      if (v10 > v17)
      {
LABEL_13:

LABEL_14:
        a3 = v14;
        goto LABEL_69;
      }

    }
    var1 = a4->var0.var1;
    if (var1 > v10)
    {
      v8 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, var1 - v10);
      v20 = a4->var0.var0;
      v21 = a4->var1 + a4->var0.var1;
      v22 = v12;
      v23 = v22;
      if (v21 < v13)
      {

LABEL_18:
        -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, a4->var1, v61);
        goto LABEL_40;
      }
      if (v21 == (_DWORD)v13)
      {
        v37 = objc_msgSend(v20, "TTCompare:", v22);

        if (v37 == -1)
          goto LABEL_18;
      }
      else
      {

      }
LABEL_40:
      a3 = v14;
      v30 = (id **)v14[1];
      v41 = (unint64_t)v14[2];
      if ((unint64_t)v30 < v41)
      {
LABEL_41:
        *v30 = v8;
        v42 = v30 + 1;
LABEL_68:
        *((_QWORD *)a3 + 1) = v42;
        v62 = 1;
        goto LABEL_69;
      }
      v43 = ((char *)v30 - (_BYTE *)*v14) >> 3;
      if ((unint64_t)(v43 + 1) >> 61)
        std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
      v44 = v41 - (_QWORD)*v14;
      v45 = v44 >> 2;
      if (v44 >> 2 <= (unint64_t)(v43 + 1))
        v45 = v43 + 1;
      if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
        v34 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v34 = v45;
      if (v34)
      {
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v61, v34);
        a3 = v14;
      }
      else
      {
        v35 = 0;
      }
      v51 = (id **)&v35[8 * v43];
      *v51 = v8;
      v42 = v51 + 1;
      v53 = *(char **)a3;
      v52 = (char *)*((_QWORD *)a3 + 1);
      if (v52 != *(char **)a3)
      {
        do
        {
          v54 = (id *)*((_QWORD *)v52 - 1);
          v52 -= 8;
          *--v51 = v54;
        }
        while (v52 != v53);
LABEL_65:
        v52 = *(char **)a3;
        goto LABEL_66;
      }
      goto LABEL_66;
    }
    v24 = v12;
    v25 = a4->var0.var0;
    v26 = v25;
    v27 = a4->var1 + a4->var0.var1;
    if (v13 > v27)
    {

LABEL_21:
      v28 = a4->var0.var0;
      -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, a4->var0.var1 - v10 + a4->var1);
      a3 = v14;

      v30 = (id **)v14[1];
      v29 = (unint64_t)v14[2];
      if ((unint64_t)v30 < v29)
        goto LABEL_41;
      v31 = ((char *)v30 - (_BYTE *)*v14) >> 3;
      if ((unint64_t)(v31 + 1) >> 61)
        goto LABEL_81;
      v32 = v29 - (_QWORD)*v14;
      v33 = v32 >> 2;
      if (v32 >> 2 <= (unint64_t)(v31 + 1))
        v33 = v31 + 1;
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8)
        v34 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v34 = v33;
      if (v34)
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v61, v34);
      else
        v35 = 0;
      v51 = (id **)&v35[8 * v31];
      *v51 = v8;
      v42 = v51 + 1;
      v55 = (char *)*v14;
      v52 = (char *)v14[1];
      if (v52 != *v14)
      {
        do
        {
          v56 = (id *)*((_QWORD *)v52 - 1);
          v52 -= 8;
          *--v51 = v56;
        }
        while (v52 != v55);
        goto LABEL_65;
      }
LABEL_66:
      *(_QWORD *)a3 = v51;
      *((_QWORD *)a3 + 1) = v42;
      *((_QWORD *)a3 + 2) = &v35[8 * v34];
      if (v52)
        operator delete(v52);
      goto LABEL_68;
    }
    if ((_DWORD)v13 == v27)
    {
      v36 = objc_msgSend(v24, "TTCompare:", v25);

      if (v36 == 1)
        goto LABEL_21;
    }
    else
    {

    }
    a3 = v14;
    v39 = (id **)v14[1];
    v38 = (unint64_t)v14[2];
    if ((unint64_t)v39 >= v38)
    {
      v46 = ((char *)v39 - (_BYTE *)*v14) >> 3;
      if ((unint64_t)(v46 + 1) >> 61)
LABEL_81:
        std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
      v47 = v38 - (_QWORD)*v14;
      v48 = v47 >> 2;
      if (v47 >> 2 <= (unint64_t)(v46 + 1))
        v48 = v46 + 1;
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8)
        v49 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v49 = v48;
      if (v49)
        v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v61, v49);
      else
        v50 = 0;
      v57 = (id **)&v50[8 * v46];
      *v57 = v8;
      v40 = v57 + 1;
      v59 = (char *)*v14;
      v58 = (char *)v14[1];
      if (v58 != *v14)
      {
        do
        {
          v60 = (id *)*((_QWORD *)v58 - 1);
          v58 -= 8;
          *--v57 = v60;
        }
        while (v58 != v59);
        v58 = (char *)*v14;
      }
      *v14 = v57;
      v14[1] = v40;
      v14[2] = &v50[8 * v49];
      if (v58)
        operator delete(v58);
    }
    else
    {
      *v39 = v8;
      v40 = v39 + 1;
    }
    v14[1] = v40;
LABEL_69:

    ++v7;
  }
  while (v7 != v64);
  if ((v62 & 1) != 0)
    -[TTMergeableString invalidateCache](self, "invalidateCache");
LABEL_80:

}

- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  int v30;

  std::vector<_NSRange>::reserve((void **)a3, (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  v28 = 0u;
  v29 = 0u;
  v30 = 1065353216;
  v7 = *(_QWORD **)a4;
  v8 = (_QWORD *)*((_QWORD *)a4 + 1);
  while (v7 != v8)
  {
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v28, v7, v7);
    ++v7;
  }
  v9 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v10 = *v9;
  v11 = v9[1];
  if (*v9 != v11)
  {
    v12 = 0;
    do
    {
      v27 = *v10;
      v13 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v28, &v27);
      v14 = v13;
      if (*(_BYTE *)(v27 + 44))
      {
        v15 = 0;
        if (!v13)
          goto LABEL_28;
      }
      else
      {
        v15 = *(unsigned int *)(v27 + 16);
        if (!v13)
          goto LABEL_28;
      }
      v17 = (_QWORD *)*((_QWORD *)a3 + 1);
      v16 = *((_QWORD *)a3 + 2);
      if ((unint64_t)v17 >= v16)
      {
        v19 = *(_QWORD **)a3;
        v20 = ((uint64_t)v17 - *(_QWORD *)a3) >> 4;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60)
          std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
        v22 = v16 - (_QWORD)v19;
        if (v22 >> 3 > v21)
          v21 = v22 >> 3;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0)
          v23 = 0xFFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)a3 + 16, v23);
          v19 = *(_QWORD **)a3;
          v17 = (_QWORD *)*((_QWORD *)a3 + 1);
        }
        else
        {
          v24 = 0;
        }
        v25 = &v24[16 * v20];
        *(_QWORD *)v25 = v12;
        *((_QWORD *)v25 + 1) = v15;
        v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 16;
            v17 -= 2;
          }
          while (v17 != v19);
          v19 = *(_QWORD **)a3;
        }
        v18 = v25 + 16;
        *(_QWORD *)a3 = v26;
        *((_QWORD *)a3 + 1) = v25 + 16;
        *((_QWORD *)a3 + 2) = &v24[16 * v23];
        if (v19)
          operator delete(v19);
      }
      else
      {
        *v17 = v12;
        v17[1] = v15;
        v18 = v17 + 2;
      }
      *((_QWORD *)a3 + 1) = v18;
      if (*((_QWORD *)&v29 + 1) == 1)
        break;
      std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(&v28, v14);
LABEL_28:
      v12 += v15;
      ++v10;
    }
    while (v10 != v11);
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v28);
}

- (unint64_t)getCharacterIndexForCharID:(TopoID)a3
{
  unsigned int var1;
  id var0;
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v6 = *v5;
  v7 = v5[1];
  if (*v5 == v7)
  {
LABEL_18:
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
    while (1)
    {
      v9 = *v6;
      v10 = *(_BYTE *)(*v6 + 44) ? 0 : *(unsigned int *)(v9 + 16);
      if (*(_DWORD *)(v9 + 8) == var1 && (objc_msgSend(*(id *)v9, "isEqual:", var0) & 1) != 0)
        break;
      if (objc_msgSend(*(id *)v9, "isEqual:", var0))
      {
        v11 = *(_DWORD *)(v9 + 8);
        if (v11 < var1 || v11 == var1 && objc_msgSend(*(id *)v9, "TTCompare:", var0) == -1)
        {
          v12 = *(id *)v9;
          v13 = v12;
          v14 = *(_DWORD *)(v9 + 16) + *(_DWORD *)(v9 + 8);
          if (v14 > var1)
          {

LABEL_21:
            v8 = v8 + var1 - *(unsigned int *)(v9 + 8);
            break;
          }
          if (v14 == var1)
          {
            v15 = objc_msgSend(var0, "TTCompare:", v12);

            if (v15 == -1)
              goto LABEL_21;
          }
          else
          {

          }
        }
      }
      v8 += v10;
      if (++v6 == v7)
        goto LABEL_18;
    }
  }

  return v8;
}

- (void)enumerateSubstrings:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, id *, id, _QWORD);
  _QWORD *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  int v13;
  int v14;

  v4 = (void (**)(id, uint64_t, uint64_t, id *, id, _QWORD))a3;
  v5 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v6 = (uint64_t *)*v5;
  v7 = (uint64_t *)v5[1];
  while (v6 != v7)
  {
    v8 = *v6;
    if (!*(_BYTE *)(*v6 + 44))
    {
      v9 = *(unsigned int *)(v8 + 16);
      if ((_DWORD)v9)
      {
        v10 = *(unsigned int *)(v8 + 40);
        v12 = *(id *)v8;
        v11 = *(_DWORD *)(v8 + 16);
        v13 = *(_DWORD *)(v8 + 8);
        v14 = v11;
        v4[2](v4, v10, v9, &v12, *(id *)(v8 + 24), *(unsigned int *)(v8 + 32));
      }
    }
    ++v6;
  }

}

- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4
{
  id v5;
  uint64_t v6;
  int64_t v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "clockForUUID:atIndex:", *(_QWORD *)a3, 0) - *((unsigned int *)a3 + 2);
  if (v6 >= *((unsigned int *)a3 + 4))
  {
    if (objc_msgSend(v5, "clockForUUID:atIndex:", *((_QWORD *)a3 + 3), 1) <= *((unsigned int *)a3 + 8))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = v6 & ~(v6 >> 63);
  }

  return v7;
}

- (void)enumerateRangesModifiedAfter:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, int64_t, int64_t);
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  int64_t v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, int64_t, int64_t))a4;
  -[TTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  v7 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v8 = (_QWORD *)*v7;
  v9 = (_QWORD *)v7[1];
  while (v8 != v9)
  {
    v10 = *v8;
    if (!*(_BYTE *)(*v8 + 44) && *(_DWORD *)(v10 + 16))
    {
      v11 = -[TTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", *v8, v12);
      if ((v11 & 0x8000000000000000) == 0)
        v6[2](v6, v11 + *(unsigned int *)(v10 + 40), *(unsigned int *)(v10 + 16) - v11);
    }
    ++v8;
  }

}

- (BOOL)textEitherSideOfSelectionAnchor:(TopoID)a3 wasModifiedAfter:(id)a4
{
  unsigned int var1;
  id var0;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  char v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned int v14;
  BOOL v15;
  unint64_t v16;
  id v17;
  int v18;
  BOOL v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v8 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v9 = (_QWORD *)*v8;
  v10 = (_QWORD *)v8[1];
  if ((_QWORD *)*v8 != v10)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = (_QWORD *)*v9;
      if ((v11 & 1) != 0)
        break;
      if (objc_msgSend(var0, "isEqual:", *v13))
      {
        v14 = *((_DWORD *)v13 + 2);
        if (v14 <= var1 && *((_DWORD *)v13 + 4) + v14 > var1)
        {
          if (*((_BYTE *)v13 + 44))
            v15 = v12 == 0;
          else
            v15 = 1;
          if (!v15
            && (-[TTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", v12, v7) & 0x8000000000000000) == 0
            || (v16 = -[TTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", v13, v7),
                (v16 & 0x8000000000000000) == 0)
            && v16 <= var1 - *((_DWORD *)v13 + 2))
          {
LABEL_32:
            v19 = 1;
            goto LABEL_31;
          }
          v17 = (id)*v13;
          v18 = *((_DWORD *)v13 + 2) + *((_DWORD *)v13 + 4) - 1;

          if (v18 != var1)
            goto LABEL_30;
          goto LABEL_7;
        }
      }
      if (!*((_DWORD *)v13 + 4) && *((_DWORD *)v13 + 2) == var1 && (objc_msgSend((id)*v13, "isEqual:", var0) & 1) != 0)
        goto LABEL_7;
      if (!*((_BYTE *)v13 + 44)
        || (-[TTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", v13, v7) & 0x8000000000000000) == 0)
      {
        v11 = 0;
        goto LABEL_27;
      }
      v11 = 0;
LABEL_8:
      v13 = v12;
LABEL_27:
      ++v9;
      v12 = v13;
      if (v9 == v10)
        goto LABEL_30;
    }
    if (!-[TTMergeableString substring:modifiedAfter:](self, "substring:modifiedAfter:", *v9, v7)
      && *((_DWORD *)v13 + 4))
    {
      goto LABEL_32;
    }
    if (!*((_BYTE *)v13 + 44))
      goto LABEL_30;
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
LABEL_30:
  v19 = 0;
LABEL_31:

  return v19;
}

- (BOOL)selection:(id)a3 wasModifiedAfter:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id **v14;
  id *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v7 = a4;
  -[TTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v8 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
  if (v8[1] == *v8)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    v9 = (_QWORD *)objc_msgSend(v6, "selectionRanges");
    if (v9[1] - *v9 != 32)
    {
LABEL_9:
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __48__TTMergeableString_selection_wasModifiedAfter___block_invoke;
      v22[3] = &unk_1E67FA8D0;
      v22[4] = self;
      v23 = v7;
      v24 = &v25;
      v20 = -[TTMergeableString characterRangesForSelection:selectedSubstringsBlock:](self, "characterRangesForSelection:selectedSubstringsBlock:", v6, v22);
      LOBYTE(self) = *((_BYTE *)v26 + 24) != 0;

      goto LABEL_10;
    }
    v10 = *(_QWORD *)objc_msgSend(v6, "selectionRanges");
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (*(_DWORD *)(v10 + 24))
    {

      goto LABEL_9;
    }
    v13 = objc_msgSend(*(id *)(v10 + 16), "isEqual:", v11);

    if (!v13)
      goto LABEL_9;
    v14 = (id **)objc_msgSend(v6, "selectionRanges");
    v15 = *v14;
    v16 = **v14;
    v17 = *((unsigned int *)v15 + 2);
    v18 = v16;
    v19 = v18;
    if (self)
      LOBYTE(self) = -[TTMergeableString textEitherSideOfSelectionAnchor:wasModifiedAfter:](self, "textEitherSideOfSelectionAnchor:wasModifiedAfter:", v18, v17, v7);
    else

  }
LABEL_10:
  _Block_object_dispose(&v25, 8);

  return (char)self;
}

NSUInteger __48__TTMergeableString_selection_wasModifiedAfter___block_invoke(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger result;
  NSRange v9;
  NSRange v10;
  NSRange v11;

  result = objc_msgSend(*(id *)(a1 + 32), "substring:modifiedAfter:", a2, *(_QWORD *)(a1 + 40));
  if ((result & 0x8000000000000000) == 0)
  {
    if (*(_BYTE *)(a2 + 44)
      || (v10.length = *(unsigned int *)(a2 + 16) - result,
          v10.location = result + *(unsigned int *)(a2 + 40),
          v11.location = a3,
          v11.length = a4,
          v9 = NSIntersectionRange(v10, v11),
          result = v9.location,
          v9.length))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4
{
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  id v11;
  unsigned int v12;
  TopoIDRange v14;
  uint64_t __src;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = *(id *)a3;
  v7 = *((_DWORD *)a3 + 2);
  v8 = *((_DWORD *)a3 + 4);
  *((_DWORD *)a3 + 4) = a4;
  v9 = operator new();
  v10 = v7 + a4;
  v11 = v6;
  v14.var0.var0 = v11;
  v14.var0.var1 = v10;
  v14.var1 = v8 - a4;
  if (*((_BYTE *)a3 + 44))
    v12 = 0;
  else
    v12 = a4;
  TopoSubstring::TopoSubstring((TopoSubstring *)v9, &v14, v12 + *((_DWORD *)a3 + 10));
  *(_BYTE *)(v9 + 44) = *((_BYTE *)a3 + 44);
  objc_storeStrong((id *)(v9 + 24), *((id *)a3 + 3));
  *(_DWORD *)(v9 + 32) = *((_DWORD *)a3 + 8);
  if ((void *)v9 != a3)
    std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v9 + 48), *((char **)a3 + 6), *((_QWORD *)a3 + 7), (uint64_t)(*((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6)) >> 3);
  __src = v9;
  std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a3 + 48, (char *)&__src, (uint64_t)&v16, 1uLL);
  *(_DWORD *)(v9 + 72) = 1;

  return (void *)v9;
}

- (void)orderedSubstrings
{
  if (self->_cacheInvalid)
    -[TTMergeableString updateCache](self, "updateCache");
  return &self->_orderedSubstrings;
}

- (void)updateCache
{
  TopoSubstring **begin;
  vector<TopoSubstring *, std::allocator<TopoSubstring *>> *p_orderedSubstrings;
  TopoSubstring **v5;
  TopoSubstring **end;
  uint64_t v7;
  uint64_t v8;
  TopoSubstring **v9;
  _QWORD v10[5];

  p_orderedSubstrings = &self->_orderedSubstrings;
  begin = self->_orderedSubstrings.__begin_;
  self->_orderedSubstrings.__end_ = begin;
  self->_cacheInvalid = 0;
  v5 = self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  if (v5 == end)
  {
    v9 = begin;
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = (uint64_t)*v5;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __32__TTMergeableString_updateCache__block_invoke;
      v10[3] = &unk_1E67FA8F8;
      v10[4] = self;
      traverseRecursive(v8, v10);
      ++v5;
    }
    while (v5 != end);
    begin = self->_orderedSubstrings.__begin_;
    v9 = self->_orderedSubstrings.__end_;
  }
  if (((char *)v9 - (char *)begin) >> 2 < (unint64_t)(self->_orderedSubstrings.__end_cap_.__value_ - begin))
    std::vector<TopoSubstring *>::shrink_to_fit((uint64_t)p_orderedSubstrings);
}

void __32__TTMergeableString_updateCache__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (_QWORD *)v3[8];
  v5 = v3[9];
  if ((unint64_t)v4 >= v5)
  {
    v7 = v3[7];
    v8 = ((uint64_t)v4 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
    v9 = v5 - v7;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)(v3 + 9), v11);
    else
      v12 = 0;
    v13 = &v12[8 * v8];
    v14 = &v12[8 * v11];
    *(_QWORD *)v13 = a2;
    v6 = v13 + 8;
    v16 = (char *)v3[7];
    v15 = (char *)v3[8];
    if (v15 != v16)
    {
      do
      {
        v17 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *((_QWORD *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      v15 = (char *)v3[7];
    }
    v3[7] = v13;
    v3[8] = v6;
    v3[9] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v4 = a2;
    v6 = v4 + 1;
  }
  v3[8] = v6;
}

- (void)invalidateCache
{
  self->_cacheInvalid = 1;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
}

- (void)updateAttributedStringAfterMerge
{
  NSMutableAttributedString *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableAttributedString *attributedString;

  v3 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  v4 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v5 = (uint64_t *)*v4;
  v6 = (uint64_t *)v4[1];
  while (v5 != v6)
  {
    v7 = *v5;
    v8 = -[NSMutableAttributedString length](v3, "length");
    if (!*(_BYTE *)(v7 + 44))
      -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](v3, "ic_appendAttributedSubstring:fromRange:", self->_attributedString, *(unsigned int *)(v7 + 40), *(unsigned int *)(v7 + 16));
    *(_DWORD *)(v7 + 40) = TTBoundedCheckedCastNSUIntegerToUInt32(v8);
    ++v5;
  }
  attributedString = self->_attributedString;
  self->_attributedString = v3;

}

- (void)updateSubstringIndexes
{
  uint64_t **v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t v6;

  v2 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v3 = *v2;
  v4 = v2[1];
  if (*v2 != v4)
  {
    v5 = 0;
    do
    {
      v6 = *v3;
      *(_DWORD *)(v6 + 40) = v5;
      if (!*(_BYTE *)(v6 + 44))
        v5 += *(_DWORD *)(v6 + 16);
      ++v3;
    }
    while (v3 != v4);
  }
}

- (void)coalesce
{
  TopoSubstring *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD *i;
  uint64_t v8;
  id v9;
  int v10;
  int v11;
  unsigned int unserializedClock;
  id v13;
  int v14;
  _QWORD *j;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  int v21;
  id v22;
  int v23;
  int v24;
  _QWORD v25[4];
  id v26;
  id v27;
  TTMergeableString *v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t *v31;
  TopoSubstring *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)(uint64_t);
  _BYTE v38[32];
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t (*v45)(uint64_t);
  _BYTE v46[32];
  uint64_t v47;
  int v48;
  _QWORD v49[3];
  int v50;

  if (!self->_editCount && !-[TTMergeableString isFragment](self, "isFragment"))
  {
    v3 = *self->_startNodes.__begin_;
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x2020000000;
    v50 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x5812000000;
    v44 = __Block_byref_object_copy__15;
    v45 = __Block_byref_object_dispose__15;
    memset(v46, 0, sizeof(v46));
    v47 = 0;
    v48 = 1065353216;
    v33 = 0;
    v34 = &v33;
    v35 = 0x5812000000;
    v36 = __Block_byref_object_copy__15;
    v37 = __Block_byref_object_dispose__15;
    memset(v38, 0, sizeof(v38));
    v39 = 0;
    v40 = 1065353216;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __29__TTMergeableString_coalesce__block_invoke;
    v25[3] = &unk_1E67FA920;
    v32 = v3;
    v29 = &v33;
    v5 = v4;
    v26 = v5;
    v6 = v18;
    v27 = v6;
    v28 = self;
    v30 = v49;
    v31 = &v41;
    -[TTMergeableString traverseUnordered:](self, "traverseUnordered:", v25);
    for (i = (_QWORD *)v42[8]; i; i = (_QWORD *)*i)
    {
      v8 = i[2];
      v9 = *(id *)v8;
      v10 = *(_DWORD *)(v8 + 8);
      v11 = *(_DWORD *)(v8 + 16);
      unserializedClock = self->_unserializedClock;
      objc_storeStrong((id *)v8, v4);
      *(_DWORD *)(v8 + 8) = unserializedClock;
      self->_unserializedClock += *(_DWORD *)(v8 + 16);
      v13 = v9;
      v22 = v13;
      v23 = v10;
      v24 = v11;
      v19 = *(id *)v8;
      v14 = *(_DWORD *)(v8 + 16);
      v20 = *(_DWORD *)(v8 + 8);
      v21 = v14;
      -[TTMergeableString updateTopoIDRange:toNewRangeID:](self, "updateTopoIDRange:toNewRangeID:", &v22, &v19);

    }
    for (j = (_QWORD *)v34[8]; j; j = (_QWORD *)*j)
    {
      v16 = j[2];
      if (v16)
      {
        v17 = *(void **)(v16 + 48);
        if (v17)
        {
          *(_QWORD *)(v16 + 56) = v17;
          operator delete(v17);
        }

        MEMORY[0x1B5E3DB94](v16, 0x1080C40D9F1C51ELL);
      }
    }
    -[TTMergeableString invalidateCache](self, "invalidateCache");

    _Block_object_dispose(&v33, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v38[8]);
    _Block_object_dispose(&v41, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v46[8]);
    _Block_object_dispose(v49, 8);
  }
}

void __29__TTMergeableString_coalesce__block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  int v25;
  id v26;
  int v27;
  id v28;
  int v29;
  int v30;
  id v31;
  int v32;
  int v33;
  id v34;
  int v35;
  int v36;
  id v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;

  v41 = a2;
  if (a1[10] != a2)
  {
    v2 = a2;
    v3 = *(uint64_t **)(a2 + 48);
    if (*(_QWORD *)(a2 + 56) - (_QWORD)v3 == 8)
    {
      do
      {
        v40 = 0;
        v5 = *v3;
        v40 = v5;
        if (*(_DWORD *)(v5 + 72) != 1 || *(unsigned __int8 *)(v2 + 44) != *(unsigned __int8 *)(v5 + 44))
          return;
        if ((objc_msgSend(*(id *)v2, "isEqual:", *(_QWORD *)v5) & 1) != 0)
        {
          v6 = v41;
          if (*(_DWORD *)(v2 + 16) + *(_DWORD *)(v2 + 8) == *(_DWORD *)(v5 + 8)
            && *(_DWORD *)(v41 + 32) == *(_DWORD *)(v40 + 32))
          {
            v7 = objc_msgSend(*(id *)(v41 + 24), "isEqual:", *(_QWORD *)(v40 + 24));
            v6 = v41;
            if (v7)
            {
              v8 = v41;
              if (v41 != v40)
              {
                std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v41 + 48), *(char **)(v40 + 48), *(_QWORD *)(v40 + 56), (uint64_t)(*(_QWORD *)(v40 + 56) - *(_QWORD *)(v40 + 48)) >> 3);
                v8 = v40;
                v6 = v41;
              }
              *(_DWORD *)(v6 + 16) += *(_DWORD *)(v8 + 16);
              std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(a1[7] + 8) + 48, &v40, &v40);
              goto LABEL_26;
            }
          }
        }
        else
        {
          v6 = v41;
        }
        if (*(_QWORD *)v6 != a1[4]
          || *(_QWORD *)v40 != *(_QWORD *)v6
          || *(_DWORD *)(v6 + 32) != *(_DWORD *)(v40 + 32)
          || !objc_msgSend(*(id *)(v6 + 24), "isEqual:", *(_QWORD *)(v40 + 24)))
        {
          return;
        }
        v9 = v41;
        v10 = *(id *)v41;
        v11 = *(_DWORD *)(v9 + 8);
        v12 = *(_DWORD *)(v9 + 16);
        if (v41 != v40)
          std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v41 + 48), *(char **)(v40 + 48), *(_QWORD *)(v40 + 56), (uint64_t)(*(_QWORD *)(v40 + 56) - *(_QWORD *)(v40 + 48)) >> 3);
        v13 = (void *)a1[5];
        v14 = v13;
        v15 = *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
        v16 = v41;
        v17 = *(_DWORD *)(v41 + 16);
        v18 = v14;
        v19 = *(_DWORD *)(v40 + 16) + *(_DWORD *)(v16 + 16);
        objc_storeStrong((id *)v16, v13);
        *(_DWORD *)(v16 + 8) = v15;
        *(_DWORD *)(v16 + 16) = v19;
        *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += *(_DWORD *)(v41 + 16);
        v20 = (void *)a1[6];
        v21 = v10;
        v37 = v21;
        v38 = v11;
        v39 = v12;
        v22 = v18;
        v34 = v22;
        v35 = v15;
        v36 = v12;
        if (v20)
        {
          objc_msgSend(v20, "updateTopoIDRange:toNewRangeID:", &v37, &v34);
        }
        else
        {

        }
        v23 = (void *)a1[6];
        v24 = v40;
        v31 = *(id *)v40;
        v25 = *(_DWORD *)(v24 + 16);
        v32 = *(_DWORD *)(v24 + 8);
        v33 = v25;
        v26 = v22;
        v28 = v26;
        v27 = *(_DWORD *)(v40 + 16);
        v29 = v17 + v15;
        v30 = v27;
        if (v23)
        {
          objc_msgSend(v23, "updateTopoIDRange:toNewRangeID:", &v31, &v28);
        }
        else
        {

        }
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(a1[9] + 8) + 48, &v41, &v41);
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(_QWORD *)(a1[7] + 8) + 48, &v40, &v40);
        *(_BYTE *)(a1[6] + 112) = 1;

LABEL_26:
        v2 = v41;
        v3 = *(uint64_t **)(v41 + 48);
      }
      while (*(_QWORD *)(v41 + 56) - (_QWORD)v3 == 8);
    }
  }
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int var1;
  unsigned int v13;
  void (**updateRangeBlock)(id, id *, id *);
  unsigned int v15;
  unsigned int v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  id v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  unsigned int v27;
  unsigned int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[TTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v26 = a3->var0.var0;
        var1 = a3->var1;
        v27 = a3->var0.var1;
        v28 = var1;
        v23 = a4->var0.var0;
        v13 = a4->var1;
        v24 = a4->var0.var1;
        v25 = v13;
        if (v11)
        {
          objc_msgSend(v11, "updateTopoIDRange:toNewRangeID:", &v26, &v23);
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  updateRangeBlock = (void (**)(id, id *, id *))self->_updateRangeBlock;
  if (updateRangeBlock)
  {
    v20 = a3->var0.var0;
    v15 = a3->var1;
    v21 = a3->var0.var1;
    v22 = v15;
    v17 = a4->var0.var0;
    v16 = a4->var1;
    v18 = a4->var0.var1;
    v19 = v16;
    updateRangeBlock[2](updateRangeBlock, &v20, &v17);
  }

}

- (void)cleanupObjectsNeedingUpdatedRanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasTopoIDsThatCanChange") & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[TTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusHashTable:", v3);

}

- (void)generateIdsForLocalChanges
{
  id v3;

  -[TTMergeableString timestamp](self, "timestamp");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TTMergeableString generateIdsForLocalChangesSafeForSharedTimestamp:](self, "generateIdsForLocalChangesSafeForSharedTimestamp:", objc_msgSend(v3, "isDocumentShared"));

}

- (void)generateIdsForLocalChangesSafeForSharedTimestamp:(BOOL)a3
{
  unint64_t replicaStyleClock;
  void *v6;
  void ****v7;
  void ***v8;
  void ***v9;
  char v10;
  void **v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSUUID *replicaUUID;
  NSUUID *v17;
  int replicaTextClock;
  uint64_t v19;
  int v20;
  NSUUID *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  NSUUID *v29;
  int v30;
  int v31;
  id v32;
  int v33;
  int v34;

  if (self->_hasLocalChanges)
  {
    replicaStyleClock = self->_replicaStyleClock;
    +[TTMergeableString unserialisedReplicaID](TTMergeableString, "unserialisedReplicaID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v28 = a3;
    v8 = *v7;
    v9 = v7[1];
    if (*v7 != v9)
    {
      v10 = 0;
      while (1)
      {
        v11 = *v8;
        if (**v8 == v6)
          break;
        if (v11[3] == v6)
        {
          v12 = *((_DWORD *)v11 + 8);
          LODWORD(v13) = v12 + 8;
          if (*((_BYTE *)v11 + 44))
            v13 = v13;
          else
            v13 = (v12 + 1);
          if (replicaStyleClock <= v13)
            v14 = v13;
          else
            v14 = replicaStyleClock;
          if (v14 + 1 > self->_replicaStyleClock)
            v15 = v14 + 1;
          else
            v15 = self->_replicaStyleClock;
          self->_replicaStyleClock = v15;
          objc_storeStrong(v11 + 3, self->_replicaUUID);
          *((_DWORD *)v11 + 8) = v14;
LABEL_21:
          v10 = 1;
        }
        if (++v8 == v9)
          goto LABEL_25;
      }
      replicaUUID = self->_replicaUUID;
      v17 = replicaUUID;
      replicaTextClock = self->_replicaTextClock;
      v19 = *((unsigned int *)v11 + 4);
      v32 = *v11;
      v20 = *((_DWORD *)v11 + 4);
      v33 = *((_DWORD *)v11 + 2);
      v34 = v20;
      v21 = v17;
      v29 = v21;
      v30 = replicaTextClock;
      v31 = v19;
      -[TTMergeableString updateTopoIDRange:toNewRangeID:](self, "updateTopoIDRange:toNewRangeID:", &v32, &v29);
      objc_storeStrong(v11, replicaUUID);
      v22 = v11[3];
      *((_DWORD *)v11 + 2) = replicaTextClock;
      *((_DWORD *)v11 + 4) = v19;
      self->_replicaTextClock += v19;
      if (v22 == v6)
      {
        objc_storeStrong(v11 + 3, self->_replicaUUID);
        *((_DWORD *)v11 + 8) = 0;
        v23 = self->_replicaStyleClock;
        if (v23 <= 1)
          v23 = 1;
        self->_replicaStyleClock = v23;
      }

      goto LABEL_21;
    }
    v10 = 0;
LABEL_25:
    -[TTMergeableString cleanupObjectsNeedingUpdatedRanges](self, "cleanupObjectsNeedingUpdatedRanges");
    if ((v10 & 1) == 0)
      goto LABEL_35;
    if (v28)
    {
      v24 = -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0);
      v25 = self->_replicaTextClock;
      if (v24 >= v25)
        goto LABEL_31;
    }
    else
    {
      v25 = self->_replicaTextClock;
    }
    -[TTVectorMultiTimestamp setClock:forUUID:atIndex:](self->_timestamp, "setClock:forUUID:atIndex:", v25, self->_replicaUUID, 0);
    if (!v28)
    {
      v27 = self->_replicaStyleClock;
LABEL_34:
      -[TTVectorMultiTimestamp setClock:forUUID:atIndex:](self->_timestamp, "setClock:forUUID:atIndex:", v27, self->_replicaUUID, 1);
LABEL_35:
      self->_unserializedClock = 0;
      self->_hasLocalChanges = 0;

      return;
    }
LABEL_31:
    v26 = -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 1);
    v27 = self->_replicaStyleClock;
    if (v26 >= v27)
      goto LABEL_35;
    goto LABEL_34;
  }
}

- (BOOL)canMergeString:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  id **v7;
  id **v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  id **v16;
  id **v17;
  id *v18;
  id v19;
  int v20;
  int v21;
  id v22;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  int v28;

  v4 = a3;
  if (-[TTMergeableString isFragment](self, "isFragment"))
  {
    v5 = 0;
  }
  else if (objc_msgSend(v4, "isFragment"))
  {
    v26 = 0u;
    v27 = 0u;
    v28 = 1065353216;
    v6 = objc_msgSend(v4, "startNodes");
    v7 = *(id ***)v6;
    v8 = *(id ***)(v6 + 8);
    while (v7 != v8)
    {
      v9 = *v7;
      v10 = **v7;
      v11 = (*((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1);
      v24 = v10;
      v25 = v11;
      std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__emplace_unique_key_args<TopoID,TopoID>((uint64_t)&v26, &v24, (uint64_t *)&v24);

      ++v7;
    }
    v12 = objc_msgSend(v4, "endNodes");
    v13 = *(uint64_t **)v12;
    v14 = *(uint64_t **)(v12 + 8);
    while (v13 != v14)
    {
      std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__emplace_unique_key_args<TopoID,TopoID const&>((uint64_t)&v26, (_QWORD *)*v13, *v13);
      ++v13;
    }
    v15 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v16 = (id **)*v15;
    v17 = (id **)v15[1];
LABEL_12:
    if (v16 != v17)
    {
      v18 = *v16;
      v19 = **v16;
      v20 = *((_DWORD *)v18 + 2);
      if (*((_DWORD *)v18 + 4) <= 1u)
        v21 = 1;
      else
        v21 = *((_DWORD *)v18 + 4);
      while (1)
      {
        v22 = v19;
        v24 = v22;
        LODWORD(v25) = v20;
        std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__erase_unique<TopoID>(&v26, &v24);

        if (!*((_QWORD *)&v27 + 1))
          break;
        ++v20;
        if (!--v21)
        {

          ++v16;
          goto LABEL_12;
        }
      }

    }
    v5 = *((_QWORD *)&v27 + 1) == 0;
    std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)&v26);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)updateClock
{
  void *v3;
  void ****v4;
  void ***v5;
  void ***v6;
  unsigned int v7;
  unsigned int v8;
  void **v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  TTMergeableString *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  TTMergeableString *v27;
  id v28;

  if (self->_replicaUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v27 = self;
    v5 = *v4;
    v6 = v4[1];
    if (*v4 != v6)
    {
      v7 = 0;
      v8 = 0;
      while (1)
      {
        v9 = *v5;
        v10 = **v5;
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
          goto LABEL_12;
        v12 = *v9;
        v13 = v12;
        v14 = *((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1;
        if (v14 > v7)
          break;
        if (v14 != v7)
        {

          goto LABEL_12;
        }
        v16 = objc_msgSend(v12, "TTCompare:", v28);

        if (v16 == 1)
          goto LABEL_7;
LABEL_13:
        v17 = v9[3];
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqual:", v18) & 1) == 0)
        {
          v19 = *((_DWORD *)v9 + 8);
          if (v19 > v8)
          {

LABEL_17:
            v20 = v9[3];

            v8 = *((_DWORD *)v9 + 8);
            v3 = v20;
            goto LABEL_18;
          }
          if (v19 == v8)
          {
            v21 = objc_msgSend(v9[3], "TTCompare:", v3);

            if (v21 != 1)
              goto LABEL_18;
            goto LABEL_17;
          }
        }

LABEL_18:
        if (++v5 == v6)
          goto LABEL_25;
      }

LABEL_7:
      v15 = *v9;
      v11 = v28;
      v7 = *((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1;
      v28 = v15;
LABEL_12:

      goto LABEL_13;
    }
    v8 = 0;
    v7 = 0;
LABEL_25:
    v22 = v27;
    v23 = objc_msgSend(v28, "TTCompare:", v27->_replicaUUID, v27);
    v24 = objc_msgSend(v3, "TTCompare:", v22->_replicaUUID);
    if (v23 == -1)
      v25 = v7;
    else
      v25 = v7 + 1;
    if (v24 == -1)
      v26 = v8;
    else
      v26 = v8 + 1;
    v22->_replicaTextClock = v25;
    v22->_replicaStyleClock = v26;

  }
}

- (BOOL)check:(id *)a3
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (hasLoop(*self->_startNodes.__begin_))
  {
    if (!a3)
      return 0;
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = *MEMORY[0x1E0CB2D68];
    v27[0] = CFSTR("TTMergeableString graph has loop.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -1, v6);
    v8 = 0;
    *a3 = v7;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__25;
    v20 = __Block_byref_object_dispose__26;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __27__TTMergeableString_check___block_invoke;
    v12[3] = &unk_1E67FA948;
    v6 = v9;
    v13 = v6;
    v14 = &v16;
    v15 = &v22;
    -[TTMergeableString traverseUnordered:](self, "traverseUnordered:", v12);
    if (a3)
    {
      v10 = (void *)v17[5];
      if (v10)
        *a3 = objc_retainAutorelease(v10);
    }
    v8 = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v8;
}

void __27__TTMergeableString_check___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = *(id *)a2;
  v7 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v7)
  {
    v8 = *(unsigned int *)(a2 + 8);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "intersectsIndexesInRange:", v8, v7))
      {
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0CB2D68];
        v17[0] = CFSTR("TTMergeableString graph has two characters with the same id.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -2, v12);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
      else
      {
        objc_msgSend(v10, "addIndexesInRange:", v8, v7);
      }
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", v8, v7);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
    }

  }
}

- (void)checkTimestampLogStyleErrors:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__TTMergeableString_checkTimestampLogStyleErrors___block_invoke;
  v3[3] = &unk_1E67FA970;
  v3[4] = self;
  v4 = a3;
  -[TTMergeableString traverseUnordered:](self, "traverseUnordered:", v3);
}

void __50__TTMergeableString_checkTimestampLogStyleErrors___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  if (*(_DWORD *)(a2 + 16))
  {
    v4 = *(id *)a2;
    v5 = *(id *)(a2 + 24);
    v6 = *(_DWORD *)(a2 + 8);
    v7 = *(_DWORD *)(a2 + 16);
    v8 = *(unsigned int *)(a2 + 32);
    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "clockForUUID:atIndex:", v4, 0);

    objc_msgSend(*(id *)(a1 + 32), "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "clockForUUID:atIndex:", v5, 1);
    v13 = (v7 + v6);

    if (v10 <= (v13 - 1))
    {
      +[REMLog crdt](REMLog, "crdt");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __50__TTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);

      objc_msgSend(*(id *)(a1 + 32), "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setClock:forUUID:atIndex:", v13, v4, 0);

    }
    if (v12 <= v8)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        +[REMLog crdt](REMLog, "crdt");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __50__TTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);

      }
      objc_msgSend(*(id *)(a1 + 32), "timestamp");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setClock:forUUID:atIndex:", (v8 + 1), v5, 1);

    }
  }
}

- (void)dumpMergeData:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint32_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v15;
  uint64_t j;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSMutableAttributedString *attributedString;
  NSMutableAttributedString *v32;
  id v33;
  NSUUID *replicaUUID;
  void *v35;
  NSMutableAttributedString *v36;
  id *v37;
  uint8_t buf[4];
  TTMergeableString *v39;
  __int16 v40;
  NSUUID *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = -[NSMutableAttributedString mutableCopy](self->_attributedString, "mutableCopy");
  v6 = objc_msgSend(v4[19], "mutableCopy");
  v7 = arc4random();
  v35 = (void *)v6;
  v36 = (NSMutableAttributedString *)v5;
  v37 = v4;
  v8 = -[NSMutableAttributedString length](self->_attributedString, "length");
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      -[NSMutableAttributedString mutableString](self->_attributedString, "mutableString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[NSMutableAttributedString mutableString](self->_attributedString, "mutableString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%c"), (v7 ^ objc_msgSend(v12, "characterAtIndex:", i)) % 0x5E + 32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceCharactersInRange:withString:", i, 1, v13);

    }
  }
  v14 = v37;
  v15 = objc_msgSend(v37[19], "length");
  if (v15)
  {
    for (j = 0; j != v15; ++j)
    {
      v17 = v14;
      objc_msgSend(v14[19], "mutableString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17[19], "mutableString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%c"), (v7 ^ objc_msgSend(v20, "characterAtIndex:", j)) % 0x5E + 32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "replaceCharactersInRange:withString:", j, 1, v21);

      v14 = v37;
    }
  }
  -[TTMergeableString serialize](self, "serialize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialize");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "remcrtt_createTemporaryFileDirectoryURLIfNeeded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mergeA-%p.data"), self);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingPathComponent:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mergeB-%p.data"), self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingPathComponent:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "writeToFile:atomically:", v27, 1);
  objc_msgSend(v23, "writeToFile:atomically:", v29, 1);
  +[REMLog crdt](REMLog, "crdt");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    replicaUUID = self->_replicaUUID;
    *(_DWORD *)buf = 134218754;
    v39 = self;
    v40 = 2112;
    v41 = replicaUUID;
    v42 = 2112;
    v43 = v27;
    v44 = 2112;
    v45 = v29;
    _os_log_error_impl(&dword_1B4A39000, v30, OS_LOG_TYPE_ERROR, "Dumping merge: %p %@ %@ %@", buf, 0x2Au);
  }

  attributedString = self->_attributedString;
  self->_attributedString = v36;
  v32 = v36;

  v33 = v37[19];
  v37[19] = v35;

}

- (unint64_t)mergeWithString:(id)a3
{
  return -[TTMergeableString mergeWithString:mergeTimestamps:](self, "mergeWithString:mergeTimestamps:", a3, 1);
}

- (unint64_t)mergeWithString:(id)a3 mergeTimestamps:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  void *v8;
  id **v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  TopoSubstring ****v14;
  TopoSubstring ***v15;
  TopoSubstring ***v16;
  TopoSubstring **v17;
  uint64_t v18;
  id **v19;
  id *v20;
  unsigned int v21;
  unsigned int v22;
  char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  unsigned int v27;
  unsigned int v28;
  TopoSubstring *v29;
  id v30;
  int v31;
  TopoSubstring **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  TopoSubstring **v38;
  TopoSubstring *v39;
  uint64_t *v40;
  int v41;
  NSMutableAttributedString *attributedString;
  void *v43;
  uint64_t v44;
  uint64_t **v45;
  uint64_t **v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  BOOL v51;
  char *v52;
  TopoSubstring **v53;
  unsigned int v54;
  unsigned int v55;
  __int128 *v56;
  NSMutableAttributedString *v57;
  int v58;
  NSMutableAttributedString *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id *v65;
  void *v66;
  void *v67;
  void *v68;
  TopoSubstring ****v69;
  TopoSubstring ***v70;
  TopoSubstring ***v71;
  char v72;
  uint64_t v73;
  id **v74;
  _QWORD *v75;
  _QWORD *v76;
  BOOL v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *i;
  _QWORD *j;
  uint64_t v95;
  void *v96;
  _BOOL4 v98;
  uint64_t v99;
  id v100;
  char **v101;
  void *v102;
  id v103;
  id v104;
  TopoSubstring **v105;
  int v106;
  TopoSubstring *v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  int v111;
  __int128 v112;
  __int128 v113;
  int v114;
  __int128 v115;
  __int128 v116;
  int v117;
  __int128 v118;
  __int128 v119;
  int v120;
  _QWORD v121[4];
  int v122;
  uint64_t *v123;
  uint64_t v124;
  _QWORD v125[4];

  v4 = a4;
  v125[1] = *MEMORY[0x1E0C80C00];
  v103 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("DebugDumpMergeData"));

  if (v7)
    -[TTMergeableString dumpMergeData:](self, "dumpMergeData:", v103);
  -[TTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  objc_msgSend(v103, "generateIdsForLocalChanges");
  objc_msgSend(v103, "checkTimestampLogStyleErrors:", 0);
  if (!-[TTMergeableString canMergeString:](self, "canMergeString:", v103))
  {
    v11 = 0;
    goto LABEL_131;
  }
  -[TTMergeableString timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "timestamp");
  v9 = (id **)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compareTo:", v9);

  if ((v10 & 1) != 0)
  {
    memset(v121, 0, sizeof(v121));
    v122 = 1065353216;
    v118 = 0u;
    v119 = 0u;
    v120 = 1065353216;
    v115 = 0u;
    v116 = 0u;
    v117 = 1065353216;
    v112 = 0u;
    v113 = 0u;
    v114 = 1065353216;
    v109 = 0u;
    v110 = 0u;
    v111 = 1065353216;
    v12 = -[NSMutableAttributedString length](self->_attributedString, "length");
    v13 = objc_msgSend(v103, "isFragment");
    v99 = v12;
    v98 = v4;
    v14 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v15 = *v14;
    v16 = v14[1];
    if (*v14 != v16)
    {
      v10 = (uint64_t)&std::piecewise_construct;
      do
      {
        v17 = *v15;
        v105 = v17;
        *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v121, v17, (uint64_t)&std::piecewise_construct, (uint64_t *)&v105)+ 4) = v17;
        if (v13)
        {
          v18 = objc_msgSend(v103, "startNodes");
          v9 = *(id ***)v18;
          v19 = *(id ***)(v18 + 8);
          while (v9 != v19)
          {
            v20 = *v9;
            if (objc_msgSend(**v9, "isEqual:", *v17))
            {
              v21 = *((_DWORD *)v20 + 2);
              v22 = *((_DWORD *)v17 + 2);
              if (v21 >= v22 && v21 < *((_DWORD *)v17 + 4) + v22)
              {
                v105 = (TopoSubstring **)v20;
                *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v121, v20, (uint64_t)&std::piecewise_construct, (uint64_t *)&v105)+ 4) = v17;
              }
            }
            ++v9;
          }
        }
        ++v15;
      }
      while (v15 != v16);
    }
    v101 = (char **)objc_msgSend(v103, "orderedSubstrings");
    v23 = *v101;
    if (*v101 == v101[1])
    {
LABEL_48:
      v100 = 0;
    }
    else
    {
      v9 = (id **)&v107;
      while (1)
      {
        v24 = *(_QWORD *)v23;
        v25 = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v121, *(_QWORD **)v23);
        v26 = v25;
        if (!v25)
          break;
        v108 = v25[4];
        v27 = *(_DWORD *)(v108 + 16);
        v28 = *(_DWORD *)(v24 + 16);
        if (v27 <= v28)
        {
          if (v27 < v28)
          {
            v105 = 0;
            v105 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v24);
            v23 = std::vector<TopoSubstring *>::insert((uint64_t)v101, v23 + 8, (char *)&v105) - 8;
          }
        }
        else
        {
          v107 = 0;
          v29 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:");
          v107 = v29;
          v30 = *(id *)v29;
          v31 = *((_DWORD *)v29 + 2);
          v32 = (TopoSubstring **)v30;
          v105 = v32;
          v106 = v31;
          v123 = (uint64_t *)&v105;
          *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID&&>,std::tuple<>>((uint64_t)v121, &v105, (uint64_t)&std::piecewise_construct, &v123)+ 4) = v29;

          if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v109, &v108))
          {
            v105 = (TopoSubstring **)&v108;
            v33 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v109, &v108, (uint64_t)&std::piecewise_construct, &v105)[3];
            v105 = &v107;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v109, &v107, (uint64_t)&std::piecewise_construct, &v105)[3] = v33;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__erase_unique<TopoSubstring *>(&v109, &v108);
          }

        }
        v10 = *(_QWORD *)(v24 + 48);
        v34 = *(_QWORD *)(v24 + 56);
        while (v10 != v34)
        {
          v35 = *(_QWORD *)v10;
          v36 = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v121, *(_QWORD **)v10);
          v123 = 0;
          if (v36)
          {
            v37 = v36[4];
            v123 = (uint64_t *)v37;
            if (*(_DWORD *)(v37 + 8) != *(_DWORD *)(v35 + 8)
              || (objc_msgSend(*(id *)v37, "isEqual:", *(_QWORD *)v35) & 1) == 0)
            {
              v38 = -[TTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:");
              v105 = v38;
              *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v121, v38, (uint64_t)&std::piecewise_construct, (uint64_t *)&v105)+ 4) = v38;
              v123 = (uint64_t *)v38;
            }
          }
          else
          {
            v39 = (TopoSubstring *)operator new();
            TopoSubstring::TopoSubstring(v39, (TopoSubstring *)v35);
            v123 = v40;
            v105 = (TopoSubstring **)v35;
            *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v121, (_QWORD *)v35, (uint64_t)&std::piecewise_construct, (uint64_t *)&v105)+ 4) = v39;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v115, &v123, &v123);
            if (!*(_BYTE *)(v35 + 44))
            {
              v41 = TTBoundedCheckedCastNSUIntegerToUInt32(-[NSMutableAttributedString length](self->_attributedString, "length"));
              *((_DWORD *)v123 + 10) = v41;
              attributedString = self->_attributedString;
              objc_msgSend(v103, "string");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (*(_BYTE *)(v35 + 44))
                v44 = 0;
              else
                v44 = *(unsigned int *)(v35 + 16);
              -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](attributedString, "ic_appendAttributedSubstring:fromRange:", v43, *(unsigned int *)(v35 + 40), v44);

            }
          }
          v107 = (TopoSubstring *)v26[4];
          v46 = (uint64_t **)*((_QWORD *)v107 + 6);
          v45 = (uint64_t **)*((_QWORD *)v107 + 7);
          if (v46 != v45)
          {
            while (*v46 != v123)
            {
              if (++v46 == v45)
              {
                v46 = (uint64_t **)*((_QWORD *)v107 + 7);
                break;
              }
            }
          }
          if (v46 == v45)
          {
            if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v109, &v107))
            {
              v48 = *((_QWORD *)v107 + 6);
              v47 = *((_QWORD *)v107 + 7);
              v105 = &v107;
              std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v109, &v107, (uint64_t)&std::piecewise_construct, &v105)[3] = (v47 - v48) >> 3;
            }
            TopoSubstring::addChild(v107, (TopoSubstring *)v123);
          }
          v10 += 8;
        }
        v23 += 8;
        if (v23 == v101[1])
          goto LABEL_48;
      }
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v124 = *MEMORY[0x1E0CB2D68];
      v125[0] = CFSTR("Reached substring that is not in our graph.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, &v124, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", CFSTR("TopoText"), -3, v50);

    }
    -[TTMergeableString invalidateCache](self, "invalidateCache");
    if (v100 || (v104 = 0, v51 = -[TTMergeableString check:](self, "check:", &v104), v100 = v104, !v51))
    {
      +[REMLog crdt](REMLog, "crdt");
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        -[TTMergeableString mergeWithString:mergeTimestamps:].cold.2((uint64_t)v100, v84);

      +[REMLog crdt](REMLog, "crdt");
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        -[TTMergeableString mergeWithString:mergeTimestamps:].cold.1(v85, v86, v87, v88, v89, v90, v91, v92);

      for (i = (_QWORD *)v110; i; i = (_QWORD *)*i)
        std::vector<TopoSubstring *>::resize(i[2] + 48, i[3]);
      traverseUnorderedSimple((uint64_t)*self->_startNodes.__begin_, &__block_literal_global_45);
      traverseUnorderedSimple((uint64_t)*self->_startNodes.__begin_, &__block_literal_global_46_0);
      -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attributedString, "replaceCharactersInRange:withString:", v99, -[NSMutableAttributedString length](self->_attributedString, "length") - v99, &stru_1E67FB1F0);
      for (j = (_QWORD *)v116; j; j = (_QWORD *)*j)
      {
        v95 = j[2];
        if (v95)
        {
          v96 = *(void **)(v95 + 48);
          if (v96)
          {
            *(_QWORD *)(v95 + 56) = v96;
            operator delete(v96);
          }

          MEMORY[0x1B5E3DB94](v95, 0x1080C40D9F1C51ELL);
        }
      }
      -[TTMergeableString invalidateCache](self, "invalidateCache");
      -[TTMergeableString coalesce](self, "coalesce");
      -[TTMergeableString dumpMergeData:](self, "dumpMergeData:", v103);
      v11 = 0;
    }
    else
    {
      v52 = *v101;
      if (*v101 != v101[1])
      {
        v10 = (uint64_t)&v112;
        while (1)
        {
          v9 = *(id ***)v52;
          v53 = (TopoSubstring **)std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v121, *(_QWORD **)v52)[4];
          v105 = v53;
          v54 = *((_DWORD *)v53 + 8);
          v55 = *((_DWORD *)v9 + 8);
          if (v54 < v55)
            goto LABEL_55;
          if (v54 == v55 && -[TopoSubstring TTCompare:](v53[3], "TTCompare:", v9[3]) == -1)
            break;
LABEL_77:
          v52 += 8;
          if (v52 == v101[1])
            goto LABEL_78;
        }
        v53 = v105;
LABEL_55:
        if (*((_BYTE *)v53 + 44))
        {
          if (*((_BYTE *)v9 + 44))
          {
LABEL_65:
            if (!*((_BYTE *)v9 + 44))
            {
              v57 = self->_attributedString;
              if (*((_BYTE *)v105 + 44))
              {
                v58 = TTBoundedCheckedCastNSUIntegerToUInt32(-[NSMutableAttributedString length](self->_attributedString, "length"));
                *((_DWORD *)v105 + 10) = v58;
                v59 = self->_attributedString;
                objc_msgSend(v103, "string");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (*((_BYTE *)v9 + 44))
                  v61 = 0;
                else
                  v61 = *((unsigned int *)v9 + 4);
                -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](v59, "ic_appendAttributedSubstring:fromRange:", v60, *((unsigned int *)v9 + 10), v61);
              }
              else
              {
                v62 = *((unsigned int *)v105 + 10);
                v63 = *((unsigned int *)v105 + 4);
                objc_msgSend(v103, "string");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (*((_BYTE *)v9 + 44))
                  v64 = 0;
                else
                  v64 = *((unsigned int *)v9 + 4);
                -[NSMutableAttributedString ic_replaceCharactersInRange:withAttributedSubstring:fromRange:](v57, "ic_replaceCharactersInRange:withAttributedSubstring:fromRange:", v62, v63, v60, *((unsigned int *)v9 + 10), v64);
              }

            }
            v65 = (id *)v105;
            *((_BYTE *)v105 + 44) = *((_BYTE *)v9 + 44);
            objc_storeStrong(v65 + 3, v9[3]);
            *((_DWORD *)v65 + 8) = *((_DWORD *)v9 + 8);
            goto LABEL_77;
          }
          v56 = &v115;
        }
        else if (*((_BYTE *)v9 + 44))
        {
          v56 = &v118;
        }
        else
        {
          v56 = &v112;
        }
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v56, &v105, &v105);
        goto LABEL_65;
      }
LABEL_78:
      -[TTMergeableString sortSplitNodes](self, "sortSplitNodes");
      -[TTMergeableString invalidateCache](self, "invalidateCache");
      objc_msgSend(v103, "invalidateCache");
      -[TTMergeableString updateAttributedStringAfterMerge](self, "updateAttributedStringAfterMerge");
      if (v98)
      {
        -[TTMergeableString timestamp](self, "timestamp");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "timestamp");
        v9 = (id **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "mergeWithTimestamp:", v9);

        -[TTMergeableString updateClock](self, "updateClock");
        -[TTMergeableString checkTimestampLogStyleErrors:](self, "checkTimestampLogStyleErrors:", 1);
      }
      -[TTMergeableString delegate](self, "delegate");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v67)
      {
        v102 = v67;
        objc_msgSend(v67, "beginEditing");
        v69 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
        v70 = *v69;
        v71 = v69[1];
        if (*v69 != v71)
        {
          v72 = 0;
          v73 = 0;
          v74 = 0;
          do
          {
            v105 = *v70;
            v75 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v115, &v105);
            v76 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v118, &v105);
            v77 = v76 != 0;
            if (v75)
            {
              if (!*((_BYTE *)v105 + 44))
              {
                if ((v72 & 1) != 0)
                  v78 = v73;
                else
                  v78 = 0;
                if ((v72 & 1) == 0)
                {
                  v10 = 0;
                  v9 = v74;
                }
                v73 = v78 + *((unsigned int *)v105 + 4);
                v72 = 1;
              }
            }
            else
            {
              v79 = v76;
              if (v76)
              {
                if ((v72 & 1) != 0)
                  v80 = v73;
                else
                  v80 = 0;
                if ((v72 & 1) != 0)
                  v81 = v10;
                else
                  v81 = 0;
                if ((v72 & 1) == 0)
                  v9 = v74;
                v82 = *((unsigned int *)v105 + 4);
                v10 = v81 + v82;
                v73 = v80 - v82;
              }
              else if ((v72 & 1) != 0)
              {
                objc_msgSend(v102, "edited:range:changeInLength:", 2, v9, v10, v73);
                v74 = (id **)((char *)v74 + v73);
              }
              if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v112, &v105))
              {
                objc_msgSend(v102, "edited:range:changeInLength:", 1, v74, *((unsigned int *)v105 + 4), 0);
              }
              if (*((_BYTE *)v105 + 44))
                v83 = v79 == 0;
              else
                v83 = 0;
              if (v83)
              {
                v72 = 0;
              }
              else
              {
                v74 = (id **)((char *)v74 + *((unsigned int *)v105 + 4));
                v72 = v77;
              }
            }
            ++v70;
          }
          while (v70 != v71);
        }
        v68 = v102;
        objc_msgSend(v102, "endEditing");
      }
      if (*((_QWORD *)&v119 + 1) | *((_QWORD *)&v116 + 1) | *((_QWORD *)&v113 + 1))
        v11 = 2;
      else
        v11 = 1;

    }
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v109);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v112);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v115);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v118);
    std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)v121);

    goto LABEL_131;
  }
  v11 = 1;
LABEL_131:

  return v11;
}

void __53__TTMergeableString_mergeWithString_mergeTimestamps___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
}

void __53__TTMergeableString_mergeWithString_mergeTimestamps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;

  v2 = *(uint64_t **)(a2 + 48);
  v3 = *(uint64_t **)(a2 + 56);
  while (v2 != v3)
  {
    v4 = *v2++;
    ++*(_DWORD *)(v4 + 72);
  }
}

- (void)sortSplitNodes
{
  id v2[4];

  minIdPath(*self->_startNodes.__begin_, (uint64_t)v2);

}

- (void)traverseUnordered:(id)a3
{
  TopoSubstring **end;
  uint64_t *begin;
  id v6;

  v6 = a3;
  begin = (uint64_t *)self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  while (begin != (uint64_t *)end)
    traverseUnordered(*begin++, v6);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTMergeableString string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p = '%@'>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableAttributedString *attributedString;
  void *v6;
  BOOL v7;

  v4 = a3;
  attributedString = self->_attributedString;
  objc_msgSend(v4, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(attributedString) = -[NSMutableAttributedString isEqual:](attributedString, "isEqual:", v6);

  v7 = (attributedString & 1) != 0 && -[TTMergeableString graphIsEqual:](self, "graphIsEqual:", v4);
  return v7;
}

- (BOOL)graphIsEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)(uint64_t);
  _BYTE v26[32];
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x5812000000;
  v24 = __Block_byref_object_copy__51;
  v25 = __Block_byref_object_dispose__52;
  memset(v26, 0, sizeof(v26));
  v27 = 0;
  v28 = 1065353216;
  -[TTMergeableString coalesce](self, "coalesce");
  objc_msgSend(v4, "coalesce");
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __34__TTMergeableString_graphIsEqual___block_invoke;
  v20[3] = &unk_1E67FA860;
  v20[4] = &v21;
  -[TTMergeableString traverseUnordered:](self, "traverseUnordered:", v20);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __34__TTMergeableString_graphIsEqual___block_invoke_2;
  v19[3] = &unk_1E67FA9F8;
  v19[4] = &v21;
  v19[5] = &v29;
  objc_msgSend(v4, "traverseUnordered:", v19);
  if (*((_BYTE *)v30 + 24))
  {
    v6 = (uint64_t **)v22[8];
    if (v6)
    {
      while (1)
      {
        v7 = v6[2];
        v9 = v6[4];
        v8 = v6[5];
        if (!v9 || v8 == 0)
          break;
        v12 = v9[6];
        v11 = v9[7];
        v13 = (v11 - v12) >> 3;
        if (v13 != (v8[7] - v8[6]) >> 3)
          break;
        if (v11 != v12)
        {
          v14 = 0;
          if (v13 <= 1)
            v15 = 1;
          else
            v15 = (v11 - v12) >> 3;
          while (1)
          {
            v16 = **(void ***)(v9[6] + 8 * v14);
            if ((objc_msgSend(v16, "isEqual:", v16) & 1) == 0)
              break;
            if (v15 == ++v14)
              goto LABEL_16;
          }
          *((_BYTE *)v30 + 24) = 0;
        }
LABEL_16:
        if (!*((_BYTE *)v30 + 24))
          goto LABEL_20;

        v6 = (uint64_t **)*v6;
        if (!v6)
          goto LABEL_21;
      }
      *((_BYTE *)v30 + 24) = 0;
LABEL_20:

    }
  }
LABEL_21:
  v17 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v21, 8);
  std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)&v26[8]);
  _Block_object_dispose(&v29, 8);

  return v17;
}

_QWORD *__34__TTMergeableString_graphIsEqual___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  _QWORD *v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v7 = a2;
  *((_QWORD *)std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, (uint64_t *)&v7)+ 4) = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48;
  v7 = a2;
  result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v5, a2, (uint64_t)&std::piecewise_construct, (uint64_t *)&v7);
  result[5] = 0;
  return result;
}

uint64_t *__34__TTMergeableString_graphIsEqual___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t *result;
  uint64_t *v7;
  uint64_t v8;

  result = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), (_QWORD *)a2);
  if (result
    && (v7 = result, v8 = result[4], *(_DWORD *)(a2 + 32) == *(_DWORD *)(v8 + 32))
    && (result = (uint64_t *)objc_msgSend(*(id *)(a2 + 24), "isEqual:", *(_QWORD *)(v8 + 24)),
        (result & 1) != 0))
  {
    v7[5] = a2;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TTMergeableString attributedString](self, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)dotDescription:(unint64_t)a3
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t v14;
  TopoSubstring **end;
  TopoSubstring **begin;
  __CFString *v17;
  int v18;
  int v19;
  void *v20;
  TopoSubstring **v21;
  TopoSubstring **v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v32;
  TTMergeableString *v33;
  uint64_t *v34;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendFormat:", CFSTR("subgraph cluster_%ld%p_%ld {\n  rankdir=\"LR\";\n"), a3, self, a3);
  if (-[TTMergeableString isFragment](self, "isFragment"))
  {
    v6 = CFSTR("<Fragment>");
  }
  else
  {
    -[TTMergeableString string](self, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v9 = objc_claimAutoreleasedReturnValue();

  -[TTMergeableString replicaUUID](self, "replicaUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v9;
  objc_msgSend(v10, "TTShortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  label=\"%@_%ld (%ld)    '%@'\"\n"), v11, a3, -[TTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0), v9);

  objc_msgSend(v5, "appendFormat:", CFSTR("  color=lightgrey;\n"));
  v12 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v13 = *v12;
  v34 = v12[1];
  if (*v12 != v34)
  {
    v33 = self;
    while (1)
    {
      v14 = *v13;
      begin = self->_startNodes.__begin_;
      end = self->_startNodes.__end_;
      if (begin != end)
      {
        while (*begin != (TopoSubstring *)v14)
        {
          if (++begin == end)
          {
            begin = self->_startNodes.__end_;
            break;
          }
        }
      }
      if (begin != end)
        break;
      v22 = self->_endNodes.__begin_;
      v21 = self->_endNodes.__end_;
      if (v22 != v21)
      {
        while (*v22 != (TopoSubstring *)v14)
        {
          if (++v22 == v21)
          {
            v22 = self->_endNodes.__end_;
            break;
          }
        }
      }
      if (v22 == v21)
      {
        v17 = &stru_1E67FB1F0;
        if (!*(_BYTE *)(v14 + 44))
        {
          -[NSMutableAttributedString string](self->_attributedString, "string");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (*(_BYTE *)(v14 + 44))
            v27 = 0;
          else
            v27 = *(unsigned int *)(v14 + 16);
          objc_msgSend(v25, "substringWithRange:", *(unsigned int *)(v14 + 40), v27);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(*(id *)v14, "TTShortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(unsigned int *)(v14 + 8);
        v29 = *(_DWORD *)(v14 + 16);
        objc_msgSend(*(id *)(v14 + 24), "TTShortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"%@ %@,%d-%u (%@,%d)\"];\n"),
          a3,
          v14,
          v17,
          v20,
          v28,
          (v28 + v29 - 1),
          v30,
          *(unsigned int *)(v14 + 32));

        goto LABEL_12;
      }
      objc_msgSend(*(id *)v14, "TTShortDescription");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"End\\n%@,%d\"];\n"),
        a3,
        v14,
        v17,
        *(unsigned int *)(v14 + 8));
LABEL_19:

      v23 = *(_QWORD **)(v14 + 48);
      v24 = *(_QWORD **)(v14 + 56);
      while (v23 != v24)
        objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p -> N%ld%p;\n"), a3, v14, a3, *v23++);
      if (++v13 == v34)
        goto LABEL_30;
    }
    v17 = (__CFString *)*(id *)v14;
    v18 = *(_DWORD *)(v14 + 8);
    v19 = *(_DWORD *)(v14 + 16);
    -[__CFString TTShortDescription](v17, "TTShortDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  N%ld%p [label=\"Start\\n%@,%d\"];\n"),
      a3,
      v14,
      v20,
      (v18 + v19 - 1));
LABEL_12:
    self = v33;

    goto LABEL_19;
  }
LABEL_30:
  objc_msgSend(v5, "appendString:", CFSTR("}\n"));

  return v5;
}

- (NSUUID)replicaUUID
{
  return self->_replicaUUID;
}

- (void)setReplicaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_replicaUUID, a3);
}

- (TTVectorMultiTimestamp)timestamp
{
  return self->_timestamp;
}

- (BOOL)hasLocalChanges
{
  return self->_hasLocalChanges;
}

- (void)setHasLocalChanges:(BOOL)a3
{
  self->_hasLocalChanges = a3;
}

- (TTMergeableStringDelegate)delegate
{
  return (TTMergeableStringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSHashTable)objectsNeedingUpdatedRanges
{
  return self->_objectsNeedingUpdatedRanges;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedString, a3);
}

- (unint64_t)replicaTextClock
{
  return self->_replicaTextClock;
}

- (unint64_t)replicaStyleClock
{
  return self->_replicaStyleClock;
}

- (void).cxx_destruct
{
  TopoSubstring **begin;
  TopoSubstring **v4;
  TopoSubstring **v5;

  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_objectsNeedingUpdatedRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong(&self->_updateRangeBlock, 0);
  begin = self->_orderedSubstrings.__begin_;
  if (begin)
  {
    self->_orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_endNodes.__begin_;
  if (v4)
  {
    self->_endNodes.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_startNodes.__begin_;
  if (v5)
  {
    self->_startNodes.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  __int128 *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  __int128 *v31;
  unint64_t v32;
  __int128 *v33;
  __int128 *v34;
  __int128 *v35;
  __int128 *v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 *v41;
  BOOL v43;
  uint64_t v44;
  unint64_t *v45;
  __int128 *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  __int128 *v58;
  __int128 v59;
  unint64_t v60;
  __int128 *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _OWORD *v66;
  __int128 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  __int128 *v72;
  unint64_t v73;
  uint64_t v74;
  __int128 *v75;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;

- (TTMergeableString)initWithData:(id)a3 andReplicaID:(id)a4
{
  id v6;
  id v7;
  id v8;
  char *v9;
  int v10;
  TTMergeableString *v11;
  NSObject *v12;
  _BYTE v14[128];

  v6 = a3;
  v7 = a4;
  topotext::String::String((topotext::String *)v14);
  v8 = objc_retainAutorelease(v6);
  v9 = (char *)objc_msgSend(v8, "bytes");
  v10 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v8, "length"));
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v14, v9, v10))
  {
    self = -[TTMergeableString initWithArchive:andReplicaID:](self, "initWithArchive:andReplicaID:", v14, v7);
    v11 = self;
  }
  else
  {
    +[REMLog crdt](REMLog, "crdt");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithData:andReplicaID:].cold.1();

    v11 = 0;
  }
  topotext::String::~String((topotext::String *)v14);

  return v11;
}

- (TTMergeableString)initWithArchive:(const void *)a3 andReplicaID:(id)a4
{
  return -[TTMergeableString initWithArchive:andReplicaID:withOrderedSubstrings:](self, "initWithArchive:andReplicaID:withOrderedSubstrings:", a3, a4, 0);
}

- (TTMergeableString)initWithArchive:(const void *)a3 andReplicaID:(id)a4 andSharedTimestamp:(id)a5
{
  return -[TTMergeableString initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:](self, "initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:", a3, a4, 0, a5);
}

- (TTMergeableString)initWithArchive:(const void *)a3 andReplicaID:(id)a4 withOrderedSubstrings:(void *)a5
{
  return -[TTMergeableString initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:](self, "initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:", a3, a4, a5, 0);
}

- (TTMergeableString)initWithArchive:(const void *)a3 andReplicaID:(id)a4 withOrderedSubstrings:(void *)a5 timestamp:(id)a6
{
  TTMergeableString *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  TTVectorMultiTimestamp *v30;
  TTVectorMultiTimestamp *v31;
  TTVectorMultiTimestamp *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  NSObject *v40;
  TTMergeableString *v41;
  int v42;
  char v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  topotext::Substring *v53;
  uint64_t v54;
  _BOOL4 v55;
  int v56;
  int v57;
  void *v58;
  void *v59;
  topotext::Substring *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  BOOL v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  void **v69;
  _QWORD *v70;
  unint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  void **v83;
  _QWORD *v84;
  unint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  NSObject *v97;
  void *v98;
  int v99;
  BOOL v100;
  int v101;
  NSObject *v102;
  _QWORD *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  TTMergeableString *v108;
  NSObject *v110;
  char *v112;
  void *v113;
  char v114;
  void *v115;
  void *v116;
  void *v117;
  unint64_t v118;
  int v119;
  int v120;
  unint64_t v121;
  NSObject *v122;
  id v124;
  TTVectorMultiTimestamp *v125;
  id obj;
  TopoSubstring *v127;
  _OWORD v128[2];
  int v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  void *__p;
  uint64_t *v135;
  unint64_t v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v124 = a4;
  v125 = (TTVectorMultiTimestamp *)a6;
  v9 = -[TTMergeableString initWithReplicaID:asFragment:](self, "initWithReplicaID:asFragment:", v124, 1);

  if (!v9)
    goto LABEL_153;
  if ((*((_BYTE *)a3 + 32) & 1) == 0
    || ((v10 = objc_alloc(MEMORY[0x1E0CB3940]), v11 = (uint64_t *)*((_QWORD *)a3 + 5), *((char *)v11 + 23) < 0)
      ? (v11 = (uint64_t *)*v11, v12 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8))
      : (v12 = *((unsigned __int8 *)v11 + 23)),
        (v13 = objc_msgSend(v10, "initWithBytes:length:encoding:", v11, v12, 4)) == 0))
  {
    +[REMLog crdt](REMLog, "crdt");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.1();

    v41 = 0;
    goto LABEL_155;
  }
  v14 = (void *)v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v13);
  v116 = v14;
  -[TTMergeableString setAttributedString:](v9, "setAttributedString:", v15);

  v16 = *((unsigned int *)a3 + 14);
  __p = 0;
  v135 = 0;
  v136 = 0;
  std::vector<TopoSubstring *>::reserve(&__p, v16);
  if ((_DWORD)v16)
  {
    for (i = 0; i != v16; ++i)
    {
      v18 = operator new();
      v19 = v18;
      *(_QWORD *)v18 = 0;
      *(_QWORD *)(v18 + 24) = 0;
      *(_QWORD *)(v18 + 56) = 0;
      *(_QWORD *)(v18 + 64) = 0;
      *(_QWORD *)(v18 + 48) = 0;
      *(_DWORD *)(v18 + 72) = 0;
      v20 = v135;
      if ((unint64_t)v135 >= v136)
      {
        v22 = ((char *)v135 - (_BYTE *)__p) >> 3;
        if ((unint64_t)(v22 + 1) >> 61)
          std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
        v23 = (uint64_t)(v136 - (_QWORD)__p) >> 2;
        if (v23 <= v22 + 1)
          v23 = v22 + 1;
        if (v136 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF8)
          v24 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)&v136, v24);
        else
          v25 = 0;
        v26 = (uint64_t *)&v25[8 * v22];
        *v26 = v19;
        v21 = v26 + 1;
        v28 = __p;
        v27 = v135;
        if (v135 != __p)
        {
          do
          {
            v29 = *--v27;
            *--v26 = v29;
          }
          while (v27 != v28);
          v27 = __p;
        }
        __p = v26;
        v135 = v21;
        v136 = (unint64_t)&v25[8 * v24];
        if (v27)
          operator delete(v27);
      }
      else
      {
        *v135 = v18;
        v21 = v20 + 1;
      }
      v135 = v21;
    }
  }
  v30 = v125;
  if (!v125)
  {
    v31 = [TTVectorMultiTimestamp alloc];
    v32 = v31;
    v33 = *((_QWORD *)a3 + 9);
    if (!v33)
      v33 = *(_QWORD *)(topotext::String::default_instance((topotext::String *)v31) + 72);
    v30 = -[TTVectorMultiTimestamp initWithArchive:andCapacity:](v32, "initWithArchive:andCapacity:", v33, 2);
  }
  -[TTMergeableString setTimestamp:](v9, "setTimestamp:", v30);
  if (!v125)

  -[TTMergeableString timestamp](v9, "timestamp");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sortedUUIDs");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = objc_msgSend(v117, "count");
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  obj = v117;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v131;
    while (2)
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v131 != v36)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v38) = objc_msgSend(v38, "isEqual:", v39);

        if ((v38 & 1) != 0)
        {
          v119 = 0;
          v114 = 1;
          goto LABEL_45;
        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
      if (v35)
        continue;
      break;
    }
  }
  v114 = 0;
  v119 = 1;
LABEL_45:

  memset(v128, 0, sizeof(v128));
  v129 = 1065353216;
  v42 = v119;
  v43 = v119 ^ 1;
  if (!(_DWORD)v16)
    v43 = 1;
  if ((v43 & 1) != 0)
  {
    v120 = 0;
    LODWORD(v121) = 0;
    goto LABEL_127;
  }
  v44 = 0;
  LODWORD(v121) = 0;
  v120 = 0;
  v45 = (char *)a3 + 48;
  v112 = (char *)a3 + 48;
  while (1)
  {
    v46 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Substring>::TypeHandler>((uint64_t)v45, v44);
    v47 = v46;
    if ((~*(_DWORD *)(v46 + 32) & 7) != 0)
    {
      +[REMLog crdt](REMLog, "crdt");
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.7();
      v119 = 0;
      goto LABEL_125;
    }
    v48 = *(_QWORD *)(v46 + 40);
    if (!v48)
    {
      v46 = topotext::Substring::default_instance((topotext::Substring *)v46);
      v48 = *(_QWORD *)(v46 + 40);
    }
    v49 = *(unsigned int *)(v48 + 40);
    v50 = *(_QWORD *)(v47 + 48);
    if (!v50)
      v50 = *(_QWORD *)(topotext::Substring::default_instance((topotext::Substring *)v46) + 48);
    v51 = *(unsigned int *)(v50 + 40);
    if (v118 < v49 || v118 < v51)
    {
      +[REMLog crdt](REMLog, "crdt");
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.4();
      v122 = 0;
      goto LABEL_123;
    }
    if ((_DWORD)v49)
      objc_msgSend(obj, "objectAtIndexedSubscript:", (v49 - 1));
    else
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
    v53 = (topotext::Substring *)objc_claimAutoreleasedReturnValue();
    v122 = v53;
    v54 = *(_QWORD *)(v47 + 40);
    if (!v54)
      v54 = *(_QWORD *)(topotext::Substring::default_instance(v53) + 40);
    v55 = v49 == 0;
    v56 = *(_DWORD *)(v54 + 44);
    v57 = *(_DWORD *)(v47 + 56);
    if ((_DWORD)v51)
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", (v51 - 1));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v58;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v58;
    }
    objc_storeStrong((id *)(*((_QWORD *)__p + v44) + 24), v58);
    v59 = v113;
    if ((_DWORD)v51)
      v59 = v115;

    v61 = *(_QWORD *)(v47 + 48);
    if (!v61)
      v61 = *(_QWORD *)(topotext::Substring::default_instance(v60) + 48);
    v120 |= v55 ^ ((_DWORD)v51 == 0);
    v62 = *((_QWORD *)__p + v44);
    *(_DWORD *)(v62 + 32) = *(_DWORD *)(v61 + 44);
    *(_DWORD *)(v62 + 40) = v121;
    if ((*(_BYTE *)(v47 + 32) & 8) != 0 && *(_BYTE *)(v47 + 60))
    {
      *(_BYTE *)(v62 + 44) = 1;
    }
    else
    {
      *(_BYTE *)(v62 + 44) = 0;
      -[TTMergeableString attributedString](v9, "attributedString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = (v57 + v121);
      v64 = objc_msgSend(v63, "length") < v121;

      if (v64)
      {
        +[REMLog crdt](REMLog, "crdt");
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.6();
        goto LABEL_123;
      }
      v62 = *((_QWORD *)__p + v44);
    }
    objc_storeStrong((id *)v62, v122);
    *(_DWORD *)(v62 + 8) = v56;
    *(_DWORD *)(v62 + 16) = v57;
    v65 = *(_DWORD *)(v47 + 72);
    if (v65)
      break;
LABEL_80:
    if ((v114 & 1) != 0)
      goto LABEL_124;
    if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v128, (_QWORD *)__p + v44))
    {
      if (!v65)
        goto LABEL_101;
    }
    else
    {
      v69 = -[TTMergeableString startNodes](v9, "startNodes");
      v70 = __p;
      v71 = (unint64_t)v69[2];
      v72 = v69[1];
      if ((unint64_t)v72 >= v71)
      {
        v74 = ((char *)v72 - (_BYTE *)*v69) >> 3;
        if ((unint64_t)(v74 + 1) >> 61)
          goto LABEL_166;
        v75 = v71 - (_QWORD)*v69;
        v76 = v75 >> 2;
        if (v75 >> 2 <= (unint64_t)(v74 + 1))
          v76 = v74 + 1;
        if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8)
          v77 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v77 = v76;
        if (v77)
          v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)(v69 + 2), v77);
        else
          v78 = 0;
        v79 = &v78[8 * v74];
        *(_QWORD *)v79 = v70[v44];
        v73 = v79 + 8;
        v81 = (char *)*v69;
        v80 = (char *)v69[1];
        if (v80 != *v69)
        {
          do
          {
            v82 = *((_QWORD *)v80 - 1);
            v80 -= 8;
            *((_QWORD *)v79 - 1) = v82;
            v79 -= 8;
          }
          while (v80 != v81);
          v80 = (char *)*v69;
        }
        *v69 = v79;
        v69[1] = v73;
        v69[2] = &v78[8 * v77];
        if (v80)
          operator delete(v80);
      }
      else
      {
        *v72 = *((_QWORD *)__p + v44);
        v73 = v72 + 1;
      }
      v69[1] = v73;
      if (!v65)
      {
LABEL_101:
        v83 = -[TTMergeableString endNodes](v9, "endNodes");
        v84 = __p;
        v85 = (unint64_t)v83[2];
        v86 = v83[1];
        if ((unint64_t)v86 >= v85)
        {
          v88 = ((char *)v86 - (_BYTE *)*v83) >> 3;
          if ((unint64_t)(v88 + 1) >> 61)
LABEL_166:
            std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
          v89 = v85 - (_QWORD)*v83;
          v90 = v89 >> 2;
          if (v89 >> 2 <= (unint64_t)(v88 + 1))
            v90 = v88 + 1;
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8)
            v91 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v91 = v90;
          if (v91)
            v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)(v83 + 2), v91);
          else
            v92 = 0;
          v93 = &v92[8 * v88];
          *(_QWORD *)v93 = v84[v44];
          v87 = v93 + 8;
          v95 = (char *)*v83;
          v94 = (char *)v83[1];
          if (v94 != *v83)
          {
            do
            {
              v96 = *((_QWORD *)v94 - 1);
              v94 -= 8;
              *((_QWORD *)v93 - 1) = v96;
              v93 -= 8;
            }
            while (v94 != v95);
            v94 = (char *)*v83;
          }
          *v83 = v93;
          v83[1] = v87;
          v83[2] = &v92[8 * v91];
          if (v94)
            operator delete(v94);
        }
        else
        {
          *v86 = *((_QWORD *)__p + v44);
          v87 = v86 + 1;
        }
        v83[1] = v87;
      }
    }

    ++v44;
    v45 = v112;
    if (v44 >= v16)
      goto LABEL_126;
  }
  v66 = 0;
  v67 = v47 + 64;
  while (1)
  {
    v68 = *(unsigned int *)google::protobuf::RepeatedField<unsigned int>::Get(v67, v66);
    if (v68 >= v16)
      break;
    v127 = 0;
    v127 = (TopoSubstring *)*((_QWORD *)__p + v68);
    TopoSubstring::addChild(*((TopoSubstring **)__p + v44), v127);
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v128, &v127, &v127);
    if (v65 == ++v66)
      goto LABEL_80;
  }
  +[REMLog crdt](REMLog, "crdt");
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.5();
LABEL_123:

  v119 = 0;
LABEL_124:
  v97 = v122;
LABEL_125:

LABEL_126:
  v42 = v119;
LABEL_127:
  -[TTMergeableString attributedString](v9, "attributedString");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v42;
  v100 = objc_msgSend(v98, "length") == v121;

  if (!v100)
  {
    +[REMLog crdt](REMLog, "crdt");
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.3();
LABEL_134:

    v101 = 0;
LABEL_135:
    v103 = -[TTMergeableString startNodes](v9, "startNodes");
    v103[1] = *v103;
    if ((_DWORD)v16)
    {
      v104 = v101;
      v105 = 0;
      do
      {
        v106 = *(_QWORD *)((char *)__p + v105);
        if (v106)
        {
          v107 = *(void **)(v106 + 48);
          if (v107)
          {
            *(_QWORD *)(v106 + 56) = v107;
            operator delete(v107);
          }

          MEMORY[0x1B5E3DB94](v106, 0x1080C40D9F1C51ELL);
        }
        v105 += 8;
      }
      while (8 * v16 != v105);
      v101 = v104;
    }
    goto LABEL_146;
  }
  v101 = v99;
  if ((v99 & v120) != 1)
  {
    if (v99)
      goto LABEL_144;
    goto LABEL_135;
  }
  if (!-[TTMergeableString isFragment](v9, "isFragment"))
  {
    +[REMLog crdt](REMLog, "crdt");
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      -[TTMergeableString(TTMergeableStringPersistenceAdditions) initWithArchive:andReplicaID:withOrderedSubstrings:timestamp:].cold.2();
    goto LABEL_134;
  }
LABEL_144:
  if (!-[TTMergeableString isFragment](v9, "isFragment"))
    -[TTMergeableString updateClock](v9, "updateClock");
LABEL_146:
  if (a5 && &__p != a5)
    std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a5, (char *)__p, (uint64_t)v135, ((char *)v135 - (_BYTE *)__p) >> 3);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v128);

  if (__p)
  {
    v135 = (uint64_t *)__p;
    operator delete(__p);
  }

  if (!v101)
  {
    v108 = 0;
    goto LABEL_154;
  }
LABEL_153:
  v108 = v9;
LABEL_154:
  v41 = v108;
LABEL_155:

  return v41;
}

- (void)saveToArchive:(void *)a3
{
  -[TTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  -[TTMergeableString coalesce](self, "coalesce");
  -[TTMergeableString checkTimestampLogStyleErrors:](self, "checkTimestampLogStyleErrors:", 1);
  -[TTMergeableString saveSubstrings:archiveSet:linkSet:archivedString:toArchive:](self, "saveSubstrings:archiveSet:linkSet:archivedString:toArchive:", -[TTMergeableString orderedSubstrings](self, "orderedSubstrings"), 0, 0, 0, a3);
}

- (void)saveSubstrings:(void *)a3 archiveSet:(void *)a4 linkSet:(void *)a5 archivedString:(id *)a6 toArchive:(void *)a7
{
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  topotext::Substring *v25;
  uint64_t v26;
  int32x2_t v27;
  topotext::CharID *v28;
  void *v29;
  int v30;
  topotext::CharID *v31;
  int v32;
  topotext::CharID *v33;
  void *v34;
  int v35;
  topotext::CharID *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  topotext::CharID *v42;
  int v43;
  void *v44;
  uint64_t v45;
  int v46;
  uint64_t *v47;
  uint64_t *i;
  int v49;
  int v50;
  uint64_t v51;
  id v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  char v56;
  void *v57;
  topotext::VectorTimestamp *v58;
  id *v59;
  _QWORD *v60;
  id v62;
  uint64_t *v63;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  _OWORD v69[2];
  int v70;
  _QWORD *v71[2];

  v59 = a6;
  memset(v69, 0, sizeof(v69));
  v70 = 1065353216;
  v10 = *(uint64_t **)a3;
  v11 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v11)
  {
    v12 = 0;
    do
    {
      v68 = *v10;
      v71[0] = &v68;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned int>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned int>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v69, &v68, (uint64_t)&std::piecewise_construct, v71)+ 6) = v12++;
      ++v10;
    }
    while (v10 != v11);
  }
  v62 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  -[TTMergeableString timestamp](self, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedUUIDs");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setObject:forKeyedSubscript:", &unk_1E6837030, v15);

  v16 = objc_msgSend(v65, "count");
  if (v16)
  {
    v17 = 0;
    do
    {
      v18 = v17 + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1, v59);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v19, v20);

      v17 = v18;
    }
    while (v16 != v18);
  }
  v21 = *(uint64_t **)a3;
  v63 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v63)
  {
    do
    {
      v68 = 0;
      v68 = *v21;
      v22 = *((_DWORD *)a7 + 15);
      v23 = *((int *)a7 + 14);
      if ((int)v23 >= v22)
      {
        if (v22 == *((_DWORD *)a7 + 16))
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a7 + 12, v22 + 1);
        v25 = google::protobuf::internal::GenericTypeHandler<topotext::Substring>::New();
        v26 = *((_QWORD *)a7 + 6);
        v27 = *(int32x2_t *)((char *)a7 + 56);
        *((int32x2_t *)a7 + 7) = vadd_s32(v27, (int32x2_t)0x100000001);
        *(_QWORD *)(v26 + 8 * v27.i32[0]) = v25;
      }
      else
      {
        v24 = *((_QWORD *)a7 + 6);
        *((_DWORD *)a7 + 14) = v23 + 1;
        v25 = *(topotext::Substring **)(v24 + 8 * v23);
      }
      *((_DWORD *)v25 + 8) |= 1u;
      v28 = (topotext::CharID *)*((_QWORD *)v25 + 5);
      if (!v28)
      {
        v28 = (topotext::CharID *)operator new();
        topotext::CharID::CharID(v28);
        *((_QWORD *)v25 + 5) = v28;
      }
      objc_msgSend(v66, "objectForKeyedSubscript:", *(_QWORD *)v68, v59);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "integerValue");
      *((_DWORD *)v28 + 8) |= 1u;
      *((_DWORD *)v28 + 10) = v30;

      *((_DWORD *)v25 + 8) |= 1u;
      v31 = (topotext::CharID *)*((_QWORD *)v25 + 5);
      if (!v31)
      {
        v31 = (topotext::CharID *)operator new();
        topotext::CharID::CharID(v31);
        *((_QWORD *)v25 + 5) = v31;
      }
      v32 = *(_DWORD *)(v68 + 8);
      *((_DWORD *)v31 + 8) |= 2u;
      *((_DWORD *)v31 + 11) = v32;
      if (v14
        && !std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v14, &v68))
      {
        *((_DWORD *)v25 + 8) |= 4u;
        v42 = (topotext::CharID *)*((_QWORD *)v25 + 6);
        if (!v42)
        {
          v42 = (topotext::CharID *)operator new();
          topotext::CharID::CharID(v42);
          *((_QWORD *)v25 + 6) = v42;
        }
        *((_DWORD *)v42 + 8) |= 1u;
        *((_DWORD *)v42 + 10) = 0;
        *((_DWORD *)v25 + 8) |= 4u;
        *((_DWORD *)v42 + 8) |= 2u;
        *((_DWORD *)v42 + 11) = 0;
      }
      else
      {
        *((_DWORD *)v25 + 8) |= 4u;
        v33 = (topotext::CharID *)*((_QWORD *)v25 + 6);
        if (!v33)
        {
          v33 = (topotext::CharID *)operator new();
          topotext::CharID::CharID(v33);
          *((_QWORD *)v25 + 6) = v33;
        }
        objc_msgSend(v66, "objectForKeyedSubscript:", *(_QWORD *)(v68 + 24));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "integerValue");
        *((_DWORD *)v33 + 8) |= 1u;
        *((_DWORD *)v33 + 10) = v35;

        *((_DWORD *)v25 + 8) |= 4u;
        v36 = (topotext::CharID *)*((_QWORD *)v25 + 6);
        if (!v36)
        {
          v36 = (topotext::CharID *)operator new();
          topotext::CharID::CharID(v36);
          *((_QWORD *)v25 + 6) = v36;
        }
        v37 = v68;
        v38 = *(_DWORD *)(v68 + 32);
        *((_DWORD *)v36 + 8) |= 2u;
        *((_DWORD *)v36 + 11) = v38;
        if (!*(_BYTE *)(v37 + 44))
        {
          -[TTMergeableString attributedString](self, "attributedString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (*(_BYTE *)(v68 + 44))
            v41 = 0;
          else
            v41 = *(unsigned int *)(v68 + 16);
          objc_msgSend(v39, "attributedSubstringFromRange:", *(unsigned int *)(v68 + 40), v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "appendAttributedString:", v44);

          v43 = *((_DWORD *)v25 + 8);
          goto LABEL_32;
        }
      }
      v43 = *((_DWORD *)v25 + 8) | 8;
      *((_DWORD *)v25 + 8) = v43;
      *((_BYTE *)v25 + 60) = 1;
LABEL_32:
      v45 = v68;
      v46 = *(_DWORD *)(v68 + 16);
      *((_DWORD *)v25 + 8) = v43 | 2;
      *((_DWORD *)v25 + 14) = v46;
      v47 = *(uint64_t **)(v45 + 48);
      for (i = *(uint64_t **)(v45 + 56); v47 != i; ++v47)
      {
        v67 = 0;
        v67 = *v47;
        if (!a5
          || std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(a5, &v67))
        {
          v71[0] = &v67;
          v49 = *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned int>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned int>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v69, &v67, (uint64_t)&std::piecewise_construct, v71)+ 6);
          v50 = *((_DWORD *)v25 + 18);
          if (v50 == *((_DWORD *)v25 + 19))
          {
            google::protobuf::RepeatedField<unsigned int>::Reserve((_DWORD *)v25 + 16, v50 + 1);
            v50 = *((_DWORD *)v25 + 18);
          }
          v51 = *((_QWORD *)v25 + 8);
          *((_DWORD *)v25 + 18) = v50 + 1;
          *(_DWORD *)(v51 + 4 * v50) = v49;
        }
      }
      ++v21;
      v14 = a4;
    }
    while (v21 != v63);
  }
  objc_msgSend(v62, "string", v59);
  v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v52, "UTF8String");
  objc_msgSend(v62, "string");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "lengthOfBytesUsingEncoding:", 4);
  *((_DWORD *)a7 + 8) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*((_QWORD *)a7 + 5) == google::protobuf::internal::empty_string_)
  {
    v54 = (_QWORD *)operator new();
    *v54 = 0;
    v54[1] = 0;
    v54[2] = 0;
    *((_QWORD *)a7 + 5) = v54;
  }
  MEMORY[0x1B5E3DB34]();

  if (v60)
    *v60 = objc_retainAutorelease(v62);
  -[TTMergeableString timestamp](self, "timestamp");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isDocumentShared");

  if ((v56 & 1) == 0)
  {
    -[TTMergeableString timestamp](self, "timestamp");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)a7 + 8) |= 4u;
    v58 = (topotext::VectorTimestamp *)*((_QWORD *)a7 + 9);
    if (!v58)
    {
      v58 = (topotext::VectorTimestamp *)operator new();
      topotext::VectorTimestamp::VectorTimestamp(v58);
      *((_QWORD *)a7 + 9) = v58;
    }
    objc_msgSend(v57, "saveToArchive:", v58);

  }
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v69);
}

- (id)serialize
{
  id v3;
  void *v4;
  int v5;
  _BYTE v7[128];

  topotext::String::String((topotext::String *)v7);
  -[TTMergeableString saveToArchive:](self, "saveToArchive:", v7);
  v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v7)));
  v4 = (void *)objc_msgSend(v3, "mutableBytes");
  v5 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v3, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::String::~String((topotext::String *)v7);
  return v3;
}

- (id)i_saveDeltasSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  id v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  id **v14;
  id **v15;
  id *v16;
  id v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  id v54;
  TTMergeableString *v56;
  void *v57;
  uint64_t *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD v62[2];
  int v63;
  _OWORD v64[2];
  int v65;
  char *v66;
  char *v67;
  _QWORD v68[2];

  v6 = a3;
  -[TTMergeableString generateIdsForLocalChanges](self, "generateIdsForLocalChanges");
  -[TTMergeableString coalesce](self, "coalesce");
  v56 = self;
  v57 = a4;
  v66 = 0;
  v67 = 0;
  v68[0] = 0;
  memset(v64, 0, sizeof(v64));
  v65 = 1065353216;
  memset(v62, 0, sizeof(v62));
  v63 = 1065353216;
  v7 = -[TTMergeableString orderedSubstrings](self, "orderedSubstrings");
  v8 = *v7;
  v58 = v7[1];
  if (*v7 != v58)
  {
    do
    {
      v9 = *v8;
      v61 = v9;
      v10 = *(id *)v9;
      v11 = *(_DWORD *)(v9 + 8);
      LODWORD(v9) = *(_DWORD *)(v9 + 16);
      v12 = objc_msgSend(v6, "clockForUUID:atIndex:", v10, 0);
      v13 = objc_msgSend(v6, "clockForUUID:atIndex:", v10, 1);
      if ((int)v9 + v11 >= v12 || *(_DWORD *)(v61 + 32) >= v13)
      {
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v62, &v61, &v61);
        if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v61))
        {
          v32 = v67;
          if ((unint64_t)v67 >= v68[0])
          {
            v34 = (v67 - v66) >> 3;
            if ((unint64_t)(v34 + 1) >> 61)
              std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
            v35 = (uint64_t)(v68[0] - (_QWORD)v66) >> 2;
            if (v35 <= v34 + 1)
              v35 = v34 + 1;
            if (v68[0] - (_QWORD)v66 >= 0x7FFFFFFFFFFFFFF8uLL)
              v36 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v36 = v35;
            if (v36)
              v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v68, v36);
            else
              v37 = 0;
            v38 = &v37[8 * v34];
            *(_QWORD *)v38 = v61;
            v33 = v38 + 8;
            v40 = v66;
            v39 = v67;
            if (v67 != v66)
            {
              do
              {
                v41 = *((_QWORD *)v39 - 1);
                v39 -= 8;
                *((_QWORD *)v38 - 1) = v41;
                v38 -= 8;
              }
              while (v39 != v40);
              v39 = v66;
            }
            v66 = v38;
            v67 = v33;
            v68[0] = &v37[8 * v36];
            if (v39)
              operator delete(v39);
          }
          else
          {
            *(_QWORD *)v67 = v61;
            v33 = v32 + 8;
          }
          v67 = v33;
          std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v61, &v61);
        }
        v42 = *(uint64_t **)(v61 + 48);
        v43 = *(uint64_t **)(v61 + 56);
        while (v42 != v43)
        {
          v60 = 0;
          v60 = *v42;
          if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v60))
          {
            v44 = v67;
            if ((unint64_t)v67 >= v68[0])
            {
              v46 = (v67 - v66) >> 3;
              if ((unint64_t)(v46 + 1) >> 61)
                std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
              v47 = (uint64_t)(v68[0] - (_QWORD)v66) >> 2;
              if (v47 <= v46 + 1)
                v47 = v46 + 1;
              if (v68[0] - (_QWORD)v66 >= 0x7FFFFFFFFFFFFFF8uLL)
                v48 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v48 = v47;
              if (v48)
                v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v68, v48);
              else
                v49 = 0;
              v50 = &v49[8 * v46];
              *(_QWORD *)v50 = v60;
              v45 = v50 + 8;
              v52 = v66;
              v51 = v67;
              if (v67 != v66)
              {
                do
                {
                  v53 = *((_QWORD *)v51 - 1);
                  v51 -= 8;
                  *((_QWORD *)v50 - 1) = v53;
                  v50 -= 8;
                }
                while (v51 != v52);
                v51 = v66;
              }
              v66 = v50;
              v67 = v45;
              v68[0] = &v49[8 * v48];
              if (v51)
                operator delete(v51);
            }
            else
            {
              *(_QWORD *)v67 = v60;
              v45 = v44 + 8;
            }
            v67 = v45;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v60, &v60);
          }
          ++v42;
        }
      }
      else
      {
        v14 = *(id ***)(v61 + 48);
        v15 = *(id ***)(v61 + 56);
        while (v14 != v15)
        {
          v16 = *v14;
          v17 = **v14;
          v18 = *((_DWORD *)v16 + 2);
          v19 = *((_DWORD *)v16 + 4);
          v20 = objc_msgSend(v6, "clockForUUID:atIndex:", v17, 0);
          v21 = objc_msgSend(v6, "clockForUUID:atIndex:", v17, 1);
          if ((v19 + v18 >= v20 || *((_DWORD *)v16 + 8) >= v21)
            && !std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v61))
          {
            v22 = v67;
            if ((unint64_t)v67 >= v68[0])
            {
              v24 = (v67 - v66) >> 3;
              if ((unint64_t)(v24 + 1) >> 61)
                std::vector<CRDT::Document_DocObject *>::__throw_length_error[abi:ne180100]();
              v25 = (uint64_t)(v68[0] - (_QWORD)v66) >> 2;
              if (v25 <= v24 + 1)
                v25 = v24 + 1;
              if (v68[0] - (_QWORD)v66 >= 0x7FFFFFFFFFFFFFF8uLL)
                v26 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v26 = v25;
              if (v26)
                v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CRDT::Document_DocObject *>>((uint64_t)v68, v26);
              else
                v27 = 0;
              v28 = &v27[8 * v24];
              *(_QWORD *)v28 = v61;
              v23 = v28 + 8;
              v30 = v66;
              v29 = v67;
              if (v67 != v66)
              {
                do
                {
                  v31 = *((_QWORD *)v29 - 1);
                  v29 -= 8;
                  *((_QWORD *)v28 - 1) = v31;
                  v28 -= 8;
                }
                while (v29 != v30);
                v29 = v66;
              }
              v66 = v28;
              v67 = v23;
              v68[0] = &v27[8 * v26];
              if (v29)
                operator delete(v29);
            }
            else
            {
              *(_QWORD *)v67 = v61;
              v23 = v22 + 8;
            }
            v67 = v23;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v61, &v61);
          }

          ++v14;
        }
      }

      ++v8;
    }
    while (v8 != v58);
  }
  v59 = 0;
  -[TTMergeableString saveSubstrings:archiveSet:linkSet:archivedString:toArchive:](v56, "saveSubstrings:archiveSet:linkSet:archivedString:toArchive:", &v66, v62, v64, &v59, v57);
  v54 = v59;
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v62);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v64);
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }

  return v54;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  id v4;

  v4 = -[TTMergeableString i_saveDeltasSinceTimestamp:toArchive:](self, "i_saveDeltasSinceTimestamp:toArchive:", a3, a4);
}

- (id)serializeDeltaSinceTimestamp:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  _BYTE v9[128];

  v4 = a3;
  topotext::String::String((topotext::String *)v9);
  -[TTMergeableString saveDeltaSinceTimestamp:toArchive:](self, "saveDeltaSinceTimestamp:toArchive:", v4, v9);
  v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)topotext::String::ByteSize((topotext::String *)v9)));
  v6 = (void *)objc_msgSend(v5, "mutableBytes");
  v7 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v5, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v9, v6, v7);
  topotext::String::~String((topotext::String *)v9);

  return v5;
}

void __50__TTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Style clock is too low.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __50__TTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Text clock is too low.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)mergeWithString:(uint64_t)a3 mergeTimestamps:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Failed to merge strings.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)mergeWithString:(uint64_t)a1 mergeTimestamps:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Failed to merge strings: %@", (uint8_t *)&v2, 0xCu);
}

@end
