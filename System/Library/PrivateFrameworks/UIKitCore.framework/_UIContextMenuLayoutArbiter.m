@implementation _UIContextMenuLayoutArbiter

- (_UIContextMenuLayoutArbiter)initWithContainerView:(id)a3 layout:(unint64_t)a4
{
  id v6;
  _UIContextMenuLayoutArbiter *v7;
  _UIContextMenuLayoutArbiter *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIContextMenuLayoutArbiter;
  v7 = -[_UIContextMenuLayoutArbiter init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_UIContextMenuLayoutArbiter setContainerView:](v7, "setContainerView:", v6);
    -[_UIContextMenuLayoutArbiter setCurrentLayout:](v8, "setCurrentLayout:", a4);
    v8->_menuAnchor.gravity = 0;
    *(_OWORD *)&v8->_menuAnchor.attachment = _UIContextMenuNullAnchor_0;
    *(_OWORD *)&v8->_menuAnchor.attachmentOffset = unk_18667CE40;
  }

  return v8;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)menuAnchor
{
  int64_t *p_var4;
  $9638EFF0CCCAFE90921E224CC361F7AC *v5;
  __int128 v6;

  p_var4 = &self->var4;
  if (self->var4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = self;
    self = ($9638EFF0CCCAFE90921E224CC361F7AC *)-[$9638EFF0CCCAFE90921E224CC361F7AC _defaultAttachmentEdge](self, "_defaultAttachmentEdge");
    v5->var4 = (int64_t)self;
  }
  v6 = *((_OWORD *)p_var4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)p_var4;
  *(_OWORD *)&retstr->var2 = v6;
  retstr->var4 = p_var4[4];
  return self;
}

- (id)computedLayoutWithInput:(id)a3
{
  id v4;
  CGSize v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  CGSize v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
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
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  void *v74;
  int v75;
  double v76;
  void *v77;
  CGPoint origin;
  CGSize size;
  double v80;
  CGFloat Height;
  double v82;
  double v83;
  double v84;
  double v85;
  CGFloat x;
  CGFloat y;
  CGSize v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  void *v92;
  __int128 v94;
  __int128 v95;
  double v96;
  __int128 v97;
  CGFloat v98;
  double v99;
  uint64_t v100;
  _OWORD v101[2];
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  _BYTE v106[128];
  _BYTE v107[128];
  __int128 v108;
  CGSize v109;
  double v110;
  double v111;
  __int128 v112;
  uint64_t v113;
  CGAffineTransform v114;
  uint64_t v115;
  CGAffineTransform v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  v4 = a3;
  -[_UIContextMenuLayoutArbiter setCurrentInput:](self, "setCurrentInput:", v4);
  v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v118.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v118.size = v5;
  objc_msgSend(v4, "preferredMenuSize");
  v117.origin.x = 0.0;
  v117.origin.y = 0.0;
  v117.size.width = v6;
  v117.size.height = v7;
  if ((objc_msgSend(v4, "shouldUpdateAttachment") & 1) != 0
    || self->_menuAnchor.attachment == 0x7FFFFFFFFFFFFFFFLL && self->_menuAnchor.alignment == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "preferredAnchor");
    }
    else
    {
      v110 = 0.0;
      v108 = 0u;
      v109 = (CGSize)0;
    }
    v10 = v109;
    *(_OWORD *)&self->_menuAnchor.attachment = v108;
    *(CGSize *)&self->_menuAnchor.attachmentOffset = v10;
    *(double *)&self->_menuAnchor.gravity = v110;

  }
  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v20, "userInterfaceIdiom"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sourcePreview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "target");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v11;
  objc_msgSend(v23, "center");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v23, "container");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = _UIContextMenuConvertPointBetweenViews(v29, v24, v26, v28);
  v96 = v30;

  objc_msgSend(v4, "sourcePreview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "target");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v24;
  objc_msgSend((id)v32, "center");
  v35 = v34;
  v37 = v36;
  objc_msgSend((id)v32, "container");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuConvertPointBetweenViews(v38, v33, v35, v37);

  -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[_UIContextMenuLayoutArbiter sourceWindowBounds](self, "sourceWindowBounds");
  -[_UIContextMenuLayoutArbiter _computedPreviewBoundsForContentBounds:sourceWindowBounds:](self, "_computedPreviewBoundsForContentBounds:sourceWindowBounds:", v40, v42, v44, v46, v47, v48, v49, v50);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v118.origin.x = v51;
  v118.origin.y = v53;
  v118.size.width = v55;
  v118.size.height = v57;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = objc_msgSend(v59, "_hasVisibleMenu");

  if ((v32 & 1) != 0)
  {
    objc_msgSend(v33, "_screen");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "scale");
    UIRectCenteredAboutPointScale(v52, v54, v56, v58, v99, v96, v61);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;

    -[_UIContextMenuLayoutArbiter _computedMenuBoundsForContentBounds:predictedPreviewFrame:](self, "_computedMenuBoundsForContentBounds:predictedPreviewFrame:", v13, v15, v17, v19, v63, v65, v67, v69);
    v117.origin.x = v70;
    v117.origin.y = v71;
    v117.size.width = v72;
    v117.size.height = v73;
  }
  -[_UIContextMenuLayoutArbiter _positionPlatterFrame:andActionViewFrame:inBounds:aboutSourcePoint:](self, "_positionPlatterFrame:andActionViewFrame:inBounds:aboutSourcePoint:", &v118, &v117, v13, v15, v17, v19, v99, v96);
  -[_UIContextMenuLayoutArbiter _drawContentBoundsDebugUI:](self, "_drawContentBoundsDebugUI:", v13, v15, v17, v19);
  v95 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v97 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v116.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v116.c = v95;
  v94 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v116.tx = v94;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "shouldConcealMenu");

  v76 = 1.0;
  if (v75)
  {
    v117.size.height = 22.0;
    CGAffineTransformMakeScale(&v116, 0.2, 0.2);
    v76 = 0.0;
  }
  v100 = *(_QWORD *)&v76;
  v77 = (void *)objc_opt_new();
  objc_msgSend(v77, "setType:", -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout"));
  -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds");
  objc_msgSend(v77, "setContentBounds:");
  origin = v118.origin;
  size = v118.size;
  v80 = origin.x + size.width * 0.5 + CGRectGetWidth(v118) * 0.0;
  v119.origin = origin;
  v119.size = size;
  Height = CGRectGetHeight(v119);
  *(_OWORD *)&v114.a = v97;
  *(_OWORD *)&v114.c = v95;
  *(_OWORD *)&v114.tx = v94;
  v108 = 0uLL;
  v109 = v118.size;
  v110 = v80;
  v111 = origin.y + size.height * 0.5 + Height * 0.0;
  v112 = xmmword_18667A4E0;
  v113 = 0x3FE0000000000000;
  v115 = 0x3FF0000000000000;
  _validatedItemLayout((uint64_t)v107, (uint64_t *)&v108, v4, CFSTR("Preview"));
  objc_msgSend(v77, "setPreview:", v107);
  -[_UIContextMenuLayoutArbiter _computedMenuAnchorPointForMenuFrame:previewFrame:](self, "_computedMenuAnchorPointForMenuFrame:previewFrame:", v117.origin.x, v117.origin.y, *(_OWORD *)&v117.size, *(_OWORD *)&v118.origin, *(_OWORD *)&v118.size);
  v83 = v82;
  v85 = v84;
  x = v117.origin.x;
  y = v117.origin.y;
  v88 = v117.size;
  v89 = v117.origin.x + v117.size.width * 0.5;
  v98 = v117.origin.y + v117.size.height * 0.5;
  v90 = v89 + (v82 + -0.5) * CGRectGetWidth(v117);
  v120.origin.x = x;
  v120.origin.y = y;
  v120.size = v88;
  v91 = CGRectGetHeight(v120);
  v114 = v116;
  v108 = 0uLL;
  v109 = v117.size;
  v110 = v90;
  v111 = v98 + (v85 + -0.5) * v91;
  *(_QWORD *)&v112 = 0;
  *((double *)&v112 + 1) = v83;
  v113 = *(_QWORD *)&v85;
  v115 = v100;
  _validatedItemLayout((uint64_t)v106, (uint64_t *)&v108, v4, CFSTR("Menu"));
  objc_msgSend(v77, "setMenu:", v106);
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  v101[0] = v103;
  v101[1] = v104;
  v102 = v105;
  objc_msgSend(v77, "setAnchor:", v101);
  -[_UIContextMenuLayoutArbiter _accessoryPositionsForBaseLayout:](self, "_accessoryPositionsForBaseLayout:", v77);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setAccessoryPositions:", v92);

  return v77;
}

