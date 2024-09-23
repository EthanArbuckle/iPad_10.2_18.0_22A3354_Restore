@implementation UIKeyboardKeySwipeTransition

- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIKBTree *start;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)UIKeyboardKeySwipeTransition;
  -[UIKeyboardKeyplaneTransition rebuildWithStartKeyplane:startView:endKeyplane:endView:](&v31, sel_rebuildWithStartKeyplane_startView_endKeyplane_endView_, v10, a4, v11, a6);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v10, "keys", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v18, "shape");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "shape");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v15);
    }

    -[UIKeyboardKeySwipeTransition setStartGeometries:](self, "setStartGeometries:", v12);
    objc_msgSend(v10, "keysOrderedByPosition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardKeySwipeTransition setStartKeysOrdered:](self, "setStartKeysOrdered:", v21);

  }
  if (v11)
  {
    objc_msgSend(v11, "keysOrderedByPosition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardKeySwipeTransition setEndKeysOrdered:](self, "setEndKeysOrdered:", v22);

  }
  start = self->super._start;
  if (start && self->super._end)
  {
    -[UIKBTree gestureKeyplaneName](start, "gestureKeyplaneName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[UIKBTree name](self->super._end, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree gestureKeyplaneName](self->super._start, "gestureKeyplaneName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardKeyplaneTransition setInitiallyAtEnd:](self, "setInitiallyAtEnd:", objc_msgSend(v25, "rangeOfString:options:", v26, 1) == 0x7FFFFFFFFFFFFFFFLL);

    }
    else
    {
      -[UIKeyboardKeyplaneTransition setInitiallyAtEnd:](self, "setInitiallyAtEnd:", 1);
    }
  }

}

- (void)commitTransitionRebuild
{
  _BOOL4 v3;
  double v4;

  -[UIKeyboardKeySwipeTransition gatherTransitionKeys](self, "gatherTransitionKeys");
  v3 = -[UIKeyboardKeyplaneTransition initiallyAtEnd](self, "initiallyAtEnd");
  v4 = 0.0;
  if (v3)
    v4 = 1.0;
  -[UIKeyboardKeySwipeTransition setPreviousProgress:](self, "setPreviousProgress:", v4);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  int v6;
  void *v7;
  void (**v8)(void);

  objc_msgSend(a3, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("meshTransform"));

  if (v6)
  {
    -[UIKeyboardKeyplaneTransition completionBlock](self, "completionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIKeyboardKeyplaneTransition completionBlock](self, "completionBlock");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

      -[UIKeyboardKeyplaneTransition setCompletionBlock:](self, "setCompletionBlock:", 0);
    }
    -[UIKeyboardKeySwipeTransition removeAllAnimations](self, "removeAllAnimations");
  }
}

- (double)nonInteractiveDuration
{
  return 0.25;
}

- (void)runNonInteractivelyWithCompletion:(id)a3
{
  -[UIKeyboardKeyplaneTransition setCompletionBlock:](self, "setCompletionBlock:", a3);
  -[UIKeyboardKeySwipeTransition _runTransformAnimation](self, "_runTransformAnimation");
  -[UIKeyboardKeySwipeTransition _runOpacityAnimation](self, "_runOpacityAnimation");
}

