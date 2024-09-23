@implementation _UIFocusLinearMovementDebugView

- (_UIFocusLinearMovementDebugView)init
{
  return -[_UIFocusLinearMovementDebugView initWithItems:](self, "initWithItems:", MEMORY[0x1E0C9AA60]);
}

- (_UIFocusLinearMovementDebugView)initWithItems:(id)a3
{
  id v4;
  _UIFocusLinearMovementDebugView *v5;
  _UIFocusLinearMovementDebugView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusLinearMovementDebugView;
  v5 = -[UIView init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_items, v7);
    v6->_colorCoding = 0;
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v6, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v8);

  }
  return v6;
}

- (_UIFocusLinearMovementDebugView)initWithGroups:(id)a3
{
  id v4;
  _UIFocusLinearMovementDebugView *v5;
  _UIFocusLinearMovementDebugView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusLinearMovementDebugView;
  v5 = -[UIView init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_groups, v7);
    v6->_colorCoding = 1;
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v6, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v8);

  }
  return v6;
}

- (BOOL)isGroupMode
{
  return self->_groups != 0;
}

- (id)_itemFramesFromItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = _UIFocusItemFrameInCoordinateSpace(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v10), self);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_groupFramesFromGroups:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_groups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "boundingBox", (_QWORD)v30);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v10, "coordinateSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v19, v12, v14, v16, v18);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v21, v23, v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v28);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_primaryGroupFramesFromGroups:(id)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_groups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "primaryRect", (_QWORD)v30);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        objc_msgSend(v10, "coordinateSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v19, v12, v14, v16, v18);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v21, v23, v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v28);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_lineSegmentsFromFrames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _UIFocusLinearMovementDebugViewLineSegment *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _UIFocusLinearMovementDebugViewLineSegment *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      v15 = v11;
      v16 = v12;
      v17 = v10;
      v18 = v9;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "CGRectValue", (_QWORD)v25);
        v9 = v19;
        v10 = v20;
        v11 = v21;
        v12 = v22;
        v31.origin.x = v18;
        v31.origin.y = v17;
        v31.size.width = v15;
        v31.size.height = v16;
        if (!CGRectIsEmpty(v31))
        {
          v23 = -[_UIFocusLinearMovementDebugViewLineSegment initWithStartRect:endRect:previousSegment:]([_UIFocusLinearMovementDebugViewLineSegment alloc], "initWithStartRect:endRect:previousSegment:", v8, v18, v17, v15, v16, v9, v10, v11, v12);
          objc_msgSend(v4, "addObject:", v23);

          v8 = v23;
        }
        ++v14;
        v15 = v11;
        v16 = v12;
        v17 = v10;
        v18 = v9;
      }
      while (v7 != v14);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  double x;
  _QWORD *ContextStack;
  CGContext *v10;
  NSArray *items;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  unint64_t v22;
  void *v23;
  _BOOL4 colorCoding;
  unint64_t v25;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  _BOOL4 v46;
  unint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  double v71;
  CGContext *c;
  uint64_t v73;
  uint64_t v74;
  id obj;
  _UIFocusLinearMovementDebugView *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _BYTE v95[128];
  CGFloat lengths[2];
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v98 = *MEMORY[0x1E0C80C00];
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v10 = 0;
  else
    v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v10);
  v99.origin.x = x;
  v99.origin.y = y;
  v99.size.width = width;
  v99.size.height = height;
  CGContextClearRect(v10, v99);
  items = self->_items;
  if ((items == 0) == (self->_groups != 0))
  {
    if (items)
    {
LABEL_6:
      -[_UIFocusLinearMovementDebugView _itemFramesFromItems:](self, "_itemFramesFromItems:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusLinearMovementDebugView.m"), 138, CFSTR("%@ needs to be created with either items or groups."), v15);

    if (self->_items)
      goto LABEL_6;
  }
  -[_UIFocusLinearMovementDebugView _groupFramesFromGroups:](self, "_groupFramesFromGroups:", self->_groups);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusLinearMovementDebugView _primaryGroupFramesFromGroups:](self, "_primaryGroupFramesFromGroups:", self->_groups);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v71 = height;
  -[_UIFocusLinearMovementDebugView _lineSegmentsFromFrames:](self, "_lineSegmentsFromFrames:", v12);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSaveGState(v10);
  c = v10;
  CGContextSetLineWidth(v10, 2.0);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
  v76 = self;
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v87 != v20)
          objc_enumerationMutation(v16);
        v22 = v19 + i;
        v23 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        colorCoding = self->_colorCoding;
        v25 = objc_msgSend(v16, "count");
        if (colorCoding)
          +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", (double)v22 / (double)v25, 1.0, 1.0, 1.0);
        else
          +[UIColor systemBlueColor](UIColor, "systemBlueColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setStroke");
        objc_msgSend(v26, "colorWithAlphaComponent:", 0.2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFill");

        objc_msgSend(v23, "CGRectValue");
        v28 = v100.origin.x;
        v29 = v100.origin.y;
        v30 = v100.size.width;
        v31 = v100.size.height;
        if (!CGRectIsNull(v100))
        {
          v101.origin.x = v28;
          v101.origin.y = v29;
          v101.size.width = v30;
          v101.size.height = v31;
          CGContextFillRect(c, v101);
          v102.origin.x = v28;
          v102.origin.y = v29;
          v102.size.width = v30;
          v102.size.height = v31;
          CGContextStrokeRect(c, v102);
        }
        if (v77)
        {
          objc_msgSend(v77, "objectAtIndexedSubscript:", v19 + i);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "CGRectValue");
          v34 = v33;
          v36 = v35;
          v38 = v37;
          v40 = v39;

          v103.origin.x = v34;
          v103.origin.y = v36;
          v103.size.width = v38;
          v103.size.height = v40;
          if (!CGRectIsNull(v103))
          {
            *(_OWORD *)lengths = xmmword_18667AE90;
            CGContextSetLineDash(c, (double)v22 * 4.0, lengths, 2uLL);
            v104.origin.x = v34;
            v104.origin.y = v36;
            v104.size.width = v38;
            v104.size.height = v40;
            v105 = CGRectInset(v104, 2.0, 2.0);
            CGContextStrokeRect(c, v105);
            CGContextSetLineDash(c, 0.0, 0, 0);
          }
        }

        self = v76;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
      v19 += i;
    }
    while (v18);
  }

  CGContextRestoreGState(c);
  CGContextSaveGState(c);
  CGContextSetLineWidth(c, 2.0);
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v16;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v74)
  {
    v41 = 0;
    v73 = *(_QWORD *)v83;
    v42 = *(_QWORD *)off_1E1678D90;
    v43 = *(_QWORD *)off_1E1678D98;
    do
    {
      for (j = 0; j != v74; ++j)
      {
        if (*(_QWORD *)v83 != v73)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
        v46 = self->_colorCoding;
        v47 = objc_msgSend(obj, "count");
        if (v46)
          +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", (double)(unint64_t)(v41 + j) / (double)v47, 1.0, 1.0, 1.0);
        else
          +[UIColor systemBlueColor](UIColor, "systemBlueColor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setStroke");
        objc_msgSend(v48, "colorWithAlphaComponent:", 0.2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setFill");

        objc_msgSend(v45, "CGRectValue");
        v51 = v50;
        v53 = v52;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v41 + j + 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = v42;
        objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v93[1] = v43;
        v94[0] = v55;
        v94[1] = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "drawAtPoint:withAttributes:", v56, v51, v53);

        if (v77)
        {
          objc_msgSend(v77, "objectAtIndexedSubscript:", v41 + j);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "CGRectValue");
          v59 = v58;
          v61 = v60;

          if (v51 != v59 || v53 != v61)
          {
            v91[0] = v42;
            objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v91[1] = v43;
            v92[0] = v62;
            v92[1] = v48;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "drawAtPoint:withAttributes:", v63, v59, v61);

          }
        }

        self = v76;
      }
      v41 += j;
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v74);
  }

  CGContextRestoreGState(c);
  CGContextSaveGState(c);
  +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setStroke");
  objc_msgSend(v64, "setFill");
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v65 = v70;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v67; ++k)
      {
        if (*(_QWORD *)v79 != v68)
          objc_enumerationMutation(v65);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "drawInRect:", x, y, width, v71);
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    }
    while (v67);
  }

  CGContextRestoreGState(c);
  CGContextRestoreGState(c);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
