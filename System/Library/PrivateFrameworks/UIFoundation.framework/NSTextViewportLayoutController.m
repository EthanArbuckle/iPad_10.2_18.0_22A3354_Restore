@implementation NSTextViewportLayoutController

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a3 = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_textLayoutManager, 0);
  objc_storeWeak((id *)&self->_textContainer, 0);
  objc_storeWeak((id *)&self->_delegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)NSTextViewportLayoutController;
  -[NSTextViewportLayoutController dealloc](&v3, sel_dealloc);
}

- (void)enumerateTextViewportElementsInRect:(CGRect)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  char v6;
  id v7;
  _QWORD v8[5];

  v6 = a4;
  v7 = -[NSTextViewportLayoutController textViewportElementsInRect:](self, "textViewportElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__NSTextViewportLayoutController_enumerateTextViewportElementsInRect_options_usingBlock___block_invoke;
  v8[3] = &unk_1E2605E30;
  v8[4] = a5;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2 * (v6 & 1), v8);

}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  double v6;
  uint64_t result;
  double v8;
  double v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location");
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(a2, "layoutSize");
  if (v6 + v8 <= *(double *)(a1 + 72))
  {
    result = objc_msgSend(a2, "layoutSize");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

BOOL __61__NSTextViewportLayoutController_textViewportElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a2, "layoutPoint");
  v5 = v4;
  objc_msgSend(a2, "layoutSize");
  return v5 + v6 <= *(double *)(a1 + 40);
}

- (id)textViewportElementsInRect:(CGRect)a3
{
  CGFloat x;
  double y;
  CGFloat width;
  double height;
  NSArray *viewportElements;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *i;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  _QWORD v23[2];
  BOOL (*v24)(uint64_t, void *);
  void *v25;
  NSRect v26;
  NSRect v27;
  NSRect v28;
  NSRect v29;

  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) != 0)
  {
    v27 = NSIntersectionRect(a3, self->_viewportBounds);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    viewportElements = self->_viewportElements;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v24 = __61__NSTextViewportLayoutController_textViewportElementsInRect___block_invoke;
    v25 = &__block_descriptor_64_e33_B16__0___NSTextViewportElement__8l;
    v26 = v27;
    v10 = -[NSArray count](viewportElements, "count");
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      do
      {
        v13 = -[NSArray objectAtIndexedSubscript:](viewportElements, "objectAtIndexedSubscript:", v12 + (v11 >> 1));
        if (((unsigned int (*)(_QWORD *, uint64_t))v24)(v23, v13))
        {
          v12 += (v11 >> 1) + 1;
          v11 += ~(v11 >> 1);
        }
        else
        {
          v11 >>= 1;
        }
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    for (i = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 < -[NSArray count](self->_viewportElements, "count");
          ++v12)
    {
      v15 = -[NSArray objectAtIndexedSubscript:](self->_viewportElements, "objectAtIndexedSubscript:", v12);
      objc_msgSend(v15, "layoutPoint");
      v17 = v16;
      objc_msgSend(v15, "layoutPoint");
      v19 = v18;
      objc_msgSend(v15, "layoutSize");
      v21 = v20;
      objc_msgSend(v15, "layoutSize");
      if (y + height < v19)
        break;
      v29.size.height = v22;
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v29.origin.x = v17;
      v29.origin.y = v19;
      v29.size.width = v21;
      if (NSIntersectsRect(v28, v29))
        objc_msgSend(i, "addObject:", v15);
    }
    return (id)objc_msgSend(i, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: %@ cannot be called during layout."), self, _NSFullMethodName());
    return (id)MEMORY[0x1E0C9AA60];
  }
}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t result;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "layoutPoint");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a2, "layoutSize");
  v11 = v10;
  v13 = v12;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a2, "representedRange");
  v14 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v14 + 112) & 0x10) != 0)
  {
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(void **)(*(_QWORD *)(v15 + 8) + 40);
    if (v16)
    {
      v17 = objc_msgSend((id)objc_msgSend(v16, "enclosingTextRange"), "containsLocation:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "location"));
      v15 = *(_QWORD *)(a1 + 64);
      if ((v17 & 1) == 0)
      {
        *(_QWORD *)(*(_QWORD *)(v15 + 8) + 40) = 0;
        v15 = *(_QWORD *)(a1 + 64);
      }
    }
    v18 = *(_QWORD *)(*(_QWORD *)(v15 + 8) + 40);
    v14 = *(_QWORD *)(a1 + 32);
    if (!v18)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(objc_loadWeak((id *)(v14 + 8)), "_textAnimationContextForLocation:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40), "location"));
      v14 = *(_QWORD *)(a1 + 32);
    }
  }
  if ((*(_WORD *)(v14 + 112) & 0x200) != 0 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v7;
    v19 = *(_QWORD *)(a1 + 32);
    if ((*(_WORD *)(v19 + 112) & 0x200) != 0)
    {
      objc_msgSend(objc_loadWeak((id *)(v19 + 24)), "textViewportLayoutController:presentationLayoutFragmentFrameForTextLayoutFragment:proposedOrigin:", *(_QWORD *)(a1 + 32), a2, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    }
    else
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v21 = v13;
      v22 = v11;
      v23 = v9;
      v24 = v7;
      if (!v20)
        goto LABEL_14;
      objc_msgSend(v20, "presentationLayoutFragmentFrameForTextLayoutFragment:proposedOrigin:", a2, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v11);
    }
    v24 = v25;
    v23 = v26;
    v21 = v27;
LABEL_14:
    v28 = v24;
    v29 = v23;
    v30 = v21;
    v50.origin.x = v7;
    v50.origin.y = v9;
    v50.size.width = v11;
    v50.size.height = v13;
    if (!CGRectEqualToRect(*(CGRect *)(&v22 - 2), v50))
    {
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      *(CGFloat *)(v31 + 32) = v24;
      *(CGFloat *)(v31 + 40) = v23;
      v13 = v21;
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v7;
    objc_msgSend(a2, "setLayoutPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
  v32 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v32 + 112) & 0x80) != 0)
  {
    v33 = objc_msgSend(objc_loadWeak((id *)(v32 + 24)), "textViewportLayoutController:renderingSurfaceForTextLayoutFragment:", *(_QWORD *)(a1 + 32), a2);
    if (v33)
      objc_msgSend(*(id *)(a1 + 32), "setRenderingSurface:forKey:", v33, a2);
  }
  v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v34
    || objc_msgSend(v34, "_hasRenderableComponentsForRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    v35 = *(void **)(a1 + 40);
    if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 112) & 0x20) != 0)
      objc_msgSend(v35, "textViewportLayoutController:configureRenderingSurfaceForTextLayoutFragment:");
    else
      objc_msgSend(v35, "layoutElement:", a2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "textViewportLayoutController:didLayoutTextViewportElement:", *(_QWORD *)(a1 + 32), a2);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v36 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "object");
        if (v41 != *(void **)(a1 + 40) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v41, "textViewportLayoutController:configureRenderingSurfaceForTextLayoutFragment:", *(_QWORD *)(a1 + 32), a2);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v38);
  }
  result = objc_msgSend(*(id *)(a1 + 48), "addObject:", a2);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v13
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 40);
  v43 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  if (!*(_QWORD *)(v43 + 40))
    *(_QWORD *)(v43 + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) >= *(double *)(a1 + 104) + *(double *)(a1 + 120))
    *a3 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  return result;
}