- (double)_applyEdgeInsetsToBounds:(void *)a1
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
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  int v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  int v34;
  double v35;
  double v37;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "currentInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredEdgeInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(a1, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v7;
  v13 = v7 == 0.0;
  if (v5 != 0.0)
    v13 = 0;
  if (v11 != 0.0)
    v13 = 0;
  v14 = v9 == 0.0 && v13;
  objc_msgSend(a1, "currentInput", *(_QWORD *)&v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldAvoidInputViews");
  v17 = v12;
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;
  objc_msgSend(v17, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "verticalSizeClass");

  if (v21 != 1)
    v19 = v19 + 0.0;
  v22 = _UIContextMenuDefaultContentSpacing(v17);
  if (v16)
    _UIContextMenuInputViewOverlapBottomInsets(v17);
  v23 = fmax(v19, v22);

  if (!v14)
  {
    v24 = objc_msgSend(a1, "currentLayout");
    v25 = fmin(v37, v23);
    if (v24 == 3)
      v23 = v25;
    else
      v23 = v37;
  }
  objc_msgSend(v17, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v26, "userInterfaceIdiom"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "minimumContainerInsets");
  v29 = v28;

  objc_msgSend(v17, "safeAreaInsets");
  v31 = fmax(v23, fmax(v29, v30));
  if (v14)
  {
    v32 = a2;
  }
  else
  {
    objc_msgSend(a1, "currentInput");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "shouldAvoidInputViews");

    v32 = a2;
    if (v34)
      _UIContextMenuInputViewOverlapBottomInsets(v17);
  }
  v35 = v32 + v31;

  return v35;
}

- (CGRect)sourceWindowBounds
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
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
  double v25;
  CGRect result;

  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourcePreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "bounds");
    v5 = _UIContextMenuProjectFrameFromViewToView(v10, v3, v11, v12, v13, v14);
  }
  v15 = -[_UIContextMenuLayoutArbiter _applyEdgeInsetsToBounds:](self, v5);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)contentBounds
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = -[_UIContextMenuLayoutArbiter _applyEdgeInsetsToBounds:](self, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)contentBoundsForConstrainingPreview
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "previewIsConstrainedToSourceWindowBounds"))
    -[_UIContextMenuLayoutArbiter sourceWindowBounds](self, "sourceWindowBounds");
  else
    -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)contentSpacing
{
  unint64_t v3;
  double result;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v3 = -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout");
  result = 0.0;
  if (v3 != 3)
  {
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSpacing");
    v7 = fabs(v6);

    if (v7 < 2.22044605e-16)
    {
      -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = _UIContextMenuDefaultContentSpacing(v11);

      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredEdgeInsets");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      if (v21 == 0.0 && v17 == 0.0 && v15 == 0.0)
      {
        if (v17 >= v12)
          result = v12;
        else
          result = v17;
        if (v19 == 0.0)
          return v12;
      }
      else if (v17 >= v12)
      {
        return v12;
      }
      else
      {
        return v17;
      }
    }
    else
    {
      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredContentSpacing");
      v10 = v9;

      return v10;
    }
  }
  return result;
}

