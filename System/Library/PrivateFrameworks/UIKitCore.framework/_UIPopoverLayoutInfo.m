@implementation _UIPopoverLayoutInfo

+ (id)_observationKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("preferredContentSize"), CFSTR("preferredArrowDirections"), CFSTR("containingFrame"), CFSTR("containingFrameInsets"), CFSTR("sourceViewRect"), CFSTR("canOverlapSourceViewRect"), CFSTR("contentInset"), CFSTR("arrowHeight"), CFSTR("arrowOffset"), CFSTR("preferLandscapeOrientations"), 0);
}

- (_UIPopoverLayoutInfo)init
{
  char *v2;
  _UIPopoverLayoutInfo *v3;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)_UIPopoverLayoutInfo;
  v2 = -[_UIPopoverLayoutInfo init](&v19, sel_init);
  v3 = (_UIPopoverLayoutInfo *)v2;
  if (v2)
  {
    v2[176] = 1;
    v2[233] = 1;
    __asm { FMOV            V0.2D, #8.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *(_OWORD *)(v2 + 24) = _Q0;
    *((_QWORD *)v2 + 5) = 0x4032000000000000;
    objc_msgSend((id)objc_opt_class(), "_observationKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[_UIPopoverLayoutInfo addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", v3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), 1, 0);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "_setUpdatesEnabled:", 0);
  objc_msgSend(v4, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  objc_msgSend(v4, "setArrowHeight:", self->_arrowHeight);
  objc_msgSend(v4, "setArrowOffset:", self->_arrowOffset);
  objc_msgSend(v4, "setPreferredContentSize:", self->_preferredContentSize.width, self->_preferredContentSize.height);
  objc_msgSend(v4, "setPreferredArrowDirections:", self->_preferredArrowDirections);
  objc_msgSend(v4, "setContainingFrame:", self->_containingFrame.origin.x, self->_containingFrame.origin.y, self->_containingFrame.size.width, self->_containingFrame.size.height);
  objc_msgSend(v4, "setContainingFrameInsets:", self->_containingFrameInsets.top, self->_containingFrameInsets.left, self->_containingFrameInsets.bottom, self->_containingFrameInsets.right);
  objc_msgSend(v4, "setSourceViewRect:", self->_sourceViewRect.origin.x, self->_sourceViewRect.origin.y, self->_sourceViewRect.size.width, self->_sourceViewRect.size.height);
  objc_msgSend(v4, "setCanOverlapSourceViewRect:", self->_canOverlapSourceViewRect);
  objc_msgSend(v4, "setPreferLandscapeOrientations:", self->_preferLandscapeOrientations);
  objc_msgSend(v4, "setPreferredHorizontalAlignment:", self->_preferredHorizontalAlignment);
  objc_msgSend(v4, "setIsRTL:", self->_isRTL);
  objc_msgSend(v4, "_setUpdatesEnabled:", 1);
  objc_msgSend(v4, "_updateOutputs");
  return v4;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_observationKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[_UIPopoverLayoutInfo removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_UIPopoverLayoutInfo;
  -[_UIPopoverLayoutInfo dealloc](&v8, sel_dealloc);
}

- (id)description
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  CGSize v21;
  CGRect v22;
  UIEdgeInsets v23;
  CGRect v24;
  CGRect v25;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverLayoutInfo preferredContentSize](self, "preferredContentSize");
  NSStringFromCGSize(v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromPopoverArrowDirection(-[_UIPopoverLayoutInfo preferredArrowDirections](self, "preferredArrowDirections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverLayoutInfo containingFrame](self, "containingFrame");
  NSStringFromCGRect(v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverLayoutInfo containingFrameInsets](self, "containingFrameInsets");
  NSStringFromUIEdgeInsets(v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverLayoutInfo sourceViewRect](self, "sourceViewRect");
  NSStringFromCGRect(v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIPopoverLayoutInfo canOverlapSourceViewRect](self, "canOverlapSourceViewRect"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[_UIPopoverLayoutInfo preferLandscapeOrientations](self, "preferLandscapeOrientations"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  -[_UIPopoverLayoutInfo frame](self, "frame");
  NSStringFromCGRect(v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverLayoutInfo offset](self, "offset");
  v14 = v13;
  NSStringFromPopoverArrowDirection(-[_UIPopoverLayoutInfo arrowDirection](self, "arrowDirection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("[<%@ %p> %@]: INPUTS: preferredContentSize: %@, preferredArrowDirections: %@, containingFrame: %@, containingFrameInsets: %@, targetRect: %@, canOverlapSourceViewRect: %@, preferLandscapeOrientations: %@     OUTPUTS: frame: %@, offset: %f, arrowDirection: %@, candidates: %@"), v19, self, v18, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, self->_candidates);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)updateProperties:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[_UIPopoverLayoutInfo _setUpdatesEnabled:](self, "_setUpdatesEnabled:", 0);
  v4[2](v4);

  -[_UIPopoverLayoutInfo _setUpdatesEnabled:](self, "_setUpdatesEnabled:", 1);
  -[_UIPopoverLayoutInfo _updateOutputs](self, "_updateOutputs");
}

- (id)candidates
{
  return self->_candidates;
}

- (CGSize)_popoverViewSizeForContentSize:(CGSize)a3 arrowDirection:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets *p_bottom;
  double height;
  uint64_t v12;
  double v16;
  double v17;
  void *v18;
  CGSize result;

  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D820];
  switch(a4)
  {
    case 0uLL:
      v9 = a3.width + self->_contentInset.left + self->_contentInset.right;
      height = a3.height + self->_contentInset.top;
      p_bottom = (UIEdgeInsets *)&self->_contentInset.bottom;
      v12 = 40;
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
      p_bottom = &self->_contentInset;
      v9 = a3.width + self->_contentInset.left + self->_contentInset.right;
      height = a3.height + self->_arrowHeight;
      v12 = 24;
      goto LABEL_5;
    case 4uLL:
    case 8uLL:
      p_bottom = &self->_contentInset;
      v9 = a3.width + self->_arrowHeight + self->_contentInset.left + self->_contentInset.right;
      v12 = 24;
      height = a3.height;
LABEL_5:
      v8 = height + p_bottom->top + *(double *)((char *)&self->super.isa + v12);
      break;
    default:
      break;
  }
  if ((a3.width != v6 || a3.height != v7) && v9 == v6 && v8 == v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPopoverLayoutInfo.m"), 198, CFSTR("Unknown direction passed to _popoverViewSizeForContentSize:arrowDirection:"));

  }
  v16 = v9;
  v17 = v8;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGRect)_effectiveViewSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceViewRect.origin.x;
  y = self->_sourceViewRect.origin.y;
  width = self->_sourceViewRect.size.width;
  height = self->_sourceViewRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_updateOutputs
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double width;
  double height;
  double top;
  double left;
  double bottom;
  double right;
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
  double v29;
  double v30;
  unint64_t preferredArrowDirections;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int64_t preferredHorizontalAlignment;
  _BOOL4 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat MidX;
  double v46;
  double v47;
  double v48;
  double v49;
  double MinY;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double MaxY;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  unsigned int v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  BOOL v74;
  _BOOL4 preferLandscapeOrientations;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat y;
  double v101;
  CGFloat x;
  double v103;
  CGFloat v104;
  CGFloat *v105;
  double v106;
  double v107;
  unint64_t v108;
  _BOOL4 v109;
  double v110;
  double v111;
  CGFloat v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  CGFloat v118;
  CGFloat v119;
  unint64_t arrowDirection;
  double MidY;
  double offset;
  double v123;
  double v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  double r1;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  double v138;
  double v139;
  double v140;
  double rect;
  CGRect rect_8;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  _BYTE v148[32];
  double v149;
  double v150;
  CGFloat v151;
  double v152;
  double v153;
  double v154;
  _QWORD v155[2];
  _QWORD v156[15];
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;

  v156[14] = *MEMORY[0x1E0C80C00];
  -[_UIPopoverLayoutInfo _effectiveViewSourceRect](self, "_effectiveViewSourceRect");
  v5 = v4;
  v6 = v3;
  v8 = v7;
  v10 = v9;
  width = self->_containingFrame.size.width;
  height = self->_containingFrame.size.height;
  top = self->_containingFrameInsets.top;
  left = self->_containingFrameInsets.left;
  bottom = self->_containingFrameInsets.bottom;
  right = self->_containingFrameInsets.right;
  v17 = width - (left + right);
  v18 = height - (top + bottom);
  v138 = v8;
  v139 = v10;
  v140 = v3;
  rect = v4;
  v152 = self->_containingFrame.origin.x + left;
  v153 = self->_containingFrame.origin.y + top;
  if (self->_preferredArrowDirections)
  {
    v149 = width - (left + right);
    v150 = height - (top + bottom);
    v19 = v3 + floor(v10 * 0.5);
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    *(_QWORD *)&v148[16] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_QWORD *)&v148[24] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 4, self->_preferredContentSize.width, self->_preferredContentSize.height);
    v146 = v22;
    v24 = v23;
    -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 1, self->_preferredContentSize.width, self->_preferredContentSize.height);
    v25 = v8;
    v27 = v26;
    v28 = v5;
    v30 = v29;
    preferredArrowDirections = self->_preferredArrowDirections;
    v32 = v28 + v25;
    v33 = v19 - floor(v24 * 0.5);
    *(double *)v148 = v20;
    *(double *)&v148[8] = v21;
    if ((preferredArrowDirections & 4) != 0)
      v34 = v28 + v25;
    else
      v34 = v20;
    if ((preferredArrowDirections & 4) == 0)
      v33 = v21;
    v127 = v33;
    v128 = v34;
    if ((preferredArrowDirections & 4) != 0)
      v35 = v146;
    else
      v35 = *(double *)&v148[16];
    v36 = *(double *)&v148[24];
    if ((preferredArrowDirections & 4) != 0)
      v36 = v24;
    v125 = v36;
    v126 = v35;
    preferredHorizontalAlignment = self->_preferredHorizontalAlignment;
    if (preferredHorizontalAlignment == 1)
    {
      v38 = -[_UIPopoverLayoutInfo isRTL](self, "isRTL");
      v39 = v32 - v27;
      v40 = v28;
    }
    else
    {
      if (preferredHorizontalAlignment != 2)
      {
        v40 = rect + floor(v138 * 0.5) - floor(v27 * 0.5);
        v54 = v153;
LABEL_29:
        v64 = v20;
        v63 = v21;
        v65 = *(double *)&v148[16];
        v66 = *(double *)&v148[24];
        if ((preferredArrowDirections & 1) != 0)
        {
          v63 = v140 + v139;
          v64 = v40;
          v65 = v27;
          v66 = v30;
        }
        v67 = 0;
        v68 = 0;
        v69 = v19 - floor(v24 * 0.5);
        if ((preferredArrowDirections & 8) != 0)
          v70 = rect - v146;
        else
          v70 = v20;
        if ((preferredArrowDirections & 8) != 0)
          v71 = v69;
        else
          v71 = v21;
        if ((preferredArrowDirections & 8) != 0)
          v72 = v146;
        else
          v72 = *(double *)&v148[16];
        if ((preferredArrowDirections & 8) != 0)
          v73 = v24;
        else
          v73 = *(double *)&v148[24];
        v74 = (preferredArrowDirections & 2) == 0;
        preferLandscapeOrientations = self->_preferLandscapeOrientations;
        if (v74)
          v76 = v20;
        else
          v76 = v40;
        if (v74)
          v77 = v21;
        else
          v77 = v140 - v30;
        if (v74)
          v78 = *(double *)&v148[16];
        else
          v78 = v27;
        if (v74)
          v79 = *(double *)&v148[24];
        else
          v79 = v30;
        if (self->_preferLandscapeOrientations)
          v80 = v128;
        else
          v80 = v76;
        if (self->_preferLandscapeOrientations)
          v81 = v127;
        else
          v81 = v77;
        *(double *)v155 = v80;
        *(double *)&v155[1] = v81;
        if (preferLandscapeOrientations)
          v82 = v126;
        else
          v82 = v78;
        if (preferLandscapeOrientations)
          v83 = v125;
        else
          v83 = v79;
        *(double *)v156 = v82;
        *(double *)&v156[1] = v83;
        if (preferLandscapeOrientations)
          v84 = v70;
        else
          v84 = v128;
        if (preferLandscapeOrientations)
          v85 = v71;
        else
          v85 = v127;
        *(double *)&v156[2] = v84;
        *(double *)&v156[3] = v85;
        v86 = (double *)v156;
        if (preferLandscapeOrientations)
          v87 = v72;
        else
          v87 = v126;
        if (preferLandscapeOrientations)
          v88 = v73;
        else
          v88 = v125;
        rect_8.origin.x = v76;
        rect_8.origin.y = v77;
        if (preferLandscapeOrientations)
          v89 = v76;
        else
          v89 = v64;
        if (preferLandscapeOrientations)
          v90 = v77;
        else
          v90 = v63;
        rect_8.size.width = v78;
        rect_8.size.height = v79;
        if (preferLandscapeOrientations)
          v91 = v78;
        else
          v91 = v65;
        if (preferLandscapeOrientations)
          v92 = v79;
        else
          v92 = v66;
        *(double *)&v156[4] = v87;
        *(double *)&v156[5] = v88;
        v131 = v71;
        v132 = v70;
        v136 = v64;
        v137 = v63;
        if (preferLandscapeOrientations)
          v93 = v64;
        else
          v93 = v70;
        if (preferLandscapeOrientations)
          v94 = v63;
        else
          v94 = v71;
        *(double *)&v156[6] = v89;
        *(double *)&v156[7] = v90;
        v129 = v73;
        v130 = v72;
        v134 = v66;
        v135 = v65;
        if (preferLandscapeOrientations)
          v95 = v65;
        else
          v95 = v72;
        if (preferLandscapeOrientations)
          v96 = v66;
        else
          v96 = v73;
        *(double *)&v156[8] = v91;
        *(double *)&v156[9] = v92;
        *(double *)&v156[10] = v93;
        *(double *)&v156[11] = v94;
        *(double *)&v156[12] = v95;
        *(double *)&v156[13] = v96;
        r1 = v140 - v54;
        v154 = 0.0;
        v143 = v20;
        v144 = v21;
        v145 = *(double *)&v148[16];
        v147 = *(double *)&v148[24];
        do
        {
          v97 = *(v86 - 2);
          if (self->_canOverlapSourceViewRect)
          {
            v98 = *(v86 - 1);
            v99 = *v86;
            y = v54;
            v101 = v149;
            v103 = v150;
            x = v152;
            v104 = v86[1];
          }
          else
          {
            v98 = *(v86 - 1);
            v99 = *v86;
            v104 = v86[1];
            v169.origin.x = *(v86 - 2);
            v169.origin.y = v98;
            v169.size.width = *v86;
            v169.size.height = v104;
            if (CGRectEqualToRect(v169, rect_8))
            {
              v191.size.height = v150;
              v170.origin.x = v152;
              v170.origin.y = v54;
              v170.size.width = v149;
              v170.size.height = r1;
              v191.origin.x = v152;
              v191.origin.y = v54;
              v191.size.width = v149;
              v171 = CGRectIntersection(v170, v191);
              x = v171.origin.x;
              y = v171.origin.y;
              v101 = v171.size.width;
              v103 = v171.size.height;
            }
            else
            {
              v172.origin.x = v97;
              v172.origin.y = v98;
              v172.size.width = v99;
              v172.size.height = v104;
              v192.origin.x = v136;
              v192.origin.y = v137;
              v192.size.height = v134;
              v192.size.width = v135;
              if (CGRectEqualToRect(v172, v192))
              {
                v173.origin.x = rect;
                v173.origin.y = v140;
                v173.size.width = v138;
                v173.size.height = v139;
                v103 = v150 - (CGRectGetMaxY(v173) - v54);
                v174.origin.x = rect;
                v174.origin.y = v140;
                v174.size.width = v138;
                v174.size.height = v139;
                y = CGRectGetMaxY(v174);
                x = v152;
                v101 = v149;
              }
              else
              {
                v175.origin.x = v97;
                v175.origin.y = v98;
                v175.size.width = v99;
                v175.size.height = v104;
                v193.origin.y = v131;
                v193.origin.x = v132;
                v193.size.height = v129;
                v193.size.width = v130;
                if (CGRectEqualToRect(v175, v193))
                {
                  v176.origin.y = v140;
                  v176.origin.x = rect;
                  v176.size.width = v138;
                  v176.size.height = v139;
                  x = v152;
                  v101 = CGRectGetMidX(v176) - v152;
                  y = v54;
                }
                else
                {
                  v177.origin.x = v97;
                  v177.origin.y = v98;
                  v177.size.width = v99;
                  v177.size.height = v104;
                  v194.origin.y = v127;
                  v194.origin.x = v128;
                  v194.size.height = v125;
                  v194.size.width = v126;
                  if (CGRectEqualToRect(v177, v194))
                  {
                    v178.origin.x = rect;
                    v178.origin.y = v140;
                    v178.size.width = v138;
                    v178.size.height = v139;
                    v101 = v149 - (CGRectGetMidX(v178) - v152);
                    v179.origin.x = rect;
                    v179.origin.y = v140;
                    v179.size.width = v138;
                    v179.size.height = v139;
                    x = CGRectGetMidX(v179);
                    y = v153;
                  }
                  else
                  {
                    x = v152;
                    y = v54;
                    v101 = v149;
                  }
                }
                v103 = v150;
              }
            }
          }
          v180.origin.x = v97;
          v180.origin.y = v98;
          v180.size.width = v99;
          v180.size.height = v104;
          v195.origin.x = x;
          v195.origin.y = y;
          v195.size.width = v101;
          v195.size.height = v103;
          v181 = CGRectIntersection(v180, v195);
          if (v181.size.width * v181.size.height > v154)
          {
            v145 = v101;
            v147 = v103;
            v143 = x;
            v144 = y;
            v154 = v181.size.width * v181.size.height;
            v68 = v67;
            *(CGRect *)v148 = v181;
          }
          ++v67;
          v86 += 4;
          v54 = v153;
        }
        while (v67 != 4);
        v105 = (CGFloat *)&v155[4 * v68];
        v107 = *v105;
        v106 = v105[1];
        v53 = v105[2];
        v57 = v105[3];
        v182.origin.x = *v105;
        v182.origin.y = v106;
        v182.size.width = v53;
        v182.size.height = v57;
        v196.origin.x = v136;
        v196.origin.y = v137;
        v196.size.height = v134;
        v196.size.width = v135;
        if (CGRectEqualToRect(v182, v196))
        {
          v108 = 1;
        }
        else
        {
          v183.origin.x = v107;
          v183.origin.y = v106;
          v183.size.width = v53;
          v183.size.height = v57;
          if (CGRectEqualToRect(v183, rect_8))
          {
            v108 = 2;
          }
          else
          {
            v184.origin.x = v107;
            v184.origin.y = v106;
            v184.size.width = v53;
            v184.size.height = v57;
            v197.origin.y = v131;
            v197.origin.x = v132;
            v197.size.height = v129;
            v197.size.width = v130;
            if (CGRectEqualToRect(v184, v197))
            {
              v108 = 8;
            }
            else
            {
              v185.origin.x = v107;
              v185.origin.y = v106;
              v185.size.width = v53;
              v185.size.height = v57;
              v198.origin.y = v127;
              v198.origin.x = v128;
              v198.size.height = v125;
              v198.size.width = v126;
              v109 = CGRectEqualToRect(v185, v198);
              v108 = 4;
              if (!v109)
                v108 = 1;
            }
          }
        }
        self->_arrowDirection = v108;
        v51 = v147;
        if (*(double *)v148 <= v107)
          v61 = v107 - (v53 - *(double *)&v148[16]);
        else
          v61 = *(double *)v148;
        if (*(double *)&v148[8] <= v106)
          v48 = v106 - (v57 - *(double *)&v148[24]);
        else
          v48 = *(double *)&v148[8];
        v62 = v143;
        v49 = v144;
        v17 = v145;
        goto LABEL_134;
      }
      v38 = -[_UIPopoverLayoutInfo isRTL](self, "isRTL");
      v40 = v32 - v27;
      v39 = rect;
    }
    v54 = v153;
    if (v38)
      v40 = v39;
    preferredArrowDirections = self->_preferredArrowDirections;
    goto LABEL_29;
  }
  self->_arrowDirection = 0;
  -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 0, self->_preferredContentSize.width, self->_preferredContentSize.height);
  v42 = v41;
  v44 = v43;
  v157.origin.x = v5;
  v157.origin.y = v6;
  v157.size.width = v8;
  v157.size.height = v10;
  MidX = CGRectGetMidX(v157);
  v158.origin.y = v6;
  v46 = MidX;
  v158.origin.x = v5;
  v158.size.width = v8;
  v158.size.height = v10;
  v47 = floor(v46 - v42 * 0.5);
  v48 = floor(CGRectGetMidY(v158) - v44 * 0.5);
  v159.origin.x = v47;
  v159.origin.y = v48;
  v151 = v42;
  v159.size.width = v42;
  v49 = v153;
  v159.size.height = v44;
  MinY = CGRectGetMinY(v159);
  v160.origin.x = v152;
  v160.origin.y = v153;
  v160.size.width = v17;
  v160.size.height = v18;
  v51 = v18;
  if (MinY >= CGRectGetMinY(v160))
  {
    v53 = v151;
  }
  else
  {
    v161.origin.x = v152;
    v161.origin.y = v153;
    v161.size.width = v17;
    v161.size.height = v18;
    v52 = CGRectGetMinY(v161);
    v162.origin.x = v47;
    v162.origin.y = v48;
    v53 = v151;
    v162.size.width = v151;
    v162.size.height = v44;
    v48 = v48 + v52 - CGRectGetMinY(v162);
  }
  v163.origin.x = v47;
  v163.origin.y = v48;
  v163.size.width = v53;
  v163.size.height = v44;
  MaxY = CGRectGetMaxY(v163);
  v164.origin.x = v152;
  v164.origin.y = v153;
  v164.size.width = v17;
  v164.size.height = v51;
  if (MaxY > CGRectGetMaxY(v164))
  {
    v165.origin.x = v47;
    v165.origin.y = v48;
    v165.size.width = v53;
    v165.size.height = v44;
    v56 = CGRectGetMaxY(v165);
    v166.origin.x = v152;
    v166.origin.y = v153;
    v166.size.width = v17;
    v166.size.height = v51;
    v48 = v48 - (v56 - CGRectGetMaxY(v166));
  }
  v167.origin.x = v47;
  v167.origin.y = v48;
  v167.size.width = v53;
  v57 = v44;
  v167.size.height = v44;
  v190.origin.x = v152;
  v190.origin.y = v153;
  v190.size.width = v17;
  v190.size.height = v51;
  v168 = CGRectIntersection(v167, v190);
  v58 = v53 - v168.size.width;
  v59 = -(v53 - v168.size.width);
  if (v168.origin.x == v47)
    v60 = v59;
  else
    v60 = v58;
  v61 = v47 + v60;
  v62 = v152;
