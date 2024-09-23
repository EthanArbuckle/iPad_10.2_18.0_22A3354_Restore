@implementation TPInComingCallUISnapshotViewController

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 nameString:(id)a5
{
  return -[TPInComingCallUISnapshotViewController initWithConfiguration:style:nameString:avatarImage:](self, "initWithConfiguration:style:nameString:avatarImage:", a3, a4, a5, 0);
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 nameString:(id)a5 avatarImage:(id)a6
{
  id v10;
  __CFString *v11;
  id v12;
  TPInComingCallUISnapshotViewController *v13;
  TPInComingCallUISnapshotViewController *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  objc_super v19;

  v10 = a3;
  v11 = (__CFString *)a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TPInComingCallUISnapshotViewController;
  v13 = -[TPInComingCallUISnapshotViewController init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    -[TPInComingCallUISnapshotViewController setConfiguration:](v13, "setConfiguration:", v10);
    -[TPInComingCallUISnapshotViewController setStyle:](v14, "setStyle:", a4);
    v15 = (void *)objc_opt_new();
    v16 = v15;
    if (v11)
      v17 = v11;
    else
      v17 = &stru_1E75FDD38;
    objc_msgSend(v15, "setGivenName:", v17);
    -[TPInComingCallUISnapshotViewController setContact:](v14, "setContact:", v16);
    -[TPInComingCallUISnapshotViewController setCustomAvatar:](v14, "setCustomAvatar:", v12);

  }
  return v14;
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5
{
  return -[TPInComingCallUISnapshotViewController initWithConfiguration:style:contact:avatarImage:](self, "initWithConfiguration:style:contact:avatarImage:", a3, a4, a5, 0);
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 avatarImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  TPInComingCallUISnapshotViewController *v13;
  TPInComingCallUISnapshotViewController *v14;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TPInComingCallUISnapshotViewController;
  v13 = -[TPInComingCallUISnapshotViewController init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[TPInComingCallUISnapshotViewController setConfiguration:](v13, "setConfiguration:", v10);
    -[TPInComingCallUISnapshotViewController setStyle:](v14, "setStyle:", a4);
    -[TPInComingCallUISnapshotViewController setContact:](v14, "setContact:", v11);
    -[TPInComingCallUISnapshotViewController setCustomAvatar:](v14, "setCustomAvatar:", v12);
  }

  return v14;
}

- (id)nameString
{
  void *v3;
  void *v4;
  void *v5;

  -[TPInComingCallUISnapshotViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPInComingCallUISnapshotViewController contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    +[TPIncomingCallMetricsProvider posterDisplayNameForContact:](TPIncomingCallMetricsProvider, "posterDisplayNameForContact:", v4);
  else
    objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)posterDisplayNameComponentsForContact:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void **v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v5, "setStyle:", 1);
  objc_msgSend(v5, "stringFromPersonNameComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nickname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8
    || (objc_msgSend(v3, "nickname"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        !v10))
  {
    objc_msgSend(v5, "setStyle:", 2);
    objc_msgSend(v3, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v3, "familyName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (!v15)
      {
LABEL_11:
        objc_msgSend(v5, "setStyle:", 1);
        objc_msgSend(v5, "stringFromPersonNameComponents:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          v26 = v11;
          v12 = (void *)MEMORY[0x1E0C99D20];
          v13 = &v26;
          goto LABEL_13;
        }
        objc_msgSend(v3, "organizationName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (!v20)
        {
          v18 = 0;
          goto LABEL_18;
        }
        objc_msgSend(v3, "organizationName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_18;
      }
      objc_msgSend(v5, "stringFromPersonNameComponents:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "givenName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "rangeOfString:", v16) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v3, "familyName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "rangeOfString:", v17) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = objc_msgSend(v11, "rangeOfString:", CFSTR(" "));

          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v3, "givenName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v21;
            objc_msgSend(v3, "familyName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v27[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
          goto LABEL_10;
        }

      }
    }
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v3, "nickname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = (void **)v28;
LABEL_13:
  objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v18;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPInComingCallUISnapshotViewController;
  -[TPInComingCallUISnapshotViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TPInComingCallUISnapshotViewController setUpOverlayContentIfNeeded](self, "setUpOverlayContentIfNeeded");
}

- (void)setUpOverlayContentIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TPInComingCallUISnapshotViewController setUpOverlaysContainer](self, "setUpOverlaysContainer");
    -[TPInComingCallUISnapshotViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[TPInComingCallUISnapshotViewController setupLabels](self, "setupLabels");
    -[TPInComingCallUISnapshotViewController setUpButton:](self, "setUpButton:", 1);
    -[TPInComingCallUISnapshotViewController setUpButton:](self, "setUpButton:", 2);
    -[TPInComingCallUISnapshotViewController setUpButton:](self, "setUpButton:", 3);
    -[TPInComingCallUISnapshotViewController setUpButton:](self, "setUpButton:", 4);
    -[TPInComingCallUISnapshotViewController setUpButton:](self, "setUpButton:", 5);
    -[TPInComingCallUISnapshotViewController setupAvatarViewIfNeeded](self, "setupAvatarViewIfNeeded");
    -[TPInComingCallUISnapshotViewController setUpConstraints](self, "setUpConstraints");
    -[TPInComingCallUISnapshotViewController hideElementsBasedOn:](self, "hideElementsBasedOn:", -[TPInComingCallUISnapshotViewController style](self, "style"));
  }
}

- (void)setUpOverlaysContainer
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
  id v13;

  if ((-[TPInComingCallUISnapshotViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
    -[TPInComingCallUISnapshotViewController view](self, "view");
  else
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v7, v9, v11);
  -[TPInComingCallUISnapshotViewController setOverlaysContainerView:](self, "setOverlaysContainerView:", v12);

  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 18);

}

- (void)setUpConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
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
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  float v50;
  double v51;
  unint64_t v52;
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
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  _QWORD v150[8];
  _QWORD v151[4];
  _QWORD v152[9];
  _QWORD v153[4];

  v153[2] = *MEMORY[0x1E0C80C00];
  +[TPIncomingCallMetricsProvider incomingCallAndInCallControlsBottomPadding](TPIncomingCallMetricsProvider, "incomingCallAndInCallControlsBottomPadding");
  v4 = v3;
  +[TPIncomingCallMetricsProvider sideMarginForDoubleButton](TPIncomingCallMetricsProvider, "sideMarginForDoubleButton");
  v6 = v5;
  +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTop_ForSnapshot](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTop_ForSnapshot");
  v8 = v7;
  +[TPIncomingCallMetricsProvider callDetailsButtonPaddingTrail_ForSnapshot](TPIncomingCallMetricsProvider, "callDetailsButtonPaddingTrail_ForSnapshot");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "topAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintEqualToAnchor:constant:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v13;
  -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v11;
  objc_msgSend(v11, "addObjectsFromArray:", v19);

  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "topAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "safeAreaLayoutGuide");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPIncomingCallMetricsProvider twelvePercentOfDeviceHeight](TPIncomingCallMetricsProvider, "twelvePercentOfDeviceHeight");
    objc_msgSend(v134, "constraintEqualToAnchor:constant:", v131);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v128;
    -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "safeAreaLayoutGuide");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "constraintEqualToAnchor:constant:", v113, v6);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v152[1] = v110;
    -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "widthAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
    objc_msgSend(v104, "constraintEqualToConstant:");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v152[2] = v102;
    -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
    objc_msgSend(v98, "constraintEqualToConstant:");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v152[3] = v96;
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "topAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "safeAreaLayoutGuide");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "topAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPIncomingCallMetricsProvider twelvePercentOfDeviceHeight](TPIncomingCallMetricsProvider, "twelvePercentOfDeviceHeight");
    objc_msgSend(v88, "constraintEqualToAnchor:constant:", v86, v21 + 4.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v152[4] = v84;
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "safeAreaLayoutGuide");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v74);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v152[5] = v72;
    -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v152[6] = v65;
    -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v23, 16.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v152[7] = v24;
    -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -v6;
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v152[8] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "addObjectsFromArray:", v31);

  }
  else
  {
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "topAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "safeAreaLayoutGuide");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "topAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPIncomingCallMetricsProvider sixPercentOfDeviceHeight](TPIncomingCallMetricsProvider, "sixPercentOfDeviceHeight");
    objc_msgSend(v135, "constraintEqualToAnchor:constant:", v132);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = v129;
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "centerXAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "safeAreaLayoutGuide");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "centerXAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v114);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v111;
    -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "topAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v33, 2.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v151[2] = v34;
    -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v151[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "addObjectsFromArray:", v40);

    v29 = -v6;
  }
  -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "bottomAnchor");
  v42 = -v4;
  v144 = v41;
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v150[0] = v133;
  -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "leadingAnchor");
  v127 = v43;
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v6);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v150[1] = v118;
  -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "bottomAnchor");
  v112 = v44;
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v42);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v150[2] = v103;
  -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "trailingAnchor");
  v99 = v45;
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v29);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v150[3] = v93;
  -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "centerXAnchor");
  v89 = v46;
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v150[4] = v83;
  -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "topAnchor");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = +[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing");
  v50 = 30.0;
  LODWORD(v51) = 30.0;
  if (v49 != 6)
  {
    v52 = +[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing", v51);
    LODWORD(v51) = 24.0;
    if (v52 == 3)
      *(float *)&v51 = 30.0;
  }
  v79 = v47;
  v75 = (void *)v48;
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, (float)-*(float *)&v51);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v150[5] = v73;
  -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v53;
  objc_msgSend(v53, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v150[6] = v56;
  -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing") != 6)
  {
    if (+[TPUIConfiguration inCallBottomBarSpacing](TPUIConfiguration, "inCallBottomBarSpacing") == 3)
      v50 = 30.0;
    else
      v50 = 24.0;
  }
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v60, (float)-v50);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v150[7] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "addObjectsFromArray:", v62);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v149);
}

