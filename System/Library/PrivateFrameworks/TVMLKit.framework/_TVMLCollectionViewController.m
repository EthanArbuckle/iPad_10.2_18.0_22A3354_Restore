@implementation _TVMLCollectionViewController

+ (id)headerElementFromCollectionElement:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "children", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "tv_elementType") == 15)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)footerElementFromCollectionElement:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "children", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "tv_elementType") == 13)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (_TVMLCollectionViewController)init
{
  _TVMLCollectionViewController *v2;
  _TVMLCollectionViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVMLCollectionViewController;
  v2 = -[_TVMLCollectionViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_indexDisplayEnabled = 1;
    -[_TVMLCollectionViewController setRestoresFocusAfterTransition:](v2, "setRestoresFocusAfterTransition:", 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", 0);

  v6.receiver = self;
  v6.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _TVNeedsMoreContentEvaluator *v7;
  void *v8;
  _TVNeedsMoreContentEvaluator *v9;
  _TVNeedsMoreContentEvaluator *needsMoreContentEvaluator;
  _TVNeedsMoreContentEvaluator *v11;
  void *v12;
  _BYTE v13[24];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController showcaseConfig](self, "showcaseConfig");
  objc_msgSend(v3, "setShowcaseConfig:", v13);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x24BDF75D8], 0);

  if (-[_TVMLCollectionViewController contentFlowsVertically](self, "contentFlowsVertically"))
    v6 = 2;
  else
    v6 = 1;
  v7 = [_TVNeedsMoreContentEvaluator alloc];
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_TVNeedsMoreContentEvaluator initWithScrollView:axis:](v7, "initWithScrollView:axis:", v8, v6);
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  self->_needsMoreContentEvaluator = v9;

  v11 = self->_needsMoreContentEvaluator;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVNeedsMoreContentEvaluator setViewElement:](v11, "setViewElement:", v12);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  if (self->_didUpdateFocus)
  {
    self->_didUpdateFocus = 0;
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController adjustContentOffsetToDisplayIndexPath:](self, "adjustContentOffsetToDisplayIndexPath:", v3);

  }
  -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", 0);
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x24BDE57D8];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54___TVMLCollectionViewController_viewDidLayoutSubviews__block_invoke;
  v5[3] = &unk_24EB854F8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setCompletionBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TVPreviewInteractionController *previewInteractionController;
  void *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  IKViewElement *v28;
  IKViewElement *headerElement;
  IKViewElement *v30;
  IKViewElement *footerElement;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  _TVMLCollectionViewController *v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t k;
  void *v92;
  void (**v93)(_QWORD);
  void *v94;
  void *v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  uint64_t m;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t n;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  BOOL v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  id v131;
  void (**v132)(void);
  id *location;
  _TVShadowViewElement *v134;
  id v135;
  id obj;
  void *v137;
  IKCollectionElement **p_collectionElement;
  void *v139;
  void *v140;
  _TVMLCollectionViewController *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  id v155;
  void (**v156)(void);
  uint64_t *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[6];
  _QWORD v163[4];
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  _QWORD v169[4];
  id v170;
  id v171;
  id v172;
  _TVMLCollectionViewController *v173;
  id v174;
  id v175;
  id v176;
  uint64_t *v177;
  uint64_t *v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _QWORD v183[4];
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  void (*v193)(uint64_t);
  id v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  char v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  char v202;
  _QWORD v203[5];
  _QWORD v204[4];
  id v205;
  _QWORD v206[5];
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  void (*v211)(uint64_t);
  id v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  location = (id *)&self->_shadowViewElement;
  v134 = self->_shadowViewElement;
  v141 = self;
  v137 = v7;
  objc_msgSend((id)objc_opt_class(), "_shadowViewElementForCollectionElement:", v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  p_collectionElement = &self->_collectionElement;
  objc_storeStrong((id *)&self->_collectionElement, a3);
  -[IKCollectionElement attributes](self->_collectionElement, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("remembersFocus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKCollectionElement attributes](*p_collectionElement, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("remembersFocus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemembersLastFocusedIndexPath:", objc_msgSend(v12, "BOOLValue"));

  }
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController)
    -[TVPreviewInteractionController updatePresentingElement:](previewInteractionController, "updatePresentingElement:", *p_collectionElement);
  objc_msgSend(v137, "appDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "impressionThreshold");
  self->_impressionThreshold = v15;

  self->_cellMetrics.cellSize = a4->cellSize;
  v16 = *(_OWORD *)&a4->cellInset.bottom;
  v18 = *(_OWORD *)&a4->cellPadding.top;
  v17 = *(_OWORD *)&a4->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a4->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v16;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v18;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v17;
  v19 = *(_OWORD *)&a4->cellMargin.bottom;
  v21 = *(_OWORD *)&a4->cellInsetAlt.top;
  v20 = *(_OWORD *)&a4->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a4->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v19;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v21;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v20;
  v207 = 0;
  v208 = &v207;
  v209 = 0x3032000000;
  v210 = __Block_byref_object_copy__6;
  v211 = __Block_byref_object_dispose__6;
  v212 = 0;
  objc_msgSend(v137, "sections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v206[0] = MEMORY[0x24BDAC760];
  v206[1] = 3221225472;
  v206[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke;
  v206[3] = &unk_24EB87C38;
  v206[4] = &v207;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v206);

  if (!v208[5])
  {
    objc_msgSend(v137, "attributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("firstItem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[TVMLUtilities indexPathForFirstItemAttributeValue:](TVMLUtilities, "indexPathForFirstItemAttributeValue:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v208[5];
    v208[5] = v26;

  }
  objc_msgSend((id)objc_opt_class(), "headerElementFromCollectionElement:", v137);
  v28 = (IKViewElement *)objc_claimAutoreleasedReturnValue();
  headerElement = self->_headerElement;
  self->_headerElement = v28;

  objc_msgSend((id)objc_opt_class(), "footerElementFromCollectionElement:", v137);
  v30 = (IKViewElement *)objc_claimAutoreleasedReturnValue();
  footerElement = self->_footerElement;
  self->_footerElement = v30;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "sections");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = v23;
  v204[1] = 3221225472;
  v204[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2;
  v204[3] = &unk_24EB87CB0;
  v135 = v32;
  v205 = v135;
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v204);

  v34 = objc_msgSend(v135, "count");
  if (v34)
    v35 = (void *)objc_msgSend(v135, "copy");
  else
    v35 = 0;
  -[_TVMLCollectionViewController setIndexPathsByIndexTitle:](self, "setIndexPathsByIndexTitle:", v35);
  if (v34)

  -[_TVMLCollectionViewController indexPathsByIndexTitle](self, "indexPathsByIndexTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allKeys");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = v23;
  v203[1] = 3221225472;
  v203[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4;
  v203[3] = &unk_24EB87CD8;
  v203[4] = self;
  objc_msgSend(v37, "sortedArrayUsingComparator:", v203);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController setSortedIndexTitles:](self, "setSortedIndexTitles:", v38);

  if (!-[_TVMLCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_storeStrong(location, obj);
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didUpdateFocus = objc_msgSend(v53, "isEqual:", v208[5]) ^ 1;

    -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v208[5]);
    goto LABEL_109;
  }
  self->_isPreparingCollectionUpdates = 1;
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController _registerCellClassesInCollectionView:](self, "_registerCellClassesInCollectionView:", v39);

  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "setSemanticContentAttribute:", objc_msgSend(v137, "tv_semanticContentAttribute"));
  v199 = 0;
  v200 = &v199;
  v201 = 0x2020000000;
  v202 = 0;
  v195 = 0;
  v196 = &v195;
  v197 = 0x2020000000;
  v198 = 0;
  v189 = 0;
  v190 = &v189;
  v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__24;
  v193 = __Block_byref_object_dispose__25;
  v194 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVShadowViewElement elementID](v134, "elementID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "elementID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v42, "isEqual:", v43) & 1) != 0)
  {
    -[_TVMLCollectionViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "window");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45 == 0;

    if (!v46)
    {
      -[_TVShadowViewElement children](v134, "children");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "children");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v47, "count"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v183[0] = v23;
      v183[1] = 3221225472;
      v183[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_28;
      v183[3] = &unk_24EB87D00;
      v126 = v47;
      v184 = v126;
      v52 = v48;
      v185 = v52;
      v127 = v49;
      v186 = v127;
      v131 = v51;
      v187 = v131;
      v128 = v50;
      v188 = v128;
      objc_msgSend(v129, "enumerateObjectsUsingBlock:", v183);
      -[_TVMLCollectionViewController lastFocusedIndexPath](v141, "lastFocusedIndexPath");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      if (v208[5])
      {
        if ((objc_msgSend(v130, "isEqual:") & 1) == 0)
        {
          v141->_didUpdateFocus = 1;
          -[_TVMLCollectionViewController setLastFocusedIndexPath:](v141, "setLastFocusedIndexPath:", v208[5]);
        }
      }
      else if (v130)
      {
        v54 = objc_msgSend(v130, "section");
        if ((objc_msgSend(v52, "containsIndex:", v54) & 1) != 0)
        {
          v54 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "objectForKeyedSubscript:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v54);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v58, "integerValue");

          }
        }
        v59 = objc_msgSend(v130, "item");
        if (v54 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_31;
        v60 = v59;
        objc_msgSend(v126, "objectAtIndex:", v54);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "elementID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "viewElement");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v63, "itemsChangeSet");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v64;
        if (v64)
          v60 = objc_msgSend(v64, "newIndexForOldIndex:", v60);

        if (v60 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_31:
          -[_TVMLCollectionViewController _closestIndexPathToIndexPath:](v141, "_closestIndexPathToIndexPath:", v130);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVMLCollectionViewController setLastFocusedIndexPath:](v141, "setLastFocusedIndexPath:", v66);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v60, v54);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVMLCollectionViewController setLastFocusedIndexPath:](v141, "setLastFocusedIndexPath:", v66);
        }

        -[_TVMLCollectionViewController lastFocusedIndexPath](v141, "lastFocusedIndexPath");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v130, "isEqual:", v67);

        if ((v68 & 1) == 0)
          v141->_didUpdateFocus = 1;
      }
      v181 = 0u;
      v182 = 0u;
      v179 = 0u;
      v180 = 0u;
      objc_msgSend(v41, "indexPathsForVisibleItems");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v179, v217, 16);
      if (v70)
      {
        v71 = *(_QWORD *)v180;
        do
        {
          for (i = 0; i != v70; ++i)
          {
            if (*(_QWORD *)v180 != v71)
              objc_enumerationMutation(v69);
            v73 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * i);
            if (objc_msgSend(v52, "containsIndex:", objc_msgSend(v73, "section")))
              objc_msgSend(v139, "addObject:", v73);
          }
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v179, v217, 16);
        }
        while (v70);
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v131, "count"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v169[0] = v23;
      v169[1] = 3221225472;
      v169[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_2_31;
      v169[3] = &unk_24EB87D50;
      v75 = v129;
      v170 = v75;
      v76 = v126;
      v171 = v76;
      v172 = v139;
      v173 = v141;
      v77 = v41;
      v174 = v77;
      v177 = &v195;
      v175 = v140;
      v178 = &v199;
      v78 = v74;
      v176 = v78;
      objc_msgSend(v131, "enumerateKeysAndObjectsUsingBlock:", v169);
      if (!*((_BYTE *)v200 + 24)
        && (objc_msgSend(v78, "count")
         || objc_msgSend(v52, "count")
         || objc_msgSend(v127, "count")
         || objc_msgSend(v128, "count")))
      {
        v163[0] = v23;
        v163[1] = 3221225472;
        v163[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_4_34;
        v163[3] = &unk_24EB862C8;
        v164 = v77;
        v165 = v52;
        v166 = v127;
        v167 = v128;
        v168 = v78;
        v79 = MEMORY[0x22767F470](v163);
        v80 = (void *)v190[5];
        v190[5] = v79;

      }
      goto LABEL_51;
    }
  }
  else
  {

  }
  *((_BYTE *)v200 + 24) = 1;