- (unint64_t)_defaultAttachmentEdge
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  CGFloat v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double Height;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGRect remainder;
  CGRect slice;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v66 = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasVisibleMenu");

  if (!v4)
  {
    v30 = 4;
    goto LABEL_20;
  }
  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourcePreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  objc_msgSend(v8, "center");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "container");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _UIContextMenuConvertPointBetweenViews(v14, v9, v11, v13);
  v17 = v16;

  objc_msgSend(v9, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredPreviewSize");
  v22 = v21;
  v24 = v23;
  v25 = v18;
  _UIContextMenuGetPlatformMetrics(v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "prefersWrapToSidesHandler");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (*(uint64_t (**)(uint64_t, id, double, double))(v27 + 16))(v27, v25, v22, v24);

    if ((v29 & 1) != 0)
      goto LABEL_16;
  }
  else
  {

  }
  v31 = objc_msgSend(v25, "horizontalSizeClass");
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "preferredMenuSize");
  v34 = v33;

  if (-[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout") == 1)
  {
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds");
    v35 = v17 - CGRectGetMinY(v67);
    -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds");
    CGRectDivide(v68, &slice, &remainder, v35, CGRectMinYEdge);
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "preferredPreviewSize");
    v38 = v37;
    -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
    v40 = v39;

    Height = CGRectGetHeight(slice);
    v42 = CGRectGetHeight(remainder);
    if (v31 != 2 || (v43 = v40 + v38 * 0.5, v34 <= Height - v43) || v34 <= v42 - v43)
    {
      v44 = CGRectGetHeight(slice);
      if (v44 > CGRectGetHeight(remainder))
        v30 = 1;
      else
        v30 = 4;
      goto LABEL_19;
    }
  }
  else
  {
    v30 = 4;
    if (v31 != 2 || v34 <= 135.0)
      goto LABEL_19;
  }
LABEL_16:
  objc_msgSend(v9, "bounds");
  if (v15 <= CGRectGetMidX(v69))
    v30 = 8;
  else
    v30 = 2;
LABEL_19:

LABEL_20:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "accessoryViews");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v47)
  {
    v48 = v47;
    v49 = 0;
    v50 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v60 != v50)
          objc_enumerationMutation(v46);
        v52 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if (objc_msgSend(v52, "location", v56, v57, v58) == 1)
        {
          if (v52)
          {
            objc_msgSend(v52, "anchor");
            v53 = v56;
          }
          else
          {
            v53 = 0;
            v58 = 0;
            v56 = 0u;
            v57 = 0u;
          }
          v49 |= v53;
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v48);
  }
  else
  {
    v49 = 0;
  }

  if ((v49 & v30) != 0)
  {
    v54 = v30 - 1;
    if (v30 - 1 <= 7 && ((0x8Bu >> v54) & 1) != 0)
      return qword_18667CE58[v54];
  }
  return v30;
}

- (unint64_t)_automaticAlignmentAndOffset:(double *)a3 forAttachment:(unint64_t)a4 sourcePoint:(CGPoint)a5
{
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v17;
  void *v18;
  void *v19;
  double Width;
  void *v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  x = a5.x;
  if (a4 != 4 && a4 != 1)
    return 1;
  -[_UIContextMenuLayoutArbiter contentBounds](self, "contentBounds", a5.x, a5.y);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout") == 3)
  {
    if (objc_msgSend((id)UIApp, "userInterfaceLayoutDirection"))
    {
      *a3 = -2.0;
      return 8;
    }
    else
    {
      *a3 = 2.0;
      return 2;
    }
  }
  else
  {
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sourcePreview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    Width = CGRectGetWidth(v23);
    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v22 = CGRectGetWidth(v24);

    if (Width < v22
      && (v25.origin.x = v9,
          v25.origin.y = v11,
          v25.size.width = v13,
          v25.size.height = v15,
          vabdd_f64(x, CGRectGetMidX(v25)) <= 1.0))
    {
      return 0;
    }
    else
    {
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      if (x <= CGRectGetMidX(v26))
        return 2;
      else
        return 8;
    }
  }
}

