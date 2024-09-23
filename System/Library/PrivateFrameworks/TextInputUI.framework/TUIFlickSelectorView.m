@implementation TUIFlickSelectorView

- (TUIFlickSelectorView)initWithKey:(id)a3 renderTraits:(id)a4
{
  id v6;
  TUIFlickSelectorView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIFlickSelectorView;
  v7 = -[TUIKeyPopupView initWithKey:renderTraits:](&v11, sel_initWithKey_renderTraits_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "backingTree");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_flickDirection = objc_msgSend(v8, "flickDirection");

    v7->_topRowHasTrailingAlignment = 0;
    -[TUIKeyPopupView associatedTree](v7, "associatedTree");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_totalVariants = -[TUIFlickSelectorView countNonNullVariantEntriesForKey:](v7, "countNonNullVariantEntriesForKey:", v9);

  }
  return v7;
}

- (void)updateVariantsIfNeededForKey:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v6;

  v4 = a3;
  -[TUIFlickSelectorView setFlickDirection:](self, "setFlickDirection:", objc_msgSend(v4, "flickDirection"));
  if (objc_msgSend(v4, "flickDirection") == -1)
    v5 = -[TUIFlickSelectorView countNonNullVariantEntriesForKey:](self, "countNonNullVariantEntriesForKey:", v4);
  else
    v5 = 1;
  -[TUIFlickSelectorView setTotalVariants:](self, "setTotalVariants:", v5);
  v6.receiver = self;
  v6.super_class = (Class)TUIFlickSelectorView;
  -[TUIKeyPopupView updateVariantsIfNeededForKey:](&v6, sel_updateVariantsIfNeededForKey_, v4);

}