- (void)setupLabels
{
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
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
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v3 = (void *)getPRPosterLabelClass_softClass;
  v28 = getPRPosterLabelClass_softClass;
  if (!getPRPosterLabelClass_softClass)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __getPRPosterLabelClass_block_invoke;
    v24[3] = &unk_1E75FD048;
    v24[4] = &v25;
    __getPRPosterLabelClass_block_invoke((uint64_t)v24);
    v3 = (void *)v26[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v25, 8);
  v5 = objc_alloc_init(v4);
  -[TPInComingCallUISnapshotViewController setMobileLabel:](self, "setMobileLabel:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[TPInComingCallUISnapshotViewController setNameLabel:](self, "setNameLabel:", v6);

  -[TPInComingCallUISnapshotViewController nameString](self, "nameString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  TelephonyUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MOBILE"), &stru_1E75FDD38, CFSTR("General"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMarqueeEnabled:", 1);

  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    +[TPIncomingCallMetricsProvider nameLabelFontWithAvatar](TPIncomingCallMetricsProvider, "nameLabelFontWithAvatar");
  else
    +[TPIncomingCallMetricsProvider nameLabelFont](TPIncomingCallMetricsProvider, "nameLabelFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  +[TPIncomingCallMetricsProvider mobileLabelFont](TPIncomingCallMetricsProvider, "mobileLabelFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v22);

}

- (void)setupAvatarViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  -[TPInComingCallUISnapshotViewController customAvatar](self, "customAvatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPInComingCallUISnapshotViewController customAvatar](self, "customAvatar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TPInComingCallUISnapshotViewController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0DC3870];
      -[TPInComingCallUISnapshotViewController contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "thumbnailImageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithData:", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  if (-[TPInComingCallUISnapshotViewController style](self, "style") != 6)
    goto LABEL_16;
  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || !v4)
    goto LABEL_16;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
  -[TPInComingCallUISnapshotViewController setAvatarView:](self, "setAvatarView:", v11);

  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[TPUIConfiguration defaultHeight](TPUIConfiguration, "defaultHeight");
  v14 = v13 * 0.5;
  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", v14);

  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMasksToBounds:", 1);

  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController avatarView](self, "avatarView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[TPInComingCallUISnapshotViewController customAvatar](self, "customAvatar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

  }
  else
  {
    -[TPInComingCallUISnapshotViewController contact](self, "contact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contactImageBackgroundColors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      -[TPInComingCallUISnapshotViewController contact](self, "contact");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "contactImageBackgroundColors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
        goto LABEL_16;
      -[TPInComingCallUISnapshotViewController contact](self, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contactImageBackgroundColors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v22 = (void *)getCNImageDerivedColorGeneratorClass_softClass;
  v39 = getCNImageDerivedColorGeneratorClass_softClass;
  if (!getCNImageDerivedColorGeneratorClass_softClass)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __getCNImageDerivedColorGeneratorClass_block_invoke;
    v35[3] = &unk_1E75FD048;
    v35[4] = &v36;
    __getCNImageDerivedColorGeneratorClass_block_invoke((uint64_t)v35);
    v22 = (void *)v37[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v36, 8);
  objc_msgSend(v23, "colorsForImageRef:", objc_msgSend(objc_retainAutorelease(v4), "CGImage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "colorWithAlphaComponent:", 0.1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_colorBlendedWithColor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPInComingCallUISnapshotViewController setBackroundColor:](self, "setBackroundColor:", v28);
  }
LABEL_16:

}

- (void)setUpButton:(int64_t)a3
{
  TPInComingCallBottomBarSupplementalButton *v4;
  TPInComingCallBottomBarSupplementalButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  TPInComingCallBottomBarSupplementalButton *v14;
  TPInComingCallBottomBarSupplementalButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TPInComingCallBottomBarButton *v21;
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
  void *v33;
  void *v34;
  void *v35;
  TPInComingCallBottomBarButton *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v54;
  void *v55;
  id v56;

  switch(a3)
  {
    case 1:
      v4 = [TPInComingCallBottomBarSupplementalButton alloc];
      v5 = -[TPInComingCallBottomBarSupplementalButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[TPInComingCallUISnapshotViewController setRemindMeButton:](self, "setRemindMeButton:", v5);

      -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v7);

      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:", 38, *MEMORY[0x1E0DC4B60], -1, 1);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:forState:", v56, 0);

      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      TelephonyUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("CALL_BACK_LATER");
      goto LABEL_4;
    case 2:
      v14 = [TPInComingCallBottomBarSupplementalButton alloc];
      v15 = -[TPInComingCallBottomBarSupplementalButton initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[TPInComingCallUISnapshotViewController setMessageButton:](self, "setMessageButton:", v15);

      -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v17);

      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:", 13, *MEMORY[0x1E0DC4B60], -1, 1);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:forState:", v56, 0);

      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      TelephonyUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("SEND_MESSAGE");
LABEL_4:
      objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E75FDD38, CFSTR("General"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:forState:", v20, 0);

      goto LABEL_8;
    case 3:
      v21 = objc_alloc_init(TPInComingCallBottomBarButton);
      -[TPInComingCallUISnapshotViewController setDeclineButton:](self, "setDeclineButton:", v21);

      -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:", 2, *MEMORY[0x1E0DC4B50], 3, 1);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setImage:forState:", v56, 0);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      TelephonyUIBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DECLINE"), &stru_1E75FDD38, CFSTR("General"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:forState:", v28, 0);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBackgroundColor:", v29);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "titleLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAdjustsFontSizeToFitWidth:", 0);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "titleLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPreferredMaxLayoutWidth:", 105.0);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      v36 = objc_alloc_init(TPInComingCallBottomBarButton);
      -[TPInComingCallUISnapshotViewController setAcceptButton:](self, "setAcceptButton:", v36);

      -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addSubview:", v38);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(MEMORY[0x1E0DC3870], "tpImageForSymbolType:textStyle:scale:isStaticSize:", 1, *MEMORY[0x1E0DC4B50], 3, 1);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setImage:forState:", v56, 0);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      TelephonyUIBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_1E75FDD38, CFSTR("General"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setTitle:forState:", v43, 0);

      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setBackgroundColor:", v44);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "titleLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAdjustsFontSizeToFitWidth:", 0);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "titleLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setPreferredMaxLayoutWidth:", 105.0);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = v35;
      objc_msgSend(v35, "setClipsToBounds:", 0);
LABEL_8:

      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController setCallDetailsViewButton:](self, "setCallDetailsViewButton:", v50);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setTintColor:", v51);

      -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addSubview:", v55);

      -[TPInComingCallUISnapshotViewController capCallDetailsViewButtonSize](self, "capCallDetailsViewButtonSize");
      break;
    default:
      return;
  }
}

