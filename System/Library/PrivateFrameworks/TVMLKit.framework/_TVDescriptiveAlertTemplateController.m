@implementation _TVDescriptiveAlertTemplateController

- (void)updateWithViewElement:(id)a3
{
  id v5;
  IKImageElement **p_bgImageElement;
  IKImageElement *bgImageElement;
  IKImageElement **p_bgHeroImageElement;
  IKImageElement *bgHeroImageElement;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  char v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  void *v65;
  NSArray *v66;
  NSArray *templateSubviews;
  NSArray *v68;
  NSArray *templateSubcontrollers;
  void *v70;
  void *v71;
  UIColor *v72;
  UIColor *backgroundColor;
  UIView **p_preferredFocusView;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t n;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t ii;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t jj;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t kk;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  _TVDescriptiveAlertTemplateController *v104;
  id obj;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  __int128 v111;
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
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  objc_super v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v147.receiver = self;
  v147.super_class = (Class)_TVDescriptiveAlertTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v147, sel_updateWithViewElement_, v5);
  objc_storeStrong((id *)&self->_templateElement, a3);
  p_bgImageElement = &self->_bgImageElement;
  bgImageElement = self->_bgImageElement;
  self->_bgImageElement = 0;

  p_bgHeroImageElement = &self->_bgHeroImageElement;
  bgHeroImageElement = self->_bgHeroImageElement;
  self->_bgHeroImageElement = 0;

  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  v101 = (void *)-[NSArray mutableCopy](self->_templateSubcontrollers, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v98 = v5;
  objc_msgSend(v5, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v156, 16);
  if (v108)
  {
    v103 = 0;
    v107 = *(_QWORD *)v144;
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v104 = self;
    do
    {
      for (i = 0; i != v108; ++i)
      {
        if (*(_QWORD *)v144 != v107)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
        if (objc_msgSend(v17, "tv_elementType") == 4)
        {
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          objc_msgSend(v17, "children");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v140;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v140 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
                if (objc_msgSend(v23, "tv_elementType") == 16)
                {
                  if (!*p_bgImageElement
                    && (v24 = objc_msgSend(v23, "tv_imageType"), v25 = (id *)p_bgImageElement, !v24)
                    || !*p_bgHeroImageElement
                    && (v26 = objc_msgSend(v23, "tv_imageType"), v25 = (id *)p_bgHeroImageElement, v26 == 3))
                  {
                    objc_storeStrong(v25, v23);
                  }
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
            }
            while (v20);
          }
        }
        else
        {
          objc_msgSend(v17, "autoHighlightIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = i;
          if (v27)
          {
            objc_msgSend(v17, "resetProperty:", 2);
            v106 = 1;
          }
          else if (objc_msgSend(v17, "tv_elementType") == 44)
          {
            v137 = 0u;
            v138 = 0u;
            v135 = 0u;
            v136 = 0u;
            objc_msgSend(v17, "children");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
            if (v29)
            {
              v30 = v29;
              v31 = 0;
              v32 = *(_QWORD *)v136;
              do
              {
                for (k = 0; k != v30; ++k)
                {
                  if (*(_QWORD *)v136 != v32)
                    objc_enumerationMutation(v28);
                  objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * k), "autoHighlightIdentifier");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v34)
                    v31 = 1;
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
              }
              while (v30);
            }
            else
            {
              v31 = 0;
            }

            v106 = v31 & 1;
            i = v109;
          }
          else
          {
            v106 = 0;
          }
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v35 = self->_templateSubviews;
          v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v132;
LABEL_39:
            v39 = 0;
            while (1)
            {
              if (*(_QWORD *)v132 != v38)
                objc_enumerationMutation(v35);
              v18 = *(id *)(*((_QWORD *)&v131 + 1) + 8 * v39);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v18, "subviews");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "firstObject");
                v41 = objc_claimAutoreleasedReturnValue();

                v18 = (id)v41;
              }
              objc_msgSend(v18, "tv_associatedIKViewElement");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42 == v17)
                break;

              if (v37 == ++v39)
              {
                v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
                if (v37)
                  goto LABEL_39;
                v18 = 0;
                break;
              }
            }
            self = v104;
            i = v109;
          }
          else
          {
            v18 = 0;
          }

          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "_viewFromElement:existingView:", v17, v18);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
          {
            v110 = v17;
            v129 = 0u;
            v130 = 0u;
            v127 = 0u;
            v128 = 0u;
            v45 = v101;
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v128;
              while (2)
              {
                for (m = 0; m != v47; ++m)
                {
                  if (*(_QWORD *)v128 != v48)
                    objc_enumerationMutation(v45);
                  v50 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * m);
                  objc_msgSend(v50, "tv_associatedIKViewElement");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "isEqual:", v110);

                  if ((v52 & 1) != 0)
                  {
                    v53 = v50;

                    if (v53)
                      objc_msgSend(v45, "removeObject:", v53);
                    goto LABEL_62;
                  }
                }
                v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
                if (v47)
                  continue;
                break;
              }
            }

            v53 = 0;
