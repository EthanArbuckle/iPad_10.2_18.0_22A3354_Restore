@implementation _UIVectorLabelLayer

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  NSStringFromSelector(sel_textLayout);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_textLayoutKey;
  _textLayoutKey = v2;

}

- (_UIVectorLabelLayer)init
{
  _UIVectorLabelLayer *v2;
  _UIVectorLabelLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIVectorLabelLayer;
  v2 = -[_UIVectorLabelLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIVectorLabelLayer setMaxRenderedMoveDistance:](v2, "setMaxRenderedMoveDistance:", 5);
  return v3;
}

- (void)willChangeValueForKey:(id)a3
{
  id v4;
  int v5;
  _UIVectorTextLayout *v6;
  _UIVectorTextLayout *currentTextLayout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIVectorLabelLayer;
  v4 = a3;
  -[_UIVectorLabelLayer willChangeValueForKey:](&v8, sel_willChangeValueForKey_, v4);
  v5 = objc_msgSend(v4, "isEqualToString:", _textLayoutKey, v8.receiver, v8.super_class);

  if (v5)
  {
    -[_UIVectorLabelLayer textLayout](self, "textLayout");
    v6 = (_UIVectorTextLayout *)objc_claimAutoreleasedReturnValue();
    currentTextLayout = self->_currentTextLayout;
    self->_currentTextLayout = v6;

  }
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  int v5;
  _UIVectorTextLayout *currentTextLayout;
  void *v7;
  _UIVectorTextLayout *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIVectorLabelLayer;
  v4 = a3;
  -[_UIVectorLabelLayer didChangeValueForKey:](&v9, sel_didChangeValueForKey_, v4);
  v5 = objc_msgSend(v4, "isEqualToString:", _textLayoutKey, v9.receiver, v9.super_class);

  if (v5)
  {
    currentTextLayout = self->_currentTextLayout;
    -[_UIVectorLabelLayer textLayout](self, "textLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVectorLabelLayer _applyTextLayoutChangeFrom:to:](self, "_applyTextLayoutChangeFrom:to:", currentTextLayout, v7);

    v8 = self->_currentTextLayout;
    self->_currentTextLayout = 0;

  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[_UIVectorLabelLayer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionForLayer:forKey:forView:", v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && +[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
    {
      +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_trackAnimation:withAnimationKey:forKeyPath:inLayer:", v10, v7, v7, v6);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_cleanupUnusedLayers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
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
  -[_UIVectorLabelLayer sublayers](self, "sublayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "_ui_layoutRun");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = -[NSArray containsObject:](self->_currentLayers, "containsObject:", v9);

          if (!v12)
            objc_msgSend(v9, "removeFromSuperlayer");
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_applyTextLayoutChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray **p_currentLayers;
  void *v10;
  NSArray *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CFTypeRef v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
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
  double v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  _QWORD v107[8];
  _QWORD v108[5];
  id v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[4];
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[4];
  id v126;
  id v127;
  _QWORD v128[4];
  NSArray *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  CFTypeRef v134;
  uint64_t v135;
  _QWORD v136[4];
  id v137;
  NSArray *v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIVectorLabelLayer _cleanupUnusedLayers](self, "_cleanupUnusedLayers");
  v106 = v7;
  -[_UIVectorLabelLayer _layersForTextLayout:](self, "_layersForTextLayout:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_currentLayers = &self->_currentLayers;
  -[NSArray makeObjectsPerformSelector:](self->_currentLayers, "makeObjectsPerformSelector:", sel_removeAllAnimations);
  if (objc_msgSend(v8, "count"))
  {
    if (!-[NSArray count](*p_currentLayers, "count"))
      goto LABEL_49;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](*p_currentLayers, "objectAtIndexedSubscript:", 0);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = CFRetain((CFTypeRef)objc_msgSend(v10, "path"));
    v21 = objc_msgSend(v10, "fillColor");
    if (-[_UIVectorLabelLayer _isPathCompatible:with:](self, "_isPathCompatible:with:", objc_msgSend(v10, "path"), -[NSArray path](v11, "path")))
    {
      objc_msgSend(v10, "anchorPoint");
      -[NSArray setAnchorPoint:](v11, "setAnchorPoint:");
      -[NSArray setFrame:](v11, "setFrame:", v13, v15, v17, v19);
      -[NSArray setPath:](v11, "setPath:", v20);
      -[NSArray setFillColor:](v11, "setFillColor:", v21);
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", 0, v11);
    }
    else
    {
      v51 = v10;
      v52 = MEMORY[0x1E0C809B0];
      v136[0] = MEMORY[0x1E0C809B0];
      v136[1] = 3221225472;
      v136[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke;
      v136[3] = &unk_1E16EA4F8;
      v137 = v51;
      v138 = v11;
      v128[0] = v52;
      v10 = v51;
      v128[1] = 3221225472;
      v128[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_2;
      v128[3] = &unk_1E16EA520;
      v130 = v13;
      v131 = v15;
      v132 = v17;
      v133 = v19;
      v134 = v20;
      v135 = v21;
      v129 = v138;
      -[_UIVectorLabelLayer _transitionWithSetup:target:](self, "_transitionWithSetup:target:", v136, v128);

    }
    CFRelease(v20);
    if (-[NSArray count](*p_currentLayers, "count") >= 2 && -[NSArray count](*p_currentLayers, "count") >= 2)
    {
      v53 = 1;
      v54 = MEMORY[0x1E0C809B0];
      do
      {
        -[NSArray objectAtIndexedSubscript:](*p_currentLayers, "objectAtIndexedSubscript:", v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIVectorLabelLayer _findSimilarLayer:inLayers:](self, "_findSimilarLayer:inLayers:", v55, v8);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v56;
        if (v56)
        {
          objc_msgSend(v56, "frame");
          v60 = v59;
          v62 = v61;
          v64 = v63;
          v66 = v65;
          v125[0] = v54;
          v125[1] = 3221225472;
          v125[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_3;
          v125[3] = &unk_1E16EA548;
          v126 = v58;
          v127 = v55;
          v119[0] = v54;
          v119[1] = 3221225472;
          v119[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_4;
          v119[3] = &unk_1E16EA570;
          v121 = v60;
          v122 = v62;
          v123 = v64;
          v124 = v66;
          v120 = v127;
          -[_UIVectorLabelLayer _transitionWithSetup:target:](self, "_transitionWithSetup:target:", v125, v119);

        }
        else
        {
          LODWORD(v57) = 0;
          objc_msgSend(v55, "setOpacity:", v57);
          objc_msgSend(v55, "frame");
          v68 = v67;
          v70 = v69;
          v72 = v71;
          v74 = v73;
          objc_msgSend(v6, "size");
          v76 = v75;
          v78 = v77;
          objc_msgSend(v106, "size");
          v81 = v79 / v76;
          if (v76 == 0.0)
            v81 = 1.0;
          v82 = v80 / v78;
          if (v78 == 0.0)
            v82 = 1.0;
          v83 = v80 - v78;
          if (v78 >= 0.01)
            v84 = v78;
          else
            v84 = 0.01;
          v85 = v70 + v83 * (v70 / v84);
          v86 = v79 - v76;
          if (v76 >= 0.01)
            v87 = v76;
          else
            v87 = 0.01;
          v88 = v68 + v86 * (v68 / v87);
          if (v81 < v82)
            v82 = v81;
          objc_msgSend(v55, "setFrame:", v88, v85, v72 * v82, v74 * v82);
        }

        ++v53;
      }
      while (v53 < -[NSArray count](*p_currentLayers, "count"));
    }
  }
  else
  {
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v11 = *p_currentLayers;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v139, v144, 16);
    if (v22)
    {
      v24 = v22;
      v25 = v8;
      v26 = *(_QWORD *)v140;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v140 != v26)
            objc_enumerationMutation(v11);
          v28 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
          LODWORD(v23) = 0;
          objc_msgSend(v28, "setOpacity:", v23);
          objc_msgSend(v28, "frame");
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;
          objc_msgSend(v6, "size");
          v38 = v37;
          v40 = v39;
          objc_msgSend(v106, "size");
          v43 = v41 / v38;
          if (v38 == 0.0)
            v43 = 1.0;
          v44 = v42 / v40;
          if (v40 == 0.0)
            v44 = 1.0;
          v45 = v42 - v40;
          if (v40 >= 0.01)
            v46 = v40;
          else
            v46 = 0.01;
          v47 = v32 + v45 * (v32 / v46);
          v48 = v41 - v38;
          if (v38 >= 0.01)
            v49 = v38;
          else
            v49 = 0.01;
          v50 = v30 + v48 * (v30 / v49);
          if (v43 < v44)
            v44 = v43;
          objc_msgSend(v28, "setFrame:", v50, v47, v34 * v44, v36 * v44);
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v139, v144, 16);
      }
      while (v24);
      v10 = v25;
    }
    else
    {
      v10 = v8;
    }
    v8 = 0;
  }

LABEL_49:
  objc_storeStrong((id *)&self->_currentLayers, v8);
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v105 = v8;
  objc_msgSend(v8, "reverseObjectEnumerator");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v115, v143, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v116;
    v93 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v91; ++j)
      {
        if (*(_QWORD *)v116 != v92)
          objc_enumerationMutation(v89);
        v95 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
        objc_msgSend(v95, "superlayer");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6 || v96)
        {
          objc_msgSend(v95, "setDelegate:", self);
          -[_UIVectorLabelLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", v95, 0);
        }
        else
        {
          objc_msgSend(v95, "frame");
          v98 = v97;
          v100 = v99;
          v102 = v101;
          v104 = v103;
          v108[0] = v93;
          v108[1] = 3221225472;
          v108[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_5;
          v108[3] = &unk_1E16EA598;
          v108[4] = v95;
          v111 = v97;
          v112 = v99;
          v113 = v101;
          v114 = v103;
          v109 = v106;
          v110 = v6;
          v107[0] = v93;
          v107[1] = 3221225472;
          v107[2] = __53___UIVectorLabelLayer__applyTextLayoutChangeFrom_to___block_invoke_6;
          v107[3] = &__block_descriptor_64_e17_v16__0__CALayer_8l;
          v107[4] = v98;
          v107[5] = v100;
          v107[6] = v102;
          v107[7] = v104;
          -[_UIVectorLabelLayer _transitionWithSetup:target:](self, "_transitionWithSetup:target:", v108, v107);

        }
      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v115, v143, 16);
    }
    while (v91);
  }

}

- (void)_transitionWithSetup:(id)a3 target:(id)a4
{
  void (**v6)(id, void *);
  char v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  v8 = 0;
  if (v9)
  {
    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v9[2]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
      if (v8)
      {
        objc_msgSend(v8, "setDelegate:", self);
        -[_UIVectorLabelLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", v8, 0);
        if (v6)
          v6[2](v6, v8);
      }
    }
  }

}

- (BOOL)_isPathCompatible:(CGPath *)a3 with:(CGPath *)a4
{
  BOOL v4;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = 0;
  if (a3 && a4)
  {
    if (CGPathEqualToPath(a3, a4))
    {
      return 1;
    }
    else
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v7 = MEMORY[0x1E0C809B0];
      v18 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke;
      block[3] = &unk_1E16EA5E0;
      block[4] = &v15;
      CGPathApplyWithBlock(a3, block);
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __46___UIVectorLabelLayer__isPathCompatible_with___block_invoke_2;
      v9[3] = &unk_1E16EA5E0;
      v9[4] = &v10;
      CGPathApplyWithBlock(a4, v9);
      v4 = v16[3] == v11[3];
      _Block_object_dispose(&v10, 8);
      _Block_object_dispose(&v15, 8);
    }
  }
  return v4;
}

- (id)_findSimilarLayer:(id)a3 inLayers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_ui_layoutRun");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v50 = v5;
    objc_msgSend(v7, "stringRange");
    v10 = v9;
    objc_msgSend(v8, "usedRunRect");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v8, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v49 = v6;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v17)
    {
      v18 = v17;
      v51 = v15;
      v52 = 0;
      v19 = v12 + v14 * 0.5;
      v20 = *(_QWORD *)v57;
      v21 = 1.79769313e308;
      v54 = v10;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v20)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v23, "_ui_layoutRun");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringRange");
          if (v25 == v10)
          {
            objc_msgSend(v24, "usedRunRect");
            v28 = v27 + v26 * 0.5;
            v29 = objc_msgSend(v8, "lineIndex");
            v30 = objc_msgSend(v24, "lineIndex");
            v31 = v29 - v30;
            if (v29 - v30 < 0)
              v31 = v30 - v29;
            v32 = v19 - v28;
            if (v19 - v28 < 0.0)
              v32 = -(v19 - v28);
            v33 = v31 >= 2 ? 1.79769313e308 : v32;
            if (v33 < v21)
            {
              v34 = v16;
              objc_msgSend(v24, "font");
              v35 = v15;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "pointSize");
              objc_msgSend(v36, "fontWithSize:");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v35, "lineHeight");
              v39 = v38;
              objc_msgSend(v24, "font");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "lineHeight");
              v42 = v41;

              if (v39 < v42)
                v39 = v42;
              if (v33 < v39 * (double)-[_UIVectorLabelLayer maxRenderedMoveDistance](self, "maxRenderedMoveDistance")
                && objc_msgSend(v37, "isEqual:", v35))
              {
                v43 = v8;
                objc_msgSend(v24, "string");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "isEqualToString:", v53);

                if (v45)
                {
                  v46 = v23;

                  v8 = v43;
                  if (v33 == 0.0)
                  {

                    v52 = v46;
                    v15 = v51;
                    v16 = v34;
                    goto LABEL_33;
                  }
                  v21 = v33;
                  v52 = v46;
                }
                else
                {
                  v8 = v43;
                }
                v15 = v51;
              }
              else
              {
                v15 = v35;
              }
              v16 = v34;

              v10 = v54;
            }
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (v18)
          continue;
        break;
      }
    }
    else
    {
      v52 = 0;
    }
