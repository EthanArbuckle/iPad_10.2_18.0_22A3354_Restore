@implementation TUICandidateView

- (void)commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUICandidateGrid *v8;
  TUICandidateGrid *v9;
  void *v10;
  void *v11;
  void *v12;
  TUICandidateSortControl *v13;
  TUICandidateSortControl *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[TUICandidateView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[TUICandidateView bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[TUICandidateView setClipsToBoundsView:](self, "setClipsToBoundsView:", v4);

  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView addSubview:](self, "addSubview:", v6);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView setRoundedBorderLayer:](self, "setRoundedBorderLayer:", v7);

  v8 = [TUICandidateGrid alloc];
  -[TUICandidateView bounds](self, "bounds");
  v9 = -[TUICandidateGrid initWithFrame:](v8, "initWithFrame:");
  -[TUICandidateView setPrimaryGrid:](self, "setPrimaryGrid:", v9);

  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = [TUICandidateSortControl alloc];
  -[TUICandidateView bounds](self, "bounds");
  v14 = -[TUICandidateSortControl initWithFrame:](v13, "initWithFrame:");
  -[TUICandidateView setSortControl:](self, "setSortControl:", v14);

  -[TUICandidateView sortControl](self, "sortControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  -[TUICandidateView sortControl](self, "sortControl");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_handleSortControlValueChanged, 4096);

  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView sortControl](self, "sortControl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v17);

}

- (TUICandidateView)initWithFrame:(CGRect)a3
{
  TUICandidateView *v3;
  TUICandidateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateView;
  v3 = -[TUICandidateView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateView commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateView)initWithCoder:(id)a3
{
  TUICandidateView *v3;
  TUICandidateView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateView;
  v3 = -[TUICandidateView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateView commonInit](v3, "commonInit");
  return v4;
}

- (CGRect)boundsForClipsToBoundsViewWithState:(id)a3
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  -[TUICandidateView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "yOffset");
  v14 = v13 + v8;
  objc_msgSend(v4, "additionalHeight");
  v16 = v15;

  v17 = v12 + v16;
  v18 = v6;
  v19 = v14;
  v20 = v10;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)sortControlHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[TUICandidateView state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowHeight");
  v6 = v5;
  -[TUICandidateView state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortControlPadding");
  v10 = v6 + v9;
  -[TUICandidateView state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortControlPadding");
  v14 = v10 + v13;

  return v14;
}

- (double)inlineTextHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[TUICandidateView state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowHeight");
  v5 = v4;

  return v5;
}

- (double)disambiguationHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[TUICandidateView state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowHeight");
  v6 = v5;
  -[TUICandidateView state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disambiguationStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridPadding");
  v10 = v6 + v9;

  return v10;
}

- (double)arrowButtonHeight
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[TUICandidateView state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrowButtonHeight");
  if (v5 == 0.0)
  {
    -[TUICandidateView state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rowHeight");
    v9 = v8;

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (double)arrowButtonWidth
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[TUICandidateView state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrowButtonPadding");
  v6 = v5;
  -[TUICandidateView state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrowButtonPadding");
  v10 = v6 + v9;
  -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
  if (v11 == 0.0)
    v11 = 42.0;
  v12 = v10 + v11;

  return v12;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUICandidateView;
  -[TUICandidateView layoutSubviews](&v3, sel_layoutSubviews);
  if (!-[TUICandidateView changingLayout](self, "changingLayout"))
  {
    -[TUICandidateView prepareForLayoutChange:](self, "prepareForLayoutChange:", 0);
    -[TUICandidateView changeLayoutInsideAnimationBlock](self, "changeLayoutInsideAnimationBlock");
    -[TUICandidateView updatePrimaryGridRowTypeWithOptions:animated:animator:completion:](self, "updatePrimaryGridRowTypeWithOptions:animated:animator:completion:", 0, 0, 0, 0);
    -[TUICandidateView finalizeLayoutChange](self, "finalizeLayoutChange");
  }
}

- (void)prepareForLayoutChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  TUICandidateBackdropView *v12;
  TUICandidateBackdropView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  TUICandidateInlineTextView *v23;
  TUICandidateInlineTextView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  TUICandidateGrid *v38;
  double v39;
  TUICandidateGrid *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  TUICandidateArrowButton *v113;
  double v114;
  double v115;
  double v116;
  TUICandidateArrowButton *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  TUICandidateMask *v135;
  TUICandidateMask *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  _QWORD v142[2];

  v3 = a3;
  v142[1] = *MEMORY[0x1E0C80C00];
  -[TUICandidateView setChangingLayout:](self, "setChangingLayout:", 1);
  -[TUICandidateView state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "doNotClipToBounds") ^ 1;
  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", v7);

  -[TUICandidateView boundsForClipsToBoundsViewWithState:](self, "boundsForClipsToBoundsViewWithState:", v5);
  v10 = v9;
  if (objc_msgSend(v5, "hasBackdrop"))
  {
    -[TUICandidateView backdropView](self, "backdropView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = [TUICandidateBackdropView alloc];
      -[TUICandidateView bounds](self, "bounds");
      v13 = -[TUICandidateBackdropView initWithFrame:](v12, "initWithFrame:");
      -[TUICandidateView setBackdropView:](self, "setBackdropView:", v13);

      objc_msgSend(v5, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView backdropView](self, "backdropView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setStyle:", v14);

      -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView backdropView](self, "backdropView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "insertSubview:atIndex:", v17, 0);

    }
    objc_msgSend(v5, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "doNotClipToBounds");
    -[TUICandidateView backdropView](self, "backdropView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClipsToBounds:", v19);

    -[TUICandidateView backdropView](self, "backdropView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

  }
  if (objc_msgSend(v5, "inlineTextViewPosition"))
  {
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v23 = [TUICandidateInlineTextView alloc];
      -[TUICandidateView bounds](self, "bounds");
      v24 = -[TUICandidateInlineTextView initWithFrame:](v23, "initWithFrame:");
      -[TUICandidateView setInlineTextView:](self, "setInlineTextView:", v24);

      -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView inlineTextView](self, "inlineTextView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView primaryGrid](self, "primaryGrid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "insertSubview:belowSubview:", v26, v27);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapInlineText_);
      -[TUICandidateView inlineTextView](self, "inlineTextView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addGestureRecognizer:", v28);

      -[TUICandidateView inlineTextView](self, "inlineTextView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", 1);

    }
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isHidden");

    if (v32)
    {
      -[TUICandidateView inlineTextView](self, "inlineTextView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHidden:", 0);

      -[TUICandidateView inlineTextView](self, "inlineTextView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAlpha:", 0.0);

    }
    -[TUICandidateView inlineText](self, "inlineText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setText:", v35);

  }
  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    v38 = [TUICandidateGrid alloc];
    -[TUICandidateView disambiguationHeight](self, "disambiguationHeight");
    v40 = -[TUICandidateGrid initWithFrame:](v38, "initWithFrame:", 0.0, 0.0, v10, v39);
    -[TUICandidateView setDisambiguationGrid:](self, "setDisambiguationGrid:", v40);

    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDelegate:", self);

  }
  if (objc_msgSend(v5, "disambiguationGridPosition"))
  {
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "insertSubview:aboveSubview:", v43, v44);

    objc_msgSend(v5, "disambiguationStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setStyle:", v45);

    v47 = objc_msgSend(v5, "disambiguationGridRowType");
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setRowType:", v47);

    v49 = objc_alloc(MEMORY[0x1E0DBDBD8]);
    v50 = (void *)MEMORY[0x1E0C99E40];
    -[TUICandidateView candidateResultSet](self, "candidateResultSet");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "disambiguationCandidates");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "orderedSetWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v49, "initWithTitle:candidates:", &stru_1E24FC6C0, v53);
    v142[0] = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setCandidateGroups:", v55);

    -[TUICandidateView updateDisambiguationSelectionIndex](self, "updateDisambiguationSelectionIndex");
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setHidden:", 0);

  }
  if (objc_msgSend(v5, "disambiguationGridPosition") == 2)
  {
    if (objc_msgSend(v5, "inlineTextViewPosition") == 1)
      v58 = 5;
    else
      v58 = 4;
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "style");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "style");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "hideLinesOnDisambiguationGridEdges");

      if (v63)
        v58 = 0;
    }
    else
    {

    }
    goto LABEL_31;
  }
  v64 = objc_msgSend(v5, "disambiguationGridPosition");
  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v64 == 1)
  {
    objc_msgSend(v65, "style");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "style");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "hideLinesOnDisambiguationGridEdges");

      if (v70)
        v58 = 0;
      else
        v58 = 2;
    }
    else
    {

      v58 = 2;
    }
