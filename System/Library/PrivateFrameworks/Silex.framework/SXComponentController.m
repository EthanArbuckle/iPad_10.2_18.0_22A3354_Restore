@implementation SXComponentController

- (SXComponentController)initWithViewport:(id)a3 DOMObjectProvider:(id)a4
{
  id v7;
  id v8;
  SXComponentController *v9;
  SXComponentController *v10;
  uint64_t v11;
  NSHashTable *observers;
  uint64_t v13;
  NSMutableDictionary *mappedComponentViews;
  uint64_t v15;
  NSMutableArray *sortedComponentViews;
  uint64_t v17;
  NSMutableArray *nestedComponentViews;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SXComponentController;
  v9 = -[SXComponentController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_DOMObjectProvider, a4);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    mappedComponentViews = v10->_mappedComponentViews;
    v10->_mappedComponentViews = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    sortedComponentViews = v10->_sortedComponentViews;
    v10->_sortedComponentViews = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    nestedComponentViews = v10->_nestedComponentViews;
    v10->_nestedComponentViews = (NSMutableArray *)v17;

    -[SXViewport addViewportChangeListener:forOptions:](v10->_viewport, "addViewportChangeListener:forOptions:", v10, 14);
  }

  return v10;
}

- (void)integrateBlueprint:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void (**v35)(_QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  -[SXComponentController setIsPresenting:](self, "setIsPresenting:", 1);
  -[SXComponentController nestedComponentViews](self, "nestedComponentViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[SXComponentController removeComponentsInLayoutBlueprint:removedFromLayoutBlueprint:](self, "removeComponentsInLayoutBlueprint:removedFromLayoutBlueprint:", self->_presentedBlueprint, v7);
  -[SXComponentController host](self, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentController presentBlueprint:forParentComponentView:inHost:](self, "presentBlueprint:forParentComponentView:inHost:", v7, 0, v11);

  objc_storeStrong((id *)&self->_presentedBlueprint, a3);
  -[SXComponentController presentComponentsInBlueprint:](self, "presentComponentsInBlueprint:", v7);
  self->_isPresented = 1;
  -[SXComponentController viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "appearState");

  if (v13)
  {
    -[SXComponentController componentViews](self, "componentViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentController updateVisibilityStatesForComponentViews:](self, "updateVisibilityStatesForComponentViews:", v14);

  }
  -[SXComponentController presentationAttributes](self, "presentationAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "fadeInComponents");

  -[SXComponentController nestedComponentViews](self, "nestedComponentViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    v35 = v8;
    v19 = (void *)objc_msgSend(v17, "mutableCopy");

    v34 = v10;
    objc_msgSend(v19, "removeObjectsInArray:", v10);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      v24 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (objc_msgSend(v26, "visibilityState") == 1)
          {
            v40[0] = v24;
            v40[1] = 3221225472;
            v40[2] = __59__SXComponentController_integrateBlueprint_withCompletion___block_invoke;
            v40[3] = &unk_24D687408;
            v40[4] = self;
            v40[5] = v26;
            -[SXComponentController fadeComponent:completion:](self, "fadeComponent:completion:", v26, v40);
          }
          else
          {
            -[SXComponentController updatePresentationStateForNestedComponentView:presentationState:](self, "updatePresentationStateForNestedComponentView:presentationState:", v26, 2);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v22);
    }

    v10 = v34;
    v8 = v35;
  }
  else
  {
    -[SXComponentController updatePresentationStateForNestedComponentViews:presentationState:](self, "updatePresentationStateForNestedComponentViews:presentationState:", v17, 2);

  }
  -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentController renderContentsIfNeededForComponents:](self, "renderContentsIfNeededForComponents:", v27);

  -[SXComponentController setIsPresenting:](self, "setIsPresenting:", 0);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[SXComponentController observers](self, "observers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");

  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "componentControllerDidPresent:", self);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v31);
  }

  v8[2](v8);
}

uint64_t __59__SXComponentController_integrateBlueprint_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePresentationStateForNestedComponentViews:presentationState:", *(_QWORD *)(a1 + 40), 2);
}

