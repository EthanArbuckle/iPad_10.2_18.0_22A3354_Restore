@implementation TUISmartGridOverlapWithOffsetsLayoutManager

- (TUISmartGridOverlapWithOffsetsLayoutManager)initWithContent:(id)a3
{
  id v5;
  TUISmartGridOverlapWithOffsetsLayoutManager *v6;
  TUISmartGridOverlapWithOffsetsLayoutManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridOverlapWithOffsetsLayoutManager;
  v6 = -[TUISmartGridOverlapWithOffsetsLayoutManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

- (unint64_t)ruleLayoutAxis
{
  return 0;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v5, "width");
  objc_msgSend(v6, "setContainingWidth:");
  objc_msgSend(v6, "setContainingHeight:", NAN);

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

- (void)layoutContent:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  id v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  double v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  unint64_t v86;
  unint64_t v87;
  double v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  void *v92;
  id v93;
  void *v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  const CGPoint *v107;
  CGFloat *p_y;
  BOOL v109;
  const CGPoint *v110;
  unint64_t v111;
  char *v112;
  CGFloat v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  unint64_t v120;
  TUISmartGridOverlapWithOffsetsLayoutManager *v121;
  double v122;
  void *v123;
  unint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *__p;
  void *v133;
  void **v134[2];

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "computedLayoutDirection");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "children"));
  sub_61D50((uint64_t)&v125, v6, self->_content, 0);

  v7 = v125;
  if (v125 == v126)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v10 = *(_QWORD *)v7;
      v9 = *((_QWORD *)v7 + 1);
      v7 += 88;
      v8 -= 0x5555555555555555 * ((v9 - v10) >> 5);
    }
    while (v7 != v126);
  }
  -[TUISmartGridLayoutConfiguration contentInsets](self->_configuration, "contentInsets");
  v122 = v11;
  v13 = v12;
  v15 = v14;
  -[TUISmartGridLayoutConfiguration width](self->_configuration, "width");
  v17 = v16;
  v121 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridLayoutConfiguration additionalConfiguration](self->_configuration, "additionalConfiguration"));
  v19 = objc_opt_class(NSDictionary);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("offsets")));
  v21 = TUIDynamicCast(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v23 = objc_opt_class(NSString);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridLayoutConfiguration widthSnap](self->_configuration, "widthSnap"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifierForValue:", v17));
  v26 = TUIDynamicCast(v23, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);

  if (v27)
  {
    v28 = objc_opt_class(NSArray);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v27));
    v30 = TUIDynamicCast(v28, v29);
    v123 = (void *)objc_claimAutoreleasedReturnValue(v30);

  }
  else
  {
    v123 = 0;
  }
  v31 = objc_opt_class(NSNumber);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("minHOffset")));
  v33 = TUIDynamicCast(v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

  v35 = objc_opt_class(NSNumber);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("maxHOffset")));
  v37 = TUIDynamicCast(v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  v39 = -[TUISmartGridLayoutConfiguration columnWidth](v121->_configuration, "columnWidth");
  v41 = TUILengthValueWithDefault((uint64_t)v39, v40, 120.0);
  v120 = (unint64_t)objc_msgSend(v123, "count");
  v118 = v38;
  if (v34 && v38)
  {
    objc_msgSend(v34, "doubleValue");
    v43 = v42;
    objc_msgSend(v38, "doubleValue");
    v45 = v17 - v13 - v15;
    v46 = v45 - v41;
    v47 = vcvtpd_u64_f64((v45 - v41) / v43);
    if (v8 >= v47)
      v48 = v47;
    else
      v48 = v8;
  }
  else
  {
    v49 = v120;
    if (v120 >= v8)
      v49 = v8;
    if (v123)
      v48 = v49;
    else
      v48 = v8;
    v45 = v17 - v13 - v15;
    v46 = v45 - v41;
    v44 = 1.79769313e308;
  }
  v124 = v48;
  v50 = (double)(v48 - 1);
  v51 = v46 / v50;
  if (v51 >= v44)
    v52 = v44;
  else
    v52 = v51;
  v53 = v45 - (v41 + v50 * v52);
  v54 = v13 + v53 * 0.5;
  v55 = v17 - v15 - v53 * 0.5;
  if (v5 == (_BYTE *)&dword_0 + 2)
    v56 = v55;
  else
    v56 = v54;
  v57 = objc_opt_class(NSNumber);
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("minVerticalCutoff")));
  v59 = TUIDynamicCast(v57, v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

  v117 = v60;
  if (v60)
  {
    objc_msgSend(v60, "doubleValue");
    v62 = v61;
  }
  else
  {
    v62 = 12.0;
  }
  v63 = -[TUISmartGridLayoutConfiguration specifiedHeight](v121->_configuration, "specifiedHeight", *(_QWORD *)&v17);
  v114 = (void *)v27;
  v65 = v125;
  v66 = (v126 - v125) / 88;
  v115 = v18;
  v116 = v4;
  if (v126 == v125)
  {
    v69 = v64;
    v70 = (uint64_t)v63;
    v67 = 0;
  }
  else
  {
    v67 = 0;
    v68 = v125 + 8;
    while (*v68 == *(v68 - 1))
    {
      ++v67;
      v68 += 11;
      if (v66 == v67)
      {
        v69 = v64;
        v70 = (uint64_t)v63;
        v71 = 0.0;
        goto LABEL_52;
      }
    }
    v69 = v64;
    v70 = (uint64_t)v63;
  }
  v71 = 0.0;
  if (v67 != v66)
  {
    v72 = 0;
    v73 = 0;
    do
    {
      v74 = *(_QWORD *)&v65[88 * v67];
      v75 = v74 + 96 * v73;
      if (v72 >= v124)
      {
        sub_60DAC(v75, 1);
      }
      else
      {
        sub_60DAC(v75, 0);
        sub_658DC((uint64_t)v134, 0, *(_QWORD *)(v74 + 96 * v73 + 48), *(_QWORD *)(v74 + 96 * v73 + 56), v41);
        v77 = v74 + 96 * v73;
        *(_QWORD *)(v77 + 72) = v78;
        *(double *)(v77 + 80) = v76;
        if (v71 < v76)
          v71 = v76;
      }
      v65 = v125;
      v79 = 0x2E8BA2E8BA2E8BA3 * ((v126 - v125) >> 3);
      if (v67 >= v79)
      {
        v73 = 0;
LABEL_49:
        v67 = 0x2E8BA2E8BA2E8BA3 * ((v126 - v125) >> 3);
      }
      else
      {
        ++v73;
        v80 = &v125[88 * v67 + 8];
        while (v73 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)v80 - *((_QWORD *)v80 - 1)) >> 5))
        {
          v73 = 0;
          ++v67;
          v80 += 88;
          if (v79 == v67)
            goto LABEL_49;
        }
      }
      ++v72;
    }
    while (v73 || v67 != v79);
  }