- (void)layoutViewport
{
  id v3;
  NSTextViewportElementProvider *v4;
  CGPoint *v5;
  CGSize v6;
  NSMutableArray *viewportLayoutObservers;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  double *v30;
  double v31;
  id v32;
  double y;
  id v34;
  id v35;
  _BOOL4 v36;
  uint64_t v37;
  id v38;
  uint64_t *v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  NSTextRange *v44;
  NSArray *viewportElements;
  __int16 viewportLayoutControllerFlags;
  id v47;
  id v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  id v53;
  NSTextViewportElementProvider *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[16];
  __int128 v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  uint64_t v64;
  _QWORD v65[12];
  _QWORD v66[4];
  _QWORD v67[10];
  _QWORD v68[5];
  uint64_t v69;
  double *v70;
  uint64_t v71;
  const char *v72;
  CGFloat x;
  CGFloat v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = -[NSTextViewportLayoutController delegate](self, "delegate");
  v4 = -[NSTextViewportLayoutController elementProvider](self, "elementProvider");
  v5 = (CGPoint *)MEMORY[0x1E0C9D538];
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 4) != 0)
  {
    v6 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_viewportBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_viewportBounds.size = v6;
    self->_viewportOffset = *v5;

    self->_viewportRange = 0;
  }
  v54 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "textViewportLayoutControllerWillLayout:", self);
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  viewportLayoutObservers = self->_viewportLayoutObservers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewportLayoutObservers, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v98 != v10)
          objc_enumerationMutation(viewportLayoutObservers);
        v12 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "object");
        v14 = (void *)v13;
        if (v13)
        {
          if ((id)v13 != v3 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "textViewportLayoutControllerWillLayout:", self);
        }
        else
        {
          v9 = v12;
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewportLayoutObservers, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    }
    while (v8);
    if (v9)
      -[NSMutableArray removeObject:](self->_viewportLayoutObservers, "removeObject:", v9);
  }
  *(_WORD *)&self->_viewportLayoutControllerFlags &= ~1u;
  -[NSMapTable removeAllObjects](self->_renderingSurfaces, "removeAllObjects");
  v91 = 0;
  v92 = &v91;
  v93 = 0x3052000000;
  v94 = __Block_byref_object_copy__14;
  v95 = __Block_byref_object_dispose__14;
  v96 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3052000000;
  v88 = __Block_byref_object_copy__14;
  v89 = __Block_byref_object_dispose__14;
  v90 = 0;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = *MEMORY[0x1E0CB3438];
  v17 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v18 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v19 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v21 = *MEMORY[0x1E0C9D538];
  v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 1;
  if (v3 && v54)
  {
    if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 0x20) != 0)
      objc_msgSend(v3, "viewportBoundsForTextViewportLayoutController:", self);
    else
      objc_msgSend(v3, "viewport");
    v16 = v22;
    v17 = v23;
    v18 = v24;
    v19 = v25;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3052000000;
    v78 = __Block_byref_object_copy__14;
    v79 = __Block_byref_object_dispose__14;
    v80 = 0;
    v69 = 0;
    v70 = (double *)&v69;
    v71 = 0x3010000000;
    v72 = "";
    v26 = self->_viewportBounds.origin.y - self->_viewportOffset.y;
    x = self->_viewportBounds.origin.x;
    v74 = v26;
    v27 = MEMORY[0x1E0C809B0];
    if ((*(_BYTE *)&self->_viewportLayoutControllerFlags & 0x40) != 0)
    {
      v60 = *MEMORY[0x1E0C9D820];
      v28 = objc_msgSend(v3, "locationForPositionInViewport:offset:", &v60, v22, v17);
      v29 = v76;
      v76[5] = v28;
      if (v28)
      {
        *((_BYTE *)v82 + 24) = 0;
        v30 = v70;
        v31 = v17 + *((double *)&v60 + 1);
        v70[4] = v16;
        v30[5] = v31;
        if (v29[5])
          goto LABEL_37;
      }
    }
    v32 = -[NSTextRange location](self->_viewportRange, "location");
    v76[5] = (uint64_t)v32;
    if (v17 < 0.001)
    {
      v70[5] = 0.0;
      v68[0] = v27;
      v68[1] = 3221225472;
      v68[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke;
      v68[3] = &unk_1E2605CD8;
      v68[4] = &v75;
      -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", 0, 4, v68);
LABEL_37:
      v39 = v76;
      if (v76[5])
      {
        *(_QWORD *)&v60 = 0;
        *((_QWORD *)&v60 + 1) = &v60;
        v61 = 0x3052000000;
        v62 = __Block_byref_object_copy__14;
        v63 = __Block_byref_object_dispose__14;
        v64 = 0;
        v40 = v70[4];
        v41 = fmax(v70[5], 0.0);
        v70[5] = v41;
        v20 = v17 - v41;
        v42 = v39[5];
        v59[0] = v27;
        v59[1] = 3221225472;
        v59[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke_4;
        v59[3] = &unk_1E2605D50;
        v59[8] = &v60;
        v59[9] = &v69;
        v59[4] = self;
        v59[5] = v3;
        v59[6] = v15;
        v59[7] = &v91;
        v59[10] = &v81;
        v59[11] = &v85;
        *(double *)&v59[12] = v40;
        *(double *)&v59[13] = v41;
        *(CGFloat *)&v59[14] = v18;
        v59[15] = ceil(v19 + v17 - v41);
        -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", v42, 4, v59);
        v21 = v16 - v40;
        _Block_object_dispose(&v60, 8);
      }
      else
      {
        v16 = *MEMORY[0x1E0C9D648];
        v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      _Block_object_dispose(&v69, 8);
      _Block_object_dispose(&v75, 8);
      goto LABEL_41;
    }
    y = self->_viewportBounds.origin.y;
    if (v17 == y)
    {
      v34 = -[NSTextRange location](self->_viewportRange, "location");
      v76[5] = (uint64_t)v34;
      goto LABEL_37;
    }
    *(_QWORD *)&v60 = 0;
    *((_QWORD *)&v60 + 1) = &v60;
    v61 = 0x2020000000;
    LOBYTE(v62) = 0;
    if (v17 >= y)
    {
      v66[0] = 0;
      v66[1] = v66;
      v37 = *((_QWORD *)v70 + 5);
      v66[2] = 0x2020000000;
      v66[3] = v37;
      v38 = -[NSTextRange location](self->_viewportRange, "location");
      v65[0] = v27;
      v65[1] = 3221225472;
      v65[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke_3;
      v65[3] = &unk_1E2605D28;
      v65[4] = &v75;
      v65[5] = v66;
      *(double *)&v65[8] = v16;
      *(double *)&v65[9] = v17;
      *(CGFloat *)&v65[10] = v18;
      *(double *)&v65[11] = v19;
      v65[6] = &v69;
      v65[7] = &v60;
      -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", v38, 2, v65);
      _Block_object_dispose(v66, 8);
      if (!*(_BYTE *)(*((_QWORD *)&v60 + 1) + 24))
LABEL_35:
        v76[5] = 0;
    }
    else
    {
      v35 = -[NSTextRange location](self->_viewportRange, "location");
      v67[0] = v27;
      v67[1] = 3221225472;
      v67[2] = __48__NSTextViewportLayoutController_layoutViewport__block_invoke_2;
      v67[3] = &unk_1E2605D00;
      *(double *)&v67[6] = v16;
      *(double *)&v67[7] = v17;
      *(CGFloat *)&v67[8] = v18;
      *(double *)&v67[9] = v19;
      v67[4] = &v69;
      v67[5] = &v75;
      -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", v35, 3, v67);
      v36 = v70[5] <= v17;
      *(_BYTE *)(*((_QWORD *)&v60 + 1) + 24) = v36;
      if (!v36)
        goto LABEL_35;
    }
    _Block_object_dispose(&v60, 8);
    goto LABEL_37;
  }
LABEL_41:
  self->_viewportBounds.origin.x = v16;
  self->_viewportBounds.origin.y = v17;
  self->_viewportBounds.size.width = v18;
  self->_viewportBounds.size.height = v19;
  self->_viewportOffset.x = v21;
  self->_viewportOffset.y = v20;
  v43 = (void *)objc_msgSend((id)v86[5], "textRangeByFormingUnionWithTextRange:", v92[5]);
  if (self->_viewportRange
    && objc_msgSend((id)objc_opt_class(), "flushesCachedViewportElements")
    && (objc_opt_respondsToSelector() & (v43 != 0)) == 1
    && (objc_msgSend(v43, "isEmpty") & 1) == 0
    && (objc_msgSend(v43, "containsRange:", self->_viewportRange) & 1) == 0)
  {
    if (objc_msgSend(-[NSTextRange location](self->_viewportRange, "location"), "compare:", objc_msgSend(v43, "location")) == -1)-[NSTextViewportElementProvider flushTextLayoutFragmentsFromLocation:direction:](v54, "flushTextLayoutFragmentsFromLocation:direction:", objc_msgSend(v43, "location"), 1);
    if (objc_msgSend((id)objc_msgSend(v43, "endLocation"), "compare:", -[NSTextRange endLocation](self->_viewportRange, "endLocation")) == -1)-[NSTextViewportElementProvider flushTextLayoutFragmentsFromLocation:direction:](v54, "flushTextLayoutFragmentsFromLocation:direction:", objc_msgSend(v43, "endLocation"), 0);
  }
  v44 = self->_viewportRange;
  self->_viewportRange = (NSTextRange *)v43;
  viewportElements = self->_viewportElements;
  if (viewportElements)

  self->_viewportElements = (NSArray *)objc_msgSend(v15, "copy");
  viewportLayoutControllerFlags = (__int16)self->_viewportLayoutControllerFlags;
  *(_WORD *)&self->_viewportLayoutControllerFlags = viewportLayoutControllerFlags | 1;
  if ((viewportLayoutControllerFlags & 0x100) == 0)
  {
    v47 = 0;
LABEL_54:
    v48 = 0;
    goto LABEL_57;
  }
  v47 = -[NSTextViewportLayoutController _platformRenderingSurfaceUpdater](self, "_platformRenderingSurfaceUpdater");
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 0x100) == 0)
    goto LABEL_54;
  v48 = -[NSTextViewportLayoutController renderingSurfaceUpdater](self, "renderingSurfaceUpdater");
LABEL_57:
  if ((unint64_t)v48 | (unint64_t)v47)
  {
    *(_WORD *)&self->_viewportLayoutControllerFlags |= 8u;
    if (v47)
      (*((void (**)(id, NSTextViewportLayoutController *, NSTextRange *, CGFloat, CGFloat, CGFloat, CGFloat))v47
       + 2))(v47, self, self->_viewportRange, self->_viewportBounds.origin.x, self->_viewportBounds.origin.y, self->_viewportBounds.size.width, self->_viewportBounds.size.height);
    if (v48)
      (*((void (**)(id, NSTextViewportLayoutController *, NSTextRange *, CGFloat, CGFloat, CGFloat, CGFloat))v48
       + 2))(v48, self, self->_viewportRange, self->_viewportBounds.origin.x, self->_viewportBounds.origin.y, self->_viewportBounds.size.width, self->_viewportBounds.size.height);
    *(_WORD *)&self->_viewportLayoutControllerFlags &= ~8u;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "textViewportLayoutControllerDidLayout:", self);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v49 = self->_viewportLayoutObservers;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v55, v101, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v56 != v51)
          objc_enumerationMutation(v49);
        v53 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "object");
        if (v53 != v3 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v53, "textViewportLayoutControllerDidLayout:", self);

      }
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v55, v101, 16);
    }
    while (v50);
  }

  *(_WORD *)&self->_viewportLayoutControllerFlags &= 0xFFF9u;
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

