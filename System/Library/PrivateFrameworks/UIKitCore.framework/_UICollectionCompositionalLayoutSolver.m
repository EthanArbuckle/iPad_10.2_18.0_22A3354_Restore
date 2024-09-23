@implementation _UICollectionCompositionalLayoutSolver

- (id)_createAndCacheLayoutAttributesForDecorationItemAtIndexPath:(void *)a3 elementKind:(uint64_t)a4 frame:(double)a5 additionalContentInset:(double)a6 zIndex:(double)a7
{
  void *v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (!a1)
  {
    v24 = 0;
    return v24;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__createAndCacheLayoutAttributesForDecorationItemAtIndexPath_elementKind_frame_additionalContentInset_zIndex_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__createAndCacheLayoutAttributesForDecorationItemAtIndexPath_elementKind_frame_additionalContentInset_zIndex_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

  }
  objc_msgSend(*(id *)(a1 + 120), "layoutAttributesForDecorationViewOfKind:withIndexPath:", a3, a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", -[_UICollectionCompositionalLayoutSolver _validatedRoundedFrame:forElementOfCategory:atIndexPath:elementKind:](a1, 2, (uint64_t)a2, (uint64_t)a3, a5 + a10, a6 + a9, a7 - (a12 + a10), a8 - (a9 + a11)));
  objc_msgSend(v24, "setZIndex:", a4);
  -[_UICollectionCompositionalLayoutSolver _injectPreferredSizingDataIntoToLayoutAttributes:atIndexPath:](a1, (uint64_t)v24, a2);
  v25 = *(_QWORD *)(a1 + 32);
  if (v25)
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v24);
  if (a3)
  {
    if (a2)
      goto LABEL_10;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__setCachedDecorationAttributesForElementKind_indexPath_attributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2680, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    if (v24)
      goto LABEL_11;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__setCachedDecorationAttributesForElementKind_indexPath_attributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__setCachedDecorationAttributesForElementKind_indexPath_attributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind"));

  if (!a2)
    goto LABEL_16;
LABEL_10:
  if (!v24)
    goto LABEL_17;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a3);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", v26, a3);
  }
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, a2);

  return v24;
}

- (id)_createAndCacheLayoutAttributesForItemAtIndexPath:(uint64_t)a3 frame:(CGFloat)a4 zIndex:(CGFloat)a5
{
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__createAndCacheLayoutAttributesForItemAtIndexPath_frame_zIndex_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    }
    objc_msgSend(*(id *)(a1 + 208), "objectForKeyedSubscript:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__createAndCacheLayoutAttributesForItemAtIndexPath_frame_zIndex_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2561, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.cachedItemAttributes[indexPath] == nil"));

    }
    v15 = -[_UICollectionCompositionalLayoutSolver _sectionHasBackgroundDecorationView:](a1, objc_msgSend(a2, "section"));
    objc_msgSend(*(id *)(a1 + 120), "layoutAttributesForCellWithIndexPath:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", -[_UICollectionCompositionalLayoutSolver _validatedRoundedFrame:forElementOfCategory:atIndexPath:elementKind:](a1, 0, (uint64_t)a2, 0, a4, a5, a6, a7));
    objc_msgSend(v16, "setZIndex:", a3);
    if (v15)
      objc_msgSend(v16, "setZIndex:", objc_msgSend(v16, "zIndex") + 1);
    -[_UICollectionCompositionalLayoutSolver _injectPreferredSizingDataIntoToLayoutAttributes:atIndexPath:](a1, (uint64_t)v16, a2);
    v17 = *(_QWORD *)(a1 + 24);
    if (v17)
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    objc_msgSend(*(id *)(a1 + 208), "setObject:forKeyedSubscript:", v16, a2);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (double)_validatedRoundedFrame:(uint64_t)a3 forElementOfCategory:(uint64_t)a4 atIndexPath:(CGFloat)a5 elementKind:(CGFloat)a6
{
  int v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  CGRect rect;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v16 = *(unsigned __int8 *)(a1 + 16);
  v17 = *(double *)(a1 + 144);
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke_2;
    v33 = &unk_1E16B8AD8;
    v34 = a3;
    v35 = a4;
    v36 = a1;
    v37 = a2;
    v18 = _Block_copy(&rect.origin.y);
    if (__110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke(a5, a6, a7, a8))
    {
      if (!v16)
      {
LABEL_9:

        return a5;
      }
      if (fabs(v17) >= 2.22044605e-16)
        v19 = v17;
      else
        v19 = 1.0;
      v38.origin.x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      v20 = round(v19 * CGRectGetMinX(v38)) / v19;
      v39.origin.x = a5;
      v39.origin.y = a6;
      v39.size.width = a7;
      v39.size.height = a8;
      v31 = round(v19 * CGRectGetMinY(v39)) / v19;
      v40.origin.x = a5;
      v40.origin.y = a6;
      v40.size.width = a7;
      v40.size.height = a8;
      v21 = round(v19 * CGRectGetWidth(v40)) / v19;
      v41.origin.x = a5;
      v41.origin.y = a6;
      v41.size.width = a7;
      v41.size.height = a8;
      v22 = round(v19 * CGRectGetHeight(v41)) / v19;
      if (__110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke(v20, v31, v21, v22))
      {
        a5 = v20;
        goto LABEL_9;
      }
      v28 = (void *)MEMORY[0x1E0CB37A0];
      v47.origin.x = v20;
      v47.origin.y = v31;
      v47.size.width = v21;
      v47.size.height = v22;
      NSStringFromCGRect(v47);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48.origin.x = a5;
      v48.origin.y = a6;
      v48.size.width = a7;
      v48.size.height = a8;
      NSStringFromCGRect(v48);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("UICollectionViewCompositionalLayout: Invalid frame %@ generated when rounding frame %@ to screen scale (%g)."), v26, v29, *(_QWORD *)&v17);
      v27 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB37A0];
      v46.origin.x = a5;
      v46.origin.y = a6;
      v46.size.width = a7;
      v46.size.height = a8;
      NSStringFromCGRect(v46);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("UICollectionViewCompositionalLayout: Invalid frame generated: %@."), v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }

    (*((void (**)(void *, uint64_t))v18 + 2))(v18, v27);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  if (v16)
  {
    if (fabs(v17) < 2.22044605e-16)
      v17 = 1.0;
    v42.origin.x = a5;
    v42.origin.y = a6;
    v42.size.width = a7;
    v42.size.height = a8;
    v23 = round(v17 * CGRectGetMinX(v42)) / v17;
    v43.origin.x = a5;
    v43.origin.y = a6;
    v43.size.width = a7;
    v43.size.height = a8;
    CGRectGetMinY(v43);
    v44.origin.x = a5;
    v44.origin.y = a6;
    v44.size.width = a7;
    v44.size.height = a8;
    CGRectGetWidth(v44);
    v45.origin.x = a5;
    v45.origin.y = a6;
    v45.size.width = a7;
    v45.size.height = a8;
    CGRectGetHeight(v45);
    return v23;
  }
  return a5;
}

- (uint64_t)_sectionHasBackgroundDecorationView:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v11;

  if (objc_msgSend(*(id *)(a1 + 184), "count") <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__sectionHasBackgroundDecorationView_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex<self.solutionBookmarks.count"));

  }
  v4 = *(id *)(a1 + 184);
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;

  v8 = v7;
  v9 = objc_msgSend(v8, "_hasBackgroundDecorationItem");

  return v9;
}

- (double)orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:(CGFloat)a3 frame:(CGFloat)a4
{
  void *v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  int v16;
  id v17;
  char v18;
  _QWORD *v19;
  void *v20;
  double v21;
  CGFloat v22;
  CGRect v24;
  CGRect v25;

  if (!a1)
    return 0.0;
  if (a2)
  {
    objc_msgSend((id)a2, "indexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "length") < 2)
      goto LABEL_16;
    if (!*(_BYTE *)(a1 + 13))
      goto LABEL_16;
    v13 = objc_msgSend(v12, "section");
    if (!objc_msgSend(*(id *)(a1 + 88), "containsIndex:", v13)
      || v13 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      goto LABEL_16;
    }
    v14 = *(_WORD *)(a2 + 288);
    if ((v14 & 1) == 0)
    {
      if ((v14 & 3) != 0)
      {
        if ((v14 & 2) == 0)
          goto LABEL_16;
        v15 = *(id *)(a2 + 8);
        v16 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:](a1, v12, (uint64_t)v15);

        if (!v16)
          goto LABEL_16;
      }
      else
      {
        v17 = *(id *)(a2 + 8);
        v18 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:elementKind:](a1, v12, (uint64_t)v17);

        if ((v18 & 1) == 0)
        {
LABEL_16:

          return a3;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v13);
    v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v19 = (_QWORD *)v19[1];
    objc_msgSend(v19, "orthogonalOffset");
    v22 = a3 - v21;
    v24.origin.x = a3;
    v24.origin.y = a4;
    v24.size.width = a5;
    v24.size.height = a6;
    CGRectGetWidth(v24);
    v25.origin.x = a3;
    v25.origin.y = a4;
    v25.size.width = a5;
    v25.size.height = a6;
    CGRectGetHeight(v25);

    a3 = v22;
    goto LABEL_16;
  }
  return a3;
}

- (id)layoutAttributesForItemAtIndexPath:(uint64_t)a1
{
  id v2;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;

  v2 = 0;
  if (a1 && a2)
  {
    objc_msgSend(*(id *)(a1 + 208), "objectForKeyedSubscript:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v2 = v5;
    }
    else
    {
      v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v15 = *MEMORY[0x1E0C9D628];
      v16 = v6;
      v7 = *(void **)(a1 + 72);
      v8 = *(void **)(a1 + 48);
      v9 = *(id *)(a1 + 184);
      v10 = v7;
      +[_UICollectionCompositionalLayoutSolver _queryResultForItemAtIndexPath:dataSourceSnapshot:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, a2, v10, v9, v8, &v15);
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (v11[3] == 0x7FFFFFFFFFFFFFFFLL)
          v12 = 0;
        else
          v12 = v11[3];
        -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForItemAtIndexPath:frame:zIndex:](a1, a2, v12, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      v2 = v13;

    }
  }
  return v2;
}

- (void)_injectPreferredSizingDataIntoToLayoutAttributes:(void *)a3 atIndexPath:
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id *v13;

  if (objc_msgSend(a3, "length") != 1)
  {
    v6 = objc_msgSend(a3, "section");
    if (v6 < objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      v7 = *(id *)(a1 + 184);
      objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = *(void **)(v8 + 104);
      else
        v10 = 0;
      v11 = v10;
      -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v11, objc_msgSend(a3, "item"));
      v13 = (id *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v12 = v13[7];
        if (v12)
          -[UICollectionViewLayoutAttributes _setPreferredSizingData:](a2, v12);
      }
      else
      {
        v12 = 0;
      }

    }
  }
}

- (id)_existingSectionDefinitionForSectionIndex:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = *(id *)(a1 + 184);
    if (objc_msgSend(v3, "count") <= a2)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      if (v4)
        v6 = *(void **)(v4 + 16);
      else
        v6 = 0;
      v7 = v6;

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_cachedDecorationAttributesForElementKind:(uint64_t)a3 indexPath:
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  if (!a1)
  {
    v8 = 0;
    return v8;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__cachedDecorationAttributesForElementKind_indexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2667, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind"));

    if (a3)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__cachedDecorationAttributesForElementKind_indexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    goto LABEL_4;
  }
  if (!a3)
    goto LABEL_10;
LABEL_4:
  objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_cachedSupplementaryAttributesForElementKind:(uint64_t)a3 indexPath:
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  if (!a1)
  {
    v8 = 0;
    return v8;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__cachedSupplementaryAttributesForElementKind_indexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind"));

    if (a3)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__cachedSupplementaryAttributesForElementKind_indexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2643, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    goto LABEL_4;
  }
  if (!a3)
    goto LABEL_10;
