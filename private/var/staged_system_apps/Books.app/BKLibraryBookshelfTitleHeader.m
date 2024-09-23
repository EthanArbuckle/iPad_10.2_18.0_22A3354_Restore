@implementation BKLibraryBookshelfTitleHeader

+ (double)heightOf:(id)a3 inSize:(CGSize)a4 withMaxLines:(double)a5
{
  double height;
  double width;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  if (a5 > 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
    objc_msgSend(v11, "lineHeight");
    v13 = v12;
    objc_msgSend(v8, "textContainerInset");
    v15 = v14 + v13 * a5;
    objc_msgSend(v8, "textContainerInset");
    v17 = v15 + v16;

    if (v10 >= v17)
      v10 = v17;
  }

  return v10;
}

+ (double)_cachedHeight:(id)a3 withDataSource:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  id v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[5];
  _QWORD v79[5];

  v5 = a3;
  v6 = a4;
  if (qword_1009F50D0 != -1)
    dispatch_once(&qword_1009F50D0, &stru_1008EBF68);
  v7 = objc_msgSend(v5, "editable");
  objc_msgSend(v5, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "columnMetrics"));
  objc_msgSend(v16, "margins");
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionTitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "largeTitleFontAttributes"));
  v22 = (id)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v19, v21));

  if (!v22)
    v22 = objc_alloc_init((Class)NSAttributedString);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescription"));
  v24 = v23;
  if ((_DWORD)v7)
  {
    if (objc_msgSend(v23, "length"))
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescription"));
    else
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescriptionPlaceHolder"));
    v26 = (void *)v25;

    v24 = v26;
  }
  v27 = objc_msgSend(v6, "collectionIsSeries");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  v29 = v28;
  if ((v27 & 1) != 0)
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "alternateTitleDetailsFontAttributes"));
  else
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "titleDetailsFontAttributes"));
  v31 = (void *)v30;
  v32 = v13 - v18;
  v33 = (id)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v24, v30));

  if (!v33)
    v33 = objc_alloc_init((Class)NSAttributedString);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  objc_msgSend(v34, "titleDetailsTopMargin");
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
  objc_msgSend(v37, "titleDetailsBottomMargin");
  v39 = v36 + v38;

  v78[0] = CFSTR("editable");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v79[0] = v40;
  v78[1] = CFSTR("textViewWidth");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
  v79[1] = v41;
  v79[2] = v22;
  v77 = v22;
  v78[2] = CFSTR("titleAttributedText");
  v78[3] = CFSTR("descAttributedText");
  v79[3] = v33;
  v78[4] = CFSTR("margins");
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v39));
  v79[4] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 5));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1009F50D8, "objectForKeyedSubscript:", v43));
  v45 = v44;
  if (v44)
  {
    objc_msgSend(v44, "doubleValue");
    v47 = v46;
  }
  else
  {
    v75 = v19;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "columnMetrics"));
    objc_msgSend(v48, "margins");
    v50 = v13 - v49;

    v51 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", v9, v11, v50, v15);
    objc_msgSend(v51, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    objc_msgSend(v51, "setEditable:", v7);
    objc_msgSend(v51, "setSelectable:", v7);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescription"));
    v53 = v52;
    if ((_DWORD)v7)
    {
      if (objc_msgSend(v52, "length"))
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescription"));
      else
        v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescriptionPlaceHolder"));
      v55 = (void *)v54;

      v76 = v55;
    }
    else
    {
      v76 = v52;
    }
    v56 = objc_msgSend(v6, "collectionIsSeries");
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
    v58 = v57;
    if (v56)
      v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "alternateTitleDetailsFontAttributes"));
    else
      v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "titleDetailsFontAttributes"));
    v60 = (void *)v59;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v76, v59));
    objc_msgSend(v51, "setAttributedText:", v61);

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
    objc_msgSend(v62, "titleDetailsMaxLines");
    +[BKLibraryBookshelfTitleHeader heightOf:inSize:withMaxLines:](BKLibraryBookshelfTitleHeader, "heightOf:inSize:withMaxLines:", v51, v50, v15, v63);
    v65 = v64;

    if ((objc_msgSend(v51, "isEditable") & 1) != 0
      || (v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "text")),
          v67 = objc_msgSend(v66, "length"),
          v66,
          v67))
    {
      v47 = v65 + 0.0;
      if (v47 > 0.0)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
        objc_msgSend(v68, "titleDetailsTopMargin");
        v70 = v47 + v69;

        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainHeaderMetrics"));
        objc_msgSend(v71, "titleDetailsBottomMargin");
        v47 = v70 + v72;

      }
    }
    else
    {
      v47 = 0.0;
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v47));
    objc_msgSend((id)qword_1009F50D8, "setObject:forKeyedSubscript:", v73, v43);

    v19 = v75;
  }

  return v47;
}