LABEL_51:
  v162[0] = v23;
  v162[1] = 3221225472;
  v162[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_9;
  v162[3] = &unk_24EB87E30;
  v162[4] = v141;
  v162[5] = &v195;
  v132 = (void (**)(void))MEMORY[0x22767F470](v162);
  if (*((_BYTE *)v200 + 24))
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    objc_msgSend(v41, "visibleCells");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v146, v214, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v147;
      do
      {
        for (j = 0; j != v82; ++j)
        {
          if (*(_QWORD *)v147 != v83)
            objc_enumerationMutation(v81);
          objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * j), "tv_setBelongsToOldIndexPath:", 1);
        }
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v146, v214, 16);
      }
      while (v82);
    }

    v85 = v141;
    -[_TVMLCollectionViewController lastFocusedIndexPath](v141, "lastFocusedIndexPath");
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v86;
    if (v208[5])
    {
      -[_TVMLCollectionViewController setLastFocusedIndexPath:](v141, "setLastFocusedIndexPath:");
    }
    else if (v86)
    {
      -[_TVMLCollectionViewController _closestIndexPathToIndexPath:](v141, "_closestIndexPathToIndexPath:", v86);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMLCollectionViewController setLastFocusedIndexPath:](v141, "setLastFocusedIndexPath:", v94);

      v85 = v141;
    }
    -[_TVMLCollectionViewController lastFocusedIndexPath](v85, "lastFocusedIndexPath");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v87, "isEqual:", v95);

    if ((v96 & 1) == 0)
      v141->_didUpdateFocus = 1;
    v132[2]();
    objc_msgSend(v41, "reloadData");
  }
  else
  {
    v160 = 0u;
    v161 = 0u;
    v158 = 0u;
    v159 = 0u;
    v88 = v139;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v158, v216, 16);
    if (v89)
    {
      v90 = *(_QWORD *)v159;
      do
      {
        for (k = 0; k != v89; ++k)
        {
          if (*(_QWORD *)v159 != v90)
            objc_enumerationMutation(v88);
          objc_msgSend(v41, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * k));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "tv_setBelongsToOldIndexPath:", 1);

        }
        v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v158, v216, 16);
      }
      while (v89);
    }

    if (v190[5] || *((_BYTE *)v196 + 24))
    {
      v154[0] = v23;
      v154[1] = 3221225472;
      v154[2] = __67___TVMLCollectionViewController_updateWithViewElement_cellMetrics___block_invoke_10;
      v154[3] = &unk_24EB87E80;
      v155 = v41;
      v156 = v132;
      v157 = &v189;
      v93 = (void (**)(_QWORD))MEMORY[0x22767F470](v154);
      if (objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlock"))
        objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v93);
      else
        v93[2](v93);

    }
    else
    {
      v132[2]();
    }
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    objc_msgSend(v41, "preparedCells");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v150, v215, 16);
    if (v97)
    {
      v98 = *(_QWORD *)v151;
      v99 = *MEMORY[0x24BDBEFB0];
      v100 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      do
      {
        for (m = 0; m != v97; ++m)
        {
          if (*(_QWORD *)v151 != v98)
            objc_enumerationMutation(v87);
          v102 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * m);
          objc_msgSend(v41, "indexPathForCell:", v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103 || (objc_opt_respondsToSelector() & 1) == 0)
          {
            v104 = v103;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v102, "performSelector:", sel__layoutAttributes), "indexPath");
            v104 = (id)objc_claimAutoreleasedReturnValue();
          }
          v105 = v104;

          if (v105 && objc_msgSend(v140, "containsObject:", v105))
          {
            -[IKCollectionElement sections](*p_collectionElement, "sections");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "objectAtIndexedSubscript:", objc_msgSend(v105, "section"));
            v107 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v107, "elementForItemAtIndex:", objc_msgSend(v105, "item"));
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "center");
            v110 = v109;
            v112 = v111;
            -[_TVMLCollectionViewController expectedCellSizeForElement:atIndexPath:](v141, "expectedCellSizeForElement:atIndexPath:", v108, v105);
            objc_msgSend(v102, "setBounds:", v99, v100, v113, v114);
            objc_msgSend(v102, "setCenter:", v110, v112);
            -[_TVMLCollectionViewController updateVisibleCell:atIndexPath:withElement:](v141, "updateVisibleCell:atIndexPath:withElement:", v102, v105, v108);

          }
        }
        v97 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v150, v215, 16);
      }
      while (v97);
    }
  }

  objc_storeStrong(location, obj);
  -[_TVMLCollectionViewController didUpdateCollectionViewByNeedingReload:focusUpdate:](v141, "didUpdateCollectionViewByNeedingReload:focusUpdate:", *((unsigned __int8 *)v200 + 24), v141->_didUpdateFocus);
  -[_TVNeedsMoreContentEvaluator setViewElement:](v141->_needsMoreContentEvaluator, "setViewElement:", v137);
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend(v137, "sections");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v142, v213, 16);
  if (v116)
  {
    v117 = *(_QWORD *)v143;
    while (2)
    {
      for (n = 0; n != v116; ++n)
      {
        if (*(_QWORD *)v143 != v117)
          objc_enumerationMutation(v115);
        v119 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * n);
        objc_msgSend(v119, "itemsChangeSet");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v119, "updateType") == 4)
          goto LABEL_107;
        objc_msgSend(v120, "addedIndexes");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v121, "count"))
          goto LABEL_106;
        objc_msgSend(v120, "removedIndexes");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v122, "count"))
        {

LABEL_106:
LABEL_107:

          -[_TVNeedsMoreContentEvaluator reset](v141->_needsMoreContentEvaluator, "reset");
          -[_TVMLCollectionViewController view](v141, "view");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setNeedsLayout");
          goto LABEL_108;
        }
        objc_msgSend(v120, "movedIndexesByNewIndex");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend(v123, "count") == 0;

        if (!v124)
          goto LABEL_107;

      }
      v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v142, v213, 16);
      if (v116)
        continue;
      break;
    }
  }
