@implementation UIKBTree

- (BOOL)isSplit
{
  void *v2;
  char v3;

  -[UIKBTree name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("-split"));

  return v3;
}

- (BOOL)isLeafType
{
  return (self->type < 0xEu) & (0x3700u >> self->type);
}

- (void)elaborateLayoutWithSize:(CGSize)a3 scale:(double)a4 origin:(CGPoint)a5
{
  double y;
  double x;
  double height;
  double width;
  UIKBTree *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  char v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *context;
  void *v108;
  uint64_t v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  uint64_t v115;
  int v116;
  double v117;
  uint64_t v118;
  double v119;
  double v120;
  _BOOL4 v121;
  _BOOL4 v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  UIKBTree *v127;
  void *v128;
  unint64_t v129;
  void *v130;
  void *v131;
  int v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  void *v137;
  void *v138;
  _BYTE v139[128];
  uint64_t v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  y = a5.y;
  x = a5.x;
  height = a3.height;
  width = a3.width;
  v10 = self;
  v140 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x186DC9484](self, a2);
  if (-[UIKBTree type](v10, "type") == 2)
  {
    v11 = width != 1.0;
    if (height != 1.0)
      v11 = 1;
    v121 = v11;
    v12 = x != *MEMORY[0x1E0C9D538];
    if (y != *(double *)(MEMORY[0x1E0C9D538] + 8))
      v12 = 1;
    v122 = v12;
    v127 = v10;
    v119 = x;
    v120 = y;
    v117 = height;
    if (!-[UIKBTree isSplit](v10, "isSplit"))
      goto LABEL_10;
    if (-[UIKBTree isGenerated](v10, "isGenerated"))
      goto LABEL_10;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferencesActions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rivenSizeFactor:", 1.0);
    v16 = v15;

    if (v16 <= 1.0)
    {
LABEL_10:
      v132 = 0;
      v113 = height;
      v114 = width;
    }
    else
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preferencesActions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rivenSizeFactor:", 1.0);
      v114 = v19;
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferencesActions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rivenSizeFactor:", 1.0);
      v113 = v22;

      v10 = v127;
      v132 = 1;
    }
    -[UIKBTree originalFrame](v10, "originalFrame");
    v24 = v23;
    +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    -[UIKBTree subtrees](v10, "subtrees");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v133, v139, 16);
    if (v27)
    {
      v28 = v27;
      v29 = (width - v114) * v24;
      v30 = *MEMORY[0x1E0C9D648];
      v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v32 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v115 = *(_QWORD *)v134;
      v116 = v121 | v132;
      v131 = v25;
      v108 = v26;
      do
      {
        v34 = 0;
        v109 = v28;
        do
        {
          if (*(_QWORD *)v134 != v115)
            objc_enumerationMutation(v26);
          v118 = v34;
          v35 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v34);
          if (objc_msgSend(v35, "type") != 3)
          {
            v58 = v118;
            goto LABEL_73;
          }
          objc_msgSend(v35, "keySet");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "subtrees");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "geometrySet:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "subtrees");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "attributeSet:", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "subtrees");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = objc_msgSend(v37, "count");
          v126 = v39;
          if (v42 == objc_msgSend(v39, "count"))
          {
            objc_msgSend(v35, "shape");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "originalShape");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v43, "originalShape");
              v45 = objc_claimAutoreleasedReturnValue();

              v43 = (void *)v45;
            }
            objc_msgSend(v35, "originalFrame");
            v143.origin.x = v30;
            v143.origin.y = v31;
            v143.size.width = v33;
            v143.size.height = v32;
            v142 = CGRectUnion(v141, v143);
            v46 = v142.origin.x;
            v47 = v142.origin.y;
            v33 = v142.size.width;
            v48 = v142.size.height;
            objc_msgSend(v35, "geometrySet:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "listShapes");
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v111 = v47;
            v112 = v46;
            if (!v116)
              goto LABEL_39;
            objc_msgSend(v25, "shapeByScalingShape:factor:", v43, v114, v113);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "shapesByScalingShapes:factor:", v50, v114, v113);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v132)
            {
              objc_msgSend(v35, "frame");
              if (v53 <= v33 * 0.5)
                v54 = 0.0;
              else
                v54 = v33;
              v55 = v54 > 0.0 || v122;
              if (v54 <= 0.0)
                v56 = v119;
              else
                v56 = v29;
              if (v54 <= 0.0)
                v57 = v120;
              else
                v57 = 0.0;
              if ((v55 & 1) == 0)
              {
LABEL_35:
                v43 = v51;
                v50 = v52;
LABEL_39:
                v110 = v43;
                objc_msgSend(v35, "setShape:", v43);
                if (objc_msgSend(v37, "count"))
                {
                  v62 = 0;
                  v124 = v41;
                  v125 = v37;
                  v123 = v50;
                  do
                  {
                    objc_msgSend(v126, "objectAtIndex:", v62);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "objectAtIndex:", v62);
                    v64 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "objectAtIndex:", v62);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v129 = v62;
                    if (objc_msgSend(v41, "count") <= v62)
                    {
                      v66 = 0;
                    }
                    else
                    {
                      objc_msgSend(v41, "objectAtIndex:", v62);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v63, "geometriesList");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();

                    v130 = v65;
                    if (v67)
                    {
                      objc_msgSend(v65, "componentName");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      v69 = -[UIKBTree _keyCountOnNamedRow:](v10, "_keyCountOnNamedRow:", v68);

                      objc_msgSend(v63, "geometriesList");
                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v70, "subtrees");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v121)
                      {
                        objc_msgSend(v25, "shapesByScalingShapes:factor:", v71, width, v117);
                        v72 = objc_claimAutoreleasedReturnValue();

                        v71 = (void *)v72;
                      }
                      objc_msgSend(v25, "shapesByElaboratingShapes:insideShape:count:", v71, v64, v69);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "activeShapesFromOutputShapes:inputShapes:inRTL:", v73, v71, 0);
                      v74 = (void *)objc_claimAutoreleasedReturnValue();

                      v65 = v130;
                    }
                    else
                    {
                      objc_msgSend(v63, "subtrees");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v75 && (v75, v116))
                      {
                        objc_msgSend(v63, "subtrees");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "shapesByScalingShapes:factor:", v76, v114, v113);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        objc_msgSend(v63, "subtrees");
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                    }
                    v128 = (void *)v64;
                    if (v122)
                    {
                      objc_msgSend(v25, "shapesByRepositioningShapes:withOffset:", v74, v119, v120);
                      v77 = objc_claimAutoreleasedReturnValue();

                      v74 = (void *)v77;
                    }
                    objc_msgSend(v63, "properties");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "setProperties:", v78);

                    objc_msgSend(v65, "subtrees");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v79, "count"))
                    {
                      v80 = 0;
                      do
                      {
                        if (objc_msgSend(v74, "count") <= v80)
                          break;
                        objc_msgSend(v79, "objectAtIndex:", v80);
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v81, "setState:", 0);
                        objc_msgSend(v81, "setVisible:", 1);
                        objc_msgSend(v81, "setClipCorners:", 0);
                        objc_msgSend(v66, "subtrees");
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v82, "count") <= v80)
                        {
                          objc_msgSend(v81, "setCache:", 0);
                        }
                        else
                        {
                          objc_msgSend(v66, "subtrees");
                          v83 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v83, "objectAtIndex:", v80);
                          v84 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v81, "setCache:", v84);

                        }
                        objc_msgSend(v63, "subtrees");
                        v85 = objc_claimAutoreleasedReturnValue();
                        if (v85
                          && (v86 = (void *)v85,
                              v87 = objc_msgSend(v81, "BOOLForProperty:", CFSTR("ignore-hand-bias")),
                              v86,
                              v87))
                        {
                          objc_msgSend(v63, "subtrees");
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v88, "objectAtIndex:", v80);
                          v89 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v89, "frame");
                          v91 = v90;
                          v93 = v92;
                          v95 = v94;
                          -[UIKBTree frame](v10, "frame");
                          v97 = v96;
                          objc_msgSend(v89, "setFrame:", v91, v93);
                          objc_msgSend(v89, "setPaddedFrame:", v91, v93, v97, v95);
                        }
                        else
                        {
                          objc_msgSend(v74, "objectAtIndex:", v80);
                          v98 = (void *)objc_claimAutoreleasedReturnValue();
                          v89 = v98;
                          if (v132)
                          {
                            objc_msgSend(v98, "frame");
                            v100 = v99 <= v33 * 0.5 ? 0.0 : v33;
                            if (v100 > 0.0)
                            {
                              v137 = v89;
                              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
                              v101 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v131, "shapesByRepositioningShapes:withOffset:", v101, v29, 0.0);
                              v102 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v102, "firstObject");
                              v103 = objc_claimAutoreleasedReturnValue();

                              v89 = (void *)v103;
                              v10 = v127;
                            }
                          }
                        }
                        objc_msgSend(v81, "setShape:", v89);

                        ++v80;
                      }
                      while (objc_msgSend(v79, "count") > v80);
                    }

                    v62 = v129 + 1;
                    v37 = v125;
                    v25 = v131;
                    v50 = v123;
                    v41 = v124;
                  }
                  while (objc_msgSend(v125, "count") > v129 + 1);
                }

                v26 = v108;
                v28 = v109;
                v31 = v111;
                v30 = v112;
                v32 = v48;
                goto LABEL_72;
              }
            }
            else
            {
              v56 = v119;
              v57 = v120;
              if (!v122)
                goto LABEL_35;
            }
            v138 = v51;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v138, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "shapesByRepositioningShapes:withOffset:", v59, v56, v57);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "firstObject");
            v61 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v61;
            v10 = v127;
            objc_msgSend(v25, "shapesByRepositioningShapes:withOffset:", v52, v56, v57);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
LABEL_72:
          v58 = v118;

LABEL_73:
          v34 = v58 + 1;
        }
        while (v34 != v28);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v133, v139, 16);
      }
      while (v28);
    }

    if (((v121 || v122) | v132) == 1)
    {
      -[UIKBTree setObject:forProperty:](v10, "setObject:forProperty:", 0, CFSTR("KBunionFrame"));
      -[UIKBTree setObject:forProperty:](v10, "setObject:forProperty:", 0, CFSTR("KBunionPaddedFrame"));
      -[UIKBTree setResizingOffset:](v10, "setResizingOffset:", 0.0);
    }
    if ((-[UIKBTree visualStyling](v10, "visualStyling") & 0x3F) == 0x17
      || (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
          v104 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v104, "textInputTraits"),
          v105 = (void *)objc_claimAutoreleasedReturnValue(),
          v106 = objc_msgSend(v105, "keyboardType"),
          v105,
          v104,
          v106 != 12))
    {
      -[UIKBTree updateFlickKeycapOnKeys](v10, "updateFlickKeycapOnKeys");
    }

  }
  objc_autoreleasePoolPop(context);
}

- (void)setState:(int)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("state"));

}

- (BOOL)setObject:(id)a3 forProperty:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKBTree.m"), 267, CFSTR("property passed in is nil"));

  }
  -[UIKBTree properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, v8);
  else
    objc_msgSend(v9, "removeObjectForKey:", v8);

  return 1;
}

- (BOOL)BOOLForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[UIKBTree properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "intValue") == 32)
    {
      v7 = 1;
    }
    else
    {
      -[UIKBTree cache](self, "cache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "intValue") == 32;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setShape:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->properties, "setObject:forKey:", a3, CFSTR("KBshape"));
}

- (void)setClipCorners:(unint64_t)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBclipCorners"));

}

- (void)setVisible:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", 0, CFSTR("visible"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("visible"));

  }
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->cache, a3);
}

- (BOOL)renderKeyInKeyplane:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char v19;
  void *v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UIKBTree _renderAsStringKey](self, "_renderAsStringKey"))
  {
    -[UIKBTree frame](self, "frame");
    if (CGRectIsEmpty(v37))
    {
      v5 = 1;
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v4, "subtrees");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v31;
        v25 = v6;
        v23 = *(_QWORD *)v31;
LABEL_7:
        v10 = 0;
        v24 = v8;
        while (1)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          if (objc_msgSend(v11, "type") == 3)
          {
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            objc_msgSend(v11, "keySet");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "subtrees");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v27;
              while (2)
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v27 != v16)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "subtrees");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "containsObject:", self);

                  if ((v19 & 1) != 0)
                  {

                    v5 = 1;
                    v6 = v25;
                    goto LABEL_25;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
                if (v15)
                  continue;
                break;
              }
            }

            objc_msgSend(v11, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("split-"));

            v8 = v24;
            v6 = v25;
            v9 = v23;
            if (!v21)
              break;
          }
          if (++v10 == v8)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
            v5 = 0;
            if (v8)
              goto LABEL_7;
            goto LABEL_25;
          }
        }
      }
      v5 = 0;
LABEL_25:

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSMutableArray)subtrees
{
  return self->subtrees;
}

- (id)keySet
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type") == 4)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_renderAsStringKey
{
  void *v3;
  unsigned int v5;

  -[UIKBTree localizationKey](self, "localizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 0;
  }
  if (self->type == 12)
    return 0;
  if (-[UIKBTree supportsSupplementalDisplayString](self, "supportsSupplementalDisplayString"))
    return 1;
  v5 = -[UIKBTree displayType](self, "displayType");
  if (v5 <= 0x23)
    return (0xC604B8001uLL >> v5) & 1;
  else
    return 0;
}

- (id)localizationKey
{
  return -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("KBlocalizationKey"));
}

- (int)interactionType
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("KBinteractionType"));
}

- (int)displayType
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("KBdisplayType"));
}

- (int64_t)intForProperty:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!a3)
    return 0;
  -[UIKBTree numberForProperty:](self, "numberForProperty:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (id)objectForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[UIKBTree cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[UIKBTree properties](self, "properties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)properties
{
  void *v2;
  NSMutableDictionary *v3;

  if (self->effectiveLayoutTag && self->type == 12)
  {
    -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "properties");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = self->properties;
  }
  return v3;
}

- (NSMutableDictionary)cache
{
  return self->cache;
}

- (void)setOverrideDisplayString:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBoverrideDisplayString"));
}

- (void)setFlickDirection:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if (a3 == -3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBflickDirection"));

}

- (BOOL)disabled
{
  return -[UIKBTree state](self, "state") == 1;
}

- (id)parentKey
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBparentKey"));
}