- (void)_runTransformAnimation
{
  _BOOL4 v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = -[UIKeyboardKeyplaneTransition initiallyAtEnd](self, "initiallyAtEnd");
  if (v3)
    v4 = 72;
  else
    v4 = 64;
  v5 = !v3;
  -[UIKeyboardKeySwipeTransition meshTransformForKeyplane:forward:initial:](self, "meshTransformForKeyplane:forward:initial:", *(Class *)((char *)&self->super.super.isa + v4), v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeySwipeTransition meshTransformForKeyplane:forward:initial:](self, "meshTransformForKeyplane:forward:initial:", *(Class *)((char *)&self->super.super.isa + v4), v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("meshTransform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeySwipeTransition nonInteractiveDuration](self, "nonInteractiveDuration");
  objc_msgSend(v8, "setDuration:");
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v9);

  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(v8, "setDelegate:", self);
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValues:", v10);

  objc_msgSend(v8, "setKeyTimes:", &unk_1E1A94340);
  -[UIView layer](self->super._startView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v8, CFSTR("transform interpolation"));

  -[UIView contentScaleFactor](self->super._startView, "contentScaleFactor");
  v13 = v12;
  -[UIView layer](self->super._startView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRasterizationScale:", v13);

}

- (void)_runOpacityAnimation
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeySwipeTransition nonInteractiveDuration](self, "nonInteractiveDuration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v3);

  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setValues:", &unk_1E1A94358);
  objc_msgSend(v5, "setKeyTimes:", &unk_1E1A94370);
  -[UIView layer](self->super._startView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("opacity interpolation"));

}

- (void)removeAllAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[UIView layer](self->super._startView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("transform interpolation"));

  -[UIView layer](self->super._endView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("transform interpolation"));

  -[UIView layer](self->super._startView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("opacity interpolation"));

  -[UIView layer](self->super._endView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity interpolation"));

  -[UIView layer](self->super._startView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMeshTransform:", 0);

  -[UIView layer](self->super._endView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMeshTransform:", 0);

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardKeySwipeTransition;
  -[UIKeyboardKeyplaneTransition removeAllAnimations](&v9, sel_removeAllAnimations);
}

- (void)updateWithProgress:(double)a3
{
  objc_super v5;

  -[UIView setHidden:](self->super._startView, "setHidden:", 0);
  -[UIView setHidden:](self->super._endView, "setHidden:", 0);
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardKeySwipeTransition;
  -[UIKeyboardKeyplaneTransition updateWithProgress:](&v5, sel_updateWithProgress_, a3);
  -[UIKeyboardKeySwipeTransition setPreviousProgress:](self, "setPreviousProgress:", a3);
}

- (void)gatherTransitionKeys
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
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  UIKeyboardKeySwipeTransition *v17;
  id v18;
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTree keys](self->super._end, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeyplaneTransition keyboard](self, "keyboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBTree gestureKeyplaneName](self->super._end, "gestureKeyplaneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIKeyboardKeyplaneTransition keyboard](self, "keyboard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBTree gestureKeyplaneName](self->super._end, "gestureKeyplaneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subtreeWithName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "keys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[UIKeyboardKeySwipeTransition startKeysOrdered](self, "startKeysOrdered");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__UIKeyboardKeySwipeTransition_gatherTransitionKeys__block_invoke;
  v15[3] = &unk_1E16D8BA8;
  v16 = v6;
  v17 = self;
  v18 = v5;
  v19 = v4;
  v20 = v3;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  -[UIKeyboardKeySwipeTransition setTransitionKeys:](self, "setTransitionKeys:", v11);
  -[UIKeyboardKeySwipeTransition setKeyInfos:](self, "setKeyInfos:", v12);

}

void __52__UIKeyboardKeySwipeTransition_gatherTransitionKeys__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  int v15;
  int v16;
  BOOL v17;
  int v19;
  int v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  id v26;

  v26 = a2;
  v5 = objc_msgSend(v26, "visible");
  v6 = v26;
  if (v5)
  {
    if (*(_QWORD *)(a1 + 32)
      && (objc_msgSend(*(id *)(a1 + 40), "endKeysOrdered"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "count"),
          v7,
          v8 > a3))
    {
      objc_msgSend(*(id *)(a1 + 40), "endKeysOrdered");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(*(id *)(a1 + 48), "indexOfObject:", v10);
      if (v11 >= objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(v10, "displayType");
      v14 = v16 == 2;
      if (v16 == 2)
      {
        v13 = 0;
        v15 = 0;
      }
      else
      {
        if (v10)
          v17 = v12 == 0;
        else
          v17 = 1;
        v15 = !v17 && v10 != v12;
        v13 = objc_msgSend(v10, "displayType") == 23;
      }

    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    v19 = objc_msgSend(v26, "displayTypeHint");
    v20 = objc_msgSend(v26, "displayType");
    if (v19 == 10)
    {
      v21 = v20 != 7;
      v22 = *(void **)(a1 + 56);
      if ((v21 & ~v13 & 1) != 0)
      {
        if (v14)
        {
          v23 = &unk_1E1A99240;
        }
        else if (v15)
        {
          v23 = &unk_1E1A99258;
        }
        else
        {
          v23 = &unk_1E1A99270;
        }
      }
      else
      {
        v23 = &unk_1E1A99228;
      }
LABEL_41:
      objc_msgSend(v22, "addObject:", v23);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v26);
      v6 = v26;
      goto LABEL_42;
    }
    if (!v20 || objc_msgSend(v26, "displayType") == 8)
    {
      v6 = v26;
      if (!v15)
        goto LABEL_42;
      goto LABEL_34;
    }
    v24 = objc_msgSend(v26, "displayType");
    v6 = v26;
    if (v24 == 2)
      v25 = v15;
    else
      v25 = 0;
    if ((v25 & 1) != 0)
    {
LABEL_34:
      if (objc_msgSend(v6, "displayType") == 2)
        v23 = &unk_1E1A99240;
      else
        v23 = &unk_1E1A99270;
      v22 = *(void **)(a1 + 56);
      goto LABEL_41;
    }
  }
LABEL_42:

}

- (CGRect)keyRectForFrame:(CGRect)a3 normalizedSubRect:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = a3.origin.x + a3.size.width * a4.origin.x;
  v5 = a3.origin.y + a3.size.height * a4.origin.y;
  v6 = a3.size.width * a4.size.width;
  v7 = a3.size.height * a4.size.height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)meshTransformForKeyplane:(id)a3 forward:(BOOL)a4 initial:(BOOL)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  UIKeyboardKeySwipeTransition *v31;
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
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  BOOL IsNull;
  uint64_t v61;
  char *v62;
  CGFloat MinY;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double MinX;
  CGFloat v76;
  _OWORD *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  int32x4_t v82;
  uint64_t v83;
  int32x4_t *v84;
  __int32 v85;
  char *v86;
  uint64_t v87;
  CGFloat v88;
  double v89;
  char *v90;
  __int128 v91;
  char *v92;
  __int128 v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  CGFloat v106;
  uint64_t v107;
  int32x4_t *v108;
  __int32 v109;
  char *v110;
  __int128 v111;
  char *v112;
  __int128 v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double v122;
  CGFloat v123;
  double v124;
  double v125;
  CGFloat v126;
  int32x4_t *v127;
  uint64_t v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  double v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  char *v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  CGFloat v145;
  double v146;
  CGFloat v147;
  int32x4_t *v148;
  __int32 v149;
  __int32 v150;
  CGFloat v151;
  UIKeyboardKeySwipeTransition *v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  uint64_t v166;
  uint64_t v167;
  double v168;
  uint64_t v169;
  double v170;
  char *v171;
  char *v172;
  CGFloat v173;
  CGFloat v174;
  CGFloat v175;
  double v176;
  double v177;
  CGFloat v178;
  double v179;
  double v180;
  double v181;
  CGFloat v182;
  char *v183;
  double v184;
  double v185;
  double v186;
  CGFloat v187;
  double v188;
  char *v189;
  double v190;
  CGFloat v191;
  double v192;
  double v193;
  CGFloat v194;
  CGFloat v195;
  CGFloat v196;
  double v197;
  char *v198;
  char *v199;
  double v200;
  double v201;
  double v202;
  CGFloat v203;
  char *v204;
  double v205;
  double v206;
  double v207;
  CGFloat v208;
  char *v209;
  double v210;
  double v211;
  double v212;
  CGFloat v213;
  double v214;
  int v215;
  char *v216;
  CGFloat v217;
  CGFloat v218;
  CGFloat v219;
  CGFloat v220;
  double v221;
  double v222;
  double v223;
  CGFloat v224;
  CGFloat v225;
  uint64_t v226;
  double v227;
  CGFloat v228;
  double MaxX;
  double v230;
  double v231;
  CGFloat v232;
  double v233;
  double v234;
  double v235;
  char *v236;
  char *v237;
  CGFloat v238;
  CGFloat v239;
  CGFloat v240;
  double v241;
  CGFloat v242;
  CGFloat v243;
  double v244;
  double v245;
  double v246;
  CGFloat v247;
  double v248;
  CGFloat v249;
  CGFloat v250;
  CGFloat v251;
  CGFloat v252;
  double v253;
  double v254;
  double v255;
  CGFloat v256;
  char *v257;
  char *v258;
  double v259;
  double v260;
  CGFloat v261;
  char *v262;
  double v263;
  double v264;
  CGFloat v265;
  double v266;
  CGFloat v267;
  int v268;
  CGFloat v269;
  CGFloat v270;
  CGFloat v271;
  CGFloat v272;
  CGFloat v273;
  double v274;
  double v275;
  char *v276;
  CGFloat v277;
  CGFloat v278;
  CGFloat v279;
  CGFloat v280;
  double v281;
  double v282;
  double v283;
  CGFloat v284;
  char *v285;
  CGFloat v286;
  CGFloat v287;
  CGFloat v288;
  CGFloat v289;
  CGFloat v290;
  CGFloat v291;
  CGFloat v292;
  double v293;
  CGFloat v294;
  double v295;
  double v296;
  char *v297;
  CGFloat v298;
  CGFloat v299;
  double v300;
  CGFloat v301;
  CGFloat v302;
  double v303;
  CGFloat v304;
  CGFloat v305;
  char *v306;
  CGFloat v307;
  double v308;
  double v309;
  double v310;
  CGFloat v311;
  CGFloat v312;
  CGFloat v313;
  double v314;
  double v315;
  double v316;
  CGFloat v317;
  CGFloat v318;
  CGFloat v319;
  CGFloat v320;
  CGFloat v321;
  CGFloat v322;
  CGFloat v323;
  double v324;
  CGFloat v325;
  double v326;
  CGFloat v327;
  CGFloat v328;
  CGFloat v329;
  double v330;
  char *v331;
  char *v332;
  CGFloat v333;
  CGFloat v334;
  CGFloat v335;
  double v336;
  CGFloat v337;
  double v338;
  CGFloat v339;
  CGFloat v340;
  double v341;
  double v342;
  char *v343;
  CGFloat v344;
  CGFloat v345;
  CGFloat v346;
  CGFloat v347;
  double v348;
  double v349;
  double v350;
  CGFloat v351;
  CGFloat v352;
  CGFloat v353;
  uint64_t v354;
  int v355;
  uint64_t v356;
  double v357;
  char *v358;
  char *v359;
  char *v360;
  CGFloat v361;
  double v362;
  double v363;
  CGFloat v364;
  char *v365;
  double v366;
  double v367;
  double v368;
  CGFloat v369;
  char *v370;
  int32x4_t *v371;
  __int32 v372;
  int v373;
  __int32 v374;
  int32x4_t v375;
  uint64_t v376;
  int32x4_t *v377;
  int v378;
  int v379;
  int v380;
  int v381;
  uint64_t v382;
  char *v383;
  char *v384;
  double v385;
  CGFloat v386;
  CGFloat v387;
  double v388;
  double v389;
  CGFloat v390;
  double v391;
  CGFloat v392;
  uint64_t v393;
  int32x4_t *v394;
  __int32 v395;
  void *v396;
  _QWORD v398[2];
  id v399;
  double v400;
  double v401;
  double v402;
  double v403;
  double v404;
  double v405;
  _BOOL4 v406;
  _BOOL4 v407;
  double v408;
  double v409;
  double v410;
  uint64_t v411;
  uint64_t v412;
  double v413;
  void *v414;
  id v415;
  id v416;
  uint64_t v417;
  double v418;
  double v419;
  id v420;
  UIKeyboardKeySwipeTransition *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  CGFloat MaxY;
  uint64_t v426;
  id v427;
  uint64_t v428;
  char *v429;
  CGFloat v430;
  CGFloat v431;
  CGFloat v432;
  CGFloat v433;
  CGFloat v434;
  CGFloat v435;
  CGFloat v436;
  CGFloat v437;
  int32x4_t v438;
  uint64_t v439;
  uint64_t v440;
  CGFloat v441;
  CGFloat v442;
  CGFloat v443;
  CGFloat v444;
  CGFloat v445;
  CGFloat v446;
  uint64_t v447;
  uint64_t v448;
  CGFloat v449;
  CGFloat v450;
  char *v451;
  CGFloat v452;
  CGFloat v453;
  CGFloat v454;
  CGFloat v455;
  double v456;
  double v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  char v462[8];
  uint64_t v463;
  CGRect v464;
  CGRect v465;
  CGRect v466;
  CGRect v467;
  CGRect v468;
  CGRect v469;
  CGRect v470;
  CGRect v471;
  CGRect v472;
  CGRect v473;
  CGRect v474;
  CGRect v475;
  CGRect v476;
  CGRect v477;
  CGRect v478;
  CGRect v479;
  CGRect v480;
  CGRect v481;
  CGRect v482;
  CGRect v483;
  CGRect v484;
  CGRect v485;
  CGRect v486;
  CGRect v487;
  CGRect v488;
  CGRect v489;
  CGRect v490;
  CGRect v491;
  CGRect v492;
  CGRect v493;
  CGRect v494;
  CGRect v495;
  CGRect v496;
  CGRect v497;
  CGRect v498;
  CGRect v499;
  CGRect v500;
  CGRect v501;
  CGRect v502;
  CGRect v503;
  CGRect v504;
  CGRect v505;
  CGRect v506;
  CGRect v507;
  CGRect v508;
  CGRect v509;
  CGRect v510;
  CGRect v511;
  CGRect v512;
  CGRect v513;
  CGRect v514;
  CGRect v515;
  CGRect v516;
  CGRect v517;
  CGRect v518;
  CGRect v519;
  CGRect v520;
  CGRect v521;
  CGRect v522;
  CGRect v523;
  CGRect v524;
  CGRect v525;
  CGRect v526;
  CGRect v527;
  CGRect v528;
  CGRect v529;
  CGRect v530;
  CGRect v531;
  CGRect v532;
  CGRect v533;
  CGRect v534;
  CGRect v535;
  CGRect v536;
  CGRect v537;
  CGRect v538;
  CGRect v539;
  CGRect v540;
  CGRect v541;
  CGRect v542;
  CGRect v543;
  CGRect v544;
  CGRect v545;
  CGRect v546;
  CGRect v547;
  CGRect v548;
  CGRect v549;
  CGRect v550;
  CGRect v551;
  CGRect v552;
  CGRect v553;
  CGRect v554;
  CGRect v555;
  CGRect v556;
  CGRect v557;
  CGRect v558;
  CGRect v559;
  CGRect v560;
  CGRect v561;
  CGRect v562;
  CGRect v563;
  CGRect v564;
  CGRect v565;
  CGRect v566;
  CGRect v567;
  CGRect v568;
  CGRect v569;
  CGRect v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;
  CGRect v575;
  CGRect v576;
  CGRect v577;
  CGRect v578;
  CGRect v579;
  CGRect v580;
  CGRect v581;
  CGRect v582;
  CGRect v583;
  CGRect v584;
  CGRect v585;
  CGRect v586;
  CGRect v587;
  CGRect v588;
  CGRect v589;
  CGRect v590;
  CGRect v591;
  CGRect v592;
  CGRect v593;
  CGRect v594;
  CGRect v595;

  v407 = a5;
  v406 = a4;
  v463 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UIKeyboardKeySwipeTransition transitionKeys](self, "transitionKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "count");
  v8 = objc_msgSend(v7, "count");
  v398[1] = v398;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v398 - v9;
  MEMORY[0x1E0C80A78](v11);
  v451 = (char *)v398 - v12;
  v14 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v432 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v399 = v6;
  objc_msgSend(v6, "frame");
  v17 = v16;
  v18 = 1.0 / v16;
  v456 = 1.0 / v19;
  -[UIKeyboardKeySwipeTransition startGeometries](self, "startGeometries");
  v416 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardKeySwipeTransition keyInfos](self, "keyInfos");
  v415 = (id)objc_claimAutoreleasedReturnValue();
  v421 = self;
  -[UIKBTree keys](self->super._start, "keys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v458 = 0u;
  v459 = 0u;
  v460 = 0u;
  v461 = 0u;
  v21 = v7;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v458, v462, 16);
  v414 = v20;
  v429 = v10;
  v457 = v18;
  if (!v22)
  {
    v448 = 0;
    v24 = 0;
    v440 = -1;
    v439 = -1;
    goto LABEL_34;
  }
  v23 = v22;
  v448 = 0;
  v24 = 0;
  v428 = *(_QWORD *)v459;
  v400 = v17 * v18;
  v404 = v18 * 0.0;
  v440 = -1;
  v419 = 0.115;
  v412 = 0x3FD1EB851EB851ECLL;
  v418 = 0.77;
  *(double *)&v411 = 0.44;
  v410 = 0.45;
  v409 = 0.13;
  v408 = 0.286;
  v439 = -1;
  v420 = v21;
  v413 = v17;
  do
  {
    v25 = 0;
    v417 = v23;
    do
    {
      if (*(_QWORD *)v459 != v428)
        objc_enumerationMutation(v21);
      v447 = v25;
      v26 = *(_QWORD *)(*((_QWORD *)&v458 + 1) + 8 * v25);
      v27 = objc_msgSend(v20, "indexOfObject:", v26);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v416, "objectAtIndex:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v21, "indexOfObject:", v26);
        objc_msgSend(v415, "objectAtIndex:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v426 = objc_msgSend(v30, "integerValue");

        v427 = v28;
        objc_msgSend(v28, "frame");
        v442 = v13;
        v431 = v15;
        v430 = v14;
        v31 = v421;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v40 = v419;
        v41 = v418;
        v42 = *(double *)&v411;
        -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v421, "keyRectForFrame:normalizedSubRect:");
        v444 = v43;
        v435 = v44;
        v433 = v45;
        v436 = v46;
        v47 = v35;
        -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v31, "keyRectForFrame:normalizedSubRect:", v33, v35, v37, v39, v40, v410, v41, v42);
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v450 = v52;
        v55 = v54;
        v449 = v54;
        v454 = v39;
        -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v31, "keyRectForFrame:normalizedSubRect:", v33, v47, v37, v39, 0.25, v409, 0.5, v408);
        v434 = v56;
        v437 = v57;
        v441 = v58;
        v445 = v59;
        v464.origin.x = v430;
        v464.origin.y = v442;
        v464.size.width = v431;
        v464.size.height = v432;
        IsNull = CGRectIsNull(v464);
        v61 = v24 + 1;
        v62 = &v451[40 * v24];
        v465.origin.x = v49;
        v453 = v49;
        v465.origin.y = v51;
        v452 = v51;
        v465.size.width = v53;
        v465.size.height = v55;
        *(double *)v438.i64 = v457 * CGRectGetMinX(v465);
        v466.origin.x = v33;
        v455 = v33;
        v466.origin.y = v47;
        v466.size.width = v37;
        v446 = v37;
        v466.size.height = v39;
        MinY = CGRectGetMinY(v466);
        v64 = v456;
        MaxY = v456 * MinY;
        v467.origin.x = v49;
        v467.origin.y = v51;
        v467.size.width = v53;
        v467.size.height = v55;
        v65 = v457 * CGRectGetMinX(v467);
        v468.origin.x = v33;
        v468.origin.y = v47;
        v66 = v47;
        v468.size.width = v37;
        v67 = v454;
        v468.size.height = v454;
        v68 = CGRectGetMinY(v468);
        *(_QWORD *)v62 = v438.i64[0];
        *((CGFloat *)v62 + 1) = MaxY;
        *((double *)v62 + 2) = v65;
        *((double *)v62 + 3) = v64 * v68;
        *((_QWORD *)v62 + 4) = 0x3FE0000000000000;
        v69 = v453;
        v469.origin.x = v453;
        v70 = v452;
        v469.origin.y = v452;
        v71 = v450;
        v469.size.width = v450;
        v72 = v449;
        v469.size.height = v449;
        *(double *)v438.i64 = v457 * CGRectGetMinX(v469);
        v73 = v455;
        v470.origin.x = v455;
        v470.origin.y = v66;
        v74 = v446;
        v470.size.width = v446;
        v470.size.height = v67;
        MaxY = CGRectGetMaxY(v470);
        v471.origin.x = v69;
        v471.origin.y = v70;
        v471.size.width = v71;
        v471.size.height = v72;
        MinX = CGRectGetMinX(v471);
        v472.origin.x = v73;
        v472.origin.y = v66;
        v472.size.width = v74;
        v472.size.height = v67;
        v76 = CGRectGetMaxY(v472);
        *((_QWORD *)v62 + 5) = v438.i64[0];
        v77 = v62 + 40;
        v78 = v456;
        v79 = v457;
        v80 = v457 * MinX;
        v81 = v442;
        *((double *)v62 + 6) = v456 * MaxY;
        *((double *)v62 + 7) = v80;
        *((double *)v62 + 8) = v78 * v76;
        *((_QWORD *)v62 + 9) = 0x3FE0000000000000;
        v82 = vdupq_n_s32(0x7F7FFFFFu);
        v438 = v82;
        v443 = v66;
        if (IsNull || v81 != v66)
        {
          if (IsNull)
          {
            v90 = v429;
            v83 = v448;
          }
          else
          {
            v91 = *((_OWORD *)v62 + 1);
            v92 = &v451[40 * v24];
            *((_OWORD *)v92 + 5) = *(_OWORD *)v62;
            *((_OWORD *)v92 + 6) = v91;
            v93 = *(_OWORD *)(v62 + 56);
            *(_OWORD *)(v92 + 120) = *v77;
            *((_QWORD *)v92 + 14) = *((_QWORD *)v62 + 4);
            *(_OWORD *)(v92 + 136) = v93;
            *((_QWORD *)v92 + 19) = *((_QWORD *)v62 + 9);
            v94 = v430;
            v95 = v430;
            v96 = v81;
            v97 = v431;
            *(CGFloat *)&v93 = v431;
            v98 = v432;
            v99 = v432;
            v100 = CGRectGetMinY(*(CGRect *)(&v81 - 1));
            v101 = v456;
            v102 = v456 * v100;
            v473.origin.x = v94;
            v473.origin.y = v96;
            v473.size.width = v97;
            v473.size.height = v98;
            v103 = CGRectGetMinY(v473);
            v104 = v400;
            *(double *)v62 = v400;
            *((double *)v62 + 1) = v102;
            *((double *)v62 + 2) = v104;
            *((double *)v62 + 3) = v101 * v103;
            *((_QWORD *)v62 + 4) = 0x3FE0000000000000;
            v474.origin.x = v94;
            v474.origin.y = v96;
            v474.size.width = v97;
            v474.size.height = v98;
            v105 = v101 * CGRectGetMaxY(v474);
            v475.origin.x = v94;
            v475.origin.y = v96;
            v475.size.width = v97;
            v475.size.height = v98;
            v106 = CGRectGetMaxY(v475);
            *(double *)v77 = v104;
            *((double *)v62 + 6) = v105;
            *((double *)v62 + 7) = v104;
            *((double *)v62 + 8) = v101 * v106;
            *((_QWORD *)v62 + 9) = 0x3FE0000000000000;
            v90 = v429;
            v107 = v448;
            v108 = (int32x4_t *)&v429[32 * v448];
            v109 = v440;
            v108->i32[0] = v439;
            v108->i32[1] = v109;
            v108->i32[2] = v61;
            v108->i32[3] = v24;
            v108[1] = v438;
            v83 = v107 + 1;
            v61 = v24 + 3;
            v24 += 2;
          }
          v86 = v451;
          v110 = &v451[40 * v24];
          v111 = *((_OWORD *)v110 + 1);
          *((_OWORD *)v110 + 5) = *(_OWORD *)v110;
          *((_OWORD *)v110 + 6) = v111;
          *((_QWORD *)v110 + 14) = *((_QWORD *)v110 + 4);
          LODWORD(v448) = v61 + 2;
          v112 = &v86[40 * v61];
          v113 = *((_OWORD *)v112 + 1);
          *((_OWORD *)v112 + 5) = *(_OWORD *)v112;
          *((_OWORD *)v112 + 6) = v113;
          *((_QWORD *)v112 + 14) = *((_QWORD *)v112 + 4);
          v114 = v455;
          v115 = v455;
          v88 = v443;
          *(CGFloat *)&v113 = v443;
          v116 = v446;
          v117 = v446;
          v118 = v454;
          v119 = v454;
          v120 = CGRectGetMinY(*(CGRect *)((char *)&v113 - 8));
          v121 = v456;
          v122 = v456 * v120;
          v476.origin.x = v114;
          v476.origin.y = v88;
          v476.size.width = v116;
          v476.size.height = v118;
          v123 = CGRectGetMinY(v476);
          v124 = v404;
          *(double *)v110 = v404;
          *((double *)v110 + 1) = v122;
          *((double *)v110 + 2) = v124;
          *((double *)v110 + 3) = v121 * v123;
          *((_QWORD *)v110 + 4) = 0x3FE0000000000000;
          v477.origin.x = v114;
          v477.origin.y = v88;
          v477.size.width = v116;
          v477.size.height = v118;
          v125 = v121 * CGRectGetMaxY(v477);
          v478.origin.x = v114;
          v478.origin.y = v88;
          v89 = v116;
          v478.size.width = v116;
          v478.size.height = v118;
          v126 = CGRectGetMaxY(v478);
          *(double *)v112 = v124;
          *((double *)v112 + 1) = v125;
          *((double *)v112 + 2) = v124;
          *((double *)v112 + 3) = v121 * v126;
          *((_QWORD *)v112 + 4) = 0x3FE0000000000000;
          v127 = (int32x4_t *)&v90[32 * v83];
          v127->i32[0] = v24;
          v127->i32[1] = v61;
          v127->i32[2] = v448;
          v127->i32[3] = v24 + 2;
          v127[1] = v438;
          *(_QWORD *)&v432 = v24 + 3;
          v87 = v24 + 2;
          v21 = v420;
        }
        else
        {
          v83 = v448;
          v84 = (int32x4_t *)&v429[32 * v448];
          v85 = v440;
          v84->i32[0] = v439;
          v84->i32[1] = v85;
          *(_QWORD *)&v432 = v24 + 1;
          v84->i32[2] = v61;
          v84->i32[3] = v24;
          v84[1] = v82;
          v86 = v451;
          v87 = v24;
          v88 = v66;
          v89 = v446;
        }
        v448 = v83;
        *(_QWORD *)&v431 = v83 + 1;
        v439 = v87 + 2;
        v440 = v87 + 3;
        v128 = v87 + 4;
        v129 = v453;
        v479.origin.x = v453;
        v130 = v452;
        v479.origin.y = v452;
        v131 = v450;
        v479.size.width = v450;
        v132 = v449;
        v479.size.height = v449;
        v442 = v79 * CGRectGetMaxX(v479);
        v480.origin.x = v455;
        v480.origin.y = v88;
        v480.size.width = v89;
        v480.size.height = v454;
        v133 = CGRectGetMinY(v480);
        v134 = v88;
        v135 = v456;
        v430 = v456 * v133;
        v481.origin.x = v129;
        v481.origin.y = v130;
        v481.size.width = v131;
        v481.size.height = v132;
        MaxY = v79 * CGRectGetMaxX(v481);
        v136 = v455;
        v482.origin.x = v455;
        v482.origin.y = v134;
        v482.size.width = v89;
        v137 = v454;
        v482.size.height = v454;
        v138 = CGRectGetMinY(v482);
        v139 = &v86[40 * v87];
        v140 = v430;
        *((CGFloat *)v139 + 10) = v442;
        *((CGFloat *)v139 + 11) = v140;
        *((CGFloat *)v139 + 12) = MaxY;
        *((double *)v139 + 13) = v135 * v138;
        *((_QWORD *)v139 + 14) = 0x3FE0000000000000;
        v483.origin.x = v129;
        v141 = v452;
        v483.origin.y = v452;
        v483.size.width = v131;
        v483.size.height = v132;
        v442 = v79 * CGRectGetMaxX(v483);
        v484.origin.x = v136;
        v142 = v443;
        v484.origin.y = v443;
        v484.size.width = v89;
        v484.size.height = v137;
        v430 = v135 * CGRectGetMaxY(v484);
        v485.origin.x = v453;
        v485.origin.y = v141;
        v485.size.width = v131;
        v485.size.height = v132;
        v143 = v79 * CGRectGetMaxX(v485);
        v486.origin.x = v455;
        v486.origin.y = v142;
        v486.size.width = v89;
        v486.size.height = v137;
        v144 = CGRectGetMaxY(v486);
        v145 = v430;
        *((CGFloat *)v139 + 15) = v442;
        *((CGFloat *)v139 + 16) = v145;
        *((double *)v139 + 17) = v143;
        *((double *)v139 + 18) = v135 * v144;
        *((_QWORD *)v139 + 19) = 0x3FE0000000000000;
        v13 = v142;
        if (v426 == 3)
        {
          v152 = v421;
          v153 = v455;
          v154 = v142;
          v155 = v454;
          v156 = v419;
          v157 = v418;
          -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v421, "keyRectForFrame:normalizedSubRect:", v455, v154, v89, v454, v419, 0.325, v418, 0.35);
          v444 = v158;
          v435 = v159;
          v433 = v160;
          v436 = v161;
          -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v152, "keyRectForFrame:normalizedSubRect:", v153, v13, v89, v155, v156, 0.1, v157, 0.35);
          v434 = v162;
          v437 = v163;
          v441 = v164;
          v445 = v165;
          v146 = v457;
        }
        else
        {
          v146 = v457;
          if (v426 != 2)
          {
            v147 = v454;
            if (!v426)
            {
              v148 = (int32x4_t *)&v429[32 * *(_QWORD *)&v431];
              v149 = v439;
              v148->i32[0] = v87;
              v148->i32[1] = v149;
              v150 = LODWORD(v432);
              v148->i32[2] = v440;
              v148->i32[3] = v150;
              v148[1] = v438;
              v448 += 2;
              v151 = v455;
LABEL_29:

              v24 = v128;
              v432 = v147;
              v15 = v89;
              v14 = v151;
              v17 = v413;
              v23 = v417;
              v20 = v414;
              goto LABEL_30;
            }
            v436 = v449;
            v433 = v131;
            v435 = v452;
            v444 = v453;
          }
        }
        v166 = v87 + 5;
        v167 = v87 + 6;
        *(_QWORD *)&v168 = v87 + 7;
        *(_QWORD *)&v430 = v87 + 8;
        *(_QWORD *)&v442 = v87 + 9;
        v169 = v87 + 10;
        v422 = v87;
        *(_QWORD *)&v170 = v87 + 11;
        v171 = v451;
        v172 = &v451[40 * v128];
        v173 = v434;
        v487.origin.x = v434;
        v174 = v437;
        v487.origin.y = v437;
        v175 = v441;
        v487.size.width = v441;
        v176 = v445;
        v487.size.height = v445;
        v177 = v146 * CGRectGetMinX(v487);
        v488.origin.x = v173;
        v488.origin.y = v174;
        v488.size.width = v175;
        v488.size.height = v176;
        v178 = CGRectGetMinY(v488);
        v179 = v456;
        v180 = v456 * v178;
        v489.origin.x = v173;
        v489.origin.y = v174;
        v489.size.width = v175;
        v489.size.height = v176;
        v181 = v457 * CGRectGetMinX(v489);
        v490.origin.x = v173;
        v490.origin.y = v174;
        v490.size.width = v175;
        v490.size.height = v176;
        v182 = CGRectGetMinY(v490);
        *(double *)v172 = v177;
        *((double *)v172 + 1) = v180;
        *((double *)v172 + 2) = v181;
        *((double *)v172 + 3) = v179 * v182;
        *((_QWORD *)v172 + 4) = 0x3FE0000000000000;
        v423 = v166;
        v183 = &v171[40 * v166];
        v491.origin.x = v173;
        v491.origin.y = v174;
        v491.size.width = v175;
        v491.size.height = v176;
        v184 = v457 * CGRectGetMaxX(v491);
        v492.origin.x = v173;
        v492.origin.y = v174;
        v492.size.width = v175;
        v492.size.height = v176;
        v185 = v179 * CGRectGetMinY(v492);
        v493.origin.x = v173;
        v493.origin.y = v174;
        v493.size.width = v175;
        v493.size.height = v176;
        v186 = v457 * CGRectGetMaxX(v493);
        v494.origin.x = v173;
        v494.origin.y = v174;
        v494.size.width = v175;
        v494.size.height = v176;
        v187 = CGRectGetMinY(v494);
        *(double *)v183 = v184;
        *((double *)v183 + 1) = v185;
        *((double *)v183 + 2) = v186;
        *((double *)v183 + 3) = v179 * v187;
        v188 = v457;
        *((_QWORD *)v183 + 4) = 0x3FE0000000000000;
        v426 = v167;
        v189 = &v171[40 * v167];
        v495.origin.x = v173;
        v495.origin.y = v174;
        v495.size.width = v175;
        v495.size.height = v176;
        v190 = v188 * CGRectGetMinX(v495);
        v424 = v128;
        MaxY = v168;
        if (v406)
        {
          v191 = v430;
          v496.origin.x = v173;
          v496.origin.y = v174;
          v496.size.width = v175;
          v496.size.height = v176;
          v192 = v456 * CGRectGetMinY(v496);
          if (v407)
          {
            v497.origin.x = v173;
            v497.origin.y = v174;
            v497.size.width = v175;
            v497.size.height = v176;
            v193 = v457 * CGRectGetMinX(v497);
            v498.origin.x = v173;
            v498.origin.y = v174;
            v498.size.width = v175;
            v498.size.height = v176;
            v194 = CGRectGetMinY(v498);
            v195 = v174;
            v196 = v173;
            v197 = v456;
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v192;
            *((double *)v189 + 2) = v193;
            *((double *)v189 + 3) = v197 * v194;
            *((_QWORD *)v189 + 4) = 0x3FE0000000000000;
            v198 = v451;
            v199 = &v451[40 * *(_QWORD *)&v168];
            v499.origin.x = v196;
            v499.origin.y = v195;
            v499.size.width = v175;
            v499.size.height = v176;
            v200 = v457 * CGRectGetMaxX(v499);
            v500.origin.x = v196;
            v500.origin.y = v195;
            v500.size.width = v175;
            v500.size.height = v176;
            v201 = v197 * CGRectGetMinY(v500);
            v501.origin.x = v196;
            v501.origin.y = v195;
            v501.size.width = v175;
            v501.size.height = v176;
            v202 = v457 * CGRectGetMaxX(v501);
            v502.origin.x = v196;
            v502.origin.y = v195;
            v502.size.width = v175;
            v502.size.height = v176;
            v203 = CGRectGetMinY(v502);
            *(double *)v199 = v200;
            *((double *)v199 + 1) = v201;
            *((double *)v199 + 2) = v202;
            *((double *)v199 + 3) = v197 * v203;
            *((_QWORD *)v199 + 4) = 0x3FE0000000000000;
            v204 = &v198[40 * *(_QWORD *)&v191];
            v503.origin.x = v196;
            v503.origin.y = v195;
            v503.size.width = v175;
            v503.size.height = v176;
            v205 = v457 * CGRectGetMinX(v503);
            v504.origin.x = v196;
            v504.origin.y = v195;
            v504.size.width = v175;
            v504.size.height = v176;
            v206 = v197 * CGRectGetMaxY(v504);
            v505.origin.x = v196;
            v505.origin.y = v195;
            v505.size.width = v175;
            v505.size.height = v176;
            v207 = v457 * CGRectGetMinX(v505);
            v506.origin.x = v196;
            v506.origin.y = v195;
            v506.size.width = v175;
            v506.size.height = v176;
            v208 = CGRectGetMaxY(v506);
            *(double *)v204 = v205;
            *((double *)v204 + 1) = v206;
            *((double *)v204 + 2) = v207;
            *((double *)v204 + 3) = v197 * v208;
            *((_QWORD *)v204 + 4) = 0x3FE0000000000000;
            v209 = &v198[40 * *(_QWORD *)&v442];
            v507.origin.x = v196;
            v507.origin.y = v195;
            v507.size.width = v175;
            v507.size.height = v176;
            v210 = v457 * CGRectGetMaxX(v507);
            v508.origin.x = v196;
            v508.origin.y = v195;
            v508.size.width = v175;
            v508.size.height = v176;
            v211 = v197 * CGRectGetMaxY(v508);
            v509.origin.x = v196;
            v509.origin.y = v195;
            v509.size.width = v175;
            v509.size.height = v176;
            v212 = v457 * CGRectGetMaxX(v509);
            v510.origin.x = v196;
            v510.origin.y = v195;
            v510.size.width = v175;
            v510.size.height = v176;
            v213 = CGRectGetMaxY(v510);
            *(double *)v209 = v210;
            *((double *)v209 + 1) = v211;
            *((double *)v209 + 2) = v212;
            *((double *)v209 + 3) = v197 * v213;
            v214 = v457;
            *((_QWORD *)v209 + 4) = 0x3FE0000000000000;
            v215 = v169;
            v216 = &v198[40 * v169];
            v217 = v453;
            v511.origin.x = v453;
            v218 = v452;
            v511.origin.y = v452;
            v219 = v450;
            v511.size.width = v450;
            v220 = v449;
            v511.size.height = v449;
            v221 = v214 * CGRectGetMinX(v511);
            v512.origin.x = v217;
            v512.origin.y = v218;
            v512.size.width = v219;
            v512.size.height = v220;
            v222 = v197 * CGRectGetMinY(v512);
            v513.origin.x = v217;
            v513.origin.y = v218;
            v513.size.width = v219;
            v513.size.height = v220;
            v223 = v214 * CGRectGetMinX(v513);
            v514.origin.x = v217;
            v514.origin.y = v218;
            v514.size.width = v450;
            v514.size.height = v220;
            v224 = CGRectGetMinY(v514);
            *(double *)v216 = v221;
            *((double *)v216 + 1) = v222;
            *((double *)v216 + 2) = v223;
            *((double *)v216 + 3) = v197 * v224;
            v225 = v450;
            *((_QWORD *)v216 + 4) = 0x3FE0000000000000;
            v226 = 40 * *(_QWORD *)&v170;
            v515.origin.x = v217;
            v515.origin.y = v218;
            v515.size.width = v225;
            v515.size.height = v220;
            v227 = v214 * CGRectGetMaxX(v515);
            v516.origin.x = v217;
            v516.origin.y = v218;
            v516.size.width = v225;
            v516.size.height = v220;
            v228 = CGRectGetMinY(v516);
            v517.origin.x = v217;
            v517.origin.y = v218;
            v517.size.width = v225;
            v517.size.height = v220;
            MaxX = CGRectGetMaxX(v517);
            v518.origin.x = v217;
            v518.origin.y = v218;
            v518.size.width = v225;
            v518.size.height = v220;
            v230 = v228;
            v231 = CGRectGetMinY(v518);
          }
          else
          {
            v437 = v174;
            v434 = v173;
            v269 = v444;
            v541.origin.x = v444;
            v270 = v435;
            v541.origin.y = v435;
            v271 = v175;
            v441 = v175;
            v272 = v433;
            v541.size.width = v433;
            v445 = v176;
            v273 = v436;
            v541.size.height = v436;
            v274 = v457 * CGRectGetMinX(v541);
            v542.origin.x = v269;
            v542.origin.y = v270;
            v542.size.width = v272;
            v542.size.height = v273;
            v275 = v456 * CGRectGetMinY(v542);
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v192;
            *((double *)v189 + 2) = v274;
            *((double *)v189 + 3) = v275;
            *((_QWORD *)v189 + 4) = 0x3FE0000000000000;
            v198 = v451;
            v276 = &v451[40 * *(_QWORD *)&v168];
            v277 = v434;
            v543.origin.x = v434;
            v278 = v437;
            v543.origin.y = v437;
            v543.size.width = v271;
            v279 = v445;
            v543.size.height = v445;
            v405 = v457 * CGRectGetMaxX(v543);
            v544.origin.x = v277;
            v544.origin.y = v278;
            v544.size.width = v271;
            v544.size.height = v279;
            v280 = CGRectGetMinY(v544);
            v281 = v456;
            v282 = v456 * v280;
            v444 = v269;
            v545.origin.x = v269;
            v435 = v270;
            v545.origin.y = v270;
            v545.size.width = v272;
            v545.size.height = v273;
            v283 = v457 * CGRectGetMaxX(v545);
            v546.origin.x = v269;
            v546.origin.y = v270;
            v546.size.width = v272;
            v546.size.height = v273;
            v284 = CGRectGetMinY(v546);
            *(double *)v276 = v405;
            *((double *)v276 + 1) = v282;
            *((double *)v276 + 2) = v283;
            *((double *)v276 + 3) = v281 * v284;
            *((_QWORD *)v276 + 4) = 0x3FE0000000000000;
            v285 = &v198[40 * *(_QWORD *)&v191];
            v286 = v434;
            v547.origin.x = v434;
            v287 = v437;
            v547.origin.y = v437;
            v288 = v441;
            v547.size.width = v441;
            v289 = v445;
            v547.size.height = v445;
            v405 = v457 * CGRectGetMinX(v547);
            v548.origin.x = v286;
            v548.origin.y = v287;
            v548.size.width = v288;
            v290 = v288;
            v548.size.height = v289;
            v403 = v281 * CGRectGetMaxY(v548);
            v291 = v444;
            v549.origin.x = v444;
            v292 = v435;
            v549.origin.y = v435;
            v549.size.width = v272;
            v549.size.height = v273;
            v293 = v457 * CGRectGetMinX(v549);
            v550.origin.x = v291;
            v550.origin.y = v292;
            v550.size.width = v272;
            v550.size.height = v273;
            v294 = CGRectGetMaxY(v550);
            v295 = v403;
            *(double *)v285 = v405;
            *((double *)v285 + 1) = v295;
            *((double *)v285 + 2) = v293;
            *((double *)v285 + 3) = v281 * v294;
            v296 = v457;
            *((_QWORD *)v285 + 4) = 0x3FE0000000000000;
            v297 = &v198[40 * *(_QWORD *)&v442];
            v551.origin.x = v286;
            v298 = v437;
            v551.origin.y = v437;
            v551.size.width = v290;
            v299 = v445;
            v551.size.height = v445;
            v405 = v296 * CGRectGetMaxX(v551);
            v552.origin.x = v286;
            v552.origin.y = v298;
            v552.size.width = v290;
            v552.size.height = v299;
            v300 = v281 * CGRectGetMaxY(v552);
            v301 = v444;
            v553.origin.x = v444;
            v302 = v435;
            v553.origin.y = v435;
            v553.size.width = v272;
            v553.size.height = v273;
            v303 = v296 * CGRectGetMaxX(v553);
            v554.origin.x = v301;
            v554.origin.y = v302;
            v554.size.width = v272;
            v304 = v449;
            v554.size.height = v273;
            v305 = CGRectGetMaxY(v554);
            *(double *)v297 = v405;
            *((double *)v297 + 1) = v300;
            *((double *)v297 + 2) = v303;
            *((double *)v297 + 3) = v281 * v305;
            *((_QWORD *)v297 + 4) = 0x3FE0000000000000;
            v215 = v169;
            v306 = &v198[40 * v169];
            v217 = v453;
            v555.origin.x = v453;
            v218 = v452;
            v555.origin.y = v452;
            v555.size.width = v450;
            v555.size.height = v304;
            v307 = CGRectGetMinX(v555);
            v214 = v457;
            v308 = v457 * v307;
            v556.origin.x = v217;
            v556.origin.y = v218;
            v556.size.width = v450;
            v556.size.height = v304;
            v309 = v281 * CGRectGetMinY(v556);
            v557.origin.x = v217;
            v557.origin.y = v218;
            v557.size.width = v450;
            v557.size.height = v304;
            v310 = v214 * CGRectGetMinX(v557);
            v558.origin.x = v217;
            v558.origin.y = v218;
            v558.size.width = v450;
            v558.size.height = v304;
            v311 = CGRectGetMaxY(v558);
            *(double *)v306 = v308;
            *((double *)v306 + 1) = v309;
            *((double *)v306 + 2) = v310;
            *((double *)v306 + 3) = v281 * v311;
            v225 = v450;
            *((_QWORD *)v306 + 4) = 0x3FE0000000000000;
            v226 = 40 * *(_QWORD *)&v170;
            v559.origin.x = v217;
            v559.origin.y = v218;
            v559.size.width = v225;
            v559.size.height = v304;
            v227 = v214 * CGRectGetMaxX(v559);
            v560.origin.x = v217;
            v560.origin.y = v218;
            v560.size.width = v225;
            v560.size.height = v304;
            v230 = CGRectGetMinY(v560);
            v561.origin.x = v217;
            v561.origin.y = v218;
            v561.size.width = v225;
            v561.size.height = v304;
            MaxX = CGRectGetMaxX(v561);
            v562.origin.x = v217;
            v562.origin.y = v218;
            v562.size.width = v225;
            v562.size.height = v304;
            v231 = CGRectGetMaxY(v562);
          }
          *(double *)&v198[v226] = v227;
          v268 = LODWORD(v191);
          v266 = v170;
        }
        else
        {
          v405 = v170;
          v215 = v169;
          v519.origin.x = v173;
          v519.origin.y = v174;
          v519.size.width = v175;
          v519.size.height = v176;
          v232 = CGRectGetMaxY(v519);
          v233 = v456;
          v234 = v456 * v232;
          v520.origin.x = v173;
          v520.origin.y = v174;
          v520.size.width = v175;
          v520.size.height = v176;
          v235 = v188 * CGRectGetMinX(v520);
          v236 = &v451[40 * *(_QWORD *)&v168];
          v237 = &v451[40 * *(_QWORD *)&v430];
          v238 = v173;
          v239 = v174;
          v240 = v175;
          v241 = v176;
          if (v407)
          {
            v242 = CGRectGetMaxY(*(CGRect *)&v238);
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v234;
            *((double *)v189 + 2) = v235;
            *((double *)v189 + 3) = v233 * v242;
            *((_QWORD *)v189 + 4) = 0x3FE0000000000000;
            v521.origin.x = v173;
            v521.origin.y = v174;
            v521.size.width = v175;
            v521.size.height = v176;
            v243 = CGRectGetMaxX(v521);
            v244 = v457;
            v403 = v457 * v243;
            v522.origin.x = v173;
            v522.origin.y = v174;
            v522.size.width = v175;
            v522.size.height = v176;
            v245 = v233 * CGRectGetMaxY(v522);
            v523.origin.x = v173;
            v523.origin.y = v174;
            v523.size.width = v175;
            v523.size.height = v176;
            v246 = v244 * CGRectGetMaxX(v523);
            v524.origin.x = v173;
            v524.origin.y = v174;
            v524.size.width = v175;
            v524.size.height = v176;
            v247 = CGRectGetMaxY(v524);
            *(double *)v236 = v403;
            *((double *)v236 + 1) = v245;
            *((double *)v236 + 2) = v246;
            *((double *)v236 + 3) = v233 * v247;
            *((_QWORD *)v236 + 4) = 0x3FE0000000000000;
            v248 = v233;
            v249 = v444;
            v525.origin.x = v444;
            v250 = v435;
            v525.origin.y = v435;
            v251 = v433;
            v525.size.width = v433;
            v252 = v436;
            v525.size.height = v436;
            v253 = v244;
            v445 = v244 * CGRectGetMinX(v525);
            v526.origin.x = v249;
            v526.origin.y = v250;
            v526.size.width = v251;
            v526.size.height = v252;
            v254 = v248 * CGRectGetMinY(v526);
            v527.origin.x = v249;
            v527.origin.y = v250;
            v527.size.width = v251;
            v527.size.height = v252;
            v255 = v253 * CGRectGetMinX(v527);
            v528.origin.x = v249;
            v528.origin.y = v250;
            v528.size.width = v251;
            v528.size.height = v252;
            v256 = CGRectGetMinY(v528);
            *(CGFloat *)v237 = v445;
            *((double *)v237 + 1) = v254;
            *((double *)v237 + 2) = v255;
            *((double *)v237 + 3) = v248 * v256;
            *((_QWORD *)v237 + 4) = 0x3FE0000000000000;
            v257 = v451;
            v258 = &v451[40 * *(_QWORD *)&v442];
            v529.origin.x = v249;
            v529.origin.y = v250;
            v529.size.width = v251;
            v529.size.height = v252;
            v445 = v253 * CGRectGetMaxX(v529);
            v530.origin.x = v249;
            v530.origin.y = v250;
            v530.size.width = v251;
            v530.size.height = v252;
            v259 = v248 * CGRectGetMinY(v530);
            v531.origin.x = v249;
            v531.origin.y = v250;
            v531.size.width = v251;
            v531.size.height = v252;
            v260 = v253 * CGRectGetMaxX(v531);
            v532.origin.x = v249;
            v532.origin.y = v250;
            v532.size.width = v251;
            v532.size.height = v252;
            v261 = CGRectGetMinY(v532);
            *(CGFloat *)v258 = v445;
            *((double *)v258 + 1) = v259;
            *((double *)v258 + 2) = v260;
            *((double *)v258 + 3) = v248 * v261;
            *((_QWORD *)v258 + 4) = 0x3FE0000000000000;
            v262 = &v257[40 * v169];
            v533.origin.x = v249;
            v533.origin.y = v250;
            v533.size.width = v251;
            v533.size.height = v252;
            v445 = v253 * CGRectGetMinX(v533);
            v534.origin.x = v249;
            v534.origin.y = v250;
            v534.size.width = v251;
            v534.size.height = v252;
            v263 = v248 * CGRectGetMaxY(v534);
            v535.origin.x = v249;
            v535.origin.y = v250;
            v535.size.width = v251;
            v535.size.height = v252;
            v264 = v253 * CGRectGetMinX(v535);
            v536.origin.x = v249;
            v536.origin.y = v250;
            v536.size.width = v251;
            v536.size.height = v252;
            v265 = CGRectGetMaxY(v536);
            *(CGFloat *)v262 = v445;
            *((double *)v262 + 1) = v263;
            *((double *)v262 + 2) = v264;
            *((double *)v262 + 3) = v248 * v265;
            v225 = v450;
            *((_QWORD *)v262 + 4) = 0x3FE0000000000000;
            v266 = v405;
            v537.origin.x = v249;
            v537.origin.y = v250;
            v537.size.width = v251;
            v537.size.height = v252;
            v445 = v253 * CGRectGetMaxX(v537);
            v538.origin.x = v249;
            v538.origin.y = v250;
            v538.size.width = v251;
            v538.size.height = v252;
            v267 = CGRectGetMaxY(v538);
            v539.origin.x = v249;
            v539.origin.y = v250;
            v539.size.width = v251;
            v539.size.height = v252;
            MaxX = CGRectGetMaxX(v539);
            v540.origin.x = v249;
            v540.origin.y = v250;
            v540.size.width = v251;
            v540.size.height = v252;
            v231 = CGRectGetMaxY(v540);
            *(CGFloat *)&v257[40 * *(_QWORD *)&v266] = v445;
            v214 = v253;
            v230 = v267;
            v217 = v453;
            v218 = v452;
            v268 = LODWORD(v430);
          }
          else
          {
            v312 = CGRectGetMinY(*(CGRect *)&v238);
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v234;
            *((double *)v189 + 2) = v235;
            *((double *)v189 + 3) = v233 * v312;
            *((_QWORD *)v189 + 4) = 0x3FE0000000000000;
            v563.origin.x = v173;
            v563.origin.y = v174;
            v563.size.width = v175;
            v563.size.height = v176;
            v313 = CGRectGetMaxX(v563);
            v314 = v457;
            v403 = v457 * v313;
            v564.origin.x = v173;
            v564.origin.y = v174;
            v564.size.width = v175;
            v564.size.height = v176;
            v315 = v233 * CGRectGetMaxY(v564);
            v565.origin.x = v173;
            v565.origin.y = v174;
            v565.size.width = v175;
            v565.size.height = v176;
            v316 = v314 * CGRectGetMaxX(v565);
            v566.origin.x = v173;
            v566.origin.y = v174;
            v566.size.width = v175;
            v566.size.height = v176;
            v317 = CGRectGetMinY(v566);
            *(double *)v236 = v403;
            *((double *)v236 + 1) = v315;
            *((double *)v236 + 2) = v316;
            *((double *)v236 + 3) = v233 * v317;
            *((_QWORD *)v236 + 4) = 0x3FE0000000000000;
            v318 = v444;
            v567.origin.x = v444;
            v445 = v176;
            v319 = v435;
            v567.origin.y = v435;
            v320 = v175;
            v321 = v433;
            v567.size.width = v433;
            v322 = v436;
            v567.size.height = v436;
            v323 = CGRectGetMinX(v567);
            v324 = v457;
            v403 = v457 * v323;
            v568.origin.x = v318;
            v568.origin.y = v319;
            v568.size.width = v321;
            v568.size.height = v322;
            v436 = v322;
            v325 = CGRectGetMinY(v568);
            v326 = v456;
            v402 = v456 * v325;
            v569.origin.x = v173;
            v569.origin.y = v174;
            v441 = v320;
            v569.size.width = v320;
            v327 = v445;
            v569.size.height = v445;
            v401 = v324 * CGRectGetMinX(v569);
            v570.origin.x = v173;
            v570.origin.y = v174;
            v570.size.width = v320;
            v328 = v327;
            v570.size.height = v327;
            v329 = CGRectGetMinY(v570);
            v330 = v402;
            *(double *)v237 = v403;
            *((double *)v237 + 1) = v330;
            *((double *)v237 + 2) = v401;
            *((double *)v237 + 3) = v326 * v329;
            *((_QWORD *)v237 + 4) = 0x3FE0000000000000;
            v331 = v451;
            v332 = &v451[40 * *(_QWORD *)&v442];
            v333 = v444;
            v571.origin.x = v444;
            v571.origin.y = v319;
            v334 = v433;
            v571.size.width = v433;
            v571.size.height = v322;
            v335 = CGRectGetMaxX(v571);
            v336 = v457;
            v403 = v457 * v335;
            v572.origin.x = v333;
            v572.origin.y = v319;
            v572.size.width = v334;
            v572.size.height = v322;
            v337 = CGRectGetMinY(v572);
            v338 = v456;
            v402 = v456 * v337;
            v573.origin.x = v173;
            v573.origin.y = v174;
            v339 = v441;
            v573.size.width = v441;
            v573.size.height = v328;
            v401 = v336 * CGRectGetMaxX(v573);
            v574.origin.x = v173;
            v574.origin.y = v174;
            v574.size.width = v339;
            v574.size.height = v328;
            v340 = CGRectGetMinY(v574);
            v341 = v338;
            v342 = v402;
            *(double *)v332 = v403;
            *((double *)v332 + 1) = v342;
            *((double *)v332 + 2) = v401;
            *((double *)v332 + 3) = v338 * v340;
            *((_QWORD *)v332 + 4) = 0x3FE0000000000000;
            v343 = &v331[40 * v169];
            v344 = v444;
            v575.origin.x = v444;
            v575.origin.y = v319;
            v575.size.width = v334;
            v345 = v436;
            v575.size.height = v436;
            v403 = v336 * CGRectGetMinX(v575);
            v576.origin.x = v344;
            v576.origin.y = v319;
            v576.size.width = v334;
            v576.size.height = v345;
            v402 = v341 * CGRectGetMaxY(v576);
            v577.origin.x = v173;
            v577.origin.y = v174;
            v346 = v441;
            v577.size.width = v441;
            v347 = v445;
            v577.size.height = v445;
            v401 = v336 * CGRectGetMinX(v577);
            v348 = v336;
            v578.origin.x = v173;
            v578.origin.y = v174;
            v578.size.width = v346;
            v578.size.height = v347;
            v349 = v456 * CGRectGetMaxY(v578);
            v350 = v402;
            *(double *)v343 = v403;
            *((double *)v343 + 1) = v350;
            *((double *)v343 + 2) = v401;
            *((double *)v343 + 3) = v349;
            *((_QWORD *)v343 + 4) = 0x3FE0000000000000;
            v266 = v405;
            v351 = v444;
            v579.origin.x = v444;
            v579.origin.y = v319;
            v579.size.width = v334;
            v352 = v436;
            v579.size.height = v436;
            v403 = v348 * CGRectGetMaxX(v579);
            v580.origin.x = v351;
            v580.origin.y = v319;
            v580.size.width = v334;
            v580.size.height = v352;
            v230 = CGRectGetMaxY(v580);
            v581.origin.x = v173;
            v581.origin.y = v174;
            v581.size.width = v346;
            v353 = v445;
            v581.size.height = v445;
            MaxX = CGRectGetMaxX(v581);
            v582.origin.x = v173;
            v582.origin.y = v174;
            v582.size.width = v346;
            v582.size.height = v353;
            v231 = CGRectGetMaxY(v582);
            *(double *)&v331[40 * *(_QWORD *)&v266] = v403;
            v214 = v457;
            v217 = v453;
            v218 = v452;
            v268 = LODWORD(v430);
            v225 = v450;
          }
        }
        v354 = v422;
        v355 = v422 + 12;
        v356 = v422 + 13;
        v357 = v456;
        v358 = v451;
        v359 = &v451[40 * *(_QWORD *)&v266];
        *((double *)v359 + 1) = v456 * v230;
        *((double *)v359 + 2) = v214 * MaxX;
        *((double *)v359 + 3) = v357 * v231;
        *((_QWORD *)v359 + 4) = 0x3FE0000000000000;
        v360 = &v358[40 * v354 + 480];
        v583.origin.x = v217;
        v583.origin.y = v218;
        v583.size.width = v225;
        v361 = v449;
        v583.size.height = v449;
        v445 = v214 * CGRectGetMinX(v583);
        v584.origin.x = v217;
        v584.origin.y = v218;
        v584.size.width = v225;
        v584.size.height = v361;
        v362 = v357 * CGRectGetMaxY(v584);
        v585.origin.x = v217;
        v585.origin.y = v218;
        v585.size.width = v225;
        v585.size.height = v361;
        v363 = v214 * CGRectGetMinX(v585);
        v586.origin.x = v217;
        v586.origin.y = v218;
        v586.size.width = v225;
        v586.size.height = v361;
        v364 = CGRectGetMaxY(v586);
        *(CGFloat *)v360 = v445;
        *((double *)v360 + 1) = v362;
        *((double *)v360 + 2) = v363;
        *((double *)v360 + 3) = v357 * v364;
        *((_QWORD *)v360 + 4) = 0x3FE0000000000000;
        v365 = &v358[40 * v356];
        v587.origin.x = v217;
        v587.origin.y = v218;
        v587.size.width = v225;
        v587.size.height = v361;
        v366 = v214 * CGRectGetMaxX(v587);
        v588.origin.x = v217;
        v588.origin.y = v218;
        v588.size.width = v225;
        v588.size.height = v361;
        v367 = v357 * CGRectGetMaxY(v588);
        v589.origin.x = v217;
        v589.origin.y = v218;
        v589.size.width = v225;
        v589.size.height = v361;
        v368 = v214 * CGRectGetMaxX(v589);
        v590.origin.x = v217;
        v590.origin.y = v218;
        v590.size.width = v225;
        v590.size.height = v361;
        v369 = CGRectGetMaxY(v590);
        *(double *)v365 = v366;
        *((double *)v365 + 1) = v367;
        *((double *)v365 + 2) = v368;
        *((double *)v365 + 3) = v357 * v369;
        *((_QWORD *)v365 + 4) = 0x3FE0000000000000;
        v370 = v429;
        v371 = (int32x4_t *)&v429[32 * *(_QWORD *)&v431];
        v372 = v439;
        v371->i32[0] = v354;
        v371->i32[1] = v372;
        v373 = v423;
        v374 = v424;
        v371->i32[2] = v423;
        v371->i32[3] = v374;
        v375 = v438;
        v371[1] = v438;
        v376 = v448;
        v377 = (int32x4_t *)&v370[32 * v448];
        v377[4].i32[0] = v374;
        v377[4].i32[1] = v373;
        v378 = LODWORD(MaxY);
        v379 = v426;
        v377[4].i32[2] = LODWORD(MaxY);
        v377[4].i32[3] = v379;
        v377[5] = v375;
        v377[6].i32[0] = v379;
        v377[6].i32[1] = v378;
        v380 = LODWORD(v442);
        v377[6].i32[2] = LODWORD(v442);
        v377[6].i32[3] = v268;
        v377[7] = v375;
        v377[8].i32[0] = v268;
        v377[8].i32[1] = v380;
        v377[8].i32[2] = LODWORD(v266);
        v377[8].i32[3] = v215;
        v377[9] = v375;
        v377[10].i32[0] = v215;
        v377[10].i32[1] = LODWORD(v266);
        v377[10].i32[2] = v356;
        v377[10].i32[3] = v355;
        v377[11] = v375;
        v377[12].i32[0] = LODWORD(v432);
        v377[12].i32[1] = v355;
        v381 = v440;
        v377[12].i32[2] = v356;
        v377[12].i32[3] = v381;
        v448 = v376 + 7;
        v128 = v354 + 14;
        v377[13] = v375;
        v151 = v455;
        v147 = v454;
        v13 = v443;
        v89 = v446;
        v21 = v420;
        goto LABEL_29;
      }
