@implementation BKDisplayAnnotationContainedSubnodeRenderer

- (BOOL)shouldRenderWithSupernode
{
  return 0;
}

- (void)styleSheetDidChange
{
  void *v3;
  void *v4;
  CALayer *backgroundLayer;
  void *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v20.receiver = self;
  v20.super_class = (Class)BKDisplayAnnotationContainedSubnodeRenderer;
  -[BKDisplayAnnotationRenderer styleSheetDidChange](&v20, "styleSheetDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "styleSheet"));
  backgroundLayer = self->_backgroundLayer;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStringContent contentWithString:](BKDisplayAnnotationStringContent, "contentWithString:", &stru_1000F0F50));
  objc_msgSend(v4, "applyToLayer:forContent:", backgroundLayer, v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_subannotations;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "styleSheet", (_QWORD)v16));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subnodeStyleModifier"));
        objc_msgSend(v13, "setStyleModifier:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "renderer"));
        objc_msgSend(v15, "styleSheetDidChange");

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

}

- (void)regenerateLayerTree
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKDisplayAnnotationContainedSubnodeRenderer;
  -[BKDisplayAnnotationRenderer regenerateLayerTree](&v8, "regenerateLayerTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "namespaceNode"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100073B04;
  v6[3] = &unk_1000EBD10;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = v5;
  objc_msgSend(v4, "enumerateNodesWithOptions:usingBlock:", 1, v6);
  if (objc_msgSend(v5, "count"))
    -[BKDisplayAnnotationContainedSubnodeRenderer layoutAnnotationStack:](self, "layoutAnnotationStack:", v5);

}