- (BOOL)ghost
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("KBghost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[UIKBTree properties](self, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("KBghost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (BOOL)visible
{
  void *v2;
  void *v3;
  char v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("visible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (CGRect)_keyplaneFrame
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL IsNull;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v30 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        IsNull = CGRectIsNull(v31);
        objc_msgSend(v11, "frame");
        if (IsNull)
        {
          height = v16;
          width = v15;
          y = v14;
          x = v13;
        }
        else if (!CGRectIsEmpty(*(CGRect *)&v13))
        {
          objc_msgSend(v11, "frame");
          v35.origin.x = v17;
          v35.origin.y = v18;
          v35.size.width = v19;
          v35.size.height = v20;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (-[UIKBTree type](self, "type") == 2)
  {
    -[UIKBTree _keyplaneFrame](self, "_keyplaneFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[UIKBTree shape](self, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "frame");
      v4 = v12;
      v6 = v13;
      v8 = v14;
      v10 = v15;
    }
    else
    {
      v4 = *MEMORY[0x1E0C9D648];
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (int)type
{
  BOOL v2;
  void *v4;
  int v5;

  if (self->effectiveLayoutTag)
    v2 = self->type == 12;
  else
    v2 = 0;
  if (!v2)
    return self->type;
  -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  return v5;
}

- (id)shape
{
  return (id)-[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", CFSTR("KBshape"));
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->properties, a3);
}

- (id)geometriesList
{
  void *v2;
  void *v3;

  -[UIKBTree properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("KBgeometriesList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)listShapes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[UIKBTree subtrees](self, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "shape");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)attributeSet:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  UIKBTree *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 6)
        {
          v11 = v10;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (!v3)
    return 0;
  v11 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 6);
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[UIKBTree name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-AttributeSet"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setName:](v11, "setName:", v14);

  -[UIKBTree subtrees](self, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);
LABEL_12:

  return v11;
}

- (void)setResizingOffset:(double)a3
{
  void *v4;
  id v5;

  -[UIKBTree cache](self, "cache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("resizingOffset"));

}

- ($5C396DA91E87D63640AC871340DC94CC)visualStylingForScreenTraits:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  int64_t v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;

  v4 = a3;
  -[UIKBTree name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "rangeOfString:", CFSTR("Portrait")) == 0x7FFFFFFFFFFFFFFFLL) << 6;

  -[UIKBTree name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSuffix:", CFSTR("-split"));

  if (v8)
    v9 = 128;
  else
    v9 = v6;
  if (-[UIKBTree visualStyle](self, "visualStyle") - 1 < 5
    || (-[UIKBTree name](self, "name"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("iPhone")),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 0;
  }
  else if (-[UIKBTree visualStyle](self, "visualStyle") == 301)
  {
    v12 = 3;
  }
  else if (-[UIKBTree visualStyle](self, "visualStyle") == 201)
  {
    v12 = 2;
  }
  else
  {
    v12 = 1;
  }
  if (!v4)
  {
    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v13, objc_msgSend(v14, "interfaceOrientation"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, v12, v8);
  v16 = -[UIKBTree nativeIdiom](self, "nativeIdiom");
  if (v16 != -1)
    v15 = v16;
  v17 = v15 & 0x3F | v9;
  v18 = -[UIKBTree visualStyle](self, "visualStyle");
  switch(v18)
  {
    case 'e':
      v17 = (v17 | 0x260200) - 1769472;
      break;
    case 'f':
    case 'h':
    case 'j':
LABEL_15:
      v17 |= 0x200u;
      break;
    case 'g':
LABEL_19:
      v17 |= 0x270200u;
      break;
    case 'i':
      if ((v15 & 0x3F) != 0)
        v19 = 256;
      else
        v19 = 512;
      goto LABEL_26;
    case 'k':
      break;
    case 'l':
    case 'm':
LABEL_18:
      v19 = 2490880;
LABEL_26:
      v17 |= v19;
      break;
    default:
      switch(v18)
      {
        case 1:
          goto LABEL_15;
        case 2:
          goto LABEL_19;
        case 3:
        case 5:
          v17 |= 0x100u;
          break;
        case 4:
          goto LABEL_18;
        default:
          goto LABEL_27;
      }
      break;
  }
LABEL_27:
  -[UIKBTree name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "hasPrefix:", CFSTR("Dynamic")))
  {
    v21 = -[UIKBTree rendering](self, "rendering");

    if (v21)
    {
      v17 = (unsigned __int16)v17 | (-[UIKBTree rendering](self, "rendering") << 16);
      LOBYTE(v21) = 1;
    }
  }
  else
  {

    LOBYTE(v21) = 0;
  }
  -[UIKBTree keys](self, "keys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "rendering"))
  {
    v17 = (unsigned __int16)v17 | (objc_msgSend(v23, "rendering") << 16);
  }
  else if ((v21 & 1) == 0 && objc_msgSend(v23, "displayType") == 20)
  {
    v17 = (unsigned __int16)v17 | 0x1B0000;
  }

  return ($5C396DA91E87D63640AC871340DC94CC)v17;
}

- (NSString)name
{
  void *v2;
  NSString *v3;

  if (self->effectiveLayoutTag && self->type == 12)
  {
    -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = self->name;
  }
  return v3;
}

- (int)visualStyle
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("KBvisualStyle"));
}

- (id)keys
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("keys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree _addKeylayoutKeys:](self, "_addKeylayoutKeys:", v4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[UIKBTree subtrees](self, "subtrees", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "_addKeylayoutKeys:", v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    -[UIKBTree cache](self, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v4, CFSTR("keys"));

  }
  v11 = v4;

  return v11;
}

- (int64_t)nativeIdiom
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("nativeIdiom"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (int)rendering
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("rendering"));
}

- (void)_addKeylayoutKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && -[UIKBTree type](self, "type") == 3)
  {
    if (-[UIKBTree dynamicLayout](self, "dynamicLayout"))
    {
      -[UIKBTree rowSet](self, "rowSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subtrees");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[UIKBTree currentKeyboardType](self, "currentKeyboardType"))
      {
        -[UIKBTree orderedRowsForType:](self, "orderedRowsForType:", -[UIKBTree currentKeyboardType](self, "currentKeyboardType"));
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
      -[UIKBTree _keysForDynamicRows:](self, "_keysForDynamicRows:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v8);

    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[UIKBTree keySet](self, "keySet", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subtrees");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "subtrees");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObjectsFromArray:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
  }

}

- (UIKBTree)initWithType:(int)a3 withName:(id)a4 withProperties:(id)a5 withSubtrees:(id)a6 withCache:(id)a7
{
  NSString *v12;
  NSMutableDictionary *v13;
  NSMutableArray *v14;
  NSMutableDictionary *v15;
  UIKBTree *v16;
  NSString *name;
  NSString *v18;
  NSMutableDictionary *properties;
  NSMutableDictionary *v20;
  NSMutableArray *subtrees;
  NSMutableArray *v22;
  NSMutableDictionary *cache;
  objc_super v25;

  v12 = (NSString *)a4;
  v13 = (NSMutableDictionary *)a5;
  v14 = (NSMutableArray *)a6;
  v15 = (NSMutableDictionary *)a7;
  v25.receiver = self;
  v25.super_class = (Class)UIKBTree;
  v16 = -[UIKBTree init](&v25, sel_init);
  v16->type = a3;
  name = v16->name;
  v16->name = v12;
  v18 = v12;

  properties = v16->properties;
  v16->properties = v13;
  v20 = v13;

  subtrees = v16->subtrees;
  v16->subtrees = v14;
  v22 = v14;

  cache = v16->cache;
  v16->cache = v15;

  if (a3 == 12)
    -[UIKBTree setLayoutTag:](v16, "setLayoutTag:", CFSTR("Default"));
  return v16;
}

- (int)state
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("state"));
}

- (BOOL)dynamicLayout
{
  void *v2;
  char v3;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBdynamic"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)cachedKeysByKeyName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIKBTree cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)resizingOffset
{
  void *v2;
  float v3;
  double v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("resizingOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (BOOL)preventPaddle
{
  void *v2;
  char v3;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBpreventPaddle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)subtreeWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    tailComponentOfName(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[UIKBTree subtrees](self, "subtrees", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          tailComponentOfName(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) != 0)
          {
            v5 = v11;

            goto LABEL_12;
          }

        }
        v5 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

+ (BOOL)shouldSkipCacheString:(id)a3
{
  return a3 == CFSTR("keys")
      || a3 == CFSTR("geometries")
      || a3 == CFSTR("keyAttributes")
      || a3 == CFSTR("layoutName")
      || a3 == CFSTR("isLetters")
      || a3 == CFSTR("isScaled")
      || a3 == CFSTR("isGenerated")
      || a3 == CFSTR("resizingOffset")
      || a3 == CFSTR("isKanaPlane");
}

- (id)representedString
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("KBoverrideDisplayString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[UIKBTree _variantType](self, "_variantType") == 5)
  {
    if ((unint64_t)objc_msgSend(v3, "length") < 2)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringToIndex:", 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v4;
  }
  else
  {
    -[UIKBTree fullRepresentedString](self, "fullRepresentedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKBTree interactionType](self, "interactionType") == 16 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "_firstGrapheme");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v7 = v6;

  }
  return v7;
}

- (id)fullRepresentedString
{
  void *v2;
  void *v3;

  -[UIKBTree properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("KBrepresentedString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)paddedFrame
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[UIKBTree shape](self, "shape");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "paddedFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isExemptFromInputManagerLayout
{
  unsigned int v4;

  if (-[UIKBTree displayType](self, "displayType") == 49)
    return 1;
  v4 = -[UIKBTree interactionType](self, "interactionType");
  if (v4 <= 0x11)
    return (0x7A9u >> v4) & 1;
  else
    return 1;
}

- (id)displayString
{
  return -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("KBdisplayString"));
}

- (id)overrideDisplayString
{
  void *v3;
  id v4;
  void *v5;

  -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("KBoverrideDisplayString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") >= 2 && -[UIKBTree _variantType](self, "_variantType") == 5)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)secondaryDisplayStrings
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBsecondaryDisplayStrings"));
}

- (int)variantType
{
  void *v3;
  int v4;

  -[UIKBTree overrideDisplayString](self, "overrideDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = -[UIKBTree _variantType](self, "_variantType");

  return v4;
}

- (int)_variantType
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("variant-type"));
}

- (void)setSubtrees:(id)a3
{
  objc_storeStrong((id *)&self->subtrees, a3);
}

- (id)mergeKeyNames:(id)a3 inRightToLeft:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  id v30;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  id v38;
  id v39;
  _BOOL4 v40;
  _QWORD v41[4];
  id v42;
  UIKBTree *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD *v48;
  BOOL v49;
  _QWORD v50[4];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v40 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  -[UIKBTree subtreeWithType:](self, "subtreeWithType:", 13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;
  if (v34)
  {
    v38 = (id)objc_msgSend(v39, "mutableCopy");
    objc_msgSend(v34, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v60 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v11, "orderedKeyList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            objc_msgSend(v11, "disappearingKeyName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "remainingKeyName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "factors");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKBTree subsumeDisappearingKeyName:intoKeyName:factors:inRightToLeft:](self, "subsumeDisappearingKeyName:intoKeyName:factors:inRightToLeft:", v13, v14, v15, v40);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v8);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v34, "properties");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v56;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v56 != v33)
          {
            v17 = v16;
            objc_enumerationMutation(v32);
            v16 = v17;
          }
          v36 = v16;
          v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v16);
          objc_msgSend(v34, "properties");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", v39);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v52;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v52 != v23)
                  objc_enumerationMutation(v21);
                v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                objc_msgSend(v25, "orderedKeyList");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v26 == 0;

                if (!v27)
                {
                  objc_msgSend(v25, "orderedKeyList");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  v50[0] = 0;
                  v50[1] = v50;
                  v50[2] = 0x2020000000;
                  v50[3] = 0;
                  v41[0] = MEMORY[0x1E0C809B0];
                  v41[1] = 3221225472;
                  v41[2] = __40__UIKBTree_mergeKeyNames_inRightToLeft___block_invoke;
                  v41[3] = &unk_1E16CEEF8;
                  v42 = v39;
                  v43 = self;
                  v30 = v29;
                  v44 = v30;
                  v45 = v25;
                  v49 = v40;
                  v48 = v50;
                  v46 = v18;
                  v47 = v38;
                  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v41);

                  _Block_object_dispose(v50, 8);
                }
              }
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
            }
            while (v22);
          }

          v16 = v36 + 1;
        }
        while (v36 + 1 != v35);
        v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v35);
    }

    v5 = v34;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (void)subsumeDisappearingKeyName:(id)a3 intoKeyName:(id)a4 factors:(id)a5 inRightToLeft:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", a4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v12, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addRectFrom:mergeActionFactors:inRightToLeft:", v15, v10, v6);

  objc_msgSend(v16, "setShape:", v14);
}

- (id)subtreeWithType:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") != a3)
        {
          v10 = objc_msgSend(v9, "type");
          if (a3 != 8 || v10 != 12)
            continue;
        }
        v11 = v9;
        goto LABEL_14;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)firstCachedKeyWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIKBTree cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)keysForMergeConditions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[UIKBTree subtreeWithType:](self, "subtreeWithType:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v3;
    objc_msgSend(v3, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v25[0] = v9;
          v25[1] = 3221225472;
          v25[2] = __34__UIKBTree_keysForMergeConditions__block_invoke;
          v25[3] = &unk_1E16B8630;
          v26 = v4;
          objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v15);
    }

    v3 = v20;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGRect)_originalKeyplaneFrame
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL IsNull;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v30 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        IsNull = CGRectIsNull(v31);
        objc_msgSend(v11, "originalFrame");
        if (IsNull)
        {
          height = v16;
          width = v15;
          y = v14;
          x = v13;
        }
        else if (!CGRectIsEmpty(*(CGRect *)&v13))
        {
          objc_msgSend(v11, "originalFrame");
          v35.origin.x = v17;
          v35.origin.y = v18;
          v35.size.width = v19;
          v35.size.height = v20;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)originalFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  if (-[UIKBTree type](self, "type") == 2)
  {
    -[UIKBTree _originalKeyplaneFrame](self, "_originalKeyplaneFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[UIKBTree shape](self, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "originalShape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "originalShape");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      objc_msgSend(v11, "frame");
      v4 = v14;
      v6 = v15;
      v8 = v16;
      v10 = v17;
    }
    else
    {
      v4 = *MEMORY[0x1E0C9D648];
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }

  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)layoutName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("layoutName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    UIKeyboardGetCurrentInputMode();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    KBStarLayoutString(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBTree cache](self, "cache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("layoutName"));

  }
  return v4;
}

- ($5C396DA91E87D63640AC871340DC94CC)visualStyling
{
  void *v3;
  void *v4;
  $5C396DA91E87D63640AC871340DC94CC v5;

  -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", CFSTR("KBvisualStyling"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = ($5C396DA91E87D63640AC871340DC94CC)objc_msgSend(v3, "intValue");
  else
    v5 = ($5C396DA91E87D63640AC871340DC94CC)-[UIKBTree stylingFromVisualStyle](self, "stylingFromVisualStyle");

  return v5;
}

- ($5C396DA91E87D63640AC871340DC94CC)stylingFromVisualStyle
{
  return ($5C396DA91E87D63640AC871340DC94CC)-[UIKBTree visualStylingForScreenTraits:](self, "visualStylingForScreenTraits:", 0);
}

- (BOOL)isRightToLeftSensitive
{
  int v3;
  void *v4;
  BOOL v5;
  int v6;
  int v7;

  v3 = -[UIKBTree displayType](self, "displayType");
  if (v3 == 20)
  {
    -[UIKBTree localizationKey](self, "localizationKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v6 = v3;
    v7 = -[UIKBTree interactionType](self, "interactionType");
    return v6 == 3 || v7 == 4 || v7 == 37 || v6 == 26 || v7 == 13 || v6 == 21;
  }
  return v5;
}

- (unint64_t)groupNeighbor
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("group-neighbor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)displayRowHint
{
  void *v2;
  void *v3;
  int v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBdisplayRowHint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 1;

  return v4;
}

- (unint64_t)clipCorners
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("KBclipCorners"));
}

- (id)cacheSecondaryDisplayString
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[UIKBTree displayType](self, "displayType") == 25
    && (-[UIKBTree secondaryDisplayStrings](self, "secondaryDisplayStrings"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    -[UIKBTree secondaryDisplayStrings](self, "secondaryDisplayStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[UIKBTree displayType](self, "displayType") != 7
      && -[UIKBTree displayType](self, "displayType") != 20
      && -[UIKBTree displayTypeHint](self, "displayTypeHint") != 10)
    {
      v6 = 0;
      return v6;
    }
    -[UIKBTree secondaryDisplayStrings](self, "secondaryDisplayStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v6 = v7;
    }
    else
    {
      -[UIKBTree secondaryRepresentedStrings](self, "secondaryRepresentedStrings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)cacheDisplayString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[UIKBTree overrideDisplayString](self, "overrideDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIKBTree displayString](self, "displayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[UIKBTree representedString](self, "representedString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return v5;
}

- (void)setVisualStyle:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBvisualStyle"));

}

- (void)updateFlickKeycapOnKeys
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double MinY;
  int v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  double MinX;
  void *v53;
  void *v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  BOOL v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  unsigned int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unint64_t v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v106 = *MEMORY[0x1E0C80C00];
  if (-[UIKBTree isShiftKeyplane](self, "isShiftKeyplane"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isAutoShifted") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isShiftLocked") ^ 1;

    }
  }
  else
  {
    v4 = 0;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"))
    && !-[UIKBTree isSplit](self, "isSplit"))
  {
    v94 = !-[UIKBTree isFloating](self, "isFloating");
  }
  else
  {
    v94 = 0;
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v79)
  {
    v78 = *(_QWORD *)v98;
    if (v4)
      v8 = 0;
    else
      v8 = 10;
    v83 = v8;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v98 != v78)
          objc_enumerationMutation(obj);
        v80 = v9;
        v10 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v9);
        objc_msgSend(v10, "rowSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "subtrees");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "geometrySet:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subtrees");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "cachedGestureLayout");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "keySet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "subtrees");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "cachedGestureLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "geometrySet:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "subtrees");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v12;
        objc_msgSend(v10, "cachedGestureLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "attributeSet:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "subtrees");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          v25 = 0;
          v26 = 0;
          v91 = 0;
          v86 = v17;
          v87 = v24;
          v88 = v20;
          v82 = v21;
          v85 = v14;
          while (1)
          {
            if (v17 && objc_msgSend(v17, "count") <= v25)
              goto LABEL_96;
            objc_msgSend(v21, "objectAtIndex:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v27, "dynamicLayout") & 1) != 0)
              objc_msgSend(v27, "_keysForDynamicRow");
            else
              objc_msgSend(v27, "subtrees");
            v84 = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v28, "count"))
              break;
LABEL_95:

            ++v25;
            v21 = v82;
            v26 = ++v91;
            if (objc_msgSend(v82, "count") <= (unint64_t)v91)
              goto LABEL_96;
          }
          v29 = 0;
          v30 = 0;
          v89 = v25;
          v95 = v28;
          while (2)
          {
            objc_msgSend(v28, "objectAtIndex:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (!v94)
              goto LABEL_90;
            if (objc_msgSend(v31, "displayType") != 7
              || (objc_msgSend(v32, "supportsSupplementalDisplayString") & 1) != 0)
            {
              if (v17)
              {
                if (objc_msgSend(v14, "count") <= (unint64_t)v91)
                {
                  v33 = 0;
                }
                else
                {
                  objc_msgSend(v14, "objectAtIndex:", v91);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                }
                if (objc_msgSend(v17, "count") <= v25)
                {
                  v90 = 0;
                }
                else
                {
                  objc_msgSend(v17, "objectAtIndex:", v25);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                }
                if (objc_msgSend(v20, "count") <= v25)
                {
                  v41 = 0;
                }
                else
                {
                  objc_msgSend(v20, "objectAtIndex:", v25);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                }
                if (objc_msgSend(v24, "count") <= v25)
                {
                  v92 = 0;
                }
                else
                {
                  objc_msgSend(v24, "objectAtIndex:", v25);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v41, "subtrees");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = v33;
                if (objc_msgSend(v42, "count") <= (unint64_t)v30)
                {
                  v44 = 0;
                }
                else
                {
                  objc_msgSend(v41, "subtrees");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "objectAtIndex:", v30);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  v33 = v93;
                }

                objc_msgSend(v33, "subtrees");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v45, "count") <= v29)
                {
                  v96 = 0;
                }
                else
                {
                  objc_msgSend(v33, "subtrees");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "objectAtIndex:", v29);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();

                  v33 = v93;
                }

                if (v44)
                {
                  objc_msgSend(v44, "frame");
                  MinY = CGRectGetMinY(v107);
                  objc_msgSend(v96, "frame");
                  if (MinY < CGRectGetMinY(v108))
                  {
                    --v91;
                    v48 = 7;
                    goto LABEL_86;
                  }
                  v49 = (uint64_t)v30 << 32;
                  v50 = v30 + 1;
                  v51 = v30;
                  while (1)
                  {
                    v30 = v51;
                    objc_msgSend(v44, "frame");
                    MinX = CGRectGetMinX(v109);
                    objc_msgSend(v96, "frame");
                    if (MinX >= CGRectGetMinX(v110))
                      break;
                    objc_msgSend(v41, "subtrees");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v53, "count") <= v50)
                    {

LABEL_68:
                      v44 = 0;
                      v57 = 0;
                      ++v30;
                      goto LABEL_73;
                    }
                    objc_msgSend(v41, "subtrees");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "objectAtIndex:", v50);
                    v55 = objc_claimAutoreleasedReturnValue();

                    v49 += 0x100000000;
                    v51 = v30 + 1;
                    ++v50;
                    v44 = (void *)v55;
                    if (!v55)
                      goto LABEL_68;
                  }
                  objc_msgSend(v44, "frame");
                  v56 = CGRectGetMinX(v111);
                  objc_msgSend(v32, "frame");
                  if (v56 > CGRectGetMaxX(v112))
                  {

                    v44 = 0;
                    goto LABEL_66;
                  }
                  objc_msgSend(v90, "subtrees");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v58, "count") <= (unint64_t)(v49 >> 32))
                  {
                    v57 = 0;
                  }
                  else
                  {
                    objc_msgSend(v90, "subtrees");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "objectAtIndex:", v49 >> 32);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                }
                else
                {
LABEL_66:
                  v57 = 0;
                }
LABEL_73:
                objc_msgSend(v57, "displayString");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (v60
                  && (objc_msgSend(v32, "displayString"),
                      v61 = (void *)objc_claimAutoreleasedReturnValue(),
                      v62 = objc_msgSend(v60, "isEqualToString:", v61),
                      v61,
                      (v62 & 1) == 0))
                {
                  v104 = v60;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setSecondaryDisplayStrings:", v70);

                  objc_msgSend(v57, "representedString");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v103 = v71;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setSecondaryRepresentedStrings:", v72);

                  objc_msgSend(v32, "setDisplayTypeHint:", 10);
                  objc_msgSend(v32, "setGestureKey:", v57);
                  objc_msgSend(v92, "subtrees");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v73, "count") <= (unint64_t)v30)
                  {
                    objc_msgSend(v57, "setCache:", 0);
                  }
                  else
                  {
                    objc_msgSend(v92, "subtrees");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "objectAtIndex:", v30);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "setCache:", v75);

                  }
                  v17 = v86;

                  v48 = 9;
                }
                else
                {
                  objc_msgSend(v32, "displayString");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v60, "isEqualToString:", v63))
                  {
                    v64 = objc_msgSend(v57, "displayType");

                    if (v64 == 7)
                    {
                      objc_msgSend(v57, "secondaryDisplayStrings");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "firstObject");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v102 = v66;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "setSecondaryDisplayStrings:", v67);

                      objc_msgSend(v57, "secondaryRepresentedStrings");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "firstObject");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      v101 = v68;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "setSecondaryRepresentedStrings:", v69);

                      objc_msgSend(v32, "setDisplayTypeHint:", 10);
                      v48 = 9;
                      goto LABEL_80;
                    }
                  }
                  else
                  {

                  }
                  v48 = 0;
LABEL_80:
                  v17 = v86;
                }
                ++v30;

                v33 = v93;
LABEL_86:

                v24 = v87;
                if (v48)
                {

                  v76 = v48 == 9;
                  v14 = v85;
                  v20 = v88;
                  v25 = v89;
                  v28 = v95;
                  if (!v76)
                    goto LABEL_95;
LABEL_94:
                  if (objc_msgSend(v28, "count") <= ++v29)
                    goto LABEL_95;
                  continue;
                }
                v14 = v85;
                v20 = v88;
                v25 = v89;
              }
