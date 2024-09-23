@implementation UIIndexBarVisualStyle_LegacyiOS

- (BOOL)overlay
{
  return 0;
}

- (void)indexColorUpdated
{
  id v2;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

}

- (id)displayEntryFromEntry:(id)a3
{
  id v4;
  UIIndexBarDisplayEntry_LegacyIOS *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFAttributedString *v10;
  CTLineRef v11;
  void *v12;
  void *v13;
  __CFString *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _QWORD v21[2];
  _QWORD v22[3];
  CGRect BoundsWithOptions;
  CGRect v24;

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(UIIndexBarDisplayEntry_LegacyIOS);
  -[UIIndexBarDisplayEntry setEntry:](v5, "setEntry:", v4);
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      v21[0] = *(_QWORD *)off_1E1678D90;
      -[UIIndexBarVisualStyle_LegacyiOS font](self, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = *MEMORY[0x1E0CA8558];
      v22[0] = v6;
      v22[1] = *MEMORY[0x1E0C9AE50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (const __CFAttributedString *)objc_msgSend(v8, "initWithString:attributes:", v9, v7);

      v11 = CTLineCreateWithAttributedString(v10);
      -[UIIndexBarDisplayEntry_LegacyIOS setLine:](v5, "setLine:", v11);

      BoundsWithOptions = CTLineGetBoundsWithOptions(v11, 0x10uLL);
      -[UIIndexBarDisplayEntry_LegacyIOS setBounds:](v5, "setBounds:", BoundsWithOptions.origin.x, BoundsWithOptions.origin.y, BoundsWithOptions.size.width, BoundsWithOptions.size.height);
      v24 = CTLineGetBoundsWithOptions(v11, 8uLL);
      -[UIIndexBarDisplayEntry_LegacyIOS setTypeBounds:](v5, "setTypeBounds:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);

      break;
    case 1:
      -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIIndexBarEntry _dotImageInView:](UIIndexBarEntry, "_dotImageInView:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIIndexBarDisplayEntry_LegacyIOS setImage:](v5, "setImage:", v13);

      goto LABEL_7;
    case 2:
      v14 = CFSTR("UISectionListPoundSign");
      goto LABEL_6;
    case 3:
      v14 = CFSTR("UITableViewIndexSearchGlyph");
LABEL_6:
      _UIImageWithName(v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIIndexBarDisplayEntry_LegacyIOS setImage:](v5, "setImage:", v12);
LABEL_7:

      v15 = *MEMORY[0x1E0C9D538];
      v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v4, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      -[UIIndexBarDisplayEntry_LegacyIOS setBounds:](v5, "setBounds:", v15, v16, v18, v19);

      -[UIIndexBarDisplayEntry_LegacyIOS bounds](v5, "bounds");
      -[UIIndexBarDisplayEntry_LegacyIOS setTypeBounds:](v5, "setTypeBounds:");
      break;
    default:
      break;
  }

  return v5;
}

- (id)font
{
  void *v2;
  void *v3;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");

  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 11.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sizeUpdated
{
  CGSize v2;
  id v3;

  v2 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_cachedSizeToFit = (CGSize)*MEMORY[0x1E0C9D820];
  self->_cachedSize = v2;
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)displayEntriesUpdated
{
  id v2;

  self->_cachedSizeToFit = (CGSize)*MEMORY[0x1E0C9D820];
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD *ContextStack;
  CGContext *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
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
  void *v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  CGFloat v57;
  void *v58;
  double v59;
  double v60;
  const __CTLine *v61;
  char v62;
  double v63;
  CGAffineTransform v64;
  double v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v14 = 0;
  else
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_5;
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "userInterfaceIdiom") == 3)
  {

    goto LABEL_8;
  }
  v62 = dyld_program_sdk_at_least();

  if ((v62 & 1) == 0)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_5:
      objc_msgSend(v16, "set");
      v66.origin.x = v6;
      v66.origin.y = v8;
      v66.size.width = v10;
      v66.size.height = v12;
      CGContextFillRect(v14, v66);
LABEL_8:

    }
  }
  v65 = 0.0;
  -[UIIndexBarVisualStyle_LegacyiOS _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", &v65, v6, v8, v10, v12);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "indexColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "set");
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayEntries");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    for (i = 0; i != v30; ++i)
    {
      -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "displayEntries");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", i);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "bounds");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      -[UIIndexBarVisualStyle_LegacyiOS willDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:](self, "willDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", i, v14, v27, v19, v21, v23, v25, v35, v37, v39, v41);
      objc_msgSend(v34, "image");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v34, "image");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "imageWithTintColor:renderingMode:", v27, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v67.origin.x = v19;
        v67.origin.y = v21;
        v67.size.width = v23;
        v67.size.height = v25;
        CGRectGetMinX(v67);
        v63 = v38;
        v46 = v36;
        v68.origin.x = v19;
        v68.origin.y = v21;
        v68.size.width = v23;
        v68.size.height = v25;
        CGRectGetWidth(v68);
        -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        UIRoundToViewScale(v47);
        v49 = v48;
        v69.origin.x = v19;
        v69.origin.y = v21;
        v69.size.width = v23;
        v69.size.height = v25;
        CGRectGetMinY(v69);
        -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        UIRoundToViewScale(v50);
        v52 = v51;

        v53 = v49;
        v36 = v46;
        v38 = v63;
        objc_msgSend(v45, "drawAtPoint:blendMode:alpha:", 0, v53, v52, 1.0);

        v25 = v42;
      }
      else
      {
        objc_msgSend(v34, "line");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          CGContextSaveGState(v14);
          v70.origin.x = v19;
          v70.origin.y = v21;
          v70.size.width = v23;
          v70.size.height = v25;
          CGRectGetMinX(v70);
          v63 = v36;
          v71.origin.x = v19;
          v71.origin.y = v21;
          v71.size.width = v23;
          v71.size.height = v25;
          CGRectGetWidth(v71);
          -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          UIRoundToViewScale(v55);
          v57 = v56;
          v72.origin.x = v19;
          v72.origin.y = v21;
          v72.size.width = v23;
          v72.size.height = v25;
          CGRectGetMinY(v72);
          objc_msgSend(v34, "typeBounds");
          -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          UIRoundToViewScale(v58);
          v60 = v59;

          v64.b = 0.0;
          v64.c = 0.0;
          v64.a = 1.0;
          v64.d = -1.0;
          v64.tx = v57;
          v64.ty = v60;
          v36 = v63;
          CGContextSetTextMatrix(v14, &v64);
          objc_msgSend(v34, "line");
          v61 = (const __CTLine *)objc_claimAutoreleasedReturnValue();
          CTLineDraw(v61, v14);

          CGContextRestoreGState(v14);
          v25 = v60 - v21;
        }
      }
      -[UIIndexBarVisualStyle_LegacyiOS didDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:](self, "didDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", i, v14, v27, v19, v21, v23, v25, v36, v38, v40, v42, *(_QWORD *)&v63);
      v21 = v21 + v25 + v65;

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_cachedSize;
  double v7;
  double v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x1E0C80C00];
  p_cachedSize = &self->_cachedSize;
  v7 = self->_cachedSize.width;
  v8 = self->_cachedSize.height;
  v9 = v7 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v9 || (self->_cachedSizeToFit.width == width ? (v10 = self->_cachedSizeToFit.height == height) : (v10 = 0), !v10))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v14 = 0.0;
    v15 = 0.0;
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v19, "bounds");
          v21 = v20;
          -[UIIndexBarVisualStyle_LegacyiOS _lineSpacingForCurrentIdiom](self, "_lineSpacingForCurrentIdiom");
          v23 = v22;
          objc_msgSend(v19, "bounds");
          if (v24 > v15)
          {
            objc_msgSend(v19, "bounds");
            v15 = v25;
          }
          v14 = v14 + v21 + v23 + v23;
        }
        v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

    v26 = fmax((height - v14) * 0.5, 0.0);
    self->_bottomPadding = v26;
    self->_topPadding = v26;
    -[UIIndexBarVisualStyle_LegacyiOS indexWidth](self, "indexWidth");
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    UICeilToViewScale(v27);
    v29 = v28;

    if (v29 > width)
      v30 = width;
    else
      v30 = v29;
    p_cachedSize->width = v30;
    p_cachedSize->height = height;
    self->_cachedSizeToFit.width = width;
    self->_cachedSizeToFit.height = height;
    v7 = p_cachedSize->width;
    v8 = p_cachedSize->height;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)_lineSpacingForCurrentIdiom
{
  void *v2;
  void *v3;
  double v4;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v4 = 16.0;
  else
    v4 = 6.0;

  return v4;
}

