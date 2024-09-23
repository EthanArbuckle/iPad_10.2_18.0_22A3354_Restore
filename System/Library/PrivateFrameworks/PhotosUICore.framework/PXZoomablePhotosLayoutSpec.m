@implementation PXZoomablePhotosLayoutSpec

- (int64_t)maxColumnsForIndividualItems
{
  return self->_maxColumnsForIndividualItems;
}

- (NSArray)supportedColumns
{
  return self->_supportedColumns;
}

- (NSArray)minimumAssetsRequiredByColumn
{
  return self->_minimumAssetsRequiredByColumn;
}

- (PXZoomablePhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 availableThumbnailSizes:(id)a5 gridStyle:(int64_t)a6 itemAspectRatio:(double)a7 userDefaults:(id)a8 forceSaliency:(BOOL)a9 preferredUserInterfaceStyle:(int64_t)a10 additionalAspectFitEdgeMargins:(UIEdgeInsets)a11 overrideDefaultNumberOfColumns:(int64_t)a12
{
  _BOOL4 v12;
  id v20;
  id v21;
  id v22;
  PXZoomablePhotosLayoutSpec *v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  unint64_t v29;
  double v30;
  id v31;
  id v32;
  id v33;
  void (**v34)(void);
  double v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  double v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  double v48;
  double v49;
  double v50;
  double interitemSpacing;
  char v52;
  uint64_t v53;
  uint64_t (**v54)(_QWORD, double);
  uint64_t (**v55)(_QWORD, double);
  __n128 v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  void *v62;
  char v63;
  double v64;
  void *v65;
  void *v66;
  uint64_t v67;
  UIColor *v68;
  double v69;
  double v70;
  uint64_t v71;
  UIColor *explicitBackgroundColor;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSObject *v80;
  id v81;
  uint64_t v82;
  UIColor *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  uint64_t v88;
  id v89;
  id v90;
  void (**v91)(void *, double, double);
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  __n128 v102;
  __n128 v103;
  uint64_t v104;
  NSArray *supportedColumns;
  id v106;
  uint64_t i;
  void *v108;
  uint64_t v109;
  NSArray *legacyMacSupportedColumns;
  NSObject *v111;
  id v112;
  NSArray *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  void *v118;
  uint64_t v119;
  double v120;
  double v121;
  void *v122;
  uint64_t v123;
  NSArray *minimumAssetsRequiredByColumn;
  uint64_t v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  __int128 v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  _QWORD *p_top;
  uint64_t v136;
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  _OWORD *v140;
  __int128 v141;
  __int128 v142;
  uint64_t v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  _QWORD *v147;
  uint64_t v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  __int128 v152;
  CGFloat v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  int v157;
  PXZoomableInlineHeadersLayoutSpec *v158;
  PXZoomableInlineHeadersLayoutSpec *inlineHeadersSpec;
  CGFloat v160;
  CGFloat v161;
  CGFloat v162;
  CGFloat v163;
  PXZoomablePhotosLayoutSpec *v164;
  void *v166;
  SEL v167;
  _BOOL4 v168;
  void *v169;
  id v170;
  void (**v171)(void *, double, double);
  void *v172;
  int v173;
  double v174;
  void (**v175)(void);
  unint64_t v176;
  uint64_t v177;
  int v178;
  PXZoomablePhotosLayoutSpec *v179;
  id v180;
  id v181;
  void *v182;
  uint64_t v183;
  void *v184;
  unint64_t v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD v190[4];
  id v191;
  id v192;
  unint64_t v193;
  double v194;
  double v195;
  double v196;
  _QWORD v197[4];
  id v198;
  _QWORD v199[4];
  id v200;
  uint64_t v201;
  _QWORD aBlock[4];
  id v203;
  id v204;
  unint64_t v205;
  BOOL v206;
  objc_super v207;
  uint8_t v208[128];
  uint8_t buf[4];
  double v210;
  __int16 v211;
  double v212;
  __int16 v213;
  uint64_t v214;
  uint64_t v215;

  v12 = a9;
  v215 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a5;
  v22 = a8;
  v207.receiver = self;
  v207.super_class = (Class)PXZoomablePhotosLayoutSpec;
  v23 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v207, sel_initWithExtendedTraitCollection_options_, v20, a4);

  if (!v23)
    goto LABEL_160;
  v167 = a2;
  v176 = a4;
  v180 = v22;
  v181 = v21;
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = objc_msgSend(v20, "userInterfaceIdiom");
  v177 = objc_msgSend(v20, "userInterfaceIdiom");
  v25 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v185 = a6;
  v26 = a6 == 3 && v25;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = objc_msgSend(v27, "enableCubeMode");

  if (objc_msgSend(v20, "userInterfaceStyle") == 2)
  {
    v173 = 1;
  }
  else
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = objc_msgSend(v28, "forceDarkDetailsView");

  }
  v29 = v185;
  if (v185 <= 6)
  {
    if (((1 << v185) & 0x4D) != 0)
    {
      v30 = 2.5;
      if ((v178 & 1) == 0)
        goto LABEL_16;
    }
    else
    {
      if (((1 << v185) & 0x30) == 0)
      {
        objc_msgSend(v24, "cardsInteritemSpacing");
        goto LABEL_18;
      }
      v30 = 4.0;
      if (v177 != 5)
      {
        if (!v173)
        {
LABEL_16:
          objc_msgSend(v24, "interitemSpacing", v30);
          goto LABEL_18;
        }
        objc_msgSend(v24, "darkModeInteritemSpacing", 4.0);
      }
    }
LABEL_18:
    v23->_interitemSpacing = v30;
    v29 = v185;
  }
  v168 = v12;
  v23->_preferredUserInterfaceStyle = a10;
  v31 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke;
  aBlock[3] = &unk_1E51290C8;
  v32 = v31;
  v203 = v32;
  v33 = v24;
  v204 = v33;
  v205 = v29;
  v206 = a7 != 1.0;
  v34 = (void (**)(void))_Block_copy(aBlock);
  v34[2]();
  objc_msgSend(v20, "layoutReferenceSize");
  v36 = v35;
  v38 = v37;
  v182 = v20;
  v184 = v32;
  if (objc_msgSend(v20, "layoutSizeClass") == 1)
  {
    v39 = 1;
  }
  else
  {
    objc_msgSend(v20, "rootExtendedTraitCollection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v20, "rootExtendedTraitCollection");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layoutReferenceSize");
      v39 = v42 <= 528.0;

    }
    else
    {
      v39 = 0;
    }
    v32 = v184;
  }
  v43 = a12;
  if (v183 == 4)
  {
    v44 = 5;
    objc_msgSend(v32, "addIndex:", 5);
    objc_msgSend(v32, "addIndex:", 7);
    if (v36 >= 400.0)
    {
      v44 = 9;
      objc_msgSend(v32, "addIndex:", 9);
      v45 = 5;
    }
    else
    {
      v45 = 3;
    }
    if (a12)
      v47 = a12;
    else
      v47 = v45;
    v46 = 0x7FFFFFFFFFFFFFFFLL;
    v48 = 17.0;
    v49 = 18.0;
    v50 = 5.45;
    interitemSpacing = 17.0;
LABEL_37:
    v43 = v47;
    goto LABEL_74;
  }
  if (v177 == 5)
  {
    objc_msgSend(v32, "addIndex:", 1);
    objc_msgSend(v32, "addIndex:", 3);
    objc_msgSend(v32, "addIndex:", 5);
    objc_msgSend(v32, "addIndex:", 7);
    if ((PLIsPhotoPicker() & 1) != 0 || PLIsPhotosMessagesApp())
    {
      objc_msgSend(v32, "removeIndex:", 7);
      v46 = 5;
    }
    else
    {
      v46 = 7;
    }
    v44 = objc_msgSend(v32, "lastIndex");
    interitemSpacing = 10.0;
    v49 = 0.0;
    v47 = 5;
    v50 = 5.45;
    v48 = 0.0;
    v43 = 5;
    goto LABEL_74;
  }
  if (!v39)
  {
    objc_msgSend(v182, "layoutReferenceSize");
    v199[0] = MEMORY[0x1E0C809B0];
    v199[1] = 3221225472;
    v199[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_17;
    v199[3] = &unk_1E51290F0;
    v200 = &unk_1E53E97C8;
    v201 = v53;
    v54 = (uint64_t (**)(_QWORD, double))_Block_copy(v199);
    v55 = v54;
    v56.n128_u64[0] = 0x4066000000000000;
    if (v26)
      v56.n128_f64[0] = 90.0;
    v57 = ((uint64_t (*)(__n128))v54[2])(v56);
    objc_msgSend(v32, "addIndex:", v57);
    if (v26)
    {
      objc_msgSend(v32, "addIndex:", v55[2](v55, 130.0));
      objc_msgSend(v32, "addIndex:", v55[2](v55, 165.0));
      v58 = v185;
    }
    else
    {
      v58 = v185;
      if (v185 == 1)
        goto LABEL_54;
    }
    if (objc_msgSend(v182, "userInterfaceIdiom") != 3)
    {
      v59 = 7;
      if (v58 != 4)
        v59 = v57;
      goto LABEL_60;
    }
LABEL_54:
    v59 = 5;
LABEL_60:
    if (a12)
      v47 = a12;
    else
      v47 = v59;
    if ((unint64_t)objc_msgSend(v184, "lastIndex") <= 5)
      interitemSpacing = 10.0;
    else
      interitemSpacing = 17.0;
    v44 = objc_msgSend(v184, "lastIndex");
    objc_msgSend(v33, "panoramaRegularInteritemSpacing");
    v48 = v60;

    v46 = 0x7FFFFFFFFFFFFFFFLL;
    v49 = 0.0;
    v50 = 5.45;
    goto LABEL_37;
  }
  objc_msgSend(v32, "addIndex:", 5);
  v52 = v36 <= v38 || v26;
  if ((v52 & 1) == 0)
    v26 = v36 / 5.0 >= 100.0;
  if (a12)
  {
    v44 = 5;
  }
  else if (v185 == 4 && v36 > v38)
  {
    v44 = 7;
    objc_msgSend(v32, "addIndex:", 7);
    v43 = 7;
  }
  else
  {
    v44 = 5;
    if (v26)
      v43 = 5;
    else
      v43 = 3;
  }
  v47 = +[PXLayoutMetricInterpolator photosGridLayoutColumnsForWidth:](PXLayoutMetricInterpolator, "photosGridLayoutColumnsForWidth:", v36);
  if (v36 > v38)
    v46 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v46 = v44;
  interitemSpacing = v23->_interitemSpacing;
  objc_msgSend(v33, "panoramaCompactInteritemSpacing");
  v48 = v61;
  v50 = 5.25;
  v49 = 0.0;
LABEL_74:
  v175 = v34;
  v174 = v49;
  if (v185 > 6)
  {
LABEL_79:
    v65 = v180;
    v66 = v181;
    goto LABEL_89;
  }
  if (((1 << v185) & 0x4D) != 0)
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "enableCubeMode");

    v64 = 2.5;
    if ((v63 & 1) == 0)
      objc_msgSend(v33, "cornerRadius", 2.5);
    v23->_itemCornerRadius = v64;
    v23->_aspectFitItemCornerRadius = v64;
    goto LABEL_79;
  }
  v66 = v181;
  if (((1 << v185) & 0x30) != 0)
  {
    if (v177 != 5)
    {
      if (v173)
        objc_msgSend(v33, "darkModeCornerRadius");
      else
        objc_msgSend(v33, "cornerRadius");
      v65 = v180;
      v23->_itemCornerRadius = v70;
      v23->_aspectFitItemCornerRadius = 6.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v71 = objc_claimAutoreleasedReturnValue();
      explicitBackgroundColor = v23->_explicitBackgroundColor;
      v23->_explicitBackgroundColor = (UIColor *)v71;

      interitemSpacing = 6.0;
      goto LABEL_89;
    }
    v23->_itemCornerRadius = 9.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v23->_explicitBackgroundColor;
    v23->_explicitBackgroundColor = (UIColor *)v67;

  }
  else
  {
    objc_msgSend(v33, "cardsCornerRadius");
    v23->_itemCornerRadius = v69;
    v23->_aspectFitItemCornerRadius = v69;
  }
  v65 = v180;
