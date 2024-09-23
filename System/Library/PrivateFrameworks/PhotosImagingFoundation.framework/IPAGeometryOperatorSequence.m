@implementation IPAGeometryOperatorSequence

- (IPAGeometryOperatorSequence)initWithIdentifier:(id)a3
{
  IPAGeometryOperatorSequence *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *isolationQueue;
  uint64_t v11;
  NSMutableDictionary *map_identifierToOperator;
  uint64_t v13;
  NSMutableDictionary *map_identifierToIndex;
  uint64_t v15;
  NSMutableArray *operators;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)IPAGeometryOperatorSequence;
  v3 = -[IPAGeometryOperator initWithIdentifier:](&v18, sel_initWithIdentifier_, a3);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%p._isolationQueue"), v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    map_identifierToOperator = v3->map_identifierToOperator;
    v3->map_identifierToOperator = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    map_identifierToIndex = v3->map_identifierToIndex;
    v3->map_identifierToIndex = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    operators = v3->_operators;
    v3->_operators = (NSMutableArray *)v15;

  }
  return v3;
}

- (unint64_t)count
{
  NSObject *isolationQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__IPAGeometryOperatorSequence_count__block_invoke;
  v5[3] = &unk_1E986E088;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)appendOperator:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  IPAGeometryOperatorSequence *v8;
  SEL v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  if (v4)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__IPAGeometryOperatorSequence_appendOperator___block_invoke;
    block[3] = &unk_1E986E268;
    block[4] = self;
    v13 = v4;
    v14 = &v15;
    v6 = v4;
    dispatch_sync(isolationQueue, block);
    LOBYTE(isolationQueue) = *((_BYTE *)v16 + 24);

    _Block_object_dispose(&v15, 8);
    return (char)isolationQueue;
  }
  else
  {
    v8 = (IPAGeometryOperatorSequence *)_PFAssertFailHandler();
    return -[IPAGeometryOperatorSequence replaceOperatorWithIdentifier:withOperator:](v8, v9, v10, v11);
  }
}

- (BOOL)replaceOperatorWithIdentifier:(id)a3 withOperator:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  char v11;
  BOOL result;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  if (v6 && v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__IPAGeometryOperatorSequence_replaceOperatorWithIdentifier_withOperator___block_invoke;
    block[3] = &unk_1E986E0B0;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    v16 = &v17;
    v9 = v7;
    v10 = v6;
    dispatch_sync(isolationQueue, block);
    v11 = *((_BYTE *)v18 + 24);

    _Block_object_dispose(&v17, 8);
    return v11;
  }
  else
  {
    result = _PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (BOOL)removeOperatorWithIdentifier:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  IPAGeometryOperatorSequence *v8;
  SEL v9;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  if (v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__IPAGeometryOperatorSequence_removeOperatorWithIdentifier___block_invoke;
    block[3] = &unk_1E986E268;
    block[4] = self;
    v12 = v4;
    v13 = &v14;
    v6 = v4;
    dispatch_sync(isolationQueue, block);
    LOBYTE(isolationQueue) = *((_BYTE *)v15 + 24);

    _Block_object_dispose(&v14, 8);
    return (char)isolationQueue;
  }
  else
  {
    v8 = (IPAGeometryOperatorSequence *)_PFAssertFailHandler();
    return -[IPAGeometryOperatorSequence transformForGeometry:](v8, v9, v10);
  }
}

- (id)transformForGeometry:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
LABEL_13:
    _PFAssertFailHandler();
  v5 = v4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1593;
  v28 = __Block_byref_object_dispose__1594;
  v29 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__IPAGeometryOperatorSequence_transformForGeometry___block_invoke;
  block[3] = &unk_1E986E088;
  block[4] = self;
  block[5] = &v24;
  dispatch_sync(isolationQueue, block);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)v25[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      v12 = v5;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "transformForGeometry:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13
          || (objc_msgSend(v13, "intrinsicGeometry"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = v15 == 0,
              v15,
              v16))
        {
          _PFAssertFailHandler();
          __break(1u);
          goto LABEL_13;
        }
        objc_msgSend(v7, "addObject:", v14);
        objc_msgSend(v14, "intrinsicGeometry");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v5;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v9);
  }

  +[IPAImageTransform compositeTransforms:](IPAImageTransform, "compositeTransforms:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v24, 8);
  return v17;
}