LABEL_62:
            i = v109;
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v110;
            objc_msgSend(v54, "_viewControllerFromElement:existingController:", v110, v53);
            v55 = (id)objc_claimAutoreleasedReturnValue();

            if (v55)
            {
              self = v104;
              if (v55 != v53)
                objc_msgSend(v99, "addObject:", v55);
              objc_msgSend(v100, "addObject:", v55);
              objc_msgSend(v55, "view");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v44 = 0;
              self = v104;
            }

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "style");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "tv_width");
            objc_msgSend(v44, "sizeThatFits:");
            v58 = v57;
            v60 = v59;

            objc_msgSend(v44, "setSize:", v58, v60);
            objc_msgSend(v44, "superview");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v44, "superview");
              v62 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v62 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6D50]), "initWithFrame:", v12, v13, v14, v15);
            }
            v63 = (void *)v62;

            objc_msgSend(v63, "addSubview:", v44);
            objc_msgSend(v63, "transferLayoutStylesFromElement:", v17);
            objc_msgSend(v63, "setContentSize:", v58, v60);
            objc_msgSend(v63, "setBounces:", 1);

            v44 = v63;
          }
          if (v44)
          {
            if (v103)
              v64 = 0;
            else
              v64 = v106;
            if (v64 == 1)
              v103 = v44;
            if (objc_msgSend(v17, "tv_elementType") == 44)
            {
              objc_msgSend(v44, "components");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[_TVDescriptiveAlertTemplateController _normalizeButtonsInViews:](self, "_normalizeButtonsInViews:", v65);

            }
            objc_msgSend(v102, "addObject:", v44);
          }

        }
      }
      v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v156, 16);
    }
    while (v108);
  }
  else
  {
    v103 = 0;
  }

  -[_TVDescriptiveAlertTemplateController _normalizeButtonsInViews:](self, "_normalizeButtonsInViews:", v102);
  v66 = (NSArray *)objc_msgSend(v102, "copy");
  templateSubviews = self->_templateSubviews;
  self->_templateSubviews = v66;

  v68 = (NSArray *)objc_msgSend(v100, "copy");
  templateSubcontrollers = self->_templateSubcontrollers;
  self->_templateSubcontrollers = v68;

  objc_msgSend(v98, "style");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "tv_backgroundColor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "color");
  v72 = (UIColor *)objc_claimAutoreleasedReturnValue();
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v72;

  p_preferredFocusView = &self->_preferredFocusView;
  objc_storeStrong((id *)&self->_preferredFocusView, v103);
  if (-[_TVDescriptiveAlertTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVDescriptiveAlertTemplateController view](self, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setBackgroundColor:", self->_backgroundColor);

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v76 = v101;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v124;
      do
      {
        for (n = 0; n != v78; ++n)
        {
          if (*(_QWORD *)v124 != v79)
            objc_enumerationMutation(v76);
          objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * n), "willMoveToParentViewController:", 0);
        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
      }
      while (v78);
    }

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v81 = v99;
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v120;
      do
      {
        for (ii = 0; ii != v83; ++ii)
        {
          if (*(_QWORD *)v120 != v84)
            objc_enumerationMutation(v81);
          -[_TVDescriptiveAlertTemplateController addChildViewController:](self, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * ii));
        }
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
      }
      while (v83);
    }

    -[_TVDescriptiveAlertTemplateController view](self, "view");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setChildViews:", self->_templateSubviews);

    if (*p_preferredFocusView)
    {
      -[_TVDescriptiveAlertTemplateController view](self, "view");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setDefaultFocusView:", *p_preferredFocusView);

    }
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v88 = v76;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v116;
      do
      {
        for (jj = 0; jj != v90; ++jj)
        {
          if (*(_QWORD *)v116 != v91)
            objc_enumerationMutation(v88);
          objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * jj), "removeFromParentViewController");
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
      }
      while (v90);
    }

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v93 = v81;
    v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v111, v148, 16);
    if (v94)
    {
      v95 = v94;
      v96 = *(_QWORD *)v112;
      do
      {
        for (kk = 0; kk != v95; ++kk)
        {
          if (*(_QWORD *)v112 != v96)
            objc_enumerationMutation(v93);
          objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * kk), "didMoveToParentViewController:", self);
        }
        v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v111, v148, 16);
      }
      while (v95);
    }

    -[_TVDescriptiveAlertTemplateController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

}