LABEL_89:
  v23->_maxColumnsForStickyHeaderDisplay = v44;
  v23->_defaultNumberOfColumns = v43;
  v23->_staticNumberOfColumns = v47;
  v23->_aspectFitInteritemSpacing = interitemSpacing;
  v23->_maxColumnsForIndividualItems = v44;
  v23->_maxColumnsForBadges = v44;
  v23->_minColumnsForMiniBadges = v46;
  v23->_initialNumberOfColumns = v43;
  objc_msgSend(v65, "preferredIndividualItemsColumnsNumber");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "integerValue");

  if (v74)
    v23->_initialNumberOfColumns = v74;
  v23->_panoramaItemAspectRatio = v50;
  v23->_panoramaInteritemSpacing = v48;
  if (v185 == 1)
  {
    objc_msgSend(v33, "cardsAspectRatio");
    a7 = v75;
    if (v36 > v38)
      a7 = 1.0 / v75;
  }
  else if (a7 == 0.0)
  {
    objc_msgSend(v182, "fullScreenReferenceRect");
    v78 = v76;
    v79 = v77;
    if (v76 == 0.0 || v77 == 0.0 || v76 == *MEMORY[0x1E0D71130] && v77 == *(double *)(MEMORY[0x1E0D71130] + 8))
    {
      v80 = MEMORY[0x1E0C81028];
      v81 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        v210 = v78;
        v211 = 2048;
        v212 = v79;
        v213 = 2048;
        v214 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }

      a7 = 1.0;
    }
    else
    {
      a7 = fabs(v76 / v77);
    }
  }
  v23->_itemAspectRatio = a7;
  if (v178)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = v23->_explicitBackgroundColor;
    v23->_explicitBackgroundColor = (UIColor *)v82;

  }
  if (objc_msgSend(v182, "userInterfaceIdiom") == 4)
  {
    v84 = ceil(v36 / 200.0) * 200.0;
  }
  else
  {
    objc_msgSend(v182, "rootExtendedTraitCollection");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "layoutReferenceSize");
    v84 = v86;

  }
  v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v184, "count"));
  v88 = MEMORY[0x1E0C809B0];
  v197[0] = MEMORY[0x1E0C809B0];
  v197[1] = 3221225472;
  v197[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_2;
  v197[3] = &unk_1E5148928;
  v89 = v87;
  v198 = v89;
  objc_msgSend(v184, "enumerateIndexesUsingBlock:", v197);
  v190[0] = v88;
  v190[1] = 3221225472;
  v190[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_3;
  v190[3] = &unk_1E5129118;
  v193 = v185;
  v194 = v36;
  v195 = v38;
  v196 = v84;
  v170 = v182;
  v191 = v170;
  v90 = v89;
  v192 = v90;
  v91 = (void (**)(void *, double, double))_Block_copy(v190);
  if (objc_msgSend(v66, "count"))
  {
    objc_msgSend(v66, "firstObject");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "CGSizeValue");
    v94 = v93;
    v96 = v95;

  }
  else
  {
    v94 = *(double *)off_1E50B8810;
    v96 = *((double *)off_1E50B8810 + 1);
  }
  if ((unint64_t)objc_msgSend(v66, "count") < 2)
  {
    v97 = *(double *)off_1E50B8810;
    v98 = *((double *)off_1E50B8810 + 1);
  }
  else
  {
    if (v183 == 4)
      objc_msgSend(v66, "lastObject");
    else
      objc_msgSend(v66, "objectAtIndexedSubscript:", 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "CGSizeValue");
    v97 = v100;
    v98 = v101;

  }
  v91[2](v91, v97, v98);
  v91[2](v91, v94, v96);
  if (objc_msgSend(v33, "enableDecadesDensity"))
  {
    if ((PXSizeIsEmpty() & 1) != 0)
    {
      v102.n128_u64[0] = *(_QWORD *)off_1E50B8810;
      v103.n128_u64[0] = *((_QWORD *)off_1E50B8810 + 1);
    }
    else
    {
      objc_msgSend(v33, "decadesDensityScale");
      PXSizeScale();
    }
    ((void (*)(void (**)(void *, double, double), __n128, __n128))v91[2])(v91, v102, v103);
  }
  v171 = v91;
  v104 = objc_msgSend(v90, "copy");
  supportedColumns = v23->_supportedColumns;
  v23->_supportedColumns = (NSArray *)v104;

  v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 3; i != 10; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObject:", v108);

  }
  v109 = objc_msgSend(v106, "copy");
  legacyMacSupportedColumns = v23->_legacyMacSupportedColumns;
  v23->_legacyMacSupportedColumns = (NSArray *)v109;

  if (-[NSArray count](v23->_supportedColumns, "count") >= 0xB)
  {
    PXAssertGetLog();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v111, OS_LOG_TYPE_ERROR, "Too many supported columns.", buf, 2u);
    }

  }
  v169 = v106;
  v172 = v90;
  v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v179 = v23;
  v113 = v23->_supportedColumns;
  v114 = -[NSArray countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", &v186, v208, 16);
  if (v114)
  {
    v115 = v114;
    v116 = *(_QWORD *)v187;
    do
    {
      for (j = 0; j != v115; ++j)
      {
        if (*(_QWORD *)v187 != v116)
          objc_enumerationMutation(v113);
        v118 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * j);
        if (PXSizeIsEmpty())
        {
          objc_msgSend(v112, "addObject:", &unk_1E53ED6C8);
        }
        else
        {
          v119 = objc_msgSend(v118, "integerValue");
          if (v119 <= v44)
            objc_msgSend(v33, "individualLevelMinimumScreensOfContent");
          else
            objc_msgSend(v33, "denseLevelMinimumScreensOfContent");
          v121 = floor(v84 / (double)v119);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", vcvtpd_s64_f64(v120 * (double)(uint64_t)(vcvtpd_s64_f64(v84 / v121) * vcvtpd_s64_f64(v38 / v121))));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "addObject:", v122);

        }
      }
      v115 = -[NSArray countByEnumeratingWithState:objects:count:](v113, "countByEnumeratingWithState:objects:count:", &v186, v208, 16);
    }
    while (v115);
  }

  v123 = objc_msgSend(v112, "copy");
  v23 = v179;
  minimumAssetsRequiredByColumn = v179->_minimumAssetsRequiredByColumn;
  v179->_minimumAssetsRequiredByColumn = (NSArray *)v123;

  v125 = -[NSArray count](v179->_supportedColumns, "count");
  if (v125 != -[NSArray count](v179->_minimumAssetsRequiredByColumn, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "handleFailureInMethod:object:file:lineNumber:description:", v167, v179, CFSTR("PXZoomablePhotosLayoutSpec.m"), 400, CFSTR("Count mismatch: %lu != %lu"), -[NSArray count](v179->_supportedColumns, "count"), -[NSArray count](v179->_minimumAssetsRequiredByColumn, "count"));

  }
  v20 = v182;
  v21 = v181;
  if (v183 == 4)
  {
    objc_msgSend(v170, "layoutMargins");
    PXEdgeInsetsForEdges();
    v179->_aspectFitEdgeMargins.top = v126;
    v179->_aspectFitEdgeMargins.left = v127;
    v179->_aspectFitEdgeMargins.bottom = v128;
    v179->_aspectFitEdgeMargins.right = v129;
    v130 = *(_OWORD *)&v179->_aspectFitEdgeMargins.bottom;
    *(_OWORD *)&v179->_squareEdgeMargins.top = *(_OWORD *)&v179->_aspectFitEdgeMargins.top;
    *(_OWORD *)&v179->_squareEdgeMargins.bottom = v130;
  }
  else if (v177 == 5)
  {
    objc_msgSend(v170, "layoutMargins");
    PXEdgeInsetsForEdges();
    v179->_aspectFitEdgeMargins.top = v131;
    v179->_aspectFitEdgeMargins.left = v132;
    v179->_aspectFitEdgeMargins.bottom = v133;
    v179->_aspectFitEdgeMargins.right = v134;
    p_top = (_QWORD *)&v179->_squareEdgeMargins.top;
    if (v185 == 1)
    {
      PXEdgeInsetsWithValueForEdges();
      *p_top = v136;
      v179->_squareEdgeMargins.left = v137;
      v179->_squareEdgeMargins.bottom = v138;
      v179->_squareEdgeMargins.right = v139;
    }
    else
    {
      v142 = *((_OWORD *)off_1E50B8020 + 1);
      *(_OWORD *)p_top = *(_OWORD *)off_1E50B8020;
      *(_OWORD *)&v179->_squareEdgeMargins.bottom = v142;
    }
  }
  else
  {
    v140 = (_OWORD *)&v179->_aspectFitEdgeMargins.top;
    if (objc_msgSend(v170, "layoutSizeClass") == 1)
    {
      v141 = *((_OWORD *)off_1E50B8020 + 1);
      *v140 = *(_OWORD *)off_1E50B8020;
      *(_OWORD *)&v179->_aspectFitEdgeMargins.bottom = v141;
    }
    else
    {
      objc_msgSend(v170, "layoutMargins");
      PXEdgeInsetsForEdges();
      *(_QWORD *)v140 = v143;
      v179->_aspectFitEdgeMargins.left = v144;
      v179->_aspectFitEdgeMargins.bottom = v145;
      v179->_aspectFitEdgeMargins.right = v146;
    }
    v147 = (_QWORD *)&v179->_squareEdgeMargins.top;
    if (v185 == 1)
    {
      objc_msgSend(v170, "safeAreaInsets");
      PXEdgeInsetsForEdges();
      *v147 = v148;
      v179->_squareEdgeMargins.left = v149;
      v179->_squareEdgeMargins.bottom = v150;
      v179->_squareEdgeMargins.right = v151;
    }
    else
    {
      v152 = *((_OWORD *)off_1E50B8020 + 1);
      *(_OWORD *)v147 = *(_OWORD *)off_1E50B8020;
      *(_OWORD *)&v179->_squareEdgeMargins.bottom = v152;
    }
    v23 = v179;
  }
  PXEdgeInsetsAdd();
  v23->_aspectFitEdgeMargins.top = v153;
  v23->_aspectFitEdgeMargins.left = v154;
  v23->_aspectFitEdgeMargins.bottom = v155;
  v23->_aspectFitEdgeMargins.right = v156;
  v22 = v180;
  if (v185 == 1)
    LOBYTE(v157) = 1;
  else
    v157 = objc_msgSend(v33, "forceSaliency") | v168;
  v23->_useSaliency = v157;
  v23->_maxColumnsForSaliency = objc_msgSend(v33, "maxColumnsForSaliency");
  v23->_captionSpacing = v174;
  v158 = -[PXZoomableInlineHeadersLayoutSpec initWithExtendedTraitCollection:options:]([PXZoomableInlineHeadersLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v170, v176);
  inlineHeadersSpec = v23->_inlineHeadersSpec;
  v23->_inlineHeadersSpec = v158;

  v23->_miniModeInteritemSpacing = 8.0;
  v23->_miniModeItemCornerRadius = 10.0;
  PXEdgeInsetsMake();
  v23->_miniModeEdgeMargins.top = v160;
  v23->_miniModeEdgeMargins.left = v161;
  v23->_miniModeEdgeMargins.bottom = v162;
  v23->_miniModeEdgeMargins.right = v163;

LABEL_160:
  v164 = v23;

  return v164;
}