LABEL_52:
  v81 = TUILengthValueWithDefault(v70, v69, v71 - v62 - v122);
  v82 = v125;
  v83 = (v126 - v125) / 88;
  v84 = 0;
  if (v126 != v125)
  {
    v85 = v125 + 8;
    while (*v85 == *(v85 - 1))
    {
      ++v84;
      v85 += 11;
      if (v83 == v84)
        goto LABEL_88;
    }
  }
  if (v84 != v83)
  {
    v86 = 0;
    v87 = 0;
    v88 = 0.0;
    if (v5 == (_BYTE *)&dword_0 + 2)
      v88 = v41;
    v119 = v88;
    if (v5 == (_BYTE *)&dword_0 + 2)
      v52 = -v52;
    while (v86 != v124)
    {
      v89 = *(_QWORD *)&v82[88 * v84];
      v90 = *(double *)(v89 + 96 * v87 + 80);
      if (v123)
      {
        v91 = objc_opt_class(NSNumber);
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectAtIndexedSubscript:", v86 % v120));
        v93 = TUIDynamicCast(v91, v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue(v93);

        objc_msgSend(v94, "doubleValue");
        v96 = v95;

      }
      else
      {
        v96 = (double)(8 * (17 * v86 % 5));
      }
      if (v81 > v90 + v96 - v62)
        v96 = v62 + v81 - v90;
      v97 = v89 + 96 * v87;
      v98 = *(_QWORD *)(v97 + 48);
      v99 = *(_QWORD *)(v97 + 56);
      if (v98 != v99)
      {
        v100 = v56 - v119;
        v101 = v122 + v96;
        v102 = 0.0;
        do
        {
          *(double *)(v98 + 32) = v100;
          *(double *)(v98 + 40) = v101 + v102;
          v104 = *(_QWORD *)(v98 + 8);
          v103 = *(_QWORD *)(v98 + 16);
          while (v104 != v103)
          {
            v105 = *(_QWORD *)(v104 + 56);
            v106 = (char *)__p + 152 * v105;
            v107 = (const CGPoint *)(v106 + 136);
            p_y = (CGFloat *)(v106 + 144);
            v109 = v105 == -1;
            if (v105 == -1)
              v110 = &CGPointZero;
            else
              v110 = v107;
            if (v109)
              p_y = &CGPointZero.y;
            sub_66990((double *)(v104 + 8), v100 - v110->x + *(double *)(v104 + 72), v101 + v102 - *p_y + *(double *)(v104 + 64));
            v104 += 96;
          }
          v102 = v102 + *(double *)(v98 + 56);
          v98 += 64;
        }
        while (v98 != v99);
      }
      v82 = v125;
      v111 = 0x2E8BA2E8BA2E8BA3 * ((v126 - v125) >> 3);
      if (v84 >= v111)
      {
        v87 = 0;
LABEL_85:
        v84 = 0x2E8BA2E8BA2E8BA3 * ((v126 - v125) >> 3);
      }
      else
      {
        ++v87;
        v112 = &v125[88 * v84 + 8];
        while (v87 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)v112 - *((_QWORD *)v112 - 1)) >> 5))
        {
          v87 = 0;
          ++v84;
          v112 += 88;
          if (v111 == v84)
            goto LABEL_85;
        }
      }
      v56 = v56 + v52;
      ++v86;
      if (!v87 && v84 == v111)
        break;
    }
  }
LABEL_88:
  v121->_contentLayoutSize.width = v113;
  v121->_contentLayoutSize.height = v122 + v81;
  v121->_layoutSize = v121->_contentLayoutSize;

  if (__p)
  {
    v133 = __p;
    operator delete(__p);
  }
  if (v130)
  {
    v131 = v130;
    operator delete(v130);
  }
  if (v128)
  {
    v129 = v128;
    operator delete(v128);
  }
  v134[0] = (void **)&v127;
  sub_6192C(v134);
  v134[0] = (void **)&v125;
  sub_61B28(v134);

}

- (void)positionContainerLayout:(id)a3
{
  objc_msgSend(a3, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
}

- (double)widthForColumnSpan:(unint64_t)a3
{
  return NAN;
}

- (CGSize)scrollLayoutSizeWithSize:(CGSize)a3
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

- (double)computedColumnSpacing
{
  return self->_computedColumnSpacing;
}

- (double)computedColumnWidth
{
  return self->_computedColumnWidth;
}

- (TUISmartGridContentBox)content
{
  return self->_content;
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
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