LABEL_4:
  objc_msgSend(*(id *)(a1 + 216), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:(uint64_t)a3 elementKind:
{
  _BOOL8 v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  if (!a1 || objc_msgSend(a2, "length") == 1)
    return 0;
  v7 = objc_msgSend(a2, "section");
  if (v7 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    return 1;
  objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  if (v8)
  {
    v10 = *(id *)(v8 + 8);
    v11 = (void *)v9[2];
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v12 = v11;
  if (objc_msgSend(v12, "scrollsOrthogonally"))
  {
    objc_msgSend(v10, "sectionSupplementaryFrameWithKind:index:", a3, objc_msgSend(a2, "item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13 == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasPinnedSupplementaryItems
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 160), "count");
    v3 = *(_QWORD **)(v1 + 272);
    if (v3)
      v3 = (_QWORD *)v3[5];
    v4 = v3;
    v5 = v2 | objc_msgSend(v4, "count");

    return v5 != 0;
  }
  return result;
}

- (uint64_t)shouldEmplaceElementOutsideSectionContainer:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;

  if (!a1)
    return 0;
  objc_msgSend(a2, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 == 1)
    return 1;
  objc_msgSend(a2, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "section");

  objc_msgSend(a2, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "item");

  v11 = objc_msgSend(*(id *)(a1 + 184), "count");
  v6 = 1;
  if ((v8 & 0x8000000000000000) == 0 && v8 < v11)
  {
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)v12;
    if (v12)
      v14 = *(void **)(v12 + 16);
    else
      v14 = 0;
    v15 = v14;
    if (!objc_msgSend(v15, "_clipsContentToBounds"))
      goto LABEL_25;
    if (a2 && (a2[144] & 1) != 0)
    {
      v6 = 0;
LABEL_25:

      return v6;
    }
    -[UIBarButtonItemGroup _items]((id *)a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_auxillaryItemForElementKind:category:", v16, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      if (v13)
        v21 = (void *)v13[1];
      else
        v21 = 0;
      objc_msgSend(v21, "sectionSupplementaryFrameWithKind:index:", v16, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        v6 = objc_msgSend(v15, "_excludesBoundarySupplementariesFromClipping");
      else
        v6 = 0;

      goto LABEL_24;
    }
    objc_msgSend(v17, "item");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isBackgroundDecoration"))
    {
      v20 = objc_msgSend(v15, "_clipsBackgroundDecorationsToContent");

      if ((v20 & 1) == 0)
      {
        v6 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {

    }
    v6 = 0;
    goto LABEL_24;
  }
  return v6;
}

- (void)prepareForPreferredAttributesQueryForView:(_WORD *)a3 withLayoutAttributes:
{
  __int16 v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  id *v27;

  if (a1 && *(_BYTE *)(a1 + 12))
  {
    if (a3)
    {
      v6 = a3[144];
      v7 = v6 & 1;
      v8 = (v6 & 3) == 0;
      if ((v7 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    if (!v8)
      return;
LABEL_8:
    objc_msgSend(a3, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length") == 1)
    {
      -[UIBarButtonItemGroup _items]((id *)a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionLayoutAuxillaryItemSolver elementKinds](*(_QWORD **)(a1 + 272));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v10);

      if ((v12 & 1) != 0)
      {
        -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](*(id **)(a1 + 272), v10, objc_msgSend(v9, "indexAtPosition:", 0));
        v27 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        v20 = v27;
        if (!v27)
        {
LABEL_27:

          return;
        }
        v21 = v27[5];
        objc_msgSend(v21, "size");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel_prepareForPreferredAttributesQueryForView_withLayoutAttributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("size"));

        }
        objc_msgSend(v9, "widthDimension");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEstimated");

        objc_msgSend(v9, "heightDimension");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEstimated");

        objc_msgSend(a2, "_setShouldConstrainWidth:", v23 ^ 1u);
        objc_msgSend(a2, "_setShouldConstrainHeight:", v25 ^ 1u);
LABEL_26:

        v20 = v27;
        goto LABEL_27;
      }

    }
    else
    {
      v13 = objc_msgSend(v9, "section");
      if (v13 < objc_msgSend(*(id *)(a1 + 184), "count"))
      {
        -[UIBarButtonItemGroup _items]((id *)a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v7)
        {
          if (v14)
            v16 = *(void **)(v14 + 8);
          else
            v16 = 0;
          v17 = v16;
          objc_msgSend(v17, "frameForIndex:", objc_msgSend(v9, "item"));
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v14)
            v19 = *(void **)(v14 + 8);
          else
            v19 = 0;
          v17 = v19;
          objc_msgSend(v17, "supplementaryFrameWithKind:index:", v10, objc_msgSend(v9, "item"));
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (id *)v18;

        goto LABEL_22;
      }
    }
    v27 = 0;
    goto LABEL_26;
  }
}

- (uint64_t)elementShouldAppearBelowOrthogonalScrollingContainer:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v8;

  v2 = 0;
  if (a1 && a2)
  {
    if (dyld_program_sdk_at_least() && *(_BYTE *)(a1 + 13))
    {
      objc_msgSend((id)a2, "indexPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5
        && objc_msgSend(v5, "length") == 2
        && objc_msgSend((id)a2, "zIndex") <= 0
        && (*(_WORD *)(a2 + 288) & 2) != 0)
      {
        v8 = *(id *)(a2 + 8);
        v2 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:](a1, v6, (uint64_t)v8) ^ 1;

      }
      else
      {
        v2 = 0;
      }

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (uint64_t)updatePreferredSizeIfNeededForPreferredLayoutAttributes:(void *)a3 withOriginalAttributes:(uint64_t)a4 debugger:
{
  __int16 v8;
  char v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t (**v14)(void *, id *, void *, uint64_t, id, _QWORD);
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  id *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  id v23;
  unint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  id v35;
  _QWORD aBlock[4];
  id v38;
  uint64_t v39;
  char v40;

  if (!a1 || !*(_BYTE *)(a1 + 12))
    return 0;
  if (a2)
  {
    v8 = *(_WORD *)(a2 + 288);
    v9 = v8 & 1;
    v10 = (v8 & 3) == 0;
    if ((v8 & 1) != 0)
    {
LABEL_8:
      objc_msgSend(a3, "indexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __130___UICollectionCompositionalLayoutSolver_updatePreferredSizeIfNeededForPreferredLayoutAttributes_withOriginalAttributes_debugger___block_invoke;
      aBlock[3] = &unk_1E16B8920;
      v40 = v9;
      v13 = v12;
      v38 = v13;
      v39 = a4;
      v14 = (uint64_t (**)(void *, id *, void *, uint64_t, id, _QWORD))_Block_copy(aBlock);
      if (v10 && objc_msgSend(v13, "length") == 1)
      {
        -[_UICollectionLayoutAuxillaryItemSolver elementKinds](*(_QWORD **)(a1 + 272));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIBarButtonItemGroup _items]((id *)a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "containsObject:", v16);

        if (v17)
        {
          v18 = objc_msgSend(v13, "indexAtPosition:", 0);
          v19 = (id *)*(id *)(a1 + 272);
          -[UIBarButtonItemGroup _items]((id *)a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v19, v20, v18);
          v21 = objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v11 = 0;
            goto LABEL_29;
          }
          v22 = (id *)*(id *)(a1 + 280);
          -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v21);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v11 = v14[2](v14, v22, a3, a2, v23, 0);
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
      }
      v24 = objc_msgSend(v13, "section");
      if (v24 >= objc_msgSend(*(id *)(a1 + 184), "count"))
      {
        v11 = 0;
LABEL_30:

        return v11;
      }
      v25 = *(id *)(a1 + 184);
      objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
      v21 = objc_claimAutoreleasedReturnValue();

      if (v21)
        v26 = *(void **)(v21 + 8);
      else
        v26 = 0;
      v23 = v26;
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v23, "frameForIndex:", objc_msgSend(v13, "item"));
        v22 = (id *)objc_claimAutoreleasedReturnValue();
        if (v22)
          goto LABEL_18;
      }
      else
      {
        -[UIBarButtonItemGroup _items]((id *)a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "supplementaryFrameWithKind:index:", v32, objc_msgSend(v13, "item"));
        v22 = (id *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
LABEL_18:
          v27 = v22[5];
          objc_msgSend(v27, "size");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEstimated");

          -[UICollectionViewLayoutAttributes _preferredSizingData]((id *)a2);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if ((v29 & 1) != 0 || v30)
          {
            if (v21)
              v33 = *(void **)(v21 + 104);
            else
              v33 = 0;
            v34 = v33;
            v35 = v22[5];
            v11 = ((uint64_t (**)(void *, id *, void *, uint64_t, id, void *))v14)[2](v14, v34, a3, a2, v35, v31);

          }
          else
          {
            v11 = 0;
          }

          goto LABEL_28;
        }
      }
      v11 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  if (v10)
    goto LABEL_8;
  return 0;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 1;
}

- (id)auxillaryHostAuxillaryItems
{
  NSArray *globalSupplementaryItems;

  if (self)
    globalSupplementaryItems = self->_globalSupplementaryItems;
  else
    globalSupplementaryItems = 0;
  return globalSupplementaryItems;
}

- (unint64_t)auxillaryHostLayoutAxis
{
  if (self)
    return *(_QWORD *)(self + 64);
  return self;
}

- (id)auxillaryHostTraitCollection
{
  if (self)
    self = (_UICollectionCompositionalLayoutSolver *)self->_traitCollection;
  return self;
}

- (id)auxillaryHostSupplementaryEnroller
{
  return objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
}

- (BOOL)auxillaryHostShouldLayoutRTL
{
  if (self)
    LOBYTE(self) = self->_layoutRTL;
  return (char)self;
}

- (id)auxillaryHostPreferredSizes
{
  if (self)
    self = (_UICollectionCompositionalLayoutSolver *)self->_globalSupplementaryPreferredSizes;
  return self;
}

- (CGSize)auxillaryHostContentSize
{
  double width;
  double height;
  unint64_t layoutAxis;
  uint64_t v6;
  _UICollectionLayoutContainer *container;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (self)
  {
    width = self->_actualContentSize.width;
    height = self->_actualContentSize.height;
    if (dyld_program_sdk_at_least())
    {
      layoutAxis = self->_layoutAxis;
      if (layoutAxis == 1)
        v6 = 2;
      else
        v6 = layoutAxis == 2;
      container = self->_container;
      goto LABEL_7;
    }
LABEL_11:
    v11 = width;
    v12 = height;
    goto LABEL_12;
  }
  width = 0.0;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    height = 0.0;
    goto LABEL_11;
  }
  v6 = 0;
  container = 0;
  height = 0.0;
LABEL_7:
  -[_UICollectionLayoutContainer effectiveContentSize](container, "effectiveContentSize");
  v10 = _UISizeValueForAxis(v6, v8, v9);
  v11 = _UISetSizeValueForAxis(v6, width, height, v10);
LABEL_12:
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)auxillaryHostContainer
{
  _UICollectionLayoutContainer *container;

  if (self)
    container = self->_container;
  else
    container = 0;
  return container;
}

- (void)_solveWithSectionLayouts:(void *)a3 preferredSizesDict:(void *)a4 dataSourceSnapshot:(uint64_t)a5 update:
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat *v13;
  _QWORD *v14;
  CGFloat x;
  CGFloat y;
  double height;
  double width;
  char v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _UICollectionPreferredSizes *v33;
  _UICollectionPreferredSizes *v34;
  double v35;
  double v36;
  CGFloat v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  id *v53;
  double v54;
  double v55;
  unsigned int v56;
  double v57;
  double v58;
  void *v59;
  unint64_t *v60;
  _UICollectionPreferredSizes *v61;
  _QWORD *v62;
  BOOL v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  CGFloat v67;
  CGFloat v68;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  id v79;
  id v80;
  _UIRTree *obj;
  id v82;
  double v83;
  void *v84;
  void *v85;
  uint64_t v86;
  _QWORD *v88;
  id v89;
  double v90;
  double v91;
  _QWORD *v92;
  uint64_t v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat r1;
  uint64_t v98;
  char v99;
  uint64_t v100;
  char v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106[2];
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v8 = (uint64_t)a1;
  -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](a1);
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveWithSectionLayouts_preferredSizesDict_dataSourceSnapshot_update_, v8, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceSnapshot"));

  }
  v9 = objc_msgSend(a2, "count");
  if (v9 != objc_msgSend(a4, "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveWithSectionLayouts_preferredSizesDict_dataSourceSnapshot_update_, v8, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionLayouts.count == dataSourceSnapshot.numberOfSections"));

  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveWithSectionLayouts_preferredSizesDict_dataSourceSnapshot_update_, v8, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionPreferredSizesDict"));

  }
  v86 = objc_msgSend(a4, "numberOfSections");
  v10 = *(_QWORD **)(v8 + 112);
  v74 = a5;
  if (v10)
    v10 = (_QWORD *)v10[8];
  v11 = *(_QWORD *)(v8 + 64);
  v78 = *(double *)(v8 + 80);
  v92 = v10;
  -[_UICollectionCompositionalLayoutSolver _snapshotBookmarks:](*(void **)(v8 + 184));
  v12 = objc_claimAutoreleasedReturnValue();
  v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  obj = objc_alloc_init(_UIRTree);
  if (*(_BYTE *)(v8 + 17))
    *(_BYTE *)(v8 + 15) = 1;
  v13 = (CGFloat *)MEMORY[0x1E0C9D648];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  v80 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v79 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14 = *(_QWORD **)(v8 + 48);
  if (v14)
    v14 = (_QWORD *)v14[1];
  v75 = (void *)v12;
  x = *v13;
  y = v13[1];
  width = v13[2];
  height = v13[3];
  v88 = v14;
  if (v86 < 1)
  {
    v100 = 0;
    v98 = 0;
    v99 = 0;
  }
  else
  {
    v85 = a4;
    v99 = 0;
    v98 = 0;
    v19 = 0;
    v100 = 0;
    v20 = 0;
    v83 = fabs(v78);
    v21 = *MEMORY[0x1E0C9D538];
    v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v76 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v77 = *MEMORY[0x1E0C9D820];
    v90 = v22;
    v91 = *MEMORY[0x1E0C9D538];
    v84 = a2;
    do
    {
      objc_msgSend(a2, "objectAtIndexedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_preBoundaryPadding");
      v25 = v24;
      objc_msgSend(v23, "_postBoundaryPadding");
      v94 = v26;
      v105 = 0;
      v106[0] = 0;
      -[_UICollectionCompositionalLayoutSolver _generateInsetsEnvironmentsForLayoutSection:withParentInsetEnvironment:sectionEnv:supplementaryEnv:](v8, v23, (uint64_t)v88, v106, &v105);
      v27 = v106[0];
      v28 = v105;
      objc_msgSend(*(id *)(v8 + 48), "effectiveContentSize");
      -[_UICollectionCompositionalLayoutSolver _containerByApplyingInsetsFromEnvironment:toSize:onAxis:](v27, v11);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v8 + 48), "effectiveContentSize");
      v103 = v28;
      -[_UICollectionCompositionalLayoutSolver _containerByApplyingInsetsFromEnvironment:toSize:onAxis:](v28, v11);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v23, "_isEmptySection");
      +[_UICollectionLayoutSectionSolver solverWithLayoutSection:layoutAxis:]((uint64_t)_UICollectionLayoutSectionSolver, v23, v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        v33 = v31;
      else
        v33 = objc_alloc_init(_UICollectionPreferredSizes);
      v34 = v33;

      if (objc_msgSend(v23, "scrollsOrthogonally"))
        objc_msgSend(v80, "addIndex:", v20);
      if (objc_msgSend(v23, "_clipsContentToBounds"))
        objc_msgSend(v79, "addIndex:", v20);
      if (!((v83 < 2.22044605e-16 || (v19 & 1) == 0) | v101 & 1))
      {
        v21 = v21 + _UISetPointValueForAxis(v11, v91, v90, v78);
        v22 = v22 + v35;
      }
      v96 = x;
      r1 = width;
      v95 = y;
      if (fabs(v25) >= 2.22044605e-16)
      {
        v21 = v21 + _UISetPointValueForAxis(v11, v91, v90, v25);
        v22 = v22 + v36;
      }
      v37 = height;
      LOBYTE(v73) = 0;
      objc_msgSend(v29, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", v104, v102, *(_QWORD *)(v8 + 56), v11, objc_msgSend(v85, "numberOfItemsInSection:", v20), v34, v73, v74);
      objc_msgSend(v29, "errorDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38 && v92)
      {
        objc_msgSend(v29, "errorDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(_QWORD *, uint64_t, void *, id, void *, _QWORD))v92[2])(v92, v20, v104, v27, v39, 0);

      }
      v93 = objc_msgSend(v29, "containerSizeDependentAxes");
      v40 = (_QWORD *)v8;
      v41 = -[_UICollectionCompositionalLayoutSolver _globalFrameForSolution:offset:](v8, v29, v21);
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v48 = _UISizeValueForAxis(v11, v44, v46);
      v49 = _UIPointValueForAxis(v11, v21, v22);
      v21 = _UISetPointValueForAxis(v11, v21, v22, v48 + v49);
      v22 = v50;
      objc_msgSend(v23, "pinnedBoundarySupplementaryItemIndexes");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      if (v52)
        objc_msgSend(v82, "addIndex:", v20);
      v53 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)[_UICollectionSectionSolutionBookmark alloc], v29, v27, v103, v23, v34, v41, v43, v45, v47, v41, v43, v45, v47);
      objc_msgSend(v89, "addObject:", v53);
      v107.origin.x = v41;
      v107.origin.y = v43;
      v107.size.width = v45;
      v107.size.height = v47;
      if (!CGRectIsEmpty(v107))
        -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:](v40, obj, v29, v20, v41, v43, v45, v47);
      v108.origin.y = v95;
      v108.origin.x = v96;
      v108.size.width = r1;
      v108.size.height = v37;
      v114.origin.x = v41;
      v114.origin.y = v43;
      v114.size.width = v45;
      v114.size.height = v47;
      v109 = CGRectUnion(v108, v114);
      x = v109.origin.x;
      y = v109.origin.y;
      width = v109.size.width;
      height = v109.size.height;
      if (fabs(v94) >= 2.22044605e-16)
      {
        if (v86 - 1 == v20)
        {
          width = v109.size.width + _UISetSizeValueForAxis(v11, v77, v76, v94);
          height = height + v54;
        }
        else
        {
          v21 = v21 + _UISetPointValueForAxis(v11, v91, v90, v94);
          v22 = v22 + v55;
        }
      }
      v56 = objc_msgSend(v23, "_hasVisibleItemsHandler");
      if ((v99 & 1) != 0)
        v99 = 1;
      else
        v99 = objc_msgSend(v23, "_containsEstimatedSizeElement");
      v19 |= v101 ^ 1;
      v100 |= v93;
      v98 += v56;

      ++v20;
      v8 = (uint64_t)v40;
      a2 = v84;
    }
    while (v86 != v20);
  }
  if (*(_BYTE *)(v8 + 16))
  {
    if (fabs(*(double *)(v8 + 144)) >= 2.22044605e-16)
      v57 = *(double *)(v8 + 144);
    else
      v57 = 1.0;
    v110.origin.x = x;
    v110.origin.y = y;
    v110.size.width = width;
    v110.size.height = height;
    CGRectGetMinX(v110);
    v111.origin.x = x;
    v111.origin.y = y;
    v111.size.width = width;
    v111.size.height = height;
    CGRectGetMinY(v111);
    v112.origin.x = x;
    v112.origin.y = y;
    v112.size.width = width;
    v112.size.height = height;
    v58 = round(v57 * CGRectGetWidth(v112)) / v57;
    v113.origin.x = x;
    v113.origin.y = y;
    v113.size.width = width;
    v113.size.height = height;
    height = round(v57 * CGRectGetHeight(v113)) / v57;
    width = v58;
  }
  -[_UICollectionCompositionalLayoutSolver _restoreStateFromBookmarkSnapshots:bookmarks:update:](v8, v75, v89, v74);
  -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:](v8, v89);
  *(double *)(v8 + 304) = width;
  *(double *)(v8 + 312) = height;
  objc_storeStrong((id *)(v8 + 192), obj);
  objc_storeStrong((id *)(v8 + 160), v82);
  *(_QWORD *)(v8 + 288) = v98;
  v59 = (void *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)v8);
  v60 = (unint64_t *)(v8 + 272);
  objc_storeStrong((id *)(v8 + 272), v59);

  if (!*(_QWORD *)(v8 + 280))
  {
    v61 = objc_alloc_init(_UICollectionPreferredSizes);
    objc_storeStrong((id *)(v8 + 280), v61);

  }
  v62 = (_QWORD *)*v60;
  if ((v99 & 1) != 0)
  {
    v63 = 1;
    if (!v62)
      goto LABEL_68;
  }
  else
  {
    if (!v62)
    {
      v63 = 0;
      goto LABEL_68;
    }
    v63 = *((_BYTE *)v62 + 32) != 0;
  }
  if (*((double *)v62 + 18) != 0.0
    || *((double *)v62 + 20) != 0.0
    || *((double *)v62 + 19) != 0.0
    || *((double *)v62 + 21) != 0.0)
  {
    -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](v8);
    goto LABEL_60;
  }
LABEL_68:
  -[_UICollectionCompositionalLayoutSolver _updateGeometryTranslator](v8);
LABEL_60:
  v64 = (_QWORD *)*v60;
  if (*v60)
    v64 = (_QWORD *)v64[5];
  v65 = v64;
  v66 = objc_msgSend(v65, "count");

  if (v66)
  {
    objc_msgSend(*(id *)(v8 + 48), "contentSize");
    -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:](*(id **)(v8 + 272), 0.0, 0.0, v67, v68);
  }
  v69 = *v60;
  if (*v60)
    v69 = *(_QWORD *)(v69 + 56);
  *(_QWORD *)(v8 + 296) = v69 | v100;
  objc_storeStrong((id *)(v8 + 88), v80);
  *(_BYTE *)(v8 + 13) = objc_msgSend(v80, "count") != 0;
  *(_BYTE *)(v8 + 14) = objc_msgSend(v79, "count") != 0;
  objc_storeStrong((id *)(v8 + 96), v79);
  *(_BYTE *)(v8 + 12) = v63;

}

- (double)_containerByApplyingInsetsFromEnvironment:(void *)a1 toSize:(uint64_t)a2 onAxis:
{
  void *v2;
  _UICollectionLayoutContainer *v3;
  double v4;
  double v5;
  double *v6;

  objc_msgSend(a1, "layoutContainerForContainerSize:layoutAxis:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [_UICollectionLayoutContainer alloc];
  objc_msgSend(v2, "effectiveContentSize");
  v6 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v3, v4, v5, 0.0, 0.0, 0.0, 0.0);

  return v6;
}

- (void)_recomputeSolutionBookmarksAndContentSize
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  CGFloat *v5;
  double width;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _UICollectionSectionSolutionBookmark *v32;
  void *v33;
  id *v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t v47;
  _UIRTree *v48;
  id v49;
  _QWORD *v50;
  double v51;
  double v52;
  int v53;
  CGFloat y;
  CGFloat x;
  double r1;
  id v57;
  id v58[2];
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v45 = *(double *)(a1 + 80);
  v2 = *(_QWORD *)(a1 + 64);
  v3 = objc_msgSend(*(id *)(a1 + 184), "count");
  v4 = *(_QWORD **)(a1 + 48);
  if (v4)
    v4 = (_QWORD *)v4[1];
  v50 = v4;
  v5 = (CGFloat *)MEMORY[0x1E0C9D648];
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  r1 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = objc_alloc_init(_UIRTree);
  if (v3)
  {
    v7 = 0;
    v8 = 0;
    v46 = fabs(v45);
    y = v5[1];
    x = *v5;
    v10 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v44 = v3 - 1;
    v42 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v43 = *MEMORY[0x1E0C9D820];
    v51 = *MEMORY[0x1E0C9D538];
    v52 = v9;
    v47 = v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8, *(_QWORD *)&v42, *(_QWORD *)&v43);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (_QWORD *)v11;
      if (v11)
        v13 = *(void **)(v11 + 8);
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(v14, "layoutSection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_isEmptySection");
      objc_msgSend(v15, "_preBoundaryPadding");
      v18 = v17;
      objc_msgSend(v15, "_postBoundaryPadding");
      v20 = v19;
      if (v46 >= 2.22044605e-16 && ((v7 ^ 1) & 1) == 0 && (v16 & 1) == 0)
      {
        v10 = v10 + _UISetPointValueForAxis(v2, v51, v52, v45);
        v9 = v9 + v21;
      }
      v53 = v16;
      if (fabs(v18) >= 2.22044605e-16)
      {
        v10 = v10 + _UISetPointValueForAxis(v2, v51, v52, v18);
        v9 = v9 + v22;
      }
      v57 = 0;
      v58[0] = 0;
      -[_UICollectionCompositionalLayoutSolver _generateInsetsEnvironmentsForLayoutSection:withParentInsetEnvironment:sectionEnv:supplementaryEnv:](a1, v15, (uint64_t)v50, v58, &v57);
      v23 = v58[0];
      v24 = v57;
      v25 = -[_UICollectionCompositionalLayoutSolver _globalFrameForSolution:offset:](a1, v14, v10);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v32 = [_UICollectionSectionSolutionBookmark alloc];
      if (v12)
        v33 = (void *)v12[13];
      else
        v33 = 0;
      v34 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)&v32->super.isa, v14, v23, v24, v15, v33, v25, v27, v29, v31, v25, v27, v29, v31);
      objc_msgSend(v49, "addObject:", v34);
      v59.origin.y = y;
      v59.origin.x = x;
      v59.size.width = width;
      v59.size.height = r1;
      v61.origin.x = v25;
      v61.origin.y = v27;
      v61.size.width = v29;
      v61.size.height = v31;
      v60 = CGRectUnion(v59, v61);
      y = v60.origin.y;
      x = v60.origin.x;
      width = v60.size.width;
      r1 = v60.size.height;
      -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:]((_QWORD *)a1, v48, v14, v8, v25, v27, v29, v31);

      v35 = _UISizeValueForAxis(v2, v29, v31);
      v36 = _UIPointValueForAxis(v2, v10, v9);
      v10 = _UISetPointValueForAxis(v2, v10, v9, v35 + v36);
      v9 = v37;
      if (fabs(v20) >= 2.22044605e-16)
      {
        v38 = v47;
        if (v44 == v8)
        {
          width = width + _UISetSizeValueForAxis(v2, v43, v42, v20);
          r1 = r1 + v39;
        }
        else
        {
          v10 = v10 + _UISetPointValueForAxis(v2, v51, v52, v20);
          v9 = v9 + v40;
        }
      }
      else
      {
        v38 = v47;
      }
      v7 |= v53 ^ 1;

      ++v8;
    }
    while (v38 != v8);
  }
  *(double *)(a1 + 304) = width;
  *(double *)(a1 + 312) = r1;
  -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:](a1, v49);
  v41 = *(void **)(a1 + 192);
  *(_QWORD *)(a1 + 192) = v48;

}

