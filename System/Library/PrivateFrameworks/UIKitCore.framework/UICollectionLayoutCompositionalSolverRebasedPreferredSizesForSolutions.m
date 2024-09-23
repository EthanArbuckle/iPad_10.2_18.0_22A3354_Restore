@implementation UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_6(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a2 && a2[10] == 3 && a2[6] != 0x7FFFFFFFFFFFFFFFLL && a2[1] != a2[3])
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v6, 0, a2[4]);
      v5 = v6;
    }

  }
}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  id *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  id *v15;
  id v16;
  _QWORD v17[4];
  id *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id *v26;
  id v27;
  uint64_t v28;

  v6 = objc_msgSend(*(id *)(a1 + 32), "finalSectionIndexForInitialSectionIndex:");
  if (a2)
  {
    v16 = *(id *)(a2 + 16);
    v7 = *(void **)(a2 + 8);
  }
  else
  {
    v16 = 0;
    v7 = 0;
  }
  v8 = v7;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (id *)v16;
    v10 = v9;
    if (v9 && !objc_msgSend(v9[2], "count"))
      objc_msgSend(v10[3], "count");
    -[_UICollectionPreferredSizes indexes]((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_3;
    v24[3] = &unk_1E16B8BF0;
    v28 = a3;
    v25 = *(id *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    v13 = v10;
    v26 = v13;
    objc_msgSend(v11, "enumerateIndexesUsingBlock:", v24);

    -[_UICollectionPreferredSizes elementKinds]((uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_4;
    v17[3] = &unk_1E16B8C40;
    v18 = v13;
    v19 = v8;
    v22 = v6;
    v23 = a3;
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v15 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

  }
}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;

  -[_UICollectionPreferredSizes objectForKeyedSubscript:](*(_QWORD *)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_4");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4039, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSupplementaryPreferredSizes"));

  }
  -[_UICollectionPreferredSizes indexes]((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_5;
  v9[3] = &unk_1E16B8C18;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v12 = v4;
  v15 = *(_OWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v8 = v4;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v9);

}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;

  v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "supplementaryFrameWithKind:index:", *(_QWORD *)(a1 + 40), a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = v4;
    -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(_QWORD *)(a1 + 48), v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_5");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4047, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryPreferredSize"));

    }
    v6 = v16[7];
    if ((unint64_t)(v6 - 2) >= 2)
    {
      if (v6 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_5");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4065, CFSTR("Unexpected supplementary kind (global) while rebasing. Please file a bug on UICollectionView."));
LABEL_16:

        goto LABEL_17;
      }
      if (v6 != 4)
      {
LABEL_17:

        v4 = v16;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v2, *(_QWORD *)(a1 + 80));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "finalIndexPathForInitialIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v2 = objc_msgSend(v8, "item");
        objc_msgSend(v9, "section");
      }
      else
      {
        v2 = 0x7FFFFFFFFFFFFFFFLL;
      }

    }
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_5");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4070, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalSectionPreferredSizes"));

      }
      -[_UICollectionPreferredSizes objectForKeyedSubscript:]((uint64_t)v10, *(void **)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v11, (uint64_t)v5, v2);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:

}

void ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
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
  id v17;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v17 = (id)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4022, CFSTR("Failed to determine the initial index path for specified item during rebase. Pleae file a bug on UICollectionView."));

    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finalIndexPathForInitialIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v5, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalPreferredSizes"));

    }
    -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(_QWORD *)(a1 + 40), a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4028, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredSize"));

    }
    if (objc_msgSend(v6, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSNumber *,_UICollectionPreferredSizes *> *_UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions(NSArray<_UICollectionCompositionalSolverPreferredSizesRebaseInfo *> *const __strong, _UICollectionCompositionalLayoutSolverUpdate *const __strong, BOOL)_block_invoke_3");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 4029, CFSTR("Failed to get a valid indexPath for an item during rebase. Please file a bug on UICollectionView."));

    }
    -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v7, (uint64_t)v8, objc_msgSend(v6, "item"));

  }
}

_UICollectionPreferredSizes *___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _UICollectionPreferredSizes *v6;
  void *v7;
  void *v8;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (_UICollectionPreferredSizes *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(_UICollectionPreferredSizes);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  return v6;
}

@end