- (double)indexWidth
{
  void *v2;
  void *v3;
  double v4;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = _UIDefaultIndexBarWidthForTraitCollection(v3);
  return v4;
}

- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v46 = *MEMORY[0x1E0C80C00];
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayEntries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[UIIndexBarVisualStyle_LegacyiOS _lineSpacingForCurrentIdiom](self, "_lineSpacingForCurrentIdiom");
    v14 = v13;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayEntries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      v20 = 0.0;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "typeBounds");
          -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          UIRoundToViewScale(v22);
          v20 = v20 + v23;

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v18);
    }
    else
    {
      v20 = 0.0;
    }

    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayEntries");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    v29 = v28 - 1;
    v30 = v20 + v14 * (double)(unint64_t)(v28 - 1);
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "displayEntries");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "typeBounds");
    v25 = v30 - v34;
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    CGRectGetMinY(v47);
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    CGRectGetHeight(v48);
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v35);
    v24 = v36;

    if (a4)
      *a4 = v14;

  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v37 = x;
  v38 = v24;
  v39 = width;
  v40 = v25;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (double)minLineHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double verticalTextHeightEstimate;
  void *v11;
  void *v12;
  const __CFAttributedString *v13;
  const __CTLine *v14;
  const __CTLine *v15;
  double v16;
  uint64_t v17;
  _QWORD v18[2];
  CGRect BoundsWithOptions;

  v18[1] = *MEMORY[0x1E0C80C00];
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 3)
  {
    -[UIIndexBarVisualStyle_LegacyiOS _lineSpacingForCurrentIdiom](self, "_lineSpacingForCurrentIdiom");
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v6);
    v8 = v7;

    return v8;
  }
  else
  {
    verticalTextHeightEstimate = self->_verticalTextHeightEstimate;
    if (verticalTextHeightEstimate == 0.0)
    {
      v17 = *(_QWORD *)off_1E1678D90;
      -[UIIndexBarVisualStyle_LegacyiOS font](self, "font");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", 0x1E1787D00, v12);
      v14 = CTLineCreateWithAttributedString(v13);
      if (v14)
      {
        v15 = v14;
        BoundsWithOptions = CTLineGetBoundsWithOptions(v14, 8uLL);
        self->_verticalTextHeightEstimate = BoundsWithOptions.size.height;
        CFRelease(v15);
      }

      verticalTextHeightEstimate = self->_verticalTextHeightEstimate;
    }
    -[UIIndexBarVisualStyle_LegacyiOS _lineSpacingForCurrentIdiom](self, "_lineSpacingForCurrentIdiom");
    return verticalTextHeightEstimate + v16;
  }
}

