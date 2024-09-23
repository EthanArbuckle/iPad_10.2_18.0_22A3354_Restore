@implementation ICDrawingRegressionTestDataCollectionViewController

- (ICDrawingRegressionTestDataCollectionViewController)initWithDrawingAttachments:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  ICDrawingRegressionTestDataCollectionViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSArray *v17;
  NSArray *drawingAttachments;
  NSArray *v19;
  NSArray *drawings;
  NSArray *v21;
  NSArray *cellImages;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICDrawingRegressionTestDataCollectionViewController;
  v8 = -[ICDrawingRegressionTestDataCollectionViewController init](&v32, "init");
  if (v8 && objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));

    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100105954;
    v27 = &unk_100550098;
    v28 = v6;
    v29 = v9;
    v30 = v10;
    v31 = v11;
    v14 = v11;
    v15 = v10;
    v16 = v9;
    objc_msgSend(v13, "performBlockAndWait:", &v24);
    v17 = (NSArray *)objc_msgSend(v16, "copy", v24, v25, v26, v27);
    drawingAttachments = v8->_drawingAttachments;
    v8->_drawingAttachments = v17;

    v19 = (NSArray *)objc_msgSend(v15, "copy");
    drawings = v8->_drawings;
    v8->_drawings = v19;

    v21 = (NSArray *)objc_msgSend(v14, "copy");
    cellImages = v8->_cellImages;
    v8->_cellImages = v21;

    objc_storeStrong((id *)&v8->_customDescription, a4);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  double y;
  double width;
  double height;
  id v18;
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
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  objc_class *v68;
  NSString *v69;
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
  objc_super v140;

  v140.receiver = self;
  v140.super_class = (Class)ICDrawingRegressionTestDataCollectionViewController;
  -[ICDrawingRegressionTestDataCollectionViewController viewDidLoad](&v140, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Sketches"), &stru_1005704B8, 0));
  -[ICDrawingRegressionTestDataCollectionViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelButtonTapped:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  v9 = objc_alloc((Class)UIBarButtonItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Submit"), &stru_1005704B8, 0));
  v12 = objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, self, "sendRadarButtonTapped:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  v14 = objc_alloc((Class)UIScrollView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v18 = objc_msgSend(v14, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[ICDrawingRegressionTestDataCollectionViewController setScrollView:](self, "setScrollView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  objc_msgSend(v19, "setAlwaysBounceVertical:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  objc_msgSend(v21, "addSubview:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "safeAreaLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v27));
  objc_msgSend(v28, "setActive:", 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController view](self, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v33));
  objc_msgSend(v34, "setActive:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "safeAreaLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v39));
  objc_msgSend(v40, "setActive:", 1);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "safeAreaLayoutGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v45));
  objc_msgSend(v46, "setActive:", 1);

  v47 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[ICDrawingRegressionTestDataCollectionViewController setDescriptionLabel:](self, "setDescriptionLabel:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v48, "setNumberOfLines:", 0);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController customDescription](self, "customDescription"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v50, "setText:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "ic_fontWithSingleLineA"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v53, "setFont:", v52);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v55, "addSubview:", v56);

  v57 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  objc_msgSend(v57, "setMinimumLineSpacing:", 20.0);
  objc_msgSend(v57, "setMinimumInteritemSpacing:", 20.0);
  objc_msgSend(v57, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v57, "setItemSize:", 240.0, 240.0);
  v58 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v57, CGRectZero.origin.x, y, width, height);
  -[ICDrawingRegressionTestDataCollectionViewController setCollectionView:](self, "setCollectionView:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v61, "setBackgroundColor:", v60);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v62, "setDataSource:", self);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v63, "setDelegate:", self);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v64, "setAllowsSelection:", 1);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v65, "setAllowsMultipleSelection:", 1);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v67 = objc_opt_class(ICDrawingRegressionTestDataCollectionViewCell);
  v68 = (objc_class *)objc_opt_class(ICDrawingRegressionTestDataCollectionViewCell);
  v69 = NSStringFromClass(v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  objc_msgSend(v66, "registerClass:forCellWithReuseIdentifier:", v67, v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v71, "addSubview:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "contentLayoutGuide"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v77, -20.0));
  objc_msgSend(v78, "setActive:", 1);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "contentLayoutGuide"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "leadingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v83, -20.0));
  objc_msgSend(v84, "setActive:", 1);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "contentLayoutGuide"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "trailingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v89, 20.0));
  objc_msgSend(v90, "setActive:", 1);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController descriptionLabel](self, "descriptionLabel"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "bottomAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v94, -20.0));
  objc_msgSend(v95, "setActive:", 1);

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "contentLayoutGuide"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "leadingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:constant:", v100, -20.0));
  objc_msgSend(v101, "setActive:", 1);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "contentLayoutGuide"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "trailingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:constant:", v106, 20.0));
  objc_msgSend(v107, "setActive:", 1);

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "contentLayoutGuide"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "bottomAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "bottomAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v112, 20.0));
  objc_msgSend(v113, "setActive:", 1);

  v114 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "frameLayoutGuide"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "widthAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "widthAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:constant:", v118, -40.0));
  objc_msgSend(v119, "setActive:", 1);

  v120 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "contentLayoutGuide"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "widthAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "frameLayoutGuide"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "widthAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToAnchor:constant:", v125, -40.0));
  objc_msgSend(v126, "setActive:", 1);

  v127 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "frameLayoutGuide"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "centerXAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "contentLayoutGuide"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "centerXAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v132));
  objc_msgSend(v133, "setActive:", 1);

  v134 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "heightAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToConstant:", 0.0));
  -[ICDrawingRegressionTestDataCollectionViewController setCollectionViewHeightConstraint:](self, "setCollectionViewHeightConstraint:", v136);

  v137 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint"));
  objc_msgSend(v137, "setActive:", 0);

  v138 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v138, "setScrollEnabled:", 0);

  v139 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v139, "reloadData");

  -[ICDrawingRegressionTestDataCollectionViewController selectAll](self, "selectAll");
  -[ICDrawingRegressionTestDataCollectionViewController adjustCollectionViewHeight](self, "adjustCollectionViewHeight");

}

