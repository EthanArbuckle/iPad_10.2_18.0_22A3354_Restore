@implementation _TVProductStackView

+ (id)productStackViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVProductStackView *v7;
  _TVProductStackView *v8;
  _TVProductStackView *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *m;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  id v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  _TVProductStackView *v76;
  id v78;
  void *v79;
  id v80;
  id v81;
  int v82;
  _TVProductStackView *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  id obj;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVProductStackView *)v6;
  }
  else
  {
    v8 = [_TVProductStackView alloc];
    v7 = -[_TVFocusRedirectView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  v85 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v81 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = v11 - 1;
  v83 = v9;
  if (v11 - 1 < 0)
  {
    v21 = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v5, "children");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "tv_elementType") == 44)
      {
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        objc_msgSend(v14, "children");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v110;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v110 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
              if (objc_msgSend(v20, "tv_elementType") == 7 || objc_msgSend(v20, "tv_elementType") == 6)
              {
                v21 = v14;
                v9 = v83;
                goto LABEL_19;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
            v21 = 0;
            v9 = v83;
            if (v17)
              continue;
            break;
          }
        }
        else
        {
          v21 = 0;
        }
LABEL_19:

      }
      else
      {
        v21 = 0;
      }

      v22 = v12-- < 1;
    }
    while (!v22 && !v21);
  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v21, "children");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
  v78 = v6;
  v89 = v21;
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v106;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v106 != v26)
          objc_enumerationMutation(v23);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "tv_elementType", v78) == 7)
        {
          v82 = 0;
          goto LABEL_34;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
      if (v25)
        continue;
      break;
    }
  }
  v82 = 1;
LABEL_34:

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v5, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
  v29 = v81;
  if (!v28)
  {
    v86 = 0;
    v87 = 0;
    v84 = 0;
    v88 = 0;
    v90 = 0;
    v91 = 0;
    goto LABEL_106;
  }
  v30 = v28;
  v86 = 0;
  v87 = 0;
  v84 = 0;
  v88 = 0;
  v90 = 0;
  v91 = 0;
  v31 = *(_QWORD *)v102;
  v80 = v5;
  do
  {
    for (k = 0; k != v30; ++k)
    {
      if (*(_QWORD *)v102 != v31)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
      v34 = objc_msgSend(v33, "tv_elementType", v78);
      if (v34 != 55)
      {
        if (v34 == 16)
        {
          if (!v91)
          {
            if (objc_msgSend(v33, "tv_imageType"))
              v91 = 0;
            else
              v91 = v33;
          }
          continue;
        }
LABEL_49:
        if (objc_msgSend(v5, "updateType") == 1)
        {
          if (v33 == v89)
          {
            -[_TVProductStackView buttonsRowView](v9, "buttonsRowView");
            v38 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v33, "updateType"))
              goto LABEL_52;
            -[_TVProductStackView descriptionView](v9, "descriptionView");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "tv_associatedIKViewElement");
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40 != v33
              || (-[_TVProductStackView descriptionView](v9, "descriptionView"),
                  (v38 = (id)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v99 = 0u;
              v100 = 0u;
              v97 = 0u;
              v98 = 0u;
              -[_TVProductStackView viewsAboveDescription](v9, "viewsAboveDescription");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v98;
LABEL_57:
                v45 = 0;
                while (1)
                {
                  if (*(_QWORD *)v98 != v44)
                    objc_enumerationMutation(v41);
                  v46 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v45);
                  objc_msgSend(v46, "tv_associatedIKViewElement");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v47 == v33)
                    break;
                  if (v43 == ++v45)
                  {
                    v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
                    v29 = v81;
                    if (v43)
                      goto LABEL_57;
                    goto LABEL_63;
                  }
                }
                v38 = v46;

                v5 = v80;
                v29 = v81;
                v9 = v83;
                if (v38)
                  goto LABEL_80;
              }
              else
              {
LABEL_63:

                v5 = v80;
                v9 = v83;
              }
              v95 = 0u;
              v96 = 0u;
              v93 = 0u;
              v94 = 0u;
              -[_TVProductStackView viewsBelowDescription](v9, "viewsBelowDescription");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (id)objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
              if (v38)
              {
                v49 = *(_QWORD *)v94;
                while (2)
                {
                  for (m = 0; m != v38; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v94 != v49)
                      objc_enumerationMutation(v48);
                    v51 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)m);
                    objc_msgSend(v51, "tv_associatedIKViewElement");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v52 == v33)
                    {
                      v38 = v51;
                      goto LABEL_78;
                    }
                  }
                  v38 = (id)objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
                  if (v38)
                    continue;
                  break;
                }
