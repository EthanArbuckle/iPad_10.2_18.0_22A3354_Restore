@implementation PKStackedTextItemGroupView

- (PKStackedTextItemGroupView)initWithCoder:(id)a3
{

  return 0;
}

- (PKStackedTextItemGroupView)initWithFrame:(CGRect)a3
{
  return -[PKStackedTextItemGroupView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKStackedTextItemGroupView)initWithStyle:(int64_t)a3
{
  PKStackedTextItemGroupView *v4;
  PKStackedTextItemGroupView *v5;
  NSMutableArray *v6;
  NSMutableArray *itemViews;
  PKStackedTextItemView *v8;
  double v9;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKStackedTextItemGroupView;
  v4 = -[PKStackedTextItemGroupView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    itemViews = v5->_itemViews;
    v5->_itemViews = v6;

    v8 = -[PKStackedTextItemView initWithStyle:]([PKStackedTextItemView alloc], "initWithStyle:", v5->_style);
    -[PKStackedTextItemGroupView addSubview:](v5, "addSubview:", v8);
    -[NSMutableArray addObject:](v5->_itemViews, "addObject:", v8);
    if (v8)
    {
      -[PKStackedTextItemView boundingMetricForWidth:](v8, "boundingMetricForWidth:", 0.0);
      v9 = v11;
    }
    else
    {
      v9 = 0.0;
    }
    v5->_intrinsicHeight = v9;
    *(_WORD *)v5->_initialLayout = 257;

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = self->_contentInset.top + self->_intrinsicHeight + self->_contentInset.bottom;
  result.height = v3;
  return result;
}

- (double)headerPadding
{
  void *v3;
  double v4;
  double v5;

  if (!-[NSMutableArray count](self->_itemViews, "count"))
    return 0.0;
  -[NSMutableArray firstObject](self->_itemViews, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerPadding");
  v5 = v4;

  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  int v14;
  CGRectEdge v15;
  CGRectEdge v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  double *v30;
  char *v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double *v36;
  char *v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat MaxY;
  double v48;
  double v49;
  unint64_t v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  _BOOL4 v57;
  _BOOL4 v58;
  unint64_t v59;
  unint64_t v60;
  BOOL v61;
  char *v62;
  BOOL *v63;
  int v64;
  char *v65;
  BOOL *v66;
  int v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  CGFloat MaxX;
  double v79;
  CGFloat v80;
  _BOOL8 v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  _BOOL4 animated;
  double v90;
  uint64_t v91;
  _BOOL8 v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  _BOOL4 v101;
  double v102;
  uint64_t v103;
  NSMutableArray *snapshotsToRemove;
  NSMutableArray *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t i;
  void *v110;
  void *v111;
  float v112;
  float v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  int64_t slideMode;
  void *v129;
  double v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  id v135;
  NSMutableArray *v136;
  unint64_t v137;
  double v138;
  double v139;
  double v140;
  CGFloat v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  double v147;
  int v148;
  double v149;
  int v150;
  double v151;
  double v152;
  double v153;
  CGFloat v154;
  double v155;
  _QWORD v156[5];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  CGRect v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  CGRect slice;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  CGRect remainder;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  objc_super v191;
  _BYTE v192[128];
  uint64_t v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;

  v193 = *MEMORY[0x1E0C80C00];
  v191.receiver = self;
  v191.super_class = (Class)PKStackedTextItemGroupView;
  -[PKStackedTextItemGroupView layoutSubviews](&v191, sel_layoutSubviews);
  -[PKStackedTextItemGroupView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v10 = v9 - (left + self->_contentInset.right);
  v12 = v11 - (top + self->_contentInset.bottom);
  v13 = self->_boundsSize.height == v12 && self->_boundsSize.width == v10;
  self->_boundsSize.width = v10;
  self->_boundsSize.height = v12;
  v141 = v12;
  v14 = -[PKStackedTextItemGroupView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v150 = v14;
  if (v14)
    v15 = CGRectMaxXEdge;
  else
    v15 = CGRectMinXEdge;
  if (v14)
    v16 = CGRectMinXEdge;
  else
    v16 = CGRectMaxXEdge;
  v17 = -[NSMutableArray count](self->_itemViews, "count");
  if (v17)
  {
    v18 = v17;
    -[NSMutableArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == 1)
    {
      v20 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  v139 = v6 + top;
  v140 = v4 + left;
  objc_msgSend(v19, "content");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "content");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (double *)MEMORY[0x1E0C9D820];
  v143 = v20;
  v144 = v19;
  v142 = v21;
  v146 = v10;
  if (v13)
  {
    objc_msgSend(v19, "frame");
    v24 = v23;
    objc_msgSend(v20, "frame");
    v26 = v25;
    goto LABEL_84;
  }
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v182 = 0u;
  v180 = 0u;
  memset(&remainder, 0, sizeof(remainder));
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  memset(&slice, 0, sizeof(slice));
  if (v19)
    objc_msgSend(v19, "boundingMetricForWidth:", v10);
  if (v20)
    objc_msgSend(v20, "boundingMetricForWidth:", v10);
  PKFloatRoundToPixel();
  v138 = v27;
  v137 = __PAIR64__(v16, v15);
  if (objc_msgSend(v21, "isSignificantPrimary"))
    v148 = objc_msgSend(v145, "isSignificantPrimary") ^ 1;
  else
    v148 = 0;
  v28 = 0;
  v29 = 0;
  v151 = v22[1];
  v153 = *v22;
  while (1)
  {
    v30 = &remainder.origin.x + 5 * v28;
    v32 = v30[2];
    v33 = v30[3];
    v31 = (char *)(v30 + 2);
    v34 = *((double *)v31 + 2);
    v35 = *((double *)v31 + 3);
    v36 = &slice.origin.x + 5 * v29;
    v38 = v36[2];
    v39 = v36[3];
    v37 = (char *)(v36 + 2);
    v41 = *((double *)v37 + 2);
    v40 = *((double *)v37 + 3);
    if (v34 == v153 && v35 == v151)
      goto LABEL_43;
    if (v41 == v153 && v40 == v151)
      goto LABEL_43;
    if (v33 < v39
      || (v194.origin.x = v38,
          v194.origin.y = v39,
          v194.size.width = *((CGFloat *)v37 + 2),
          v44 = v32,
          v194.size.height = *((CGFloat *)v37 + 3),
          v45 = CGRectGetMaxY(v194),
          v32 = v44,
          v33 > v45))
    {
      if (v39 < v33)
        goto LABEL_43;
      v195.origin.x = v32;
      v195.origin.y = v33;
      v195.size.width = v34;
      v46 = v32;
      v195.size.height = v35;
      MaxY = CGRectGetMaxY(v195);
      v32 = v46;
      if (v39 > MaxY)
        goto LABEL_43;
    }
    if (v34 + 5.0 + v41 <= v146)
    {
LABEL_43:
      v49 = v41;
      v48 = v34;
    }
    else
    {
      if (v148)
      {
        if (v34 <= v138)
          v48 = v34;
        else
          v48 = v138;
        v49 = v146 - v48 + -5.0;
      }
      else
      {
        if (v41 <= v138)
          v49 = v41;
        else
          v49 = v138;
        v48 = v146 - v49 + -5.0;
      }
      v62 = (char *)&remainder + 40 * v28;
      v64 = v62[48];
      v63 = (BOOL *)(v62 + 48);
      if (!v64)
        *v63 = v48 < v34;
      *((double *)v31 + 2) = v48;
      v65 = (char *)&slice + 40 * v29;
      v67 = v65[48];
      v66 = (BOOL *)(v65 + 48);
      if (!v67)
        *v66 = v49 < v41;
      *((double *)v37 + 2) = v49;
    }
    if (v28 >= 3 && v29 >= 3)
      break;
    v50 = v28 + 1;
    v51 = v32;
    v52 = v33;
    v53 = v35;
    v54 = CGRectGetMaxY(*(CGRect *)(&v48 - 2));
    v196.origin.x = v38;
    v196.origin.y = v39;
    v196.size.width = v49;
    v196.size.height = v40;
    v55 = CGRectGetMaxY(v196);
    if (v55 == v54)
    {
      if (v28 >= 3)
        v50 = v28;
      if (v29 >= 3)
        v56 = v29;
      else
        v56 = v29 + 1;
    }
    else
    {
      if (v28 <= 2 && v55 > v54)
      {
        v56 = v29;
        goto LABEL_69;
      }
      v57 = v54 > v55;
      v58 = v29 < 3;
      if (v29 >= 3)
        v59 = v29;
      else
        v59 = v29 + 1;
      if (v28 >= 3)
      {
        v60 = v28;
      }
      else
      {
        v59 = v29;
        v60 = v28 + 1;
      }
      v61 = !v58 || !v57;
      if (v58 && v57)
        v56 = v29 + 1;
      else
        v56 = v59;
      if (v61)
        v50 = v60;
      else
        v50 = v28;
    }
    if (v50 == v28 && v56 == v29)
      break;
LABEL_69:
    if (v50 <= 3)
    {
      v28 = v50;
      v29 = v56;
      if (v56 < 4)
        continue;
    }
    break;
  }
  v24 = 0.0;
  v68 = 32;
  v26 = 0.0;
  do
  {
    v24 = fmax(v24, *(double *)((char *)&remainder.origin.x + v68));
    v26 = fmax(v26, *(double *)((char *)&slice.origin.x + v68));
    v68 += 40;
  }
  while (v68 != 192);
  remainder.origin.x = v24;
  slice.origin.x = v26;
  v168 = v188;
  v169 = v189;
  v170 = v190;
  v164 = v184;
  v165 = v185;
  v166 = v186;
  v167 = v187;
  v161 = remainder;
  v162 = v182;
  v163 = v183;
  v19 = v144;
  objc_msgSend(v144, "setContentConstraints:", &v161);
  v168 = v178;
  v169 = v179;
  v170 = v180;
  v164 = v174;
  v165 = v175;
  v166 = v176;
  v167 = v177;
  v161 = slice;
  v162 = v172;
  v163 = v173;
  v20 = v143;
  objc_msgSend(v143, "setContentConstraints:", &v161);
  v21 = v142;
  v16 = HIDWORD(v137);
LABEL_84:
  memset(&slice, 0, sizeof(slice));
  PKUIGetMinScreenType();
  PKFloatRoundToPixel();
  v70 = v69;
  PKSizeAlignedInRect();
  v72 = v71;
  v154 = v73;
  v149 = v140 - (v70 + self->_contentInset.left) - (v146 + self->_contentInset.right);
  v197.origin.x = v140;
  v75 = v74;
  v197.origin.y = v139;
  v77 = v76;
  v197.size.width = v146;
  v197.size.height = v141;
  MaxX = CGRectGetMaxX(v197);
  v79 = v70 + self->_contentInset.right;
  v80 = v72;
  v152 = MaxX + v79 + v146 + self->_contentInset.left;
  remainder.origin.x = v72;
  remainder.origin.y = v154;
  remainder.size.width = v75;
  remainder.size.height = v77;
  if (v19)
  {
    v81 = self->_animated && !self->_initialLayout[0];
    objc_msgSend(v19, "setTextAlignment:animated:", 0, v81, v137);
    CGRectDivide(remainder, &slice, &remainder, v24, v15);
    PKSizeAlignedInRect();
    v86 = v83;
    v87 = v84;
    v88 = v85;
    animated = self->_animated;
    if (!self->_initialLayout[0])
      goto LABEL_94;
    if (!self->_animated || !self->_slideMode)
      goto LABEL_96;
    v147 = v82;
    v90 = v152 - v84;
    if (!v150)
      v90 = v149;
    objc_msgSend(v19, "setFrame:", v90, v83, v84, v85);
    objc_msgSend(v19, "layoutIfNeeded");
    v82 = v147;
    self->_initialLayout[0] = 0;
    animated = self->_animated;
LABEL_94:
    if (animated)
      v91 = 1;
    else
LABEL_96:
      v91 = 0;
    objc_msgSend(v19, "pkui_setFrame:animated:", v91, v82, v86, v87, v88);
    objc_msgSend(v19, "layoutIfNeededAnimated:", v91);
  }
  remainder.origin.x = v80;
  remainder.origin.y = v154;
  remainder.size.width = v75;
  remainder.size.height = v77;
  if (v20)
  {
    v92 = self->_animated && !self->_initialLayout[1];
    objc_msgSend(v20, "setTextAlignment:animated:", 1, v92, v137);
    CGRectDivide(remainder, &slice, &remainder, v26, v16);
    PKSizeAlignedInRect();
    v97 = v96;
    v98 = v93;
    v99 = v94;
    v100 = v95;
    v101 = self->_animated;
    if (!self->_initialLayout[1])
      goto LABEL_108;
    if (!self->_animated || !self->_slideMode)
      goto LABEL_110;
    v102 = v152 - v94;
    if (v150)
      v102 = v149;
    objc_msgSend(v20, "setFrame:", v102, v93, v94, v95);
    objc_msgSend(v20, "layoutIfNeeded");
    self->_initialLayout[1] = 0;
    v101 = self->_animated;
LABEL_108:
    if (v101)
      v103 = 1;
    else
LABEL_110:
      v103 = 0;
    objc_msgSend(v20, "pkui_setFrame:animated:", v103, v97, v98, v99, v100);
    objc_msgSend(v20, "layoutIfNeededAnimated:", v103);
  }
  snapshotsToRemove = self->_snapshotsToRemove;
  if (snapshotsToRemove)
  {
    v159 = 0u;
    v160 = 0u;
    v157 = 0u;
    v158 = 0u;
    v105 = snapshotsToRemove;
    v106 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v157, v192, 16);
    if (!v106)
      goto LABEL_135;
    v107 = v106;
    v108 = *(_QWORD *)v158;
    while (1)
    {
      for (i = 0; i != v107; ++i)
      {
        if (*(_QWORD *)v158 != v108)
          objc_enumerationMutation(v105);
        v110 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
        if (!self->_animated)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * i), "removeFromSuperview");
          continue;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * i), "layer");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "opacity");
        v113 = v112;
        objc_msgSend(v111, "anchorPoint");
        v115 = v114;
        v117 = v116;
        objc_msgSend(v111, "position");
        v119 = v118;
        v155 = v120;
        objc_msgSend(v111, "frame");
        v122 = v121;
        v124 = v123;
        v126 = v125;
        v127 = v152 - v123;
        slideMode = self->_slideMode;
        switch(slideMode)
        {
          case 2:
            objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v131;
            v132 = v149;
            if (!v150)
              v132 = v127;
LABEL_130:
            v133 = v132 + v115 * v124;
            v134 = v122 + v117 * v126;
            objc_msgSend(v131, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v119, v155, v133, v134, v137);
            objc_msgSend(v111, "setPosition:", v133, v134);
            if (v129)
              goto LABEL_131;
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v131;
            v132 = v149;
            if (v150)
              v132 = v127;
            goto LABEL_130;
          case 0:
            objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v113, 0.0);
            LODWORD(v130) = 0;
            objc_msgSend(v111, "setOpacity:", v130);
            if (v129)
            {
LABEL_131:
              v156[0] = MEMORY[0x1E0C809B0];
              v156[1] = 3221225472;
              v156[2] = __44__PKStackedTextItemGroupView_layoutSubviews__block_invoke;
              v156[3] = &unk_1E3E62288;
              v156[4] = v110;
              objc_msgSend(v129, "pkui_setCompletionHandler:", v156, v137);
              v135 = (id)objc_msgSend(v111, "pkui_addAdditiveAnimation:", v129);

              goto LABEL_132;
            }
            break;
        }
        objc_msgSend(v110, "removeFromSuperview", v137);
LABEL_132:

      }
      v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v157, v192, 16);
      if (!v107)
      {
LABEL_135:

        v136 = self->_snapshotsToRemove;
        self->_snapshotsToRemove = 0;

        v20 = v143;
        v19 = v144;
        v21 = v142;
        break;
      }
    }
  }
  *(_WORD *)self->_initialLayout = 0;

}

