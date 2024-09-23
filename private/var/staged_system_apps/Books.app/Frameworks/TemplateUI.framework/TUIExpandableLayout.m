@implementation TUIExpandableLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  TUIElementBehaviorArgumentsMap *v22;
  TUIElementTriggerBehaviorMap *v23;
  TUIElementActionTriggerHandler *v24;
  id v25;
  TUIElementActionTriggerHandler *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSMutableDictionary *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39;
  NSMutableDictionary *v40;
  const __CFString *v41;
  TUIElementBehaviorArgumentsMap *v42;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewState"));

  v9 = 0;
  if (a3 >= 4 && v8)
  {
    v10 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pointerRefId"));
    v13 = v12;
    v14 = v8;
    if (v12)
    {
      v15 = v12;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_moreChild);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "box"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "refId"));

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pointerStyle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUIPointer pointerWithRefId:style:](TUIPointer, "pointerWithRefId:style:", v15, v19));

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_2ACC4;
    v38[3] = &unk_23E2C8;
    v38[4] = self;
    v21 = v6;
    v39 = v21;
    v40 = v10;
    v34 = v10;
    objc_msgSend(v21, "evaluateWithPointer:block:", v20, v38);
    v41 = CFSTR("press");
    v22 = objc_alloc_init(TUIElementBehaviorArgumentsMap);
    v42 = v22;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));

    v35 = v6;
    v23 = -[TUIElementTriggerBehaviorMap initWithMap:]([TUIElementTriggerBehaviorMap alloc], "initWithMap:", v33);
    v24 = [TUIElementActionTriggerHandler alloc];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_2ADA0;
    v36[3] = &unk_23E2F0;
    v8 = v14;
    v25 = v14;
    v37 = v25;
    v26 = -[TUIElementActionTriggerHandler initWithActionsData:block:](v24, "initWithActionsData:block:", v23, v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    LOWORD(v32) = 0;
    LOBYTE(v31) = 0;
    LOBYTE(v30) = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUIControlView renderModelWithStateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:identifier:style:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:](TUIControlView, "renderModelWithStateToButtonAttributes:stateToRenderModel:imageModelIDToResource:actionHandler:viewState:linkEntities:type:role:userInterfaceStyle:enabled:pressScale:touchInsets:identifier:style:pointer:focusStyle:menu:contextMenuIsPrimaryAction:name:axAttributes:enableBackgroundForHighlightPreview:enableShadowForHighlightPreview:", 0, v34, 0, v26, v25, 0, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, 0,
                     0,
                     v30,
                     v28,
                     0,
                     v20,
                     0,
                     0,
                     v31,
                     0,
                     0,
                     v32));

    -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", v21);
    objc_msgSend(v9, "setSize:");

    v6 = v35;
  }

  return v9;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v3, "validatedIntrinsicWidthConsideringSpecified");

  return v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v3, "validatedIntrinsicHeightConsideringSpecified");

  return v4;
}

- (double)computedHeightAbovePivot
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v2, "computedHeightAbovePivot");
  v4 = v3;

  return v4;
}

- (void)onChildrenUpdated
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIExpandableLayout;
  -[TUILayout onChildrenUpdated](&v3, "onChildrenUpdated");
  objc_storeWeak((id *)&self->_expandableChild, 0);
  objc_storeWeak((id *)&self->_expandedContentChild, 0);
  objc_storeWeak((id *)&self->_moreChild, 0);
  self->_didExamineChildren = 0;
}

