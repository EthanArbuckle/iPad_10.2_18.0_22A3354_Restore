@implementation BKLibraryBookshelfListModeBookCell

- (BKLibraryBookshelfListModeBookCell)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfListModeBookCell *v3;
  BKLibraryBookshelfListModeBookCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  UILabel *authorLabel;
  uint64_t v10;
  CAShapeLayer *separatorline;
  void *v12;
  double v13;
  UIImageView *v14;
  UIImageView *dragBarView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  v3 = -[BKLibraryBookshelfGridBookCell initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](v3, "coverLayer"));
    objc_msgSend(v5, "setBottomAligned:", 0);

    v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    authorLabel = v4->_authorLabel;
    v4->_authorLabel = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    separatorline = v4->_separatorline;
    v4->_separatorline = (CAShapeLayer *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "scale");
    -[CAShapeLayer setLineWidth:](v4->_separatorline, "setLineWidth:", 1.0 / v13);

    -[CAShapeLayer setHidden:](v4->_separatorline, "setHidden:", 1);
    v14 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dragBarView = v4->_dragBarView;
    v4->_dragBarView = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](v4, "infoCell"));
    objc_msgSend(v16, "setLeftAlignedCloudIcon:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell layer](v4, "layer"));
    objc_msgSend(v17, "addSublayer:", v4->_separatorline);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell contentView](v4, "contentView"));
    objc_msgSend(v18, "addSubview:", v4->_titleLabel);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell contentView](v4, "contentView"));
    objc_msgSend(v19, "addSubview:", v4->_authorLabel);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell contentView](v4, "contentView"));
    objc_msgSend(v20, "addSubview:", v4->_dragBarView);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
    -[BKLibraryBookshelfCollectionViewCell setHighlightBackgroundColor:](v4, "setHighlightBackgroundColor:", v21);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009C9C50);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell dealloc](&v4, "dealloc");
}

- (id)cellListMetrics
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKLibraryBookshelfCellMetrics_List);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell metrics](self, "metrics"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)dragPreview
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIDragPreview);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverView](self, "coverView"));
  v5 = objc_msgSend(v3, "initWithView:", v4);

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollectionByModifyingTraits:", &stru_1008EA0E0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6));
  objc_msgSend(v4, "setBackgroundColor:", v8);

  return v4;
}

- (CGRect)coverArea
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v37;
  double v38;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
  if (-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    objc_msgSend(v3, "smallCoverMargins");
    v38 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v5, "smallMargins");
    v7 = v6;

    objc_msgSend(v3, "smallCoverMargins");
    v9 = v8;
    objc_msgSend(v3, "smallCoverSize");
  }
  else
  {
    objc_msgSend(v3, "coverMargins");
    v38 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v13, "margins");
    v7 = v14;

    objc_msgSend(v3, "coverMargins");
    v9 = v15;
    objc_msgSend(v3, "coverSize");
  }
  v16 = v10;
  v17 = v11;
  -[BKLibraryBookshelfListModeBookCell bounds](self, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[BKLibraryBookshelfListModeBookCell editModeMargin](self, "editModeMargin");
  v27 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), v9 + v7 + v26, v38, v16, v17, v19, v21, v23, v25);
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v34 = v27;
  v35 = v29;
  v36 = v31;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (BOOL)shrinkInEditMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
  v3 = objc_msgSend(v2, "shrinkInEditMode");

  return v3;
}