LABEL_33:

    v6 = v49;
    v5 = v50;
    v47 = v52;
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (id)_layersForTextLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGMutablePathRef Mutable;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  double v31;
  CGMutablePathRef v32;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfRuns"))
  {
    objc_msgSend(v3, "parameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIGraphicsImageRendererFormat formatForTraitCollection:](UIGraphicsImageRendererFormat, "formatForTraitCollection:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "numberOfRuns"));
    objc_msgSend(v3, "lastLineBaseline");
    v9 = v8;
    objc_msgSend(v3, "size");
    v11 = v9 / v10;
    Mutable = CGPathCreateMutable();
    CFAutorelease(Mutable);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __44___UIVectorLabelLayer__layersForTextLayout___block_invoke;
    v27[3] = &unk_1E16EA628;
    v13 = v6;
    v28 = v13;
    v30 = 0;
    v31 = v11;
    v14 = v7;
    v29 = v14;
    v32 = Mutable;
    objc_msgSend(v3, "enumerateRunsUsingBlock:", v27);
    if (!CGPathIsEmpty(Mutable))
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setPath:", Mutable);
      objc_msgSend(v3, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "attributedText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (!v18)
        goto LABEL_7;
      objc_msgSend(v3, "parameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributedText");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D98, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = 0;
        v23 = v21;
      }
      else
      {
LABEL_7:
        +[UIColor blackColor](UIColor, "blackColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v22 = 1;
      }
      objc_msgSend(v15, "setFillColor:", objc_msgSend(objc_retainAutorelease(v23), "CGColor"));
      if (v22)

      objc_msgSend(v15, "setAnchorPoint:", 0.0, v11);
      objc_msgSend(v3, "usedBoundingRect");
      objc_msgSend(v15, "setFrame:");
      objc_msgSend(v14, "insertObject:atIndex:", v15, 0);

    }
    v25 = v29;
    v24 = v14;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)maxRenderedMoveDistance
{
  return self->_maxRenderedMoveDistance;
}

- (void)setMaxRenderedMoveDistance:(unint64_t)a3
{
  self->_maxRenderedMoveDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTextLayout, 0);
  objc_storeStrong((id *)&self->_currentLayers, 0);
}

@end