- (CGSize)_getFrames:(CGRect *)a3 ofAnnotations:(id)a4 fixSuperlayer:(id)a5 scale:(double)a6
{
  id v9;
  id v10;
  double height;
  double width;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double *p_width;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  CGSize *p_size;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  CGSize result;

  v9 = a4;
  v10 = a5;
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v32;
    p_size = &a3->size;
    do
    {
      v17 = 0;
      p_width = &p_size[2 * v15].width;
      do
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v9);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "renderer"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));

        v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superlayer"));
        if (v22 != v10)
        {
          objc_msgSend(v21, "removeFromSuperlayer");
          objc_msgSend(v10, "addSublayer:", v21);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "renderer"));
        objc_msgSend(v23, "sizeLayerToFitAtScale:", a6);

        objc_msgSend(v21, "frame");
        *((_QWORD *)p_width - 2) = v26;
        *((_QWORD *)p_width - 1) = v27;
        *p_width = v24;
        p_width[1] = v25;
        p_width += 4;
        if (v24 > width)
          width = v24;
        height = height + v25;

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v15 += (uint64_t)v17;
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  v28 = width;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)layoutAnnotationStack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  BKDisplayAnnotationStyleSheet *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id *p_isa;
  id v38;
  void *j;
  void *v40;
  void *v41;
  id v42;
  BKDisplayAnnotationContainedSubnodeRenderer *v43;
  uint64_t v44;
  NSMutableDictionary *sectionTitleAnnotations;
  void *v46;
  void *v47;
  uint64_t *v48;
  double v49;
  double v50;
  double v51;
  id v52;
  id v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat MaxX;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double MaxY;
  double v62;
  double v63;
  double v64;
  id v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  _BOOL8 v74;
  uint64_t v76;
  id *v77;
  id v78;
  BKDisplayAnnotationStyleSheet *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  NSArray *v84;
  id v85;
  id v86;
  double v87;
  uint64_t v88;
  double y;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  NSArray *subannotations;
  NSArray *v95;
  uint64_t v96;
  CGFloat v97;
  CGFloat v98;
  id v99;
  BKDisplayAnnotationStyleSheet *v100;
  uint64_t *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  CGFloat v106;
  id v107;
  id v108;
  BKDisplayAnnotationContainedSubnodeRenderer *v109;
  double v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v4 = a3;
  v104 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer annotation](self, "annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "annotationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootLayer"));
  v108 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transformLayer"));
  v103 = v6;
  objc_msgSend(v6, "rasterizationScale");
  v9 = v8;
  v102 = v7;
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v106 = v12;
  v100 = v13;
  v15 = v14;
  v109 = self;
  v105 = (id)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationRenderer layer](self, "layer"));
  objc_msgSend(v105, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", objc_msgSend(v4, "count")));
  v111 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v25 = v4;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v121 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)i);
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "section"));
        if (v31)
          v32 = (__CFString *)v31;
        else
          v32 = &stru_1000F0F50;
        objc_msgSend(v24, "addObject:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKey:", v32));
        if (!v33)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v111, "setObject:forKey:", v33, v32);
        }
        objc_msgSend(v33, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
    }
    while (v27);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v35 = v24;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
  p_isa = (id *)&v109->super.super.isa;
  v107 = v35;
  if (v36)
  {
    v38 = v36;
    v110 = *(double *)v117;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v117 != *(_QWORD *)&v110)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v40, "length"))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[5], "objectForKey:", v40));
          if (!v41)
          {
            v42 = v25;
            v43 = v109;
            if (!v109->_sectionTitleAnnotations)
            {
              v44 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              sectionTitleAnnotations = v109->_sectionTitleAnnotations;
              v109->_sectionTitleAnnotations = (NSMutableDictionary *)v44;

            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation annotationWithString:](BKDisplayAnnotation, "annotationWithString:", v40));
            objc_msgSend(v41, "setAnnotationController:", v108);
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle emphasizedStyle](BKDisplayAnnotationStyle, "emphasizedStyle"));
            objc_msgSend(v41, "setStyleModifier:", v46);

            -[NSMutableDictionary setObject:forKey:](v43->_sectionTitleAnnotations, "setObject:forKey:", v41, v40);
            v25 = v42;
            v35 = v107;
          }
          objc_msgSend(v34, "addObject:", v41);

          p_isa = (id *)&v109->super.super.isa;
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKey:", v40));
        objc_msgSend(v34, "addObjectsFromArray:", v47);

      }
      v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
    }
    while (v38);
  }

  objc_msgSend(v34, "count");
  v101 = &v96;
  v48 = &v96 - 4 * __chkstk_darwin();
  v99 = v9;
  objc_msgSend(p_isa, "_getFrames:ofAnnotations:fixSuperlayer:scale:", v48, v34, v105, *(double *)&v9);
  v110 = v49;
  v51 = v50;
  v52 = v104;
  v53 = objc_msgSend(v104, "subnodeScreenEdgeTreatment");
  if (v53 == (id)2)
  {
    v127.origin.x = v11;
    v98 = v11;
    v54 = v106;
    v127.origin.y = v106;
    v55 = *(double *)&v100;
    *(_QWORD *)&v127.size.width = v100;
    v127.size.height = v15;
    MaxX = CGRectGetMaxX(v127);
    v97 = v15;
    v57 = v23;
    v58 = MaxX;
    v128.origin.x = v17;
    v128.origin.y = v19;
    v128.size.width = v21;
    v128.size.height = v57;
    v59 = v58 - (v110 + CGRectGetMaxX(v128));
    if (v59 >= 0.0)
      v59 = -0.0;
    v60 = v21 + v59;
    v129.size.height = v97;
    v129.origin.x = v98;
    v129.origin.y = v54;
    v129.size.width = v55;
    MaxY = CGRectGetMaxY(v129);
    v130.origin.x = v17;
    v130.origin.y = v19;
    v130.size.width = v21;
    v130.size.height = v57;
    v62 = MaxY - (v51 + CGRectGetMinY(v130));
    v63 = 0.0;
    if (v62 >= 0.0)
      v64 = 0.0;
    else
      v64 = v62 + 0.0;
  }
  else
  {
    v65 = v53;
    v131.origin.x = v17;
    v131.origin.y = v19;
    v131.size.width = v21;
    v131.size.height = v23;
    v66 = CGRectGetMaxX(v131);
    v132.size.height = v15;
    v67 = v19;
    v68 = v23;
    v69 = v110;
    v70 = v110 + v66;
    v132.origin.x = v11;
    v132.origin.y = v106;
    *(_QWORD *)&v132.size.width = v100;
    v71 = CGRectGetMaxX(v132);
    v72 = v17;
    v73 = v71;
    v133.origin.x = v72;
    v133.origin.y = v67;
    v133.size.width = v21;
    v133.size.height = v68;
    v74 = CGRectGetMinX(v133) - v69 >= 0.0;
    if (v65 != (id)1)
      v74 = (_BOOL8)v65;
    v76 = v70 > v73 && v65 == 0 || v74;
    v64 = 0.0;
    if (v76 == 1)
      v60 = 0.0;
    else
      v60 = v21;
    if (v76 == 1)
      v63 = 1.0;
    else
      v63 = 0.0;
    objc_msgSend(v52, "setSubnodeScreenEdgeTreatment:");
  }
  v77 = p_isa + 4;
  v78 = p_isa[4];
  v79 = objc_alloc_init(BKDisplayAnnotationStyleSheet);
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle rectangleStyle](BKDisplayAnnotationStyle, "rectangleStyle"));
  -[BKDisplayAnnotationStyleSheet setBaseStyle:](v79, "setBaseStyle:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle textBackgroundStyle](BKDisplayAnnotationStyle, "textBackgroundStyle"));
  -[BKDisplayAnnotationStyleSheet setStyleModifier:](v79, "setStyleModifier:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationShapeContent contentWithSize:](BKDisplayAnnotationShapeContent, "contentWithSize:", v110, v51));
  if (!v78)
    v78 = -[BKDisplayAnnotationStyleSheet newLayerForContent:scale:](v79, "newLayerForContent:scale:", v82, *(double *)&v99);
  v99 = v82;
  v100 = v79;
  -[BKDisplayAnnotationStyleSheet applyToLayer:forContent:](v79, "applyToLayer:forContent:", v78, v82);
  v83 = 0.0;
  objc_msgSend(v78, "setAnchorPoint:", v63, 0.0);
  objc_msgSend(v78, "setPosition:", v60, v64);
  objc_msgSend(v105, "insertSublayer:atIndex:", v78, 0);
  objc_storeStrong(v77, v78);
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v84 = v34;
  v85 = -[NSArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
  if (v85)
  {
    v86 = v85;
    v87 = 0.0;
    v88 = *(_QWORD *)v113;
    y = CGPointZero.y;
    *(_QWORD *)&v106 = v48 + 2;
    do
    {
      v90 = 0;
      v110 = v87;
      v91 = *(_QWORD *)&v106 + 32 * *(_QWORD *)&v87;
      do
      {
        if (*(_QWORD *)v113 != v88)
          objc_enumerationMutation(v84);
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v90), "renderer"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "layer"));

        objc_msgSend(v78, "addSublayer:", v93);
        objc_msgSend(v93, "setAnchorPoint:", CGPointZero.x, y);
        objc_msgSend(v93, "setPosition:", 0.0, v83);
        v134 = *(CGRect *)(v91 - 16);
        v91 += 32;
        v83 = v83 + CGRectGetMaxY(v134);

        v90 = (char *)v90 + 1;
      }
      while (v86 != v90);
      *(_QWORD *)&v87 = (char *)v90 + *(_QWORD *)&v110;
      v86 = -[NSArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
    }
    while (v86);
  }

  subannotations = v109->_subannotations;
  v109->_subannotations = v84;
  v95 = v84;

}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (NSMutableDictionary)sectionTitleAnnotations
{
  return self->_sectionTitleAnnotations;
}

- (void)setSectionTitleAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitleAnnotations, a3);
}

- (NSArray)subannotations
{
  return self->_subannotations;
}

- (void)setSubannotations:(id)a3
{
  objc_storeStrong((id *)&self->_subannotations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subannotations, 0);
  objc_storeStrong((id *)&self->_sectionTitleAnnotations, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

@end
