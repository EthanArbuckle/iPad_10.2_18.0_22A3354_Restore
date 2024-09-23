@implementation TUIVariantSelectorView

- (TUIVariantSelectorView)initWithKey:(id)a3 renderTraits:(id)a4
{
  id v6;
  TUIVariantSelectorView *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIVariantSelectorView;
  v7 = -[TUIKeyPopupView initWithKey:renderTraits:](&v10, sel_initWithKey_renderTraits_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "backingTree");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_baseKeyOnRight = objc_msgSend(v8, "dynamicDisplayCorner") == 8;

  }
  return v7;
}

- (id)alignmentConstraintsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (-[TUIKeyPopupView associatedTree](self, "associatedTree"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v44 = v4;
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyPopupView associatedTree](self, "associatedTree");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "interactionType");

    v8 = 0x1E0C99000;
    if (v7 == 2)
    {
      -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyPopupView variantView](self, "variantView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v11;
      -[TUIKeyPopupView variantView](self, "variantView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 0x1E0C99000uLL;
      objc_msgSend(v45, "addObjectsFromArray:", v17);

    }
    -[TUIKeyPopupView variantView](self, "variantView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantSelectorView leadingAnchor](self, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v39, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v38;
    -[TUIVariantSelectorView trailingAnchor](self, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView variantView](self, "variantView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v34;
    -[TUIKeyPopupView variantView](self, "variantView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIVariantSelectorView topAnchor](self, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v30;
    -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView variantView](self, "variantView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView variantViewBottomSpacing](self, "variantViewBottomSpacing");
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v21;
    -[TUIVariantSelectorView bottomAnchor](self, "bottomAnchor");
    v22 = v45;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v26;
    objc_msgSend(*(id *)(v8 + 3360), "arrayWithObjects:count:", v46, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObjectsFromArray:", v27);

    v4 = v44;
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v22;
}

- (void)updateVariantsIfNeededForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (-[TUIKeyPopupView layoutStyle](self, "layoutStyle") == 1
      && -[TUIKeyPopupView shouldProvideDefaultSelection](self, "shouldProvideDefaultSelection"))
    {
      v7 = 0;
    }
    objc_msgSend(v4, "setSelectedVariantIndex:", v7);
    if (objc_msgSend(v4, "state") == 16)
      -[TUIKeyPopupView setNeedsPopup:](self, "setNeedsPopup:", 1);
  }
  v8.receiver = self;
  v8.super_class = (Class)TUIVariantSelectorView;
  -[TUIKeyPopupView updateVariantsIfNeededForKey:](&v8, sel_updateVariantsIfNeededForKey_, v4);

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
  _BOOL4 v15;
  id v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  _BOOL8 v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  int64_t v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  _BOOL4 v71;
  unint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  _QWORD v79[2];

  v5 = a5;
  v79[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9 && -[TUIKeyPopupView needsPopup](self, "needsPopup"))
  {
    v71 = v5;
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

      v15 = v71;
      if (v14)
        goto LABEL_58;
    }
    else
    {

      v15 = v71;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = v16;
    if (v15)
    {
      objc_msgSend(v16, "addObject:", v8);
    }
    else
    {
      v17 = -[TUIVariantSelectorView baseKeyOnRight](self, "baseKeyOnRight");
      objc_msgSend(v8, "subtrees");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        v20 = objc_msgSend(v18, "count");

        if (v20)
        {
          v21 = 0;
          do
          {
            objc_msgSend(v8, "subtrees");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "insertObject:atIndex:", v23, 0);

            ++v21;
            objc_msgSend(v8, "subtrees");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");

          }
          while (v21 < v25);
        }
      }
      else
      {
        objc_msgSend(v78, "addObjectsFromArray:", v18);

      }
    }
    v26 = -[TUIKeyPopupView maxVariantsPerRowForKey:](self, "maxVariantsPerRowForKey:", v8);
    if (-[TUIVariantSelectorView baseKeyOnRight](self, "baseKeyOnRight"))
    {
      v27 = objc_msgSend(v78, "count");
      v72 = v26 + v27 / v26 * v26 - v27;
    }
    else
    {
      v72 = 0;
    }
    v28 = -[TUIVariantSelectorView baseKeyOnRight](self, "baseKeyOnRight");
    -[TUIKeyPopupView arrangedVariantRows](self, "arrangedVariantRows");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v28)
      objc_msgSend(v29, "objectEnumerator");
    else
      objc_msgSend(v29, "reverseObjectEnumerator");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v71;
    v68 = v9;

    v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = v78;
    if (objc_msgSend(v78, "count"))
    {
      v77 = v26;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v70 = v8;
      do
      {
        if (!v35 || !((v72 + v33) % v77))
        {
          objc_msgSend(v73, "nextObject", v68);
          v36 = objc_claimAutoreleasedReturnValue();

          v35 = (void *)v36;
        }
        objc_msgSend(v32, "objectAtIndex:", v33, v68);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v35 && v37)
        {
          objc_msgSend(v37, "variantDisplayString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v39 || v31)
          {
            if (objc_msgSend(v8, "displayType") == 8
              && (objc_msgSend(v38, "overrideDisplayString"),
                  v40 = (void *)objc_claimAutoreleasedReturnValue(),
                  v40,
                  v40))
            {
              objc_msgSend(v38, "overrideDisplayString");
              v41 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v38, "displayString");
              v41 = objc_claimAutoreleasedReturnValue();
            }
            v43 = (void *)v41;

            v39 = v43;
          }
          objc_msgSend(v38, "secondaryDisplayStrings");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");

          if (v45)
          {
            objc_msgSend(v38, "secondaryDisplayStrings");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "firstObject");
            v47 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v47 = 0;
          }
          v76 = v39;
          -[TUIVariantSelectorView variantCellWithString:annotation:](self, "variantCellWithString:annotation:", v39, v47);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled"));
          objc_msgSend(v8, "subtrees");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setIndexNumber:", objc_msgSend(v48, "indexOfObject:", v38));

          v49 = -[TUIKeyPopupView shouldProvideDefaultSelection](self, "shouldProvideDefaultSelection");
          v50 = 0;
          v75 = (void *)v47;
          if (v49 && !v31)
          {
            v51 = objc_msgSend(v8, "selectedVariantIndex", 0);
            v50 = v51 == objc_msgSend(v42, "indexNumber");
          }
          objc_msgSend(v42, "setPrimaryVariant:", v50);
          objc_msgSend(v35, "addArrangedSubview:", v42);
          -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v42);

          if (!v33 && !-[TUIVariantSelectorView baseKeyOnRight](self, "baseKeyOnRight")
            || v33 % v77 == objc_msgSend(v78, "count") - 1
            && -[TUIVariantSelectorView baseKeyOnRight](self, "baseKeyOnRight"))
          {
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "centerXAnchor");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "centerXAnchor");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "constraintEqualToAnchor:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = v71;
            if (v71 || (v58 = objc_msgSend(v78, "count"), LODWORD(v57) = 1144750080, v58 == 1))
              LODWORD(v57) = 1148829696;
            objc_msgSend(v56, "setPriority:", v57);
            objc_msgSend(v74, "addObject:", v56);

          }
          v59 = -[TUIKeyPopupView layoutStyle](self, "layoutStyle");
          objc_msgSend(v42, "heightAnchor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59 == 1)
          {
            objc_msgSend((id)objc_opt_class(), "minCellDimension");
            objc_msgSend(v60, "constraintGreaterThanOrEqualToConstant:");
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v62) = 1144750080;
            objc_msgSend(v61, "setPriority:", v62);
            LODWORD(v63) = 1144766464;
            objc_msgSend(v42, "setContentCompressionResistancePriority:forAxis:", 1, v63);
          }
          else
          {
            -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "heightAnchor");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "constraintEqualToAnchor:multiplier:", v65, 1.3);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = v71;
          }
          v79[0] = v61;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "addObjectsFromArray:", v66);

          -[TUIVariantSelectorView widthConstraintsForVariantCell:previousCell:](self, "widthConstraintsForVariantCell:previousCell:", v42, v34);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "addObjectsFromArray:", v67);

          v8 = v70;
          v32 = v78;
        }
        else
        {
          v42 = v34;
        }

        ++v33;
        v34 = v42;
      }
      while (objc_msgSend(v32, "count") > v33);
    }
    else
    {
      v35 = 0;
      v42 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v74, v68);

    v9 = v69;
  }
