@implementation TUISmartGridFlexRowLayoutManager

- (TUISmartGridFlexRowLayoutManager)initWithContent:(id)a3
{
  id v5;
  TUISmartGridFlexRowLayoutManager *v6;
  TUISmartGridFlexRowLayoutManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridFlexRowLayoutManager;
  v6 = -[TUISmartGridFlexRowLayoutManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;
  if (objc_msgSend(v5, "paginated"))
  {
    objc_msgSend(v5, "width");
    v11 = v10 - v7 - v9;
  }
  else
  {
    objc_msgSend(v5, "width");
  }
  objc_msgSend(v12, "setContainingWidth:", v11);

}

+ (void)configureContentLayout:(id)a3 configuration:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "contentInsets");
  v7 = v6;
  v9 = v8;
  if (objc_msgSend(v5, "paginated"))
  {
    objc_msgSend(v5, "width");
    v11 = v10 - v7 - v9;
  }
  else
  {
    objc_msgSend(v5, "width");
  }
  objc_msgSend(v12, "setContainingWidth:", v11);

}

- (void)positionContainerLayout:(id)a3
{
  unsigned int v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  v4 = -[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated");
  v5 = 0.0;
  if (v4)
  {
    -[TUISmartGridLayoutConfiguration contentInsets](self->_configuration, "contentInsets", 0.0);
    v5 = v6;
  }
  objc_msgSend(v7, "setComputedOrigin:", v5, 0.0);

}

- (unint64_t)ruleLayoutAxis
{
  return 2;
}

- (BOOL)shouldInvalidateRenderModelForScrollLayout
{
  unsigned int v3;

  v3 = -[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated");
  if (v3)
    LOBYTE(v3) = self->_scrollPolicy == 0;
  return v3;
}

- (void)layoutContent:(id)a3
{
  char *v4;
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
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double computedColumnSpacing;
  double v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  id *v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGFloat v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double x;
  double y;
  double width;
  double height;
  id v60;
  id v61;
  CellInfo *end;
  __int128 v63;
  CellInfo *v64;
  NSMutableArray *v65;
  id v66;
  NSArray *v67;
  NSArray *cellLayouts;
  uint64_t v69;
  double *v70;
  double v71;
  double v72;
  CGFloat v73;
  NSMutableArray *v74;
  NSMutableArray *v75;
  unint64_t v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  double v82;
  double v83;
  TUICellScrollPolicy *scrollPolicy;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  CellInfo *begin;
  TUICellScrollPolicy *v89;
  double *v90;
  vector<double, std::allocator<double>> *p_scrollAnchors;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t v94;
  __compressed_pair<double *, std::allocator<double>> *p_end_cap;
  double v96;
  double v97;
  double *v98;
  double *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  double *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  CellInfo *v110;
  CellInfo *v111;
  uint64_t v112;
  __compressed_pair<double *, std::allocator<double>> *v113;
  double v114;
  double v115;
  double v116;
  double *v117;
  double *v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  double *v124;
  uint64_t v125;
  NSArray *v126;
  CGFloat v127;
  NSArray *nonScrollableAdornmentLayouts;
  double v129;
  CGFloat v130;
  id v131;
  uint64_t *i;
  NSMutableArray *v133;
  CGSize v134;
  __int128 v135;
  __int128 v136;
  char v137;
  __int128 v138;
  uint64_t v139;
  uint64_t **v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  __int128 v145;
  void *__p[2];
  __int128 v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  uint64_t v154;
  char *v155;
  unsigned __int8 v156;
  void *v157;
  double *v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t *v161;
  _QWORD v162[5];
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void **v169[2];
  CGRect v170;

  v131 = a3;
  v4 = (char *)objc_msgSend(v131, "computedLayoutDirection");
  -[TUISmartGridLayoutConfiguration width](self->_configuration, "width");
  v6 = v5;
  -[TUISmartGridLayoutConfiguration contentInsets](self->_configuration, "contentInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  self->_computedColumns = +[TUISmartGridBox columnsWithConfiguration:](TUISmartGridBox, "columnsWithConfiguration:", self->_configuration);
  v15 = -[TUISmartGridLayoutConfiguration columnSpacing](self->_configuration, "columnSpacing");
  self->_computedColumnSpacing = TUILengthValueWithDefault((uint64_t)v15, v16, 0.0);
  +[TUISmartGridBox columnWidthWithConfiguration:columns:spacing:](TUISmartGridBox, "columnWidthWithConfiguration:columns:spacing:", self->_configuration, self->_computedColumns);
  self->_computedColumnWidth = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "children"));
  sub_61D50((uint64_t)&v160, v18, self->_content, 1);

  v19 = v160;
  v20 = v161;
  if (v160 != v161)
  {
    v21 = 0;
    do
    {
      v22 = *v19;
      v23 = v19[1];
      while (v22 != v23)
      {
        *(_QWORD *)v22 = v21;
        *(_QWORD *)(v22 + 24) = 1;
        *(_OWORD *)(v22 + 8) = xmmword_22F3C0;
        ++v21;
        v22 += 96;
      }
      v19 += 11;
    }
    while (v19 != v20);
  }
  computedColumnSpacing = self->_computedColumnSpacing;
  v148 = v6;
  v149 = v8;
  v150 = v10;
  v151 = v12;
  v152 = v14;
  v153 = computedColumnSpacing;
  v154 = 0;
  v155 = v4;
  v156 = 0;
  v158 = 0;
  v159 = 0;
  v157 = 0;
  v156 = -[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated");
  v25 = v8;
  v27 = v160;
  v26 = v161;
  v28 = 0;
  if (v161 != v160)
  {
    v29 = v160 + 1;
    while (*v29 == *(v29 - 1))
    {
      ++v28;
      v29 += 11;
      if (((char *)v161 - (char *)v160) / 88 == v28)
      {
        v28 = ((char *)v161 - (char *)v160) / 88;
        break;
      }
    }
  }
  *(_QWORD *)&v138 = &v160;
  *((_QWORD *)&v138 + 1) = v28;
  v139 = 0;
  v140 = &v160;
  v142 = 0;
  v143 = 0;
  v141 = ((char *)v161 - (char *)v160) / 88;
  v144 = v149;
  v145 = 0u;
  *(_OWORD *)__p = 0u;
  v147 = 0u;
  v30 = 1;
  if (v161 != v160)
  {
    do
    {
      v31 = *v27;
      v32 = v27[1];
      while (v31 != v32)
      {
        v33 = *(id **)(v31 + 48);
        v34 = *(id **)(v31 + 56);
        if (v33 == v34)
        {
          v35 = 0;
        }
        else
        {
          v35 = 0;
          do
          {
            if (*v33)
            {
              v36 = objc_msgSend(*v33, "span");
              if ((unint64_t)v36 <= 1)
                v37 = 1;
              else
                v37 = (uint64_t)v36;
            }
            else
            {
              v37 = 1;
            }
            v35 += v37;
            v33 += 8;
          }
          while (v33 != v34);
        }
        if (v35 > v30)
          v30 = v35;
        v31 += 96;
      }
      v27 += 11;
    }
    while (v27 != v26);
  }
  v38 = sub_8ED0C(&v138, &v148, &v160, v30);
  v40 = v39;
  v41 = v151;
  v42 = v160;
  v43 = v161;
  while (v42 != v43)
  {
    v44 = *v42;
    v45 = v42[1];
    while (v44 != v45)
    {
      if (*(_QWORD *)(v44 + 16))
        v46 = *(_QWORD *)(v44 + 24) == 0;
      else
        v46 = 1;
      v47 = v46;
      sub_60DAC(v44, v47);
      v44 += 96;
    }
    v48 = v42[3];
    v49 = v42[4];
    while (v48 != v49)
    {
      sub_5FA24(v48, 1);
      v48 += 96;
    }
    v42 += 11;
  }
  sub_8FC48((uint64_t)&self->_cells, (uint64_t)self->_cells.__begin_, (uint64_t)self->_cells.__end_);
  v129 = v41;
  v130 = v6;
  v50 = v38;
  v133 = objc_opt_new(NSMutableArray);
  v51 = v160;
  for (i = v161; v51 != i; v51 += 11)
  {
    v53 = *v51;
    v52 = v51[1];
    while (v53 != v52)
    {
      if (!*(_BYTE *)(v53 + 40))
      {
        v55 = *(_QWORD *)(v53 + 48);
        v54 = *(_QWORD *)(v53 + 56);
        if (v55 == v54)
        {
          x = CGRectNull.origin.x;
          y = CGRectNull.origin.y;
          width = CGRectNull.size.width;
          height = CGRectNull.size.height;
        }
        else
        {
          x = *(double *)(v55 + 32);
          y = *(double *)(v55 + 40);
          width = *(double *)(v54 - 32) + *(double *)(v54 - 16) - x;
          height = *(double *)(v54 - 24) + *(double *)(v54 - 8) - y;
        }
        v170.origin.x = x;
        v170.origin.y = y;
        v170.size.width = width;
        v170.size.height = height;
        if (!CGRectIsNull(v170))
        {
          v60 = *(id *)(v53 + 32);
          v61 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier"));
          v134.width = x;
          v134.height = y;
          *(double *)&v135 = width;
          *((double *)&v135 + 1) = height;
          *(_QWORD *)&v136 = v61;
          end = self->_cells.__end_;
          if (end >= self->_cells.__end_cap_.__value_)
          {
            v64 = (CellInfo *)sub_919F0((uint64_t *)&self->_cells, (uint64_t)&v134);
          }
          else
          {
            v63 = v135;
            *(CGSize *)end = v134;
            *((_OWORD *)end + 1) = v63;
            *((_QWORD *)end + 4) = (id)v136;
            v64 = (CellInfo *)((char *)end + 40);
          }
          self->_cells.__end_ = v64;

          v65 = objc_opt_new(NSMutableArray);
          sub_65544(&v160, (_QWORD *)v53, v65);
          v66 = -[NSMutableArray copy](v65, "copy");
          -[NSMutableArray addObject:](v133, "addObject:", v66);

        }
      }
      v53 += 96;
    }
  }
  v67 = (NSArray *)-[NSMutableArray copy](v133, "copy");
  cellLayouts = self->_cellLayouts;
  self->_cellLayouts = v67;

  v69 = sub_5F7DC((uint64_t)&v160, (char *)&dword_4 + 1);
  v70 = (double *)v69;
  if (v162[1] == v69)
  {
    v134 = CGSizeZero;
    v135 = 0u;
    v136 = 0u;
    sub_5FCC0((uint64_t)&self->_cellDividers, (uint64_t)&v134);
    v169[0] = (void **)&v135 + 1;
    sub_618C0(v169);

  }
  else
  {
    v71 = sub_91BFC((uint64_t)&v137, 0, *(_QWORD *)(v69 + 40), *(_QWORD *)(v69 + 48), NAN, v40);
    v73 = v72;
    v70[9] = v71;
    v70[10] = v72;
    sub_5FA24((uint64_t)v70, 1);
    v74 = objc_opt_new(NSMutableArray);
    sub_5FB58(&v160, v70, v74);
    v75 = v74;
    v134.width = v71;
    v134.height = v73;
    v135 = (unint64_t)v75;
    v136 = 0uLL;
    sub_5FCC0((uint64_t)&self->_cellDividers, (uint64_t)&v134);
    v169[0] = (void **)&v135 + 1;
    sub_618C0(v169);

    v76 = 0xCCCCCCCCCCCCCCCDLL * ((self->_cells.__end_ - self->_cells.__begin_) >> 3);
    v77 = -0.5;
    if (v155 == (_BYTE *)&dword_0 + 2)
      v77 = 0.5;
    if (v76 >= 2)
    {
      v78 = v153 * v77;
      v79 = 1;
      v80 = 72;
      do
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)self->_cells.__begin_ + v80), "tui_identifierByAppendingString:", CFSTR("divider")));
        if (v155 == (_BYTE *)&dword_0 + 2)
        {
          v82 = v150 + v152;
          if (v156)
            v82 = 0.0;
          v83 = *(v158 - 1) - *(double *)v157 - v153 + v82 - *((double *)v157 + v79);
        }
        else
        {
          v83 = *((double *)v157 + v79);
        }
        sub_66A0C(&self->_cellDividers._layoutSize.width, v81, v78 + v83, v8);

        ++v79;
        v80 += 40;
      }
      while (v76 != v79);
    }

  }
  scrollPolicy = self->_scrollPolicy;
  if (scrollPolicy)
  {
    v85 = -[TUICellScrollPolicy cells](scrollPolicy, "cells");
    v87 = *v85;
    v86 = v85[1];
    begin = self->_cells.__begin_;
    if (v86 - *v85 == self->_cells.__end_ - begin)
    {
      while (v87 != v86)
      {
        if (!sub_91E90((uint64_t)&v134, v87, (uint64_t)begin))
          goto LABEL_76;
        v87 += 40;
        begin = (CellInfo *)((char *)begin + 40);
      }
    }
    else
    {
LABEL_76:
      v89 = self->_scrollPolicy;
      self->_scrollPolicy = 0;

    }
  }
  v90 = self->_scrollAnchors.__begin_;
  p_scrollAnchors = &self->_scrollAnchors;
  if (v90 != self->_scrollAnchors.__end_)
    self->_scrollAnchors.__end_ = v90;
  if (v156)
  {
    v93 = (uint64_t *)*((_QWORD *)&v145 + 1);
    v92 = (uint64_t *)v145;
    if ((_QWORD)v145 != *((_QWORD *)&v145 + 1))
    {
      v94 = 0;
      p_end_cap = &self->_scrollAnchors.__end_cap_;
      do
      {
        if (v155 == (_BYTE *)&dword_0 + 2)
        {
          v96 = v150 + v152;
          if (v156)
            v96 = 0.0;
          v97 = *(v158 - 1) - *(double *)v157 - v153 + v96 - *((double *)v157 + v94);
        }
        else
        {
          v97 = *((double *)v157 + v94);
        }
        if (v90 >= p_end_cap->__value_)
        {
          v99 = p_scrollAnchors->__begin_;
          v100 = v90 - p_scrollAnchors->__begin_;
          v101 = v100 + 1;
          if ((unint64_t)(v100 + 1) >> 61)
            sub_6F9C();
          v102 = (char *)p_end_cap->__value_ - (char *)v99;
          if (v102 >> 2 > v101)
            v101 = v102 >> 2;
          if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFF8)
            v103 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v103 = v101;
          if (v103)
          {
            v104 = (char *)sub_39CC4((uint64_t)&self->_scrollAnchors.__end_cap_, v103);
            v99 = self->_scrollAnchors.__begin_;
            v90 = self->_scrollAnchors.__end_;
          }
          else
          {
            v104 = 0;
          }
          v105 = (double *)&v104[8 * v100];
          *v105 = v97;
          v98 = v105 + 1;
          while (v90 != v99)
          {
            v106 = *((_QWORD *)v90-- - 1);
            *((_QWORD *)v105-- - 1) = v106;
          }
          self->_scrollAnchors.__begin_ = v105;
          self->_scrollAnchors.__end_ = v98;
          self->_scrollAnchors.__end_cap_.__value_ = (double *)&v104[8 * v103];
          if (v99)
            operator delete(v99);
        }
        else
        {
          *v90 = v97;
          v98 = v90 + 1;
        }
        self->_scrollAnchors.__end_ = v98;
        v108 = *v92;
        v107 = v92[1];
        v92 += 3;
        v94 += (v107 - v108) >> 4;
        v90 = v98;
      }
      while (v92 != v93);
    }
  }
  else
  {
    if (v155 == (_BYTE *)&dword_0 + 2)
      v109 = -v150;
    else
      v109 = v150;
    v110 = self->_cells.__begin_;
    v111 = self->_cells.__end_;
    if (v110 != v111)
    {
      v112 = 0;
      v113 = &self->_scrollAnchors.__end_cap_;
      do
      {
        if (v155 == (_BYTE *)&dword_0 + 2)
        {
          v114 = v150 + v152;
          if (v156)
            v114 = 0.0;
          v115 = *(v158 - 1) - *(double *)v157 - v153 + v114 - *((double *)v157 + v112);
        }
        else
        {
          v115 = *((double *)v157 + v112);
        }
        v116 = v115 - v109;
        if (v90 >= v113->__value_)
        {
          v118 = p_scrollAnchors->__begin_;
          v119 = v90 - p_scrollAnchors->__begin_;
          v120 = v119 + 1;
          if ((unint64_t)(v119 + 1) >> 61)
            sub_6F9C();
          v121 = (char *)v113->__value_ - (char *)v118;
          if (v121 >> 2 > v120)
            v120 = v121 >> 2;
          if ((unint64_t)v121 >= 0x7FFFFFFFFFFFFFF8)
            v122 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v122 = v120;
          if (v122)
          {
            v123 = (char *)sub_39CC4((uint64_t)&self->_scrollAnchors.__end_cap_, v122);
            v118 = self->_scrollAnchors.__begin_;
            v90 = self->_scrollAnchors.__end_;
          }
          else
          {
            v123 = 0;
          }
          v124 = (double *)&v123[8 * v119];
          *v124 = v116;
          v117 = v124 + 1;
          while (v90 != v118)
          {
            v125 = *((_QWORD *)v90-- - 1);
            *((_QWORD *)v124-- - 1) = v125;
          }
          self->_scrollAnchors.__begin_ = v124;
          self->_scrollAnchors.__end_ = v117;
          self->_scrollAnchors.__end_cap_.__value_ = (double *)&v123[8 * v122];
          if (v118)
            operator delete(v118);
        }
        else
        {
          *v90 = v116;
          v117 = v90 + 1;
        }
        self->_scrollAnchors.__end_ = v117;
        ++v112;
        v110 = (CellInfo *)((char *)v110 + 40);
        v90 = v117;
      }
      while (v110 != v111);
    }
  }
  sub_90AE0((NSMutableArray **)&v134);
  sub_8FCBC((id *)&v134, (uint64_t *)&__p[1], (uint64_t)&v160, (uint64_t)&v148, &v160, CGPointZero.x, CGPointZero.y);
  v126 = (NSArray *)objc_msgSend(*(id *)&v134.width, "copy");
  v127 = v25 + v40 + v129;
  nonScrollableAdornmentLayouts = self->_nonScrollableAdornmentLayouts;
  self->_nonScrollableAdornmentLayouts = v126;

  self->_contentLayoutSize.width = v50;
  self->_contentLayoutSize.height = v127;
  self->_layoutSize.width = v130;
  self->_layoutSize.height = v127;

  if (__p[1])
  {
    *(void **)&v147 = __p[1];
    operator delete(__p[1]);
  }
  *(_QWORD *)&v134.width = &v145;
  sub_90B30((void ***)&v134);
  if (v157)
  {
    v158 = (double *)v157;
    operator delete(v157);
  }
  if (v167)
  {
    v168 = v167;
    operator delete(v167);
  }
  if (v165)
  {
    v166 = v165;
    operator delete(v165);
  }
  if (v163)
  {
    v164 = v163;
    operator delete(v163);
  }
  *(_QWORD *)&v138 = v162;
  sub_6192C((void ***)&v138);
  *(_QWORD *)&v138 = &v160;
  sub_61B28((void ***)&v138);

}