LABEL_31:
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "style");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v71;
    v74 = v58;
    goto LABEL_32;
  }
  objc_msgSend(v65, "setHidden:", 1);

  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v71;
  v74 = 0;
LABEL_32:
  objc_msgSend(v73, "_setShowsLinesOnEdges:style:", v74, v72);

  if (objc_msgSend(v5, "sortControlPosition")
    && (-[TUICandidateView state](self, "state"),
        v75 = (void *)objc_claimAutoreleasedReturnValue(),
        v76 = objc_msgSend(v75, "sortControlPosition"),
        v75,
        v76 != 5))
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setHidden:", 0);

    -[TUICandidateView updateSortControlTitlesIfNeeded](self, "updateSortControlTitlesIfNeeded");
  }
  else
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setHidden:", 1);

    -[TUICandidateView resetSortControlIndex](self, "resetSortControlIndex");
  }
  if (objc_msgSend(v5, "sortControlPosition") == 4)
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "superview");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80 == v81)
    {
      -[TUICandidateView sortControl](self, "sortControl");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "removeFromSuperview");

    }
    -[TUICandidateView sortControl](self, "sortControl");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setCustomHeader:", v83);

    -[TUICandidateView sortControl](self, "sortControl");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setAlpha:", 1.0);

    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v87 = v86;
    -[TUICandidateView sortControl](self, "sortControl");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setFrame:", 0.0, 0.0, v10, v87);

    -[TUICandidateView sortControl](self, "sortControl");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "style");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "_setShowsLinesOnEdges:style:", 0, v90);
  }
  else
  {
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setCustomHeader:", 0);

    -[TUICandidateView sortControl](self, "sortControl");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "superview");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93 == v94)
      goto LABEL_43;
    -[TUICandidateView sortControl](self, "sortControl");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "removeFromSuperview");

    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView sortControl](self, "sortControl");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addSubview:", v90);
  }

LABEL_43:
  objc_msgSend(v5, "style");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "style");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "performSelector:", sel_hasShadow);

    if (!v98)
      goto LABEL_47;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v100 = objc_msgSend(v99, "CGColor");
    -[TUICandidateView layer](self, "layer");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setShadowColor:", v100);

    -[TUICandidateView layer](self, "layer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setShadowOffset:", 0.0, 3.0);

    -[TUICandidateView layer](self, "layer");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v104) = 1045220557;
    objc_msgSend(v103, "setShadowOpacity:", v104);

    -[TUICandidateView layer](self, "layer");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setShadowRadius:", 8.0);
  }

LABEL_47:
  objc_msgSend(v5, "style");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "sortControlBackgroundColor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "alphaComponent");
  if (v107 <= 0.0)
  {

  }
  else
  {
    if (objc_msgSend(v5, "sortControlPosition") == 2 || objc_msgSend(v5, "sortControlPosition") == 3)
    {

LABEL_51:
      -[TUICandidateView sortControl](self, "sortControl");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "style");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v108;
      v111 = 1;
      goto LABEL_54;
    }
    v141 = objc_msgSend(v5, "sortControlPosition");

    if (v141 == 5)
      goto LABEL_51;
  }
  -[TUICandidateView sortControl](self, "sortControl");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v108;
  v111 = 0;
LABEL_54:
  objc_msgSend(v110, "_setShowsLinesOnEdges:style:", v111, v109);

  if (-[TUICandidateView effectiveCandidateArrowButonPosition](self, "effectiveCandidateArrowButonPosition"))
  {
    -[TUICandidateView arrowButton](self, "arrowButton");
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v112)
    {
      v113 = [TUICandidateArrowButton alloc];
      -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
      v115 = v114;
      -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
      v117 = -[TUICandidateArrowButton initWithFrame:](v113, "initWithFrame:", 0.0, 0.0, v115, v116);
      -[TUICandidateView setArrowButton:](self, "setArrowButton:", v117);

      -[TUICandidateView arrowButton](self, "arrowButton");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "addTarget:action:forControlEvents:", self, sel_didTapArrowButton_, 64);

      -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView arrowButton](self, "arrowButton");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "addSubview:", v120);

    }
    -[TUICandidateView setShouldShowArrowButton:](self, "setShouldShowArrowButton:", 1);
    -[TUICandidateView updateArrowButtonVisibility](self, "updateArrowButtonVisibility");
  }
  v121 = objc_msgSend(v5, "candidateNumberEnabled");
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setCandidateNumberEnabled:", v121);

  -[TUICandidateView getArrowButtonSizeForGrid](self, "getArrowButtonSizeForGrid");
  v124 = v123;
  v126 = v125;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setArrowButtonSize:", v124, v126);

  -[TUICandidateView state](self, "state");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "style");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "leftEdgeMaskImage");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (v130)
  {

  }
  else
  {
    -[TUICandidateView state](self, "state");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "style");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "rightEdgeMaskImage");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v133)
    {
      -[TUICandidateView primaryGrid](self, "primaryGrid");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "setMaskView:", 0);
      goto LABEL_64;
    }
  }
  -[TUICandidateView candidateMask](self, "candidateMask");
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v134)
  {
    v135 = [TUICandidateMask alloc];
    -[TUICandidateView bounds](self, "bounds");
    v136 = -[TUICandidateMask initWithFrame:](v135, "initWithFrame:");
    -[TUICandidateView setCandidateMask:](self, "setCandidateMask:", v136);

  }
  objc_msgSend(v5, "style");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView candidateMask](self, "candidateMask");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setStyle:", v137);

  -[TUICandidateView candidateMask](self, "candidateMask");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "setMaskView:", v139);

LABEL_64:
  if (v3)
    -[TUICandidateView reloadPrimaryGridDataIfNeeded](self, "reloadPrimaryGridDataIfNeeded");

}

- (void)changeLayoutInsideAnimationBlock
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  _BOOL4 v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  int v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  double v130;
  _BOOL8 v131;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  double v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  double v178;
  double v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  double v200;
  void *v201;
  void *v202;
  void *v203;
  double v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  double v216;
  void *v217;
  double v218;
  double v219;
  uint64_t v220;
  void *v221;
  void (**v222)(_QWORD);
  double v223;
  double v224;
  double v225;
  double v226;
  double Height;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  char v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  double v248;
  double v249;
  double v250;
  void *v251;
  void *v252;
  double v253;
  void *v254;
  double v255;
  double v256;
  void *v257;
  double v258;
  double v259;
  double v260;
  CGFloat v261;
  CGFloat v262;
  CGFloat v263;
  CGFloat v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  _QWORD v272[5];
  void (**v273)(_QWORD);
  _QWORD aBlock[9];
  _QWORD v275[10];
  CGRect v276;
  CGRect v277;

  -[TUICandidateView state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView boundsForClipsToBoundsViewWithState:](self, "boundsForClipsToBoundsViewWithState:", v3);
  v5 = v4;
  v260 = v6;
  v8 = v7;
  v10 = v9;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v263 = v13;
  v264 = v12;
  v261 = v15;
  v262 = v14;

  -[TUICandidateView sortControl](self, "sortControl");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v267 = v20;
  v268 = v19;
  v266 = v21;

  -[TUICandidateView backdropView](self, "backdropView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v8, v10);

  objc_msgSend(v3, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView backdropView](self, "backdropView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setStyle:", v23);

  objc_msgSend(v3, "style");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v25, "doNotClipToBounds");

  if ((_DWORD)v24)
  {
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_setShowsLinesOnEdges:style:", 0, v27);

    -[TUICandidateView backdropView](self, "backdropView");
  }
  else
  {
    -[TUICandidateView backdropView](self, "backdropView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_setShowsLinesOnEdges:style:", 0, v29);

    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v3, "borders");
  objc_msgSend(v3, "style");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_setShowsLinesOnEdges:style:", v31, v32);

  v33 = -[TUICandidateView effectiveCandidateArrowButonPosition](self, "effectiveCandidateArrowButonPosition");
  objc_msgSend(v3, "style");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView sortControl](self, "sortControl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setStyle:", v34);

  if (objc_msgSend(v3, "sortControlPosition") == 1)
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlpha:", 1.0);

    v18 = 0.0;
    v37 = 0.0;
    if (v33 == 1)
      -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth", 0.0);
    v267 = v8 - v37;
    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v266 = v38;
    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v40 = v39 + 0.0;
    v269 = v8;
    v270 = v10 - (v39 + 0.0);
    v268 = 0.0;
    goto LABEL_41;
  }
  if (objc_msgSend(v3, "sortControlPosition") == 2)
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAlpha:", 1.0);

    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v43 = v42;
    v18 = 0.0;
    v44 = 0.0;
    if (v33 == 3)
      -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth", 0.0);
    v267 = v8 - v44;
    v268 = v10 - v43;
    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v266 = v45;
    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v270 = v10 - (v46 + 0.0);
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "sortControlPosition") == 3)
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAlpha:", 1.0);

    v48 = -[TUICandidateView showingSortControl](self, "showingSortControl");
    v18 = 0.0;
    v49 = 0.0;
    if (v48)
      -[TUICandidateView sortControlHeight](self, "sortControlHeight", 0.0);
    v268 = v10 - v49;
    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v266 = v50;
    if (!-[TUICandidateView showingSortControl](self, "showingSortControl"))
    {
      v267 = v8;
      v270 = v10;
LABEL_12:
      v269 = v8;
      v40 = 0.0;
LABEL_41:
      v271 = 0.0;
      goto LABEL_42;
    }
    -[TUICandidateView sortControlHeight](self, "sortControlHeight");
    v40 = 0.0;
    v270 = v10 - (v51 + 0.0);
    v267 = v8;
