@implementation BKLibraryBookshelfFinishedBookCell

+ (int)finishedStateForAsset:(id)a3 assetReview:(id)a4 storeID:(id)a5 storageProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  unsigned int v35;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_opt_class(NSNumber);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permanentOrTemporaryAssetID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "retrieveValueForKey:forConsumer:", CFSTR("kExpandReviewText"), v13));
  v15 = BUDynamicCast(v12, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);

  v17 = objc_opt_class(NSNumber);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permanentOrTemporaryAssetID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "retrieveValueForKey:forConsumer:", CFSTR("kStarRatedThisSession"), v18));

  v20 = BUDynamicCast(v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v37 = objc_msgSend(v21, "BOOLValue");

  v38 = objc_msgSend(v16, "BOOLValue");
  v22 = objc_msgSend(v9, "isFinished");
  v23 = objc_msgSend(v9, "notFinished");
  v24 = objc_msgSend(v10, "starRating");
  if (a5)
  {
    if ((objc_msgSend(v9, "isStoreItem") & 1) != 0)
      LODWORD(a5) = 0;
    else
      LODWORD(a5) = objc_msgSend(v9, "isStore");
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "purchaseDate"));
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "purchaseDate"));
    v27 = v10;
    v28 = v22;
    v29 = (int)a5;
    a5 = v16;
    v30 = v24;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v39 = objc_msgSend(v26, "isEqual:", v31) ^ 1;

    v24 = v30;
    v16 = a5;
    LODWORD(a5) = v29;
    v22 = v28;
    v10 = v27;

  }
  else
  {
    v39 = 0;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reviewTitle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reviewBody"));
  if (((v23 | v22 ^ 1) & 1) != 0)
  {
    v34 = v23 ^ 1;
  }
  else
  {
    v35 = a5 & v39;
    if ((a5 & v39) != 0)
      v34 = 2;
    else
      v34 = 3;
    if (v35 && v24)
    {
      if (objc_msgSend(v32, "length") || (v37 ? (v34 = 4) : (v34 = 5), objc_msgSend(v33, "length")))
      {
        if (v38)
          v34 = 7;
        else
          v34 = 6;
      }
    }
  }

  return v34;
}

+ (id)heightCache
{
  if (qword_1009F4F20 != -1)
    dispatch_once(&qword_1009F4F20, &stru_1008EA990);
  return (id)qword_1009F4F28;
}

+ (double)bookCellHeightFor:(id)a3 assetReview:(id)a4 storeID:(id)a5 editMode:(BOOL)a6 metrics:(id)a7 storageProvider:(id)a8 clearCache:(BOOL)a9
{
  int v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  double y;
  double height;
  double width;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  unsigned int v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  _BOOL4 v87;
  int v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  unsigned int v99;
  void *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  id v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  int v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  id v146;
  void *v147;
  double v148;
  void *v149;
  void *v150;
  double v151;
  void *v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  void *v171;
  void *v172;
  float v173;
  double v174;
  id v176;
  double v177;
  double v178;
  double v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  unsigned int v190;
  double v191;
  double v192;
  double v193;
  double v194;
  void *v195;
  double v196;
  id v197;
  unsigned int v198;
  double v199;
  double v200;
  unsigned int v201;
  int v202;
  double v203;
  id v204;
  double v205;
  void *v206;
  id v207;
  void *v208;
  id v209;
  CGRect v210;

  v11 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "heightCache"));
  v21 = v20;
  if (a9 || byte_1009F4F30 != v11)
  {
    objc_msgSend(v20, "removeAllObjects");
    byte_1009F4F30 = v11;
    if (v15)
    {
LABEL_4:
      v209 = v17;
      v22 = objc_opt_class(BKLibraryBookshelfCellMetrics_Finished);
      v23 = BUDynamicCast(v22, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v24, "bookCoverSize");
      v26 = v25;
      objc_msgSend(v24, "cellSpacing");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "permanentOrTemporaryAssetID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v29));

      if (v30)
      {
        objc_msgSend(v30, "doubleValue");
        v32 = v31;
        v17 = v209;
LABEL_53:

        goto LABEL_54;
      }
      v199 = v28;
      v200 = v26;
      v204 = v18;
      v201 = objc_msgSend(v24, "reviewBottomLayout");
      objc_msgSend(v24, "cellWidth");
      v34 = v33;
      objc_msgSend(v24, "lockupMargin");
      v36 = v34 - v35;
      objc_msgSend(v24, "cellSpacing");
      v203 = v37;
      objc_msgSend(v24, "ratingHeight");
      v191 = v38;
      objc_msgSend(v24, "moreHeight");
      v192 = v39;
      objc_msgSend(v24, "bookCoverSize");
      v41 = v40;
      objc_msgSend(v24, "bookCoverLeftMargin");
      v196 = v42;
      objc_msgSend(v24, "cellWidth");
      v194 = v43;
      objc_msgSend(v24, "lockupBottomSpacing");
      v205 = v41 + v44;
      objc_msgSend(v24, "smallLayoutSpaceNeeded");
      v193 = v45;
      v46 = objc_alloc((Class)UILabel);
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v50 = objc_msgSend(v46, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      v207 = v16;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
      v208 = v19;
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleFontAttributes"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v51, v52));
      objc_msgSend(v50, "setAttributedText:", v53);

      objc_msgSend(v24, "titleMaxLines");
      objc_msgSend(v50, "setNumberOfLines:", (uint64_t)v54);
      objc_msgSend(v50, "sizeThatFits:", v36, 1.79769313e308);
      v56 = v55;
      v189 = y;
      v57 = y;
      v58 = v36;
      v188 = width;
      v59 = width;
      v60 = height;
      v61 = v41;
      objc_msgSend(v50, "setFrame:", CGRectZero.origin.x, v57, v59, v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayAuthor"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "authorFontAttributes"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v62, v63));
      objc_msgSend(v50, "setAttributedText:", v64);

      objc_msgSend(v24, "authorMaxLines");
      objc_msgSend(v50, "setNumberOfLines:", (uint64_t)v65);
      objc_msgSend(v50, "sizeThatFits:", v36, 1.79769313e308);
      v67 = v66;
      v68 = v56 + v66;
      objc_msgSend(v24, "authorSpacing");
      v70 = v69 + v68;
      v71 = objc_opt_class(NSNumber);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "permanentOrTemporaryAssetID"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "retrieveValueForKey:forConsumer:", CFSTR("kExpandReviewText"), v72));
      v74 = BUDynamicCast(v71, v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

      v16 = v207;
      v19 = v208;
      v190 = objc_msgSend(v75, "BOOLValue");
      v76 = objc_msgSend(a1, "finishedStateForAsset:assetReview:storeID:storageProvider:", v15, v207, v209, v208);
      v206 = v75;
      v198 = v76;
      if (v70 <= v41)
      {
        v89 = v205;
        v88 = v201;
        v90 = 0.0;
        if (v61 - v70 >= v193)
        {
          if ((v11 & 1) == 0)
          {
            if (v76 == 4)
            {
              v176 = objc_alloc_init((Class)BCLibraryButton);
              objc_msgSend(v176, "setClipsToBounds:", 1);
              objc_msgSend(v24, "writeReviewTitleInset");
              v178 = v177;
              objc_msgSend(v24, "writeReviewTitleInset");
              objc_msgSend(v176, "setTitleEdgeInsets:", 0.0, v178, 0.0, v179);
              v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "localizedStringForKey:value:table:", CFSTR("Write a Review"), &stru_10091C438, 0));

              v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "writeReviewFontAttributes"));
              v183 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v181, v182));
              objc_msgSend(v176, "setAttributedTitle:forState:", v183, 0);

              v16 = v207;
              objc_msgSend(v176, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
              v185 = v184;
              objc_msgSend(v24, "writeReviewTitleInset");
              v187 = v185 + v186 * 2.0;

              v19 = v208;
              v18 = v204;
              if (v187 > v58)
              {
                v87 = 1;
                goto LABEL_14;
              }
            }
            else if (v76 == 1)
            {
              v197 = objc_alloc_init((Class)BCLibraryButton);
              objc_msgSend(v197, "setClipsToBounds:", 1);
              objc_msgSend(v24, "finishedTitleInset");
              v97 = v96;
              objc_msgSend(v24, "finishedTitleInset");
              objc_msgSend(v197, "setTitleEdgeInsets:", 0.0, v97, 0.0, v98);
              v99 = objc_msgSend(v24, "finishedShortText");
              v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v101 = v100;
              if (v99)
                v102 = CFSTR("FINISHED");
              else
                v102 = CFSTR("MARK FINISHED");
              v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "localizedStringForKey:value:table:", v102, &stru_10091C438, 0));

              v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "finishedFontAttributes"));
              v104 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v195, v103));
              objc_msgSend(v197, "setAttributedTitle:forState:", v104, 0);

              objc_msgSend(v197, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
              v106 = v105;
              objc_msgSend(v24, "finishedTitleInset");
              v108 = v106 + v107 * 2.0;

              v87 = v108 > v58;
              v16 = v207;
              v19 = v208;
              goto LABEL_14;
            }
            v87 = 0;
            goto LABEL_14;
          }
          v87 = 0;
        }
        else
        {
          v88 = 1;
          v87 = 1;
        }
      }
      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleFontAttributes"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v77, v78));
        objc_msgSend(v50, "setAttributedText:", v79);

        objc_msgSend(v24, "titleMaxLines");
        objc_msgSend(v50, "setNumberOfLines:", (uint64_t)v80);
        objc_msgSend(v50, "sizeThatFits:", v194 - v196, 1.79769313e308);
        v56 = v81;
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayAuthor"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "authorFontAttributes"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v82, v83));
        objc_msgSend(v50, "setAttributedText:", v84);

        v19 = v208;
        objc_msgSend(v24, "authorMaxLines");
        objc_msgSend(v50, "setNumberOfLines:", (uint64_t)v85);
        objc_msgSend(v50, "sizeThatFits:", v194 - v196, 1.79769313e308);
        v67 = v86;
        v87 = 0;
        v88 = 1;
        v89 = v205;
        v90 = v205;
      }
LABEL_14:
      objc_msgSend(v24, "authorSpacing");
      v92 = v67 + v56 + v90 + v91;
      if (!v87)
        v89 = v92;
      if (v11)
      {
        if (v89 >= v61)
          v93 = v89;
        else
          v93 = v61;
        v32 = v203 + v93;
      }
      else
      {
        v32 = v200 + v199;
        switch(v198)
        {
          case 1u:
            v114 = objc_alloc_init((Class)BCLibraryButton);
            v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "finishedFontAttributes"));
            v116 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", CFSTR("FIN"), v115));
            objc_msgSend(v114, "setAttributedTitle:forState:", v116, 0);

            v19 = v208;
            objc_msgSend(v114, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
            v118 = v117;
            objc_msgSend(v24, "finishedSpacing");
            v120 = v89 + v119;
            goto LABEL_36;
          case 2u:
            objc_msgSend(v24, "finishedSpacing");
            v122 = v191 + v89 + v121;
            objc_msgSend(v24, "moreSpacing");
            v95 = v123 + v122;
            goto LABEL_32;
          case 3u:
          case 9u:
            objc_msgSend(v24, "moreSpacing");
            v95 = v89 + v94;
            goto LABEL_32;
          case 4u:
            v114 = objc_alloc_init((Class)BCLibraryButton);
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "writeReviewFontAttributes"));
            v126 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", CFSTR("Write"), v125));
            objc_msgSend(v114, "setAttributedTitle:forState:", v126, 0);

            v19 = v208;
            objc_msgSend(v114, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
            v118 = v127;
            objc_msgSend(v24, "ratingSpacing");
            v129 = v89 + v128;
            objc_msgSend(v24, "ratingHeight");
            v131 = v129 + v130;
            objc_msgSend(v24, "writeReviewSpacing");
            v120 = v131 + v132;
LABEL_36:
            v133 = v118 + v120;
            objc_msgSend(v24, "moreSpacing");
            v135 = v203 + v192 + v134 + v133;
            if (v32 < v135)
              v32 = v135;
            goto LABEL_51;
          case 5u:
          case 8u:
            objc_msgSend(v24, "ratingSpacing");
            v110 = v89 + v109;
            objc_msgSend(v24, "ratingHeight");
            v112 = v110 + v111;
            objc_msgSend(v24, "moreSpacing");
            v95 = v112 + v113;
LABEL_32:
            v124 = v203 + v192 + v95;
            if (v32 < v124)
              v32 = v124;
            break;
          case 6u:
            v190 = 0;
            goto LABEL_40;
          case 7u:
LABEL_40:
            v136 = v88;
            v114 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reviewBody"));
            objc_msgSend(v24, "bookCoverSize");
            v138 = v137;
            v202 = v136;
            if (v136)
            {
              objc_msgSend(v24, "cellWidth");
              v140 = v139;
              objc_msgSend(v24, "bookCoverLeftMargin");
              v58 = v140 - v141;
            }
            objc_msgSend(v24, "reviewLeftMargin");
            v143 = v58 - v142;
            objc_msgSend(v24, "reviewRightMargin");
            v145 = v143 - v144;
            if (v190)
            {
              v146 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reviewContentFontAttributes"));
              v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "attributes"));
              objc_msgSend(v114, "boundingRectWithSize:options:attributes:context:", 1, v147, 0, v145, 1.79769313e308);
              v148 = CGRectGetHeight(v210);

            }
            else
            {
              v146 = objc_msgSend(objc_alloc((Class)IMExpandingLabel), "initWithFrame:", CGRectZero.origin.x, v189, v188, v60);
              objc_msgSend(v146, "setTextAlignment:", 0);
              v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reviewContentFontAttributes"));
              v150 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v114, v149));
              objc_msgSend(v146, "setAttributedText:", v150);

              objc_msgSend(v146, "sizeThatFits:", v145, 1.79769313e308);
              v148 = v151;
            }

            v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reviewTitleFontAttributes"));
            v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "font"));
            objc_msgSend(v153, "lineHeight");
            v155 = v154;

            objc_msgSend(v24, "reviewTopMargin");
            v157 = v148 + v155 + v156;
            objc_msgSend(v24, "reviewBottomMargin");
            v159 = v157 + v158;
            objc_msgSend(v24, "ratingSpacing");
            v161 = v191 + v89 + v160;
            if (v202)
            {
              objc_msgSend(v24, "moreSpacing");
              v163 = v192 + v162 + v161;
              objc_msgSend(v24, "moreSpacing");
              v165 = v164 + v163;
              if (v138 < v165)
                v138 = v165;
              objc_msgSend(v24, "reviewSpacing");
              v167 = v159 + v166 + v138;
            }
            else
            {
              objc_msgSend(v24, "reviewSpacing");
              v169 = v159 + v168 + v161;
              objc_msgSend(v24, "moreSpacing");
              v167 = v192 + v170 + v169;
            }
            v19 = v208;
            v32 = v203 + v167;