- (double)_globalFrameForSolution:(double)a3 offset:
{
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  CGRect v19;

  objc_msgSend(a2, "contentFrameIncludingAuxiliaries");
  width = v19.size.width;
  height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    objc_msgSend(*(id *)(a1 + 48), "contentSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(a2, "layoutSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "scrollsOrthogonally");

    v14 = objc_msgSend(a2, "layoutAxis");
    v15 = v14;
    if (v13)
    {
      v16 = _UISizeValueForAxis(v14, v9, v11);
      _UISetSizeValueForAxis(v15, width, height, v16);
    }
    else
    {
      if (v14 == 1)
        v17 = 2;
      else
        v17 = v14 == 2;
      _UISizeClampToMinimumSizeForAxis(v17, width, height, v9, v11);
    }
  }
  return a3;
}

- (_QWORD)_updateSectionIndexer:(void *)a3 frame:(uint64_t)a4 solution:(double)a5 section:(double)a6
{
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;

  if (result)
  {
    v14 = result[8];
    if (v14 == 1)
      v15 = 2;
    else
      v15 = v14 == 2;
    objc_msgSend(a3, "contentFrameIncludingAuxiliaries");
    v18 = v16 <= 0.0;
    if (v17 <= 0.0)
      v18 = 1;
    if (v18)
      v19 = a8;
    else
      v19 = v17;
    if (v18)
      v20 = a7;
    else
      v20 = v16;
    v21 = _UISetSizeValueForAxis(v15, v20, v19, 1.79769313e308);
    v23 = v22;
    v24 = _UISetPointValueForAxis(v15, a5, a6, 0.0);
    return -[_UIRTree insertFrame:forIndex:](a2, a4, v24, v25, v21, v23);
  }
  return result;
}

- (void)_generateInsetsEnvironmentsForLayoutSection:(uint64_t)a3 withParentInsetEnvironment:(_QWORD *)a4 sectionEnv:(_QWORD *)a5 supplementaryEnv:
{
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (a2)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSection != nil"));

    if (a3)
    {
LABEL_3:
      if (a4)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSectionEnv != nil"));

      if (a5)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentInsetEnvironment != nil"));

  if (!a4)
    goto LABEL_10;
LABEL_4:
  if (a5)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSuppEnv != nil"));

LABEL_5:
  v10 = objc_msgSend(a2, "contentInsetsReference");
  +[_UIContentInsetsEnvironment insetEnvironmentFromParentEnvironment:insetReference:](_UIContentInsetsEnvironment, "insetEnvironmentFromParentEnvironment:insetReference:", a3, v10);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a4 = v16;
  if (objc_msgSend(a2, "supplementaryContentInsetsReference"))
    v10 = objc_msgSend(a2, "supplementaryContentInsetsReference");
  +[_UIContentInsetsEnvironment insetEnvironmentFromParentEnvironment:insetReference:](_UIContentInsetsEnvironment, "insetEnvironmentFromParentEnvironment:insetReference:", a3, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a5 = v11;

}

- (void)setSolutionBookmarks:(uint64_t)a1
{
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    {
      __UIFaultDebugAssertLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: attempted to update solution bookmarks that are locked. Please file a bug against UICollectionView with reproduction steps.", buf, 2u);
      }

    }
  }
  else if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v5 = setSolutionBookmarks____s_category;
    if (!setSolutionBookmarks____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setSolutionBookmarks____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: attempted to update solution bookmarks that are locked. Please file a bug against UICollectionView with reproduction steps.", v7, 2u);
    }
  }
  objc_storeStrong((id *)(a1 + 184), a2);
}

- (id)_snapshotBookmarks:(void *)a1
{
  id v2;
  unint64_t v3;
  void *v4;
  _UICollectionCompositionalLayoutSolverBookmarkStateSnapshotter *v5;
  id v6;
  _QWORD *v7;
  objc_super v9;

  if (objc_msgSend(a1, "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(a1, "count"))
    {
      v3 = 0;
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = [_UICollectionCompositionalLayoutSolverBookmarkStateSnapshotter alloc];
        if (v5)
        {
          v9.receiver = v5;
          v9.super_class = (Class)_UICollectionCompositionalLayoutSolverBookmarkStateSnapshotter;
          v6 = objc_msgSendSuper2(&v9, sel_init);
          v7 = v6;
          if (v6)
          {
            objc_storeStrong((id *)v6 + 1, v4);
            v7[2] = v3;
          }
        }
        else
        {
          v7 = 0;
        }
        objc_msgSend(v2, "addObject:", v7);

        ++v3;
      }
      while (v3 < objc_msgSend(a1, "count"));
    }
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (uint64_t)_anchorForAuxiliaryElementOfKind:(uint64_t)a1
{
  _QWORD *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!a1)
    return 0;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__anchorForAuxiliaryElementOfKind_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1879, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind != nil"));

  }
  v4 = *(id *)(a1 + 272);
  -[_UICollectionLayoutAuxillaryItemSolver elementKinds](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", a2);

  if ((v6 & 1) != 0)
    return 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = *(id *)(a1 + 184);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75___UICollectionCompositionalLayoutSolver__anchorForAuxiliaryElementOfKind___block_invoke;
  v11[3] = &unk_1E16B8A38;
  v11[4] = a2;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)layoutAttributesForDecorationViewOfKind:(void *)a3 withIndexPath:
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;

  if (!a1)
  {
LABEL_7:
    v7 = 0;
    return v7;
  }
  v6 = objc_msgSend(a2, "length");
  v7 = 0;
  if (a3 && v6)
  {
    if (objc_msgSend(a3, "length") == 2)
    {
      -[_UICollectionCompositionalLayoutSolver _cachedDecorationAttributesForElementKind:indexPath:](a1, (uint64_t)a2, (uint64_t)a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v7 = v8;
LABEL_28:

        return v7;
      }
      v9 = *(id *)(a1 + 184);
      v10 = objc_msgSend(a3, "section");
      v11 = objc_msgSend(a3, "item");
      v12 = objc_msgSend(v9, "count");
      v7 = 0;
      if ((v10 & 0x8000000000000000) != 0 || v10 >= v12)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v15 = *(void **)(v13 + 16);
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v16, "_auxillaryItemForElementKind:category:", a2, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        if (v14)
          v36 = *(void **)(v14 + 8);
        else
          v36 = 0;
        v22 = v36;
        objc_msgSend(v22, "supplementaryFrameWithKind:index:", a2, v11);
        v37 = objc_claimAutoreleasedReturnValue();
        v23 = v37;
        if (v37)
        {
          if (*(_QWORD *)(v37 + 32) != 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForDecorationViewOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 925, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.isDecoration"));

          }
          +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:bookmark:container:](*(CGFloat *)(v23 + 64), *(CGFloat *)(v23 + 72), *(CGFloat *)(v23 + 80), *(CGFloat *)(v23 + 88), (uint64_t)_UICollectionCompositionalLayoutSolver, (double *)v14, *(void **)(a1 + 48));
          v39 = v38;
          v41 = v40;
          v43 = v42;
          v45 = v44;
          -[_UICollectionLayoutFramesQueryResult auxillaryItem]((_QWORD *)v23);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "decorationItem");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v47)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForDecorationViewOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 932, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("decorationItem"));

          }
          -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](a1, a3, a2, objc_msgSend(v47, "zIndex"), v39, v41, v43, v45, 0.0, 0.0, 0.0, 0.0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = 0;
        }
        else
        {
          v35 = 0;
        }
        goto LABEL_26;
      }
      objc_msgSend(v16, "decorationItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v11 >= v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForDecorationViewOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 913, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIndex < section.decorationItems.count"));

        if (v14)
          goto LABEL_15;
      }
      else if (v14)
      {
LABEL_15:
        v20 = *(void **)(v14 + 16);
LABEL_16:
        objc_msgSend(v20, "decorationItems");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v11);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "elementKind");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = +[_UICollectionCompositionalLayoutSolver _globalFrameForBackgroundDecoration:forSectionWithBookmark:]((uint64_t)_UICollectionCompositionalLayoutSolver, (id *)v14);
        v26 = v25;
        v28 = v27;
        v30 = v29;
        objc_msgSend(v22, "contentInsets");
        -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](a1, a3, (void *)v23, objc_msgSend(v22, "zIndex"), v24, v26, v28, v30, v31, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

        v7 = v35;
        goto LABEL_27;
      }
      v20 = 0;
      goto LABEL_16;
    }
    goto LABEL_7;
  }
  return v7;
}

- (id)mutatedVisibleItemsForElementsForVisibleBounds:(double)a3
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  id v20;
  _UICollectionLayoutEnvironment *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double *v36;
  _UICollectionLayoutEnvironment *v37;
  id v38;
  id v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, double, double);
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v50;
  id obj;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[6];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__29;
    v72 = __Block_byref_object_dispose__29;
    v73 = 0;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__29;
    v66[4] = __Block_byref_object_dispose__29;
    v67 = 0;
    -[_UICollectionCompositionalLayoutSolver _attributesQueryInfosForQueryRect:](a1, a2, a3, a4, a5);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v63;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v63 != v11)
            objc_enumerationMutation(obj);
          v14 = *(double **)(*((_QWORD *)&v62 + 1) + 8 * v13);
          if (v14)
          {
            v15 = v14[2];
            v16 = v14[3];
            v17 = v14[4];
            v18 = v14[5];
          }
          else
          {
            v16 = 0.0;
            v17 = 0.0;
            v18 = 0.0;
            v15 = 0.0;
          }
          v61[0] = v12;
          v61[1] = 3221225472;
          v61[2] = __89___UICollectionCompositionalLayoutSolver_mutatedVisibleItemsForElementsForVisibleBounds___block_invoke;
          v61[3] = &unk_1E16B88D0;
          v61[4] = v66;
          v61[5] = &v68;
          -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)v61, v15, v16, v17, v18);
          ++v13;
        }
        while (v10 != v13);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
        v10 = v19;
      }
      while (v19);
    }

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v50 = (id)v69[5];
    v21 = 0;
    v22 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
    if (v22)
    {
      v52 = *(_QWORD *)v58;
      v23 = *MEMORY[0x1E0C9D538];
      v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v58 != v52)
            objc_enumerationMutation(v50);
          v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v25);
          v27 = (id)objc_msgSend(v26, "layoutSection");
          if (!v27)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel_mutatedVisibleItemsForElementsForVisibleBounds_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSection"));

          }
          if (objc_msgSend(v27, "_hasVisibleItemsHandler"))
          {
            v28 = (id)objc_msgSend((id)v69[5], "objectForKey:", v26);
            if (!v28)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", sel_mutatedVisibleItemsForElementsForVisibleBounds_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionVisibleItemCandidates"));

            }
            v29 = objc_msgSend(v26, "layoutAxis");
            objc_msgSend(v26, "orthogonalOffset");
            v32 = _UIPointValueForAxis(v29, v30, v31);
            v33 = _UISetPointValueForAxis(v29, v23, v24, v32);
            v35 = v34;
            if (!v21)
            {
              v36 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], a4, a5, 0.0, 0.0, 0.0, 0.0);
              v37 = [_UICollectionLayoutEnvironment alloc];
              v38 = *(id *)(a1 + 56);
              v39 = *(id *)(a1 + 72);
              v21 = -[_UICollectionLayoutEnvironment initWithContainer:traitCollection:dataSourceSnapshot:](v37, "initWithContainer:traitCollection:dataSourceSnapshot:", v36, v38, v39);

            }
            objc_msgSend(v27, "visibleItemsInvalidationHandler");
            v40 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id, _UICollectionLayoutEnvironment *, double, double))v40)[2](v40, v28, v21, a2 + v33, a3 + v35);

            if (*(_BYTE *)(a1 + 12))
            {
              if (mutatedVisibleItemsForElementsForVisibleBounds__once != -1)
                dispatch_once(&mutatedVisibleItemsForElementsForVisibleBounds__once, &__block_literal_global_99);
            }
            else
            {
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v41 = v28;
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
              if (v42)
              {
                v43 = *(_QWORD *)v54;
                do
                {
                  for (i = 0; i != v42; ++i)
                  {
                    if (*(_QWORD *)v54 != v43)
                      objc_enumerationMutation(v41);
                    v45 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
                    if (v45 && *(_BYTE *)(v45 + 8))
                      objc_msgSend(v20, "addObject:");
                  }
                  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
                }
                while (v42);
              }

            }
          }
          ++v25;
        }
        while (v25 != v22);
        v48 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
        v22 = v48;
      }
      while (v48);
    }

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(&v68, 8);

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (void)_restoreStateFromBookmarkSnapshots:(void *)a3 bookmarks:(uint64_t)a4 update:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  unint64_t v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD *v40;
  id obj;
  uint8_t buf[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a2, "count"))
  {
    if (a4)
    {
      v6 = *(id *)(a4 + 16);
    }
    else
    {
      v7 = objc_msgSend(a2, "count");
      if (v7 != objc_msgSend(a3, "count"))
        return;
      v6 = 0;
    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = a2;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (!v8)
      goto LABEL_41;
    v9 = v8;
    v10 = *(_QWORD *)v45;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v11);
        if (v12)
        {
          if (*(_QWORD *)(v12 + 16) == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_35;
          v13 = *(_QWORD *)(v12 + 16);
          if (!v6)
            goto LABEL_16;
        }
        else
        {
          v13 = 0;
          if (!v6)
            goto LABEL_16;
        }
        v13 = objc_msgSend(v6, "finalSectionIndexForInitialSectionIndex:");
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_35;
LABEL_16:
        if (v13 < objc_msgSend(a3, "count"))
        {
          objc_msgSend(a3, "objectAtIndexedSubscript:", v13);
          v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v15 = *(_QWORD **)(v12 + 8);
            if (v15)
              v15 = (_QWORD *)v15[1];
            v16 = v15;
            if (v14)
              v17 = (void *)v14[1];
            else
              v17 = 0;
            v18 = v17;
            objc_msgSend(v16, "layoutSection");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "scrollsOrthogonally") & 1) != 0)
            {
              objc_msgSend(v18, "layoutSection");
              v40 = v16;
              v20 = v14;
              v21 = v9;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "scrollsOrthogonally");

              v9 = v21;
              v14 = v20;
              v16 = v40;

              v24 = v18;
              if (v23)
              {
                v25 = objc_msgSend(v18, "layoutAxis");
                objc_msgSend(v40, "orthogonalOffset");
                v27 = v26;
                v29 = v28;
                objc_msgSend(v18, "contentFrameIncludingAuxiliaries");
                v31 = v30;
                v33 = v32;
                v34 = objc_msgSend(v40, "layoutAxis");
                v24 = v18;
                if (v25 == v34)
                {
                  v35 = _UIPointValueForAxis(v25, v27, v29);
                  v36 = _UISizeValueForAxis(v25, v31, v33);
                  v24 = v18;
                  if (v35 < v36)
                  {
                    objc_msgSend(v18, "setOrthogonalOffset:", v27, v29);
                    goto LABEL_32;
                  }
                }
              }
            }
            else
            {

LABEL_32:
              v24 = v18;
            }

          }
          goto LABEL_35;
        }
        v37 = _restoreStateFromBookmarkSnapshots_bookmarks_update____s_category;
        if (!_restoreStateFromBookmarkSnapshots_bookmarks_update____s_category)
        {
          v37 = __UILogCategoryGetNode("CollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v37, (unint64_t *)&_restoreStateFromBookmarkSnapshots_bookmarks_update____s_category);
        }
        v38 = *(NSObject **)(v37 + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "Error: could not restore orthogonal content offset after update. This may result in a UI glitch - please file a bug on UIKit.", buf, 2u);
        }
LABEL_35:
        ++v11;
      }
      while (v9 != v11);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v9 = v39;
      if (!v39)
      {
LABEL_41:

        return;
      }
    }
  }
}

- (uint64_t)orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:(uint64_t)a3 elementKind:
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  if (!a1 || objc_msgSend(a2, "length") == 1)
    return 0;
  v7 = objc_msgSend(a2, "section");
  if (v7 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    return 1;
  objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  if (v8)
  {
    v10 = *(id *)(v8 + 8);
    v11 = (void *)v9[2];
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v12 = v11;
  if (objc_msgSend(v12, "scrollsOrthogonally"))
  {
    objc_msgSend(a2, "item");
    objc_msgSend(v12, "_auxillaryItemForElementKind:category:", a3, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "decorationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isBackgroundDecoration"))
        v6 = objc_msgSend(v12, "_clipsBackgroundDecorationsToContent");
      else
        v6 = 1;

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)sectionDescriptorForSectionIndex:(uint64_t)a1
{
  unint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v4 = objc_msgSend(*(id *)(a1 + 184), "count");
    v5 = 0;
    if ((a2 & 0x8000000000000000) == 0 && v4 > a2)
    {
      objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)shouldInvalidateForBoundsChange:(double)a3 requiresContainerUpdate:(double)a4
{
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;

  if (result)
  {
    v9 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_shouldInvalidateForBoundsChange_requiresContainerUpdate_, v9, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requiresContainerUpdate"));

    }
    *a2 = 0;
    if (-[_UICollectionCompositionalLayoutSolver hasPinnedSupplementaryItems](v9) || *(uint64_t *)(v9 + 288) > 0)
      return 1;
    objc_msgSend(*(id *)(v9 + 48), "contentSize");
    v12 = (v10 != a5) | 2;
    if (v11 == a6)
      v12 = v10 != a5;
    v13 = v10 != a5 || v11 != a6;
    *a2 = v13;
    return (v12 & *(_QWORD *)(v9 + 296)) != 0 || v13 && !dyld_program_sdk_at_least();
  }
  return result;
}

- (double)contentSize
{
  uint64_t v1;

  if (!a1)
    return 0.0;
  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return *(double *)(v1 + 120);
  else
    return *(double *)(a1 + 304);
}

- (uint64_t)_invalidateAllAttributes
{
  objc_msgSend(a1[26], "removeAllObjects");
  objc_msgSend(a1[27], "removeAllObjects");
  return objc_msgSend(a1[28], "removeAllObjects");
}

- (void)finalizeCollectionViewUpdates
{
  unint64_t v2;
  const char *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 208), "count");
    v4 = *(_QWORD *)(a1 + 232);
    if (v4 <= 0x64)
      v4 = 100;
    if (v2 > v4)
    {
      v5 = v2;
      if (v2 / v4 >= 2)
      {
        v6 = finalizeCollectionViewUpdates___s_category;
        if (!finalizeCollectionViewUpdates___s_category)
        {
          v6 = __UILogCategoryGetNode("UICollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&finalizeCollectionViewUpdates___s_category);
        }
        if ((*(_BYTE *)v6 & 1) != 0)
        {
          v9 = *(NSObject **)(v6 + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = *(_QWORD *)(a1 + 232);
            v11 = 134218496;
            v12 = a1;
            v13 = 2048;
            v14 = v10;
            v15 = 2048;
            v16 = v5;
            _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "finalizeCollectionViewUpdates: solver == %p; CompLayoutSolver clearing caches for large update becase item"
              " cache size changed from %lu to %lu during update.",
              (uint8_t *)&v11,
              0x20u);
          }
        }
        -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes]((id *)a1);
      }
    }
    *(_QWORD *)(a1 + 232) = 0;
    objc_setProperty_nonatomic_copy((id)a1, v3, 0, 240);
    v7 = *(void **)(a1 + 248);
    *(_QWORD *)(a1 + 248) = 0;

    v8 = *(void **)(a1 + 256);
    *(_QWORD *)(a1 + 256) = 0;

  }
}

