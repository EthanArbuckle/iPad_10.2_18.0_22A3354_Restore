@implementation _TVDescriptiveAlertView

- (void)setBgImage:(id)a3
{
  UIImage *v4;
  UIImageView *bgImageView;
  UIImageView *v6;
  id v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImage *bgImage;

  v4 = (UIImage *)a3;
  if (self->_bgImage != v4)
  {
    bgImageView = self->_bgImageView;
    if (v4)
    {
      if (bgImageView)
      {
LABEL_8:
        -[UIImageView setImage:](bgImageView, "setImage:", v4);
        goto LABEL_9;
      }
LABEL_7:
      v7 = objc_alloc(MEMORY[0x24BDF6AE8]);
      -[_TVDescriptiveAlertView bounds](self, "bounds");
      v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
      -[_TVDescriptiveAlertView addSubview:](self, "addSubview:", v8);
      -[_TVDescriptiveAlertView sendSubviewToBack:](self, "sendSubviewToBack:", v8);
      v9 = self->_bgImageView;
      self->_bgImageView = v8;

      bgImageView = self->_bgImageView;
      goto LABEL_8;
    }
    if (!bgImageView)
      goto LABEL_7;
    -[UIImageView removeFromSuperview](bgImageView, "removeFromSuperview");
    v6 = self->_bgImageView;
    self->_bgImageView = 0;

  }
LABEL_9:
  bgImage = self->_bgImage;
  self->_bgImage = v4;

}

- (void)setChildViews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *childViews;
  UIScrollView **p_scrollView;
  UIScrollView *scrollView;
  UIView *defaultFocusView;
  NSArray *v14;
  id v15;
  _BOOL4 v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _TVDescriptiveAlertView *v32;
  NSArray *v33;
  NSArray *viewsAboveScrollView;
  NSArray *v35;
  NSArray *viewsBelowScrollView;
  void *v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  NSArray *obj;
  id *location;
  id *p_defaultFocusView;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSArray mutableCopy](self->_childViews, "mutableCopy");
  -[_TVDescriptiveAlertView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isDescendantOfView:", self) & 1) == 0)
  {

    v8 = 0;
  }
  v9 = (NSArray *)objc_msgSend(v4, "copy");
  childViews = self->_childViews;
  self->_childViews = v9;

  p_scrollView = &self->_scrollView;
  scrollView = self->_scrollView;
  self->_scrollView = 0;

  defaultFocusView = self->_defaultFocusView;
  p_defaultFocusView = (id *)&self->_defaultFocusView;
  self->_defaultFocusView = 0;

  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = self->_childViews;
  v15 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v16 = v15 == 0;
  if (!v15)
  {
    v18 = 0;
LABEL_35:

    goto LABEL_37;
  }
  obj = v14;
  location = (id *)&self->_scrollView;
  v40 = v8;
  v41 = v4;
  v17 = 0;
  v18 = 0;
  v19 = *(_QWORD *)v49;
  v42 = v5;
  do
  {
    v20 = 0;
    v21 = v18;
    do
    {
      if (*(_QWORD *)v49 != v19)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong(location, v22);
      }
      else
      {
        if (*location)
          v23 = v44;
        else
          v23 = v43;
        objc_msgSend(v23, "addObject:", v22);
      }
      if (!*p_defaultFocusView)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((objc_msgSend(v22, "canBecomeFocused") & 1) != 0)
            goto LABEL_19;
          objc_msgSend(v22, "preferredFocusEnvironments");
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count"))
          {
            objc_msgSend(v22, "preferredFocusEnvironments");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v26 == v22;
            v5 = v42;
            if (v27)
              goto LABEL_21;
LABEL_19:
            v28 = v22;
            v24 = *p_defaultFocusView;
            *p_defaultFocusView = v28;
          }

        }
      }
