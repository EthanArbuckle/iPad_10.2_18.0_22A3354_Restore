@implementation TTArray

- (TTArray)init
{
  TTMergeableAttributedString *v3;
  TTArray *v4;

  v3 = objc_alloc_init(TTMergeableAttributedString);
  v4 = -[TTArray initWithContents:](self, "initWithContents:", v3);

  return v4;
}

- (TTArray)initWithDocument:(id)a3
{
  id v4;
  TTMergeableAttributedString *v5;
  void *v6;
  TTMergeableAttributedString *v7;
  TTArray *v8;

  v4 = a3;
  v5 = [TTMergeableAttributedString alloc];
  objc_msgSend(v4, "replica");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TTMergeableString initWithReplicaID:](v5, "initWithReplicaID:", v6);
  v8 = -[TTArray initWithContents:](self, "initWithContents:", v7);

  if (v8)
    -[TTArray setDocument:](v8, "setDocument:", v4);

  return v8;
}

- (TTArray)initWithContents:(id)a3
{
  id v5;
  TTArray *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTArray;
  v6 = -[TTArray init](&v8, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_contents, a3);
  }

  return v6;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  -[TTArray textAttachmentAtIndex:](self, "textAttachmentAtIndex:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = os_log_create("com.apple.coreCRDT", "TTArray");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TTArray objectAtIndex:].cold.1(a3, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTArray: no object at index %lu"), a3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  return v4;
}

- (id)textAttachmentAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  -[TTArray contents](self, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__TTArray_textAttachmentAtIndex___block_invoke;
  v8[3] = &unk_1E67FAA20;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("TTArrayAttachment"), a3, 1, 0, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __33__TTArray_textAttachmentAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a5 = 1;
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  -[TTArray insertObject:atIndex:](self, "insertObject:atIndex:", v4, -[TTArray count](self, "count"));

}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __25__TTArray_indexOfObject___block_invoke;
  v8[3] = &unk_1E67FAA48;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[TTArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __25__TTArray_indexOfObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "CR_compare:", *(_QWORD *)(a1 + 32));
  if (!result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithUTF8String:", "\uFFFC");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  v12 = CFSTR("TTArrayAttachment");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAttributes:range:", v10, 0, 1);
  -[TTArray contents](self, "contents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertAttributedString:atIndex:", v9, a4);

}

- (void)removeLastObject
{
  unint64_t v3;

  v3 = -[TTArray count](self, "count");
  if (v3)
    -[TTArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v3 - 1);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v4;

  -[TTArray contents](self, "contents");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteCharactersInRange:", a3, 1);

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;

  v6 = a4;
  -[TTArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3);
  -[TTArray insertObject:atIndex:](self, "insertObject:atIndex:", v6, a3);

}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t, _BYTE *);
  unint64_t v5;
  void *v6;
  char v7;

  v4 = (void (**)(id, void *, unint64_t, _BYTE *))a3;
  if (-[TTArray count](self, "count"))
  {
    v5 = 0;
    do
    {
      v7 = 0;
      -[TTArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, v5, &v7);

      if (v7)
        break;
      ++v5;
    }
    while (-[TTArray count](self, "count") > v5);
  }

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[TTArray contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSUUID)replicaUUID
{
  void *v2;
  void *v3;

  -[TTArray contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replicaUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)description
{
  unint64_t v3;
  __CFString *v4;
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
  v10 = __Block_byref_object_copy__16;
  v11 = __Block_byref_object_dispose__16;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E67FB1F0);
  v3 = -[TTArray count](self, "count");
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __22__TTArray_description__block_invoke;
    v6[3] = &unk_1E67FAA70;
    v6[4] = &v7;
    v6[5] = v3;
    -[TTArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
    v4 = (__CFString *)objc_msgSend((id)v8[5], "copy");
  }
  else
  {
    v4 = CFSTR("[]");
  }
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __22__TTArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (!a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", CFSTR("["));
    v5 = v9;
  }
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  if (*(_QWORD *)(a1 + 40) - 1 == a3)
    v8 = CFSTR("]");
  else
    v8 = CFSTR(", ");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendString:", v8);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TTArray contents](self, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TTArray contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)nsArray
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __18__TTArray_nsArray__block_invoke;
  v7[3] = &unk_1E67FAA98;
  v8 = v3;
  v4 = v3;
  -[TTArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

uint64_t __18__TTArray_nsArray__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", a2, a3);
}

- (void)mergeWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.coreCRDT", "TTArray");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[TTArray mergeWith:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTArray cannot merge with object of type %@."), v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v17 = v4;
  -[TTArray contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "mergeWith:", v6);
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTArray contents](self, "contents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "realizeLocalChangesIn:", v4);

}

