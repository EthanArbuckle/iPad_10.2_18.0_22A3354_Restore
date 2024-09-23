@implementation BKLibraryContextualActionSheetmetadataEditor

- (BKLibraryContextualActionSheetmetadataEditor)initWithLibraryAsset:(id)a3
{
  id v5;
  BKLibraryContextualActionSheetmetadataEditor *v6;
  BKLibraryContextualActionSheetmetadataEditor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryContextualActionSheetmetadataEditor;
  v6 = -[BKLibraryContextualActionSheetmetadataEditor init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_libraryAsset, a3);

  return v7;
}

- (CGSize)preferredContentSize
{
  void *v2;
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
  v3 = objc_msgSend(v2, "contentType") == 3;

  v4 = dbl_10070CB30[v3];
  v5 = 438.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)viewDidLoad
{
  BKLibraryContextualActionSheetmetadataEditor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  float v47;
  float v48;
  void *v49;
  float v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  BKLibrarymetadataEditorCoverBorderView *v62;
  void *v63;
  BKLibraryContextualActionSheetmetadataEditor *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
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
  BKLibrarymetadataEditorCoverBorderView *v83;
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
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  BKLibrarymetadataEditorCoverBorderView *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  objc_super v209;
  _QWORD v210[15];
  _QWORD v211[24];

  v2 = self;
  v209.receiver = self;
  v209.super_class = (Class)BKLibraryContextualActionSheetmetadataEditor;
  -[BKLibraryContextualActionSheetmetadataEditor viewDidLoad](&v209, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Book Info"), &stru_10091C438, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddLabel:style:](v2, "_makeAndAddLabel:style:", v7, 208));

  v9 = objc_alloc_init((Class)UIView);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor")));
  v11 = objc_msgSend(v10, "CGColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  objc_msgSend(v13, "addSubview:", v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Title"), &stru_10091C438, 0));
  v207 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddLabel:style:](v2, "_makeAndAddLabel:style:", v15, 55));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](v2, "libraryAsset"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _trimString:](v2, "_trimString:", v17));

  if (!objc_msgSend(v18, "length"))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[BKLibraryAsset unknownTitle](BKLibraryAsset, "unknownTitle"));

    v18 = (void *)v19;
  }
  v206 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddTextField:](v2, "_makeAndAddTextField:", v18));
  -[BKLibraryContextualActionSheetmetadataEditor setTitleTextField:](v2, "setTitleTextField:");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Author"), &stru_10091C438, 0));
  v205 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddLabel:style:](v2, "_makeAndAddLabel:style:", v21, 55));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](v2, "libraryAsset"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "displayAuthor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _trimString:](v2, "_trimString:", v23));

  v196 = v18;
  if (!objc_msgSend(v24, "length"))
  {
    v25 = objc_claimAutoreleasedReturnValue(+[BKLibraryAsset unknownAuthor](BKLibraryAsset, "unknownAuthor"));

    v24 = (void *)v25;
  }
  v195 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddTextField:](v2, "_makeAndAddTextField:", v24));
  -[BKLibraryContextualActionSheetmetadataEditor setAuthorTextField:](v2, "setAuthorTextField:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));
  v204 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddSystemButton:action:text:](v2, "_makeAndAddSystemButton:action:text:", 1, "_okButtonPressed:", v28));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_10091C438, 0));
  v203 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddSystemButton:action:text:](v2, "_makeAndAddSystemButton:action:text:", 2, "_cancelButtonPressed:", v30));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](v2, "libraryAsset"));
  LODWORD(v29) = objc_msgSend(v31, "contentType");

  v32 = 0;
  v198 = 0;
  v202 = 0;
  v199 = 0;
  v200 = v8;
  v208 = v26;
  if ((_DWORD)v29 != 3)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Cover"), &stru_10091C438, 0));
    v35 = objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _makeAndAddLabel:style:](v2, "_makeAndAddLabel:style:", v34, 55));

    v36 = objc_alloc_init((Class)UIView);
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
    objc_msgSend(v37, "addSubview:", v36);

    -[BKLibraryContextualActionSheetmetadataEditor setCoverContainer:](v2, "setCoverContainer:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
    objc_msgSend(v38, "setCornerRadius:", 6.0);

    v202 = v36;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
    objc_msgSend(v39, "setMasksToBounds:", 1);

    v40 = objc_alloc_init((Class)UIView);
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](v2, "libraryAsset"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "assetID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "metadataForIdentifier:", v43));

    v45 = 35.8974359;
    v199 = (void *)v35;
    if (v44)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "intrinsicAspectRatio"));
      objc_msgSend(v46, "floatValue");
      v48 = v47;

      if (v48 > 0.0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "intrinsicAspectRatio"));
        objc_msgSend(v49, "floatValue");
        v45 = 56.0 / v50;

      }
    }
    -[BKLibraryContextualActionSheetmetadataEditor setCoverSize:](v2, "setCoverSize:", v45, 56.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](v2, "libraryAsset"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "assetID"));
    -[BKLibraryContextualActionSheetmetadataEditor coverSize](v2, "coverSize");
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "fetchLayerForAssetID:size:options:", v53, 0));

    -[BKLibraryContextualActionSheetmetadataEditor coverSize](v2, "coverSize");
    v56 = v55 * 0.5;
    -[BKLibraryContextualActionSheetmetadataEditor coverSize](v2, "coverSize");
    objc_msgSend(v54, "setPosition:", v56, v57 * 0.5);
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layer"));
    objc_msgSend(v58, "addSublayer:", v54);

    v59 = objc_opt_class(BCCacheVendedLayer);
    v60 = BUDynamicCast(v59, v54);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    objc_msgSend(v61, "setVendedLayerDelegate:", v2);
    v62 = objc_alloc_init(BKLibrarymetadataEditorCoverBorderView);
    -[BKLibrarymetadataEditorCoverBorderView setTranslatesAutoresizingMaskIntoConstraints:](v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKLibrarymetadataEditorCoverBorderView setOpaque:](v62, "setOpaque:", 0);
    objc_msgSend(v202, "addSubview:", v62);
    v198 = v62;
    -[BKLibraryContextualActionSheetmetadataEditor setCoverBorderView:](v2, "setCoverBorderView:", v62);
    -[BKLibraryContextualActionSheetmetadataEditor _updateCoverView:](v2, "_updateCoverView:", v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v32, "addTarget:action:forControlEvents:", v2, "_coverButtonPressed:", 64);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v64 = v2;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Choose Cover"), &stru_10091C438, 0));
    objc_msgSend(v32, "setAccessibilityLabel:", v65);

    v2 = v64;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Choose an image to use as a book cover"), &stru_10091C438, 0));
    objc_msgSend(v32, "setAccessibilityHint:", v67);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v64, "view"));
    objc_msgSend(v68, "addSubview:", v32);

    v69 = objc_msgSend(objc_alloc((Class)UIDropInteraction), "initWithDelegate:", v64);
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v64, "view"));
    objc_msgSend(v70, "addInteraction:", v69);

    v26 = v208;
    v8 = v200;
  }
  v201 = v32;
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor", v2));
  v193 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "centerXAnchor"));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "constraintEqualToAnchor:", v189));
  v211[0] = v187;
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "topAnchor"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintEqualToAnchor:constant:", v181, 28.0));
  v211[1] = v179;
  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "leadingAnchor"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "constraintEqualToAnchor:constant:", v173, 20.0));
  v211[2] = v171;
  v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "trailingAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "constraintEqualToAnchor:constant:", v165, -20.0));
  v211[3] = v163;
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "topAnchor"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "constraintEqualToAnchor:constant:", v158, 55.0));
  v211[4] = v156;
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToConstant:", 1.0));
  v211[5] = v152;
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "topAnchor"));
  v197 = v9;
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:constant:", v148, 20.0));
  v211[6] = v146;
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "trailingAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "trailingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:constant:", v140, -20.0));
  v211[7] = v138;
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "widthAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToConstant:", 298.0));
  v211[8] = v133;
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "heightAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToConstant:", 29.0));
  v211[9] = v129;
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "firstBaselineAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "firstBaselineAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "constraintEqualToAnchor:", v126));
  v211[10] = v125;
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "trailingAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "leadingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:constant:", v123, -12.0));
  v211[11] = v122;
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "bottomAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:constant:", v120, 9.0));
  v211[12] = v119;
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "trailingAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:constant:", v116, -20.0));
  v211[13] = v115;
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToConstant:", 298.0));
  v211[14] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "heightAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToConstant:", 29.0));
  v211[15] = v111;
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "firstBaselineAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstBaselineAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
  v211[16] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "trailingAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:constant:", v106, -12.0));
  v211[17] = v105;
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "bottomAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "bottomAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:constant:", v102, -20.0));
  v211[18] = v101;
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](v2, "view"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:constant:", v98, -20.0));
  v211[19] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "widthAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintGreaterThanOrEqualToConstant:", 74.0));
  v211[20] = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v73));
  v211[21] = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, -8.0));
  v211[22] = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "widthAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintGreaterThanOrEqualToConstant:", 74.0));
  v211[23] = v79;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v211, 24));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v80);

  v81 = v199;
  v82 = v202;
  v83 = v198;
  if (v202)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "widthAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToConstant:", 40.0));
    objc_msgSend(v95, "setCoverWidthConstraint:", v85);

    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "heightAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToConstant:", 56.0));
    objc_msgSend(v95, "setCoverHeightConstraint:", v87);

    v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "topAnchor"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "bottomAnchor"));
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "constraintEqualToAnchor:constant:", v192, 10.0));
    v210[0] = v190;
    v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "leadingAnchor"));
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "leadingAnchor"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "constraintEqualToAnchor:", v186));
    v210[1] = v184;
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "coverHeightConstraint"));
    v210[2] = v182;
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "coverWidthConstraint"));
    v210[3] = v180;
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarymetadataEditorCoverBorderView topAnchor](v198, "topAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "topAnchor"));
    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "constraintEqualToAnchor:", v176));
    v210[4] = v174;
    v172 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarymetadataEditorCoverBorderView bottomAnchor](v198, "bottomAnchor"));
    v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "bottomAnchor"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "constraintEqualToAnchor:", v170));
    v210[5] = v168;
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarymetadataEditorCoverBorderView leadingAnchor](v198, "leadingAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "leadingAnchor"));
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "constraintEqualToAnchor:", v164));
    v210[6] = v162;
    v159 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarymetadataEditorCoverBorderView trailingAnchor](v198, "trailingAnchor"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "trailingAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:", v157));
    v210[7] = v155;
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "topAnchor"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "topAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToAnchor:", v151));
    v210[8] = v149;
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "heightAnchor"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToConstant:", 29.0));
    v210[9] = v145;
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "trailingAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "leadingAnchor"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:constant:", v141, -12.0));
    v210[10] = v139;
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "topAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "topAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:", v135));
    v210[11] = v134;
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "bottomAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "bottomAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v130));
    v210[12] = v128;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "leadingAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v89));
    v210[13] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "trailingAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "trailingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v92));
    v210[14] = v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v210, 15));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v94);

    v82 = v202;
    v81 = v199;
    v83 = v198;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryContextualActionSheetmetadataEditor;
  -[BKLibraryContextualActionSheetmetadataEditor viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BKLibraryContextualActionSheetmetadataEditor setAppearedFirstTime:](self, "setAppearedFirstTime:", 1);
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c"), 27));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v2, 0, "_escKeyPressed:"));

  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return -[BKLibraryContextualActionSheetmetadataEditor appearedFirstTime](self, "appearedFirstTime", a3);
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  if (!a4)
  {
    v13 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    v8 = objc_msgSend(v7, "length");

    v6 = v13;
    if (!v8)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor titleTextField](self, "titleTextField"));

      if (v9 == v13)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));

      }
      else
      {
        v10 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor authorTextField](self, "authorTextField"));

        v6 = v13;
        if (v10 != v13)
          goto LABEL_3;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAsset unknownAuthor](BKLibraryAsset, "unknownAuthor"));
      }
      v6 = v13;
      if (v11)
      {
        objc_msgSend(v13, "setText:", v11);

        v6 = v13;
      }
    }
  }
