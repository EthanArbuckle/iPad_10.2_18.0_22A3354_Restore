@implementation _UITextViewSearchableObject

- (void)layoutManagedSubviews
{
  _UITextViewSearchableObject *v2;
  id *p_textView;
  id WeakRetained;
  void *v5;
  double y;
  double x;
  double height;
  double width;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  NSUInteger v38;
  NSUInteger v39;
  id v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSUInteger v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  uint64_t v67;
  void *v68;
  NSUInteger v69;
  NSUInteger v70;
  NSUInteger v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  void *v79;
  void *v80;
  id v81;
  double v82;
  double v83;
  id v84;
  double v85;
  double v86;
  double v87;
  id v88;
  double v89;
  double v90;
  id v91;
  double v92;
  double v93;
  double v94;
  id v95;
  NSMutableSet *obj;
  id *location;
  NSUInteger v99;
  NSUInteger v100;
  _QWORD v101[5];
  id v102;
  int64x2_t v103;
  int64x2_t v104;
  int64x2_t v105;
  double v106;
  double v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;
  NSRange v124;
  NSRange v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v2 = self;
  v123 = *MEMORY[0x1E0C80C00];
  if (self->_highlightedTextRange)
  {
    -[_UITextViewSearchableObject _setHighlightViewVisible:](self, "_setHighlightViewVisible:", 1);
    objc_storeStrong((id *)&v2->_visuallyHighlightedTextRange, v2->_highlightedTextRange);
    p_textView = (id *)&v2->_textView;
    WeakRetained = objc_loadWeakRetained((id *)&v2->_textView);
    objc_msgSend(WeakRetained, "_textLineRectsForRange:", v2->_highlightedTextRange);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v117 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "CGRectValue");
          v133.origin.x = v15;
          v133.origin.y = v16;
          v133.size.width = v17;
          v133.size.height = v18;
          v126.origin.x = x;
          v126.origin.y = y;
          v126.size.width = width;
          v126.size.height = height;
          v127 = CGRectUnion(v126, v133);
          x = v127.origin.x;
          y = v127.origin.y;
          width = v127.size.width;
          height = v127.size.height;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
      }
      while (v12);
    }

    +[UITextHighlightView preferredPreviewParametersForTextLineRects:](UITextHighlightView, "preferredPreviewParametersForTextLineRects:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = self;
    -[UITextHighlightView setOverriddenPreviewParameters:](self->_highlightView, "setOverriddenPreviewParameters:", v19);
    objc_msgSend(v19, "_textPathInsets");
    v21 = x + v20;
    v23 = y + v22;
    v25 = width - (v20 + v24);
    v27 = height - (v22 + v26);
    v28 = objc_loadWeakRetained(p_textView);
    objc_msgSend(v28, "contentScaleFactor");
    v30 = UIRectIntegralWithScale(v21, v23, v25, v27, v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;

    -[UIView frame](self->_highlightView, "frame");
    v134.origin.x = v30;
    v134.origin.y = v32;
    v134.size.width = v34;
    v134.size.height = v36;
    if (!CGRectEqualToRect(v128, v134))
    {
      -[UIView setFrame:](self->_highlightView, "setFrame:", v30, v32, v34, v36);
      -[UITextHighlightView invalidateContentView](self->_highlightView, "invalidateContentView");
    }

  }
  else
  {
    -[_UITextViewSearchableObject _setHighlightViewVisible:](self, "_setHighlightViewVisible:", 0);
  }
  if (-[NSMutableSet count](v2->_decoratedTextRanges, "count")
    && !-[_UITextViewSearchableObject _usesTransientHighlightBehavior](v2, "_usesTransientHighlightBehavior"))
  {
    -[_UITextViewSearchableObject _setDimmingViewVisible:](v2, "_setDimmingViewVisible:", 1);
    v37 = objc_loadWeakRetained((id *)&v2->_textView);
    v100 = objc_msgSend(v37, "_visibleRangeWithLayout:", 0);
    v39 = v38;

    v99 = v39;
    location = (id *)&v2->_textView;
    if (!v39)
    {
      v40 = objc_loadWeakRetained((id *)&v2->_textView);
      objc_msgSend(v40, "visibleRect");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v129.origin.x = v42;
      v129.origin.y = v44;
      v129.size.width = v46;
      v129.size.height = v48;
      MinX = CGRectGetMinX(v129);
      v130.origin.x = v42;
      v130.origin.y = v44;
      v130.size.width = v46;
      v130.size.height = v48;
      MinY = CGRectGetMinY(v130);
      v131.origin.x = v42;
      v131.origin.y = v44;
      v131.size.width = v46;
      v131.size.height = v48;
      MaxX = CGRectGetMaxX(v131);
      v132.origin.x = v42;
      v132.origin.y = v44;
      v132.size.width = v46;
      v132.size.height = v48;
      MaxY = CGRectGetMaxY(v132);
      v53 = objc_loadWeakRetained((id *)&v2->_textView);
      objc_msgSend(v53, "closestPositionToPoint:", MinX, MinY);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = objc_loadWeakRetained((id *)&v2->_textView);
      objc_msgSend(v55, "closestPositionToPoint:", MaxX, MaxY);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = objc_loadWeakRetained((id *)&v2->_textView);
      objc_msgSend(v57, "textRangeFromPosition:toPosition:", v54, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UITextViewSearchableObject _rangeProvider](v2, "_rangeProvider");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "_nsrangeForTextRange:", v58);
      v99 = v61;
      v100 = v60;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    obj = v2->_decoratedTextRanges;
    v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v113;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v113 != v65)
            objc_enumerationMutation(obj);
          v67 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j);
          -[_UITextViewSearchableObject _rangeProvider](v2, "_rangeProvider");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "_nsrangeForTextRange:", v67);
          v71 = v70;

          v124.location = v69;
          v124.length = v71;
          v125.length = v99;
          v125.location = v100;
          if (NSIntersectionRange(v124, v125).length)
          {
            v72 = objc_loadWeakRetained(location);
            objc_msgSend(v72, "selectionRectsForRange:", v67);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            v110 = 0u;
            v111 = 0u;
            v108 = 0u;
            v109 = 0u;
            v74 = v73;
            v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
            if (v75)
            {
              v76 = v75;
              v77 = *(_QWORD *)v109;
              do
              {
                for (k = 0; k != v76; ++k)
                {
                  if (*(_QWORD *)v109 != v77)
                    objc_enumerationMutation(v74);
                  v79 = (void *)MEMORY[0x1E0CB3B18];
                  objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * k), "rect");
                  objc_msgSend(v79, "valueWithCGRect:");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "addObject:", v80);

                }
                v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
              }
              while (v76);
            }

            v2 = self;
          }
        }
        v64 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v112, v121, 16);
      }
      while (v64);
    }

    v81 = objc_loadWeakRetained(location);
    objc_msgSend(v81, "contentSize");
    v83 = v82;

    v84 = objc_loadWeakRetained(location);
    objc_msgSend(v84, "bounds");
    v86 = v85;

    if (v83 >= v86)
      v87 = v83;
    else
      v87 = v86;
    v88 = objc_loadWeakRetained(location);
    objc_msgSend(v88, "contentSize");
    v90 = v89;

    v91 = objc_loadWeakRetained(location);
    objc_msgSend(v91, "bounds");
    v93 = v92;

    if (v90 >= v93)
      v94 = v90;
    else
      v94 = v93;
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __52___UITextViewSearchableObject_layoutManagedSubviews__block_invoke;
    v101[3] = &unk_1E16B7030;
    v103 = vdupq_n_s64(0xC089000000000000);
    v104 = v103;
    v101[4] = v2;
    v102 = v62;
    v105 = v103;
    v106 = v87 + 1600.0;
    v107 = v94 + 1600.0;
    v95 = v62;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v101);

  }
  else
  {
    -[_UITextViewSearchableObject _setDimmingViewVisible:](v2, "_setDimmingViewVisible:", 0);
  }
}