LABEL_134:
  v110 = v49;
  v111 = v17;
  v112 = v51;
  v113 = v48;
  v114 = v53;
  v115 = v57;
  v186 = CGRectIntersection(*(CGRect *)&v62, *(CGRect *)&v61);
  v116 = v186.origin.x;
  v117 = v186.origin.y;
  v118 = v186.size.width;
  v119 = v186.size.height;
  arrowDirection = self->_arrowDirection;
  if (arrowDirection - 1 < 2)
  {
    v188.origin.y = v140;
    v188.origin.x = rect;
    v188.size.width = v138;
    v188.size.height = v139;
    v123 = CGRectGetMidX(v188);
    v189.origin.x = v116;
    v189.origin.y = v117;
    v189.size.width = v118;
    v189.size.height = v119;
    offset = v123 - CGRectGetMidX(v189);
  }
  else if (arrowDirection == 4 || arrowDirection == 8)
  {
    MidY = CGRectGetMidY(v186);
    v187.origin.y = v140;
    v187.origin.x = rect;
    v187.size.width = v138;
    v187.size.height = v139;
    offset = -(MidY - CGRectGetMidY(v187));
  }
  else
  {
    offset = self->_offset;
  }
  v124 = round(offset + self->_arrowOffset);
  self->_frame.size.height = v119;
  self->_offset = v124;
  self->_frame.origin.x = round(v116);
  self->_frame.origin.y = round(v117);
  self->_frame.size.width = v118;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_updatesEnabled)
    -[_UIPopoverLayoutInfo _updateOutputs](self, "_updateOutputs", a3, a4, a5, a6);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (double)arrowHeight
{
  return self->_arrowHeight;
}