LABEL_3:

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v6));

  if (v7)
  {
    -[BKLibraryContextualActionSheetmetadataEditor _handleCoverUpdateRequest:](self, "_handleCoverUpdateRequest:", v7);
  }
  else
  {
    v11 = BKLibraryLog(v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1006A3134((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v9;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v6);

  return v7;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v18;
  CGPoint v19;
  CGRect v20;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v8 = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
    objc_msgSend(v5, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
    objc_msgSend(v14, "bounds");
    v19.x = v11;
    v19.y = v13;
    LODWORD(v9) = CGRectContainsPoint(v20, v19);

    if ((_DWORD)v9)
      v15 = 2;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(objc_alloc((Class)UIDropProposal), "initWithDropOperation:", v15);

  return v16;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100185D40;
  v10[3] = &unk_1008ED4F8;
  v10[4] = self;
  v9 = objc_msgSend(v7, "loadDataRepresentationForTypeIdentifier:completionHandler:", v8, v10);

}

- (void)vendedLayerDidUpdate:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "bounds");
  v5 = v4;
  v7 = v6;
  -[BKLibraryContextualActionSheetmetadataEditor coverSize](self, "coverSize");
  if (v5 != v9 || v7 != v8)
  {
    -[BKLibraryContextualActionSheetmetadataEditor setCoverSize:](self, "setCoverSize:", v5, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverWidthConstraint](self, "coverWidthConstraint"));
    objc_msgSend(v11, "setConstant:", v5);

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    objc_msgSend(v12, "setPosition:", v5 * 0.5, v7 * 0.5);
    +[CATransaction commit](CATransaction, "commit");
  }

}