LABEL_40:
    v269 = v8;
    goto LABEL_41;
  }
  if (objc_msgSend(v3, "sortControlPosition") == 4)
  {
    -[TUICandidateView state](self, "state");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "arrowButtonPosition");

    if (v53 == 5)
    {
      -[TUICandidateView arrowButton](self, "arrowButton");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "frame");
      v56 = v55 + 0.0;
      v57 = v8 - (v55 + 0.0);
    }
    else
    {
      -[TUICandidateView state](self, "state");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "style");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v66, "arrowButtonBackgroundHidden") & 1) == 0)
      {

        v56 = 0.0;
        v269 = v8;
LABEL_95:

LABEL_96:
        v271 = v56;
        -[TUICandidateView sortControl](self, "sortControl");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v251, "setAlpha:", 1.0);

        v40 = 0.0;
        goto LABEL_97;
      }
      -[TUICandidateView state](self, "state");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "style");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[TUICandidateView state](self, "state");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "style");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "shouldUpdateCollectionViewWidthForArrowButtonVisibility");

        v56 = 0.0;
        v269 = v8;
        if ((v71 & 1) != 0)
          goto LABEL_96;
      }
      else
      {

      }
      -[TUICandidateView arrowButton](self, "arrowButton");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "frame");
      v56 = 0.0;
      v57 = v8 - (v250 + 0.0);
    }
    v269 = v57;
    goto LABEL_95;
  }
  -[TUICandidateView sortControl](self, "sortControl");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0.0;
  objc_msgSend(v58, "setAlpha:", 0.0);

  v59 = objc_msgSend(v3, "sortControlPosition");
  if (v59 == 5)
    v60 = v8;
  else
    v60 = v267;
  v61 = v268;
  if (v59 == 5)
    v61 = v10;
  v267 = v60;
  v268 = v61;
  -[TUICandidateView state](self, "state");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "arrowButtonPosition");

  if (v63 != 5)
  {
    -[TUICandidateView state](self, "state");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "style");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v73, "arrowButtonBackgroundHidden") & 1) != 0)
    {
      -[TUICandidateView state](self, "state");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "style");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_99:
        -[TUICandidateView arrowButton](self, "arrowButton");
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v252, "frame");
        v269 = v8 - (v253 + 0.0);

        -[TUICandidateView primaryGrid](self, "primaryGrid");
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v254, "arrowButtonSize");
        v256 = v255;
        -[TUICandidateView primaryGrid](self, "primaryGrid");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "setArrowButtonSize:", 0.0, v256);

        v270 = v10;
        goto LABEL_41;
      }
      -[TUICandidateView state](self, "state");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "style");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "shouldUpdateCollectionViewWidthForArrowButtonVisibility");

      if ((v78 & 1) == 0)
        goto LABEL_99;
    }
    else
    {

    }
    v270 = v10;
    goto LABEL_40;
  }
  -[TUICandidateView arrowButton](self, "arrowButton");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "frame");
  v271 = v65 + 0.0;
  v269 = v8 - (v65 + 0.0);

LABEL_97:
  v270 = v10;
LABEL_42:
  v259 = v18;
  if (objc_msgSend(v3, "inlineTextViewPosition") == 1)
  {
    objc_msgSend(v3, "style");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setStyle:", v79);

    -[TUICandidateView arrowButton](self, "arrowButton");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "frame");
    v83 = v8 - v82;
    -[TUICandidateView inlineTextHeight](self, "inlineTextHeight");
    v85 = v84;

    v86 = 0.0;
    if (objc_msgSend(v3, "sortControlPosition") == 1)
    {
      v276.origin.x = 0.0;
      v276.origin.y = 0.0;
      v276.size.width = v83;
      v276.size.height = v85;
      v86 = CGRectGetHeight(v276) + 0.0;
    }
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setAlpha:", 1.0);

    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setFrame:", 0.0, v86, v83, v85);

    -[TUICandidateView inlineTextHeight](self, "inlineTextHeight");
    v40 = v40 + v89;
    v270 = v270 - (v89 + 0.0);
    v271 = v271 + 0.0;
  }
  else
  {
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setAlpha:", 0.0);

  }
  if (objc_msgSend(v3, "inlineTextViewPosition") == 1)
    goto LABEL_48;
  objc_msgSend(v3, "style");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "style");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "arrowButtonBackgroundHidden");

    if (v96)
    {
LABEL_48:
      -[TUICandidateView arrowButton](self, "arrowButton");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v91;
      v93 = 0;
      goto LABEL_54;
    }
  }
  else
  {

  }
  -[TUICandidateView arrowButton](self, "arrowButton");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91;
  v93 = 1;
LABEL_54:
  objc_msgSend(v91, "setShowsBackground:", v93);

  if (objc_msgSend(v3, "disambiguationGridPosition") == 2)
  {
    -[TUICandidateView disambiguationHeight](self, "disambiguationHeight");
    v98 = v97;
    -[TUICandidateView disambiguationHeight](self, "disambiguationHeight");
    v100 = v40 + v99;
    v270 = v270 - (v99 + 0.0);
    v271 = v271 + 0.0;
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setFrame:", 0.0, v40, v8, v98);

    -[TUICandidateView disambiguationHeight](self, "disambiguationHeight");
    v103 = v102;
  }
  else
  {
    v265 = v40;
    v103 = 0.0;
    if (objc_msgSend(v3, "disambiguationGridPosition") != 1)
      goto LABEL_59;
    v271 = v271 + 0.0;
    v100 = v265 + 0.0;
    v269 = v269 + -68.0;
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setFrame:", v8 + -68.0, v265, 68.0, v270);

  }
  v265 = v100;