LABEL_108:

  _Block_object_dispose(&v189, 8);
  _Block_object_dispose(&v195, 8);
  _Block_object_dispose(&v199, 8);

LABEL_109:
  if (v141->_didUpdateFocus && -[_TVMLCollectionViewController isViewLoaded](v141, "isViewLoaded"))
  {
    -[_TVMLCollectionViewController setNeedsFocusUpdate](v141, "setNeedsFocusUpdate");
    -[_TVMLCollectionViewController view](v141, "view");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setNeedsLayout");

  }
  _Block_object_dispose(&v207, 8);

}

- (_TVCollectionWrappingView)collectionWrappingView
{
  void *v3;

  if (-[_TVMLCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVMLCollectionViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (_TVCollectionWrappingView *)v3;
}

- (void)tv_setShowcaseConfig:(TVShowcaseConfig *)a3
{
  void *v5;
  TVShowcaseConfig v6;

  v6 = *a3;
  -[_TVMLCollectionViewController setShowcaseConfig:](self, "setShowcaseConfig:", &v6);
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend(v5, "setShowcaseConfig:", &v6);

}

- (unint64_t)preferredScrollPosition
{
  return 0;
}

- (BOOL)shouldHeaderFloatByDefault
{
  return 1;
}

- (Class)cellClassForElement:(id)a3
{
  return 0;
}

- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  uint8_t buf[4];
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  CGSize result;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_TVMLCollectionViewController cellMetrics](self, "cellMetrics");
  v9 = v34;
  v8 = v35;
  if (v34 == 0.0)
  {
    objc_msgSend(v6, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tv_width");
    v9 = v11;

    objc_msgSend(v6, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tv_height");
    v14 = v13;

    if (v14 <= 0.0 || v9 <= 0.0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TVFactoryKeyCellMetrics"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "tv_cellMetricsValue");
        v9 = *(double *)&v25;
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v9 = 0.0;
        v25 = 0u;
      }

    }
    else
    {
      v8 = v14;
    }
  }
  if (v9 < 0.0 || v8 < 0.0)
  {
    -[_TVMLCollectionViewController collectionElement](self, "collectionElement", v25, v26, v27, v28, v29, v30, v31, v32, v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
    {
      v21 = v18;
      v22 = objc_msgSend(v7, "section");
      v23 = objc_msgSend(v7, "item");
      objc_msgSend(v17, "debugDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v37 = v9;
      v38 = 2048;
      v39 = v8;
      v40 = 2048;
      v41 = v22;
      v42 = 2048;
      v43 = v23;
      v44 = 2112;
      v45 = v24;
      _os_log_error_impl(&dword_222D98000, v21, OS_LOG_TYPE_ERROR, "CollectionLayout: invalid cell size: {%lf, %lf} for [%ld, %ld] in: %@", buf, 0x34u);

    }
  }

  v19 = v9;
  v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateVisibleCell:(id)a3 atIndexPath:(id)a4 withElement:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(v8, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tv_focusMargin");
    objc_msgSend(v10, "valueWithUIEdgeInsets:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forTVViewStyle:", v12, CFSTR("tv-focus-margin"));

    v13 = (void *)MEMORY[0x24BDD1968];
    -[_TVMLCollectionViewController cellMetrics](self, "cellMetrics");
    objc_msgSend(v13, "valueWithUIEdgeInsets:", v20, v21, v22, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forTVViewStyle:", v14, CFSTR("padding"));

    v15 = (void *)MEMORY[0x24BDD16E0];
    -[IKCollectionElement style](self->_collectionElement, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "tv_contentAlignment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forTVViewStyle:", v17, CFSTR("tv-content-align"));

    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "_viewFromElement:existingView:", v9, v7);

  }
}

- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_TVMLCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  objc_msgSend(v10, "nextFocusedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "nextFocusedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v9);

    objc_msgSend(v10, "nextFocusedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("highlight"), v5, 0);
LABEL_4:

  }
}

- (void)dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  v9 = a4;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v9, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "elementForItemAtIndex:", objc_msgSend(v9, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cellForItemAtIndexPath:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isDisabled") & 1) == 0)
    objc_msgSend(v13, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", v16, 1, 1, 0, v15, v8);

}

- (void)loadView
{
  _TVCollectionWrappingView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _TVCollectionWrappingView *v13;

  v3 = [_TVCollectionWrappingView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v13 = -[_TVCollectionWrappingView initWithFrame:](v3, "initWithFrame:");

  -[_TVCollectionWrappingView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  -[IKCollectionElement style](self->_collectionElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVCollectionWrappingView setIkBackgroundColor:](v13, "setIkBackgroundColor:", v6);
  -[_TVMLCollectionViewController setView:](self, "setView:", v13);
  -[_TVCollectionWrappingView bounds](v13, "bounds");
  -[_TVMLCollectionViewController makeCollectionViewWithFrame:](self, "makeCollectionViewWithFrame:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController _registerCellClassesInCollectionView:](self, "_registerCellClassesInCollectionView:", v7);
  objc_msgSend(v7, "setSemanticContentAttribute:", -[IKCollectionElement tv_semanticContentAttribute](self->_collectionElement, "tv_semanticContentAttribute"));
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setDataSource:", self);
  objc_msgSend(v7, "_setContentInsetAdjustmentBehavior:", 2);
  -[IKCollectionElement attributes](self->_collectionElement, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("remembersFocus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IKCollectionElement attributes](self->_collectionElement, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("remembersFocus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemembersLastFocusedIndexPath:", objc_msgSend(v11, "BOOLValue"));

  }
  -[_TVMLCollectionViewController setCollectionView:](self, "setCollectionView:", v7);
  -[_TVCollectionWrappingView setCollectionView:](v13, "setCollectionView:", v7);
  if ((-[_TVMLCollectionViewController contentFlowsVertically](self, "contentFlowsVertically") & 1) != 0)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCollectionWrappingView setHeaderAuxiliarySelecting:](v13, "setHeaderAuxiliarySelecting:", objc_msgSend(v12, "isScrollEnabled") ^ 1);

  }
  else
  {
    -[_TVCollectionWrappingView setHeaderAuxiliarySelecting:](v13, "setHeaderAuxiliarySelecting:", 1);
  }
  -[_TVMLCollectionViewController _updateHeaderView](self, "_updateHeaderView");
  -[_TVMLCollectionViewController _updateFooterView](self, "_updateFooterView");
  -[_TVMLCollectionViewController _registerPreviewInteractionController](self, "_registerPreviewInteractionController");
  -[_TVMLCollectionViewController _doUpdateViewLayoutAnimated:relayout:](self, "_doUpdateViewLayoutAnimated:relayout:", 0, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_didAppear = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_TVMLCollectionViewController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  TVPreviewInteractionController *previewInteractionController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController)
    -[TVPreviewInteractionController dismissInteractionView](previewInteractionController, "dismissInteractionView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  TVPreviewInteractionController *previewInteractionController;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVMLCollectionViewController;
  -[_TVMLCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController)
    -[TVPreviewInteractionController dismissInteractionView](previewInteractionController, "dismissInteractionView");
}

- (void)tv_updateViewLayout
{
  void *v3;
  BOOL v4;

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVLockupFactory cellMetricsForCollectionElement:](_TVLockupFactory, "cellMetricsForCollectionElement:", v3);

  v4 = self->_cellMetrics.cellSize.width == 0.0 && self->_cellMetrics.cellSize.height == 0.0;
  if (!v4
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)0, *(float64x2_t *)&self->_cellMetrics.cellPadding.top), (int32x4_t)vceqq_f64((float64x2_t)0, *(float64x2_t *)&self->_cellMetrics.cellPadding.bottom))), 0xFuLL))) & 1) == 0)
  {
    *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = 0u;
    *(_OWORD *)&self->_cellMetrics.cellMargin.top = 0u;
    *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = 0u;
    *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = 0u;
    *(_OWORD *)&self->_cellMetrics.cellInset.top = 0u;
    *(_OWORD *)&self->_cellMetrics.cellInset.bottom = 0u;
    *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = 0u;
    self->_cellMetrics.cellSize = 0u;
    *(_OWORD *)&self->_cellMetrics.cellPadding.top = 0u;
    if (-[_TVMLCollectionViewController isViewLoaded](self, "isViewLoaded"))
      -[_TVMLCollectionViewController _doUpdateViewLayoutAnimated:relayout:](self, "_doUpdateViewLayoutAnimated:relayout:", 1, 1);
  }
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "numberOfItems");
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (self->_isPreparingCollectionUpdates)
  {
    -[_TVMLCollectionViewController shadowViewElement](self, "shadowViewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v5, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "elementForItemAtIndex:", objc_msgSend(v5, "item"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "elementName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "tv_elementType") == 24)
    {
      v39 = v16;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v15, "children");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v18)
      {
        v19 = v18;
        v36 = v15;
        v37 = v5;
        v38 = v14;
        v20 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            if (objc_msgSend(v22, "tv_elementType") == 16 && !objc_msgSend(v22, "tv_imageType"))
            {
              v23 = v22;
              objc_msgSend(v23, "url");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "tv_isResourceURL"))
              {
                +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "tv_resourceName");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "URLForResource:", v26);
                v27 = objc_claimAutoreleasedReturnValue();

                v24 = (void *)v27;
              }
              if (v24)
              {
                if (objc_msgSend(v24, "tv_imageURLType") == 1)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-LCR"), v39);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  v15 = v36;
                  v5 = v37;
                }
                else
                {
                  v15 = v36;
                  v5 = v37;
                  v16 = v39;
                }

                v14 = v38;
                goto LABEL_23;
              }

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v19)
            continue;
          break;
        }
        v5 = v37;
        v14 = v38;
        v15 = v36;
      }
      v16 = v39;
