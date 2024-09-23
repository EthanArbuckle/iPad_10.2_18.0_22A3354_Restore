@implementation TUILayout

+ (void)initialize
{
  unsigned int *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((id)objc_opt_class(TUILayout) == a1)
  {
    if (qword_2CB730 != -1)
      dispatch_once(&qword_2CB730, &stru_2418A0);
    v2 = (unsigned int *)objc_msgSend((id)qword_2CB728, "bytes");
    v3 = v2[1];
    if ((_DWORD)v3)
    {
      v4 = (const char *)v2;
      v5 = 0;
      v6 = (char *)(v2 + 2);
      while (strcmp("layout", &v4[*(unsigned int *)&v6[v5]]))
      {
        v5 += 4;
        if (4 * v3 == v5)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v7 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + v5]];
LABEL_11:
      v9 = 0;
      TUILayoutStorageDataset = v7;
      while (strcmp("imagelayout", &v4[*(unsigned int *)&v6[4 * v9]]))
      {
        if (v3 == ++v9)
        {
          v8 = 0;
          goto LABEL_16;
        }
      }
      v8 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v9]];
    }
    else
    {
      v8 = 0;
      TUILayoutStorageDataset = 0;
    }
LABEL_16:
    TUIImageLayoutStorageDataset = v8;
  }
}

- (id)recursiveDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = objc_autoreleasePoolPush();
  sub_FDDCC(self, v3, 0);
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (id)cachedRenderModel
{
  return -[TUIRenderModelTransform submodel](self->_cachedTransformModel, "submodel");
}

- (CGAffineTransform)specifiedTransform
{
  CGAffineTransform *result;
  __int128 v4;

  result = (CGAffineTransform *)self->_model;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return result;
}

- (CGAffineTransform)renderTransform
{
  CGAffineTransform *result;
  __int128 v4;

  result = (CGAffineTransform *)self->_model;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform renderTransform](result, "renderTransform");
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return result;
}

- (void)setSpecifiedWidthComputeInherited:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_flags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 512;
    else
      v3 = 0;
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
    -[TUILayout onSpecifiedWidthChanged](self, "onSpecifiedWidthChanged");
  }
}

- (BOOL)specifiedWidthComputeInherited
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)setSpecifiedWidthModified:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_flags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 1024;
    else
      v3 = 0;
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
    -[TUILayout onSpecifiedWidthChanged](self, "onSpecifiedWidthChanged");
  }
}

- (BOOL)specifiedWidthModified
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setSpecifiedHeightComputeInherited:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_flags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 2048;
    else
      v3 = 0;
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
    -[TUILayout onSpecifiedHeightChanged](self, "onSpecifiedHeightChanged");
  }
}

- (void)onSpecifiedWidthChanged
{
  id v3;

  -[TUILayout invalidateLayout](self, "invalidateLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  objc_msgSend(v3, "onSpecifiedWidthChangedForChild:", self);

}

- (void)onSpecifiedHeightChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  objc_msgSend(v3, "onSpecifiedHeightChangedForChild:", self);

}

- (BOOL)specifiedHeightComputeInherited
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth
{
  TUIModelLayoutable *model;
  uint64_t v5;
  $2E822BB417F7D1609F669B00B90D7CC3 flags;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v7;
  void *v8;

  model = self->_model;
  if (model)
    v5 = (uint64_t)-[TUIModelLayoutable width](model, "width");
  else
    v5 = 0x7FC000007FC00000;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
    v7 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v8, "modifiedSpecifiedWidthForChild:", self);

  }
  else if ((*(_WORD *)&flags & 0x200) != 0)
  {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 & 0xFFFFFFFF00000000 | 0x7FC00000);
  }
  else
  {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)v5;
  }
  return v7;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  TUIModelLayoutable *model;
  $881BB7C90C7D0DFCC1492E3DC022A30F *result;

  model = self->_model;
  if (model)
    result = ($881BB7C90C7D0DFCC1492E3DC022A30F *)-[TUIModelLayoutable height](model, "height");
  else
    result = ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)((unint64_t)result & 0xFFFFFFFF00000000 | 0x7FC00000);
  return result;
}

+ (const)_storageDataset
{
  return (const Dataset *)TUILayoutStorageDataset;
}

- (TUILayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUILayout *v12;
  TUILayout *v13;
  id v14;
  unsigned int *p_flags;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  id WeakRetained;
  int v22;
  id v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int8 v27;
  int v28;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)TUILayout;
  v12 = -[TUILayout init](&v30, "init");
  v13 = v12;
  if (!v12)
    goto LABEL_23;
  v12->_storage._data = (unint64_t)objc_msgSend((id)objc_opt_class(v12), "_storageDataset") | 1;
  v14 = v9;
  objc_storeStrong((id *)&v13->_model, a3);
  objc_storeWeak((id *)&v13->_parent, v10);
  objc_storeWeak((id *)&v13->_controller, v11);
  p_flags = (unsigned int *)&v13->_flags;
  bzero(&v13->_flags, 8uLL);
  if (v14)
  {
    objc_msgSend(v14, "width");
    v17 = v16;
    objc_msgSend(v14, "height");
    v19 = v18;
    if (v10)
    {
LABEL_4:
      v20 = *p_flags & 0xFFFFFDFF;
      *p_flags = v20;
      goto LABEL_18;
    }
  }
  else
  {
    v17 = 0x200007FC00000;
    v19 = 0x200007FC00000;
    if (v10)
      goto LABEL_4;
  }
  if ((v17 & 0x6000000000000) == 0x2000000000000)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v13->_controller);
    if (objc_msgSend(WeakRetained, "shouldRootLayoutInheritWidthWhenAuto"))
      v22 = 512;
    else
      v22 = 0;
    *p_flags = *p_flags & 0xFFFFFDFF | v22;

  }
  else
  {
    *p_flags &= ~0x200u;
  }
  if ((v19 & 0x6000000000000) == 0x2000000000000)
  {
    v23 = objc_loadWeakRetained((id *)&v13->_controller);
    if (objc_msgSend(v23, "shouldRootLayoutInheritHeightWhenAuto"))
      v24 = 2048;
    else
      v24 = 0;
    *p_flags = *p_flags & 0xFFFFF7FF | v24;

    v25 = *p_flags;
    goto LABEL_19;
  }
  v20 = *p_flags;
LABEL_18:
  v25 = v20 & 0xFFFFF7FF;
  *p_flags = v25;
LABEL_19:
  v26 = v25 & 0xFFFF0FCF | 0x30;
  *p_flags = v26;
  if (v14)
  {
    v27 = objc_msgSend(v14, "layoutDirection");
    v26 = *p_flags;
    v28 = (v27 & 3) << 7;
  }
  else
  {
    v28 = 0;
  }
  v13->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(v28 | v26 & 0xFFFFFE7F);
  -[TUILayout updateGuides](v13, "updateGuides");

LABEL_23:
  return v13;
}

- (void)updateParent:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parent, obj);
    v5 = obj;
    *(_DWORD *)&self->_flags &= ~0x400u;
  }

}

- (TUIBox)box
{
  return (TUIBox *)self->_model;
}

- (BOOL)isLayout
{
  return 1;
}

- (void)validateGuides
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  -[TUILayout updateGuides](self, "updateGuides");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "validateGuides");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)updateGuides
{
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guides"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideProvider](self, "guideProvider"));
  if (v23 && v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leading"));
    v6 = v5;
    if (!v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v6));
    -[TUILayout setGuideLeading:](self, "setGuideLeading:", v7);

    if (!v5)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailing"));
    v9 = v8;
    if (!v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v9));
    -[TUILayout setGuideTrailing:](self, "setGuideTrailing:", v10);

    if (!v8)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "top"));
    v12 = v11;
    if (!v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v12));
    -[TUILayout setGuideTop:](self, "setGuideTop:", v13);

    if (!v11)
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottom"));
    v15 = v14;
    if (!v14)
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 3));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v15));
    -[TUILayout setGuideBottom:](self, "setGuideBottom:", v16);

    if (v14)
      goto LABEL_22;
  }
  else
  {
    if (!v4)
    {
      -[TUILayout setGuideLeading:](self, "setGuideLeading:", 0);
      -[TUILayout setGuideTrailing:](self, "setGuideTrailing:", 0);
      -[TUILayout setGuideTop:](self, "setGuideTop:", 0);
      -[TUILayout setGuideBottom:](self, "setGuideBottom:", 0);
      goto LABEL_23;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v17));
    -[TUILayout setGuideLeading:](self, "setGuideLeading:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v19));
    -[TUILayout setGuideTrailing:](self, "setGuideTrailing:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v21));
    -[TUILayout setGuideTop:](self, "setGuideTop:", v22);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultGuideSpecForLayout:edge:", self, 3));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideForLayout:spec:", self, v14));
    -[TUILayout setGuideBottom:](self, "setGuideBottom:", v15);
  }

LABEL_22:
LABEL_23:

}

- (TUILayout)layoutAncestor
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layout"));

  return (TUILayout *)v3;
}

- (void)enumerateLayout:(id)a3
{
  (*((void (**)(id, TUILayout *))a3 + 2))(a3, self);
}

