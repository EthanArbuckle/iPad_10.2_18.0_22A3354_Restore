@implementation PUPhotoEditButtonCenteredToolbar

- (double)interItemSpacing
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  int v7;

  v3 = -[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation");
  if (v3 == 2)
    v4 = 24.0;
  else
    v4 = 18.0;
  if (v3 == 2)
    v5 = 12.0;
  else
    v5 = 8.0;
  -[PUPhotoEditToolbar photoEditSpec](self, "photoEditSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldUseCompactToolbarSpacing");

  if (v7)
    return v5;
  else
    return v4;
}

- (void)setCenterView:(id)a3 leadingViews:(id)a4 trailingViews:(id)a5
{
  UIView *v9;
  id v10;
  id v11;
  UIView **p_centerView;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *leadingViews;
  NSArray *v28;
  NSArray *trailingViews;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  UIView *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v9 = (UIView *)a3;
  v10 = a4;
  v11 = a5;
  v59 = v10;
  if ((objc_msgSend(v10, "isEqualToArray:", self->_leadingViews) & 1) == 0
    || !objc_msgSend(v11, "isEqualToArray:", self->_trailingViews)
    || self->_centerView != v9)
  {
    v57 = v9;
    v58 = v11;
    p_centerView = &self->_centerView;
    if (-[UIView isDescendantOfView:](self->_centerView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_centerView, "removeFromSuperview");
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v13 = self->_leadingViews;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v73 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if (objc_msgSend(v18, "isDescendantOfView:", self))
            objc_msgSend(v18, "removeFromSuperview");
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v15);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v19 = self->_trailingViews;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v69 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          if (objc_msgSend(v24, "isDescendantOfView:", self))
            objc_msgSend(v24, "removeFromSuperview");
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v21);
    }

    -[PUPhotoEditToolbar mainToolbarContainer](self, "mainToolbarContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_centerView, a3);
    objc_msgSend(v25, "addSubview:", *p_centerView);
    v26 = (NSArray *)objc_msgSend(v59, "copy");
    leadingViews = self->_leadingViews;
    self->_leadingViews = v26;

    v28 = (NSArray *)objc_msgSend(v58, "copy");
    trailingViews = self->_trailingViews;
    self->_trailingViews = v28;

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v30 = self->_leadingViews;
    v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v65 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(v25, "addSubview:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k));
        }
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      }
      while (v32);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v35 = self->_trailingViews;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v61;
      do
      {
        for (m = 0; m != v37; ++m)
        {
          if (*(_QWORD *)v61 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(v25, "addSubview:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * m));
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
      }
      while (v37);
    }

    -[PUPhotoEditButtonCenteredToolbar buttonAreaLayoutGuide](self, "buttonAreaLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      v41 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      -[PUPhotoEditButtonCenteredToolbar setButtonAreaLayoutGuide:](self, "setButtonAreaLayoutGuide:", v41);

      -[PUPhotoEditButtonCenteredToolbar buttonAreaLayoutGuide](self, "buttonAreaLayoutGuide");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addLayoutGuide:", v42);

    }
    -[PUPhotoEditButtonCenteredToolbar buttonAreaLayoutGuide](self, "buttonAreaLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leftAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leftAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v54;
    objc_msgSend(v25, "rightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "rightAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v51;
    objc_msgSend(v25, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v76[2] = v46;
    objc_msgSend(v25, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v76[3] = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addConstraints:", v50);

    -[PUPhotoEditButtonCenteredToolbar _invalidateAllConstraints](self, "_invalidateAllConstraints");
    v9 = v57;
    v11 = v58;
  }

}

- (void)_addLeadingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
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
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  int isKindOfClass;
  double v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  NSArray *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  NSArray *v56;
  NSArray *leadingLayoutConstraints;
  id v58;
  NSArray *v59;
  PUPhotoEditButtonCenteredToolbar *v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSArray *obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v4 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_leadingViews || self->_leadingLayoutConstraints)
    goto LABEL_44;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation");
  -[PUPhotoEditButtonCenteredToolbar buttonAreaLayoutGuide](self, "buttonAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = self;
  if (!v4)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v59 = self->_leadingViews;
    v64 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    v11 = 0;
    if (!v64)
    {
      obj = 0;
      goto LABEL_42;
    }
    obj = 0;
    v61 = *(_QWORD *)v67;
    while (1)
    {
      v27 = 0;
      v28 = v11;
      do
      {
        if (*(_QWORD *)v67 != v61)
          objc_enumerationMutation(v59);
        v29 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v27);
        objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PUPhotoEditButtonCenteredToolbar interItemSpacing](self, "interItemSpacing");
        v31 = v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          isKindOfClass = 1;
          if (!v28)
            goto LABEL_28;
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if (!v28)
          {
LABEL_28:
            if (v62 == 2
              || !+[PUPhotoEditLayoutSupport isPhoneClassDevice](PUPhotoEditLayoutSupport, "isPhoneClassDevice"))
            {
              LODWORD(v32) = 1148846080;
              objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 0, v32);
            }
            else
            {
              v39 = v29;

              obj = v39;
            }
            objc_msgSend(v29, "leadingAnchor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "leadingAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotoEditToolbar longSideMargin](self, "longSideMargin");
            objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v45);

            objc_msgSend(v29, "centerYAnchor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "centerYAnchor");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "constraintEqualToAnchor:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v48);
            goto LABEL_37;
          }
        }
        v34 = v31 * 0.5;
        v35 = -[NSArray indexOfObject:](self->_leadingViews, "indexOfObject:", v28) == 0 && v62 == 2;
        if (!v35)
          v34 = 0.0;
        if (v35 || ((isKindOfClass ^ 1) & 1) != 0)
        {
          if (obj)
          {
            objc_msgSend(v29, "firstBaselineAnchor");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray firstBaselineAnchor](obj, "firstBaselineAnchor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "constraintEqualToAnchor:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v42);

          }
          else
          {
            objc_msgSend(v29, "centerYAnchor");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "centerYAnchor");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "constraintEqualToAnchor:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v51);

            obj = v29;
          }
        }
        else
        {
          objc_msgSend(v29, "centerYAnchor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "centerYAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "constraintEqualToAnchor:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v38);

          v34 = 10.0;
        }
        objc_msgSend(v29, "leadingAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "trailingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v34);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v54) = 1143930880;
        objc_msgSend(v46, "setPriority:", v54);
        objc_msgSend(v7, "addObject:", v46);
        objc_msgSend(v29, "leadingAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "trailingAnchor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v48);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v55);

        self = v60;