LABEL_51:

            break;
          default:
            break;
        }
      }
      v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
      v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "permanentOrTemporaryAssetID"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v171, v172);

      v17 = v209;
      v30 = 0;
      goto LABEL_53;
    }
  }
  else if (v15)
  {
    goto LABEL_4;
  }
  v32 = 0.0;
LABEL_54:
  v173 = v32;
  v174 = ceilf(v173);

  return v174;
}

- (BKLibraryBookshelfFinishedBookCell)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfFinishedBookCell *v3;
  id v4;
  BUCoalescingCallBlock *v5;
  BUCoalescingCallBlock *coalescedPropertyChange;
  void *v7;
  BKLibraryBookshelfCoverView *v8;
  BKLibraryBookshelfCoverView *coverView;
  void *v10;
  void *v11;
  id v12;
  double y;
  double width;
  double height;
  UIImageView *v16;
  UIImageView *checkmarkView;
  void *v18;
  BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  IMRadialProgressButton *v24;
  IMRadialProgressButton *downloadProgressButton;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  UILabel *v30;
  UILabel *titleLabel;
  UILabel *v32;
  unint64_t v33;
  UILabel *v34;
  UILabel *authorLabel;
  void *v36;
  void *v37;
  UILabel *v38;
  UILabel *combinedDateLabel;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  CAShapeLayer *dateIndicator;
  void *v44;
  void *v45;
  BKLibraryStarRating *v46;
  BKLibraryStarRating *starRating;
  void *v48;
  BCLibraryButton *v49;
  BCLibraryButton *markAsFinishedButton;
  void *v51;
  uint64_t v52;
  IMTouchInsetsButton *moreButton;
  void *v54;
  void *v55;
  void *v56;
  BCLibraryButton *v57;
  BCLibraryButton *writeReviewButton;
  void *v59;
  uint64_t v60;
  CALayer *reviewBackground;
  void *v62;
  void *v63;
  UILabel *v64;
  UILabel *reviewTitle;
  void *v66;
  IMExpandingLabel *v67;
  IMExpandingLabel *reviewComments;
  void *v69;
  void **v71;
  uint64_t v72;
  void (*v73)(uint64_t);
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id location;
  objc_super v79;

  v79.receiver = self;
  v79.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v79, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = objc_alloc((Class)BUCoalescingCallBlock);
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000E7D74;
    v76[3] = &unk_1008E8718;
    objc_copyWeak(&v77, &location);
    v5 = (BUCoalescingCallBlock *)objc_msgSend(v4, "initWithNotifyBlock:blockDescription:", v76, CFSTR("Finished book cell"));
    coalescedPropertyChange = v3->_coalescedPropertyChange;
    v3->_coalescedPropertyChange = v5;

    -[BUCoalescingCallBlock setCoalescingDelay:](v3->_coalescedPropertyChange, "setCoalescingDelay:", 0.1);
    v3->_finishedState = 10;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v3->_isRTL = objc_msgSend(v7, "userInterfaceLayoutDirection") == (id)1;

    v8 = objc_alloc_init(BKLibraryBookshelfCoverView);
    coverView = v3->_coverView;
    v3->_coverView = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverView coverLayer](v3->_coverView, "coverLayer"));
    objc_msgSend(v10, "setBottomAligned:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v11, "addSubview:", v3->_coverView);

    v12 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v16 = (UIImageView *)objc_msgSend(v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v18, "addSubview:", v3->_checkmarkView);

    v19 = -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize initWithFrame:]([BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Not downloaded"), &stru_10091C438, 0));
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityLabel:](v19, "setAccessibilityLabel:", v21);

    v22 = (unint64_t)-[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityTraits](v19, "accessibilityTraits");
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityTraits:](v19, "setAccessibilityTraits:", v22 & ~UIAccessibilityTraitImage);
    objc_storeStrong((id *)&v3->_cloudView, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v23, "addSubview:", v3->_cloudView);

    v24 = (IMRadialProgressButton *)objc_msgSend(objc_alloc((Class)IMRadialProgressButton), "initWithFrame:", 0.0, 0.0, 17.0, 17.0);
    downloadProgressButton = v3->_downloadProgressButton;
    v3->_downloadProgressButton = v24;

    -[IMRadialProgressButton setCenterImageNormal:](v3->_downloadProgressButton, "setCenterImageNormal:", 0);
    -[IMRadialProgressButton setCenterImageSelected:](v3->_downloadProgressButton, "setCenterImageSelected:", 0);
    -[IMRadialProgressButton setInscribeProgress:](v3->_downloadProgressButton, "setInscribeProgress:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    -[IMRadialProgressButton setProgressColor:](v3->_downloadProgressButton, "setProgressColor:", v26);

    -[IMRadialProgressButton setProgressLineCap:](v3->_downloadProgressButton, "setProgressLineCap:", 1);
    -[IMRadialProgressButton setProgressThickness:](v3->_downloadProgressButton, "setProgressThickness:", 2.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
    -[IMRadialProgressButton setTrackColor:](v3->_downloadProgressButton, "setTrackColor:", v27);

    -[IMRadialProgressButton setTrackDiameter:](v3->_downloadProgressButton, "setTrackDiameter:", 17.0);
    -[IMRadialProgressButton setTrackThickness:](v3->_downloadProgressButton, "setTrackThickness:", 2.0);
    -[IMRadialProgressButton setTouchInsets:](v3->_downloadProgressButton, "setTouchInsets:", -13.5, -13.5, -13.5, -13.5);
    -[IMRadialProgressButton addTarget:action:forControlEvents:](v3->_downloadProgressButton, "addTarget:action:forControlEvents:", v3, "_cancelDownload:", 64);
    -[BKLibraryDownloadStatus progressValue](v3->_libraryDownloadStatus, "progressValue");
    *(float *)&v28 = v28;
    -[IMRadialProgressButton setProgress:](v3->_downloadProgressButton, "setProgress:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v29, "addSubview:", v3->_downloadProgressButton);

    v30 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v30;

    v32 = v3->_titleLabel;
    v33 = (unint64_t)-[UILabel accessibilityTraits](v32, "accessibilityTraits");
    -[UILabel setAccessibilityTraits:](v32, "setAccessibilityTraits:", UIAccessibilityTraitButton | UIAccessibilityTraitHeader | v33);
    v34 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    authorLabel = v3->_authorLabel;
    v3->_authorLabel = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v36, "addSubview:", v3->_titleLabel);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v37, "addSubview:", v3->_authorLabel);

    v38 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    combinedDateLabel = v3->_combinedDateLabel;
    v3->_combinedDateLabel = v38;

    if (-[BKLibraryBookshelfFinishedBookCell isRTL](v3, "isRTL"))
      v40 = 0;
    else
      v40 = 2;
    -[UILabel setTextAlignment:](v3->_combinedDateLabel, "setTextAlignment:", v40);
    -[UILabel setMinimumScaleFactor:](v3->_combinedDateLabel, "setMinimumScaleFactor:", 0.5);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v41, "addSubview:", v3->_combinedDateLabel);

    v42 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    dateIndicator = v3->_dateIndicator;
    v3->_dateIndicator = (CAShapeLayer *)v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    objc_msgSend(v45, "addSublayer:", v3->_dateIndicator);

    v46 = -[BKLibraryStarRating initWithFrame:]([BKLibraryStarRating alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    starRating = v3->_starRating;
    v3->_starRating = v46;

    -[BKLibraryStarRating setDelegate:](v3->_starRating, "setDelegate:", v3);
    -[BKLibraryStarRating setIsRTL:](v3->_starRating, "setIsRTL:", v3->_isRTL);
    -[BKLibraryStarRating setAllowHalfStars:](v3->_starRating, "setAllowHalfStars:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v48, "addSubview:", v3->_starRating);

    v49 = (BCLibraryButton *)objc_alloc_init((Class)BCLibraryButton);
    markAsFinishedButton = v3->_markAsFinishedButton;
    v3->_markAsFinishedButton = v49;

    -[BCLibraryButton setClipsToBounds:](v3->_markAsFinishedButton, "setClipsToBounds:", 1);
    -[BCLibraryButton addTarget:action:forControlEvents:](v3->_markAsFinishedButton, "addTarget:action:forControlEvents:", v3, "markAsFinishedPressed", 64);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v51, "addSubview:", v3->_markAsFinishedButton);

    v52 = objc_claimAutoreleasedReturnValue(+[IMTouchInsetsButton buttonWithType:](IMTouchInsetsButton, "buttonWithType:", 0));
    moreButton = v3->_moreButton;
    v3->_moreButton = (IMTouchInsetsButton *)v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("More Actions"), &stru_10091C438, 0));
    -[IMTouchInsetsButton setAccessibilityLabel:](v3->_moreButton, "setAccessibilityLabel:", v55);

    -[IMTouchInsetsButton setTouchInsets:](v3->_moreButton, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v56, "addSubview:", v3->_moreButton);

    v57 = (BCLibraryButton *)objc_alloc_init((Class)BCLibraryButton);
    writeReviewButton = v3->_writeReviewButton;
    v3->_writeReviewButton = v57;

    -[BCLibraryButton setClipsToBounds:](v3->_writeReviewButton, "setClipsToBounds:", 1);
    -[BCLibraryButton addTarget:action:forControlEvents:](v3->_writeReviewButton, "addTarget:action:forControlEvents:", v3, "writeReviewPressed", 64);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v59, "addSubview:", v3->_writeReviewButton);

    v60 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    reviewBackground = v3->_reviewBackground;
    v3->_reviewBackground = (CALayer *)v60;

    -[CALayer setZPosition:](v3->_reviewBackground, "setZPosition:", -1.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "layer"));
    objc_msgSend(v63, "addSublayer:", v3->_reviewBackground);

    v64 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    reviewTitle = v3->_reviewTitle;
    v3->_reviewTitle = v64;

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView"));
    objc_msgSend(v66, "addSubview:", v3->_reviewTitle);

    v67 = (IMExpandingLabel *)objc_msgSend(objc_alloc((Class)IMExpandingLabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    reviewComments = v3->_reviewComments;
    v3->_reviewComments = v67;

    v71 = _NSConcreteStackBlock;
    v72 = 3221225472;
    v73 = sub_1000E7E5C;
    v74 = &unk_1008E74C8;
    objc_copyWeak(&v75, &location);
    -[IMExpandingLabel setLabelResizedBlock:](v3->_reviewComments, "setLabelResizedBlock:", &v71);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell contentView](v3, "contentView", v71, v72, v73, v74));
    objc_msgSend(v69, "addSubview:", v3->_reviewComments);

    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](self->_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CA1C0);
  -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](self->_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009CA1C8);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("isFinished"), off_1009CA1D0);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("notFinished"), off_1009CA1D0);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("dateFinished"), off_1009CA1D0);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1009CA1D0);
  -[BKLibraryAsset removeObserver:forKeyPath:context:](self->_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009CA1D0);
  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CA1D8);
  -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](self->_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), off_1009CA1E0);
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  -[BKLibraryBookshelfCollectionViewCell dealloc](&v3, "dealloc");
}

- (void)cleanupCell
{
  -[BKLibraryBookshelfFinishedBookCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", 0);
  -[BKLibraryBookshelfFinishedBookCell setAudiobookStatus:](self, "setAudiobookStatus:", 0);
  -[BKLibraryBookshelfFinishedBookCell setLibraryAsset:](self, "setLibraryAsset:", 0);
  self->_finishedState = 10;
}

- (void)prepareForReuse
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  -[BKLibraryBookshelfCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[BKLibraryBookshelfFinishedBookCell cleanupCell](self, "cleanupCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
    -[BKLibraryBookshelfFinishedBookCell setCoverHidden:](self, "setCoverHidden:", 0);
  +[CATransaction commit](CATransaction, "commit");
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  BOOL v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  v5 = a4;
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v6 = 1;
  }
  else
  {
    -[BKLibraryBookshelfFinishedBookCell coverFrame](self, "coverFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "locationInView:", self);
    v18.x = v15;
    v18.y = v16;
    v19.origin.x = v8;
    v19.origin.y = v10;
    v19.size.width = v12;
    v19.size.height = v14;
    v6 = CGRectContainsPoint(v19, v18);
  }

  return v6;
}

- (void)markAsFinishedPressed
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell actionHandler](self, "actionHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  objc_msgSend(v4, "bookMarkedFinished:", v3);

}

- (void)writeReviewPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell storageProvider](self, "storageProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permanentOrTemporaryAssetID"));
  objc_msgSend(v3, "storeValue:forKey:forConsumer:", &__kCFBooleanFalse, CFSTR("kStarRatedThisSession"), v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell actionHandler](self, "actionHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  objc_msgSend(v7, "bookWriteReview:", v6);

}