- (void)capCallDetailsViewButtonSize
{
  void *v2;
  id v3;

  -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize](TPIncomingCallMetricsProvider, "callDetailsButtonMaxSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumContentSizeCategory:", v2);

}

- (void)hideElementsBasedOn:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v24;

  switch(a3)
  {
    case 0:
      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
    case 2:
      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 1);

      goto LABEL_3;
    case 3:
LABEL_3:
      -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v23 = v17;
      objc_msgSend(v17, "setHidden:", 1);

      -[TPInComingCallUISnapshotViewController fakeLabel](self, "fakeLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v24 = v10;
      objc_msgSend(v10, "setHidden:", 1);

      break;
    default:
      return;
  }
}

- (void)setNameLabelFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[TPInComingCallUISnapshotViewController fakeLabel](self, "fakeLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v4);

}

- (void)setNameLabelTextColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TPInComingCallUISnapshotViewController nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[TPInComingCallUISnapshotViewController fakeLabel](self, "fakeLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v4);

}

- (void)setBackroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_colorDifferenceFromColor:", v6);
  v8 = v7;

  if (v8 > 0.5)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController setLabelsColor:](self, "setLabelsColor:", v9);

}

- (void)setLabelsColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[TPInComingCallUISnapshotViewController setNameLabelTextColor:](self, "setNameLabelTextColor:", v4);
  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[TPInComingCallUISnapshotViewController acceptButton](self, "acceptButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleColor:forState:", v4, 0);

  -[TPInComingCallUISnapshotViewController declineButton](self, "declineButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleColor:forState:", v4, 0);

  -[TPInComingCallUISnapshotViewController messageButton](self, "messageButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:forState:", v4, 0);

  -[TPInComingCallUISnapshotViewController remindMeButton](self, "remindMeButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleColor:forState:", v4, 0);

}