- (void)enumerateChildren:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_containers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "enumerateLayout:", v4, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateChildren
{
  NSMutableArray *v3;
  NSArray *v4;
  NSArray *children;
  _QWORD v6[4];
  NSMutableArray *v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_FECC4;
  v6[3] = &unk_241830;
  v3 = objc_opt_new(NSMutableArray);
  v7 = v3;
  -[TUILayout enumerateChildren:](self, "enumerateChildren:", v6);
  v4 = (NSArray *)-[NSMutableArray copy](v3, "copy");
  children = self->_children;
  self->_children = v4;

}

- (void)setHidden:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hidden
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unint64_t)specifiedLayoutDirection
{
  return ((unint64_t)self->_flags >> 7) & 3;
}

- (void)setSpecifiedLayoutDirection:(unint64_t)a3
{
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFE7F | ((a3 & 3) << 7));
}

- (unint64_t)computedLayoutDirection
{
  id v2;
  id WeakRetained;
  void *v5;

  v2 = (id)(((unint64_t)self->_flags >> 7) & 3);
  if (!(_DWORD)v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

    if (WeakRetained)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
      v2 = objc_msgSend(v5, "computedLayoutDirection");

    }
    else
    {
      return 1;
    }
  }
  return (unint64_t)v2;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidth
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *DataForKey;
  uint64_t v9;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v10;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v4 = -[TUILayout computeIntrinsicWidth](self, "computeIntrinsicWidth");
    v6 = v5;
    if ((v5 & 0x7000000000000) == 0x2000000000000)
    {
      v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 1u);
      if (v7)
      {
        DataForKey = (_QWORD *)v7;
        TUI::Util::PartialStruct::Storage::markAsDefault(&self->_storage._data, 1u);
LABEL_6:
        *DataForKey = v4;
        DataForKey[1] = v6;
      }
    }
    else
    {
      DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 1u, 0x10uLL, 1);
      if (DataForKey)
        goto LABEL_6;
    }
    *(_DWORD *)&self->_flags &= ~0x10u;
  }
  v9 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 1u);
  v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v9)
    v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v9;
  return *v10;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeight
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *DataForKey;
  uint64_t v9;
  $881BB7C90C7D0DFCC1492E3DC022A30F **v10;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    v4 = -[TUILayout computeIntrinsicHeight](self, "computeIntrinsicHeight");
    v6 = v5;
    if ((v5 & 0x7000000000000) == 0x2000000000000)
    {
      v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xCu);
      if (v7)
      {
        DataForKey = (_QWORD *)v7;
        TUI::Util::PartialStruct::Storage::markAsDefault(&self->_storage._data, 0xCu);
LABEL_6:
        *DataForKey = v4;
        DataForKey[1] = v6;
      }
    }
    else
    {
      DataForKey = (_QWORD *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0xCu, 0x10uLL, 1);
      if (DataForKey)
        goto LABEL_6;
    }
    *(_DWORD *)&self->_flags &= ~0x20u;
  }
  v9 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xCu);
  v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v9)
    v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v9;
  return *v10;
}

- (CGSize)validatedIntrinsicSize
{
  float v3;
  float v4;
  double v5;
  double v6;
  CGSize result;

  v3 = COERCE_FLOAT(-[TUILayout validatedIntrinsicWidthConsideringSpecified](self, "validatedIntrinsicWidthConsideringSpecified"));
  v4 = COERCE_FLOAT(-[TUILayout validatedIntrinsicHeightConsideringSpecified](self, "validatedIntrinsicHeightConsideringSpecified"));
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setGuideLeading:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 9u, (objc_object *)a3);
}

- (TUIGuide)guideLeading
{
  return (TUIGuide *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 9u);
}

- (void)setGuideTrailing:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 8u, (objc_object *)a3);
}

- (TUIGuide)guideTrailing
{
  return (TUIGuide *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 8u);
}

- (void)setGuideTop:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 3u, (objc_object *)a3);
}

- (TUIGuide)guideTop
{
  return (TUIGuide *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 3u);
}

- (void)setGuideBottom:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 4u, (objc_object *)a3);
}

- (TUIGuide)guideBottom
{
  return (TUIGuide *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 4u);
}

- (void)setGuideLayoutController:(id)a3
{
  TUI::Util::PartialStruct::Storage::setObjectForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0xBu, (objc_object *)a3);
}

- (TUIGuideLayoutController)guideLayoutController
{
  return (TUIGuideLayoutController *)TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xBu);
}

- (void)setFlexedWidth:(double)a3
{
  TUI::Util::PartialStruct::Storage::Header **p_storage;
  float *v6;
  double v7;
  float v8;
  float *DataForKey;

  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 6u);
  if (v6)
    v7 = *v6;
  else
    v7 = NAN;
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 6u, 4uLL, 1);
    if (DataForKey)
      *DataForKey = v8;
    -[TUILayout invalidateLayout](self, "invalidateLayout");
  }
}

- (double)flexedWidth
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 6u);
  if (v2)
    return *v2;
  else
    return NAN;
}

- (void)setFlexedHeight:(double)a3
{
  TUI::Util::PartialStruct::Storage::Header **p_storage;
  float *v6;
  double v7;
  float v8;
  float *DataForKey;

  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 5u);
  if (v6)
    v7 = *v6;
  else
    v7 = NAN;
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 5u, 4uLL, 1);
    if (DataForKey)
      *DataForKey = v8;
    -[TUILayout invalidateLayout](self, "invalidateLayout");
  }
}

- (double)flexedHeight
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 5u);
  if (v2)
    return *v2;
  else
    return NAN;
}

- (void)setContainingWidth:(double)a3
{
  TUI::Util::PartialStruct::Storage::Header **p_storage;
  float *v6;
  double v7;
  float v8;
  float *DataForKey;

  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  if (v6)
    v7 = *v6;
  else
    v7 = NAN;
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 0, 4uLL, 1);
    if (DataForKey)
      *DataForKey = v8;
    -[TUILayout onContainingWidthChange](self, "onContainingWidthChange");
    -[TUILayout invalidateLayout](self, "invalidateLayout");
  }
}

- (double)containingWidth
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  if (v2)
    return *v2;
  else
    return NAN;
}

- (void)setContainingMaxWidth:(double)a3
{
  TUI::Util::PartialStruct::Storage::Header **p_storage;
  float *v6;
  double v7;
  float v8;
  float *DataForKey;

  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 2u);
  if (v6)
    v7 = *v6;
  else
    v7 = NAN;
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 2u, 4uLL, 1);
    if (DataForKey)
      *DataForKey = v8;
    -[TUILayout invalidateLayout](self, "invalidateLayout");
  }
}

- (double)containingMaxWidth
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 2u);
  if (v2)
    return *v2;
  else
    return NAN;
}

- (void)setContainingHeight:(double)a3
{
  TUI::Util::PartialStruct::Storage::Header **p_storage;
  float *v6;
  double v7;
  float v8;
  float *DataForKey;

  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 7u);
  if (v6)
    v7 = *v6;
  else
    v7 = NAN;
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 7u, 4uLL, 1);
    if (DataForKey)
      *DataForKey = v8;
    -[TUILayout invalidateLayout](self, "invalidateLayout");
  }
}

- (double)containingHeight
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 7u);
  if (v2)
    return *v2;
  else
    return NAN;
}