- (void)_solveRetainingPreferredSizes:(id *)a1
{
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;

  if (a1)
  {
    v4 = objc_msgSend(a1[9], "numberOfSections");
    if (v4 == objc_msgSend(a1[23], "count"))
      v5 = a2;
    else
      v5 = 0;
    objc_msgSend(a1, "_fetchUpdatedSectionDefinitionsFromSectionProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") != v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveRetainingPreferredSizes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2272, CFSTR("Compositional layout internal error: The number of NSCollectionLayoutSections returned (%ld) does not match the number of sections in the data source snapshot (%ld)"), objc_msgSend(v9, "count"), v4);

    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72___UICollectionCompositionalLayoutSolver__solveRetainingPreferredSizes___block_invoke;
    v10[3] = &unk_1E16B8AB0;
    v12 = v5;
    v10[4] = a1;
    v11 = v6;
    v7 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    -[_UICollectionCompositionalLayoutSolver _configureLayoutForSections:]((uint64_t)a1, v9);
    -[_UICollectionCompositionalLayoutSolver _solveWithSectionLayouts:preferredSizesDict:dataSourceSnapshot:update:](a1, v9, v7, a1[9], 0);

  }
}

- (void)_configureLayoutForSections:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 112);
  if (v2 && *(_QWORD *)(v2 + 56))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = a2;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v26;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v4);
          v6 = *(_QWORD *)(a1 + 112);
          if (!v6 || !*(_QWORD *)(v6 + 56))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerDecorationItemsIfNeeded_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.options.decorationRegistrationHandler"));

          }
          v24 = v5;
          objc_msgSend(v5, "_backgroundDecorationViewsRequiringCustomViewClassRegistration");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v31;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v31 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
                v13 = *(_QWORD **)(a1 + 112);
                if (v13)
                  v14 = v13[7];
                else
                  v14 = 0;
                v15 = *(void (**)(uint64_t, uint64_t))(v14 + 16);
                v16 = v13;
                v15(v14, v12);

                ++v11;
              }
              while (v9 != v11);
              v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
              v9 = v17;
            }
            while (v17);
          }
          objc_msgSend(v24, "group");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "_hasDecorationItemRequiringRegistration"))
          {
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __75___UICollectionCompositionalLayoutSolver__registerDecorationItemsIfNeeded___block_invoke;
            v29[3] = &unk_1E16B8B50;
            v29[4] = a1;
            objc_msgSend(v18, "_enumerateItemsWithHandler:", v29);
          }

          ++v4;
        }
        while (v4 != v23);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        v23 = v20;
      }
      while (v20);
    }

  }
}

- (void)setDynamicsConfigurationHandler:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  _UICollectionLayoutDynamicsConfiguration *v6;
  void *v7;
  _UICollectionCompositionalLayoutDynamicAnimator *v8;
  id v9;
  uint64_t v10;
  id invalidationHandler;
  NSMutableDictionary *v12;
  NSMutableDictionary *itemBehaviors;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  if (a1)
  {
    v4 = objc_msgSend(a2, "copy");
    v5 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v4;

    if (a2)
    {
      v6 = objc_alloc_init(_UICollectionLayoutDynamicsConfiguration);
      v7 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v6;

      v8 = [_UICollectionCompositionalLayoutDynamicAnimator alloc];
      v9 = *(id *)(a1 + 136);
      v18 = v9;
      if (v8)
      {
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithReferenceSystem_invalidationHandler_, v8, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 3512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

        }
        v19.receiver = v8;
        v19.super_class = (Class)_UICollectionCompositionalLayoutDynamicAnimator;
        v8 = (_UICollectionCompositionalLayoutDynamicAnimator *)objc_msgSendSuper2(&v19, sel_initWithReferenceSystem_, a1);
        v10 = objc_msgSend(v18, "copy");
        invalidationHandler = v8->_invalidationHandler;
        v8->_invalidationHandler = (id)v10;

        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        itemBehaviors = v8->_itemBehaviors;
        v8->_itemBehaviors = v12;

      }
      v14 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v8;

    }
    else
    {
      v15 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = 0;

      v16 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = 0;

    }
  }
}

- (id)restorableState
{
  _UICollectionCompositionalLayoutSolverRestorableState *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v2 = [_UICollectionCompositionalLayoutSolverRestorableState alloc];
  if (!v2)
    return 0;
  v8.receiver = v2;
  v8.super_class = (Class)_UICollectionCompositionalLayoutSolverRestorableState;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  if (v3)
  {
    v4 = *(id *)(a1 + 184);
    -[_UICollectionCompositionalLayoutSolver _snapshotBookmarks:](v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v3 + 1);
    *((_QWORD *)v3 + 1) = v5;

    objc_storeStrong((id *)v3 + 2, *(id *)(a1 + 88));
  }
  return v3;
}

- (id)initWithContainer:(void *)a3 traitCollection:(void *)a4 layoutAxis:(void *)a5 dataSourceSnapshot:(uint64_t)a6 options:(void *)a7 sectionProvider:
{
  id *v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  objc_super v32;

  if (!a1)
    return 0;
  v32.receiver = a1;
  v32.super_class = (Class)_UICollectionCompositionalLayoutSolver;
  v13 = (id *)objc_msgSendSuper2(&v32, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 14, (id)a6);
    objc_storeStrong(v14 + 6, a2);
    objc_storeStrong(v14 + 7, a3);
    v14[8] = a4;
    objc_storeStrong(v14 + 9, a5);
    if (a6)
    {
      v14[10] = *(id *)(a6 + 16);
      *((_BYTE *)v14 + 17) = *(_BYTE *)(a6 + 8);
      v15 = *(void **)(a6 + 24);
    }
    else
    {
      v15 = 0;
      v14[10] = 0;
      *((_BYTE *)v14 + 17) = 0;
    }
    objc_storeStrong(v14 + 15, v15);
    if (a6)
      v16 = *(void **)(a6 + 32);
    else
      v16 = 0;
    objc_storeStrong(v14 + 16, v16);
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = v14[26];
    v14[26] = v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = v14[27];
    v14[27] = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = v14[28];
    v14[28] = v21;

    if (a6)
    {
      objc_storeStrong(v14 + 17, *(id *)(a6 + 40));
      v23 = *(_BYTE *)(a6 + 9) != 0;
    }
    else
    {
      v31 = v14[17];
      v14[17] = 0;

      v23 = 0;
    }
    *((_BYTE *)v14 + 16) = v23;
    if (a3)
    {
      objc_msgSend(a3, "displayScale");
      v14[18] = v24;
      if (a6)
      {
LABEL_11:
        v25 = *(void **)(a6 + 48);
LABEL_12:
        objc_storeStrong(v14 + 33, v25);
        v26 = objc_msgSend(a7, "copy");
        v27 = v14[19];
        v14[19] = (id)v26;

        v14[37] = (id)3;
        goto LABEL_13;
      }
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scale");
      v14[18] = v30;

      if (a6)
        goto LABEL_11;
    }
    v25 = 0;
    goto LABEL_12;
  }
LABEL_13:
  -[_UICollectionCompositionalLayoutSolver _solveRetainingPreferredSizes:](v14, 0);
  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if ((*(_BYTE *)&self->_solverFlags & 1) != 0)
    {
      __UIFaultDebugAssertLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v3, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: solver unexpectedly deallocating whilst solution bookmarks are locked. Please file a bug against UICollectionView with reproduction steps.", buf, 2u);
      }

    }
  }
  else if ((*(_BYTE *)&self->_solverFlags & 1) != 0)
  {
    v4 = dealloc___s_category_1;
    if (!dealloc___s_category_1)
    {
      v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&dealloc___s_category_1);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: solver unexpectedly deallocating whilst solution bookmarks are locked. Please file a bug against UICollectionView with reproduction steps.", buf, 2u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionCompositionalLayoutSolver;
  -[_UICollectionCompositionalLayoutSolver dealloc](&v6, sel_dealloc);
}

+ (id)traitsRequiringInvalidationForChanges
{
  objc_opt_self();
  if (_MergedGlobals_195 != -1)
    dispatch_once(&_MergedGlobals_195, &__block_literal_global_98);
  return (id)qword_1ECD77598;
}

- (double)_frameByExtendingGlobalSectionFrame:(uint64_t)a3 toOverlapPinnedSupplementaryInSection:(_BYTE *)a4 onEdge:(double)a5 visibleBounds:(CGFloat)a6 didExtend:(CGFloat)a7
{
  uint64_t v17;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  double *v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double MaxY;
  double MinY;
  double MaxX;
  double MinX;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  if (!a1)
    return 0.0;
  v17 = *(_QWORD *)(a1 + 64);
  if ((unint64_t)(v17 - 1) <= 1)
  {
    if (a2)
    {
      v25 = *(_QWORD *)(a2 + 24);
      v26 = *(_QWORD *)(a2 + 32);
      v27 = *(_QWORD *)(a2 + 40);
      v28 = *(_QWORD *)(a2 + 48);
    }
    else
    {
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v25 = 0;
    }
    if (CGRectIntersectsRect(*(CGRect *)&v25, *(CGRect *)&a9))
    {
      v29 = *(_QWORD *)(a1 + 64);
      if ((unint64_t)(v29 - 1) > 1)
      {
        v34 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        if (a2)
          v30 = *(void **)(a2 + 8);
        else
          v30 = 0;
        v31 = v30;
        objc_msgSend(v31, "pinnedSupplementaryIndexes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");
        v34 = (id)MEMORY[0x1E0C9AA60];
        if (v33)
        {
          v71 = 0;
          v72 = &v71;
          v73 = 0x3032000000;
          v74 = __Block_byref_object_copy__29;
          v75 = __Block_byref_object_dispose__29;
          v76 = 0;
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = __97___UICollectionCompositionalLayoutSolver__unpinnedFramesOfSupplementariesPinnedToEdge_ofSection___block_invoke;
          v64[3] = &unk_1E16B8808;
          v65 = v31;
          v66 = v32;
          v67 = a2;
          v69 = v29;
          v70 = a3;
          v68 = &v71;
          objc_msgSend(v66, "enumerateIndexesUsingBlock:", v64);
          v35 = (void *)v72[5];
          if (!v35)
            v35 = v34;
          v34 = v35;

          _Block_object_dispose(&v71, 8);
        }

      }
      if (objc_msgSend(v34, "count") != 1)
        goto LABEL_34;
      objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
      v36 = (double *)objc_claimAutoreleasedReturnValue();
      v62 = a7;
      v63 = a8;
      v61 = a5;
      if (v36)
      {
        v37 = v36[8];
        v38 = v36[9];
        v39 = v36[10];
        v40 = v36[11];
      }
      else
      {
        v38 = 0.0;
        v39 = 0.0;
        v40 = 0.0;
        v37 = 0.0;
      }
      +[_UICollectionCompositionalLayoutSolver _globalFrameForSectionAuxiliaryFrame:bookmark:container:](v37, v38, v39, v40, (uint64_t)_UICollectionCompositionalLayoutSolver, (double *)a2, *(void **)(a1 + 48));
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v47 = a9;
      v49 = v48;
      v50 = _UIPointValueForAxis(v17, v47, a10);
      v51 = _UISizeValueForAxis(v17, a11, a12);
      v60 = v42;
      v52 = _UIPointValueForAxis(v17, v42, v44);
      v53 = _UISizeValueForAxis(v17, v46, v49);
      if (v52 <= v50 && vabdd_f64(v52, v50) > 0.001)
      {
        a5 = v61;
LABEL_33:

LABEL_34:
        return a5;
      }
      v54 = v52 + v53;
      a5 = v61;
      if (v54 >= v50 + v51 && vabdd_f64(v54, v50 + v51) > 0.001)
        goto LABEL_33;
      if (v17 == 2)
      {
        v77.origin.x = v60;
        v77.origin.y = v44;
        v77.size.width = v46;
        v77.size.height = v49;
        MaxY = CGRectGetMaxY(v77);
        v78.origin.x = v60;
        v78.origin.y = v44;
        v78.size.width = v46;
        v78.size.height = v49;
        MinY = CGRectGetMinY(v78);
        a5 = v61;
        v79.origin.x = v61;
        v79.origin.y = a6;
        v79.size.width = v62;
        v79.size.height = v63;
        if (MaxY <= CGRectGetMaxY(v79))
        {
          v83.origin.x = v61;
          v83.origin.y = a6;
          v83.size.width = v62;
          v83.size.height = v63;
          if (MinY >= CGRectGetMinY(v83))
            goto LABEL_33;
          v84.origin.x = v61;
          v84.origin.y = a6;
          v84.size.width = v62;
          v84.size.height = v63;
          CGRectGetMaxY(v84);
        }
      }
      else
      {
        v80.origin.x = v60;
        v80.origin.y = v44;
        v80.size.width = v46;
        v80.size.height = v49;
        MaxX = CGRectGetMaxX(v80);
        v81.origin.x = v60;
        v81.origin.y = v44;
        v81.size.width = v46;
        v81.size.height = v49;
        MinX = CGRectGetMinX(v81);
        a5 = v61;
        v82.origin.x = v61;
        v82.origin.y = a6;
        v82.size.width = v62;
        v82.size.height = v63;
        if (MaxX <= CGRectGetMaxX(v82))
        {
          v85.origin.x = v61;
          v85.origin.y = a6;
          v85.size.width = v62;
          v85.size.height = v63;
          if (MinX >= CGRectGetMinX(v85))
            goto LABEL_33;
          v86.origin.x = v61;
          v86.origin.y = a6;
          v86.size.width = v62;
          v86.size.height = v63;
          CGRectGetMaxX(v86);
          a5 = MinX;
        }
      }
      *a4 = 1;
      goto LABEL_33;
    }
  }
  return a5;
}

- (uint64_t)enumerateSectionDefinitionsWithBlock:(uint64_t)result
{
  void *v2;
  _QWORD v3[5];

  if (result)
  {
    v2 = *(void **)(result + 184);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __79___UICollectionCompositionalLayoutSolver_enumerateSectionDefinitionsWithBlock___block_invoke;
    v3[3] = &unk_1E16B8B78;
    v3[4] = a2;
    return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);
  }
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(void *)a3 withIndexPath:
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat Width;
  CGFloat Height;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  __int128 v33;
  id *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  CGRect v43;
  CGRect v44;

  if (!a1)
  {
    v7 = 0;
    return v7;
  }
  v6 = objc_msgSend(a2, "length");
  v7 = 0;
  if (a3 && v6)
  {
    -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:]((uint64_t)a1, (uint64_t)a2, (uint64_t)a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = v8;
LABEL_22:

      return v7;
    }
    if (objc_msgSend(a3, "length") == 1
      && (-[_UICollectionLayoutAuxillaryItemSolver elementKinds](a1[34]),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "containsObject:", a2),
          v9,
          v10))
    {
      v11 = a1[34];
      -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v11, a2, objc_msgSend(a3, "indexAtPosition:", 0));
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForSupplementaryViewOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 737, CFSTR("Failed to resolve the global supplementary definition."));

        }
        -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset]((uint64_t)a1);
        v14 = *(double *)(v12 + 64);
        v15 = *(double *)(v12 + 72);
        v16 = *(double *)(v12 + 80);
        v17 = *(double *)(v12 + 88);
        v19 = v14 + v18;
        v21 = v20 + v15;
        v43.origin.x = v14;
        v43.origin.y = v15;
        v43.size.width = v16;
        v43.size.height = v17;
        Width = CGRectGetWidth(v43);
        v44.origin.x = v14;
        v44.origin.y = v15;
        v44.size.width = v16;
        v44.size.height = v17;
        Height = CGRectGetHeight(v44);
        v24 = objc_msgSend(v13, "zIndex");
        v25 = *(unsigned __int8 *)(v12 + 8);
        v26 = (uint64_t)a1;
        v27 = a3;
        v28 = a2;
        v29 = v19;
        v30 = v21;
        v31 = Width;
        v32 = Height;
LABEL_19:
        -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](v26, v27, v28, v24, v25, v29, v30, v31, v32);
        v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      v33 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v41 = *MEMORY[0x1E0C9D628];
      v42 = v33;
      +[_UICollectionCompositionalLayoutSolver _queryResultForSectionSupplementaryViewOfKind:withIndexPath:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, (uint64_t)a2, a3, a1[23], a1[6], &v41);
      v34 = (id *)objc_claimAutoreleasedReturnValue();
      v12 = (uint64_t)v34;
      if (v34)
      {
        -[_UICollectionLayoutFramesQueryResult supplementaryItem](v34);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForSupplementaryViewOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 758, CFSTR("Invalid query result - supplementary item was nil."));

        }
        v35 = objc_msgSend(v13, "zIndex");
        objc_msgSend(v13, "boundarySupplementaryItem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36 && *(_BYTE *)(v12 + 8))
          v35 = objc_msgSend(v36, "_pinningZIndex");

        v25 = *(unsigned __int8 *)(v12 + 8);
        v30 = *((double *)&v41 + 1);
        v29 = *(double *)&v41;
        v32 = *((double *)&v42 + 1);
        v31 = *(double *)&v42;
        v26 = (uint64_t)a1;
        v27 = a3;
        v28 = a2;
        v24 = v35;
        goto LABEL_19;
      }
    }
    v7 = 0;
    goto LABEL_21;
  }
  return v7;
}

- (void)invalidateCachedSupplementaryAttributesForElementKind:(uint64_t)a3 atIndexPaths:
{
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 216), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "removeObjectsForKeys:", a3);
      v4 = v5;
    }

  }
}

- (_WORD)_createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:(void *)a3 elementKind:(uint64_t)a4 frame:(int)a5 zIndex:(CGFloat)a6 pinned:(CGFloat)a7
{
  int v18;
  uint64_t v19;
  _WORD *v20;
  __int16 v21;
  uint64_t v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  if (!a1)
  {
    v20 = 0;
    return v20;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath_elementKind_frame_zIndex_pinned_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath_elementKind_frame_zIndex_pinned_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

  }
  if ((unint64_t)objc_msgSend(a2, "length") >= 2)
  {
    v18 = -[_UICollectionCompositionalLayoutSolver _sectionHasBackgroundDecorationView:](a1, objc_msgSend(a2, "section"));
    v19 = a4 <= 1 ? 1 : a4;
    if (v18)
      a4 = v19;
  }
  objc_msgSend(*(id *)(a1 + 120), "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", a3, a2);
  v20 = (_WORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", -[_UICollectionCompositionalLayoutSolver _validatedRoundedFrame:forElementOfCategory:atIndexPath:elementKind:](a1, 1, (uint64_t)a2, (uint64_t)a3, a6, a7, a8, a9));
  objc_msgSend(v20, "setZIndex:", a4);
  if (v20)
  {
    if (a5)
      v21 = 2048;
    else
      v21 = 0;
    v20[144] = v20[144] & 0xF7FF | v21;
  }
  -[_UICollectionCompositionalLayoutSolver _injectPreferredSizingDataIntoToLayoutAttributes:atIndexPath:](a1, (uint64_t)v20, a2);
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, _WORD *))(v22 + 16))(v22, v20);
  if (a3)
  {
    if (a2)
      goto LABEL_21;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__setCachedSupplementaryAttributesForElementKind_indexPath_attributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2655, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

    if (v20)
      goto LABEL_22;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__setCachedSupplementaryAttributesForElementKind_indexPath_attributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2656, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__setCachedSupplementaryAttributesForElementKind_indexPath_attributes_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2654, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind"));

  if (!a2)
    goto LABEL_27;
LABEL_21:
  if (!v20)
    goto LABEL_28;
LABEL_22:
  objc_msgSend(*(id *)(a1 + 216), "objectForKeyedSubscript:", a3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 216), "setObject:forKeyedSubscript:", v23, a3);
  }
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, a2);

  return v20;
}

