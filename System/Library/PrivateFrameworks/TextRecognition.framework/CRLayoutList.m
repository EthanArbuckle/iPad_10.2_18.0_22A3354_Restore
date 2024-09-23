@implementation CRLayoutList

- (CRLayoutList)initWithItems:(id)a3 layoutDirection:(unint64_t)a4
{
  id v6;
  CRLayoutList *v7;
  CRLayoutList *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLayoutList;
  v7 = -[CRLayoutList init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CRLayoutList setItems:](v7, "setItems:", v6);
    v8->_layoutDirection = a4;
  }

  return v8;
}

+ (id)listsWithRegionGroups:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  CRLayoutListItem *v13;
  uint64_t v14;
  BOOL v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  char v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  int v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  _BOOL4 v58;
  _BOOL4 v59;
  int v60;
  int v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  BOOL v76;
  void *v77;
  char v78;
  uint64_t v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  BOOL v86;
  BOOL v87;
  double v88;
  char v89;
  char v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  char v96;
  char v97;
  char v98;
  id v99;
  double v100;
  id v101;
  id v102;
  void *v103;
  double v104;
  double v105;
  CRLayoutList *v106;
  void *v107;
  CRLayoutList *v108;
  id v109;
  id v111;
  double v112;
  void *v113;
  id v114;
  double v115;
  double v116;
  double v117;
  uint64_t v118;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v111 = (id)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v5 = v3;
  v124 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
  if (v124)
  {
    v122 = 0;
    v123 = 0;
    v127 = 0;
    v128 = 0;
    v6 = 0;
    v125 = 0;
    v118 = *(_QWORD *)v131;
    v7 = 0.0;
    v8 = 1.0;
    v126 = 1;
    v9 = 0.0;
    v113 = v4;
    v114 = v5;
    while (1)
    {
      for (i = 0; i != v124; ++i)
      {
        if (*(_QWORD *)v131 != v118)
          objc_enumerationMutation(v5);
        v129 = v6;
        v11 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
        objc_msgSend(a1, "_groupGeometryInfoForGroup:", v11, v111);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CRLayoutListItem initWithGroup:]([CRLayoutListItem alloc], "initWithGroup:", v11);
        if (!v128)
          v128 = objc_msgSend(v11, "layoutDirection");
        v14 = objc_msgSend(v4, "count");
        if (v13)
          v15 = 1;
        else
          v15 = v14 == 0;
        v16 = !v15;
        if (!v14)
        {
          LOBYTE(v16) = 0;
          v41 = 0;
          goto LABEL_72;
        }
        -[CRLayoutListItem boundingQuad](v13, "boundingQuad");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "baselineAngle");
        v19 = vabdd_f64(v18, v9);

        objc_msgSend(v125, "firstSubregion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstSubregion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mutualGeometryInfoWith:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v129, "lastSubregion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstSubregion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mutualGeometryInfoWith:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "leadingOffsetAlongBaseline");
        v27 = v26 / v7;
        objc_msgSend(v25, "leadingOffsetAlongBaseline");
        v29 = v28;
        objc_msgSend(v25, "leadingOffsetAlongBaseline");
        v31 = v30;
        objc_msgSend(v125, "firstSubregion");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "estimatedLineHeight");
        v34 = v31 / v33;

        v35 = fabs(v27);
        v36 = v127;
        if (v35 >= v8)
          v36 = v127 + 1;
        v127 = v36;
        if (v35 < v8)
          v37 = v126 + 1;
        else
          v37 = 1;
        if (v13)
        {
          v116 = v19;
          v117 = v9;
          v121 = v37;
          v115 = v34;
          if (v122 == v125)
          {
            v40 = v22;
          }
          else
          {
            objc_msgSend(v122, "firstSubregion");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "firstSubregion");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "mutualGeometryInfoWith:", v39);
            v40 = (id)objc_claimAutoreleasedReturnValue();

          }
          v4 = v113;
          v63 = v7;
          v64 = fabs(v29 / v7);
          objc_msgSend(v22, "leadingOffsetAlongBaseline");
          v66 = v65;
          objc_msgSend(v12, "firstSubregion");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "estimatedLineHeight");
          v69 = v68;

          v120 = v40;
          objc_msgSend(v40, "leadingOffsetAlongBaseline");
          v112 = v70;
          objc_msgSend(v12, "firstSubregion");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "estimatedLineHeight");
          v73 = v72;

          v76 = v64 >= v8 && v127 != 0 && v126 < 2;
          objc_msgSend(v113, "lastObject");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "canBeSucceededByListItem:", v13);

          v79 = objc_msgSend(v11, "layoutDirection");
          objc_msgSend(v125, "firstSubregion");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "estimatedLineHeight");
          v82 = v81;

          objc_msgSend(v12, "firstSubregion");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "estimatedLineHeight");
          v85 = v84;

          v86 = v85 / v82 > 1.5 || v82 / v85 > 1.5;
          v8 = 1.0;
          if (v64 < 1.0)
          {
            v87 = v66 / v69 > 8.0;
LABEL_53:
            v7 = v63;
            v88 = v115;
          }
          else
          {
            if (v35 > 2.0)
            {
              v87 = 1;
              goto LABEL_53;
            }
            v88 = v115;
            v87 = fabs(v112 / v73) >= 2.0 && v35 > 1.0;
            v7 = v63;
          }
          LOBYTE(v16) = 0;
          v89 = v116 > 0.34906585 || v76;
          v90 = v89 | (v86 || v87);
          if (v88 > 4.0)
            v90 = 1;
          v91 = v90 | v78 ^ 1;
          if (v128 == v79)
            v41 = v91;
          else
            v41 = 1;
          v5 = v114;
          v9 = v117;
