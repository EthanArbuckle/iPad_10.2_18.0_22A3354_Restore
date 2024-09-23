@implementation _UIDocumentCarouselView

- (_UIDocumentCarouselView)initWithFrame:(CGRect)a3
{
  _UIDocumentCarouselView *v3;
  _UIDocumentCarouselView *v4;
  uint64_t v5;
  NSMutableDictionary *containerViews;
  UIPanGestureRecognizer *v7;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v12;
  UIViewFloatAnimatableProperty *v13;
  UIViewFloatAnimatableProperty *pagingFractionAnimatableProperty;
  UIViewFloatAnimatableProperty *v15;
  UIViewFloatAnimatableProperty *revealAnimatableProperty;
  void *v17;
  void *v19;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentCarouselView;
  v3 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_centerItemFraction = 1.0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
    containerViews = v4->_containerViews;
    v4->_containerViews = (NSMutableDictionary *)v5;

    -[UIView setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    if (v4->_panGestureRecognizer || v4->_tapGestureRecognizer)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__configureGestureRecognizers, v4, CFSTR("_UIDocumentCarouselView.m"), 588, CFSTR("UIKit internal inconsistency: gesture recognizers have already been configured"));

    }
    v7 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handlePanNavigation_);
    -[UIPanGestureRecognizer setDelegate:](v7, "setDelegate:", v4);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v7, "setAllowedScrollTypesMask:", 3);
    panGestureRecognizer = v4->_panGestureRecognizer;
    v4->_panGestureRecognizer = v7;
    v9 = v7;

    v10 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handleTapNavigation_);
    -[UIGestureRecognizer setDelegate:](v10, "setDelegate:", v4);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v10;
    v12 = v10;

    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v9);
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v12);

    v13 = objc_alloc_init(UIViewFloatAnimatableProperty);
    pagingFractionAnimatableProperty = v4->_pagingFractionAnimatableProperty;
    v4->_pagingFractionAnimatableProperty = v13;

    v15 = objc_alloc_init(UIViewFloatAnimatableProperty);
    revealAnimatableProperty = v4->_revealAnimatableProperty;
    v4->_revealAnimatableProperty = v15;

    objc_initWeak(&location, v4);
    v24[0] = v4->_pagingFractionAnimatableProperty;
    v24[1] = v4->_revealAnimatableProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57___UIDocumentCarouselView__configureAnimatableProperties__block_invoke;
    v21[3] = &unk_1E16B3F40;
    objc_copyWeak(&v22, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v17, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    -[_UIDocumentCarouselView setPagingEnabled:animated:](v4, "setPagingEnabled:animated:", 1, 0);
  }
  return v4;
}