- (uint64_t)_wantsSwipeActions
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 184);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v4);
        if (v5)
          v6 = *(void **)(v5 + 16);
        else
          v6 = 0;
        if ((objc_msgSend(v6, "_wantsSwipeActions", (_QWORD)v9) & 1) != 0)
        {
          v2 = 1;
          goto LABEL_16;
        }
        ++v4;
      }
      while (v2 != v4);
      v7 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v2 = v7;
    }
    while (v7);
  }
LABEL_16:

  return v2;
}

- (id)layoutAttributesForElementsInRect:(CGFloat)a3
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  if (a1)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76___UICollectionCompositionalLayoutSolver_layoutAttributesForElementsInRect___block_invoke;
    v13[3] = &unk_1E16B8880;
    v11 = v10;
    v14 = v11;
    -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)v13, a2, a3, a4, a5);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_BYTE)extendedAttributesQueryIncludingOrthogonalScrollingRegions:(double)a3
{
  _BYTE *v5;
  id v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  _QWORD v25[5];
  id v26;
  double *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a1;
  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = v5[13];
    -[_UICollectionCompositionalLayoutSolver _attributesQueryInfosForQueryRect:]((uint64_t)v5, a2, a3, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      v16 = MEMORY[0x1E0C809B0];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v18 = *(double **)(*((_QWORD *)&v29 + 1) + 8 * v17);
          if (v18)
          {
            v20 = v18[2];
            v19 = v18[3];
            v22 = v18[4];
            v21 = v18[5];
            v18 = (double *)*((_QWORD *)v18 + 1);
          }
          else
          {
            v21 = 0.0;
            v22 = 0.0;
            v19 = 0.0;
            v20 = 0.0;
          }
          v25[0] = v16;
          v25[1] = 3221225472;
          v25[2] = __101___UICollectionCompositionalLayoutSolver_extendedAttributesQueryIncludingOrthogonalScrollingRegions___block_invoke;
          v25[3] = &unk_1E16B8A60;
          v28 = v11;
          v27 = v18;
          v25[4] = v5;
          v26 = v10;
          -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:]((uint64_t)v5, (uint64_t)v25, v20, v19, v22, v21);

          ++v17;
        }
        while (v14 != v17);
        v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v14 = v23;
      }
      while (v23);
    }
    objc_msgSend(v10, "allObjects");
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_layoutAttributesForElementsInRect:(CGFloat)a3 handler:(CGFloat)a4
{
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat Width;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  uint64_t v46;
  _BOOL4 v47;
  _BOOL4 v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  float64x2_t v53;
  float64x2_t v54;
  void *v55;
  char v56;
  id v57;
  float64_t v58;
  float64_t v59;
  float64_t v60;
  float64_t v61;
  double obj;
  id obja;
  _QWORD v64[6];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  double v74;
  double v75;
  float64_t v76;
  float64_t v77;
  float64_t v78;
  float64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  float64x2_t v85[2];
  char v86;
  _BYTE v87[128];
  uint64_t v88;
  CGRect v89;
  CGRect v90;

  v88 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", sel__layoutAttributesForElementsInRect_handler_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v12 = *(void **)(a1 + 48);
  objc_opt_self();
  objc_msgSend(v12, "effectiveContentInsets");
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v16 = v15 + *MEMORY[0x1E0C9D538];
  obj = v17 + v14;
  objc_msgSend(*(id *)(a1 + 48), "effectiveContentInsets");
  if (v19 == 0.0 && v18 == 0.0 && v21 == 0.0 && v20 == 0.0)
  {
    Width = a5;
    v23 = a4;
    v24 = a3;
  }
  else
  {
    v25 = v14 - v18;
    v24 = a3 + v13 - v19;
    v23 = a4 + v25;
    v89.origin.x = a3;
    v89.origin.y = a4;
    v89.size.width = a5;
    v89.size.height = Height;
    Width = CGRectGetWidth(v89);
    v90.origin.x = a3;
    v90.origin.y = a4;
    v90.size.width = a5;
    v90.size.height = Height;
    Height = CGRectGetHeight(v90);
  }
  _UINormalizeRectForPositiveOrigin(v24, v23, Width, Height);
  v60 = v27;
  v61 = v26;
  v58 = v28;
  v59 = v29;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v30 = *(id *)(a1 + 184);
  v56 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v56 | 1;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke;
  v69[3] = &unk_1E16B8B00;
  v74 = v16;
  v75 = obj;
  v76 = v61;
  v77 = v58;
  v78 = v60;
  v79 = v59;
  v57 = v30;
  v70 = v57;
  v71 = a1;
  v72 = a2;
  v73 = &v81;
  v80 = sel__layoutAttributesForElementsInRect_handler_;
  if (objc_msgSend(*(id *)(a1 + 264), "count"))
  {
    -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset](a1);
    -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:](*(_QWORD *)(a1 + 272), v61, v58, v60, v59, v31, v32);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obja = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v87, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v66;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v66 != v34)
            objc_enumerationMutation(obja);
          v36 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v35);
          if (v36)
            v37 = *(_QWORD *)(v36 + 16);
          else
            v37 = 0;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            v39 = *(void **)(v36 + 40);
          else
            v39 = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__layoutAttributesForElementsInRect_handler_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2827, CFSTR("Fatal: frame result.item is incorrect class."));

          }
          v40 = (id)objc_msgSend(v39, "elementKind");
          -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:](a1, (uint64_t)v40, (uint64_t)v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v41)
          {
            if (v36)
            {
              v43 = *(double *)(v36 + 64);
              v42 = *(double *)(v36 + 72);
              v44 = *(double *)(v36 + 80);
              v45 = *(double *)(v36 + 88);
            }
            else
            {
              v42 = 0.0;
              v44 = 0.0;
              v45 = 0.0;
              v43 = 0.0;
            }
            v46 = objc_msgSend(v39, "zIndex");
            if (v36)
              v47 = *(_BYTE *)(v36 + 8) != 0;
            else
              v47 = 0;
            -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](a1, v38, v40, v46, v47, v43, v42, v44, v45);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
          }
          (*(void (**)(uint64_t, void *, _QWORD, uint64_t, uint64_t *))(a2 + 16))(a2, v41, 0, v36, v82 + 3);
          v48 = *((_BYTE *)v82 + 24) == 0;

          if (!v48)
          {

            goto LABEL_40;
          }
          ++v35;
        }
        while (v33 != v35);
        v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v87, 16);
        v33 = v50;
      }
      while (v50);
    }

  }
  v51 = *(_QWORD *)(a1 + 192);
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke_2;
  v64[3] = &unk_1E16B8B28;
  v64[4] = &v81;
  v64[5] = v69;
  if (v51)
  {
    v86 = 0;
    v52 = *(_QWORD **)(v51 + 8);
    v54.f64[0] = v60;
    v53.f64[0] = v61;
    v53.f64[1] = v58;
    v54.f64[1] = v59;
    v85[0] = vaddq_f64(v53, vminnmq_f64(v54, (float64x2_t)0));
    v85[1] = vabsq_f64(v54);
    _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v52, v85, &v86, (uint64_t)v64);
  }
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a1 + 8) & 0xFE | v56 & 1;
LABEL_40:

  _Block_object_dispose(&v81, 8);
}

- (id)_attributesQueryInfosForQueryRect:(double)a3
{
  _UICollectionLayoutExtendedAttributesQueryInfo *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  float64x2_t v15;
  float64x2_t v16;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  float64x2_t v30;
  char v31;

  v6 = [_UICollectionLayoutExtendedAttributesQueryInfo alloc];
  if (v6)
  {
    v29.receiver = v6;
    v29.super_class = (Class)_UICollectionLayoutExtendedAttributesQueryInfo;
    v7 = objc_msgSendSuper2(&v29, sel_init);
    v8 = v7;
    if (v7)
    {
      *((double *)v7 + 2) = a2;
      *((double *)v7 + 3) = a3;
      *((double *)v7 + 4) = a4;
      *((double *)v7 + 5) = a5;
      *((_QWORD *)v7 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v8, 0);
  v10 = v9;
  if (*(_BYTE *)(a1 + 13))
  {
    v11 = *(_QWORD *)(a1 + 184);
    v12 = *(_QWORD *)(a1 + 192);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76___UICollectionCompositionalLayoutSolver__attributesQueryInfosForQueryRect___block_invoke;
    v22[3] = &unk_1E16B8A88;
    v24 = v11;
    v25 = a2;
    v26 = a3;
    v27 = a4;
    v28 = a5;
    v13 = v9;
    v23 = v13;
    if (v12)
    {
      v31 = 0;
      v14 = *(_QWORD **)(v12 + 8);
      v15.f64[0] = a2;
      v16.f64[0] = a4;
      v15.f64[1] = a3;
      v16.f64[1] = a5;
      v29 = (objc_super)vaddq_f64(v15, vminnmq_f64(v16, (float64x2_t)0));
      v30 = vabsq_f64(v16);
      _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v14, (float64x2_t *)&v29, &v31, (uint64_t)v22);
      v13 = v23;
    }

  }
  return v10;
}

- (id)resolveForInvalidatedPreferredAttributes:(double)a3 scrollOffset:(double)a4 visibleRect:(double)a5
{
  objc_class *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  __int16 v32;
  void *v33;
  CGFloat *v34;
  void *v35;
  uint64_t v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t v49;
  double MaxY;
  CGFloat v51;
  double v52;
  double v53;
  double MaxX;
  CGFloat v55;
  void *v56;
  void *v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  char *v70;
  _QWORD v71[5];
  id v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  _QWORD *v79;
  _QWORD *v80;
  uint64_t *v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  uint64_t v86;
  double v87;
  _QWORD v88[4];
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  _QWORD v95[4];
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  CGRect v102;
  CGRect v103;

  if (!a1)
  {
    v17 = 0;
    return v17;
  }
  v16 = *(objc_class **)(a1 + 128);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1584, CFSTR("No invalidation context class specified."));

    v16 = *(objc_class **)(a1 + 128);
  }
  v17 = objc_alloc_init(v16);
  objc_msgSend(v17, "_setIntent:", 5);
  if (objc_msgSend(a2, "count"))
  {
    v18 = *(_QWORD *)(a1 + 64);
    v19 = MEMORY[0x1E0C809B0];
    if ((unint64_t)(v18 - 1) <= 1
      && ((v20 = _UIPointValueForAxis(v18, a3, a4), v21 = _UIPointValueForAxis(v18, a5, a6), v20 < 0.0)
        ? (v22 = v21 > 44.0)
        : (v22 = 0),
          v22))
    {
      v24 = *(_QWORD *)(a1 + 64);
      v96 = 0;
      v97 = &v96;
      v98 = 0x3032000000;
      v99 = __Block_byref_object_copy__29;
      v100 = __Block_byref_object_dispose__29;
      v101 = 0;
      v95[0] = 0;
      v95[1] = v95;
      v95[2] = 0x2020000000;
      v95[3] = 0x7FEFFFFFFFFFFFFFLL;
      v89 = 0;
      v90 = &v89;
      v91 = 0x3032000000;
      v92 = __Block_byref_object_copy__29;
      v93 = __Block_byref_object_dispose__29;
      v94 = 0;
      v88[0] = 0;
      v88[1] = v88;
      v88[2] = 0x2020000000;
      v88[3] = 0x7FEFFFFFFFFFFFFFLL;
      v74 = v19;
      v75 = 3221225472;
      v76 = (uint64_t)__129___UICollectionCompositionalLayoutSolver__layoutAttributesOfFirstElementEligibleForPreferredSizingContentOffsetAdjustmentInRect___block_invoke;
      v77 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16B8948;
      v82 = a5;
      v83 = a6;
      v84 = a7;
      v85 = a8;
      v86 = v24;
      v87 = _UIPointValueForAxis(v24, a5, a6);
      v78 = (void (*)(uint64_t))&v96;
      v79 = v95;
      v80 = v88;
      v81 = &v89;
      -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)&v74, a5, a6, a7, a8);
      v23 = v19;
      v25 = (void *)v97[5];
      if (!v25)
        v25 = (void *)v90[5];
      v61 = v25;
      _Block_object_dispose(v88, 8);
      _Block_object_dispose(&v89, 8);

      _Block_object_dispose(v95, 8);
      _Block_object_dispose(&v96, 8);

    }
    else
    {
      v23 = v19;
      v61 = 0;
    }
    v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v74 = 0;
    v75 = (uint64_t)&v74;
    v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__29;
    v78 = __Block_byref_object_dispose__29;
    v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v71[0] = v23;
    v71[1] = 3221225472;
    v71[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke;
    v71[3] = &unk_1E16B8970;
    v73 = &v74;
    v71[4] = a1;
    v26 = v17;
    v72 = v26;
    objc_msgSend(a2, "enumerateObjectsUsingBlock:", v71);
    v27 = *(void **)(v75 + 40);
    v62[0] = v23;
    v62[1] = 3221225472;
    v62[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_2;
    v62[3] = &unk_1E16B8A10;
    v62[4] = a1;
    v64 = a5;
    v65 = a6;
    v66 = a7;
    v67 = a8;
    v68 = a3;
    v69 = a4;
    v28 = v26;
    v63 = v28;
    v70 = sel_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect_;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v62);
    -[_UICollectionCompositionalLayoutSolver _recomputeSolutionBookmarksAndContentSize](a1);
    v29 = *(id *)(a1 + 272);
    -[_UICollectionLayoutAuxillaryItemSolver resolve]((uint64_t)v29);

    -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](a1);
    objc_msgSend(*(id *)(a1 + 208), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 216), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 224), "removeAllObjects");
    v30 = *MEMORY[0x1E0C9D538];
    v31 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (!v61)
      goto LABEL_30;
    v32 = *((_WORD *)v61 + 144);
    if ((v32 & 1) != 0)
    {
      objc_msgSend(v61, "indexPath", v59);
      v34 = (CGFloat *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:](a1, v34);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v32 & 2) != 0)
      {
        v34 = (CGFloat *)*((id *)v61 + 1);
        objc_msgSend(v61, "indexPath", v59);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionCompositionalLayoutSolver layoutAttributesForDecorationViewOfKind:withIndexPath:](a1, v34, v35);
        v36 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((v32 & 3) != 0)
        {
          v33 = 0;
          goto LABEL_29;
        }
        v34 = (CGFloat *)*((id *)v61 + 1);
        objc_msgSend(v61, "indexPath", v59);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:]((void **)a1, v34, v35);
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v33 = (void *)v36;

    }
    if (v33)
    {
      objc_msgSend(v61, "frame");
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;
      objc_msgSend(v33, "frame");
      v49 = *(_QWORD *)(a1 + 64);
      if (v49 == 1)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v45);
        v103.origin.x = v38;
        v103.origin.y = v40;
        v103.size.width = v42;
        v103.size.height = v44;
        v55 = CGRectGetMaxX(v103);
        v52 = _UISetPointValueForAxis(1, v30, v31, MaxX - v55);
      }
      else
      {
        if (v49 != 2)
          goto LABEL_29;
        MaxY = CGRectGetMaxY(*(CGRect *)&v45);
        v102.origin.x = v38;
        v102.origin.y = v40;
        v102.size.width = v42;
        v102.size.height = v44;
        v51 = CGRectGetMaxY(v102);
        v52 = _UISetPointValueForAxis(2, v30, v31, MaxY - v51);
      }
      v30 = v52;
      v31 = v53;
    }
LABEL_29:

LABEL_30:
    objc_msgSend(v28, "setContentOffsetAdjustment:", v30, v31, v59);
    v56 = v63;
    v17 = v28;

    _Block_object_dispose(&v74, 8);
  }
  return v17;
}

- (void)_updateBookmarkOffsetsForGlobalSupplementariesIfNeeded
{
  double *v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double Height;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  _UICollectionSectionSolutionBookmark *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id obj;
  double v40;
  double v41;
  uint64_t v42;
  id v43;
  _UIRTree *v44;
  uint64_t v45;
  double Width;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v54 = *MEMORY[0x1E0C80C00];
  -[_UICollectionCompositionalLayoutSolver _updateGeometryTranslator](a1);
  v45 = a1;
  v2 = *(double **)(a1 + 272);
  if (v2 && (v2[18] != 0.0 || v2[20] != 0.0 || v2[19] != 0.0 || v2[21] != 0.0))
  {
    v44 = objc_alloc_init(_UIRTree);
    v3 = *(_QWORD *)(a1 + 272);
    if (v3)
    {
      v5 = *(double *)(v3 + 144);
      v4 = *(double *)(v3 + 152);
    }
    else
    {
      v4 = 0.0;
      v5 = 0.0;
    }
    v6 = *(_QWORD *)(a1 + 64);
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = *(id *)(v45 + 184);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (!v7)
    {
LABEL_28:

      -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:](v45, v43);
      v38 = *(void **)(v45 + 192);
      *(_QWORD *)(v45 + 192) = v44;

      return;
    }
    v8 = v7;
    if (v6)
    {
      if (v6 != 1)
      {
        if (v6 == 2)
          v4 = 0.0;
        goto LABEL_15;
      }
    }
    else
    {
      v4 = 0.0;
    }
    v5 = 0.0;
LABEL_15:
    v9 = 0;
    v40 = *(double *)(MEMORY[0x1E0C9D538] + 8) - v5;
    v41 = *MEMORY[0x1E0C9D538] - v4;
    v42 = *(_QWORD *)v50;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v50 != v42)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v10);
        if (v11)
        {
          v12 = *(double *)(v11 + 24);
          v13 = *(double *)(v11 + 32);
          v14 = *(double *)(v11 + 40);
          v15 = *(double *)(v11 + 48);
          v47 = v40 + v13;
          v48 = v41 + v12;
          v55.origin.x = v12;
          v55.origin.y = v13;
          v55.size.width = v14;
          v55.size.height = v15;
          Width = CGRectGetWidth(v55);
          v56.origin.x = v12;
          v56.origin.y = v13;
          v56.size.width = v14;
          v56.size.height = v15;
          Height = CGRectGetHeight(v56);
          v17 = *(double *)(v11 + 56);
          v18 = *(double *)(v11 + 64);
          v19 = *(double *)(v11 + 72);
          v20 = *(double *)(v11 + 80);
          v21 = v41 + v17;
          v57.origin.x = v17;
          v57.origin.y = v18;
          v57.size.width = v19;
          v57.size.height = v20;
          v22 = CGRectGetWidth(v57);
          v58.origin.x = v17;
          v58.origin.y = v18;
          v58.size.width = v19;
          v58.size.height = v20;
          v23 = CGRectGetHeight(v58);
          v24 = [_UICollectionSectionSolutionBookmark alloc];
          v25 = *(void **)(v11 + 88);
          v26 = *(void **)(v11 + 96);
          v27 = *(void **)(v11 + 8);
          v28 = *(void **)(v11 + 104);
          v29 = *(id *)(v11 + 16);
          v30 = v27;
          v31 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)&v24->super.isa, v30, v25, v26, v29, v28, v48, v47, Width, Height, v21, v40 + v18, v22, v23);

          objc_msgSend(v43, "addObject:", v31);
          if (v31)
          {
            v32 = *((double *)v31 + 7);
            v33 = *((double *)v31 + 8);
            v34 = *((double *)v31 + 9);
            v35 = *((double *)v31 + 10);
          }
          else
          {
            v33 = 0.0;
            v34 = 0.0;
            v35 = 0.0;
            v32 = 0.0;
          }
          v36 = *(void **)(v11 + 8);
        }
        else
        {
          objc_msgSend(v43, "addObject:", 0);
          v31 = 0;
          v36 = 0;
          v32 = 0.0;
          v35 = 0.0;
          v34 = 0.0;
          v33 = 0.0;
        }
        -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:]((_QWORD *)v45, v44, v36, v9 + v10, v32, v33, v34, v35);

        ++v10;
      }
      while (v8 != v10);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      v8 = v37;
      v9 += v10;
    }
    while (v37);
    goto LABEL_28;
  }
}