+ (void)adjustHeight:(id)a3 withDataSource:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v6 = a4;
  v15 = a3;
  objc_msgSend(v15, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "_cachedHeight:withDataSource:", v15, v6);
  v14 = v13;

  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
}

- (BKLibraryBookshelfTitleHeader)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfTitleHeader *v3;
  BKLibraryBookshelfTitleHeader *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfTitleHeader;
  v3 = -[BKLibraryBookshelfTitleHeader initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKLibraryBookshelfTitleHeader setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = objc_alloc((Class)UITextView);
    -[BKLibraryBookshelfTitleHeader bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    objc_msgSend(v6, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[BKLibraryBookshelfTitleHeader addSubview:](v4, "addSubview:", v6);
    -[BKLibraryBookshelfTitleHeader setDescriptionLabel:](v4, "setDescriptionLabel:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](v4, "descriptionLabel"));
    objc_msgSend(v7, "setDelegate:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](v4, "descriptionLabel"));
    objc_msgSend(v8, "setEditable:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](v4, "descriptionLabel"));
    objc_msgSend(v9, "setSelectable:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](v4, "descriptionLabel"));
    objc_msgSend(v10, "setScrollEnabled:", 0);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  +[BKDataBinder unbind:](BKDataBinder, "unbind:", self);
  -[UITextView setDelegate:](self->_descriptionLabel, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfTitleHeader;
  -[BKLibraryBookshelfTitleHeader dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  double v5;
  double MaxX;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  void *v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38.receiver = self;
  v38.super_class = (Class)BKLibraryBookshelfTitleHeader;
  -[BKLibraryBookshelfTitleHeader layoutSubviews](&v38, "layoutSubviews");
  v3 = CGRectZero.size.height + 0.0;
  -[BKLibraryBookshelfTitleHeader descriptionSpacing](self, "descriptionSpacing");
  v5 = v3 + v4;
  -[BKLibraryBookshelfTitleHeader bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v39);
  -[BKLibraryBookshelfTitleHeader margins](self, "margins");
  v8 = MaxX - v7;
  v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  -[BKLibraryBookshelfTitleHeader maxDescriptionLines](self, "maxDescriptionLines");
  +[BKLibraryBookshelfTitleHeader heightOf:inSize:withMaxLines:](BKLibraryBookshelfTitleHeader, "heightOf:inSize:withMaxLines:", v9, v8, 0.0, v10);
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v13, "frame");
  v42.origin.x = 0.0;
  v42.origin.y = v5;
  v42.size.width = v8;
  v42.size.height = v12;
  LOBYTE(v9) = CGRectEqualToRect(v40, v42);

  if ((v9 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v14, "setFrame:", 0.0, v5, v8, v12);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v25, "textContainerInset");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "font"));
    objc_msgSend(v29, "descender");
    v31 = v27 - v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "font"));
    objc_msgSend(v33, "leading");
    v35 = v31 + v34;

    v41.origin.x = v18;
    v41.origin.y = v20;
    v41.size.width = v22;
    v41.size.height = v24;
    v36 = CGRectGetMaxY(v41) - v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));
    objc_msgSend(v37, "setFrame:", v18, v36, v22, 1.0);

  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
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
  objc_super v73;

  v73.receiver = self;
  v73.super_class = (Class)BKLibraryBookshelfTitleHeader;
  v4 = a3;
  -[BKLibraryBookshelfTitleHeader applyLayoutAttributes:](&v73, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", v73.receiver, v73.super_class));
  -[BKLibraryBookshelfTitleHeader setIsRTL:](self, "setIsRTL:", objc_msgSend(v5, "userInterfaceLayoutDirection") == (id)1);

  v6 = objc_opt_class(BKLibraryLayoutAttributes);
  v7 = BUDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "layoutDebugMode"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.2)));
    v11 = objc_msgSend(v10, "CGColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader layer](self, "layer"));
    objc_msgSend(v12, "setBorderColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader layer](self, "layer"));
    objc_msgSend(v13, "setBorderWidth:", 0.5);

    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor")));
    v15 = objc_msgSend(v14, "CGColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader layer](self, "layer"));
    objc_msgSend(v16, "setBackgroundColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "colorWithAlphaComponent:", 0.2)));
    v19 = objc_msgSend(v18, "CGColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleLabel](self, "titleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
    objc_msgSend(v21, "setBorderColor:", v19);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleLabel](self, "titleLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
    objc_msgSend(v23, "setBorderWidth:", 0.5);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", 0.2)));
    v26 = objc_msgSend(v25, "CGColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layer"));
    objc_msgSend(v28, "setBorderColor:", v26);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
    objc_msgSend(v30, "setBorderWidth:", 0.5);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleBaselineHairline](self, "titleBaselineHairline"));
    if (!v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      -[BKLibraryBookshelfTitleHeader setTitleBaselineHairline:](self, "setTitleBaselineHairline:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "colorWithAlphaComponent:", 0.2)));
      v35 = objc_msgSend(v34, "CGColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleBaselineHairline](self, "titleBaselineHairline"));
      objc_msgSend(v36, "setBorderColor:", v35);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleBaselineHairline](self, "titleBaselineHairline"));
      objc_msgSend(v37, "setBorderWidth:", 0.5);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader layer](self, "layer"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleBaselineHairline](self, "titleBaselineHairline"));
      objc_msgSend(v38, "addSublayer:", v39);

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));

    if (!v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      -[BKLibraryBookshelfTitleHeader setDescrBaselineHairline:](self, "setDescrBaselineHairline:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "colorWithAlphaComponent:", 0.2)));
      v44 = objc_msgSend(v43, "CGColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));
      objc_msgSend(v45, "setBorderColor:", v44);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));
      objc_msgSend(v46, "setBorderWidth:", 0.5);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader layer](self, "layer"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));
      objc_msgSend(v47, "addSublayer:", v48);

    }
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader layer](self, "layer"));
    objc_msgSend(v49, "setBorderWidth:", 0.0);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleLabel](self, "titleLabel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layer"));
    objc_msgSend(v51, "setBorderWidth:", 0.0);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleBaselineHairline](self, "titleBaselineHairline"));
    objc_msgSend(v52, "removeFromSuperlayer");

    -[BKLibraryBookshelfTitleHeader setTitleBaselineHairline:](self, "setTitleBaselineHairline:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
    objc_msgSend(v54, "setBorderWidth:", 0.0);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));
    objc_msgSend(v55, "removeFromSuperlayer");

    -[BKLibraryBookshelfTitleHeader setDescrBaselineHairline:](self, "setDescrBaselineHairline:", 0);
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainHeaderMetrics"));
  -[BKLibraryBookshelfTitleHeader setMainHeaderMetrics:](self, "setMainHeaderMetrics:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader backgroundColor](self, "backgroundColor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "headerBackgroundColor"));

  if (v57 != v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "headerBackgroundColor"));
    -[BKLibraryBookshelfTitleHeader setBackgroundColor:](self, "setBackgroundColor:", v61);

  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v63, "setTintColor:", v62);

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v65, "setTextColor:", v64);

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v67, "setTintColor:", v66);

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v69, "setTextColor:", v68);

  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "columnMetrics"));
  objc_msgSend(v70, "margins");
  -[BKLibraryBookshelfTitleHeader setMargins:](self, "setMargins:");

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  objc_msgSend(v71, "titleDetailsMaxLines");
  -[BKLibraryBookshelfTitleHeader setMaxDescriptionLines:](self, "setMaxDescriptionLines:");

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  objc_msgSend(v72, "titleDetailsTopMargin");
  -[BKLibraryBookshelfTitleHeader setDescriptionSpacing:](self, "setDescriptionSpacing:");

  -[BKLibraryBookshelfTitleHeader _configureForEditableState:](self, "_configureForEditableState:", objc_msgSend(v8, "editable"));
  -[BKLibraryBookshelfTitleHeader _configureHeaderLabel](self, "_configureHeaderLabel");
  -[BKLibraryBookshelfTitleHeader _configureDescriptionLabelForAttributeChange](self, "_configureDescriptionLabelForAttributeChange");

}

