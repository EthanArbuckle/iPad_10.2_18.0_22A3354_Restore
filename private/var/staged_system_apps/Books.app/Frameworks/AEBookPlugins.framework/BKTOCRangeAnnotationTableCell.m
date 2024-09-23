@implementation BKTOCRangeAnnotationTableCell

- (void)layoutSubviewsNotEditingWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double MaxY;
  void *v89;
  double v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
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
  void *v135;
  double v136;
  void *v137;
  double v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  void *v167;
  double v168;
  void *v169;
  void *v170;
  void *v171;
  double v172;
  void *v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  objc_super v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle");
  *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
  v16 = -[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v8)
  {
    objc_msgSend(v11, "pageLabelFrameInPopoverForString:font:bounds:layoutDirection:", v13, v15, v16, x, y, width, height);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v183 = height;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    *(_QWORD *)&v26 = objc_opt_class(self).n128_u64[0];
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel", v26));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "annotation"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "font"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v33, "frame");
    objc_msgSend(v28, "highlightedTextFrameInPopoverForAnnotation:font:bounds:pageLabelFrame:layoutDirection:", v30, v32, -[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, v183, v34, v35, v36, v37);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v47, "frame");
    v48 = CGRectGetWidth(v185);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v49, "setFullLineWidth:", v48);

    *(_QWORD *)&v50 = objc_opt_class(self).n128_u64[0];
    v52 = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel", v50));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "text"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "font"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v57, "frame");
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v66, "frame");
    objc_msgSend(v52, "noteTextFrameInPopoverForString:font:bounds:highlightedTextFrame:pageLabelFrame:", v54, v56, x, y, width, v183, v59, v61, v63, v65, v67, v68, v69, v70);
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

    *(_QWORD *)&v80 = objc_opt_class(self).n128_u64[0];
    v82 = v81;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel", v80));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "text"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "font"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v87, "frame");
    MaxY = CGRectGetMaxY(v186);

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v89, "frame");
    v90 = CGRectGetMaxY(v187);

    if (MaxY < v90)
      MaxY = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v91, "frame");
    height = v183;
    objc_msgSend(v82, "dateLabelFrameInPopoverForString:font:bounds:minY:pageLabelFrame:layoutDirection:", v84, v86, -[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, v183, MaxY, v92, v93, v94, v95);
    v97 = v96;
    v99 = v98;
    v101 = v100;
    v103 = v102;
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    objc_msgSend(v104, "setFrame:", v97, v99, v101, v103);

  }
  else
  {
    objc_msgSend(v11, "pageLabelFrameForString:font:bounds:layoutDirection:", v13, v15, v16, x, y, width, height);
    v106 = v105;
    v108 = v107;
    v110 = v109;
    v112 = v111;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v113, "setFrame:", v106, v108, v110, v112);

    *(_QWORD *)&v114 = objc_opt_class(self).n128_u64[0];
    v116 = v115;
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel", v114));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "annotation"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "font"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v121, "frame");
    objc_msgSend(v116, "highlightedTextFrameForAnnotation:font:bounds:pageLabelFrame:layoutDirection:", v118, v120, -[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, height, v122, v123, v124, v125);
    v127 = v126;
    v129 = v128;
    v131 = v130;
    v133 = v132;
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v134, "setFrame:", v127, v129, v131, v133);

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v135, "frame");
    v136 = CGRectGetWidth(v188);
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v137, "setFullLineWidth:", v136);

    *(_QWORD *)&v138 = objc_opt_class(self).n128_u64[0];
    v140 = v139;
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel", v138));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "text"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "font"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v145, "frame");
    v147 = v146;
    v149 = v148;
    v151 = v150;
    v153 = v152;
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v154, "frame");
    objc_msgSend(v140, "noteTextFrameForString:font:bounds:highlightedTextFrame:pageLabelFrame:", v142, v144, x, y, width, height, v147, v149, v151, v153, v155, v156, v157, v158);
    v160 = v159;
    v162 = v161;
    v164 = v163;
    v166 = v165;
    v167 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v167, "setFrame:", v160, v162, v164, v166);

    *(_QWORD *)&v168 = objc_opt_class(self).n128_u64[0];
    v170 = v169;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel", v168));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "text"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "font"));
    v171 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v171, "frame");
    v172 = CGRectGetMaxY(v189);

    v173 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell highlightedTextLabel](self, "highlightedTextLabel"));
    objc_msgSend(v173, "frame");
    v174 = CGRectGetMaxY(v190);

    if (v172 < v174)
      v172 = v174;
    objc_msgSend(v170, "dateLabelFrameForString:font:bounds:minY:layoutDirection:", v84, v86, -[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, height, v172);
    v176 = v175;
    v178 = v177;
    v180 = v179;
    v182 = v181;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    objc_msgSend(v91, "setFrame:", v176, v178, v180, v182);
  }

  v184.receiver = self;
  v184.super_class = (Class)BKTOCRangeAnnotationTableCell;
  -[BKTOCAnnotationTableCell layoutSubviewsNotEditingWithBounds:](&v184, "layoutSubviewsNotEditingWithBounds:", x, y, width, height);
}

