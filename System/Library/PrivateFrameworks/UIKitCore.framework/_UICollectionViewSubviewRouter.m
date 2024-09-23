@implementation _UICollectionViewSubviewRouter

- (void)addControlledSubview:(int64_t)a3 zIndex:(int64_t)a4 orderMode:
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _UICollectionViewSubviewRouterBookmark *v29;
  void *v30;
  id *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[9];
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  if (!a1)
    return;
  v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (!a2 || !v8)
    goto LABEL_41;
  if (!*(_BYTE *)(a1 + 32))
  {
    if (a4 == -10000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel_addControlledSubview_zIndex_orderMode_, a1, CFSTR("_UICollectionViewSubviewRouter.m"), 69, CFSTR("UICollectionView internal inconsistency: a controlled subview must specify its position in relation to containers. View: %@"), a2);

    }
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a2);
    v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      if (v24[2] == a3 && v24[3] == a4)
      {
        v26 = 0;
LABEL_30:
        v50 = 0;
        v51 = &v50;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__184;
        v54 = __Block_byref_object_dispose__184;
        v55 = 0;
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v42 = 0;
        v43 = &v42;
        v44 = 0x2020000000;
        v45 = 0;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __72___UICollectionViewSubviewRouter_addControlledSubview_zIndex_orderMode___block_invoke;
        v40[3] = &unk_1E16E3748;
        v40[7] = a4;
        v40[8] = a3;
        v41 = v26;
        v40[4] = &v50;
        v40[5] = &v42;
        v40[6] = &v46;
        -[_UICollectionViewSubviewRouter enumerateBookmarksWithEnumerator:](a1, (uint64_t)v40);
        v27 = v51[5];
        if (!v27)
        {
          v28 = objc_opt_self();
          if (a4 == -10000)
          {
            v36 = v28;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel_bookmarkForControlledSubviewsWithZIndex_orderMode_, v36, CFSTR("_UICollectionViewSubviewRouter.m"), 483, CFSTR("UICollectionView internal inconsistency: a controlled subview bookmark must specify its position in relation to containers."));

          }
          v29 = objc_alloc_init(_UICollectionViewSubviewRouterBookmark);
          if (v29)
          {
            v29->_zIndex = a3;
            v29->_orderMode = a4;
            v29->_count = 1;
          }
          v30 = (void *)v51[5];
          v51[5] = (uint64_t)v29;

          objc_msgSend(*(id *)(a1 + 8), "insertObject:atIndex:", v51[5], v47[3]);
          v27 = v51[5];
        }
        objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v27, a2);
        v32 = *(void **)(a1 + 24);
        v31 = (id *)(a1 + 24);
        v33 = v32;
        objc_storeStrong(v31, a2);
        objc_msgSend(v9, "_addSubview:positioned:relativeTo:", a2, v43[3], 0);
        v34 = *v31;
        *v31 = v33;

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        goto LABEL_41;
      }
      --v24[1];
    }
    v26 = 1;
    goto LABEL_30;
  }
  objc_opt_class();
  v10 = objc_opt_class();
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (!v11)
    goto LABEL_40;
  -[UIView _subviewAtIndex:](v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_26;
  v38 = v9;
  v39 = a3;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = -1;
  while (1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "_layoutAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "zIndex");

      if (v19 > v39)
        goto LABEL_18;
      v16 |= v13 == a2;
      v15 = 1;
      goto LABEL_13;
    }
    if (!objc_msgSend(v13, "isMemberOfClass:", v10))
      break;
    v16 |= v13 == a2;
LABEL_13:
    v17 = v14;
LABEL_14:
    -[UIView _subviewAtIndex:](v12, ++v14);
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v20;
    if (!v20)
      goto LABEL_18;
  }
  if ((dyld_program_sdk_at_least() & 1) != 0 || ((v15 ^ 1) & 1) != 0)
    goto LABEL_14;
LABEL_18:
  v9 = v38;
  if ((v17 & 0x8000000000000000) == 0)
  {
    v21 = v17 + ((v16 & 1) == 0);
    v22 = v12;
    v23 = a2;
    goto LABEL_38;
  }
LABEL_26:
  if (objc_msgSend(v12, "__isKindOfUIScrollView"))
  {
    objc_msgSend(v12, "_addContentSubview:atBack:", a2, 1);
  }
  else
  {
    v22 = v12;
    v23 = a2;
    v21 = 0;
LABEL_38:
    objc_msgSend(v22, "insertSubview:atIndex:", v23, v21);
  }

LABEL_40:
LABEL_41:

}

- (void)enumerateBookmarksWithEnumerator:(uint64_t)a1
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;

  v4 = 0;
  v5 = 0;
  v8 = 0;
  do
  {
    if (v4 >= objc_msgSend(*(id *)(a1 + 8), "count"))
      break;
    objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (_QWORD *)v6;
    if (v6 && *(_QWORD *)(v6 + 8))
    {
      (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, char *))(a2 + 16))(a2, v6, v4, v5, &v8);
      v5 += v7[1];
      ++v4;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 8), "removeObjectAtIndex:", v4);
    }

  }
  while (!v8);
}