- (id)scrollPolicy
{
  TUICellScrollPolicy *v3;
  TUICellScrollPolicy *scrollPolicy;

  if (!self->_scrollPolicy
    && -[TUISmartGridLayoutConfiguration paginated](self->_configuration, "paginated"))
  {
    v3 = -[TUICellScrollPolicy initWithCells:]([TUICellScrollPolicy alloc], "initWithCells:", &self->_cells);
    scrollPolicy = self->_scrollPolicy;
    self->_scrollPolicy = v3;

  }
  return self->_scrollPolicy;
}

- (UIEdgeInsets)scrollGradientInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridLayoutConfiguration gradientInsets](self->_configuration, "gradientInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)scrollGradientFraction
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridLayoutConfiguration gradientFraction](self->_configuration, "gradientFraction");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5
{
  id v8;
  id v9;
  id v10;
  double height;
  double *end;
  double *begin;
  double v14;
  __int128 v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "axis") == (char *)&dword_0 + 1)
  {
    height = self->_contentLayoutSize.height;
    v15 = 0u;
    if (v9)
      objc_msgSend(v9, "computedTransformInAncestorLayout:", v10);
    begin = self->_scrollAnchors.__begin_;
    end = self->_scrollAnchors.__end_;
    if (begin != end)
    {
      v14 = height * 0.5;
      do
        objc_msgSend(v8, "appendScrollAnchor:", v14 * 0.0 + *(double *)&v15 * *begin++ + 0.0, v15);
      while (begin != end);
    }
  }

}

- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  __int128 v7;
  _OWORD v8[3];

  v7 = *(_OWORD *)&a4->c;
  v8[0] = *(_OWORD *)&a4->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a4->tx;
  sub_611B0((uint64_t)&self->_cellDividers, a3, (double *)v8, a5, a7);
}

- (void)appendNonScrollableAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  id v11;
  id v12;
  double width;
  double height;
  NSArray *v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  void *i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v11 = a5;
  v12 = a7;
  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = self->_nonScrollableAdornmentLayouts;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v34;
    v18 = -width;
    v19 = -height;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v21, "computedOrigin");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v21, "computedTransformedSize");
        memset(&v32, 0, sizeof(v32));
        CGAffineTransformMakeTranslation(&t1, v23 + v26 * 0.5 + v18 * 0.5, v25 + v27 * 0.5 + v19 * 0.5);
        v28 = *(_OWORD *)&a4->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&t2.c = v28;
        *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
        CGAffineTransformConcat(&v32, &t1, &t2);
        v29 = v32;
        objc_msgSend(v21, "appendRenderModelIgnoreHiddenCompatibleWithKind:context:transform:toModels:", a3, v11, &v29, v12);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  TUIRenderModelSubviews *v31;
  void *v32;
  TUIRenderModelSubviews *v33;
  void *v34;
  void *v35;
  TUIRenderModelTransform *v36;
  double v37;
  double v38;
  double v39;
  double a;
  double b;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unint64_t v56;
  double v57;
  double v58;
  id v59;
  double tx;
  double c;
  double ty;
  double d;
  __int128 v64;
  double y;
  double v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  CGAffineTransform v81;
  _BYTE v82[128];

  v9 = a4;
  v59 = a6;
  if (a3 >= 4)
  {
    v10 = self->_cells.__end_ - self->_cells.__begin_;
    if (v10)
    {
      v11 = 0;
      v12 = v10 / 40;
      v57 = -self->_contentLayoutSize.height;
      v58 = -self->_contentLayoutSize.width;
      if (v12 <= 1)
        v12 = 1;
      v56 = v12;
      do
      {
        v13 = (double *)((char *)self->_cells.__begin_ + 40 * v11);
        v15 = *v13;
        v14 = v13[1];
        v17 = v13[2];
        v16 = v13[3];
        memset(&v81, 0, sizeof(v81));
        CGAffineTransformMakeTranslation(&v81, v17 * 0.5, v16 * 0.5);
        v18 = objc_opt_new(NSMutableArray);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_cellLayouts, "objectAtIndexedSubscript:", v11));
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v78 != v21)
                objc_enumerationMutation(v19);
              v23 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v23, "computedOrigin", v56);
              v25 = v24;
              v27 = v26;
              objc_msgSend(v23, "computedTransformedSize");
              memset(&v76, 0, sizeof(v76));
              CGAffineTransformMakeTranslation(&t1, v25 - v15 + v28 * 0.5 + -v17 * 0.5, v27 - v14 + v29 * 0.5 + -v16 * 0.5);
              t2 = v81;
              CGAffineTransformConcat(&v76, &t1, &t2);
              v73 = v76;
              objc_msgSend(v23, "appendRenderModelCompatibleWithKind:context:transform:toModels:", a3, v9, &v73, v18);
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
          }
          while (v20);
        }

        CGAffineTransformMakeTranslation(&v72, v15 + v17 * 0.5 + v58 * 0.5, v14 + v16 * 0.5 + v57 * 0.5);
        v30 = *(_OWORD *)&a5->c;
        *(_OWORD *)&v71.a = *(_OWORD *)&a5->a;
        *(_OWORD *)&v71.c = v30;
        *(_OWORD *)&v71.tx = *(_OWORD *)&a5->tx;
        CGAffineTransformConcat(&v76, &v72, &v71);
        v81 = v76;
        v31 = [TUIRenderModelSubviews alloc];
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderModelConvertModels:toKind:", v18, a3));
        v33 = -[TUIRenderModelSubviews initWithSubmodels:](v31, "initWithSubmodels:", v32);

        -[TUIRenderModelSubviews setSize:](v33, "setSize:", v17, v16);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self->_cells.__begin_ + 5 * v11 + 4), "tui_identifierByAppendingString:", CFSTR("cell")));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[TUIContainerView renderModelWithSubviewsModel:style:identifier:](TUIContainerView, "renderModelWithSubviewsModel:style:identifier:", v33, 0, v34));

        v36 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v35);
        y = CGPointZero.y;
        d = v81.d;
        v64 = *(_OWORD *)&v81.a;
        tx = v81.tx;
        c = v81.c;
        ty = v81.ty;
        objc_msgSend(v35, "size");
        v67 = v37;
        objc_msgSend(v35, "size");
        v39 = v38;
        a = a5->a;
        b = a5->b;
        v42 = a5->c;
        v43 = a5->d;
        v44 = a5->tx;
        v45 = a5->ty;
        objc_msgSend(v9, "contentsScale");
        v46 = v44 + v39 * -0.5 * v42 + a * (v67 * -0.5);
        v47 = v45 + v39 * -0.5 * v43 + b * (v67 * -0.5);
        v49 = tx + y * c + *(double *)&v64 * CGPointZero.x + TUIPointRoundedForScale(v46, v47, v48) - v46;
        v51 = ty + y * d + *((double *)&v64 + 1) * CGPointZero.x + v50 - v47;
        memset(&v76, 0, sizeof(v76));
        v70 = v81;
        CGAffineTransformMakeTranslation(&v69, -v49, -v51);
        CGAffineTransformConcat(&v76, &v70, &v69);
        v52 = v76.tx;
        objc_msgSend(v9, "contentsScale");
        v76.tx = TUIFloatRoundedForScale(v52, v53);
        v54 = v76.ty;
        objc_msgSend(v9, "contentsScale");
        v76.ty = TUIFloatRoundedForScale(v54, v55);
        -[TUIRenderModelTransform setCenter:](v36, "setCenter:", v49, v51);
        v68 = v76;
        -[TUIRenderModelTransform setTransform:](v36, "setTransform:", &v68);
        objc_msgSend(v59, "addObject:", v36);

        ++v11;
      }
      while (v11 != v56);
    }
  }

}

- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  CellInfo *begin;
  CellInfo *i;
  __int128 v9;
  double x;
  double y;
  double width;
  double height;
  TUIHoverIdentifier *v14;
  id v15;
  TUIHoverIdentifier *v16;
  TUIHoverRegion *v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;

  v6 = a3;
  begin = self->_cells.__begin_;
  for (i = self->_cells.__end_; begin != i; begin = (CellInfo *)((char *)begin + 40))
  {
    v19 = *(CGRect *)begin;
    v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v18.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v18.c = v9;
    *(_OWORD *)&v18.tx = *(_OWORD *)&a4->tx;
    v20 = CGRectApplyAffineTransform(v19, &v18);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    v14 = [TUIHoverIdentifier alloc];
    v15 = *((id *)begin + 4);
    v16 = -[TUIHoverIdentifier initWithName:identifier:](v14, "initWithName:identifier:", CFSTR("cell"), v15);

    v17 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", x, y, width, height);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v16);

  }
}

- (TUISmartGridContentBox)content
{
  return self->_content;
}

- (TUISmartGridLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (unint64_t)computedColumns
{
  return self->_computedColumns;
}

- (double)computedColumnWidth
{
  return self->_computedColumnWidth;
}

- (double)computedColumnSpacing
{
  return self->_computedColumnSpacing;
}

- (CGSize)layoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)contentLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentLayoutSize.width;
  height = self->_contentLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  double *begin;
  void **p_begin;

  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_scrollPolicy, 0);
  objc_storeStrong((id *)&self->_nonScrollableAdornmentLayouts, 0);
  objc_storeStrong((id *)&self->_cellLayouts, 0);
  p_begin = &self->_cellDividers._positions.__begin_;
  sub_618C0(&p_begin);

  p_begin = (void **)&self->_cells.__begin_;
  sub_92A40(&p_begin);
  begin = self->_scrollAnchors.__begin_;
  if (begin)
  {
    self->_scrollAnchors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(CGSize *)((char *)self + 56) = CGSizeZero;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

@end
