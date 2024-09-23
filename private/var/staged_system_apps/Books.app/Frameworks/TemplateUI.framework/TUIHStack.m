@implementation TUIHStack

- (TUIHStack)initWithLayout:(id)a3
{
  id v4;
  TUIHStack *v5;
  TUIHStack *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIHStack;
  v5 = -[TUIHStack init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    *(_OWORD *)&v6->_specifiedWidth.value = TUILengthNull;
    *(_OWORD *)&v6->_specifiedWidth._flags = TUILengthNull;
    *(int64x2_t *)&v6->_computedHeight = vdupq_n_s64(0x7FF8000000000000uLL);
  }

  return v6;
}

- (TUIHStack)initWithLayout:(id)a3 children:(id)a4
{
  id v6;
  TUIHStack *v7;
  NSArray *v8;
  NSArray *children;

  v6 = a4;
  v7 = -[TUIHStack initWithLayout:](self, "initWithLayout:", a3);
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    children = v7->_children;
    v7->_children = v8;

  }
  return v7;
}

- (void)computeLayout
{
  -[TUIHStack computeLayoutWithOrigin:](self, "computeLayoutWithOrigin:", CGPointZero.x, CGPointZero.y);
}

- (void)computeLayoutWithOrigin:(CGPoint)a3
{
  double computedWidth;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  void *i;
  void *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  TUIGuideLayoutController *guideLayoutController;
  void *v32;
  TUIGuideLayoutController *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  void *k;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  TUIGuideLayoutController *v51;
  double v52;
  double v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *n;
  TUIGuideLayoutController *v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *m;
  void *v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  int v73;
  double v74;
  float v75;
  id WeakRetained;
  char *v77;
  double v78;
  id v79;
  void *v80;
  unsigned __int8 v81;
  id v82;
  void *v83;
  char *v84;
  double v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  void *ii;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  int *v106;
  double v107;
  double v108;
  double v109;
  double v110;
  uint64_t v111;
  void *v112;
  id obj;
  id obja;
  void *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];

  computedWidth = self->_computedWidth;
  -[TUIGuideLayoutController reset](self->_guideLayoutController, "reset");
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIHStack children](self, "children"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
  if (v5)
  {
    v6 = v5;
    v116 = 0;
    v7 = *(_QWORD *)v138;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v138 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "setFlexedWidth:", NAN);
        objc_msgSend(v10, "setFlexedHeight:", self->_computedHeight);
        objc_msgSend(v10, "setContainingMaxWidth:", self->_containingMaxWidth);
        objc_msgSend(v10, "validateLayout");
        objc_msgSend(v10, "computedTransformedSize");
        v12 = v11;
        v13 = objc_msgSend(v10, "computedWidth");
        v15 = v14;
        if ((v14 & 0x8000000000000) != 0
          || !self->_prefersEqualWidth
          && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "box")),
              v17 = objc_msgSend(v16, "hcompressed"),
              v16,
              v17))
        {
          v18 = v116;
          if (!v116)
          {
            if (self->_prefersEqualWidth)
            {
              if (self->_useStrictEqualWidth)
                v19 = +[TUIFlexibleLayoutController newStrictEqualWidthController](TUIFlexibleLayoutController, "newStrictEqualWidthController");
              else
                v19 = +[TUIFlexibleLayoutController newEqualWidthController](TUIFlexibleLayoutController, "newEqualWidthController");
            }
            else
            {
              v19 = +[TUIFlexibleLayoutController newWidthController](TUIFlexibleLayoutController, "newWidthController");
            }
            v18 = v19;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "box"));
          v116 = v18;
          objc_msgSend(v18, "addLayout:length:compressed:", v10, v13, v15, objc_msgSend(v20, "hcompressed"));

        }
        v8 = v8 + v12;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
    }
    while (v6);

    if (v116)
    {
      if (v8 != computedWidth || self->_prefersEqualWidth)
      {
        v21 = -[TUIHStack specifiedWidth](self, "specifiedWidth");
        if (computedWidth <= -3.40282347e38)
        {
          v23 = 4286578687;
        }
        else
        {
          v23 = 2139095039;
          if (computedWidth < 3.40282347e38)
          {
            *(float *)&v24 = computedWidth;
            v23 = v24;
          }
        }
        objc_msgSend(v116, "computeWithMeasured:desired:", v23 | v21 & 0xFFFFFFFF00000000, v22 & 0xFFE8FFFFFFFFFFFFLL, v8);
        objc_msgSend(v116, "adjustedNaturalLengthWithMeasured:computed:", v8, computedWidth);
        v133 = 0u;
        v134 = 0u;
        v135 = 0u;
        v136 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "layouts", v25));
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v134;
          do
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(_QWORD *)v134 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v30, "hidden") & 1) == 0)
              {
                objc_msgSend(v116, "adjustedLengthForLayout:", v30);
                objc_msgSend(v30, "setFlexedWidth:");
                objc_msgSend(v30, "validateLayout");
              }
            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
          }
          while (v27);
        }
        goto LABEL_39;
      }
    }
    else
    {
      v116 = 0;
    }
    v110 = computedWidth;
    goto LABEL_40;
  }
  v116 = 0;
  v110 = computedWidth;