LABEL_23:

    }
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v16, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_opt_new();
    objc_msgSend(v15, "style");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tv_focusMargin");
    objc_msgSend(v29, "setFocusMargin:");

    -[_TVMLCollectionViewController cellMetrics](self, "cellMetrics");
    objc_msgSend(v29, "setPadding:", v40, v41, v42, v43);
    -[IKCollectionElement style](self->_collectionElement, "style");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContentAlignment:", objc_msgSend(v31, "tv_contentAlignment"));

    objc_msgSend(v11, "tv_setAssociatedIKViewElement:", 0);
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_viewFromElement:layout:existingView:", v15, v29, v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33 != v11)
    {
      objc_msgSend(v11, "contentView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addSubview:", v33);

    }
  }

  return v11;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[_TVMLCollectionViewController indexPathsByIndexTitle](self, "indexPathsByIndexTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v7 = (void *)*MEMORY[0x24BDF74F8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "tv_setDisplayed:", objc_msgSend(v7, "applicationState") == 0);

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "item");
  objc_msgSend(v13, "loadIndex:", v12);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_msgSend(v11, "tv_setDisplayed:", 0);
  if ((objc_msgSend(v11, "tv_belongsToOldIndexPath") & 1) == 0)
  {
    -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "unloadIndex:", objc_msgSend(v7, "item"));
  }
  objc_msgSend(v11, "tv_setBelongsToOldIndexPath:", 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73___TVMLCollectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v10[3] = &unk_24EB87EA8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_TVMLCollectionViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("select"), v8, v10);

}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
  -[_TVMLCollectionViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("play"), a4, 0);
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  -[_TVMLCollectionViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("contextmenu"), a4, 0);
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  TVPreviewInteractionController *previewInteractionController;

  previewInteractionController = self->_previewInteractionController;
  if (previewInteractionController)
    return -[TVPreviewInteractionController collectionView:shouldHandleLongPressForItemAtIndexPath:](previewInteractionController, "collectionView:shouldHandleLongPressForItemAtIndexPath:", a3, a4);
  else
    return 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  -[_TVMLCollectionViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "previouslyFocusedIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextFocusedIndexPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
    {
      objc_msgSend(v16, "cellForItemAtIndexPath:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tv_setFocused:", 0);
      objc_msgSend(v16, "cellForItemAtIndexPath:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tv_setFocused:", 1);

    }
  }
  -[_TVMLCollectionViewController updateFocusInContext:withAnimationCoordinator:](self, "updateFocusInContext:withAnimationCoordinator:", v8, v9);

}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  NSIndexPath *lastFocusedIndexPath;

  if ((objc_msgSend(a3, "tv_isFocusOnNonOwnedCell") & 1) != 0)
    lastFocusedIndexPath = 0;
  else
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
  return lastFocusedIndexPath;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat rect;
  CGRect v30;
  CGRect v31;

  -[_TVMLCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  rect = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v13;
  v16 = v15;
  v28 = v17;
  v19 = v18;

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentSize");
  v22 = v21;
  v24 = v23;

  if ((-[_TVMLCollectionViewController contentFlowsVertically](self, "contentFlowsVertically") & 1) == 0)
  {
    v30.origin.x = rect;
    v30.origin.y = v7;
    v30.size.width = v9;
    v30.size.height = v11;
    if (v19 + v16 + v22 <= CGRectGetWidth(v30))
      goto LABEL_5;
  }
  if (-[_TVMLCollectionViewController contentFlowsVertically](self, "contentFlowsVertically", *(_QWORD *)&v28))
  {
    v31.origin.x = rect;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    if (v28 + v14 + v24 <= CGRectGetHeight(v31))
    {
LABEL_5:
      -[_TVMLCollectionViewController collectionView](self, "collectionView", *(_QWORD *)&v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setContentOffset:animated:", 0, -v16, -v14);

    }
  }
  -[_TVNeedsMoreContentEvaluator evaluateForState:](self->_needsMoreContentEvaluator, "evaluateForState:", 2);
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reevaluateHeaderFrame");

  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reevaluateFooterFrame");

  if (self->_didAppear)
    -[_TVMLCollectionViewController _updateImpressions](self, "_updateImpressions");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MinY;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;

  -[_TVMLCollectionViewController collectionView](self, "collectionView", a3, a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tv_isFocusOnNonOwnedCell");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "focusedView");
    v30 = (id)objc_claimAutoreleasedReturnValue();

    -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isHeaderFloating")
      && -[_TVMLCollectionViewController contentFlowsVertically](self, "contentFlowsVertically"))
    {
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v30, "isDescendantOfView:", v11);

      if (!v12)
      {
LABEL_7:

        return;
      }
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bounds");
      objc_msgSend(v13, "convertRect:fromView:", v30);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v31.origin.x = v15;
      v31.origin.y = v17;
      v31.size.width = v19;
      v31.size.height = v21;
      MinY = CGRectGetMinY(v31);
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_gradientMaskEdgeInsets");
      v25 = v24;
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_gradientMaskLengths");
      v28 = MinY - (v25 + v27);

      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentInset");
      a5->y = fmin(fmax(v28, -v29), a5->y);
    }

    goto LABEL_7;
  }
}

