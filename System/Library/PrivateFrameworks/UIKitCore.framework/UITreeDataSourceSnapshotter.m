@implementation UITreeDataSourceSnapshotter

void __64___UITreeDataSourceSnapshotter_deleteIndexes_orphanDisposition___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = objc_msgSend(*(id *)(a1 + 32), "_nodeIndexForGlobalIndex:", a2);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("_UITreeDataSourceSnapshotter.mm"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeIndex != NSNotFound"));

  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (uint64_t *)(v5[1] + 24 * v4);
  v8 = *v6;
  v7 = v6[1];
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("_UITreeDataSourceSnapshotter.mm"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.length > 0"));

    v9 = -1;
    goto LABEL_5;
  }
  v9 = v7 - 1;
  if (v9)
  {
LABEL_5:
    *v6 = v8;
    v6[1] = v9;
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    return;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v5, "_deleteChildNodesForParentNodeIndex:", v4);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addIndexes:");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) += ~objc_msgSend(v24, "count");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 16);
    v12 = *(_QWORD *)(v10 + 8) + 24 * v4;
    v13 = v11 - (v12 + 24);
    if (v11 != v12 + 24)
      memmove((void *)v12, (const void *)(v12 + 24), v11 - (v12 + 24));
    *(_QWORD *)(v10 + 16) = v12 + v13;

  }
  else if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(v5, "childrenForParentAtIndex:recursive:", a2, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD **)(a1 + 32);
    v25 = v14;
    if (v4 + 1 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15[2] - v15[1]) >> 3)))
    {
      v16 = ~v4 - 0x5555555555555555 * ((uint64_t)(v15[2] - v15[1]) >> 3);
      v17 = 24 * v4;
      do
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v19 = objc_msgSend(v14, "containsIndexesInRange:", *(_QWORD *)(v18 + v17 + 24), *(_QWORD *)(v18 + v17 + 32));
        v14 = v25;
        if (!v19)
          break;
        --*(_QWORD *)(v18 + v17 + 40);
        v17 += 24;
        --v16;
      }
      while (v16);
      v15 = *(_QWORD **)(a1 + 32);
    }
    --v15[4];
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(v20 + 16);
    v22 = *(_QWORD *)(v20 + 8) + 24 * v4;
    v23 = v21 - (v22 + 24);
    if (v21 != v22 + 24)
    {
      memmove((void *)v22, (const void *)(v22 + 24), v21 - (v22 + 24));
      v14 = v25;
    }
    *(_QWORD *)(v20 + 16) = v22 + v23;

  }
}

void __67___UITreeDataSourceSnapshotter_childrenForParentAtIndex_recursive___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "childrenForParentAtIndex:recursive:", a2, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndexes:");

}

uint64_t __87___UITreeDataSourceSnapshotter_snapshotterRepresentingSubtreeForIndex_includingParent___block_invoke()
{
  return 1;
}

uint64_t __80___UITreeDataSourceSnapshotter_replaceChildItemsFromSnapshotter_forParentIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addIndex:", *(_QWORD *)(a1 + 40) + a2);
}

_QWORD *__68___UITreeDataSourceSnapshotter__deleteChildNodesForParentNodeIndex___block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) += *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24 * a2 + 8);
  v2 = result[4];
  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 8) + 24 * a2;
  v5 = v3 - (v4 + 24);
  if (v3 != v4 + 24)
    result = memmove((void *)v4, (const void *)(v4 + 24), v3 - (v4 + 24));
  *(_QWORD *)(v2 + 16) = v4 + v5;
  return result;
}

uint64_t __75___UITreeDataSourceSnapshotter__recomputeExpandedIndexesForDeletedIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;

  v4 = a2;
  if (a2)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "countOfIndexesInRange:", 0, a2);
    if (v6 >= 1)
      v4 = (v4 - v6) & ~((v4 - v6) >> 63);
  }
  return objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", v4, a3);
}

@end