- (void)reviewMorePressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[BKLibraryBookshelfFinishedBookCell setShowFullReviewText:](self, "setShowFullReviewText:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell storageProvider](self, "storageProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BKLibraryBookshelfFinishedBookCell showFullReviewText](self, "showFullReviewText")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "permanentOrTemporaryAssetID"));
  objc_msgSend(v3, "storeValue:forKey:forConsumer:", v4, CFSTR("kExpandReviewText"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentOrTemporaryAssetID"));

  if (v12)
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "heightCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "removeObjectForKey:", v12);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell layoutManager](self, "layoutManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell indexPath](self, "indexPath"));
    objc_msgSend(v10, "invalidateLayoutFor:", v11);

  }
}

- (id)coverLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverView](self, "coverView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coverLayer"));

  return v3;
}

- (void)handleTapWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell actionHandler](self, "actionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell indexPath](self, "indexPath"));
  objc_msgSend(v6, "bookTapped:completion:", v5, v4);

}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coverEffectsEnvironment"));

  return (BCUCoverEffectsEnvironment *)v3;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v5, "setCoverEffectsEnvironment:", v4);

}

- (id)dragPreview
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)UIDragPreview);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverView](self, "coverView"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollectionByModifyingTraits:", &stru_1008EA9B0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6));
  objc_msgSend(v4, "setBackgroundColor:", v8);

  return v4;
}

- (double)_desiredAlphaFromRawAlpha:(double)a3
{
  void *v5;
  double v6;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    a3 = 1.0;
    if ((-[BKLibraryBookshelfFinishedBookCell isSelected](self, "isSelected") & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      objc_msgSend(v5, "shrinkAlpha");
      a3 = v6;

    }
  }
  return a3;
}

- (void)setCoverHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverView](self, "coverView"));
  objc_msgSend(v5, "setHidden:", v3);

  +[CATransaction commit](CATransaction, "commit");
}

- (id)coverImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return v3;
}

- (BKLibraryBookshelfCoverView)coverView
{
  return self->_coverView;
}

- (CGRect)coverFrame
{
  void *v3;
  void *v4;
  double v5;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v4, "coverBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v3, "convertRect:fromLayer:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)coverArea
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[BKLibraryBookshelfFinishedBookCell bounds](self, "bounds");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v5, "margins");
  v7 = v6;
  -[BKLibraryBookshelfFinishedBookCell bookCoverLeftMargin](self, "bookCoverLeftMargin");
  v9 = v7 + v8;

  -[BKLibraryBookshelfFinishedBookCell bookCoverSize](self, "bookCoverSize");
  v11 = v10;
  v13 = v12;
  v14 = -[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL");
  -[BKLibraryBookshelfFinishedBookCell bounds](self, "bounds");
  v19 = IMRectFlippedForRTL(v14, v9, v4, v11, v13, v15, v16, v17, v18);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)configureViewsBasedOnState
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;

  v3 = (double)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
  objc_msgSend(v4, "setAlpha:", v3);

  *(float *)&v3 = (float)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dateIndicator](self, "dateIndicator"));
  LODWORD(v6) = LODWORD(v3);
  objc_msgSend(v5, "setOpacity:", v6);

  v7 = (double)-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell checkmarkView](self, "checkmarkView"));
  objc_msgSend(v8, "setAlpha:", v7);

  if (-[BKLibraryBookshelfFinishedBookCell shouldShowCloud](self, "shouldShowCloud"))
    v9 = 1.0;
  else
    v9 = 0.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
  objc_msgSend(v10, "setAlpha:", v9);

  v11 = -[BKLibraryBookshelfFinishedBookCell shouldShowCloud](self, "shouldShowCloud");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
  objc_msgSend(v12, "setIsAccessibilityElement:", v11);

  if (-[BKLibraryBookshelfFinishedBookCell shouldShowDownloadProgressButton](self, "shouldShowDownloadProgressButton"))
    v13 = 1.0;
  else
    v13 = 0.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell downloadProgressButton](self, "downloadProgressButton"));
  objc_msgSend(v14, "setAlpha:", v13);

  if (-[BKLibraryBookshelfFinishedBookCell shouldShowMoreButton](self, "shouldShowMoreButton"))
    v15 = 1.0;
  else
    v15 = 0.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
  objc_msgSend(v16, "setAlpha:", v15);

  switch(self->_finishedState)
  {
    case 1:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v32) = 0;
      objc_msgSend(v31, "setOpacity:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v33, "setAlpha:", 0.0);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v34, "setAlpha:", 0.0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
      objc_msgSend(v35, "setAlpha:", 0.0);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v36, "setAlpha:", 0.0);

      v37 = (double)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      goto LABEL_16;
    case 2:
    case 8:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v18) = 0;
      objc_msgSend(v17, "setOpacity:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v19, "setAlpha:", 0.0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v20, "setAlpha:", 0.0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v21, "setAlpha:", 0.0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      goto LABEL_18;
    case 3:
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v40) = 0;
      objc_msgSend(v39, "setOpacity:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v41, "setAlpha:", 0.0);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v42, "setAlpha:", 0.0);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v43, "setAlpha:", 0.0);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v44, "setAlpha:", 0.0);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
      goto LABEL_20;
    case 4:
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v46) = 0;
      objc_msgSend(v45, "setOpacity:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v47, "setAlpha:", 0.0);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v48, "setAlpha:", 0.0);

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v49, "setAlpha:", 0.0);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
      objc_msgSend(v50, "setAlpha:", 1.0);

      v37 = (double)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
LABEL_16:
      v64 = v38;
      v51 = v37;
      goto LABEL_22;
    case 5:
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v53) = 0;
      objc_msgSend(v52, "setOpacity:", v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v54, "setAlpha:", 0.0);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v55, "setAlpha:", 0.0);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v56, "setAlpha:", 0.0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
LABEL_18:
      v57 = v22;
      objc_msgSend(v22, "setAlpha:", 0.0);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
      v51 = 1.0;
      goto LABEL_21;
    case 6:
    case 7:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v23, "setAlpha:", 0.0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v24, "setAlpha:", 0.0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
      objc_msgSend(v25, "setAlpha:", 1.0);

      v26 = (double)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v27, "setAlpha:", v26);

      v28 = (double)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v29, "setAlpha:", v28);

      *(float *)&v28 = (float)(-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode") ^ 1);
      v64 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v30) = LODWORD(v28);
      objc_msgSend(v64, "setOpacity:", v30);
      goto LABEL_23;
    case 9:
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      LODWORD(v59) = 0;
      objc_msgSend(v58, "setOpacity:", v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v60, "setAlpha:", 0.0);

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v61, "setAlpha:", 0.0);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
      objc_msgSend(v62, "setAlpha:", 0.0);

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v63, "setAlpha:", 0.0);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
LABEL_20:
      v51 = 0.0;
LABEL_21:
      v64 = v38;
LABEL_22:
      objc_msgSend(v38, "setAlpha:", v51);
LABEL_23:

      break;
    default:
      return;
  }
}

- (void)setFinishedState:(int)a3
{
  int finishedState;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfFinishedBookCell.m", 748, "-[BKLibraryBookshelfFinishedBookCell setFinishedState:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  finishedState = self->_finishedState;
  if (finishedState == 10 || finishedState != a3)
  {
    self->_finishedState = a3;
    if (finishedState != 10)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentOrTemporaryAssetID"));

      if (v8)
      {
        v9 = objc_msgSend((id)objc_opt_class(self), "heightCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v10, "removeObjectForKey:", v8);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell layoutManager](self, "layoutManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell indexPath](self, "indexPath"));
        objc_msgSend(v11, "invalidateLayoutFor:", v12);

      }
    }
    -[BKLibraryBookshelfFinishedBookCell setNeedsLayout](self, "setNeedsLayout");
  }
  -[BKLibraryBookshelfFinishedBookCell configureViewsBasedOnState](self, "configureViewsBasedOnState");
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat height;
  CGFloat MaxX;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double width;
  CGFloat MidY;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  double v30;
  double MaxY;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  char v66;
  int v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  BOOL v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  _BOOL8 v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  void *v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  void *v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  void *v212;
  void *v213;
  double v214;
  void *v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  void *v237;
  void *v238;
  void *v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  void *v255;
  double v256;
  double v257;
  CGPath *v258;
  void *v259;
  unsigned int v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  void *v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  uint64_t v273;
  void *v274;
  void *v275;
  void *v276;
  uint64_t v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  void *v290;
  double v291;
  CGFloat v292;
  double v293;
  double v294;
  void *v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  void *v305;
  void *v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  void *v323;
  void *v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  double v336;
  void *v337;
  void *v338;
  double v339;
  double v340;
  double v341;
  double v342;
  void *v343;
  double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  double v349;
  CGFloat v350;
  double v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  double v357;
  void *v358;
  CGFloat v359;
  void *v360;
  void *v361;
  void *v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  void *v373;
  void *v374;
  double v375;
  double v376;
  double v377;
  double v378;
  void *v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  double v387;
  double v388;
  double v389;
  double v390;
  double v391;
  double v392;
  void *v393;
  double v394;
  double v395;
  double v396;
  double v397;
  double v398;
  double v399;
  double v400;
  double v401;
  double v402;
  double v403;
  void *v404;
  CGFloat v405;
  void *v406;
  void *v407;
  void *v408;
  double v409;
  double v410;
  double v411;
  double v412;
  void *v413;
  double v414;
  double v415;
  double v416;
  double v417;
  double v418;
  double v419;
  double v420;
  double v421;
  double v422;
  double v423;
  void *v424;
  double v425;
  double v426;
  double v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  void *v433;
  double v434;
  double v435;
  double v436;
  double v437;
  double v438;
  double v439;
  double v440;
  double v441;
  void *v442;
  double v443;
  double v444;
  double v445;
  double v446;
  double v447;
  double v448;
  void *v449;
  double v450;
  double v451;
  double v452;
  double v453;
  double v454;
  unsigned int v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  double v462;
  double v463;
  void *v464;
  double v465;
  double v466;
  double v467;
  double v468;
  void *v469;
  double v470;
  double v471;
  double v472;
  double v473;
  double v474;
  double v475;
  double v476;
  double v477;
  double v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  void *v490;
  double v491;
  double v492;
  double v493;
  double v494;
  double v495;
  double v496;
  double v497;
  double v498;
  double v499;
  double v500;
  double v501;
  double v502;
  double v503;
  void *v504;
  double v505;
  _BOOL8 v506;
  double v507;
  double v508;
  double v509;
  double v510;
  double v511;
  double v512;
  double v513;
  double v514;
  void *v515;
  void *v516;
  double v517;
  double v518;
  double v519;
  double v520;
  double v521;
  double v522;
  double v523;
  double v524;
  double v525;
  double v526;
  double v527;
  double v528;
  double v529;
  double v530;
  double v531;
  void *v532;
  double v533;
  double v534;
  double v535;
  double v536;
  double v537;
  double v538;
  double v539;
  double v540;
  void *v541;
  void *v542;
  void *v543;
  double v544;
  double v545;
  double v546;
  double v547;
  double v548;
  double v549;
  double v550;
  double v551;
  double v552;
  double v553;
  double v554;
  double v555;
  double v556;
  double v557;
  double v558;
  void *v559;
  double v560;
  float v561;
  float v562;
  double v563;
  void *v564;
  double v565;
  double v566;
  double v567;
  double v568;
  void *v569;
  void *v570;
  double v571;
  double v572;
  double v573;
  double v574;
  void *v575;
  void *v576;
  double v577;
  double v578;
  double v579;
  double v580;
  void *v581;
  void *v582;
  double v583;
  double v584;
  double v585;
  double v586;
  void *v587;
  void *v588;
  double v589;
  double v590;
  double v591;
  double v592;
  void *v593;
  void *v594;
  double v595;
  double v596;
  double v597;
  double v598;
  void *v599;
  void *v600;
  double v601;
  double v602;
  double v603;
  double v604;
  void *v605;
  void *v606;
  double v607;
  double v608;
  double v609;
  double v610;
  void *v611;
  void *v612;
  double v613;
  double v614;
  double v615;
  double v616;
  void *v617;
  void *v618;
  double v619;
  double v620;
  double v621;
  double v622;
  void *v623;
  void *v624;
  double v625;
  double v626;
  double v627;
  double v628;
  void *v629;
  void *v630;
  double v631;
  double v632;
  double v633;
  double v634;
  double v635;
  double v636;
  double v637;
  double v638;
  double v639;
  double v640;
  double v641;
  double v642;
  double v643;
  double v644;
  double v645;
  double MinY;
  double v647;
  double v648;
  CGFloat v649;
  double v650;
  double v651;
  double v652;
  double v653;
  CGFloat v654;
  double v655;
  double v656;
  CGFloat v657;
  double v658;
  double v659;
  double v660;
  CGFloat v661;
  double v662;
  double v663;
  double v664;
  double v665;
  double v666;
  double v667;
  double v668;
  CGFloat v669;
  double v670;
  CGFloat v671;
  CGFloat v672;
  double v673;
  CGFloat v674;
  double v675;
  CGFloat v676;
  CGFloat v677;
  double MinX;
  double v679;
  double x;
  double v681;
  double rect;
  double v683;
  CGFloat v684;
  double v685;
  double v686;
  double v687;
  double v688;
  double v689;
  double v690;
  double y;
  _QWORD v692[13];
  objc_super v693;
  CGRect v694;
  CGRect v695;
  CGRect v696;
  CGRect v697;
  CGRect v698;
  CGRect v699;
  CGRect v700;
  CGRect v701;
  CGRect v702;
  CGRect v703;
  CGRect v704;
  CGRect v705;
  CGRect v706;
  CGRect v707;
  CGRect v708;
  CGRect v709;
  CGRect v710;
  CGRect v711;
  CGRect v712;
  CGRect v713;
  CGRect v714;
  CGRect v715;
  CGRect v716;
  CGRect v717;
  CGRect v718;
  CGRect v719;
  CGRect v720;
  CGRect v721;
  CGRect v722;
  CGRect v723;
  CGRect v724;
  CGRect v725;
  CGRect v726;
  CGRect v727;
  CGRect v728;
  CGRect v729;
  CGRect v730;
  CGRect v731;
  CGRect v732;
  CGRect v733;
  CGRect v734;
  CGRect v735;
  CGRect v736;
  CGRect v737;
  CGRect v738;
  CGRect v739;
  CGRect v740;
  CGRect v741;
  CGRect v742;
  CGRect v743;
  CGRect v744;
  CGRect v745;
  CGRect v746;
  CGRect v747;
  CGRect v748;
  CGRect v749;
  CGRect v750;
  CGRect v751;
  CGRect v752;
  CGRect v753;
  CGRect v754;
  CGRect v755;
  CGRect v756;
  CGRect v757;
  CGRect v758;

  v693.receiver = self;
  v693.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  -[BKLibraryBookshelfFinishedBookCell layoutSubviews](&v693, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  -[BKLibraryBookshelfFinishedBookCell bounds](self, "bounds");
  rect = v694.size.width;
  height = v694.size.height;
  x = v694.origin.x;
  y = v694.origin.y;
  MaxX = CGRectGetMaxX(v694);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v6, "margins");
  v8 = v7;

  -[BKLibraryBookshelfFinishedBookCell coverArea](self, "coverArea");
  v9 = v695.origin.x;
  v10 = v695.origin.y;
  width = v695.size.width;
  v667 = v695.size.height;
  MidY = CGRectGetMidY(v695);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
  objc_msgSend(v13, "bounds");
  v16 = v15 == CGSizeZero.width && v14 == CGSizeZero.height;
  v668 = CGSizeZero.height;
  v650 = MidY;
  v644 = v8;
  v645 = MaxX;
  if (v16)
  {

  }
  else
  {
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    v18 = v17;

    if (v18 != 0.0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverView](self, "coverView"));
      goto LABEL_9;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
