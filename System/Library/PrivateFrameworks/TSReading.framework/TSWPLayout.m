@implementation TSWPLayout

- (TSWPLayout)initWithInfo:(id)a3
{
  return -[TSWPLayout initWithInfo:frame:](self, "initWithInfo:frame:", a3, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (TSWPLayout)initWithInfo:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  TSWPLayout *v8;
  TSDLayoutGeometry *v9;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPLayout;
  v8 = -[TSDLayout initWithInfo:](&v11, sel_initWithInfo_, a3);
  if (v8)
  {
    v8->_columns = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (width > 0.0)
    {
      v9 = -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", x, y, width, height);
      -[TSDAbstractLayout setGeometry:](v8, "setGeometry:", v9);

    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPLayout;
  -[TSDLayout dealloc](&v3, sel_dealloc);
}

- (TSWPLayoutManager)layoutManager
{
  TSWPLayoutManager *result;
  TSWPLayoutManager *v4;

  result = self->_layoutManager;
  if (!result)
  {
    v4 = -[TSWPLayoutManager initWithStorage:owner:]([TSWPLayoutManager alloc], "initWithStorage:owner:", -[TSDLayout info](self, "info"), self);
    self->_layoutManager = v4;
    -[TSWPLayoutManager resetTopicNumbers](v4, "resetTopicNumbers");
    return self->_layoutManager;
  }
  return result;
}

- (BOOL)textLayoutValid
{
  return self->_textLayoutValid;
}

- (BOOL)caresAboutStorageChanges
{
  return 1;
}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPLayout;
  -[TSDLayout invalidateSize](&v3, sel_invalidateSize);
  -[TSWPLayout p_invalidateTextLayout](self, "p_invalidateTextLayout");
}

- (id)p_wpLayoutParent
{
  id result;

  objc_opt_class();
  -[TSDAbstractLayout parent](self, "parent");
  TSUProtocolCast();
  result = (id)TSUDynamicCast();
  if (!result)
  {
    -[TSDAbstractLayout parent](self, "parent");
    return (id)objc_msgSend((id)TSUProtocolCast(), "wpLayoutParentForLayout:", self);
  }
  return result;
}

- (BOOL)p_parentAutosizes
{
  id v3;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "autosizeFlagsForTextLayout:", self) != 0;
  return (char)v3;
}

- (id)dependentLayouts
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)TSWPLayout;
  v3 = -[TSDLayout dependentLayouts](&v17, sel_dependentLayouts);
  v4 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v4)
  {
    v5 = v4;
    v6 = v3 ? (id)objc_msgSend(v3, "mutableCopy") : (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = v6;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)objc_msgSend(v5, "dependentsOfTextLayout:", self, 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
  }
  return v3;
}

- (id)reliedOnLayouts
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSWPLayout additionalReliedOnLayoutsForTextWrap](self, "additionalReliedOnLayoutsForTextWrap");
  else
    return 0;
}

- (void)p_validateTextLayout
{
  _BOOL4 v3;
  void *v5;

  v3 = -[TSDLayout layoutState](self, "layoutState") != 1
    || -[TSDInfo length](-[TSDLayout info](self, "info"), "length") != 0;
  if (!self->_textLayoutValid && v3)
  {
    v5 = -[TSWPLayoutManager layoutIntoTarget:withLayoutState:outSync:](-[TSWPLayout layoutManager](self, "layoutManager"), "layoutIntoTarget:withLayoutState:outSync:", self, -[TSWPLayout initialLayoutState](self, "initialLayoutState"), 0);
    if (v5)
      -[TSWPLayoutManager destroyLayoutState:](-[TSWPLayout layoutManager](self, "layoutManager"), "destroyLayoutState:", v5);
    self->_textLayoutValid = 1;
  }
}