- (void)_performLayout
{
  double v2;
  double v3;
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  _BOOL4 v38;
  uint64_t v39;
  double v40;
  BOOL v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double *p_a;
  _UIDocumentCarouselViewLayoutAttributes *v53;
  void *v54;
  _UIDocumentCarouselViewLayoutAttributes *v55;
  _UIDocumentCarouselViewLayoutAttributes *v56;
  void *v57;
  _UIDocumentCarouselViewItemContainerView *v58;
  CGAffineTransform *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  CGFloat Height;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  _BOOL4 v101;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  double v106;
  __n128 v107;
  double v108;
  double v109;
  __n128 v110;
  __n128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  float v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  uint64_t v127;
  _UIDocumentCarouselViewLayoutAttributes *v128;
  _UIDocumentCarouselViewLayoutAttributes *v129;
  double v130;
  double v131;
  BOOL v132;
  id obj;
  double v134;
  BOOL v135;
  double v136;
  uint64_t v137;
  double v138;
  uint64_t v139;
  double v140;
  double v141;
  double v142;
  _BOOL4 v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  double v148;
  double v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  CGAffineTransform v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _QWORD v159[2];
  double (*v160)(uint64_t, double, double, double, double);
  void *v161;
  uint64_t v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  CGFloat v166;
  double v167;
  uint64_t v168;
  double v169;
  uint64_t v170;
  _QWORD v171[2];
  double (*v172)(uint64_t, unint64_t);
  void *v173;
  uint64_t v174;
  char *v175;
  _QWORD v176[2];
  double (*v177)(uint64_t, uint64_t);
  void *v178;
  double v179;
  _QWORD v180[2];
  void (*v181)(uint64_t, uint64_t);
  void *v182;
  uint64_t v183;
  double v184;
  CGFloat v185;
  CGFloat v186;
  CGFloat v187;
  CGFloat v188;
  double v189;
  uint64_t v190;
  double v191;
  uint64_t v192;
  char *v193;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v196;
  CGAffineTransform v197;
  _BYTE v198[128];
  uint64_t v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;

  v199 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 424), "presentationValue");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 432), "presentationValue");
  v5 = v4;
  v6 = objc_msgSend(*(id *)(a1 + 504), "count");
  v7 = v6;
  if (v6 >= 5)
    v8 = 5;
  else
    v8 = v6;
  _UIDocumentCarouselViewItemWidth((void *)a1);
  v10 = v9;
  _UIDocumentCarouselViewRevealDimension((void *)a1);
  v131 = v11;
  if (!v8 || v10 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 416), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_278);
    return;
  }
  v142 = v5;
  v12 = vcvtmd_s64_f64(v3);
  v13 = (double)(uint64_t)floor(v3);
  v14 = vcvtpd_s64_f64(v3);
  if (v3 == v13)
    v14 = v12 + 1;
  v15 = (uint64_t)(v12 % (uint64_t)v7 + v7) % (uint64_t)v7;
  v16 = (uint64_t)(v14 % (uint64_t)v7 + v7) % (uint64_t)v7;
  v17 = *(double *)(a1 + 456);
  objc_msgSend((id)a1, "bounds");
  v146 = v19;
  v147 = v18;
  v144 = v21;
  v145 = v20;
  objc_msgSend((id)a1, "directionalLayoutMargins");
  v134 = v22;
  v137 = v23;
  v25 = v24;
  v139 = v26;
  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  v150 = v8;
  v152 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8);
  v27 = 1;
  if (v7 < 4)
    v27 = 2;
  if (v7 >= 2)
    v28 = v27;
  else
    v28 = 3;
  v29 = 0x1E0CB3000uLL;
  do
  {
    v30 = v15 % v7;
    v31 = v16 % v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
    v32 = v7;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setObject:forKeyedSubscript:", v33, v34);

    v7 = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setObject:forKeyedSubscript:", v35, v36);

    ++v16;
    ++v15;
    ++v28;
    --v8;
  }
  while (v8);
  v37 = v3 - v13;
  v38 = v3 <= v17 + -1.0;
  if (v3 >= v17 + 1.0)
    v38 = 1;
  v143 = v38;
  v151 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v150);
  v128 = 0;
  v129 = 0;
  v132 = 0;
  v39 = 0;
  v40 = round(v3);
  v148 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v149 = *MEMORY[0x1E0C9D820];
  v41 = *MEMORY[0x1E0C9D820] == 0.0;
  if (v148 != 0.0)
    v41 = 0;
  v135 = v41;
  v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v140 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v141 = *MEMORY[0x1E0C9D648];
  v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  do
  {
    objc_msgSend(*(id *)(v29 + 2024), "numberWithUnsignedInteger:", v39, v128);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "objectForKeyedSubscript:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "unsignedIntegerValue");

    objc_msgSend(*(id *)(v29 + 2024), "numberWithUnsignedInteger:", v39);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "unsignedIntegerValue");

    v50 = *(void **)(a1 + 416);
    objc_msgSend(*(id *)(v29 + 2024), "numberWithUnsignedInteger:", v39);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", v51);
    p_a = (double *)objc_claimAutoreleasedReturnValue();

    if (!(v46 | v49))
    {
      objc_msgSend(p_a, "_setHiddenForReuse:", 1);
      goto LABEL_56;
    }
    v53 = objc_alloc_init(_UIDocumentCarouselViewLayoutAttributes);
    objc_msgSend(*(id *)(v29 + 2024), "numberWithUnsignedInteger:", v39);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "setObject:forKeyedSubscript:", v53, v54);

    if (v46 == 3)
    {
      v55 = v53;

      if (v37 <= 0.5)
      {
        if (v55)
          v55->_userInteractionEnabled = 1;
        if (v143)
        {
          *(_QWORD *)(a1 + 464) = v39;
          *(double *)(a1 + 456) = v40;
        }
      }
      if (v39 == *(_QWORD *)(a1 + 464))
        v132 = (unint64_t)(v49 - 1) < 2;
      v129 = v55;
    }
    if (v49 == 3)
    {
      v56 = v53;

      if (v37 > 0.5)
      {
        if (v56)
          v56->_userInteractionEnabled = 1;
        if (v143)
        {
          *(_QWORD *)(a1 + 464) = v39;
          *(double *)(a1 + 456) = v40;
        }
      }
      if (v39 == *(_QWORD *)(a1 + 464))
        v132 = (unint64_t)(v46 - 1) < 2;
      v128 = v56;
    }
    objc_msgSend(*(id *)(a1 + 504), "objectAtIndexedSubscript:", v39, v128);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_a)
    {
      -[_UIDocumentCarouselViewItemContainerView setContentConfiguration:]((uint64_t)p_a, v57);
    }
    else
    {
      v58 = [_UIDocumentCarouselViewItemContainerView alloc];
      if (v58)
      {
        *(_QWORD *)&v197.a = v58;
        *(_QWORD *)&v197.b = _UIDocumentCarouselViewItemContainerView;
        v59 = -[CGAffineTransform initWithFrame:]((objc_super *)&v197, sel_initWithFrame_, v141, v140, v42, v43);
        p_a = &v59->a;
        if (v59)
        {
          -[CGAffineTransform _configureView](v59, "_configureView");
          -[_UIDocumentCarouselViewItemContainerView setContentConfiguration:]((uint64_t)p_a, v57);
        }
      }
      else
      {
        p_a = 0;
      }
      v60 = *(void **)(a1 + 416);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setObject:forKeyedSubscript:", p_a, v61);

      objc_msgSend((id)a1, "addSubview:", p_a);
      if (!p_a)
      {
        v63 = 0.0;
        v62 = 0.0;
        if (!v135)
          goto LABEL_53;
        goto LABEL_52;
      }
    }
    v62 = p_a[54];
    v63 = p_a[55];
    if (v149 != v62 || v148 != v63)
      goto LABEL_53;
