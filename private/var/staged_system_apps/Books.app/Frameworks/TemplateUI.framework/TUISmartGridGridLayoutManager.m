@implementation TUISmartGridGridLayoutManager

- (TUISmartGridGridLayoutManager)initWithContent:(id)a3
{
  id v5;
  TUISmartGridGridLayoutManager *v6;
  TUISmartGridGridLayoutManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridGridLayoutManager;
  v6 = -[TUISmartGridGridLayoutManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v5, "width");
  objc_msgSend(v6, "setContainingWidth:");
  objc_msgSend(v5, "height");
  objc_msgSend(v6, "setContainingHeight:");

}

+ (void)configureContentLayout:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v5, "width");
  objc_msgSend(v6, "setContainingWidth:");

}

- (double)widthForColumnSpan:(unint64_t)a3
{
  if (a3)
    return -(self->_computedColumnSpacing - (self->_computedColumnWidth + self->_computedColumnSpacing) * (double)a3);
  else
    return 0.0;
}

- (unint64_t)ruleLayoutAxis
{
  if (self->_list)
    return 1;
  else
    return 2;
}

- (void)layoutContent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  id v15;
  uint64_t v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  double *begin;
  unint64_t v22;
  unint64_t v23;
  double computedColumnWidth;
  double computedColumnSpacing;
  double computedRowSpacing;
  void *v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  int v32;
  _QWORD *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  NSMutableArray *v40;
  double containerWidth;
  double v42;
  double v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  int *v49;
  unint64_t v50;
  uint64x2_t v51;
  int8x16_t v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  unint64_t v63;
  uint64_t i;
  uint64_t v65;
  double v66;
  double v67;
  unint64_t v68;
  int8x16_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  unint64_t v73;
  uint64_t j;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double x;
  double y;
  double width;
  double height;
  id v87;
  id v88;
  char *end;
  char *value;
  void *v91;
  char *v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  char *v97;
  double *v98;
  char *v99;
  uint64_t v100;
  __int128 v101;
  int64x2_t v102;
  void *v103;
  double v104;
  double v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  BOOL v114;
  uint64_t v115;
  double v116;
  double v117;
  uint64_t v118;
  double v119;
  id v120;
  uint64_t *v121;
  unint64_t v122;
  uint64_t v123;
  vector<std::pair<TUICellModel *, CGRect>, std::allocator<std::pair<TUICellModel *, CGRect>>> *p_cellBounds;
  CellDividers *p_cellDividers;
  int v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[32];
  __int128 v136;
  __int128 v137;
  double v138;
  double v139;
  int v140;
  void *__p;
  void *v142;
  uint64_t v143;
  char v144;
  uint64_t *v145;
  uint64_t *v146;
  _QWORD v147[3];
  unint64_t computedColumns;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void **v156[2];
  CGRect v157;

  v120 = a3;
  v4 = objc_msgSend(v120, "computedLayoutDirection");
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
  v18 = -[TUISmartGridLayoutConfiguration rowSpacing](self->_configuration, "rowSpacing");
  self->_computedRowSpacing = TUILengthValueWithDefault((uint64_t)v18, v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "children"));
  sub_61D50((uint64_t)&v145, v20, self->_content, 1);

  computedColumns = self->_computedColumns;
  v149 = 1;
  begin = self->_scrollAnchors.__begin_;
  if (begin != self->_scrollAnchors.__end_)
    self->_scrollAnchors.__end_ = begin;
  p_cellBounds = &self->_cellBounds;
  sub_5F770((uint64_t)&self->_cellBounds, (uint64_t)self->_cellBounds.__begin_, (uint64_t *)self->_cellBounds.__end_);
  v22 = computedColumns;
  v23 = v149;
  computedColumnWidth = self->_computedColumnWidth;
  computedColumnSpacing = self->_computedColumnSpacing;
  computedRowSpacing = self->_computedRowSpacing;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "controller"));
  objc_msgSend(v27, "contentsScale");
  v29 = computedColumnWidth;
  v30 = computedColumnSpacing;
  if (v22 >= 2)
  {
    v29 = computedColumnWidth;
    v30 = computedColumnSpacing;
    if (computedColumnSpacing != 0.0)
    {
      v29 = computedColumnWidth;
      if (v28 > 0.0)
        v29 = floor(computedColumnWidth * v28) / v28;
      v30 = ((computedColumnWidth - v29) * (double)v22 + computedColumnSpacing * (double)(v22 - 1)) / (double)(v22 - 1);
    }
  }
  self->_columnSystem._containerWidth = v6;
  self->_columnSystem._columns = v22;
  self->_columnSystem._rows = v23;
  self->_columnSystem._insets.top = v8;
  self->_columnSystem._insets.left = v10;
  self->_columnSystem._insets.bottom = v12;
  self->_columnSystem._insets.right = v14;
  self->_columnSystem._specifiedColumnWidth = computedColumnWidth;
  self->_columnSystem._specifiedColumnSpacing = computedColumnSpacing;
  self->_columnSystem._computedColumnWidth = v29;
  self->_columnSystem._computedColumnSpacing = v30;
  self->_columnSystem._rowSpacing = computedRowSpacing;
  self->_columnSystem._layoutDirection = (unint64_t)v4;
  self->_columnSystem._contentsScale = v28;
  self->_columnSystem._columnsPerPage = 0;

  v31 = (unint64_t)-[TUISmartGridLayoutConfiguration verticalPlacement](self->_configuration, "verticalPlacement");
  if (v31 >= 7)
    v32 = 5;
  else
    v32 = dword_22F330[v31];
  v126 = v32;
  v33 = (_QWORD *)sub_5F7DC((uint64_t)&v145, (char *)&dword_4 + 2);
  if ((_QWORD *)v147[1] == v33)
  {
    *(CGSize *)v135 = CGSizeZero;
    *(_OWORD *)&v135[16] = 0u;
    v136 = 0u;
    sub_5FCC0((uint64_t)&self->_cellDividers, (uint64_t)v135);
    v156[0] = (void **)&v135[24];
    sub_618C0(v156);

  }
  else
  {
    v34 = sub_5F85C((uint64_t)&self->_columnSystem, 0, 1uLL);
    sub_658DC((uint64_t)&v144, 0, v33[5], v33[6], v34);
    v36 = v35;
    v38 = v37;
    v33[9] = v35;
    v33[10] = v37;
    sub_5FA24((uint64_t)v33, 1);
    v39 = objc_opt_new(NSMutableArray);
    sub_5FB58(&v145, v33, v39);
    *(_QWORD *)v135 = v36;
    *(_QWORD *)&v135[8] = v38;
    *(_OWORD *)&v135[16] = (unint64_t)v39;
    v136 = 0uLL;
    v40 = v39;
    sub_5FCC0((uint64_t)&self->_cellDividers, (uint64_t)v135);
    v156[0] = (void **)&v135[24];
    sub_618C0(v156);

  }
  containerWidth = self->_columnSystem._containerWidth;
  v42 = containerWidth - sub_5FD14((uint64_t)&self->_columnSystem);
  if (v42 <= 0.0)
    v43 = 0.0;
  else
    v43 = v42 * 0.5;
  v44 = v145;
  v121 = v146;
  if (v145 != v146)
  {
    v123 = 0;
    p_cellDividers = &self->_cellDividers;
    while (1)
    {
      v45 = v44[3];
      v46 = v44[4];
      while (v45 != v46)
      {
        v47 = *(id *)(v45 + 32);
        if (objc_msgSend(v47, "role") == (char *)&dword_0 + 3)
        {

        }
        else
        {
          v48 = *(id *)(v45 + 32);
          v49 = (int *)objc_msgSend(v48, "role");

          if (v49 != &dword_4)
            goto LABEL_25;
        }
        *(_QWORD *)v45 = 0;
        v50 = self->_computedColumns;
        *(_QWORD *)(v45 + 8) = 0;
        *(_QWORD *)(v45 + 16) = v50;
        *(_QWORD *)(v45 + 24) = 1;
LABEL_25:
        v45 += 96;
      }
      *(_QWORD *)&v133 = &v145;
      *((_QWORD *)&v133 + 1) = v123;
      v134 = (unint64_t)(v123 + 1);
      sub_65C04((uint64_t)&v133);
      *(_QWORD *)&v131 = &v145;
      *((_QWORD *)&v131 + 1) = v123 + 1;
      v132 = (unint64_t)(v123 + 1);
      sub_65C04((uint64_t)&v131);
      *(_OWORD *)v135 = v133;
      *(_OWORD *)&v135[16] = v134;
      v136 = v131;
      v137 = v132;
      v138 = v43;
      v139 = v8;
      v140 = 0;
      v142 = 0;
      v143 = 0;
      __p = 0;
      sub_5FE6C((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, 0);
      v53 = *(double *)v52.i64;
      if (__p)
      {
        v142 = __p;
        operator delete(__p);
      }
      v122 = v123 + 1;
      v54 = v8 + v53;
      v56 = *v44;
      v55 = v44[1];
      if (*v44 == v55)
      {
        v57 = 0;
      }
      else
      {
        v57 = 0;
        v58 = 0;
        v59 = self->_computedColumns;
        if (v59 == 0x7FFFFFFFFFFFFFFFLL)
          v60 = -1;
        else
          v60 = v59 - 1;
        v61 = *v44;
        do
        {
          if (v60 < v58)
          {
            if (v57 >= 1)
              sub_60388((uint64_t)p_cellDividers, (uint64_t)&self->_columnSystem, v56, v61, v43, v54);
            *(_QWORD *)v135 = v56;
            *(_QWORD *)&v135[8] = v61;
            *(double *)&v135[16] = v43;
            *(double *)&v135[24] = v54;
            v138 = 0.0;
            v139 = 0.0;
            *((_QWORD *)&v137 + 1) = 0;
            LODWORD(v136) = v126;
            v62 = v145;
            v63 = 1;
            while (v62 != v146)
            {
              for (i = *v62; i != v62[1]; i += 96)
              {
                v65 = *(_QWORD *)(i + 48);
                if ((*(_QWORD *)(i + 56) - v65) >> 6 > v63)
                  v63 = (*(_QWORD *)(i + 56) - v65) >> 6;
              }
              v62 += 11;
            }
            sub_60490((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, v63);
            v66 = *(double *)v52.i64;
            v67 = self->_computedRowSpacing;
            if (*((_QWORD *)&v137 + 1))
            {
              v138 = *((double *)&v137 + 1);
              operator delete(*((void **)&v137 + 1));
            }
            v58 = 0;
            v54 = v54 + v66 + v67;
            ++v57;
            v56 = v61;
          }
          if (self->_list)
            v68 = self->_computedColumns;
          else
            v68 = 1;
          v51.i64[0] = v60;
          v52.i64[0] = v58;
          v69 = (int8x16_t)vdupq_lane_s64(vmvnq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v52, v51)).i64[0], 0);
          v52 = (int8x16_t)vdupq_n_s64(1uLL);
          v52.i64[0] = v68;
          v51 = (uint64x2_t)vandq_s8(v52, v69);
          v70 = v68 + v58;
          if (v60 >= v58)
            v71 = v58;
          else
            v71 = 0;
          if (v60 >= v58)
            v58 = v70;
          *(_QWORD *)v61 = v71;
          *(_QWORD *)(v61 + 8) = 0;
          *(uint64x2_t *)(v61 + 16) = v51;
          v61 += 96;
        }
        while (v61 != v55);
        if (v56 != v55)
        {
          if (v57 >= 1)
            sub_60388((uint64_t)p_cellDividers, (uint64_t)&self->_columnSystem, v56, v55, v43, v54);
          *(_QWORD *)v135 = v56;
          *(_QWORD *)&v135[8] = v55;
          *(double *)&v135[16] = v43;
          *(double *)&v135[24] = v54;
          v138 = 0.0;
          v139 = 0.0;
          *((_QWORD *)&v137 + 1) = 0;
          LODWORD(v136) = v126;
          v72 = v145;
          v73 = 1;
          while (v72 != v146)
          {
            for (j = *v72; j != v72[1]; j += 96)
            {
              v75 = *(_QWORD *)(j + 48);
              if ((*(_QWORD *)(j + 56) - v75) >> 6 > v73)
                v73 = (*(_QWORD *)(j + 56) - v75) >> 6;
            }
            v72 += 11;
          }
          sub_60490((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, v73);
          v77 = v76;
          v78 = self->_computedRowSpacing;
          if (*((_QWORD *)&v137 + 1))
          {
            v138 = *((double *)&v137 + 1);
            operator delete(*((void **)&v137 + 1));
          }
          v54 = v54 + v77 + v78;
          ++v57;
        }
      }
      v79 = *v44;
      v80 = v44[1];
      while (v79 != v80)
      {
        if (!*(_BYTE *)(v79 + 40))
        {
          v82 = *(_QWORD *)(v79 + 48);
          v81 = *(_QWORD *)(v79 + 56);
          if (v82 == v81)
          {
            x = CGRectNull.origin.x;
            y = CGRectNull.origin.y;
            width = CGRectNull.size.width;
            height = CGRectNull.size.height;
          }
          else
          {
            x = *(double *)(v82 + 32);
            y = *(double *)(v82 + 40);
            width = *(double *)(v81 - 32) + *(double *)(v81 - 16) - x;
            height = *(double *)(v81 - 24) + *(double *)(v81 - 8) - y;
          }
          v157.origin.x = x;
          v157.origin.y = y;
          v157.size.width = width;
          v157.size.height = height;
          if (!CGRectIsNull(v157))
          {
            v87 = *(id *)(v79 + 32);
            v88 = v87;
            end = (char *)self->_cellBounds.__end_;
            value = (char *)self->_cellBounds.__end_cap_.__value_;
            if (end >= value)
            {
              v92 = (char *)p_cellBounds->__begin_;
              v93 = 0xCCCCCCCCCCCCCCCDLL * ((end - (char *)p_cellBounds->__begin_) >> 3);
              v94 = v93 + 1;
              if (v93 + 1 > 0x666666666666666)
                sub_6F9C();
              v95 = 0xCCCCCCCCCCCCCCCDLL * ((value - v92) >> 3);
              if (2 * v95 > v94)
                v94 = 2 * v95;
              if (v95 >= 0x333333333333333)
                v96 = 0x666666666666666;
              else
                v96 = v94;
              *(_QWORD *)&v136 = &self->_cellBounds.__end_cap_;
              if (v96)
              {
                v97 = (char *)sub_672A4((uint64_t)&self->_cellBounds.__end_cap_, v96);
                v92 = (char *)self->_cellBounds.__begin_;
                end = (char *)self->_cellBounds.__end_;
              }
              else
              {
                v97 = 0;
              }
              v98 = (double *)&v97[40 * v93];
              *(_QWORD *)v98 = v88;
              v98[1] = x;
              v98[2] = y;
              v98[3] = width;
              v98[4] = height;
              if (end == v92)
              {
                v102 = vdupq_n_s64((unint64_t)v92);
                v99 = &v97[40 * v93];
              }
              else
              {
                v99 = &v97[40 * v93];
                do
                {
                  v100 = *((_QWORD *)end - 5);
                  end -= 40;
                  *(_QWORD *)end = 0;
                  *((_QWORD *)v99 - 5) = v100;
                  v99 -= 40;
                  v101 = *(_OWORD *)(end + 8);
                  *(_OWORD *)(v99 + 24) = *(_OWORD *)(end + 24);
                  *(_OWORD *)(v99 + 8) = v101;
                }
                while (end != v92);
                v102 = *(int64x2_t *)&p_cellBounds->__begin_;
              }
              v91 = v98 + 5;
              self->_cellBounds.__begin_ = v99;
              self->_cellBounds.__end_ = v98 + 5;
              *(int64x2_t *)&v135[8] = v102;
              v103 = self->_cellBounds.__end_cap_.__value_;
              self->_cellBounds.__end_cap_.__value_ = &v97[40 * v96];
              *(_QWORD *)&v135[24] = v103;
              *(_QWORD *)v135 = v102.i64[0];
              sub_672E8((uint64_t)v135);
            }
            else
            {
              *(_QWORD *)end = v87;
              *((double *)end + 1) = x;
              *((double *)end + 2) = y;
              v91 = end + 40;
              *((double *)end + 3) = width;
              *((double *)end + 4) = height;
            }
            self->_cellBounds.__end_ = v91;
          }
        }
        v79 += 96;
      }
      if (v57 > 0)
        v54 = v54 - self->_computedRowSpacing;
      *(_QWORD *)&v129 = &v145;
      *((_QWORD *)&v129 + 1) = v123;
      v130 = v122;
      sub_67338((uint64_t)&v129);
      *(_QWORD *)&v127 = &v145;
      *((_QWORD *)&v127 + 1) = v123 + 1;
      v128 = v122;
      sub_67338((uint64_t)&v127);
      *(_OWORD *)v135 = v129;
      *(_OWORD *)&v135[16] = v130;
      v136 = v127;
      v137 = v128;
      v138 = v43;
      v139 = v54;
      v140 = 0;
      v142 = 0;
      v143 = 0;
      __p = 0;
      sub_60890((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, 0);
      v105 = v104;
      if (__p)
      {
        v142 = __p;
        operator delete(__p);
      }
      v8 = v54 + v105;
      v44 += 11;
      ++v123;
      if (v44 == v121)
      {
        v106 = v145;
        v107 = v146;
        while (v106 != v107)
        {
          v108 = *v106;
          v109 = v106[1];
          while (v108 != v109)
          {
            if (*(_QWORD *)(v108 + 16))
              v110 = *(_QWORD *)(v108 + 24) == 0;
            else
              v110 = 1;
            v111 = v110;
            sub_60DAC(v108, v111);
            v108 += 96;
          }
          v112 = v106[3];
          v113 = v106[4];
          while (v112 != v113)
          {
            if (*(_QWORD *)(v112 + 16))
              v114 = *(_QWORD *)(v112 + 24) == 0;
            else
              v114 = 1;
            v115 = v114;
            sub_5FA24(v112, v115);
            v112 += 96;
          }
          v106 += 11;
        }
        break;
      }
    }
  }
  -[TUISmartGridLayoutConfiguration height](self->_configuration, "height");
  v117 = v116;
  -[TUISmartGridLayoutConfiguration specifiedHeight](self->_configuration, "specifiedHeight");
  if ((v118 & 0x6000000000000) == 0x2000000000000)
    v119 = v12 + v8;
  else
    v119 = v117;
  self->_contentLayoutSize.width = v6;
  self->_contentLayoutSize.height = v12 + v8;
  self->_layoutSize.width = v6;
  self->_layoutSize.height = v119;
  if (v154)
  {
    v155 = v154;
    operator delete(v154);
  }
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }
  if (v150)
  {
    v151 = v150;
    operator delete(v150);
  }
  *(_QWORD *)v135 = v147;
  sub_6192C((void ***)v135);
  *(_QWORD *)v135 = &v145;
  sub_61B28((void ***)v135);

}

