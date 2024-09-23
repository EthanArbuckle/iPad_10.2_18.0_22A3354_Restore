@implementation BKTOCPointAnnotationTableCell

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
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double MaxY;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
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
  void *v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  double v105;
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
  objc_super v116;
  CGRect v117;

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
  v16 = -[BKTOCPointAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v8)
  {
    objc_msgSend(v11, "pageLabelFrameInPopoverForString:font:bounds:layoutDirection:", v13, v15, v16, x, y, width, height);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v115 = height;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    *(_QWORD *)&v26 = objc_opt_class(self).n128_u64[0];
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel", v26));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "text"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "font"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v33, "frame");
    objc_msgSend(v28, "chapterTitleFrameInPopoverForString:font:bounds:pageLabelFrame:layoutDirection:", v30, v32, -[BKTOCPointAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, v115, v34, v35, v36, v37);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

    *(_QWORD *)&v47 = objc_opt_class(self).n128_u64[0];
    v49 = v48;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel", v47));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "text"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "font"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v54, "frame");
    MaxY = CGRectGetMaxY(v117);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v56, "frame");
    height = v115;
    objc_msgSend(v49, "dateLabelFrameInPopoverForString:font:bounds:minY:pageLabelFrame:layoutDirection:", v51, v53, -[BKTOCPointAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, v115, MaxY, v57, v58, v59, v60);
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    objc_msgSend(v69, "setFrame:", v62, v64, v66, v68);

  }
  else
  {
    objc_msgSend(v11, "pageLabelFrameForString:font:bounds:layoutDirection:", v13, v15, v16, x, y, width, height);
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v78, "setFrame:", v71, v73, v75, v77);

    *(_QWORD *)&v79 = objc_opt_class(self).n128_u64[0];
    v81 = v80;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel", v79));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "text"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "font"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v86, "frame");
    objc_msgSend(v81, "chapterTitleFrameForString:font:bounds:pageLabelFrame:layoutDirection:", v83, v85, -[BKTOCPointAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, height, v87, v88, v89, v90);
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
    objc_msgSend(v99, "setFrame:", v92, v94, v96, v98);

    *(_QWORD *)&v100 = objc_opt_class(self).n128_u64[0];
    v102 = v101;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel", v100));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "text"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "font"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v54, "frame");
    objc_msgSend(v102, "dateLabelFrameForString:font:bounds:pageLabelFrame:layoutDirection:", v51, v53, -[BKTOCPointAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"), x, y, width, height, v103, v104, v105, v106);
    v108 = v107;
    v110 = v109;
    v112 = v111;
    v114 = v113;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    objc_msgSend(v56, "setFrame:", v108, v110, v112, v114);
  }

  v116.receiver = self;
  v116.super_class = (Class)BKTOCPointAnnotationTableCell;
  -[BKTOCAnnotationTableCell layoutSubviewsNotEditingWithBounds:](&v116, "layoutSubviewsNotEditingWithBounds:", x, y, width, height);
}

+ (CGRect)chapterTitleFrameForString:(id)a3 font:(id)a4 letMargin:(double)a5 numberOfLines:(int)a6 bounds:(CGRect)a7 pageLabelFrame:(CGRect)a8 layoutDirection:(int64_t)a9
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v13;
  id v17;
  id v18;
  double MinX;
  double v20;
  CGFloat height;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat rect;
  CGFloat MinY;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  rect = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = *(_QWORD *)&a6;
  v17 = a3;
  v18 = a4;
  v29 = a5;
  MinY = CGRectGetMinY(a8);
  v31 = width;
  if (a9 == 1)
  {
    MinX = CGRectGetMaxX(a8) + a5;
  }
  else
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = rect;
    MinX = CGRectGetMinX(v34);
  }
  v20 = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (objc_msgSend(v17, "length", *(_QWORD *)&v29))
  {
    if (CGRectGetWidth(a8) <= 0.0)
    {
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = v31;
      v36.size.height = rect;
      v20 = CGRectGetWidth(v36);
    }
    else
    {
      if (a9 != 1)
      {
        v23 = CGRectGetMinX(a8);
        v37.origin.x = MinX;
        v22 = MinY;
        v37.origin.y = MinY;
        v37.size.width = v20;
        v37.size.height = height;
        v20 = v23 - CGRectGetMinX(v37) - v30;
        goto LABEL_12;
      }
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = v31;
      v35.size.height = rect;
      v20 = CGRectGetWidth(v35) - v20 - v30 - a8.size.width;
    }
    v22 = MinY;
LABEL_12:
    v38.origin.x = MinX;
    v38.origin.y = v22;
    v38.size.width = v20;
    v38.size.height = height;
    objc_msgSend(a1, "sizeForString:font:width:numberOfLines:", v17, v18, v13, CGRectGetWidth(v38));
    height = v24;
    goto LABEL_13;
  }
  v22 = MinY;
LABEL_13:

  v25 = MinX;
  v26 = v22;
  v27 = v20;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

+ (CGRect)chapterTitleFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(a1, "chapterTitleFrameForString:font:letMargin:numberOfLines:bounds:pageLabelFrame:layoutDirection:", a3, a4, 2, a7, 8.0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, *(_QWORD *)&a6.origin.x, *(_QWORD *)&a6.origin.y, *(_QWORD *)&a6.size.width, *(_QWORD *)&a6.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)chapterTitleFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend(a1, "chapterTitleFrameForString:font:letMargin:numberOfLines:bounds:pageLabelFrame:layoutDirection:", a3, a4, 1, a7, 15.0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, *(_QWORD *)&a6.origin.x, *(_QWORD *)&a6.origin.y, *(_QWORD *)&a6.size.width, *(_QWORD *)&a6.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)pageLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___BKTOCPointAnnotationTableCell;
  objc_msgSendSuper2(&v10, "pageLabelFrameForString:font:bounds:topMargin:layoutDirection:", a3, a4, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 8.0);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)dateLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  double v14;
  id v17;
  id v18;
  double MinX;
  double v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double rect;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  rect = a5.size.height;
  v12 = a5.size.width;
  v13 = a5.origin.y;
  v14 = a5.origin.x;
  v31 = CGRectZero.size.width;
  if (a7 == 1)
  {
    v17 = a4;
    v18 = a3;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    MinX = CGRectGetMaxX(v33) + 15.0;
    v34.origin.x = v14;
    v34.origin.y = v13;
    v34.size.width = v12;
    v34.size.height = rect;
    v20 = CGRectGetWidth(v34) - v31 - 15.0 - width;
  }
  else
  {
    v30 = CGRectZero.size.height;
    v21 = a4;
    v22 = a3;
    v35.origin.x = v14;
    v35.origin.y = v13;
    v35.size.width = v12;
    v35.size.height = rect;
    MinX = CGRectGetMinX(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v23 = CGRectGetMinX(v36);
    v37.origin.y = 41.0;
    v37.origin.x = MinX;
    v37.size.height = v30;
    v37.size.width = v31;
    v20 = v23 - CGRectGetMinX(v37) - 15.0;
  }
  objc_msgSend(a1, "dateLabelSizeForString:font:bounds:", a3, a4, v14, v13, v12, rect);
  v25 = v24;

  v26 = 41.0;
  v27 = MinX;
  v28 = v20;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v26;
  result.origin.x = v27;
  return result;
}