LABEL_90:
              if (objc_msgSend(v32, "displayTypeHint") == 10)
              {
                objc_msgSend(v32, "setDisplayTypeHint:", 0);
                if (objc_msgSend(v32, "displayType") != 7)
                {
                  objc_msgSend(v32, "setSecondaryDisplayStrings:", 0);
                  objc_msgSend(v32, "setSecondaryRepresentedStrings:", 0);
                  objc_msgSend(v32, "setGestureKey:", 0);
                }
              }
LABEL_93:

              v28 = v95;
              goto LABEL_94;
            }
            break;
          }
          objc_msgSend(v32, "secondaryRepresentedStrings");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "count") == 1)
          {
            objc_msgSend(v32, "representedString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "secondaryRepresentedStrings");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "firstObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v35, "isEqualToString:", v37);

            v24 = v87;
            v20 = v88;

            if (v38)
            {
              v39 = v32;
              v40 = 0;
LABEL_63:
              objc_msgSend(v39, "setDisplayTypeHint:", v40);
              v17 = v86;
              v25 = v89;
              goto LABEL_93;
            }
          }
          else
          {

          }
          v39 = v32;
          v40 = v83;
          goto LABEL_63;
        }
LABEL_96:

        v9 = v80 + 1;
      }
      while (v80 + 1 != v79);
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v79);
  }

}

- (int)displayTypeHint
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("KBdisplayTypeHint"));
}

- (id)cachedGestureLayout
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBcachedGestureLayout"));
}

- (id)geometrySet:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  UIKBTree *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 5)
        {
          v11 = v10;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (!v3)
    return 0;
  v11 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 5);
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[UIKBTree name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-GeometrySet"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setName:](v11, "setName:", v14);

  -[UIKBTree subtrees](self, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);
LABEL_12:

  return v11;
}

- (id)rowSet
{
  BOOL v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  UIKBTree *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[UIKBTree dynamicLayout](self, "dynamicLayout");
  v4 = -[UIKBTree type](self, "type");
  if (!v3)
  {
    if (v4 == 3)
    {
      -[UIKBTree keySet](self, "keySet");
      v12 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
      return v12;
    }
    return 0;
  }
  if (v4 != 3)
  {
    v13 = -[UIKBTree type](self, "type");
    if (v13 == 15)
    {
      v12 = self;
      return v12;
    }
    return 0;
  }
  -[UIKBTree subtreeWithType:](self, "subtreeWithType:", 15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rowSetType"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[UIKBTree subtrees](self, "subtrees", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v11, "rowSetType"))
          {
            v15 = v11;

            v5 = v15;
            goto LABEL_21;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_21:

  }
  return v5;
}

- (BOOL)isShiftKeyPlaneChooser
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("shift-is-plane-chooser"));
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

void __34__UIKBTree_keysForMergeConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)supportsMultitap
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("supports-multitap"));
}

- (BOOL)isKanaPlane
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("isKanaPlane"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[UIKBTree type](self, "type") == 2)
    {
      -[UIKBTree name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsString:", CFSTR("Kana-Plane"));

    }
    else
    {
      v6 = 0;
    }
    -[UIKBTree cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("isKanaPlane"));

  }
  -[UIKBTree cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("isKanaPlane"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (void)setDisplayRowHint:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBdisplayRowHint"));

}

- (CGRect)frameForKeylayoutName:(id)a3
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[UIKBTree subtreeWithName:](self, "subtreeWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)shiftAlternateKeyplaneName
{
  void *v3;

  if (!+[UIKeyboardLayout _showSmallDisplayKeyplane](UIKeyboardLayout, "_showSmallDisplayKeyplane")
    || (-[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("shift-alternate-small-display")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("shift-alternate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[UIKBTree name](self, "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (BOOL)behavesAsShiftKey
{
  if (-[UIKBTree interactionType](self, "interactionType") != 14)
    return 0;
  if (-[UIKBTree displayTypeHint](self, "displayTypeHint"))
    return -[UIKBTree displayTypeHint](self, "displayTypeHint") == 5;
  return 1;
}

- (BOOL)looksExactlyLikeShiftAlternate
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("looks-like-shift-alternate")) == 46;
}

- (BOOL)isShiftKeyplane
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("shift"));
}

- (id)gestureKeyplaneName
{
  return -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("gesture-keyplane"));
}

- (BOOL)shouldSkipCandidateSelection
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("shouldskipcandidateselection"));
}

- (void)precacheLayoutName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKBTree cache](self, "cache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("layoutName"));

}

- (BOOL)notUseCandidateSelection
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("notusecandidateselection"));
}

- (void)cacheNativeIdiomIfNecessaryForScreenTraits:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *properties;
  void *v9;
  id v10;

  v10 = a3;
  -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("nativeIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBvisualStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[UIKBTree visualStylingForScreenTraits:](self, "visualStylingForScreenTraits:", v10) << 58 >> 58;
      v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->properties, "mutableCopy");
      properties = self->properties;
      self->properties = v7;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v9, CFSTR("nativeIdiom"));

    }
  }

}

- (void)setDisplayTypeHint:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBdisplayTypeHint"));

}

- (void)setDisplayString:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBdisplayString"));
}

- (id)autolocalizedKeyCacheIterator
{
  UIKBTreeLocalizedKeylistEnumerator *v3;
  void *v4;
  UIKBTreeLocalizedKeylistEnumerator *v5;

  v3 = [UIKBTreeLocalizedKeylistEnumerator alloc];
  -[UIKBTree cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIKBTreeLocalizedKeylistEnumerator initWithKeyplaneCache:](v3, "initWithKeyplaneCache:", v4);

  return v5;
}

- (BOOL)supportsType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  __CFString **v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      if (objc_msgSend(v9, "type") == 11)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v9;

    if (!v11)
      return 1;
    if (a3 > 119)
    {
      switch(a3)
      {
        case 'x':
LABEL_19:
          v12 = UIKBAttributeValueKeyboardTypeWebSearchStr;
          break;
        case '\x7F':
LABEL_20:
          v12 = UIKBAttributeValueKeyboardTypeNumberPadStr;
          break;
        case '{':
LABEL_18:
          v12 = UIKBAttributeValueKeyboardTypeNumbersAndPunctuationStr;
          break;
        default:
LABEL_27:
          v12 = UIKBAttributeValueKeyboardTypeDefaultStr;
          break;
      }
    }
    else
    {
      v12 = UIKBAttributeValueKeyboardTypeASCIICapableStr;
      switch(a3)
      {
        case 1:
          break;
        case 2:
          goto LABEL_18;
        case 3:
          v12 = UIKBAttributeValueKeyboardTypeURLStr;
          break;
        case 4:
          goto LABEL_20;
        case 5:
          v12 = UIKBAttributeValueKeyboardTypePhonePadStr;
          break;
        case 6:
          v12 = UIKBAttributeValueKeyboardTypeNamePhonePadStr;
          break;
        case 7:
          v12 = UIKBAttributeValueKeyboardTypeEmailAddressStr;
          break;
        case 8:
          v12 = UIKBAttributeValueKeyboardTypeDecimalPadStr;
          break;
        case 9:
          v12 = UIKBAttributeValueKeyboardTypeTwitterStr;
          break;
        case 10:
          goto LABEL_19;
        case 11:
          v12 = UIKBAttributeValueKeyboardTypeASCIICapableNumberPadStr;
          break;
        default:
          goto LABEL_27;
      }
    }
    v13 = *v12;
    objc_msgSend(v11, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15 != 0;

  }
  else
  {
LABEL_9:
    v10 = 1;
    v11 = v4;
  }

  return v10;
}

+ (BOOL)typeIsPersistent:(int)a3
{
  return a3 != 14;
}

+ (id)uniqueName
{
  uniqueName_cntr += 3;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), uniqueName_cntr);
}

- (id)nameFromAttributes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIKBTree properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    v6 = &stru_1E16EDF20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("KBabstract")) & 1) == 0)
        {
          if ((unint64_t)objc_msgSend(v8, "length") > 5)
            v9 = 6;
          else
            v9 = objc_msgSend(v8, "length");
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "substringToIndex:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBTree properties](self, "properties");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@%@"), v6, v11, v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = (__CFString *)v14;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1E16EDF20;
  }

  return v6;
}

- (id)unhashedName
{
  void *v2;
  void *v3;

  -[UIKBTree name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nameByRemovingHash(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)componentName
{
  void *v2;
  void *v3;

  -[UIKBTree name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  tailComponentOfName(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isHashed
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  void *v10;

  -[UIKBTree name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = v4;
  if (!v4)
    return 0;
  v6 = 0;
  while (1)
  {
    -[UIKBTree name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "characterAtIndex:", v6) - 48;

    if (v8 > 9)
      break;
    if (v5 == ++v6)
      return 0;
  }
  -[UIKBTree name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v10, "characterAtIndex:", v6) == 95;

  return v9;
}

- (UIKBTree)initWithType:(int)a3
{
  uint64_t v3;
  UIKBTree *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBTree;
  v4 = -[UIKBTree init](&v9, sel_init);
  -[UIKBTree setType:](v4, "setType:", v3);
  -[UIKBTree setName:](v4, "setName:", 0);
  v5 = -[UIKBTree isLeafType](v4, "isLeafType");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setProperties:](v4, "setProperties:", v6);

  if (v5)
  {
    -[UIKBTree setSubtrees:](v4, "setSubtrees:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setSubtrees:](v4, "setSubtrees:", v7);

  }
  -[UIKBTree setCache:](v4, "setCache:", 0);
  if ((_DWORD)v3 == 12)
    -[UIKBTree setLayoutTag:](v4, "setLayoutTag:", CFSTR("Default"));
  return v4;
}

+ (id)treeOfType:(int)a3
{
  return -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", *(_QWORD *)&a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBTree *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIKBTree *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  UIKBTree *v23;

  v4 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", -[UIKBTree type](self, "type"));
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[UIKBTree properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
  -[UIKBTree setProperties:](v4, "setProperties:", v7);

  -[UIKBTree properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __25__UIKBTree_copyWithZone___block_invoke;
  v22[3] = &unk_1E16CEE60;
  v10 = v4;
  v23 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v22);
  -[UIKBTree subtrees](self, "subtrees");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[UIKBTree isLeafType](self, "isLeafType");

    if (!v13)
    {
      v14 = (void *)MEMORY[0x1E0C99DE8];
      -[UIKBTree subtrees](self, "subtrees");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree setSubtrees:](v10, "setSubtrees:", v16);

    }
  }
  v17 = (void *)MEMORY[0x1E0CB3940];
  +[UIKBTree uniqueName](UIKBTree, "uniqueName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree name](self, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_%@"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setName:](v10, "setName:", v20);

  return v10;
}

void __25__UIKBTree_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "setObject:forKey:", v10, v5);
  }
  else
  {
    v9 = objc_msgSend(v10, "copy");
    objc_msgSend(v8, "setObject:forKey:", v9, v5);

    v5 = (id)v9;
  }

}

- (BOOL)isSameAsTree:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  char v10;
  NSMutableArray *subtrees;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableDictionary *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "type") != self->type)
    goto LABEL_37;
  v5 = -[NSMutableDictionary count](self->properties, "count");
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
    goto LABEL_37;
  v8 = self->subtrees != 0;
  objc_msgSend(v4, "subtrees");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ (v9 != 0);

  if ((v10 & 1) != 0)
    goto LABEL_37;
  subtrees = self->subtrees;
  if (!subtrees
    || (v12 = -[NSMutableArray count](subtrees, "count"),
        objc_msgSend(v4, "subtrees"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v12 == v14))
  {
    if (-[UIKBTree type](self, "type") != 7
      || (-[UIKBTree componentName](self, "componentName"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "componentName"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "isEqualToString:", v16),
          v16,
          v15,
          v17))
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      obj = self->properties;
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v51 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            if ((objc_msgSend(v22, "isEqualToString:", CFSTR("KBabstract")) & 1) == 0)
            {
              -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "properties");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isKindOfClass & 1) != 0)
              {
                v28 = objc_msgSend(v25, "isEqualToString:", v27);

                if ((v28 & 1) == 0)
                  goto LABEL_39;
              }
              else
              {
                v29 = objc_msgSend(v25, "isEqual:", v27);

                if (!v29)
                  goto LABEL_39;
              }
            }
          }
          v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        }
        while (v19);
      }

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = self->subtrees;
      v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v47;
LABEL_22:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v33);
          objc_msgSend(v4, "subtrees");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v35, "containsObject:", v34);

          if (!v17)
            break;
          if (v31 == ++v33)
          {
            v31 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
            if (v31)
              goto LABEL_22;
            goto LABEL_28;
          }
        }
      }
      else
      {
LABEL_28:

        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v4, "subtrees");
        obj = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v43;
LABEL_30:
          v39 = 0;
          while (1)
          {
            if (*(_QWORD *)v43 != v38)
              objc_enumerationMutation(obj);
            if (!-[NSMutableArray containsObject:](self->subtrees, "containsObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v39)))break;
            if (v37 == ++v39)
            {
              v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
              LOBYTE(v17) = 1;
              if (v37)
                goto LABEL_30;
              goto LABEL_40;
            }
          }
LABEL_39:
          LOBYTE(v17) = 0;
        }
        else
        {
          LOBYTE(v17) = 1;
        }
      }
LABEL_40:

    }
  }
  else
  {
LABEL_37:
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)isEqualToTree:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[UIKBTree isSameAsTree:](self, "isSameAsTree:", v4);
  -[UIKBTree name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = v5 & objc_msgSend(v6, "isEqualToString:", v7);
  return (char)v4;
}

- (BOOL)isDuplicateOfTree:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[UIKBTree isSameAsTree:](self, "isSameAsTree:", v4);
  -[UIKBTree name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = v5 & (objc_msgSend(v6, "isEqualToString:", v7) ^ 1);
  return (char)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKBTree;
  -[UIKBTree description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTree stringForType:](UIKBTree, "stringForType:", -[UIKBTree type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[UIKBTree subtrees](self, "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - %@/%@: %ld properties + %ld subtrees"), v5, v4, v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)recursiveDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIKBTree description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "recursiveDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: \n\t%@"), v9, v10);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)stringForType:(int)a3
{
  if ((a3 - 1) > 0xE)
    return 0;
  else
    return off_1E16CF080[a3 - 1];
}

