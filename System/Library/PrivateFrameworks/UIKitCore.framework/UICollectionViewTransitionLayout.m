@implementation UICollectionViewTransitionLayout

- (UICollectionViewTransitionLayout)initWithCurrentLayout:(UICollectionViewLayout *)currentLayout nextLayout:(UICollectionViewLayout *)newLayout
{
  UICollectionViewLayout *v7;
  UICollectionViewLayout *v8;
  UICollectionViewTransitionLayout *v9;
  UICollectionViewTransitionLayout *v10;
  objc_super v12;

  v7 = currentLayout;
  v8 = newLayout;
  v12.receiver = self;
  v12.super_class = (Class)UICollectionViewTransitionLayout;
  v9 = -[UICollectionViewLayout init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromLayout, currentLayout);
    objc_storeStrong((id *)&v10->_toLayout, newLayout);
    v10->_layoutIsValid = 0;
    v10->_accuracy = 1.0;
  }

  return v10;
}

- (UICollectionViewTransitionLayout)initWithCoder:(NSCoder *)coder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTransitionLayout;
  return -[UICollectionViewLayout initWithCoder:](&v4, sel_initWithCoder_, coder);
}

- (UICollectionViewTransitionLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollectionViewTransitionLayout.m"), 78, CFSTR("-[UICollectionViewTransitionLayout init] is not a valid initializer - use -initWithCurrentLayout:nextLayout: instead"));

  return 0;
}

- (void)_setCollectionView:(id)a3
{
  UICollectionViewLayout *fromLayout;
  void *v6;
  UICollectionViewLayout *toLayout;
  void *v8;
  void *v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewTransitionLayout;
  -[UICollectionViewLayout _setCollectionView:](&v11, sel__setCollectionView_);
  if (a3)
  {
    fromLayout = self->_fromLayout;
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout _setCollectionView:](fromLayout, "_setCollectionView:", v6);

    toLayout = self->_toLayout;
    -[UICollectionViewLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout _setCollectionView:](toLayout, "_setCollectionView:", v8);

  }
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  self->_accuracy = v10;

}

- (void)invalidateLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UICollectionViewTransitionLayout;
  -[UICollectionViewLayout invalidateLayout](&v2, sel_invalidateLayout);
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 0;
}

- (void)_finalizeLayoutTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTransitionLayout;
  -[UICollectionViewLayout _finalizeLayoutTransition](&v3, sel__finalizeLayoutTransition);
  -[UICollectionViewLayout _finalizeLayoutTransition](self->_toLayout, "_finalizeLayoutTransition");
}

- (void)_prepareForTransitionFromLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewTransitionLayout;
  -[UICollectionViewLayout _prepareForTransitionFromLayout:](&v4, sel__prepareForTransitionFromLayout_, a3);
  -[UICollectionViewTransitionLayout _prepareForTransitionToLayout:](self, "_prepareForTransitionToLayout:", self->_toLayout);
  -[UICollectionViewLayout _prepareForTransitionFromLayout:](self->_toLayout, "_prepareForTransitionFromLayout:", self);
}

