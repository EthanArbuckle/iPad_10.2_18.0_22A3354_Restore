@implementation _UIStatusBarRegionAxisCenteringLayout

- (_UIStatusBarRegionAxisCenteringLayout)init
{
  _UIStatusBarRegionAxisCenteringLayout *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarRegionAxisCenteringLayout;
  result = -[_UIStatusBarRegionAxisCenteringLayout init](&v8, sel_init);
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&result->_interspace = _Q0;
  result->_maxNumberOfItems = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  UILayoutGuide *v20;
  UILayoutGuide *v21;
  UILayoutGuide *v22;
  id v23;
  id v24;
  double *v25;
  id v26;
  UILayoutGuide *v27;
  double margin;
  UILayoutGuide *v29;
  UILayoutGuide *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  _UIStatusBarRegionAxisCenteringLayout *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  _UIStatusBarRegionAxisCenteringLayout *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  UILayoutGuide *v51;
  UILayoutGuide *v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  UILayoutGuide *v57;
  UILayoutGuide *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  UILayoutGuide *v62;
  UILayoutGuide *v63;
  uint64_t v64;
  void *v66;
  id v67;
  id v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  UILayoutGuide *v72;
  id v73;
  id v74;
  _UIStatusBarRegionAxisCenteringLayout *v75;
  id v76;
  UILayoutGuide *v77;
  _QWORD *v78;
  int64_t v79;
  void *v80;
  _QWORD v81[5];
  id v82;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_msgSend(v11, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_margin != -1.0 && self->_interspace != -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarRegionAxisCenteringLayout.m"), 35, CFSTR("Can't set both margin and interspace to specific values"));

  }
  if (v14 != (void *)1)
  {
    v20 = objc_alloc_init(UILayoutGuide);
    v21 = objc_alloc_init(UILayoutGuide);
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x3032000000;
    v81[3] = __Block_byref_object_copy__173;
    v81[4] = __Block_byref_object_dispose__173;
    v82 = 0;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __102___UIStatusBarRegionAxisCenteringLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
    v70[3] = &unk_1E16E0630;
    v71 = v69;
    v22 = v20;
    v72 = v22;
    v79 = a6;
    v67 = v13;
    v23 = v13;
    v24 = v71;
    v25 = (double *)self;
    v73 = v23;
    v68 = v11;
    v78 = v81;
    v74 = v11;
    v75 = self;
    v26 = v12;
    v76 = v26;
    v80 = v14;
    v27 = v21;
    v77 = v27;
    objc_msgSend(v74, "enumerateObjectsUsingBlock:", v70);
    margin = self->_margin;
    v29 = v22;
    v30 = v29;
    if (margin == -1.0)
    {
      if (a6 == 1)
      {
        -[UILayoutGuide heightAnchor](v29, "heightAnchor");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a6)
          goto LABEL_44;
        -[UILayoutGuide widthAnchor](v29, "widthAnchor");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v31;
LABEL_44:

      v51 = v27;
      v52 = v51;
      if (a6 == 1)
      {
        -[UILayoutGuide heightAnchor](v51, "heightAnchor");
        v53 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a6)
          goto LABEL_49;
        -[UILayoutGuide widthAnchor](v51, "widthAnchor");
        v53 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (UILayoutGuide *)v53;
LABEL_49:

      objc_msgSend(v14, "constraintEqualToAnchor:", v22);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v54);

      if (v25[1] != -1.0)
      {
LABEL_70:
        objc_msgSend(v26, "addObject:", v30);
        objc_msgSend(v26, "addObject:", v27);

        _Block_object_dispose(v81, 8);
        v11 = v68;
        v13 = v67;
        v19 = v69;
        goto LABEL_71;
      }
      objc_msgSend(v26, "lastObject");
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v55;
      if (a6 == 1)
      {
        objc_msgSend(v55, "heightAnchor");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a6)
          goto LABEL_55;
        objc_msgSend(v55, "widthAnchor");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      v25 = (double *)v56;
LABEL_55:

      v57 = v30;
      v58 = v57;
      if (a6 == 1)
      {
        -[UILayoutGuide heightAnchor](v57, "heightAnchor");
        v59 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a6)
        {
LABEL_60:

          objc_msgSend(v25, "constraintEqualToAnchor:", v22);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v60);

LABEL_69:
          goto LABEL_70;
        }
        -[UILayoutGuide widthAnchor](v57, "widthAnchor");
        v59 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (UILayoutGuide *)v59;
      goto LABEL_60;
    }
    if (a6 == 1)
    {
      -[UILayoutGuide heightAnchor](v29, "heightAnchor");
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a6)
        goto LABEL_63;
      -[UILayoutGuide widthAnchor](v29, "widthAnchor");
      v32 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v32;