void __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeAllIndexes");
  if (objc_msgSend(*(id *)(a1 + 40), "enableOneColumn")
    && *(_QWORD *)(a1 + 48) != 1
    && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineHeadersSpec, 0);
  objc_storeStrong((id *)&self->_legacyMacSupportedColumns, 0);
  objc_storeStrong((id *)&self->_minimumAssetsRequiredByColumn, 0);
  objc_storeStrong((id *)&self->_supportedColumns, 0);
  objc_storeStrong((id *)&self->_explicitBackgroundColor, 0);
}

- (PXZoomablePhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosLayoutSpec.m"), 39, CFSTR("%s is not available as initializer"), "-[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:]");

  abort();
}

- (id)defaultBackgroundColor
{
  UIColor *explicitBackgroundColor;
  objc_super v4;

  explicitBackgroundColor = self->_explicitBackgroundColor;
  if (explicitBackgroundColor)
    return explicitBackgroundColor;
  v4.receiver = self;
  v4.super_class = (Class)PXZoomablePhotosLayoutSpec;
  -[PXFeatureSpec defaultBackgroundColor](&v4, sel_defaultBackgroundColor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)bestColumnIndexForPreferredNumberOfColumns:(int64_t)a3 allowedColumns:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v7 = -[PXZoomablePhotosLayoutSpec maxColumnsForIndividualItems](self, "maxColumnsForIndividualItems");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "indexOfObject:", v8);

  v16 = v9;
  v10 = v14[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14[3] = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__PXZoomablePhotosLayoutSpec_bestColumnIndexForPreferredNumberOfColumns_allowedColumns___block_invoke;
    v12[3] = &unk_1E5129140;
    v12[4] = &v13;
    v12[5] = v7;
    v12[6] = a3;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
    v10 = v14[3];
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (int64_t)defaultNumberOfColumns
{
  return self->_defaultNumberOfColumns;
}

- (int64_t)initialNumberOfColumns
{
  return self->_initialNumberOfColumns;
}

- (int64_t)staticNumberOfColumns
{
  return self->_staticNumberOfColumns;
}

- (int64_t)maxColumnsForBadges
{
  return self->_maxColumnsForBadges;
}

- (int64_t)minColumnsForMiniBadges
{
  return self->_minColumnsForMiniBadges;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (int64_t)maxColumnsForStickyHeaderDisplay
{
  return self->_maxColumnsForStickyHeaderDisplay;
}

- (UIEdgeInsets)aspectFitEdgeMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_aspectFitEdgeMargins.top;
  left = self->_aspectFitEdgeMargins.left;
  bottom = self->_aspectFitEdgeMargins.bottom;
  right = self->_aspectFitEdgeMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)squareEdgeMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_squareEdgeMargins.top;
  left = self->_squareEdgeMargins.left;
  bottom = self->_squareEdgeMargins.bottom;
  right = self->_squareEdgeMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)aspectFitInteritemSpacing
{
  return self->_aspectFitInteritemSpacing;
}