- (void)_prepareForTransitionToLayout:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewTransitionLayout;
  -[UICollectionViewLayout _prepareForTransitionToLayout:](&v3, sel__prepareForTransitionToLayout_, a3);
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect *p_fromVisibleBounds;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *transitionInformationsDict;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  UICollectionViewTransitionLayout *v32;
  void *v33;
  uint64_t v34;
  double MidX;
  double MidY;
  id v37;
  void *v38;
  double v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *j;
  id *v44;
  void *v45;
  int v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  UICollectionViewLayout *toLayout;
  void *v52;
  void *v53;
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
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  UICollectionViewLayout *v98;
  id v99;
  void *v100;
  void *v101;
  UICollectionViewLayout *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  UICollectionViewLayout *fromLayout;
  id v117;
  void *v118;
  void *v119;
  UICollectionViewLayout *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  uint64_t v125;
  UICollectionViewTransitionLayout *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  _WORD *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  UICollectionViewLayout *v134;
  id v135;
  void *v136;
  _WORD *v137;
  void *v138;
  UICollectionViewLayout *v139;
  id v140;
  id v141;
  void *v142;
  UICollectionViewLayout *v143;
  id v144;
  UICollectionViewTransitionLayout *v145;
  id v146;
  void *v147;
  UICollectionViewLayout *v148;
  void *v149;
  UICollectionViewLayout *v150;
  id v151;
  id v152;
  void *v153;
  UICollectionViewLayout *v154;
  void *v155;
  _WORD *v156;
  _WORD *v157;
  unsigned int v158;
  unsigned int v159;
  void *v160;
  id *v161;
  void *v162;
  _WORD *v163;
  const __CFString *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t m;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  double v174;
  int v175;
  double v176;
  int v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  uint64_t v183;
  _BOOL4 v184;
  uint64_t v185;
  id obj;
  id v187;
  id v188;
  id v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  UICollectionViewTransitionLayout *v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  uint64_t v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;

  v230 = *MEMORY[0x1E0C80C00];
  if (self->_layoutIsValid)
    return;
  self->_layoutIsValid = 1;
  -[UICollectionViewLayout _prepareLayout](self->_fromLayout, "_prepareLayout");
  -[UICollectionViewLayout _prepareLayout](self->_toLayout, "_prepareLayout");
  if (-[UICollectionViewLayout _supportsAdvancedTransitionAnimations](self->_fromLayout, "_supportsAdvancedTransitionAnimations"))
  {
    v184 = -[UICollectionViewLayout _supportsAdvancedTransitionAnimations](self->_toLayout, "_supportsAdvancedTransitionAnimations");
  }
  else
  {
    v184 = 0;
  }
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  p_fromVisibleBounds = &self->_fromVisibleBounds;
  self->_fromVisibleBounds.origin.x = v5;
  self->_fromVisibleBounds.origin.y = v7;
  self->_fromVisibleBounds.size.width = v9;
  self->_fromVisibleBounds.size.height = v11;
  -[UICollectionViewLayout collectionViewContentSize](self->_fromLayout, "collectionViewContentSize");
  v14 = v13;
  -[UICollectionViewLayout collectionViewContentSize](self->_toLayout, "collectionViewContentSize");
  if (v14 >= v15)
    v15 = v14;
  self->_contentSize.width = v15;
  -[UICollectionViewLayout collectionViewContentSize](self->_fromLayout, "collectionViewContentSize");
  v17 = v16;
  -[UICollectionViewLayout collectionViewContentSize](self->_toLayout, "collectionViewContentSize");
  if (v17 >= v18)
    v19 = v17;
  else
    v19 = v18;
  self->_contentSize.height = v19;
  -[UICollectionViewLayout layoutAttributesForElementsInRect:](self->_fromLayout, "layoutAttributesForElementsInRect:", v5, v7, v9, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v20, "count"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_transitionInformationsDict)
  {
    v22 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v20, "count"));
    transitionInformationsDict = self->_transitionInformationsDict;
    self->_transitionInformationsDict = v22;

  }
  v194 = self;
  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v24 = v20;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v219, v229, 16);
  obj = v24;
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v220;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v220 != v27)
          objc_enumerationMutation(obj);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v219 + 1) + 8 * i), "copy");
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "addObject:", v30);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v29, CFSTR("fromAttribute"));
        -[NSMutableDictionary setObject:forKey:](v194->_transitionInformationsDict, "setObject:forKey:", v31, v30);

      }
      v24 = obj;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v219, v229, 16);
    }
    while (v26);
  }

  v32 = v194;
  -[UICollectionViewLayout collectionView](v194, "collectionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_pivotForTransitionFromLayout:toLayout:", v32->_fromLayout, v32->_toLayout);
  v34 = objc_claimAutoreleasedReturnValue();

  MidX = CGRectGetMidX(*p_fromVisibleBounds);
  MidY = CGRectGetMidY(*p_fromVisibleBounds);
  v181 = (void *)v34;
  if (v34)
  {
    -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](v194->_fromLayout, "layoutAttributesForItemAtIndexPath:", v34, MidY);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
  }
  else
  {
    v39 = MidY;
    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v37 = v24;
    v38 = (void *)objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v215, v228, 16);
    if (v38)
    {
      v40 = 0;
      v41 = *(_QWORD *)v216;
      v42 = 3.40282347e38;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v216 != v41)
            objc_enumerationMutation(v37);
          v44 = *(id **)(*((_QWORD *)&v215 + 1) + 8 * (_QWORD)j);
          -[UIBarButtonItemGroup _items](v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", 0x1E170AD00);

          if (v46)
          {
            objc_msgSend(v44, "center");
            *(float *)&v47 = (v47 - MidX) * (v47 - MidX) + (v48 - v39) * (v48 - v39);
            v49 = sqrtf(*(float *)&v47);
            if (v42 > v49)
            {
              v50 = objc_msgSend(v44, "copy");

              v42 = v49;
              v40 = (void *)v50;
            }
          }
        }
        v38 = (void *)objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v215, v228, 16);
      }
      while (v38);
      v32 = v194;
      v34 = 0;
      v38 = v40;
      v21 = 0x1E0C99000;
    }
    else
    {
      v34 = 0;
    }
  }

  toLayout = v32->_toLayout;
  objc_msgSend(v38, "indexPath");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](toLayout, "layoutAttributesForItemAtIndexPath:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    if (v34)
    {
      objc_msgSend(v53, "frame");
      v55 = v54;
      v57 = v56;
      objc_msgSend(v38, "frame");
      v59 = v58 - v5;
      objc_msgSend(v38, "frame");
      v5 = v55 - v59;
      v7 = v57 - (v60 - v7);
    }
    else
    {
      objc_msgSend(v53, "center");
      v5 = v61 - v9 * 0.5;
      v7 = v62 - v11 * 0.5;
    }
  }
  -[UICollectionViewLayout collectionViewContentSize](v32->_toLayout, "collectionViewContentSize");
  v64 = v63;
  v66 = v65;
  v67 = 0.0;
  v231.origin.x = 0.0;
  v231.origin.y = 0.0;
  v231.size.width = v64;
  v231.size.height = v66;
  v234.origin.x = v5;
  v234.origin.y = v7;
  v234.size.width = v9;
  v234.size.height = v11;
  v179 = v53;
  v180 = v38;
  if (CGRectContainsRect(v231, v234))
  {
    v67 = v5;
  }
  else
  {
    v232.origin.x = 0.0;
    v232.origin.y = 0.0;
    v232.size.width = v64;
    v232.size.height = v66;
    v235.origin.x = v5;
    v235.origin.y = v7;
    v235.size.width = v9;
    v235.size.height = v11;
    v233 = CGRectIntersection(v232, v235);
    if (v64 > v9)
    {
      if (v233.size.width >= v9)
      {
        v67 = v5;
      }
      else
      {
        v68 = v9 - v233.size.width;
        if (v233.origin.x <= v5)
          v69 = -v68;
        else
          v69 = v68;
        v67 = v5 + v69;
      }
    }
    if (v66 <= v11)
    {
      v7 = 0.0;
    }
    else if (v233.size.height < v11)
    {
      v70 = v11 - v233.size.height;
      if (v233.origin.y <= v7)
        v70 = -(v11 - v233.size.height);
      v7 = v7 + v70;
    }
  }
  -[UICollectionViewLayout collectionView](v32, "collectionView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "contentInset");
  v73 = v67 - v72;
  -[UICollectionViewLayout collectionView](v32, "collectionView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "contentInset");
  v76 = v7 - v75;

  -[UICollectionViewLayout targetContentOffsetForProposedContentOffset:](v32->_toLayout, "targetContentOffsetForProposedContentOffset:", v73, v76);
  v32->_toVisibleBounds.origin.x = v77;
  v32->_toVisibleBounds.origin.y = v78;
  v32->_toVisibleBounds.size.width = v9;
  v32->_toVisibleBounds.size.height = v11;
  -[UICollectionViewLayout layoutAttributesForElementsInRect:](v32->_toLayout, "layoutAttributesForElementsInRect:");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v21 + 3616), "setWithCapacity:", objc_msgSend(v79, "count"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v214 = 0u;
  v189 = v79;
  v80 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v211, v227, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v212;
    do
    {
      for (k = 0; k != v81; ++k)
      {
        if (*(_QWORD *)v212 != v82)
          objc_enumerationMutation(v189);
        v84 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v211 + 1) + 8 * k), "copy");
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "addObject:", v85);
        -[NSMutableDictionary objectForKey:](v32->_transitionInformationsDict, "objectForKey:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v86)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v86, "setObject:forKey:", v84, CFSTR("toAttribute"));
        -[NSMutableDictionary setObject:forKey:](v32->_transitionInformationsDict, "setObject:forKey:", v86, v85);

      }
      v81 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v211, v227, 16);
    }
    while (v81);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v190);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v191);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v190);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "minusSet:", v191);
  objc_msgSend(v88, "minusSet:", v190);
  v178 = v89;
  objc_msgSend(v89, "intersectSet:", v191);
  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  v188 = v88;
  v90 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v207, v226, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v208;
    do
    {
      v93 = 0;
      do
      {
        if (*(_QWORD *)v208 != v92)
          objc_enumerationMutation(v188);
        v94 = *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * v93);
        -[NSMutableDictionary objectForKey:](v32->_transitionInformationsDict, "objectForKey:", v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v94)
        {
          v97 = 0;
          goto LABEL_70;
        }
        v96 = *(_QWORD *)(v94 + 32);
        if (v96 != 1)
        {
          if (v96)
            goto LABEL_75;
          v97 = *(void **)(v94 + 8);
LABEL_70:
          v98 = v32->_toLayout;
          v99 = v97;
          -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](v98, "layoutAttributesForItemAtIndexPath:", v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = (void *)objc_msgSend(v100, "copy");

          if (v101)
            goto LABEL_74;
          goto LABEL_75;
        }
        v102 = v32->_toLayout;
        v103 = *(id *)(v94 + 16);
        v104 = *(id *)(v94 + 8);
        -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](v102, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = (void *)objc_msgSend(v105, "copy");

        v32 = v194;
        if (v101
          || (objc_msgSend(v95, "objectForKey:", CFSTR("fromAttribute")),
              v106 = (void *)objc_claimAutoreleasedReturnValue(),
              v101 = (void *)objc_msgSend(v106, "copy"),
              v106,
              objc_msgSend(v101, "setAlpha:", 0.0),
              v101))
        {
LABEL_74:
          objc_msgSend(v95, "setObject:forKey:", v101, CFSTR("toAttribute"));

        }
LABEL_75:

        ++v93;
      }
      while (v91 != v93);
      v107 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v207, v226, 16);
      v91 = v107;
    }
    while (v107);
  }

  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  v187 = v87;
  v108 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v203, v225, 16);
  if (!v108)
    goto LABEL_97;
  v109 = v108;
  v110 = *(_QWORD *)v204;
  do
  {
    v111 = 0;
    do
    {
      if (*(_QWORD *)v204 != v110)
        objc_enumerationMutation(v187);
      v112 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * v111);
      -[NSMutableDictionary objectForKey:](v194->_transitionInformationsDict, "objectForKey:", v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v112)
      {
        v115 = 0;
        goto LABEL_88;
      }
      v114 = *(_QWORD *)(v112 + 32);
      if (v114 != 1)
      {
        if (v114)
          goto LABEL_93;
        v115 = *(void **)(v112 + 8);
LABEL_88:
        fromLayout = v194->_fromLayout;
        v117 = v115;
        -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](fromLayout, "layoutAttributesForItemAtIndexPath:", v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = (void *)objc_msgSend(v118, "copy");

        if (v119)
          goto LABEL_92;
        goto LABEL_93;
      }
      v120 = v194->_fromLayout;
      v121 = *(id *)(v112 + 16);
      v122 = *(id *)(v112 + 8);
      -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](v120, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = (void *)objc_msgSend(v123, "copy");

      if (v119
        || (objc_msgSend(v113, "objectForKey:", CFSTR("toAttribute")),
            v124 = (void *)objc_claimAutoreleasedReturnValue(),
            v119 = (void *)objc_msgSend(v124, "copy"),
            v124,
            objc_msgSend(v119, "setAlpha:", 0.0),
            v119))
      {
LABEL_92:
        objc_msgSend(v113, "setObject:forKey:", v119, CFSTR("fromAttribute"));

      }
LABEL_93:

      ++v111;
    }
    while (v109 != v111);
    v125 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v203, v225, 16);
    v109 = v125;
  }
  while (v125);