- (UIIndexBarVisualStyle_LegacyiOS)initWithView:(id)a3
{
  id v4;
  UIIndexBarVisualStyle_LegacyiOS *v5;
  CGSize v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarVisualStyle_LegacyiOS;
  v5 = -[UIIndexBarVisualStyle_Base initWithView:](&v8, sel_initWithView_, v4);
  if (v5)
  {
    objc_msgSend(v4, "setOpaque:", 0);
    objc_msgSend(v4, "setDeliversTouchesForGesturesToSuperview:", 0);
    objc_msgSend(v4, "setExclusiveTouch:", 1);
    v6 = (CGSize)*MEMORY[0x1E0C9D820];
    v5->_cachedSize = (CGSize)*MEMORY[0x1E0C9D820];
    v5->_cachedSizeToFit = v6;
    objc_msgSend(v4, "setClipsToBounds:", 0);
    objc_msgSend(v4, "setBackgroundColor:", 0);
  }

  return v5;
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 3)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIIndexBarVisualStyle_LegacyiOS;
    v5 = -[UIIndexBarVisualStyle_Base canBecomeFocused](&v7, sel_canBecomeFocused);
  }

  return v5;
}

- (void)legibilityWeightOrPreferredContentSizeUpdated
{
  self->_verticalTextHeightEstimate = 0.0;
}

- (double)trackingChangeHysteresis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double result;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
  {

  }
  else
  {
    -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    result = 0.0;
    if (v7)
      return result;
  }
  return 11.0;
}

- (BOOL)updateSectionForTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  CGRect v26;
  CGRect v27;

  v5 = a3;
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v15);
  v17 = v16;
  v19 = v18;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entries");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count") >= 1)
  {
    v22 = -[UIIndexBarVisualStyle_Base _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:", v17, v19);
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    if (v19 >= CGRectGetMinY(v26))
    {
      v27.origin.x = v8;
      v27.origin.y = v10;
      v27.size.width = v12;
      v27.size.height = v14;
      if (v19 <= CGRectGetMaxY(v27) && v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_didSelectEntry:atIndex:location:", v23, v22, v17, v19);

      }
    }
  }

  return 0;
}

- (UIColor)nonTrackingBackgroundColor
{
  return self->_nonTrackingBackgroundColor;
}

- (void)setNonTrackingBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonTrackingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

@end