- (void)_positionPlatterFrame:(CGRect *)a3 andActionViewFrame:(CGRect *)a4 inBounds:(CGRect)a5 aboutSourcePoint:(CGPoint)a6
{
  double y;
  double height;
  double width;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t gravity;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  char v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double MinY;
  double MinX;
  CGFloat v50;
  CGFloat v51;
  unint64_t v52;
  NSObject *v53;
  _BOOL4 v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  CGFloat v60;
  CGFloat v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double MaxY;
  double v75;
  double v76;
  double MaxX;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  void *v105;
  void *v106;
  unint64_t v107;
  unint64_t v108;
  void *v109;
  void *v110;
  double v111;
  double MidX;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double MidY;
  CGFloat v134;
  char v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  void *v147;
  char v148;
  double v149;
  double v150;
  double v151;
  NSObject *v152;
  double v153;
  double v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  CGFloat v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double rect;
  double x;
  CGFloat v170;
  double v171;
  double v172;
  unint64_t v173;
  uint64_t v174;
  uint8_t buf[24];
  uint64_t v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;

  y = a6.y;
  x = a6.x;
  height = a5.size.height;
  width = a5.size.width;
  v159 = a5.origin.x;
  v160 = a5.origin.y;
  v176 = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_screen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;

  v16 = a3->origin.x;
  v17 = a3->origin.y;
  v18 = a3->size.width;
  v19 = a3->size.height;
  v167 = a4->origin.x;
  rect = a4->origin.y;
  v165 = a4->size.height;
  v166 = a4->size.width;
  v20 = -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout");
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  v21 = v174;
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  v22 = v173;
  if (v173 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)buf = 0;
    v22 = -[_UIContextMenuLayoutArbiter _automaticAlignmentAndOffset:forAttachment:sourcePoint:](self, "_automaticAlignmentAndOffset:forAttachment:sourcePoint:", buf, v174, x, y);
    self->_menuAnchor.alignment = v22;
    self->_menuAnchor.alignmentOffset = *(double *)buf;
  }
  v162 = v12;
  v157 = height;
  v158 = width;
  v161 = v15;
  if (-[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout") == 3)
    goto LABEL_36;
  gravity = self->_menuAnchor.gravity;
  if (gravity == 2)
    goto LABEL_8;
  if (!gravity)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    if ((v25 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "_hasVisibleMenu");

      if ((v27 & 1) == 0)
      {
LABEL_8:
        objc_msgSend(v12, "bounds");
        x = v29 + v28 * 0.5;
        y = v31 + v30 * 0.5;
      }
    }
  }
  objc_msgSend(v12, "_screen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  v155 = v19;
  v156 = v18;
  v163 = y;
  UIRectCenteredAboutPointScale(v16, v17, v18, v19, x, y, v33);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "shouldConcealMenu");

  if ((v43 & 1) == 0)
  {
    -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
    v153 = v17;
    v154 = v16;
    v45 = v44;
    switch(v174)
    {
      case 0:
        v47 = v165;
        v46 = v166;
        MinY = round(v37 + v41 * 0.5 - v165 * 0.5);
        MinX = round(v35 + v39 * 0.5 - v166 * 0.5);
        goto LABEL_14;
      case 1:
        v177.origin.x = v35;
        v177.origin.y = v37;
        v177.size.width = v39;
        v177.size.height = v41;
        MinX = CGRectGetMinX(v177);
        v178.origin.x = v35;
        v178.origin.y = v37;
        v178.size.width = v39;
        v178.size.height = v41;
        v50 = CGRectGetMinY(v178) - v45;
        v179.origin.x = MinX;
        v179.origin.y = rect;
        v47 = v165;
        v46 = v166;
        v179.size.width = v166;
        v179.size.height = v165;
        MinY = v50 - CGRectGetHeight(v179);
        goto LABEL_14;
      case 2:
        v180.origin.x = v35;
        v180.origin.y = v37;
        v180.size.width = v39;
        v180.size.height = v41;
        v51 = CGRectGetMinX(v180) - v45;
        v181.origin.x = v167;
        v181.origin.y = rect;
        v47 = v165;
        v46 = v166;
        v181.size.width = v166;
        v181.size.height = v165;
        MinX = v51 - CGRectGetWidth(v181);
        v182.origin.x = v35;
        v182.origin.y = v37;
        v182.size.width = v39;
        v182.size.height = v41;
        MinY = CGRectGetMinY(v182);
LABEL_14:
        height = v157;
        goto LABEL_23;
      case 4:
        v183.origin.x = v35;
        v183.origin.y = v37;
        v183.size.width = v39;
        v183.size.height = v41;
        MinX = CGRectGetMinX(v183);
        v184.origin.x = v35;
        v184.origin.y = v37;
        v184.size.width = v39;
        v184.size.height = v41;
        MinY = v45 + CGRectGetMaxY(v184);
        goto LABEL_22;
      case 8:
        v185.origin.x = v35;
        v185.origin.y = v37;
        v185.size.width = v39;
        v185.size.height = v41;
        MinX = v45 + CGRectGetMaxX(v185);
        v186.origin.x = v35;
        v186.origin.y = v37;
        v186.size.width = v39;
        v186.size.height = v41;
        MinY = CGRectGetMinY(v186);
        goto LABEL_22;
      default:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v152 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v152, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v174;
            _os_log_fault_impl(&dword_185066000, v152, OS_LOG_TYPE_FAULT, "_UIContextMenuLayoutArbiter Attempting to lay out with unsupported attachment edge: %lu", buf, 0xCu);
          }

          MinX = v167;
          MinY = rect;
LABEL_22:
          height = v157;
          v47 = v165;
          v46 = v166;
        }
        else
        {
          v52 = _CombinedActionsAndPreviewRect___s_category;
          height = v157;
          if (!_CombinedActionsAndPreviewRect___s_category)
          {
            v52 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v52, (unint64_t *)&_CombinedActionsAndPreviewRect___s_category);
          }
          v53 = *(NSObject **)(v52 + 8);
          v54 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
          MinX = v167;
          MinY = rect;
          v47 = v165;
          v46 = v166;
          if (v54)
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v174;
            _os_log_impl(&dword_185066000, v53, OS_LOG_TYPE_ERROR, "_UIContextMenuLayoutArbiter Attempting to lay out with unsupported attachment edge: %lu", buf, 0xCu);
            MinX = v167;
            MinY = rect;
          }
        }
LABEL_23:
        v187.origin.x = v35;
        v187.origin.y = v37;
        v187.size.width = v39;
        v187.size.height = v41;
        v55 = MinX;
        v56 = v46;
        v57 = v47;
        v188 = CGRectUnion(v187, *(CGRect *)(&MinY - 1));
        v35 = v188.origin.x;
        v37 = v188.origin.y;
        v39 = v188.size.width;
        v41 = v188.size.height;
        width = v158;
        v17 = v153;
        v16 = v154;
        break;
    }
  }
  objc_msgSend(v12, "traitCollection", *(_QWORD *)&v153, *(_QWORD *)&v154);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "verticalSizeClass");

  if (v59 != 1)
    goto LABEL_27;
  v60 = v159;
  v61 = v160;
  if (v20 != 1)
  {
    objc_msgSend(v12, "_screen");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "scale");
    v63 = v159 + width * 0.5;
    v64 = v160 + height * 0.5;
    height = v157;
    width = v158;
    UIRectCenteredAboutPointScale(v35, v37, v39, v41, v63, v64, v65);
    v35 = v66;
    v37 = v67;
    v39 = v68;
    v41 = v69;

LABEL_27:
    v60 = v159;
    v61 = v160;
  }
  v70 = _CGRectConstrainedWithinRect(15, v35, v37, v39, v41, v60, v61, width, height);
  v15 = v161;
  v19 = v155;
  v18 = v156;
  y = v163;
  switch(v174)
  {
    case 1:
      MaxY = CGRectGetMaxY(*(CGRect *)&v70);
      v189.origin.x = v16;
      v189.origin.y = v17;
      v189.size.width = v156;
      v189.size.height = v155;
      v75 = CGRectGetHeight(v189);
      v76 = -0.5;
      goto LABEL_32;
    case 2:
      MaxX = CGRectGetMaxX(*(CGRect *)&v70);
      v190.origin.x = v16;
      v190.origin.y = v17;
      v190.size.width = v156;
      v190.size.height = v155;
      v78 = CGRectGetWidth(v190);
      v79 = -0.5;
      goto LABEL_34;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_36;
    case 4:
      MaxY = CGRectGetMinY(*(CGRect *)&v70);
      v191.origin.x = v16;
      v191.origin.y = v17;
      v191.size.width = v156;
      v191.size.height = v155;
      v75 = CGRectGetHeight(v191);
      v76 = 0.5;
LABEL_32:
      y = MaxY + v75 * v76;
      goto LABEL_36;
    case 8:
      MaxX = CGRectGetMinX(*(CGRect *)&v70);
      v192.origin.x = v16;
      v192.origin.y = v17;
      v192.size.width = v156;
      v192.size.height = v155;
      v78 = CGRectGetWidth(v192);
      v79 = 0.5;
LABEL_34:
      x = MaxX + v78 * v79;
      break;
    default:
      v15 = v161;
      v19 = v155;
      v18 = v156;
      break;
  }
  y = v163;