- (BOOL)isIntrinsicWidthInvalid
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)isIntrinsicHeightInvalid
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)isIntrinsicSizeInvalid
{
  return (*(_BYTE *)&self->_flags & 0x30) != 0;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidthConsideringSpecified
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;
  uint64_t v5;
  uint64_t v6;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v7;
  unint64_t v8;

  v4 = -[TUILayout specifiedWidth](self, "specifiedWidth");
  v6 = v5;
  v7 = -[TUILayout validatedIntrinsicWidth](self, "validatedIntrinsicWidth");
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic((uint64_t)v4, v6, (uint64_t)v7, v8);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeightConsideringSpecified
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;
  uint64_t v5;
  uint64_t v6;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v7;
  unint64_t v8;

  v4 = -[TUILayout specifiedHeight](self, "specifiedHeight");
  v6 = v5;
  v7 = -[TUILayout validatedIntrinsicHeight](self, "validatedIntrinsicHeight");
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic((uint64_t)v4, v6, (uint64_t)v7, v8);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedWidth
{
  uint64_t v4;
  unint64_t v5;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  double v7;
  int v8;
  double v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  BOOL v13;
  float v14;
  $881BB7C90C7D0DFCC1492E3DC022A30F *result;

  -[TUILayout aspectConstrainedSpecifiedWidth](self, "aspectConstrainedSpecifiedWidth");
  v5 = v4 & 0x7000000000000;
  v6 = -[TUILayout aspectConstrainedSpecifiedWidth](self, "aspectConstrainedSpecifiedWidth");
  if (v5 < 0x2000000000001)
  {
    -[TUILayout computedContentWidthConsideringTransform](self, "computedContentWidthConsideringTransform");
    TUILengthComputedWithSpecifiedAndContent();
  }
  else
  {
    LODWORD(v7) = HIDWORD(v6);
    -[TUILayout aspectConstrainedSpecifiedWidth](self, "aspectConstrainedSpecifiedWidth", v7);
    LODWORD(v9) = v8;
    v10 = -[TUILayout aspectConstrainedSpecifiedWidth](self, "aspectConstrainedSpecifiedWidth", v9);
    -[TUILayout computedTransformedSize](self, "computedTransformedSize");
    if (v11 <= -3.40282347e38)
    {
      v12 = 4286578687;
    }
    else
    {
      v12 = 2139095039;
      v13 = v11 < 3.40282347e38;
      v14 = v11;
      if (v13)
        v12 = LODWORD(v14);
    }
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 | v10 & 0xFFFFFFFF00000000);
  }
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedHeight
{
  uint64_t v4;
  unint64_t v5;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  double v7;
  int v8;
  double v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  unsigned int v13;
  $881BB7C90C7D0DFCC1492E3DC022A30F *result;

  -[TUILayout aspectConstrainedSpecifiedHeight](self, "aspectConstrainedSpecifiedHeight");
  v5 = v4 & 0x7000000000000;
  v6 = -[TUILayout aspectConstrainedSpecifiedHeight](self, "aspectConstrainedSpecifiedHeight");
  if (v5 < 0x2000000000001)
  {
    -[TUILayout computedContentHeightConsideringTransform](self, "computedContentHeightConsideringTransform");
    TUILengthComputedWithSpecifiedAndContent();
  }
  else
  {
    LODWORD(v7) = HIDWORD(v6);
    -[TUILayout aspectConstrainedSpecifiedHeight](self, "aspectConstrainedSpecifiedHeight", v7);
    LODWORD(v9) = v8;
    v10 = -[TUILayout aspectConstrainedSpecifiedHeight](self, "aspectConstrainedSpecifiedHeight", v9);
    -[TUILayout computedTransformedSize](self, "computedTransformedSize");
    if (v11 <= -3.40282347e38)
    {
      v12 = 4286578687;
    }
    else
    {
      v12 = 2139095039;
      if (v11 < 3.40282347e38)
      {
        *(float *)&v13 = v11;
        v12 = v13;
      }
    }
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 | v10 & 0xFFFFFFFF00000000);
  }
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidthConsideringTransform
{
  double v5;
  unsigned int v6;
  uint64_t v7;
  CGAffineTransform v8;

  -[TUILayout computedTransform](self, "computedTransform");
  if (CGAffineTransformIsIdentity(&v8))
    return -[TUILayout computedContentWidth](self, "computedContentWidth");
  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  if (v5 <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (v5 < 3.40282347e38)
    {
      *(float *)&v6 = v5;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeightConsideringTransform
{
  double v5;
  unsigned int v6;
  uint64_t v7;
  CGAffineTransform v8;

  -[TUILayout computedTransform](self, "computedTransform");
  if (CGAffineTransformIsIdentity(&v8))
    return -[TUILayout computedContentHeight](self, "computedContentHeight");
  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  if (v5 <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (v5 < 3.40282347e38)
    {
      *(float *)&v6 = v5;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (double)computedHeightAbovePivot
{
  double v2;

  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  return v2;
}

- (double)computedLeadingEdge
{
  return 0.0;
}

- (double)computedHorizontalCenter
{
  double v2;

  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  return v2 * 0.5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  double v3;
  unsigned int v4;
  uint64_t v6;

  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  if (v3 <= -3.40282347e38)
  {
    v6 = 4286578687;
  }
  else
  {
    if (v3 < 3.40282347e38)
    {
      *(float *)&v4 = v3;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v4 | 0x7FC0000000000000);
    }
    v6 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  double v3;
  unsigned int v4;
  uint64_t v6;

  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  if (v3 <= -3.40282347e38)
  {
    v6 = 4286578687;
  }
  else
  {
    if (v3 < 3.40282347e38)
    {
      *(float *)&v4 = v3;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v4 | 0x7FC0000000000000);
    }
    v6 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (CGRect)computedFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGAffineTransform v11;
  CGRect v12;

  -[TUILayout computedBounds](self, "computedBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUILayout _computedFrameTransform](self, "_computedFrameTransform");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (CGRect)computedBounds
{
  double width;
  double height;
  double v4;
  double v5;
  CGRect result;

  width = self->_computedNaturalSize.width;
  height = self->_computedNaturalSize.height;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)computedBoundsWithFlags:(unint64_t)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;
  CGRect v40;

  -[TUILayout computedBoundsPrimitiveWithFlags:](self, "computedBoundsPrimitiveWithFlags:");
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if ((a3 & 1) != 0)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedBoundsChildrenWithFlags:](self, "computedBoundsChildrenWithFlags:", a3));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v17, "computedBoundsWithFlags:", a3);
          v22 = v21;
          if (v21 > 0.0)
          {
            v23 = v20;
            if (v20 > 0.0)
            {
              v24 = v18;
              v25 = v19;
              memset(&v30[1], 0, sizeof(CGAffineTransform));
              if (v17)
                objc_msgSend(v17, "_computedFrameTransform");
              v30[0] = v30[1];
              v36.origin.x = v24;
              v36.origin.y = v25;
              v36.size.width = v22;
              v36.size.height = v23;
              v40 = CGRectApplyAffineTransform(v36, v30);
              v37.origin.x = x;
              v37.origin.y = y;
              v37.size.width = width;
              v37.size.height = height;
              v38 = CGRectUnion(v37, v40);
              x = v38.origin.x;
              y = v38.origin.y;
              width = v38.size.width;
              height = v38.size.height;
            }
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.0;
  v4 = fmax(self->_computedNaturalSize.width, 0.0);
  v5 = fmax(self->_computedNaturalSize.height, 0.0);
  v6 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (double)computedScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "computedScale");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (void)onComputedScaleDidChange
{
  -[TUILayout invalidateLayout](self, "invalidateLayout");
  -[TUILayout notifyChildrenScaleDidChange](self, "notifyChildrenScaleDidChange");
}

- (void)notifyChildrenScaleDidChange
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), "onComputedScaleDidChange");
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (CGAffineTransform)_computedFrameTransform
{
  CGAffineTransform v6;
  CGAffineTransform t1;

  -[TUILayout specifiedTransform](self, "specifiedTransform");
  CGAffineTransformMakeTranslation(&v6, self->_computedOrigin.x, self->_computedOrigin.y);
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

- (CGAffineTransform)computedTransformInAncestorLayout:(SEL)a3
{
  TUILayout *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  TUILayout *v11;
  __int128 v12;
  CGAffineTransform *result;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform v16;

  v6 = (TUILayout *)a4;
  if (v6 == self)
  {
    v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
    -[TUILayout _computedFrameTransform](self, "_computedFrameTransform");
    v7 = objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
    v8 = (void *)v7;
    if (!v7 || (TUILayout *)v7 == v6)
    {
      v11 = (TUILayout *)v7;
    }
    else
    {
      do
      {
        v9 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&t1.c = v9;
        *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
        objc_msgSend(v8, "_computedFrameTransform");
        CGAffineTransformConcat(&v16, &t1, &v14);
        v10 = *(_OWORD *)&v16.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
        *(_OWORD *)&retstr->c = v10;
        *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
        v11 = (TUILayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAncestor"));

        if (!v11)
          break;
        v8 = v11;
      }
      while (v11 != v6);
    }

  }
  return result;
}

- (CGSize)computedTransformedSize
{
  __int128 v3;
  float64x2_t v4;
  double v5;
  CGSize computedNaturalSize;
  float64x2_t v7[3];
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGSize result;

  memset(&v14, 0, sizeof(v14));
  -[TUILayout computedTransform](self, "computedTransform");
  computedNaturalSize = self->_computedNaturalSize;
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  t2 = v14;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v4 = (float64x2_t)computedNaturalSize;
  }
  else
  {
    -[TUILayout computedTransform](self, "computedTransform");
    TUITransformedCornersOfRect(v7, v11.f64, v9.f64, v8.f64, v10.f64, 0.0, 0.0, computedNaturalSize.width, computedNaturalSize.height);
    v4 = vsubq_f64(vmaxnmq_f64(vmaxnmq_f64(v11, v10), vmaxnmq_f64(v9, v8)), vminnmq_f64(vminnmq_f64(v11, v10), vminnmq_f64(v9, v8)));
  }
  v5 = v4.f64[1];
  result.width = v4.f64[0];
  result.height = v5;
  return result;
}

- (CGRect)computedErasableBounds
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat r1;
  CGFloat v34;
  CGFloat v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v43;
  CGAffineTransform v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;
  CGRect v54;

  -[TUILayout computedErasableBoundsPrimitive](self, "computedErasableBoundsPrimitive");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "hidden") & 1) == 0)
        {
          objc_msgSend(v15, "computedErasableBounds");
          v34 = v17;
          v35 = v16;
          v19 = v18;
          v21 = v20;
          objc_msgSend(v15, "computedTransformedSize");
          v23 = v22;
          v25 = v24;
          memset(&v44, 0, sizeof(v44));
          CGAffineTransformMakeTranslation(&v44, -(v22 * 0.5), -(v24 * 0.5));
          t1 = v44;
          if (v15)
            objc_msgSend(v15, "renderTransform");
          else
            memset(&t2, 0, sizeof(t2));
          CGAffineTransformConcat(&v43, &t1, &t2);
          v44 = v43;
          v40 = v43;
          if (v15)
            objc_msgSend(v15, "computedTransform");
          else
            memset(&v39, 0, sizeof(v39));
          r1 = height;
          CGAffineTransformConcat(&v43, &v40, &v39);
          v44 = v43;
          v38 = v43;
          objc_msgSend(v15, "computedOrigin");
          v27 = v26;
          objc_msgSend(v15, "computedOrigin");
          CGAffineTransformMakeTranslation(&v37, v23 * 0.5 + v27, v25 * 0.5 + v28);
          CGAffineTransformConcat(&v43, &v38, &v37);
          v44 = v43;
          v36 = v43;
          v50.origin.x = v19;
          v50.origin.y = v21;
          v50.size.height = v34;
          v50.size.width = v35;
          v54 = CGRectApplyAffineTransform(v50, &v36);
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = width;
          v51.size.height = r1;
          v52 = CGRectUnion(v51, v54);
          x = v52.origin.x;
          y = v52.origin.y;
          width = v52.size.width;
          height = v52.size.height;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v12);
  }

  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (double)computeIntrinsicAspectRatio
{
  return NAN;
}

- (double)computeDerivedWidth
{
  double v3;
  double v4;
  double left;
  double right;
  double bottom;
  double v8;

  -[TUILayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio");
  v4 = v3;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  -[TUILayout computeHeightWithoutDerived](self, "computeHeightWithoutDerived");
  if (v4 <= 0.0)
    return NAN;
  else
    return left + right + (v8 - (UIEdgeInsetsZero.top + bottom)) / v4;
}

- (double)computeDerivedHeight
{
  double v3;
  double v4;
  double left;
  double bottom;
  double right;
  double v8;

  -[TUILayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio");
  v4 = v3;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  -[TUILayout computeWidthWithoutDerived](self, "computeWidthWithoutDerived");
  if (v4 <= 0.0)
    return NAN;
  else
    return UIEdgeInsetsZero.top + bottom + v4 * (v8 - (left + right));
}

- (double)computeWidthWithoutDerived
{
  double result;

  -[TUILayout _computeWidth:](self, "_computeWidth:", 0);
  return result;
}

- (double)computeWidth
{
  double result;

  -[TUILayout _computeWidth:](self, "_computeWidth:", 1);
  return result;
}

- (double)_computeWidth:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  float *v6;
  double v7;
  float *v8;
  double v9;
  float *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[TUILayout specifiedWidth](self, "specifiedWidth");
  v5 = v4;
  v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  if (v6)
    v7 = *v6;
  else
    v7 = NAN;
  v8 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 6u);
  if (v8)
    v9 = *v8;
  else
    v9 = NAN;
  v10 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 2u);
  if (v10)
    v11 = *v10;
  else
    v11 = NAN;
  -[TUILayout constrainComputedWidth:](self, "constrainComputedWidth:", v9);
  v13 = v12;
  v14 = fmin(v12, v7);
  if ((v5 & 0x7000000000000) == 0x6000000000000)
    v14 = v13;
  v15 = fmin(v14, v11);
  if ((v5 & 0x7000000000000) == 0x6000000000000)
    return v13;
  return v15;
}

