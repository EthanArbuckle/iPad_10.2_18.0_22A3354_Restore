@implementation TUIGridBoxLayout

- (TUIGridBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIGridBoxLayout *v5;
  TUIGridBoxLayout *v6;
  uint64_t v7;
  TUIGuideLayoutController *v8;
  TUIGuideLayoutController *guideLayoutController;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIGridBoxLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v11, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[TUILayout specifiedWidth](v5, "specifiedWidth");
    if ((v7 & 0x6000000000000) == 0x2000000000000)
      -[TUILayout setSpecifiedWidthComputeInherited:](v6, "setSpecifiedWidthComputeInherited:", 1);
    v8 = objc_alloc_init(TUIGuideLayoutController);
    guideLayoutController = v6->_guideLayoutController;
    v6->_guideLayoutController = v8;

  }
  return v6;
}

- (id)guideForLayout:(id)a3 spec:(id)a4
{
  return -[TUIGuideLayoutController guideForSpec:](self->_guideLayoutController, "guideForSpec:", a4);
}

- (id)guideLayoutControllerForLayout:(id)a3
{
  return self->_guideLayoutController;
}

- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4
{
  return 0;
}

- (void)computeLayout
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  TUIGuideLayoutController *guideLayoutController;
  void *v25;
  id v26;
  double v27;
  TUIGuideLayoutController *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  TUIGuideLayoutController *v35;
  void *v36;
  id v37;
  double v38;
  TUIGuideLayoutController *v39;
  void *v40;
  id v41;
  TUIGuideLayoutController *v42;
  void *v43;
  TUIGuideLayoutController *v44;
  void *v45;
  TUIGuideLayoutController *v46;
  void *v47;
  TUIGuideLayoutController *v48;
  void *v49;
  TUIGuideLayoutController *v50;
  void *v51;
  id v52;
  TUIGuideLayoutController *v53;
  void *v54;
  id v55;
  TUIGuideLayoutController *v56;
  void *v57;
  id v58;
  TUIGuideLayoutController *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  void *i;
  void *v66;
  uint64_t v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  TUIGuideLayoutController *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  unsigned int v90;
  double v91;
  double v92;
  void *v93;
  id v94;
  id v95;
  uint64_t v96;
  void *j;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  uint64_t v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  unint64_t v126;
  void *v127;
  void *v128;
  double v129;
  id obj;
  void *v131;
  void *v132;
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

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v5, "insets");
  v7 = v6;
  v9 = v8;
  v125 = v10;
  v12 = v11;

  v13 = fmax(v4 - v9 - v12, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v14, "spacing");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v18 = objc_msgSend(v17, "columns");

  if ((unint64_t)v18 <= 1)
    v19 = 1;
  else
    v19 = (unint64_t)v18;
  v20 = (v13 + v16) / (double)v19 - v16;
  v129 = v4;
  v126 = -[TUILayout computedLayoutDirection](self, "computedLayoutDirection");
  v21 = 0;
  if (v126 == 2)
  {
    v22 = v4 - v12;
    v23 = v22;
    do
    {
      guideLayoutController = self->_guideLayoutController;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec columnWithIndex:edge:](TUIGuideSpec, "columnWithIndex:edge:", v21, 0));
      v26 = -[TUIGuideLayoutController guideForSpec:withOffset:](guideLayoutController, "guideForSpec:withOffset:", v25, v23);

      v27 = v23 - v20;
      v28 = self->_guideLayoutController;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec columnWithIndex:edge:](TUIGuideSpec, "columnWithIndex:edge:", v21, 1));
      v30 = -[TUIGuideLayoutController guideForSpec:withOffset:](v28, "guideForSpec:withOffset:", v29, v27);

      v23 = v27 - v16;
      ++v21;
    }
    while (v19 != v21);
    v31 = 0.0;
    v32 = v9;
    v33 = v129;
  }
  else
  {
    v32 = v4 - v12;
    v34 = v9;
    do
    {
      v35 = self->_guideLayoutController;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec columnWithIndex:edge:](TUIGuideSpec, "columnWithIndex:edge:", v21, 0));
      v37 = -[TUIGuideLayoutController guideForSpec:withOffset:](v35, "guideForSpec:withOffset:", v36, v34);

      v38 = v20 + v34;
      v39 = self->_guideLayoutController;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec columnWithIndex:edge:](TUIGuideSpec, "columnWithIndex:edge:", v21, 1));
      v41 = -[TUIGuideLayoutController guideForSpec:withOffset:](v39, "guideForSpec:withOffset:", v40, v38);

      v34 = v16 + v38;
      ++v21;
    }
    while (v19 != v21);
    v33 = 0.0;
    v22 = v9;
    v31 = v129;
  }
  -[TUIGuideLayoutController reset](self->_guideLayoutController, "reset");
  v42 = self->_guideLayoutController;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec gridWithEdge:](TUIGuideSpec, "gridWithEdge:", 2));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](v42, "guideForSpec:", v43));

  v44 = self->_guideLayoutController;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec gridWithEdge:](TUIGuideSpec, "gridWithEdge:", 3));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](v44, "guideForSpec:", v45));

  v46 = self->_guideLayoutController;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 2));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](v46, "guideForSpec:", v47));

  v48 = self->_guideLayoutController;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 3));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](v48, "guideForSpec:", v49));

  v50 = self->_guideLayoutController;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec gridWithEdge:](TUIGuideSpec, "gridWithEdge:", 0));
  v52 = -[TUIGuideLayoutController guideForSpec:withOffset:](v50, "guideForSpec:withOffset:", v51, v33);

  v53 = self->_guideLayoutController;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec gridWithEdge:](TUIGuideSpec, "gridWithEdge:", 1));
  v55 = -[TUIGuideLayoutController guideForSpec:withOffset:](v53, "guideForSpec:withOffset:", v54, v31);

  v56 = self->_guideLayoutController;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 0));
  v58 = -[TUIGuideLayoutController guideForSpec:withOffset:](v56, "guideForSpec:withOffset:", v57, v22);

  v59 = self->_guideLayoutController;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 1));
  v61 = -[TUIGuideLayoutController guideForSpec:withOffset:](v59, "guideForSpec:withOffset:", v60, v32);

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(_QWORD *)v138 != v64)
          objc_enumerationMutation(obj);
        v66 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)i);
        v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveGuideLeading"));
        v68 = v13;
        if (v67)
        {
          v69 = (void *)v67;
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveGuideTrailing"));

          v68 = v13;
          if (v70)
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveGuideTrailing"));
            objc_msgSend(v71, "guideOffset");
            v73 = v72;
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveGuideLeading"));
            objc_msgSend(v74, "guideOffset");
            v68 = vabdd_f64(v73, v75);

          }
        }
        objc_msgSend(v66, "setContainingWidth:", v68);
        -[TUILayout containingHeight](self, "containingHeight");
        objc_msgSend(v66, "setContainingHeight:");
        objc_msgSend(v66, "setFlexedHeight:", NAN);
        objc_msgSend(v66, "validateLayout");
        v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveGuideTop"));
        v77 = (void *)v76;
        v78 = v132;
        if (v76)
          v78 = (void *)v76;
        v79 = v78;

        v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "effectiveGuideBottom"));
        v81 = (void *)v80;
        v82 = v131;
        if (v80)
          v82 = (void *)v80;
        v83 = v82;

        v84 = self->_guideLayoutController;
        v85 = objc_msgSend(v66, "computedHeight");
        -[TUIGuideLayoutController addEdgeFrom:to:length:](v84, "addEdgeFrom:to:length:", v79, v83, v85, v86);

      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v142, 16);
    }
    while (v63);
  }
  v87 = 0x7FC00000FF7FFFFFLL;

  v88 = 0x7FC00000FF7FFFFFLL;
  if (v7 > -3.40282347e38)
  {
    if (v7 < 3.40282347e38)
    {
      *(float *)&v89 = v7;
      v88 = v89 | 0x7FC0000000000000;
    }
    else
    {
      v88 = 0x7FC000007F7FFFFFLL;
    }
  }
  -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v128, v132, v88, 2143289344);
  if (v125 > -3.40282347e38)
  {
    if (v125 < 3.40282347e38)
    {
      *(float *)&v90 = v125;
      v87 = v90 | 0x7FC0000000000000;
    }
    else
    {
      v87 = 0x7FC000007F7FFFFFLL;
    }
  }
  -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v131, v127, v87, 2143289344);
  -[TUIGuideLayoutController solve](self->_guideLayoutController, "solve");
  -[TUIGuideLayoutController computeLength](self->_guideLayoutController, "computeLength");
  v92 = v91;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v95; j = (char *)j + 1)
      {
        if (*(_QWORD *)v134 != v96)
          objc_enumerationMutation(v93);
        v98 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v98, "computedTransformedSize");
        v100 = v99;
        v102 = v101;
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideLeading"));

        if (v103)
        {
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideLeading"));
          objc_msgSend(v104, "guideOffset");
          v106 = v105 - v100;
        }
        else
        {
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideTrailing"));

          v108 = v9;
          if (!v107)
            goto LABEL_46;
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideTrailing"));
          objc_msgSend(v104, "guideOffset");
          v106 = v109;
          v105 = v109 - v100;
        }
        if (v126 == 2)
          v108 = v106;
        else
          v108 = v105;