- (_UITextViewSearchableObject)initWithTextView:(id)a3
{
  id v4;
  _UITextViewSearchableObject *v5;
  _UITextViewSearchableObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewSearchableObject;
  v5 = -[_UITextViewSearchableObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_textView, v4);

  return v6;
}

- (void)_setHighlightViewVisible:(BOOL)a3
{
  UITextHighlightView *v4;
  UITextHighlightView *v5;
  UITextHighlightView *highlightView;
  id WeakRetained;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id location;

  if (self->_highlightViewVisible != a3)
  {
    self->_highlightViewVisible = a3;
    if (a3)
    {
      if (!self->_highlightView)
      {
        objc_initWeak(&location, self);
        v4 = [UITextHighlightView alloc];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke;
        v13[3] = &unk_1E16B6FE0;
        objc_copyWeak(&v14, &location);
        v5 = -[UITextHighlightView initWithPreviewProvider:](v4, "initWithPreviewProvider:", v13);
        highlightView = self->_highlightView;
        self->_highlightView = v5;

        WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
        objc_msgSend(WeakRetained, "matchHighlightColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextHighlightView setFillColor:](self->_highlightView, "setFillColor:", v8);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      -[_UITextViewSearchableObject _ensureSubviewOrder](self, "_ensureSubviewOrder");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_2;
      v12[3] = &unk_1E16B1B28;
      v12[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v12, 0, 0.2, 0.0);
    }
    else
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_3;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __56___UITextViewSearchableObject__setHighlightViewVisible___block_invoke_4;
      v9[3] = &unk_1E16B7008;
      objc_copyWeak(&v10, &location);
      v9[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v11, v9, 0.2, 0.0);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setDimmingViewVisible:(BOOL)a3
{
  UITextSearchingDimmingView *v4;
  UITextSearchingDimmingView *v5;
  UITextSearchingDimmingView *dimmingView;
  UITextSearchingDimmingView *v7;
  uint64_t v8;
  UITextSearchingDimmingView *v9;
  UITextSearchingDimmingView *v10;
  _QWORD v11[5];
  UITextSearchingDimmingView *v12;
  id v13;
  _QWORD v14[4];
  UITextSearchingDimmingView *v15;
  id location;
  _QWORD v17[5];

  if (self->_dimmingViewVisible != a3)
  {
    self->_dimmingViewVisible = a3;
    if (a3)
    {
      if (!self->_dimmingView)
      {
        v4 = [UITextSearchingDimmingView alloc];
        v5 = -[UITextSearchingDimmingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        dimmingView = self->_dimmingView;
        self->_dimmingView = v5;

        -[UIView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke;
      v17[3] = &unk_1E16B1B28;
      v17[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v17, 0, 0.2, 0.0);
      -[_UITextViewSearchableObject _ensureSubviewOrder](self, "_ensureSubviewOrder");
    }
    else
    {
      objc_initWeak(&location, self);
      v7 = self->_dimmingView;
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_2;
      v14[3] = &unk_1E16B1B28;
      v9 = v7;
      v15 = v9;
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __54___UITextViewSearchableObject__setDimmingViewVisible___block_invoke_3;
      v11[3] = &unk_1E16B6FB8;
      objc_copyWeak(&v13, &location);
      v11[4] = self;
      v10 = v9;
      v12 = v10;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v14, v11, 0.2, 0.0);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_activeFindSession
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeFindSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rangeProvider
{
  return objc_loadWeakRetained((id *)&self->_textView);
}

- (UITextRange)selectedTextRange
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextRange *)v3;
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  int64_t v11;

  if (a3 == a4)
    return 0;
  v7 = a4;
  objc_msgSend(a3, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v11 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v8, v9);

  return v11;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)_wordTerminationCharacteristicsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  UITextView **p_textView;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  int v25;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".!?։۔।።᙮‼‽⁈⁉。！．？｡,\"'’“”"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!location)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "characterAtIndex:", location - 1);

  if ((objc_msgSend(v6, "characterIsMember:", v11) & 1) == 0)
    v12 = objc_msgSend(v7, "characterIsMember:", v11);
  else
LABEL_3:
    v12 = 1;
  v13 = location + length;
  p_textView = &self->_textView;
  v15 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v15, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  v18 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v18, "textStorage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v13 >= v17)
  {
    v23 = objc_msgSend(v19, "length");

    if (v13 == v23)
      goto LABEL_9;
LABEL_11:
    v24 = 0;
    return ($96EE1C12479E9B303E9C2794B92A11A2)(v24 | v12);
  }
  objc_msgSend(v19, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "characterAtIndex:", v13);

  if (!objc_msgSend(v6, "characterIsMember:", v22))
  {
    v25 = objc_msgSend(v7, "characterIsMember:", v22);

    if (v25)
      goto LABEL_9;
    goto LABEL_11;
  }

LABEL_9:
  v24 = 256;
  return ($96EE1C12479E9B303E9C2794B92A11A2)(v24 | v12);
}

- (void)_performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "length");
  for (i = 0; i != 0x7FFFFFFFFFFFFFFFLL; v13 = objc_msgSend(v12, "length") - i)
  {
    v15 = objc_msgSend(v12, "rangeOfString:options:range:", v22, objc_msgSend(v8, "stringCompareOptions"), i, v13);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v17 = v15;
    v18 = v16;
    if (objc_msgSend(v8, "wordMatchMethod") == 2 || objc_msgSend(v8, "wordMatchMethod") == 1)
    {
      v19 = (int)-[_UITextViewSearchableObject _wordTerminationCharacteristicsForRange:](self, "_wordTerminationCharacteristicsForRange:", v17, v18);
      if (objc_msgSend(v8, "wordMatchMethod") == 2)
      {
        if ((~v19 & 0x101) != 0)
          goto LABEL_11;
      }
      else if (objc_msgSend(v8, "wordMatchMethod") == 1 && (v19 & 1) == 0)
      {
        goto LABEL_11;
      }
    }
    -[_UITextViewSearchableObject _rangeProvider](self, "_rangeProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_textRangeFromNSRange:", v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v9[2](v9, v21);
LABEL_11:
    i = v17 + v18;
  }

}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __94___UITextViewSearchableObject_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke;
  v15 = &unk_1E16B6F68;
  v16 = v9;
  v17 = v8;
  v10 = v8;
  v11 = v9;
  -[_UITextViewSearchableObject _performTextSearchWithQueryString:usingOptions:resultHandler:](self, "_performTextSearchWithQueryString:usingOptions:resultHandler:", v10, a4, &v12);
  objc_msgSend(v11, "finishedSearching", v12, v13, v14, v15);

}

- (BOOL)supportsTextReplacement
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v3 = objc_msgSend(WeakRetained, "isEditable");

  return v3;
}

- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  return 1;
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  UITextView **p_textView;
  id v7;
  id v8;
  id WeakRetained;

  p_textView = &self->_textView;
  v7 = a5;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(WeakRetained, "replaceRange:withText:", v8, v7);

}

- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  UITextView **p_textView;
  id WeakRetained;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88___UITextViewSearchableObject_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke;
  v30[3] = &unk_1E16B6F90;
  v12 = v11;
  v31 = v12;
  v25 = v8;
  -[_UITextViewSearchableObject _performTextSearchWithQueryString:usingOptions:resultHandler:](self, "_performTextSearchWithQueryString:usingOptions:resultHandler:", v8, v9, v30);
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(WeakRetained, "undoManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "beginUndoGrouping");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v12, "reverseObjectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        v22 = objc_loadWeakRetained((id *)p_textView);
        objc_msgSend(v22, "replaceRange:withText:", v21, v10);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v18);
  }

  v23 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v23, "undoManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "endUndoGrouping");

}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  id v8;
  NSMutableSet *v9;
  NSMutableSet *decoratedTextRanges;
  UITextRange *highlightedTextRange;
  NSMutableSet *v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  v8 = a4;
  if (!self->_decoratedTextRanges)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    decoratedTextRanges = self->_decoratedTextRanges;
    self->_decoratedTextRanges = v9;

  }
  if (a5 == 2)
  {
    -[_UITextViewSearchableObject _updateHighlightLabelForMatchedRange:](self, "_updateHighlightLabelForMatchedRange:", v14);
  }
  else
  {
    if (!-[_UITextViewSearchableObject compareFoundRange:toRange:inDocument:](self, "compareFoundRange:toRange:inDocument:", self->_highlightedTextRange, v14, v8))
    {
      highlightedTextRange = self->_highlightedTextRange;
      self->_highlightedTextRange = 0;

    }
    v12 = self->_decoratedTextRanges;
    if (a5)
      -[NSMutableSet addObject:](v12, "addObject:", v14);
    else
      -[NSMutableSet removeObject:](v12, "removeObject:", v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)clearAllDecoratedFoundText
{
  UITextRange *highlightedTextRange;
  void *v4;
  int v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[5];

  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  -[NSMutableSet removeAllObjects](self->_decoratedTextRanges, "removeAllObjects");
  -[_UITextViewSearchableObject _activeFindSession](self, "_activeFindSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearching");

  if (v5)
  {
    -[_UITextViewSearchableObject _activeFindSession](self, "_activeFindSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57___UITextViewSearchableObject_clearAllDecoratedFoundText__block_invoke;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    objc_msgSend(v6, "_performBlockWhenSearchResultsAreAvailable:", v8);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)clearHighlightView
{
  -[_UITextViewSearchableObject _setHighlightViewVisible:](self, "_setHighlightViewVisible:", 0);
}

- (void)didEndFindSession
{
  UITextRange *highlightedTextRange;

  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  -[NSMutableSet removeAllObjects](self->_decoratedTextRanges, "removeAllObjects");
  -[_UITextViewSearchableObject _setHighlightViewVisible:](self, "_setHighlightViewVisible:", 0);
  -[_UITextViewSearchableObject _setDimmingViewVisible:](self, "_setDimmingViewVisible:", 0);
}

- (void)useSelectionForFind
{
  UITextView **p_textView;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "selectedText");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v4 = objc_loadWeakRetained((id *)p_textView);
    objc_msgSend(v4, "findInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSearchText:", v6);

    +[UIFindInteraction _setGlobalFindBuffer:](UIFindInteraction, "_setGlobalFindBuffer:", v6);
  }

}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;

  v5 = a3;
  -[_UITextViewSearchableObject _rangeProvider](self, "_rangeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_nsrangeForTextRange:", v5);
  v9 = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "scrollRangeToVisible:", v7, v9);

}