- (void)loadView
{
  _TVDescriptiveAlertView *v3;
  void *v4;
  _TVDescriptiveAlertView *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = [_TVDescriptiveAlertView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[_TVDescriptiveAlertView initWithFrame:](v3, "initWithFrame:");

  -[_TVDescriptiveAlertView setBackgroundColor:](v5, "setBackgroundColor:", self->_backgroundColor);
  -[_TVDescriptiveAlertTemplateController setView:](self, "setView:", v5);
  if (self->_templateSubviews)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_templateSubcontrollers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          -[_TVDescriptiveAlertTemplateController addChildViewController:](self, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }

    -[_TVDescriptiveAlertView setChildViews:](v5, "setChildViews:", self->_templateSubviews);
    if (self->_preferredFocusView)
      -[_TVDescriptiveAlertView setDefaultFocusView:](v5, "setDefaultFocusView:");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = self->_templateSubcontrollers;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "didMoveToParentViewController:", self, (_QWORD)v16);
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
}

- (void)_normalizeButtonsInViews:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
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

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v14, "tv_associatedIKViewElement");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "tv_elementType") == 6)
        {
          objc_msgSend(v14, "tv_sizeThatFits:", v9, v10);
          v12 = fmax(v12, v16);
          v11 = fmax(v11, v17);
          objc_msgSend(v4, "addObject:", v14);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v4;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12, (_QWORD)v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setValue:forTVViewStyle:", v24, CFSTR("width"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setValue:forTVViewStyle:", v25, CFSTR("height"));

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

}

- (CGSize)_backgroundImageProxySize
{
  IKImageElement *bgImageElement;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_bgHeroImageElement) != 0)
  {
    -[IKImageElement tv_imageScaleToSize](bgImageElement, "tv_imageScaleToSize");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVDescriptiveAlertTemplateController;
    -[_TVBgImageLoadingViewController _backgroundImageProxySize](&v5, sel__backgroundImageProxySize);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  IKImageElement *bgHeroImageElement;

  if (self->_bgImageElement)
  {
    -[IKViewElement appDocument](self->_templateElement, "appDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tv_adjustedWindowSize");
    v5 = v4;
    v7 = v6;

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setImageSize:", v5, v7);
    v9 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v8, self->_bgImageElement);
    -[IKImageElement tv_imageProxyWithLayout:](self->_bgImageElement, "tv_imageProxyWithLayout:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    bgHeroImageElement = self->_bgHeroImageElement;
    if (bgHeroImageElement)
    {
      -[IKImageElement tv_imageProxy](bgHeroImageElement, "tv_imageProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_bgHeroImageElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", self->_templateElement) == 1)return 4000;
  else
    return 4005;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[_TVDescriptiveAlertTemplateController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBgImage:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgHeroImageElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredFocusView, 0);
  objc_storeStrong((id *)&self->_templateSubcontrollers, 0);
  objc_storeStrong((id *)&self->_templateSubviews, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end