LABEL_9:
  v20 = v19;
  objc_msgSend(v19, "setFrame:", v9, v10, width, v667);

  v21 = objc_msgSend(v3, "reviewBottomLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v22, "margins");
  v24 = v23;
  objc_msgSend(v3, "lockupMargin");
  v26 = v24 + v25;

  v696.origin.x = x;
  v696.origin.y = y;
  v696.size.width = rect;
  v696.size.height = height;
  v675 = v26;
  v27 = CGRectGetWidth(v696) - v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v28, "margins");
  v30 = v27 - v29;

  v697.origin.x = v9;
  v697.origin.y = v10;
  v697.size.width = width;
  v697.size.height = v667;
  MaxY = CGRectGetMaxY(v697);
  v698.origin.x = v9;
  v698.origin.y = v10;
  v698.size.width = width;
  v698.size.height = v667;
  MinY = CGRectGetMinY(v698);
  v658 = MaxY - MinY;
  v664 = width;
  v665 = v10;
  v666 = v9;
  v699.origin.x = v9;
  v699.origin.y = v10;
  v699.size.width = width;
  v699.size.height = v667;
  MinX = CGRectGetMinX(v699);
  v700.origin.x = x;
  v700.origin.y = y;
  v700.size.width = rect;
  v681 = height;
  v700.size.height = height;
  v655 = CGRectGetWidth(v700);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
  objc_msgSend(v32, "margins");
  v647 = v33;

  objc_msgSend(v3, "lockupBottomSpacing");
  v683 = MaxY + v34;
  objc_msgSend(v3, "smallLayoutSpaceNeeded");
  v36 = v35;
  v37 = CGRectZero.origin.y;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v38, "sizeThatFits:", v30, 1.79769313e308);
  v40 = v39;
  v42 = v41;

  if (v40 >= v30)
    v43 = v30;
  else
    v43 = v40;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v44, "sizeThatFits:", v30, 1.79769313e308);
  v46 = v45;
  v48 = v47;

  v651 = v30;
  if (v46 < v30)
    v30 = v46;
  objc_msgSend(v3, "authorSpacing");
  v50 = v42 + v48 + v49;
  v649 = v37;
  if (v50 <= v658)
  {
    v643 = v43;
    v653 = v48;
    v656 = v30;
    v648 = v42;
    if (v658 - v50 < v36)
    {
      v67 = 0;
      v21 = 1;
      v659 = v675;
      v66 = 1;
LABEL_36:
      v70 = v681;
      v69 = rect;
      v71 = y;
      v68 = MinY;
      v56 = v648;
      v64 = v43;
      goto LABEL_37;
    }
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
      goto LABEL_24;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
    objc_msgSend(v72, "alpha");
    v74 = v73;

    if (v74 == 0.0)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v84, "alpha");
      v86 = v85;

      if (v86 == 0.0)
      {
LABEL_24:
        v66 = 0;
        v67 = 1;
LABEL_35:
        v659 = v675;
        goto LABEL_36;
      }
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v87, "titleEdgeInsets");
      v89 = v88;
      v91 = v90;

      v92 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v92, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v94 = v93;

      v83 = v89 + v91 + v94 <= v651;
    }
    else
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v75, "titleEdgeInsets");
      v77 = v76;
      v79 = v78;

      v80 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v80, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v82 = v81;

      v83 = v77 + v79 + v82 <= v651;
    }
    v66 = !v83;
    v67 = v83;
    goto LABEL_35;
  }
  v51 = v655 - MinX - v647;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v52, "sizeThatFits:", v51, 1.79769313e308);
  v54 = v53;
  v56 = v55;

  v701.origin.x = CGRectZero.origin.x;
  v701.origin.y = v37;
  v701.size.width = v54;
  v701.size.height = v56;
  v57 = CGRectGetWidth(v701);
  if (v57 >= v51)
    v58 = v655 - MinX - v647;
  else
    v58 = v57;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v59, "sizeThatFits:", v51, 1.79769313e308);
  v61 = v60;
  v63 = v62;

  v702.origin.x = CGRectZero.origin.x;
  v702.origin.y = v37;
  v702.size.width = v61;
  v64 = v58;
  v653 = v63;
  v702.size.height = v63;
  v65 = CGRectGetWidth(v702);
  v66 = 0;
  v67 = 0;
  if (v65 >= v51)
    v65 = v655 - MinX - v647;
  v656 = v65;
  v659 = MinX;
  v21 = 1;
  v69 = rect;
  v68 = v683;
  v70 = v681;
  v71 = y;