- (void)selectAll
{
  unint64_t v3;
  void *v4;
  void *v5;

  if (-[NSArray count](self->_drawings, "count"))
  {
    v3 = 0;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v3, 0));
      objc_msgSend(v4, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 0);

      ++v3;
    }
    while (v3 < -[NSArray count](self->_drawings, "count"));
  }
}

- (void)adjustCollectionViewHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "setNeedsLayout");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setNeedsLayout");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "layoutIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "contentSize");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint"));
  objc_msgSend(v10, "setConstant:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionViewHeightConstraint](self, "collectionViewHeightConstraint"));
  objc_msgSend(v11, "setActive:", 1);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICDrawingRegressionTestDataCollectionViewController;
  -[ICDrawingRegressionTestDataCollectionViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[ICDrawingRegressionTestDataCollectionViewController adjustCollectionViewHeight](self, "adjustCollectionViewHeight");
}

- (void)cancelButtonTapped:(id)a3
{
  -[ICDrawingRegressionTestDataCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)openURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "openURL:options:completionHandler:", v3, &__NSDictionary0__struct, 0);

}

- (void)sendRadarButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  v6 = NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v5, 1));

  v10 = objc_alloc_init((Class)NSFileManager);
  v11 = 0;
  if (objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v11))
  {
    -[ICDrawingRegressionTestDataCollectionViewController openTapToRadarWithTempDirectoryURL:](self, "openTapToRadarWithTempDirectoryURL:", v9);
    -[ICDrawingRegressionTestDataCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)openTapToRadarWithTempDirectoryURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v31;

  v31 = (id)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController saveDataForDrawingsBaseURL:](self, "saveDataForDrawingsBaseURL:", a3));
  v3 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v3, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v3, "setHost:", CFSTR("new"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ComponentName"), CFSTR("PencilKit"));
  objc_msgSend(v4, "addObject:", v5);

  v6 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("all"));
  objc_msgSend(v4, "addObject:", v6);

  v7 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("ComponentID"), CFSTR("808171"));
  objc_msgSend(v4, "addObject:", v7);

  v8 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("0"));
  objc_msgSend(v4, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "operatingSystemVersionString"));

  v29 = (void *)v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Regression Test Data: %@"), v10));
  v12 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Title"), v11);
  objc_msgSend(v4, "addObject:", v12);

  v13 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  objc_msgSend(v4, "addObject:", v13);

  v14 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v4, "addObject:", v14);

  v15 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Description"), CFSTR("Fullscreen drawing regression test data and images. Please note that your submission may contain erased strokes which are no longer visible."));
  objc_msgSend(v4, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v31, "count"))
  {
    v18 = 0;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathExtension"));
      v22 = objc_msgSend(v21, "compare:options:", CFSTR("png"), 1);

      if (v22)
        v23 = v16;
      else
        v23 = v17;
      objc_msgSend(v23, "addObject:", v20);

      ++v18;
    }
    while ((unint64_t)objc_msgSend(v31, "count") > v18);
  }
  if (objc_msgSend(v17, "count"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(",")));
    v25 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Screenshot"), v24);
    objc_msgSend(v4, "addObject:", v25);

  }
  if (objc_msgSend(v16, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR(",")));
    v27 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("Attachments"), v26);
    objc_msgSend(v4, "addObject:", v27);

  }
  objc_msgSend(v3, "setQueryItems:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  -[ICDrawingRegressionTestDataCollectionViewController openURL:](self, "openURL:", v28);

}

- (id)saveDataForDrawingsBaseURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));

  obj = v7;
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v8), "item");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController drawings](self, "drawings"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithPathData:", 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/drawing_%d.data"), v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v13, 0));

        objc_msgSend(v12, "writeToURL:atomically:", v14, 1);
        objc_msgSend(v5, "addObject:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController drawingAttachments](self, "drawingAttachments"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v9));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedObjectContext"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001071D0;
        v24[3] = &unk_100553778;
        v25 = v16;
        v26 = v4;
        v28 = v9;
        v27 = v5;
        v18 = v16;
        objc_msgSend(v17, "performBlockAndWait:", v24);

        v8 = (char *)v8 + 1;
      }
      while (v23 != v8);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v23);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController navigationItem](self, "navigationItem", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController collectionView](self, "collectionView", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathsForSelectedItems"));
  v6 = objc_msgSend(v5, "count") != 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController navigationItem](self, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", v6);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class(ICDrawingRegressionTestDataCollectionViewCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subviews"));
  v14 = objc_msgSend(v13, "copy");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v19), "removeFromSuperview", (_QWORD)v32);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v17);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController cellImages](self, "cellImages"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  v22 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
  objc_msgSend(v23, "setMinificationFilter:", kCAFilterTrilinear);

  objc_msgSend(v22, "setContentMode:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
  objc_msgSend(v24, "addSubview:", v22);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
  objc_msgSend(v25, "bounds");
  objc_msgSend(v22, "setFrame:");

  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor")));
  v27 = objc_msgSend(v26, "CGColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v28, "setBorderColor:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v29, "setBorderWidth:", 0.5);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
  objc_msgSend(v30, "setCornerRadius:", 8.0);

  return v11;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDrawingRegressionTestDataCollectionViewController cellImages](self, "cellImages", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (NSArray)drawingAttachments
{
  return self->_drawingAttachments;
}

- (void)setDrawingAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)cellImages
{
  return self->_cellImages;
}

- (void)setCellImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_cellImages, 0);
  objc_storeStrong((id *)&self->_drawings, 0);
  objc_storeStrong((id *)&self->_drawingAttachments, 0);
}

@end
