@implementation BCMetrics

+ (id)_manager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DAA8;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30D4D0 != -1)
    dispatch_once(&qword_30D4D0, block);
  return (id)qword_30D4C8;
}

+ (void)registerNamedColorsWithTemplateManger:(id)a3
{
  id v3;
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
  id v61;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  objc_msgSend(v4, "registerColor:withName:", v5, CFSTR("booksBackground"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground"));
  objc_msgSend(v6, "registerColor:withName:", v7, CFSTR("booksSecondaryBackground"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryBackground](UIColor, "bc_booksTertiaryBackground"));
  objc_msgSend(v8, "registerColor:withName:", v9, CFSTR("booksTertiaryBackground"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGroupedBackground](UIColor, "bc_booksGroupedBackground"));
  objc_msgSend(v10, "registerColor:withName:", v11, CFSTR("booksGroupedBackground"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryGroupedBackground](UIColor, "bc_booksSecondaryGroupedBackground"));
  objc_msgSend(v12, "registerColor:withName:", v13, CFSTR("booksSecondaryGroupedBackground"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksWidgetBackgroundOverlayTop](UIColor, "bc_booksWidgetBackgroundOverlayTop"));
  objc_msgSend(v14, "registerColor:withName:", v15, CFSTR("booksWidgetBackgroundOverlayTop"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksWidgetBackgroundOverlayBottom](UIColor, "bc_booksWidgetBackgroundOverlayBottom"));
  objc_msgSend(v16, "registerColor:withName:", v17, CFSTR("booksWidgetBackgroundOverlayBottom"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBrickBackground](UIColor, "bc_booksBrickBackground"));
  objc_msgSend(v18, "registerColor:withName:", v19, CFSTR("booksBrickBackground"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  objc_msgSend(v20, "registerColor:withName:", v21, CFSTR("booksKeyColor"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  objc_msgSend(v22, "registerColor:withName:", v23, CFSTR("booksLabelColor"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
  objc_msgSend(v24, "registerColor:withName:", v25, CFSTR("booksSecondaryLabelColor"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor"));
  objc_msgSend(v26, "registerColor:withName:", v27, CFSTR("booksTertiaryLabelColor"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksQuaternaryLabelColor](UIColor, "bc_booksQuaternaryLabelColor"));
  objc_msgSend(v28, "registerColor:withName:", v29, CFSTR("booksQuaternaryLabelColor"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksRed](UIColor, "bc_booksRed"));
  objc_msgSend(v30, "registerColor:withName:", v31, CFSTR("booksRed"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksOrange](UIColor, "bc_booksOrange"));
  objc_msgSend(v32, "registerColor:withName:", v33, CFSTR("booksOrange"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGreen](UIColor, "bc_booksGreen"));
  objc_msgSend(v34, "registerColor:withName:", v35, CFSTR("booksGreen"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksCyan](UIColor, "bc_booksCyan"));
  objc_msgSend(v36, "registerColor:withName:", v37, CFSTR("booksCyan"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBlue](UIColor, "bc_booksBlue"));
  objc_msgSend(v38, "registerColor:withName:", v39, CFSTR("booksBlue"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksPurple](UIColor, "bc_booksPurple"));
  objc_msgSend(v40, "registerColor:withName:", v41, CFSTR("booksPurple"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksMagenta](UIColor, "bc_booksMagenta"));
  objc_msgSend(v42, "registerColor:withName:", v43, CFSTR("booksMagenta"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksGray](UIColor, "bc_booksGray"));
  objc_msgSend(v44, "registerColor:withName:", v45, CFSTR("booksGray"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBlack](UIColor, "bc_booksBlack"));
  objc_msgSend(v46, "registerColor:withName:", v47, CFSTR("booksBlack"));

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksWhite](UIColor, "bc_booksWhite"));
  objc_msgSend(v48, "registerColor:withName:", v49, CFSTR("booksWhite"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksNestedIconGlyphColor](UIColor, "bc_booksNestedIconGlyphColor"));
  objc_msgSend(v50, "registerColor:withName:", v51, CFSTR("booksNestedIconGlyphColor"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksChevronColor](UIColor, "bc_booksChevronColor"));
  objc_msgSend(v52, "registerColor:withName:", v53, CFSTR("booksChevronColor"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksIconBackgroundColor](UIColor, "bc_booksIconBackgroundColor"));
  objc_msgSend(v54, "registerColor:withName:", v55, CFSTR("booksIconBackgroundColor"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryIconBackgroundColor](UIColor, "bc_booksSecondaryIconBackgroundColor"));
  objc_msgSend(v56, "registerColor:withName:", v57, CFSTR("booksSecondaryIconBackgroundColor"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
  objc_msgSend(v58, "registerColor:withName:", v59, CFSTR("booksSeparatorColor"));

  v61 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorRegistry"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksAXSeparatorColor](UIColor, "bc_booksAXSeparatorColor"));
  objc_msgSend(v61, "registerColor:withName:", v60, CFSTR("booksAXSeparatorColor"));

}

+ (id)_templatePackageURL
{
  return 0;
}

+ (id)_templateFactory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E294;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30D4E0 != -1)
    dispatch_once(&qword_30D4E0, block);
  return (id)qword_30D4D8;
}

+ (id)_metricsTemplateURL
{
  return 0;
}

- (BCMetrics)initWithObserver:(id)a3
{
  id v4;
  BCMetrics *v5;
  BCLayoutMetrics *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BCLayoutMetrics *v11;
  BCLayoutMetrics *metrics;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BCMetrics;
  v5 = -[BCMetrics init](&v14, "init");
  if (v5)
  {
    v6 = [BCLayoutMetrics alloc];
    v7 = objc_msgSend((id)objc_opt_class(v5), "_templateFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend((id)objc_opt_class(v5), "_manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[BCLayoutMetrics initWithObserver:factory:manager:delegate:](v6, "initWithObserver:factory:manager:delegate:", v4, v8, v10, v5);
    metrics = v5->_metrics;
    v5->_metrics = v11;

  }
  return v5;
}

- (NSDictionary)computedMetrics
{
  return -[BCLayoutMetrics metrics](self->_metrics, "metrics");
}

- (BOOL)compactWidth
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCMetrics metrics](self, "metrics"));
  v3 = objc_msgSend(v2, "compactWidth");

  return v3;
}

- (BOOL)updateIfNeededWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCMetrics metrics](self, "metrics"));
  v6 = objc_msgSend(v5, "updateIfNeededWithEnvironment:", v4);

  return v6;
}

- (BOOL)updateIfNeededWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v8 = (void *)v7;
  LOBYTE(v9) = 0;
  if (v5 && v6 && v7)
  {
    v10 = objc_alloc((Class)TUIEnvironment);
    objc_msgSend(v5, "bounds");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v8, "bounds");
    v15 = objc_msgSend(v10, "initWithTraitCollection:viewController:viewSize:windowSize:", v6, v4, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCMetrics metrics](self, "metrics"));
    v9 = objc_msgSend(v16, "updateIfNeededWithEnvironment:", v15);

    if (v9)
      objc_msgSend(v5, "setNeedsLayout");

  }
  return v9;
}

- (id)metricsTemplateURL
{
  void *v2;

  v2 = (void *)objc_opt_class(self, a2);
  return _objc_msgSend(v2, "_metricsTemplateURL");
}

+ (id)supportedMetrics
{
  return &__NSArray0__struct;
}

- (BCLayoutMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