LABEL_37:
  v95 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL", *(_QWORD *)&v643), v659, v68, v64, v56, x, v71, v69, v70);
  v96 = v68;
  v97 = v56;
  v98 = v95;
  v100 = v99;
  v102 = v101;
  v104 = v103;
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
  objc_msgSend(v105, "setFrame:", v98, v100, v102, v104);

  v703.origin.x = v659;
  v703.origin.y = v96;
  v703.size.width = v64;
  v703.size.height = v97;
  v106 = CGRectGetMaxY(v703);
  objc_msgSend(v3, "authorSpacing");
  v108 = v106 + v107;
  v109 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v659, v108, v656, v653, x, y, rect, v681);
  v111 = v110;
  v113 = v112;
  v115 = v114;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
  objc_msgSend(v116, "setFrame:", v109, v111, v113, v115);

  if ((v66 & 1) == 0)
  {
    v704.origin.x = v659;
    v704.origin.y = v108;
    v704.size.width = v656;
    v704.size.height = v653;
    v683 = CGRectGetMaxY(v704);
  }
  v117 = -[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL");
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
  objc_msgSend(v118, "setIsRTL:", v117);

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
  objc_msgSend(v119, "alpha");
  v121 = v120;

  if (v67)
    v122 = v675;
  else
    v122 = MinX;
  objc_msgSend(v3, "ratingSpacing");
  v123 = v683;
  v125 = v683 + v124;
  v679 = v122;
  if (v121 == 0.0)
  {
    v126 = rect;
    v127 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v122, v125, CGSizeZero.width, v668, x, y, rect, v681);
    v129 = v128;
    v131 = v130;
    v133 = v132;
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v134, "setFrame:", v127, v129, v131, v133);

  }
  else
  {
    objc_msgSend(v3, "ratingWidth");
    v136 = v135;
    objc_msgSend(v3, "ratingHeight");
    v684 = v137;
    v138 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v122, v125, v136, v137, x, y, rect, v681);
    v140 = v139;
    v142 = v141;
    v144 = v143;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    v146 = v142;
    v126 = rect;
    objc_msgSend(v145, "setFrame:", v138, v140, v146, v144);

    v705.origin.x = v122;
    v705.origin.y = v125;
    v705.size.width = v136;
    v705.size.height = v684;
    v123 = CGRectGetMaxY(v705);
  }
  v685 = v123;
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell checkmarkView](self, "checkmarkView"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "image"));
    objc_msgSend(v148, "size");
    v150 = v149;
    v152 = v151;

    v153 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v153, "margins");
    v155 = v154;
    -[BKLibraryBookshelfFinishedBookCell bookCoverLeftMargin](self, "bookCoverLeftMargin");
    v156 = v123;
    v158 = v155 + v157;
    objc_msgSend(v3, "checkMarkSpacing");
    v160 = v158 - (v150 + v159);

    v706.origin.y = v665;
    v706.origin.x = v666;
    v706.size.width = v664;
    v706.size.height = v667;
    v692[1] = 3221225472;
    v692[0] = _NSConcreteStackBlock;
    v692[2] = sub_1000EB228;
    v692[3] = &unk_1008E8450;
    v692[4] = self;
    *(double *)&v692[5] = v160;
    *(double *)&v692[6] = CGRectGetMidY(v706) + v152 * -0.5;
    *(double *)&v692[7] = v150;
    *(double *)&v692[8] = v152;
    *(double *)&v692[9] = x;
    *(double *)&v692[10] = y;
    *(double *)&v692[11] = rect;
    *(double *)&v692[12] = v681;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v692);
    objc_msgSend(v3, "finishedSpacing");
    v162 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v156 + v161, CGSizeZero.width, v668, x, y, rect, v681);
    v164 = v163;
    v166 = v165;
    v168 = v167;
    v169 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
    objc_msgSend(v169, "setFrame:", v162, v164, v166, v168);

    objc_msgSend(v3, "writeReviewSpacing");
    v686 = v685 + v170;
    v171 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v686, CGSizeZero.width, v668, x, y, rect, v681);
    v173 = v172;
    v175 = v174;
    v177 = v176;
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
    v179 = v171;
    v180 = v675;
    objc_msgSend(v178, "setFrame:", v179, v173, v175, v177);

    v707.origin.x = v679;
    v707.origin.y = v686;
    v707.size.width = CGSizeZero.width;
    v707.size.height = v668;
    v181 = CGRectGetMaxY(v707);
    v687 = v181;
    if (v21)
    {
      objc_msgSend(v3, "bookCoverLeftMargin");
      v183 = v182;
      v184 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
      objc_msgSend(v184, "margins");
      v180 = v183 + v185;

      objc_msgSend(v3, "bookCoverSize");
      v181 = v186;
    }
    objc_msgSend(v3, "reviewSpacing");
    v660 = v181 + v187;
    v188 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v180, v181 + v187, CGSizeZero.width, v668, x, y, rect, v681);
    v190 = v189;
    v192 = v191;
    v194 = v193;
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
    objc_msgSend(v195, "setFrame:", v188, v190, v192, v194);

    v196 = v180;
    v197 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v180, v660, CGSizeZero.width, v668, x, y, rect, v681);
    v199 = v198;
    v201 = v200;
    v203 = v202;
    v204 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
    objc_msgSend(v204, "setFrame:", v197, v199, v201, v203);

    v205 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v196, v660, CGSizeZero.width, v668, x, y, rect, v681);
    v207 = v206;
    v209 = v208;
    v211 = v210;
    v212 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
    objc_msgSend(v212, "setFrame:", v205, v207, v209, v211);

    v213 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
    objc_msgSend(v213, "setExpanded:", 1);

    v214 = v687;
    if (-[BKLibraryBookshelfFinishedBookCell finishedState](self, "finishedState") == 7
      || -[BKLibraryBookshelfFinishedBookCell finishedState](self, "finishedState") == 6)
    {
      v708.size.width = CGSizeZero.width;
      v708.origin.x = v196;
      v708.origin.y = v660;
      v708.size.height = v668;
      v214 = CGRectGetMaxY(v708);
    }
    v688 = v214;
    v215 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
    objc_msgSend(v215, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v217 = v216;
    v676 = v216;

    objc_msgSend(v3, "moreHeight");
    v219 = v218;
    v672 = v218;
    objc_msgSend(v3, "moreSpacing");
    v669 = v214 + v220;
    v221 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v214 + v220, v217, v219, x, y, rect, v681);
    v223 = v222;
    v225 = v224;
    v227 = v226;
    v228 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
    objc_msgSend(v228, "setFrame:", v221, v223, v225, v227);

    objc_msgSend(v3, "moreSpacing");
    v230 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v214 + v229, 17.0, 17.0, x, y, rect, v681);
    v232 = v231;
    v234 = v233;
    v236 = v235;
    v237 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell downloadProgressButton](self, "downloadProgressButton"));
    objc_msgSend(v237, "setFrame:", v230, v232, v234, v236);

    v238 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
    v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v238, "image"));
    objc_msgSend(v239, "size");
    v241 = v240;
    v243 = v242;

    v709.origin.x = v679;
    v709.origin.y = v669;
    v709.size.width = v676;
    v709.size.height = v672;
    v244 = CGRectGetMaxX(v709);
    objc_msgSend(v3, "cloudSpacing");
    v246 = v244 + v245;
    v710.origin.x = v679;
    v710.origin.y = v669;
    v710.size.width = v676;
    v710.size.height = v672;
    v247 = CGRectGetMinY(v710);
    v248 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v246, v247, v241, v243, x, y, rect, v681);
    v250 = v249;
    v252 = v251;
    v254 = v253;
    v255 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
    v256 = v248;
    v257 = v688;
    objc_msgSend(v255, "setFrame:", v256, v250, v252, v254);
  }
  else
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v258 = -[BKLibraryBookshelfFinishedBookCell pathForDateIndicator:](self, "pathForDateIndicator:", v666, v665, v664, v667);
    v259 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dateIndicator](self, "dateIndicator"));
    objc_msgSend(v259, "setPath:", v258);

    v260 = -[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL");
    objc_msgSend(v3, "datelineMargin");
    v262 = v261;
    if (v260)
    {
      objc_msgSend(v3, "datelineWidth");
      v264 = v645 - v644 - v262 + v263 * -0.5;
    }
    else
    {
      v259 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
      objc_msgSend(v259, "margins");
      v264 = v262 + v265;
    }
    v266 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dateIndicator](self, "dateIndicator"));
    objc_msgSend(v266, "setPosition:", v264, 0.0);

    if ((v260 & 1) == 0)
    +[CATransaction commit](CATransaction, "commit");
    v267 = objc_opt_class(UIFont);
    v268 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "dateFontAttributes"));
    v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v269, "font"));
    v271 = BUDynamicCast(v267, v270);
    v255 = (void *)objc_claimAutoreleasedReturnValue(v271);

    if (v255)
    {
      v272 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
      objc_msgSend(v272, "setFont:", v255);

    }
    v273 = objc_opt_class(UIColor);
    v274 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "dateFontAttributes"));
    v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "foregroundColor"));
    v277 = BUDynamicCast(v273, v276);
    v278 = (void *)objc_claimAutoreleasedReturnValue(v277);

    if (v278)
    {
      v279 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
      objc_msgSend(v279, "setTextColor:", v278);

    }
    v280 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    objc_msgSend(v280, "setAdjustsFontSizeToFitWidth:", 0);

    v281 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v281, "margins");
    v283 = v282;
    objc_msgSend(v3, "datelineMargin");
    v285 = v283 + v284;
    objc_msgSend(v3, "dateSpace");
    v287 = v285 - v286;
    objc_msgSend(v3, "datelineCircleSize");
    v289 = v287 - v288 + -4.0;

    v290 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    objc_msgSend(v290, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v292 = v291;
    v294 = v293;

    v295 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
    objc_msgSend(v295, "margins");
    v297 = v296;
    objc_msgSend(v3, "datelineMargin");
    v299 = v297 + v298;
    v711.origin.x = CGRectZero.origin.x;
    v711.origin.y = v649;
    v711.size.width = v292;
    v711.size.height = v294;
    v300 = v299 - CGRectGetWidth(v711);
    objc_msgSend(v3, "dateSpace");
    v302 = v300 - v301;
    objc_msgSend(v3, "datelineCircleSize");
    v304 = v302 - v303;

    v712.origin.x = v304;
    v712.origin.y = v649;
    v712.size.width = v292;
    v712.size.height = v294;
    if (CGRectGetWidth(v712) <= v289)
    {
      v289 = v292;
    }
    else
    {
      v305 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
      objc_msgSend(v305, "setAdjustsFontSizeToFitWidth:", 1);

      v306 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
      objc_msgSend(v306, "margins");
      v308 = v307;
      objc_msgSend(v3, "datelineMargin");
      v310 = v308 + v309;
      v713.origin.x = v304;
      v713.origin.y = v649;
      v713.size.width = v289;
      v713.size.height = v294;
      v311 = v310 - CGRectGetWidth(v713);
      objc_msgSend(v3, "dateSpace");
      v313 = v311 - v312;
      objc_msgSend(v3, "datelineCircleSize");
      v304 = v313 - v314;

      v292 = v289;
    }
    v714.origin.x = v304;
    v714.origin.y = v649;
    v714.size.width = v292;
    v714.size.height = v294;
    v715.origin.y = CGRectGetMaxY(v714);
    v715.origin.x = v304;
    v715.size.width = v289;
    v715.size.height = v294;
    v315 = v650 - round(CGRectGetHeight(v715) * 0.5);
    v316 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v304, v315, v289, v294, x, y, v126, v681);
    v318 = v317;
    v320 = v319;
    v322 = v321;
    v323 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    objc_msgSend(v323, "setFrame:", v316, v318, v320, v322);

    v324 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
    objc_msgSend(v324, "alpha");
    v326 = v325;

    if (v326 == 0.0)
    {
      objc_msgSend(v3, "finishedSpacing");
      v327 = v126;
      v328 = v685;
      v330 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v685 + v329, CGSizeZero.width, v668, x, y, v327, v681);
      v332 = v331;
      v334 = v333;
      v336 = v335;
      v337 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v337, "setFrame:", v330, v332, v334, v336);

    }
    else
    {
      v338 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v338, "titleEdgeInsets");
      v340 = v339;
      v342 = v341;

      v343 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v343, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v345 = v344;
      v347 = v346;
      v661 = v346;

      v348 = v340 + v342 + v345;
      objc_msgSend(v3, "finishedSpacing");
      v350 = v685 + v349;
      v351 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v685 + v349, v348, v347, x, y, v126, v681);
      v353 = v352;
      v355 = v354;
      v357 = v356;
      v358 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v358, "setFrame:", v351, v353, v355, v357);

      v716.origin.x = v679;
      v716.origin.y = v350;
      v716.size.width = v348;
      v716.size.height = v661;
      v359 = CGRectGetHeight(v716) * 0.5;
      v360 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v360, "layer"));
      objc_msgSend(v361, "setCornerRadius:", v359);

      v717.origin.x = v679;
      v717.origin.y = v350;
      v717.size.width = v348;
      v717.size.height = v661;
      v328 = CGRectGetMaxY(v717);
    }
    v362 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
    objc_msgSend(v362, "alpha");
    v364 = v363;

    if (v364 == 0.0)
    {
      objc_msgSend(v3, "writeReviewSpacing");
      v366 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v328 + v365, CGSizeZero.width, v668, x, y, rect, v681);
      v368 = v367;
      v370 = v369;
      v372 = v371;
      v373 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v373, "setFrame:", v366, v368, v370, v372);

    }
    else
    {
      v374 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v374, "titleEdgeInsets");
      v376 = v375;
      v378 = v377;

      v379 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v379, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      v381 = v380;
      v383 = v382;

      v384 = v376 + v378 + v381;
      objc_msgSend(v3, "writeReviewSpacing");
      v386 = v328 + v385;
      v718.origin.x = v679;
      v718.origin.y = v386;
      v718.size.width = v384;
      v718.size.height = v383;
      v387 = CGRectGetMaxX(v718);
      v719.origin.x = x;
      v719.size.height = v681;
      v719.origin.y = y;
      v388 = rect;
      v719.size.width = rect;
      if (v387 <= CGRectGetMaxX(v719)
        || (v720.origin.x = v679,
            v720.origin.y = v386,
            v720.size.width = v384,
            v720.size.height = v383,
            v389 = CGRectGetMinY(v720),
            objc_msgSend(v3, "bookCoverSize"),
            v389 <= v390))
      {
        v395 = v679;
        v396 = x;
      }
      else
      {
        v721.size.height = v681;
        v721.origin.x = x;
        v721.origin.y = y;
        v721.size.width = rect;
        v391 = CGRectGetMaxX(v721);
        v722.origin.x = v679;
        v722.origin.y = v386;
        v722.size.width = v384;
        v722.size.height = v383;
        v392 = v391 - CGRectGetWidth(v722);
        v393 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
        objc_msgSend(v393, "margins");
        v395 = v392 - v394;
        v396 = x;
        v388 = rect;

      }
      v397 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v395, v386, v384, v383, v396, y, v388, v681);
      v399 = v398;
      v401 = v400;
      v403 = v402;
      v404 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v404, "setFrame:", v397, v399, v401, v403);

      v723.origin.x = v395;
      v723.origin.y = v386;
      v723.size.width = v384;
      v723.size.height = v383;
      v405 = CGRectGetHeight(v723) * 0.5;
      v406 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      v407 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v406, "layer"));
      objc_msgSend(v407, "setCornerRadius:", v405);

      v724.origin.x = v395;
      v724.origin.y = v386;
      v724.size.width = v384;
      v724.size.height = v383;
      v328 = CGRectGetMaxY(v724);
    }
    v408 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
    objc_msgSend(v408, "alpha");
    v410 = v409;

    v689 = v328;
    if (v410 == 0.0)
    {
      if (v21)
      {
        objc_msgSend(v3, "bookCoverLeftMargin");
        v412 = v411;
        v413 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
        objc_msgSend(v413, "margins");
        v675 = v412 + v414;

        objc_msgSend(v3, "bookCoverSize");
        v328 = v415;
      }
      objc_msgSend(v3, "reviewSpacing");
      v662 = v328 + v416;
      v417 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v675, v328 + v416, CGSizeZero.width, v668, x, y, rect, v681);
      v419 = v418;
      v421 = v420;
      v423 = v422;
      v424 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      objc_msgSend(v424, "setFrame:", v417, v419, v421, v423);

      v425 = v681;
      v426 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v675, v662, CGSizeZero.width, v668, x, y, rect, v681);
      v428 = v427;
      v430 = v429;
      v432 = v431;
      v433 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v433, "setFrame:", v426, v428, v430, v432);

      v434 = y;
      v435 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v675, v662, CGSizeZero.width, v668, x, y, rect, v681);
      v437 = v436;
      v439 = v438;
      v441 = v440;
      v442 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v442, "setFrame:", v435, v437, v439, v441);

      v443 = x;
      v444 = v689;
    }
    else
    {
      v445 = v651;
      if (v21)
      {
        v725.origin.x = x;
        v725.size.height = v681;
        v725.origin.y = y;
        v725.size.width = rect;
        v446 = CGRectGetWidth(v725);
        objc_msgSend(v3, "bookCoverLeftMargin");
        v448 = v446 - v447;
        v449 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
        objc_msgSend(v449, "margins");
        v445 = v448 + v450 * -2.0;

      }
      objc_msgSend(v3, "reviewLeftMargin");
      v652 = v445;
      v452 = v445 - v451;
      objc_msgSend(v3, "reviewRightMargin");
      v454 = v452 - v453;
      v455 = -[BKLibraryBookshelfFinishedBookCell finishedState](self, "finishedState");
      v456 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      v457 = v456;
      if (v455 == 7)
      {
        objc_msgSend(v456, "setExpanded:", 1);

        v458 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
        v459 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v458, "text"));
        v460 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewContentFontAttributes"));
        v461 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v460, "attributes"));
        objc_msgSend(v459, "boundingRectWithSize:options:attributes:context:", 1, v461, 0, v454, 1.79769313e308);
        v462 = CGRectGetHeight(v726);

      }
      else
      {
        objc_msgSend(v456, "setExpanded:", 0);

        v458 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
        objc_msgSend(v458, "sizeThatFits:", v454, 1.79769313e308);
        v462 = v463;
      }

      v464 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v464, "sizeThatFits:", v454, 1.79769313e308);
      v466 = v465;

      v673 = v454;
      if (v21)
      {
        objc_msgSend(v3, "bookCoverLeftMargin");
        v468 = v467;
        v469 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell columnMetrics](self, "columnMetrics"));
        objc_msgSend(v469, "margins");
        v675 = v468 + v470;

        objc_msgSend(v3, "bookCoverSize");
        v472 = v471;
        objc_msgSend(v3, "moreHeight");
        v474 = v328 + v473;
        objc_msgSend(v3, "moreSpacing");
        v476 = v474 + v475;
        if (v472 >= v476)
          v328 = v472;
        else
          v328 = v476;
      }
      objc_msgSend(v3, "reviewSpacing");
      v478 = v328 + v477;
      objc_msgSend(v3, "reviewTopMargin");
      v480 = v462 + v479;
      objc_msgSend(v3, "reviewBottomMargin");
      v482 = v466 + v480 + v481;
      v663 = v466;
      v483 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v675, v478, v652, v482, x, y, rect, v681);
      v485 = v484;
      v670 = v462;
      v487 = v486;
      v489 = v488;
      v490 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      objc_msgSend(v490, "setFrame:", v483, v485, v487, v489);

      v727.origin.x = v675;
      v727.origin.y = v478;
      v727.size.width = v652;
      v727.size.height = v482;
      v491 = CGRectGetMinX(v727);
      objc_msgSend(v3, "reviewLeftMargin");
      v493 = v491 + v492;
      v728.origin.x = v675;
      v654 = v482;
      v657 = v478;
      v728.origin.y = v478;
      v728.size.width = v652;
      v728.size.height = v482;
      v494 = CGRectGetMinY(v728);
      objc_msgSend(v3, "reviewTopMargin");
      v496 = v494 + v495;
      v497 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v493, v496, v673, v663, x, y, rect, v681);
      v499 = v498;
      v501 = v500;
      v503 = v502;
      v504 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
      objc_msgSend(v504, "setFrame:", v497, v499, v501, v503);

      v729.origin.x = v493;
      v729.origin.y = v496;
      v729.size.width = v673;
      v729.size.height = v663;
      v505 = CGRectGetMaxY(v729);
      v506 = -[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL");
      v507 = v493;
      v434 = y;
      v443 = x;
      v425 = v681;
      v508 = IMRectFlippedForRTL(v506, v507, v505, v673, v670, x, y, rect, v681);
      v510 = v509;
      v512 = v511;
      v514 = v513;
      v515 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
      objc_msgSend(v515, "setFrame:", v508, v510, v512, v514);

      v444 = v689;
      if ((v21 & 1) == 0)
      {
        v730.origin.x = v675;
        v730.size.height = v654;
        v730.origin.y = v657;
        v730.size.width = v652;
        v444 = CGRectGetMaxY(v730);
      }
    }
    v690 = v444;
    v516 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
    objc_msgSend(v516, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v518 = v517;
    v674 = v517;

    objc_msgSend(v3, "moreHeight");
    v520 = v519;
    v677 = v519;
    objc_msgSend(v3, "moreSpacing");
    v671 = v444 + v521;
    v522 = v443;
    v523 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v444 + v521, v518, v520, v443, v434, rect, v425);
    v525 = v524;
    v526 = v425;
    v528 = v527;
    v529 = v434;
    v531 = v530;
    v532 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
    objc_msgSend(v532, "setFrame:", v523, v525, v528, v531);

    objc_msgSend(v3, "moreSpacing");
    v534 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v679, v690 + v533, 17.0, 17.0, v522, v529, rect, v526);
    v536 = v535;
    v538 = v537;
    v540 = v539;
    v541 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell downloadProgressButton](self, "downloadProgressButton"));
    objc_msgSend(v541, "setFrame:", v534, v536, v538, v540);

    v542 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
    v543 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v542, "image"));
    objc_msgSend(v543, "size");
    v545 = v544;
    v547 = v546;

    v731.origin.x = v679;
    v731.origin.y = v671;
    v731.size.width = v674;
    v731.size.height = v677;
    v548 = CGRectGetMaxX(v731);
    objc_msgSend(v3, "cloudSpacing");
    v550 = v548 + v549;
    v732.origin.x = v679;
    v732.origin.y = v671;
    v732.size.width = v674;
    v732.size.height = v677;
    v551 = CGRectGetMinY(v732);
    v552 = IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v550, v551, v545, v547, x, v529, rect, v681);
    v554 = v553;
    v556 = v555;
    v558 = v557;
    v559 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
    v560 = v552;
    v257 = v690;
    objc_msgSend(v559, "setFrame:", v560, v554, v556, v558);

  }
  v733.origin.y = v665;
  v733.origin.x = v666;
  v733.size.width = v664;
  v733.size.height = v667;
  v561 = (CGRectGetHeight(v733) - v257) * 0.5;
  v562 = floorf(v561);
  if (v562 > 1.0)
  {
    v563 = v562;
    v564 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v564, "frame");
    v735 = CGRectOffset(v734, 0.0, v563);
    v565 = v735.origin.x;
    v566 = v735.origin.y;
    v567 = v735.size.width;
    v568 = v735.size.height;
    v569 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v569, "setFrame:", v565, v566, v567, v568);

    v570 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    objc_msgSend(v570, "frame");
    v737 = CGRectOffset(v736, 0.0, v563);
    v571 = v737.origin.x;
    v572 = v737.origin.y;
    v573 = v737.size.width;
    v574 = v737.size.height;
    v575 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    objc_msgSend(v575, "setFrame:", v571, v572, v573, v574);

    v576 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v576, "frame");
    v739 = CGRectOffset(v738, 0.0, v563);
    v577 = v739.origin.x;
    v578 = v739.origin.y;
    v579 = v739.size.width;
    v580 = v739.size.height;
    v581 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v581, "setFrame:", v577, v578, v579, v580);

    if (!-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    {
      v582 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v582, "frame");
      v741 = CGRectOffset(v740, 0.0, v563);
      v583 = v741.origin.x;
      v584 = v741.origin.y;
      v585 = v741.size.width;
      v586 = v741.size.height;
      v587 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      objc_msgSend(v587, "setFrame:", v583, v584, v585, v586);

      v588 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v588, "frame");
      v743 = CGRectOffset(v742, 0.0, v563);
      v589 = v743.origin.x;
      v590 = v743.origin.y;
      v591 = v743.size.width;
      v592 = v743.size.height;
      v593 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      objc_msgSend(v593, "setFrame:", v589, v590, v591, v592);

      v594 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
      objc_msgSend(v594, "frame");
      v745 = CGRectOffset(v744, 0.0, v563);
      v595 = v745.origin.x;
      v596 = v745.origin.y;
      v597 = v745.size.width;
      v598 = v745.size.height;
      v599 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
      objc_msgSend(v599, "setFrame:", v595, v596, v597, v598);

      v600 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell downloadProgressButton](self, "downloadProgressButton"));
      objc_msgSend(v600, "frame");
      v747 = CGRectOffset(v746, 0.0, v563);
      v601 = v747.origin.x;
      v602 = v747.origin.y;
      v603 = v747.size.width;
      v604 = v747.size.height;
      v605 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell downloadProgressButton](self, "downloadProgressButton"));
      objc_msgSend(v605, "setFrame:", v601, v602, v603, v604);

      v606 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
      objc_msgSend(v606, "frame");
      v749 = CGRectOffset(v748, 0.0, v563);
      v607 = v749.origin.x;
      v608 = v749.origin.y;
      v609 = v749.size.width;
      v610 = v749.size.height;
      v611 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
      objc_msgSend(v611, "setFrame:", v607, v608, v609, v610);

      if ((v21 & 1) == 0)
      {
        v612 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
        objc_msgSend(v612, "frame");
        v751 = CGRectOffset(v750, 0.0, v563);
        v613 = v751.origin.x;
        v614 = v751.origin.y;
        v615 = v751.size.width;
        v616 = v751.size.height;
        v617 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
        objc_msgSend(v617, "setFrame:", v613, v614, v615, v616);

        v618 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
        objc_msgSend(v618, "frame");
        v753 = CGRectOffset(v752, 0.0, v563);
        v619 = v753.origin.x;
        v620 = v753.origin.y;
        v621 = v753.size.width;
        v622 = v753.size.height;
        v623 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
        objc_msgSend(v623, "setFrame:", v619, v620, v621, v622);

        v624 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
        objc_msgSend(v624, "frame");
        v755 = CGRectOffset(v754, 0.0, v563);
        v625 = v755.origin.x;
        v626 = v755.origin.y;
        v627 = v755.size.width;
        v628 = v755.size.height;
        v629 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
        objc_msgSend(v629, "setFrame:", v625, v626, v627, v628);

      }
    }
  }
  v630 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewCell audiobookControl](self, "audiobookControl"));
  if (v630)
  {
    objc_msgSend(v3, "audiobookControlMargin");
    v632 = v631;
    objc_msgSend(v630, "frame");
    v634 = v633;
    v636 = v635;
    -[BKLibraryBookshelfFinishedBookCell coverContainerFrame](self, "coverContainerFrame");
    v637 = v756.origin.x;
    v638 = v756.origin.y;
    v639 = v756.size.width;
    v640 = v756.size.height;
    v641 = v632 + v756.origin.x;
    v642 = v756.origin.y + CGRectGetHeight(v756) - v636 - v632;
    objc_msgSend(v630, "frame");
    v758.origin.x = v641;
    v758.origin.y = v642;
    v758.size.width = v634;
    v758.size.height = v636;
    if (!CGRectEqualToRect(v757, v758))
      objc_msgSend(v630, "setFrame:", IMRectFlippedForRTL(-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"), v641, v642, v634, v636, v637, v638, v639, v640));
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  uint64_t v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  double v66;
  double v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  double v87;
  double v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
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
  double v116;
  double v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  dispatch_time_t v123;
  BKLibraryAsset *libraryAsset;
  double v125;
  double v126;
  void *v127;
  void *v128;
  _QWORD block[5];
  objc_super v130;

  v130.receiver = self;
  v130.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  v4 = a3;
  -[BKLibraryBookshelfCollectionViewCell applyLayoutAttributes:](&v130, "applyLayoutAttributes:", v4);
  v5 = objc_opt_class(BKLibraryLayoutAttributes);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPath"));

  -[BKLibraryBookshelfFinishedBookCell setIndexPath:](self, "setIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[BKLibraryBookshelfFinishedBookCell setIsRTL:](self, "setIsRTL:", objc_msgSend(v9, "userInterfaceLayoutDirection") == (id)1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "columnMetrics"));
  -[BKLibraryBookshelfFinishedBookCell setColumnMetrics:](self, "setColumnMetrics:", v10);

  -[BKLibraryBookshelfFinishedBookCell setLayoutDebugMode:](self, "setLayoutDebugMode:", objc_msgSend(v7, "layoutDebugMode"));
  if (-[BKLibraryBookshelfFinishedBookCell layoutDebugMode](self, "layoutDebugMode"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.2)));
    v13 = objc_msgSend(v12, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell layer](self, "layer"));
    objc_msgSend(v14, "setBorderColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell layer](self, "layer"));
    objc_msgSend(v15, "setBorderWidth:", 0.5);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "colorWithAlphaComponent:", 0.2)));
    v18 = objc_msgSend(v17, "CGColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
    objc_msgSend(v20, "setBorderColor:", v18);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    objc_msgSend(v22, "setBorderWidth:", 0.5);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "colorWithAlphaComponent:", 0.2)));
    v25 = objc_msgSend(v24, "CGColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
    objc_msgSend(v27, "setBorderColor:", v25);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "layer"));
    objc_msgSend(v29, "setBorderWidth:", 0.5);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "colorWithAlphaComponent:", 0.2)));
    v32 = objc_msgSend(v31, "CGColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
    objc_msgSend(v33, "setBorderColor:", v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
    objc_msgSend(v34, "setBorderWidth:", 0.5);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "colorWithAlphaComponent:", 0.2)));
    v37 = objc_msgSend(v36, "CGColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layer"));
    objc_msgSend(v39, "setBorderColor:", v37);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layer"));
    objc_msgSend(v41, "setBorderWidth:", 0.5);

  }
  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell layer](self, "layer"));
    objc_msgSend(v42, "setBorderWidth:", 0.0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "layer"));
    objc_msgSend(v44, "setBorderWidth:", 0.0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layer"));
    objc_msgSend(v46, "setBorderWidth:", 0.0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
    objc_msgSend(v40, "setBorderWidth:", 0.0);
  }

  -[BKLibraryBookshelfFinishedBookCell setFirstItem:](self, "setFirstItem:", objc_msgSend(v7, "firstItem"));
  -[BKLibraryBookshelfFinishedBookCell setLastItem:](self, "setLastItem:", objc_msgSend(v7, "lastItem"));
  v47 = 1.0;
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    if (-[BKLibraryBookshelfFinishedBookCell isSelected](self, "isSelected"))
      v47 = 1.0;
    else
      v47 = 0.6;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
  objc_msgSend(v48, "setAlpha:", v47);

  v49 = objc_opt_class(BKLibraryBookshelfCellMetrics_Finished);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  v51 = BUDynamicCast(v49, v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  if (v52 != v53)
  {
    -[BKLibraryBookshelfFinishedBookCell setFinishedMetrics:](self, "setFinishedMetrics:", v52);
    -[BKLibraryBookshelfFinishedBookCell setMetrics:](self, "setMetrics:", v52);
    objc_msgSend(v52, "bookCoverSize");
    -[BKLibraryBookshelfFinishedBookCell setBookCoverSize:](self, "setBookCoverSize:");
    objc_msgSend(v52, "bookCoverLeftMargin");
    -[BKLibraryBookshelfFinishedBookCell setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
    objc_msgSend(v52, "titleMaxLines");
    v55 = (uint64_t)v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    objc_msgSend(v56, "setNumberOfLines:", v55);

    objc_msgSend(v52, "authorMaxLines");
    v58 = (uint64_t)v57;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    objc_msgSend(v59, "setNumberOfLines:", v58);

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "finishedFillColor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
    objc_msgSend(v61, "setNormalBackgroundColor:", v60);

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "finishedFillHilightColor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
    objc_msgSend(v63, "setHighlightBackgroundColor:", v62);

    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "finishedFrameColor"));
    if (v64)
    {
      v65 = (void *)v64;
      objc_msgSend(v52, "finishedFrameWidth");
      v67 = v66;

      if (v67 != 0.0)
      {
        v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "finishedFrameColor")));
        v69 = objc_msgSend(v68, "CGColor");
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "layer"));
        objc_msgSend(v71, "setBorderColor:", v69);

        objc_msgSend(v52, "finishedFrameWidth");
        v73 = v72;
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "layer"));
        objc_msgSend(v75, "setBorderWidth:", v73);

      }
    }
    objc_msgSend(v52, "finishedTitleInset");
    v77 = v76;
    objc_msgSend(v52, "finishedTitleInset");
    v79 = v78;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
    objc_msgSend(v80, "setTitleEdgeInsets:", 0.0, v77, 0.0, v79);

    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "writeReviewFillColor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
    objc_msgSend(v82, "setNormalBackgroundColor:", v81);

    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "writeReviewFillHilightColor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
    objc_msgSend(v84, "setHighlightBackgroundColor:", v83);

    v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "writeReviewFrameColor"));
    if (v85)
    {
      v86 = (void *)v85;
      objc_msgSend(v52, "writeReviewFrameWidth");
      v88 = v87;

      if (v88 != 0.0)
      {
        v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "writeReviewFrameColor")));
        v90 = objc_msgSend(v89, "CGColor");
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "layer"));
        objc_msgSend(v92, "setBorderColor:", v90);

        objc_msgSend(v52, "writeReviewFrameWidth");
        v94 = v93;
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "layer"));
        objc_msgSend(v96, "setBorderWidth:", v94);

      }
    }
    objc_msgSend(v52, "writeReviewTitleInset");
    v98 = v97;
    objc_msgSend(v52, "writeReviewTitleInset");
    v100 = v99;
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
    objc_msgSend(v101, "setTitleEdgeInsets:", 0.0, v98, 0.0, v100);

    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "ratingFrameColor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v103, "setFrameColor:", v102);

    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "ratingFillColor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v105, "setFillColor:", v104);

    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "ratingEmptyColor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v107, "setEmptyColor:", v106);

    v108 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTableSelectionColor](UIColor, "bc_booksTableSelectionColor"));
    -[BKLibraryBookshelfCollectionViewCell setHighlightBackgroundColor:](self, "setHighlightBackgroundColor:", v108);

    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("More"), &stru_10091C438, 0));

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "reviewMoreFontAttributes"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v110, v112));
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
    objc_msgSend(v114, "setShowMoreAttributedText:", v113);

    -[BKLibraryBookshelfFinishedBookCell _updateTintedImages](self, "_updateTintedImages");
    -[BKLibraryBookshelfFinishedBookCell _updateLibraryAsset](self, "_updateLibraryAsset");

  }
  -[BKLibraryBookshelfFinishedBookCell updateFinishedState](self, "updateFinishedState");
  -[BKLibraryBookshelfFinishedBookCell setNeedsLayout](self, "setNeedsLayout");
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));

  if (v115)
  {
    +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
    v117 = v116;
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverView](self, "coverView"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "coverLayer"));
    if (v117 == 0.0)
    {
      libraryAsset = self->_libraryAsset;
      -[BKLibraryBookshelfFinishedBookCell coverArea](self, "coverArea");
      objc_msgSend(v119, "setLibraryAsset:size:", libraryAsset, v125, v126);

    }
    else
    {
      -[BKLibraryBookshelfFinishedBookCell coverArea](self, "coverArea");
      objc_msgSend(v119, "preloadCoverImageAtSize:", v120, v121);

      +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
      v123 = dispatch_time(0, (uint64_t)(v122 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000EBD7C;
      block[3] = &unk_1008E72C0;
      block[4] = self;
      dispatch_after(v123, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverView](self, "coverView"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "coverLayer"));
    objc_msgSend(v128, "setAnimateFrameChange:", 1);

    -[BKLibraryBookshelfFinishedBookCell layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)_updateTintedImages
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
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
  id v70;

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reviewBackgroundName"));
      v70 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v7));

      if (-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"))
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "imageWithHorizontallyFlippedOrientation"));

        v70 = (id)v8;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      objc_msgSend(v9, "setContentsGravity:", kCAGravityResize);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reviewBGColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell traitCollection](self, "traitCollection"));
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "imageMaskWithColor:forTraitCollection:", v11, v12)));
      v14 = objc_msgSend(v13, "CGImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      objc_msgSend(v15, "setContents:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewBackground](self, "reviewBackground"));
      objc_msgSend(v16, "setContentsCenter:", 0.4, 0.4, 0.2, 0.2);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "moreTintColor"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMenuImageWithTintColor:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
      v69 = (void *)v20;
      objc_msgSend(v21, "setImage:forState:", v20, 0);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "templateCloudImageForCloudState:", 1));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
      objc_msgSend(v24, "setImage:", v23);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "moreTintColor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell cloudView](self, "cloudView"));
      objc_msgSend(v27, "setTintColor:", v26);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "selectedCheckmarkImageForSelectedState:", -[BKLibraryBookshelfFinishedBookCell isSelected](self, "isSelected")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell checkmarkView](self, "checkmarkView"));
      objc_msgSend(v30, "setImage:", v29);

      if (-[BKLibraryBookshelfFinishedBookCell isSelected](self, "isSelected"))
        v31 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
      else
        v31 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor"));
      v32 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell checkmarkView](self, "checkmarkView"));
      objc_msgSend(v33, "setTintColor:", v32);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      LODWORD(v32) = objc_msgSend(v34, "finishedShortText");
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v36 = v35;
      if ((_DWORD)v32)
        v37 = CFSTR("FINISHED");
      else
        v37 = CFSTR("MARK FINISHED");
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v37, &stru_10091C438, 0));

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "finishedFontAttributes"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "finishedTextColor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "attributesWithForegroundColor:", v43));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v38, v44));
      objc_msgSend(v39, "setAttributedTitle:forState:", v45, 0);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell markAsFinishedButton](self, "markAsFinishedButton"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "finishedFontAttributes"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "finishedTextHilightColor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "attributesWithForegroundColor:", v50));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v38, v51));
      objc_msgSend(v46, "setAttributedTitle:forState:", v52, 1);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Write a Review"), &stru_10091C438, 0));

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "writeReviewFontAttributes"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "writeReviewTextColor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "attributesWithForegroundColor:", v59));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v54, v60));
      objc_msgSend(v55, "setAttributedTitle:forState:", v61, 0);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell writeReviewButton](self, "writeReviewButton"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "writeReviewFontAttributes"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "writeReviewTextHilightColor"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "attributesWithForegroundColor:", v66));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v54, v67));
      objc_msgSend(v62, "setAttributedTitle:forState:", v68, 1);

      -[BKLibraryBookshelfFinishedBookCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_cancelDownload:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;

  if (-[BKLibraryBookshelfFinishedBookCell isDownloading](self, "isDownloading", a3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell actionHandler](self, "actionHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    objc_msgSend(v7, "bookCancelDownload:", v4);

  }
  else
  {
    v5 = BKLibraryUILog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10069FF9C(v6);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
  {
    v12.receiver = self;
    v12.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
    -[BKLibraryBookshelfFinishedBookCell setSelected:](&v12, "setSelected:", v3);
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode")
      && !-[BKLibraryBookshelfFinishedBookCell isSelected](self, "isSelected"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
      objc_msgSend(v5, "shrinkAlpha");
      -[BKLibraryBookshelfCollectionViewCell setAlpha:](self, "setAlpha:");

    }
    else
    {
      -[BKLibraryBookshelfCollectionViewCell setAlpha:](self, "setAlpha:", 1.0);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedCheckmarkImageForSelectedState:", v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell checkmarkView](self, "checkmarkView"));
    objc_msgSend(v8, "setImage:", v7);

    if (v3)
      v9 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    else
      v9 = objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor"));
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell checkmarkView](self, "checkmarkView"));
    objc_msgSend(v11, "setTintColor:", v10);

  }
}

- (CGPath)pathForDateIndicator:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double MidY;
  void *v19;
  double v20;
  double v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  CGPath *v40;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BKLibraryBookshelfFinishedBookCell bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v42.origin.x = v9;
  v42.origin.y = v11;
  v42.size.width = v13;
  v42.size.height = v15;
  v17 = CGRectGetHeight(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MidY = CGRectGetMidY(v43);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  objc_msgSend(v19, "datelineCircleSize");
  v21 = v20;

  v22 = -[BKLibraryBookshelfFinishedBookCell firstItem](self, "firstItem");
  v23 = -[BKLibraryBookshelfFinishedBookCell lastItem](self, "lastItem");
  v24 = -[BKLibraryBookshelfFinishedBookCell finishedState](self, "finishedState");
  objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 0.0, MidY, v21, 0.0, 6.28318531);
  if ((v22 & 1) == 0)
  {
    objc_msgSend(v16, "moveToPoint:", 0.0, 0.0);
    objc_msgSend(v16, "addLineToPoint:", 0.0, MidY - v21);
  }
  if ((v23 & 1) == 0)
  {
    objc_msgSend(v16, "moveToPoint:", 0.0, MidY + v21);
    objc_msgSend(v16, "addLineToPoint:", 0.0, v17);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "datelineColor")));
  v27 = objc_msgSend(v26, "CGColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dateIndicator](self, "dateIndicator"));
  objc_msgSend(v28, "setStrokeColor:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  v30 = v29;
  if (v24 == 1)
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "datelineCircleHollowColor"));
  else
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "datelineCircleFilledColor"));
  v32 = objc_retainAutorelease(v31);
  v33 = objc_msgSend(v32, "CGColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dateIndicator](self, "dateIndicator"));
  objc_msgSend(v34, "setFillColor:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
  objc_msgSend(v35, "datelineWidth");
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dateIndicator](self, "dateIndicator"));
  objc_msgSend(v38, "setLineWidth:", v37);

  v39 = objc_retainAutorelease(v16);
  v40 = (CGPath *)objc_msgSend(v39, "CGPath");

  return v40;
}