- (void)validate
{
  _BOOL4 textLayoutValid;
  id v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDLayoutGeometry *v12;
  uint64_t v13;
  objc_super v15;

  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    if (!-[TSWPLayout p_parentAutosizes](self, "p_parentAutosizes"))
    {
      v15.receiver = self;
      v15.super_class = (Class)TSWPLayout;
      -[TSDLayout validate](&v15, sel_validate);
      goto LABEL_14;
    }
    textLayoutValid = self->_textLayoutValid;
    if (!self->_textLayoutValid)
    {
      v4 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
      v5 = objc_opt_respondsToSelector();
      v6 = 10.0;
      v7 = 10.0;
      if ((v5 & 1) != 0)
        objc_msgSend(v4, "initialTextSize", 10.0, 10.0);
      objc_msgSend(v4, "autosizedFrameForTextLayout:textSize:", self, v7, v6);
      if (v10 > 0.0)
      {
        v12 = -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", v8, v9, v10, v11);
        -[TSDAbstractLayout setGeometry:](self, "setGeometry:", v12);

      }
    }
    -[TSWPLayout p_validateTextLayout](self, "p_validateTextLayout");
    v15.receiver = self;
    v15.super_class = (Class)TSWPLayout;
    -[TSDLayout validate](&v15, sel_validate);
    v13 = -[TSWPLayout autosizeFlags](self, "autosizeFlags") & 0x20;
    if (!textLayoutValid && (_DWORD)v13 != 0)
    {
      self->_textLayoutValid = 0;
LABEL_14:
      -[TSWPLayout p_validateTextLayout](self, "p_validateTextLayout");
    }
  }
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)layoutGeometryFromInfo
{
  return 0;
}

- (id)computeLayoutGeometry
{
  void *v3;
  id result;
  CGFloat *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSMutableArray *columns;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "layoutGeometryProviderForLayout:", self);
  if (!v3 || (result = (id)objc_msgSend(v3, "layoutGeometryForLayout:", self)) == 0)
  {
    v5 = (CGFloat *)MEMORY[0x24BDBF070];
    v6 = *MEMORY[0x24BDBF070];
    v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF070] + 24);
    v10 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
    if (v10)
    {
      v11 = v10;
      if (objc_msgSend(v10, "autosizeFlagsForTextLayout:", self))
      {
        x = *v5;
        y = v5[1];
        width = v5[2];
        height = v5[3];
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        columns = self->_columns;
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v46 != v19)
                objc_enumerationMutation(columns);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "frameBounds");
              v55.origin.x = v21;
              v55.origin.y = v22;
              v55.size.width = v23;
              v55.size.height = v24;
              v51.origin.x = x;
              v51.origin.y = y;
              v51.size.width = width;
              v51.size.height = height;
              v52 = CGRectUnion(v51, v55);
              x = v52.origin.x;
              y = v52.origin.y;
              width = v52.size.width;
              height = v52.size.height;
            }
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v18);
        }
        objc_msgSend(-[TSWPLayout columnMetricsForCharIndex:outRange:](self, "columnMetricsForCharIndex:outRange:", 0x7FFFFFFFFFFFFFFFLL, 0), "adjustedInsets");
        v26 = -v25;
        v28 = -v27;
        v53.origin.x = x;
        v53.origin.y = y;
        v53.size.width = width;
        v53.size.height = height;
        v54 = CGRectInset(v53, v26, v28);
        objc_msgSend(v11, "autosizedFrameForTextLayout:textSize:", self, v54.size.width, v54.size.height);
      }
      else
      {
        objc_msgSend(v11, "nonAutosizedFrameForTextLayout:", self);
      }
      v6 = v29;
      v7 = v30;
      v8 = v31;
      v9 = v32;
    }
    else
    {
      objc_opt_class();
      -[TSDAbstractLayout parent](self, "parent");
      v33 = (void *)TSUDynamicCast();
      if (v33)
      {
        v34 = v33;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "info"), "geometry"), "boundsBeforeRotation");
        v36 = v35;
        v38 = v37;
        v8 = v39;
        v9 = v40;
        objc_msgSend((id)objc_msgSend(v34, "geometry"), "frame");
        v6 = TSDSubtractPoints(v36, v38, v41);
        v7 = v42;
      }
      else
      {
        v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayout computeLayoutGeometry]");
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 288, CFSTR("TSWPLayout requires a parent"));
      }
    }
    return -[TSDLayoutGeometry initWithFrame:]([TSDLayoutGeometry alloc], "initWithFrame:", v6, v7, v8, v9);
  }
  return result;
}

- (void)initialLayoutState
{
  id v3;
  int v4;
  void *v5;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v3, "allowsLastLineTruncation:", self))
      v4 = 32;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)operator new();
  TSWPLayoutChore::TSWPLayoutChore((uint64_t)v5, -[TSDLayout info](self, "info"), self, self->_layoutManager, objc_msgSend(v3, "initialCharIndex"), v4, 0, 0, 0, 0);
  return v5;
}