- (double)panoramaItemAspectRatio
{
  return self->_panoramaItemAspectRatio;
}

- (double)panoramaInteritemSpacing
{
  return self->_panoramaInteritemSpacing;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (double)aspectFitItemCornerRadius
{
  return self->_aspectFitItemCornerRadius;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (int64_t)maxColumnsForSaliency
{
  return self->_maxColumnsForSaliency;
}

- (NSArray)legacyMacSupportedColumns
{
  return self->_legacyMacSupportedColumns;
}

- (double)captionSpacing
{
  return self->_captionSpacing;
}

- (PXZoomableInlineHeadersLayoutSpec)inlineHeadersSpec
{
  return self->_inlineHeadersSpec;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (double)miniModeInteritemSpacing
{
  return self->_miniModeInteritemSpacing;
}

- (double)miniModeItemCornerRadius
{
  return self->_miniModeItemCornerRadius;
}

- (UIEdgeInsets)miniModeEdgeMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_miniModeEdgeMargins.top;
  left = self->_miniModeEdgeMargins.left;
  bottom = self->_miniModeEdgeMargins.bottom;
  right = self->_miniModeEdgeMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

void __88__PXZoomablePhotosLayoutSpec_bestColumnIndexForPreferredNumberOfColumns_allowedColumns___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "integerValue") > a1[5]
    || (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3, objc_msgSend(v7, "integerValue") >= a1[6]))
  {
    *a4 = 1;
  }

}

uint64_t __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_17(uint64_t a1, double a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "integerValue", (_QWORD)v12);
      if (*(double *)(a1 + 40) / (double)v9 >= a2)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "integerValue");
  }
  v10 = v9;

  return v10;
}

void __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_3(uint64_t a1, double a2)
{
  double v4;
  double v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (*(_QWORD *)(a1 + 48) != 1 && (PXSizeIsNull() & 1) == 0 && (PXSizeIsNull() & 1) == 0)
  {
    v4 = *(double *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "displayScale");
    v6 = vcvtpd_s64_f64(v4 * v5 / a2) | 1;
    objc_msgSend(*(id *)(a1 + 40), "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (v6 > v8)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }
}

@end