- (double)computeHeightWithoutDerived
{
  double result;

  -[TUILayout _computeHeight:](self, "_computeHeight:", 0);
  return result;
}

- (double)computeHeight
{
  double result;

  -[TUILayout _computeHeight:](self, "_computeHeight:", 1);
  return result;
}

- (double)_computeHeight:(BOOL)a3
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;
  float v5;
  float v6;
  float *v7;
  int v8;
  double v9;
  double result;

  v4 = -[TUILayout specifiedHeight](self, "specifiedHeight");
  v6 = v5;
  TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 7u);
  v7 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 5u);
  if (v7)
  {
    v8 = 0;
    v9 = *v7;
  }
  else
  {
    v9 = *(float *)&v4;
    v8 = 1;
  }
  -[TUILayout constrainComputedHeight:](self, "constrainComputedHeight:", v9);
  if (v8)
    return fmin(fmax(result, *((float *)&v4 + 1)), v6);
  return result;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[TUILayout computeHeight](self, "computeHeight");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v5);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)aspectConstrainedSpecifiedWidth
{
  unint64_t v4;
  unsigned int v5;
  unint64_t v6;
  double v7;
  double v8;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v9;
  float v10;

  v4 = -[TUILayout specifiedWidth](self, "specifiedWidth");
  v5 = v4;
  v6 = HIDWORD(v4);
  if ((*((_BYTE *)&self->_flags + 1) & 0x30) != 0)
  {
    -[TUILayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio");
    if (v7 > 0.0)
    {
      v8 = v7;
      v9 = -[TUILayout specifiedHeight](self, "specifiedHeight");
      if ((*(_DWORD *)&self->_flags & 0x1000) != 0)
      {
        v10 = fmin(*(float *)&v6, fmaxf(*(float *)&v9, *((float *)&v9 + 1)) / v8);
        *(float *)&v6 = v10;
      }
    }
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | ((unint64_t)v6 << 32));
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)aspectConstrainedSpecifiedHeight
{
  unint64_t v4;
  unsigned int v5;
  unint64_t v6;
  double v7;
  double v8;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v9;
  float v10;

  v4 = -[TUILayout specifiedHeight](self, "specifiedHeight");
  v5 = v4;
  v6 = HIDWORD(v4);
  if ((*((_BYTE *)&self->_flags + 1) & 0xC0) != 0)
  {
    -[TUILayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio");
    if (v7 > 0.0)
    {
      v8 = v7;
      v9 = -[TUILayout specifiedWidth](self, "specifiedWidth");
      if ((*(_DWORD *)&self->_flags & 0x4000) != 0)
      {
        v10 = fmax(*(float *)&v6, v8 * fmaxf(*(float *)&v9, *((float *)&v9 + 1)));
        *(float *)&v6 = v10;
      }
    }
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | ((unint64_t)v6 << 32));
}

- (void)_computeAspectConstrainedSpecifiedWidthHeight
{
  $881BB7C90C7D0DFCC1492E3DC022A30F *v3;
  float v4;
  float v5;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  $2E822BB417F7D1609F669B00B90D7CC3 *p_flags;
  $2E822BB417F7D1609F669B00B90D7CC3 v18;
  unsigned int v19;
  $2E822BB417F7D1609F669B00B90D7CC3 flags;

  v3 = -[TUILayout specifiedWidth](self, "specifiedWidth");
  v5 = v4;
  v6 = -[TUILayout specifiedHeight](self, "specifiedHeight");
  *(float *)&v7 = v5;
  *(float *)&v8 = fminf(*(float *)&v3, v5);
  LODWORD(v9) = HIDWORD(v3);
  *(float *)&v10 = fmaxf(*(float *)&v3, *((float *)&v3 + 1));
  *(float *)&v12 = v11;
  *(float *)&v13 = fminf(*(float *)&v6, v11);
  *(float *)&v14 = fmaxf(*(float *)&v6, *((float *)&v6 + 1));
  -[TUILayout computeIntrinsicAspectRatio](self, "computeIntrinsicAspectRatio", v10, v7, v8, v9, v14, v12, v13);
  if (v15 > 0.0)
  {
    flags = self->_flags;
    p_flags = &self->_flags;
    v19 = *(_DWORD *)&flags & 0xFFFF0FFF | 0x7000;
    v16 = 0x8000;
  }
  else
  {
    v16 = 0;
    v18 = self->_flags;
    p_flags = &self->_flags;
    v19 = *(_DWORD *)&v18 & 0xFFFF0FFF;
  }
  *p_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(v16 | v19);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  return 0;
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10;
  id v11;
  void *v12;
  __int128 v13;
  _OWORD v14[3];

  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v13 = *(_OWORD *)&a5->c;
  v14[0] = *(_OWORD *)&a5->a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a5->tx;
  -[TUILayout appendChilden:renderModelCompatibleWithKind:context:transform:toModels:](self, "appendChilden:renderModelCompatibleWithKind:context:transform:toModels:", v12, a3, v10, v14, v11);

}

- (void)appendChilden:(id)a3 renderModelCompatibleWithKind:(unint64_t)a4 context:(id)a5 transform:(CGAffineTransform *)a6 toModels:(id)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  void *i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  CGAffineTransform v33;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v12 = a3;
  v13 = a5;
  v14 = a7;
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v16 = v15;
  v18 = v17;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v38;
    v22 = -v16;
    v23 = -v18;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v25, "computedOrigin");
        v27 = v26;
        v29 = v28;
        objc_msgSend(v25, "computedTransformedSize");
        memset(&v36, 0, sizeof(v36));
        CGAffineTransformMakeTranslation(&t1, v27 + v30 * 0.5 + v22 * 0.5, v29 + v31 * 0.5 + v23 * 0.5);
        v32 = *(_OWORD *)&a6->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a6->a;
        *(_OWORD *)&t2.c = v32;
        *(_OWORD *)&t2.tx = *(_OWORD *)&a6->tx;
        CGAffineTransformConcat(&v36, &t1, &t2);
        v33 = v36;
        objc_msgSend(v25, "appendRenderModelCompatibleWithKind:context:transform:toModels:", a4, v13, &v33, v14);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v20);
  }

}