- (uint64_t)shouldAddSubview:(uint64_t *)a3 atPosition:(uint64_t)a4 relativeTo:(int)a5 creatingBookmarkIfNecessary:
{
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  if (!a1)
    return 0;
  v10 = *(id *)(a1 + 40);
  v11 = v10;
  v12 = 0;
  if (a2 && v10)
  {
    if (!*(_BYTE *)(a1 + 32) && *(_QWORD *)(a1 + 24) != a2 && (*((_QWORD *)v10 + 14) & 0x400000) == 0)
    {
      objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a2);
      v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        if (v14[3] != -10000)
        {

LABEL_18:
          v12 = 0;
          goto LABEL_6;
        }
      }
      else
      {
        if (!a5)
          goto LABEL_18;
        +[_UICollectionViewSubviewRouterBookmark bookmarkForUncontrolledSubview]();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v15, a2);
      }
      objc_msgSend(v11, "subviews");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      objc_msgSend(*(id *)(a1 + 16), "objectForKey:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a3;
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v49 = -1;
      v42 = 0;
      v43 = &v42;
      v44 = 0x2020000000;
      v45 = -1;
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __101___UICollectionViewSubviewRouter_shouldAddSubview_atPosition_relativeTo_creatingBookmarkIfNecessary___block_invoke;
      v29[3] = &unk_1E16E3770;
      v33 = &v46;
      v20 = v15;
      v30 = v20;
      v31 = a1;
      v34 = &v42;
      v35 = &v38;
      v36 = v19;
      v37 = v17;
      v21 = v18;
      v32 = v21;
      -[_UICollectionViewSubviewRouter enumerateBookmarksWithEnumerator:](a1, (uint64_t)v29);
      v22 = objc_msgSend(*(id *)(a1 + 8), "count");
      v23 = v43;
      v24 = v43[3];
      if ((v24 & 0x8000000000000000) != 0)
      {
        if (v19 <= -3)
          v25 = 0;
        else
          v25 = v22;
        v43[3] = v25;
        if (v19 <= -3)
          v26 = 0;
        else
          v26 = v17;
        v39[3] = v26;
      }
      else if (v24 > v22)
      {
        v43[3] = v22;
      }
      if ((v47[3] & 0x8000000000000000) == 0)
      {
        objc_msgSend(*(id *)(a1 + 8), "removeObjectAtIndex:");
        v23 = v43;
        v27 = v43[3];
        if (v47[3] < v27)
        {
          v43[3] = v27 - 1;
          if (v20)
            v28 = v20[1];
          else
            v28 = 0;
          v39[3] -= v28;
        }
      }
      objc_msgSend(*(id *)(a1 + 8), "insertObject:atIndex:", v20, v23[3]);
      *a3 = v39[3];

      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(&v46, 8);

    }
    v12 = 1;
  }
LABEL_6:

  return v12;
}

- (BOOL)shouldAddSubview:(id)a3 atPosition:(int64_t *)a4 relativeTo:(id)a5
{
  return -[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:creatingBookmarkIfNecessary:]((uint64_t)self, (uint64_t)a3, a4, (uint64_t)a5, 1);
}

- (void)addContainerView:(uint64_t)a1
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 32))
      objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", a2, 0);
    else
      -[_UICollectionViewSubviewRouter addControlledSubview:zIndex:orderMode:](a1, a2, 0, 0);
  }
}

- (BOOL)shouldBringSubviewToFront:(id)a3
{
  _UICollectionViewSubviewRouter *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  v4 = self;
  if (self)
    self = (_UICollectionViewSubviewRouter *)self->_container;
  -[_UICollectionViewSubviewRouter subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v8 = v6;
  return -[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:creatingBookmarkIfNecessary:]((uint64_t)v4, (uint64_t)a3, &v8, 0, 0);
}

- (id)initWithContainer:(void *)a1
{
  id v2;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  objc_super v13;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithContainer_, v2, CFSTR("_UICollectionViewSubviewRouter.m"), 37, CFSTR("_UICollectionViewSubviewRouter should be initialized with a view containing zero subviews. View: %@"), a2);

    }
    v13.receiver = v2;
    v13.super_class = (Class)_UICollectionViewSubviewRouter;
    v6 = objc_msgSendSuper2(&v13, sel_init);
    v2 = v6;
    if (v6)
    {
      v6[5] = a2;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
      v8 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v7;

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 0);
      v10 = (void *)*((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 2) = v9;

      *((_BYTE *)v2 + 32) = dyld_program_sdk_at_least() ^ 1;
    }
  }
  return v2;
}

- (uint64_t)setContainer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_setContainer_, v3, CFSTR("_UICollectionViewSubviewRouter.m"), 49, CFSTR("UICollectionView internal inconsistency: the _UICollectionViewSubviewRouter's view should initially contain zero subviews. View: %@"), a2);

    }
    *(_QWORD *)(v3 + 40) = a2;
    objc_msgSend(*(id *)(v3 + 8), "removeAllObjects");
    return objc_msgSend(*(id *)(v3 + 16), "removeAllObjects");
  }
  return result;
}