- (void)_configureDescriptionLabelForAttributeChange
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  if (objc_msgSend(v14, "isFirstResponder"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "text"));
    if (objc_msgSend(v14, "isEditable"))
      v4 = objc_msgSend(v14, "isFirstResponder") ^ 1;
    else
      v4 = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionText](self, "descriptionText"));
    v6 = objc_msgSend(v5, "length");

    if (v6 || (v4 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
      v9 = objc_msgSend(v7, "collectionIsSeries");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
      v11 = v10;
      if ((v9 & 1) != 0)
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alternateTitleDetailsFontAttributes"));
      else
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleDetailsFontAttributes"));
      v8 = (void *)v12;

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleDetailsPlaceholderFontAttributes"));
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v3, v8));
    objc_msgSend(v14, "setAttributedText:", v13);

    -[BKLibraryBookshelfTitleHeader setDescriptionText:](self, "setDescriptionText:", v3);
  }
  else
  {
    -[BKLibraryBookshelfTitleHeader _configureDescriptionLabel](self, "_configureDescriptionLabel");
  }

}

- (void)_configureDescriptionLabel
{
  unsigned int v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  v3 = objc_msgSend(v16, "isEditable");
  if (!v3 || (objc_msgSend(v16, "isFirstResponder") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionText](self, "descriptionText"));
    if (objc_msgSend(v4, "length"))
      v5 = 0;
    else
      v5 = v3;
    if ((v5 & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionPlaceHolderText](self, "descriptionPlaceHolderText"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleDetailsPlaceholderFontAttributes"));
    }
    else
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
      v9 = objc_msgSend(v7, "collectionIsSeries");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
      v11 = v10;
      if ((v9 & 1) != 0)
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alternateTitleDetailsFontAttributes"));
      else
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleDetailsFontAttributes"));
      v8 = (void *)v12;

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", v6, v8));
    objc_msgSend(v16, "setAttributedText:", v13);

    v14 = (v3 & 1) == 0 && objc_msgSend(v6, "length") == 0;
    objc_msgSend(v16, "setHidden:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descrBaselineHairline](self, "descrBaselineHairline"));
    objc_msgSend(v15, "setHidden:", v14);

  }
}

- (void)_configureForEditableState:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    -[BKLibraryBookshelfTitleHeader maxDescriptionLines](self, "maxDescriptionLines");
    v5 = (unint64_t)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textContainer"));
  v9 = objc_msgSend(v8, "maximumNumberOfLines");

  if (v9 != (id)v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textContainer"));
    objc_msgSend(v11, "setMaximumNumberOfLines:", v5);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textContainer"));
    objc_msgSend(v13, "setLineBreakMode:", 4);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  v15 = objc_msgSend(v14, "isEditable");

  if (v15 != v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v16, "setEditable:", v3);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v17, "setSelectable:", v3);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textContainer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "textStorage"));
    objc_msgSend(v20, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v22, "length"), 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
    LODWORD(v20) = objc_msgSend(v23, "isEditable");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
    if ((_DWORD)v20)
    {
      +[BKDataBinder bind:key:between:key:](BKDataBinder, "bind:key:between:key:", v24, CFSTR("collectionDescriptionPlaceHolder"), self, CFSTR("descriptionPlaceHolderText"));
    }
    else
    {
      +[BKDataBinder unbind:key:from:key:](BKDataBinder, "unbind:key:from:key:", v24, CFSTR("collectionDescriptionPlaceHolder"), self, CFSTR("descriptionPlaceHolderText"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
      +[BKDataBinder unbind:key:from:key:](BKDataBinder, "unbind:key:from:key:", self, CFSTR("descriptionPlaceHolderText"), v24, CFSTR("collectionDescriptionPlaceHolder"));
    }

    -[BKLibraryBookshelfTitleHeader setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    +[BKDataBinder unbind:](BKDataBinder, "unbind:", self);
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[BKLibraryBookshelfTitleHeader _configureHeaderLabel](self, "_configureHeaderLabel");
    -[BKLibraryBookshelfTitleHeader _configureDescriptionLabel](self, "_configureDescriptionLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
      +[BKDataBinder bind:key:to:key:](BKDataBinder, "bind:key:to:key:", v6, CFSTR("collectionTitle"), self, CFSTR("titleText"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
      +[BKDataBinder bind:key:between:key:](BKDataBinder, "bind:key:between:key:", v7, CFSTR("collectionDescription"), self, CFSTR("descriptionText"));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
      LODWORD(v7) = objc_msgSend(v8, "isEditable");

      if ((_DWORD)v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader dataSource](self, "dataSource"));
        +[BKDataBinder bind:key:between:key:](BKDataBinder, "bind:key:between:key:", v9, CFSTR("collectionDescriptionPlaceHolder"), self, CFSTR("descriptionPlaceHolderText"));

      }
    }
  }

}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (void)setTitleText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    -[BKLibraryBookshelfTitleHeader _configureHeaderLabel](self, "_configureHeaderLabel");
  }

}