LABEL_78:
                v5 = v80;
                v29 = v81;
                v9 = v83;
              }

            }
          }
        }
        else
        {
LABEL_52:
          v38 = 0;
        }
LABEL_80:
        +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "_viewFromElement:existingView:", v33, v38);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          if (objc_msgSend(v33, "tv_elementType") == 44)
          {
            if (!v86)
            {
              if (objc_msgSend(v54, "canBecomeFocused"))
                v86 = v54;
              else
                v86 = 0;
            }
            objc_msgSend(v33, "style");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "tv_height");
            v57 = v56;

            objc_msgSend(v33, "style");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "tv_interitemSpacing");
            v60 = v59;

            if (v33 == v89)
            {
              v61 = v54;

              objc_msgSend(v61, "setContentVerticalAlignment:", 1);
              objc_msgSend(v61, "_setSpeedBumpEdges:", 5);
              v84 = v61;
            }
            if (v57 == 0.0 || v60 == 0.0)
            {
              v62 = v82;
              if (v33 != v89)
                v62 = 1;
              if (v62)
                v63 = &unk_24EBCD5B8;
              else
                v63 = &unk_24EBCD598;
              objc_msgSend(v54, "setValue:forTVViewStyle:", v63, CFSTR("height"));
              objc_msgSend(v54, "setValue:forTVViewStyle:", &unk_24EBCD5A8, CFSTR("tv-interitem-spacing"));
            }
          }
          if (v90)
            v64 = v29;
          else
            v64 = v85;
          objc_msgSend(v64, "addObject:", v54);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = v54;

            v88 = v65;
          }
        }

        continue;
      }
      if (objc_msgSend(v33, "tv_textStyle") != 1)
      {
        if (objc_msgSend(v33, "tv_textStyle") == 3)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVProductStackView descriptionView](v9, "descriptionView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_viewFromElement:existingView:", v33, v36);
          v37 = objc_claimAutoreleasedReturnValue();

          v90 = v37;
          continue;
        }
        goto LABEL_49;
      }
      if (!v87)
        v87 = v33;
    }
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
  }
  while (v30);
LABEL_106:

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
    v67 = v91;
  else
    v67 = v87;
  -[_TVProductStackView titleView](v9, "titleView", v78);
  v68 = v29;
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "_viewFromElement:existingView:", v67, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVProductStackView setTitleView:](v9, "setTitleView:", v70);
  -[_TVProductStackView setButtonsRowView:](v9, "setButtonsRowView:", v84);
  -[_TVProductStackView setViewsAboveDescription:](v9, "setViewsAboveDescription:", v85);
  -[_TVProductStackView setDescriptionView:](v9, "setDescriptionView:", v90);
  -[_TVProductStackView setViewsBelowDescription:](v9, "setViewsBelowDescription:", v68);
  v71 = v86;
  if (v88)
    v71 = v88;
  if (v84)
    v72 = v84;
  else
    v72 = v71;
  -[_TVProductStackView setInitialFocusView:](v9, "setInitialFocusView:", v72);
  -[_TVProductStackView setStackElement:](v9, "setStackElement:", v5);
  -[_TVProductStackView initialFocusView](v9, "initialFocusView");
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = v73 | v90;

  if (!v74)
  {
    -[_TVFocusRedirectView containerGuide](v9, "containerGuide");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setEnabled:", 0);

  }
  v76 = v9;

  return v76;
}

- (id)preferredFocusEnvironments
{
  UIView **p_lastFocusedView;
  UIView *lastFocusedView;
  UIView *initialFocusView;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  p_lastFocusedView = &self->_lastFocusedView;
  lastFocusedView = self->_lastFocusedView;
  if (!lastFocusedView)
  {
    initialFocusView = self->_initialFocusView;
    if (!initialFocusView)
      initialFocusView = self->_descriptionView;
    objc_storeStrong((id *)&self->_lastFocusedView, initialFocusView);
    lastFocusedView = *p_lastFocusedView;
    if (!*p_lastFocusedView)
      return MEMORY[0x24BDBD1A8];
  }
  v6[0] = lastFocusedView;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  _BOOL4 v5;
  UIView *v6;
  _BOOL4 v7;
  UIView *buttonsRowView;
  UIView *v9;
  UIView *lastFocusedView;
  UIView *v11;

  objc_msgSend(a3, "nextFocusedView");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIView isDescendantOfView:](v11, "isDescendantOfView:", self);
  v6 = v11;
  if (v5)
  {
    v7 = -[UIView isDescendantOfView:](v11, "isDescendantOfView:", self->_buttonsRowView);
    buttonsRowView = v11;
    if (v7)
      buttonsRowView = self->_buttonsRowView;
    v9 = buttonsRowView;
    lastFocusedView = self->_lastFocusedView;
    self->_lastFocusedView = v9;

    v6 = v11;
  }

}