- (id)subtreeWithName:(id)a3 rows:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    objc_msgSend(v6, "substringFromIndex:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    v12 = v11 - 1;
    if (v11 >= 2)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("Row0"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v13)
        v12 = v11;
      else
        v12 = v11 - 1;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Row%ld"), ++v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        v12 -= v17;
      }
      while (v11 - 1 != v14);
    }
    if ((v12 & 0x80000000) != 0
      || (-[UIKBTree subtrees](self, "subtrees"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v19 <= v12))
    {
      -[UIKBTree subtrees](self, "subtrees");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (!v24)
      {
        v9 = 0;
        goto LABEL_15;
      }
      -[UIKBTree subtrees](self, "subtrees");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = 0;
    }
    else
    {
      -[UIKBTree subtrees](self, "subtrees");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = v12;
    }
    objc_msgSend(v20, "objectAtIndex:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:

  return v9;
}

- (id)subtreesWithProperty:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v19 = 0;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[UIKBTree subtrees](self, "subtrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "properties");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v8);

          if (v17)
            objc_msgSend(v19, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

  }
  return v19;
}

- (int)indexOfSubtree:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  if (v4
    && (-[UIKBTree subtrees](self, "subtrees"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[UIKBTree subtrees](self, "subtrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v4);

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)_needsScaling
{
  _BOOL4 v3;

  v3 = -[UIKBTree isSplit](self, "isSplit");
  if (v3)
  {
    if (-[UIKBTree isGenerated](self, "isGenerated"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("isScaled"));
  }
  return v3;
}

- (void)mergeReturnKey:(id)a3 withReturnKey:(id)a4
{
  id v5;
  double MaxY;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
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
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
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
  double v67;
  double v68;
  double v69;
  id v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v70 = a3;
  v5 = a4;
  if (objc_msgSend(v70, "visible") && objc_msgSend(v5, "visible"))
  {
    objc_msgSend(v70, "frame");
    MaxY = CGRectGetMaxY(v71);
    objc_msgSend(v5, "frame");
    v7 = CGRectGetMaxY(v72);
    if (MaxY <= v7)
      v8 = v5;
    else
      v8 = v70;
    if (MaxY <= v7)
      v9 = v70;
    else
      v9 = v5;
    v10 = v8;
    v11 = v9;
    +[UIKBShape shape](UIKBShape, "shape");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v11, "frame");
    v77.origin.x = v21;
    v77.origin.y = v22;
    v77.size.width = v23;
    v77.size.height = v24;
    v73.origin.x = v14;
    v73.origin.y = v16;
    v73.size.width = v18;
    v73.size.height = v20;
    v74 = CGRectUnion(v73, v77);
    objc_msgSend(v12, "setFrame:", v74.origin.x, v74.origin.y, v74.size.width, v74.size.height);
    objc_msgSend(v10, "paddedFrame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v11, "paddedFrame");
    v78.origin.x = v33;
    v78.origin.y = v34;
    v78.size.width = v35;
    v78.size.height = v36;
    v75.origin.x = v26;
    v75.origin.y = v28;
    v75.size.width = v30;
    v75.size.height = v32;
    v76 = CGRectUnion(v75, v78);
    objc_msgSend(v12, "setPaddedFrame:", v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
    objc_msgSend(v10, "paddedFrame");
    v38 = v37;
    objc_msgSend(v11, "paddedFrame");
    v40 = v38 - v39;
    objc_msgSend(v11, "paddedFrame");
    v42 = v41;
    objc_msgSend(v10, "paddedFrame");
    v44 = v43;
    objc_msgSend(v11, "paddedFrame");
    v46 = v45;
    objc_msgSend(v10, "paddedFrame");
    if (v42 <= v44)
    {
      if (v46 >= v47)
      {
        objc_msgSend(v11, "paddedFrame");
        v55 = v53 + v54;
        objc_msgSend(v10, "paddedFrame");
        v58 = v56 + v57;
        objc_msgSend(v11, "paddedFrame");
        v61 = v59 + v60;
        objc_msgSend(v10, "paddedFrame");
        v64 = v62 + v63;
        if (v55 <= v58)
        {
          if (v61 >= v64)
          {
            v49 = 0;
            v48 = *MEMORY[0x1E0C9D820];
            v40 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          }
          else
          {
            objc_msgSend(v10, "paddedFrame");
            v67 = v65 + v66;
            objc_msgSend(v11, "paddedFrame");
            v48 = v67 - (v68 + v69);
            v49 = 2;
          }
        }
        else
        {
          v48 = v61 - v64;
          v49 = 8;
        }
      }
      else
      {
        objc_msgSend(v10, "paddedFrame");
        v51 = v50;
        objc_msgSend(v11, "paddedFrame");
        v48 = v51 - v52;
        v49 = 4;
      }
    }
    else
    {
      v48 = v46 - v47;
      v49 = 1;
    }
    objc_msgSend(v12, "setConcaveCorner:", v49);
    objc_msgSend(v12, "setConcaveCornerOffset:", v48, v40);
    objc_msgSend(v11, "setShape:", v12);
    objc_msgSend(v10, "setShape:", v12);
    objc_msgSend(v11, "setVisible:", 0);

  }
}

- (void)zipGeometries:(BOOL)a3 attributes:(BOOL)a4
{
  _BOOL4 v4;
  UIKBTree *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *context;
  uint64_t v53;
  void *v54;
  UIKBTree *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  _BOOL4 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v64 = a4;
  v4 = a3;
  v5 = self;
  v70 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x186DC9484](self, a2);
  if (-[UIKBTree type](v5, "type") == 2)
  {
    v63 = -[UIKBTree _needsScaling](v5, "_needsScaling");
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    -[UIKBTree subtrees](v5, "subtrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    if (v7)
    {
      v8 = v7;
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v13 = *(_QWORD *)v66;
      v54 = v6;
      v55 = v5;
      v53 = *(_QWORD *)v66;
      do
      {
        v14 = 0;
        v56 = v8;
        do
        {
          if (*(_QWORD *)v66 != v13)
            objc_enumerationMutation(v6);
          v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v14);
          if (objc_msgSend(v15, "type") == 3)
          {
            v57 = v14;
            objc_msgSend(v15, "rowSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "subtrees");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "geometrySet:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "subtrees");
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "attributeSet:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "subtrees");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "shape");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "originalShape");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "originalShape");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setShape:", v23);

            }
            v24 = objc_msgSend(v17, "count");
            if (v24 == objc_msgSend(v61, "count"))
            {
              objc_msgSend(v15, "frame");
              v73.origin.x = x;
              v73.origin.y = y;
              v73.size.width = width;
              v73.size.height = height;
              v72 = CGRectUnion(v71, v73);
              x = v72.origin.x;
              y = v72.origin.y;
              width = v72.size.width;
              height = v72.size.height;
              if (v63)
              {
                objc_msgSend(v15, "shape");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "frame");
                if (v26 <= width * 0.5)
                  v27 = 0.0;
                else
                  v27 = width;
                objc_msgSend(v25, "scaleIfNeeded:onlyYAxis:", objc_msgSend(v17, "count") != 0, v27);

              }
              if (objc_msgSend(v17, "count"))
              {
                v28 = 0;
                v59 = v20;
                v60 = v17;
                v58 = v21;
                do
                {
                  objc_msgSend(v61, "objectAtIndex:", v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectAtIndex:", v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v20, "count") <= v28)
                  {
                    v31 = 0;
                  }
                  else
                  {
                    objc_msgSend(v20, "objectAtIndex:", v28);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v62 = v29;
                  if (v4)
                  {
                    objc_msgSend(v29, "properties");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "setProperties:", v32);

                    v29 = v62;
                  }
                  objc_msgSend(v29, "subtrees");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "subtrees");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v34, "count"))
                  {
                    v35 = 0;
                    while (1)
                    {
                      v36 = objc_msgSend(v33, "count");

                      if (v36 <= v35)
                        break;
                      objc_msgSend(v30, "subtrees");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "objectAtIndex:", v35);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v38, "setState:", 0);
                      objc_msgSend(v38, "setVisible:", 1);
                      objc_msgSend(v38, "setClipCorners:", 0);
                      if (v4)
                      {
                        objc_msgSend(v33, "objectAtIndex:", v35);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        v40 = v39;
                        if (v63)
                        {
                          objc_msgSend(v39, "frame");
                          if (v41 <= width * 0.5)
                            v42 = 0.0;
                          else
                            v42 = width;
                          objc_msgSend(v40, "scaleIfNeeded:onlyYAxis:", 0, v42);
                        }
                        objc_msgSend(v33, "objectAtIndex:", v35);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v44 = (void *)objc_msgSend(v43, "copy");
                        objc_msgSend(v38, "setShape:", v44);

                      }
                      if (v64)
                      {
                        objc_msgSend(v31, "subtrees");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v45, "count") <= v35)
                        {
                          objc_msgSend(v38, "setCache:", 0);
                        }
                        else
                        {
                          objc_msgSend(v31, "subtrees");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v46, "objectAtIndex:", v35);
                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "setCache:", v47);

                        }
                      }

                      ++v35;
                      objc_msgSend(v30, "subtrees");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v34, "count") <= v35)
                        goto LABEL_39;
                    }
                  }
                  else
                  {
LABEL_39:

                  }
                  ++v28;
                  v17 = v60;
                  v21 = v58;
                  v20 = v59;
                }
                while (objc_msgSend(v60, "count") > v28);
                v6 = v54;
                v5 = v55;
                v8 = v56;
                v13 = v53;
              }
            }
            v14 = v57;

          }
          ++v14;
        }
        while (v14 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      }
      while (v8);
    }

    -[UIKBTree setObject:forProperty:](v5, "setObject:forProperty:", 0, CFSTR("KBunionFrame"));
    -[UIKBTree setObject:forProperty:](v5, "setObject:forProperty:", 0, CFSTR("KBunionPaddedFrame"));
    -[UIKBTree setResizingOffset:](v5, "setResizingOffset:", 0.0);
    if (v4)
    {
      if ((-[UIKBTree visualStyling](v5, "visualStyling") & 0x3F) == 0x17
        || (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
            v48 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v48, "textInputTraits"),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            v50 = objc_msgSend(v49, "keyboardType"),
            v49,
            v48,
            v50 != 12))
      {
        -[UIKBTree updateFlickKeycapOnKeys](v5, "updateFlickKeycapOnKeys");
      }
    }
    if (v63)
    {
      -[UIKBTree cache](v5, "cache");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setObject:forKey:", &unk_1E1A98280, CFSTR("isScaled"));

    }
  }
  objc_autoreleasePoolPop(context);
}

- (void)zipGeometrySet
{
  -[UIKBTree zipGeometries:attributes:](self, "zipGeometries:attributes:", 1, 1);
}

- (void)zipOnlyGeometrySet
{
  -[UIKBTree zipGeometries:attributes:](self, "zipGeometries:attributes:", 1, 0);
}

- (void)zipAttributes
{
  -[UIKBTree zipGeometries:attributes:](self, "zipGeometries:attributes:", 0, 1);
}

- (int64_t)_keyCountOnNamedRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "keySet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "subtreeWithName:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "subtrees");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v13, "count");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)elaborateLayoutWithSize:(CGSize)a3 scale:(double)a4
{
  -[UIKBTree elaborateLayoutWithSize:scale:origin:](self, "elaborateLayoutWithSize:scale:origin:", a3.width, a3.height, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)rowSetOfType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "rowSetType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateKeysForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIKBTree subtreeWithType:](self, "subtreeWithType:", 3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentKeyboardType:", a3);
  objc_msgSend(v10, "orderedRowsForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[UIKBTree cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("keys"));

    -[UIKBTree _keysForDynamicRows:](self, "_keysForDynamicRows:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree cache](self, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("keys"));

  }
}

- (id)orderedRowsForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIKBTree rowSet](self, "rowSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    v7 = 0;
    if (-[UIKBTree type](self, "type") == 3 && v6)
    {
      objc_msgSend(v6, "subtrees");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "mutableCopy");

      -[UIKBTree rowSetOfType:](self, "rowSetOfType:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v6, "subtrees");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "subtrees", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reverseObjectEnumerator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v20;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v20 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v7, "replaceObjectAtIndex:withObject:", --v11, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++));
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v15);
        }

      }
    }
  }
  else
  {
    objc_msgSend(v5, "subtrees");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_keysForDynamicRows:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v40;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(obj);
        v31 = v5;
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v5);
        objc_msgSend(v6, "subtrees");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        objc_msgSend(v6, "subtrees");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          v11 = 0;
          v32 = v6;
          v33 = v8 >> 1;
          do
          {
            objc_msgSend(v6, "subtrees");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndex:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v13, "type") == 8)
            {
              objc_msgSend(v13, "setDynamicLayout:", 1);
              if (v11 >= v33)
                v14 = 8;
              else
                v14 = 4;
              objc_msgSend(v13, "setDynamicDisplayCorner:", v14);
              objc_msgSend(v4, "addObject:", v13);
            }
            else if (objc_msgSend(v13, "type") == 4 || objc_msgSend(v13, "type") == 7)
            {
              v34 = v11;
              objc_msgSend(v13, "subtrees");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "count");

              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              objc_msgSend(v13, "subtrees");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v18)
              {
                v19 = v18;
                v20 = v16 >> 1;
                v21 = *(_QWORD *)v36;
                do
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v36 != v21)
                      objc_enumerationMutation(v17);
                    v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                    objc_msgSend(v23, "setDynamicLayout:", 1);
                    if (v20 <= (int)objc_msgSend(v13, "indexOfSubtree:", v23))
                      v24 = 8;
                    else
                      v24 = 4;
                    objc_msgSend(v23, "setDynamicDisplayCorner:", v24);
                    objc_msgSend(v4, "addObject:", v23);
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                }
                while (v19);
              }

              v6 = v32;
              v11 = v34;
            }

            ++v11;
            objc_msgSend(v6, "subtrees");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

          }
          while (v11 < v26);
        }
        v5 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v30);
  }

  return v4;
}

- (id)_keysForDynamicRow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  unint64_t v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKBTree dynamicLayout](self, "dynamicLayout"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[UIKBTree subtrees](self, "subtrees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v4)
    {
      v5 = v4;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v7, "subtrees");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "count");

          if (v9)
          {
            v10 = 0;
            do
            {
              objc_msgSend(v7, "subtrees");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectAtIndex:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v12, "type") == 8)
              {
                objc_msgSend(v3, "addObject:", v12);
              }
              else if (objc_msgSend(v12, "type") == 4 || objc_msgSend(v12, "type") == 7)
              {
                v25 = 0u;
                v26 = 0u;
                v23 = 0u;
                v24 = 0u;
                objc_msgSend(v12, "subtrees");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                if (v14)
                {
                  v15 = v14;
                  v16 = *(_QWORD *)v24;
                  do
                  {
                    for (j = 0; j != v15; ++j)
                    {
                      if (*(_QWORD *)v24 != v16)
                        objc_enumerationMutation(v13);
                      objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
                    }
                    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                  }
                  while (v15);
                }

              }
              ++v10;
              objc_msgSend(v7, "subtrees");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

            }
            while (v10 < v19);
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v5);
    }

  }
  return v3;
}

- (int64_t)rowSetType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBRowSetVariantType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (void)swapToggleKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  unsigned int v18;
  unsigned int v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UIKBTree type](self, "type") == 3 && (unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    -[UIKBTree orderedRowsForType:](self, "orderedRowsForType:", -[UIKBTree currentKeyboardType](self, "currentKeyboardType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      v27 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
          objc_msgSend(v4, "firstObject", v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "toggleKeysForKeyName:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "subtreeWithName:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "subtreeWithName:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              v17 = v16 == 0;
            else
              v17 = 1;
            if (!v17)
            {
              v18 = objc_msgSend(v10, "indexOfSubtree:", v14);
              v19 = objc_msgSend(v10, "indexOfSubtree:", v16);
              if (v18 < v19)
              {
                v20 = v5;
                v21 = v4;
                v22 = (int)v19;
                v28 = (int)v18;
                objc_msgSend(v10, "subtrees");
                v23 = v7;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v22;
                v4 = v21;
                v5 = v20;
                v8 = v27;
                objc_msgSend(v24, "replaceObjectAtIndex:withObject:", v25, v14);

                v7 = v23;
                objc_msgSend(v10, "subtrees");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v28, v16);

              }
            }

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v7);
    }

  }
}

- (void)applyDynamicAttributes
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void (**v9)(void *, void *, _QWORD, uint64_t);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD aBlock[4];
  char v56;
  char v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (-[UIKBTree isShiftKeyplane](self, "isShiftKeyplane"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isAutoShifted") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isShiftLocked") ^ 1;

    }
  }
  else
  {
    v4 = 0;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"))
    && !-[UIKBTree isSplit](self, "isSplit"))
  {
    v8 = !-[UIKBTree isFloating](self, "isFloating");
  }
  else
  {
    v8 = 0;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__UIKBTree_applyDynamicAttributes__block_invoke;
  aBlock[3] = &__block_descriptor_34_e33_v32__0__UIKBTree_8__NSArray_16q24l;
  v56 = v8;
  v57 = v4;
  v9 = (void (**)(void *, void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v52;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v11 = v10;
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
        if (objc_msgSend(v12, "type") == 3)
        {
          v43 = v11;
          objc_msgSend(v12, "rowSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "subtrees");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "attributeSet:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "subtrees");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v16, "count"))
          {

            goto LABEL_49;
          }
          if (objc_msgSend(v16, "count") == 1)
          {
            objc_msgSend(v16, "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "subtrees");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");

            if (v19)
            {
              objc_msgSend(v17, "subtrees");
              v20 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v20;
            }

          }
          if (objc_msgSend(v14, "count"))
          {
            v21 = 0;
            v46 = v16;
            v47 = v14;
            do
            {
              objc_msgSend(v14, "objectAtIndex:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v21;
              if (objc_msgSend(v16, "count") <= v21)
              {
                v23 = 0;
              }
              else
              {
                objc_msgSend(v16, "objectAtIndex:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v48 = v22;
              objc_msgSend(v22, "subtrees");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "count"))
              {
                v25 = 0;
                v50 = v23;
                do
                {
                  objc_msgSend(v24, "objectAtIndex:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v26, "type") == 8)
                  {
                    objc_msgSend(v23, "subtrees");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v27, "count");

                    if (v28 <= v25)
                    {
                      v9[2](v9, v26, 0, 0x7FFFFFFFFFFFFFFFLL);
                    }
                    else
                    {
                      objc_msgSend(v23, "subtrees");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      ((void (**)(void *, void *, void *, uint64_t))v9)[2](v9, v26, v29, v25);

                    }
                  }
                  else
                  {
                    objc_msgSend(v26, "subtrees");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v30, "count");

                    if (v31)
                    {
                      objc_msgSend(v23, "subtrees");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v32, "count");

                      if (v33 > v25)
                      {
                        objc_msgSend(v23, "subtrees");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "objectAtIndex:", v25);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v26, "subtrees");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v36, "count"))
                        {
                          v37 = 0;
                          do
                          {
                            objc_msgSend(v36, "objectAtIndex:", v37);
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v35, "subtrees");
                            v39 = (void *)objc_claimAutoreleasedReturnValue();
                            v40 = objc_msgSend(v39, "count");

                            if (v40 <= v37)
                            {
                              v9[2](v9, v38, 0, 0x7FFFFFFFFFFFFFFFLL);
                            }
                            else
                            {
                              objc_msgSend(v35, "subtrees");
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              ((void (**)(void *, void *, void *, uint64_t))v9)[2](v9, v38, v41, v37);

                            }
                            ++v37;
                          }
                          while (objc_msgSend(v36, "count") > v37);
                        }

                        v23 = v50;
                      }
                    }
                  }

                  ++v25;
                }
                while (objc_msgSend(v24, "count") > v25);
              }

              v21 = v49 + 1;
              v14 = v47;
              v16 = v46;
            }
            while (objc_msgSend(v47, "count") > v49 + 1);
          }

          v11 = v43;
        }
        v10 = v11 + 1;
      }
      while (v11 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      if (v45)
        continue;
      break;
    }
  }
LABEL_49:

}

void __34__UIKBTree_applyDynamicAttributes__block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v7 = a3;
  objc_msgSend(v16, "setState:", 0);
  objc_msgSend(v16, "setVisible:", 1);
  objc_msgSend(v16, "setClipCorners:", 0);
  if (objc_msgSend(v7, "count") > a4)
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "objectAtIndex:", a4);
    else
      objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCache:", v9);

  }
  if (*(_BYTE *)(a1 + 32) && objc_msgSend(v16, "displayType") == 7)
  {
    objc_msgSend(v16, "secondaryRepresentedStrings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v16, "representedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "secondaryRepresentedStrings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {
        v15 = 0;
LABEL_15:
        objc_msgSend(v16, "setDisplayTypeHint:", v15);
        goto LABEL_16;
      }
    }
    else
    {

    }
    if (*(_BYTE *)(a1 + 33))
      v15 = 0;
    else
      v15 = 10;
    goto LABEL_15;
  }
LABEL_16:

}

- (BOOL)subtreesAreOrdered
{
  return -[UIKBTree type](self, "type") == 7;
}

- (id)geometry
{
  void *v2;
  void *v3;

  -[UIKBTree shape](self, "shape");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "geometry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setGeometry:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIKBTree shape](self, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setGeometry:", v5);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIKBTree shape](self, "shape");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (void)setPaddedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIKBTree shape](self, "shape");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setPaddedFrame:", x, y, width, height);

}

- (CGPoint)navigationPointOfKey
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat MidX;
  double MidY;
  double v22;
  CGPoint result;
  CGRect v24;
  CGRect v25;

  v3 = -[UIKBTree selectedVariantIndex](self, "selectedVariantIndex");
  -[UIKBTree subtrees](self, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[UIKBTree frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (v5 >= 1 && v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIKBTree subtrees](self, "subtrees");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v7 = v16;
    v9 = v17;
    v11 = v18;
    v13 = v19;

  }
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = v7;
  v25.origin.y = v9;
  v25.size.width = v11;
  v25.size.height = v13;
  MidY = CGRectGetMidY(v25);
  v22 = MidX;
  result.y = MidY;
  result.x = v22;
  return result;
}

- (CGRect)keyUnionFramePadded:(BOOL)a3
{
  _BOOL4 v3;
  __CFString **v5;
  __CFString *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect result;
  CGRect v44;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v5 = UIKBTreePropertyKeyUnionFrame;
  if (a3)
    v5 = UIKBTreePropertyKeyUnionPaddedFrame;
  v6 = *v5;
  -[UIKBTree objectForProperty:](self, "objectForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D628];
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[UIKBTree keys](self, "keys", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((objc_msgSend(v22, "BOOLForProperty:", CFSTR("ignore-hand-bias")) & 1) == 0)
          {
            v41.origin.x = v10;
            v41.origin.y = v12;
            v41.size.width = v14;
            v41.size.height = v16;
            if (CGRectIsNull(v41))
            {
              if (v3)
                objc_msgSend(v22, "paddedFrame");
              else
                objc_msgSend(v22, "frame");
            }
            else
            {
              if (v3)
                objc_msgSend(v22, "paddedFrame");
              else
                objc_msgSend(v22, "frame");
              v44.origin.x = v27;
              v44.origin.y = v28;
              v44.size.width = v29;
              v44.size.height = v30;
              v42.origin.x = v10;
              v42.origin.y = v12;
              v42.size.width = v14;
              v42.size.height = v16;
              *(CGRect *)&v23 = CGRectUnion(v42, v44);
            }
            v10 = v23;
            v12 = v24;
            v14 = v25;
            v16 = v26;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v10, v12, v14, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v8, v6);
  }

  v31 = v10;
  v32 = v12;
  v33 = v14;
  v34 = v16;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)keyUnionFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBTree keyUnionFramePadded:](self, "keyUnionFramePadded:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)keyUnionPaddedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBTree keyUnionFramePadded:](self, "keyUnionFramePadded:", 1);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVisualStyling:(id)a3
{
  NSMutableDictionary *properties;
  id v4;

  properties = self->properties;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", v4, CFSTR("KBvisualStyling"));

}

- (id)firstKeyplaneSwitchKey
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__120;
  v10 = __Block_byref_object_dispose__120;
  v11 = 0;
  -[UIKBTree cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__UIKBTree_firstKeyplaneSwitchKey__block_invoke;
  v5[3] = &unk_1E16CEEA8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__UIKBTree_firstKeyplaneSwitchKey__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if ((objc_msgSend(v11, "hasSuffix:", CFSTR("Keyplane-Switch-Key")) & 1) != 0
    || objc_msgSend(v11, "hasSuffix:", CFSTR("Keyplane-Switch-Collapsed-Key")))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (id)keyplaneSwitchKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[UIKBTree subtrees](self, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "firstKeyplaneSwitchKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)keyplaneSwitchKeysWithoutCurrentKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  UIKBTree *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstKeyplaneSwitchKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "representedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsString:", v7) & 1) != 0)
    {
LABEL_18:

    }
    else
    {
      v26 = self;
      while (1)
      {
        v8 = objc_msgSend(v27, "count", v26);
        -[UIKBTree subtrees](self, "subtrees");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v8 >= v10)
          break;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        -[UIKBTree subtrees](self, "subtrees");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              v16 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
              if (v16 != v4)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "name");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "representedString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v17, "containsString:", v18);

                if (v19)
                {
                  objc_msgSend(v4, "name");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "representedString");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v20, "containsString:", v21);

                  if ((v22 & 1) == 0)
                  {
                    v23 = (void *)objc_msgSend(v5, "copy");
                    objc_msgSend(v27, "addObject:", v23);

                  }
                  objc_msgSend(v16, "firstKeyplaneSwitchKey");
                  v24 = objc_claimAutoreleasedReturnValue();

                  v5 = (void *)v24;
                }
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v13);
        }

        objc_msgSend(v4, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "representedString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        self = v26;
        if ((objc_msgSend(v6, "containsString:", v7) & 1) != 0)
          goto LABEL_18;
      }
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)scriptSwitchKey
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Roman-to-Non-Roman-Switch-Key"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Non-Roman-to-Roman-Switch-Key"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[UIKBTree cachedKeysByKeyName:](self, "cachedKeysByKeyName:", CFSTR("More-Key"));
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            objc_msgSend(v9, "name", (_QWORD)v13);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("Roman-Switch-Key"));

            if (v11)
            {
              v3 = v9;
              goto LABEL_13;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
      v3 = 0;
LABEL_13:

    }
  }
  return v3;
}

