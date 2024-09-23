@implementation WFThreeWayMergingObjectGraph

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  NSMutableOrderedSet *orderedVertexes;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
    orderedVertexes = self->_orderedVertexes;
  else
    orderedVertexes = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n             Ordered Vertexes: %@\n             Direct Successors Map: %@\n             Direct Predecessors Map: %@"), v5, self, orderedVertexes, self->_directSuccessorsForVertexes, self->_directPredecessorsForVertexes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directPredecessorsForVertexes, 0);
  objc_storeStrong((id *)&self->_directSuccessorsForVertexes, 0);
  objc_storeStrong((id *)&self->_orderedVertexes, 0);
  objc_storeStrong(&self->_vertexComparator, 0);
}

- (_QWORD)initWithVertexComparator:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  objc_super v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithVertexComparator_, a1, CFSTR("WFThreeWayMergingObjectGraph.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("comparator"));

    }
    v15.receiver = a1;
    v15.super_class = (Class)WFThreeWayMergingObjectGraph;
    a1 = objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      v5 = _Block_copy(v4);
      v6 = (void *)a1[1];
      a1[1] = v5;

      v7 = objc_opt_new();
      v8 = (void *)a1[2];
      a1[2] = v7;

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)a1[3];
      a1[3] = v9;

      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)a1[4];
      a1[4] = v11;

    }
  }

  return a1;
}

- (void)addStandaloneVertex:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_addStandaloneVertex_, a1, CFSTR("WFThreeWayMergingObjectGraph.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("vertex"));

    }
    v4 = *(id *)(a1 + 16);
    v5 = objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v4, "count"), 1024, *(_QWORD *)(a1 + 8));

    objc_msgSend(*(id *)(a1 + 16), "insertObject:atIndex:", v7, v5);
    v3 = v7;
  }

}

- (void)addEdgeFromVertex:(void *)a3 toVertex:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_9;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_addEdgeFromVertex_toVertex_, a1, CFSTR("WFThreeWayMergingObjectGraph.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("from"));

    if (v5)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_addEdgeFromVertex_toVertex_, a1, CFSTR("WFThreeWayMergingObjectGraph.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("to"));

    goto LABEL_4;
  }
  if (!v5)
    goto LABEL_11;
LABEL_4:
  v6 = *(id *)(a1 + 16);
  v7 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v6, "count"), 1024, *(_QWORD *)(a1 + 8));

  objc_msgSend(*(id *)(a1 + 16), "insertObject:atIndex:", v14, v7);
  v8 = *(id *)(a1 + 16);
  v9 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v8, "count"), 1024, *(_QWORD *)(a1 + 8));

  objc_msgSend(*(id *)(a1 + 16), "insertObject:atIndex:", v5, v9);
  objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v10, v14);
  }
  objc_msgSend(v10, "insertObject:atIndex:", v5, objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v10, "count"), 1024, *(_QWORD *)(a1 + 8)));
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v5);
  }
  objc_msgSend(v11, "insertObject:atIndex:", v14, objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v11, "count"), 1024, *(_QWORD *)(a1 + 8)));

LABEL_9:
}

void __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  id v44;
  _QWORD v45[4];
  id v46;

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v43 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
  if (v43)
    v2 = (void *)v43[1];
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v3;
  if (!v43)
  {
    v6 = 0;
LABEL_6:
    v7 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v3);

    v9 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v3);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
    goto LABEL_18;
  }
  v5 = v43[2];
  v6 = v43[3];
  if (v5 != 1)
  {
    if (v5)
      goto LABEL_18;
    goto LABEL_6;
  }
  objc_msgSend(v4, "objectAtIndex:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 56);
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "objectForKey:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  if (v15 >= v17)
    v18 = v17;
  else
    v18 = v15;
  v3 = v44;
  objc_msgSend(v13, "numberWithUnsignedInteger:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v19, v44);

  ++v6;
LABEL_18:
  while (v6 < objc_msgSend(v4, "count"))
  {
    v20 = (void *)MEMORY[0x1C3BB3598]();
    objc_msgSend(v4, "objectAtIndex:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v40 = v3;
      v41 = objc_alloc((Class)objc_opt_self());
      v42 = -[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initWithVertex:step:predecessorIndex:](v41, v40, 1, v6);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v42);
      +[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initialItemWithVertex:]((uint64_t)WFThreeWayMergingObjectGraphComponentEnumerationStackItem, v21);
      v43 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v43);
      objc_autoreleasePoolPop(v20);
      goto LABEL_22;
    }
    if (objc_msgSend(*(id *)(a1 + 64), "containsObject:", v21))
    {
      v23 = *(void **)(a1 + 56);
      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "objectForKey:", v3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      v3 = v44;
      if (v26 >= v28)
        v29 = v28;
      else
        v29 = v26;
      objc_msgSend(v24, "numberWithUnsignedInteger:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v30, v44);

    }
    objc_autoreleasePoolPop(v20);
    ++v6;
  }
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqualToNumber:", v32);

  if (v33)
  {
    v34 = objc_msgSend(*(id *)(a1 + 64), "indexOfObject:", v3);
    v35 = objc_msgSend(*(id *)(a1 + 64), "count") - v34;
    v36 = (void *)objc_opt_new();
    v37 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v34, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke_2;
    v45[3] = &unk_1E7AF7170;
    v46 = v36;
    v39 = v36;
    objc_msgSend(v37, "enumerateObjectsAtIndexes:options:usingBlock:", v38, 2, v45);

    objc_msgSend(*(id *)(a1 + 64), "removeObjectsInRange:", v34, v35);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
LABEL_22:

}

uint64_t __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