- (void)prepareForReuse
{
  AEHighlightedTextLabel *highlightedTextLabel;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKTOCRangeAnnotationTableCell;
  -[BKTOCAnnotationTableCell prepareForReuse](&v4, "prepareForReuse");
  -[AEHighlightedTextLabel removeFromSuperview](self->_highlightedTextLabel, "removeFromSuperview");
  highlightedTextLabel = self->_highlightedTextLabel;
  self->_highlightedTextLabel = 0;

}

- (AEHighlightedTextLabel)highlightedTextLabel
{
  AEHighlightedTextLabel *highlightedTextLabel;
  AEHighlightedTextLabel *v4;
  AEHighlightedTextLabel *v5;
  uint64_t v6;
  void *v7;

  highlightedTextLabel = self->_highlightedTextLabel;
  if (!highlightedTextLabel)
  {
    v4 = (AEHighlightedTextLabel *)objc_alloc_init((Class)AEHighlightedTextLabel);
    v5 = self->_highlightedTextLabel;
    self->_highlightedTextLabel = v4;

    if (-[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle"))
      v6 = 3;
    else
      v6 = 2;
    -[AEHighlightedTextLabel setNumberOfLines:](self->_highlightedTextLabel, "setNumberOfLines:", v6);
    -[AEHighlightedTextLabel setOpaque:](self->_highlightedTextLabel, "setOpaque:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_highlightedTextLabel);

    highlightedTextLabel = self->_highlightedTextLabel;
  }
  return highlightedTextLabel;
}

+ (double)highlightedTextSizeInPopover
{
  return 13.0;
}

+ (id)noteFontForPopover
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleBody));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollectionLimitedToSizeCategory:](UITraitCollection, "currentTraitCollectionLimitedToSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v3));

  objc_msgSend(v4, "pointSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scaledFontForFont:", v5));

  return v6;
}

+ (double)pageNumberAndHighlightedTextFontSize
{
  double v2;
  id v3;
  double result;

  *(_QWORD *)&v2 = objc_opt_class(a1).n128_u64[0];
  objc_msgSend(v3, "pageNumberFontSize", v2);
  return result;
}

+ (CGRect)pageLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
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
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4;
  v14 = a3;
  objc_opt_class(a1);
  objc_msgSend(v15, "pageLabelFrameForString:font:bounds:topMargin:layoutDirection:", v14, v13, a6, x, y, width, height, 8.0);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (CGRect)highlightedTextFrameInPopoverForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(a1, "highlightedTextFrameForAnnotation:font:bounds:letMargin:numberOfLines:pageLabelFrame:layoutDirection:", a3, a4, 3, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 8.0, *(_QWORD *)&a6.origin.x, *(_QWORD *)&a6.origin.y, *(_QWORD *)&a6.size.width, *(_QWORD *)&a6.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)highlightedTextFrameForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(a1, "highlightedTextFrameForAnnotation:font:bounds:letMargin:numberOfLines:pageLabelFrame:layoutDirection:", a3, a4, 2, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 15.0, *(_QWORD *)&a6.origin.x, *(_QWORD *)&a6.origin.y, *(_QWORD *)&a6.size.width, *(_QWORD *)&a6.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)highlightedTextFrameForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 letMargin:(double)a6 numberOfLines:(int)a7 pageLabelFrame:(CGRect)a8 layoutDirection:(int64_t)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double rect;
  CGFloat recta;
  CGFloat v32;
  CGFloat MinY;
  CGFloat MinX;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v16 = a3;
  v17 = a4;
  v32 = CGRectZero.size.height;
  MinY = CGRectGetMinY(a8);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MinX = CGRectGetMinX(v35);
  if (CGRectGetWidth(a8) <= 0.0)
  {
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v21 = CGRectGetWidth(v37);
    v20 = v32;
    v19 = MinY;
  }
  else
  {
    if (a9 == 1)
    {
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      rect = CGRectGetWidth(v36);
      v18 = rect - CGRectGetMaxX(a8);
      v20 = v32;
      v19 = MinY;
    }
    else
    {
      recta = CGRectZero.size.width;
      v22 = CGRectGetMinX(a8);
      v19 = MinY;
      v38.origin.x = MinX;
      v38.origin.y = MinY;
      v38.size.width = recta;
      v20 = v32;
      v38.size.height = v32;
      v18 = v22 - CGRectGetMinX(v38);
    }
    v21 = v18 - a6;
  }
  v23 = MinX;
  if (v16)
  {
    v39.origin.x = MinX;
    v39.origin.y = v19;
    v39.size.width = v21;
    v39.size.height = v20;
    +[AEHighlightedTextLabel sizeForAnnotation:font:width:numberOfLines:useSelectedText:](AEHighlightedTextLabel, "sizeForAnnotation:font:width:numberOfLines:useSelectedText:", v16, v17, a7, 0, CGRectGetWidth(v39));
    v20 = v24;
  }
  if (a9 == 1)
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v23 = CGRectGetMaxX(v40) - v21;
  }

  v25 = v23;
  v26 = v19;
  v27 = v21;
  v28 = v20;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