LABEL_97:

  v126 = v194;
  if (!v184)
    goto LABEL_149;
  -[NSMutableDictionary allKeys](v194->_transitionInformationsDict, "allKeys");
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v182 = (id)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v199, v224, 16);
  if (!v185)
    goto LABEL_148;
  v183 = *(_QWORD *)v200;
  while (2)
  {
    v127 = 0;
    while (2)
    {
      if (*(_QWORD *)v200 != v183)
        objc_enumerationMutation(v182);
      v128 = *(_QWORD *)(*((_QWORD *)&v199 + 1) + 8 * v127);
      -[NSMutableDictionary objectForKey:](v126->_transitionInformationsDict, "objectForKey:", v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "objectForKey:", CFSTR("fromAttribute"));
      v130 = (_WORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "objectForKey:", CFSTR("toAttribute"));
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      if (v128)
      {
        v132 = *(_QWORD *)(v128 + 32);
        switch(v132)
        {
          case 2:
            v150 = v126->_fromLayout;
            v151 = *(id *)(v128 + 16);
            v152 = *(id *)(v128 + 8);
            -[UICollectionViewLayout finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:](v150, "finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:", v151, v152);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = (_WORD *)objc_msgSend(v153, "copy");

            v154 = v126->_toLayout;
            v140 = *(id *)(v128 + 16);
            v141 = *(id *)(v128 + 8);
            -[UICollectionViewLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:](v154, "initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:", v140, v141);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 1:
            v143 = v126->_fromLayout;
            v144 = *(id *)(v128 + 16);
            v145 = v126;
            v146 = *(id *)(v128 + 8);
            -[UICollectionViewLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](v143, "finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:", v144, v146);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = (_WORD *)objc_msgSend(v147, "copy");

            v148 = v145->_toLayout;
            v140 = *(id *)(v128 + 16);
            v141 = *(id *)(v128 + 8);
            -[UICollectionViewLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](v148, "initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:", v140, v141);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            break;
          case 0:
            v133 = *(void **)(v128 + 8);
            goto LABEL_108;
          default:
            v142 = 0;
LABEL_118:
            if (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v142, (uint64_t)v130))
              v156 = v131;
            else
              v156 = (_WORD *)objc_msgSend(v130, "copy");
            v137 = v156;
            if (!v142)
              goto LABEL_122;
            goto LABEL_126;
        }
        v155 = v149;
        v142 = (void *)objc_msgSend(v149, "copy");

      }
      else
      {
        v133 = 0;
LABEL_108:
        v134 = v126->_fromLayout;
        v135 = v133;
        -[UICollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](v134, "finalLayoutAttributesForDisappearingItemAtIndexPath:", v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = (_WORD *)objc_msgSend(v136, "copy");

        if (v128)
          v138 = *(void **)(v128 + 8);
        else
          v138 = 0;
        v139 = v126->_toLayout;
        v140 = v138;
        -[UICollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](v139, "initialLayoutAttributesForAppearingItemAtIndexPath:", v140);
        v141 = (id)objc_claimAutoreleasedReturnValue();
        v142 = (void *)objc_msgSend(v141, "copy");
      }

      v126 = v194;
      if (!v137)
        goto LABEL_118;
      if (!v142)
      {
LABEL_122:
        if (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v137, (uint64_t)v131))
          v157 = v130;
        else
          v157 = (_WORD *)objc_msgSend(v131, "copy");
        v142 = v157;
      }
LABEL_126:
      if ((!-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v137, (uint64_t)v131)
         || (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v142, (uint64_t)v130) & 1) == 0)
        && (!-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v142, (uint64_t)v131)
         || (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v137, (uint64_t)v130) & 1) == 0)
        && (-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v130, (uint64_t)v131) & 1) == 0)
      {
        v158 = -[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](v130, v137);
        v159 = -[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](v142, v131);
        if (v158 && v159)
        {
          objc_msgSend(v129, "setObject:forKey:", v142, CFSTR("fromAttribute"));
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v129, "count"));
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = -[_UICollectionViewItemKey copyAsClone:]((id *)v128, 1);
          if (v137)
            v137[144] |= 8u;
          if (v130)
            v130[144] |= 8u;
          objc_msgSend(v160, "setObject:forKey:", v130, CFSTR("fromAttribute"));
          objc_msgSend(v160, "setObject:forKey:", v137, CFSTR("toAttribute"));
          -[NSMutableDictionary setObject:forKey:](v126->_transitionInformationsDict, "setObject:forKey:", v160, v161);

        }
        else
        {
          if (v158)
          {
            v162 = v129;
            v163 = v137;
            v164 = CFSTR("toAttribute");
          }
          else
          {
            if (!v159)
              goto LABEL_143;
            v162 = v129;
            v163 = v142;
            v164 = CFSTR("fromAttribute");
          }
          objc_msgSend(v162, "setObject:forKey:", v163, v164);
        }
      }