LABEL_58:
  -[TUIKeyPopupView setInitialHighlight](self, "setInitialHighlight");
  -[TUIVariantSelectorView layoutIfNeeded](self, "layoutIfNeeded");

}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6;
  id v7;
  TUIVariantCell *v8;
  void *v9;
  TUIVariantCell *v10;

  v6 = a4;
  v7 = a3;
  v8 = [TUIVariantCell alloc];
  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUIVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v10;
}

- (id)widthConstraintsForVariantCell:(id)a3 previousCell:(id)a4
{
  id v6;
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
  void *v19;
  double v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    objc_msgSend(v6, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  objc_msgSend(v6, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintGreaterThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1144766464;
  objc_msgSend(v19, "setPriority:", v20);
  v23[0] = v15;
  v23[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v21);

  return v8;
}

- (CGSize)paddleRadius
{
  double v2;
  double v3;
  CGSize result;

  v2 = 12.0;
  v3 = 12.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)originRectRadius
{
  double v2;
  double v3;
  CGSize result;

  v2 = 6.0;
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)cellViewsInSubtreeOrder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[TUIVariantSelectorView baseKeyOnRight](self, "baseKeyOnRight");
  -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (BOOL)drawsShadows
{
  void *v2;
  char v3;

  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesDarkAppearance") ^ 1;

  return v3;
}

- (id)backgroundBezierPath
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double MaxY;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  void *v31;
  double MinX;
  double v33;
  double width;
  void *v35;
  double MaxX;
  double v37;
  double v38;
  void *v39;
  CGFloat v40;
  id v41;
  void (**v42)(void *, uint64_t, uint64_t, double, double, double, double, double, double);
  id v43;
  void (**v44)(void *, _QWORD, double, double, double, double);
  double v45;
  double v46;
  double v47;
  double y;
  CGFloat v49;
  CGFloat v50;
  double v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  CGFloat MinY;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  void *v77;
  uint64_t v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  CGRect recta;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, int, double, double, double, double);
  void *v109;
  id v110;
  CGFloat v111;
  double v112;
  _QWORD aBlock[4];
  id v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  -[TUIVariantSelectorView paddleRadius](self, "paddleRadius");
  recta.size.width = v3;
  v104 = v4;
  -[TUIVariantSelectorView originRectRadius](self, "originRectRadius");
  v105 = v5;
  v7 = v6;
  -[TUIKeyPopupView variantView](self, "variantView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  recta.origin.y = v9;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutFrame");
  UIRectInset();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  if (-[TUIKeyPopupView layoutStyle](self, "layoutStyle") == 1)
  {
    v115.origin.x = recta.origin.y;
    v115.origin.y = v11;
    v115.size.width = v13;
    v115.size.height = v15;
    v100 = v7;
    v101 = v22;
    MaxY = CGRectGetMaxY(v115);
    recta.origin.x = v18;
    v116.origin.x = v18;
    v116.origin.y = v20;
    v116.size.width = v22;
    v116.size.height = v24;
    v26 = MaxY - CGRectGetMinY(v116);
    v27 = v15;
    v28 = v11;
    v29 = v20 + v26;
    v30 = v24 - v26;
    -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutFrame");
    MinX = CGRectGetMinX(v117);
    v118.origin.x = recta.origin.y;
    v118.origin.y = v28;
    v118.size.width = v13;
    v118.size.height = v27;
    v33 = vabdd_f64(MinX, CGRectGetMinX(v118));

    v92 = round(v33);
    width = recta.size.width;
    if (v92 < recta.size.width + -3.0)
      width = 0.0;
    v98 = width;
    -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide", *(_QWORD *)&v92);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layoutFrame");
    MaxX = CGRectGetMaxX(v119);
    v120.origin.x = recta.origin.y;
    v120.origin.y = v28;
    v96 = v28;
    v120.size.width = v13;
    v97 = v27;
    v120.size.height = v27;
    v37 = vabdd_f64(MaxX, CGRectGetMaxX(v120));

    v95 = round(v37);
    v38 = 0.0;
    if (v95 >= recta.size.width + -3.0)
      v38 = recta.size.width;
    v99 = v38;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke;
    aBlock[3] = &unk_1E24FBC50;
    v41 = v39;
    v114 = v41;
    v42 = (void (**)(void *, uint64_t, uint64_t, double, double, double, double, double, double))_Block_copy(aBlock);
    recta.size.height = v40;
    v107 = 3221225472;
    v108 = __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke_2;
    v109 = &unk_1E24FB728;
    v111 = recta.size.width;
    v112 = v104;
    v43 = v41;
    v110 = v43;
    v44 = (void (**)(void *, _QWORD, double, double, double, double))_Block_copy(&recta.size.height);
    v121.origin.x = v18;
    v121.origin.y = v29;
    v121.size.width = v101;
    v121.size.height = v30;
    v45 = CGRectGetMinX(v121);
    v122.origin.x = v18;
    v102 = v29;
    v103 = v30;
    v122.origin.y = v29;
    v122.size.width = v101;
    v46 = v101;
    v122.size.height = v30;
    v47 = CGRectGetMaxY(v122);
    objc_msgSend(v43, "moveToPoint:", v105 + v45, v47);
    objc_msgSend(v43, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v45, v47, v105, v100);
    if (v98 == 0.0)
    {
      y = recta.origin.y;
      v123.origin.x = recta.origin.y;
      v49 = v28;
      v123.origin.y = v28;
      v123.size.width = v13;
      v50 = v97;
      v123.size.height = v97;
      objc_msgSend(v43, "addLineToPoint:", v45, CGRectGetMaxY(v123));
      v51 = v104;
    }
    else
    {
      v49 = v28;
      v50 = v97;
      if (v93 <= recta.size.width
        || (-[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells", v93),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = objc_msgSend(v54, "count"),
            v54,
            v55 == 1))
      {
        v124.origin.x = v18;
        v124.origin.y = v102;
        v124.size.height = v103;
        v124.size.width = v101;
        MinY = CGRectGetMinY(v124);
        v125.origin.x = recta.origin.y;
        v125.origin.y = v28;
        v125.size.width = v13;
        v125.size.height = v97;
        v57 = CGRectGetMinX(v125);
        v126.origin.x = recta.origin.y;
        v126.origin.y = v96;
        v126.size.width = v13;
        v126.size.height = v97;
        v58 = CGRectGetMaxY(v126);
        v59 = MinY;
        y = recta.origin.y;
        v44[2](v44, 0, v45, v59, v57, v58);
        v51 = v104;
      }
      else
      {
        v127.origin.x = v18;
        v127.origin.y = v102;
        v127.size.width = v101;
        v127.size.height = v103;
        v94 = CGRectGetMinX(v127);
        v128.origin.x = v18;
        v128.origin.y = v102;
        v128.size.width = v101;
        v128.size.height = v103;
        v60 = CGRectGetMinY(v128);
        v51 = v104;
        v42[2](v42, 2, 1, v94, v60, 0.0, v104, v98, v104);
        v129.origin.x = recta.origin.y;
        v129.origin.y = v96;
        v129.size.width = v13;
        v129.size.height = v97;
        v61 = CGRectGetMinX(v129);
        v130.origin.x = recta.origin.y;
        v130.origin.y = v96;
        v130.size.width = v13;
        v130.size.height = v97;
        v62 = CGRectGetMaxY(v130);
        v63 = v61;
        y = recta.origin.y;
        v46 = v101;
        v42[2](v42, 4, 0, v63, v62, v98, 0.0, v98, v104);
      }
      v131.origin.x = y;
      v131.origin.y = v96;
      v131.size.width = v13;
      v131.size.height = v97;
      v45 = CGRectGetMinX(v131);
    }
    v132.origin.x = y;
    v132.origin.y = v49;
    v132.size.width = v13;
    v132.size.height = v50;
    v64 = CGRectGetMinY(v132);
    v42[2](v42, 1, 0, v45, v64, 0.0, v51, recta.size.width, v51);
    v65 = v18;
    if (v99 != 0.0)
      v65 = y;
    v66 = v102;
    v67 = v103;
    if (v99 == 0.0)
    {
      v68 = v46;
    }
    else
    {
      v66 = v49;
      v68 = v13;
    }
    if (v99 != 0.0)
      v67 = v50;
    v69 = CGRectGetMaxX(*(CGRect *)&v65);
    v133.origin.x = y;
    v133.origin.y = v49;
    v133.size.width = v13;
    v133.size.height = v50;
    v70 = CGRectGetMinY(v133);
    v42[2](v42, 2, 0, v69, v70, -recta.size.width, 0.0, recta.size.width, v51);
    if (v99 == 0.0)
    {
      v134.origin.x = y;
      v134.origin.y = v49;
      v134.size.width = v13;
      v134.size.height = v50;
      objc_msgSend(v43, "addLineToPoint:", v69, CGRectGetMaxY(v134));
      v71 = v105;
      v72 = v18;
      v74 = v102;
      v73 = v103;
      v75 = v100;
      v76 = v101;
    }
    else
    {
      if (v95 <= recta.size.width
        || (-[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells", v95),
            v77 = (void *)objc_claimAutoreleasedReturnValue(),
            v78 = objc_msgSend(v77, "count"),
            v77,
            v78 == 1))
      {
        v79 = y;
        v135.origin.x = y;
        v135.origin.y = v49;
        v135.size.width = v13;
        v135.size.height = v50;
        v80 = CGRectGetMaxX(v135);
        v136.origin.x = v79;
        v136.origin.y = v49;
        v136.size.width = v13;
        v136.size.height = v50;
        v81 = CGRectGetMaxY(v136);
        v72 = v18;
        v137.origin.x = v18;
        v76 = v101;
        v74 = v102;
        v137.origin.y = v102;
        v137.size.width = v101;
        v73 = v103;
        v137.size.height = v103;
        v82 = CGRectGetMaxX(v137);
        v138.origin.x = recta.origin.x;
        v138.origin.y = v102;
        v138.size.width = v101;
        v138.size.height = v103;
        v83 = CGRectGetMinY(v138);
        v44[2](v44, 1, v80, v81, v82, v83);
      }
      else
      {
        v84 = y;
        v139.origin.x = y;
        v139.origin.y = v49;
        v139.size.width = v13;
        v139.size.height = v50;
        v85 = CGRectGetMaxX(v139);
        v140.origin.x = v84;
        v140.origin.y = v49;
        v140.size.width = v13;
        v140.size.height = v50;
        v86 = CGRectGetMaxY(v140);
        v42[2](v42, 8, 0, v85, v86, 0.0, -v51, v99, v51);
        v72 = v18;
        v141.origin.x = v18;
        v76 = v101;
        v74 = v102;
        v141.origin.y = v102;
        v141.size.width = v101;
        v73 = v103;
        v141.size.height = v103;
        v87 = CGRectGetMaxX(v141);
        v142.origin.x = recta.origin.x;
        v142.origin.y = v102;
        v142.size.width = v101;
        v142.size.height = v103;
        v88 = CGRectGetMinY(v142);
        v42[2](v42, 1, 1, v87, v88, v99, 0.0, v99, v51);
      }
      v71 = v105;
      v75 = v100;
    }
    v143.origin.x = v72;
    v143.origin.y = v74;
    v143.size.width = v76;
    v143.size.height = v73;
    v89 = CGRectGetMaxX(v143);
    v144.origin.x = v72;
    v144.origin.y = v74;
    v144.size.width = v76;
    v144.size.height = v73;
    v90 = CGRectGetMaxY(v144);
    v42[2](v42, 8, 0, v89, v90, 0.0, -v75, v71, v75);
    objc_msgSend(v43, "closePath");
    v53 = v43;

  }
  else
  {
    v52 = (void *)MEMORY[0x1E0DC3508];
    UIRectInset();
    objc_msgSend(v52, "bezierPathWithRoundedRect:cornerRadius:");
    v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v53;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIVariantSelectorView;
  v8 = -[TUIKeyPopupView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "interactionType") != 9)
    goto LABEL_4;
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "state");

  if (v11 == 16)
  {
    -[TUIKeyPopupView variantView](self, "variantView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "pointInside:withEvent:", v7, x, y);
LABEL_4:

  }
  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  void *v10;
  TUIVariantSelectorView *v11;
  TUIVariantSelectorView *v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interactionType");

  if (v9 == 9)
  {
    if (!-[TUIVariantSelectorView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      -[TUIKeyPopupView popupDelegate](self, "popupDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tappedToDismissSelector");

    }
    v11 = self;
  }
  else
  {
    -[TUIKeyPopupView finishVariantSelection](self, "finishVariantSelection");
    -[TUIKeyPopupView touchesForwardingView](self, "touchesForwardingView");
    v11 = (TUIVariantSelectorView *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (BOOL)baseKeyOnRight
{
  return self->_baseKeyOnRight;
}

- (void)setBaseKeyOnRight:(BOOL)a3
{
  self->_baseKeyOnRight = a3;
}

uint64_t __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 + a6, a5 + a7);
  return objc_msgSend(*(id *)(a1 + 32), "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", a2, a3, a4, a5, a8, a9);
}

uint64_t __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double v11;

  if (a2)
    v11 = -*(double *)(a1 + 48);
  else
    v11 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a3, a4 + v11);
  return objc_msgSend(*(id *)(a1 + 32), "addCurveToPoint:controlPoint1:controlPoint2:", a5, a6 - v11, a3, a6, a5, a4);
}

+ (double)minCellDimension
{
  return 60.0;
}

@end