+ (BOOL)flushesCachedViewportElements
{
  if (flushesCachedViewportElements_onceToken != -1)
    dispatch_once(&flushesCachedViewportElements_onceToken, &__block_literal_global_30);
  return flushesCachedViewportElements_flushesCachedViewportElements;
}

- (CGRect)_viewportBounds
{
  __int16 viewportLayoutControllerFlags;
  CGRect *p_viewportBounds;
  CGFloat *p_height;
  CGSize *p_size;
  BOOL v6;
  CGFloat *p_y;
  double v8;
  double width;
  double x;
  double v11;
  CGRect result;

  viewportLayoutControllerFlags = (__int16)self->_viewportLayoutControllerFlags;
  p_viewportBounds = (CGRect *)MEMORY[0x1E0CB3438];
  p_height = (CGFloat *)(MEMORY[0x1E0CB3438] + 24);
  p_size = (CGSize *)(MEMORY[0x1E0CB3438] + 16);
  v6 = (viewportLayoutControllerFlags & 1) == 0;
  if ((viewportLayoutControllerFlags & 1) != 0)
    p_y = &self->_viewportBounds.origin.y;
  else
    p_y = (CGFloat *)(MEMORY[0x1E0CB3438] + 8);
  if (!v6)
  {
    p_viewportBounds = &self->_viewportBounds;
    p_size = &self->_viewportBounds.size;
    p_height = &self->_viewportBounds.size.height;
  }
  v8 = *p_height;
  width = p_size->width;
  x = p_viewportBounds->origin.x;
  v11 = *p_y;
  result.size.height = v8;
  result.size.width = width;
  result.origin.y = v11;
  result.origin.x = x;
  return result;
}