- (id)generateOverlaysSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  CGContext *CurrentContext;
  void *v14;
  void *v15;
  CGSize v17;
  CGRect v18;

  -[TPInComingCallUISnapshotViewController setUpOverlayContentIfNeeded](self, "setUpOverlayContentIfNeeded");
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;
  v17.width = v7;
  v17.height = v9;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  CGContextClipToRect(CurrentContext, v18);

  objc_msgSend(v4, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)identifierForStyle
{
  int64_t v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = -[TPInComingCallUISnapshotViewController style](self, "style");
  if (v2 == 1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v3 = (id *)getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr;
    v11 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr;
    if (!getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr)
    {
      v5 = (void *)PosterBoardUIServicesLibrary();
      v3 = (id *)dlsym(v5, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView");
      v9[3] = (uint64_t)v3;
      getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewSymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v8, 8);
    if (!v3)
      -[TPInComingCallUISnapshotViewController identifierForStyle].cold.3();
  }
  else if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v3 = (id *)getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr;
    v11 = getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr;
    if (!getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr)
    {
      v6 = (void *)PosterBoardUIServicesLibrary();
      v3 = (id *)dlsym(v6, "PRPosterSnapshotDefinitionIdentifierIncomingCallComposite");
      v9[3] = (uint64_t)v3;
      getPRPosterSnapshotDefinitionIdentifierIncomingCallCompositeSymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v8, 8);
    if (!v3)
      -[TPInComingCallUISnapshotViewController identifierForStyle].cold.1();
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v3 = (id *)getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr;
    v11 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr;
    if (!getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr)
    {
      v4 = (void *)PosterBoardUIServicesLibrary();
      v3 = (id *)dlsym(v4, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly");
      v9[3] = (uint64_t)v3;
      getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlySymbolLoc_ptr = (uint64_t)v3;
    }
    _Block_object_dispose(&v8, 8);
    if (!v3)
      -[TPInComingCallUISnapshotViewController identifierForStyle].cold.2();
  }
  return *v3;
}

- (id)attachmentIdentifiersForStyle
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString **v9;
  uint64_t v10;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[TPInComingCallUISnapshotViewController style](self, "style");
  v4 = CFSTR("TPUI_MobileLabel");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 3)
    v4 = CFSTR("TPUI_MobileLabelAndBottomBarAndInfoLabel");
  v5 = v4;
  v6 = 0;
  if ((unint64_t)(-[TPInComingCallUISnapshotViewController style](self, "style") - 1) <= 2)
  {
    if (v5)
    {
      v13 = v5;
      getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v13;
      v10 = 2;
    }
    else
    {
      getPRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (__CFString **)&v12;
      v10 = 1;
    }
    objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v12, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)attachmentsForStyle
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
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
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
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
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  _OWORD v68[3];
  _QWORD v69[5];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;

  v70 = 0;
  v71 = &v70;
  v72 = 0x2050000000;
  v3 = (void *)getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass;
  v73 = getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass;
  if (!getPRUISPosterAppearanceObservingAttachmentProviderClass_softClass)
  {
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke;
    v69[3] = &unk_1E75FD048;
    v69[4] = &v70;
    __getPRUISPosterAppearanceObservingAttachmentProviderClass_block_invoke((uint64_t)v69);
    v3 = (void *)v71[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v70, 8);
  v5 = [v4 alloc];
  -[TPInComingCallUISnapshotViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPRSConfiguration:", v6);

  v8 = -[TPInComingCallUISnapshotViewController style](self, "style");
  v9 = -[TPInComingCallUISnapshotViewController style](self, "style");
  if ((unint64_t)(v9 - 2) >= 2)
  {
    if (v9 != 1)
    {
      v10 = 0;
      goto LABEL_29;
    }
    -[TPInComingCallUISnapshotViewController setUpOverlayContentIfNeeded](self, "setUpOverlayContentIfNeeded");
  }
  else
  {
    -[TPInComingCallUISnapshotViewController setUpOverlayContentIfNeeded](self, "setUpOverlayContentIfNeeded");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overlayContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overlayContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    objc_msgSend(v11, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[TPInComingCallUISnapshotViewController overlaysContainerView](self, "overlaysContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    objc_msgSend(v7, "overlayContentAttachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v10, "addObject:", v23);

    -[TPInComingCallUISnapshotViewController setUpOverlayContentIfNeeded](self, "setUpOverlayContentIfNeeded");
    if (v10)
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(v7, "vibrantObscurableContentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
  {
    v25 = 0;
  }
  else
  {
    TelephonyUIBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MOBILE"), &stru_1E75FDD38, CFSTR("General"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = 0x1E75FB000uLL;
  -[TPInComingCallUISnapshotViewController contact](self, "contact");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPIncomingCallMetricsProvider appropriateCallerNameViewForContact:callStatus:callIsActive:](TPIncomingCallMetricsProvider, "appropriateCallerNameViewForContact:callStatus:callIsActive:", v28, v25, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "applyPosterAppearanceToObserver:", v29);
  if (objc_msgSend(v29, "layout") != 1 || (objc_msgSend(v29, "statusIsSuitableForVerticalLayout") & 1) != 0 || v8 == 1)
  {
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v68[0] = *MEMORY[0x1E0C9BAA8];
    v68[1] = v44;
    v68[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v43, "setTransform:", v68);

    +[TPIncomingCallMetricsProvider mobileLabelFont](TPIncomingCallMetricsProvider, "mobileLabelFont");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFont:", v45);

    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v42 = 1;
  }
  else
  {
    -[TPInComingCallUISnapshotViewController moveMobileLabelToBeYAxisCenteredWithInfoButton](self, "moveMobileLabelToBeYAxisCenteredWithInfoButton");
    -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPIncomingCallMetricsProvider callDetailsButtonMaxSize](TPIncomingCallMetricsProvider, "callDetailsButtonMaxSize");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMaximumContentSizeCategory:", v31);

    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyPosterAppearanceToObserver:", v32);

    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "fontWithSize:", 22.0);
    v35 = v10;
    v36 = v25;
    v37 = v24;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFont:", v38);

    v24 = v37;
    v25 = v36;
    v10 = v35;
    v27 = 0x1E75FB000;

    -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v42 = 0;
  }
  objc_msgSend(v40, "setHidden:", v42);

  objc_msgSend(*(id *)(v27 + 3712), "addCallerNameView:toContainerView:", v29, v24);
  objc_msgSend(v29, "emojiViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v7, "obscurableOverlayView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "emojiViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v50);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "vibrantObscurableContentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setNeedsLayout");

    objc_msgSend(v7, "vibrantObscurableContentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutIfNeeded");

    objc_msgSend(v29, "emojiViewController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v29, "viewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "view");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "frame");
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;

      objc_msgSend(v29, "emojiViewController");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "view");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setFrame:", v57, v59, v61, v63);

    }
    objc_msgSend(v29, "tightFrame");
    objc_msgSend(v7, "setPrimaryContentTightFrame:");
  }
  objc_msgSend(v7, "obscurableContentAttachment");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    objc_msgSend(v10, "addObject:", v66);