LABEL_70:

          v37 = v121;
          goto LABEL_71;
        }
        if (v16)
        {
          v121 = v37;
          v42 = v35 < v8;
          objc_msgSend(v125, "firstSubregion");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastSubregion");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "mutualGeometryInfoWith:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v120 = v45;
          objc_msgSend(v45, "leadingOffsetAlongBaseline");
          v47 = v46;
          objc_msgSend(v125, "firstSubregion");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "estimatedLineHeight");
          v50 = v47 / v49;

          v51 = objc_msgSend(v12, "isCenterJustified");
          objc_msgSend(v12, "firstSubregion");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "estimatedLineHeight");
          v54 = v53;

          objc_msgSend(v129, "lastSubregion");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "estimatedLineHeight");
          v57 = v56;

          v58 = v54 / v57 >= 0.5;
          if (v54 / v57 > 1.5)
            v58 = 0;
          v59 = v50 >= 0.5;
          if (v50 > 8.0)
            v59 = 0;
          v60 = v42 & ~v51;
          if (v19 > 0.34906585)
            v60 = 0;
          v61 = v60 & (v58 && v59);
          if (v34 <= 3.0)
            v16 = v61;
          else
            v16 = 0;
          v4 = v113;
          if (v16 == 1)
          {
            v62 = v12;

            objc_msgSend(v113, "lastObject");
            v13 = (CRLayoutListItem *)objc_claimAutoreleasedReturnValue();
            -[CRLayoutListItem appendGroup:](v13, "appendGroup:", v11);
            objc_msgSend(v113, "removeLastObject");
            v41 = 0;
            v129 = v62;
          }
          else
          {
            v41 = 0;
            v13 = 0;
          }
          v5 = v114;
          goto LABEL_70;
        }
        v41 = 0;
        v13 = 0;
        v4 = v113;
        v5 = v114;
LABEL_71:

        v126 = v37;
LABEL_72:
        v92 = v123 + i;
        v93 = objc_msgSend(v5, "count");
        v94 = objc_msgSend(v4, "count");
        if (v13)
          v95 = v92 == v93 - 1;
        else
          v95 = 1;
        v96 = v95;
        v97 = v96 | v41;
        if (v94)
          v98 = v97;
        else
          v98 = 0;
        if (!v13)
        {
          v6 = v129;
          if ((v98 & 1) == 0)
            goto LABEL_96;
LABEL_93:
          if ((unint64_t)objc_msgSend(v4, "count") >= 2)
          {
            v106 = [CRLayoutList alloc];
            v107 = (void *)objc_msgSend(v4, "copy");
            v108 = -[CRLayoutList initWithItems:layoutDirection:](v106, "initWithItems:layoutDirection:", v107, v128);

            objc_msgSend(v111, "addObject:", v108);
          }
          objc_msgSend(v4, "removeAllObjects");
          v128 = 0;
          goto LABEL_96;
        }
        if (v98 & 1 | (v92 == 0))
        {
          v99 = v12;

          objc_msgSend(v99, "size");
          v7 = v100;
          v126 = 1;
          v127 = 0;
          v122 = v99;
        }
        if ((v16 & 1) == 0)
        {
          v101 = v12;

          v125 = v101;
        }
        v102 = v12;

        -[CRLayoutListItem boundingQuad](v13, "boundingQuad");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "baselineAngle");
        v9 = v104;

        objc_msgSend(v102, "size");
        if (v105 > v7)
          v7 = v105;
        if ((v41 & 1) == 0)
          objc_msgSend(v4, "addObject:", v13);
        v6 = v102;
        if ((v98 & 1) != 0)
          goto LABEL_93;
LABEL_96:
        if (v13 != 0 && (v41 & 1) != 0)
          objc_msgSend(v4, "addObject:", v13);

      }
      v123 += v124;
      v124 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
      if (!v124)
        goto LABEL_102;
    }
  }
  v6 = 0;
  v125 = 0;
  v122 = 0;
LABEL_102:

  v109 = v111;
  return v109;
}

+ (id)_groupGeometryInfoForGroup:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "geometryInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[CRRegionGroupGeometryInfo initFromRegionGroup:]([CRRegionGroupGeometryInfo alloc], "initFromRegionGroup:", v3);
  }
  v5 = v4;

  return v5;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