- (NSTextViewportLayoutController)initWithTextContainer:(id)a3
{
  NSTextViewportLayoutController *v4;
  NSTextViewportLayoutController *v5;

  v4 = -[NSTextViewportLayoutController initWithTextLayoutManager:](self, "initWithTextLayoutManager:", objc_msgSend(a3, "textLayoutManager"));
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_textContainer, a3);
  return v5;
}

- (NSTextViewportLayoutController)initWithTextLayoutManager:(NSTextLayoutManager *)textLayoutManager
{
  NSTextViewportLayoutController *v4;
  NSTextViewportLayoutController *v5;
  __int16 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSTextViewportLayoutController;
  v4 = -[NSTextViewportLayoutController init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_viewportLayoutControllerFlags |= 1u;
    objc_storeWeak((id *)&v4->_textLayoutManager, textLayoutManager);
    v5->_viewportLayoutObservers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_loadWeak((id *)&v5->_textLayoutManager);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = 16;
    else
      v6 = 0;
    *(_WORD *)&v5->_viewportLayoutControllerFlags = *(_WORD *)&v5->_viewportLayoutControllerFlags & 0xFFEF | v6;
  }
  return v5;
}

- (void)setNeedsLayout
{
  $805E37098AB790AEA86AA1C0B2AFB2A4 viewportLayoutControllerFlags;
  int v4;

  viewportLayoutControllerFlags = self->_viewportLayoutControllerFlags;
  if ((*(_BYTE *)&viewportLayoutControllerFlags & 2) == 0)
  {
    v4 = (*(unsigned int *)&viewportLayoutControllerFlags >> 10) & 3;
    if (v4 == 2)
    {
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "setNeedsLayout");
    }
    else if (v4 == 1)
    {
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "setNeedsLayout:", 1);
    }
    *(_WORD *)&self->_viewportLayoutControllerFlags |= 2u;
  }
}