LABEL_36:
  UIRectCenteredAboutPointScale(v16, v17, v18, v19, x, y, v15);
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v87 = v86;
  if (-[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout") == 3)
  {
    v170 = v85;
    v164 = v87;
  }
  else
  {
    -[_UIContextMenuLayoutArbiter contentBoundsForConstrainingPreview](self, "contentBoundsForConstrainingPreview");
    v81 = _CGRectConstrainedWithinRect(15, v81, v83, v85, v87, v88, v89, v90, v91);
    v83 = v92;
    v170 = v93;
    v164 = v94;
  }
  v95 = (double *)MEMORY[0x1E0C9D538];
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "preferredMenuAttachmentPoint");
  v98 = v97;
  v100 = v99;

  if (v98 != 1.79769313e308 || (v101 = v81, v102 = v83, v103 = v170, v104 = v164, v100 != 1.79769313e308))
  {
    v103 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v104 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "sourcePreview");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "target");
    v107 = v22;
    v108 = v20;
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "container");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = _UIContextMenuConvertPointBetweenViews(v110, v162, v98, v100);
    v102 = v111;

    v20 = v108;
    v22 = v107;
    v21 = v174;
    v95 = (double *)MEMORY[0x1E0C9D538];

  }
  MidX = *v95;
  switch(v21)
  {
    case 0:
      v193.origin.x = v101;
      v193.origin.y = v102;
      v193.size.width = v103;
      v193.size.height = v104;
      MidX = CGRectGetMidX(v193);
      if (v22)
      {
        v113 = v162;
        v114 = v161;
        goto LABEL_55;
      }
      v210.origin.x = v101;
      v210.origin.y = v102;
      v210.size.width = v103;
      v210.size.height = v104;
      MidY = CGRectGetMidY(v210);
      v135 = 15;
      v113 = v162;
      goto LABEL_65;
    case 1:
      v194.origin.x = v101;
      v194.origin.y = v102;
      v194.size.width = v103;
      v194.size.height = v104;
      v115 = CGRectGetMinY(v194);
      -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
      v117 = v115 - v116;
      v195.origin.x = v167;
      v195.origin.y = rect;
      v195.size.height = v165;
      v195.size.width = v166;
      v118 = CGRectGetHeight(v195);
      v119 = -0.5;
      goto LABEL_48;
    case 2:
      v196.origin.x = v101;
      v196.origin.y = v102;
      v196.size.width = v103;
      v196.size.height = v104;
      v120 = CGRectGetMinX(v196);
      -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
      v122 = v120 - v121;
      v197.origin.x = v167;
      v197.origin.y = rect;
      v197.size.height = v165;
      v197.size.width = v166;
      v123 = CGRectGetWidth(v197);
      v124 = -0.5;
      goto LABEL_53;
    case 4:
      v198.origin.x = v101;
      v198.origin.y = v102;
      v198.size.width = v103;
      v198.size.height = v104;
      v125 = CGRectGetMaxY(v198);
      -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
      v117 = v125 + v126;
      v199.origin.x = v167;
      v199.origin.y = rect;
      v199.size.height = v165;
      v199.size.width = v166;
      v118 = CGRectGetHeight(v199);
      v119 = 0.5;
LABEL_48:
      v127 = v117 + v118 * v119;
      v113 = v162;
      if (v22 == 8)
      {
        v206.origin.x = v101;
        v206.origin.y = v102;
        v206.size.width = v103;
        v206.size.height = v104;
        v136 = CGRectGetMaxX(v206);
        v207.origin.x = v167;
        v207.origin.y = rect;
        v207.size.height = v165;
        v207.size.width = v166;
        v137 = CGRectGetWidth(v207);
        v138 = -0.5;
      }
      else
      {
        if (v22 != 2)
        {
          if (!v22)
          {
            v200.origin.x = v101;
            v200.origin.y = v102;
            v200.size.width = v103;
            v200.size.height = v104;
            MidX = CGRectGetMidX(v200);
          }
LABEL_62:
          MidX = v171 + MidX;
          MidY = v172 + v127;
          if (v20)
            v135 = 15;
          else
            v135 = 11;
LABEL_65:
          v114 = v161;
          goto LABEL_66;
        }
        v208.origin.x = v101;
        v208.origin.y = v102;
        v208.size.width = v103;
        v208.size.height = v104;
        v136 = CGRectGetMinX(v208);
        v209.origin.x = v167;
        v209.origin.y = rect;
        v209.size.height = v165;
        v209.size.width = v166;
        v137 = CGRectGetWidth(v209);
        v138 = 0.5;
      }
      MidX = v136 + v137 * v138;
      goto LABEL_62;
    case 8:
      v201.origin.x = v101;
      v201.origin.y = v102;
      v201.size.width = v103;
      v201.size.height = v104;
      v128 = CGRectGetMaxX(v201);
      -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
      v122 = v128 + v129;
      v202.origin.x = v167;
      v202.origin.y = rect;
      v202.size.height = v165;
      v202.size.width = v166;
      v123 = CGRectGetWidth(v202);
      v124 = 0.5;
LABEL_53:
      MidX = v122 + v123 * v124;
      goto LABEL_54;
    default:
LABEL_54:
      v113 = v162;
      v114 = v161;
      if (v22)
      {
LABEL_55:
        v203.origin.x = v101;
        v203.origin.y = v102;
        v203.size.width = v103;
        v203.size.height = v104;
        v130 = CGRectGetMinY(v203);
        v204.origin.x = v167;
        v204.origin.y = rect;
        v132 = v165;
        v131 = v166;
        v204.size.width = v166;
        v204.size.height = v165;
        MidY = v130 + CGRectGetHeight(v204) * 0.5;
LABEL_58:
        v134 = v164;
        MidX = v172 + MidX;
        MidY = v171 + MidY;
        v135 = 15;
        goto LABEL_67;
      }
      v205.origin.x = v101;
      v205.origin.y = v102;
      v205.size.width = v103;
      v205.size.height = v104;
      MidY = CGRectGetMidY(v205);
      if (v21)
      {
        v132 = v165;
        v131 = v166;
        goto LABEL_58;
      }
      v135 = 15;
LABEL_66:
      v132 = v165;
      v131 = v166;
      v134 = v164;
LABEL_67:
      UIRectCenteredAboutPointScale(v167, rect, v131, v132, MidX, MidY, v114);
      v140 = v139;
      v142 = v141;
      v144 = v143;
      v146 = v145;
      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend(v147, "shouldConcealMenu");

      if ((v148 & 1) == 0)
      {
        v140 = _CGRectConstrainedWithinRect(v135, v140, v142, v144, v146, v159, v160, v158, v157);
        v142 = v149;
        v144 = v150;
        v146 = v151;
      }
      a3->origin.x = v81;
      a3->origin.y = v83;
      a3->size.width = v170;
      a3->size.height = v134;
      a4->origin.x = v140;
      a4->origin.y = v142;
      a4->size.width = v144;
      a4->size.height = v146;

      return;
  }
}