- (void)computeLayout
{
  unsigned int v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  TUIVStack *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  TUIVStack *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  _QWORD v58[2];

  v3 = -[TUIExpandableLayout _isExpanded](self, "_isExpanded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v5 = v3 ^ 1;
  if (v4)
    v6 = v3 ^ 1;
  else
    v6 = 0;

  if (v6 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout moreChild](self, "moreChild"));
    objc_msgSend(v7, "validateLayout");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout moreChild](self, "moreChild"));
    objc_msgSend(v8, "computedTransformedSize");
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
    objc_msgSend(v11, "setExpandableMoreWidth:", v10);

  }
  -[TUILayout flexedWidth](self, "flexedWidth");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v14, "setFlexedWidth:", v13);

  -[TUILayout flexedHeight](self, "flexedHeight");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v17, "setFlexedHeight:", v16);

  -[TUILayout computeWidth](self, "computeWidth");
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v20, "setContainingWidth:", v19);

  -[TUILayout containingHeight](self, "containingHeight");
  -[TUILayout containingHeight](self, "containingHeight");
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v23, "setContainingHeight:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v24, "validateLayout");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  objc_msgSend(v25, "computedTransformedSize");
  v27 = v26;
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v31 = objc_msgSend(v30, "expandableContentIsTruncated");

  v32 = v5 & v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout moreChild](self, "moreChild"));
  objc_msgSend(v33, "setHidden:", v6 & v32 ^ 1);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandedContentChild](self, "expandedContentChild"));
  objc_msgSend(v34, "setHidden:", v32);

  if ((((v6 & v32) ^ 1) & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
    objc_msgSend(v35, "expandableMoreXOffset");
    v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
    objc_msgSend(v38, "computedOrigin");
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
    objc_msgSend(v41, "computedHeightAbovePivot");
    v43 = v40 + v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout moreChild](self, "moreChild"));
    objc_msgSend(v44, "computedHeightAbovePivot");
    v46 = v43 - v45;

    v47 = (TUIVStack *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout moreChild](self, "moreChild"));
    -[TUIVStack setComputedOrigin:](v47, "setComputedOrigin:", v37, v46);
LABEL_11:

    goto LABEL_12;
  }
  v48 = objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandedContentChild](self, "expandedContentChild"));
  if (v48)
  {
    v49 = (void *)v48;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandedContentChild](self, "expandedContentChild"));
    v51 = objc_msgSend(v50, "hidden");

    if ((v51 & 1) == 0)
    {
      v52 = [TUIVStack alloc];
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
      v58[0] = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandedContentChild](self, "expandedContentChild"));
      v58[1] = v54;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 2));
      v47 = -[TUIVStack initWithLayout:children:](v52, "initWithLayout:children:", self, v55);

      -[TUILayout flexedHeight](self, "flexedHeight");
      -[TUIVStack setFlexedHeight:](v47, "setFlexedHeight:");
      -[TUIVStack setWidth:](v47, "setWidth:", v19);
      -[TUIVStack computeLayoutWithOffset:](v47, "computeLayoutWithOffset:", CGPointZero.x, CGPointZero.y);
      -[TUIVStack computedSize](v47, "computedSize");
      v27 = v56;
      v29 = v57;
      goto LABEL_11;
    }
  }
LABEL_12:
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v27, v29);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v3, "computedContentWidth");

  return v4;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  void *v3;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v4 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v3, "computedContentHeight");

  return v4;
}

- (id)guideProviderForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guideProviderForLayout:", v4));

  return v6;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6;
  TUIExpandableLayout *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (TUIExpandableLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAncestor"));
  if (v7 == self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "box"));
    if (objc_msgSend(v9, "role"))
    {
      v8 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
      v8 = objc_msgSend(v10, "shouldUseDefaultGuideForLayout:edge:", self, a4);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)effectiveGuideTop
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideTop"));

  return v3;
}

- (id)effectiveGuideBottom
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideBottom"));

  return v3;
}

- (id)effectiveGuideLeading
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideLeading"));

  return v3;
}

- (id)effectiveGuideTrailing
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIExpandableLayout expandableChild](self, "expandableChild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveGuideTrailing"));

  return v3;
}