uint64_t __63__NSTextViewportLayoutController_flushesCachedViewportElements__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("_NSTextViewportLayoutControllerDisablesFlushingCachedViewportElements"));
  flushesCachedViewportElements_flushesCachedViewportElements = result ^ 1;
  return result;
}

- (NSTextRange)viewportRange
{
  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) != 0)
    return self->_viewportRange;
  else
    return 0;
}

- (void)setDelegate:(id)delegate
{
  NSTextViewportLayoutDelegate_Private **p_delegate;
  int v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  char v13;
  __int16 v14;

  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate) != delegate)
  {
    objc_storeWeak((id *)p_delegate, delegate);
    v6 = objc_msgSend(objc_loadWeak((id *)p_delegate), "conformsToProtocol:", &unk_1EE095388);
    v7 = 0;
    if (v6)
      v8 = 32;
    else
      v8 = 0;
    *(_WORD *)&self->_viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFFDF | v8;
    if (v6)
    {
      objc_loadWeak((id *)p_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_loadWeak((id *)p_delegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = 32;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
    }
    *(_WORD *)&self->_viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFFDF | v7;
    objc_loadWeak((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 64;
    else
      v9 = 0;
    *(_WORD *)&self->_viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFFBF | v9;
    objc_loadWeak((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 128;
    else
      v10 = 0;
    *(_WORD *)&self->_viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFF7F | v10;
    objc_loadWeak((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 256;
    else
      v11 = 0;
    *(_WORD *)&self->_viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFEFF | v11;
    objc_loadWeak((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xF3FF | 0x400;
    }
    else
    {
      objc_loadWeak((id *)p_delegate);
      v13 = objc_opt_respondsToSelector();
      v12 = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xF3FF;
      if ((v13 & 1) != 0)
        v12 |= 0x800u;
    }
    *(_WORD *)&self->_viewportLayoutControllerFlags = v12;
    objc_loadWeak((id *)p_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 512;
    else
      v14 = 0;
    *(_WORD *)&self->_viewportLayoutControllerFlags = *(_WORD *)&self->_viewportLayoutControllerFlags & 0xFDFF | v14;
  }
}

uint64_t __89__NSTextViewportLayoutController_enumerateTextViewportElementsInRect_options_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textContainer);
  objc_destroyWeak((id *)&self->_textLayoutManager);
}

- (NSTextContainer)textContainer
{
  NSTextContainer *result;

  result = (NSTextContainer *)objc_loadWeak((id *)&self->_textContainer);
  if (!result)
    return (NSTextContainer *)objc_msgSend(objc_loadWeak((id *)&self->_textLayoutManager), "textContainer");
  return result;
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  NSTextContainer *v9;
  id Weak;
  _QWORD v11[6];

  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 0x10) != 0)
  {
    if ((a4 & 4) != 0)
      v9 = -[NSTextViewportLayoutController textContainer](self, "textContainer");
    else
      v9 = 0;
    Weak = objc_loadWeak((id *)&self->_textLayoutManager);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__NSTextViewportLayoutController_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
    v11[3] = &unk_1E2605CB0;
    v11[4] = v9;
    v11[5] = a5;
    objc_msgSend(Weak, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", a3, a4 | 8, v11);
  }
  else
  {
    -[NSTextViewportElementProvider enumerateViewportElementsFromLocation:options:usingBlock:](-[NSTextViewportLayoutController elementProvider](self, "elementProvider"), "enumerateViewportElementsFromLocation:options:usingBlock:", a3, a4, a5);
  }
}

uint64_t __91__NSTextViewportLayoutController_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (!a2)
    return 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 && v3 != objc_msgSend((id)objc_msgSend(a2, "textLayoutManager"), "_textContainerForCurrentEnumeratedElement"))
    return 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return 1;
}

uint64_t __48__NSTextViewportLayoutController_layoutViewport__block_invoke_2(uint64_t result, void *a2, _BYTE *a3)
{
  uint64_t v4;
  double v5;

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) <= *(double *)(result + 56))
  {
    *a3 = 1;
  }
  else
  {
    v4 = result;
    objc_msgSend(a2, "layoutSize");
    *(double *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8)
                                                                            + 40)
                                                                - v5;
    result = objc_msgSend((id)objc_msgSend(a2, "representedRange"), "location");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 40) = result;
  }
  return result;
}