- (void)setLibraryAsset:(id)a3
{
  BKLibraryAsset **p_libraryAsset;
  BKLibraryAsset *libraryAsset;
  BKLibraryAsset *v7;
  void *v8;
  BKLibraryAsset *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  BKLibraryAsset *v15;

  v15 = (BKLibraryAsset *)a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfFinishedBookCell.m", 1367, "-[BKLibraryBookshelfFinishedBookCell setLibraryAsset:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  v7 = v15;
  if (libraryAsset != v15)
  {
    -[BKLibraryAsset removeObserver:forKeyPath:context:](libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("isFinished"), off_1009CA1D0);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("notFinished"), off_1009CA1D0);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("dateFinished"), off_1009CA1D0);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("title"), off_1009CA1D0);
    -[BKLibraryAsset removeObserver:forKeyPath:context:](*p_libraryAsset, "removeObserver:forKeyPath:context:", self, CFSTR("author"), off_1009CA1D0);
    objc_storeStrong((id *)&self->_libraryAsset, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coverLayer](self, "coverLayer"));
    v9 = *p_libraryAsset;
    -[BKLibraryBookshelfFinishedBookCell coverArea](self, "coverArea");
    objc_msgSend(v8, "setLibraryAsset:size:", v9, v10, v11);

    if (*p_libraryAsset)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAsset permanentOrTemporaryAssetID](*p_libraryAsset, "permanentOrTemporaryAssetID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "statusForAssetID:", v13));
      -[BKLibraryBookshelfFinishedBookCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", v14);

    }
    else
    {
      -[BKLibraryBookshelfFinishedBookCell setLibraryDownloadStatus:](self, "setLibraryDownloadStatus:", 0);
    }
    -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("isFinished"), 0, off_1009CA1D0);
    -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("notFinished"), 0, off_1009CA1D0);
    -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("dateFinished"), 0, off_1009CA1D0);
    -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 0, off_1009CA1D0);
    -[BKLibraryAsset addObserver:forKeyPath:options:context:](*p_libraryAsset, "addObserver:forKeyPath:options:context:", self, CFSTR("author"), 0, off_1009CA1D0);
    -[BKLibraryBookshelfFinishedBookCell _updateLibraryAsset](self, "_updateLibraryAsset");
    v7 = v15;
  }

}