- (void)invalidateTextLayout
{
  -[TSWPLayout p_invalidateTextLayout](self, "p_invalidateTextLayout");
  -[TSDLayout invalidate](self, "invalidate");
}

- (void)invalidateMaxAutoGrowWidth
{
  -[NSMutableArray removeAllObjects](self->_columns, "removeAllObjects");
  -[TSWPLayout invalidateSize](self, "invalidateSize");
}

- (void)p_invalidateTextLayout
{
  id v3;
  void *v4;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  self->_textLayoutValid = 0;
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "autosizeFlagsForTextLayout:", self))
    {
      if ((objc_msgSend(v4, "invalidGeometry") & 1) == 0)
        objc_msgSend(v4, "invalidateSize");
    }
  }
}

- (void)invalidateForFootnoteNumberingChange
{
  -[NSMutableArray removeAllObjects](self->_columns, "removeAllObjects");
  -[TSWPLayout invalidateSize](self, "invalidateSize");
}

- (BOOL)invalidateForPageCountChange
{
  NSMutableArray *columns;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  columns = self->_columns;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__TSWPLayout_invalidateForPageCountChange__block_invoke;
  v6[3] = &unk_24D82D140;
  v6[4] = &v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](columns, "enumerateObjectsUsingBlock:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    -[NSMutableArray removeAllObjects](self->_columns, "removeAllObjects");
    -[TSWPLayout invalidateSize](self, "invalidateSize");
    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __42__TSWPLayout_invalidateForPageCountChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "layoutResultFlags");
  if ((result & 0x80) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)invalidateParentForAutosizing
{
  objc_msgSend(-[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent"), "invalidateForAutosizingTextLayout:", self);
}

- (double)baselineForCharIndex:(unsigned int)a3
{
  NSMutableArray *columns;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  columns = self->_columns;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(columns);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "range");
        if (a3 >= v11 && a3 - v11 < v12)
        {
          objc_msgSend(v10, "baselineOfLineFragmentAtCharIndex:", a3);
          return v14;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  return v6;
}

- (Class)repClassOverride
{
  Class result;
  objc_super v4;

  result = (Class)objc_msgSend(-[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent"), "repClassForTextLayout:", self);
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)TSWPLayout;
    return -[TSDLayout repClassOverride](&v4, sel_repClassOverride);
  }
  return result;
}

- (BOOL)shouldDisplayGuides
{
  return 0;
}

- (BOOL)shouldProvideSizingGuides
{
  return 0;
}

- (void)parentWillChangeTo:(id)a3
{
  TSWPLayoutManager *layoutManager;

  -[TSWPLayoutManager clearOwner](self->_layoutManager, "clearOwner", a3);
  layoutManager = self->_layoutManager;
  if (layoutManager && -[TSWPLayoutManager dirtyRange](layoutManager, "dirtyRange") != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeAllObjects](self->_columns, "removeAllObjects");

  self->_layoutManager = 0;
}

- (void)parentDidChange
{
  if (-[TSDAbstractLayout parent](self, "parent"))
    -[TSWPLayout layoutManager](self, "layoutManager");
}

- (void)wrappableChildInvalidated:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPLayout;
  -[TSDLayout invalidate](&v4, sel_invalidate, a3);
  -[TSWPLayout p_invalidateTextLayout](self, "p_invalidateTextLayout");
}

- (CGRect)frameForCulling
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)TSWPLayout;
  -[TSDAbstractLayout frameForCulling](&v28, sel_frameForCulling);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = -[TSWPLayout columns](self, "columns", 0);
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "erasableBounds:", 0);
        v34.origin.x = v16;
        v34.origin.y = v17;
        v34.size.width = v18;
        v34.size.height = v19;
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v32 = CGRectUnion(v31, v34);
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v13);
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)p_protectedRectWithinLayoutForSelectionRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!TSDRectIsFinite(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
    y = v8;
    x = v9 * 0.5;
    width = 0.0;
    height = 0.0;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPoint)calculatePointFromSearchReference:(id)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  TSWPSelection *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  objc_opt_class();
  objc_msgSend(a3, "selection");
  v5 = TSUDynamicCast();
  v6 = 0.0;
  if (v5)
  {
    v7 = (void *)v5;
    v8 = 0.0;
    if (-[NSMutableArray count](self->_columns, "count"))
    {
      v9 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", objc_msgSend(v7, "start"), 0);
      +[TSWPColumn caretRectForInsertionPoint:withColumns:](TSWPColumn, "caretRectForInsertionPoint:withColumns:", v9, self->_columns);
      -[TSWPLayout p_protectedRectWithinLayoutForSelectionRect:](self, "p_protectedRectWithinLayoutForSelectionRect:");
      -[TSDAbstractLayout rectInRoot:](self, "rectInRoot:");
      v8 = v10;
      v6 = v11;

    }
  }
  else
  {
    v8 = 0.0;
  }
  v12 = v8;
  v13 = v6;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  TSDInfo *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v9 = -[TSDLayout info](self, "info");
  v10 = -[TSDInfo range](v9, "range");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__TSWPLayout_layoutSearchForString_options_hitBlock___block_invoke;
  v14[3] = &unk_24D82D168;
  v14[4] = self;
  v14[5] = a5;
  v12 = (void *)-[TSDInfo searchInRange:forString:options:onHit:](v9, "searchInRange:forString:options:onHit:", v10, v11, a3, a4, v14);
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend(v12, "isComplete") & 1) == 0)
    {
      do
        -[TSDInfo continueSearch:](v9, "continueSearch:", v13);
      while (!objc_msgSend(v13, "isComplete"));
    }
  }
}

