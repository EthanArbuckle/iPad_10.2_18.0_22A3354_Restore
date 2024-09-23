@implementation UIPinnedNonOverlappingFramesForContentFrameVisibleFrame

void ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  if (a2)
  {
    v5 = a2[8];
    v6 = a2[9];
    v7 = a2[10];
    v8 = a2[11];
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v5 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

}

BOOL ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_2(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v8;
  void *v9;

  -[_UICollectionLayoutFramesQueryResult auxillaryItem](a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<_UICollectionLayoutFramesQueryResult *> * _Nonnull _UIPinnedNonOverlappingFramesForContentFrameVisibleFrame(NSArray<_UICollectionLayoutFramesQueryResult *> *const __strong _Nonnull, CGRect, CGRect, BOOL)_block_invoke_2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_UICollectionLayoutHelpers.m"), 2042, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxillaryItem"));

  }
  objc_msgSend(v4, "containerAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "edges") & a3) != 0;

  return v6;
}

double ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_3(uint64_t a1)
{
  CGFloat y;
  double x;
  CGFloat height;
  CGFloat width;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(double **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
        {
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          if (CGRectIsEmpty(v24))
          {
            if (v11)
            {
              x = v11[8];
              y = v11[9];
              width = v11[10];
              height = v11[11];
            }
            else
            {
              height = 0.0;
              width = 0.0;
              y = 0.0;
              x = 0.0;
            }
          }
          else
          {
            if (v11)
            {
              v12 = *((_QWORD *)v11 + 8);
              v13 = *((_QWORD *)v11 + 9);
              v14 = *((_QWORD *)v11 + 10);
              v15 = *((_QWORD *)v11 + 11);
            }
            else
            {
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v12 = 0;
            }
            v26.origin.x = x;
            v26.origin.y = y;
            v26.size.width = width;
            v26.size.height = height;
            v25 = CGRectUnion(*(CGRect *)&v12, v26);
            x = v25.origin.x;
            y = v25.origin.y;
            width = v25.size.width;
            height = v25.size.height;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v16;
    }
    while (v16);
  }

  return x;
}

BOOL ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_4(CGRect *a1, char a2)
{
  double v4;
  double MaxX;
  double v6;
  double MinX;

  if ((a2 & 8) != 0)
  {
    v4 = ceil(CGRectGetMaxX(a1[1]));
    MaxX = CGRectGetMaxX(a1[2]);
    return v4 >= floor(MaxX);
  }
  if ((a2 & 1) == 0)
  {
    if ((a2 & 4) == 0)
    {
      if ((a2 & 2) == 0)
        return 0;
      v6 = floor(CGRectGetMinX(a1[1]));
      MinX = CGRectGetMinX(a1[2]);
      return v6 <= ceil(MinX);
    }
    v4 = ceil(CGRectGetMaxY(a1[1]));
    MaxX = CGRectGetMaxY(a1[2]);
    return v4 >= floor(MaxX);
  }
  v6 = floor(CGRectGetMinY(a1[1]));
  MinX = CGRectGetMinY(a1[2]);
  return v6 <= ceil(MinX);
}

void ___UIPinnedNonOverlappingFramesForContentFrameVisibleFrame_block_invoke_467(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id *v16;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (a2)
    v15 = *(void **)(a2 + 16);
  else
    v15 = 0;
  v16 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)a2, v15, v8, v10, v12, v14);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v16);

}

@end