LABEL_37:

        v11 = v29;
        ++v27;
        v28 = v11;
      }
      while (v64 != v27);
      v64 = -[NSArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (!v64)
      {
LABEL_42:

        goto LABEL_43;
      }
    }
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = self->_leadingViews;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v9)
  {
    v10 = v9;
    v58 = v6;
    v11 = 0;
    v63 = *(_QWORD *)v71;
    do
    {
      v12 = 0;
      v13 = v11;
      do
      {
        if (*(_QWORD *)v71 != v63)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v12);
        objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v14, "topAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v13, "bottomAnchor");
        else
          objc_msgSend(v8, "topAnchor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 15.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v17);

        objc_msgSend(v14, "leadingAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "leadingAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v20);

        objc_msgSend(v14, "trailingAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "trailingAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v23);

        objc_msgSend(v14, "centerXAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "centerXAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v26);

        v11 = v14;
        ++v12;
        v13 = v11;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v10);
    v6 = v58;
    self = v60;
  }
  else
  {
    v11 = 0;
  }
LABEL_43:

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
  v56 = (NSArray *)objc_msgSend(v7, "copy");
  leadingLayoutConstraints = self->_leadingLayoutConstraints;
  self->_leadingLayoutConstraints = v56;

LABEL_44:
}