- (id)alignmentConstraintsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[4];

  v93[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (-[TUIKeyPopupView associatedTree](self, "associatedTree"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v81 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyPopupView variantView](self, "variantView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUIKeyPopupView variantView](self, "variantView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v8 = objc_claimAutoreleasedReturnValue();

    -[TUIKeyPopupView variantView](self, "variantView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = objc_claimAutoreleasedReturnValue();

    -[TUIKeyPopupView variantView](self, "variantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = objc_claimAutoreleasedReturnValue();

    v83 = (void *)v8;
    v84 = (void *)v10;
    v80 = (void *)v12;
    switch(self->_totalVariants)
    {
      case 1uLL:
        switch(objc_msgSend(v4, "flickDirection"))
        {
          case 0:
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "topAnchor");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView variantView](self, "variantView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "bottomAnchor");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIFlickSelectorView flickPopupOffset](self, "flickPopupOffset");
            objc_msgSend(v13, "constraintEqualToAnchor:constant:", v74);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v93[0] = v69;
            -[TUIKeyPopupView variantView](self, "variantView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "centerXAnchor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerXAnchor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "constraintEqualToAnchor:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v93[1] = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObjectsFromArray:", v20);

            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "bottomAnchor");
            v22 = v80;
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          case 1:
            -[TUIKeyPopupView variantView](self, "variantView");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "leftAnchor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "rightAnchor");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIFlickSelectorView flickPopupOffset](self, "flickPopupOffset");
            objc_msgSend(v41, "constraintEqualToAnchor:constant:", v77);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v90[0] = v71;
            -[TUIKeyPopupView variantView](self, "variantView");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "centerYAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "centerYAnchor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "constraintEqualToAnchor:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v90[1] = v47;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObjectsFromArray:", v48);

            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "leadingAnchor");
            v22 = v85;
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          case 2:
            -[TUIKeyPopupView variantView](self, "variantView");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "topAnchor");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "bottomAnchor");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIFlickSelectorView flickPopupOffset](self, "flickPopupOffset");
            objc_msgSend(v49, "constraintEqualToAnchor:constant:", v78);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v91[0] = v72;
            -[TUIKeyPopupView variantView](self, "variantView");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "centerXAnchor");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "centerXAnchor");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "constraintEqualToAnchor:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v91[1] = v55;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObjectsFromArray:", v56);

            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "topAnchor");
            v22 = v84;
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          case 3:
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "leftAnchor");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView variantView](self, "variantView");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "rightAnchor");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIFlickSelectorView flickPopupOffset](self, "flickPopupOffset");
            objc_msgSend(v57, "constraintEqualToAnchor:constant:", v79);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v92[0] = v73;
            -[TUIKeyPopupView variantView](self, "variantView");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "centerYAnchor");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "centerYAnchor");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "constraintEqualToAnchor:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v92[1] = v63;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObjectsFromArray:", v64);

            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "trailingAnchor");
            v22 = v83;
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          default:
            goto LABEL_12;
        }
        break;
      case 3uLL:
        -[TUIFlickSelectorView trailingAnchor](self, "trailingAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "trailingAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v75);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v24;
        -[TUIFlickSelectorView bottomAnchor](self, "bottomAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = v28;
        v29 = (void *)MEMORY[0x1E0C99D20];
        v30 = v89;
        goto LABEL_10;
      case 4uLL:
        -[TUIFlickSelectorView centerXAnchor](self, "centerXAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centerXAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v75);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = v24;
        -[TUIFlickSelectorView bottomAnchor](self, "bottomAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bottomAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v88[1] = v28;
        v29 = (void *)MEMORY[0x1E0C99D20];
        v30 = v88;
        goto LABEL_10;
      case 5uLL:
        -[TUIFlickSelectorView centerXAnchor](self, "centerXAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "centerXAnchor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v75);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v24;
        -[TUIFlickSelectorView centerYAnchor](self, "centerYAnchor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "centerYAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "constraintEqualToAnchor:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = v28;
        v29 = (void *)MEMORY[0x1E0C99D20];
        v30 = v87;
LABEL_10:
        objc_msgSend(v29, "arrayWithObjects:count:", v30, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObjectsFromArray:", v31);

LABEL_11:
        break;
      default:
        break;
    }
LABEL_12:
    -[TUIFlickSelectorView leadingAnchor](self, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v76, 0.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v70;
    -[TUIFlickSelectorView trailingAnchor](self, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v83, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v33;
    -[TUIFlickSelectorView topAnchor](self, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v34, 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v35;
    -[TUIFlickSelectorView bottomAnchor](self, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v80, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
    v38 = v4;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v82;
    objc_msgSend(v82, "addObjectsFromArray:", v39);

    v4 = v38;
    objc_msgSend(v82, "addObjectsFromArray:", v81);

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (void)addVariantsForKey:(id)a3 toView:(id)a4 isNonVariantPaddle:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  _BOOL8 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  TUIFlickSelectorView *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  _QWORD v67[3];

  v5 = a5;
  v67[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9 && -[TUIKeyPopupView needsPopup](self, "needsPopup"))
  {
    objc_msgSend(v8, "subtrees");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == objc_msgSend(v12, "count"))
    {
      -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
        goto LABEL_48;
    }
    else
    {

    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIFlickSelectorView orderedVariantIndicesForKey](self, "orderedVariantIndicesForKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v65 = v16;
    if (v5)
    {
      v18 = objc_msgSend(v8, "flickDirection");
      objc_msgSend(v8, "subtrees");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v18 >= v20)
      {
        objc_msgSend(v15, "addObject:", v8);
      }
      else
      {
        objc_msgSend(v8, "subtrees");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v8, "flickDirection") + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v22);

      }
      v56 = 0;
    }
    else if (objc_msgSend(v16, "count"))
    {
      v23 = 0;
      v56 = 2;
      do
      {
        objc_msgSend(v17, "objectAtIndex:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "subtrees");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndex:", (int)objc_msgSend(v24, "intValue"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v26);

        v17 = v65;
        ++v23;
      }
      while (v23 < objc_msgSend(v65, "count"));
    }
    else
    {
      v56 = 2;
    }
    v51 = v9;
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v62 = -[TUIFlickSelectorView maxVariantsPerRowForKey:](self, "maxVariantsPerRowForKey:", v8);
    -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectEnumerator");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      v28 = 0;
      v64 = 0;
      v29 = 0;
      v55 = v8;
      v54 = v5;
      v53 = v15;
      v30 = v56;
      while (1)
      {
        if (v29)
        {
          if ((v30 + v28) % v62)
            goto LABEL_23;
          ++v64;
        }
        objc_msgSend(v63, "nextObject", v51);
        v31 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v31;
LABEL_23:
        objc_msgSend(v15, "objectAtIndex:", v28, v51);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v66 = v29;
        if (v29)
        {
          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v33, "isEqual:", v34);

            if ((v35 & 1) == 0)
            {
              objc_msgSend(v33, "variantDisplayString");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v36 || v5)
              {
                objc_msgSend(v33, "displayString");
                v37 = objc_claimAutoreleasedReturnValue();

                v36 = (void *)v37;
              }
              -[TUIFlickSelectorView variantCellWithString:annotation:](self, "variantCellWithString:annotation:", v36, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v5)
              {
                if (v64)
                {
                  if (v64 == 1)
                  {
                    if ((_DWORD)v28 == 1)
                    {
                      v39 = 5;
                    }
                    else if ((_DWORD)v28 == 2)
                    {
                      v39 = 8 * (-[TUIFlickSelectorView totalVariants](self, "totalVariants") == 3);
                    }
                    else
                    {
                      v39 = 10;
                    }
                  }
                  else
                  {
                    v39 = 12;
                  }
                }
                else
                {
                  v39 = 3;
                }
                objc_msgSend(v38, "setCurvedCorners:", v39);
              }
              objc_msgSend(v38, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled"));
              objc_msgSend(v8, "subtrees");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setIndexNumber:", objc_msgSend(v40, "indexOfObject:", v33));

              v41 = -[TUIKeyPopupView shouldProvideDefaultSelection](self, "shouldProvideDefaultSelection");
              v42 = 0;
              v61 = v36;
              if (v41 && !v5)
                v42 = objc_msgSend(v38, "indexNumber", 0) == 0;
              objc_msgSend(v38, "setPrimaryVariant:", v42);
              objc_msgSend(v66, "addArrangedSubview:", v38);
              -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v38);

              objc_msgSend(v38, "heightAnchor");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "heightAnchor");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "constraintEqualToAnchor:", v58);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v67[0] = v44;
              objc_msgSend(v38, "widthAnchor");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "widthAnchor");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "constraintEqualToAnchor:", v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v67[1] = v48;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
              v49 = self;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "addObjectsFromArray:", v50);

              self = v49;
              v8 = v55;
              v30 = v56;
              v5 = v54;
              v15 = v53;
              v17 = v65;
            }
          }
        }

        ++v28;
        v29 = v66;
        if (objc_msgSend(v15, "count") <= v28)
          goto LABEL_47;
      }
    }
    v29 = 0;
