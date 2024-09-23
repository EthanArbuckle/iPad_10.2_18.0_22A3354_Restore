@implementation TUIRenderModelSubviews

- (TUIRenderModelSubviews)initWithSubmodels:(id)a3
{
  id v4;
  TUIRenderModelSubviews *v5;
  uint64_t v6;
  NSArray *submodels;
  NSMutableDictionary *v8;
  NSArray *v9;
  NSMutableDictionary *v10;
  NSDictionary *v11;
  NSDictionary *identifierToContainedSubmodelMap;
  _QWORD v14[4];
  NSMutableDictionary *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIRenderModelSubviews;
  v5 = -[TUIRenderModelSubviews init](&v16, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_23E358));
    submodels = v5->_submodels;
    v5->_submodels = (NSArray *)v6;

    v8 = objc_opt_new(NSMutableDictionary);
    v9 = v5->_submodels;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2D898;
    v14[3] = &unk_23E380;
    v15 = v8;
    v10 = v8;
    -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v14);
    v11 = (NSDictionary *)-[NSMutableDictionary copy](v10, "copy");
    identifierToContainedSubmodelMap = v5->_identifierToContainedSubmodelMap;
    v5->_identifierToContainedSubmodelMap = v11;

  }
  return v5;
}

- (id)copyWithContainedSubmodels:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(self, v5)), "initWithSubmodels:", v4);

  return v6;
}

- (NSArray)containedSubmodels
{
  return self->_submodels;
}

- (NSArray)debugContainedSubmodels
{
  return self->_submodels;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_submodels;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v13 = *(_OWORD *)&a4->c;
        v14[0] = *(_OWORD *)&a4->a;
        v14[1] = v13;
        v14[2] = *(_OWORD *)&a4->tx;
        objc_msgSend(v12, "appendResourcesToCollector:transform:", v6, v14);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_submodels;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v17);
        v19 = *(_OWORD *)&a4->c;
        v20[0] = *(_OWORD *)&a4->a;
        v20[1] = v19;
        v20[2] = *(_OWORD *)&a4->tx;
        objc_msgSend(v18, "appendReferencesToCollector:transform:query:liveTransformResolver:", v10, v20, v11, v12);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

}

- (unint64_t)kind
{
  return 6;
}