LABEL_21:
      objc_msgSend(v22, "tv_associatedIKViewElement");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "autoHighlightIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        if (!v17)
          v17 = v22;
        objc_msgSend(v22, "tv_associatedIKViewElement");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "resetProperty:", 2);

      }
      objc_msgSend(v22, "superview");
      v32 = (_TVDescriptiveAlertView *)objc_claimAutoreleasedReturnValue();

      if (v32 == self)
        objc_msgSend(v5, "removeObject:", v22);
      if (v21)
        -[_TVDescriptiveAlertView insertSubview:above:](self, "insertSubview:above:", v22, v21);
      else
        -[_TVDescriptiveAlertView insertSubview:atIndex:](self, "insertSubview:atIndex:", v22, 0);
      v18 = v22;

      v20 = (char *)v20 + 1;
      v21 = v18;
    }
    while (v15 != v20);
    v15 = (id)-[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  }
  while (v15);

  if (v17)
  {
    v15 = v17;
    p_scrollView = &self->_scrollView;
    v14 = (NSArray *)*p_defaultFocusView;
    *p_defaultFocusView = v15;
    v8 = v40;
    v4 = v41;
    v16 = 0;
    goto LABEL_35;
  }
  v15 = 0;
  v16 = 1;
  v8 = v40;
  v4 = v41;
  p_scrollView = &self->_scrollView;
LABEL_37:
  v33 = (NSArray *)objc_msgSend(v43, "copy");
  viewsAboveScrollView = self->_viewsAboveScrollView;
  self->_viewsAboveScrollView = v33;

  v35 = (NSArray *)objc_msgSend(v44, "copy");
  viewsBelowScrollView = self->_viewsBelowScrollView;
  self->_viewsBelowScrollView = v35;

  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  if (objc_msgSend(v8, "isDescendantOfView:", self))
  {
    if (v16)
      v37 = v8;
    else
      v37 = v15;
    objc_storeStrong(p_defaultFocusView, v37);
  }
  -[_TVDescriptiveAlertView bounds](self, "bounds");
  -[_TVDescriptiveAlertView sizeThatFits:](self, "sizeThatFits:", CGRectGetWidth(v54), 0.0);
  v39 = v38;
  -[_TVDescriptiveAlertView bounds](self, "bounds");
  if (v39 >= CGRectGetHeight(v55))
  {
    -[_TVDescriptiveAlertView _setupGestureRecognizers](self, "_setupGestureRecognizers");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[UIScrollView _setGradientMaskInsets:](*p_scrollView, "_setGradientMaskInsets:", 90.0, 0.0, 90.0, 0.0);
      -[UIScrollView setContentInset:](*p_scrollView, "setContentInset:", 0.0, 0.0, 90.0, 0.0);
    }
  }
  else
  {
    self->_isCenteredLayout = 1;
    -[UIScrollView setBounces:](*p_scrollView, "setBounces:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](*p_scrollView, "setShowsVerticalScrollIndicator:", 0);
  }

}

- (void)_setupGestureRecognizers
{
  UIScrollView *scrollView;
  void *v4;
  void *v5;
  void *v6;
  _UIRepeatingPressGestureRecognizer *v7;
  _UIRepeatingPressGestureRecognizer *upButtonGesture;
  _UIRepeatingPressGestureRecognizer *v9;
  _UIRepeatingPressGestureRecognizer *downButtonGesture;

  scrollView = self->_scrollView;
  if (scrollView)
  {
    -[UIScrollView panGestureRecognizer](scrollView, "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowedTouchTypes:", &unk_24EBCD478);

    -[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHysteresis:", 240.0);

    -[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVDescriptiveAlertView addGestureRecognizer:](self, "addGestureRecognizer:", v6);

    v7 = (_UIRepeatingPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7138]), "initWithTarget:action:", self, sel__scrollUp_);
    upButtonGesture = self->_upButtonGesture;
    self->_upButtonGesture = v7;

    -[_UIRepeatingPressGestureRecognizer setAllowedPressTypes:](self->_upButtonGesture, "setAllowedPressTypes:", &unk_24EBCD490);
    -[_TVDescriptiveAlertView addGestureRecognizer:](self, "addGestureRecognizer:", self->_upButtonGesture);
    v9 = (_UIRepeatingPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7138]), "initWithTarget:action:", self, sel__scrollDown_);
    downButtonGesture = self->_downButtonGesture;
    self->_downButtonGesture = v9;

    -[_UIRepeatingPressGestureRecognizer setAllowedPressTypes:](self->_downButtonGesture, "setAllowedPressTypes:", &unk_24EBCD4A8);
    -[_TVDescriptiveAlertView addGestureRecognizer:](self, "addGestureRecognizer:", self->_downButtonGesture);
  }
}

