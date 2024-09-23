@implementation UICollectionViewSetupExpandCollapseAnimations

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CGRect v29;

  v25 = a3;
  if (a2)
    v5 = *(void **)(a2 + 8);
  else
    v5 = 0;
  v6 = v5;
  v7 = objc_msgSend(v6, "section");
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "section"))
  {
    objc_msgSend(v25, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_layoutAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("UICollectionViewExpandCollapseAnimationGeneration.m"), 125, CFSTR("Unable to get initial attributes for expanding item at index path %@"), v6);

    }
    objc_msgSend(v25, "finalLayoutAttributes");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UICollectionViewExpandCollapseAnimationGeneration.m"), 128, CFSTR("Unable to get final attributes for expanding item at index path %@"), v6);

    }
    objc_msgSend((id)v11, "frame");
    v29.origin.x = v12;
    v29.origin.y = v13;
    v29.size.width = v14;
    v29.size.height = v15;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v29))
    {
      objc_msgSend((id)v11, "center");
      v17 = v16 - *(double *)(a1 + 72);
      objc_msgSend((id)v11, "center");
      objc_msgSend((id)v10, "setCenter:", v17, v18 - *(double *)(a1 + 80));
      objc_msgSend((id)v10, "setAlpha:", 1.0);
      if (v10)
      {
        v19 = *(_OWORD *)(a1 + 104);
        *(_OWORD *)(v10 + 240) = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(v10 + 256) = v19;
        *(_WORD *)(v10 + 288) &= ~0x400u;
      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_2;
      v26[3] = &unk_1E16B1B50;
      v27 = v25;
      v28 = (id)v10;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v26);
      objc_msgSend((id)v11, "setAlpha:", 1.0);
      if (v11)
      {
        v20 = *(_OWORD *)(a1 + 136);
        *(_OWORD *)(v11 + 240) = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(v11 + 256) = v20;
        *(_WORD *)(v11 + 288) |= 0x400u;
      }

    }
  }

}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setLayoutAttributes:", v1);

}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  __int128 v17;
  id v18;
  __int128 v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  CGRect v33;

  v29 = a3;
  if (a2)
    v5 = *(void **)(a2 + 8);
  else
    v5 = 0;
  v6 = v5;
  v7 = objc_msgSend(v6, "section");
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "section"))
  {
    v8 = v29;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke_3");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("UICollectionViewExpandCollapseAnimationGeneration.m"), 240, CFSTR("Could not find an animation for collapsing item at index path %@"), v6);

    }
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_layoutAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke_3");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("UICollectionViewExpandCollapseAnimationGeneration.m"), 243, CFSTR("Unable to get current layout attributes from collapsing item at index path %@"), v6);

    }
    objc_msgSend(v8, "finalLayoutAttributes");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UICollectionViewSetupExpandCollapseAnimations(UICollectionView *__strong _Nonnull, _UICollectionViewAnimationContext *__strong _Nonnull, __strong id<_UICollectionViewUpdateExpandCollapseAnimationContext> _Nonnull)_block_invoke_3");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("UICollectionViewExpandCollapseAnimationGeneration.m"), 245, CFSTR("Unable to get current layout attributes from collapsing item at index path %@"), v6);

    }
    objc_msgSend((id)v11, "frame");
    v33.origin.x = v13;
    v33.origin.y = v14;
    v33.size.width = v15;
    v33.size.height = v16;
    if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v33))
    {
      if (v11)
      {
        v17 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)(v11 + 240) = *(_OWORD *)(a1 + 72);
        *(_OWORD *)(v11 + 256) = v17;
        *(_WORD *)(v11 + 288) &= ~0x400u;
      }
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_4;
      v30[3] = &unk_1E16B1B50;
      v31 = v8;
      v18 = (id)v11;
      v32 = v18;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
      if (v12)
      {
        v19 = *(_OWORD *)(a1 + 120);
        *(_OWORD *)(v12 + 240) = *(_OWORD *)(a1 + 104);
        *(_OWORD *)(v12 + 256) = v19;
        *(_WORD *)(v12 + 288) |= 0x400u;
      }
      objc_msgSend(v18, "center");
      v21 = v20 - *(double *)(a1 + 136);
      objc_msgSend(v18, "center");
      objc_msgSend((id)v12, "setCenter:", v21, v22 - *(double *)(a1 + 144));
      objc_msgSend(v18, "alpha");
      objc_msgSend((id)v12, "setAlpha:");

    }
  }

}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setLayoutAttributes:", v1);

}

void ___UICollectionViewSetupExpandCollapseAnimations_block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  id v34;

  v34 = a3;
  if (a2)
    v5 = *(void **)(a2 + 8);
  else
    v5 = 0;
  v6 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    objc_msgSend(v34, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_layoutAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v34, "finalLayoutAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "size");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v10, "size");
      if (v12 == v16 && v14 == v15)
      {
        objc_msgSend(v9, "center");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v10, "center");
        if (v18 == v22 && v20 == v21)
        {
          objc_msgSend(v9, "center");
          v24 = v23;
          v26 = v25;
          v28 = *(double *)(a1 + 48);
          v27 = *(double *)(a1 + 56);
          v29 = *(_QWORD *)(a1 + 64);
          objc_msgSend(v9, "center");
          v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          if (v29 == 2)
          {
            if (v31 <= *(double *)(v32 + 40))
              v27 = -v27;
          }
          else if (v30 <= *(double *)(v32 + 32))
          {
            v28 = -v28;
          }
          objc_msgSend(v9, "setCenter:", v24 + v28, v26 + v27);
          objc_msgSend(v34, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_setLayoutAttributes:", v9);

        }
      }
    }

  }
}

@end