- (unint64_t)numberOfRows
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v7, "geometrySet:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "subtrees");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "numberForProperty:", CFSTR("KBdisplayRowHint"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v14 && objc_msgSend(v14, "unsignedIntegerValue") > v4)
                v4 = objc_msgSend(v15, "unsignedIntegerValue");

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_cacheRootNameForKey:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "type") == 12
    || (objc_msgSend(v3, "layoutTag"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = CFSTR("Adaptive-Key");
  }
  else
  {
    objc_msgSend(v3, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("merge-as-more-key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      v5 = CFSTR("More-Key");
    }
    else
    {
      objc_msgSend(v3, "cache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("modify-for-writeboard-key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if ((v12 & 1) != 0)
      {
        v5 = CFSTR("Modify-For-Writeboard-Key");
      }
      else
      {
        if (objc_msgSend(v3, "interactionType") != 15)
        {
          if (objc_msgSend(v3, "displayType") == 7)
          {
            objc_msgSend(v3, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("Alternate-Currency-Sign-"));
            v16 = v15;

            if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v3, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "substringWithRange:", v14, v16 + 1);
              v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

              goto LABEL_4;
            }
            objc_msgSend(v3, "representedString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "_containsSubstring:", CFSTR("¤"));

            if ((v18 & 1) != 0)
            {
              v5 = CFSTR("Primary-Currency-Sign");
              goto LABEL_4;
            }
            objc_msgSend(v3, "representedString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "_containsSubstring:", CFSTR("⁒"));

            if ((v21 & 1) != 0)
            {
              v5 = CFSTR("Localized-Percent-Sign");
              goto LABEL_4;
            }
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            objc_msgSend(v3, "secondaryRepresentedStrings", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v29;
              v5 = CFSTR("Primary-Currency-Sign");
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v29 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                  if ((objc_msgSend(v27, "_containsSubstring:", CFSTR("¤")) & 1) != 0)
                    goto LABEL_30;
                  if ((objc_msgSend(v27, "_containsSubstring:", CFSTR("⁒")) & 1) != 0)
                  {
                    v5 = CFSTR("Localized-Percent-Sign");
LABEL_30:

                    goto LABEL_4;
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
                if (v24)
                  continue;
                break;
              }
            }

          }
          objc_msgSend(v3, "unhashedName");
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        v5 = CFSTR("Space-Key");
      }
    }
  }
LABEL_4:

  return v5;
}

- (void)cacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKBTree cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setCache:](self, "setCache:", v6);

  }
  -[UIKBTree _cacheRootNameForKey:](self, "_cacheRootNameForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree cache](self, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIKBTree cache](self, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v7);

  }
  objc_msgSend(v9, "addObject:", v4);
  if (objc_msgSend(v4, "type") == 12
    || (objc_msgSend(v4, "layoutTag"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "properties", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "shouldCacheKey"))
            -[UIKBTree cacheKey:](self, "cacheKey:", v18);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (id)keyForString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "keys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "representedString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_18;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  NSLog(CFSTR("did not find key for string: %@"), v4);
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)keyplaneForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  int v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (!v20)
  {

LABEL_22:
    objc_msgSend(v4, "representedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("did not find keyplane for key: %@"), v17);

    v6 = 0;
    goto LABEL_23;
  }
  v6 = 0;
  v7 = *(_QWORD *)v27;
  v21 = v5;
  v19 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v27 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v9, "keys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        while (2)
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            if (*(id *)(*((_QWORD *)&v22 + 1) + 8 * j) == v4)
            {
              v15 = objc_msgSend(v9, "isShiftKeyplane");
              v16 = v9;
              if (!v15)
              {

                goto LABEL_24;
              }

              v6 = v16;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v12)
            continue;
          break;
        }
      }

      v5 = v21;
      v7 = v19;
    }
    v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  }
  while (v20);

  if (!v6)
    goto LABEL_22;
LABEL_23:
  v6 = v6;
  v16 = v6;
LABEL_24:

  return v16;
}

- (void)setAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type") == 10)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  -[UIKBTree subtrees](self, "subtrees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v6);

  if (v4)
  {
    -[UIKBTree subtrees](self, "subtrees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

  }
}

- (void)addkeyToCachedKeyList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UIKBTree cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("keys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addObject:", v4);
    if (v7)
    {
      -[UIKBTree cache](self, "cache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("keys"));

    }
    -[UIKBTree _cacheRootNameForKey:](self, "_cacheRootNameForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree cache](self, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      if ((objc_msgSend(v11, "containsObject:", v4) & 1) != 0)
      {
LABEL_9:
        -[UIKBTree cache](self, "cache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v11, v9);

        goto LABEL_10;
      }
      objc_msgSend(v11, "arrayByAddingObject:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v12;

    v11 = v13;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)removeKeyFromCachedKeyList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    -[UIKBTree cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("keys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v4);
    -[UIKBTree cache](self, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("keys"));

    -[UIKBTree _cacheRootNameForKey:](self, "_cacheRootNameForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree cache](self, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)MEMORY[0x1E0CB3880];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __39__UIKBTree_removeKeyFromCachedKeyList___block_invoke;
      v18[3] = &unk_1E16CEED0;
      v19 = v4;
      objc_msgSend(v12, "predicateWithBlock:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    v15 = objc_msgSend(v11, "count");
    -[UIKBTree cache](self, "cache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
      objc_msgSend(v16, "setObject:forKey:", v11, v9);
    else
      objc_msgSend(v16, "removeObjectForKey:", v9);

  }
}

uint64_t __39__UIKBTree_removeKeyFromCachedKeyList___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  return v5;
}

- (void)removeKeyFromAllCachedLists:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[UIKBTree cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      v21 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        v22 = v8;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
          -[UIKBTree cache](self, "cache");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (void *)objc_msgSend(v13, "mutableCopy");
            v15 = v4;
            objc_msgSend(v14, "removeObject:", v4);
            v16 = objc_msgSend(v14, "count");
            -[UIKBTree cache](self, "cache");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v16)
              objc_msgSend(v17, "setObject:forKey:", v14, v11);
            else
              objc_msgSend(v17, "removeObjectForKey:", v11);

            v4 = v15;
            v9 = v21;
            v8 = v22;
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    -[UIKBTree cache](self, "cache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v20);

  }
}

- (id)geometries
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  UIKBTree *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("geometries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = self;
    -[UIKBTree subtrees](self, "subtrees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v10, "geometrySet:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "subtrees");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v23;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v23 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "subtrees");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObjectsFromArray:", v17);

                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v14);
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

    -[UIKBTree cache](v21, "cache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v4, CFSTR("geometries"));

  }
  v19 = v4;

  return v19;
}

- (id)keyAttributes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  UIKBTree *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("keyAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = self;
    -[UIKBTree subtrees](self, "subtrees");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v10, "attributeSet:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "subtrees");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v23;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v23 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "subtrees");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObjectsFromArray:", v17);

                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v14);
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

    -[UIKBTree cache](v21, "cache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v4, CFSTR("keyAttributes"));

  }
  v19 = v4;

  return v19;
}

- (void)clearTransientCaches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("keys"));

  -[UIKBTree cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("geometries"));

  -[UIKBTree cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("keyAttributes"));

  -[UIKBTree cache](self, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("layoutName"));

  -[UIKBTree cache](self, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("isLetters"));

  -[UIKBTree cache](self, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("isScaled"));

  -[UIKBTree cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("isGenerated"));

  -[UIKBTree cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", CFSTR("resizingOffset"));

  -[UIKBTree cache](self, "cache");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("isKanaPlane"));

}

- (id)keysOrderedByPositionWithoutZip
{
  void *v2;
  void *v3;

  -[UIKBTree keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingFunction:context:", keyPositionSort, MEMORY[0x1E0C9AAA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keysOrderedByPositionRTL
{
  void *v2;
  void *v3;

  -[UIKBTree keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingFunction:context:", keyPositionSort, MEMORY[0x1E0C9AAB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)geometriesOrderedByPosition
{
  void *v2;
  void *v3;

  -[UIKBTree geometries](self, "geometries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingFunction:context:", keyPositionSort, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keyByKeyName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  nameByRemovingHash(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[UIKBTree keys](self, "keys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "unhashedName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)keysByKeyName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  nameByRemovingHash(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIKBTree keys](self, "keys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "unhashedName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)keysWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIKBTree keys](self, "keys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeOfString:", v4);

          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)keysWithRepresentedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIKBTree keys](self, "keys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "fullRepresentedString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)keysWithInteractionTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIKBTree keys](self, "keys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "interactionType"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)keysExcludingEmptyKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKBTree keysWithString:](self, "keysWithString:", CFSTR("Empty-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[UIKBTree keys](self, "keys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeObjectsInArray:", v3);
  }
  else
  {
    -[UIKBTree keys](self, "keys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)usesAutoShift
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("autoshift"));
}

- (id)alternateKeyplaneName
{
  void *v3;

  if (!+[UIKeyboardLayout _showSmallDisplayKeyplane](UIKeyboardLayout, "_showSmallDisplayKeyplane")
    || (-[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("more-alternate-small-display")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("more-alternate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[UIKBTree name](self, "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (BOOL)isAlphabeticPlane
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("is-alphabetic-plane"));
}

- (BOOL)diacriticForwardCompose
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("diacritic-forward-compose"));
}

- (BOOL)shouldSkipCandidateSelectionForVariants
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("shouldskipcandidateselectionforvariants"));
}

- (BOOL)shouldSuppressDragRetest
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("shouldsuppressdragretest"));
}

- (BOOL)noLanguageIndicator
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("no-language-indicator"));
}

- (BOOL)usesAdaptiveKeys
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("adaptive-keys"));
}

- (BOOL)usesKeyCharging
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("keycharging"));
}

- (BOOL)looksLikeShiftAlternate
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("looks-like-shift-alternate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2 && objc_msgSend(v2, "integerValue") != 47 && objc_msgSend(v3, "integerValue") != 25;

  return v4;
}

- (BOOL)isLetters
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[UIKBTree cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("isLetters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIKBTree name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("Letters")) != 0x7FFFFFFFFFFFFFFFLL;

    -[UIKBTree cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("isLetters"));

  }
  -[UIKBTree cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("isLetters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (BOOL)isGenerated
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("isGenerated"));
}

- (void)setIsGenerated:(BOOL)a3
{
  void *v4;
  id v5;

  -[UIKBTree cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "setObject:forKey:", &unk_1E1A98280, CFSTR("isGenerated"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("isGenerated"));

}

- (double)primaryKeylayoutWidthRatio
{
  double v3;
  double v4;
  double v5;

  -[UIKBTree keyUnionFrame](self, "keyUnionFrame");
  v4 = v3;
  -[UIKBTree frame](self, "frame");
  return v4 / v5;
}

- (int)dragThreshold
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("drag-threshold"));
}

- (BOOL)supportsContinuousPath
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("supports-continuous-path"));
}

- (BOOL)supportsSupplementalDisplayString
{
  void *v2;
  char v3;

  -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("KBhint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", 0x1E174FFA0);

  return v3;
}

- (BOOL)usesControlKeyAppearance
{
  void *v2;
  char v3;

  -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("KBhint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ControlLike"));

  return v3;
}

- (BOOL)looksLike:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a3, "componentName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree shiftAlternateKeyplaneName](self, "shiftAlternateKeyplaneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7 && -[UIKBTree looksExactlyLikeShiftAlternate](self, "looksExactlyLikeShiftAlternate");
}

- (id)findLeftMoreKey
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIKBTree cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("More-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend(v4, "frame", (_QWORD)v16);
        v12 = v11;
        objc_msgSend(v10, "frame");
        if (v12 > v13)
        {
          v14 = v10;

          v4 = v14;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updateDictationKeyOnNumberPads:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[UIKBTree keys](self, "keys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      objc_msgSend(v10, "setVisible:", 1);
      if (v7)
        break;
      if (objc_msgSend(v10, "interactionType") == 5)
        v7 = v10;
      else
        v7 = 0;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_26;
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("NumberPad-Dot"));

    if (v13)
    {
      if (!v3)
      {
        objc_msgSend(v11, "shape");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBShape shapeByCombining:withShape:](UIKBShape, "shapeByCombining:withShape:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setShape:", v16);

      }
      v17 = v7;
      v18 = v3;
    }
    else
    {
      if (v3)
      {
        objc_msgSend(v7, "shape");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "shape");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBShape shapeByCombining:withShape:](UIKBShape, "shapeByCombining:withShape:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v7;
      }
      else
      {
        objc_msgSend(v11, "shape");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shape");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBShape shapeByCombining:withShape:](UIKBShape, "shapeByCombining:withShape:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v11;
      }
      objc_msgSend(v22, "setShape:", v21);

      objc_msgSend(v7, "setVisible:", v3);
      v18 = v3 ^ 1;
      v17 = v11;
    }
    objc_msgSend(v17, "setVisible:", v18);
  }
  else
  {
    v7 = 0;
LABEL_19:
    v11 = v4;
  }

LABEL_26:
}

void __40__UIKBTree_mergeKeyNames_inRightToLeft___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "factors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subsumeDisappearingKeyName:intoKeyName:factors:inRightToLeft:", v8, v9, v10, *(unsigned __int8 *)(a1 + 88));

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v11 >= objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    *a4 = 1;
    v12 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 48), "subarrayWithRange:", a3 + 1, objc_msgSend(*(id *)(a1 + 48), "count") - (a3 + 1));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

  }
}

- (id)rightSpaceKey
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  double MinX;
  void *v7;
  id v8;
  CGRect v10;
  CGRect v11;

  -[UIKBTree cachedKeysByKeyName:](self, "cachedKeysByKeyName:", CFSTR("Space-Key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(v2, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 >= 2)
  {
    objc_msgSend(v2, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    MinX = CGRectGetMinX(v10);
    objc_msgSend(v5, "frame");
    if (MinX >= CGRectGetMinX(v11))
      v7 = v4;
    else
      v7 = v5;
    v8 = v7;

    v4 = v8;
  }

  return v4;
}

- (void)clearManualAddedKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Writeboard-Key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree removeKeyFromCachedKeyList:](self, "removeKeyFromCachedKeyList:", v3);
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Dynamic-Non-Roman-to-Roman-Switch-Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBTree removeKeyFromCachedKeyList:](self, "removeKeyFromCachedKeyList:", v4);
  -[UIKBTree keysetCanContainWriteboardKey](self, "keysetCanContainWriteboardKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v19 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "name", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Writeboard-Key"));

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v13, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Dynamic-Non-Roman-to-Roman-Switch-Key"));

            if (!v17)
              continue;
          }
          objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v8, "removeObjectsInArray:", v7);
    v6 = v18;
    v4 = v19;
  }

}

- (id)keysetCanContainWriteboardKey
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  char v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v45;
    v34 = v4;
    v32 = *(_QWORD *)v45;
    while (1)
    {
      v8 = 0;
      v33 = v6;
      do
      {
        if (*(_QWORD *)v45 != v7)
        {
          v9 = v8;
          objc_enumerationMutation(v4);
          v8 = v9;
        }
        v35 = v8;
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        objc_msgSend(v10, "name", v32);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v10;
        if (objc_msgSend(v11, "containsString:", CFSTR("Control")))
        {

        }
        else
        {
          objc_msgSend(v10, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsString:", CFSTR("split-right"));

          v10 = v37;
          if (!v13)
            goto LABEL_47;
        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v10, "keySet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "subtrees");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v15;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (!v16)
          goto LABEL_46;
        v17 = v16;
        v18 = *(_QWORD *)v41;
        v36 = *(_QWORD *)v41;
        while (2)
        {
          v19 = 0;
          v38 = v17;
          do
          {
            if (*(_QWORD *)v41 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v19);
            if (objc_msgSend(v20, "displayRowHint") == 4
              || objc_msgSend(v20, "displayRowHint") == 5)
            {
              goto LABEL_52;
            }
            if (((-[UIKBTree visualStyling](self, "visualStyling") & 0x3F) == 1
               || (-[UIKBTree visualStyling](self, "visualStyling") & 0x3F) == 0x18
               || (-[UIKBTree visualStyling](self, "visualStyling") & 0x3F) == 0x19
               || (-[UIKBTree visualStyling](self, "visualStyling") & 0x3F) == 0x1A
               || (-[UIKBTree visualStyling](self, "visualStyling") & 0x3F) == 0x17)
              && objc_msgSend(v20, "displayRowHint") == 2)
            {
              objc_msgSend(v10, "name");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v2, "containsString:", CFSTR("Handwriting")))
              {

LABEL_52:
                objc_msgSend(v20, "subtrees");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                v4 = v34;
                goto LABEL_53;
              }
              if (!-[UIKBTree isSplit](self, "isSplit"))
                goto LABEL_39;
              v21 = 1;
            }
            else
            {
              if (!-[UIKBTree isSplit](self, "isSplit"))
                goto LABEL_44;
              v21 = 0;
            }
            objc_msgSend(v20, "subtrees");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v22, "count"))
            {

              v18 = v36;
              v17 = v38;
              if ((v21 & 1) == 0)
                goto LABEL_44;
LABEL_39:

              goto LABEL_44;
            }
            objc_msgSend(v20, "subtrees");
            v23 = (id)objc_claimAutoreleasedReturnValue();
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v49;
              while (2)
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v49 != v27)
                    objc_enumerationMutation(v24);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "interactionType") == 6)
                  {
                    v29 = 1;
                    goto LABEL_41;
                  }
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
                if (v26)
                  continue;
                break;
              }
              v29 = 0;
            }
            else
            {
              v29 = 0;
            }