uint64_t __53__TSWPLayout_layoutSearchForString_options_hitBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "calculatePointFromSearchReference:", a2);
  objc_msgSend(a2, "setSearchReferencePoint:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)layoutSearchForAnnotationWithHitBlock:(id)a3
{
  TSDInfo *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];

  v5 = -[TSDLayout info](self, "info");
  v6 = -[TSDInfo range](v5, "range");
  v8 = v7;
  v9 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke;
  v11[3] = &unk_24D82D168;
  v11[4] = self;
  v11[5] = a3;
  -[TSDInfo findCommentsInRange:onHit:](v5, "findCommentsInRange:onHit:", v6, v7, v11);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke_2;
  v10[3] = &unk_24D82D168;
  v10[4] = self;
  v10[5] = a3;
  -[TSDInfo findChangesInRange:onHit:](v5, "findChangesInRange:onHit:", v6, v8, v10);
}

uint64_t __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "calculatePointFromSearchReference:", a2);
  objc_msgSend(a2, "setSearchReferencePoint:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __52__TSWPLayout_layoutSearchForAnnotationWithHitBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "calculatePointFromSearchReference:", a2);
  objc_msgSend(a2, "setSearchReferencePoint:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  NSUInteger v6;

  if (a4)
  {
    a4->location = -[TSWPStorage range](-[TSWPLayoutManager storage](-[TSWPLayout layoutManager](self, "layoutManager", a3), "storage"), "range");
    a4->length = v6;
  }
  -[TSDAbstractLayout parent](self, "parent", a3);
  return (id)TSUProtocolCast();
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  return 0;
}

- (const)previousTargetTopicNumbers
{
  return 0;
}

- (const)nextTargetTopicNumbers
{
  return 0;
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  return 0;
}

- (TSDHint)nextTargetFirstChildHint
{
  return 0;
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  -[TSDAbstractLayout parent](self, "parent");
  return (TSWPFootnoteHeightMeasurer *)TSUProtocolCast();
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  -[TSDAbstractLayout parent](self, "parent");
  return (TSWPFootnoteMarkProvider *)TSUProtocolCast();
}

- (BOOL)isLastTarget
{
  return 1;
}

- (CGSize)minSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  id v9;
  char v10;
  double v11;
  double v12;
  CGSize result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  v4 = v3;
  v6 = v5;
  v7 = -[TSWPLayout textIsVertical](self, "textIsVertical");
  if (v7)
    v8 = v6;
  else
    v8 = v4;
  if (!v7)
    v4 = v6;
  v9 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v9)
  {
    v10 = objc_msgSend(v9, "autosizeFlagsForTextLayout:", self);
    if ((v10 & 8) != 0)
      v8 = 0.0;
    if ((v10 & 2) != 0)
      v4 = 0.0;
  }
  v11 = v8;
  v12 = v4;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)maxSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  v4 = v3;
  v6 = v5;
  v7 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (!v7)
  {
    v10 = v4;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = -[TSWPLayout textIsVertical](self, "textIsVertical");
  if (v9)
    v10 = v6;
  else
    v10 = v4;
  if (v9)
    v6 = v4;
  v11 = objc_msgSend(v8, "autosizeFlagsForTextLayout:", self);
  if ((v11 & 4) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v10 = 4000.0;
      if ((v11 & 1) == 0)
        goto LABEL_17;
      goto LABEL_14;
    }
    objc_msgSend(v8, "maxAutoGrowWidthForTextLayout:", self);
    v10 = v12;
  }
  if ((v11 & 1) == 0)
    goto LABEL_17;