- (void)setArrowHeight:(double)a3
{
  self->_arrowHeight = a3;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (void)setArrowOffset:(double)a3
{
  self->_arrowOffset = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (unint64_t)preferredArrowDirections
{
  return self->_preferredArrowDirections;
}

- (void)setPreferredArrowDirections:(unint64_t)a3
{
  self->_preferredArrowDirections = a3;
}

- (CGRect)containingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containingFrame.origin.x;
  y = self->_containingFrame.origin.y;
  width = self->_containingFrame.size.width;
  height = self->_containingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainingFrame:(CGRect)a3
{
  self->_containingFrame = a3;
}

- (UIEdgeInsets)containingFrameInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_containingFrameInsets.top;
  left = self->_containingFrameInsets.left;
  bottom = self->_containingFrameInsets.bottom;
  right = self->_containingFrameInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContainingFrameInsets:(UIEdgeInsets)a3
{
  self->_containingFrameInsets = a3;
}

- (CGRect)sourceViewRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceViewRect.origin.x;
  y = self->_sourceViewRect.origin.y;
  width = self->_sourceViewRect.size.width;
  height = self->_sourceViewRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceViewRect:(CGRect)a3
{
  self->_sourceViewRect = a3;
}

- (BOOL)canOverlapSourceViewRect
{
  return self->_canOverlapSourceViewRect;
}

- (void)setCanOverlapSourceViewRect:(BOOL)a3
{
  self->_canOverlapSourceViewRect = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)offset
{
  return self->_offset;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (BOOL)_updatesEnabled
{
  return self->_updatesEnabled;
}

- (void)_setUpdatesEnabled:(BOOL)a3
{
  self->_updatesEnabled = a3;
}

- (BOOL)preferLandscapeOrientations
{
  return self->_preferLandscapeOrientations;
}

- (void)setPreferLandscapeOrientations:(BOOL)a3
{
  self->_preferLandscapeOrientations = a3;
}

- (int64_t)preferredHorizontalAlignment
{
  return self->_preferredHorizontalAlignment;
}

- (void)setPreferredHorizontalAlignment:(int64_t)a3
{
  self->_preferredHorizontalAlignment = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
}

@end