LABEL_29:
  return v10;
}

- (void)moveMobileLabelToBeYAxisCenteredWithInfoButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  -[TPInComingCallUISnapshotViewController mobileLabel](self, "mobileLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPInComingCallUISnapshotViewController callDetailsViewButton](self, "callDetailsViewButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)snapshotWithOptions:(unint64_t)a3 completionBlock:(id)a4
{
  -[TPInComingCallUISnapshotViewController snapshotWithOptions:windowScene:useAttachmentConfiguration:completionBlock:](self, "snapshotWithOptions:windowScene:useAttachmentConfiguration:completionBlock:", a3, 0, 0, a4);
}

- (void)snapshotWithOptions:(unint64_t)a3 windowScene:(id)a4 completionBlock:(id)a5
{
  -[TPInComingCallUISnapshotViewController snapshotWithOptions:windowScene:useAttachmentConfiguration:completionBlock:](self, "snapshotWithOptions:windowScene:useAttachmentConfiguration:completionBlock:", a3, a4, 1, a5);
}

- (void)snapshotWithOptions:(unint64_t)a3 windowScene:(id)a4 useAttachmentConfiguration:(BOOL)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  id *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;
  _QWORD block[5];
  id v18;

  v9 = a4;
  v10 = a6;
  v11 = -[TPInComingCallUISnapshotViewController style](self, "style");
  if (v11 < 4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_2;
    v13[3] = &unk_1E75FD020;
    v13[4] = self;
    v16 = a5;
    v12 = &v14;
    v14 = v9;
    v15 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

LABEL_5:
    goto LABEL_6;
  }
  if (v11 - 4 <= 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke;
    block[3] = &unk_1E75FCF80;
    block[4] = self;
    v12 = &v18;
    v18 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_5;
  }