- (void)_okButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  BKLibraryContextualActionSheetmetadataEditor *v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor titleTextField](self, "titleTextField", a3));
  objc_msgSend(v4, "endEditing:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor authorTextField](self, "authorTextField"));
  objc_msgSend(v5, "endEditing:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor titleTextField](self, "titleTextField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _trimString:](self, "_trimString:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor authorTextField](self, "authorTextField"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor _trimString:](self, "_trimString:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAsset unknownAuthor](BKLibraryAsset, "unknownAuthor"));
  v16 = objc_msgSend(v14, "isEqualToString:", v15);
  v17 = (void *)BKLibrarySortLastUnknownAuthorString;
  if (!v16)
    v17 = v14;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "author"));
  v21 = objc_msgSend(v18, "isEqualToString:", v20);

  v25 = BKLibraryLog(v22, v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "assetID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "title"));
    v42 = v14;
    v30 = v8;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
    v40 = v21;
    v32 = v11;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "author"));
    *(_DWORD *)buf = 141559298;
    v50 = 1752392040;
    v51 = 2112;
    v52 = v27;
    v53 = 2112;
    v54 = v29;
    v55 = 2112;
    v56 = v33;
    v57 = 2112;
    v58 = v30;
    v59 = 2112;
    v60 = v18;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MetadataEditor updateTitle] BEGIN assetID:%{mask.hash}@ (OLD title:%@ author:%@) to (NEW title:%@ author:%@)", buf, 0x3Eu);

    v11 = v32;
    v21 = v40;

    v8 = v30;
    v14 = v42;

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor updatedCoverImageData](self, "updatedCoverImageData"));
  if (v34)
    v35 = 0;
  else
    v35 = v11;
  if (v35 == 1)
  {
    if ((v21 & 1) != 0)
      goto LABEL_13;
  }
  else
  {

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor libraryAsset](self, "libraryAsset"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "assetID"));

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001862A8;
  v43[3] = &unk_1008ED548;
  v44 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v45 = v37;
  v46 = v8;
  v47 = v18;
  v48 = self;
  v38 = v37;
  v39 = v44;
  objc_msgSend(v39, "performBlockOnWorkerQueue:", v43);

