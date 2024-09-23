@implementation CRArray

- (CRArray)init
{

  return 0;
}

- (CRArray)initWithDocument:(id)a3
{
  id v4;
  TTArray *v5;
  CRDictionary *v6;
  CRArray *v7;

  v4 = a3;
  v5 = -[TTArray initWithDocument:]([TTArray alloc], "initWithDocument:", v4);
  v6 = -[CRDictionary initWithDocument:]([CRDictionary alloc], "initWithDocument:", v4);
  v7 = -[CRArray initWithTTArray:contents:document:](self, "initWithTTArray:contents:document:", v5, v6, v4);

  return v7;
}

- (CRArray)initWithTTArray:(id)a3 contents:(id)a4 document:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRArray *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRArray;
  v11 = -[CRArray init](&v13, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "setDelegate:", v11);
    -[CRArray setArray:](v11, "setArray:", v8);
    -[CRArray setContents:](v11, "setContents:", v9);
    -[CRArray setDocument:](v11, "setDocument:", v10);
  }

  return v11;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CRArray array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRArray contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addObject:(id)a3
{
  id v3;

  v3 = -[CRArray _addObject:](self, "_addObject:", a3);
}

- (id)_addObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CRArray _insertObject:atIndex:](self, "_insertObject:atIndex:", v4, -[CRArray count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v4;

  v4 = -[CRArray _insertObject:atIndex:](self, "_insertObject:atIndex:", a3, a4);
}

- (id)_insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRArray _insertObject:withIdentifier:atIndex:forUndo:](self, "_insertObject:withIdentifier:atIndex:forUndo:", v7, v8, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_insertObject:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5 forUndo:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v10 = a3;
  v11 = a4;
  if (!a6)
  {
    -[CRArray array](self, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v11, a5);

  }
  -[CRArray contents](self, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v11);

  if (-[CRArray wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRArray delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__CRArray__insertObject_withIdentifier_atIndex_forUndo___block_invoke;
    v16[3] = &unk_1E67FAB10;
    v17 = v11;
    objc_msgSend(v14, "addUndoCommandsForObject:block:", self, v16);

  }
  return v11;
}

void __56__CRArray__insertObject_withIdentifier_atIndex_forUndo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", *(_QWORD *)(a1 + 32));

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:forUndo:", v4, 1);

}

- (void)removeLastObject
{
  unint64_t v3;

  v3 = -[CRArray count](self, "count");
  if (v3)
    -[CRArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v3 - 1);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[CRArray removeObjectAtIndex:forUndo:](self, "removeObjectAtIndex:forUndo:", a3, 0);
}

- (void)removeObjectAtIndex:(unint64_t)a3 forUndo:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;

  -[CRArray array](self, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CRArray wantsUndoCommands](self, "wantsUndoCommands"))
  {
    -[CRArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRArray delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__CRArray_removeObjectAtIndex_forUndo___block_invoke;
    v14[3] = &unk_1E67FAB38;
    v15 = v9;
    v16 = v8;
    v17 = a3;
    v11 = v9;
    objc_msgSend(v10, "addUndoCommandsForObject:block:", self, v14);

  }
  if (!a4)
  {
    -[CRArray array](self, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", a3);

  }
  -[CRArray contents](self, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v8);

}

void __39__CRArray_removeObjectAtIndex_forUndo___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = a1[4];
  v4 = a1[5];
  v5 = objc_msgSend(v8, "count");
  if (v5 >= a1[6])
    v6 = a1[6];
  else
    v6 = v5;
  v7 = (id)objc_msgSend(v8, "_insertObject:withIdentifier:atIndex:forUndo:", v3, v4, v6, 1);

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;

  v6 = a4;
  -[CRArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3);
  -[CRArray insertObject:atIndex:](self, "insertObject:atIndex:", v6, a3);

}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CRArray array](self, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CRArray array](self, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", a3);

  -[CRArray array](self, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v10, a4);

  -[CRArray setMoveClock:](self, "setMoveClock:", 1);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CRArray array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__CRArray_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E67FAB60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __38__CRArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CRArray array](self, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSUUID)replicaUUID
{
  void *v2;
  void *v3;

  -[CRArray document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replica");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (unint64_t)firstIndexOf:(id)a3 fromIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (-[CRArray count](self, "count") <= a4)
  {
LABEL_4:
    a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      -[CRArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", v6);

      if ((v8 & 1) != 0)
        break;
      if (++a4 >= -[CRArray count](self, "count"))
        goto LABEL_4;
    }
  }

  return a4;
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
  v10 = __Block_byref_object_copy__17;
  v11 = __Block_byref_object_dispose__17;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E67FB1F0);
  v3 = -[CRArray count](self, "count");
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __22__CRArray_description__block_invoke;
    v6[3] = &unk_1E67FAB88;
    v6[4] = &v7;
    v6[5] = v3;
    -[CRArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
    v4 = (__CFString *)objc_msgSend((id)v8[5], "copy");
  }
  else
  {
    v4 = CFSTR("[]");
  }
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __22__CRArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CRArray contents](self, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[CRArray array](self, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CRArray contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRArray array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)mergeWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.coreCRDT", "TTArray");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CRArray mergeWith:].cold.1(v10, v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CRArray cannot merge with object of type %@."), v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v13 = v4;
  -[CRArray array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeWith:", v6);

  -[CRArray contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mergeWith:", v8);
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRArray *v12;

  v6 = a4;
  v7 = a3;
  -[CRArray array](self, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deltaSince:in:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRArray contents](self, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deltaSince:in:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CRArray initWithTTArray:contents:document:]([CRArray alloc], "initWithTTArray:contents:document:", v9, v11, v6);
  return v12;
}

- (void)realizeLocalChangesIn:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRArray array](self, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realizeLocalChangesIn:", v6);

  -[CRArray contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "realizeLocalChangesIn:", v6);

  if (-[CRArray moveClock](self, "moveClock"))
    objc_msgSend(v6, "setUnserializedReplicaClock:", objc_msgSend(v6, "unserializedReplicaClock") + -[CRArray moveClock](self, "moveClock"));
  -[CRArray setMoveClock:](self, "setMoveClock:", 0);

}