LABEL_47:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v57, v51);

    v9 = v52;
  }
LABEL_48:
  -[TUIKeyPopupView setInitialHighlight](self, "setInitialHighlight");
  -[TUIFlickSelectorView layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6;
  id v7;
  TUIFlickVariantCell *v8;
  void *v9;
  TUIFlickVariantCell *v10;

  v6 = a4;
  v7 = a3;
  v8 = [TUIFlickVariantCell alloc];
  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUIVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v10;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)flickPopupOffset
{
  int64_t v2;
  double result;

  v2 = -[TUIFlickSelectorView flickDirection](self, "flickDirection");
  result = 0.0;
  if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    return 10.0;
  return result;
}

- (int64_t)variantViewAlignment
{
  if (self->_topRowHasTrailingAlignment)
    return 4;
  else
    return 3;
}

- (unint64_t)countNonNullVariantEntriesForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
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
  objc_msgSend(a3, "subtrees", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v9, "isEqual:", v10);

        v6 += v9 ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateVariantViewPropertiesForKey:(id)a3 isNonVariantPaddle:(BOOL)a4
{
  uint64_t v5;
  unint64_t v6;

  if (a4)
  {
    v5 = 1;
  }
  else
  {
    v6 = -[TUIFlickSelectorView totalVariants](self, "totalVariants", a3);
    v5 = 1;
    switch(v6)
    {
      case 2uLL:
        break;
      case 3uLL:
        self->_topRowHasTrailingAlignment = 1;
        goto LABEL_5;
      case 4uLL:
LABEL_5:
        v5 = 2;
        break;
      case 5uLL:
        v5 = 3;
        break;
      default:
        v5 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  -[TUIKeyPopupView setVariantViewRows:](self, "setVariantViewRows:", v5);
}

- (unint64_t)variantRowLimitForLayout
{
  if (-[TUIKeyPopupView layoutStyle](self, "layoutStyle") == 1)
    return 3;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)orderedVariantIndicesForKey
{
  return &unk_1E25176F0;
}

- (unint64_t)maxVariantsPerRowForKey:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "flickDirection") == -1)
  {
    v5 = -[TUIFlickSelectorView variantRowLimitForLayout](self, "variantRowLimitForLayout");
    if (v4)
    {
      objc_msgSend(v4, "subtrees");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count") > v5)
      {
        v7 = -[TUIKeyPopupView layoutStyle](self, "layoutStyle");

        if (v7 != 1)
          goto LABEL_8;
        objc_msgSend(v4, "subtrees");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v6, "count") * 0.5);
      }

    }
  }
  else
  {
    v5 = 1;
  }