- (void)_updateImpressions
{
  -[_TVMLCollectionViewController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
  if (self->_impressionThreshold > 0.0)
    -[_TVMLCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
}

- (void)_cancelImpressionsUpdate
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__recordImpressionsForVisibleView, 0);
}

- (void)_recordImpressionsForVisibleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_TVMLCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IKCollectionElement appDocument](self->_collectionElement, "appDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v6, "recordImpressionsForViewElements:", v5);

  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IKCollectionElement appDocument](self->_collectionElement, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v4))
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_TVMLCollectionViewController isViewLoaded](self, "isViewLoaded"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "tv_impressionableElementsForDocument:", v4, (_QWORD)v20);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObjectsFromArray:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }

      -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "headerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tv_impressionableElementsForDocument:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v17);

    }
    if (objc_msgSend(v8, "count", (_QWORD)v20))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)preloadCellsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_TVMLCollectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutBelowIfNeeded");

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_ensureViewsAreLoadedInRect:", x, y, width, height);

}

- (void)resetLastFocusedIndexPath
{
  -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", 0);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_TVMLCollectionViewController collectionView](self, "collectionView", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "tv_setDisplayed:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_applicationWillResignActive:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_TVMLCollectionViewController collectionView](self, "collectionView", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "tv_setDisplayed:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)adjustContentOffsetToDisplayIndexPath:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;

  v57 = a3;
  if (v57)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutBelowIfNeeded");

    v5 = -[_TVMLCollectionViewController preferredScrollPosition](self, "preferredScrollPosition");
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v57);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v53 = v9;
    v54 = v8;
    v11 = v10;
    v52 = v12;

    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentInset");
    v50 = v15;
    v51 = v14;
    v55 = v17;
    v56 = v16;

    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;

    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentOffset");
    v25 = v24;
    v27 = v26;
    v28 = v24;
    v29 = v26;

    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentSize");
    v49 = v31;
    v33 = v32;

    if (-[_TVMLCollectionViewController contentFlowsVertically](self, "contentFlowsVertically"))
    {
      v34 = v11 + v52 + v50 - v22;
      v35 = v11 - v51;
      v36 = v11 + v52 * 0.5 - v22 * 0.5;
      if (v34 >= v36)
        v36 = v11 + v52 + v50 - v22;
      if (v35 >= v36)
        v37 = v36;
      else
        v37 = v11 - v51;
      if (v27 < v34 || v29 > v35)
      {
        if (v5 == 1)
        {
          v37 = v11 - v51;
        }
        else if (v5 != 2)
        {
          if (v5 == 4)
          {
            v37 = v11 + v52 + v50 - v22;
          }
          else
          {
            v37 = v11 + v52 + v50 - v22;
            if (v27 >= v34)
            {
              if (v27 <= v35)
                v37 = v27;
              else
                v37 = v11 - v51;
            }
          }
        }
        if (v37 >= v50 + v33 - v22)
          v47 = v50 + v33 - v22;
        else
          v47 = v37;
        if (v47 >= -v51)
          v29 = v47;
        else
          v29 = -v51;
      }
    }
    else
    {
      v39 = v54 + v53 + v55 - v20;
      v40 = v54 - v56;
      v41 = v54 + v53 * 0.5 - v20 * 0.5;
      if (v39 >= v41)
        v41 = v54 + v53 + v55 - v20;
      if (v40 >= v41)
        v42 = v41;
      else
        v42 = v54 - v56;
      -[_TVMLCollectionViewController view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "effectiveUserInterfaceLayoutDirection");

      if (v25 < v39 || v28 > v40)
      {
        v46 = v55 + v49 - v20;
        if (v5 == 8)
        {
          v42 = v54 - v56;
        }
        else if (v5 != 16)
        {
          if (v5 == 32)
          {
            v42 = v54 + v53 + v55 - v20;
          }
          else if (v44 == 1)
          {
            v42 = v54 + v53 + v55 - v20;
          }
          else
          {
            v42 = v54 - v56;
          }
        }
        if (v42 < v46)
          v46 = v42;
        if (v46 >= -v56)
          v28 = v46;
        else
          v28 = -v56;
      }
    }
    if (v25 != v28 || v27 != v29)
    {
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setContentOffset:animated:", 0, v28, v29);

    }
  }

}