- (id)tombstone
{
  void *v2;
  void *v3;
  TTArray *v4;

  -[TTArray contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tombstone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[TTArray initWithContents:]([TTArray alloc], "initWithContents:", v3);
  return v4;
}

- (void)walkGraph:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTArray contents](self, "contents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "walkGraph:", v4);

}

- (void)setDocument:(id)a3
{
  CRDocument **p_document;
  id v5;
  id v6;

  p_document = &self->_document;
  v5 = a3;
  objc_storeWeak((id *)p_document, v5);
  -[TTArray contents](self, "contents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDocument:", v5);

}

- (void)addUndoCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[TTArray delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__TTArray_addUndoCommand___block_invoke;
  v7[3] = &unk_1E67FAAC0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addUndoCommandsForObject:block:", self, v7);

}

void __26__TTArray_addUndoCommand___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyToString:", v3);

}

- (BOOL)wantsUndoCommands
{
  void *v2;
  char v3;

  -[TTArray delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUndoCommands");

  return v3;
}

- (CRDocument)document
{
  return (CRDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (CRUndoDelegate)delegate
{
  return (CRUndoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TTMergeableAttributedString)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_document);
}

- (id)serializeDataFromArchive:(const void *)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (*(int (**)(const void *))(*(_QWORD *)a3 + 72))(a3)));
  v5 = (void *)objc_msgSend(v4, "mutableBytes");
  v6 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v4, "length"));
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, v5, v6);
  return v4;
}

- (TTArray)initWithArchive:(const void *)a3 andReplicaID:(id)a4
{
  TTMergeableAttributedString *v6;
  TTMergeableAttributedString *v7;
  TTMergeableAttributedString *v8;
  uint64_t v9;
  uint64_t v10;
  TTMergeableAttributedString *v11;
  uint64_t v12;
  const CRDT::StringArray_ArrayAttachment **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  TTArray *v19;
  TTArray *v21;
  id v22;
  _BYTE v23[32];
  int v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v22 = a4;
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    v7 = [TTMergeableAttributedString alloc];
    v8 = v7;
    v9 = *((_QWORD *)a3 + 5);
    if (!v9)
      v9 = *(_QWORD *)(CRDT::StringArray::default_instance((CRDT::StringArray *)v7) + 40);
    v10 = -[TTMergeableString initWithArchive:andReplicaID:](v8, "initWithArchive:andReplicaID:", v9, v22);
    v11 = (TTMergeableAttributedString *)v10;
    v12 = *((int *)a3 + 14);
    if ((_DWORD)v12)
    {
      v21 = self;
      v13 = (const CRDT::StringArray_ArrayAttachment **)*((_QWORD *)a3 + 6);
      v14 = 8 * v12;
      do
      {
        CRDT::StringArray_ArrayAttachment::StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v23, *v13);
        if ((~v24 & 3) == 0)
        {
          if (*(char *)(v26 + 23) < 0)
            v15 = *(_QWORD *)(v26 + 8);
          else
            v15 = *(unsigned __int8 *)(v26 + 23);
          if (v15 == 16)
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v21);
            -[TTMergeableString attributedString](v11, "attributedString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = CFSTR("TTArrayAttachment");
            v28[0] = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAttributes:range:", v18, v25, 1);

          }
        }
        CRDT::StringArray_ArrayAttachment::~StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v23);
        ++v13;
        v14 -= 8;
      }
      while (v14);
      v6 = v11;
      self = v21;
    }
    else
    {
      v6 = (TTMergeableAttributedString *)v10;
    }
  }
  else
  {
    v6 = -[TTMergeableString initWithReplicaID:]([TTMergeableAttributedString alloc], "initWithReplicaID:", v22);
  }
  v19 = -[TTArray initWithContents:](self, "initWithContents:", v6, v21);

  return v19;
}