- (id)subsequenceFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *isolationQueue;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id result;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    result = (id)_PFAssertFailHandler();
LABEL_22:
    __break(1u);
    return result;
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1593;
  v45 = __Block_byref_object_dispose__1594;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1593;
  v39 = __Block_byref_object_dispose__1594;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1593;
  v33 = __Block_byref_object_dispose__1594;
  v34 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__IPAGeometryOperatorSequence_subsequenceFrom_to___block_invoke;
  block[3] = &unk_1E986E0D8;
  v26 = &v41;
  v27 = &v35;
  block[4] = self;
  v10 = v6;
  v24 = v10;
  v28 = &v29;
  v11 = v8;
  v25 = v11;
  dispatch_sync(isolationQueue, block);
  if (!objc_msgSend((id)v42[5], "count"))
  {
LABEL_21:
    result = (id)_PFAssertFailHandler();
    goto LABEL_22;
  }
  v12 = kIPAImageGeometryInputSpace;
  if ((id)kIPAImageGeometryInputSpace == v10)
  {
    v14 = (void *)v36[5];
    v36[5] = (uint64_t)&unk_1E9876C88;
  }
  else
  {
    if ((id)kIPAImageGeometryOutputSpace != v10)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v42[5], "count") - 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v36[5];
    v36[5] = v13;
  }

  v12 = kIPAImageGeometryInputSpace;
LABEL_9:
  if ((id)v12 == v11)
  {
    v16 = (void *)v30[5];
    v30[5] = (uint64_t)&unk_1E9876C88;
    goto LABEL_13;
  }
  if ((id)kIPAImageGeometryOutputSpace == v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v42[5], "count") - 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v30[5];
    v30[5] = v15;
LABEL_13:

  }
  v17 = (void *)v36[5];
  if (!v17)
    goto LABEL_21;
  if (!v30[5])
    goto LABEL_21;
  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  v19 = objc_msgSend((id)v30[5], "unsignedIntegerValue");
  if (v18 > v19)
    goto LABEL_21;
  +[IPAGeometryOperatorSequence sequence](IPAGeometryOperatorSequence, "sequence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend((id)v42[5], "objectAtIndexedSubscript:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendOperator:", v21);

    ++v18;
  }
  while (v18 <= v19);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p elements:%@>"), v5, self, self->_operators);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operators, 0);
  objc_storeStrong((id *)&self->map_identifierToIndex, 0);
  objc_storeStrong((id *)&self->map_identifierToOperator, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __50__IPAGeometryOperatorSequence_subsequenceFrom_to___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1[4] + 40), "copy");
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[6]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[9] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __52__IPAGeometryOperatorSequence_transformForGeometry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__IPAGeometryOperatorSequence_removeOperatorWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
    objc_msgSend(*(id *)(a1[4] + 40), "removeObjectAtIndex:", v3);
    objc_msgSend(*(id *)(a1[4] + 32), "removeObjectForKey:", a1[5]);
    objc_msgSend(*(id *)(a1[4] + 24), "removeObjectForKey:", a1[5]);
    while (v3 < objc_msgSend(*(id *)(a1[4] + 40), "count"))
    {
      objc_msgSend(*(id *)(a1[4] + 40), "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1[4] + 32);
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

      ++v3;
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v2 = v8;
  }

}

void __74__IPAGeometryOperatorSequence_replaceOperatorWithIdentifier_withOperator___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1[4] + 40), "replaceObjectAtIndex:withObject:", objc_msgSend(v2, "unsignedIntegerValue"), a1[6]);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v2 = v3;
  }

}

void __46__IPAGeometryOperatorSequence_appendOperator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v12;
  if (!v12)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v4 = 0;
  }

}

uint64_t __36__IPAGeometryOperatorSequence_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)sequence
{
  return (id)objc_msgSend(a1, "sequenceWithIdentifier:", CFSTR("sequence"));
}

+ (id)sequenceWithIdentifier:(id)a3
{
  id v3;
  IPAGeometryOperatorSequence *v4;

  v3 = a3;
  v4 = -[IPAGeometryOperatorSequence initWithIdentifier:]([IPAGeometryOperatorSequence alloc], "initWithIdentifier:", v3);

  return v4;
}

@end