- (CGRect)_computedPreviewBoundsForContentBounds:(CGRect)a3 sourceWindowBounds:(CGRect)a4
{
  double height;
  double width;
  double v6;
  double v7;
  CGFloat y;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  unint64_t v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double x;
  CGFloat v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
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
  CGFloat v68;
  CGFloat rect;
  CGAffineTransform rect_8;
  CGAffineTransform v71;
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  v6 = a3.size.height;
  v7 = a3.size.width;
  y = a3.origin.y;
  rect = a3.origin.x;
  v10 = a3.size.width;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredMenuSize");
  v13 = v12;

  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  if (fabs(v13) >= 2.22044605e-16 && (v72 == 8 || v72 == 2))
  {
    -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
    v10 = v7 - (v13 + v15);
  }
  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v17, "userInterfaceIdiom"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "previewIsConstrainedToSourceWindowBounds");
  if ((v19 & (height < v6)) == 0)
    height = v6;
  if ((v19 & (width < v10)) != 0)
    v10 = width;
  v20 = -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout");
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredPreviewSize");
  v23 = v22;
  v25 = v24;

  v68 = v10;
  if (v20 == 1)
  {
    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v27, "userInterfaceIdiom"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "maxLiftScale");
    v30 = v29;
    objc_msgSend(v28, "maxLiftScaleUpPoints");
    v66 = v31;
    v73.origin.x = 0.0;
    v73.origin.y = 0.0;
    v73.size.width = v23;
    v73.size.height = v25;
    v67 = height;
    v32 = CGRectGetWidth(v73);
    v74.origin.x = 0.0;
    v74.origin.y = 0.0;
    v74.size.width = v23;
    v74.size.height = v25;
    v33 = CGRectGetHeight(v74);
    if (v32 >= v33)
      v34 = v32;
    else
      v34 = v33;
    v75.origin.x = rect;
    v75.origin.y = y;
    v75.size.width = v7;
    v75.size.height = v6;
    v35 = CGRectGetWidth(v75) / v32;
    height = v67;
    if (v35 >= v30)
      v35 = v30;
    if ((v66 + v34) / v34 >= v35)
      v36 = v35;
    else
      v36 = (v66 + v34) / v34;

    memset(&v71, 0, sizeof(v71));
    v37 = v36;
    v38 = v36;
    v10 = v68;
    CGAffineTransformMakeScale(&v71, v37, v38);
    rect_8 = v71;
    v76.origin.x = 0.0;
    v76.origin.y = 0.0;
    v76.size.width = v23;
    v76.size.height = v25;
    v77 = CGRectApplyAffineTransform(v76, &rect_8);
    x = v77.origin.x;
    v40 = v77.origin.y;
    v23 = v77.size.width;
    v25 = v77.size.height;
  }
  else
  {
    v40 = 0.0;
    v78.origin.x = 0.0;
    v78.origin.y = 0.0;
    v78.size.width = v23;
    v78.size.height = v25;
    if (CGRectIsEmpty(v78)
      || (v79.origin.x = 0.0,
          v79.origin.y = 0.0,
          v79.size.width = v23,
          v79.size.height = v25,
          x = 0.0,
          CGRectIsInfinite(v79)))
    {
      v25 = height;
      v23 = v10;
      v40 = y;
      x = rect;
    }
  }
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput", *(_QWORD *)&v66);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "preferredPreviewFittingStrategy");

  if (v42 == 1)
  {
    v80.origin.x = rect;
    v80.origin.y = y;
    v80.size.width = v10;
    v80.size.height = height;
    v43 = CGRectGetWidth(v80);
    v81.origin.x = x;
    v81.origin.y = v40;
    v81.size.width = v23;
    v81.size.height = v25;
    v44 = fmin(v43 / CGRectGetWidth(v81), 1.0);
    v82.origin.x = x;
    v82.origin.y = v40;
    v82.size.width = v23;
    v82.size.height = v25;
    v45 = CGRectGetWidth(v82) * v44;
    v83.origin.x = x;
    v83.origin.y = v40;
    v83.size.width = v45;
    v83.size.height = v25;
    v46 = CGRectGetHeight(v83) * v44;
    v84.origin.x = rect;
    v84.origin.y = y;
    v84.size.width = v68;
    v84.size.height = height;
    v47 = CGRectGetHeight(v84) * 0.75;
    if (v46 >= v47)
      v46 = v47;
  }
  else
  {
    _CGRectScaledToAspectFitWithinRect(x, v40, v23, v25, rect, y, v10, height);
    v45 = v48;
    v46 = v49;
  }
  v50 = *MEMORY[0x1E0C9D538];
  v51 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_screen");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "scale");
  v55 = UIRectIntegralWithScale(v50, v51, v45, v46, v54);
  v57 = v56;
  v59 = v58;
  v61 = v60;

  v62 = v55;
  v63 = v57;
  v64 = v59;
  v65 = v61;
  result.size.height = v65;
  result.size.width = v64;
  result.origin.y = v63;
  result.origin.x = v62;
  return result;
}

