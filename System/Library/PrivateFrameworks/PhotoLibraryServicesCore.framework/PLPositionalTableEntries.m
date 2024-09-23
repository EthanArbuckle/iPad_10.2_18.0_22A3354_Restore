@implementation PLPositionalTableEntries

- (PLPositionalTableEntries)initWithBuffers:(void *)a3 forIndexes:(id)a4 entryLength:(unint64_t)a5
{
  id v10;
  PLPositionalTableEntries *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLPositionalTableEntries;
  v11 = -[PLPositionalTableEntries init](&v17, sel_init);
  if (!v11)
    goto LABEL_8;
  if (v10)
  {
    if (a5)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PLPositionalTable.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexes"));

    if (a5)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PLPositionalTable.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entryLength > 0"));

LABEL_4:
  v12 = objc_msgSend(v10, "count");
  if (!a3 && v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PLPositionalTable.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexes.count == 0 || buffers != NULL"));

  }
  objc_storeStrong((id *)&v11->_readIndexes, a4);
  v11->_entryLength = a5;
  v11->_buffers = (void **)a3;
LABEL_8:

  return v11;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  objc_super v6;

  if (self->_buffers)
  {
    v3 = -[NSIndexSet rangeCount](self->_readIndexes, "rangeCount");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
        free(self->_buffers[i]);
    }
    free(self->_buffers);
  }
  v6.receiver = self;
  v6.super_class = (Class)PLPositionalTableEntries;
  -[PLPositionalTableEntries dealloc](&v6, sel_dealloc);
}

- (void)enumerateIndexes:(id)a3
{
  id v5;
  NSIndexSet *readIndexes;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD v14[3];
  char v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalTable.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  readIndexes = self->_readIndexes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PLPositionalTableEntries_enumerateIndexes___block_invoke;
  v9[3] = &unk_1E376BFE0;
  v9[4] = self;
  v11 = v13;
  v7 = v5;
  v10 = v7;
  v12 = v14;
  -[NSIndexSet enumerateRangesUsingBlock:](readIndexes, "enumerateRangesUsingBlock:", v9);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);

}

- (unint64_t)entryLength
{
  return self->_entryLength;
}

- (NSIndexSet)readIndexes
{
  return self->_readIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readIndexes, 0);
}

void __45__PLPositionalTableEntries_enumerateIndexes___block_invoke(_QWORD *a1, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t, uint64_t, char *);
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v6 = a2;
  v8 = a1[4];
  v9 = (void *)a1[5];
  v10 = *(_QWORD *)(*(_QWORD *)(v8 + 16) + 8 * *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v14[0] = MEMORY[0x1E0C809B0];
  v15 = __45__PLPositionalTableEntries_enumerateIndexes___block_invoke_2;
  v16 = &unk_1E376BFB8;
  v14[1] = 3221225472;
  v21 = a3;
  v22 = v10;
  v20 = a2;
  v17 = v8;
  v11 = v9;
  v12 = a1[7];
  v18 = v11;
  v19 = v12;
  v23 = 0;
  if (v6 < v6 + a3)
  {
    v13 = a3 - 1;
    do
    {
      v15((uint64_t)v14, v6, &v23);
      if (!v13)
        break;
      ++v6;
      --v13;
    }
    while (!v23);
    v12 = a1[7];
  }
  if (*(_BYTE *)(*(_QWORD *)(v12 + 8) + 24))
    *a4 = 1;
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

}

uint64_t __45__PLPositionalTableEntries_enumerateIndexes___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;
  return result;
}

@end