LABEL_39:

LABEL_40:
  guideLayoutController = self->_guideLayoutController;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 2, *(_QWORD *)&v110));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](guideLayoutController, "guideForSpec:", v32));

  v33 = self->_guideLayoutController;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 3));
  obja = (id)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](v33, "guideForSpec:", v34));

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack children](self, "children"));
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v130;
    v39 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v130 != v38)
          objc_enumerationMutation(v35);
        v43 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)k);
        if ((objc_msgSend(v43, "hidden") & 1) == 0)
        {
          objc_msgSend(v43, "computedTransformedSize");
          v46 = v45;
          if (self->_guideLayoutController)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "effectiveGuideTop"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "effectiveGuideBottom"));
            if (v47)
              -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v112, v47, 0, 0xB00007F7FFFFFLL);
            if (v48)
              -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v48, obja, 0, 0xB00007F7FFFFFLL);

          }
          else
          {
            v49 = v44;
            objc_msgSend(v43, "computedHeightAbovePivot");
            v40 = fmax(v50, v40);
            v39 = fmax(v49 - v50, v39);
          }
          v41 = v41 + v46;
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
    }
    while (v37);
  }
  else
  {
    v39 = 0.0;
    v40 = 0.0;
    v41 = 0.0;
  }

  v51 = self->_guideLayoutController;
  if (!v51)
  {
    v59 = 0;
    v53 = v39 + v40;
LABEL_69:
    if (v39 == 0.0)
    {
      -[TUIHStack specifiedHeight](self, "specifiedHeight");
      if ((HIWORD(v60) & 7) - 5 <= 1u)
      {
        -[TUIHStack specifiedHeight](self, "specifiedHeight");
        if ((v61 & 0x8000000000000) != 0)
        {
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack children](self, "children"));
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v122;
            do
            {
              for (m = 0; m != v64; m = (char *)m + 1)
              {
                if (*(_QWORD *)v122 != v65)
                  objc_enumerationMutation(v62);
                v67 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)m);
                objc_msgSend(v67, "setFlexedHeight:", v53);
                objc_msgSend(v67, "validateLayout");
              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
            }
            while (v64);
          }

        }
      }
      v59 = self->_guideLayoutController;
    }
    goto LABEL_81;
  }
  -[TUIGuideLayoutController solve](v51, "solve");
  -[TUIGuideLayoutController computeLength](self->_guideLayoutController, "computeLength");
  v53 = v52;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack children](self, "children"));
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v126;
    do
    {
      for (n = 0; n != v56; n = (char *)n + 1)
      {
        if (*(_QWORD *)v126 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)n), "validateLayout");
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
    }
    while (v56);
  }

  v59 = self->_guideLayoutController;
  if (!v59)
    goto LABEL_69;