LABEL_41:

            v10 = v37;
            if ((v21 & 1) != 0)

            v18 = v36;
            v17 = v38;
            if ((v29 & 1) != 0)
              goto LABEL_52;
LABEL_44:
            ++v19;
          }
          while (v19 != v17);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          v4 = v34;
          v7 = v32;
          if (v17)
            continue;
          break;
        }
LABEL_46:

        v6 = v33;
LABEL_47:
        v8 = v35 + 1;
      }
      while (v35 + 1 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      v30 = 0;
      if (!v6)
        goto LABEL_53;
    }
  }
  v30 = 0;
LABEL_53:

  return v30;
}

- (id)shapeFromFrame:(CGRect)a3 leftPadding:(double)a4 rightPadding:(double)a5
{
  return -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x + a4, a3.origin.y + 0.0, a3.size.width - (a4 + a5), a3.size.height);
}

- (BOOL)addMessagesWriteboardKeyOrRomanSwitchIfDismissKey:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double MinX;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double MidX;
  double Width;
  id v24;
  CGFloat v25;
  CGFloat MaxX;
  CGFloat v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  BOOL v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  uint64_t i;
  double v84;
  uint64_t v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  CGFloat v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v107;
  CGFloat v108;
  double v109;
  double v110;
  double x;
  CGFloat v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  CGFloat v120;
  void *v121;
  void *v122;
  CGFloat v123;
  double v124;
  void *v125;
  double rect;
  double Height;
  double MinY;
  _BOOL4 v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  _QWORD v139[5];
  id v140;
  double v141;
  double v142;
  double v143[4];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;
  CGRect v155;
  CGRect v156;
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

  v3 = a3;
  v154 = *MEMORY[0x1E0C80C00];
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Dismiss-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree rightSpaceKey](self, "rightSpaceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Return-Key"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree cachedKeysByKeyName:](self, "cachedKeysByKeyName:", CFSTR("More-Key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Handwriting-Input"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBTree firstKeyplaneSwitchKey](self, "firstKeyplaneSwitchKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = v3;
  if (v9)
  {
    -[UIKBTree firstKeyplaneSwitchKey](self, "firstKeyplaneSwitchKey");
    v138 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paddedFrame");
    MinX = CGRectGetMinX(v155);
    objc_msgSend(v7, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paddedFrame");
    objc_msgSend(v7, "objectAtIndex:", MinX < CGRectGetMinX(v156));
    v138 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "paddedFrame");
    v14 = CGRectGetMinX(v157);
    objc_msgSend(v7, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "paddedFrame");
    objc_msgSend(v7, "objectAtIndex:", v14 >= CGRectGetMinX(v158));
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v16 = 0;
  if (objc_msgSend(v7, "count") == 1 && v8)
  {
    objc_msgSend(v7, "firstObject");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v135;
LABEL_8:
    -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree cachedKeysByKeyName:](self, "cachedKeysByKeyName:", CFSTR("Modify-For-Writeboard-Key"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_171);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v21, "displayRowHint");
    v136 = v18;
    if ((_DWORD)v19 != objc_msgSend(v18, "displayRowHint"))
    {

      v21 = 0;
      v20 = 0;
    }
    v16 = 0;
    if (!v6 || !v138 || !v5)
      goto LABEL_60;
    if (-[UIKBTree isSplit](self, "isSplit"))
    {
      objc_msgSend(v6, "frame");
      MidX = CGRectGetMidX(v159);
      -[UIKBTree frame](self, "frame");
      if (MidX < CGRectGetMidX(v160))
      {
        objc_msgSend(v21, "frame");
        Width = CGRectGetWidth(v161);
        objc_msgSend(v17, "frame");
        if (Width <= CGRectGetWidth(v162))
        {
          v16 = 0;
LABEL_60:
          v64 = v135;

          goto LABEL_61;
        }
        v24 = v21;

        v21 = 0;
        v20 = 0;
        v6 = v24;
      }
    }
    objc_msgSend(v17, "frame");
    v123 = CGRectGetMinX(v163);
    objc_msgSend(v17, "paddedFrame");
    v25 = CGRectGetMinX(v164);
    objc_msgSend(v17, "frame");
    MaxX = CGRectGetMaxX(v165);
    objc_msgSend(v17, "paddedFrame");
    v27 = CGRectGetMaxX(v166);
    v28 = 0.0;
    if (-[UIKBTree isSplit](self, "isSplit"))
    {
      v29 = v137;
      objc_msgSend(v137, "frame");
      v30 = CGRectGetMaxX(v167);
      objc_msgSend(v18, "frame");
      v31 = CGRectGetMaxX(v168);
      if (v30 <= v31)
        v32 = v137;
      else
        v32 = v18;
      if (v30 <= v31)
        v29 = v18;
      objc_msgSend(v32, "frame");
      v33 = CGRectGetMaxX(v169);
      objc_msgSend(v29, "frame");
      v34 = CGRectGetMaxX(v170);
      if (!objc_msgSend(v17, "visible") || objc_msgSend(v18, "visible"))
        v33 = v34;
      objc_msgSend(v17, "frame");
      v28 = CGRectGetMinX(v171) - v33;
    }
    v112 = v27;
    v114 = MaxX;
    v120 = v25;
    v125 = v17;
    objc_msgSend(v6, "frame");
    v131 = v36;
    v132 = v35;
    v110 = v37;
    v130 = v38;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "frame");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    objc_msgSend(v137, "frame");
    MinY = CGRectGetMinY(v172);
    objc_msgSend(v137, "frame");
    Height = CGRectGetHeight(v173);
    objc_msgSend(v5, "frame");
    v49 = v48;
    v133 = v50;
    v134 = v51;
    v53 = v52;
    v54 = v41;
    v55 = v43;
    v56 = v45;
    v57 = v47;
    if (v21)
      objc_msgSend(v21, "frame", v41, v43, v45, v47);
    v191.origin.x = v49;
    v191.origin.y = v133;
    v191.size.height = v134;
    v191.size.width = v53;
    v174 = CGRectUnion(*(CGRect *)&v54, v191);
    v108 = CGRectGetWidth(v174);
    if (-[UIKBTree isSplit](self, "isSplit"))
    {
      if (v21)
      {
        objc_msgSend(v137, "frame");
        v58 = CGRectGetWidth(v175);
        objc_msgSend(v17, "frame");
        v59 = (v58 + CGRectGetWidth(v176)) * 0.5;
      }
      else
      {
        v179.origin.x = v41;
        v179.origin.y = v43;
        v179.size.width = v45;
        v179.size.height = v47;
        v65 = CGRectGetWidth(v179);
        objc_msgSend(v137, "frame");
        v66 = v65 <= CGRectGetWidth(v180);
        v59 = v45;
        if (!v66)
        {
          objc_msgSend(v137, "frame");
          v59 = CGRectGetWidth(v181);
        }
      }
      v67 = v17;
    }
    else
    {
      objc_msgSend(v17, "frame");
      v59 = CGRectGetWidth(v177);
      if (v8)
      {
        v178.origin.x = v41;
        v178.origin.y = v43;
        v178.size.width = v45;
        v178.size.height = v47;
        v60 = (v59 + CGRectGetWidth(v178)) * 0.5;
        v61 = v41;
        v62 = v43;
        v63 = v47;
        v59 = v60;
LABEL_40:
        v107 = v7;
        v122 = v5;
        v68 = CGRectGetWidth(*(CGRect *)&v61);
        objc_msgSend(v18, "frame");
        v69 = CGRectGetWidth(v182);
        v183.origin.x = v41;
        v183.origin.y = v43;
        v117 = v59;
        v183.size.width = v59;
        v183.size.height = v47;
        v70 = v28 + CGRectGetWidth(v183);
        v184.origin.x = 0.0;
        v184.size.height = Height;
        v184.origin.y = MinY;
        rect = v68;
        v184.size.width = v68;
        v71 = v28 + v70 + CGRectGetWidth(v184);
        v185.origin.x = v49;
        v185.origin.y = v133;
        v185.size.height = v134;
        v116 = v69;
        v185.size.width = v69;
        v72 = CGRectGetWidth(v185) + v71;
        v148 = 0u;
        v149 = 0u;
        v150 = 0u;
        v151 = 0u;
        v73 = v20;
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v148, v153, 16);
        v118 = v43;
        v119 = v47;
        if (v74)
        {
          v75 = v74;
          v76 = *(_QWORD *)v149;
          v77 = v123;
          v78 = v120;
          v79 = v108;
          v80 = v110;
          v82 = v112;
          v81 = v114;
          do
          {
            for (i = 0; i != v75; ++i)
            {
              if (*(_QWORD *)v149 != v76)
                objc_enumerationMutation(v73);
              objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * i), "frame", v107);
              v72 = v72 + v28 + CGRectGetWidth(v186);
            }
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v148, v153, 16);
          }
          while (v75);
        }
        else
        {
          v77 = v123;
          v78 = v120;
          v79 = v108;
          v80 = v110;
          v82 = v112;
          v81 = v114;
        }
        v121 = v6;
        v113 = vabdd_f64(v81, v82);
        v115 = vabdd_f64(v77, v78);

        v84 = v80 - ceil(v72 - v79);
        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v20 = v73;
        v85 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v144, v152, 16);
        v87 = v131;
        v86 = v132;
        v124 = v84;
        v88 = v130;
        if (v85)
        {
          v89 = v85;
          v90 = *(_QWORD *)v145;
          v87 = v131;
          v86 = v132;
          v88 = v130;
          do
          {
            v91 = 0;
            v92 = v87;
            v93 = v84;
            v94 = v88;
            do
            {
              if (*(_QWORD *)v145 != v90)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * v91), "frame", v107);
              v87 = v95;
              v84 = v96;
              v88 = v97;
              v187.origin.x = v86;
              v187.origin.y = v92;
              v187.size.width = v93;
              v187.size.height = v94;
              v86 = v28 + CGRectGetMaxX(v187);
              v143[0] = v86;
              v143[1] = v87;
              v143[2] = v84;
              v143[3] = v88;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v143, "{CGRect={CGPoint=dd}{CGSize=dd}}");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v98);

              ++v91;
              v92 = v87;
              v93 = v84;
              v94 = v88;
            }
            while (v89 != v91);
            v89 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v144, v152, 16);
          }
          while (v89);
        }

        v188.origin.x = v86;
        v188.origin.y = v87;
        v188.size.width = v84;
        v188.size.height = v88;
        v99 = v28 + CGRectGetMaxX(v188);
        v189.origin.x = v99;
        v189.origin.y = v118;
        v189.size.width = v117;
        v189.size.height = v119;
        v190.origin.x = v28 + CGRectGetMaxX(v189);
        x = v190.origin.x;
        v190.origin.y = MinY;
        v190.size.width = rect;
        v190.size.height = Height;
        v109 = v28 + CGRectGetMaxX(v190);
        -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v132, v131, v124, v130, v115, v113);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v121;
        objc_msgSend(v121, "setShape:", v100);

        v139[0] = MEMORY[0x1E0C809B0];
        v139[1] = 3221225472;
        v139[2] = __62__UIKBTree_addMessagesWriteboardKeyOrRomanSwitchIfDismissKey___block_invoke_2;
        v139[3] = &unk_1E16CEF40;
        v139[4] = self;
        v140 = v39;
        v141 = v115;
        v142 = v113;
        v101 = v39;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v139);
        -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v99, v118, v117, v119, v115, v113);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setShape:", v102);

        -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v109, v133, v116, v134, v115, v113);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v122;
        objc_msgSend(v122, "setShape:", v103);

        -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", x, MinY, rect, Height, v115, v113);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v122, "rendering");
        if (v129)
          -[UIKBTree addWriteboardKeyToCachedKeyListWithShape:rendering:](self, "addWriteboardKeyToCachedKeyListWithShape:rendering:", v104, v105);
        else
          -[UIKBTree addRomanSwitchToCachedKeyListWithShape:rendering:](self, "addRomanSwitchToCachedKeyListWithShape:rendering:", v104, v105);
        v7 = v107;
        v17 = v125;

        v16 = 1;
        goto LABEL_60;
      }
      v67 = v137;
    }
    objc_msgSend(v67, "frame");
    goto LABEL_40;
  }
  v64 = v135;
LABEL_61:

  return v16;
}

uint64_t __62__UIKBTree_addMessagesWriteboardKeyOrRomanSwitchIfDismissKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  CGRect v19;
  CGRect v20;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "frame");
  objc_msgSend(v4, "numberWithDouble:", CGRectGetMinX(v19));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  objc_msgSend(v7, "numberWithDouble:", CGRectGetMinX(v20));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v6, "compare:", v16);

  return v17;
}

void __62__UIKBTree_addMessagesWriteboardKeyOrRomanSwitchIfDismissKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CGRectValue");
  objc_msgSend(v4, "shapeFromFrame:leftPadding:rightPadding:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShape:", v7);

}

- (BOOL)addMessagesWriteboardKeyOrRomanSwitchIfNoDismissKey:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinX;
  double v21;
  double MaxX;
  double v23;
  double v24;
  double v25;
  double v26;
  double Height;
  double v28;
  CGFloat MaxY;
  double v30;
  BOOL v31;
  double v32;
  double width;
  CGFloat v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v3 = a3;
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Return-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rendering");
  objc_msgSend(v5, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "frame");
  v46 = v17;
  v47 = v16;
  v49 = v19;
  v50 = v18;
  objc_msgSend(v5, "frame");
  MinX = CGRectGetMinX(v51);
  objc_msgSend(v5, "paddedFrame");
  v21 = CGRectGetMinX(v52);
  objc_msgSend(v5, "frame");
  MaxX = CGRectGetMaxX(v53);
  objc_msgSend(v5, "paddedFrame");
  v23 = CGRectGetMaxX(v54);
  if (v5 && (v24 = v23, objc_msgSend(v5, "visible")))
  {
    v25 = vabdd_f64(MinX, v21);
    v26 = vabdd_f64(MaxX, v24);
    if (v7 <= 0x22 && ((1 << v7) & 0x600000002) != 0
      || (_DWORD)v7 == 9 && !objc_msgSend(v6, "visible")
      || (-[UIKBTree visualStyling](self, "visualStyling") & 0xFF0000) == 0xB0000)
    {
      v55.origin.x = v9;
      v55.origin.y = v11;
      v55.size.width = v13;
      v55.size.height = v15;
      Height = CGRectGetHeight(v55);
      v15 = ceil(Height * 0.5);
      v56.origin.x = v9;
      v56.origin.y = v11;
      v56.size.width = v13;
      v56.size.height = v15;
      v28 = ceil(Height - CGRectGetHeight(v56));
      if ((_DWORD)v7 == 9 || (-[UIKBTree visualStyling](self, "visualStyling") & 0xFF0000) == 0xB0000)
      {
        v57.origin.x = v9;
        v57.origin.y = v11;
        v57.size.width = v13;
        v57.size.height = v28;
        MaxY = CGRectGetMaxY(v57);
        v30 = v11;
        v11 = MaxY;
      }
      else
      {
        v65.origin.x = v9;
        v65.origin.y = v11;
        v65.size.width = v13;
        v65.size.height = v15;
        v30 = CGRectGetMaxY(v65);
      }
      -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v30, v13, v28, v25, v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setShape:", v38);
    }
    else
    {
      if (!v6)
        goto LABEL_29;
      if (!objc_msgSend(v6, "visible"))
        goto LABEL_29;
      v58.size.width = v46;
      v58.origin.x = v47;
      v58.size.height = v49;
      v58.origin.y = v50;
      v32 = CGRectGetMaxX(v58);
      v59.origin.x = v9;
      v59.origin.y = v11;
      v59.size.width = v13;
      v59.size.height = v15;
      if (v32 > CGRectGetMaxX(v59))
      {
        v60.origin.x = v9;
        v60.origin.y = v11;
        v60.size.width = v13;
        v60.size.height = v15;
        v72.size.width = v46;
        v72.origin.x = v47;
        v72.size.height = v49;
        v72.origin.y = v50;
        v61 = CGRectUnion(v60, v72);
        width = v61.size.width;
        v13 = ceil(v61.size.width / 3.0);
        v61.origin.x = v9;
        v61.origin.y = v11;
        v61.size.width = v13;
        v61.size.height = v15;
        v34 = CGRectGetMaxX(v61);
        v62.origin.x = v9;
        v62.origin.y = v11;
        v62.size.width = v13;
        v62.size.height = v15;
        v35 = width - CGRectGetWidth(v62);
        v63.origin.x = v34;
        v63.origin.y = v11;
        v63.size.width = v13;
        v63.size.height = v15;
        v48 = ceil(v35 - CGRectGetWidth(v63));
        v64.origin.x = v34;
        v64.origin.y = v11;
        v64.size.width = v13;
        v64.size.height = v15;
        v36 = CGRectGetMaxX(v64);
        v7 = objc_msgSend(v6, "rendering");
        -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v11, v13, v15, v25, v26);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setShape:", v37);

        -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v36, v50, v48, v49, v25, v26);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setShape:", v38);
        v9 = v34;
      }
      else
      {
LABEL_29:
        if ((_DWORD)v7 == 9 && objc_msgSend(v6, "visible"))
        {
          v66.size.width = v46;
          v9 = v47;
          v66.origin.x = v47;
          v66.origin.y = v50;
          v66.size.height = v49;
          v41 = CGRectGetWidth(v66);
          v13 = ceil(v41 * 0.5);
          v67.origin.x = v47;
          v67.origin.y = v50;
          v67.size.width = v13;
          v67.size.height = v49;
          v42 = ceil(v41 - CGRectGetWidth(v67));
          v68.origin.x = v47;
          v68.origin.y = v50;
          v68.size.width = v13;
          v68.size.height = v49;
          -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", CGRectGetMaxX(v68), v50, v42, v49, v25, v26);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setShape:", v38);
          v7 = 9;
          v11 = v50;
          v15 = v49;
        }
        else
        {
          v69.origin.x = v9;
          v69.origin.y = v11;
          v69.size.width = v13;
          v69.size.height = v15;
          v43 = CGRectGetWidth(v69);
          v44 = ceil(v43 * 0.5);
          v70.origin.x = v9;
          v70.origin.y = v11;
          v70.size.width = v44;
          v70.size.height = v15;
          v13 = ceil(v43 - CGRectGetWidth(v70));
          v71.origin.x = v9;
          v71.origin.y = v11;
          v71.size.width = v44;
          v71.size.height = v15;
          v45 = CGRectGetMaxX(v71);
          -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v11, v44, v15, v25, v26);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setShape:", v38);
          v9 = v45;
        }
      }
    }

    -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v11, v13, v15, v25, v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[UIKBTree addWriteboardKeyToCachedKeyListWithShape:rendering:](self, "addWriteboardKeyToCachedKeyListWithShape:rendering:", v39, v7);
    else
      -[UIKBTree addRomanSwitchToCachedKeyListWithShape:rendering:](self, "addRomanSwitchToCachedKeyListWithShape:rendering:", v39, v7);

    v31 = 1;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)addWriteboardKeyToCachedKeyListWithShape:(id)a3 rendering:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  -[UIKBTree keysetCanContainWriteboardKey](self, "keysetCanContainWriteboardKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", CFSTR("Writeboard-Key"));
    objc_msgSend(v8, "setDisplayString:", CFSTR("Writeboard"));
    objc_msgSend(v8, "setRepresentedString:", &stru_1E16EDF20);
    objc_msgSend(v8, "setDisplayType:", 53);
    objc_msgSend(v8, "setInteractionType:", 40);
    objc_msgSend(v8, "setShape:", v10);
    objc_msgSend(v8, "setVisible:", 1);
    objc_msgSend(v8, "setDisplayRowHint:", 4);
    objc_msgSend(v8, "setDisplayTypeHint:", 3);
    objc_msgSend(v8, "setState:", 2);
    objc_msgSend(v8, "setRendering:", v4);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_176_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterUsingPredicate:", v9);

    objc_msgSend(v7, "addObject:", v8);
    -[UIKBTree removeKeyFromAllCachedLists:](self, "removeKeyFromAllCachedLists:", v8);
    -[UIKBTree addkeyToCachedKeyList:](self, "addkeyToCachedKeyList:", v8);

  }
}