LABEL_13:
  -[BKLibraryContextualActionSheetmetadataEditor _dismiss](self, "_dismiss");

}

- (void)_coverButtonPressed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  UTType *v7;

  v4 = objc_alloc((Class)UIDocumentPickerViewController);
  v7 = UTTypeImage;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v6 = objc_msgSend(v4, "initForOpeningContentTypes:asCopy:", v5, 1);

  objc_msgSend(v6, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v6, "setDelegate:", self);
  -[BKLibraryContextualActionSheetmetadataEditor presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)_trimString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));

  return v5;
}

- (void)_dismiss
{
  -[BKLibraryContextualActionSheetmetadataEditor setAppearedFirstTime:](self, "setAppearedFirstTime:", 0);
  -[BKLibraryContextualActionSheetmetadataEditor dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateCoverView:(id)a3
{
  id v4;
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
  void *v24;
  _QWORD v25[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverView](self, "coverView"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverBorderView](self, "coverBorderView"));
  objc_msgSend(v6, "insertSubview:belowSubview:", v4, v7);

  -[BKLibraryContextualActionSheetmetadataEditor setCoverView:](self, "setCoverView:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v25[0] = v21;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v25[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor coverContainer](self, "coverContainer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v25[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)_handleCoverUpdateRequest:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  BKLibraryContextualActionSheetmetadataEditor *v26;
  _QWORD v27[2];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100186C50;
  v24[3] = &unk_1008E7338;
  v4 = a3;
  v25 = v4;
  v26 = self;
  v5 = objc_retainBlock(v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("BKMetadatEditorSkipReplaceCoverConfirmation"));

  if (v7)
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to change this book’s cover?"), &stru_10091C438, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("The original cover will be permanently removed."), &stru_10091C438, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Change Cover"), &stru_10091C438, 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_10091C438, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Don’t show me this again."), &stru_10091C438, 0));

    v17 = +[BCAppKitBundleLoader appKitBundleClass](BCAppKitBundleLoader, "appKitBundleClass");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
    v27[0] = v12;
    v27[1] = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100186D48;
    v22[3] = &unk_1008ED570;
    v23 = v5;
    objc_msgSend(v17, "showWarningSheetAlertInWindow:messageText:informativeText:buttonTitles:suppressionTitle:completion:", v19, v21, v10, v20, v16, v22);

  }
}