+ (id)noteTextFrameInPopoverForString:(double)a3 font:(double)a4 bounds:(double)a5 highlightedTextFrame:(double)a6 pageLabelFrame:(double)a7
{
  return objc_msgSend(a1, "noteTextFrameForString:font:bounds:spacingToItemAbove:numberOfLines:matchesWidthOfHighlightedText:highlightedTextFrame:pageLabelFrame:", a11, a12, 3, 0, a2, a3, a4, a5, 5.0, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a17, a18, a19);
}

+ (id)noteTextFrameForString:(double)a3 font:(double)a4 bounds:(double)a5 highlightedTextFrame:(double)a6 pageLabelFrame:(double)a7
{
  return objc_msgSend(a1, "noteTextFrameForString:font:bounds:spacingToItemAbove:numberOfLines:matchesWidthOfHighlightedText:highlightedTextFrame:pageLabelFrame:", a11, a12, 3, 0, a2, a3, a4, a5, 15.0, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, *(_QWORD *)&a9, a17, a18, a19);
}

+ (double)noteTextFrameForString:(CGFloat)a3 font:(CGFloat)a4 bounds:(double)a5 spacingToItemAbove:(uint64_t)a6 numberOfLines:(uint64_t)a7 matchesWidthOfHighlightedText:(void *)a8 highlightedTextFrame:(void *)a9 pageLabelFrame:(int)a10
{
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  CGFloat Width;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v43;
  CGFloat height;
  CGFloat MinX;
  double MaxY;
  NSAttributedStringKey v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v29 = a17;
  v28 = a18;
  v31 = a15;
  v30 = a16;
  v32 = a8;
  v33 = a9;
  height = CGRectZero.size.height;
  v50.origin.x = a15;
  v50.origin.y = a16;
  v50.size.width = a17;
  v50.size.height = a18;
  MaxY = CGRectGetMaxY(v50);
  v51.origin.x = a1;
  v51.origin.y = a2;
  v51.size.width = a3;
  v51.size.height = a4;
  MinX = CGRectGetMinX(v51);
  if (objc_msgSend(v32, "isNotWhitespace"))
  {
    if ((a11 & 1) == 0)
    {
      v52.origin.x = a15;
      v52.origin.y = a16;
      v52.size.width = a17;
      v52.size.height = a18;
      v43 = CGRectGetMaxY(v52);
      v53.origin.x = a19;
      v53.origin.y = a20;
      v53.size.width = a21;
      v53.size.height = a22;
      if (v43 >= CGRectGetMaxY(v53))
      {
        v28 = a4;
        v29 = a3;
        v30 = a2;
        v31 = a1;
      }
    }
    v54.origin.x = v31;
    v54.origin.y = v30;
    v54.size.width = v29;
    v54.size.height = v28;
    Width = CGRectGetWidth(v54);
    objc_msgSend(v33, "lineHeight");
    v36 = v35;
    v37 = objc_alloc_init((Class)NSStringDrawingContext);
    v55.size.height = height;
    v38 = MinX;
    v55.origin.x = MinX;
    v55.origin.y = MaxY + a5;
    v55.size.width = Width;
    v39 = CGRectGetWidth(v55);
    v40 = v36 * (double)a10;
    v48 = NSFontAttributeName;
    v49 = v33;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    objc_msgSend(v32, "boundingRectWithSize:options:attributes:context:", 35, v41, v37, v39, v40);

  }
  else
  {
    v38 = MinX;
  }

  return v38;
}