LABEL_6:

}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTraitsIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "generateOverlaysSnapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
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
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_class *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  BOOL v73;
  _QWORD block[5];
  BOOL v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  Class (*v79)(uint64_t);
  void *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3 == v4;

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "hideElementsBasedOn:", objc_msgSend(*(id *)(a1 + 32), "style"));
  objc_msgSend(*(id *)(a1 + 32), "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0;
  v83 = &v82;
  v84 = 0x2050000000;
  v9 = (void *)getPRUISIncomingCallPosterContextClass_softClass;
  v85 = getPRUISIncomingCallPosterContextClass_softClass;
  if (!getPRUISIncomingCallPosterContextClass_softClass)
  {
    v77 = MEMORY[0x1E0C809B0];
    v78 = 3221225472;
    v79 = __getPRUISIncomingCallPosterContextClass_block_invoke;
    v80 = &unk_1E75FD048;
    v81 = &v82;
    __getPRUISIncomingCallPosterContextClass_block_invoke((uint64_t)&v77);
    v9 = (void *)v83[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v82, 8);
  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:window:](TPIncomingCallMetricsProvider, "horizontalNameLabelBoundingRectForName:window:", v8, 0);
  v65 = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:window:](TPIncomingCallMetricsProvider, "verticalNameLabelBoundingRectForName:window:", v8, 0);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = [v10 alloc];
  objc_msgSend(*(id *)(a1 + 32), "nameLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v26, "initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v28, 0, 1, v65, v13, v15, v17, v19, v21, v23, v25);

  v82 = 0;
  v83 = &v82;
  v84 = 0x2050000000;
  v30 = (void *)getPRUISIncomingCallSnapshotDefinitionClass_softClass;
  v85 = getPRUISIncomingCallSnapshotDefinitionClass_softClass;
  if (!getPRUISIncomingCallSnapshotDefinitionClass_softClass)
  {
    v77 = MEMORY[0x1E0C809B0];
    v78 = 3221225472;
    v79 = __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke;
    v80 = &unk_1E75FD048;
    v81 = &v82;
    __getPRUISIncomingCallSnapshotDefinitionClass_block_invoke((uint64_t)&v77);
    v30 = (void *)v83[3];
  }
  v31 = objc_retainAutorelease(v30);
  _Block_object_dispose(&v82, 8);
  v32 = [v31 alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifierForStyle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachmentIdentifiersForStyle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v32, "initWithBaseIdentifier:context:attachmentUniqueIdentifiers:", v33, v29, v34);

  v82 = 0;
  v83 = &v82;
  v84 = 0x2050000000;
  v36 = (void *)getPRUISMutablePosterSnapshotRequestClass_softClass;
  v85 = getPRUISMutablePosterSnapshotRequestClass_softClass;
  if (!getPRUISMutablePosterSnapshotRequestClass_softClass)
  {
    v77 = MEMORY[0x1E0C809B0];
    v78 = 3221225472;
    v79 = __getPRUISMutablePosterSnapshotRequestClass_block_invoke;
    v80 = &unk_1E75FD048;
    v81 = &v82;
    __getPRUISMutablePosterSnapshotRequestClass_block_invoke((uint64_t)&v77);
    v36 = (void *)v83[3];
  }
  v37 = objc_retainAutorelease(v36);
  _Block_object_dispose(&v82, 8);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", v38, v35, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 40))
  {
    v82 = 0;
    v83 = &v82;
    v84 = 0x2050000000;
    v40 = (void *)getPRUISPosterAttachmentConfigurationClass_softClass;
    v85 = getPRUISPosterAttachmentConfigurationClass_softClass;
    if (!getPRUISPosterAttachmentConfigurationClass_softClass)
    {
      v77 = MEMORY[0x1E0C809B0];
      v78 = 3221225472;
      v79 = __getPRUISPosterAttachmentConfigurationClass_block_invoke;
      v80 = &unk_1E75FD048;
      v81 = &v82;
      __getPRUISPosterAttachmentConfigurationClass_block_invoke((uint64_t)&v77);
      v40 = (void *)v83[3];
    }
    v41 = objc_retainAutorelease(v40);
    _Block_object_dispose(&v82, 8);
    v42 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "attachmentsForStyle");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)v43;
    if (v43)
      v45 = v43;
    else
      v45 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v41, "attachmentConfigurationWithHostWindowScene:attachments:", v42, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "setAttachmentConfiguration:", v46);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "attachmentsForStyle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAttachments:", v46);
  }

  v82 = 0;
  v83 = &v82;
  v84 = 0x2050000000;
  v47 = (void *)getPRUISPosterSnapshotControllerClass_softClass;
  v85 = getPRUISPosterSnapshotControllerClass_softClass;
  if (!getPRUISPosterSnapshotControllerClass_softClass)
  {
    v77 = MEMORY[0x1E0C809B0];
    v78 = 3221225472;
    v79 = __getPRUISPosterSnapshotControllerClass_block_invoke;
    v80 = &unk_1E75FD048;
    v81 = &v82;
    __getPRUISPosterSnapshotControllerClass_block_invoke((uint64_t)&v77);
    v47 = (void *)v83[3];
  }
  v64 = a1;
  v66 = (void *)v29;
  v48 = objc_retainAutorelease(v47);
  _Block_object_dispose(&v82, 8);
  objc_msgSend(v48, "sharedIncomingCallSnapshotController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  objc_msgSend(v49, "latestSnapshotBundleForRequest:error:", v39, &v76);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v76;
  if (!v50)
    goto LABEL_24;
  objc_msgSend(v35, "levelSets");
  v52 = v49;
  v53 = v39;
  v54 = v51;
  v55 = v35;
  v56 = v8;
  v57 = v5;
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "snapshotForLevelSet:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v57;
  v8 = v56;
  v35 = v55;
  v51 = v54;
  v39 = v53;
  v49 = v52;
  if (v60)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_3;
    block[3] = &unk_1E75FCFA8;
    v75 = v5;
    block[4] = *(_QWORD *)(v64 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    (*(void (**)(void))(*(_QWORD *)(v64 + 48) + 16))();
  }
  else
  {
LABEL_24:
    dispatch_get_global_queue(-32768, 0);
    v61 = objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_4;
    v67[3] = &unk_1E75FCFF8;
    v68 = v49;
    v69 = v39;
    v62 = *(id *)(v64 + 48);
    v73 = v5;
    v63 = *(_QWORD *)(v64 + 32);
    v72 = v62;
    v70 = v63;
    v71 = v35;
    dispatch_async(v61, v67);

    v60 = v68;
  }

}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v2);

  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_5;
  v7[3] = &unk_1E75FCFD0;
  v4 = *(id *)(a1 + 64);
  v10 = *(_BYTE *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v9 = v4;
  v7[4] = v5;
  v8 = v6;
  objc_msgSend(v2, "executeSnapshotRequest:completion:", v3, v7);

}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  char v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "snapshotBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "levelSets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshotForLevelSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(_QWORD, void *, _QWORD))(v8 + 16))(*(_QWORD *)(a1 + 48), v7, 0);
      v15 = MEMORY[0x1E0C809B0];
      v9 = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_7;
      v10 = &v15;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("Snapshot generation returned nil snapshot");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.TPInComingCallUISnapshotViewController"), -1, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v13);

      v14 = MEMORY[0x1E0C809B0];
      v9 = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_8;
      v10 = &v14;
    }
    v10[1] = 3221225472;
    v10[2] = (uint64_t)v9;
    v10[3] = (uint64_t)&unk_1E75FCFA8;
    *((_BYTE *)v10 + 40) = *(_BYTE *)(a1 + 56);
    v10[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_6;
    block[3] = &unk_1E75FCFA8;
    v17 = *(_BYTE *)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v2);

  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v2);

  }
}