- (void)presentBlueprint:(id)a3 forParentComponentView:(id)a4 inHost:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SXComponentController *v21;
  id v22;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v22 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v8, "componentIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(v8, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layoutOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "columnLayout");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentController presentComponentBlueprint:inHost:columnLayout:](self, "presentComponentBlueprint:inHost:columnLayout:", v14, v9, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "hasValidLayout"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;
            objc_msgSend(v14, "layoutBlueprint");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXComponentController presentBlueprint:forParentComponentView:inHost:](self, "presentBlueprint:forParentComponentView:inHost:", v19, v18, v18);

          }
        }
        if (v17)
          objc_msgSend(v24, "addObject:", v17);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  if (v22)
  {
    v20 = v24;
    objc_msgSend(v22, "setComponentViews:", v24);
  }
  else
  {
    v21 = self;
    v20 = v24;
    -[SXComponentController setNestedComponentViews:](v21, "setNestedComponentViews:", v24);
  }

}

- (void)fadeComponent:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDE5648];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "animationWithKeyPath:", CFSTR("opacity"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", &unk_24D6FF1A8);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "alpha");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v9);

  objc_msgSend(v11, "setDuration:", 0.3);
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v6);

  objc_msgSend(v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAnimation:forKey:", v11, CFSTR("opacity"));
}