LABEL_8:

  return v5;
}

- (id)cellViewsInSubtreeOrder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;

  -[TUIFlickSelectorView cellViewsInTopDownLTROrder](self, "cellViewsInTopDownLTROrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(&unk_1E2517708, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(&unk_1E2517708, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      if (objc_msgSend(v3, "count") > (unint64_t)v9)
      {
        objc_msgSend(v3, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

      }
      ++v7;
    }
    while (v7 < objc_msgSend(&unk_1E2517708, "count"));
  }

  return v6;
}

- (id)backgroundBezierPath
{
  if (-[TUIFlickSelectorView flickDirection](self, "flickDirection") == -1)
    -[TUIFlickSelectorView backgroundPathForLongPress](self, "backgroundPathForLongPress");
  else
    -[TUIFlickSelectorView backgroundPathForFlick](self, "backgroundPathForFlick");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)backgroundPathForLongPress
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void (**v18)(void *, uint64_t, uint64_t, double, double, double, double, double, double);
  double v19;
  double MinX;
  CGFloat MinY;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat MaxY;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  double MaxX;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat v41;
  id v42;
  _QWORD aBlock[4];
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  -[TUIKeyPopupView roundRectRadius](self, "roundRectRadius");
  v4 = v3;
  -[TUIFlickSelectorView cellViewsInTopDownLTROrder](self, "cellViewsInTopDownLTROrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__TUIFlickSelectorView_backgroundPathForLongPress__block_invoke;
  aBlock[3] = &unk_1E24FBC50;
  v17 = v16;
  v45 = v17;
  v18 = (void (**)(void *, uint64_t, uint64_t, double, double, double, double, double, double))_Block_copy(aBlock);
  v19 = v11 - v15;
  v46.origin.x = v9;
  v46.origin.y = v11 - v15;
  v46.size.width = v13;
  v46.size.height = v15;
  MinX = CGRectGetMinX(v46);
  v47.origin.x = v9;
  v47.origin.y = v11 - v15;
  v47.size.width = v13;
  v47.size.height = v15;
  MinY = CGRectGetMinY(v47);
  v18[2](v18, 1, 1, MinX, MinY, 0.0, 0.0, v4, v4);
  v48.origin.x = v9;
  v48.origin.y = v11 - v15;
  v48.size.width = v13;
  v48.size.height = v15;
  v22 = CGRectGetMinX(v48);
  v49.origin.x = v9;
  v49.origin.y = v11 - v15;
  v49.size.width = v13;
  v49.size.height = v15;
  objc_msgSend(v17, "addLineToPoint:", v22, CGRectGetMaxY(v49));
  v50.origin.x = v9 - v13;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  v23 = CGRectGetMinX(v50);
  v51.origin.x = v9 - v13;
  v51.origin.y = v11;
  v51.size.width = v13;
  v51.size.height = v15;
  v24 = CGRectGetMinY(v51);
  v18[2](v18, 1, 1, v23, v24, 0.0, 0.0, v4, v4);
  v52.origin.x = v9 - v13;
  v52.origin.y = v11;
  v52.size.width = v13;
  v52.size.height = v15;
  v25 = CGRectGetMinX(v52);
  v53.origin.x = v9 - v13;
  v53.origin.y = v11;
  v53.size.width = v13;
  v53.size.height = v15;
  MaxY = CGRectGetMaxY(v53);
  v18[2](v18, 4, 1, v25, MaxY, 0.0, 0.0, v4, v4);
  if (v6 == 5)
  {
    v56.origin.x = v9;
    v56.origin.y = v11 + v15;
    v56.size.width = v13;
    v56.size.height = v15;
    v29 = CGRectGetMinX(v56);
    v57.origin.x = v9;
    v57.origin.y = v11 + v15;
    v57.size.width = v13;
    v57.size.height = v15;
    objc_msgSend(v17, "addLineToPoint:", v29, CGRectGetMinY(v57));
    v58.origin.x = v9;
    v58.origin.y = v11 + v15;
    v58.size.width = v13;
    v58.size.height = v15;
    v30 = CGRectGetMinX(v58);
    v59.origin.x = v9;
    v59.origin.y = v11 + v15;
    v59.size.width = v13;
    v59.size.height = v15;
    v31 = CGRectGetMaxY(v59);
    v18[2](v18, 4, 1, v30, v31, 0.0, 0.0, v4, v4);
    v60.origin.x = v9;
    v60.origin.y = v11 + v15;
    v60.size.width = v13;
    v60.size.height = v15;
    MaxX = CGRectGetMaxX(v60);
    v61.origin.x = v9;
    v61.origin.y = v11 + v15;
    v61.size.width = v13;
    v61.size.height = v15;
    v33 = CGRectGetMaxY(v61);
    v18[2](v18, 8, 1, MaxX, v33, 0.0, 0.0, v4, v4);
    v62.origin.x = v9;
    v62.origin.y = v11 + v15;
    v62.size.width = v13;
    v62.size.height = v15;
    v34 = CGRectGetMaxX(v62);
    v63.origin.x = v9;
    v63.origin.y = v11 + v15;
    v63.size.width = v13;
    v63.size.height = v15;
    objc_msgSend(v17, "addLineToPoint:", v34, CGRectGetMinY(v63));
    goto LABEL_6;
  }
  if (v6 != 3)
  {
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4)
      goto LABEL_7;
LABEL_6:
    v64.origin.x = v9 + v13;
    v64.origin.y = v11;
    v64.size.width = v13;
    v64.size.height = v15;
    v35 = CGRectGetMaxX(v64);
    v65.origin.x = v9 + v13;
    v65.origin.y = v11;
    v65.size.width = v13;
    v65.size.height = v15;
    v36 = CGRectGetMaxY(v65);
    v18[2](v18, 8, 1, v35, v36, 0.0, 0.0, v4, v4);
    v66.origin.x = v9 + v13;
    v66.origin.y = v11;
    v66.size.width = v13;
    v66.size.height = v15;
    v37 = CGRectGetMaxX(v66);
    v67.origin.x = v9 + v13;
    v67.origin.y = v11;
    v67.size.width = v13;
    v67.size.height = v15;
    v38 = CGRectGetMinY(v67);
    v18[2](v18, 2, 1, v37, v38, 0.0, 0.0, v4, v4);
    v68.origin.x = v9 + v13;
    v68.origin.y = v11;
    v68.size.width = v13;
    v68.size.height = v15;
    v39 = CGRectGetMinX(v68);
    v69.origin.x = v9 + v13;
    v69.origin.y = v11;
    v69.size.width = v13;
    v69.size.height = v15;
    objc_msgSend(v17, "addLineToPoint:", v39, CGRectGetMinY(v69));
    goto LABEL_7;
  }
  v54.origin.x = v9;
  v54.origin.y = v11;
  v54.size.width = v13;
  v54.size.height = v15;
  v27 = CGRectGetMaxX(v54);
  v55.origin.x = v9;
  v55.origin.y = v11;
  v55.size.width = v13;
  v55.size.height = v15;
  v28 = CGRectGetMaxY(v55);
  v18[2](v18, 8, 1, v27, v28, 0.0, 0.0, v4, v4);