- (CGFloat)relocateViewportToTextLocation:(id)textLocation
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  double v12;
  CGFloat *v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  _QWORD v20[7];
  _QWORD v21[9];
  _QWORD v22[4];
  _QWORD v23[9];
  _QWORD v24[4];
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;

  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__14;
  v33 = __Block_byref_object_dispose__14;
  v34 = 0;
  if (-[NSTextRange containsLocation:](self->_viewportRange, "containsLocation:"))
  {
    v5 = -[NSTextViewportLayoutController textViewportElementForLocation:](self, "textViewportElementForLocation:", textLocation);
    v6 = v5;
    v30[5] = (uint64_t)v6;
    objc_msgSend(v5, "layoutPoint");
    *((_QWORD *)v36 + 3) = v7;
  }
  else
  {
    if (objc_msgSend(-[NSTextRange location](self->_viewportRange, "location"), "compare:", textLocation) == 1)
    {
      v25 = 0;
      v26 = (double *)&v25;
      v27 = 0x2020000000;
      v28 = 0;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v24[3] = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke;
      v23[3] = &unk_1E2605D78;
      v23[4] = textLocation;
      v23[5] = v24;
      v23[6] = &v29;
      v23[7] = &v35;
      v23[8] = &v25;
      -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", 0, 2, v23);
      if (!v30[5])
      {
        v22[0] = 0;
        v22[1] = v22;
        v22[2] = 0x2020000000;
        v22[3] = 0;
        v9 = -[NSTextRange location](self->_viewportRange, "location");
        v21[0] = v8;
        v21[1] = 3221225472;
        v21[2] = __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_2;
        v21[3] = &unk_1E2605DA0;
        v21[6] = v22;
        v21[7] = &v29;
        v21[8] = &v35;
        v21[4] = textLocation;
        v21[5] = self;
        -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", v9, 3, v21);
        _Block_object_dispose(v22, 8);
      }
      _Block_object_dispose(v24, 8);
    }
    else
    {
      v25 = 0;
      v26 = (double *)&v25;
      v27 = 0x2020000000;
      v28 = 0;
      v10 = -[NSTextRange endLocation](self->_viewportRange, "endLocation");
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_3;
      v20[3] = &unk_1E2605DC8;
      v20[4] = textLocation;
      v20[5] = &v29;
      v20[6] = &v25;
      -[NSTextViewportLayoutController enumerateViewportElementsFromLocation:options:usingBlock:](self, "enumerateViewportElementsFromLocation:options:usingBlock:", v10, 2, v20);
      if (v30[5]
        || !objc_msgSend(textLocation, "isEqual:", -[NSTextRange endLocation](self->_viewportRange, "endLocation")))
      {
        v12 = CGRectGetMaxY(self->_viewportBounds) + self->_viewportOffset.y + v26[3];
      }
      else
      {
        v11 = -[NSArray lastObject](self->_viewportElements, "lastObject");
        v30[5] = (uint64_t)v11;
        objc_msgSend(v11, "layoutPoint");
      }
      v36[3] = v12;
    }
    _Block_object_dispose(&v25, 8);
  }
  v13 = (CGFloat *)MEMORY[0x1E0C9D538];
  v14 = (void *)v30[5];
  if (v14)
  {
    objc_msgSend(v14, "verticalOffsetOfTextLocation:withAffinity:", textLocation, 1);
    v16 = v15;

  }
  else
  {
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v17 = *v13;
  v18 = fmax(v16 + v36[3], 0.0);
  self->_viewportBounds.origin.y = v18;
  self->_viewportOffset.x = v17;
  self->_viewportOffset.y = v16;

  self->_viewportRange = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", textLocation);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

id __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke(_QWORD *a1, void *a2, BOOL *a3)
{
  id result;
  double v7;
  uint64_t v8;
  double v9;
  BOOL v10;

  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", a1[4]))
  {
    result = a2;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    v7 = *(double *)(*(_QWORD *)(a1[8] + 8) + 24);
    v8 = *(_QWORD *)(a1[7] + 8);
  }
  else
  {
    result = (id)objc_msgSend(a2, "layoutSize");
    v8 = *(_QWORD *)(a1[8] + 8);
    v7 = v9 + *(double *)(v8 + 24);
  }
  *(double *)(v8 + 24) = v7;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    v10 = 1;
  else
    v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) > 99;
  *a3 = v10;
  return result;
}