void __117__TPInComingCallUISnapshotViewController_snapshotWithOptions_windowScene_useAttachmentConfiguration_completionBlock___block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overlaysContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", v2);

  }
}

- (UIView)overlaysContainerView
{
  return self->_overlaysContainerView;
}

- (void)setOverlaysContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_overlaysContainerView, a3);
}

- (PRPosterLabel)mobileLabel
{
  return self->_mobileLabel;
}

- (void)setMobileLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mobileLabel, a3);
}

- (UIButton)remindMeButton
{
  return self->_remindMeButton;
}

- (void)setRemindMeButton:(id)a3
{
  objc_storeStrong((id *)&self->_remindMeButton, a3);
}

- (UIButton)messageButton
{
  return self->_messageButton;
}

- (void)setMessageButton:(id)a3
{
  objc_storeStrong((id *)&self->_messageButton, a3);
}

- (UIButton)declineButton
{
  return self->_declineButton;
}

- (void)setDeclineButton:(id)a3
{
  objc_storeStrong((id *)&self->_declineButton, a3);
}

- (UIButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
  objc_storeStrong((id *)&self->_acceptButton, a3);
}

- (UIButton)callDetailsViewButton
{
  return self->_callDetailsViewButton;
}

- (void)setCallDetailsViewButton:(id)a3
{
  objc_storeStrong((id *)&self->_callDetailsViewButton, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (PRSPosterConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UILabel)fakeLabel
{
  return self->_fakeLabel;
}

- (void)setFakeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fakeLabel, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (UIImage)customAvatar
{
  return self->_customAvatar;
}

- (void)setCustomAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_customAvatar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAvatar, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_fakeLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_callDetailsViewButton, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_remindMeButton, 0);
  objc_storeStrong((id *)&self->_mobileLabel, 0);
  objc_storeStrong((id *)&self->_overlaysContainerView, 0);
}