LABEL_63:

    objc_msgSend(v14, "constraintEqualToConstant:", v25[2]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v61);

    v62 = v27;
    v63 = v62;
    if (a6 == 1)
    {
      -[UILayoutGuide heightAnchor](v62, "heightAnchor");
      v64 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a6)
      {
LABEL_68:

        objc_msgSend(v14, "constraintEqualToConstant:", v25[2]);
        v25 = (double *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v25);
        goto LABEL_69;
      }
      -[UILayoutGuide widthAnchor](v62, "widthAnchor");
      v64 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v64;
    goto LABEL_68;
  }
  objc_msgSend(v11, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16;
  v18 = v17;
  if (a6 == 1)
  {
    objc_msgSend(v17, "centerYAnchor");
    self = (_UIStatusBarRegionAxisCenteringLayout *)objc_claimAutoreleasedReturnValue();
    v19 = v69;
  }
  else
  {
    v19 = v69;
    if (!a6)
    {
      objc_msgSend(v17, "centerXAnchor");
      self = (_UIStatusBarRegionAxisCenteringLayout *)objc_claimAutoreleasedReturnValue();
    }
  }

  v33 = v13;
  v34 = v33;
  if (a6 == 1)
  {
    objc_msgSend(v33, "centerYAnchor");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6)
      goto LABEL_21;
    objc_msgSend(v33, "centerXAnchor");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v35;
LABEL_21:

  -[_UIStatusBarRegionAxisCenteringLayout constraintEqualToAnchor:](self, "constraintEqualToAnchor:", v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v36);

  v37 = v18;
  v38 = v37;
  if (a6 == 1)
  {
    objc_msgSend(v37, "topAnchor");
    v39 = (_UIStatusBarRegionAxisCenteringLayout *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6)
      goto LABEL_26;
    objc_msgSend(v37, "leadingAnchor");
    v39 = (_UIStatusBarRegionAxisCenteringLayout *)objc_claimAutoreleasedReturnValue();
  }
  self = v39;
LABEL_26:

  v40 = v34;
  v41 = v40;
  if (a6 == 1)
  {
    objc_msgSend(v40, "topAnchor");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6)
      goto LABEL_31;
    objc_msgSend(v40, "leadingAnchor");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v42;
LABEL_31:

  -[_UIStatusBarRegionAxisCenteringLayout constraintGreaterThanOrEqualToAnchor:](self, "constraintGreaterThanOrEqualToAnchor:", v15);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v43);

  v44 = v38;
  v45 = v44;
  if (a6 == 1)
  {
    objc_msgSend(v44, "bottomAnchor");
    v46 = (_UIStatusBarRegionAxisCenteringLayout *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a6)
      goto LABEL_36;
    objc_msgSend(v44, "trailingAnchor");
    v46 = (_UIStatusBarRegionAxisCenteringLayout *)objc_claimAutoreleasedReturnValue();
  }
  self = v46;
LABEL_36:

  v47 = v41;
  v48 = v47;
  if (a6 == 1)
  {
    objc_msgSend(v47, "bottomAnchor");
    v49 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (!a6)
  {
    objc_msgSend(v47, "trailingAnchor");
    v49 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v15 = (void *)v49;
  }

  -[_UIStatusBarRegionAxisCenteringLayout constraintLessThanOrEqualToAnchor:](self, "constraintLessThanOrEqualToAnchor:", v15);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v50);

LABEL_71:
  return v19;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)objc_msgSend(a3, "count") <= self->_maxNumberOfItems;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

@end