- (CGRect)infoFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isSupplementalContentPDFPicker
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
  v3 = objc_msgSend(v2, "supplementalContentPDFPicker");

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  CGFloat v24;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  CGFloat v39;
  double MinX;
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
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  unsigned __int8 v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  unsigned int v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  CGFloat v71;
  double MaxY;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  CGFloat v80;
  void *v81;
  unsigned __int8 v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  void *v102;
  id v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  unsigned __int8 v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  unsigned __int8 v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  double v165;
  void *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  void *v178;
  void *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  void *v194;
  double v195;
  double v196;
  _BOOL8 v197;
  double v198;
  double v199;
  double v200;
  CGFloat v201;
  CGFloat v202;
  CGFloat v203;
  double v204;
  id v205;
  id v206;
  void *v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  void *v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  _BOOL8 v220;
  void *v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double MaxX;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  CGFloat v240;
  double v241;
  double v242;
  double v243;
  double rect;
  _OWORD v245[3];
  CGAffineTransform v246;
  CGAffineTransform v247;
  CGAffineTransform v248;
  objc_super v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;

  v249.receiver = self;
  v249.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell layoutSubviews](&v249, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode")
    && (-[BKLibraryBookshelfListModeBookCell isSelected](self, "isSelected") & 1) == 0)
  {
    memset(&v248, 0, sizeof(v248));
    objc_msgSend(v3, "shrinkAmount");
    v10 = v9;
    objc_msgSend(v3, "shrinkAmount");
    CGAffineTransformMakeScale(&v248, v10, v11);
    v247 = v248;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    v246 = v247;
    objc_msgSend(v12, "setAffineTransform:", &v246);

    objc_msgSend(v3, "shrinkAlpha");
    *(float *)&v10 = v13;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    v7 = v6;
    LODWORD(v8) = LODWORD(v10);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v245[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v245[1] = v5;
    v245[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v4, "setAffineTransform:", v245);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    v7 = v6;
    LODWORD(v8) = 1.0;
  }
  objc_msgSend(v6, "setOpacity:", v8);

  -[BKLibraryBookshelfListModeBookCell bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v22, "margins");
  v24 = v23;
  v250.origin.x = v15;
  v250.origin.y = v17;
  v250.size.width = v19;
  v250.size.height = v21;
  v251 = CGRectInset(v250, v24, 0.0);
  x = v251.origin.x;
  y = v251.origin.y;
  width = v251.size.width;
  height = v251.size.height;

  if (-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    -[BKLibraryBookshelfListModeBookCell bounds](self, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v37, "smallMargins");
    v39 = v38;
    v252.origin.x = v30;
    v252.origin.y = v32;
    v252.size.width = v34;
    v252.size.height = v36;
    v253 = CGRectInset(v252, v39, 0.0);
    x = v253.origin.x;
    y = v253.origin.y;
    width = v253.size.width;
    height = v253.size.height;

  }
  v254.origin.x = x;
  v254.origin.y = y;
  rect = width;
  v254.size.width = width;
  v254.size.height = height;
  MinX = CGRectGetMinX(v254);
  objc_msgSend(v3, "coverSize");
  v234 = v41;
  objc_msgSend(v3, "coverSize");
  v43 = v42;
  -[BKLibraryBookshelfListModeBookCell editModeMargin](self, "editModeMargin");
  v45 = v44;
  objc_msgSend(v3, "coverMargins");
  v47 = v46;
  objc_msgSend(v3, "coverMargins");
  v49 = v48;
  v239 = MinX;
  if (-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    objc_msgSend(v3, "smallCoverSize");
    v234 = v50;
    objc_msgSend(v3, "smallCoverSize");
    v52 = MinX + v51;
    objc_msgSend(v3, "smallCoverMargins");
    v54 = v52 + v53;
    objc_msgSend(v3, "coverMargins");
    v56 = v54 + v55;
  }
  else
  {
    v56 = v45 + MinX + v43 + v47 + v49;
  }
  v255.origin.x = x;
  v241 = y;
  v255.origin.y = y;
  v255.size.width = rect;
  v255.size.height = height;
  MaxX = CGRectGetMaxX(v255);
  v57 = MaxX - v56;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
  v59 = objc_msgSend(v58, "isHidden");

  v60 = MaxX - v56;
  if ((v59 & 1) == 0)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "image"));
    objc_msgSend(v62, "size");
    v60 = v57 - v63;

  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  v65 = objc_msgSend(v64, "isHidden");

  if (v65)
  {
    v66 = 0.0;
    v226 = 3.40282347e38;
  }
  else
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesSequenceLabelFontAttributes"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "font"));

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
    objc_msgSend(v69, "sizeThatFits:", v60, 3.40282347e38);
    v71 = v70;

    v256.origin.y = 0.0;
    v256.origin.x = v56;
    v256.size.width = v60;
    v226 = v71;
    v256.size.height = v71;
    MaxY = CGRectGetMaxY(v256);
    objc_msgSend(v68, "descender");
    v74 = MaxY + v73;
    objc_msgSend(v3, "seriesSequenceLabelBottomMargin");
    v66 = v74 + v75;

  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleFontAttributes"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "font"));

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v78, "sizeThatFits:", v60, 3.40282347e38);
  v80 = v79;

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
  if (objc_msgSend(v81, "numberOfLines") == (id)1)
  {
    v82 = -[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker");

    if ((v82 & 1) == 0)
    {
      v257.origin.x = v56;
      v257.origin.y = v66;
      v257.size.width = v60;
      v257.size.height = v80;
      v83 = height;
      v84 = x;
      v85 = v66;
      v86 = CGRectGetHeight(v257);
      objc_msgSend(v77, "bk_heightFromCapLineToDescender");
      v88 = v86 - v87;
      v89 = v85;
      x = v84;
      height = v83;
      v57 = MaxX - v56;
      v66 = v89 - v88;
    }
  }
  else
  {

  }
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorFontAttributes"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "font"));

  v258.origin.x = v56;
  v230 = v66;
  v258.origin.y = v66;
  v258.size.width = v60;
  v233 = v80;
  v258.size.height = v80;
  v92 = CGRectGetMaxY(v258);
  objc_msgSend(v77, "descender");
  v94 = v92 + v93;
  objc_msgSend(v3, "titleSpacing");
  v96 = v94 + v95;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v97, "sizeThatFits:", v60, 3.40282347e38);
  v99 = v98;
  v101 = v100;

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
  v103 = objc_msgSend(v102, "numberOfLines");

  if (v103 == (id)1)
  {
    v259.origin.x = v56;
    v259.origin.y = v96;
    v259.size.width = v99;
    v259.size.height = v101;
    v104 = CGRectGetHeight(v259);
    objc_msgSend(v91, "bk_heightFromCapLineToDescender");
    v96 = v96 - (v104 - v105);
  }
  v260.origin.x = v56;
  v260.origin.y = v96;
  v236 = v60;
  v260.size.width = v60;
  v229 = v101;
  v260.size.height = v101;
  v106 = CGRectGetMaxY(v260);
  objc_msgSend(v91, "descender");
  v108 = v106 + v107;
  objc_msgSend(v3, "authorSpacing");
  v110 = v108 + v109;
  objc_msgSend(v3, "infoBarHeight");
  v112 = v111;
  objc_msgSend(v3, "infoBarDateSpacing");
  v114 = v112 + v113;
  objc_msgSend(v3, "infoBarExpectedDateHeight");
  v261.size.height = v114 + v115;
  v261.origin.x = v56;
  v227 = v110;
  v228 = v261.size.height;
  v261.origin.y = v110;
  v261.size.width = v57;
  v116 = CGRectGetMaxY(v261);
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  v118 = objc_msgSend(v117, "showsDateBadge");

  if ((v118 & 1) == 0)
  {
    objc_msgSend(v3, "infoBarExpectedDateHeight");
    v120 = v119;
    objc_msgSend(v3, "infoBarDateSpacing");
    v116 = v116 - (v120 + v121);
  }
  v243 = height;
  v122 = x;
  objc_msgSend(v3, "coverMargins");
  v124 = v123;
  if (-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    objc_msgSend(v3, "smallCoverMargins");
    v126 = round(v234 * 0.5) + v125;
  }
  else
  {
    v126 = v124 + round((v234 - v116) * 0.5);
  }
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  v128 = objc_msgSend(v127, "isHidden");

  if ((v128 & 1) == 0)
  {
    v129 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), v56, v126 + 0.0, v236, v226, x, v241, rect, v243);
    v131 = v130;
    v133 = v132;
    v135 = v134;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
    objc_msgSend(v136, "setFrame:", v129, v131, v133, v135);

  }
  v137 = v230 + v126;
  if (-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    v262.origin.x = v56;
    v262.origin.y = v230 + v126;
    v138 = v236;
    v262.size.width = v236;
    v262.size.height = v233;
    v139 = CGRectGetHeight(v262);
    objc_msgSend(v77, "bk_heightFromCapLineToDescender");
    v137 = v137 - (v139 - round(v140 * 0.5));
  }
  else
  {
    v138 = v236;
  }
  v231 = v137;
  v242 = v122;
  v141 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), v56, v96 + v126, v138, v229, v122, v241, rect, v243);
  v143 = v142;
  v145 = v144;
  v147 = v146;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v148, "setFrame:", v141, v143, v145, v147);

  v149 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), v56, v231, v138, v233, v242, v241, rect, v243);
  v151 = v150;
  v153 = v152;
  v155 = v154;
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v156, "setFrame:", v149, v151, v153, v155);

  v237 = v56;
  v157 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), v56, v227 + v126, MaxX - v56, v228, v242, v241, rect, v243);
  v159 = v158;
  v161 = v160;
  v163 = v162;
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell infoCell](self, "infoCell"));
  objc_msgSend(v164, "setFrame:", v157, v159, v161, v163);

  v165 = *(double *)&qword_1009F4EE0;
  if (*(double *)&qword_1009F4EE0 == 0.0)
  {
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "selectedCheckmarkImageForSelectedState:", 1));
    objc_msgSend(v167, "size");
    qword_1009F4ED8 = v168;
    qword_1009F4EE0 = v169;

    v165 = *(double *)&qword_1009F4EE0;
  }
  v170 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), v239, round((v243 - v165) * 0.5), *(double *)&qword_1009F4ED8, v165, v242, v241, rect, v243);
  v172 = v171;
  v174 = v173;
  v176 = v175;
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
  objc_msgSend(v177, "setFrame:", v170, v172, v174, v176);

  v178 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
  v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "image"));
  objc_msgSend(v179, "size");
  v181 = v180;
  v183 = v182;

  v263.origin.x = v242;
  v263.origin.y = v241;
  v263.size.width = rect;
  v263.size.height = v243;
  v184 = round((CGRectGetHeight(v263) - v183) * 0.5);
  v185 = IMRectFlippedForRTL(-[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL"), MaxX - v181, v184, v181, v183, v242, v241, rect, v243);
  v187 = v186;
  v189 = v188;
  v191 = v190;
  v192 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
  objc_msgSend(v192, "setFrame:", v185, v187, v189, v191);

  v193 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell separatorline](self, "separatorline"));
  objc_msgSend(v194, "lineWidth");
  v235 = 1.0 - v195 * 0.5;

  if (!-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    -[BKLibraryBookshelfListModeBookCell editModeMargin](self, "editModeMargin");
    v237 = v239 + v196;
  }
  v197 = -[BKLibraryBookshelfGridBookCell isRTL](self, "isRTL");
  v264.origin.x = v242;
  v264.origin.y = v241;
  v264.size.width = rect;
  v264.size.height = v243;
  v198 = CGRectGetMaxY(v264);
  v265.origin.x = v242;
  v265.origin.y = v241;
  v265.size.width = rect;
  v265.size.height = v243;
  v199 = CGRectGetWidth(v265);
  -[BKLibraryBookshelfListModeBookCell editModeMargin](self, "editModeMargin");
  v266.origin.x = IMRectFlippedForRTL(v197, v237, v198, v199 - v200, 1.0, v242, v241, rect, v243);
  v240 = v266.origin.x;
  v201 = v266.origin.y;
  v202 = v266.size.width;
  v203 = v266.size.height;
  v238 = CGRectGetMinX(v266);
  v267.origin.x = v242;
  v267.origin.y = v241;
  v267.size.width = rect;
  v267.size.height = v243;
  objc_msgSend(v193, "moveToPoint:", v238, CGRectGetMaxY(v267) - v235);
  v268.origin.x = v240;
  v268.origin.y = v201;
  v268.size.width = v202;
  v268.size.height = v203;
  v204 = CGRectGetMaxX(v268);
  v269.origin.x = v242;
  v269.origin.y = v241;
  v269.size.width = rect;
  v269.size.height = v243;
  objc_msgSend(v193, "addLineToPoint:", v204, CGRectGetMaxY(v269) - v235);
  v205 = objc_retainAutorelease(v193);
  v206 = objc_msgSend(v205, "CGPath");
  v207 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell separatorline](self, "separatorline"));
  objc_msgSend(v207, "setPath:", v206);

  v208 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
  v209 = v208;
  if (v208)
  {
    objc_msgSend(v208, "frame");
    v211 = v210;
    v212 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
    objc_msgSend(v212, "frame");
    v213 = CGRectCenterRectInRect(v211);
    v215 = v214;
    v217 = v216;
    v219 = v218;

    objc_msgSend(v209, "frame");
    v271.origin.x = v213;
    v271.origin.y = v215;
    v271.size.width = v217;
    v271.size.height = v219;
    if (!CGRectEqualToRect(v270, v271))
    {
      v220 = -[BKLibraryBookshelfListModeBookCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1;
      v221 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverLayer](self, "coverLayer"));
      objc_msgSend(v221, "frame");
      objc_msgSend(v209, "setFrame:", IMRectFlippedForRTL(v220, v213, v215, v217, v219, v222, v223, v224, v225));

    }
  }

}