- (void)_addTrailingConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  id v34;
  PUPhotoEditButtonCenteredToolbar *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  uint64_t v69;
  NSArray *trailingLayoutConstraints;
  id v71;
  id v72;
  uint64_t v73;
  int64_t v74;
  uint64_t v75;
  NSArray *obj;
  NSArray *obja;
  PUPhotoEditButtonCenteredToolbar *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v4 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_trailingViews && !self->_trailingLayoutConstraints)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[PUPhotoEditToolbar layoutOrientation](self, "layoutOrientation");
    -[PUPhotoEditButtonCenteredToolbar buttonAreaLayoutGuide](self, "buttonAreaLayoutGuide");
    v78 = self;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      obj = self->_trailingViews;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
      if (v8)
      {
        v9 = v8;
        v71 = v6;
        v10 = 0;
        v11 = *(_QWORD *)v85;
        do
        {
          v12 = 0;
          v13 = v10;
          do
          {
            if (*(_QWORD *)v85 != v11)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v12);
            -[NSArray lastObject](v78->_trailingViews, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            if (v13)
            {
              objc_msgSend(v14, "topAnchor");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray bottomAnchor](v13, "bottomAnchor");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -15.0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v18);

            }
            if (v14 == v15)
            {
              objc_msgSend(v14, "bottomAnchor");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "bottomAnchor");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -15.0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v21);

            }
            objc_msgSend(v14, "leadingAnchor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "leadingAnchor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v24);

            objc_msgSend(v14, "trailingAnchor");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "trailingAnchor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v27);

            objc_msgSend(v14, "centerXAnchor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "centerXAnchor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "constraintEqualToAnchor:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v30);

            v10 = v14;
            ++v12;
            v13 = v10;
          }
          while (v9 != v12);
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
        }
        while (v9);
        v6 = v71;
      }
      else
      {
        v10 = 0;
      }
      v33 = obj;
    }
    else
    {
      -[NSArray reverseObjectEnumerator](self->_trailingViews, "reverseObjectEnumerator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v33 = v32;
      v75 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (v75)
      {
        v72 = v6;
        v34 = 0;
        v73 = *(_QWORD *)v81;
        v35 = self;
        obja = v33;
        do
        {
          v36 = 0;
          v37 = v34;
          do
          {
            if (*(_QWORD *)v81 != v73)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v36);
            objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            -[PUPhotoEditButtonCenteredToolbar interItemSpacing](v35, "interItemSpacing");
            v40 = v39;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v41 = v38;
            else
              v41 = 0;
            objc_msgSend(v41, "configuration");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v42)
              objc_msgSend(v42, "contentInsets");
            else
              objc_msgSend(v41, "contentEdgeInsets");
            v48 = v44;
            v49 = v45;
            v50 = v46;
            v51 = v47;
            if (v37)
            {
              v52 = -[NSArray indexOfObject:](v33, "indexOfObject:", v37);
              if (v74 == 2 && v52 == 0)
                v54 = v40 * -0.5;
              else
                v54 = 0.0;
              objc_msgSend(v38, "trailingAnchor");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "leadingAnchor");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, v54);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v58) = 1143930880;
              objc_msgSend(v57, "setPriority:", v58);
              objc_msgSend(v7, "addObject:", v57);
              objc_msgSend(v38, "trailingAnchor");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "leadingAnchor");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v61);

              objc_msgSend(v38, "centerYAnchor");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "centerYAnchor");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "constraintEqualToAnchor:", v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v64);

              v35 = v78;
            }
            else
            {
              if (v74 == 2)
              {
                LODWORD(v44) = 1148846080;
                objc_msgSend(v38, "setContentCompressionResistancePriority:forAxis:", 0, v44);
              }
              objc_msgSend(v38, "trailingAnchor");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "trailingAnchor");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUPhotoEditToolbar longSideMargin](v35, "longSideMargin");
              objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, -v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v68);

              objc_msgSend(v38, "centerYAnchor");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "centerYAnchor");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "constraintEqualToAnchor:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v63);
            }

            v34 = v38;
            if (v43)
            {
              objc_msgSend(v43, "setContentInsets:", v48, v49, v50, v51);
              objc_msgSend(v41, "setConfiguration:", v43);
            }
            else
            {
              objc_msgSend(v41, "setContentEdgeInsets:", v48, v49, v50, v51);
            }
            v33 = obja;

            ++v36;
            v37 = v34;
          }
          while (v75 != v36);
          v75 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        }
        while (v75);

        v10 = obja;
        v6 = v72;
      }
      else
      {
        v10 = v33;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
    v69 = objc_msgSend(v7, "copy");
    trailingLayoutConstraints = v78->_trailingLayoutConstraints;
    v78->_trailingLayoutConstraints = (NSArray *)v69;

  }
}