LABEL_7:
  v70.origin.x = v9;
  v70.origin.y = v11 - v15;
  v70.size.width = v13;
  v70.size.height = v15;
  v40 = CGRectGetMaxX(v70);
  v71.origin.x = v9;
  v71.origin.y = v19;
  v71.size.width = v13;
  v71.size.height = v15;
  v41 = CGRectGetMinY(v71);
  v18[2](v18, 2, 1, v40, v41, 0.0, 0.0, v4, v4);
  objc_msgSend(v17, "closePath");
  v42 = v17;

  return v42;
}

- (id)backgroundPathForFlick
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  int64_t v13;
  void *v14;
  CGFloat MidX;
  void *v16;
  double MinX;
  double MaxY;
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
  uint64_t v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MaxX;
  double MidY;
  double v54;
  double MinY;
  double v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView variantView](self, "variantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = -[TUIFlickSelectorView flickDirection](self, "flickDirection");
  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutFrame");
  MidX = CGRectGetMidX(v57);
  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutFrame");
  MidY = CGRectGetMidY(v58);

  v59.origin.x = v6;
  v59.origin.y = v8;
  v59.size.width = v10;
  v59.size.height = v12;
  MinX = CGRectGetMinX(v59);
  v60.origin.x = v6;
  v60.origin.y = v8;
  v60.size.width = v10;
  v60.size.height = v12;
  MaxY = CGRectGetMaxY(v60);
  v61.origin.x = v6;
  v61.origin.y = v8;
  v61.size.width = v10;
  v61.size.height = v12;
  v56 = CGRectGetMinX(v61);
  v62.origin.x = v6;
  v62.origin.y = v8;
  v62.size.width = v10;
  v62.size.height = v12;
  MinY = CGRectGetMinY(v62);
  v63.origin.x = v6;
  v63.origin.y = v8;
  v63.size.width = v10;
  v63.size.height = v12;
  MaxX = CGRectGetMaxX(v63);
  v64.origin.x = v6;
  v64.origin.y = v8;
  v64.size.width = v10;
  v64.size.height = v12;
  v51 = CGRectGetMinY(v64);
  v65.origin.x = v6;
  v65.origin.y = v8;
  v65.size.width = v10;
  v65.size.height = v12;
  v19 = CGRectGetMaxX(v65);
  v66.origin.x = v6;
  v66.origin.y = v8;
  v66.size.width = v10;
  v66.size.height = v12;
  v20 = CGRectGetMaxY(v66);
  v21 = MidX;
  v22 = 6.0;
  v23 = 8.0;
  v24 = -3.0;
  v25 = 24.0;
  v26 = MaxY;
  v27 = MinX;
  v28 = v20;
  v29 = v19;
  switch(v13)
  {
    case 0:
      v46 = v19;
      v49 = v21;
      v30 = v21 + -3.0;
      v31 = MaxX;
      v32 = MidY + -16.0;
      v33 = 6.0;
      v43 = v20;
      v34 = v51;
      goto LABEL_5;
    case 1:
      goto LABEL_7;
    case 2:
      v49 = v21;
      v30 = v21 + 3.0;
      v32 = MidY + 16.0;
      v33 = -6.0;
      v43 = MinY;
      v46 = v56;
      v34 = MaxY;
      v31 = MinX;
      v23 = -8.0;
      MinY = v20;
      v56 = v19;
      MaxY = v51;
      MinX = MaxX;
      goto LABEL_5;
    case 3:
      v22 = -6.0;
      v23 = -8.0;
      v24 = 3.0;
      v26 = v51;
      v27 = MaxX;
      v28 = MinY;
      v29 = v56;
      v25 = -24.0;
      v51 = MaxY;
      MaxX = MinX;
      MinY = v20;
      v56 = v19;
LABEL_7:
      v41 = v21 + v25;
      v50 = MidY + v24;
      objc_msgSend(v3, "moveToPoint:", v21 + v25, *(_QWORD *)&v27, *(_QWORD *)&v26);
      objc_msgSend(v3, "addLineToPoint:", v56 - v22, v22 + MinY);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v22 * 0.5 + v56, MinY, v56 - v22 * 0.5, MinY);
      objc_msgSend(v3, "addLineToPoint:", MaxX - v23, v51);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", MaxX, v23 + v51, MaxX, v51);
      objc_msgSend(v3, "addLineToPoint:", v29, v28 - v23);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v29 - v23, v28, v29, v28);
      objc_msgSend(v3, "addLineToPoint:", v22 * 0.5 + v45, v48);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v45 - v22, v48 - v22, v45 - v22 * 0.5, v48);
      objc_msgSend(v3, "addLineToPoint:", v41, MidY + v22 * 0.5);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v41, v50, v41 + v22 / -3.0, MidY);
      v38 = v3;
      v39 = v41;
      v40 = v50;
      break;
    default:
      v35 = v20;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v6, 6.0, v20, v19, 5.0);
      v36 = objc_claimAutoreleasedReturnValue();

      v33 = 6.0;
      v30 = 8.0;
      v43 = v35;
      v46 = v19;
      v49 = 8.0;
      v23 = 8.0;
      v34 = v51;
      v31 = MaxX;
      v3 = (void *)v36;
      v32 = MidY;