LABEL_30:
      v25 = v447 + 1;
    }
    while (v23 != v447 + 1);
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v458, v462, 16);
  }
  while (v23);
LABEL_34:

  v591.origin.x = v14;
  v591.origin.y = v13;
  v591.size.width = v15;
  v591.size.height = v432;
  if (CGRectIsNull(v591))
  {
    v382 = v448;
    v383 = v429;
  }
  else
  {
    v384 = &v451[40 * v24];
    v385 = v17 * v457;
    v592.origin.x = v14;
    v592.origin.y = v13;
    v592.size.width = v15;
    v386 = v432;
    v592.size.height = v432;
    v387 = CGRectGetMinY(v592);
    v388 = v456;
    v389 = v456 * v387;
    v593.origin.x = v14;
    v593.origin.y = v13;
    v593.size.width = v15;
    v593.size.height = v386;
    v390 = CGRectGetMinY(v593);
    *(double *)v384 = v385;
    *((double *)v384 + 1) = v389;
    *((double *)v384 + 2) = v385;
    *((double *)v384 + 3) = v388 * v390;
    *((_QWORD *)v384 + 4) = 0x3FE0000000000000;
    v594.origin.x = v14;
    v594.origin.y = v13;
    v594.size.width = v15;
    v594.size.height = v386;
    v391 = v388 * CGRectGetMaxY(v594);
    v595.origin.x = v14;
    v595.origin.y = v13;
    v595.size.width = v15;
    v595.size.height = v386;
    v392 = CGRectGetMaxY(v595);
    *((double *)v384 + 5) = v385;
    *((double *)v384 + 6) = v391;
    *((double *)v384 + 7) = v385;
    *((double *)v384 + 8) = v388 * v392;
    *((_QWORD *)v384 + 9) = 0x3FE0000000000000;
    v20 = v414;
    v393 = v448;
    v383 = v429;
    v394 = (int32x4_t *)&v429[32 * v448];
    v395 = v440;
    v394->i32[0] = v439;
    v394->i32[1] = v395;
    v394->i32[2] = v24 + 1;
    v394->i32[3] = v24;
    v394[1] = vdupq_n_s32(0x7F7FFFFFu);
    v382 = v393 + 1;
    v24 += 2;
  }
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", v24, v451, v382, v383, *MEMORY[0x1E0CD2A90]);
  v396 = (void *)objc_claimAutoreleasedReturnValue();

  return v396;
}