LABEL_14:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "maxAutoGrowHeightForTextLayout:", self);
    v6 = v13;
  }
  else
  {
    v6 = 16000.0;
  }
LABEL_17:
  v14 = v10;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)currentSize
{
  double v2;
  double v3;
  CGSize result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)position
{
  double v2;
  double v3;
  CGPoint result;

  -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](self, "geometry"), "frame");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (unsigned)autosizeFlags
{
  id v3;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "autosizeFlagsForTextLayout:", self);
  return v3;
}

- (unsigned)verticalAlignment
{
  id v3;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "verticalAlignmentForTextLayout:", self);
  return v3;
}

- (unsigned)naturalAlignment
{
  id v3;
  void *v4;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v3 && (v4 = v3, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(v4, "naturalAlignmentForTextLayout:", self);
  else
    return 4;
}

- (int)naturalDirection
{
  return -1;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDAbstractLayout frameInRoot](self, "frameInRoot");
  v8 = -v7;
  v10 = -v9;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectOffset(v11, v8, v10);
}

- (TSDCanvas)canvas
{
  return (TSDCanvas *)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas");
}

- (id)layoutForInlineDrawable:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[TSDAbstractLayout children](self, "children", 0, 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_opt_class();
      v10 = (void *)TSUDynamicCast();
      if (v10)
      {
        v11 = v10;
        if ((id)objc_msgSend(v10, "info") == a3)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "layoutClass")), "initWithInfo:", a3);
    if (v11)
    {
      -[TSDAbstractLayout addChild:](self, "addChild:", v11);

    }
  }
  objc_msgSend(v11, "updateChildrenFromInfo");
  return v11;
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayout validatedLayoutForAnchoredDrawable:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 783, CFSTR("Anchored attachments not supported in non-body text."));
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  if ((TSWPLayout *)objc_msgSend(a3, "parent") != self)
    -[TSDAbstractLayout addChild:](self, "addChild:", a3);
  objc_msgSend(a3, "updateChildrenFromInfo");
}

- (id)currentAnchoredDrawableLayouts
{
  return 0;
}

- (double)maxAnchorY
{
  double v3;
  double v4;
  double v5;

  -[TSWPLayout position](self, "position");
  v4 = v3;
  -[TSWPLayout maxSize](self, "maxSize");
  return v4 + v5;
}

- (id)p_firstAncestorRespondingToSelector:(SEL)a3
{
  TSWPLayout *v3;

  while (1)
  {
    v3 = -[TSDAbstractLayout parent](self, "parent", a3);
    if (!v3 || (objc_opt_respondsToSelector() & 1) != 0)
      break;
    self = v3;
  }
  return v3;
}

- (unint64_t)pageNumber
{
  id v2;

  v2 = -[TSWPLayout p_firstAncestorRespondingToSelector:](self, "p_firstAncestorRespondingToSelector:", sel_pageNumber);
  if (v2)
    return objc_msgSend(v2, "pageNumber");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pageCount
{
  id v2;

  v2 = -[TSWPLayout p_firstAncestorRespondingToSelector:](self, "p_firstAncestorRespondingToSelector:", sel_pageCount);
  if (v2)
    return objc_msgSend(v2, "pageCount");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)textIsVertical
{
  id v3;
  void *v4;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v3 && (v4 = v3, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(v4, "textLayoutShouldLayoutVertically:", self);
  else
    return 0;
}

- (CGRect)maskRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = *MEMORY[0x24BDBF070];
  v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v7 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "maskRectForTextLayout:", self);
    v3 = v8;
    v4 = v9;
    v5 = v10;
    v6 = v11;
  }
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isLayoutOffscreen
{
  return objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "isLayoutOffscreen");
}

- (BOOL)layoutIsValid
{
  return self->_textLayoutValid;
}

- (BOOL)allowsLastLineTruncation
{
  id v3;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "allowsLastLineTruncation:", self);
  else
    return 0;
}

- (unsigned)maxLineCount
{
  id v3;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v3, "maxLineCountForTextLayout:", self);
  else
    return 0;
}