- (void)_updateSeriesSequenceLabel:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell _updateSeriesSequenceLabel:](&v7, "_updateSeriesSequenceLabel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell seriesSequenceLabel](self, "seriesSequenceLabel"));
  if (objc_msgSend(v4, "isHidden"))
  {
    if (-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setNumberOfLines:", v5);

}

- (void)_updateLibraryAssetText
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
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleFontAttributes"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesWithTruncated:", 1));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v7, v17));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v9, "setAttributedText:", v8);

    if (!-[BKLibraryBookshelfListModeBookCell isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authorFontAttributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributesWithTruncated:", 1));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayAuthor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v14, v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
      objc_msgSend(v16, "setAttributedText:", v15);

    }
    -[BKLibraryBookshelfListModeBookCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setLibraryAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));

  if (v5 != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009C9C50);

  }
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell setLibraryAsset:](&v9, "setLibraryAsset:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("author"), 0, off_1009C9C50);

  }
  -[BKLibraryBookshelfListModeBookCell _updateLibraryAssetText](self, "_updateLibraryAssetText");

}

- (void)_updateDragBarImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dragBarTintColor"));

      if (!qword_1009F4EF0 || (objc_msgSend(obj, "isEqual:", qword_1009F4EE8) & 1) == 0)
      {
        objc_storeStrong((id *)&qword_1009F4EE8, obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 2, 20.0));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dragBarName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithConfiguration:", v7));
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageMaskWithColor:", qword_1009F4EE8));
        v13 = (void *)qword_1009F4EF0;
        qword_1009F4EF0 = v12;

      }
      -[UIImageView setImage:](self->_dragBarView, "setImage:", qword_1009F4EF0);

    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  double v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  objc_super v47;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "layoutDebugMode");
  v9 = -[BKLibraryBookshelfGridBookCell layoutDebugMode](self, "layoutDebugMode");
  v47.receiver = self;
  v47.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell applyLayoutAttributes:](&v47, "applyLayoutAttributes:", v4);

  if (v9 != v8)
  {
    if (objc_msgSend(v7, "layoutDebugMode"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorWithAlphaComponent:", 0.2)));
      v12 = objc_msgSend(v11, "CGColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
      objc_msgSend(v14, "setBorderColor:", v12);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
      objc_msgSend(v16, "setBorderWidth:", 0.5);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "colorWithAlphaComponent:", 0.2)));
      v19 = objc_msgSend(v18, "CGColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
      objc_msgSend(v21, "setBorderColor:", v19);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
      v24 = v23;
      v25 = 0.5;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell authorLabel](self, "authorLabel"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
      objc_msgSend(v27, "setBorderWidth:", 0.0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell titleLabel](self, "titleLabel"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
      v24 = v23;
      v25 = 0.0;
    }
    objc_msgSend(v23, "setBorderWidth:", v25);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell cellListMetrics](self, "cellListMetrics"));
  v29 = objc_msgSend(v7, "editMode");
  v30 = 0.0;
  if (v29)
    objc_msgSend(v28, "editModeMargin", 0.0);
  -[BKLibraryBookshelfListModeBookCell setEditModeMargin:](self, "setEditModeMargin:", v30);
  -[BKLibraryBookshelfListModeBookCell _updateDragBarImage](self, "_updateDragBarImage");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell separatorline](self, "separatorline"));
  v32 = objc_msgSend(v31, "isHidden");
  v33 = objc_msgSend(v7, "lastItem");

  if (v32 != v33)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v34 = objc_msgSend(v7, "lastItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell separatorline](self, "separatorline"));
    objc_msgSend(v35, "setHidden:", v34);

    +[CATransaction commit](CATransaction, "commit");
  }
  if (objc_msgSend(v7, "editMode"))
    v36 = objc_msgSend(v7, "editable") ^ 1;
  else
    v36 = 1;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
  objc_msgSend(v37, "setHidden:", v36);

  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "separatorColor")));
  v39 = objc_msgSend(v38, "CGColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell separatorline](self, "separatorline"));
  objc_msgSend(v40, "setStrokeColor:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
  if (v41)
  {
    -[BKLibraryBookshelfListModeBookCell _updateLibraryAssetText](self, "_updateLibraryAssetText");
    -[BKLibraryBookshelfListModeBookCell layoutIfNeeded](self, "layoutIfNeeded");
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell coverView](self, "coverView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "coverLayer"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell libraryAsset](self, "libraryAsset"));
    -[BKLibraryBookshelfListModeBookCell coverArea](self, "coverArea");
    objc_msgSend(v43, "setLibraryAsset:size:", v44, v45, v46);

  }
}

- (id)_checkmarkImageForSelectedState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedCheckmarkImageForSelectedState:", v3));

  return v5;
}