LABEL_59:
  if (v33)
  {
    -[TUICandidateView setShouldShowArrowButton:](self, "setShouldShowArrowButton:", 1);
    objc_msgSend(v3, "style");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView arrowButton](self, "arrowButton");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setStyle:", v105);

    v107 = objc_msgSend(v3, "arrowButtonDirection");
    -[TUICandidateView arrowButton](self, "arrowButton");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setArrowDirection:", v107);

    switch(v33)
    {
      case 1:
        v258 = v5;
        -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
        v110 = v8 - v109;
        -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
        v112 = v111;
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v114 = v113;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "setFrame:", v110, v103, v112, v114);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "arrowButtonSeparatorImage");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "_setImage:onEdges:outside:style:", v118, 2, 1, v119);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "_setContinuousCornerRadius:", 0.0);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "layer");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setMasksToBounds:", 0);

        objc_msgSend(v3, "style");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "cornerRadius");
        v125 = v124;

        objc_msgSend(v3, "style");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v122) = objc_msgSend(v126, "doNotClipToBounds");

        if ((_DWORD)v122)
        {
          -[TUICandidateView state](self, "state");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = objc_msgSend(v127, "borders") & 8;

          objc_msgSend(v3, "style");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "cornerRadius");
          v125 = v130;

          v131 = v103 == 0.0;
          v132 = 2;
        }
        else
        {
          v131 = 0;
          v128 = 0;
          v132 = 15;
        }
        v5 = v258;
        goto LABEL_74;
      case 2:
        objc_msgSend(v3, "arrowButtonOffset");
        v134 = v8 + v133;
        objc_msgSend(v3, "arrowButtonOffset");
        v136 = v103 + v135;
        -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
        v137 = v5;
        v139 = v138;
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v141 = v140;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = v139;
        v5 = v137;
        objc_msgSend(v142, "setFrame:", v134, v136, v143, v141);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "_setImage:onEdges:outside:style:", 0, 2, 1, v145);

        objc_msgSend(v3, "style");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "cornerRadius");
        v148 = v147;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "_setContinuousCornerRadius:", v148);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "layer");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "setMasksToBounds:", 1);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "layer");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "setMaskedCorners:", 1);
        goto LABEL_66;
      case 3:
        -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
        v155 = v8 - v154;
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v157 = v10 - v156;
        -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
        v158 = v5;
        v160 = v159;
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v162 = v161;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = v160;
        v5 = v158;
        objc_msgSend(v163, "setFrame:", v155, v157, v164, v162);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "arrowButtonSeparatorImage");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "_setImage:onEdges:outside:style:", v167, 2, 1, v168);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "_setContinuousCornerRadius:", 0.0);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "layer");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "setMasksToBounds:", 0);
LABEL_66:

        goto LABEL_68;
      case 4:
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v171 = v10 - v170;
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v173 = v172;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "setFrame:", 0.0, v171, v8, v173);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "_setImage:onEdges:outside:style:", 0, 2, 1, v176);

        objc_msgSend(v3, "style");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "cornerRadius");
        v179 = v178;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "_setContinuousCornerRadius:", v179);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "layer");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "setMaskedCorners:", 0);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "layer");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "setMasksToBounds:", 0);

        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v270 = v270 - v185;
        goto LABEL_68;
      case 5:
        -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
        v188 = v187;
        -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
        v190 = v189;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "setFrame:", 0.0, v103, v188, v190);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "arrowButtonSeparatorImage");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "_setImage:onEdges:outside:style:", v194, 8, 1, v195);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "_setContinuousCornerRadius:", 0.0);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "layer");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "setMasksToBounds:", 0);

        objc_msgSend(v3, "style");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "cornerRadius");
        v125 = v200;

        objc_msgSend(v3, "style");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v198) = objc_msgSend(v201, "doNotClipToBounds");

        if ((_DWORD)v198)
        {
          -[TUICandidateView state](self, "state");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = objc_msgSend(v202, "borders") & 2;

          objc_msgSend(v3, "style");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "cornerRadius");
          v125 = v204;

          v131 = v103 == 0.0;
          v132 = 1;
        }
        else
        {
          v131 = 0;
          v128 = 0;
          v132 = 15;
        }
LABEL_74:
        v186 = v259;
        -[TUICandidateView arrowButton](self, "arrowButton");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "contentView");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "style");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "_setShowsLinesOnEdges:style:", v128, v207);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "contentView");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v209, "_setContinuousCornerRadius:", v125);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v210, "contentView");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v211, "layer");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v212, "setMaskedCorners:", v132);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v213, "contentView");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v214, "layer");
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "setMasksToBounds:", v131);

        goto LABEL_75;
      default:
        goto LABEL_68;
    }
  }
  -[TUICandidateView setShouldShowArrowButton:](self, "setShouldShowArrowButton:", 0);
LABEL_68:
  v186 = v259;
LABEL_75:
  if (objc_msgSend(v3, "sortControlPosition") == 4)
    v216 = v269;
  else
    v216 = v267;
  -[TUICandidateView sortControl](self, "sortControl");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "frame");
  v219 = v218;

  v220 = MEMORY[0x1E0C809B0];
  if (v219 == 0.0)
  {
    v275[0] = MEMORY[0x1E0C809B0];
    v275[1] = 3221225472;
    v275[2] = __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke;
    v275[3] = &unk_1E24FAC80;
    v275[4] = self;
    *(double *)&v275[5] = v186;
    *(double *)&v275[6] = v268;
    *(double *)&v275[7] = v216;
    *(double *)&v275[8] = v266;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v275);
  }
  else
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v221, "setFrame:", v186, v268, v216, v266);

  }
  aBlock[0] = v220;
  aBlock[1] = 3221225472;
  aBlock[2] = __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_2;
  aBlock[3] = &unk_1E24FAC80;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v271;
  *(double *)&aBlock[6] = v265;
  *(double *)&aBlock[7] = v269;
  *(double *)&aBlock[8] = v270;
  v222 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v270 >= 0.0)
    v223 = v270;
  else
    v223 = 0.0;
  v224 = v271;
  v225 = v265;
  v226 = v269;
  Height = CGRectGetHeight(*(CGRect *)(&v223 - 3));
  v277.origin.y = v263;
  v277.origin.x = v264;
  v277.size.height = v261;
  v277.size.width = v262;
  if (Height <= CGRectGetHeight(v277))
  {
    objc_msgSend(v3, "style");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend(v231, "doNotClipToBounds");

    if ((v232 & 1) != 0)
    {
      -[TUICandidateView primaryGrid](self, "primaryGrid");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "setSuppressCollectionViewLayout:", 1);

    }
    v222[2](v222);
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "layoutIfNeeded");
  }
  else
  {
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setOrigin:", v271, v265);

    v229 = (void *)MEMORY[0x1E0DC3F10];
    v272[0] = v220;
    v272[1] = 3221225472;
    v272[2] = __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_3;
    v272[3] = &unk_1E24FAE48;
    v272[4] = self;
    v273 = v222;
    objc_msgSend(v229, "performWithoutAnimation:", v272);
    v230 = v273;
  }

  -[TUICandidateView updateArrowButtonVisibility](self, "updateArrowButtonVisibility");
  objc_msgSend(v3, "style");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "leftEdgeSeparatorImage");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _setImage:onEdges:outside:style:](self, "_setImage:onEdges:outside:style:", v235, 2, 0, v236);

  objc_msgSend(v3, "style");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v237, "rightEdgeSeparatorImage");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _setImage:onEdges:outside:style:](self, "_setImage:onEdges:outside:style:", v238, 8, 0, v239);

  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v240, "setFrame:", v5, v260, v8, v10);

  objc_msgSend(v3, "style");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "backgroundColor");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v243, "setBackgroundColor:", v242);

  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "layer");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v245, "setMask:", 0);

  -[TUICandidateView state](self, "state");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v246, "style");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v247, "cornerRadius");
  v249 = v248;

  if (v249 > 0.0)
    -[TUICandidateView updateCornerRadiusAfterFinalizingLayout:](self, "updateCornerRadiusAfterFinalizingLayout:", 0);

}

- (void)updatePrimaryGridRowTypeWithOptions:(unint64_t)a3 animated:(BOOL)a4 animator:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "primaryGridRowType");
  -[TUICandidateView state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRowType:options:style:animated:animator:completion:", v13, a3, v15, v7, v11, v10);

}