- (void)setDescriptionText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_descriptionText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_descriptionText, a3);
    -[BKLibraryBookshelfTitleHeader _configureDescriptionLabel](self, "_configureDescriptionLabel");
  }

}

- (void)setDescriptionPlaceHolderText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_descriptionPlaceHolderText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_descriptionPlaceHolderText, a3);
    -[BKLibraryBookshelfTitleHeader _configureDescriptionLabel](self, "_configureDescriptionLabel");
  }

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));

  v5 = v8;
  if (v4 == v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
    -[BKLibraryBookshelfTitleHeader setDescriptionText:](self, "setDescriptionText:", v6);

    -[BKLibraryBookshelfTitleHeader _configureDescriptionLabel](self, "_configureDescriptionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader actionHandler](self, "actionHandler"));
    objc_msgSend(v7, "descriptionUpdated");

    v5 = v8;
  }

}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  id v5;
  BOOL IsVoiceOverRunning;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  if (v5 == v4)
  {
    IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();

    if (!IsVoiceOverRunning)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionText](self, "descriptionText"));
      v8 = objc_msgSend(v7, "length");

      if (!v8)
        -[BKLibraryBookshelfTitleHeader clearDescriptionLabelText](self, "clearDescriptionLabelText");
    }
  }
  else
  {

  }
  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _BOOL4 IsVoiceOverRunning;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  if (v4 == v10)
  {
    IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();

    if (IsVoiceOverRunning)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionPlaceHolderText](self, "descriptionPlaceHolderText"));
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v9)
        -[BKLibraryBookshelfTitleHeader clearDescriptionLabelText](self, "clearDescriptionLabelText");
    }
  }
  else
  {

  }
}