- (void)setTitleView:(id)a3
{
  UIView *v5;
  UIView *titleView;
  UIView *v7;

  v5 = (UIView *)a3;
  titleView = self->_titleView;
  v7 = v5;
  if (titleView != v5)
  {
    -[UIView removeFromSuperview](titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    if (self->_titleView)
      -[_TVProductStackView addSubview:](self, "addSubview:");
  }
  -[_TVProductStackView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setViewsAboveDescription:(id)a3
{
  id v5;
  NSArray **p_viewsAboveDescription;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_viewsAboveDescription = &self->_viewsAboveDescription;
  if (!-[NSArray isEqualToArray:](self->_viewsAboveDescription, "isEqualToArray:", v5))
  {
    -[NSArray makeObjectsPerformSelector:](*p_viewsAboveDescription, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&self->_viewsAboveDescription, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *p_viewsAboveDescription;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[_TVProductStackView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  -[_TVProductStackView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

}

- (void)setDescriptionView:(id)a3
{
  UIView *v5;
  UIView **p_descriptionView;
  UIView *descriptionView;
  BOOL v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_descriptionView = &self->_descriptionView;
  descriptionView = self->_descriptionView;
  if (descriptionView != v5)
  {
    v9 = v5;
    if (descriptionView)
      v8 = self->_lastFocusedView == descriptionView;
    else
      v8 = 0;
    if (v8)
    {
      objc_storeStrong((id *)&self->_lastFocusedView, a3);
      -[_TVProductStackView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
      descriptionView = *p_descriptionView;
    }
    -[UIView removeFromSuperview](descriptionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_descriptionView, a3);
    if (*p_descriptionView)
      -[_TVProductStackView addSubview:](self, "addSubview:");
    -[_TVProductStackView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setViewsBelowDescription:(id)a3
{
  id v5;
  NSArray **p_viewsBelowDescription;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_viewsBelowDescription = &self->_viewsBelowDescription;
  if (!-[NSArray isEqualToArray:](self->_viewsBelowDescription, "isEqualToArray:", v5))
  {
    -[NSArray makeObjectsPerformSelector:](*p_viewsBelowDescription, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    objc_storeStrong((id *)&self->_viewsBelowDescription, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *p_viewsBelowDescription;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[_TVProductStackView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  -[_TVProductStackView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v12);

}

- (void)setButtonsRowView:(id)a3
{
  UIView *v5;
  UIView *buttonsRowView;
  UIView *v8;

  v5 = (UIView *)a3;
  buttonsRowView = self->_buttonsRowView;
  if (self->_lastFocusedView == buttonsRowView && buttonsRowView != 0)
  {
    objc_storeStrong((id *)&self->_lastFocusedView, a3);
    -[_TVProductStackView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  v8 = self->_buttonsRowView;
  self->_buttonsRowView = v5;

}

- (void)setInitialFocusView:(id)a3
{
  UIView *v5;
  UIView *initialFocusView;
  UIView *lastFocusedView;
  BOOL v8;
  UIView *v9;

  v5 = (UIView *)a3;
  initialFocusView = self->_initialFocusView;
  if (initialFocusView != v5)
  {
    v9 = v5;
    lastFocusedView = self->_lastFocusedView;
    if (initialFocusView)
      v8 = lastFocusedView == 0;
    else
      v8 = 1;
    if (!v8
      && (lastFocusedView == initialFocusView || -[UIView isDescendantOfView:](lastFocusedView, "isDescendantOfView:")))
    {
      objc_storeStrong((id *)&self->_lastFocusedView, a3);
      -[_TVProductStackView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    }
    objc_storeStrong((id *)&self->_initialFocusView, a3);
    v5 = v9;
  }

}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v70 = *MEMORY[0x24BDAC8D0];
  v67.receiver = self;
  v67.super_class = (Class)_TVProductStackView;
  -[_TVFocusRedirectView layoutSubviews](&v67, sel_layoutSubviews);
  -[_TVProductStackView bounds](self, "bounds");
  x = v71.origin.x;
  y = v71.origin.y;
  width = v71.size.width;
  height = v71.size.height;
  v7 = CGRectGetHeight(v71);
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  v8 = CGRectGetWidth(v72);
  -[UIView tv_itemHeight](self->_titleView, "tv_itemHeight");
  v10 = v9;
  -[UIView tv_margin](self->_titleView, "tv_margin");
  v12 = v11;
  v58 = v13;
  v73.origin.x = x;
  v73.origin.y = y;
  v73.size.width = width;
  v73.size.height = height;
  v14 = CGRectGetWidth(v73);
  -[UIView tv_associatedIKViewElement](self->_titleView, "tv_associatedIKViewElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "tv_elementType");

  v17 = 0.0;
  if (v16 == 55)
  {
    -[UIView sizeThatFits:](self->_titleView, "sizeThatFits:", v14, v10);
    v19 = v18;
    v20 = fmax(v10 - v18, 0.0);
    v21 = fmin(v10, v19);
  }
  else
  {
    v21 = v10;
    v20 = 0.0;
  }
  -[UIView setFrame:](self->_titleView, "setFrame:", v12, v20, v14, v21);
  v22 = v58 + v10 + v12;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v23 = self->_viewsAboveDescription;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v64;
    do
    {
      v27 = 0;
      v28 = v17;
      do
      {
        if (*(_QWORD *)v64 != v26)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v27);
        objc_msgSend(v29, "tv_itemHeight");
        v31 = v30;
        objc_msgSend(v29, "tv_margin");
        v17 = v32;
        v34 = v22 + fmax(v28, v33);
        objc_msgSend(v29, "sizeThatFits:", v8, v31);
        if (v31 == 0.0)
          v31 = v35;
        objc_msgSend(v29, "setFrame:", 0.0, v34, v8, v31);
        v22 = v34 + v31;
        ++v27;
        v28 = v17;
      }
      while (v25 != v27);
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v25);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[NSArray reverseObjectEnumerator](self->_viewsBelowDescription, "reverseObjectEnumerator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v60;
    v40 = 0.0;
    do
    {
      v41 = 0;
      v42 = v40;
      do
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(v36);
        v43 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v41);
        objc_msgSend(v43, "tv_itemHeight");
        v45 = v44;
        objc_msgSend(v43, "tv_margin");
        v40 = v46;
        v48 = v47;
        objc_msgSend(v43, "sizeThatFits:", v8, v45);
        if (v45 == 0.0)
          v50 = v49;
        else
          v50 = v45;
        v7 = v7 - (fmax(v42, v48) + v50);
        objc_msgSend(v43, "setFrame:", 0.0, v7, v8);
        ++v41;
        v42 = v40;
      }
      while (v38 != v41);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v38);
  }
  else
  {
    v40 = 0.0;
  }

  -[UIView tv_margin](self->_descriptionView, "tv_margin");
  v52 = fmax(v51, v17);
  v54 = v7 - v40 - v22 - v52 - fmax(v53, v40);
  v55 = *MEMORY[0x24BDBF090];
  -[UIView sizeThatFits:](self->_descriptionView, "sizeThatFits:", v8, v54);
  -[UIView setFrame:](self->_descriptionView, "setFrame:", v55, v22 + v52, v56, v57);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVProductStackView stackElement](self, "stackElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVProductStackView titleView](self, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tv_impressionableElementsForDocument:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v10);

    -[_TVProductStackView descriptionView](self, "descriptionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tv_impressionableElementsForDocument:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[_TVProductStackView viewsAboveDescription](self, "viewsAboveDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v17), "tv_impressionableElementsForDocument:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v15);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[_TVProductStackView viewsBelowDescription](self, "viewsBelowDescription", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v23), "tv_impressionableElementsForDocument:", v4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (NSArray)viewsAboveDescription
{
  return self->_viewsAboveDescription;
}

- (UIView)descriptionView
{
  return self->_descriptionView;
}

- (NSArray)viewsBelowDescription
{
  return self->_viewsBelowDescription;
}

- (UIView)buttonsRowView
{
  return self->_buttonsRowView;
}

- (UIView)initialFocusView
{
  return self->_initialFocusView;
}

- (IKViewElement)stackElement
{
  return self->_stackElement;
}

- (void)setStackElement:(id)a3
{
  objc_storeStrong((id *)&self->_stackElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackElement, 0);
  objc_storeStrong((id *)&self->_initialFocusView, 0);
  objc_storeStrong((id *)&self->_buttonsRowView, 0);
  objc_storeStrong((id *)&self->_viewsBelowDescription, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_viewsAboveDescription, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_lastFocusedView, 0);
}

@end