- (void)finalizeLayoutChange
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TUICandidateView state](self, "state");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasBackdrop") & 1) == 0)
  {
    -[TUICandidateView backdropView](self, "backdropView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
  v4 = -[TUICandidateView effectiveCandidateArrowButonPosition](self, "effectiveCandidateArrowButonPosition");
  if (!objc_msgSend(v10, "arrowButtonPosition"))
  {
    -[TUICandidateView setShouldShowArrowButton:](self, "setShouldShowArrowButton:", 0);
    -[TUICandidateView updateArrowButtonVisibility](self, "updateArrowButtonVisibility");
    goto LABEL_10;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView arrowButton](self, "arrowButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

  }
  else
  {
    if (v4 != 2)
      goto LABEL_10;
    -[TUICandidateView arrowButton](self, "arrowButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView addSubview:](self, "addSubview:", v5);
  }

LABEL_10:
  if (!objc_msgSend(v10, "inlineTextViewPosition"))
  {
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
  if (objc_msgSend(v10, "sortControlPosition"))
  {
    if (objc_msgSend(v10, "sortControlPosition") != 5)
      goto LABEL_17;
  }
  else
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
  -[TUICandidateView setShowingSortControl:](self, "setShowingSortControl:", 0);
LABEL_17:
  -[TUICandidateView updateCornerRadiusAfterFinalizingLayout:](self, "updateCornerRadiusAfterFinalizingLayout:", 1);
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSuppressCollectionViewLayout:", 0);

  -[TUICandidateView setChangingLayout:](self, "setChangingLayout:", 0);
}

- (void)setState:(id)a3 animated:(BOOL)a4 options:(unint64_t)a5 force:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  if (a4)
  {
    v11 = (objc_class *)MEMORY[0x1E0DC3F38];
    v12 = a7;
    v13 = a3;
    v15 = (id)objc_msgSend([v11 alloc], "initWithDuration:curve:animations:", (a5 >> 16) & 7, &__block_literal_global_731, 0.25);
    -[TUICandidateView setState:animated:animator:options:force:completion:](self, "setState:animated:animator:options:force:completion:", v13, 1, v15, a5, v7, v12);

    objc_msgSend(v15, "startAnimation");
  }
  else
  {
    v14 = a7;
    v15 = a3;
    -[TUICandidateView setState:animated:animator:options:force:completion:](self, "setState:animated:animator:options:force:completion:");

  }
}

- (void)setState:(id)a3 animated:(BOOL)a4 animator:(id)a5 options:(unint64_t)a6 force:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v12;
  TUICandidateViewState *v15;
  id v16;
  id v17;
  TUICandidateViewState *state;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];

  v12 = a4;
  v15 = (TUICandidateViewState *)a3;
  v16 = a5;
  v17 = a8;
  state = self->_state;
  if (state != v15 || a7 || v12)
  {
    v19 = -[TUICandidateViewState primaryGridRowType](state, "primaryGridRowType");
    v20 = v19 != -[TUICandidateViewState primaryGridRowType](v15, "primaryGridRowType");
    objc_storeStrong((id *)&self->_state, a3);
    -[TUICandidateView prepareForLayoutChange:](self, "prepareForLayoutChange:", v20);
    if (v12)
    {
      -[TUICandidateView layoutIfNeeded](self, "layoutIfNeeded");
      v21 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke;
      v25[3] = &unk_1E24FC068;
      v25[4] = self;
      objc_msgSend(v16, "addAnimations:", v25);
      v24[0] = v21;
      v24[1] = 3221225472;
      v24[2] = __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_2;
      v24[3] = &unk_1E24FACC8;
      v24[4] = self;
      objc_msgSend(v16, "addCompletion:", v24);
      -[TUICandidateView updatePrimaryGridRowTypeWithOptions:animated:animator:completion:](self, "updatePrimaryGridRowTypeWithOptions:animated:animator:completion:", a6, 1, v16, &__block_literal_global_37);
      v22[0] = v21;
      v22[1] = 3221225472;
      v22[2] = __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_4;
      v22[3] = &unk_1E24FAD10;
      v22[4] = self;
      v23 = v17;
      objc_msgSend(v16, "addCompletion:", v22);

    }
    else
    {
      -[TUICandidateView changeLayoutInsideAnimationBlock](self, "changeLayoutInsideAnimationBlock");
      -[TUICandidateView updatePrimaryGridRowTypeWithOptions:animated:animator:completion:](self, "updatePrimaryGridRowTypeWithOptions:animated:animator:completion:", a6, 0, 0, 0);
      -[TUICandidateView finalizeLayoutChange](self, "finalizeLayoutChange");
      if (v17)
        (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
    }
  }

}

- (void)setState:(id)a3 animated:(BOOL)a4 force:(BOOL)a5 completion:(id)a6
{
  -[TUICandidateView setState:animated:options:force:completion:](self, "setState:animated:options:force:completion:", a3, a4, 0, a5, a6);
}

- (void)setState:(id)a3
{
  -[TUICandidateView setState:animated:force:completion:](self, "setState:animated:force:completion:", a3, 0, 0, 0);
}

- (void)setCandidateResultSet:(id)a3
{
  TIKeyboardCandidateResultSet *v5;
  BOOL v6;
  TIKeyboardCandidateResultSet *v7;

  v5 = (TIKeyboardCandidateResultSet *)a3;
  if (self->_candidateResultSet != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_candidateResultSet, a3);
    v6 = -[TUICandidateView changingLayout](self, "changingLayout");
    v5 = v7;
    if (!v6)
    {
      -[TUICandidateView reloadGridsIfNeeded](self, "reloadGridsIfNeeded");
      v5 = v7;
    }
  }

}

- (void)reloadGridsIfNeeded
{
  void *v3;

  if (-[TUICandidateView reloadPrimaryGridDataIfNeeded](self, "reloadPrimaryGridDataIfNeeded"))
  {
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scrollToFirstCandidate");

  }
  -[TUICandidateView reloadDisambiguationGridDataIfNeeded](self, "reloadDisambiguationGridDataIfNeeded");
  -[TUICandidateView updateSortControlTitlesIfNeeded](self, "updateSortControlTitlesIfNeeded");
}

- (void)updateSortControlTitlesIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[TUICandidateView state](self, "state");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "sortControlPosition"))
  {
    -[TUICandidateView state](self, "state");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sortControlPosition");

    if (v4 == 5)
      return;
    -[TUICandidateView sortControlTitles](self, "sortControlTitles");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView sortControl](self, "sortControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitles:", v6);

  }
}

- (int64_t)selectedSortControlIndex
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  int64_t v9;

  -[TUICandidateView sortControl](self, "sortControl");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)v3;
  -[TUICandidateView sortControl](self, "sortControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[TUICandidateView sortControl](self, "sortControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selectedIndex");

  return v9;
}

- (void)resetSortControlIndex
{
  id v2;

  -[TUICandidateView sortControl](self, "sortControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedIndex:", 0);

}