- (BOOL)disableMeshOptimization
{
  return *(&self->_disableMeshOptimization + 1);
}

- (void)setDisableMeshOptimization:(BOOL)a3
{
  *(&self->_disableMeshOptimization + 1) = a3;
}

- (NSArray)startKeysOrdered
{
  return self->_startKeysOrdered;
}

- (void)setStartKeysOrdered:(id)a3
{
  objc_storeStrong((id *)&self->_startKeysOrdered, a3);
}

- (NSArray)endKeysOrdered
{
  return self->_endKeysOrdered;
}

- (void)setEndKeysOrdered:(id)a3
{
  objc_storeStrong((id *)&self->_endKeysOrdered, a3);
}

- (NSArray)startGeometries
{
  return self->_startGeometries;
}

- (void)setStartGeometries:(id)a3
{
  objc_storeStrong((id *)&self->_startGeometries, a3);
}

- (NSArray)transitionKeys
{
  return self->_transitionKeys;
}

- (void)setTransitionKeys:(id)a3
{
  objc_storeStrong((id *)&self->_transitionKeys, a3);
}

- (NSArray)keyInfos
{
  return self->_keyInfos;
}

- (void)setKeyInfos:(id)a3
{
  objc_storeStrong((id *)&self->_keyInfos, a3);
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyInfos, 0);
  objc_storeStrong((id *)&self->_transitionKeys, 0);
  objc_storeStrong((id *)&self->_startGeometries, 0);
  objc_storeStrong((id *)&self->_endKeysOrdered, 0);
  objc_storeStrong((id *)&self->_startKeysOrdered, 0);
}

@end