- (void)saveToArchive:(void *)a3
{
  void *v5;
  topotext::String *v6;
  unint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  CRDT::StringArray_ArrayAttachment *v12;
  uint64_t v13;
  int32x2_t v14;
  _QWORD *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[TTArray contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a3 + 8) |= 1u;
  v6 = (topotext::String *)*((_QWORD *)a3 + 5);
  if (!v6)
  {
    v6 = (topotext::String *)operator new();
    topotext::String::String(v6);
    *((_QWORD *)a3 + 5) = v6;
  }
  objc_msgSend(v5, "saveToArchive:", v6);

  if (-[TTArray count](self, "count"))
  {
    v7 = 0;
    do
    {
      -[TTArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = *((_DWORD *)a3 + 15);
        v10 = *((int *)a3 + 14);
        if ((int)v10 >= v9)
        {
          if (v9 == *((_DWORD *)a3 + 16))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 12, v9 + 1);
          v12 = google::protobuf::internal::GenericTypeHandler<CRDT::StringArray_ArrayAttachment>::New();
          v13 = *((_QWORD *)a3 + 6);
          v14 = *(int32x2_t *)((char *)a3 + 56);
          *((int32x2_t *)a3 + 7) = vadd_s32(v14, (int32x2_t)0x100000001);
          *(_QWORD *)(v13 + 8 * v14.i32[0]) = v12;
        }
        else
        {
          v11 = *((_QWORD *)a3 + 6);
          *((_DWORD *)a3 + 14) = v10 + 1;
          v12 = *(CRDT::StringArray_ArrayAttachment **)(v11 + 8 * v10);
        }
        *((_DWORD *)v12 + 8) |= 1u;
        *((_QWORD *)v12 + 5) = v7;
        v16[0] = 0;
        v16[1] = 0;
        objc_msgSend(v8, "getUUIDBytes:", v16);
        *((_DWORD *)v12 + 8) |= 2u;
        if (!google::protobuf::internal::empty_string_)
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        if (*((_QWORD *)v12 + 6) == google::protobuf::internal::empty_string_)
        {
          v15 = (_QWORD *)operator new();
          *v15 = 0;
          v15[1] = 0;
          v15[2] = 0;
          *((_QWORD *)v12 + 6) = v15;
        }
        MEMORY[0x1B5E3DB34]();
      }

      ++v7;
    }
    while (-[TTArray count](self, "count") > v7);
  }
}

- (TTArray)initWithCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  TTArray *v6;
  TTArray *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 14)
    v6 = -[TTArray initWithCRCoder:stringArray:](self, "initWithCRCoder:stringArray:", v4, *(_QWORD *)(v5 + 40));
  else
    v6 = -[TTArray init](self, "init");
  v7 = v6;

  return v7;
}

- (TTArray)initWithCRCoder:(id)a3 stringArray:(const void *)a4
{
  TTMergeableAttributedString *v6;
  void *v7;
  void *v8;
  TTMergeableAttributedString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  TTMergeableAttributedString *v13;
  TTMergeableAttributedString *v14;
  uint64_t v15;
  uint64_t v16;
  TTMergeableAttributedString *v17;
  uint64_t v18;
  const CRDT::StringArray_ArrayAttachment **v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  TTArray *v25;
  TTArray *v27;
  id v28;
  _BYTE v29[32];
  int v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if ((*((_BYTE *)a4 + 32) & 1) != 0)
  {
    v13 = [TTMergeableAttributedString alloc];
    v14 = v13;
    v15 = *((_QWORD *)a4 + 5);
    if (!v15)
      v15 = *(_QWORD *)(CRDT::StringArray::default_instance((CRDT::StringArray *)v13) + 40);
    v16 = -[TTMergeableAttributedString initWithCRCoder:string:](v14, "initWithCRCoder:string:", v28, v15);
    v17 = (TTMergeableAttributedString *)v16;
    v18 = *((int *)a4 + 14);
    if ((_DWORD)v18)
    {
      v27 = self;
      v19 = (const CRDT::StringArray_ArrayAttachment **)*((_QWORD *)a4 + 6);
      v20 = 8 * v18;
      do
      {
        CRDT::StringArray_ArrayAttachment::StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v29, *v19);
        if ((~v30 & 3) == 0)
        {
          v21 = *(char *)(v32 + 23) < 0 ? *(_QWORD *)(v32 + 8) : *(unsigned __int8 *)(v32 + 23);
          if (v21 == 16)
          {
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v27);
            -[TTMergeableString attributedString](v17, "attributedString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = CFSTR("TTArrayAttachment");
            v34[0] = v22;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setAttributes:range:", v24, v31, 1);

          }
        }
        CRDT::StringArray_ArrayAttachment::~StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v29);
        ++v19;
        v20 -= 8;
      }
      while (v20);
      v9 = v17;
      self = v27;
    }
    else
    {
      v9 = (TTMergeableAttributedString *)v16;
    }
  }
  else
  {
    v6 = [TTMergeableAttributedString alloc];
    objc_msgSend(v28, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replica");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TTMergeableString initWithReplicaID:](v6, "initWithReplicaID:", v8);

    v10 = objc_opt_class();
    objc_msgSend(v28, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    REMDynamicCast(v10, (uint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[TTMergeableString setDocument:](v9, "setDocument:", v12);

  }
  v25 = -[TTArray initWithContents:](self, "initWithContents:", v9, v27);

  return v25;
}

- (void)encodeWithCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::StringArray *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 14)
  {
    v6 = *(CRDT::StringArray **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 14;
    v6 = (CRDT::StringArray *)operator new();
    CRDT::StringArray::StringArray(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[TTArray saveToArchive:](self, "saveToArchive:", v6);

}

- (void)objectAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "No object at index %{public}lu", a5, a6, a7, a8, 0);
}

- (void)mergeWith:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "Cannot merge with object of type %{public}@.", a5, a6, a7, a8, 2u);
}

@end