- (void)_scrollUp:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 2)
  {
    if (!self->_waiting)
      -[_TVDescriptiveAlertView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scrollUp, 0, 0.3);
    self->_waiting = 1;
  }
  else if (v4 == 1)
  {
    -[_TVDescriptiveAlertView _scrollUp](self, "_scrollUp");
  }
  else
  {
    self->_waiting = 0;
  }
}

- (void)_scrollUp
{
  -[_TVDescriptiveAlertView _scrollInDirection:](self, "_scrollInDirection:", -1.0);
  self->_waiting = 0;
}

- (void)_scrollDown:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 2)
  {
    if (!self->_waiting)
      -[_TVDescriptiveAlertView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__scrollDown, 0, 0.3);
    self->_waiting = 1;
  }
  else if (v4 == 1)
  {
    -[_TVDescriptiveAlertView _scrollDown](self, "_scrollDown");
  }
  else
  {
    self->_waiting = 0;
  }
}

- (void)_scrollDown
{
  -[_TVDescriptiveAlertView _scrollInDirection:](self, "_scrollInDirection:", 1.0);
  self->_waiting = 0;
}

- (void)_scrollInDirection:(double)a3
{
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
  CGRect v16;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v6 = v5;
  v8 = v7;
  -[UIScrollView frame](self->_scrollView, "frame");
  v9 = CGRectGetHeight(v16) * 0.85;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v11 = v10;
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v13 = v8 + a3 * (v9 * 0.5);
  v15 = -v14;
  if (v13 >= -v14)
  {
    v15 = v8 + a3 * (v9 * 0.5);
    if (v13 > v11 - v9)
      v15 = v11 - v9 + v12;
  }
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, v6, v15);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[_TVDescriptiveAlertView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  if (self->_defaultFocusView)
  {
    v5[0] = self->_defaultFocusView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSUInteger v21;
  double v22;
  double v23;
  NSArray *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double Height;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  char isKindOfClass;
  UIScrollView *scrollView;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float v74;
  double v75;
  NSArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  NSArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  void *v96;
  NSArray *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  void *v102;
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
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v133 = *MEMORY[0x24BDAC8D0];
  if (self->_bgImageView)
    -[_TVDescriptiveAlertView sendSubviewToBack:](self, "sendSubviewToBack:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIScrollView setTextAlignment:](self->_scrollView, "setTextAlignment:", 4);
  -[_TVDescriptiveAlertView bounds](self, "bounds");
  Width = CGRectGetWidth(v134);
  if (self->_isCenteredLayout)
  {
    v125 = 0uLL;
    v126 = 0uLL;
    v123 = 0uLL;
    v124 = 0uLL;
    v4 = self->_viewsAboveScrollView;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v124;
      v8 = 0.0;
      v9 = 0.0;
      do
      {
        v10 = 0;
        v11 = v9;
        do
        {
          if (*(_QWORD *)v124 != v7)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v10);
          objc_msgSend(v12, "tv_margin");
          v14 = v13;
          v9 = v15;
          objc_msgSend(v12, "tv_sizeThatFits:", Width, 0.0);
          v17 = v16;
          v19 = v18;
          v20 = floor((Width - v16) * 0.5);
          v21 = -[NSArray indexOfObject:](self->_viewsAboveScrollView, "indexOfObject:", v12);
          v22 = fmax(v14, v11);
          if (!v21)
            v22 = 0.0;
          v23 = v8 + v22;
          objc_msgSend(v12, "setFrame:", v20, v8 + v22, v17, v19);
          v8 = v19 + v23;
          ++v10;
          v11 = v9;
        }
        while (v6 != v10);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
      v9 = 0.0;
    }

    -[UIScrollView tv_margin](self->_scrollView, "tv_margin");
    v63 = v62;
    v65 = v64;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    scrollView = self->_scrollView;
    if ((isKindOfClass & 1) != 0)
    {
      -[UIScrollView tv_itemWidth](self->_scrollView, "tv_itemWidth");
      -[UIScrollView sizeThatFits:](scrollView, "sizeThatFits:");
    }
    else
    {
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
    }
    v70 = v68;
    v71 = v69;
    v72 = fmax(v9, v63);
    if (v8 == 0.0)
      v72 = 0.0;
    v73 = v8 + v72;
    v74 = (Width - v70) * 0.5;
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", floorf(v74), v73, v70, v69);
    v75 = v73 + v71;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v76 = self->_viewsBelowScrollView;
    v77 = -[NSArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v120;
      do
      {
        v80 = 0;
        v81 = v65;
        do
        {
          if (*(_QWORD *)v120 != v79)
            objc_enumerationMutation(v76);
          v82 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v80);
          objc_msgSend(v82, "tv_margin");
          v84 = v83;
          v65 = v85;
          objc_msgSend(v82, "tv_sizeThatFits:", Width, 0.0);
          v87 = v86;
          v89 = v88;
          v90 = v75 + fmax(v84, v81);
          *(float *)&v86 = (Width - v86) * 0.5;
          objc_msgSend(v82, "setFrame:", floorf(*(float *)&v86), v90, v87, v88);
          v75 = v89 + v90;
          ++v80;
          v81 = v65;
        }
        while (v78 != v80);
        v78 = -[NSArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
      }
      while (v78);
    }

    -[_TVDescriptiveAlertView bounds](self, "bounds");
    CGRectGetHeight(v136);
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v91 = self->_viewsAboveScrollView;
    v92 = -[NSArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v93; ++i)
        {
          if (*(_QWORD *)v116 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
          objc_msgSend(v96, "frame");
          objc_msgSend(v96, "setFrame:");
        }
        v93 = -[NSArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
      }
      while (v93);
    }

    -[UIScrollView frame](self->_scrollView, "frame");
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v97 = self->_viewsBelowScrollView;
    v98 = -[NSArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v112;
      do
      {
        for (j = 0; j != v99; ++j)
        {
          if (*(_QWORD *)v112 != v100)
            objc_enumerationMutation(v97);
          v102 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
          objc_msgSend(v102, "frame");
          objc_msgSend(v102, "setFrame:");
        }
        v99 = -[NSArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
      }
      while (v99);
    }

  }
  else
  {
    v109 = 0uLL;
    v110 = 0uLL;
    v107 = 0uLL;
    v108 = 0uLL;
    v24 = self->_viewsAboveScrollView;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0.0;
    if (v25)
    {
      v29 = v25;
      v30 = *(_QWORD *)v108;
      do
      {
        v31 = 0;
        v32 = v27;
        do
        {
          if (*(_QWORD *)v108 != v30)
            objc_enumerationMutation(v24);
          v33 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v31);
          objc_msgSend(v33, "tv_margin");
          v35 = v34;
          v27 = v36;
          objc_msgSend(v33, "tv_sizeThatFits:", Width, 0.0);
          v38 = v37;
          v39 = v28 + fmax(v35, v32);
          objc_msgSend(v33, "setFrame:", floor((Width - v40) * 0.5), v39, v40, v37);
          v28 = v38 + v39;
          ++v31;
          v32 = v27;
        }
        while (v29 != v31);
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
      }
      while (v29);
    }

    -[_TVDescriptiveAlertView bounds](self, "bounds");
    Height = CGRectGetHeight(v135);
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    -[NSArray reverseObjectEnumerator](self->_viewsBelowScrollView, "reverseObjectEnumerator", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v104;
      v26 = 0.0;
      do
      {
        v46 = 0;
        v47 = v26;
        do
        {
          if (*(_QWORD *)v104 != v45)
            objc_enumerationMutation(v42);
          v48 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v46);
          objc_msgSend(v48, "tv_margin");
          v26 = v49;
          v51 = v50;
          objc_msgSend(v48, "tv_sizeThatFits:", Width, 0.0);
          v53 = v52;
          Height = Height - (fmax(v47, v51) + v54);
          *(float *)&v52 = (Width - v52) * 0.5;
          objc_msgSend(v48, "setFrame:", floorf(*(float *)&v52), Height, v53, v54);
          ++v46;
          v47 = v26;
        }
        while (v44 != v46);
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
      }
      while (v44);
    }

    -[UIScrollView tv_margin](self->_scrollView, "tv_margin");
    v56 = fmax(v55, v27);
    v58 = Height - v28 - v56 - fmax(v57, v26);
    -[UIScrollView tv_itemWidth](self->_scrollView, "tv_itemWidth");
    v60 = v59;
    *(float *)&v59 = (Width - v59) * 0.5;
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", floorf(*(float *)&v59), v28 + v56, v60, v58);
    if (!-[NSArray count](self->_viewsBelowScrollView, "count"))
    {
      -[UIScrollView contentInset](self->_scrollView, "contentInset");
      if (v61 == 0.0)
      {
        -[UIScrollView contentInset](self->_scrollView, "contentInset");
        -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  NSArray *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char isKindOfClass;
  UIScrollView *scrollView;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGSize result;
  CGRect v52;

  width = a3.width;
  v50 = *MEMORY[0x24BDAC8D0];
  -[_TVDescriptiveAlertView bounds](self, "bounds", a3.width, a3.height);
  v5 = CGRectGetWidth(v52);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = self->_viewsAboveScrollView;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v45;
    do
    {
      v13 = 0;
      v14 = v9;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v13);
        objc_msgSend(v15, "tv_margin");
        v17 = v16;
        v9 = v18;
        objc_msgSend(v15, "tv_sizeThatFits:", v5, 0.0);
        v10 = v10 + fmax(v17, v14) + v19;
        ++v13;
        v14 = v9;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v11);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[NSArray reverseObjectEnumerator](self->_viewsBelowScrollView, "reverseObjectEnumerator", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    v8 = 0.0;
    do
    {
      v24 = 0;
      v25 = v8;
      do
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v24);
        objc_msgSend(v26, "tv_margin");
        v8 = v27;
        v29 = v28;
        objc_msgSend(v26, "tv_sizeThatFits:", v5, 0.0);
        v10 = v10 + fmax(v25, v29) + v30;
        ++v24;
        v25 = v8;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v22);
  }

  -[UIScrollView tv_margin](self->_scrollView, "tv_margin");
  v32 = v31;
  v34 = v33;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  scrollView = self->_scrollView;
  if ((isKindOfClass & 1) != 0)
  {
    -[UIScrollView tv_itemWidth](scrollView, "tv_itemWidth");
    -[UIScrollView sizeThatFits:](scrollView, "sizeThatFits:");
  }
  else
  {
    -[UIScrollView contentSize](scrollView, "contentSize");
  }
  v38 = v10 + fmax(v9, v32) + fmax(v8, v34) + v37;
  v39 = width;
  result.height = v38;
  result.width = v39;
  return result;
}

- (NSArray)childViews
{
  return self->_childViews;
}

- (UIView)defaultFocusView
{
  return self->_defaultFocusView;
}

- (void)setDefaultFocusView:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFocusView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViews, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_bgImage, 0);
  objc_storeStrong((id *)&self->_downButtonGesture, 0);
  objc_storeStrong((id *)&self->_upButtonGesture, 0);
  objc_storeStrong((id *)&self->_defaultFocusView, 0);
  objc_storeStrong((id *)&self->_viewsBelowScrollView, 0);
  objc_storeStrong((id *)&self->_viewsAboveScrollView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