- (void)_ensureSubviewOrder
{
  UITextView **p_textView;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  UITextSearchingDimmingView *dimmingView;
  UITextHighlightView *highlightView;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_textView = &self->_textView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(WeakRetained, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v10 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v10, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)p_textView);
  objc_msgSend(v12, "_containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "indexOfObject:", v13);

  if (self->_dimmingViewVisible)
    dimmingView = self->_dimmingView;
  else
    dimmingView = 0;
  v22[0] = dimmingView;
  if (self->_highlightViewVisible)
    highlightView = self->_highlightView;
  else
    highlightView = 0;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0;
  else
    v17 = v14 + 1;
  v22[1] = highlightView;
  v22[2] = v6;
  objc_msgSend(WeakRetained, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v22, 3, v17);

}

- (BOOL)_usesTransientHighlightBehavior
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindNavigatorVisible") ^ 1;

  return v4;
}

- (void)_updateHighlightLabelForMatchedRange:(id)a3
{
  id v5;
  int v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITextHighlightView *highlightView;
  _QWORD v15[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_highlightedTextRange, a3);
  if (-[_UITextViewSearchableObject _usesTransientHighlightBehavior](self, "_usesTransientHighlightBehavior"))
  {
    v6 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    v6 = objc_msgSend(WeakRetained, "_range:isEqualToRange:", v5, self->_visuallyHighlightedTextRange) ^ 1;

  }
  v8 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v8, "setSelectedTextRange:", v5);

  v9 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v9, "_textInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assistantDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UITextViewSearchableObject _usesTransientHighlightBehavior](self, "_usesTransientHighlightBehavior"))
  {
    objc_msgSend(v11, "grabberSuppressionAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v11, "obtainSelectionGrabberSuppressionAssertion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setGrabberSuppressionAssertion:", v13);

    }
  }
  -[_UITextViewSearchableObject layoutManagedSubviews](self, "layoutManagedSubviews");
  if (v6)
  {
    highlightView = self->_highlightView;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68___UITextViewSearchableObject__updateHighlightLabelForMatchedRange___block_invoke;
    v15[3] = &unk_1E16B1B28;
    v15[4] = self;
    -[UITextHighlightView animateWithCompletion:](highlightView, "animateWithCompletion:", v15);
  }

}

- (id)targetedPreviewForHighlightRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = *(_QWORD *)off_1E1678D98;
  v4 = a3;
  +[UIColor blackColor](UIColor, "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = *(_QWORD *)off_1E1678C50;
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_targetedPreviewForRange:withRenderingAttributes:", v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_visuallyHighlightedTextRange, 0);
  objc_storeStrong((id *)&self->_highlightedTextRange, 0);
  objc_storeStrong((id *)&self->_highlightContentsImageView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_decorationAttributes, 0);
  objc_storeStrong((id *)&self->_decoratedTextRanges, 0);
}

@end