LABEL_46:
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideTop"));

        if (v110)
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideTop"));
          objc_msgSend(v111, "guideOffset");
          v113 = v112;
        }
        else
        {
          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideBottom"));

          v113 = v7;
          if (!v114)
            goto LABEL_51;
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideBottom"));
          objc_msgSend(v111, "guideOffset");
          v113 = v115 - v102;
        }

LABEL_51:
        v116 = objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideTop"));
        if (v116)
        {
          v117 = (void *)v116;
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideBottom"));

          v119 = v102;
          if (v118)
          {
            v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideBottom"));
            objc_msgSend(v120, "guideOffset");
            v122 = v121;
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "effectiveGuideTop"));
            objc_msgSend(v123, "guideOffset");
            v119 = fmax(v122 - v124, 0.0);

          }
        }
        else
        {
          v119 = v102;
        }
        if (v102 != v119)
        {
          objc_msgSend(v98, "setFlexedHeight:", v119);
          objc_msgSend(v98, "validateLayout");
        }
        objc_msgSend(v98, "setComputedOrigin:", v108, v113);
      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v133, v141, 16);
    }
    while (v95);
  }

  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v129, v92);
}

- (void)onChildInvalidate:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIGridBoxLayout;
  v3 = a3;
  -[TUILayout onChildInvalidate:](&v4, "onChildInvalidate:", v3);
  objc_msgSend(v3, "setFlexedHeight:", NAN, v4.receiver, v4.super_class);

}

- (void)onChildrenUpdated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIGridBoxLayout;
  -[TUILayout onChildrenUpdated](&v3, "onChildrenUpdated");
  -[TUILayout validateGuides](self, "validateGuides");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLayoutController, 0);
}

@end