LABEL_52:
    objc_msgSend(p_a, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v200.origin.y = v146;
    v200.origin.x = v147;
    v200.size.height = v144;
    v200.size.width = v145;
    Height = CGRectGetHeight(v200);
    LODWORD(v66) = 1148846080;
    LODWORD(v67) = 1132068864;
    objc_msgSend(p_a, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, Height - v134 - v25, v66, v67);
LABEL_53:
    if (v53)
    {
      v53->_size.width = v62;
      v53->_size.height = v63;
    }

LABEL_56:
    ++v39;
    v29 = 0x1E0CB3000;
  }
  while (v32 != v39);
  v180[0] = MEMORY[0x1E0C809B0];
  v180[1] = 3221225472;
  v181 = __41___UIDocumentCarouselView__performLayout__block_invoke_2;
  v182 = &unk_1E16CAE18;
  v184 = v131;
  v185 = v147;
  v186 = v146;
  v187 = v145;
  v188 = v144;
  v189 = v134;
  v190 = v137;
  v191 = v25;
  v192 = v139;
  v193 = sel__performLayout;
  v183 = a1;
  v175 = sel__performLayout;
  v176[0] = MEMORY[0x1E0C809B0];
  v176[1] = 3221225472;
  v177 = __41___UIDocumentCarouselView__performLayout__block_invoke_3;
  v178 = &__block_descriptor_40_e8_d16__0Q8l;
  v179 = v142;
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v172 = __41___UIDocumentCarouselView__performLayout__block_invoke_4;
  v173 = &unk_1E16CAE60;
  v174 = a1;
  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v160 = __41___UIDocumentCarouselView__performLayout__block_invoke_5;
  v161 = &unk_1E16CAE88;
  v163 = v147;
  v164 = v146;
  v165 = v145;
  v166 = v144;
  v167 = v134;
  v168 = v137;
  v169 = v25;
  v170 = v139;
  v162 = a1;
  v68 = v153;
  v201.origin.x = v147;
  v201.origin.y = v146;
  v201.size.width = v145;
  v201.size.height = v144;
  CGRectGetMidX(v201);
  v202.origin.x = v147;
  v202.origin.y = v146;
  v202.size.width = v145;
  v202.size.height = v144;
  CGRectGetMidX(v202);
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  objc_msgSend(v151, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v198, 16);
  if (v69)
  {
    v70 = v69;
    v72 = 1.0 - v37;
    if (v132)
      v72 = v37;
    v73 = *(_QWORD *)v156;
    if (v72 <= 0.5)
      v74 = v72 + v72 + 0.0;
    else
      v74 = 1.0 - (v72 + -0.5 + v72 + -0.5);
    v130 = v74;
    v71 = *MEMORY[0x1E0C9D538];
    v138 = v37;
    v136 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v156 != v73)
          objc_enumerationMutation(obj);
        v76 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v75);
        objc_msgSend(v151, "objectForKeyedSubscript:", v76);
        v77 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 416), "objectForKeyedSubscript:", v76);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKeyedSubscript:", v76);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "unsignedIntegerValue");

        objc_msgSend(v152, "objectForKeyedSubscript:", v76);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "unsignedIntegerValue");

        v181((uint64_t)v180, v80);
        v84 = v83;
        v86 = v85;
        v181((uint64_t)v180, v82);
        v88 = v87;
        v90 = v89;
        v181((uint64_t)v180, 3);
        v92 = v91;
        v94 = v93;
        v95 = v91 + v142 * (v84 + v37 * (v88 - v84) - v91);
        v96 = *(_QWORD *)(a1 + 464);
        if (v96 == objc_msgSend(v76, "unsignedIntegerValue"))
        {
          v68 = v153;
          if (v77)
          {
            v97 = *(double *)(v77 + 48);
            v98 = *(double *)(v77 + 56);
          }
          else
          {
            v98 = 0.0;
            v97 = 0.0;
          }
          v99 = v97 + v98 * 0.0599640065 + v97 + v97 * -0.99820054 - v131 + 20.0;
          _UIScrollViewRubberBandOffsetWithoutDecorationForOffset(0, v130 * v99, v99 + -85.0, 0.0, v99);
          if (v132)
            v100 = -v100;
          v95 = v95 + v100;
        }
        else
        {
          v68 = v153;
        }
        if (v77)
        {
          *(double *)(v77 + 32) = v95;
          *(double *)(v77 + 40) = v94 + v142 * (v86 + v37 * (v90 - v86) - v94);
        }
        memset(&v154, 0, sizeof(v154));
        v203.origin.x = v147;
        v203.origin.y = v146;
        v203.size.width = v145;
        v203.size.height = v144;
        v101 = v95 < CGRectGetMidX(v203);
        v204.origin.x = v147;
        v204.origin.y = v146;
        v204.size.width = v145;
        v204.size.height = v144;
        v102 = v95 - CGRectGetMidX(v204);
        if (v102 >= 0.0)
          v103 = v102;
        else
          v103 = -v102;
        v205.origin.x = v147;
        v205.origin.y = v146;
        v205.size.width = v145;
        v205.size.height = v144;
        v104 = v103 / (CGRectGetWidth(v205) * 0.5);
        memset(&v197, 0, sizeof(v197));
        CGAffineTransformMakeRotation(&v197, dbl_18667DBB0[v101] * v104);
        memset(&v196, 0, sizeof(v196));
        CGAffineTransformMakeScale(&v196, v104 * -0.05 + 1.0, v104 * -0.05 + 1.0);
        memset(&v154, 0, sizeof(v154));
        t1 = v197;
        t2 = v196;
        CGAffineTransformConcat(&v154, &t1, &t2);
        if (v77)
        {
          v105 = *(_OWORD *)&v154.c;
          *(_OWORD *)(v77 + 96) = *(_OWORD *)&v154.a;
          *(_OWORD *)(v77 + 112) = v105;
          *(_OWORD *)(v77 + 128) = *(_OWORD *)&v154.tx;
        }
        v106 = v177((uint64_t)v176, v80);
        v107.n128_f64[0] = v177((uint64_t)v176, v82);
        v37 = v138;
        if (v77)
        {
          v107.n128_f64[0] = v106 + v138 * (v107.n128_f64[0] - v106);
          *(_QWORD *)(v77 + 24) = v107.n128_u64[0];
        }
        v108 = ((double (*)(_QWORD *, uint64_t, __n128))v172)(v171, v80, v107);
        v172((uint64_t)v171, v82);
        if (v77)
        {
          *(double *)(v77 + 16) = v108 + v138 * (v109 - v108);
          v110.n128_u64[0] = *(_QWORD *)(v77 + 48);
          v111.n128_u64[0] = *(_QWORD *)(v77 + 56);
        }
        else
        {
          v111.n128_u64[0] = 0;
          v110.n128_u64[0] = 0;
        }
        ((void (*)(_QWORD *, double, double, __n128, __n128))v160)(v159, v92, v94, v110, v111);
        if (v77)
        {
          *(_QWORD *)(v77 + 64) = v112;
          *(_QWORD *)(v77 + 72) = v113;
          *(_QWORD *)(v77 + 80) = v114;
          *(_QWORD *)(v77 + 88) = v115;
          objc_msgSend(v78, "_setHiddenForReuse:", 0);
          if (!v78)
            goto LABEL_96;
          objc_msgSend(v78, "setCenter:", *(double *)(v77 + 32), *(double *)(v77 + 40));
          objc_msgSend(v78, "setBounds:", v71, v136, *(double *)(v77 + 48), *(double *)(v77 + 56));
          v116 = *(_OWORD *)(v77 + 112);
          *(_OWORD *)&v197.a = *(_OWORD *)(v77 + 96);
          *(_OWORD *)&v197.c = v116;
          *(_OWORD *)&v197.tx = *(_OWORD *)(v77 + 128);
          objc_msgSend(v78, "setTransform:", &v197);
          v117 = *(double *)(v77 + 24) * 0.2;
        }
        else
        {
          objc_msgSend(v78, "_setHiddenForReuse:", 0);
          if (!v78)
            goto LABEL_96;
          objc_msgSend(v78, "setCenter:", 0.0, 0.0);
          objc_msgSend(v78, "setBounds:", v71, v136, 0.0, 0.0);
          memset(&v197, 0, sizeof(v197));
          objc_msgSend(v78, "setTransform:", &v197);
          v117 = 0.0;
        }
        objc_msgSend(v78, "layer");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v119 = v117;
        objc_msgSend(v118, "setShadowOpacity:", v119);

        if (v77)
        {
          v120 = *(double *)(v77 + 16);
          objc_msgSend(v78, "layer");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "setZPosition:", v120);

          objc_msgSend(v78, "setUserInteractionEnabled:", *(unsigned __int8 *)(v77 + 8));
          v122 = *(double *)(v77 + 64);
          v123 = *(double *)(v77 + 72);
          v124 = *(double *)(v77 + 80);
          v125 = *(double *)(v77 + 88);
        }
        else
        {
          objc_msgSend(v78, "layer");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = 0.0;
          objc_msgSend(v126, "setZPosition:", 0.0);

          objc_msgSend(v78, "setUserInteractionEnabled:", 0);
          v124 = 0.0;
          v125 = 0.0;
          v122 = 0.0;
        }
        objc_msgSend(v78, "setDirectionalLayoutMargins:", v122, v123, v124, v125);