- (id)configureSubviewsWithFactory:(id)a3 outsets:(UIEdgeInsets)a4 host:(id)a5 overrides:(id)a6 usedOverrides:(BOOL *)a7 UUID:(id)a8 uid:(id)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;
  double v32;
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
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  TUIRenderReferenceIdentifier *v61;
  void *v62;
  void *v63;
  unsigned int v64;
  void *v65;
  id v66;
  id v67;
  _QWORD *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  void *k;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  CGFloat top;
  CGFloat left;
  id v86;
  id v87;
  void *v88;
  char v89;
  id v90;
  id v91;
  NSMutableDictionary *v92;
  NSMutableArray *v93;
  NSArray *obj;
  uint64_t v95;
  id v96;
  id v97;
  double v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  char v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  _QWORD v113[4];
  id v114;
  CATransform3D v115;
  CATransform3D v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  id v123;
  id v124;
  _QWORD *v125;
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _OWORD v134[3];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];

  top = a4.top;
  left = a4.left;
  v90 = a3;
  v14 = a5;
  v15 = a6;
  v112 = a8;
  v111 = a9;
  v93 = objc_opt_new(NSMutableArray);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tui_hostedSubviewsMap"));
  v17 = objc_msgSend(v16, "mutableCopy");

  v92 = objc_opt_new(NSMutableDictionary);
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tui_hostingView"));
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = self->_submodels;
  v96 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v138, v144, 16);
  if (!v96)
  {
    v106 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v89 = 0;
  v18 = 0;
  v106 = 0;
  v95 = *(_QWORD *)v139;
  v86 = v17;
  v87 = v14;
  v91 = v15;
  do
  {
    for (i = 0; i != v96; i = (char *)i + 1)
    {
      if (*(_QWORD *)v139 != v95)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)i);
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
      v108 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "submodel"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "reuseIdentifier"));

      v103 = (void *)v21;
      v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v21));
      v104 = v24;
      v105 = objc_claimAutoreleasedReturnValue(+[NSIndexPath tui_indexPathForRow:inSection:](NSIndexPath, "tui_indexPathForRow:inSection:", v18, 0));
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reuseIdentifier"));
        v26 = objc_msgSend(v25, "isEqualToString:", v23);

        v24 = v104;
        v27 = (void *)v105;
        v102 = v104;
        if ((v26 & 1) != 0)
          goto LABEL_9;
      }
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "viewFactoryDequeueReusableSubviewWithReuseIdentifier:indexPath:host:", v23, v105, v14));

      v27 = (void *)v105;
      v102 = (void *)v28;
      if (v28)
      {
LABEL_9:
        v29 = +[TUILayoutAttributes newLayoutAttributesWithIndexPath:](TUILayoutAttributes, "newLayoutAttributesWithIndexPath:", v27);
        objc_msgSend(v108, "outsets");
        v98 = v30;
        v32 = v31;
        v109 = v33;
        v35 = v34;
        objc_msgSend(v108, "size");
        v37 = v36;
        objc_msgSend(v108, "size");
        v39 = v38;
        objc_msgSend(v108, "size");
        v41 = v40;
        objc_msgSend(v108, "size");
        v43 = v42;
        objc_msgSend(v108, "center");
        v45 = v44;
        v47 = v46;
        v136 = 0u;
        v137 = 0u;
        v135 = 0u;
        if (v108)
          objc_msgSend(v108, "transform");
        v48 = v37 + v32 + v35;
        v49 = v98 + *(double *)&v109 + v39;
        v50 = objc_msgSend(v108, "zIndex");
        objc_msgSend(v29, "setBounds:", 0.0, 0.0, v48, v49);
        objc_msgSend(v29, "setCenter:", v45 + v48 * 0.5 - (v32 + v41 * 0.5), v47 + v49 * 0.5 - (v98 + v43 * 0.5));
        v134[0] = v135;
        v134[1] = v136;
        v134[2] = v137;
        objc_msgSend(v29, "setTransform:", v134);
        v97 = v50;
        objc_msgSend(v29, "setZIndex:", v50);
        v107 = v29;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "submodel"));
        objc_msgSend(v107, "setRenderModel:", v51);

        objc_msgSend(v108, "alpha");
        objc_msgSend(v107, "setAlpha:");
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "refId"));
        objc_msgSend(v107, "setRefId:", v52);

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "refInstance"));
        objc_msgSend(v107, "setRefInstance:", v53);

        objc_msgSend(v107, "setOutsets:", v98, v32, *(double *)&v109, v35);
        v100 = v23;
        v101 = i;
        if (v15)
        {
          v99 = v18;
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "refId"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "refInstance"));
          v130 = 0u;
          v131 = 0u;
          v132 = 0u;
          v133 = 0u;
          v110 = v15;
          v56 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
          if (!v56)
            goto LABEL_23;
          v57 = v56;
          v58 = *(_QWORD *)v131;
          while (1)
          {
            for (j = 0; j != v57; j = (char *)j + 1)
            {
              if (*(_QWORD *)v131 != v58)
                objc_enumerationMutation(v110);
              v60 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)j);
              v61 = (TUIRenderReferenceIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "query"));
              if (-[TUIRenderReferenceIdentifier matchesUUID:uid:](v61, "matchesUUID:uid:", v112, v111))
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "query"));
                v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
                v64 = objc_msgSend(v62, "matchesRefId:refInstance:identifier:", v54, v55, v63);

                if (!v64)
                  continue;
                v61 = -[TUIRenderReferenceIdentifier initWithUUID:uid:refId:refInstance:]([TUIRenderReferenceIdentifier alloc], "initWithUUID:uid:refId:refInstance:", 0, 0, v54, v55);
                objc_msgSend(v60, "updateLayoutAttributes:forIdentifier:", v107, v61);
                v106 = 1;
              }

            }
            v57 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v130, v143, 16);
            if (!v57)
            {
LABEL_23:

              v17 = v86;
              v65 = v87;
              v18 = v99;
              goto LABEL_25;
            }
          }
        }
        v65 = v14;
LABEL_25:
        v127[0] = _NSConcreteStackBlock;
        v127[1] = 3221225472;
        v127[2] = sub_2E538;
        v127[3] = &unk_23D7D0;
        v66 = v102;
        v128 = v66;
        v67 = v107;
        v129 = v67;
        v68 = objc_retainBlock(v127);
        -[NSMutableArray addObject:](v93, "addObject:", v66);
        -[NSMutableDictionary setObject:forKey:](v92, "setObject:forKey:", v66, v103);
        if (v66 == v104)
        {
          objc_msgSend(v17, "removeObjectForKey:", v103);
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "layoutAttributes"));
          v70 = objc_msgSend(v69, "zIndex");
          LOBYTE(v70) = v70 != objc_msgSend(v67, "zIndex");

          v89 |= v70;
          ((void (*)(_QWORD *))v68[2])(v68);
          v14 = v65;
        }
        else
        {
          v121[0] = _NSConcreteStackBlock;
          v121[1] = 3221225472;
          v121[2] = sub_2E544;
          v121[3] = &unk_23E3A8;
          v122 = v88;
          v123 = v66;
          v126 = v97;
          v14 = v65;
          v124 = v65;
          v125 = v68;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v121);

        }
        v23 = v100;
        i = v101;
        v24 = v104;
        v27 = (void *)v105;
        v15 = v91;
      }
      ++v18;

    }
    v96 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v138, v144, 16);
  }
  while (v96);

  if ((v89 & 1) != 0)
  {
    obj = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tui_hostingView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subviews](obj, "subviews"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "sortedArrayUsingComparator:", &stru_23E3E8));

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v73 = v72;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v117, v142, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v118;
      do
      {
        for (k = 0; k != v75; k = (char *)k + 1)
        {
          if (*(_QWORD *)v118 != v76)
            objc_enumerationMutation(v73);
          -[NSArray bringSubviewToFront:](obj, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)k));
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v117, v142, 16);
      }
      while (v75);
    }

    goto LABEL_41;
  }