- (void)setLibraryDownloadStatus:(id)a3
{
  BKLibraryDownloadStatus *v5;
  BKLibraryDownloadStatus **p_libraryDownloadStatus;
  BKLibraryDownloadStatus *libraryDownloadStatus;
  BKLibraryDownloadStatus *v8;

  v5 = (BKLibraryDownloadStatus *)a3;
  p_libraryDownloadStatus = &self->_libraryDownloadStatus;
  libraryDownloadStatus = self->_libraryDownloadStatus;
  if (libraryDownloadStatus != v5)
  {
    v8 = v5;
    -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("combinedState"), off_1009CA1C0);
    -[BKLibraryDownloadStatus removeObserver:forKeyPath:context:](*p_libraryDownloadStatus, "removeObserver:forKeyPath:context:", self, CFSTR("progressValue"), off_1009CA1C8);
    objc_storeStrong((id *)&self->_libraryDownloadStatus, a3);
    -[BKLibraryDownloadStatus addObserver:forKeyPath:options:context:](*p_libraryDownloadStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("combinedState"), 0, off_1009CA1C0);
    -[BKLibraryDownloadStatus addObserver:forKeyPath:options:context:](*p_libraryDownloadStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("progressValue"), 0, off_1009CA1C8);
    v5 = v8;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  _QWORD *v16;
  objc_super v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_initWeak(&location, self);
  if (off_1009CA1D0 == a6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell coalescedPropertyChange](self, "coalescedPropertyChange"));
    objc_msgSend(v13, "signalWithCompletion:", &stru_1008EA9D0);

    goto LABEL_14;
  }
  if (off_1009CA1D8 == a6)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000ECE94;
    v22[3] = &unk_1008E74C8;
    v14 = &v23;
    objc_copyWeak(&v23, &location);
    v15 = v22;
LABEL_10:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    objc_destroyWeak(v14);
    goto LABEL_14;
  }
  if (off_1009CA1E0 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ECF10;
    block[3] = &unk_1008E74C8;
    v14 = &v21;
    objc_copyWeak(&v21, &location);
    v15 = block;
    goto LABEL_10;
  }
  if (off_1009CA1C0 == a6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000ECF94;
    v19[3] = &unk_1008E72C0;
    v19[4] = self;
    v16 = v19;
LABEL_13:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    goto LABEL_14;
  }
  if (off_1009CA1C8 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000ECFBC;
    v18[3] = &unk_1008E72C0;
    v18[4] = self;
    v16 = v18;
    goto LABEL_13;
  }
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  -[BKLibraryBookshelfFinishedBookCell observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_14:
  objc_destroyWeak(&location);

}