uint64_t __63__UIKBTree_addWriteboardKeyToCachedKeyListWithShape_rendering___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(CFSTR("Writeboard-Key"), "isEqualToString:", v2) ^ 1;

  return v3;
}

- (void)addRomanSwitchToCachedKeyListWithShape:(id)a3 rendering:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  -[UIKBTree keysetCanContainWriteboardKey](self, "keysetCanContainWriteboardKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    +[UIKBTree treeOfType:](UIKBTree, "treeOfType:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", CFSTR("Dynamic-Non-Roman-to-Roman-Switch-Key"));
    objc_msgSend(v8, "setDisplayString:", CFSTR("abc"));
    objc_msgSend(v8, "setRepresentedString:", CFSTR("ASCIICapable"));
    objc_msgSend(v8, "setLocalizationKey:", CFSTR("UI-abc"));
    objc_msgSend(v8, "setDisplayType:", 0);
    objc_msgSend(v8, "setInteractionType:", 9);
    objc_msgSend(v8, "setShape:", v10);
    objc_msgSend(v8, "setVisible:", 1);
    objc_msgSend(v8, "setDisplayRowHint:", 4);
    objc_msgSend(v8, "setDisplayTypeHint:", 3);
    objc_msgSend(v8, "setState:", 2);
    objc_msgSend(v8, "setRendering:", v4);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_183_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterUsingPredicate:", v9);

    objc_msgSend(v7, "addObject:", v8);
    -[UIKBTree removeKeyFromAllCachedLists:](self, "removeKeyFromAllCachedLists:", v8);
    -[UIKBTree addkeyToCachedKeyList:](self, "addkeyToCachedKeyList:", v8);

  }
}

uint64_t __61__UIKBTree_addRomanSwitchToCachedKeyListWithShape_rendering___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(CFSTR("Dynamic-Non-Roman-to-Roman-Switch-Key"), "isEqualToString:", v2) ^ 1;

  return v3;
}

- (BOOL)addMessagesWriteboardKeyOrRomanSwitch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  BOOL v7;
  BOOL v8;

  v3 = a3;
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Dismiss-Key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKBTree visualStyle](self, "visualStyle");
  if (!v5 || v6 == 101)
    v7 = -[UIKBTree addMessagesWriteboardKeyOrRomanSwitchIfNoDismissKey:](self, "addMessagesWriteboardKeyOrRomanSwitchIfNoDismissKey:", v3);
  else
    v7 = -[UIKBTree addMessagesWriteboardKeyOrRomanSwitchIfDismissKey:](self, "addMessagesWriteboardKeyOrRomanSwitchIfDismissKey:", v3);
  v8 = v7;

  return v8;
}

- (void)_mutateKeys:(id)a3 scale:(double)a4 withShapeOperation:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke;
  v18[3] = &unk_1E16CEF88;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v12, v11);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke_2;
  v14[3] = &unk_1E16CEFB0;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  v16 = v17;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  _Block_object_dispose(v17, 8);
}

void __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "visible"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "shape");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "visible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShape:", v3);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (id)_horizontallyCoincidentKeysWithKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "paddedFrame");
    v7 = v6;
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[UIKBTree keys](self, "keys", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (v16 != v5)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "paddedFrame");
            if (v17 > v7)
            {
              objc_msgSend(v16, "paddedFrame");
              if (vabdd_f64(v18, v9) < 0.00000011920929)
                objc_msgSend(v10, "addObject:", v16);
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (void)centerKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGRect v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__UIKBTree_centerKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __36__UIKBTree_centerKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByCenteringShapes:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)centerWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGRect v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__UIKBTree_centerWhilePreservingLayoutWithKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __61__UIKBTree_centerWhilePreservingLayoutWithKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByCenteringShapesPreservingLayout:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)centerHorizontallyWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGRect v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__UIKBTree_centerHorizontallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __73__UIKBTree_centerHorizontallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByHorizontallyCenteringShapesPreservingLayout:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)centerVerticallyWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGRect v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__UIKBTree_centerVerticallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __71__UIKBTree_centerVerticallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByVerticallyCenteringShapesPreservingLayout:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)repositionKeys:(id)a3 withOffset:(CGPoint)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGPoint v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__UIKBTree_repositionKeys_withOffset_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __44__UIKBTree_repositionKeys_withOffset_scale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shapesByRepositioningShapes:withOffset:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)resizeKeys:(id)a3 withOffset:(CGPoint)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGPoint v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__UIKBTree_resizeKeys_withOffset_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __40__UIKBTree_resizeKeys_withOffset_scale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shapesByResizingShapes:withOffset:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)insetKeys:(id)a3 withInsets:(UIEdgeInsets)a4 scale:(double)a5
{
  _QWORD v5[4];
  UIEdgeInsets v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__UIKBTree_insetKeys_withInsets_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __39__UIKBTree_insetKeys_withInsets_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByInsettingShapes:withInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)scaleKeys:(id)a3 withFactor:(CGSize)a4 scale:(double)a5
{
  _QWORD v5[4];
  CGSize v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__UIKBTree_scaleKeys_withFactor_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  v6 = a4;
  -[UIKBTree _mutateKeys:scale:withShapeOperation:](self, "_mutateKeys:scale:withShapeOperation:", a3, v5, a5);
}

uint64_t __39__UIKBTree_scaleKeys_withFactor_scale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shapesByScalingShapes:factor:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)removeKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[UIKBTree removeKeyFromAllCachedLists:](self, "removeKeyFromAllCachedLists:", v4);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[UIKBTree subtrees](self, "subtrees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v20 = *(_QWORD *)v29;
      do
      {
        v8 = 0;
        v21 = v6;
        do
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
          if (objc_msgSend(v9, "type") == 3)
          {
            v23 = v8;
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v9, "keySet");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "subtrees");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v25;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v25 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                  objc_msgSend(v16, "subtrees");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "containsObject:", v4);

                  if (v18)
                  {
                    objc_msgSend(v16, "subtrees");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "removeObject:", v4);

                    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", 0, CFSTR("KBunionFrame"));
                    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", 0, CFSTR("KBunionPaddedFrame"));
                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v13);
            }

            v7 = v20;
            v6 = v21;
            v8 = v23;
          }
          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v6);
    }

  }
}

- (void)insertKey:(id)a3 withFrame:(CGRect)a4 andShiftKeys:(id)a5 scale:(double)a6
{
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  void *i;
  void *v23;
  double v24;
  double v25;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  -[UIKBTree cache](self, "cache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v12);

  if ((v16 & 1) == 0)
  {
    if (v12)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v17 = v13;
      v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v47;
        v20 = *MEMORY[0x1E0C9D820];
        v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v19)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v23, "frame", (_QWORD)v46);
            if (v25 != v20 || v24 != v21)
            {
              v18 = v23;
              goto LABEL_15;
            }
          }
          v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v18);
      }
LABEL_15:

      objc_msgSend(v12, "setState:", 2);
      objc_msgSend(v12, "setVisible:", 1);
      objc_msgSend(v12, "setDisplayRowHint:", objc_msgSend(v18, "displayRowHint"));
      +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v28 = v18;
      else
        v28 = v12;
      objc_msgSend(v28, "shape", (_QWORD)v46);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      if (width == -1.0)
      {
        v32 = v30;
      }
      else
      {
        objc_msgSend(v29, "frame");
        v32 = v31 - width;
      }
      v34 = 0.0;
      +[UIKBShape shapeByResizingShape:byAmount:](UIKBShape, "shapeByResizingShape:byAmount:", v29, v32, 0.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShape:", v35);

      v33 = 0.0;
      if (x != -1.0)
      {
        objc_msgSend(v12, "frame");
        v33 = x - v36;
      }
      if (y != -1.0)
      {
        objc_msgSend(v12, "frame");
        v34 = y - v37;
      }
      objc_msgSend(v12, "shape");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shapesByRepositioningShapes:withOffset:", v39, v33, v34);
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v40, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShape:", v41);

      -[UIKBTree addkeyToCachedKeyList:](self, "addkeyToCachedKeyList:", v12);
      -[UIKBTree supplementaryKeyList](self, "supplementaryKeyList");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "subtrees");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v40) = objc_msgSend(v43, "containsObject:", v12);

      if ((v40 & 1) == 0)
      {
        -[UIKBTree supplementaryKeyList](self, "supplementaryKeyList");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "subtrees");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v12);

      }
    }
    else
    {
      v33 = *MEMORY[0x1E0C9D538];
    }
    -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v13, width + v33, 0.0, a6);
  }

}

- (void)removeKey:(id)a3 andShiftKeys:(id)a4 scale:(double)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  double MinX;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIKBTree removeKey:](self, "removeKey:", v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v23);
          if (v24 != v8)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "frame", (_QWORD)v26);
            MinX = CGRectGetMinX(v32);
            v33.origin.x = v11;
            v33.origin.y = v13;
            v33.size.width = v15;
            v33.size.height = v17;
            if (MinX >= CGRectGetMaxX(v33))
              objc_msgSend(v18, "addObject:", v24);
          }
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v21);
    }

    -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v18, -v15, 0.0, a5);
  }

}

- (void)replaceKey:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  UIKBTree *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && v6 && v7 != v6)
  {
    objc_msgSend(v6, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v8, "setShape:", v10);

    objc_msgSend(v8, "setVisible:", 1);
    objc_msgSend(v8, "setDisplayRowHint:", objc_msgSend(v6, "displayRowHint"));
    -[UIKBTree removeKeyFromCachedKeyList:](self, "removeKeyFromCachedKeyList:", v6);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = self;
    -[UIKBTree subtrees](self, "subtrees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      v28 = *(_QWORD *)v36;
      do
      {
        v14 = 0;
        v29 = v12;
        do
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          if (objc_msgSend(v15, "type") == 3)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            objc_msgSend(v15, "keySet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "subtrees");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v32 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                  objc_msgSend(v22, "subtrees");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "containsObject:", v6);

                  if (v24)
                  {
                    objc_msgSend(v22, "subtrees");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "subtrees");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "replaceObjectAtIndex:withObject:", objc_msgSend(v26, "indexOfObject:", v6), v8);

                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v19);
            }

            v13 = v28;
            v12 = v29;
          }
          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v12);
    }

    self = v27;
  }
  if (v8)
    -[UIKBTree addkeyToCachedKeyList:](self, "addkeyToCachedKeyList:", v8);

}

- (void)shiftRowAndResizeLeadingControlKey:(id)a3 toSize:(CGSize)a4 scale:(double)a5
{
  double width;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  width = a4.width;
  v8 = a3;
  v13 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frame");
    width = v9 - width;
    objc_msgSend(v13, "shape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBShape shapeByResizingShape:byAmount:](UIKBShape, "shapeByResizingShape:byAmount:", v10, width, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShape:", v11);

  }
  -[UIKBTree _horizontallyCoincidentKeysWithKey:](self, "_horizontallyCoincidentKeysWithKey:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v12, -width, 0.0, a5);

}

+ (id)mergeStringForKeyName:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Space-Key")) & 1) != 0)
  {
    v4 = CFSTR("Space");
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Dictation-Key")) & 1) != 0)
  {
    v4 = CFSTR("Dict");
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("International-Key")) & 1) != 0)
  {
    v4 = CFSTR("Intl");
  }
  else if (objc_msgSend(v3, "hasSuffix:", CFSTR("Return-Key")))
  {
    v4 = CFSTR("Return");
  }
  else
  {
    v4 = CFSTR("More");
  }

  return (id)v4;
}

+ (id)shapesForControlKeyShapes:(id)a3 options:(int)a4
{
  id v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Dict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    v7 = v5;
    goto LABEL_18;
  }
  v8 = (a4 & 2) == 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", v5, 1);
  v7 = v9;
  if ((a4 & 0x40) != 0)
  {
    if ((a4 & 2) == 0 && v6)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("Return"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addRectFrom:", v20);

    }
    if ((a4 & 1) != 0)
      goto LABEL_18;
    goto LABEL_13;
  }
  if ((a4 & 0x10) == 0)
  {
    if (!v6)
      goto LABEL_47;
    v10 = a4 & 0xC;
    if ((a4 & 2) != 0)
    {
      if (v10 != 12)
        goto LABEL_47;
      objc_msgSend(v9, "objectForKey:", CFSTR("More"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:", v31, -0.3061, 0.0, 0.0, 0.0);

      objc_msgSend(v7, "objectForKey:", CFSTR("Space"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:", v33, 0.5918, 0.0, -1.0, 0.0);

      objc_msgSend(v7, "objectForKey:", CFSTR("Intl"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:", v35, -0.1837, 0.0, 1.44, 0.0);

      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 2.33;
      v17 = v13;
      v18 = v14;
      v15 = -0.1837;
    }
    else
    {
      if (v10 != 4)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("Space"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addRectFrom:", v14);
        goto LABEL_46;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("More"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:", v12, 0.5, 0.0, 0.0, 0.0);

      objc_msgSend(v7, "objectForKey:", CFSTR("Intl"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0.5;
      v16 = 1.0;
      v17 = v13;
      v18 = v14;
    }
    objc_msgSend(v17, "addRectFrom:widthFraction:heightFraction:adjustOriginXFactor:adjustOriginYFactor:", v18, v15, 0.0, v16, 0.0);
LABEL_46:

LABEL_47:
    if ((a4 & 1) != 0)
      goto LABEL_18;
    if ((a4 & 0xC) != 4 && (a4 & 2) != 0 && v6)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("Space"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addRectFrom:", v39);

      objc_msgSend(v7, "objectForKey:", CFSTR("Intl"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("Dict"));
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  v25 = (a4 >> 1) & 1;
  if (!v6)
    LOBYTE(v25) = 1;
  if ((a4 & 0x28) == 0x20)
  {
    if ((v25 & 1) == 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("More"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addRectFrom:", v27);

    }
    if ((a4 & 1) == 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("More"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 2) != 0 && v6)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addRectFrom:", v28);

        objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("Intl"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "makeLikeOther:", v23);
        goto LABEL_16;
      }
LABEL_15:
      objc_msgSend(v7, "objectForKey:", CFSTR("Intl"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addRectFrom:", v23);
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ((v25 & 1) != 0)
  {
    v29 = (a4 & 2) == 0 || v6 == 0;
    v8 = v29;
    if (!v29 && (a4 & 1) == 0)
    {
      v21 = CFSTR("Dict");
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("Intl"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Dict"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addRectFrom:", v37);

  }
  if ((a4 & 1) == 0 && v8)
  {
LABEL_13:
    v21 = CFSTR("More");
LABEL_14:
    objc_msgSend(v7, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_18:

  return v7;
}

- (void)updateMoreAndInternationalKeysWithOptions:(int)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  if (-[UIKBTree type](self, "type") == 2)
  {
    -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBTree findLeftMoreKey](self, "findLeftMoreKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interactionType") == 10 || objc_msgSend(v5, "displayType") == 14;
    if (v5 && v30)
    {
      -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Dictation-Key"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Space-Key"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Return-Key"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v5, "shape");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("More"), v12, CFSTR("Intl"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "shape");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("Dict"));

      }
      if (v8)
      {
        objc_msgSend(v8, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("Space"));

      }
      if (v9)
      {
        objc_msgSend(v9, "shape");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("Return"));

      }
      -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Handwriting-Input"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v8;
      if (v17 && (-[UIKBTree visualStyling](self, "visualStyling") & 0x3F) == 0)
        v18 = -[UIKBTree visualStyling](self, "visualStyling") & 0x40;
      else
        v18 = 0;
      v19 = v6;
      if (-[UIKBTree isSplit](self, "isSplit"))
        v20 = 8;
      else
        v20 = 0;
      if (v17)
        v21 = 1;
      else
        v21 = v19;
      if (v21)
        v22 = 16;
      else
        v22 = 0;
      +[UIKBTree shapesForControlKeyShapes:options:](UIKBTree, "shapesForControlKeyShapes:options:", v13, v22 | v18 | v20 | (32 * (-[UIKBTree visualStyle](self, "visualStyle") == 101)) | a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", CFSTR("More"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setShape:", v24);

      objc_msgSend(v23, "objectForKey:", CFSTR("Intl"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setShape:", v25);

      if (v7)
      {
        objc_msgSend(v23, "objectForKey:", CFSTR("Dict"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setShape:", v26);

      }
      if (v29)
      {
        objc_msgSend(v23, "objectForKey:", CFSTR("Space"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setShape:", v27);

      }
      if (v9)
      {
        objc_msgSend(v23, "objectForKey:", CFSTR("Return"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setShape:", v28);

      }
      objc_msgSend(v30, "setVisible:", a3 & 1);
      objc_msgSend(v7, "setVisible:", (a3 >> 1) & 1);

    }
    else
    {
      -[UIKBTree updateDictationKeyOnNumberPads:](self, "updateDictationKeyOnNumberPads:", (a3 >> 1) & 1);
    }

  }
}

- (id)supplementaryKeyList
{
  UIKBTree *v3;
  void *v4;
  UIKBTree *v5;
  void *v6;
  void *v7;
  UIKBTree *v8;
  void *v9;

  -[UIKBTree subtreeWithName:](self, "subtreeWithName:", CFSTR("SupplementaryKeylayout"));
  v3 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 3);
    -[UIKBTree setName:](v3, "setName:", CFSTR("SupplementaryKeylayout"));
    -[UIKBTree subtrees](self, "subtrees");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
  -[UIKBTree keySet](v3, "keySet");
  v5 = (UIKBTree *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 4);
    -[UIKBTree setName:](v5, "setName:", CFSTR("Supplementary-KeySet"));
    -[UIKBTree subtrees](v3, "subtrees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  -[UIKBTree subtrees](v5, "subtrees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (UIKBTree *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 7);
    -[UIKBTree setName:](v8, "setName:", CFSTR("Supplementary-KeySet_List"));
    -[UIKBTree subtrees](v5, "subtrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

  }
  return v8;
}

- (void)centerKeyplaneInRect:(CGRect)a3 scale:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  double MinX;
  double MaxX;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  _BYTE v48[128];
  _QWORD v49[3];
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v49[1] = *MEMORY[0x1E0C80C00];
  -[UIKBTree firstCachedKeyWithName:](self, "firstCachedKeyWithName:", CFSTR("Candidate-Selection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "frame");
    v13 = v12;
    objc_msgSend(v11, "frame");
    v15 = v14;
    v49[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTree centerKeys:inRect:scale:](self, "centerKeys:inRect:scale:", v16, x, v13, width, v15, a4);

  }
  -[UIKBTree keys](self, "keys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __39__UIKBTree_centerKeyplaneInRect_scale___block_invoke;
  v46[3] = &unk_1E16CF038;
  v19 = v11;
  v47 = v19;
  objc_msgSend(v18, "indexesOfObjectsPassingTest:", v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectsAtIndexes:");
  -[UIKBTree shapesForKeys:](self, "shapesForKeys:", v18);
  v20 = objc_claimAutoreleasedReturnValue();
  -[UIKBTree keys](self, "keys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v22, "removeObject:", v19);
  -[UIKBTree shapesForKeys:](self, "shapesForKeys:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v20;
  objc_msgSend(v24, "offsetForCenteringShapes:insideRect:", v20, x, y, width, height);
  v26 = v25;
  v28 = v27;
  objc_msgSend(v24, "shapesByRepositioningShapes:withOffset:", v23);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v43;
    v39 = v19;
    while (2)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v34, "frame");
        MinX = CGRectGetMinX(v50);
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        if (MinX >= CGRectGetMinX(v51))
        {
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = height;
          MaxX = CGRectGetMaxX(v52);
          objc_msgSend(v34, "frame");
          if (MaxX >= CGRectGetMaxX(v53))
            continue;
        }

        objc_msgSend(v24, "offsetForCenteringShapes:insideRect:", v23, x, y, width, height);
        v26 = v37;
        v28 = v38;
        v19 = v39;
        goto LABEL_14;
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      v19 = v39;
      if (v31)
        continue;
      break;
    }
  }

LABEL_14:
  -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v22, v26, v28, a4);

}

uint64_t __39__UIKBTree_centerKeyplaneInRect_scale___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  if (*(void **)(a1 + 32) == a2)
    return 1;
  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("Monolith")) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)shapesForKeys:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__UIKBTree_shapesForKeys___block_invoke;
  v8[3] = &unk_1E16CEF88;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __26__UIKBTree_shapesForKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "visible"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "shape");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)setGeometriesList:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBgeometriesList"));
}

- (id)activeGeometriesList
{
  void *v2;
  void *v3;

  -[UIKBTree properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("KBactiveGeometriesList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setActiveGeometriesList:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBactiveGeometriesList"));
}

- (id)activeShapesFromOutputShapes:(id)a3 inputShapes:(id)a4 inRTL:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  int v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[UIKBTree activeGeometriesList](self, "activeGeometriesList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v36 = v7;
    -[UIKBTree geometriesList](self, "geometriesList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBTree geometriesList](self, "geometriesList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtrees");
    v13 = objc_claimAutoreleasedReturnValue();

    v35 = v8;
    v33 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v34 = v9;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "geometry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v24 = v36;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v29, "geometry");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v15, "containsObject:", v30);

          if (v31)
            objc_msgSend(v37, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v26);
    }

    v8 = v35;
    v7 = v36;
    v9 = v34;
  }
  else
  {
    v37 = v7;
  }

  return v37;
}

- (void)updateVariantTypeForActions:(unsigned int)a3
{
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;

  if (!-[UIKBTree _variantType](self, "_variantType"))
  {
    if ((a3 & 0x80000) != 0)
      v5 = 8;
    else
      v5 = 1;
    if ((a3 & 0x10000) != 0)
      v6 = 7;
    else
      v6 = v5;
    if ((a3 & 0x40000) != 0)
      v7 = 3;
    else
      v7 = v6;
    if ((a3 & 0x20000) != 0)
      v8 = 4;
    else
      v8 = v7;
    -[UIKBTree setVariantType:](self, "setVariantType:", v8);
  }
}

- (void)setRepresentedString:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBrepresentedString"));
}

- (id)gestureKey
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBgestureKey"));
}

- (void)setGestureKey:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBgestureKey"));
}

- (void)setCachedGestureLayout:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBcachedGestureLayout"));
}

- (void)setSecondaryDisplayStrings:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBsecondaryDisplayStrings"));
}

- (id)secondaryRepresentedStrings
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBsecondaryRepresentedStrings"));
}

- (void)setSecondaryRepresentedStrings:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBsecondaryRepresentedStrings"));
}

- (id)highlightedVariantsList
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBhighlightedVariantsList"));
}

- (void)setHighlightedVariantsList:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBhighlightedVariantsList"));
}

- (id)selectedVariantIndices
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("KBselectedVariantIndices"));
}

- (void)setSelectedVariantIndices:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBselectedVariantIndices"));
}

- (void)setLocalizationKey:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBlocalizationKey"));
}

- (void)setDisplayType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBdisplayType"));

}

- (void)setInteractionType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBinteractionType"));

}

- (void)setVariantType:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("variant-type"));

}