- (void)updateCornerRadiusAfterFinalizingLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;

  v3 = a3;
  -[TUICandidateView state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "doNotClipToBounds") & 1) != 0)
  {
    -[TUICandidateView state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasBackdrop");

    if (v8)
    {
      -[TUICandidateView backdropView](self, "backdropView");
      v114 = (id)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v114 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView backdropView](self, "backdropView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = v9;
  objc_msgSend(v9, "_setContinuousCornerRadius:", 0.0);
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", 15);

  -[TUICandidateView state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cornerRadius");
  objc_msgSend(v114, "_setContinuousCornerRadius:");

  -[TUICandidateView state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "maskedCorners");
  objc_msgSend(v114, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaskedCorners:", v16);

  -[TUICandidateView roundedBorderLayer](self, "roundedBorderLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeFromSuperlayer");

  -[TUICandidateView state](self, "state");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "style");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateView state](self, "state");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "performSelector:", sel_roundsArrowButtonEdge);

    if (v23)
    {
      -[TUICandidateView state](self, "state");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "arrowButtonPosition");

      -[TUICandidateView state](self, "state");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "arrowButtonPosition");

      objc_msgSend(v114, "bounds");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      if (v27 && v3)
      {
        objc_msgSend(v114, "bounds");
        v37 = v36 * 0.5;
        v38 = -[TUICandidateView effectiveCandidateArrowButonPosition](self, "effectiveCandidateArrowButonPosition");
        -[TUICandidateView arrowButton](self, "arrowButton");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v38 == 5)
        {
          objc_msgSend(v39, "setArrowImageOffset:", v37 * 0.25, 0.0);

          -[TUICandidateView arrowButton](self, "arrowButton");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "arrowImageOffset");
          v43 = v29 + v42;
          -[TUICandidateView arrowButton](self, "arrowButton");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "arrowImageOffset");
          v46 = v33 - v45;
          -[TUICandidateView arrowButton](self, "arrowButton");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "arrowImageOffset");
          v49 = v35 + v48;

          v50 = (void *)MEMORY[0x1E0DC3508];
          -[TUICandidateView state](self, "state");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "style");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "cornerRadius");
          v54 = v53;
          -[TUICandidateView state](self, "state");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "style");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "cornerRadius");
          v58 = v57;
          v59 = v50;
          v60 = v43;
          v61 = v31;
          v62 = v46;
          v63 = v49;
          v64 = v37;
          v65 = v54;
          v66 = v37;
        }
        else
        {
          objc_msgSend(v39, "setArrowImageOffset:", v37 * -0.25, 0.0);

          -[TUICandidateView arrowButton](self, "arrowButton");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "arrowImageOffset");
          v82 = v33 + v81;
          -[TUICandidateView arrowButton](self, "arrowButton");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "arrowImageOffset");
          v85 = v35 + v84;

          v86 = (void *)MEMORY[0x1E0DC3508];
          -[TUICandidateView state](self, "state");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "style");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "cornerRadius");
          v88 = v87;
          -[TUICandidateView state](self, "state");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "style");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "cornerRadius");
          v66 = v89;
          v59 = v86;
          v60 = v29;
          v61 = v31;
          v62 = v82;
          v63 = v85;
          v64 = v88;
          v65 = v37;
          v58 = v37;
        }
        objc_msgSend(v59, "_bezierPathRect:topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:", v60, v61, v62, v63, v64, v65, v58, v66);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUICandidateView arrowButton](self, "arrowButton");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "layoutSubviews");

        v78 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        v76 = objc_retainAutorelease(v90);
        objc_msgSend(v78, "setPath:", objc_msgSend(v76, "CGPath"));
        objc_msgSend(v114, "layer");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setMask:", v78);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "layer");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setHidden:", 0);

      }
      else
      {
        if (!v25 || v3)
        {
          -[TUICandidateView state](self, "state");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "style");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "cornerRadius");
          v97 = v96;

          objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathRect:topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:", v29, v31, v33, v35, v97, v97, v97, v97);
          v76 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "layer");
          v78 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setMask:", 0);
          goto LABEL_21;
        }
        v68 = (void *)MEMORY[0x1E0DC3508];
        -[TUICandidateView state](self, "state");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "style");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "cornerRadius");
        v72 = v71;
        -[TUICandidateView state](self, "state");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "style");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "cornerRadius");
        objc_msgSend(v68, "_bezierPathRect:topLeftRadius:topRightRadius:bottomRightRadius:bottomLeftRadius:", v29, v31, v33, v35, v72, v75, 0.0, 0.0);
        v76 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v114, "layer");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setMask:", 0);

        -[TUICandidateView arrowButton](self, "arrowButton");
        v78 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "layer");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setHidden:", 1);
      }

LABEL_21:
      objc_msgSend(v114, "layer");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setBorderWidth:", 0.0);

      v67 = objc_retainAutorelease(v76);
      v99 = objc_msgSend(v67, "CGPath");
      -[TUICandidateView roundedBorderLayer](self, "roundedBorderLayer");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setPath:", v99);

      -[TUICandidateView roundedBorderLayer](self, "roundedBorderLayer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setLineWidth:", 1.3);

      -[TUICandidateView state](self, "state");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "style");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "lineColor");
      v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v105 = objc_msgSend(v104, "CGColor");
      -[TUICandidateView roundedBorderLayer](self, "roundedBorderLayer");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setStrokeColor:", v105);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
      v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v108 = objc_msgSend(v107, "CGColor");
      -[TUICandidateView roundedBorderLayer](self, "roundedBorderLayer");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setFillColor:", v108);

      objc_msgSend(v114, "layer");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView roundedBorderLayer](self, "roundedBorderLayer");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "addSublayer:", v111);

      -[TUICandidateView arrowButton](self, "arrowButton");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "contentView");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setHidden:", 0);

      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v114, "layer");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setMask:", 0);
LABEL_22:

}

- (BOOL)reloadPrimaryGridDataIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[TUICandidateView candidateGroupsForCurrentState](self, "candidateGroupsForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  if ((v6 & 1) == 0)
  {
    -[TUICandidateView candidateGroupsForCurrentState](self, "candidateGroupsForCurrentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCandidateGroups:", v7);

  }
  return v6 ^ 1;
}

- (void)reloadDisambiguationGridDataIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DBDBD8]);
  v4 = (void *)MEMORY[0x1E0C99E40];
  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disambiguationCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithTitle:candidates:", &stru_1E24FC6C0, v7);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCandidateGroups:", v9);

  -[TUICandidateView updateDisambiguationSelectionIndex](self, "updateDisambiguationSelectionIndex");
}

- (void)updateDisambiguationSelectionIndex
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[TUICandidateView candidateResultSet](self, "candidateResultSet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "selectedDisambiguationCandidateIndex"),
        v5,
        v4,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = (void *)MEMORY[0x1E0CB36B0];
    -[TUICandidateView candidateResultSet](self, "candidateResultSet");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForRow:inSection:", objc_msgSend(v11, "selectedDisambiguationCandidateIndex"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelectedIndexPath:", v9);

  }
  else
  {
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedIndexPath:", 0);

    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollToFirstCandidate");
  }

}

- (void)setInlineText:(id)a3
{
  NSString *v4;
  NSString *inlineText;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_inlineText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    inlineText = self->_inlineText;
    self->_inlineText = v4;

    v6 = self->_inlineText;
    -[TUICandidateView inlineTextView](self, "inlineTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (id)candidateGroupsForCurrentState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortMethods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[TUICandidateView state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "primaryGridRowType"))
  {

  }
  else
  {
    v7 = -[TUICandidateView changingLayout](self, "changingLayout");

    if (!v7)
    {
      -[TUICandidateView candidateResultSet](self, "candidateResultSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "hasCandidates");

      if (!v27)
      {
        v17 = (void *)MEMORY[0x1E0C9AA60];
        return v17;
      }
      if (v5)
      {
        -[TUICandidateView candidateResultSet](self, "candidateResultSet");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sortMethodGroups");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUICandidateView candidateResultSet](self, "candidateResultSet");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sortMethods");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndex:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v32);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        return v17;
      }
      v34 = objc_alloc(MEMORY[0x1E0DBDBD8]);
      v35 = (void *)MEMORY[0x1E0C99E40];
      -[TUICandidateView candidateResultSet](self, "candidateResultSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "candidates");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "orderedSetWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v34, "initWithTitle:candidates:", &stru_1E24FC6C0, v22);
      v37[0] = v23;
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = (void **)v37;
      goto LABEL_12;
    }
  }
  -[TUICandidateView sortControl](self, "sortControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selectedIndex");

  if (v9 > (unint64_t)(v5 - 1) || v9 < 0)
    v11 = 0;
  else
    v11 = v9;
  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortMethodGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortMethods");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0DBDBD8]);
    v19 = (void *)MEMORY[0x1E0C99E40];
    -[TUICandidateView candidateResultSet](self, "candidateResultSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "candidates");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "orderedSetWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v18, "initWithTitle:candidates:", &stru_1E24FC6C0, v22);
    v36 = v23;
    v24 = (void *)MEMORY[0x1E0C99D20];
    v25 = &v36;
LABEL_12:
    objc_msgSend(v24, "arrayWithObjects:count:", v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)gridOfType:(int64_t)a3
{
  if (a3)
    -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  else
    -[TUICandidateView primaryGrid](self, "primaryGrid");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a4 != 3)
    return -[TUICandidateView hasCandidateInForwardDirection:granularity:inGridType:](self, "hasCandidateInForwardDirection:granularity:inGridType:", a3, *(_QWORD *)&a4, 0);
  -[TUICandidateView sortControl](self, "sortControl", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[TUICandidateView sortControl](self, "sortControl"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isHidden"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[TUICandidateView sortControl](self, "sortControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      -[TUICandidateView state](self, "state");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v14, "disableSwitchingSortingMethodByTabKey") ^ 1;

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (a4 == 3)
  {
    -[TUICandidateSortControl titles](self->_sortControl, "titles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 >= 2)
    {
      -[TUICandidateView sortControl](self, "sortControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "selectedIndex");
      v10 = v7 - 1;
      if (v4)
        v10 = v7 + 1;
      v11 = (v10 + v9) % v7;
      -[TUICandidateView sortControl](self, "sortControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectedIndex:", v11);

      -[TUICandidateView handleSortControlValueChanged](self, "handleSortControlValueChanged");
    }
  }
  else
  {
    -[TUICandidateView showCandidateInForwardDirection:granularity:inGridType:](self, "showCandidateInForwardDirection:granularity:inGridType:", a3, *(_QWORD *)&a4, 0);
  }
}

- (BOOL)hasCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4 inGridType:(int64_t)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void *v7;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  -[TUICandidateView gridOfType:](self, "gridOfType:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "hasCandidateInForwardDirection:granularity:", v6, v5);

  return v5;
}

- (void)showCandidateInForwardDirection:(BOOL)a3 granularity:(int)a4 inGridType:(int64_t)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  -[TUICandidateView gridOfType:](self, "gridOfType:", a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showCandidateInForwardDirection:granularity:", v6, v5);

}

- (id)indexPathForCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCandidate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)viewOffsetForCandidate:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "viewOffsetForCandidate:", v4);

  return v6;
}