+ (id)_shadowViewElementForCollectionElement:(id)a3
{
  id v3;
  _TVShadowViewElement *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _TVShadowViewElementID *v12;
  _TVShadowViewElement *v13;
  void *v14;
  void *v15;
  _TVShadowViewElementID *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(_TVShadowViewElement);
  v17 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v3);
  -[_TVShadowViewElement setElementID:](v4, "setElementID:");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v3;
  objc_msgSend(v3, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "elementType") == 49)
        {
          v12 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v11);
          v13 = objc_alloc_init(_TVShadowViewElement);
          -[_TVShadowViewElement setElementID:](v13, "setElementID:", v12);
          -[_TVShadowViewElement setParent:](v13, "setParent:", v4);
          if (objc_msgSend(v11, "numberOfItems") >= 1)
          {
            objc_msgSend(v11, "elementForItemAtIndex:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "elementName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[_TVShadowViewElement setResourceName:](v13, "setResourceName:", v15);
          }
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    -[_TVShadowViewElement setChildren:](v4, "setChildren:", v5);

  return v4;
}

- (void)_doUpdateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  -[_TVMLCollectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transferLayoutStylesFromElement:", v8);

  -[_TVMLCollectionViewController updateViewLayoutAnimated:relayout:](self, "updateViewLayoutAnimated:relayout:", v5, v4);
}