+ (CGRect)dateLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 pageLabelFrame:(CGRect)a7 layoutDirection:(int64_t)a8
{
  double y;
  double x;
  double v13;
  id v14;
  id v15;
  double MinX;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double width;
  double height;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  width = a5.size.width;
  height = a5.size.height;
  y = a5.origin.y;
  x = a5.origin.x;
  v29 = CGRectZero.size.width;
  v13 = a6 + 3.0;
  if (a8 == 1)
  {
    v14 = a4;
    v15 = a3;
    MinX = CGRectGetMaxX(a7) + 8.0;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v17 = CGRectGetWidth(v32) - v29 + -8.0 - a7.size.width;
  }
  else
  {
    v28 = CGRectZero.size.height;
    v18 = a4;
    v19 = a3;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    MinX = CGRectGetMinX(v33);
    v20 = CGRectGetMinX(a7);
    v34.origin.x = MinX;
    v34.origin.y = v13;
    v34.size.height = v28;
    v34.size.width = v29;
    v17 = v20 - CGRectGetMinX(v34) + -8.0;
  }
  v21 = v13;
  objc_msgSend(a1, "dateLabelSizeForString:font:bounds:", a3, a4, x, y, width, height, *(_QWORD *)&v28);
  v23 = v22;

  v24 = MinX;
  v25 = v21;
  v26 = v17;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityLabel"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityLabel"));

  if (objc_msgSend(v8, "length"))
  {
    v9 = AEAXLocString(CFSTR("page.num %@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@, %@"), v4, v6, v11));
    v8 = (void *)v11;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v4, v6));
  }

  return v12;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = AEAXLocString(CFSTR("page.num %@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5));

    objc_msgSend(v3, "addObject:", v8);
    v5 = (void *)v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell noteLabel](self, "noteLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessibilityLabel"));

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v3, "addObject:", v10);
  v14.receiver = self;
  v14.super_class = (Class)BKTOCPointAnnotationTableCell;
  v11 = -[BKTOCPointAnnotationTableCell accessibilityUserInputLabels](&v14, "accessibilityUserInputLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  return v3;
}