- (int64_t)rowForCandidate:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rowForCandidate:", v4);

  return v6;
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  void *v4;

  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "handleNumberKey:", a3);

  return a3;
}

- (NSIndexPath)selectedIndexPath
{
  void *v2;
  void *v3;

  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (void)setSelectedIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedIndexPath:", v4);

}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedIndexPath:animated:scrollPosition:", v8, v6, a5);

}

- (NSIndexPath)disambiguationSelectedIndexPath
{
  void *v2;
  void *v3;

  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (void)setDisambiguationSelectedIndexPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedIndexPath:", v4);

}

- (TIKeyboardCandidate)selectedCandidate
{
  void *v2;
  void *v3;

  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardCandidate *)v3;
}

- (TIKeyboardCandidate)selectedDisambiguationCandidate
{
  void *v2;
  void *v3;

  -[TUICandidateView disambiguationGrid](self, "disambiguationGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardCandidate *)v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  void *v5;
  double y;
  double x;
  id v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TUICandidateView;
  if (!-[TUICandidateView pointInside:withEvent:](&v17, sel_pointInside_withEvent_, v9, x, y))
  {
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isHidden");
    if ((v12 & 1) != 0
      || (-[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "convertPoint:fromView:", self, x, y),
          (objc_msgSend(v4, "pointInside:withEvent:", v9) & 1) == 0))
    {
      -[TUICandidateView arrowButton](self, "arrowButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isHidden") & 1) != 0)
      {

        v10 = 0;
        if ((v12 & 1) != 0)
          goto LABEL_11;
      }
      else
      {
        -[TUICandidateView arrowButton](self, "arrowButton");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUICandidateView arrowButton](self, "arrowButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
        v10 = objc_msgSend(v14, "pointInside:withEvent:", v9);

        if ((v12 & 1) != 0)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_11;
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  objc_super v19;
  CGPoint v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v20.x = x;
  v20.y = y;
  v9 = CGRectContainsPoint(v22, v20);

  if (v9)
  {
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView clipsToBoundsView](self, "clipsToBoundsView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUICandidateView arrowButton](self, "arrowButton");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_7;
    v13 = (void *)v12;
    -[TUICandidateView arrowButton](self, "arrowButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v21.x = x;
    v21.y = y;
    v15 = CGRectContainsPoint(v23, v21);

    if (!v15)
    {
LABEL_7:
      v19.receiver = self;
      v19.super_class = (Class)TUICandidateView;
      -[TUICandidateView hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[TUICandidateView arrowButton](self, "arrowButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView arrowButton](self, "arrowButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v11;
  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v10, "hitTest:withEvent:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

- (void)didTapArrowButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[TUICandidateView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUICandidateView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateViewDidTapArrowButton:", self);

  }
}

- (void)didTapInlineText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[TUICandidateView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUICandidateView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateViewDidTapInlineText:", self);

  }
}

- (id)sortControlTitles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TUICandidateView candidateResultSet](self, "candidateResultSet", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        UIKeyboardLocalizedString();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (void *)v11;
        else
          v13 = v10;
        v14 = v13;

        objc_msgSend(v3, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)shouldAutomaticallyHideAndShowSortControl
{
  void *v2;
  BOOL v3;

  -[TUICandidateView state](self, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortControlPosition") == 3;

  return v3;
}

- (BOOL)toggleSortControl:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(void *, uint64_t);
  _QWORD v12[5];
  BOOL v13;
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  if (a4 && -[TUICandidateView showingSortControl](self, "showingSortControl") == a3)
    return 0;
  -[TUICandidateView setShowingSortControl:](self, "setShowingSortControl:", v5);
  -[TUICandidateView sortControl](self, "sortControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__TUICandidateView_toggleSortControl_animated___block_invoke;
  aBlock[3] = &unk_1E24FC068;
  aBlock[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __47__TUICandidateView_toggleSortControl_animated___block_invoke_2;
  v12[3] = &unk_1E24FAE90;
  v12[4] = self;
  v13 = v5;
  v10 = (void (**)(void *, uint64_t))_Block_copy(v12);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v9, v10, 0.1);
  }
  else
  {
    v9[2](v9);
    v10[2](v10, 1);
  }

  return 1;
}

- (void)handleSortControlValueChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TUICandidateView selectedIndexPath](self, "selectedIndexPath");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TUICandidateView reloadPrimaryGridDataIfNeeded](self, "reloadPrimaryGridDataIfNeeded");
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToFirstCandidate");

  if (v7)
  {
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[TUICandidateView setSelectedIndexPath:](self, "setSelectedIndexPath:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUICandidateView setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);

    }
  }

}

- (void)updateArrowButtonVisibility
{
  _BOOL8 v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  id v44;
  CGRect v45;
  CGRect v46;

  v3 = -[TUICandidateView shouldShowArrowButton](self, "shouldShowArrowButton");
  v4 = -[TUICandidateView effectiveCandidateArrowButonPosition](self, "effectiveCandidateArrowButonPosition");
  -[TUICandidateView state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "primaryGridRowType"))
  {
    -[TUICandidateView state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "primaryGridRowType") != 1)
    {

LABEL_9:
      v12 = 1;
      goto LABEL_13;
    }

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 4)
      goto LABEL_9;
  }
  else
  {

  }
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  if (v9 <= CGRectGetWidth(v45))
  {
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentSize");
    v15 = v14;
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v11 = v15 > CGRectGetHeight(v46);

  }
  else
  {
    v11 = 1;
  }

  -[TUICandidateView state](self, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrowButtonImageName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("character.motion"));

  v12 = 1;
  if ((v20 & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    switch(v4)
    {
      case 1:
        if (v3 && !v11)
        {
          -[TUICandidateView state](self, "state");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v40, "arrowButtonDirection") == 2)
          {
            v3 = 1;
          }
          else
          {
            -[TUICandidateView state](self, "state");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = objc_msgSend(v43, "arrowButtonDirection") == 3;

          }
          goto LABEL_9;
        }
        break;
      case 2:
        v12 = v11;
        break;
      case 4:
        v3 = v11;
        break;
      case 5:
        if (v3 && !v11)
        {
          -[TUICandidateView state](self, "state");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "additionalHeight");
          v3 = v42 != 0.0;

        }
        break;
      default:
        break;
    }
  }
LABEL_13:
  -[TUICandidateArrowButton setHidden:](self->_arrowButton, "setHidden:", v3 ^ 1);
  -[TUICandidateArrowButton setEnabled:](self->_arrowButton, "setEnabled:", v12);
  -[TUICandidateView state](self, "state");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_19;
  }
  -[TUICandidateView state](self, "state");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldUpdateCollectionViewWidthForArrowButtonVisibility");

  if (v24)
  {
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIsArrowButtonVisible:", v3);

    if (v3)
    {
      -[TUICandidateView state](self, "state");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "sortControlPosition");

      if (v27 == 4)
      {
        -[TUICandidateView sortControl](self, "sortControl");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "frame");
        v30 = v29;
        v32 = v31;
        v34 = v33;

        -[TUICandidateView bounds](self, "bounds");
        v36 = v35;
        -[TUICandidateView getArrowButtonSizeForGrid](self, "getArrowButtonSizeForGrid");
        v38 = v36 - v37;
        -[TUICandidateView sortControl](self, "sortControl");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setFrame:", v30, v32, v38, v34);

        -[TUICandidateView sortControl](self, "sortControl");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "layoutIfNeeded");