LABEL_143:

      if (v185 != ++v127)
        continue;
      break;
    }
    v165 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v199, v224, 16);
    v185 = v165;
    if (v165)
      continue;
    break;
  }
LABEL_148:

LABEL_149:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  -[NSMutableDictionary allKeys](v126->_transitionInformationsDict, "allKeys");
  v193 = (id)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v195, v223, 16);
  if (v166)
  {
    v167 = v166;
    v168 = *(_QWORD *)v196;
    do
    {
      for (m = 0; m != v167; ++m)
      {
        if (*(_QWORD *)v196 != v168)
          objc_enumerationMutation(v193);
        v170 = *(_QWORD *)(*((_QWORD *)&v195 + 1) + 8 * m);
        -[NSMutableDictionary objectForKey:](v194->_transitionInformationsDict, "objectForKey:", v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "objectForKey:", CFSTR("fromAttribute"));
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "objectForKey:", CFSTR("toAttribute"));
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](v172, v173) & 1) == 0)
        {
          objc_msgSend(v172, "alpha");
          if (v174 == 0.0)
            v175 = 1;
          else
            v175 = objc_msgSend(v172, "isHidden");
          objc_msgSend(v173, "alpha");
          if (v176 == 0.0)
            v177 = 1;
          else
            v177 = objc_msgSend(v173, "isHidden");
          if ((v175 & v177) == 1)
            objc_msgSend(v192, "addObject:", v170);
          else
            objc_msgSend(v171, "removeObjectForKey:", CFSTR("toAttribute"));
        }

      }
      v167 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v195, v223, 16);
    }
    while (v167);
  }

  -[NSMutableDictionary removeObjectsForKeys:](v194->_transitionInformationsDict, "removeObjectsForKeys:", v192);
}