- (TPInComingCallUISnapshotViewController)initWithConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 fallbackText:(id)a6
{
  id v10;
  id v11;
  TPInComingCallUISnapshotViewController *v12;
  TPInComingCallUISnapshotViewController *v13;
  objc_class *v14;
  id v15;
  id v16;
  TPInComingCallUISnapshotViewController *v17;

  v10 = a6;
  if (a5)
  {
    v11 = a3;
    v12 = -[TPInComingCallUISnapshotViewController initWithConfiguration:style:contact:](self, "initWithConfiguration:style:contact:", v11, a4, a5);

    v13 = v12;
  }
  else
  {
    v14 = (objc_class *)MEMORY[0x1E0C97360];
    v15 = a3;
    v16 = objc_alloc_init(v14);
    objc_msgSend(v16, "setGivenName:", v10);
    v17 = -[TPInComingCallUISnapshotViewController initWithConfiguration:style:contact:](self, "initWithConfiguration:style:contact:", v15, a4, v16);

    v13 = v17;
  }

  return v13;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:caption:window:preferredTitleFont:](TPIncomingCallMetricsProvider, "horizontalNameLabelBoundingRectForName:caption:window:preferredTitleFont:", a3, 0, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  +[TPIncomingCallMetricsProvider horizontalNameLabelBoundingRectForName:caption:window:preferredTitleFont:](TPIncomingCallMetricsProvider, "horizontalNameLabelBoundingRectForName:caption:window:preferredTitleFont:", a3, a4, a5, a6);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:caption:window:preferredTitleFont:](TPIncomingCallMetricsProvider, "verticalNameLabelBoundingRectForName:caption:window:preferredTitleFont:", a3, 0, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 caption:(id)a4 window:(id)a5 preferredTitleFont:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  +[TPIncomingCallMetricsProvider verticalNameLabelBoundingRectForName:caption:window:preferredTitleFont:](TPIncomingCallMetricsProvider, "verticalNameLabelBoundingRectForName:caption:window:preferredTitleFont:", a3, a4, a5, a6);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)identifierForStyle
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PRPosterSnapshotDefinitionIdentifier getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TPInComingCallUISnapshotViewController.m"), 68, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