- (void)willRemoveSubview:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  if (!self || !self->_useLegacyRouting)
  {
    -[NSMapTable objectForKey:](self->_subviewToBookmarkMap, "objectForKey:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)v6;
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 8);
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewSubviewRouter.m"), 376, CFSTR("UICollectionView internal inconsistency: attempted to remove a subview from an empty _UICollectionViewSubviewRouterBookmark. Please file a bug against UICollectionView."));

        v6 = (uint64_t)v9;
        v7 = v9[1];
      }
      *(_QWORD *)(v6 + 8) = v7 - 1;
    }
    -[NSMapTable removeObjectForKey:](self->_subviewToBookmarkMap, "removeObjectForKey:", a3);

  }
}

- (BOOL)shouldSendSubviewToBack:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:creatingBookmarkIfNecessary:]((uint64_t)self, (uint64_t)a3, &v4, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedUpdateView, 0);
  objc_storeStrong((id *)&self->_subviewToBookmarkMap, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

- (BOOL)shouldExchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  UIView *v8;
  UIView *v9;
  BOOL v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  NSMapTable *subviewToBookmarkMap;
  void *v16;
  _QWORD *v17;
  NSMapTable *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD *(*v26)(_QWORD *, uint64_t, uint64_t, uint64_t, BOOL *);
  void *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  if (!self)
  {
    v9 = 0;
    goto LABEL_25;
  }
  v8 = self->_container;
  v9 = v8;
  if (!v8)
  {
LABEL_25:
    v10 = 0;
    goto LABEL_26;
  }
  if (!self->_useLegacyRouting)
  {
    -[UIView subviews](v8, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3 < 0)
    {
      v10 = 0;
LABEL_22:

      goto LABEL_26;
    }
    v13 = objc_msgSend(v11, "count");
    v10 = 0;
    if (a4 < 0)
      goto LABEL_22;
    if (v13 <= a3)
      goto LABEL_22;
    v14 = objc_msgSend(v12, "count");
    v10 = 0;
    if (a3 == a4 || v14 <= a4)
      goto LABEL_22;
    subviewToBookmarkMap = self->_subviewToBookmarkMap;
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](subviewToBookmarkMap, "objectForKey:", v16);
    v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v18 = self->_subviewToBookmarkMap;
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v18, "objectForKey:", v19);
    v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v17 && v20
      || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewSubviewRouter.m"), 342, CFSTR("UICollectionView internal inconsistency: attempted to exchange subviews that do not have an associated _UICollectionViewSubviewRouterBookmark. Please file a bug against UICollectionView.")), v21, v17))
    {
      v10 = 0;
      if (v17[3] != -10000 || !v20)
        goto LABEL_21;
      if (v20[3] == -10000)
      {
        v36 = 0;
        v37 = &v36;
        v38 = 0x2020000000;
        v39 = -1;
        v32 = 0;
        v33 = &v32;
        v34 = 0x2020000000;
        v35 = -1;
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __82___UICollectionViewSubviewRouter_shouldExchangeSubviewAtIndex_withSubviewAtIndex___block_invoke;
        v27 = &unk_1E16E3798;
        v30 = &v36;
        v28 = v17;
        v31 = &v32;
        v29 = v20;
        -[_UICollectionViewSubviewRouter enumerateBookmarksWithEnumerator:]((uint64_t)self, (uint64_t)&v24);
        if (v37[3] < 0 || v33[3] < 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v24, v25, v26, v27, v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewSubviewRouter.m"), 362, CFSTR("UICollectionView internal inconsistency: attempted to exchange subviews that do not have an associated _UICollectionViewSubviewRouterBookmark index. Please file a bug against UICollectionView."));

        }
        -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_bookmarks, "exchangeObjectAtIndex:withObjectAtIndex:", v24, v25, v26, v27);

        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        v10 = 1;
        goto LABEL_21;
      }
    }
    v10 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v10 = 1;
LABEL_26:

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  UIView *v5;
  _BOOL8 useLegacyRouting;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *container;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self)
  {
    v5 = self->_container;
    useLegacyRouting = self->_useLegacyRouting;
  }
  else
  {
    v5 = 0;
    useLegacyRouting = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p container = %@; legacyRouting = %d; bookmarks = {"),
    v4,
    self,
    v5,
    useLegacyRouting);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = self->_bookmarks;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v12), "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("\n    %@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "stringByAppendingString:", CFSTR("\n}; subviews = {"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  if (self)
    container = self->_container;
  else
    container = 0;
  -[UIView subviews](container, "subviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      v24 = v17;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23);
        -[NSMapTable objectForKey:](self->_subviewToBookmarkMap, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n    <%@: %p bookmark: %p>"), v25, objc_opt_class(), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringByAppendingString:", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        ++v23;
        v24 = v17;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  objc_msgSend(v17, "stringByAppendingString:", CFSTR("\n}>"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