- (void)positionContainerLayout:(id)a3
{
  objc_msgSend(a3, "setComputedOrigin:", 0.0, 0.0);
}

- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5
{
  id v8;
  id v9;
  id v10;
  double width;
  double *end;
  double *begin;
  double v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "axis") == (char *)&dword_0 + 2)
  {
    width = self->_contentLayoutSize.width;
    v15 = 0;
    if (v9)
      objc_msgSend(v9, "computedTransformInAncestorLayout:", v10, 0);
    begin = self->_scrollAnchors.__begin_;
    end = self->_scrollAnchors.__end_;
    if (begin != end)
    {
      v14 = width * 0.5;
      do
        objc_msgSend(v8, "appendScrollAnchor:", *begin++ * 0.0 + 0.0 * v14 + 0.0, v15);
      while (begin != end);
    }
  }

}

- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  id v12;
  id v13;
  id v14;
  __int128 v15;
  double width;
  double height;
  void *v18;
  __int128 v19;
  void *v20;
  _OWORD v21[3];
  _OWORD v22[3];

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v15;
  v22[2] = *(_OWORD *)&a4->tx;
  sub_611B0((uint64_t)&self->_cellDividers, a3, (double *)v22, v12, v14);
  if (a3 >= 4 && objc_msgSend(v12, "debugVisualLayout"))
  {
    width = self->_contentLayoutSize.width;
    height = self->_contentLayoutSize.height;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v19 = *(_OWORD *)&a4->c;
    v21[0] = *(_OWORD *)&a4->a;
    v21[1] = v19;
    v21[2] = *(_OWORD *)&a4->tx;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUISmartGridDebugRenderModel renderModelWithSize:columnSystem:identifier:transform:](TUISmartGridDebugRenderModel, "renderModelWithSize:columnSystem:identifier:transform:", &self->_columnSystem, v18, v21, width, height));

    objc_msgSend(v14, "addObject:", v20);
  }

}

- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  id *begin;
  id *i;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  id v16;
  id v17;
  id v18;
  double x;
  double y;
  double width;
  double height;
  TUIHoverIdentifier *v23;
  void *v24;
  TUIHoverIdentifier *v25;
  TUIHoverRegion *v26;
  CGAffineTransform v27;
  CGRect v28;

  v6 = a3;
  begin = (id *)self->_cellBounds.__begin_;
  for (i = (id *)self->_cellBounds.__end_; begin != i; begin += 5)
  {
    v9 = *begin;
    v10 = begin[1];
    v11 = begin[2];
    v12 = begin[3];
    v13 = begin[4];
    v14 = v9;
    v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v27.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v27.c = v15;
    *(_OWORD *)&v27.tx = *(_OWORD *)&a4->tx;
    v16 = v10;
    *(_QWORD *)&v15 = v11;
    v17 = v12;
    v18 = v13;
    v28 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v15 - 8), &v27);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    v23 = [TUIHoverIdentifier alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v25 = -[TUIHoverIdentifier initWithName:identifier:](v23, "initWithName:identifier:", CFSTR("cell"), v24);

    v26 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", x, y, width, height);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v25);

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

- (BOOL)list
{
  return self->_list;
}

- (void)setList:(BOOL)a3
{
  self->_list = a3;
}

- (void).cxx_destruct
{
  double *begin;
  void **p_begin;

  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_content, 0);
  p_begin = &self->_cellDividers._positions.__begin_;
  sub_618C0(&p_begin);

  p_begin = &self->_cellBounds.__begin_;
  sub_679FC(&p_begin);
  begin = self->_scrollAnchors.__begin_;
  if (begin)
  {
    self->_scrollAnchors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  __int128 v2;

  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(CGSize *)((char *)self + 56) = CGSizeZero;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_QWORD *)self + 15) = 0;
  v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *((_OWORD *)self + 8) = *(_OWORD *)&UIEdgeInsetsZero.top;
  *((_OWORD *)self + 9) = v2;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  return self;
}

@end