+ (CGRect)dateLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 layoutDirection:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MaxX;
  double MinX;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a6 + 3.0;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v15, "ascender");
  v18 = v17;
  objc_msgSend(v15, "descender");
  *(float *)&v19 = v14 + (v18 - v19) * 0.200000003;
  v20 = floorf(*(float *)&v19);
  objc_msgSend(a1, "dateLabelSizeForString:font:bounds:", v16, v15, x, y, width, height);
  v22 = v21;

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  if (a7 == 1)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v23);
    v32.origin.x = CGRectZero.origin.x;
    v32.origin.y = v20;
    v32.size.width = width;
    v32.size.height = v22;
    MinX = MaxX - CGRectGetWidth(v32);
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v23);
  }
  v29 = v20 + 5.0;
  v30 = width;
  v31 = v22;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = MinX;
  return result;
}

+ (CGRect)dateLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 pageLabelFrame:(CGRect)a7 layoutDirection:(int64_t)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a6 + 5.0;
  objc_msgSend(a1, "dateLabelSizeForString:font:bounds:", a3, a4, a8, a5.origin.x);
  v14 = v13;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MaxX = CGRectGetMaxX(v20);
  v21.origin.x = CGRectZero.origin.x;
  v21.origin.y = v12;
  v21.size.width = width;
  v21.size.height = v14;
  v16 = MaxX - CGRectGetWidth(v21);
  v17 = v12;
  v18 = width;
  v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (double)bottomPadding
{
  int v2;
  double result;

  v2 = isPhone(a1, a2);
  result = 19.0;
  if (v2)
    return 15.0;
  return result;
}

+ (double)cellHeightInPopoverForBounds:(CGRect)a3 highlightFont:(id)a4 annotation:(id)a5 dateString:(id)a6 pageString:(id)a7 layoutDirection:(int64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
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
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  void *v45;
  double MaxY;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGRect v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v58 = a3.origin.x;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pageNumberFontForPopover"));
  objc_msgSend(a1, "pageLabelFrameInPopoverForString:font:bounds:layoutDirection:", v17, v21, a8, x, y, width, height);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v60 = v25;
  v61 = v23;
  v59 = v29;
  objc_msgSend(a1, "highlightedTextFrameInPopoverForAnnotation:font:bounds:pageLabelFrame:layoutDirection:", v19, v20, a8, x, y, width, height, v23, v25, v27, v29);
  v56 = v31;
  v57 = v30;
  v54 = v33;
  v55 = v32;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "noteFontForPopover"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "annotationNote"));

  objc_msgSend(a1, "noteTextFrameInPopoverForString:font:bounds:highlightedTextFrame:pageLabelFrame:", v36, v35, v58, y, width, height, v57, v56, v55, v34, *(_QWORD *)&v23, *(_QWORD *)&v25, *(_QWORD *)&v27, *(_QWORD *)&v29);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateFontForPopover"));
  v62.origin.x = v38;
  v62.origin.y = v40;
  v62.size.width = v42;
  v62.size.height = v44;
  MaxY = CGRectGetMaxY(v62);
  v63.origin.x = v57;
  v63.origin.y = v56;
  v63.size.width = v55;
  v63.size.height = v54;
  v47 = CGRectGetMaxY(v63);
  if (MaxY >= v47)
    v48 = MaxY;
  else
    v48 = v47;
  objc_msgSend(a1, "dateLabelFrameInPopoverForString:font:bounds:minY:pageLabelFrame:layoutDirection:", v18, v45, a8, v58, y, width, height, v48, *(_QWORD *)&v61, *(_QWORD *)&v60, *(_QWORD *)&v27, *(_QWORD *)&v59);
  v50 = v49;

  v51 = v44 + 5.0;
  if (v44 <= 0.0)
    v51 = 0.0;
  v52 = v54 + 8.0 + 5.0 + v51 + v50 + 8.0;

  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTextLabel, 0);
}

@end