- (void)setDataSource:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell setDataSource:](&v7, "setDataSource:", a3);
  if (-[BKLibraryBookshelfListModeBookCell isSelected](self, "isSelected"))
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor"));
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCell selectIndicatorView](self, "selectIndicatorView"));
  objc_msgSend(v6, "setTintColor:", v5);

  -[BKLibraryBookshelfListModeBookCell _updateDragBarImage](self, "_updateDragBarImage");
}

- (void)setSelected:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell setSelected:](&v7, "setSelected:");
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000CF264;
    v5[3] = &unk_1008E83C0;
    v5[4] = self;
    v6 = a3;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.2);
  }
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  BOOL v9;
  void *v10;
  CGPoint v12;
  CGRect v13;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
  if ((objc_msgSend(v8, "isHidden") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfListModeBookCell dragBarView](self, "dragBarView"));
    objc_msgSend(v10, "frame");
    v12.x = v5;
    v12.y = v7;
    v9 = CGRectContainsPoint(v13, v12);

  }
  return v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (off_1009C9C50 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CF3F8;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKLibraryBookshelfListModeBookCell;
    -[BKLibraryBookshelfGridBookCell observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_authorLabel, a3);
}

- (UIImageView)dragBarView
{
  return self->_dragBarView;
}

- (void)setDragBarView:(id)a3
{
  objc_storeStrong((id *)&self->_dragBarView, a3);
}

- (CAShapeLayer)separatorline
{
  return self->_separatorline;
}

- (void)setSeparatorline:(id)a3
{
  objc_storeStrong((id *)&self->_separatorline, a3);
}

- (double)editModeMargin
{
  return self->_editModeMargin;
}

- (void)setEditModeMargin:(double)a3
{
  self->_editModeMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorline, 0);
  objc_storeStrong((id *)&self->_dragBarView, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