- (void)configureCombinedDate:(id)a3
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
  unsigned __int8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  if (qword_1009F4F68 != -1)
    dispatch_once(&qword_1009F4F68, &stru_1008EA9F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  if (!objc_msgSend(v4, "isEqual:", qword_1009F4F58)
    || (objc_msgSend(v5, "isEqual:", qword_1009F4F60) & 1) == 0)
  {
    sub_1000ED2FC();
  }
  v6 = (void *)qword_1009F4F40;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v7));

  v9 = (void *)qword_1009F4F40;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateFinished"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));

  v12 = (void *)qword_1009F4F38;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateFinished"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", v13));

  v15 = objc_msgSend(v11, "isEqualToString:", v8);
  if (_os_feature_enabled_impl("Books", "fuzzyFinishedDate")
    && objc_msgSend(v26, "finishedDateKind") == 2)
  {
    v16 = (void *)qword_1009F4F48;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateFinished"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromDate:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    objc_msgSend(v19, "setNumberOfLines:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    objc_msgSend(v20, "setText:", v18);
    v11 = (void *)v18;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
    v22 = v21;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v21, "setNumberOfLines:", 1);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
      objc_msgSend(v20, "setText:", v14);
    }
    else
    {
      objc_msgSend(v21, "setNumberOfLines:", 2);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", qword_1009F4F50, v14, v11));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
      objc_msgSend(v23, "setText:", v20);

    }
  }

  if (-[BKLibraryBookshelfFinishedBookCell isRTL](self, "isRTL"))
    v24 = 0;
  else
    v24 = 2;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell combinedDateLabel](self, "combinedDateLabel"));
  objc_msgSend(v25, "setTextAlignment:", v24);

}

- (void)_updateLibraryAsset
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
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  if (v15)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleFontAttributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesWithTruncated:", 1));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell titleLabel](self, "titleLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v7, v5));
    objc_msgSend(v6, "setAttributedText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authorFontAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributesWithTruncated:", 1));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell authorLabel](self, "authorLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayAuthor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v13, v11));
    objc_msgSend(v12, "setAttributedText:", v14);

    -[BKLibraryBookshelfFinishedBookCell configureCombinedDate:](self, "configureCombinedDate:", v15);
    -[BKLibraryBookshelfFinishedBookCell updateRatingAndReview](self, "updateRatingAndReview");
    -[BKLibraryBookshelfFinishedBookCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setAssetReview:(id)a3
{
  BCAssetReview *v5;
  BCAssetReview *v6;

  v6 = (BCAssetReview *)a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfFinishedBookCell.m", 1523, "-[BKLibraryBookshelfFinishedBookCell setAssetReview:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v5 = v6;
  if (self->_assetReview != v6)
  {
    objc_storeStrong((id *)&self->_assetReview, a3);
    -[BKLibraryBookshelfFinishedBookCell updateRatingAndReview](self, "updateRatingAndReview");
    v5 = v6;
  }

}

- (void)updateRatingAndReview
{
  void *v3;
  double v4;
  double v5;
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
  id v19;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfFinishedBookCell.m", 1534, "-[BKLibraryBookshelfFinishedBookCell updateRatingAndReview]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell assetReview](self, "assetReview"));
  v19 = v3;
  if (v3)
  {
    objc_msgSend(v3, "normalizedStarRating");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v6, "setRating:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reviewTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reviewTitleFontAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v8, v10));
    objc_msgSend(v7, "setAttributedText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reviewBody"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reviewContentFontAttributes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v13, v15));
    objc_msgSend(v12, "setAttributedText:", v16);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell starRating](self, "starRating"));
    objc_msgSend(v17, "setRating:", 0.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewTitle](self, "reviewTitle"));
    objc_msgSend(v18, "setText:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell reviewComments](self, "reviewComments"));
    objc_msgSend(v12, "setAttributedText:", 0);
  }

  -[BKLibraryBookshelfFinishedBookCell updateFinishedState](self, "updateFinishedState");
}

- (void)updateFinishedState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentStoreAccountID"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell assetReview](self, "assetReview"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell storageProvider](self, "storageProvider"));
    v9 = +[BKLibraryBookshelfFinishedBookCell finishedStateForAsset:assetReview:storeID:storageProvider:](BKLibraryBookshelfFinishedBookCell, "finishedStateForAsset:assetReview:storeID:storageProvider:", v6, v7, v17, v8);

    v10 = objc_opt_class(NSNumber);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell storageProvider](self, "storageProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "permanentOrTemporaryAssetID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "retrieveValueForKey:forConsumer:", CFSTR("kExpandReviewText"), v13));
    v15 = BUDynamicCast(v10, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    -[BKLibraryBookshelfFinishedBookCell setShowFullReviewText:](self, "setShowFullReviewText:", objc_msgSend(v16, "BOOLValue"));
    if ((_DWORD)v9 == 6)
    {
      if (-[BKLibraryBookshelfFinishedBookCell showFullReviewText](self, "showFullReviewText"))
        v9 = 7;
      else
        v9 = 6;
    }
    if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    {
      if ((v9 - 4) > 3)
        v9 = 9;
      else
        v9 = dword_10070C8D0[(int)v9 - 4];
    }
    -[BKLibraryBookshelfFinishedBookCell setFinishedState:](self, "setFinishedState:", v9);

  }
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  -[BKLibraryBookshelfFinishedBookCell _updateTintedImages](self, "_updateTintedImages");
}

- (void)setAudiobookStatus:(id)a3
{
  AEAssetAudiobookStatus *v5;
  AEAssetAudiobookStatus **p_audiobookStatus;
  AEAssetAudiobookStatus *audiobookStatus;
  void *v8;
  AEAssetAudiobookStatus *v9;

  v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  audiobookStatus = self->_audiobookStatus;
  if (audiobookStatus != v5)
  {
    v9 = v5;
    if (audiobookStatus)
    {
      -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009CA1D8);
      -[AEAssetAudiobookStatus removeObserver:forKeyPath:context:](*p_audiobookStatus, "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), off_1009CA1E0);
    }
    objc_storeStrong((id *)&self->_audiobookStatus, a3);
    if (*p_audiobookStatus)
    {
      -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), 0, off_1009CA1D8);
      -[AEAssetAudiobookStatus addObserver:forKeyPath:options:context:](*p_audiobookStatus, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusTrackProgress"), 0, off_1009CA1E0);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell finishedMetrics](self, "finishedMetrics"));
    objc_msgSend(v8, "audiobookControlDiameter");
    -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", v9);

    v5 = v9;
  }

}

- (BOOL)shouldShowCloud
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  if ((objc_msgSend(v4, "isCloud") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    v3 = objc_msgSend(v5, "isNonLocalSample");

  }
  return v3;
}

- (BOOL)shouldShowDownloadProgressButton
{
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    return 0;
  else
    return -[BKLibraryBookshelfFinishedBookCell isDownloading](self, "isDownloading");
}

- (BOOL)shouldShowMoreButton
{
  if (-[BKLibraryBookshelfCollectionViewCell isInEditMode](self, "isInEditMode"))
    return 0;
  else
    return !-[BKLibraryBookshelfFinishedBookCell isDownloading](self, "isDownloading");
}

- (BOOL)isDownloading
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
  if ((objc_msgSend(v3, "isDownloading") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    v4 = objc_msgSend(v5, "isDownloadingSupplementalContent");

  }
  return v4;
}

- (void)starRatingDidChange:(id)a3 rating:(double)a4
{
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell assetReview](self, "assetReview", a3));
  objc_msgSend(v6, "normalizedStarRating");
  v8 = v7;

  if (v8 != a4)
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentStoreAccountID"));
    if (!v9)
    {

      return;
    }
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeID"));

    if (!v12)
      return;
    v13 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell assetReview](self, "assetReview"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell assetReview](self, "assetReview"));
      if (objc_msgSend(v15, "starRating"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell assetReview](self, "assetReview"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reviewTitle"));
        v18 = objc_msgSend(v17, "length");

        if (v18)
        {
LABEL_11:
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell actionHandler](self, "actionHandler"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1000EDF20;
          v25[3] = &unk_1008E77C8;
          v25[4] = self;
          objc_msgSend(v22, "bookUpdateStarRating:rating:completion:", v23, v25, a4);

          return;
        }
      }
      else
      {

      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell storageProvider](self, "storageProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell libraryAsset](self, "libraryAsset"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "permanentOrTemporaryAssetID"));
    objc_msgSend(v19, "storeValue:forKey:forConsumer:", &__kCFBooleanTrue, CFSTR("kStarRatedThisSession"), v21);

    goto LABEL_11;
  }
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  return 0;
}

- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4
{
  id v6;
  id v7;
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
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collection"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "analyticsAssetPropertyProviderForLibraryAsset:fromSourceView:inCollection:", v7, v8, v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tracker"));
  objc_msgSend(v11, "setupAppAnalyticsReportingUsingTracker:withPropertyProvider:", v12, v19);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
  objc_msgSend(v13, "setShowsMenuAsPrimaryAction:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell dataSource](self, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "menuWithLibraryAsset:sourceView:collection:", v7, v14, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell moreButton](self, "moreButton"));
  objc_msgSend(v18, "setMenu:", v17);

}

- (void)togglePlayPause:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBookCell audiobookStatus](self, "audiobookStatus", a3));
  objc_msgSend(v3, "assetAudiobookStatusTogglePlayPause");

}

- (void)setCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_coverView, a3);
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_columnMetrics, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (BKLibraryBookshelfStorageProvider)storageProvider
{
  return (BKLibraryBookshelfStorageProvider *)objc_loadWeakRetained((id *)&self->_storageProvider);
}

- (void)setStorageProvider:(id)a3
{
  objc_storeWeak((id *)&self->_storageProvider, a3);
}

- (BKLibraryBookshelfLayoutManager)layoutManager
{
  return (BKLibraryBookshelfLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (BKLibraryActionHandler)actionHandler
{
  return (BKLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BCAssetReview)assetReview
{
  return self->_assetReview;
}

- (int)layoutDebugMode
{
  return self->_layoutDebugMode;
}

- (void)setLayoutDebugMode:(int)a3
{
  self->_layoutDebugMode = a3;
}

- (CGSize)bookCoverSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bookCoverSize.width;
  height = self->_bookCoverSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (BKLibraryBookshelfCellMetrics_Finished)finishedMetrics
{
  return self->_finishedMetrics;
}

- (void)setFinishedMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_finishedMetrics, a3);
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (UIImageView)cloudView
{
  return self->_cloudView;
}

- (void)setCloudView:(id)a3
{
  objc_storeStrong((id *)&self->_cloudView, a3);
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

- (IMTouchInsetsButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (UILabel)combinedDateLabel
{
  return self->_combinedDateLabel;
}

- (void)setCombinedDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_combinedDateLabel, a3);
}

- (CAShapeLayer)dateIndicator
{
  return self->_dateIndicator;
}

- (void)setDateIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_dateIndicator, a3);
}

- (CALayer)reviewBackground
{
  return self->_reviewBackground;
}

- (void)setReviewBackground:(id)a3
{
  objc_storeStrong((id *)&self->_reviewBackground, a3);
}

- (UILabel)reviewTitle
{
  return self->_reviewTitle;
}

- (void)setReviewTitle:(id)a3
{
  objc_storeStrong((id *)&self->_reviewTitle, a3);
}

- (IMExpandingLabel)reviewComments
{
  return self->_reviewComments;
}

- (void)setReviewComments:(id)a3
{
  objc_storeStrong((id *)&self->_reviewComments, a3);
}

- (BCLibraryButton)markAsFinishedButton
{
  return self->_markAsFinishedButton;
}

- (void)setMarkAsFinishedButton:(id)a3
{
  objc_storeStrong((id *)&self->_markAsFinishedButton, a3);
}

- (BKLibraryStarRating)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(id)a3
{
  objc_storeStrong((id *)&self->_starRating, a3);
}

- (BCLibraryButton)writeReviewButton
{
  return self->_writeReviewButton;
}

- (void)setWriteReviewButton:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewButton, a3);
}

- (BUCoalescingCallBlock)coalescedPropertyChange
{
  return self->_coalescedPropertyChange;
}

- (void)setCoalescedPropertyChange:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedPropertyChange, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)firstItem
{
  return self->_firstItem;
}

- (void)setFirstItem:(BOOL)a3
{
  self->_firstItem = a3;
}

- (BOOL)lastItem
{
  return self->_lastItem;
}

- (void)setLastItem:(BOOL)a3
{
  self->_lastItem = a3;
}

- (BOOL)showFullReviewText
{
  return self->_showFullReviewText;
}

- (void)setShowFullReviewText:(BOOL)a3
{
  self->_showFullReviewText = a3;
}

- (int)finishedState
{
  return self->_finishedState;
}

- (IMRadialProgressButton)downloadProgressButton
{
  return self->_downloadProgressButton;
}

- (void)setDownloadProgressButton:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProgressButton, a3);
}

- (BKLibraryDownloadStatus)libraryDownloadStatus
{
  return self->_libraryDownloadStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDownloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadProgressButton, 0);
  objc_storeStrong((id *)&self->_coalescedPropertyChange, 0);
  objc_storeStrong((id *)&self->_writeReviewButton, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_markAsFinishedButton, 0);
  objc_storeStrong((id *)&self->_reviewComments, 0);
  objc_storeStrong((id *)&self->_reviewTitle, 0);
  objc_storeStrong((id *)&self->_reviewBackground, 0);
  objc_storeStrong((id *)&self->_dateIndicator, 0);
  objc_storeStrong((id *)&self->_combinedDateLabel, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cloudView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_finishedMetrics, 0);
  objc_storeStrong((id *)&self->_assetReview, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_libraryAsset, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
}

@end