CGFloat __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_2(_QWORD *a1, void *a2)
{
  double v4;
  CGFloat result;
  CGRect *v6;

  objc_msgSend(a2, "layoutSize");
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v4 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", a1[4]))
  {
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = a2;
    v6 = (CGRect *)a1[5];
    result = CGRectGetMinY(v6[1]) + v6[2].origin.y - *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(CGFloat *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  }
  return result;
}

double __65__NSTextViewportLayoutController_relocateViewportToTextLocation___block_invoke_3(_QWORD *a1, void *a2, _BYTE *a3)
{
  double result;
  uint64_t v7;
  double v8;

  if (objc_msgSend((id)objc_msgSend(a2, "representedRange"), "containsLocation:", a1[4]))
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = a2;
    *a3 = 1;
  }
  else
  {
    objc_msgSend(a2, "layoutSize");
    v7 = *(_QWORD *)(a1[6] + 8);
    result = v8 + *(double *)(v7 + 24);
    *(double *)(v7 + 24) = result;
  }
  return result;
}

- (void)adjustViewportByVerticalOffset:(CGFloat)verticalOffset
{
  self->_viewportBounds.origin.y = fmax(self->_viewportBounds.origin.y + verticalOffset, 0.0);
}

- (void)adjustViewport:(double)a3 atLocation:(id)a4 verticalOffsetFromLocation:(double)a5
{
  NSTextRange *v8;

  -[NSTextViewportLayoutController adjustViewportByVerticalOffset:](self, "adjustViewportByVerticalOffset:", a3);
  if (a4)
  {
    v8 = self->_viewportRange;
    self->_viewportRange = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", a4);
  }
  self->_viewportOffset.y = a5;
}

- (CGRect)viewportBounds
{
  __int16 viewportLayoutControllerFlags;
  CGRect *p_viewportBounds;
  CGFloat *p_height;
  CGSize *p_size;
  BOOL v6;
  CGFloat *p_y;
  double v8;
  double width;
  double x;
  double v11;
  CGRect result;

  viewportLayoutControllerFlags = (__int16)self->_viewportLayoutControllerFlags;
  p_viewportBounds = (CGRect *)MEMORY[0x1E0CB3438];
  p_height = (CGFloat *)(MEMORY[0x1E0CB3438] + 24);
  p_size = (CGSize *)(MEMORY[0x1E0CB3438] + 16);
  v6 = (viewportLayoutControllerFlags & 1) == 0;
  if ((viewportLayoutControllerFlags & 1) != 0)
    p_y = &self->_viewportBounds.origin.y;
  else
    p_y = (CGFloat *)(MEMORY[0x1E0CB3438] + 8);
  if (!v6)
  {
    p_viewportBounds = &self->_viewportBounds;
    p_size = &self->_viewportBounds.size;
    p_height = &self->_viewportBounds.size.height;
  }
  v8 = *p_height;
  width = p_size->width;
  x = p_viewportBounds->origin.x;
  v11 = *p_y;
  result.size.height = v8;
  result.size.width = width;
  result.origin.y = v11;
  result.origin.x = x;
  return result;
}

- (void)_resetLayout
{
  *(_WORD *)&self->_viewportLayoutControllerFlags |= 4u;
}

- (void)setRenderingSurface:(id)a3 forKey:(id)a4
{
  NSMapTable *renderingSurfaces;

  objc_sync_enter(self);
  renderingSurfaces = self->_renderingSurfaces;
  if (!renderingSurfaces)
  {
    renderingSurfaces = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    self->_renderingSurfaces = renderingSurfaces;
  }
  -[NSMapTable setObject:forKey:](renderingSurfaces, "setObject:forKey:", a3, a4);
  objc_sync_exit(self);
}

- (id)renderingSurfaceForKey:(id)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[NSMapTable objectForKey:](self->_renderingSurfaces, "objectForKey:", a3);
  objc_sync_exit(self);
  return v5;
}