- (int64_t)selectedVariantIndex
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBselectedVariantIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)setSelectedVariantIndex:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBselectedVariantIndex"));

}

- (int64_t)textAlignment
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("text-alignment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 1;

  return v4;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("text-alignment"));

}

- (void)setRendering:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("rendering"));

}

- (void)setGhost:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBghost"));

  }
  else
  {
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", 0, CFSTR("KBghost"));
  }
}

- (void)setVariantPopupBias:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("variant-popup-bias"));
}

- (id)variantPopupBias
{
  return -[UIKBTree stringForProperty:](self, "stringForProperty:", CFSTR("variant-popup-bias"));
}

- (int64_t)flickDirection
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBflickDirection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = -3;

  return v4;
}

- (int64_t)popupDirection
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBpopupDirection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 1;

  return v4;
}

- (void)setPopupDirection:(int64_t)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBpopupDirection"));

}

- (void)setDisabled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  -[UIKBTree setState:](self, "setState:", v3);
}

- (int)splitMode
{
  return -[UIKBTree intForProperty:](self, "intForProperty:", CFSTR("KBsplitMode"));
}

- (void)setSplitMode:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBsplitMode"));

}

- (BOOL)forceMultitap
{
  return -[UIKBTree BOOLForProperty:](self, "BOOLForProperty:", CFSTR("KBforceMultitap"));
}

- (void)setForceMultitap:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
    v4 = 32;
  else
    v4 = 25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v5, CFSTR("KBforceMultitap"));

}

- (BOOL)mergeAsMoreKey
{
  void *v2;
  void *v3;
  char v4;

  -[UIKBTree cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("merge-as-more-key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setMergeAsMoreKey:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIKBTree cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", &unk_1E1A98280, CFSTR("merge-as-more-key"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("merge-as-more-key"));

}

- (void)setParentKey:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("KBparentKey"));
}

- (BOOL)isExemptFromInputManagerHitTesting
{
  unsigned int v4;

  if (-[UIKBTree displayType](self, "displayType") == 49
    || -[UIKBTree variantType](self, "variantType") == 10
    || -[UIKBTree variantType](self, "variantType") == 12
    || -[UIKBTree variantType](self, "variantType") == 11
    || -[UIKBTree variantType](self, "variantType") == 13
    || -[UIKBTree hasSemiStickyVariant](self, "hasSemiStickyVariant"))
  {
    return 1;
  }
  v4 = -[UIKBTree interactionType](self, "interactionType");
  if (v4 <= 0x10)
    return (0x5FE9u >> v4) & 1;
  else
    return 1;
}

- (BOOL)allowsStartingContinuousPath
{
  unsigned int v2;

  v2 = -[UIKBTree interactionType](self, "interactionType");
  return (v2 > 0x2C) | (0xF9FFFFF918FuLL >> v2) & 1;
}

- (BOOL)allowsDelayedTapForContinuousPathDisambiguation
{
  int v2;

  v2 = -[UIKBTree interactionType](self, "interactionType");
  return v2 == 14 || v2 == 4;
}

- (BOOL)allowRetestAfterCommittingDownActions
{
  return -[UIKBTree interactionType](self, "interactionType") != 4;
}

- (BOOL)avoidsLanguageIndicator
{
  void *v2;
  int v4;
  BOOL v5;

  if (!-[UIKBTree visible](self, "visible"))
    return 1;
  v4 = -[UIKBTree displayType](self, "displayType");
  if (v4 == 4)
  {
    -[UIKBTree layoutTag](self, "layoutTag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v5 = 1;
LABEL_15:

      return v5;
    }
  }
  v5 = -[UIKBTree displayType](self, "displayType") == 13
    || -[UIKBTree displayType](self, "displayType") == 18
    || -[UIKBTree displayType](self, "displayType") == 21
    || -[UIKBTree displayType](self, "displayType") == 3
    || -[UIKBTree displayType](self, "displayType") == 5
    || -[UIKBTree displayType](self, "displayType") == 53
    || -[UIKBTree interactionType](self, "interactionType") == 17;
  if (v4 == 4)
    goto LABEL_15;
  return v5;
}

- (BOOL)modifiesKeyplane
{
  return -[UIKBTree interactionType](self, "interactionType") != 1
      && -[UIKBTree interactionType](self, "interactionType") != 15
      && -[UIKBTree interactionType](self, "interactionType") != 2
      && -[UIKBTree interactionType](self, "interactionType") != 16;
}

- (BOOL)dynamicDisplayTypeHint
{
  return self->type == 12
      || -[UIKBTree interactionType](self, "interactionType") == 13
      || -[UIKBTree interactionType](self, "interactionType") == 15;
}

- (BOOL)avoidAutoDeactivation
{
  unsigned int v2;

  v2 = -[UIKBTree displayType](self, "displayType");
  return (v2 < 0x37) & (0x40006000004012uLL >> v2);
}

- (BOOL)disablesEdgeSwipe
{
  return -[UIKBTree interactionType](self, "interactionType") == 11
      || -[UIKBTree interactionType](self, "interactionType") == 9
      || -[UIKBTree interactionType](self, "interactionType") == 4;
}

- (BOOL)hasSemiStickyVariant
{
  return 0;
}

- (BOOL)containsDividerVariant
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "displayType") == 50)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setGroupNeighbor:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("group-neighbor"));

  }
  else
  {
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", 0, CFSTR("group-neighbor"));
  }
}

- (void)setPreventPaddle:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBpreventPaddle"));

}

- (void)setDynamicLayout:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBdynamic"));

}

- (unint64_t)dynamicDisplayCorner
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("display-corner"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = -1;

  return v4;
}

- (void)setDynamicDisplayCorner:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("display-corner"));

}

- (id)displayImage
{
  return -[UIKBTree objectForProperty:](self, "objectForProperty:", CFSTR("DisplayImage"));
}

- (void)setDisplayImage:(id)a3
{
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", a3, CFSTR("DisplayImage"));
}

- (int64_t)currentKeyboardType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIKBTree numberForProperty:](self, "numberForProperty:", CFSTR("KBCachedKeyboardType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (void)setCurrentKeyboardType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:", v4, CFSTR("KBCachedKeyboardType"));

}

- (id)toggleKeysForKeyName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KBToggleKeys_%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setToggleKeys:(id)a3 forKeyName:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("KBToggleKeys_%@"), a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBTree properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

- (void)orderVariantKeys:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[UIKBTree subtrees](self, "subtrees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "shape");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortUsingFunction:context:", variantOrderSort, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UIKBTree subtrees](self, "subtrees", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      v20 = v17;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        objc_msgSend(v7, "objectAtIndex:", v20 + v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setShape:", v22);

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v17 = v20 + v19;
    }
    while (v16);
  }

}

- (id)variantDisplayString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIKBTree subtrees](self, "subtrees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[UIKBTree subtrees](self, "subtrees", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
          if (objc_msgSend(v5, "length"))
            objc_msgSend(v5, "appendString:", CFSTR(";"));
          objc_msgSend(v11, "displayString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[UIKBTree displayString](self, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)hasLayoutTag:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)containsKeyThatIgnoresHandBias
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIKBTree keys](self, "keys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "BOOLForProperty:", CFSTR("ignore-hand-bias")) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void)setLayoutTag:(id)a3 passingKeyTest:(id)a4
{
  NSString *v7;
  unsigned int (**v8)(id, uint64_t);
  void *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  NSString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (NSString *)a3;
  v8 = (unsigned int (**)(id, uint64_t))a4;
  if (self->layoutTag != v7)
    objc_storeStrong((id *)&self->layoutTag, a3);
  -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (((uint64_t (*)(id, void *))v8[2])(v8, v9) & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->properties;
    v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqualToString:", v7, (_QWORD)v18) & 1) == 0)
          {
            -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v8[2](v8, v16))
            {
              v17 = v15;

              v7 = v17;
              goto LABEL_18;
            }
            v9 = (void *)v16;
          }
        }
        v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
    v16 = (uint64_t)v9;
LABEL_18:

    v9 = (void *)v16;
  }
  -[UIKBTree setEffectiveLayoutTag:](self, "setEffectiveLayoutTag:", v7, (_QWORD)v18);

}

- (void)setLayoutTag:(id)a3
{
  -[UIKBTree setLayoutTag:passingKeyTest:](self, "setLayoutTag:passingKeyTest:", a3, 0);
}

- (BOOL)shouldCacheKey
{
  unsigned int v3;
  unsigned int v4;
  int32x4_t v5;
  int32x4_t v6;
  BOOL result;
  void *v8;
  void *v9;
  void *v10;
  int32x4_t v11;
  int32x4_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->type == 12)
    return 1;
  v3 = -[UIKBTree displayType](self, "displayType");
  v4 = -[UIKBTree interactionType](self, "interactionType");
  v5.i32[0] = v3 & 0xFFFFFFEF;
  v5.i32[1] = v3;
  v5.i32[2] = v3;
  v5.i32[3] = v3;
  v6 = vdupq_n_s32(v4);
  v6.i32[3] = v3;
  result = 1;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(v5, (int32x4_t)xmmword_18667FBB0), (int16x8_t)vceqq_s32(v6, (int32x4_t)xmmword_18667FBC0)))) & 1) == 0&& v4 != 5&& v3 != 23)
  {
    -[UIKBTree name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Latin-Accents")))
    {
      -[UIKBTree cache](self, "cache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("modify-for-writeboard-key"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_24;
      v11.i64[0] = __PAIR64__(v4, v3);
      v11.i32[2] = v4;
      v11.i32[3] = v4;
      v12 = vdupq_n_s32(v4);
      *(int8x8_t *)v12.i8 = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(v12, (int32x4_t)xmmword_18667FBE0), (int16x8_t)vceqq_s32(v12, (int32x4_t)xmmword_18667FBD0))), (int8x8_t)0x8040201008040201);
      v12.i8[0] = vaddv_s8(*(int8x8_t *)v12.i8);
      *(int8x8_t *)v11.i8 = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(vdupq_n_s32(v3), (int32x4_t)xmmword_18667FBF0), (int16x8_t)vceqq_s32(v11, (int32x4_t)xmmword_18667FC00))), (int8x8_t)0x8040201008040201);
      v11.i8[0] = vaddv_s8(*(int8x8_t *)v11.i8);
      if (v11.i16[0] | (unsigned __int16)(v12.i16[0] << 8) || v4 == 42)
      {
LABEL_24:

      }
      else
      {
        -[UIKBTree localizationKey](self, "localizationKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          return 1;
        if (v3 != 7)
          return 0;
        -[UIKBTree representedString](self, "representedString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "_containsSubstring:", CFSTR("¤")))
        {
          -[UIKBTree representedString](self, "representedString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "_containsSubstring:", CFSTR("⁒"));

          if ((v15 & 1) == 0)
          {
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            -[UIKBTree secondaryRepresentedStrings](self, "secondaryRepresentedStrings");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v23;
LABEL_15:
              v19 = 0;
              while (1)
              {
                if (*(_QWORD *)v23 != v18)
                  objc_enumerationMutation(v8);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "_containsSubstring:", CFSTR("¤")) & 1) != 0)
                  goto LABEL_25;
                -[UIKBTree representedString](self, "representedString");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "_containsSubstring:", CFSTR("⁒"));

                if ((v21 & 1) != 0)
                  goto LABEL_25;
                if (v17 == ++v19)
                {
                  v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
                  if (v17)
                    goto LABEL_15;
                  break;
                }
              }
            }

            return 0;
          }
          return 1;
        }
      }
    }
LABEL_25:

    return 1;
  }
  return result;
}

+ (id)key
{
  UIKBTree *v2;
  void *v3;

  v2 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 8);
  +[UIKBTree uniqueName](UIKBTree, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setName:](v2, "setName:", v3);

  return v2;
}

+ (id)keyboard
{
  UIKBTree *v2;
  void *v3;

  v2 = -[UIKBTree initWithType:]([UIKBTree alloc], "initWithType:", 1);
  +[UIKBTree uniqueName](UIKBTree, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree setName:](v2, "setName:", v3);

  return v2;
}

- (id)keysForDisplayRowAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[9];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[UIKBTree subtrees](self, "subtrees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v48;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v48 != v25)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v28 = v6;
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v6);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v8, "keySet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "subtrees");
        v29 = (id)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v31)
        {
          v30 = *(_QWORD *)v44;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v44 != v30)
              {
                v11 = v10;
                objc_enumerationMutation(v29);
                v10 = v11;
              }
              v32 = v10;
              v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
              objc_msgSend(v12, "numberForProperty:", CFSTR("KBdisplayRowHint"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v13;
              if (v13)
              {
                v14 = objc_msgSend(v13, "unsignedIntegerValue") == a3;
                v13 = v33;
                if (v14)
                {
                  v41 = 0u;
                  v42 = 0u;
                  v39 = 0u;
                  v40 = 0u;
                  objc_msgSend(v12, "subtrees");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
                  if (v16)
                  {
                    v17 = *(_QWORD *)v40;
                    do
                    {
                      for (i = 0; i != v16; ++i)
                      {
                        if (*(_QWORD *)v40 != v17)
                          objc_enumerationMutation(v15);
                        v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                        if ((int)objc_msgSend(v19, "displayRowHint") == a3)
                        {
                          if (objc_msgSend(v5, "count"))
                          {
                            objc_msgSend(v19, "frame");
                            v35 = 0;
                            v36 = &v35;
                            v37 = 0x2020000000;
                            v38 = 0;
                            v34[0] = MEMORY[0x1E0C809B0];
                            v34[1] = 3221225472;
                            v34[2] = __37__UIKBTree_keysForDisplayRowAtIndex___block_invoke;
                            v34[3] = &unk_1E16CF060;
                            v34[5] = v20;
                            v34[6] = v21;
                            v34[7] = v22;
                            v34[8] = v23;
                            v34[4] = &v35;
                            objc_msgSend(v5, "enumerateObjectsUsingBlock:", v34);
                            objc_msgSend(v5, "insertObject:atIndex:", v19, v36[3]);
                            _Block_object_dispose(&v35, 8);
                          }
                          else
                          {
                            objc_msgSend(v5, "addObject:", v19);
                          }
                        }
                      }
                      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
                    }
                    while (v16);
                  }

                  v13 = v33;
                }
              }

              v10 = v32 + 1;
            }
            while (v32 + 1 != v31);
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v31);
        }

        v6 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v27);
  }

  return v5;
}

uint64_t __37__UIKBTree_keysForDisplayRowAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;

  result = objc_msgSend(a2, "frame");
  if (*(double *)(a1 + 40) > v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3 + 1;
  return result;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->name, a3);
}

- (NSString)layoutTag
{
  return self->layoutTag;
}

- (NSString)effectiveLayoutTag
{
  return self->effectiveLayoutTag;
}

- (void)setEffectiveLayoutTag:(id)a3
{
  objc_storeStrong((id *)&self->effectiveLayoutTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->effectiveLayoutTag, 0);
  objc_storeStrong((id *)&self->layoutTag, 0);
  objc_storeStrong((id *)&self->cache, 0);
  objc_storeStrong((id *)&self->subtrees, 0);
  objc_storeStrong((id *)&self->properties, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