- (id)scrollAncestorForChildrenWithAncestor:(id)a3
{
  return a3;
}

- (id)rootLayout
{
  TUILayout *v2;
  void *v3;
  TUILayout *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](v2, "layoutAncestor"));
  while (v3)
  {
    v4 = v2;
    v2 = v3;

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](v2, "layoutAncestor"));
  }
  return v2;
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  CGFloat y;
  CGFloat x;
  TUILayout *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  TUILayout *v17;
  TUIAXModel *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *i;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  TUIAXCustomActionsCollector *v28;
  void *v29;
  TUIAXCustomActionsCollector *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *j;
  id v41;
  void *v42;
  id v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  unsigned int v48;
  TUIAXAttributes *v49;
  void *v50;
  void *v51;
  char *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  char *v63;
  TUILayout *v64;
  TUILayout *v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat width;
  CGFloat height;
  double MinX;
  CGFloat MaxX;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  TUILayout *v85;
  TUILayout *v86;
  void *v87;
  TUILayout *v88;
  TUIAXModel *v89;
  id obj;
  NSMutableArray *v91;
  uint64_t v92;
  TUILayout *v93;
  TUILayout *v94;
  id v95;
  TUIAXCustomActionsCollector *v96;
  id rect[7];
  CGAffineTransform v98;
  CGAffineTransform v99;
  CGAffineTransform v100;
  CGAffineTransform v101;
  CGAffineTransform v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  NSMutableArray *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;

  y = a5.y;
  x = a5.x;
  v96 = (TUIAXCustomActionsCollector *)a3;
  v85 = (TUILayout *)a4;
  v86 = (TUILayout *)a6;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v88 = self;
  v11 = (TUILayout *)objc_claimAutoreleasedReturnValue(-[TUILayout scrollAncestorForChildrenWithAncestor:](self, "scrollAncestorForChildrenWithAncestor:", v85));
  v12 = y;
  v13 = x;
  v94 = v11;
  if (v11 != v85)
  {
    -[TUILayout scrollAdditionalAXTranslation](v11, "scrollAdditionalAXTranslation");
    v13 = v14;
    v12 = v15;
  }
  v16 = objc_msgSend(v87, "liveTransformKind");
  v17 = v86;
  if (v16)
    v17 = self;
  v93 = v17;
  v18 = [TUIAXModel alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "identifier"));
  v20 = objc_msgSend((id)objc_opt_class(v87), "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v89 = -[TUIAXModel initWithIdentifier:boxType:](v18, "initWithIdentifier:boxType:", v19, v21);

  -[TUIAXModel setHidden:](v89, "setHidden:", -[TUILayout hidden](self, "hidden"));
  v91 = objc_opt_new(NSMutableArray);
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
  if (v22)
  {
    v92 = *(_QWORD *)v111;
    do
    {
      v95 = v22;
      for (i = 0; i != v95; i = (char *)i + 1)
      {
        if (*(_QWORD *)v111 != v92)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "box"));
        v26 = objc_msgSend(v25, "isAXElement");
        if (v96)
          v27 = 0;
        else
          v27 = v26;

        if (v27)
          v28 = objc_alloc_init(TUIAXCustomActionsCollector);
        else
          v28 = 0;
        v29 = objc_autoreleasePoolPush();
        if (v96)
          v30 = v96;
        else
          v30 = v28;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", v30, v94, v93, v13, v12));
        objc_autoreleasePoolPop(v29);
        rect[0] = v31;
        if (v28)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "box"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "axCustomActions"));
          v34 = objc_msgSend(v33, "count") == 0;

          if (v34)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXCustomActionsCollector customActionsForPress](v28, "customActionsForPress"));
            v45 = objc_msgSend(v44, "count") == 0;

            if (v45)
              goto LABEL_36;
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXCustomActionsCollector customActionsForPress](v28, "customActionsForPress"));
            v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));

            -[NSMutableArray setIsDefault:](v35, "setIsDefault:", 1);
            v114 = v35;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v114, 1));
            objc_msgSend(v31, "setResolvedCustomActions:", v47);

          }
          else
          {
            v35 = objc_opt_new(NSMutableArray);
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "box"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "axCustomActions"));

            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
            if (v38)
            {
              v39 = *(_QWORD *)v107;
              do
              {
                for (j = 0; j != v38; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v107 != v39)
                    objc_enumerationMutation(v37);
                  v41 = *(id *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)j);
                  if (objc_msgSend(v41, "isReference"))
                  {
                    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dereferenceByCollector:", v28));
                    if (v42)
                    {
                      v43 = objc_msgSend(v41, "copyFromReference:", v42);

                      v41 = v43;
                    }

                  }
                  -[NSMutableArray addObject:](v35, "addObject:", v41);

                }
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v115, 16);
              }
              while (v38);
            }

            objc_msgSend(rect[0], "setResolvedCustomActions:", v35);
          }

        }