- (CGRect)_oldVisibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromVisibleBounds.origin.x;
  y = self->_fromVisibleBounds.origin.y;
  width = self->_fromVisibleBounds.size.width;
  height = self->_fromVisibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_newVisibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_toVisibleBounds.origin.x;
  y = self->_toVisibleBounds.origin.y;
  width = self->_toVisibleBounds.size.width;
  height = self->_toVisibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)updateValue:(CGFloat)value forAnimatedKey:(NSString *)key
{
  NSString *v6;
  id v7;

  v6 = key;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_trackLayoutValue:forKey:", v6, value);

}

- (CGFloat)valueForAnimatedKey:(NSString *)key
{
  NSString *v4;
  void *v5;
  double v6;
  double v7;

  v4 = key;
  -[UICollectionViewLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_trackedLayoutValueForKey:", v4);
  v7 = v6;

  return v7;
}

- (void)setTransitionProgress:(CGFloat)transitionProgress
{
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obja[2];
  void *obj;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = 0.0;
  if (transitionProgress >= 0.0)
    v5 = transitionProgress;
  if (transitionProgress <= 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  *(float64x2_t *)obja = vaddq_f64((float64x2_t)self->_fromVisibleBounds.origin, vmulq_n_f64(vsubq_f64((float64x2_t)self->_toVisibleBounds.origin, (float64x2_t)self->_fromVisibleBounds.origin), v6));
  v18 = v6;
  -[UICollectionViewLayout collectionView](self, "collectionView", obja[0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOffset:", *(_OWORD *)obja);

  self->_transitionProgress = transitionProgress;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableDictionary allKeys](self->_transitionInformationsDict, "allKeys");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_transitionInformationsDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("fromAttribute"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("toAttribute"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v13, v14, v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("actualAttribute"));

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  -[UICollectionViewTransitionLayout invalidateLayout](self, "invalidateLayout");
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result
{
  if (self->_transitionProgress == 0.0 && self->_layoutIsValid)
    return self->_fromVisibleBounds.origin;
  return result;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)interpolatedLayoutAttributesFromLayoutAttributes:(id)a3 toLayoutAttributes:(id)a4 progress:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float64x2_t v25;
  double v26;
  double v27;
  double v28;
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
  double accuracy;
  double v45;
  double v46;
  float64x2_t v48;
  __int128 v49;
  float64x2_t v50;
  __int128 v51;
  float64x2_t v52;
  __int128 v53;
  float64x2_t v54;
  __int128 v55;
  float64x2_t v56;
  __int128 v57;
  float64x2_t v58;
  __int128 v59;
  float64x2_t v60;
  __int128 v61;
  float64x2_t v62;
  __int128 v63;
  double v64;
  double v65;
  _OWORD v67[8];
  CATransform3D v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "setHidden:", 0);
    objc_msgSend(v7, "center");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v9, "center");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "size");
    v64 = v20;
    v65 = v19;
    objc_msgSend(v9, "size");
    v22 = v21;
    v24 = v23;
    v25 = 0uLL;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    if (v7)
    {
      objc_msgSend(v7, "transform3D");
      v25 = 0uLL;
    }
    v75 = v25;
    v76 = v25;
    v73 = v25;
    v74 = v25;
    v71 = v25;
    v72 = v25;
    v69 = v25;
    v70 = v25;
    objc_msgSend(v9, "transform3D");
    objc_msgSend(v7, "alpha");
    v27 = v26;
    objc_msgSend(v9, "alpha");
    v28 = (v16 - v12) * a5;
    v29 = (v18 - v14) * a5;
    v30 = v22 - v65;
    v31 = v24 - v64;
    *(float64x2_t *)&v68.m31 = v81;
    *(float64x2_t *)&v68.m33 = v82;
    v33 = v27 + (v32 - v27) * a5;
    *(float64x2_t *)&v68.m41 = v83;
    *(float64x2_t *)&v68.m43 = v84;
    *(float64x2_t *)&v68.m11 = v77;
    *(float64x2_t *)&v68.m13 = v78;
    *(float64x2_t *)&v68.m21 = v79;
    *(float64x2_t *)&v68.m23 = v80;
    if (!CATransform3DIsIdentity(&v68))
      goto LABEL_7;
    *(float64x2_t *)&v68.m31 = v73;
    *(float64x2_t *)&v68.m33 = v74;
    *(float64x2_t *)&v68.m41 = v75;
    *(float64x2_t *)&v68.m43 = v76;
    *(float64x2_t *)&v68.m11 = v69;
    *(float64x2_t *)&v68.m13 = v70;
    *(float64x2_t *)&v68.m21 = v71;
    *(float64x2_t *)&v68.m23 = v72;
    if (CATransform3DIsIdentity(&v68))
    {
      v60 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 96);
      v62 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 112);
      v56 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 64);
      v58 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 80);
      v52 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 32);
      v54 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 48);
      v48 = *(float64x2_t *)MEMORY[0x1E0CD2610];
      v50 = *(float64x2_t *)(MEMORY[0x1E0CD2610] + 16);
      v34 = a5;
    }
    else
    {
LABEL_7:
      v34 = a5;
      v60 = vaddq_f64(v83, vmulq_n_f64(vsubq_f64(v75, v83), a5));
      v62 = vaddq_f64(v84, vmulq_n_f64(vsubq_f64(v76, v84), a5));
      v56 = vaddq_f64(v81, vmulq_n_f64(vsubq_f64(v73, v81), a5));
      v58 = vaddq_f64(v82, vmulq_n_f64(vsubq_f64(v74, v82), a5));
      v52 = vaddq_f64(v79, vmulq_n_f64(vsubq_f64(v71, v79), a5));
      v54 = vaddq_f64(v80, vmulq_n_f64(vsubq_f64(v72, v80), a5));
      v48 = vaddq_f64(v77, vmulq_n_f64(vsubq_f64(v69, v77), a5));
      v50 = vaddq_f64(v78, vmulq_n_f64(vsubq_f64(v70, v78), a5));
    }
    v35 = v30 * v34;
    v36 = v31 * v34;
    v37 = v12 + v28;
    v38 = v14 + v29;
    objc_msgSend(v10, "setAlpha:", v33, *(_OWORD *)&v48, *(_OWORD *)&v50, *(_OWORD *)&v52, *(_OWORD *)&v54, *(_OWORD *)&v56, *(_OWORD *)&v58, *(_OWORD *)&v60, *(_OWORD *)&v62);
    v67[0] = v49;
    v67[1] = v51;
    v67[2] = v53;
    v67[3] = v55;
    v67[4] = v57;
    v67[5] = v59;
    v67[6] = v61;
    v67[7] = v63;
    objc_msgSend(v10, "setTransform3D:", v67);
    v39 = self->_accuracy + self->_accuracy;
    if (v39 == 1.0)
    {
      v40 = round(v37);
      v41 = round(v38);
    }
    else
    {
      v40 = round(v37 * v39) / v39;
      v41 = round(v38 * v39) / v39;
    }
    v42 = v65 + v35;
    v43 = v64 + v36;
    objc_msgSend(v10, "setCenter:", v40, v41);
    accuracy = self->_accuracy;
    if (accuracy == 1.0)
    {
      v45 = round(v42);
      v46 = round(v43);
    }
    else
    {
      v45 = round(v42 * accuracy) / accuracy;
      v46 = round(v43 * accuracy) / accuracy;
    }
    objc_msgSend(v10, "setSize:", v45, v46);
  }
  else
  {
    v10 = (void *)objc_msgSend(v7, "copy");
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
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
  uint64_t v13;
  BOOL v14;
  double transitionProgress;
  double v16;
  double v17;
  void *v19;

  v4 = a3;
  +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_transitionInformationsDict, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("actualAttribute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("fromAttribute"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("toAttribute"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_12;
    }
    else
    {
      v11 = 0;
    }
    -[UICollectionViewLayout collectionView](self->_fromLayout, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self->_fromLayout, "layoutAttributesForItemAtIndexPath:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_11;
    }
    -[UICollectionViewLayout collectionView](self->_toLayout, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UICollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](self->_toLayout, "initialLayoutAttributesForAppearingItemAtIndexPath:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v10 = (void *)v13;
    }
LABEL_12:
    if (!v11)
    {
      -[UICollectionViewLayout collectionView](self->_toLayout, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19
        || (-[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](self->_toLayout, "layoutAttributesForItemAtIndexPath:", v4), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[UICollectionViewLayout collectionView](self->_fromLayout, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_18;
        -[UICollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](self->_fromLayout, "finalLayoutAttributesForDisappearingItemAtIndexPath:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v10)
      v14 = v11 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      transitionProgress = self->_transitionProgress;
      v16 = 0.0;
      if (transitionProgress >= 0.0)
        v16 = self->_transitionProgress;
      if (transitionProgress <= 1.0)
        v17 = v16;
      else
        v17 = 1.0;
      -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v10, v11, v17, 1.0, v16);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_18:
    v9 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v9 = v7;
LABEL_26:

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  double transitionProgress;
  double v19;
  double v20;
  void *v22;

  v6 = a3;
  v7 = a4;
  +[_UICollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_transitionInformationsDict, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("actualAttribute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("fromAttribute"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("toAttribute"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_12;
    }
    else
    {
      v14 = 0;
    }
    -[UICollectionViewLayout collectionView](self->_fromLayout, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self->_fromLayout, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
        goto LABEL_11;
    }
    -[UICollectionViewLayout collectionView](self->_toLayout, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UICollectionViewLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](self->_toLayout, "initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = (void *)v16;
    }
LABEL_12:
    if (!v14)
    {
      -[UICollectionViewLayout collectionView](self->_toLayout, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22
        || (-[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self->_toLayout, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[UICollectionViewLayout collectionView](self->_fromLayout, "collectionView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_18;
        -[UICollectionViewLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](self->_fromLayout, "finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:", v6, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (v13)
      v17 = v14 == 0;
    else
      v17 = 1;
    if (!v17)
    {
      transitionProgress = self->_transitionProgress;
      v19 = 0.0;
      if (transitionProgress >= 0.0)
        v19 = self->_transitionProgress;
      if (transitionProgress <= 1.0)
        v20 = v19;
      else
        v20 = 1.0;
      -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v13, v14, v20, 1.0, v19);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_18:
    v12 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v12 = v10;
LABEL_26:

  return v12;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  double transitionProgress;
  double v17;
  double v18;

  v6 = a3;
  v7 = a4;
  +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_transitionInformationsDict, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("actualAttribute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    if (v9)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("fromAttribute"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("toAttribute"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
    }
    -[UICollectionViewLayout collectionView](self->_fromLayout, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UICollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self->_fromLayout, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v6, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_9:
    if (!v14)
    {
      -[UICollectionViewLayout collectionView](self->_toLayout, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_17;
      -[UICollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](self->_toLayout, "layoutAttributesForDecorationViewOfKind:atIndexPath:", v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v13)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      transitionProgress = self->_transitionProgress;
      v17 = 0.0;
      if (transitionProgress >= 0.0)
        v17 = self->_transitionProgress;
      if (transitionProgress <= 1.0)
        v18 = v17;
      else
        v18 = 1.0;
      -[UICollectionViewTransitionLayout interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:](self, "interpolatedLayoutAttributesFromLayoutAttributes:toLayoutAttributes:progress:", v13, v14, v18, 1.0, v17);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_17:
    v12 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v12 = v10;
LABEL_25:

  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[NSMutableDictionary allKeys](self->_transitionInformationsDict, "allKeys", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allKeys](self->_transitionInformationsDict, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        -[NSMutableDictionary objectForKey:](self->_transitionInformationsDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("actualAttribute"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (UICollectionViewLayout)currentLayout
{
  return self->_fromLayout;
}

- (UICollectionViewLayout)nextLayout
{
  return self->_toLayout;
}

- (CGFloat)transitionProgress
{
  return self->_transitionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearingLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_disappearingLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfos, 0);
  objc_storeStrong((id *)&self->_transitionInformationsDict, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
  objc_storeStrong((id *)&self->_fromLayout, 0);
}

@end