LABEL_96:

        ++v75;
      }
      while (v70 != v75);
      v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v198, 16);
      v70 = v127;
    }
    while (v127);
  }

}

- (void)_updatePagingFraction:(double)a3 withTracking:
{
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  id location;

  if (val)
  {
    v6 = val[55];
    if (!v6)
    {
      -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](val, 1);
      v6 = val[55];
    }
    val[55] = v6 + 1;
    objc_initWeak(&location, val);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62___UIDocumentCarouselView__updatePagingFraction_withTracking___block_invoke;
    v9[3] = &unk_1E16B1888;
    v9[4] = val;
    *(double *)&v9[5] = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62___UIDocumentCarouselView__updatePagingFraction_withTracking___block_invoke_2;
    v7[3] = &unk_1E16CAEB0;
    objc_copyWeak(&v8, &location);
    _UIDocumentCarouselViewAnimateWithTracking(a2, (uint64_t)v9, (uint64_t)v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_cleanUpAfterAnimation
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 440);
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__cleanUpAfterAnimation, a1, CFSTR("_UIDocumentCarouselView.m"), 531, CFSTR("UIKit internal inconsistency: unbalanced document animation"));

      v2 = *(_QWORD *)(a1 + 440);
    }
    v3 = v2 - 1;
    *(_QWORD *)(a1 + 440) = v3;
    if (!v3)
      -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:]((_BYTE *)a1, 0);
  }
}