LABEL_36:
        if (rect[0])
          -[NSMutableArray addObject:](v91, "addObject:", rect[0]);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
    }
    while (v22);
  }

  -[TUIAXModel setChildren:](v89, "setChildren:", v91);
  v48 = objc_msgSend(v87, "axHasNonDefaultAttributess");
  if (v48)
    v49 = -[TUIAXAttributes initWithAXAttributes:]([TUIAXAttributes alloc], "initWithAXAttributes:", v87);
  else
    v49 = 0;
  -[TUIAXModel setAxAttributes:](v89, "setAxAttributes:", v49);
  if (v48)

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v85, "box"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
  -[TUIAXModel setScrollAncestorIdentifier:](v89, "setScrollAncestorIdentifier:", v51);

  if (v94 == v88)
    v52 = (char *)-[TUILayout scrollAxis](v88, "scrollAxis");
  else
    v52 = 0;
  -[TUIAXModel setShouldScrollHorizontally:](v89, "setShouldScrollHorizontally:", v52 == (_BYTE *)&dword_0 + 1);
  -[TUIAXModel setShouldScrollVertically:](v89, "setShouldScrollVertically:", v52 == (_BYTE *)&dword_0 + 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v86, "box"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
  -[TUIAXModel setLiveTransformAncestorIdentifier:](v89, "setLiveTransformAncestorIdentifier:", v54);

  -[TUIAXModel setLiveTransformKind:](v89, "setLiveTransformKind:", objc_msgSend(v87, "liveTransformKind"));
  memset(&v105, 0, sizeof(v105));
  -[TUILayout computedTransformInAncestorLayout:](v88, "computedTransformInAncestorLayout:", v85);
  v103 = v105;
  CGAffineTransformTranslate(&v104, &v103, x, y);
  v105 = v104;
  -[TUILayout computedBounds](v88, "computedBounds");
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v63 = -[TUILayout computedLayoutDirection](v88, "computedLayoutDirection");
  -[TUIAXModel setFlipsHorizontal:](v89, "setFlipsHorizontal:", v63 == (_BYTE *)&dword_0 + 2);
  if (v63 == (_BYTE *)&dword_0 + 2)
  {
    if (v85)
      v64 = v85;
    else
      v64 = (TUILayout *)objc_claimAutoreleasedReturnValue(-[TUILayout rootLayout](v88, "rootLayout"));
    v65 = v64;
    rect[0] = v56;
    -[TUILayout computedBounds](v64, "computedBounds");
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v101 = v105;
    CGAffineTransformInvert(&v102, &v101);
    v119.origin.x = v67;
    v119.origin.y = v69;
    v119.size.width = v71;
    v119.size.height = v73;
    v120 = CGRectApplyAffineTransform(v119, &v102);
    v74 = v120.origin.x;
    v75 = v120.origin.y;
    width = v120.size.width;
    height = v120.size.height;
    MinX = CGRectGetMinX(v120);
    v121.origin.x = v74;
    v121.origin.y = v75;
    v121.size.width = width;
    v121.size.height = height;
    MaxX = CGRectGetMaxX(v121);
    CGAffineTransformMakeTranslation(&v100, -(MinX + MaxX), 0.0);
    *(id *)&v122.origin.x = rect[0];
    v122.origin.y = v58;
    v122.size.width = v60;
    v122.size.height = v62;
    v123 = CGRectApplyAffineTransform(v122, &v100);
    v80 = v123.origin.x;
    v81 = v123.origin.y;
    v82 = v123.size.width;
    v83 = v123.size.height;
    CGAffineTransformMakeScale(&v99, -1.0, 1.0);
    v124.origin.x = v80;
    v124.origin.y = v81;
    v124.size.width = v82;
    v124.size.height = v83;
    v125 = CGRectApplyAffineTransform(v124, &v99);
    v98 = v105;
    v126 = CGRectApplyAffineTransform(v125, &v98);
    -[TUIAXModel setAccessibilityFrameRelativeToScrollAncestor:](v89, "setAccessibilityFrameRelativeToScrollAncestor:", v126.origin.x, v126.origin.y, v126.size.width, v126.size.height);

  }
  else
  {
    *(CGAffineTransform *)&rect[1] = v105;
    *(_QWORD *)&v117.origin.x = v56;
    v117.origin.y = v58;
    v117.size.width = v60;
    v117.size.height = v62;
    v118 = CGRectApplyAffineTransform(v117, (CGAffineTransform *)&rect[1]);
    -[TUIAXModel setAccessibilityFrameRelativeToScrollAncestor:](v89, "setAccessibilityFrameRelativeToScrollAncestor:", v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  }

  return v89;
}

- (id)_transformedRenderModel:(id)a3 transform:(CGAffineTransform *)a4 context:(id)a5 allowCache:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
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
  __int128 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;
  TUIRenderModelTransform *cachedTransformModel;
  void *v36;
  id v37;
  double v38;
  double v39;
  TUIRenderModelTransform *v41;
  int64_t v42;
  void *v43;
  TUIRenderModelTransform *v44;
  void *v45;
  void *v46;
  void *v47;
  double tx;
  double c;
  double ty;
  double d;
  double a;
  double b;
  double y;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v61;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  y = CGPointZero.y;
  a = a4->a;
  b = a4->b;
  tx = a4->tx;
  c = a4->c;
  ty = a4->ty;
  d = a4->d;
  objc_msgSend(v10, "size");
  v13 = v12;
  objc_msgSend(v10, "size");
  v15 = v14;
  v17 = a4->a;
  v16 = a4->b;
  v18 = a4->c;
  v19 = a4->d;
  v20 = a4->tx;
  v21 = a4->ty;
  objc_msgSend(v11, "contentsScale");
  v22 = v13 * -0.5;
  v23 = v20 + v15 * -0.5 * v18 + v17 * (v13 * -0.5);
  v24 = v21 + v15 * -0.5 * v19 + v16 * v22;
  v26 = tx + y * c + a * CGPointZero.x + TUIPointRoundedForScale(v23, v24, v25) - v23;
  v28 = ty + y * d + b * CGPointZero.x + v27 - v24;
  v29 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v29;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  memset(&v61, 0, sizeof(v61));
  CGAffineTransformMakeTranslation(&t2, -v26, -v28);
  CGAffineTransformConcat(&v61, &t1, &t2);
  v30 = v61.tx;
  objc_msgSend(v11, "contentsScale");
  v61.tx = TUIFloatRoundedForScale(v30, v31);
  v32 = v61.ty;
  objc_msgSend(v11, "contentsScale");
  v61.ty = TUIFloatRoundedForScale(v32, v33);
  v34 = -[TUILayout computeZIndexWithDefault:](self, "computeZIndexWithDefault:", 0);
  if (!v6)
    goto LABEL_20;
  cachedTransformModel = self->_cachedTransformModel;
  if (!cachedTransformModel || (*(_BYTE *)&self->_flags & 0x40) != 0)
    goto LABEL_20;
  v36 = 0;
  v37 = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform submodel](cachedTransformModel, "submodel"));
  if (v37 != v10)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelTransform submodel](self->_cachedTransformModel, "submodel"));
    if (!objc_msgSend(v36, "isEqual:", v10))
      goto LABEL_18;
  }
  -[TUIRenderModelTransform center](self->_cachedTransformModel, "center");
  if (v39 != v26 || v38 != v28)
    goto LABEL_17;
  v41 = self->_cachedTransformModel;
  if (v41)
    -[TUIRenderModelTransform transform](v41, "transform");
  else
    memset(&v58, 0, sizeof(v58));
  v57 = v61;
  if (!CGAffineTransformEqualToTransform(&v58, &v57))
  {
LABEL_17:
    v43 = v10;
    if (v37 == v10)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    v43 = v37;
    goto LABEL_19;
  }
  v42 = -[TUIRenderModelTransform zIndex](self->_cachedTransformModel, "zIndex");
  if (v37 == v10)
  {

  }
  else
  {

  }
  if (v42 == v34)
  {
    v44 = self->_cachedTransformModel;
    goto LABEL_22;
  }
LABEL_20:
  v44 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v10);
  -[TUIRenderModelTransform setCenter:](v44, "setCenter:", v26, v28);
  v56 = v61;
  -[TUIRenderModelTransform setTransform:](v44, "setTransform:", &v56);
  -[TUIRenderModelTransform setZIndex:](v44, "setZIndex:", v34);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedRefIdWithContext:](self, "computedRefIdWithContext:", v11));
  -[TUIRenderModelTransform setRefId:](v44, "setRefId:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedRefInstanceWithContext:](self, "computedRefInstanceWithContext:", v11));
  -[TUIRenderModelTransform setRefInstance:](v44, "setRefInstance:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v47, "renderOutsets");
  -[TUIRenderModelTransform setOutsets:](v44, "setOutsets:");

  if (v6)
  {
    *(_DWORD *)&self->_flags &= ~0x40u;
    objc_storeStrong((id *)&self->_cachedTransformModel, v44);
  }
LABEL_22:

  return v44;
}

- (BOOL)shouldAppendChildRenderModels
{
  return 0;
}

- (BOOL)shouldUseSubviewRenderModelWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentPointer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refId"));
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (void)appendRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10;
  id v11;
  __int128 v12;
  _OWORD v13[3];

  v10 = a4;
  v11 = a6;
  if (!-[TUILayout hidden](self, "hidden"))
  {
    v12 = *(_OWORD *)&a5->c;
    v13[0] = *(_OWORD *)&a5->a;
    v13[1] = v12;
    v13[2] = *(_OWORD *)&a5->tx;
    -[TUILayout appendRenderModelIgnoreHiddenCompatibleWithKind:context:transform:toModels:](self, "appendRenderModelIgnoreHiddenCompatibleWithKind:context:transform:toModels:", a3, v10, v13, v11);
  }

}

- (void)appendRenderModelIgnoreHiddenCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _OWORD v24[3];
  _QWORD v25[5];
  _QWORD *v26;
  _OWORD v27[3];
  _QWORD v28[5];
  id v29;
  id v30;
  unint64_t v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v36;

  v10 = a4;
  v11 = a6;
  -[TUILayout computedTransform](self, "computedTransform");
  v12 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v12;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(&v36, &t1, &t2);
  v13 = *(_OWORD *)&v36.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&a5->c = v13;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v36.tx;
  -[TUILayout renderTransform](self, "renderTransform");
  v14 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v32.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v32.c = v14;
  *(_OWORD *)&v32.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(&v36, &v33, &v32);
  v15 = *(_OWORD *)&v36.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&a5->c = v15;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v36.tx;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_102260;
  v28[3] = &unk_241858;
  v28[4] = self;
  v16 = v10;
  v29 = v16;
  v17 = v11;
  v30 = v17;
  v31 = a3;
  v18 = objc_retainBlock(v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentLiveTransform"));
  if (v19)
  {

  }
  else
  {
    v22 = *(_OWORD *)&a5->c;
    v27[0] = *(_OWORD *)&a5->a;
    v27[1] = v22;
    v27[2] = *(_OWORD *)&a5->tx;
    v23 = -[TUILayout newLiveTransform:](self, "newLiveTransform:", v27);
    if (v23)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_102610;
      v25[3] = &unk_241880;
      v25[4] = self;
      v26 = v18;
      objc_msgSend(v16, "evaluateWithLiveTransform:block:", v23, v25);

      goto LABEL_6;
    }
  }
  v20 = *(_OWORD *)&a5->tx;
  v21 = *(_OWORD *)&a5->a;
  v24[1] = *(_OWORD *)&a5->c;
  v24[2] = v20;
  v24[0] = v21;
  ((void (*)(_QWORD *, _OWORD *, uint64_t))v18[2])(v18, v24, 1);
LABEL_6:

}