- (TUIExpandableContentLayout)expandableChild
{
  -[TUIExpandableLayout _examineChildrenIfNeeded](self, "_examineChildrenIfNeeded");
  return (TUIExpandableContentLayout *)objc_loadWeakRetained((id *)&self->_expandableChild);
}

- (TUILayout)moreChild
{
  -[TUIExpandableLayout _examineChildrenIfNeeded](self, "_examineChildrenIfNeeded");
  return (TUILayout *)objc_loadWeakRetained((id *)&self->_moreChild);
}

- (void)_examineChildrenIfNeeded
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  TUILayout **p_expandedContentChild;
  id WeakRetained;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  char *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[16];
  _BYTE v41[16];
  _BYTE v42[16];
  _BYTE v43[16];
  _BYTE v44[128];

  if (!-[TUIExpandableLayout didExamineChildren](self, "didExamineChildren"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (!v4)
      goto LABEL_28;
    v5 = v4;
    v6 = *(_QWORD *)v37;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "box"));
        v10 = objc_msgSend(v9, "role");

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "box"));
          v12 = (char *)objc_msgSend(v11, "role");

          if (v12 == (_BYTE *)&dword_0 + 2)
          {
            p_expandedContentChild = &self->_expandedContentChild;
            WeakRetained = objc_loadWeakRetained((id *)&self->_expandedContentChild);

            if (WeakRetained)
            {
              v15 = TUIDefaultLog();
              v16 = objc_claimAutoreleasedReturnValue(v15);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                sub_17D510((uint64_t)v41, (uint64_t)self);
              goto LABEL_24;
            }
          }
          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "box"));
            v33 = (char *)objc_msgSend(v32, "role");

            if (v33 != (_BYTE *)&dword_4 + 1)
              continue;
            p_expandedContentChild = &self->_moreChild;
            v34 = objc_loadWeakRetained((id *)&self->_moreChild);

            if (v34)
            {
              v35 = TUIDefaultLog();
              v16 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                sub_17D55C((uint64_t)v40, (uint64_t)self);
LABEL_24:

            }
          }
          objc_storeWeak((id *)p_expandedContentChild, v8);
          continue;
        }
        v17 = objc_loadWeakRetained((id *)&self->_expandableChild);

        if (v17)
        {
          v19 = TUIDefaultLog();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_17D4C4((uint64_t)v43, (uint64_t)self);

        }
        v21 = objc_opt_class(TUILayout, v18);
        v27 = TUIClassAndProtocolCast(v8, v21, 1, v22, v23, v24, v25, v26, (uint64_t)&OBJC_PROTOCOL___TUIExpandableContentLayout);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        objc_storeWeak((id *)&self->_expandableChild, v28);

        v29 = objc_loadWeakRetained((id *)&self->_expandableChild);
        if (!v29)
        {
          v30 = TUIDefaultLog();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_17D478((uint64_t)v42, (uint64_t)self);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (!v5)
      {
LABEL_28:

        -[TUIExpandableLayout setDidExamineChildren:](self, "setDidExamineChildren:", 1);
        return;
      }
    }
  }
}

- (BOOL)_isExpanded
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "value"));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setExpandableChild:(id)a3
{
  objc_storeWeak((id *)&self->_expandableChild, a3);
}

- (TUILayout)expandedContentChild
{
  return (TUILayout *)objc_loadWeakRetained((id *)&self->_expandedContentChild);
}

- (void)setExpandedContentChild:(id)a3
{
  objc_storeWeak((id *)&self->_expandedContentChild, a3);
}

- (void)setMoreChild:(id)a3
{
  objc_storeWeak((id *)&self->_moreChild, a3);
}

- (BOOL)didExamineChildren
{
  return self->_didExamineChildren;
}

- (void)setDidExamineChildren:(BOOL)a3
{
  self->_didExamineChildren = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moreChild);
  objc_destroyWeak((id *)&self->_expandedContentChild);
  objc_destroyWeak((id *)&self->_expandableChild);
}

@end
