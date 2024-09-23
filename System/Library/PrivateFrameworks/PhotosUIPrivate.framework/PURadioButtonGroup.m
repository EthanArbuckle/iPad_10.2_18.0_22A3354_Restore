@implementation PURadioButtonGroup

- (PURadioButtonGroup)initWithImages:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PURadioButtonGroup *v8;
  PURadioButtonGroup *v9;
  uint64_t v10;
  NSArray *images;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PURadioButtonGroup;
  v8 = -[PURadioButtonGroup init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_radioButtonDelegate, v7);
    v10 = objc_msgSend(v6, "copy");
    images = v9->_images;
    v9->_images = (NSArray *)v10;

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
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
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  unint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  objc_super v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  _QWORD v132[2];
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  _QWORD v137[2];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v127.receiver = self;
  v127.super_class = (Class)PURadioButtonGroup;
  -[PURadioButtonGroup viewDidLoad](&v127, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PURadioButtonGroup view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 8.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup setButtons:](self, "setButtons:", v9);

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  -[PURadioButtonGroup images](self, "images");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v124 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__didSelectButton_, 64);
        objc_msgSend(v16, "setImage:forState:", v15, 0);
        objc_msgSend(v16, "setPointerInteractionEnabled:", 1);
        objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PURadioButtonGroup view](self, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSubview:", v16);

        -[PURadioButtonGroup buttons](self, "buttons");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup setVerticalConstraints:](self, "setVerticalConstraints:", v19);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup setHorizontalConstraints:](self, "setHorizontalConstraints:", v20);

  -[PURadioButtonGroup horizontalConstraints](self, "horizontalConstraints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup buttons](self, "buttons");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = 0;
    do
    {
      v121 = v24;
      -[PURadioButtonGroup buttons](self, "buttons");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "heightAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[PURadioButtonGroup view](self, "view");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "heightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "constraintLessThanOrEqualToAnchor:constant:", v27, -20.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v137[0] = v28;
      objc_msgSend(v26, "centerYAnchor");
      v29 = v21;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PURadioButtonGroup view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "centerYAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v137[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObjectsFromArray:", v34);

      v21 = v29;
      if (!v121)
      {
        objc_msgSend(v26, "leadingAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PURadioButtonGroup view](self, "view");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "leadingAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 10.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObjectsFromArray:", v39);

        -[PURadioButtonGroup buttons](self, "buttons");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (v41 >= 2)
        {
          objc_msgSend(v26, "trailingAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[PURadioButtonGroup buttons](self, "buttons");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectAtIndexedSubscript:", 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "leadingAnchor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintEqualToAnchor:constant:", v45, -24.0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = v46;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
          v47 = v26;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v48);

          v26 = v47;
        }
      }
      -[PURadioButtonGroup buttons](self, "buttons");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count") - 1;

      if (v121 == v50)
      {
        objc_msgSend(v26, "trailingAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[PURadioButtonGroup view](self, "view");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "trailingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, -10.0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = v54;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObjectsFromArray:", v55);

      }
      if (v121)
      {
        -[PURadioButtonGroup buttons](self, "buttons");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count") - 1;

        if (v121 != v57)
        {
          objc_msgSend(v26, "trailingAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[PURadioButtonGroup buttons](self, "buttons");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectAtIndexedSubscript:", v121 + 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "leadingAnchor");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "constraintEqualToAnchor:constant:", v61, -24.0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
          v63 = v26;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v64);

          v26 = v63;
        }
      }

      v24 = v121 + 1;
      -[PURadioButtonGroup buttons](self, "buttons");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "count");

    }
    while (v66 > v121 + 1);
  }

  -[PURadioButtonGroup verticalConstraints](self, "verticalConstraints");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PURadioButtonGroup buttons](self, "buttons");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "count");

  if (v69)
  {
    v70 = 0;
    do
    {
      v122 = v70;
      -[PURadioButtonGroup buttons](self, "buttons");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectAtIndexedSubscript:", v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v72, "widthAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[PURadioButtonGroup view](self, "view");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "widthAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "constraintLessThanOrEqualToAnchor:constant:", v73, -20.0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v132[0] = v74;
      objc_msgSend(v72, "centerXAnchor");
      v75 = v67;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[PURadioButtonGroup view](self, "view");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "centerXAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v132[1] = v79;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "addObjectsFromArray:", v80);

      v67 = v75;
      if (!v122)
      {
        objc_msgSend(v72, "topAnchor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[PURadioButtonGroup view](self, "view");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "topAnchor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, 14.0);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = v84;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObjectsFromArray:", v85);

        -[PURadioButtonGroup buttons](self, "buttons");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v86, "count");

        if (v87 >= 2)
        {
          objc_msgSend(v72, "bottomAnchor");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[PURadioButtonGroup buttons](self, "buttons");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "objectAtIndexedSubscript:", 1);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "topAnchor");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "constraintEqualToAnchor:constant:", v91, -24.0);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v92;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
          v93 = v72;
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObjectsFromArray:", v94);

          v72 = v93;
        }
      }
      -[PURadioButtonGroup buttons](self, "buttons");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "count") - 1;

      if (v122 == v96)
      {
        objc_msgSend(v72, "bottomAnchor");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[PURadioButtonGroup view](self, "view");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "bottomAnchor");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "constraintEqualToAnchor:constant:", v99, -14.0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v100;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObjectsFromArray:", v101);

      }
      if (v122)
      {
        -[PURadioButtonGroup buttons](self, "buttons");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend(v102, "count") - 1;

        if (v122 != v103)
        {
          objc_msgSend(v72, "bottomAnchor");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          -[PURadioButtonGroup buttons](self, "buttons");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "objectAtIndexedSubscript:", v122 + 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "topAnchor");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "constraintEqualToAnchor:constant:", v107, -24.0);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = v108;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
          v109 = v72;
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObjectsFromArray:", v110);

          v72 = v109;
        }
      }

      v70 = v122 + 1;
      -[PURadioButtonGroup buttons](self, "buttons");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v111, "count");

    }
    while (v112 > v122 + 1);
  }

  -[PURadioButtonGroup radioButtonDelegate](self, "radioButtonDelegate");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "layoutDirection");

  v115 = (void *)MEMORY[0x1E0CB3718];
  if (v114)
    -[PURadioButtonGroup verticalConstraints](self, "verticalConstraints");
  else
    -[PURadioButtonGroup horizontalConstraints](self, "horizontalConstraints");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "activateConstraints:", v116);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PURadioButtonGroup;
  v7 = a4;
  -[PURadioButtonGroup viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PURadioButtonGroup_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E58A7A08;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[PURadioButtonGroup horizontalConstraints](self, "horizontalConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  v5 = (void *)MEMORY[0x1E0CB3718];
  -[PURadioButtonGroup verticalConstraints](self, "verticalConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  -[PURadioButtonGroup radioButtonDelegate](self, "radioButtonDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutDirection");

  v9 = (void *)MEMORY[0x1E0CB3718];
  if (v8)
    -[PURadioButtonGroup verticalConstraints](self, "verticalConstraints");
  else
    -[PURadioButtonGroup horizontalConstraints](self, "horizontalConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v10);

  v11.receiver = self;
  v11.super_class = (Class)PURadioButtonGroup;
  -[PURadioButtonGroup updateViewConstraints](&v11, sel_updateViewConstraints);
}

- (void)_didSelectButton:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "setSelected:", objc_msgSend(v16, "isSelected") ^ 1);
  if (!objc_msgSend(v16, "isSelected"))
    goto LABEL_9;
  -[PURadioButtonGroup buttons](self, "buttons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_9;
  v6 = 0;
  v7 = -1;
  do
  {
    -[PURadioButtonGroup buttons](self, "buttons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v6;
    if (v9 != v16)
    {
      -[PURadioButtonGroup buttons](self, "buttons");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelected:", 0);

      v10 = v7;
    }
    ++v6;
    -[PURadioButtonGroup buttons](self, "buttons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    v7 = v10;
  }
  while (v14 > v6);
  if (v10 != -1)
  {
    -[PURadioButtonGroup radioButtonDelegate](self, "radioButtonDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "radioGroupButtonSelectedWithIndex:", v10);
  }
  else
  {
LABEL_9:
    -[PURadioButtonGroup radioButtonDelegate](self, "radioButtonDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "radioButtonGroupNoneSelected");
  }

}

- (void)disableButton:(int64_t)a3
{
  id v5;

  if (-[NSMutableArray count](self->_buttons, "count") > (unint64_t)a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

  }
}

- (void)enableButton:(int64_t)a3
{
  id v5;

  if (-[NSMutableArray count](self->_buttons, "count") > (unint64_t)a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_buttons, "objectAtIndexedSubscript:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

  }
}

- (void)selectButton:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;

  -[PURadioButtonGroup buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[PURadioButtonGroup buttons](self, "buttons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        -[PURadioButtonGroup buttons](self, "buttons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSelected:", 0);

        ++v9;
        -[PURadioButtonGroup buttons](self, "buttons");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

      }
      while (v13 > v9);
    }
    -[PURadioButtonGroup buttons](self, "buttons");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSelected:", 1);

  }
}

- (void)deselectAllButtons
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[PURadioButtonGroup buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[PURadioButtonGroup buttons](self, "buttons");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSelected:", 0);

      ++v5;
      -[PURadioButtonGroup buttons](self, "buttons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

    }
    while (v9 > v5);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (PURadioButtonGroupDelegate)radioButtonDelegate
{
  return (PURadioButtonGroupDelegate *)objc_loadWeakRetained((id *)&self->_radioButtonDelegate);
}

- (void)setRadioButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_radioButtonDelegate, a3);
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (NSMutableArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void)setHorizontalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalConstraints, a3);
}

- (NSMutableArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_destroyWeak((id *)&self->_radioButtonDelegate);
  objc_storeStrong(&self->_completion, 0);
}

void __73__PURadioButtonGroup_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateConstraints");

}

@end