- (void)_updateGeometryTranslator
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  char *v7;
  void *v8;

  v2 = *(double **)(a1 + 272);
  if (v2)
  {
    v3 = v2[14];
    v4 = v2[15];
    v5 = v2[16];
    v6 = v2[17];
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    v6 = 0.0;
    v5 = 0.0;
  }
  v7 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:]([_UICollectionLayoutSectionGeometryTranslator alloc], *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 17), *(double *)(a1 + 304), *(double *)(a1 + 312), v3, v4, 0.0, 0.0, 0.0, 0.0, v5, v6);
  v8 = *(void **)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v7;

}

- (id)itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v24;
  uint64_t v25;
  id v26;
  id obj;
  _QWORD v28[4];
  id v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1772, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPaths != nil"));

    }
    v25 = a1;
    v4 = *(id *)(a1 + 184);
    v26 = (id)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = a2;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v32;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "section");
          if (v10 >= objc_msgSend(v4, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths_, v25, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1779, CFSTR("Compositional Layout internal error: Layout solver queried for preferred size group in invalid section %ld. Section count: %ld"), v10, objc_msgSend(v4, "count"));

          }
          objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (_QWORD *)v11;
          if (v11)
            v13 = *(void **)(v11 + 8);
          else
            v13 = 0;
          v14 = v13;
          v15 = objc_msgSend(v14, "preferredSizeGroupingRangeForItemAtIndex:", objc_msgSend(v9, "item"));
          v17 = v16;

          if (v17 >= 2 && v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v12)
              v19 = v12[13];
            else
              v19 = 0;
            -[_UICollectionPreferredSizes indexesOfItemsWithoutPreferredSizesInRange:](v19, v15, v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __98___UICollectionCompositionalLayoutSolver_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths___block_invoke;
            v28[3] = &unk_1E16B8998;
            v30 = v10;
            v29 = v26;
            objc_msgSend(v20, "enumerateIndexesUsingBlock:", v28);

          }
          ++v8;
        }
        while (v6 != v8);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v6 = v22;
      }
      while (v22);
    }

  }
  else
  {
    v26 = 0;
  }
  return v26;
}

- (void)_globalSupplementaryFrameOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 48), "effectiveContentInsets");
  if (v3 != 0.0 || v2 != 0.0 || v5 != 0.0 || v4 != 0.0)
  {
    v6 = *(_QWORD *)(a1 + 64);
    if (v6 == 1)
      v7 = 2;
    else
      v7 = v6 == 2;
    v8 = _UILeadingOffsetForInsetsAlongAxis(v7, v2, v3);
    _UISetPointValueForAxis(v7, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8);
  }
}

- (id)resolveForUpdatedGlobalSupplementaries:(void *)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v2 = (uint64_t)a1;
    v3 = objc_msgSend(a2, "copy");
    v4 = *(void **)(v2 + 264);
    *(_QWORD *)(v2 + 264) = v3;

    -[_UICollectionCompositionalLayoutSolver _resolveOptionallyQueryingForSectionDefinitions:retainPreferredSizing:](v2, 0, 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)_resolveOptionallyQueryingForSectionDefinitions:(int)a3 retainPreferredSizing:
{
  double Bookmark;
  double v7;
  double v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;
  void *v15;
  _UICollectionCompositionalLayoutSolverResolveResult *v16;
  double v17;
  double v18;
  double v19;

  if (a1)
  {
    -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes]((id *)a1);
    Bookmark = -[_UICollectionCompositionalLayoutSolver _firstBookmarkOffset](a1);
    v8 = v7;
    if ((a2 & 1) != 0)
      objc_msgSend((id)a1, "_fetchUpdatedSectionDefinitionsFromSectionProvider");
    else
      objc_msgSend(*(id *)(a1 + 184), "valueForKey:", CFSTR("section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a3 && objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v12 = *(_QWORD *)(v12 + 104);
        v14 = -[_UICollectionPreferredSizes copyByDirtyingPreferredSizes]((id *)v12);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v15);

        ++v11;
      }
      while (v11 < objc_msgSend(*(id *)(a1 + 184), "count"));
    }
    v16 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    -[_UICollectionCompositionalLayoutSolverResolveResult setSectionsWereRequeried:](v16, "setSectionsWereRequeried:", a2);
    if ((_DWORD)a2)
      -[_UICollectionCompositionalLayoutSolver _configureLayoutForSections:](a1, v9);
    -[_UICollectionCompositionalLayoutSolver _solveWithSectionLayouts:preferredSizesDict:dataSourceSnapshot:update:]((id *)a1, v9, v10, *(void **)(a1 + 72), 0);
    v17 = -[_UICollectionCompositionalLayoutSolver _firstBookmarkOffset](a1) - Bookmark;
    v19 = v18 - v8;
    if (*(_BYTE *)(a1 + 16))
      v17 = UIPointRoundToScale(v17, v19, *(double *)(a1 + 144));
    -[_UICollectionCompositionalLayoutSolverResolveResult setContentOffsetAdjustment:](v16, "setContentOffsetAdjustment:", v17, v19);

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (double)_firstBookmarkOffset
{
  double *v2;
  double v3;

  if (!objc_msgSend(*(id *)(a1 + 184), "count"))
    return *MEMORY[0x1E0C9D538];
  objc_msgSend(*(id *)(a1 + 184), "firstObject");
  v2 = (double *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[3];
  else
    v3 = 0.0;

  return v3;
}

- (void)invalidateCachedDecorationAttributesForElementKind:(uint64_t)a3 atIndexPaths:
{
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "removeObjectsForKeys:", a3);
      v4 = v5;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSupplementaryPreferredSizes, 0);
  objc_storeStrong((id *)&self->_globalSupplementarySolver, 0);
  objc_storeStrong((id *)&self->_globalSupplementaryItems, 0);
  objc_storeStrong((id *)&self->_preUpdateDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_preUpdateContainer, 0);
  objc_storeStrong((id *)&self->_preUpdateSolutionBookmarks, 0);
  objc_storeStrong((id *)&self->_cachedDecorationAttributes, 0);
  objc_storeStrong((id *)&self->_cachedSupplementaryAttributes, 0);
  objc_storeStrong((id *)&self->_cachedItemAttributes, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
  objc_storeStrong((id *)&self->_sectionIndexer, 0);
  objc_storeStrong((id *)&self->_solutionBookmarks, 0);
  objc_storeStrong((id *)&self->_dynamicsConfiguration, 0);
  objc_storeStrong((id *)&self->_dynamicAnimator, 0);
  objc_storeStrong((id *)&self->_solutionBookmarkIndexesWithPinnedSupplementaryItems, 0);
  objc_storeStrong(&self->_sectionProvider, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_invalidationContextClass, 0);
  objc_storeStrong((id *)&self->_layoutAttributeClass, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_dynamicsConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_customContainerSectionIndexes, 0);
  objc_storeStrong((id *)&self->_orthogonalScrollingSectionIndexes, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong(&self->_sectionSupplementaryLayoutAttributesTransformer, 0);
  objc_storeStrong(&self->_sectionDecorationLayoutAttributesTransformer, 0);
  objc_storeStrong(&self->_cellLayoutAttributesTransformer, 0);
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForContainerChange:(uint64_t)a1
{
  _UICollectionCompositionalLayoutSolverResolveResult *v4;
  _QWORD **v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v25;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveForContainerChange_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

    }
    v4 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    v5 = (_QWORD **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "effectiveContentSize");
    v7 = v6;
    v9 = v8;
    objc_msgSend(a2, "effectiveContentSize");
    v11 = v10;
    v13 = v12;
    if (a2)
      v14 = (void *)a2[1];
    else
      v14 = 0;
    v15 = v14;
    v16 = *v5;
    if (*v5)
      v16 = (_QWORD *)v16[1];
    v17 = v16;
    v18 = objc_msgSend(v15, "isEqual:", v17);

    objc_storeStrong((id *)(a1 + 48), a2);
    v19 = *(id *)(a1 + 184);
    v20 = objc_msgSend(v19, "count");
    v21 = objc_msgSend(*(id *)(a1 + 72), "numberOfSections");

    if (v18 && v7 == v11 && v9 == v13 && v20 == v21)
    {
      -[_UICollectionCompositionalLayoutSolver _resolveOptionallyQueryingForSectionDefinitions:retainPreferredSizing:](a1, 0, 1);
      v22 = objc_claimAutoreleasedReturnValue();

      -[_UICollectionCompositionalLayoutSolver _recomputeSolutionBookmarksAndContentSize](a1);
      -[_UICollectionLayoutAuxillaryItemSolver resolve](*(_QWORD *)(a1 + 272));
      -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](a1);
      v4 = (_UICollectionCompositionalLayoutSolverResolveResult *)v22;
    }
    else
    {
      v23 = dyld_program_sdk_at_least();
      -[_UICollectionCompositionalLayoutSolver _solveRetainingPreferredSizes:]((id *)a1, v23);
      -[_UICollectionCompositionalLayoutSolverResolveResult setSectionsWereRequeried:](v4, "setSectionsWereRequeried:", 1);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)updatePinnedSectionSupplementaryItemsForVisibleBounds:(CGFloat)a3
{
  id *v5;
  _UICollectionLayoutUpdateContainerOffsetResult *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _UICollectionLayoutUpdateContainerOffsetResult *v16;
  _UIRTree *v17;
  id v18;
  _UIRTree *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  _UICollectionLayoutUpdateContainerOffsetResult *v39;
  _QWORD v41[5];
  _UICollectionLayoutUpdateContainerOffsetResult *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  _UIRTree *v46;
  _QWORD v47[4];
  id v48;
  id *v49;
  id v50;
  _UICollectionLayoutUpdateContainerOffsetResult *v51;
  uint64_t *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  char *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  v5 = a1;
  if (a1)
  {
    v10 = objc_alloc_init(_UICollectionLayoutUpdateContainerOffsetResult);
    v11 = v5[20];
    v12 = (void *)objc_msgSend(v5[23], "mutableCopy");
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke;
    v47[3] = &unk_1E16B8790;
    v14 = v12;
    v48 = v14;
    v49 = v5;
    v15 = v11;
    v53 = a2;
    v54 = a3;
    v55 = a4;
    v56 = a5;
    v50 = v15;
    v52 = &v58;
    v57 = sel_updatePinnedSectionSupplementaryItemsForVisibleBounds_;
    v16 = v10;
    v51 = v16;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", v47);
    -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:]((uint64_t)v5, v14);
    if (*((_BYTE *)v59 + 24))
    {
      v45[0] = v13;
      v45[1] = 3221225472;
      v45[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_3;
      v45[3] = &unk_1E16B87B8;
      v45[4] = v5;
      v17 = objc_alloc_init(_UIRTree);
      v46 = v17;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v45);
      v18 = v5[24];
      v5[24] = v17;
      v19 = v17;

    }
    v20 = v5[34];
    v21 = v20;
    if (v20)
      v22 = (void *)*((_QWORD *)v20 + 5);
    else
      v22 = 0;
    v23 = v22;
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v25 = v5[34];
      v26 = v25;
      if (v25)
        v27 = (void *)*((_QWORD *)v25 + 5);
      else
        v27 = 0;
      v28 = v27;
      v29 = objc_msgSend(v28, "count");

      if (v29)
      {
        -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset]((uint64_t)v5);
        v31 = v30;
        v33 = v32;
      }
      else
      {
        v31 = *MEMORY[0x1E0C9D538];
        v33 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
      }
      v34 = (id *)v5[34];
      -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:](v34, a2, a3, a4, a5);

      v35 = v5[34];
      v36 = v35;
      if (v35)
        v37 = (void *)*((_QWORD *)v35 + 5);
      else
        v37 = 0;
      v38 = v37;
      v41[0] = v13;
      v41[1] = 3221225472;
      v41[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_4;
      v41[3] = &unk_1E16B87E0;
      v41[4] = v5;
      v42 = v16;
      v43 = v31;
      v44 = v33;
      objc_msgSend(v38, "enumerateIndexesUsingBlock:", v41);

    }
    v39 = v51;
    v5 = v16;

    _Block_object_dispose(&v58, 8);
  }
  return v5;
}

- (void)_invalidateAttributes:(uint64_t)a1
{
  __int16 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v4 = a2[144];
    if ((v4 & 1) != 0)
    {
      objc_msgSend(a2, "indexPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 208), "removeObjectsForKeys:", v6);
    }
    else
    {
      if ((v4 & 3) != 0)
      {
        if ((v4 & 2) == 0)
          return;
        objc_msgSend(a2, "representedElementKind");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a2, "indexPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionCompositionalLayoutSolver invalidateCachedDecorationAttributesForElementKind:atIndexPaths:](a1, (uint64_t)v5, (uint64_t)v7);
      }
      else
      {
        objc_msgSend(a2, "representedElementKind");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a2, "indexPath");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UICollectionCompositionalLayoutSolver invalidateCachedSupplementaryAttributesForElementKind:atIndexPaths:](a1, (uint64_t)v5, (uint64_t)v7);
      }

    }
  }
}

+ (void)_globalFrameForSectionAuxiliaryFrame:(CGFloat)a3 bookmark:(CGFloat)a4 container:(uint64_t)a5
{
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_opt_self();
  if (a6)
  {
    v14 = a6[3];
    v13 = a6[4];
    v15 = a6[5];
    v16 = a6[6];
  }
  else
  {
    v13 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v14 = 0.0;
  }
  v17 = -[_UICollectionSectionSolutionBookmark sectionAuxiliaryContentInsetsOffset]((uint64_t)a6);
  +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:solutionGlobalFrame:contentInsetsOffset:container:](a1, a2, a3, a4, v14, (uint64_t)_UICollectionCompositionalLayoutSolver, a7, v13, v15, v16, v17);
}

- (uint64_t)updateVisibleBoundsForDynamicAnimator:(CGFloat)a3 previousVisibleBounds:(double)a4
{
  uint64_t v9;
  id v18;
  id v19;
  double *v20;
  _UICollectionLayoutEnvironment *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void (**v52)(id, id, void *);
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t i;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  double *v84;
  _UICollectionLayoutEnvironment *v85;
  void *v86;
  id *v87;
  id obj;
  uint64_t v89;
  id *v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id *v110;
  uint64_t v111;
  _QWORD v112[4];
  id *v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = result;
    if (*(_QWORD *)(result + 104))
    {
      v18 = *(id *)(result + 168);
      v92 = v9;
      v19 = *(id *)(v9 + 176);
      v20 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], a4, a5, 0.0, 0.0, 0.0, 0.0);
      v21 = [_UICollectionLayoutEnvironment alloc];
      v22 = *(_QWORD *)(v92 + 72);
      v23 = *(id *)(v92 + 56);
      v84 = v20;
      v85 = -[_UICollectionLayoutEnvironment initWithContainer:traitCollection:dataSourceSnapshot:](v21, "initWithContainer:traitCollection:dataSourceSnapshot:", v20, v23, v22);

      objc_msgSend(v19, "setCurrentVisibleBounds:", a2, a3, a4, a5);
      v83 = v19;
      v24 = v19;
      v25 = v92;
      objc_msgSend(v24, "setPreviousVisibleBounds:", a6, a7, a8, a9);
      v115 = 0;
      v116 = &v115;
      v117 = 0x3032000000;
      v118 = __Block_byref_object_copy__29;
      v119 = __Block_byref_object_dispose__29;
      v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v27 = MEMORY[0x1E0C809B0];
      v120 = v26;
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke;
      v112[3] = &unk_1E16B8830;
      v114 = &v115;
      v28 = (id *)v18;
      v113 = v28;
      -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](v92, (uint64_t)v112, a2, a3, a4, a5);
      v87 = v28;
      if (v28)
      {
        v29 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v28[42], "allKeys");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setWithArray:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = 0;
      }
      v86 = (void *)objc_msgSend(v31, "mutableCopy");

      objc_msgSend(v86, "minusSet:", v116[5]);
      v109[0] = v27;
      v109[1] = 3221225472;
      v109[2] = __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke_2;
      v109[3] = &unk_1E16B8858;
      v32 = v87;
      v110 = v32;
      v111 = v92;
      objc_msgSend(v86, "enumerateObjectsUsingBlock:", v109);
      v90 = v32;
      if (v87)
      {
        v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        objc_msgSend(v32[42], "allValues");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v122;
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v122 != v36)
                objc_enumerationMutation(v34);
              v38 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v37);
              if (v38)
                v39 = *(_QWORD *)(v38 + 48);
              else
                v39 = 0;
              objc_msgSend(v33, "addObject:", v39);
              ++v37;
            }
            while (v35 != v37);
            v40 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
            v35 = v40;
          }
          while (v40);
        }

      }
      else
      {
        v33 = 0;
      }
      v41 = *(id *)(v92 + 176);
      objc_msgSend(v41, "setDynamicItems:", v33);

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      if (v87)
      {
        objc_msgSend(v90[42], "allValues");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v106;
        do
        {
          v45 = 0;
          do
          {
            if (*(_QWORD *)v106 != v44)
              objc_enumerationMutation(v42);
            v46 = *(_QWORD **)(*((_QWORD *)&v105 + 1) + 8 * v45);
            v47 = *(id *)(v92 + 176);
            objc_msgSend(v46, "childBehaviors");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
              v49 = (void *)v46[6];
            else
              v49 = 0;
            v50 = v49;
            objc_msgSend(v47, "_setBehaviors:forItem:", v48, v50);

            ++v45;
          }
          while (v43 != v45);
          v51 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
          v43 = v51;
        }
        while (v51);
      }

      v52 = (void (**)(id, id, void *))*(id *)(v92 + 104);
      v53 = *(id *)(v92 + 176);
      v52[2](v52, v53, v85);

      v54 = *(id *)(v92 + 176);
      objc_msgSend(v54, "_dirtyItems");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      obj = v55;
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v127, 16);
      if (v56)
      {
        v89 = *(_QWORD *)v102;
        do
        {
          v91 = v56;
          for (i = 0; i != v91; ++i)
          {
            if (*(_QWORD *)v102 != v89)
              objc_enumerationMutation(obj);
            v58 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
            if (v58)
            {
              v59 = *(id *)(v58 + 24);
              v60 = *(void **)(v58 + 16);
            }
            else
            {
              v59 = 0;
              v60 = 0;
            }
            v61 = v60;
            +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            -[_UICollectionCompositionalLayoutDynamicAnimator behaviorForIdentifier:](v90, (uint64_t)v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "childBehaviors");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            v65 = v64;
            v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
            if (v66)
            {
              v67 = *(_QWORD *)v98;
              do
              {
                for (j = 0; j != v66; ++j)
                {
                  if (*(_QWORD *)v98 != v67)
                    objc_enumerationMutation(v65);
                  objc_msgSend(v63, "removeChildBehavior:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j));
                }
                v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
              }
              while (v66);
            }

            v69 = *(id *)(v92 + 176);
            objc_msgSend(v69, "behaviorsForItem:", v58);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            v71 = v70;
            v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
            if (v72)
            {
              v73 = *(_QWORD *)v94;
              do
              {
                for (k = 0; k != v72; ++k)
                {
                  if (*(_QWORD *)v94 != v73)
                    objc_enumerationMutation(v71);
                  objc_msgSend(v63, "addChildBehavior:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k));
                }
                v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
              }
              while (v72);
            }

            v25 = v92;
          }
          v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v127, 16);
        }
        while (v56);
      }

      v75 = *(id *)(v25 + 176);
      objc_msgSend(v75, "_reset");

      if (v87)
      {
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        objc_msgSend(v90[42], "objectEnumerator");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
        if (v77)
        {
          v78 = *(_QWORD *)v122;
          do
          {
            v79 = 0;
            do
            {
              if (*(_QWORD *)v122 != v78)
                objc_enumerationMutation(v76);
              v80 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v79);
              if (v80)
                v81 = *(_QWORD *)(v80 + 48);
              else
                v81 = 0;
              objc_msgSend(v90, "updateItemFromCurrentState:", v81);
              ++v79;
            }
            while (v77 != v79);
            v82 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
            v77 = v82;
          }
          while (v82);
        }

      }
      _Block_object_dispose(&v115, 8);

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)preUpdateFrameForItemAtInitialIndexPath:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v18;
  __int128 v19;

  if (!a1)
  {
    v18 = 0u;
    v19 = 0u;
    return *(double *)&v18;
  }
  v4 = *(id *)(a1 + 256);
  if (!v4)
    goto LABEL_7;
  v5 = v4;
  v6 = *(id *)(a1 + 248);
  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = *(_QWORD *)(a1 + 240);

  if (!v7)
  {
LABEL_7:
    v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *MEMORY[0x1E0C9D628];
    v19 = v16;
    return *(double *)&v18;
  }
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v18 = *MEMORY[0x1E0C9D628];
  v19 = v8;
  v9 = *(void **)(a1 + 240);
  v12 = a1 + 248;
  v10 = *(void **)(a1 + 248);
  v11 = *(void **)(v12 + 8);
  v13 = v9;
  v14 = v11;
  +[_UICollectionCompositionalLayoutSolver _queryResultForItemAtIndexPath:dataSourceSnapshot:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, a2, v14, v13, v10, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return *(double *)&v18;
}