+ (double)cellHeightForCellWidth:(double)a3 chapterString:(id)a4 dateString:(id)a5 pageString:(id)a6 layoutDirection:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  float v36;
  float v37;
  double v39;
  double v40;
  CGRect v41;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pageNumberFontForPopover"));
  v40 = a3;
  objc_msgSend(a1, "pageLabelFrameInPopoverForString:font:bounds:layoutDirection:", v12, v15, a7, 0.0, 0.0, a3, 1.79769313e308);
  v17 = v16;
  v39 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "chapterFontForPopover"));
  objc_msgSend(a1, "chapterTitleFrameInPopoverForString:font:bounds:pageLabelFrame:layoutDirection:", v14, v24, a7, 0.0, 0.0, a3, 1.79769313e308, v17, v19, v21, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateFontForPopover"));
  v41.origin.x = v26;
  v41.origin.y = v28;
  v41.size.width = v30;
  v41.size.height = v32;
  objc_msgSend(a1, "dateLabelFrameInPopoverForString:font:bounds:minY:pageLabelFrame:layoutDirection:", v13, v33, a7, 0.0, 0.0, v40, 1.79769313e308, CGRectGetMaxY(v41), *(_QWORD *)&v39, *(_QWORD *)&v19, *(_QWORD *)&v21, *(_QWORD *)&v23);
  v35 = v34;

  v36 = v32;
  v37 = v35;
  return ceilf(v36) + 8.0 + 3.0 + ceilf(v37) + 8.0;
}

+ (id)chapterFontForPopover
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollectionLimitedToSizeCategory:](UITraitCollection, "currentTraitCollectionLimitedToSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleHeadline, v2));

  return v3;
}

+ (CGSize)sizeForString:(id)a3 font:(id)a4 width:(double)a5 numberOfLines:(int)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  CGSize result;

  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "lineHeight");
  v12 = v11;
  if (a6 >= 2)
  {
    objc_msgSend(v9, "leading");
    v12 = (v12 + v13) * (double)a6;
  }
  +[UILabel bkSizeForString:constrainedToSize:font:lineBreakMode:](UILabel, "bkSizeForString:constrainedToSize:font:lineBreakMode:", v10, v9, 0, a5, v12);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = ceilf(v18);
  v20 = v17;
  v21 = ceilf(v20);
  result.height = v21;
  result.width = v19;
  return result;
}

@end