uint64_t __44__PKStackedTextItemGroupView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKStackedTextItemGroupView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)_updateSubviewsAnimated:(BOOL)a3
{
  uint64_t v3;
  PKStackedTextItemGroupView *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t k;
  PKStackedTextItemView *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  float v61;
  double v62;
  id v63;
  int *v64;
  unint64_t v65;
  uint64_t v66;
  BOOL *initialLayout;
  BOOL v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  PKStackedTextItemView *v72;
  PKStackedTextItemGroupView *v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unint64_t v86;
  unsigned int v87;
  PKStackedTextItemGroupView *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v3 = a3;
  v4 = self;
  v102 = *MEMORY[0x1E0C80C00];
  -[PKStackedTextItemGroupView layoutIfNeeded](self, "layoutIfNeeded");
  v4->_boundsSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PKStackedTextItemGroup items](v4->_content, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
    v6 = 2;
  else
    v6 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "subarrayWithRange:", 0, v6);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = v4;
  v87 = v3;
  v86 = -[NSMutableArray count](v4->_itemViews, "count");
  if (!v86)
    goto LABEL_29;
  v7 = 0;
  v8 = 0;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v4->_itemViews, "objectAtIndexedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "groupingIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v89, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "groupingIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (!v17 && objc_msgSend(v14, "isEqualToString:", v16))
        {
          v10 = i;
          v9 = v8;
          ++v7;
        }

        v4 = v88;
      }
    }
    ++v8;
  }
  while (v8 != v86);
  v3 = v87;
  if (v87 && v7 == 1 && v9 != v10)
  {
    -[NSMutableArray objectAtIndexedSubscript:](v4->_itemViews, "objectAtIndexedSubscript:", v9);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0;
    v85 = v18;
    v81 = v19;
    do
    {
      if (v9 != v20)
      {
        -[NSMutableArray objectAtIndexedSubscript:](v4->_itemViews, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "snapshotViewAfterScreenUpdates:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v21, "frame");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          objc_msgSend(v21, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "presentationLayer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v32;
          if (v32)
          {
            v33 = v32;
            objc_msgSend(v32, "anchorPoint");
            v35 = v34;
            v37 = v36;
            objc_msgSend(v33, "position");
            v39 = v38;
            v41 = v40;
            objc_msgSend(v33, "bounds");
            v28 = v42;
            v30 = v43;
            v24 = v39 - v35 * v42;
            v26 = v41 - v37 * v43;
          }
          objc_msgSend(v22, "layer", v81);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setAllowsGroupOpacity:", objc_msgSend(v31, "allowsGroupOpacity"));
          objc_msgSend(v31, "compositingFilter");
          v45 = v31;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setCompositingFilter:", v46);

          objc_msgSend(v22, "setFrame:", v24, v26, v28, v30);
          -[PKStackedTextItemGroupView addSubview:](v88, "addSubview:", v22);
          v19 = v81;
          objc_msgSend(v81, "addObject:", v22);

          v18 = v85;
        }
        objc_msgSend(v21, "setContent:animated:", 0, 0, v81);
        objc_msgSend(v21, "prepareForReuse");
        objc_msgSend(v18, "addObject:", v21);

        v4 = v88;
      }
      ++v20;
    }
    while (v86 != v20);
    if (v4->_snapshotsToRemove)
      -[NSMutableArray addObjectsFromArray:](v4->_snapshotsToRemove, "addObjectsFromArray:", v19);
    else
      objc_storeStrong((id *)&v4->_snapshotsToRemove, v19);
    v3 = v87;
    -[NSMutableArray removeAllObjects](v4->_itemViews, "removeAllObjects", v81);
    if (v6)
    {
      v66 = 0;
      initialLayout = v88->_initialLayout;
      v68 = v88->_initialLayout[v9];
      do
      {
        if (v10 == v66)
        {
          objc_msgSend(v89, "objectAtIndexedSubscript:", v10);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setContent:animated:", v69, 1);

          -[NSMutableArray addObject:](v88->_itemViews, "addObject:", v83);
          initialLayout[v10] = v68;
        }
        else
        {
          v70 = objc_msgSend(v85, "count");
          if (v70)
          {
            v71 = v70;
            objc_msgSend(v85, "lastObject");
            v72 = (PKStackedTextItemView *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "removeObjectAtIndex:", v71 - 1);
            v73 = v88;
          }
          else
          {
            v73 = v88;
            v72 = -[PKStackedTextItemView initWithStyle:]([PKStackedTextItemView alloc], "initWithStyle:", v88->_style);
            -[PKStackedTextItemGroupView addSubview:](v88, "addSubview:", v72);
          }
          objc_msgSend(v89, "objectAtIndexedSubscript:", v66);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKStackedTextItemView setContent:animated:](v72, "setContent:animated:", v74, 0);

          -[NSMutableArray addObject:](v73->_itemViews, "addObject:", v72);
          initialLayout[v66] = 1;

          v3 = v87;
        }
        ++v66;
      }
      while (v6 != v66);
    }
    v75 = 1;
    if (v10 > v9)
      v75 = 2;
    v64 = &OBJC_IVAR___PKPaymentPassAMPEnrollmentViewController__flowItemDelegate;
    v4 = v88;
    v88->_slideMode = v75;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v76 = v85;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v95;
      do
      {
        for (j = 0; j != v78; ++j)
        {
          if (*(_QWORD *)v95 != v79)
            objc_enumerationMutation(v76);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * j), "removeFromSuperview");
        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
      }
      while (v78);
    }

  }
  else
  {
LABEL_29:
    if (v6)
    {
      for (k = 0; k != v6; ++k)
      {
        if (k >= v86)
        {
          v48 = -[PKStackedTextItemView initWithStyle:]([PKStackedTextItemView alloc], "initWithStyle:", v4->_style);
          objc_msgSend(v89, "objectAtIndexedSubscript:", k);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKStackedTextItemView setContent:animated:](v48, "setContent:animated:", v50, v3);

          -[PKStackedTextItemGroupView addSubview:](v4, "addSubview:", v48);
          -[NSMutableArray addObject:](v4->_itemViews, "addObject:", v48);
          v4->_initialLayout[k] = 1;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](v4->_itemViews, "objectAtIndexedSubscript:", k);
          v48 = (PKStackedTextItemView *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "objectAtIndexedSubscript:", k);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKStackedTextItemView setContent:animated:](v48, "setContent:animated:", v49, v3);

        }
      }
    }
    if (v86 > v6)
    {
      -[NSMutableArray subarrayWithRange:](v4->_itemViews, "subarrayWithRange:", v6, v86 - v6);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](v4->_itemViews, "removeObjectsInRange:", v6, v86 - v6);
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v52 = v51;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v91;
        do
        {
          for (m = 0; m != v54; ++m)
          {
            if (*(_QWORD *)v91 != v55)
              objc_enumerationMutation(v52);
            v57 = *(id *)(*((_QWORD *)&v90 + 1) + 8 * m);
            v58 = v57;
            if ((_DWORD)v3)
            {
              objc_msgSend(v57, "layer");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "opacity");
              objc_msgSend(v60, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v61, 0.0);
              v98[0] = MEMORY[0x1E0C809B0];
              v98[1] = 3221225472;
              v98[2] = __RemoveViewFromSuperview_block_invoke_0;
              v98[3] = &unk_1E3E62288;
              v99 = v58;
              objc_msgSend(v60, "pkui_setCompletionHandler:", v98);
              LODWORD(v62) = 0;
              objc_msgSend(v59, "setOpacity:", v62);
              v63 = (id)objc_msgSend(v59, "pkui_addAdditiveAnimation:", v60);
              objc_msgSend(v60, "duration");

              v3 = v87;
            }
            else
            {
              objc_msgSend(v57, "removeFromSuperview");
            }

          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
        }
        while (v54);
      }

      v4 = v88;
    }
    v64 = &OBJC_IVAR___PKPaymentPassAMPEnrollmentViewController__flowItemDelegate;
    if (v6 <= 1)
    {
      do
      {
        v65 = v6;
        v4->_initialLayout[v6] = 1;
        v6 = 1;
      }
      while (!v65);
    }
  }
  -[PKStackedTextItemGroupView setNeedsLayout](v4, "setNeedsLayout");
  -[PKStackedTextItemGroupView layoutIfNeededAnimated:](v4, "layoutIfNeededAnimated:", v3);
  *(Class *)((char *)&v4->super.super.super.isa + v64[936]) = 0;

}

- (void)setContent:(id)a3
{
  -[PKStackedTextItemGroupView setContent:animated:](self, "setContent:animated:", a3, 0);
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_content, a3);
    -[PKStackedTextItemGroupView _updateSubviewsAnimated:](self, "_updateSubviewsAnimated:", v4);
  }

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[PKStackedTextItemGroupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)style
{
  return self->_style;
}

- (PKStackedTextItemGroup)content
{
  return self->_content;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_snapshotsToRemove, 0);
  objc_storeStrong((id *)&self->_itemViews, 0);
}

@end