- (id)newLiveTransform:(CGAffineTransform *)a3
{
  float64x2_t v4;
  float64x2_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char *v12;
  void *v13;
  unint64_t v14;
  TUIPinningLiveTransform *v15;
  TUIFloatingLiveTransform *v17;
  CGAffineTransform *v18;
  float64x2_t v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;

  v4 = *(float64x2_t *)&a3->c;
  v5 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(v4, CGPointZero.y), *(float64x2_t *)&a3->a, CGPointZero.x));
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(float64x2_t *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  memset(&v25, 0, sizeof(v25));
  v19 = v5;
  v6 = v5.f64[1];
  CGAffineTransformMakeTranslation(&t2, -v5.f64[0], -v5.f64[1]);
  CGAffineTransformConcat(&v25, &t1, &t2);
  -[TUILayout computedTransformedSize](self, "computedTransformedSize");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = (char *)objc_msgSend(v11, "liveTransformKind");

  if ((unint64_t)(v12 - 2) < 5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v14 = -[TUILayout pinPositionFromLiveTransformKind:](self, "pinPositionFromLiveTransformKind:", objc_msgSend(v13, "liveTransformKind"));

    v15 = [TUIPinningLiveTransform alloc];
    v21 = v25;
    return -[TUIPinningLiveTransform initWithCenter:size:transform:pinPosition:](v15, "initWithCenter:size:transform:pinPosition:", &v21, v14, v19.f64[0], v6, v8, v10);
  }
  if (v12 == (_BYTE *)&dword_0 + 1)
  {
    v17 = [TUIFloatingLiveTransform alloc];
    v22 = v25;
    v18 = &v22;
    return -[TUIFloatingLiveTransform initWithCenter:size:transform:](v17, "initWithCenter:size:transform:", v18, v19.f64[0], v6, v8, v10, *(_OWORD *)&v19, *(_OWORD *)&v20.a, *(_OWORD *)&v20.c, *(_OWORD *)&v20.tx);
  }
  if (v12 == (_BYTE *)&dword_4 + 3)
  {
    v17 = [TUIOverscrollingLiveTransform alloc];
    v20 = v25;
    v18 = &v20;
    return -[TUIFloatingLiveTransform initWithCenter:size:transform:](v17, "initWithCenter:size:transform:", v18, v19.f64[0], v6, v8, v10, *(_OWORD *)&v19, *(_OWORD *)&v20.a, *(_OWORD *)&v20.c, *(_OWORD *)&v20.tx);
  }
  return 0;
}

- (unint64_t)pinPositionFromLiveTransformKind:(unint64_t)a3
{
  if (a3 - 2 > 4)
    return 0;
  else
    return qword_22F968[a3 - 2];
}

- (BOOL)collectImpressionsForChild:(id)a3
{
  return 1;
}

- (BOOL)collectImpressionsForChildren
{
  return 1;
}

- (BOOL)collectLinkEntitiesForChild:(id)a3
{
  return 1;
}

- (BOOL)collectLinkEntitiesForChildren
{
  return 1;
}

- (id)collectLinkEntities
{
  return 0;
}

- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout childrenForHoverRegions](self, "childrenForHoverRegions", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "appendHoverRegions:relativeToLayout:", v6, v7);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)invalidateRenderModel
{
  TUIRenderModelTransform *cachedTransformModel;
  TUILayoutContaining **p_parent;
  id v5;
  unsigned int v6;
  id v7;
  unsigned int v8;
  id v9;
  id WeakRetained;
  id v11;

  cachedTransformModel = self->_cachedTransformModel;
  if (cachedTransformModel)
  {
    self->_cachedTransformModel = 0;

  }
  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained
    && (v5 = objc_loadWeakRetained((id *)&self->_parent),
        v6 = objc_msgSend(v5, "shouldAutoInvalidateRenderModelOnChildInvalidate"),
        v5,
        WeakRetained,
        v6))
  {
    v11 = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(v11, "onChildRenderModelInvalidate:", self);
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->_controller);
    v7 = objc_loadWeakRetained((id *)&self->_parent);
    v8 = objc_msgSend(v7, "isLayout");
    if (v8)
      v9 = objc_loadWeakRetained((id *)p_parent);
    else
      v9 = 0;
    objc_msgSend(v11, "invalidateCachedRenderModelForLayout:", v9);
    if (v8)

  }
}

- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate
{
  return 1;
}

- (BOOL)isHorizontallyAligningChildren
{
  return 0;
}

- (BOOL)isVerticallyAligningChildren
{
  return 0;
}

- (BOOL)isDescendentOfLayout:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout parent](self, "parent"));
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout parent](self, "parent"));
    v7 = objc_msgSend(v6, "isDescendentOfLayout:", v4);

  }
  return v7;
}

- (void)setLayoutIsInvalid:(BOOL)a3
{
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3);
}

- (BOOL)layoutIsInvalid
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setInvalidChildren:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)invalidChildren
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)invalidateLayout
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "invalidateLayout:", self);

  }
}

- (void)validateLayout
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "validateLayout:", self);

  }
}

- (void)_validateLayout
{
  $2E822BB417F7D1609F669B00B90D7CC3 flags;

  flags = self->_flags;
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&flags | 4);
  -[TUILayout computeLayout](self, "computeLayout");
  -[TUILayout _computeAspectConstrainedSpecifiedWidthHeight](self, "_computeAspectConstrainedSpecifiedWidthHeight");
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | (4
                                                                                            * ((*(unsigned int *)&flags >> 2) & 1)));
  TUI::Util::PartialStruct::Storage::compress((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (void)_validateLayoutWithBlock:(id)a3
{
  void (**v4)(void);
  $2E822BB417F7D1609F669B00B90D7CC3 flags;
  void (**v6)(void);

  v4 = (void (**)(void))a3;
  flags = self->_flags;
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&flags | 4);
  v6 = v4;
  v4[2]();
  -[TUILayout _computeAspectConstrainedSpecifiedWidthHeight](self, "_computeAspectConstrainedSpecifiedWidthHeight");
  self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | (4
                                                                                            * ((*(unsigned int *)&flags >> 2) & 1)));
  TUI::Util::PartialStruct::Storage::compress((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);

}

- (BOOL)isValidating
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setComputedNaturalSize:(CGSize)a3
{
  id v5;

  if (fabs(a3.width) == INFINITY)
    a3.width = 0.0;
  if (fabs(a3.height) == INFINITY)
    a3.height = 0.0;
  if (self->_computedNaturalSize.width != a3.width || self->_computedNaturalSize.height != a3.height)
  {
    self->_computedNaturalSize = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout parent](self, "parent"));
    objc_msgSend(v5, "onChildTransformedSizeDidChange:", self);

  }
}

- (void)setComputedOrigin:(CGPoint)a3
{
  if (self->_computedOrigin.x != a3.x || self->_computedOrigin.y != a3.y)
  {
    self->_computedOrigin = a3;
    -[TUILayout onComputedOriginDidChange](self, "onComputedOriginDidChange");
  }
}

- (void)onComputedOriginDidChange
{
  id v3;

  if (self->_cachedTransformModel)
  {
    *(_DWORD *)&self->_flags |= 0x40u;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout parent](self, "parent"));
    objc_msgSend(v3, "onChildRenderModelInvalidate:", self);

  }
}

- (void)onInvalidate
{
  id WeakRetained;
  _BYTE *v4;

  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  if (v4 && (v4[16] & 4) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(WeakRetained, "onChildInvalidate:", self);

  }
  -[TUILayout invalidateRenderModel](self, "invalidateRenderModel");

}

- (void)invalidateIntrinsicSize
{
  *(_DWORD *)&self->_flags |= 0x30u;
  -[TUILayout onInvalidateIntrinsicSize](self, "onInvalidateIntrinsicSize");
}

- (void)onInvalidateIntrinsicSize
{
  id v3;

  -[TUILayout invalidateLayout](self, "invalidateLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout parent](self, "parent"));
  objc_msgSend(v3, "onChildInvalidateIntrinsicSize:", self);

}

- (void)onContainersUpdated
{
  -[TUILayout _updateChildren](self, "_updateChildren");
  -[TUILayout onChildrenUpdated](self, "onChildrenUpdated");
}

- (BOOL)validatesAllChildren
{
  return 1;
}

- (BOOL)desdendantSpecifiedWidthModified
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (void)updateDesdendantSpecifiedWidthModifiedWithFlag:(BOOL)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  $2E822BB417F7D1609F669B00B90D7CC3 flags;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (a3)
  {
LABEL_12:
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x10000) != 0)
      return;
    v9 = 0x10000;
    goto LABEL_14;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_children;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if ((*(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) + 16) & 0x10400) != 0)
        {

          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    v9 = 0;
LABEL_14:
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&flags & 0xFFFEFFFF | v9);
    -[TUILayout onDesdendantSpecifiedWidthModifiedDidChange](self, "onDesdendantSpecifiedWidthModifiedDidChange", (_QWORD)v10);
  }
}

- (void)appendLayoutsWithSpecifiedWidthModifiedToArray:(id)a3
{
  id v4;

  v4 = a3;
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    objc_msgSend(v4, "addObject:", self);

}

- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v8 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layout](self, "layout", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "children"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "appendVisibleBoundsObservers:axis:offset:", v8, a4, a5);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)teardown
{
  TUIRenderModelTransform *cachedTransformModel;

  cachedTransformModel = self->_cachedTransformModel;
  self->_cachedTransformModel = 0;

}