- (BOOL)addRenderingSurface:(id)a3 key:(id)a4 group:(int64_t)a5 placement:(int64_t)a6
{
  int v9;

  if ((~*(_WORD *)&self->_viewportLayoutControllerFlags & 0x108) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = objc_msgSend(objc_loadWeak((id *)&self->_delegate), "textViewportLayoutController:addRenderingSurface:group:placement:", self, a3, a5, a6);
    if (v9)
    {
      -[NSTextViewportLayoutController setRenderingSurface:forKey:](self, "setRenderingSurface:forKey:", a3, a4);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (id)textViewportElementAtPoint:(CGPoint)a3
{
  double y;
  NSArray *viewportElements;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v16[2];
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  CGPoint v19;

  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: %@ cannot be called during layout."), self, _NSFullMethodName());
    return 0;
  }
  y = a3.y;
  viewportElements = self->_viewportElements;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __61__NSTextViewportLayoutController_textViewportElementAtPoint___block_invoke;
  v18 = &__block_descriptor_48_e33_B16__0___NSTextViewportElement__8l;
  v19 = a3;
  v6 = -[NSArray count](viewportElements, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = -[NSArray objectAtIndexedSubscript:](viewportElements, "objectAtIndexedSubscript:", v8 + (v7 >> 1));
      if (((unsigned int (*)(_QWORD *, uint64_t))v17)(v16, v9))
      {
        v8 += (v7 >> 1) + 1;
        v7 += ~(v7 >> 1);
      }
      else
      {
        v7 >>= 1;
      }
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (v8 >= -[NSArray count](self->_viewportElements, "count"))
    return 0;
  v10 = -[NSArray objectAtIndexedSubscript:](self->_viewportElements, "objectAtIndexedSubscript:", v8);
  objc_msgSend(v10, "layoutPoint");
  if (y < v11)
    return 0;
  objc_msgSend(v10, "layoutPoint");
  v13 = v12;
  objc_msgSend(v10, "layoutSize");
  if (y > v13 + v14)
    return 0;
  return v10;
}

BOOL __61__NSTextViewportLayoutController_textViewportElementAtPoint___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a2, "layoutPoint");
  v5 = v4;
  objc_msgSend(a2, "layoutSize");
  return v5 + v6 <= *(double *)(a1 + 40);
}

- (id)locationAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;

  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) != 0)
  {
    y = a3.y;
    x = a3.x;
    v6 = -[NSTextViewportLayoutController textViewportElementAtPoint:](self, "textViewportElementAtPoint:");
    objc_msgSend(v6, "layoutPoint");
    v8 = x - v7;
    objc_msgSend(v6, "layoutPoint");
    return (id)objc_msgSend(v6, "representedRangeAtPoint:", v8, y - v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: %@ cannot be called during layout."), self, _NSFullMethodName());
    return 0;
  }
}

- (id)textViewportElementForLocation:(id)a3
{
  NSArray *viewportElements;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  id v10;
  _QWORD v12[2];
  BOOL (*v13)(uint64_t, void *);
  void *v14;
  id v15;

  if ((*(_WORD *)&self->_viewportLayoutControllerFlags & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: %@ cannot be called during layout."), self, _NSFullMethodName());
    return 0;
  }
  viewportElements = self->_viewportElements;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __65__NSTextViewportLayoutController_textViewportElementForLocation___block_invoke;
  v14 = &unk_1E2605E58;
  v15 = a3;
  v6 = -[NSArray count](viewportElements, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = -[NSArray objectAtIndexedSubscript:](viewportElements, "objectAtIndexedSubscript:", v8 + (v7 >> 1));
      if (((unsigned int (*)(_QWORD *, uint64_t))v13)(v12, v9))
      {
        v8 += (v7 >> 1) + 1;
        v7 += ~(v7 >> 1);
      }
      else
      {
        v7 >>= 1;
      }
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (v8 == -[NSArray count](self->_viewportElements, "count")
    && -[NSArray count](self->_viewportElements, "count")
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray lastObject](self->_viewportElements, "lastObject"), "representedRange"), "endLocation"), "isEqual:", a3))
  {
    v8 = -[NSArray count](self->_viewportElements, "count") - 1;
  }
  if (v8 >= -[NSArray count](self->_viewportElements, "count"))
    return 0;
  v10 = -[NSArray objectAtIndexedSubscript:](self->_viewportElements, "objectAtIndexedSubscript:", v8);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "representedRange"), "location"), "compare:", a3) == 1
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "representedRange"), "endLocation"), "compare:", a3) == -1)
  {
    return 0;
  }
  return v10;
}

BOOL __65__NSTextViewportLayoutController_textViewportElementForLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "representedRange"), "endLocation"), "compare:", *(_QWORD *)(a1 + 32)) != 1;
}

- (void)addViewportLayoutObserver:(id)a3
{
  _NSTextViewportLayoutObserver *v4;

  v4 = -[_NSTextViewportLayoutObserver initWithWeakObject:]([_NSTextViewportLayoutObserver alloc], "initWithWeakObject:", a3);
  if ((-[NSMutableArray containsObject:](self->_viewportLayoutObservers, "containsObject:") & 1) == 0)
    -[NSMutableArray addObject:](self->_viewportLayoutObservers, "addObject:", v4);

}

- (void)removeViewportLayoutObserver:(id)a3
{
  _NSTextViewportLayoutObserver *v4;

  v4 = -[_NSTextViewportLayoutObserver initWithWeakObject:]([_NSTextViewportLayoutObserver alloc], "initWithWeakObject:", a3);
  -[NSMutableArray removeObject:](self->_viewportLayoutObservers, "removeObject:", v4);

}

- (id)renderingSurfaceUpdater
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setRenderingSurfaceUpdater:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)_platformRenderingSurfaceUpdater
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)set_platformRenderingSurfaceUpdater:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

@end