+ (CGFloat)_queryResultForItemAtIndexPath:(void *)a3 dataSourceSnapshot:(void *)a4 solutionBookmarks:(void *)a5 container:(_QWORD *)a6 globalFrame:
{
  uint64_t v11;
  double *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_opt_self();
  if (a2)
  {
    if ((unint64_t)-[CGFloat length](a2, "length") < 2
      || objc_msgSend(a3, "globalIndexForIndexPath:", a2) == 0x7FFFFFFFFFFFFFFFLL)
    {
      a2 = 0;
    }
    else
    {
      objc_msgSend(a4, "objectAtIndexedSubscript:", -[CGFloat section](a2, "section"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (double *)v11;
      if (v11)
        v13 = *(void **)(v11 + 8);
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(v14, "frameForIndex:", -[CGFloat item](a2, "item"));
      a2 = (CGFloat *)objc_claimAutoreleasedReturnValue();

      if (a2)
      {
        +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:bookmark:container:](a2[8], a2[9], a2[10], a2[11], (uint64_t)_UICollectionCompositionalLayoutSolver, v12, a5);
        *a6 = v15;
        a6[1] = v16;
        a6[2] = v17;
        a6[3] = v18;
      }

    }
  }
  return a2;
}

+ (void)_globalFrameForSolutionFrame:(CGFloat)a3 bookmark:(CGFloat)a4 container:(uint64_t)a5
{
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_opt_self();
  if (a6)
  {
    v14 = a6[3];
    v13 = a6[4];
    v15 = a6[5];
    v16 = a6[6];
  }
  else
  {
    v13 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v14 = 0.0;
  }
  v17 = -[_UICollectionSectionSolutionBookmark contentInsetsOffset]((uint64_t)a6);
  +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:solutionGlobalFrame:contentInsetsOffset:container:](a1, a2, a3, a4, v14, (uint64_t)_UICollectionCompositionalLayoutSolver, a7, v13, v15, v16, v17);
}

- (double)preUpdateFrameForSupplementaryViewOfKind:(void *)a3 withInitialIndexPath:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  id *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat Width;
  __int128 v24;
  __int128 v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  CGRect v35;
  CGRect v36;

  if (!a1)
  {
    v33 = 0u;
    v34 = 0u;
    return *(double *)&v33;
  }
  v6 = *(id *)(a1 + 256);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = *(id *)(a1 + 248);
  if (!v8)
  {

    goto LABEL_12;
  }
  v9 = *(_QWORD *)(a1 + 240);

  if (!v9)
  {
LABEL_12:
    v24 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v33 = *MEMORY[0x1E0C9D628];
    v34 = v24;
    return *(double *)&v33;
  }
  if (objc_msgSend(a3, "length") == 1
    && (-[_UICollectionLayoutAuxillaryItemSolver elementKinds](*(_QWORD **)(a1 + 272)),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", a2),
        v10,
        v11))
  {
    v12 = (id *)*(id *)(a1 + 272);
    -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v12, a2, objc_msgSend(a3, "indexAtPosition:", 0));
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel_preUpdateFrameForSupplementaryViewOfKind_withInitialIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 701, CFSTR("Failed to resolve the global supplementary definition."));

      }
      -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset](a1);
      v15 = *(double *)(v13 + 64);
      v16 = *(double *)(v13 + 72);
      v17 = *(double *)(v13 + 80);
      v18 = *(double *)(v13 + 88);
      v20 = v15 + v19;
      v22 = v21 + v16;
      v35.origin.x = v15;
      v35.origin.y = v16;
      v35.size.width = v17;
      v35.size.height = v18;
      Width = CGRectGetWidth(v35);
      v36.origin.x = v15;
      v36.origin.y = v16;
      v36.size.width = v17;
      v36.size.height = v18;
      *(double *)&v33 = v20;
      *((double *)&v33 + 1) = v22;
      *(CGFloat *)&v34 = Width;
      *((_QWORD *)&v34 + 1) = CGRectGetHeight(v36);

    }
    else
    {
      v31 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v33 = *MEMORY[0x1E0C9D628];
      v34 = v31;
    }

  }
  else
  {
    v26 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v33 = *MEMORY[0x1E0C9D628];
    v34 = v26;
    v27 = *(void **)(a1 + 240);
    v28 = *(void **)(a1 + 248);
    v29 = v27;
    +[_UICollectionCompositionalLayoutSolver _queryResultForSectionSupplementaryViewOfKind:withIndexPath:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, (uint64_t)a2, a3, v29, v28, &v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return *(double *)&v33;
}

+ (CGFloat)_queryResultForSectionSupplementaryViewOfKind:(void *)a3 withIndexPath:(void *)a4 solutionBookmarks:(void *)a5 container:(_QWORD *)a6 globalFrame:
{
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  CGFloat *v15;
  uint64_t v16;
  double *v17;
  void *v18;
  id v19;
  CGFloat *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;

  v11 = objc_opt_self();
  v12 = objc_msgSend(a3, "section");
  v13 = objc_msgSend(a3, "item");
  v14 = objc_msgSend(a4, "count");
  v15 = 0;
  if ((v12 & 0x8000000000000000) == 0 && v12 < v14)
  {
    objc_msgSend(a4, "objectAtIndexedSubscript:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (double *)v16;
    if (v16)
      v18 = *(void **)(v16 + 8);
    else
      v18 = 0;
    v19 = v18;
    objc_msgSend(v19, "supplementaryFrameWithKind:index:", a2, v13);
    v20 = (CGFloat *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    if (v20)
    {
      +[_UICollectionCompositionalLayoutSolver _globalFrameForSectionAuxiliaryFrame:bookmark:container:](v20[8], v20[9], v20[10], v20[11], (uint64_t)_UICollectionCompositionalLayoutSolver, v17, a5);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      if (!a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__queryResultForSectionSupplementaryViewOfKind_withIndexPath_solutionBookmarks_container_globalFrame_, v11, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 823, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outGlobalFrame != nil"));

      }
      *a6 = v22;
      a6[1] = v24;
      a6[2] = v26;
      a6[3] = v28;
    }

  }
  return v15;
}

- (double)unpinnedFrameOfBoundarySupplementaryElementOfKind:(void *)a3 withIndexPath:
{
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  double *v10;
  void *v11;
  id v12;
  CGFloat *v13;
  double v14;
  double v15;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;

  if (!a1)
    return 0.0;
  if (a2)
  {
    if (a3)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel_unpinnedFrameOfBoundarySupplementaryElementOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 775, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind != nil"));

    if (a3)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel_unpinnedFrameOfBoundarySupplementaryElementOfKind_withIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

LABEL_4:
  v6 = objc_msgSend(a3, "section");
  v7 = a1[23];
  v8 = v7;
  if ((v6 & 0x8000000000000000) != 0 || v6 >= objc_msgSend(v7, "count"))
  {
    v15 = *MEMORY[0x1E0C9D628];
  }
  else if ((objc_msgSend(a1[20], "containsIndex:", v6) & 1) != 0)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (double *)v9;
    if (v9)
      v11 = *(void **)(v9 + 8);
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v12, "unpinnedSectionSupplementaryFrameForIndex:", objc_msgSend(a3, "item"));
    v13 = (CGFloat *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[_UICollectionCompositionalLayoutSolver _globalFrameForSectionAuxiliaryFrame:bookmark:container:](v13[8], v13[9], v13[10], v13[11], (uint64_t)_UICollectionCompositionalLayoutSolver, v10, a1[6]);
      v15 = v14;
    }
    else
    {
      v15 = *MEMORY[0x1E0C9D628];
    }

  }
  else
  {
    -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:](a1, a2, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "frame");
      v15 = v19;
    }
    else
    {
      v15 = *MEMORY[0x1E0C9D628];
    }

  }
  return v15;
}

- (double)preUpdateFrameForDecorationViewOfKind:(void *)a3 withInitialIndexPath:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v28;
  id v29;
  uint64_t v30;
  CGFloat *v31;
  double v32;
  void *v33;
  void *v34;

  if (!a1)
    return 0.0;
  v6 = a1[32];
  if (v6)
  {
    v7 = v6;
    v8 = a1[31];
    if (v8)
    {
      v9 = a1[30];

      if (v9)
      {
        v10 = objc_msgSend(a2, "length");
        if (a3)
        {
          if (v10 && (unint64_t)objc_msgSend(a3, "length") > 1)
          {
            v11 = objc_msgSend(a3, "section");
            v12 = objc_msgSend(a3, "item");
            v13 = a1[30];
            objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (_QWORD *)v14;
            if (v14)
              v16 = *(void **)(v14 + 16);
            else
              v16 = 0;
            v17 = v16;
            v18 = objc_msgSend(v13, "count");
            if ((v11 & 0x8000000000000000) != 0 || v11 >= v18)
            {
              v26 = *MEMORY[0x1E0C9D628];
LABEL_29:

              return v26;
            }
            objc_msgSend(v17, "_auxillaryItemForElementKind:category:", a2, 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              if (v15)
                v28 = (void *)v15[1];
              else
                v28 = 0;
              v29 = v28;
              objc_msgSend(v29, "supplementaryFrameWithKind:index:", a2, v12);
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = (CGFloat *)v30;
                if (*(_QWORD *)(v30 + 32) != 3)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel_preUpdateFrameForDecorationViewOfKind_withInitialIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.isDecoration"));

                }
                +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:bookmark:container:](v31[8], v31[9], v31[10], v31[11], (uint64_t)_UICollectionCompositionalLayoutSolver, (double *)v15, a1[31]);
                v26 = v32;

              }
              else
              {

                v26 = *MEMORY[0x1E0C9D628];
              }
              goto LABEL_28;
            }
            objc_msgSend(v17, "decorationItems");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            if (v12 >= v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel_preUpdateFrameForDecorationViewOfKind_withInitialIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 857, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemIndex < section.decorationItems.count"));

              if (v15)
                goto LABEL_15;
            }
            else if (v15)
            {
LABEL_15:
              v22 = (void *)v15[2];
LABEL_16:
              objc_msgSend(v22, "decorationItems");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectAtIndexedSubscript:", v12);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "elementKind");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = +[_UICollectionCompositionalLayoutSolver _globalFrameForBackgroundDecoration:forSectionWithBookmark:]((uint64_t)_UICollectionCompositionalLayoutSolver, (id *)v15);

LABEL_28:
              goto LABEL_29;
            }
            v22 = 0;
            goto LABEL_16;
          }
        }
      }
    }
    else
    {

    }
  }
  return *MEMORY[0x1E0C9D628];
}

+ (double)_globalFrameForBackgroundDecoration:(uint64_t)a1 forSectionWithBookmark:(id *)a2
{
  char *v3;
  id v4;
  int v5;
  uint64_t v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_opt_self();
  if (!a2)
    return *MEMORY[0x1E0C9D628];
  -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)a2);
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  v4 = a2[2];
  v5 = objc_msgSend(v4, "_clipsBackgroundDecorationsToContent");
  if (v3)
  {
    v6 = 112;
    if (v5)
      v6 = 144;
    v7 = *(double *)&v3[v6];
  }
  else
  {
    v7 = 0.0;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0 && objc_msgSend(a2[2], "scrollsOrthogonally"))
  {
    v8 = a2[11];
    objc_msgSend(v8, "effectiveInsets");
    _UITotalEdgeDimensionsForLayoutAxis(objc_msgSend(a2[1], "layoutAxis"), v9, v10, v11, v12);

  }
  return v7;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(double)a3 withTargetPosition:(double)a4
{
  unint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v17;

  if (a1 && (unint64_t)objc_msgSend(a2, "length") >= 2)
  {
    v8 = objc_msgSend(a2, "section");
    if (v8 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 975, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndex < self.solutionBookmarks.count"));

    }
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v9 = (_QWORD *)v9[2];
    if (objc_msgSend(v9, "shouldRestrictOrthogonalAxisDuringInteractiveMovement"))
    {
      v11 = *(_QWORD *)(a1 + 64);
      v12 = _UIPointValueForAxis(v11, a3, a4);
      -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:](a1, (CGFloat *)a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "center");
      objc_msgSend(v13, "setCenter:", _UISetPointValueForAxis(v11, v14, v15, v12));
      objc_msgSend(v13, "setZIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)enumeratePinnedSupplementaryItems:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];

  if (a1 && -[_UICollectionCompositionalLayoutSolver hasPinnedSupplementaryItems](a1))
  {
    v4 = *(void **)(a1 + 160);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke;
    v9[3] = &unk_1E16B88A8;
    v9[4] = a1;
    v9[5] = a2;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v9);
    v6 = *(_QWORD **)(a1 + 272);
    if (v6)
      v6 = (_QWORD *)v6[5];
    v7 = v6;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_3;
    v8[3] = &unk_1E16B88A8;
    v8[4] = a1;
    v8[5] = a2;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

  }
}

- (void)prepareForCollectionViewUpdates
{
  id v2;
  SEL v3;

  if (a1)
  {
    v2 = *(id *)(a1 + 208);
    *(_QWORD *)(a1 + 232) = objc_msgSend(v2, "count");

    objc_setProperty_nonatomic_copy((id)a1, v3, *(id *)(a1 + 184), 240);
    objc_storeStrong((id *)(a1 + 248), *(id *)(a1 + 48));
    objc_storeStrong((id *)(a1 + 256), *(id *)(a1 + 72));
  }
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveSolutionForUpdate:(void *)a3 container:(int)a4 ignoreEmptyUpdate:
{
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _UICollectionCompositionalSolverPreferredSizesRebaseInfo *v35;
  id *p_isa;
  id v37;
  id *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  objc_super *v58;
  id v59;
  id v60;
  objc_super *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v91;
  _UICollectionCompositionalLayoutSolverResolveResult *v92;
  _QWORD v93[4];
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  _QWORD v98[5];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  objc_super v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t aBlock;
  uint64_t v108;
  void *v109;
  void *v110;
  objc_super *v111;
  _UICollectionCompositionalLayoutSolverResolveResult *v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[4];
  id v119;
  _UICollectionCompositionalLayoutSolverResolveResult *v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v92 = 0;
    return v92;
  }
  v6 = a2;
  v7 = (id *)a1;
  if (a2)
  {
    v8 = *(id *)(a2 + 16);
    v9 = *(id *)(v6 + 24);
    v10 = v9;
    v88 = v8;
    if (v8)
    {
      if (v9)
        goto LABEL_5;
LABEL_74:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id *)a1;
      objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveSolutionForUpdate_container_ignoreEmptyUpdate_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalDataSourceSnapshot != nil"));

      v6 = a2;
      if (a3)
        goto LABEL_6;
LABEL_75:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id *)a1;
      objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveSolutionForUpdate_container_ignoreEmptyUpdate_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newContainer != nil"));

      v6 = a2;
      goto LABEL_6;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)a1;
  objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveSolutionForUpdate_container_ignoreEmptyUpdate_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateTranslator != nil"));

  v88 = 0;
  v6 = a2;
  if (!v10)
    goto LABEL_74;
LABEL_5:
  if (!a3)
    goto LABEL_75;
LABEL_6:
  v92 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
  if (a4)
  {
    if (v6)
      v11 = *(void **)(v6 + 8);
    else
      v11 = 0;
    v12 = v11;
    if (objc_msgSend(v12, "count"))
    {

    }
    else
    {
      v13 = objc_msgSend(a3, "isEqual:", v7[6]);

      if (v13)
      {
        -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](v7);
        goto LABEL_69;
      }
    }
  }
  v86 = v10;
  objc_storeStrong(v7 + 6, a3);
  if (v6)
  {
    v14 = a2;
    v15 = a1;
    v17 = *(double *)(a2 + 32);
    v16 = *(double *)(a2 + 40);
    v19 = *(double *)(a2 + 48);
    v18 = *(double *)(a2 + 56);
    v20 = *(void **)(a2 + 16);
  }
  else
  {
    v20 = 0;
    v18 = 0.0;
    v19 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v14 = a2;
    v15 = a1;
  }
  v21 = v14 == 0;
  v22 = v20;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __138___UICollectionCompositionalLayoutSolver__updateResultsNotingDeletedItemAndSectionAuxillaries_returningStartingGroupAuxillariesForUpdate___block_invoke;
  v118[3] = &unk_1E16B8BA0;
  v119 = v22;
  v120 = v92;
  v24 = v23;
  v121 = v24;
  v25 = v22;
  -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](v15, (uint64_t)v118, v17, v16, v19, v18);
  v26 = v121;
  v27 = v24;

  v87 = v27;
  if (v21)
    v28 = 0;
  else
    v28 = *(void **)(a2 + 24);
  objc_storeStrong((id *)(a1 + 72), v28);
  v29 = (id *)a1;
  if (*(_BYTE *)(a1 + 12))
  {
    v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v30 = *(id *)(a1 + 184);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v115;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v115 != v32)
            objc_enumerationMutation(v30);
          v34 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v33);
          v35 = [_UICollectionCompositionalSolverPreferredSizesRebaseInfo alloc];
          p_isa = (id *)&v35->super.isa;
          if (v34)
          {
            v37 = *(id *)(v34 + 8);
            v34 = *(_QWORD *)(v34 + 104);
            if (!p_isa)
              goto LABEL_27;
          }
          else
          {
            v37 = 0;
            if (!v35)
              goto LABEL_27;
          }
          v103.receiver = p_isa;
          v103.super_class = (Class)_UICollectionCompositionalSolverPreferredSizesRebaseInfo;
          v38 = (id *)objc_msgSendSuper2(&v103, sel_init);
          p_isa = v38;
          if (v38)
          {
            objc_storeStrong(v38 + 1, v37);
            objc_storeStrong(p_isa + 2, (id)v34);
          }