- (void)setLockedFocusEnvironmentForAnimation:(_BYTE *)a1
{
  void *v4;
  id v5;

  if (a1 && a1[496] != a2)
  {
    a1[496] = a2;
    objc_msgSend(a1, "_focusSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (a2)
      objc_msgSend(v4, "_lockEnvironment:", a1);
    else
      objc_msgSend(v4, "_unlockEnvironment:", a1);

  }
}

- (void)scrollToItemAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;

  v4 = a4;
  v8 = -[NSArray count](self->_items, "count");
  v9 = v8;
  if (a3 < 0 || v8 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentCarouselView.m"), 550, CFSTR("Attempted to scroll to an invalid index: %ld"), a3);

  }
  v10 = (double)v9 + -1.0;
  if (v10 > 2.0)
    v10 = 2.0;
  v11 = (double)a3 - v10;
  if (v4)
  {
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 0, v11);
  }
  else
  {
    -[UIViewFloatAnimatableProperty setValue:](self->_pagingFractionAnimatableProperty, "setValue:", v11);
    -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)setPagingEnabled:(BOOL)a3 animated:(BOOL)a4
{
  double v5;
  unint64_t animationCount;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  id location;

  if (self->_pagingEnabled != a3)
  {
    self->_pagingEnabled = a3;
    if (a3)
      v5 = 1.0;
    else
      v5 = 0.0;
    if (a4)
    {
      animationCount = self->_animationCount;
      if (!animationCount)
      {
        -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 1);
        animationCount = self->_animationCount;
      }
      self->_animationCount = animationCount + 1;
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53___UIDocumentCarouselView_setPagingEnabled_animated___block_invoke;
      v9[3] = &unk_1E16B1888;
      v9[4] = self;
      *(double *)&v9[5] = v5;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53___UIDocumentCarouselView_setPagingEnabled_animated___block_invoke_2;
      v7[3] = &unk_1E16CAEB0;
      objc_copyWeak(&v8, &location);
      _UIDocumentCarouselViewAnimateWithTracking(0, (uint64_t)v9, (uint64_t)v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      -[UIViewFloatAnimatableProperty setValue:](self->_revealAnimatableProperty, "setValue:", v5);
    }
  }
}