- (CGRect)_computedMenuBoundsForContentBounds:(CGRect)a3 predictedPreviewFrame:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  unint64_t v24;
  BOOL v25;
  BOOL v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double (**v39)(double);
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat width;
  CGFloat height;
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect result;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v6 = a3.size.height;
  v7 = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  v11 = CGRectGetHeight(a3);
  v12 = v11;
  v47.origin.x = v9;
  v47.origin.y = v8;
  v47.size.width = v7;
  v47.size.height = v6;
  v13 = CGRectGetWidth(v47);
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor");
  if (-[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout") == 1)
  {
    if (v46 != 4 && v46 != 1)
      goto LABEL_18;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v15 = CGRectGetHeight(v48);
    -[_UIContextMenuLayoutArbiter contentSpacing](self, "contentSpacing");
    v17 = v15 + v16;
    if (v11 * 0.55 < v17)
      v17 = v11 * 0.55;
  }
  else
  {
    if (v46 != 4 && v46 != 1)
      goto LABEL_18;
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v17 = CGRectGetHeight(v49);
    if (v17 > 198.0)
      v17 = 198.0;
  }
  v12 = v11 - v17;
LABEL_18:
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredContentSizeCategory");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v23))
    {
      v24 = -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout");
      v25 = v11 > v13 && v24 == 3;
      v26 = v25;
    }
    else
    {
      v26 = 0;
    }

    if (v26)
      v12 = v12 + -44.0;
  }
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "maximumMenuHeight");
  v29 = v28;

  if (v12 >= v29)
    v12 = v29;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preferredMenuSize");
  v32 = v31;

  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "preferredMenuSize");
  v35 = v34;

  if (v35 >= v12)
    v35 = v12;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled, (uint64_t)CFSTR("ContextMenuScrollTruncationDetentsEnabled")) & 1) == 0)
  {
    if (byte_1EDDA7D5C)
    {
      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "computePreferredScrollTruncationDetentForHeight");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "computePreferredScrollTruncationDetentForHeight");
        v39 = (double (**)(double))objc_claimAutoreleasedReturnValue();
        v35 = v39[2](v35);

      }
    }
  }
  if (v32 >= v13)
    v40 = v13;
  else
    v40 = v32;
  v41 = 0.0;
  v42 = 0.0;
  v43 = v35;
  result.size.height = v43;
  result.size.width = v40;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (CGPoint)_computedMenuAnchorPointForMenuFrame:(CGRect)a3 previewFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  unint64_t v13;
  _BOOL4 v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  uint64_t v56;
  uint64_t v57;
  CGPoint result;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = -[_UIContextMenuLayoutArbiter currentLayout](self, "currentLayout");
  v54 = v8;
  if (v13 == 3)
  {
    v14 = 0;
  }
  else
  {
    v59.origin.x = v11;
    v59.origin.y = v10;
    v59.size.width = v9;
    v59.size.height = v8;
    v15 = CGRectGetWidth(v59);
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v14 = v15 > CGRectGetWidth(v60);
  }
  -[_UIContextMenuLayoutArbiter menuAnchor](self, "menuAnchor", *(_QWORD *)&v54);
  v16 = v56 - 1;
  v17 = 0.5;
  v18 = 0.5;
  if ((unint64_t)(v56 - 1) <= 7)
  {
    v17 = dbl_18667CE98[v16];
    v18 = dbl_18667CED8[v16];
  }
  switch(v57)
  {
    case 1:
      v17 = 0.0;
      break;
    case 2:
      v19 = !v14;
      v20 = 0.1;
      v21 = 0.0;
      goto LABEL_11;
    case 4:
      v17 = 1.0;
      break;
    case 8:
      v19 = !v14;
      v20 = 0.9;
      v21 = 1.0;
LABEL_11:
      if (v19)
        v18 = v21;
      else
        v18 = v20;
      break;
    default:
      break;
  }
  if (v13 == 3)
  {
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sourcePreview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "target");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v24;
    objc_msgSend(v26, "center");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v26, "container");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = _UIContextMenuConvertPointBetweenViews(v31, v25, v28, v30);
    v34 = v33;

    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "preferredMenuAttachmentPoint");
    v37 = v36;
    v39 = v38;

    if (v37 != 1.79769313e308 || v39 != 1.79769313e308)
    {
      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "preferredMenuAttachmentPoint");
      v42 = v41;
      v44 = v43;

      -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "sourcePreview");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "target");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "container");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = _UIContextMenuConvertPointBetweenViews(v48, v49, v42, v44);
      v34 = v50;

    }
    v61.origin.x = v11;
    v61.origin.y = v10;
    v61.size.width = v9;
    v61.size.height = v55;
    v51 = v32 - CGRectGetMinX(v61);
    v62.origin.x = v11;
    v62.origin.y = v10;
    v62.size.width = v9;
    v62.size.height = v55;
    v18 = fmax(fmin(v51 / CGRectGetWidth(v62), 1.0), 0.0);
    v63.origin.x = v11;
    v63.origin.y = v10;
    v63.size.width = v9;
    v63.size.height = v55;
    v52 = v34 - CGRectGetMinY(v63);
    v64.origin.x = v11;
    v64.origin.y = v10;
    v64.size.width = v9;
    v64.size.height = v55;
    v17 = fmax(fmin(v52 / CGRectGetHeight(v64), 1.0), 0.0);
  }
  v53 = v18;
  result.y = v17;
  result.x = v53;
  return result;
}