LABEL_27:

          objc_msgSend(v91, "addObject:", p_isa);
          ++v33;
        }
        while (v31 != v33);
        v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
        v31 = v39;
      }
      while (v39);
    }

    v40 = *(_QWORD *)(a1 + 152);
    v103.receiver = 0;
    v103.super_class = (Class)&v103;
    *(_QWORD *)&v104 = 0x3032000000;
    *((_QWORD *)&v104 + 1) = __Block_byref_object_copy__29;
    *(_QWORD *)&v105 = __Block_byref_object_dispose__29;
    *((_QWORD *)&v105 + 1) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a2)
      v41 = *(void **)(a2 + 16);
    else
      v41 = 0;
    v42 = v41;
    aBlock = MEMORY[0x1E0C809B0];
    v108 = 3221225472;
    v109 = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke;
    v110 = &unk_1E16B8BC8;
    v111 = &v103;
    v43 = _Block_copy(&aBlock);
    *(_QWORD *)&v99 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v99 + 1) = 3221225472;
    *(_QWORD *)&v100 = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_2;
    *((_QWORD *)&v100 + 1) = &unk_1E16B8C68;
    v44 = v42;
    *(_QWORD *)&v101 = v44;
    v45 = v43;
    *((_QWORD *)&v101 + 1) = v45;
    objc_msgSend(v91, "enumerateObjectsUsingBlock:", &v99);
    if (v40)
    {
      v46 = (void *)a2;
      if (a2)
        v46 = *(void **)(a2 + 8);
      v47 = v46;
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_6;
      v98[3] = &unk_1E16B8C90;
      v98[4] = &v103;
      objc_msgSend(v47, "enumerateObjectsUsingBlock:", v98);

    }
    v48 = *((id *)v103.super_class + 5);

    _Block_object_dispose(&v103, 8);
    v29 = (id *)a1;
  }
  else
  {
    v48 = (id)MEMORY[0x1E0C9AA70];
  }
  v49 = (void *)objc_msgSend(v48, "mutableCopy");

  objc_msgSend(v88, "finalSectionCount");
  v50 = objc_msgSend(v29[23], "count");
  objc_msgSend(v29, "_fetchUpdatedSectionDefinitionsFromSectionProvider");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __95___UICollectionCompositionalLayoutSolver_resolveSolutionForUpdate_container_ignoreEmptyUpdate___block_invoke;
  v93[3] = &unk_1E16B88F8;
  v94 = v88;
  v95 = a1;
  v96 = v49;
  v97 = v50;
  v52 = v49;
  objc_msgSend(v51, "enumerateObjectsUsingBlock:", v93);
  -[_UICollectionCompositionalLayoutSolverResolveResult setSectionsWereRequeried:](v92, "setSectionsWereRequeried:", 1);
  -[_UICollectionCompositionalLayoutSolver _solveWithSectionLayouts:preferredSizesDict:dataSourceSnapshot:update:]((id *)a1, v51, v52, v86, a2);
  -[_UICollectionCompositionalLayoutSolver _configureLayoutForSections:](a1, v51);
  if (a2)
  {
    v54 = *(double *)(a2 + 32);
    v53 = *(double *)(a2 + 40);
    v56 = *(double *)(a2 + 48);
    v55 = *(double *)(a2 + 56);
    v57 = *(void **)(a2 + 16);
  }
  else
  {
    v57 = 0;
    v55 = 0.0;
    v56 = 0.0;
    v53 = 0.0;
    v54 = 0.0;
  }
  v58 = v57;
  v59 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  aBlock = MEMORY[0x1E0C809B0];
  v108 = 3221225472;
  v109 = __154___UICollectionCompositionalLayoutSolver__updateResultNotingInsertedItemAndSectionAuxillaries_forVisibleGroupAuxillaryAttributesBeforeResolve_withUpdate___block_invoke;
  v110 = &unk_1E16B8BA0;
  v111 = v58;
  v112 = v92;
  v60 = v59;
  v113 = v60;
  v61 = v58;
  -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)&aBlock, v54, v53, v56, v55);
  v62 = v113;
  v63 = v60;

  v64 = (void *)objc_msgSend(v63, "mutableCopy");
  objc_msgSend(v64, "minusSet:", v87);
  v105 = 0u;
  v106 = 0u;
  v103 = (objc_super)0;
  v104 = 0u;
  v65 = v64;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
  if (v66)
  {
    v67 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v104 != v67)
          objc_enumerationMutation(v65);
        v69 = *((_QWORD *)v103.super_class + i);
        if (v69)
        {
          v70 = *(_QWORD *)(v69 + 32);
          if (v70 == 2)
          {
            v71 = *(id *)(v69 + 16);
            v72 = *(id *)(v69 + 8);
            -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v92, v71, (uint64_t)v72, 0);
          }
          else
          {
            if (v70 != 1)
              continue;
            v71 = *(id *)(v69 + 16);
            v72 = *(id *)(v69 + 8);
            -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v92, v71, (uint64_t)v72, 1);
          }

        }
      }
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
    }
    while (v66);
  }

  v73 = (void *)objc_msgSend(v87, "mutableCopy");
  objc_msgSend(v73, "minusSet:", v63);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v74 = v73;
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v99, &v114, 16);
  if (!v75)
    goto LABEL_68;
  v76 = *(_QWORD *)v100;
  do
  {
    for (j = 0; j != v75; ++j)
    {
      if (*(_QWORD *)v100 != v76)
        objc_enumerationMutation(v74);
      v78 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j);
      if (v78)
      {
        v79 = *(_QWORD *)(v78 + 32);
        if (v79 == 2)
        {
          v80 = *(id *)(v78 + 16);
          v81 = *(id *)(v78 + 8);
          -[_UICollectionCompositionalLayoutSolverResolveResult addDeletedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v92, v80, (uint64_t)v81, 0);
        }
        else
        {
          if (v79 != 1)
            continue;
          v80 = *(id *)(v78 + 16);
          v81 = *(id *)(v78 + 8);
          -[_UICollectionCompositionalLayoutSolverResolveResult addDeletedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v92, v80, (uint64_t)v81, 1);
        }

      }
    }
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v99, &v114, 16);
  }
  while (v75);
LABEL_68:

  v10 = v86;
LABEL_69:

  return v92;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForUpdatingSectionDefinitionsWithContainer:(id *)a1
{
  _UICollectionCompositionalLayoutSolverResolveResult *v4;
  void *v6;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveForUpdatingSectionDefinitionsWithContainer_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container != nil"));

    }
    v4 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    objc_storeStrong(a1 + 6, a2);
    -[_UICollectionCompositionalLayoutSolver _solveRetainingPreferredSizes:](a1, 1);
    -[_UICollectionCompositionalLayoutSolverResolveResult setSectionsWereRequeried:](v4, "setSectionsWereRequeried:", 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForMarginsChange:(uint64_t)a1
{
  _UICollectionCompositionalLayoutSolverResolveResult *v4;
  void *v6;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveForMarginsChange_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

    }
    v4 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    objc_storeStrong((id *)(a1 + 48), a2);
    -[_UICollectionCompositionalLayoutSolver _recomputeSolutionBookmarksAndContentSize](a1);
    -[_UICollectionLayoutAuxillaryItemSolver resolve](*(_QWORD *)(a1 + 272));
    -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](a1);
    -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes]((id *)a1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)resolveForScrollViewLayoutAdjustmentsChange:(id *)a1
{
  uint64_t v2;

  if (a1)
  {
    v2 = (uint64_t)a1;
    objc_storeStrong(a1 + 6, a2);
    -[_UICollectionCompositionalLayoutSolver _resolveOptionallyQueryingForSectionDefinitions:retainPreferredSizing:](v2, 1, 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_supportsSwipeActionsForIndexPath:(uint64_t)result
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(a2, "section");
    if (v3 >= objc_msgSend(*(id *)(v2 + 184), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__supportsSwipeActionsForIndexPath_, v2, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1813, CFSTR("Invalid section %@."), v8);

    }
    objc_msgSend(*(id *)(v2 + 184), "objectAtIndexedSubscript:", v3);
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v4 = (_QWORD *)v4[2];
    v6 = objc_msgSend(v4, "_wantsSwipeActions");

    return v6;
  }
  return result;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(uint64_t)a1
{
  unint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if (a1)
  {
    v4 = objc_msgSend(a2, "section");
    if (v4 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__leadingSwipeActionsConfigurationForIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1820, CFSTR("Invalid section %@."), v10);

    }
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v4);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v5 = (_QWORD *)v5[2];
    objc_msgSend(v5, "_leadingSwipeActionsConfigurationForIndexPath:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(uint64_t)a1
{
  unint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  if (a1)
  {
    v4 = objc_msgSend(a2, "section");
    if (v4 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__trailingSwipeActionsConfigurationForIndexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1827, CFSTR("Invalid section %@."), v10);

    }
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v4);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v5 = (_QWORD *)v5[2];
    objc_msgSend(v5, "_trailingSwipeActionsConfigurationForIndexPath:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_updateStyleForSwipeActionsConfiguration:(void *)a3 indexPath:
{
  unint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    v5 = objc_msgSend(a3, "section");
    if (v5 >= objc_msgSend(*(id *)(a1 + 184), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateStyleForSwipeActionsConfiguration_indexPath_, a1, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 1834, CFSTR("Invalid section %@."), v8);

    }
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v5);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (v6)
      v6 = (_QWORD *)v6[2];
    objc_msgSend(v6, "_updateStyleForSwipeActionsConfiguration:", a2);

  }
}

- (void)_willBeginSwiping
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v1 = *(id *)(a1 + 184);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v10;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v10 != v4)
            objc_enumerationMutation(v1);
          v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5);
          if (v6)
            v7 = *(void **)(v6 + 16);
          else
            v7 = 0;
          objc_msgSend(v7, "_willBeginSwiping", (_QWORD)v9);
          ++v5;
        }
        while (v3 != v5);
        v8 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v3 = v8;
      }
      while (v8);
    }

  }
}

- (void)_didEndSwiping
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v1 = *(id *)(a1 + 184);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v10;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v10 != v4)
            objc_enumerationMutation(v1);
          v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5);
          if (v6)
            v7 = *(void **)(v6 + 16);
          else
            v7 = 0;
          objc_msgSend(v7, "_didEndSwiping", (_QWORD)v9);
          ++v5;
        }
        while (v3 != v5);
        v8 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v3 = v8;
      }
      while (v8);
    }

  }
}

- (void)setOrthogonalOffset:(double)a3 forSection:(double)a4
{
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  UICollectionViewLayoutInvalidationContext *v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(*(id *)(a1 + 184), "count") > a2)
  {
    objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)v8;
    if (v8)
      v10 = *(void **)(v8 + 16);
    else
      v10 = 0;
    v11 = v10;
    if (objc_msgSend(v11, "scrollsOrthogonally"))
    {
      if (v9)
        v12 = (void *)v9[1];
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v13, "setOrthogonalOffset:", a3, a4);
      -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v9);
      v14 = (double *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v14[12] = a3;
        v14[13] = a4;
      }

      objc_msgSend(v13, "orthogonalScrollingPrefetchingUnitVector");
      v16 = v15;
      v18 = v17;

      -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v9);
      v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v19[10] = v16;
        v19[11] = v18;
      }

    }
    if (*(_QWORD *)(a1 + 136))
    {
      v20 = objc_alloc_init(UICollectionViewLayoutInvalidationContext);
      -[UICollectionViewLayoutInvalidationContext _setIntent:](v20, "_setIntent:", 6);
      if (objc_msgSend(v11, "_hasVisibleItemsHandler"))
      {
        -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v9);
        v21 = (double *)objc_claimAutoreleasedReturnValue();
        v35 = v11;
        v36 = v9;
        if (v21)
        {
          v23 = v21[14];
          v22 = v21[15];
          v24 = v21[16];
          v25 = v21[17];
        }
        else
        {
          v22 = 0.0;
          v24 = 0.0;
          v25 = 0.0;
          v23 = 0.0;
        }

        -[_UICollectionCompositionalLayoutSolver mutatedVisibleItemsForElementsForVisibleBounds:](a1, v23, v22, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v38 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              if (objc_msgSend(v31, "representedElementCategory", v35, v36))
              {
                if (objc_msgSend(v31, "representedElementCategory") == 1)
                {
                  objc_msgSend(v31, "representedElementKind");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "indexPath");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = v33;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UICollectionViewLayoutInvalidationContext invalidateSupplementaryElementsOfKind:atIndexPaths:](v20, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v32, v34);
                }
                else
                {
                  if (objc_msgSend(v31, "representedElementCategory") != 2)
                    continue;
                  objc_msgSend(v31, "representedElementKind");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "indexPath");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v33;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UICollectionViewLayoutInvalidationContext invalidateDecorationElementsOfKind:atIndexPaths:](v20, "invalidateDecorationElementsOfKind:atIndexPaths:", v32, v34);
                }

              }
              else
              {
                objc_msgSend(v31, "indexPath");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v32;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[UICollectionViewLayoutInvalidationContext invalidateItemsAtIndexPaths:](v20, "invalidateItemsAtIndexPaths:", v33);
              }

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
          }
          while (v28);
        }

        v11 = v35;
        v9 = v36;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();

    }
  }
}

- (BOOL)elementShouldAppearAboveOrthogonalScrollingContainer:(uint64_t)a1
{
  _BOOL8 v2;
  void *v5;
  void *v6;
  uint64_t v8;
  id *v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;

  v2 = 0;
  if (a1 && a2)
  {
    objc_msgSend((id)a2, "indexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || !*(_BYTE *)(a1 + 13) || (*(_WORD *)(a2 + 288) & 3) != 0)
      goto LABEL_6;
    if (objc_msgSend(v5, "length") == 1)
    {
      if (objc_msgSend((id)a2, "zIndex") >= 1)
      {
        v8 = objc_msgSend(v6, "indexAtPosition:", 0);
        v9 = (id *)*(id *)(a1 + 272);
        v10 = *(id *)(a2 + 8);
        -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v9, v10, v8);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v2 = v11 != 0;
LABEL_12:

        goto LABEL_7;
      }
    }
    else if (objc_msgSend(v6, "length") == 2
           && dyld_program_sdk_at_least()
           && objc_msgSend((id)a2, "zIndex") >= 1)
    {
      v12 = objc_msgSend(v6, "section");
      v11 = *(id *)(a1 + 184);
      if (objc_msgSend(v11, "count") <= v12)
      {
        v2 = 0;
      }
      else
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = *(void **)(v13 + 8);
        else
          v15 = 0;
        v16 = v15;
        v17 = objc_msgSend(v6, "item");
        v18 = *(id *)(a2 + 8);
        objc_msgSend(v16, "sectionSupplementaryFrameWithKind:index:", v18, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v2 = v19 != 0;
      }
      goto LABEL_12;
    }
LABEL_6:
    v2 = 0;
LABEL_7:

  }
  return v2;
}

- (id)_fetchUpdatedSectionDefinitionsFromSectionProvider
{
  uint64_t v3;
  _UICollectionLayoutContainer *v4;
  _UICollectionLayoutContainer *container;
  _UICollectionLayoutContainer *v6;
  uint64_t v7;
  void *v8;
  _UICollectionCompositionalLayoutSolverOptions *options;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void (**sectionProvider)(id, _UICollectionLayoutContainer *, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  const char *v27;
  _BYTE __dst[352];
  _BYTE v29[352];
  _OWORD __src[23];

  if (!self || !self->_sectionProvider)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.sectionProvider != NULL"));

  }
  if (!self->_container)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_container != nil"));

  }
  v3 = -[_UIDataSourceSnapshotter numberOfSections](self->_dataSourceSnapshot, "numberOfSections");
  v4 = self->_container;
  if (dyld_program_sdk_at_least())
  {
    container = self->_container;
    if (container)
      container = (_UICollectionLayoutContainer *)container->_insetsEnvironment;
    v6 = container;
    -[_UICollectionLayoutContainer contentSize](self->_container, "contentSize");
    -[_UICollectionLayoutContainer layoutContainerForContainerSize:layoutAxis:](v6, "layoutContainerForContainerSize:layoutAxis:", self->_layoutAxis);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (_UICollectionLayoutContainer *)v7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  options = self->_options;
  if (options && (v10 = options->_traitCollectionSourceProvider) != 0)
  {
    v11 = v10;
    v12 = (void *)(*((uint64_t (**)(void))v10 + 2))();
    v14 = v13;

    memset(__src, 0, 352);
    v27 = v14;
    if (v12)
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2234, CFSTR("Compositional layout internal error: trait collection source has a view (%@) but no invalidation action"), v12);

      }
      _UIBeginTrackingTraitUsage(v12, 0, __src);
      v15 = 0;
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v27 = 0;
    v12 = 0;
    v15 = 1;
    memset(__src, 0, 352);
  }
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if (self)
        sectionProvider = (void (**)(id, _UICollectionLayoutContainer *, _QWORD))self->_sectionProvider;
      else
        sectionProvider = 0;
      sectionProvider[2](sectionProvider, v4, i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "copy");

      if (!v22)
      {
        if (-[_UIDataSourceSnapshotter numberOfItemsInSection:](self->_dataSourceSnapshot, "numberOfItemsInSection:", i))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2243, CFSTR("Invalid section definition. Please specify a valid section definition when content is to be rendered for a section. This is a client error."));

        }
        objc_msgSend(off_1E16799A0, "_emptySection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "addObject:", v22);

    }
  }
  if ((v15 & 1) == 0)
  {
    memcpy(__dst, __src, sizeof(__dst));
    v24 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(v29, v24, sizeof(v29));
    memcpy(v24, __dst, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:]((uint64_t *)v12, (uint64_t)&v29[136], -[_UICollectionCompositionalLayoutSolver methodForSelector:](self, "methodForSelector:", sel__fetchUpdatedSectionDefinitionsFromSectionProvider), v27);
    _UITraitUsageTrackingResultDestroy((uint64_t)v29);
  }

  return v8;
}

+ (CGFloat)_globalFrameForSolutionFrame:(CGFloat)a3 solutionGlobalFrame:(CGFloat)a4 contentInsetsOffset:(double)a5 container:(uint64_t)a6
{
  uint64_t v20;
  double v21;
  CGFloat v22;
  uint64_t v24;
  void *v25;
  CGRect v26;
  CGRect v27;

  v20 = objc_opt_self();
  if (!a7)
  {
    v24 = v20;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__globalFrameForSolutionFrame_solutionGlobalFrame_contentInsetsOffset_container_, v24, CFSTR("_UICollectionCompositionalLayoutSolver.m"), 2977, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container != nil"));

  }
  objc_opt_self();
  objc_msgSend(a7, "effectiveContentInsets");
  v22 = a1 + a5 + a11 + v21 + *MEMORY[0x1E0C9D538];
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetWidth(v26);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  CGRectGetHeight(v27);
  return v22;
}

- (CGRect)auxillaryHostPinningRect
{
  double y;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  double width;
  double height;
  double x;
  CGRect result;

  y = 0.0;
  if (self)
  {
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
    width = 0.0;
    height = 0.0;
    x = 0.0;
    if (sectionGeometryTranslator)
    {
      x = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.x;
      y = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.y;
      width = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.width;
      height = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.height;
    }
  }
  else
  {
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return 0;
}

- (CGRect)_dynamicReferenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = -[_UICollectionCompositionalLayoutSolver contentSize]((uint64_t)self);
  v4 = v3;
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v4;
  result.size.width = v2;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

@end