- (void)_updateHeaderView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char isKindOfClass;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController headerViewController](self, "headerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController headerElement](self, "headerElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_viewControllerFromElement:existingController:", v6, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController headerElement](self, "headerElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_viewFromElement:existingView:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (v11 == v8)
      {
        v7 = v4;
      }
      else
      {
        v7 = objc_alloc_init(MEMORY[0x24BDF6F98]);
        objc_msgSend(v7, "setView:", v11);
      }
    }
    else
    {
      v7 = 0;
    }

  }
  if (v7 != v4)
  {
    objc_msgSend(v4, "willMoveToParentViewController:", 0);
    if (v7)
      -[_TVMLCollectionViewController addChildViewController:](self, "addChildViewController:", v7);
    objc_msgSend(v4, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    objc_msgSend(v7, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHeaderView:", v13);

    objc_msgSend(v4, "removeFromParentViewController");
    objc_msgSend(v7, "didMoveToParentViewController:", self);
  }
  -[_TVMLCollectionViewController setHeaderViewController:](self, "setHeaderViewController:", v7);
  -[IKViewElement attributes](self->_headerElement, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("floating"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
    v16 = objc_msgSend(v15, "BOOLValue");
  else
    v16 = -[_TVMLCollectionViewController shouldHeaderFloatByDefault](self, "shouldHeaderFloatByDefault");
  objc_msgSend(v3, "setHeaderFloating:", v16);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[IKViewElement children](self->_headerElement, "children", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "tv_elementType") == 50)
        {
          v18 = 1;
          goto LABEL_25;
        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_25:

  objc_msgSend(v3, "setHeaderCanBecomeFocused:", v18);
  objc_msgSend(v3, "headerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "headerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setGestureTargetView:", v3);

  }
}

- (void)_registerPreviewInteractionController
{
  void *v3;
  void *v4;
  void *v5;
  TVPreviewInteractionController *v6;
  TVPreviewInteractionController *previewInteractionController;
  id v8;

  if (!self->_previewInteractionController)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[IKCollectionElement appDocument](self->_collectionElement, "appDocument");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tv_interactionPreviewControllerForViewController:presentingView:presentingElement:", self, v4, v5);
      v6 = (TVPreviewInteractionController *)objc_claimAutoreleasedReturnValue();

      previewInteractionController = self->_previewInteractionController;
      self->_previewInteractionController = v6;

    }
  }
}

- (void)_updateFooterView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController footerViewController](self, "footerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController footerElement](self, "footerElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_viewControllerFromElement:existingController:", v5, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController footerElement](self, "footerElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_viewFromElement:existingView:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v10 == v7)
      {
        v6 = v3;
      }
      else
      {
        v6 = objc_alloc_init(MEMORY[0x24BDF6F98]);
        objc_msgSend(v6, "setView:", v10);
      }
    }
    else
    {
      v6 = 0;
    }

  }
  if (v6 != v3)
  {
    objc_msgSend(v3, "willMoveToParentViewController:", 0);
    if (v6)
      -[_TVMLCollectionViewController addChildViewController:](self, "addChildViewController:", v6);
    objc_msgSend(v3, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    objc_msgSend(v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFooterView:", v12);

    objc_msgSend(v3, "removeFromParentViewController");
    objc_msgSend(v6, "didMoveToParentViewController:", self);
  }
  -[_TVMLCollectionViewController setFooterViewController:](self, "setFooterViewController:", v6);

}

- (void)_registerCellClassesInCollectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _TVMLCollectionViewController *v25;
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

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v24 = v8;
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v9, "prototypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v15, "elementName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
              {
                objc_msgSend(v5, "addObject:", v16);
                +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "_collectionViewCellClassForElement:", v15);
                if (v18)
                {
                  v19 = v18;

                }
                else
                {
                  v19 = -[_TVMLCollectionViewController cellClassForElement:](v25, "cellClassForElement:", v15);

                  if (!v19)
                  {
                    v19 = objc_opt_class();
                    if (!v19)
                      goto LABEL_18;
                  }
                }
                objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v19, v16);
                if (objc_msgSend(v15, "tv_elementType") == 24)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-LCR"), v16);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v19, v20);

                }
              }