- (BOOL)isPagingEnabled
{
  return self->_pagingEnabled;
}

- (void)_handlePanNavigation:(id)a3
{
  uint64_t v5;
  double v6;
  unint64_t animationCount;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  double v34;
  void *v36;
  CGRect v37;

  if (self->_panGestureRecognizer != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentCarouselView.m"), 606, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("panGestureRecognizer == _panGestureRecognizer"));

  }
  v5 = objc_msgSend(a3, "state");
  if ((unint64_t)(v5 - 3) < 2)
  {
    objc_msgSend(a3, "translationInView:", self);
    v9 = v8;
    objc_msgSend(a3, "velocityInView:", self);
    v11 = v10;
    v12 = -v10;
    if (v11 >= 0.0)
      v13 = v11;
    else
      v13 = v12;
    _UIDocumentCarouselViewItemWidth(self);
    if (v9 >= 0.0)
      v15 = v9;
    else
      v15 = -v9;
    v16 = v14 * 0.5;
    if (v9 <= 0.0 || v11 <= -100.0)
    {
      v17 = v9 < 0.0;
      if (v11 >= 100.0)
        v17 = 0;
    }
    else
    {
      v17 = 1;
    }
    v33 = v13 >= 100.0;
    if (v15 >= v16)
      v33 = 1;
    v34 = 1.0;
    if (v9 > 0.0)
      v34 = -1.0;
    if (!v33 || !v17)
      v34 = -0.0;
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 0, self->_pagingFractionPanStart + v34);
    -[_UIDocumentCarouselView _cleanUpAfterAnimation]((uint64_t)self);
  }
  else if (v5 == 2)
  {
    -[UIView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    objc_msgSend(a3, "translationInView:", self);
    v29 = v28;
    v37.origin.x = v21;
    v37.origin.y = v23;
    v37.size.width = v25;
    v37.size.height = v27;
    v30 = v29 / CGRectGetWidth(v37);
    if (v30 < 0.0)
      v30 = -v30;
    v31 = fmax(fmin(v30, 0.9999), 0.0001);
    v32 = 1.0;
    if (v29 > 0.0)
      v32 = -1.0;
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 1, self->_pagingFractionPanStart + (self->_pagingFractionPanStart + v32 - self->_pagingFractionPanStart) * v31);
  }
  else if (v5 == 1)
  {
    -[UIViewFloatAnimatableProperty value](self->_pagingFractionAnimatableProperty, "value");
    self->_pagingFractionPanStart = v6;
    animationCount = self->_animationCount;
    if (!animationCount)
    {
      -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 1);
      animationCount = self->_animationCount;
    }
    self->_animationCount = animationCount + 1;
  }
}