LABEL_5:
      v54 = v30;
      v37 = v32;
      objc_msgSend(v3, "moveToPoint:", *(_QWORD *)&v43, *(_QWORD *)&v46);
      objc_msgSend(v3, "addLineToPoint:", v33 + MinX, v33 + MaxY);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", MinX, MaxY - v33 * 0.5, MinX, v33 * 0.5 + MaxY);
      objc_msgSend(v3, "addLineToPoint:", v56, v23 + MinY);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v23 + v56, MinY, v56, MinY);
      objc_msgSend(v3, "addLineToPoint:", v31 - v23, v34);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v31, v23 + v34, v31, v34);
      objc_msgSend(v3, "addLineToPoint:", v47, v44 - v33 * 0.5);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v47 - v33, v33 + v44, v47, v33 * 0.5 + v44);
      objc_msgSend(v3, "addLineToPoint:", v49 + v33 * 0.5, v37);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v54, v37, v49, v37 + v33 / 3.0);
      v38 = v3;
      v39 = v54;
      v40 = v37;
      break;
  }
  objc_msgSend(v38, "moveToPoint:", v39, v40);
  objc_msgSend(v3, "closePath");
  return v3;
}

- (BOOL)topRowHasTrailingAlignment
{
  return self->_topRowHasTrailingAlignment;
}

- (void)setTopRowHasTrailingAlignment:(BOOL)a3
{
  self->_topRowHasTrailingAlignment = a3;
}

- (unint64_t)totalVariants
{
  return self->_totalVariants;
}

- (void)setTotalVariants:(unint64_t)a3
{
  self->_totalVariants = a3;
}

- (int64_t)flickDirection
{
  return self->_flickDirection;
}

- (void)setFlickDirection:(int64_t)a3
{
  self->_flickDirection = a3;
}

uint64_t __50__TUIFlickSelectorView_backgroundPathForLongPress__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 + a6, a5 + a7);
  return objc_msgSend(*(id *)(a1 + 32), "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", a2, a3, a4, a5, a8, a9);
}

@end