LABEL_42:
  objc_msgSend(v14, "setTui_hostedSubviewsMap:", v92);
  CATransform3DMakeTranslation(&v116, left, top, 0.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tui_hostingView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "layer"));
  v115 = v116;
  objc_msgSend(v79, "setSublayerTransform:", &v115);

  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_2E87C;
  v113[3] = &unk_23D938;
  v114 = v17;
  v80 = v17;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v113);
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "allValues"));
  objc_msgSend(v90, "viewFactoryReuseSubviews:host:", v81, v14);

  *a7 = v106 & 1;
  return v93;
}

- (id)_initialRenderModelForInsertedRenderModel:(id)a3
{
  return objc_msgSend(a3, "copyWithAlpha:", 0.0);
}

- (id)_finalRenderModelForDeletedRenderModel:(id)a3
{
  return objc_msgSend(a3, "copyWithAlpha:", 0.0);
}

- (id)computeDeletedFrom:(id)a3
{
  id v4;
  void *v5;
  NSArray *submodels;
  id v7;
  NSArray *v8;
  id v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSMutableArray *v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submodels"));
  submodels = self->_submodels;
  v7 = v5;
  v8 = submodels;
  v29 = v4;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v8, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v8;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v24));

        if (!v25)
        {
          if (!v20)
            v20 = objc_opt_new(NSMutableArray);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_finalRenderModelForDeletedRenderModel:", v23));
          -[NSMutableArray addObject:](v20, "addObject:", v26);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  v27 = -[NSMutableArray copy](v20, "copy");
  return v27;
}

- (id)computeInsertedFrom:(id)a3
{
  void *v4;
  NSArray *submodels;
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSArray *v16;
  id v17;
  id v18;
  NSMutableArray *v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  TUIRenderModelSubviews *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "submodels"));
  submodels = self->_submodels;
  v6 = v4;
  v7 = submodels;
  v29 = self;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v7, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v11);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v7;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v23));

        if (!v24)
        {
          if (!v19)
            v19 = objc_opt_new(NSMutableArray);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSubviews _initialRenderModelForInsertedRenderModel:](v29, "_initialRenderModelForInsertedRenderModel:", v22));
          -[NSMutableArray addObject:](v19, "addObject:", v25);

        }
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v26 = -[NSMutableArray copy](v19, "copy");
  return v26;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  TUIRenderModelSubviews *v4;
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  TUIRenderModelSubviews *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = self;
  if ((a3 & 1) == 0)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v4->_submodels, "count"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4->_submodels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "copyForInitialAppearanceWithFlags:", a3, (_QWORD)v14);
          objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = -[TUIRenderModelSubviews initWithSubmodels:]([TUIRenderModelSubviews alloc], "initWithSubmodels:", v5);
    -[TUIRenderModelSubviews setIdentifier:](v12, "setIdentifier:", v4->_identifier);
    -[TUIRenderModelSubviews setSize:](v12, "setSize:", v4->_size.width, v4->_size.height);

    return v12;
  }
  return v4;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  TUIRenderModelSubviews *v4;
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  TUIRenderModelSubviews *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = self;
  if ((a3 & 1) == 0)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v4->_submodels, "count"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4->_submodels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "copyForFinalAppearanceWithFlags:", a3, (_QWORD)v14);
          objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = -[TUIRenderModelSubviews initWithSubmodels:]([TUIRenderModelSubviews alloc], "initWithSubmodels:", v5);
    TUIRenderModelCopyProperties(v12, v4);

    return v12;
  }
  return v4;
}

- (id)copySubmodel:(id)a3 forInitialAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)copySubmodel:(id)a3 forFinalAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  TUIRenderUpdateArrayContainer *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[TUIRenderUpdateArrayContainer initWithCurrent:from:to:tracker:flags:]([TUIRenderUpdateArrayContainer alloc], "initWithCurrent:from:to:tracker:flags:", v12, v11, self, v10, a6);

  return v13;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  return objc_msgSend(a3, "newToContainerPlusDeletedWithInterests:changes:", a4, 0);
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  return objc_msgSend(a4, "newCurrentContainerPlusInserted", a3);
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  void *v13;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(self, v4);
    if (v6 == objc_opt_class(v5, v7))
    {
      v11 = v5;
    }
    else
    {
      v9 = objc_opt_class(TUIRenderModelSubviews, v8);
      v10 = TUIDynamicCast(v9, v5);
      v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    }
    v13 = v11;
    v12 = TUIRenderModelArrayContainingIsEqualToRenderModelArrayContaining(self, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSubviews identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSDictionary)identifierToContainedSubmodelMap
{
  return self->_identifierToContainedSubmodelMap;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodels, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifierToContainedSubmodelMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