- (void)clearDescriptionLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader mainHeaderMetrics](self, "mainHeaderMetrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleDetailsFontAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFontSpec attributedStringWith:attributes:](TUIFontSpec, "attributedStringWith:attributes:", CFSTR(" "), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v6, "setAttributedText:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfTitleHeader descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v7, "setText:", &stru_10091C438);

}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  return (BKLibraryBookshelfSupplementaryDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BKLibraryActionHandler)actionHandler
{
  return (BKLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)descriptionPlaceHolderText
{
  return self->_descriptionPlaceHolderText;
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (double)titleSpacing
{
  return self->_titleSpacing;
}

- (void)setTitleSpacing:(double)a3
{
  self->_titleSpacing = a3;
}

- (CALayer)titleBaselineHairline
{
  return self->_titleBaselineHairline;
}

- (void)setTitleBaselineHairline:(id)a3
{
  objc_storeStrong((id *)&self->_titleBaselineHairline, a3);
}

- (UITextView)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (double)maxDescriptionLines
{
  return self->_maxDescriptionLines;
}

- (void)setMaxDescriptionLines:(double)a3
{
  self->_maxDescriptionLines = a3;
}

- (double)descriptionSpacing
{
  return self->_descriptionSpacing;
}

- (void)setDescriptionSpacing:(double)a3
{
  self->_descriptionSpacing = a3;
}

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (CALayer)descrBaselineHairline
{
  return self->_descrBaselineHairline;
}

- (void)setDescrBaselineHairline:(id)a3
{
  objc_storeStrong((id *)&self->_descrBaselineHairline, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descrBaselineHairline, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleBaselineHairline, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_descriptionPlaceHolderText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