- (BOOL)shouldAppendChildAnchorsForAncestor
{
  return 1;
}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6;
  id v7;
  int *v8;
  double height;
  double width;
  char *v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v6 = a3;
  v7 = a4;
  v8 = (int *)-[TUIModelLayoutable anchorPosition](self->_model, "anchorPosition");
  if (!v8)
    goto LABEL_29;
  width = self->_computedNaturalSize.width;
  height = self->_computedNaturalSize.height;
  v11 = (char *)objc_msgSend(v6, "axis");
  if (v11 == (_BYTE *)&dword_0 + 1)
  {
    if (v8 == (int *)((char *)&dword_0 + 1))
    {
      v17 = height * 0.5;
      if ((char *)-[TUILayout computedLayoutDirection](self, "computedLayoutDirection") == (char *)&dword_0 + 1)
        width = 0.0;
      goto LABEL_24;
    }
    if (v8 == (int *)((char *)&dword_0 + 2))
    {
      v17 = height * 0.5;
      if ((char *)-[TUILayout computedLayoutDirection](self, "computedLayoutDirection") != (char *)&dword_0 + 1)
        width = 0.0;
      goto LABEL_24;
    }
    v12 = NAN;
    v13 = v8 == (int *)((char *)&dword_0 + 3);
    v14 = height * 0.5;
    if (v8 == (int *)((char *)&dword_0 + 3))
      width = width * 0.5;
    else
      width = NAN;
  }
  else
  {
    v12 = NAN;
    v14 = height * 0.5;
    if (v8 == (int *)((char *)&dword_4 + 1))
      v15 = width * 0.5;
    else
      v15 = NAN;
    if (v8 == (int *)((char *)&dword_4 + 1))
      v12 = 0.0;
    if (v8 == &dword_4)
      v16 = width * 0.5;
    else
      v16 = v15;
    if (v8 == &dword_4)
      v12 = height;
    v13 = v8 == (int *)((char *)&dword_0 + 3);
    if (v8 == (int *)((char *)&dword_0 + 3))
      width = width * 0.5;
    else
      width = v16;
  }
  if (v13)
    v17 = v14;
  else
    v17 = v12;
LABEL_24:
  if (CGFloatIsValid(width) && CGFloatIsValid(v17))
  {
    -[TUILayout computedTransformInAncestorLayout:](self, "computedTransformInAncestorLayout:", v7);
    v18 = v17 * 0.0 + 0.0 * width + 0.0;
    if (v11 != (_BYTE *)&dword_0 + 1)
      v18 = v17 * 0.0 + 0.0 * width + 0.0;
    objc_msgSend(v6, "appendScrollAnchor:", v18);
  }
LABEL_29:
  if (-[TUILayout shouldAppendChildAnchorsForAncestor](self, "shouldAppendChildAnchorsForAncestor"))
    -[TUILayout appendChildAnchorsToSet:inRoot:](self, "appendChildAnchorsToSet:inRoot:", v6, v7);
  else
    -[TUILayout appendEmbeddedAnchorsToSet:inRoot:](self, "appendEmbeddedAnchorsToSet:inRoot:", v6, v7);

}

- (void)appendChildAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "appendAnchorsToSet:inRoot:", v6, v7);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)guideProviderForLayout:(id)a3
{
  return 0;
}

- (id)guideProvider
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "guideProviderForLayout:", self));

  return v4;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  LOBYTE(a4) = objc_msgSend(v7, "shouldUseDefaultGuideForLayout:edge:", v6, a4);

  return a4;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v20;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[TUILayout computedFrame](self, "computedFrame");
  v7 = NSStringFromCGRect(v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p frame=%@"), v6, self, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideTop](self, "guideTop"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideTop](self, "guideTop"));
    objc_msgSend(v9, "appendFormat:", CFSTR(" top=%@"), v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideBottom](self, "guideBottom"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideBottom](self, "guideBottom"));
    objc_msgSend(v9, "appendFormat:", CFSTR(" bottom=%@"), v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideLeading](self, "guideLeading"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideLeading](self, "guideLeading"));
    objc_msgSend(v9, "appendFormat:", CFSTR(" leading=%@"), v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideTrailing](self, "guideTrailing"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideTrailing](self, "guideTrailing"));
    objc_msgSend(v9, "appendFormat:", CFSTR(" trailing=%@"), v17);

  }
  objc_msgSend(v9, "appendString:", CFSTR(">"));
  v18 = objc_msgSend(v9, "copy");

  return (NSString *)v18;
}

- (int64_t)computeZIndexWithDefault:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  char *v8;
  uint64_t *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = objc_msgSend(v5, "zIndex");

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    return (int64_t)v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (char *)objc_msgSend(v7, "role");

  if (v8 == (_BYTE *)&dword_0 + 1)
  {
    v9 = &TUIZIndexBackground;
LABEL_6:
    v6 = (id)*v9;
    if (*v9 != 0x7FFFFFFFFFFFFFFFLL)
      return (int64_t)v6;
    goto LABEL_7;
  }
  if (v8 == (_BYTE *)&dword_0 + 3)
  {
    v9 = &TUIZIndexForeground;
    goto LABEL_6;
  }
LABEL_7:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v11 = v10;
  if (v10)
    a3 = (int64_t)objc_msgSend(v10, "computeZIndexWithDefault:", a3);

  return a3;
}

- (BOOL)shouldDescendentsInheritRefSpecWithContext:(id)a3
{
  return !-[TUILayout shouldUseSubviewRenderModelWithContext:](self, "shouldUseSubviewRenderModelWithContext:", a3);
}

- (id)inheritedRefIdWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[TUILayout shouldDescendentsInheritRefSpecWithContext:](self, "shouldDescendentsInheritRefSpecWithContext:", v4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedRefIdWithContext:](self, "computedRefIdWithContext:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)inheritedRefInstanceWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[TUILayout shouldDescendentsInheritRefSpecWithContext:](self, "shouldDescendentsInheritRefSpecWithContext:", v4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout computedRefInstanceWithContext:](self, "computedRefInstanceWithContext:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)computedRefIdWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refId"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inheritedRefIdWithContext:", v4));

  }
  return v8;
}

- (id)computedRefInstanceWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refInstance"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inheritedRefInstanceWithContext:", v4));

  }
  return v8;
}

- (void)appendEmbeddedIdentifierMaps:(id)a3 updateControllers:(id)a4 UUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "appendEmbeddedIdentifierMaps:updateControllers:UUIDs:", v8, v9, v10);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (CGSize)renderModelSizeWithContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = a3;
  -[TUILayout computedNaturalSize](self, "computedNaturalSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "contentsScale");
  v10 = TUISizeRoundedForScale(v6, v8, v9);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)shouldUpdateContainingMetricsForScrollableContent
{
  return 1;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)modifiedSpecifiedWidthForChild:(SEL)a3
{
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- (id)hoverIdentifierWithName:(id)a3
{
  id v4;
  TUILayout *v5;
  TUILayout *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = self;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      if ((objc_opt_respondsToSelector(v7, "hoverIdentifierWithName:forDescdendent:") & 1) != 0)
        break;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutAncestor"));

      v7 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    v7 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hoverIdentifierWithName:forDescdendent:", v4, v6));

  return v9;
}

- (UIEdgeInsets)erasableInsetsForContentsScale:(double)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat y;
  CGFloat width;
  CGFloat x;
  double MinY;
  double MinX;
  double MaxY;
  double v18;
  double MaxX;
  double v20;
  int8x16_t v21;
  int8x16_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat height;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  UIEdgeInsets result;

  -[TUILayout computedBounds](self, "computedBounds");
  v5 = v4;
  v30 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TUILayout computedErasableBounds](self, "computedErasableBounds");
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  x = v35.origin.x;
  v31 = v35.origin.x;
  MinY = CGRectGetMinY(v35);
  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  v33 = MinY - CGRectGetMinY(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MinX = CGRectGetMinX(v37);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  v32 = MinX - CGRectGetMinX(v38);
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  MaxY = CGRectGetMaxY(v39);
  v40.origin.x = v31;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v18 = MaxY - CGRectGetMaxY(v40);
  v41.origin.y = v7;
  v41.origin.x = v30;
  v41.size.width = v9;
  v41.size.height = v11;
  MaxX = CGRectGetMaxX(v41);
  v42.origin.x = v31;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v20 = MaxX - CGRectGetMaxX(v42);
  v23 = v32;
  *(double *)v22.i64 = v33;
  if (v33 > 0.0)
    *(double *)v22.i64 = 0.0;
  if (v32 > 0.0)
    v23 = 0.0;
  if (v18 <= 0.0)
    v24 = v18;
  else
    v24 = 0.0;
  if (v20 > 0.0)
    v20 = 0.0;
  v25 = TUIInsetsExtendedForScale(v22, v23, v24, v20, a3, v21);
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (id)debugContentDescription
{
  return 0;
}

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  return 1;
}

- (id)modelIdentifierForEnclosingScrollable
{
  TUILayout *v2;
  TUILayout *v3;
  void *v4;

  v2 = self;
  do
  {
    v3 = (TUILayout *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](v2, "layoutAncestor"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout modelIdentifierForScrollable](v3, "modelIdentifierForScrollable"));
    if (v4)
      break;
    v2 = v3;
  }
  while (v3);

  return v4;
}

- (id)modelIdentifierForScrollable
{
  return 0;
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIModelLayoutable)model
{
  return self->_model;
}

- (TUILayoutController)controller
{
  return (TUILayoutController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (TUILayoutContaining)parent
{
  return (TUILayoutContaining *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSArray)children
{
  return self->_children;
}

- (CGPoint)computedOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_computedOrigin.x;
  y = self->_computedOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)computedNaturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_computedNaturalSize.width;
  height = self->_computedNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_cachedTransformModel, 0);
  TUI::Util::PartialStruct::Storage::~Storage((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