- (id)_accessoryPositionsForBaseLayout:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  void *v37;
  void *v38;
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
  uint64_t v51;
  double v52;
  double v53;
  CGRect *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double MinX;
  double v63;
  double MinY;
  void *v65;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  id v74;
  id obj;
  uint64_t v76;
  id v77;
  double v78;
  double v79;
  __int128 v80;
  _OWORD v81[8];
  _OWORD v82[8];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v88 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v77 = (id)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
  if (v6)
  {
    v7 = v6;
    v76 = *(_QWORD *)v84;
    v72 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v73 = *MEMORY[0x1E0C9D648];
    v70 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v71 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v84 != v76)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sourcePreview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "target");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "container");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v9, "location");
        if (v16 == 2)
        {
          if (v74)
            objc_msgSend(v74, "menu");
          else
            memset(v81, 0, sizeof(v81));
          v54 = (CGRect *)v81;
LABEL_21:
          v19 = _UIContextMenuItemFrameFromLayout(v54);
          v20 = v55;
          v17 = v56;
          v18 = v57;
          if (!v9)
            goto LABEL_22;
          goto LABEL_11;
        }
        if (v16 == 1)
        {
          if (v74)
            objc_msgSend(v74, "preview");
          else
            memset(v82, 0, sizeof(v82));
          v54 = (CGRect *)v82;
          goto LABEL_21;
        }
        v18 = v70;
        v17 = v71;
        v20 = v72;
        v19 = v73;
        if (!v16)
        {
          objc_msgSend(v15, "bounds");
          v25 = _UIContextMenuProjectFrameFromViewToView(v15, v10, v21, v22, v23, v24);
          v67 = v26;
          v68 = v25;
          v69 = v27;
          v78 = v28;
          objc_msgSend(v10, "safeAreaInsets");
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;
          objc_msgSend(v15, "traitCollection");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          _UIContextMenuGetPlatformMetrics(objc_msgSend(v37, "userInterfaceIdiom"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "minimumContainerInsets");
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v46 = v45;

          v47 = fmax(v30, v40);
          v48 = fmax(v32, v42);
          v49 = fmax(v34, v44);
          v50 = fmax(v36, v46);
          v19 = v68 + v48;
          v20 = v67 + v47;
          v17 = v69 - (v48 + v50);
          v18 = v78 - (v47 + v49);
        }
        if (!v9)
        {
LABEL_22:
          v52 = 0.5;
          v53 = 0.5;
          v80 = 0u;
          goto LABEL_23;
        }
LABEL_11:
        objc_msgSend(v9, "anchor");
        v51 = v80 - 1;
        v52 = 0.5;
        v53 = 0.5;
        if ((unint64_t)(v80 - 1) <= 7)
        {
          v52 = dbl_18667CF18[v51];
          v53 = dbl_18667CF58[v51];
        }
LABEL_23:
        switch(*((_QWORD *)&v80 + 1))
        {
          case 1:
            v52 = 0.0;
            break;
          case 2:
            v53 = 0.0;
            break;
          case 4:
            v52 = 1.0;
            break;
          case 8:
            v53 = 1.0;
            break;
          default:
            break;
        }
        v79 = v52;
        objc_msgSend(v9, "attachmentOffsetWithReferenceFrame:", _UIContextMenuProjectFrameFromViewToView(v10, v15, v19, v20, v17, v18));
        v59 = v58;
        v61 = v60;
        objc_msgSend(v9, "setOffset:");
        v89.origin.x = v19;
        v89.origin.y = v20;
        v89.size.width = v17;
        v89.size.height = v18;
        MinX = CGRectGetMinX(v89);
        v90.origin.x = v19;
        v90.origin.y = v20;
        v90.size.width = v17;
        v90.size.height = v18;
        v63 = v59 + MinX + v53 * CGRectGetWidth(v90);
        v91.origin.x = v19;
        v91.origin.y = v20;
        v91.size.width = v17;
        v91.size.height = v18;
        MinY = CGRectGetMinY(v91);
        v92.origin.x = v19;
        v92.origin.y = v20;
        v92.size.width = v17;
        v92.size.height = v18;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v63, v61 + MinY + v79 * CGRectGetHeight(v92));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setObject:forKey:", v65, v9);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    }
    while (v7);
  }

  return v77;
}

- (void)_drawContentBoundsDebugUI:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CGAffineTransform v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled")) & 1) == 0&& byte_1EDDA7D7C)
  {
    if (!_MergedGlobals_1077)
    {
      v8 = objc_opt_new();
      v9 = (void *)_MergedGlobals_1077;
      _MergedGlobals_1077 = v8;

      +[UIColor cyanColor](UIColor, "cyanColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_MergedGlobals_1077, "setBackgroundColor:", v10);

      objc_msgSend((id)_MergedGlobals_1077, "setUserInteractionEnabled:", 0);
      objc_msgSend((id)_MergedGlobals_1077, "setAlpha:", 0.4);
    }
    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend((id)_MergedGlobals_1077, "setFrame:");

    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", _MergedGlobals_1077);

    v13 = (void *)qword_1ECD7E100;
    if (!qword_1ECD7E100)
    {
      v14 = objc_opt_new();
      v15 = (void *)qword_1ECD7E100;
      qword_1ECD7E100 = v14;

      +[UIColor blackColor](UIColor, "blackColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1ECD7E100, "setBackgroundColor:", v16);

      v13 = (void *)qword_1ECD7E100;
    }
    objc_msgSend(v13, "setFrame:", x, y, width, height);
    v17 = *MEMORY[0x1E0CD2C50];
    objc_msgSend((id)qword_1ECD7E100, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", v17);

    objc_msgSend((id)_MergedGlobals_1077, "addSubview:", qword_1ECD7E100);
    if (!qword_1ECD7E108)
    {
      v19 = objc_opt_new();
      v20 = (void *)qword_1ECD7E108;
      qword_1ECD7E108 = v19;

      objc_msgSend((id)qword_1ECD7E108, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBorderWidth:", 1.0);

      +[UIColor redColor](UIColor, "redColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = objc_msgSend(v22, "CGColor");
      objc_msgSend((id)qword_1ECD7E108, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBorderColor:", v23);

      objc_msgSend((id)qword_1ECD7E108, "setUserInteractionEnabled:", 0);
    }
    -[_UIContextMenuLayoutArbiter currentInput](self, "currentInput");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sourcePreview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "size");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v26, "target");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      objc_msgSend(v31, "transform");
    else
      memset(&v44, 0, sizeof(v44));
    v45.origin.x = 0.0;
    v45.origin.y = 0.0;
    v45.size.width = v28;
    v45.size.height = v30;
    v46 = CGRectApplyAffineTransform(v45, &v44);
    v33 = v46.size.width;
    v34 = v46.size.height;

    objc_msgSend(v26, "target");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "center");
    v37 = round(v36 - v34 * 0.5);
    v39 = round(v38 - v33 * 0.5);

    objc_msgSend(v26, "target");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "container");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "convertRect:toView:", v42, v39, v37, v33, v34);
    objc_msgSend((id)qword_1ECD7E108, "setFrame:");

    -[_UIContextMenuLayoutArbiter containerView](self, "containerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", qword_1ECD7E108);

  }
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(unint64_t)a3
{
  self->_currentLayout = a3;
}

- (_UIContextMenuLayoutArbiterInput)currentInput
{
  return self->_currentInput;
}

- (void)setCurrentInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_destroyWeak((id *)&self->_containerView);
}

@end