LABEL_81:
  if (!v59)
  {
    LODWORD(v68) = -[TUIHStack specifiedHeight](self, "specifiedHeight");
    v69 = COERCE_FLOAT(-[TUIHStack specifiedHeight](self, "specifiedHeight", v68));
    -[TUIHStack specifiedHeight](self, "specifiedHeight");
    if ((v70 & 0x8000000000000) != 0)
    {
      LODWORD(v71) = (unint64_t)-[TUIHStack specifiedHeight](self, "specifiedHeight") >> 32;
      v72 = fmax(fmin(v69, v53), COERCE_FLOAT((unint64_t)-[TUIHStack specifiedHeight](self, "specifiedHeight", v71) >> 32));
      -[TUIHStack specifiedHeight](self, "specifiedHeight");
      LODWORD(v74) = v73;
      -[TUIHStack specifiedHeight](self, "specifiedHeight", v74);
      v53 = fmin(fmax(v72, v53), v75);
    }
    else
    {
      v53 = v69;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  v77 = (char *)objc_msgSend(WeakRetained, "computedLayoutDirection");

  if (v77 == (_BYTE *)&dword_0 + 2)
    v78 = computedWidth;
  else
    v78 = 0.0;
  v79 = objc_loadWeakRetained((id *)&self->_layout);
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "layoutAncestor"));
  v81 = objc_msgSend(v80, "isHorizontallyAligningChildren");

  if ((v81 & 1) == 0)
  {
    v82 = objc_loadWeakRetained((id *)&self->_layout);
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "box"));
    v84 = (char *)objc_msgSend(v83, "halign");

    if (v84 == (_BYTE *)&dword_0 + 3)
    {
      if (v77 == (_BYTE *)&dword_0 + 2)
        v78 = v41;
      else
        v78 = computedWidth - v41;
    }
    else if (v84 == (_BYTE *)&dword_0 + 2)
    {
      v85 = -0.0;
      if (v77 == (_BYTE *)&dword_0 + 2)
        v85 = v41;
      v78 = (computedWidth - v41) * 0.5 + v85;
    }
  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHStack children](self, "children"));
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v118;
    do
    {
      for (ii = 0; ii != v88; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v118 != v89)
          objc_enumerationMutation(v86);
        v91 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)ii);
        if ((objc_msgSend(v91, "hidden") & 1) == 0)
        {
          objc_msgSend(v91, "computedTransformedSize");
          v93 = v92;
          v95 = v94;
          objc_msgSend(v91, "computedHeightAbovePivot");
          v97 = v96;
          if (v77 == (_BYTE *)&dword_0 + 2)
            v98 = v93;
          else
            v98 = 0.0;
          if (!self->_guideLayoutController)
            goto LABEL_112;
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "effectiveGuideTop"));
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "effectiveGuideBottom"));
          v101 = v100;
          if (v99)
          {
            objc_msgSend(v99, "guideOffset");
            v103 = v102;
            goto LABEL_111;
          }
          if (v100)
          {
            objc_msgSend(v100, "guideOffset");
            v103 = v104 - v95;
LABEL_111:

          }
          else
          {
LABEL_112:
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "box"));
            v106 = (int *)objc_msgSend(v105, "valign");

            if ((unint64_t)v106 < 2)
            {
              v103 = v40 - v97;
            }
            else
            {
              v107 = v53 - v95;
              if (v106 == &dword_4)
                v107 = (v53 - v95) * 0.5;
              if (v106 == (int *)((char *)&dword_0 + 2))
                v103 = 0.0;
              else
                v103 = v107;
            }
          }
          v108 = v78 - v98;
          objc_msgSend(v91, "setComputedOrigin:", a3.x + v108, a3.y + v103);
          v109 = -0.0;
          if (v77 != (_BYTE *)&dword_0 + 2)
            v109 = v93;
          v78 = v109 + v108;
          continue;
        }
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
    }
    while (v88);
  }

  *(_QWORD *)&self->_specifiedHeight.priority = v111;
  self->_layoutSize.width = v53;

}

- (TUILayout)layout
{
  return (TUILayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (NSArray)children
{
  return self->_children;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedWidth.value;
}

- (void)setSpecifiedWidth:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_specifiedWidth.value = a3;
  *(_QWORD *)&self->_specifiedWidth.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedWidth._flags;
}

- (void)setSpecifiedHeight:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_specifiedWidth._flags = a3;
  *(_QWORD *)&self->_specifiedHeight.min = v3;
}

- (double)computedWidth
{
  return self->_computedWidth;
}

- (void)setComputedWidth:(double)a3
{
  self->_computedWidth = a3;
}

- (double)computedHeight
{
  return self->_computedHeight;
}

- (void)setComputedHeight:(double)a3
{
  self->_computedHeight = a3;
}

- (double)containingMaxWidth
{
  return self->_containingMaxWidth;
}

- (void)setContainingMaxWidth:(double)a3
{
  self->_containingMaxWidth = a3;
}

- (TUIGuideLayoutController)guideLayoutController
{
  return self->_guideLayoutController;
}

- (void)setGuideLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_guideLayoutController, a3);
}

- (BOOL)prefersEqualWidth
{
  return self->_prefersEqualWidth;
}

- (void)setPrefersEqualWidth:(BOOL)a3
{
  self->_prefersEqualWidth = a3;
}

- (BOOL)useStrictEqualWidth
{
  return self->_useStrictEqualWidth;
}

- (void)setUseStrictEqualWidth:(BOOL)a3
{
  self->_useStrictEqualWidth = a3;
}

- (CGSize)layoutSize
{
  double v2;
  double width;
  CGSize result;

  v2 = *(double *)&self->_specifiedHeight.priority;
  width = self->_layoutSize.width;
  result.height = width;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLayoutController, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_layout);
}

@end