- (id)presentComponentBlueprint:(id)a3 inHost:(id)a4 columnLayout:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  CGFloat MinY;
  double x;
  double y;
  double width;
  double height;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  void *v63;
  CGFloat v64;
  double v65;
  double v66;
  _BOOL4 v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  _BOOL8 v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i;
  uint64_t v112;
  void *v113;
  void *v114;
  double v116;
  double v117;
  double v118;
  double v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  uint64_t v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v126 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SXComponentController mappedComponentViews](self, "mappedComponentViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "component");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasValidLayout") && (objc_msgSend(v8, "isHidden") & 1) == 0)
  {
    if (!v14)
    {
      -[SXComponentController componentViewEngine](self, "componentViewEngine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "component");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentViewForComponent:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "setComponentHost:", v9);
        objc_msgSend(v8, "parentLayoutBlueprint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "component");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setComponentIndex:", objc_msgSend(v18, "indexOfObject:", v20));

        -[SXComponentController mappedComponentViews](self, "mappedComponentViews");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "component");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v14, v23);

        -[SXComponentController sortedComponentViews](self, "sortedComponentViews");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v14);

      }
      objc_msgSend(v14, "configure");
    }
    objc_msgSend(v14, "component");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_9;
    v26 = (void *)v25;
    objc_msgSend(v14, "component");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "component");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if ((v29 & 1) == 0)
    {
LABEL_9:
      objc_msgSend(v8, "component");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loadComponent:", v30);

    }
    objc_msgSend(v8, "absoluteFrame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[SXComponentController viewport](self, "viewport");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "contentFrame");
    MinY = CGRectGetMinY(v127);
    v128.origin.x = v32;
    v128.origin.y = v34;
    v128.size.width = v36;
    v128.size.height = v38;
    v129 = CGRectOffset(v128, 0.0, MinY);
    x = v129.origin.x;
    y = v129.origin.y;
    width = v129.size.width;
    height = v129.size.height;

    objc_msgSend(v8, "componentViewFrame");
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    objc_msgSend(v8, "parentLayoutBlueprint");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootLayoutBlueprint");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53 == v54)
    {
      objc_msgSend(v8, "componentViewFrame");
      v56 = v55;
      v58 = v57;
      v60 = v59;
      v62 = v61;
      -[SXComponentController viewport](self, "viewport");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "contentFrame");
      v64 = CGRectGetMinY(v130);
      v131.origin.x = v56;
      v131.origin.y = v58;
      v131.size.width = v60;
      v131.size.height = v62;
      v132 = CGRectOffset(v131, 0.0, v64);
      v118 = v132.origin.y;
      v119 = v132.origin.x;
      v116 = v132.size.height;
      v117 = v132.size.width;

    }
    else
    {
      v116 = v52;
      v117 = v50;
      v118 = v48;
      v119 = v46;
    }
    v120 = v9;
    objc_msgSend(v14, "absoluteFrame");
    v67 = y == v66 && x == v65;
    objc_msgSend(v8, "contentFrame");
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;
    objc_msgSend(v14, "contentFrame");
    v134.origin.x = v76;
    v134.origin.y = v77;
    v134.size.width = v78;
    v134.size.height = v79;
    v133.origin.x = v69;
    v133.origin.y = v71;
    v133.size.width = v73;
    v133.size.height = v75;
    v80 = !CGRectEqualToRect(v133, v134);
    objc_msgSend(v8, "componentState");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "identifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "state");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "identifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v82, "isEqualToString:", v84);

    objc_msgSend(v8, "componentState");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setState:", v86);

    objc_msgSend(v14, "setAbsoluteFrame:", x, y, width, height);
    objc_msgSend(v8, "layoutMargins");
    objc_msgSend(v14, "setComponentLayoutMargins:");
    objc_msgSend(v8, "contentViewFrame");
    v88 = v87;
    v90 = v89;
    v92 = v91;
    v94 = v93;
    objc_msgSend(v14, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setFrame:", v88, v90, v92, v94);

    objc_msgSend(v8, "contentFrame");
    objc_msgSend(v14, "setContentFrame:");
    objc_msgSend(v8, "backgroundViewFrame");
    objc_msgSend(v14, "setBackgroundViewFrame:");
    objc_msgSend(v8, "backgroundViewFrame");
    v97 = v96;
    v99 = v98;
    v101 = v100;
    v103 = v102;
    objc_msgSend(v14, "backgroundView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setFrame:", v97, v99, v101, v103);

    objc_msgSend(v8, "borderInsets");
    objc_msgSend(v14, "setBorderInsets:");
    if (objc_msgSend(v14, "requiresThoroughFrameCalculations"))
      objc_msgSend(v14, "setFrameUsingCenterAndBounds:", v119, v118, v117, v116);
    else
      objc_msgSend(v14, "setFrame:", v119, v118, v117, v116);
    objc_msgSend(v14, "setDocumentColumnLayout:", v10);
    v105 = 0x10000;
    if (v85)
      v105 = 0;
    v106 = 256;
    if (v67)
      v106 = 0;
    objc_msgSend(v14, "setPresentationChanges:", v106 | v80 | v105);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    objc_msgSend(v8, "infoFromLayouting");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v109; ++i)
        {
          if (*(_QWORD *)v122 != v110)
            objc_enumerationMutation(v107);
          v112 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i);
          objc_msgSend(v8, "infoFromLayouting");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "objectForKeyedSubscript:", v112);
          v114 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "receivedInfo:fromLayoutingPhaseWithIdentifier:", v114, v112);
        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
      }
      while (v109);
    }

    v9 = v120;
  }

  return v14;
}

- (void)presentComponentsInBlueprint:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = a3;
  objc_msgSend(v19, "componentIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v18 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(v19, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentController mappedComponentViews](self, "mappedComponentViews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "component");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setPresentationState:", 1);
        v4 = v4 & 0xFFFFFFFFFF000000 | objc_msgSend(v13, "presentationChanges") & 0xFFFFFF;
        objc_msgSend(v13, "willPresentComponentWithChanges:", v4);
        if ((objc_msgSend(v13, "allowHierarchyRemoval") & 1) == 0)
        {
          objc_msgSend(v13, "superview");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(v13, "componentHost");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addComponentView:", v13);

          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "layoutBlueprint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponentController presentComponentsInBlueprint:](self, "presentComponentsInBlueprint:", v16);

        }
        v3 = v3 & 0xFFFFFFFFFF000000 | objc_msgSend(v13, "presentationChanges") & 0xFFFFFF;
        objc_msgSend(v13, "presentComponentWithChanges:", v3);
        objc_msgSend(v13, "setPresentationChanges:", 0);

        ++v8;
      }
      while (v7 != v8);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