- (void)_handleTapNavigation:(id)a3
{
  double v5;
  double v6;
  double MidX;
  double v8;
  double v9;
  void *v11;
  CGRect v12;

  if (self->_tapGestureRecognizer != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentCarouselView.m"), 650, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tapGestureRecognizer == _tapGestureRecognizer"));

  }
  if (objc_msgSend(a3, "state") == 3)
  {
    objc_msgSend(a3, "locationInView:", self);
    v6 = v5;
    -[UIView bounds](self, "bounds");
    MidX = CGRectGetMidX(v12);
    -[UIViewFloatAnimatableProperty value](self->_pagingFractionAnimatableProperty, "value");
    v9 = 1.0;
    if (v6 < MidX)
      v9 = -1.0;
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 0, v9 + v8);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _BOOL4 v5;
  NSMutableDictionary *containerViews;
  void *v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;
  CGRect v16;

  v5 = -[NSArray count](self->_items, "count") >= 2
    && -[_UIDocumentCarouselView isPagingEnabled](self, "isPagingEnabled");
  if (self->_panGestureRecognizer != a3)
  {
    if (self->_tapGestureRecognizer == a3)
    {
      containerViews = self->_containerViews;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_centerItemIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](containerViews, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v9 = v5;
      else
        v9 = 0;
      if (v9)
      {
        objc_msgSend(a3, "locationInView:", self);
        v11 = v10;
        -[UIView bounds](self, "bounds");
        v12 = CGRectGetMidX(v15) - v11;
        if (v12 >= 0.0)
          v13 = v12;
        else
          v13 = -v12;
        objc_msgSend(v8, "frame");
        LOBYTE(v5) = v13 > CGRectGetWidth(v16) * 0.5;
      }
      else
      {
        LOBYTE(v5) = 0;
      }

    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setItems:(id)a3
{
  NSArray *v5;
  NSArray *items;

  if ((-[NSArray isEqual:](self->_items, "isEqual:") & 1) == 0)
  {
    v5 = (NSArray *)objc_msgSend(a3, "copy");
    items = self->_items;
    self->_items = v5;

    if (objc_msgSend(a3, "count"))
      -[_UIDocumentCarouselView scrollToItemAtIndex:animated:](self, "scrollToItemAtIndex:animated:", 0, 0);
    else
      -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentCarouselView;
  -[UIView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  -[UIView frame](self, "frame");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    if (self)
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_containerViews, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_13_5);
    -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentCarouselView;
  -[UIView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  -[UIView bounds](self, "bounds");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    if (self)
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_containerViews, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_13_5);
    -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentCarouselView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  if (self)
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_containerViews, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_13_5);
  -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentCarouselView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
    -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentCarouselView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_revealAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_pagingFractionAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_containerViews, 0);
}

@end