LABEL_18:

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v12);
        }

        v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

}

- (id)_closestIndexPathToIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v27;

  v4 = a3;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "section");
  if (v7 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfItems");

    if (v9 >= 1)
    {
      v10 = (void *)MEMORY[0x24BDD15D8];
      v11 = (double)objc_msgSend(v4, "item");
      objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (uint64_t)fmin(v11, (double)(objc_msgSend(v12, "numberOfItems") - 1));
      v14 = objc_msgSend(v4, "section");
      v15 = v10;
      v16 = v13;
LABEL_17:
      objc_msgSend(v15, "indexPathForItem:inSection:", v16, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
  }
  v17 = objc_msgSend(v4, "section");
  while (++v17 < (unint64_t)objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "numberOfItems");

    if (v19 >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_18;
      break;
    }
  }
  v21 = objc_msgSend(v4, "section") - 1;
  v22 = objc_msgSend(v6, "count");
  if (v21 >= v22 - 1)
    v23 = v22 - 1;
  else
    v23 = v21;
  if ((v23 & 0x8000000000000000) == 0)
  {
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "numberOfItems");

      if (v25 >= 1)
        break;
      if (v23-- <= 0)
        goto LABEL_15;
    }
    v27 = (void *)MEMORY[0x24BDD15D8];
    objc_msgSend(v6, "objectAtIndexedSubscript:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "numberOfItems") - 1;
    v15 = v27;
    v14 = v23;
    goto LABEL_17;
  }
LABEL_15:
  v20 = 0;
LABEL_18:

  return v20;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (IKCollectionElement)collectionElement
{
  return self->_collectionElement;
}

- (IKViewElement)headerElement
{
  return self->_headerElement;
}

- (TVCellMetrics)cellMetrics
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[8].cellInset.right;
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *(_OWORD *)&self[8].cellInset.left;
  *(_OWORD *)&retstr->cellMargin.top = v3;
  *(_OWORD *)&retstr->cellMargin.bottom = *(_OWORD *)&self[8].cellInsetAlt.left;
  v4 = *(_OWORD *)&self[8].cellSize.height;
  *(_OWORD *)&retstr->cellPadding.bottom = *(_OWORD *)&self[7].cellMargin.right;
  *(_OWORD *)&retstr->cellInset.top = v4;
  v5 = *(_OWORD *)&self[8].cellPadding.right;
  *(_OWORD *)&retstr->cellInset.bottom = *(_OWORD *)&self[8].cellPadding.left;
  *(_OWORD *)&retstr->cellInsetAlt.top = v5;
  v6 = *(_OWORD *)&self[7].cellMargin.left;
  retstr->cellSize = *(CGSize *)&self[7].cellInsetAlt.right;
  *(_OWORD *)&retstr->cellPadding.top = v6;
  return self;
}

- (UIViewController)footerViewController
{
  return self->_footerViewController;
}

- (void)setFooterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewController, a3);
}

- (IKViewElement)footerElement
{
  return self->_footerElement;
}

- (NSIndexPath)lastFocusedIndexPath
{
  return self->_lastFocusedIndexPath;
}

- (void)setLastFocusedIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (BOOL)isIndexDisplayEnabled
{
  return self->_indexDisplayEnabled;
}

- (void)setIndexDisplayEnabled:(BOOL)a3
{
  self->_indexDisplayEnabled = a3;
}

- (_TVShadowViewElement)shadowViewElement
{
  return self->_shadowViewElement;
}

- (void)setShadowViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_shadowViewElement, a3);
}

- (TVShowcaseConfig)showcaseConfig
{
  *retstr = *(TVShowcaseConfig *)((char *)self + 1088);
  return self;
}

- (void)setShowcaseConfig:(TVShowcaseConfig *)a3
{
  double inset;

  inset = a3->inset;
  *(_OWORD *)&self->_showcaseConfig.flavor = *(_OWORD *)&a3->flavor;
  self->_showcaseConfig.inset = inset;
}

- (NSDictionary)indexPathsByIndexTitle
{
  return self->_indexPathsByIndexTitle;
}

- (void)setIndexPathsByIndexTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (NSArray)sortedIndexTitles
{
  return self->_sortedIndexTitles;
}

- (void)setSortedIndexTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedIndexTitles, 0);
  objc_storeStrong((id *)&self->_indexPathsByIndexTitle, 0);
  objc_storeStrong((id *)&self->_shadowViewElement, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_footerElement, 0);
  objc_storeStrong((id *)&self->_footerViewController, 0);
  objc_storeStrong((id *)&self->_headerElement, 0);
  objc_storeStrong((id *)&self->_collectionElement, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_storeStrong((id *)&self->_needsMoreContentEvaluator, 0);
}

@end