- (id)_makeAndAddLabel:(id)a3 style:(unsigned int)a4
{
  id v6;
  id v7;
  void *v8;
  CTFontRef UIFontForLanguage;
  void *v10;

  v6 = a3;
  v7 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v7, "setTextAlignment:", 4);
  objc_msgSend(v7, "setText:", v6);

  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)a4, 0.0, 0);
  objc_msgSend(v7, "setFont:", UIFontForLanguage);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](self, "view"));
  objc_msgSend(v10, "addSubview:", v7);

  return v7;
}

- (id)_makeAndAddTextField:(id)a3
{
  id v4;
  id v5;
  void *v6;
  CTFontRef UIFontForLanguage;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)UITextField);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v5, "setTextColor:", v6);

  objc_msgSend(v5, "setTextAlignment:", 4);
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontControlContentFontType|kCTFontSmallSystemFontType|0x20, 0.0, 0);
  objc_msgSend(v5, "setFont:", UIFontForLanguage);

  objc_msgSend(v5, "setBorderStyle:", 3);
  objc_msgSend(v5, "setAutocapitalizationType:", 1);
  objc_msgSend(v5, "setClearButtonMode:", 1);
  objc_msgSend(v5, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](self, "view"));
  objc_msgSend(v8, "addSubview:", v5);

  return v5;
}

- (id)_makeAndAddSystemButton:(int64_t)a3 action:(SEL)a4 text:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setRole:", a3);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, a4, 64);
  objc_msgSend(v9, "setTitle:forState:", v8, 0);

  objc_msgSend(v9, "sizeToFit");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryContextualActionSheetmetadataEditor view](self, "view"));
  objc_msgSend(v10, "addSubview:", v9);

  return v9;
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (void)setLibraryAsset:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAsset, a3);
}

- (UITextField)titleTextField
{
  return self->_titleTextField;
}

- (void)setTitleTextField:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextField, a3);
}

- (UITextField)authorTextField
{
  return self->_authorTextField;
}

- (void)setAuthorTextField:(id)a3
{
  objc_storeStrong((id *)&self->_authorTextField, a3);
}

- (NSData)updatedCoverImageData
{
  return self->_updatedCoverImageData;
}

- (void)setUpdatedCoverImageData:(id)a3
{
  objc_storeStrong((id *)&self->_updatedCoverImageData, a3);
}

- (UIView)coverContainer
{
  return self->_coverContainer;
}

- (void)setCoverContainer:(id)a3
{
  objc_storeStrong((id *)&self->_coverContainer, a3);
}

- (UIView)coverView
{
  return self->_coverView;
}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (UIView)coverBorderView
{
  return self->_coverBorderView;
}

- (void)setCoverBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_coverBorderView, a3);
}

- (BOOL)appearedFirstTime
{
  return self->_appearedFirstTime;
}

- (void)setAppearedFirstTime:(BOOL)a3
{
  self->_appearedFirstTime = a3;
}

- (NSLayoutConstraint)coverWidthConstraint
{
  return self->_coverWidthConstraint;
}

- (void)setCoverWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_coverWidthConstraint, a3);
}

- (NSLayoutConstraint)coverHeightConstraint
{
  return self->_coverHeightConstraint;
}

- (void)setCoverHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_coverHeightConstraint, a3);
}

- (CGSize)coverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_coverSize.width;
  height = self->_coverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCoverSize:(CGSize)a3
{
  self->_coverSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverHeightConstraint, 0);
  objc_storeStrong((id *)&self->_coverWidthConstraint, 0);
  objc_storeStrong((id *)&self->_coverBorderView, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_coverContainer, 0);
  objc_storeStrong((id *)&self->_updatedCoverImageData, 0);
  objc_storeStrong((id *)&self->_authorTextField, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
}

@end