- (BOOL)ignoresEquationAlignment
{
  id v3;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  return (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v3, "textLayoutShouldIgnoreEquationAlignment:", self) != 0;
}

- (BOOL)shouldHyphenate
{
  char v3;
  id v4;

  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "documentRoot"), "shouldHyphenate");
  v4 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v4, "shouldHyphenateTextLayout:", self);
  else
    return v3;
}

- (void)layoutManagerNeedsLayout:(id)a3
{
  void *v4;
  uint64_t v5;

  if (-[TSWPLayout layoutManager](self, "layoutManager") != a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayout layoutManagerNeedsLayout:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 952, CFSTR("bad layout manager"));
  }
  -[TSWPLayout invalidateTextLayout](self, "invalidateTextLayout");
  if (-[TSWPLayout p_parentAutosizes](self, "p_parentAutosizes"))
  {
    -[TSWPLayout invalidateSize](self, "invalidateSize");
    -[TSWPLayout invalidateParentForAutosizing](self, "invalidateParentForAutosizing");
  }
}

- (id)textWrapper
{
  TSDAbstractLayout *v2;

  v2 = -[TSDAbstractLayout parent](self, "parent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDAbstractLayout textWrapperForExteriorWrap](v2, "textWrapperForExteriorWrap");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDAbstractLayout textWrapper](v2, "textWrapper");
  return 0;
}

- (id)lineHintsForTarget:(id)a3
{
  void *v4;
  uint64_t v5;
  id result;

  if (a3 != self)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayout lineHintsForTarget:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayout.mm"), 987, CFSTR("unexpected target"));
  }
  -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  objc_opt_class();
  result = (id)TSUDynamicCast();
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "info"), "lineHints");
  return result;
}

- (CGRect)rectForSelection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSWPLayout p_rectForSelection:useParagraphModeRects:](self, "p_rectForSelection:useParagraphModeRects:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[TSWPLayout p_rectForSelection:useParagraphModeRects:](self, "p_rectForSelection:useParagraphModeRects:", a3, 0);
  -[TSWPLayout p_protectedRectWithinLayoutForSelectionRect:](self, "p_protectedRectWithinLayoutForSelectionRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)p_rectForSelection:(id)a3 useParagraphModeRects:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  v4 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TSWPLayout;
  -[TSDLayout rectForSelection:](&v23, sel_rectForSelection_);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_opt_class();
  v14 = TSUDynamicCast();
  if (v14)
  {
    +[TSWPColumn rectForSelection:withColumns:useParagraphModeRects:](TSWPColumn, "rectForSelection:withColumns:useParagraphModeRects:", v14, -[TSWPLayout columns](self, "columns"), v4);
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;
  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)styleProvider
{
  id v3;
  void *v4;
  id result;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (!v3)
    return +[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", -[TSWPLayoutManager storage](-[TSWPLayout layoutManager](self, "layoutManager"), "storage"));
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return +[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", -[TSWPLayoutManager storage](-[TSWPLayout layoutManager](self, "layoutManager"), "storage"));
  result = (id)objc_msgSend(v4, "styleProviderForLayout:", self);
  if (!result)
    return +[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", -[TSWPLayoutManager storage](-[TSWPLayout layoutManager](self, "layoutManager"), "storage"));
  return result;
}

- (TSDBezierPath)interiorClippingPath
{
  TSDAbstractLayout *v2;

  v2 = -[TSDAbstractLayout parent](self, "parent");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (TSDBezierPath *)-[TSDAbstractLayout interiorClippingPath](v2, "interiorClippingPath");
  else
    return 0;
}

- (unsigned)lineCount
{
  NSMutableArray *columns;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  columns = self->_columns;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    LODWORD(v5) = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(columns);
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "countLines") + v5;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return v5;
}

- (id)textColorOverride
{
  if (-[TSDCanvas isPrinting](-[TSWPLayout canvas](self, "canvas"), "isPrinting")
    && -[TSDCanvas shouldSuppressBackgrounds](-[TSWPLayout canvas](self, "canvas"), "shouldSuppressBackgrounds"))
  {
    return (id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldWrapAroundExternalDrawables
{
  id v3;
  void *v4;

  v3 = -[TSWPLayout p_wpLayoutParent](self, "p_wpLayoutParent");
  if (v3 && (v4 = v3, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(v4, "textLayoutShouldWrapAroundExternalDrawables:", self);
  else
    return 0;
}

- (NSMutableArray)columns
{
  return self->_columns;
}

@end