- (void)removeComponentsInLayoutBlueprint:(id)a3 removedFromLayoutBlueprint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

    objc_msgSend(v7, "componentIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v10);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v8;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v6, "componentBlueprintForComponentIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14 || objc_msgSend(v14, "isHidden"))
          {
            -[SXComponentController mappedComponentViews](self, "mappedComponentViews");
            v16 = v7;
            v17 = v6;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "discardContents");
            objc_msgSend(v19, "setPresentationState:", 0);
            objc_msgSend(v19, "setVisibilityState:", 2);
            objc_msgSend(v19, "componentHost");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeComponentView:", v19);

            -[SXComponentController mappedComponentViews](self, "mappedComponentViews");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeObjectForKey:", v12);

            v6 = v17;
            v7 = v16;
            -[SXComponentController sortedComponentViews](self, "sortedComponentViews");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObject:", v19);

            -[SXComponentController nestedComponentViews](self, "nestedComponentViews");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removeObject:", v19);

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "layoutBlueprint");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "layoutBlueprint");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }
            -[SXComponentController removeComponentsInLayoutBlueprint:removedFromLayoutBlueprint:](self, "removeComponentsInLayoutBlueprint:removedFromLayoutBlueprint:", v24, v25);

          }
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v28);
    }

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXComponentController observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXComponentController observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)componentsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXComponentController presentedBlueprint](self, "presentedBlueprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsInRect:", x, y, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)componentViewForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[SXComponentController componentViews](self, "componentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentController componentViewForPoint:inComponents:](self, "componentViewForPoint:inComponents:", v6, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)componentViewForPoint:(CGPoint)a3 inComponents:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char isKindOfClass;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "visibilityState") == 1)
        {
          objc_msgSend(v13, "absoluteFrame");
          v26.x = x;
          v26.y = y;
          if (CGRectContainsPoint(v27, v26))
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            v15 = v13;
            v16 = v15;
            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v15, "componentViews");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentController componentViewForPoint:inComponents:](self, "componentViewForPoint:inComponents:", v17, x, y);
              v18 = objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                v10 = v16;
                v16 = (void *)v18;
              }
              else
              {
                v10 = v16;
                v16 = v10;
              }
            }

            v10 = v16;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)componentViewsForRole:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[SXComponentController presentedBlueprint](self, "presentedBlueprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentController componentViewsForRole:forLayoutBlueprint:](self, "componentViewsForRole:forLayoutBlueprint:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)componentViewsForRole:(int)a3 forLayoutBlueprint:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "classification");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend((id)objc_opt_class(), "role");

        if (v14 == a3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)componentViewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXComponentController mappedComponentViews](self, "mappedComponentViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)provideInfosLayoutTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "provideInfosLayoutTo:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "appearState");
  if (a4 && !v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "visibilityState") != 1)
            objc_msgSend(v13, "discardContents");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentController updateVisibilityStatesForComponentViews:toState:](self, "updateVisibilityStatesForComponentViews:toState:", v14, 2);
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "appearState"))
  {
    -[SXComponentController componentViews](self, "componentViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentController renderContentsIfNeededForComponents:](self, "renderContentsIfNeededForComponents:", v14);
LABEL_15:

  }
  if (!a4 && objc_msgSend(v6, "appearState"))
  {
    -[SXComponentController componentViews](self, "componentViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentController updateVisibilityStatesForComponentViews:](self, "updateVisibilityStatesForComponentViews:", v15);

  }
}

- (void)viewport:(id)a3 boundsDidChangeFromBounds:(CGRect)a4
{
  id v5;

  -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentController renderContentsIfNeededForComponents:](self, "renderContentsIfNeededForComponents:", v5);

}