- (id)tombstone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRArray *v7;
  void *v8;
  CRArray *v9;

  -[CRArray array](self, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tombstone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRArray contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tombstone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CRArray alloc];
  -[CRArray document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRArray initWithTTArray:contents:document:](v7, "initWithTTArray:contents:document:", v4, v6, v8);

  return v9;
}

- (void)walkGraph:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRArray array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "walkGraph:", v4);

  -[CRArray contents](self, "contents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "walkGraph:", v4);

}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRArray array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocument:", v4);

  -[CRArray contents](self, "contents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDocument:", v4);

}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[CRArray delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CRArray_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E67FABB0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addUndoCommandsForObject:block:", self, v8);

}

void __42__CRArray_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (BOOL)wantsUndoCommands
{
  void *v2;
  char v3;

  -[CRArray delegate](self, "delegate");
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

- (TTArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (CRDictionary)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (BOOL)moveClock
{
  return self->_moveClock;
}

- (void)setMoveClock:(BOOL)a3
{
  self->_moveClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_document);
}

- (void)encodeWithCRCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CRDT::Array *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  v5 = v4;
  if (*(_DWORD *)(v4 + 48) == 15)
  {
    v6 = *(CRDT::Array **)(v4 + 40);
  }
  else
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 15;
    v6 = (CRDT::Array *)operator new();
    CRDT::Array::Array(v6);
    *(_QWORD *)(v5 + 40) = v6;
  }
  -[CRArray encodeWithCRCoder:array:](self, "encodeWithCRCoder:array:", v7, v6);

}

- (void)encodeWithCRCoder:(id)a3 array:(void *)a4
{
  void *v6;
  CRDT::StringArray *v7;
  void *v8;
  CRDT::Dictionary *v9;
  id v10;

  v10 = a3;
  -[CRArray array](self, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a4 + 8) |= 1u;
  v7 = (CRDT::StringArray *)*((_QWORD *)a4 + 5);
  if (!v7)
  {
    v7 = (CRDT::StringArray *)operator new();
    CRDT::StringArray::StringArray(v7);
    *((_QWORD *)a4 + 5) = v7;
  }
  objc_msgSend(v6, "saveToArchive:", v7);

  -[CRArray contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)a4 + 8) |= 2u;
  v9 = (CRDT::Dictionary *)*((_QWORD *)a4 + 6);
  if (!v9)
  {
    v9 = (CRDT::Dictionary *)operator new();
    CRDT::Dictionary::Dictionary(v9);
    *((_QWORD *)a4 + 6) = v9;
  }
  objc_msgSend(v8, "encodeWithCRCoder:dictionary:", v10, v9);

}

- (CRArray)initWithCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CRArray *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 15)
  {
    v6 = -[CRArray initWithCRCoder:array:](self, "initWithCRCoder:array:", v4, *(_QWORD *)(v5 + 40));
  }
  else
  {
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRArray initWithDocument:](self, "initWithDocument:", v7);

  }
  return v6;
}

- (CRArray)initWithCRCoder:(id)a3 array:(const void *)a4
{
  id v6;
  CRDictionary *v7;
  CRDictionary *v8;
  uint64_t v9;
  CRDictionary *v10;
  TTArray *v11;
  TTArray *v12;
  uint64_t v13;
  TTArray *v14;
  void *v15;
  CRArray *v16;

  v6 = a3;
  v7 = [CRDictionary alloc];
  v8 = v7;
  v9 = *((_QWORD *)a4 + 6);
  if (!v9)
    v9 = *(_QWORD *)(CRDT::Array::default_instance((CRDT::Array *)v7) + 48);
  v10 = -[CRDictionary initWithCRCoder:dictionary:](v8, "initWithCRCoder:dictionary:", v6, v9);
  v11 = [TTArray alloc];
  v12 = v11;
  v13 = *((_QWORD *)a4 + 5);
  if (!v13)
    v13 = *(_QWORD *)(CRDT::Array::default_instance((CRDT::Array *)v11) + 40);
  v14 = -[TTArray initWithCRCoder:stringArray:](v12, "initWithCRCoder:stringArray:", v6, v13);
  objc_msgSend(v6, "document");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CRArray initWithTTArray:contents:document:](self, "initWithTTArray:contents:document:", v14, v10, v15);

  return v16;
}

- (void)mergeWith:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Cannot merge with object of type %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end