- (void)_addCenterConstraintsWithMetrics:(id)a3 verticalLayout:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  UIView *centerView;
  void *v10;
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
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *v40;
  NSArray *centerLayoutConstraints;
  id v42;

  v4 = a4;
  v6 = a3;
  if (self->_centerView && !self->_centerLayoutConstraints)
  {
    v42 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_centerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditButtonCenteredToolbar buttonAreaLayoutGuide](self, "buttonAreaLayoutGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    centerView = self->_centerView;
    if (v4)
    {
      -[UIView centerYAnchor](centerView, "centerYAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerYAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      -[UIView leadingAnchor](self->_centerView, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v15);

      -[UIView trailingAnchor](self->_centerView, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v18);

      -[UIView centerXAnchor](self->_centerView, "centerXAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerXAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v21);
    }
    else
    {
      -[UIView centerXAnchor](centerView, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v24) = 1132068864;
      objc_msgSend(v19, "setPriority:", v24);
      objc_msgSend(v7, "addObject:", v19);
      -[UIView topAnchor](self->_centerView, "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v27);

      -[UIView bottomAnchor](self->_centerView, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v30);

      -[UIView centerYAnchor](self->_centerView, "centerYAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerYAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v33);

      if (-[NSArray count](self->_leadingViews, "count"))
      {
        -[NSArray lastObject](self->_leadingViews, "lastObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "trailingAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_centerView, "leadingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:constant:", v36, -5.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v37);

      }
      if (!-[NSArray count](self->_trailingViews, "count"))
        goto LABEL_10;
      -[NSArray firstObject](self->_trailingViews, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_centerView, "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v38, 5.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v39);

    }
LABEL_10:

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v7);
    v40 = (NSArray *)objc_msgSend(v7, "copy");
    centerLayoutConstraints = self->_centerLayoutConstraints;
    self->_centerLayoutConstraints = v40;

    v6 = v42;
  }

}

- (void)_invalidateAllConstraints
{
  NSArray *centerLayoutConstraints;
  NSArray *leadingLayoutConstraints;
  NSArray *trailingLayoutConstraints;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_centerLayoutConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_leadingLayoutConstraints);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_trailingLayoutConstraints);
  centerLayoutConstraints = self->_centerLayoutConstraints;
  self->_centerLayoutConstraints = 0;

  leadingLayoutConstraints = self->_leadingLayoutConstraints;
  self->_leadingLayoutConstraints = 0;

  trailingLayoutConstraints = self->_trailingLayoutConstraints;
  self->_trailingLayoutConstraints = 0;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditButtonCenteredToolbar;
  -[PUPhotoEditToolbar _invalidateAllConstraints](&v6, sel__invalidateAllConstraints);
}

- (NSArray)leadingViews
{
  return self->_leadingViews;
}

- (NSArray)trailingViews
{
  return self->_trailingViews;
}

- (UILayoutGuide)buttonAreaLayoutGuide
{
  return self->_buttonAreaLayoutGuide;
}

- (void)setButtonAreaLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_buttonAreaLayoutGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonAreaLayoutGuide, 0);
  objc_storeStrong((id *)&self->_trailingViews, 0);
  objc_storeStrong((id *)&self->_leadingViews, 0);
  objc_storeStrong((id *)&self->_centerLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_trailingLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_leadingLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
}

@end