- (CGRect)renderBounds
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[SXComponentController viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "appearState") == 2)
    v4 = 1.0;
  else
    v4 = 0.0;

  -[SXComponentController viewport](self, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[SXComponentController viewport](self, "viewport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = -(v12 * v4);
  v14 = v7 - v10;
  v15 = v10 + v12 * v4 * 2.0;
  v16 = v12 + v10 * 2.0;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)renderContentsIfNeededForComponents:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentController renderBounds](self, "renderBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v18, "absoluteFrame", (_QWORD)v32);
        v40.origin.x = v19;
        v40.origin.y = v20;
        v40.size.width = v21;
        v40.size.height = v22;
        v39.origin.x = v6;
        v39.origin.y = v8;
        v39.size.width = v10;
        v39.size.height = v12;
        v23 = CGRectIntersectsRect(v39, v40);
        if (!v23 && (objc_msgSend(v18, "allowHierarchyRemoval") & 1) != 0)
        {
LABEL_10:
          objc_msgSend(v18, "superview");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = (void *)v25;
            v27 = objc_msgSend(v18, "allowHierarchyRemoval");

            if (v27)
            {
              objc_msgSend(v18, "componentHost");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "removeComponentView:", v18);

            }
          }
          continue;
        }
        objc_msgSend(v18, "superview");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          if (!v23)
            goto LABEL_10;
        }
        else
        {
          objc_msgSend(v18, "componentHost");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addComponentView:", v18);

          v36 = v18;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponentController updateVisibilityStatesForComponentViews:](self, "updateVisibilityStatesForComponentViews:", v30);

          if (!v23)
            continue;
        }
        objc_msgSend(v18, "superview");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          objc_msgSend(v18, "renderContentsIfNeeded");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }

}

- (void)viewport:(id)a3 dynamicBoundsDidChangeFromBounds:(CGRect)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  -[SXComponentController viewport](self, "viewport", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "appearState");

  if (v6)
  {
    -[SXComponentController componentViews](self, "componentViews");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponentController updateVisibilityStatesForComponentViews:](self, "updateVisibilityStatesForComponentViews:", v7);

  }
}

- (void)updateVisibilityStatesForComponentViews:(id)a3 toState:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setVisibilityState:", a4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)updateVisibilityStatesForComponentViews:(id)a3
{
  -[SXComponentController updateVisibilityStatesForComponentViews:parentComponent:withOffset:](self, "updateVisibilityStatesForComponentViews:parentComponent:withOffset:", a3, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (void)updateVisibilityStatesForComponentViews:(id)a3 parentComponent:(id)a4 withOffset:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
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
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat MinY;
  CGFloat Width;
  id v57;
  void *v58;
  _BOOL4 v60;
  CGFloat v61;
  CGFloat v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (-[SXComponentController isPresented](self, "isPresented"))
  {
    -[SXComponentController viewport](self, "viewport");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dynamicBounds");
    v61 = v11;
    v62 = v10;
    v13 = v12;
    v15 = v14;

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v64;
      v21 = a5.y != 1.79769313e308 && v8 != 0;
      v60 = v21;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v64 != v19)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v23, "superview");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            if ((objc_msgSend(v23, "requiresThoroughFrameCalculations") & 1) != 0
              || ((objc_msgSend(v23, "absoluteFrame"), v26 < v13)
               || (objc_msgSend(v23, "absoluteFrame"), v27 > v13 + v15))
              && ((objc_msgSend(v23, "absoluteFrame"),
                   v29 = v28,
                   objc_msgSend(v23, "absoluteFrame"),
                   v25 = v29 + v30,
                   v29 + v30 <= v13)
               || (objc_msgSend(v23, "absoluteFrame", v25), v31 > v13)))
            {
              if (objc_msgSend(v23, "requiresThoroughFrameCalculations", v25))
              {
                objc_msgSend(v23, "frame");
                v33 = v32;
                v35 = v34;
                v37 = v36;
                v39 = v38;
                objc_msgSend(v8, "contentView");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "superview");
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40 == v41)
                {
                  v44 = a5.x + v33;
                  v46 = a5.y + v35;
                }
                else
                {
                  if (v60)
                  {
                    objc_msgSend(v23, "superview");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "convertRect:fromView:", v42, v33, v35, v37, v39);
                    v44 = v43;
                    v46 = v45;
                    v37 = v47;
                    v39 = v48;
                  }
                  else
                  {
                    -[SXComponentController viewport](self, "viewport");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "superview");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "convertRect:fromView:", v50, v33, v35, v37, v39);
                    v44 = v51;
                    v46 = v52;
                    v37 = v53;
                    v39 = v54;

                  }
                }
                objc_msgSend(v23, "setPresentationFrame:", v44, v46, v37, v39);
                v69.origin.x = v44;
                v69.origin.y = v46;
                v69.size.width = v37;
                v69.size.height = v39;
                MinY = CGRectGetMinY(v69);
                v70.origin.x = v44;
                v70.origin.y = v46;
                v70.size.width = v37;
                v70.size.height = v39;
                Width = CGRectGetWidth(v70);
                v71.origin.x = v44;
                v71.origin.y = v46;
                v71.size.width = v37;
                v71.size.height = v39;
                v73.size.height = CGRectGetHeight(v71);
                v73.origin.x = 0.0;
                v72.size.width = v61;
                v72.origin.x = v62;
                v72.origin.y = v13;
                v72.size.height = v15;
                v73.origin.y = MinY;
                v73.size.width = Width;
                if (CGRectIntersectsRect(v72, v73))
                  v49 = 1;
                else
                  v49 = 2;
              }
              else
              {
                v49 = 2;
              }
            }
            else
            {
              v49 = 1;
            }
            if (v49 != objc_msgSend(v23, "visibilityState"))
              objc_msgSend(v23, "setVisibilityState:", v49);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v57 = v23;
              objc_msgSend(v57, "componentViews");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "absoluteFrame");
              -[SXComponentController updateVisibilityStatesForComponentViews:parentComponent:withOffset:](self, "updateVisibilityStatesForComponentViews:parentComponent:withOffset:", v58, v57);

            }
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v18);
    }

  }
}

- (void)assistiveTechnologyStatusDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "assistiveTechnologyStatusDidChange");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[SXComponentController flattenedComponentViews](self, "flattenedComponentViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentController renderContentsIfNeededForComponents:](self, "renderContentsIfNeededForComponents:", v8);

}

- (void)updatePresentationStateForNestedComponentViews:(id)a3 presentationState:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SXComponentController updatePresentationStateForNestedComponentView:presentationState:](self, "updatePresentationStateForNestedComponentView:presentationState:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)updatePresentationStateForNestedComponentView:(id)a3 presentationState:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setPresentationState:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "componentViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentController updatePresentationStateForNestedComponentViews:presentationState:](self, "updatePresentationStateForNestedComponentViews:presentationState:", v6, a4);

  }
}

- (SXLayoutBlueprint)presentedBlueprint
{
  return self->_presentedBlueprint;
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (SXComponentViewEngine)componentViewEngine
{
  return self->_componentViewEngine;
}

- (void)setComponentViewEngine:(id)a3
{
  objc_storeStrong((id *)&self->_componentViewEngine, a3);
}

- (SXComponentHosting)host
{
  return (SXComponentHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableDictionary)mappedComponentViews
{
  return self->_mappedComponentViews;
}

- (void)setMappedComponentViews:(id)a3
{
  objc_storeStrong((id *)&self->_mappedComponentViews, a3);
}

- (NSMutableArray)sortedComponentViews
{
  return self->_sortedComponentViews;
}

- (void)setSortedComponentViews:(id)a3
{
  objc_storeStrong((id *)&self->_sortedComponentViews, a3);
}

- (NSMutableArray)nestedComponentViews
{
  return self->_nestedComponentViews;
}

- (void)setNestedComponentViews:(id)a3
{
  objc_storeStrong((id *)&self->_nestedComponentViews, a3);
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (SXPresentationAttributes)presentationAttributes
{
  return self->_presentationAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationAttributes, 0);
  objc_storeStrong((id *)&self->_nestedComponentViews, 0);
  objc_storeStrong((id *)&self->_sortedComponentViews, 0);
  objc_storeStrong((id *)&self->_mappedComponentViews, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_componentViewEngine, 0);
  objc_storeStrong((id *)&self->_flattenedComponentViews, 0);
  objc_storeStrong((id *)&self->_presentedBlueprint, 0);
}

@end