LABEL_19:

      }
    }
  }
}

- (BOOL)showingArrowButton
{
  TUICandidateArrowButton *arrowButton;

  arrowButton = self->_arrowButton;
  if (arrowButton)
    LOBYTE(arrowButton) = -[TUICandidateArrowButton isHidden](arrowButton, "isHidden") ^ 1;
  return (char)arrowButton;
}

- (int64_t)effectiveCandidateArrowButonPosition
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;

  -[TUICandidateView state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "arrowButtonPosition");

  v5 = -[TUICandidateView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v6 = 5;
  if (v5 != 1)
    v6 = 1;
  v7 = 5;
  if (v5 == 1)
    v7 = 1;
  if (v4 != 6)
    v7 = v4;
  if (v4 == 7)
    return v6;
  else
    return v7;
}

- (CGSize)getArrowButtonSizeForGrid
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  if (-[TUICandidateView effectiveCandidateArrowButonPosition](self, "effectiveCandidateArrowButonPosition") == 1)
  {
    -[TUICandidateView arrowButtonWidth](self, "arrowButtonWidth");
    v4 = v5;
    -[TUICandidateView state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "inlineTextViewPosition"))
    {
      -[TUICandidateView arrowButtonHeight](self, "arrowButtonHeight");
      v3 = v7;
    }

  }
  v8 = v4;
  v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v8;

  v8 = a3;
  if (-[TUICandidateView shouldAutomaticallyHideAndShowSortControl](self, "shouldAutomaticallyHideAndShowSortControl"))
  {
    objc_msgSend(v8, "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v8);
    v6 = v5;

    if (v6 > 200.0 || v6 < -5.0)
      -[TUICandidateView toggleSortControl:animated:](self, "toggleSortControl:animated:", v6 > 200.0, 1);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[TUICandidateView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUICandidateView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateViewWillBeginDragging:", self);

  }
}

- (void)candidateGrid:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  _BOOL8 v12;
  void *v13;
  TUICandidateGrid *v14;

  v14 = (TUICandidateGrid *)a3;
  v8 = a4;
  v9 = a5;
  -[TUICandidateView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = self->_disambiguationGrid == v14;
    -[TUICandidateView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "candidateView:didAcceptCandidate:atIndexPath:inGridType:", self, v8, v9, v12);

  }
}

- (void)candidateGridSelectionDidChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[TUICandidateView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TUICandidateView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView primaryGrid](self, "primaryGrid");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateViewSelectionDidChange:inGridType:", self, v7 != v8);

  }
}

- (void)candidateGrid:(id)a3 didChangeContentSize:(CGSize)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[TUICandidateView updateArrowButtonVisibility](self, "updateArrowButtonVisibility");
}

- (void)candidateGrid:(id)a3 didMoveHighlightFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[TUICandidateView state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leftEdgeSeparatorImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      -[TUICandidateView state](self, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rightEdgeSeparatorImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_13;
    }
    -[TUICandidateView convertRect:fromView:](self, "convertRect:fromView:", v9, x, y, width, height);
    UIRectInset();
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[UIView _allLines](self, "_allLines", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v30, "frame");
          v42.origin.x = v31;
          v42.origin.y = v32;
          v42.size.width = v33;
          v42.size.height = v34;
          v41.origin.x = v18;
          v41.origin.y = v20;
          v41.size.width = v22;
          v41.size.height = v24;
          objc_msgSend(v30, "setHidden:", CGRectIntersectsRect(v41, v42));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v27);
    }

  }
LABEL_13:

}

- (void)candidateGridNeedsToExpand:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v7)
    goto LABEL_4;
  -[TUICandidateView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TUICandidateView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateViewNeedsToExpand:", self);
LABEL_4:

  }
}

- (id)visibleCandidates
{
  void *v2;
  void *v3;

  -[TUICandidateView primaryGrid](self, "primaryGrid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filteredCandidates
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCandidates");

  if (!v4)
    return MEMORY[0x1E0C9AA60];
  -[TUICandidateView candidateResultSet](self, "candidateResultSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[TUICandidateView candidateResultSet](self, "candidateResultSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortMethodGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateView candidateResultSet](self, "candidateResultSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortMethods");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0DBDBD8]);
    v16 = (void *)MEMORY[0x1E0C99E40];
    -[TUICandidateView candidateResultSet](self, "candidateResultSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "candidates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "orderedSetWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v15, "initWithTitle:candidates:", &stru_1E24FC6C0, v19);
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "candidates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (TUICandidateViewState)state
{
  return self->_state;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (NSString)inlineText
{
  return self->_inlineText;
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a3);
}

- (TUICandidateViewDelegate)delegate
{
  return (TUICandidateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)clipsToBoundsView
{
  return self->_clipsToBoundsView;
}

- (void)setClipsToBoundsView:(id)a3
{
  objc_storeStrong((id *)&self->_clipsToBoundsView, a3);
}

- (CAShapeLayer)roundedBorderLayer
{
  return self->_roundedBorderLayer;
}

- (void)setRoundedBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_roundedBorderLayer, a3);
}

- (TUICandidateMask)candidateMask
{
  return self->_candidateMask;
}

- (void)setCandidateMask:(id)a3
{
  objc_storeStrong((id *)&self->_candidateMask, a3);
}

- (TUICandidateGrid)primaryGrid
{
  return self->_primaryGrid;
}

- (void)setPrimaryGrid:(id)a3
{
  objc_storeStrong((id *)&self->_primaryGrid, a3);
}

- (TUICandidateGrid)disambiguationGrid
{
  return self->_disambiguationGrid;
}

- (void)setDisambiguationGrid:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationGrid, a3);
}

- (TUICandidateSortControl)sortControl
{
  return self->_sortControl;
}

- (void)setSortControl:(id)a3
{
  objc_storeStrong((id *)&self->_sortControl, a3);
}

- (TUICandidateInlineTextView)inlineTextView
{
  return self->_inlineTextView;
}

- (void)setInlineTextView:(id)a3
{
  objc_storeStrong((id *)&self->_inlineTextView, a3);
}

- (TUICandidateArrowButton)arrowButton
{
  return self->_arrowButton;
}

- (void)setArrowButton:(id)a3
{
  objc_storeStrong((id *)&self->_arrowButton, a3);
}

- (TUICandidateBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (BOOL)showingSortControl
{
  return self->_showingSortControl;
}

- (void)setShowingSortControl:(BOOL)a3
{
  self->_showingSortControl = a3;
}

- (BOOL)shouldShowArrowButton
{
  return self->_shouldShowArrowButton;
}

- (void)setShouldShowArrowButton:(BOOL)a3
{
  self->_shouldShowArrowButton = a3;
}

- (BOOL)changingLayout
{
  return self->_changingLayout;
}

- (void)setChangingLayout:(BOOL)a3
{
  self->_changingLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_arrowButton, 0);
  objc_storeStrong((id *)&self->_inlineTextView, 0);
  objc_storeStrong((id *)&self->_sortControl, 0);
  objc_storeStrong((id *)&self->_disambiguationGrid, 0);
  objc_storeStrong((id *)&self->_primaryGrid, 0);
  objc_storeStrong((id *)&self->_candidateMask, 0);
  objc_storeStrong((id *)&self->_roundedBorderLayer, 0);
  objc_storeStrong((id *)&self->_clipsToBoundsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_inlineText, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

uint64_t __47__TUICandidateView_toggleSortControl_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeLayoutInsideAnimationBlock");
}

uint64_t __47__TUICandidateView_toggleSortControl_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setHidden:", *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeLayoutInsideAnimationBlock");
}

uint64_t __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeLayoutChange");
}

uint64_t __72__TUICandidateView_setState_animated_animator_options_force_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "reloadGridsIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

void __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "sortControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "candidateMask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  v7 = *(double *)(a1 + 40);
  v8 = *(double *)(a1 + 48);
  v9 = *(double *)(a1 + 56);
  v10 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "primaryGrid");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

}

void __52__TUICandidateView_changeLayoutInsideAnimationBlock__block_invoke_3(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "primaryGrid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

@end
