@implementation UIFlowLayoutSection

void __61___UIFlowLayoutSection_sizeChangedForItem_atIndexPath_inRow___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  uint64_t v4;
  double *WeakRetained;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  double v13;
  double *v14;
  uint64_t v15;
  __int128 v16;
  _BYTE *v17;

  v3 = a2;
  if (!v3 || (v3[8] & 5) != 1)
    goto LABEL_18;
  v17 = v3;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    WeakRetained = (double *)objc_loadWeakRetained((id *)(v4 + 144));
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (WeakRetained)
    {
      v8 = *((_QWORD *)WeakRetained + 11);
      if (v8 < 1)
      {
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v9 = *MEMORY[0x1E0C9D820];
      }
      else
      {
        v9 = WeakRetained[9] / (double)v8;
        v10 = WeakRetained[10] / (double)v8;
      }
      goto LABEL_8;
    }
  }
  else
  {
    WeakRetained = 0;
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = 0.0;
  v9 = 0.0;
LABEL_8:

  v11 = v9 == v6 && v10 == v7;
  v3 = v17;
  if (!v11)
  {
    v16 = *((_OWORD *)v17 + 2);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 0.0;
    if (v12)
    {
      v14 = (double *)objc_loadWeakRetained((id *)(v12 + 144));
      if (v14)
      {
        v15 = *((_QWORD *)v14 + 11);
        if (v15 < 1)
        {
          v13 = v7;
        }
        else
        {
          v6 = v14[9] / (double)v15;
          v13 = v14[10] / (double)v15;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v14 = 0;
    }
    v6 = 0.0;
LABEL_17:

    v3 = v17;
    *((_OWORD *)v17 + 2) = v16;
    *((double *)v17 + 6) = v6;
    *((double *)v17 + 7) = v13;
  }
LABEL_18:

}

uint64_t __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[6];
  __int128 v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke_2;
  v7[3] = &unk_1E16BE2D0;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 56);
  v7[4] = v2;
  v7[5] = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v4 = v11[3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_UIFlowLayoutRow indexOfNearestItemAtPoint:]((uint64_t)v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  CGFloat *v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v7 = a2;
  v16 = v7;
  if (v7)
  {
    v9 = v7[9];
    v8 = v7[10];
    v10 = v7[11];
    v11 = v7[12];
  }
  else
  {
    v8 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
  }
  v17.origin.x = v9;
  v17.origin.y = v8;
  v17.size.width = v10;
  v17.size.height = v11;
  if (CGRectContainsPoint(v17, *(CGPoint *)(a1 + 48)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[_UIFlowLayoutRow indexOfNearestItemAtPoint:]((uint64_t)v16, *(double *)(a1 + 48), *(double *)(a1 + 56));
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_8;
  v12 = *(double *)(a1 + 48);
  v18.origin.x = v9;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v11;
  if (v12 < CGRectGetMinX(v18))
  {
LABEL_9:
    if (a3)
      v14 = a3 - 1;
    else
      v14 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectAtIndex:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[_UIFlowLayoutRow indexOfNearestItemAtPoint:]((uint64_t)v15, *(double *)(a1 + 48), *(double *)(a1 + 56));

    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 64))
  {
LABEL_8:
    v13 = *(double *)(a1 + 56);
    v19.origin.x = v9;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v11;
    if (v13 < CGRectGetMinY(v19))
      goto LABEL_9;
  }
LABEL_14:

}

void __71___UIFlowLayoutSection_setSize_forItemAtIndexPath_invalidationContext___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  id *WeakRetained;
  id *v6;
  id v7;
  id *v8;
  id *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = _block_invoke___s_category_1;
  if (!_block_invoke___s_category_1)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_block_invoke___s_category_1);
  }
  v3 = *(id *)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    v6 = WeakRetained;
    if (WeakRetained)
      v7 = objc_loadWeakRetained(WeakRetained + 15);
    else
      v7 = 0;
    v8 = (id *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
    v9 = v8;
    if (v8)
      v10 = objc_loadWeakRetained(v8 + 15);
    else
      v10 = 0;
    objc_msgSend(v10, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v4;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Warning: sizing information will be ignored since the item referenced %@ does not currently exist. layout=%@; collectionView=%@",
      (uint8_t *)&v12,
      0x20u);

  }
}

@end
