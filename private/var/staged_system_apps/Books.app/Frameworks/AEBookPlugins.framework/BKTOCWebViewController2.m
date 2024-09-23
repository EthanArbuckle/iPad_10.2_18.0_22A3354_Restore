@implementation BKTOCWebViewController2

- (id)tocDelegate
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v3 = BUProtocolCast(&OBJC_PROTOCOL___BKTOCViewControllerDelegate, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (int64_t)tocContentType
{
  return 0;
}

- (void)releaseViews
{
  void *v3;
  void *v4;
  BKActivityIndicatorOverlayView *activityIndicator;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4 = *(void **)&self->_htmlLoaded;
  *(_QWORD *)&self->_htmlLoaded = 0;

  -[BKActivityIndicatorOverlayView setNavigationDelegate:](self->_activityIndicator, "setNavigationDelegate:", 0);
  -[BKActivityIndicatorOverlayView stopLoading](self->_activityIndicator, "stopLoading");
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKTOCWebViewController2;
  -[BKTOCViewController releaseViews](&v6, "releaseViews");
}

- (void)setTheme:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKTOCWebViewController2;
  -[BKTOCViewController setTheme:](&v6, "setTheme:", a3);
  -[BKTOCWebViewController2 updateView](self, "updateView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 theme](self, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 scrollView](self, "scrollView"));
  objc_msgSend(v4, "stylizeScrollView:", v5);

}

+ (id)pageNumberStringForChapter:(id)a3 directoryDelegate:(id)a4
{
  id v5;
  __CFString *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  id v9;
  __CFString *v10;

  v5 = a3;
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "tocViewController:pageTitleForChapter:", 0, v5));
  v7 = objc_msgSend(v5, "isExcludedFromSample");

  if ((v7 & 1) != 0)
  {
    v8 = &stru_1C3088;
LABEL_5:

    v6 = (__CFString *)v8;
    return v6;
  }
  if (!-[__CFString length](v6, "length"))
  {
    v9 = AEBundle();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("…"), &stru_1C3088, 0));

    v6 = v10;
    goto LABEL_5;
  }
  return v6;
}

+ (int64_t)pageNumberForChapter:(id)a3 directoryDelegate:(id)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isExcludedFromSample") & 1) != 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = (int64_t)objc_msgSend(v6, "tocViewController:pageNumberForChapter:", 0, v5);

  return v7;
}

- (void)updatePageNumberStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_443AC;
  v21 = sub_443BC;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController fetchedResultsController](self, "fetchedResultsController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("chapters")));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_443C4;
  v14[3] = &unk_1BFA38;
  v14[4] = self;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);
  v8 = v18[5];
  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v8, 1, &v13));
  v10 = v13;
  if (objc_msgSend(v9, "length"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("updatePageNumberStrings(%@);"),
                      v11));
    -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](self->_activityIndicator, "evaluateJavaScript:completionHandler:", v12, &stru_1BFA78);

  }
  _Block_object_dispose(&v17, 8);

}

+ (id)classNameFromChapterInfo:(id)a3 excludedFromSample:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("indentationLevel")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("indentation%lu"), objc_msgSend(v5, "unsignedLongValue")));

  if (v4)
    objc_msgSend(v6, "appendString:", CFSTR(" notPageExists"));
  return v6;
}

+ (id)hairlineImageURIWithColor:(id)a3 horizontal:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = a4;
  v5 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "scale");
  v7 = (void *)BCCreateHairlineImageAsDataForColor(v5, v4);

  if (v7)
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_dataURIString"));
    CFRelease(v7);
  }
  else
  {
    v8 = &stru_1C3088;
  }
  return v8;
}

+ (id)tocHTMLWithFetchedResultsController:(id)a3 directoryDelegate:(id)a4 chapterTopLevelFont:(id)a5 chapterSubLevelFont:(id)a6 pageLabelFont:(id)a7 themeContentBackgroundColor:(id)a8 textColor:(id)a9 selectedTextColor:(id)a10 pageNumberTextColor:(id)a11 separatorColor:(id)a12 highlightedBackgroundColor:(id)a13 highlightedTextColor:(id)a14 contentInsets:(UIEdgeInsets)a15 completionBlock:(id)a16
{
  double right;
  double left;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v73;
  void *v74;
  void (**v75)(id, id);
  id v76;
  id v77;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD *v89;
  id v90;
  _QWORD v91[5];

  right = a15.right;
  left = a15.left;
  v79 = a3;
  v77 = a4;
  v24 = a5;
  v80 = a6;
  v76 = a7;
  v25 = a8;
  v84 = a9;
  v26 = a10;
  v81 = a11;
  v27 = a12;
  v83 = a13;
  v82 = a14;
  v75 = (void (**)(id, id))a16;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v73 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hairlineImageURIWithColor:horizontal:", v27, 0));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("vertical-rl"), CFSTR("toc_writing_mode"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("chapters"));

  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "tocViewControllerTocIdCssRules:", 0));
  v32 = (void *)v31;
  if (v31)
    v33 = (const __CFString *)v31;
  else
    v33 = &stru_1C3088;
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, CFSTR("idCssRules"));

  v74 = v26;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bc_rgbaString"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v34));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("selectedTextColor"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bc_rgbaString"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v37));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v38, CFSTR("textNotPageExistsColor"));

  objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("dividerImageURI"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bc_cssFontFamily"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v39, CFSTR("chapterTopLevelFontFamily"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bc_cssFontWeight"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, CFSTR("chapterTopLevelFontWeight"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bc_cssFontSize"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v41, CFSTR("chapterTopLevelFontSize"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "bc_cssFontFamily"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v42, CFSTR("chapterSubLevelFontFamily"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "bc_cssFontWeight"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v43, CFSTR("chapterSubLevelFontWeight"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "bc_cssFontSize"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v44, CFSTR("chapterSubLevelFontSize"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bc_cssFontFamily"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, CFSTR("pageLabelFontFamily"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bc_cssFontWeight"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v46, CFSTR("pageLabelFontWeight"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bc_cssFontSize"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v47, CFSTR("pageLabelFontSize"));

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bc_rgbaString"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v48));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v49, CFSTR("themeContentBackgroundColor"));

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bc_rgbaString"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v50));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v51, CFSTR("textColor"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bc_rgbaString"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v52));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v53, CFSTR("pageNumberTextColor"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bc_rgbaString"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v54));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v55, CFSTR("highlightedBackgroundColor"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "bc_rgbaString"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v56));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v57, CFSTR("highlightedTextColor"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ldpx"), llround(left)));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v58, CFSTR("leftContentInset"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ldpx"), llround(44.0)));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v59, CFSTR("leftIndentZero"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ldpx"), llround(44.0 + 16.0)));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v60, CFSTR("leftIndentOne"));

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ldpx"), llround(16.0 * 2.0 + 44.0)));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v61, CFSTR("leftIndentTwo"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ldpx"), llround(right)));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v62, CFSTR("rightContentInset"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ldpx"), llround(34.0)));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v63, CFSTR("rightIndent"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "fetchedObjects"));
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v91[3] = 0;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_44EC8;
  v86[3] = &unk_1BFAA0;
  v89 = v91;
  v90 = a1;
  v65 = v77;
  v87 = v65;
  v66 = v28;
  v88 = v66;
  objc_msgSend(v64, "enumerateObjectsUsingBlock:", v86);
  v67 = AEBundle();
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "URLForResource:withExtension:", CFSTR("BEVerticalTOC.xhtml"), CFSTR("tmpl")));

  v85 = 0;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[AEMinimalTemplate evaluateTemplateWithURL:data:error:](AEMinimalTemplate, "evaluateTemplateWithURL:data:error:", v69, v66, &v85));
  v71 = v85;
  if (v75)
    v75[2](v75, v66);

  _Block_object_dispose(v91, 8);
  return v70;
}

- (id)scrollView
{
  return -[BKActivityIndicatorOverlayView scrollView](self->_activityIndicator, "scrollView");
}

- (void)viewDidLoad
{
  BKActivityIndicatorOverlayView *v3;
  BKActivityIndicatorOverlayView *activityIndicator;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BKActivityIndicatorOverlayView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BKActivityIndicatorOverlayView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BKTOCWebViewController2;
  -[BKContentViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (BKActivityIndicatorOverlayView *)objc_claimAutoreleasedReturnValue(+[BEWebViewFactory viewConfiguredForWebTOC:](BEWebViewFactory, "viewConfiguredForWebTOC:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  -[BKActivityIndicatorOverlayView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BKActivityIndicatorOverlayView setNavigationDelegate:](self->_activityIndicator, "setNavigationDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BKActivityIndicatorOverlayView setBackgroundColor:](self->_activityIndicator, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView scrollView](self->_activityIndicator, "scrollView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[BKActivityIndicatorOverlayView setOpaque:](self->_activityIndicator, "setOpaque:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView configuration](self->_activityIndicator, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultWebpagePreferences"));
  objc_msgSend(v9, "_setMouseEventPolicy:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 scrollView](self, "scrollView"));
  objc_msgSend(v10, "setBounces:", 1);
  objc_msgSend(v10, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v10, "setDecelerationRate:", UIScrollViewDecelerationRateNormal);
  objc_msgSend(v10, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v10, "_setShowsBackgroundShadow:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 theme](self, "theme"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 scrollView](self, "scrollView"));
  objc_msgSend(v11, "stylizeScrollView:", v12);

  v13 = [BKActivityIndicatorOverlayView alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 theme](self, "theme"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentTextColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "colorWithAlphaComponent:", 0.7));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 theme](self, "theme"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "backgroundColorForTraitEnvironment:", self));
  v19 = -[BKActivityIndicatorOverlayView initWithBackgroundColor:foregroundColor:](v13, "initWithBackgroundColor:foregroundColor:", v16, v18);
  v20 = *(void **)&self->_htmlLoaded;
  *(_QWORD *)&self->_htmlLoaded = v19;

  v21 = *(void **)&self->_htmlLoaded;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 view](self, "view"));
  objc_msgSend(v21, "showIndicatorCenteredInView:animated:animationDelay:", v22, 1, 0.0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_doInitialWebViewPositionAndLoad
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 view](self, "view"));
  objc_msgSend(v8, "bounds");
  -[BKActivityIndicatorOverlayView setFrame:](self->_activityIndicator, "setFrame:");
  objc_msgSend(v8, "insertSubview:atIndex:", self->_activityIndicator, 0);
  -[BKTOCWebViewController2 _updateContentInsets](self, "_updateContentInsets");
  if (-[BKTOCViewController isVertical](self, "isVertical"))
  {
    -[BKContentViewController contentInsets](self, "contentInsets");
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 view](self, "view"));
    objc_msgSend(v5, "bounds");
    -[BKActivityIndicatorOverlayView setFrame:](self->_activityIndicator, "setFrame:", v6 + 0.0, v4 + v7);

  }
  -[BKTOCWebViewController2 loadHTML](self, "loadHTML");

}

- (void)_updateContentInsets
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController layoutDelegate](self, "layoutDelegate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController layoutDelegate](self, "layoutDelegate"));
    objc_msgSend(v4, "edgeInsetsForContentViewController:", self);
    -[BKContentViewController setContentInsets:](self, "setContentInsets:");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController layoutDelegate](self, "layoutDelegate"));
    objc_msgSend(v5, "separatorInsetsForContentViewController:", self);
    -[BKContentViewController setSeparatorInsets:](self, "setSeparatorInsets:");

  }
}

- (void)centerWebView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BKActivityIndicatorOverlayView *activityIndicator;
  double v17;
  double v18;
  double v19;
  NSString *v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (-[BKTOCViewController isVertical](self, "isVertical"))
  {
    -[BKContentViewController contentInsets](self, "contentInsets");
    v4 = v3;
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 view](self, "view"));
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    activityIndicator = self->_activityIndicator;
    if (activityIndicator)
    {
      v17 = round(v15) - (v4 + v6);
      v18 = v9 + 0.0;
      v19 = v4 + v11;
      -[BKActivityIndicatorOverlayView frame](activityIndicator, "frame");
      v25.origin.x = v18;
      v25.origin.y = v19;
      v25.size.width = v13;
      v25.size.height = v17;
      if (!CGRectEqualToRect(v23, v25))
      {
        v24.origin.x = v18;
        v24.origin.y = v19;
        v24.size.width = v13;
        v24.size.height = v17;
        v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("document.getElementById('setupWritingMode').style.height = '%ldpx';"),
                llround(CGRectGetHeight(v24)));
        v22 = (id)objc_claimAutoreleasedReturnValue(v20);
        -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](self->_activityIndicator, "evaluateJavaScript:completionHandler:", v22, &stru_1BFAC0);
        -[BKActivityIndicatorOverlayView setFrame:](self->_activityIndicator, "setFrame:", v18, v19, v13, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityIndicatorOverlayView scrollView](self->_activityIndicator, "scrollView"));
        objc_msgSend(v21, "setContentSize:", v13, v17);

      }
    }
  }
}

- (void)updateView
{
  if (BYTE4(self->super._verticalCenteringInsets.right))
  {
    -[BKTOCWebViewController2 _updateContentInsets](self, "_updateContentInsets");
    -[BKTOCWebViewController2 updatePageStylesheet](self, "updatePageStylesheet");
    -[BKTOCWebViewController2 updatePageNumberStrings](self, "updatePageNumberStrings");
    -[BKTOCWebViewController2 centerWebView](self, "centerWebView");
  }
}

- (void)invalidateFollowingThemeChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKTOCWebViewController2;
  -[BKTOCViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[BKTOCWebViewController2 _doInitialWebViewPositionAndLoad](self, "_doInitialWebViewPositionAndLoad");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKTOCWebViewController2;
  -[BKTOCWebViewController2 viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  if (!-[BKTOCViewController shouldIgnoreViewLayoutUpdates](self, "shouldIgnoreViewLayoutUpdates"))
  {
    -[BKTOCWebViewController2 updateView](self, "updateView");
    -[BKTOCViewController reload](self, "reload");
  }
}

- (id)_indexPathForURL:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastPathComponent"));
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("row-")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("row-"), "length")));
    v5 = objc_msgSend(v4, "integerValue");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, 0));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BKActivityIndicatorOverlayView *activityIndicator;
  id v17;
  void *v18;
  id v19;

  v19 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 _indexPathForURL:](self, "_indexPathForURL:", v9));

  v11 = objc_msgSend(v7, "navigationType");
  if ((unint64_t)v11 + 1 <= 1 && v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController fetchedResultsController](self, "fetchedResultsController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexPath:", v10));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController eventEngagement](self, "eventEngagement"));
      objc_msgSend(v14, "sendReaderEventNewSectionViaToC");

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocDelegate](self, "tocDelegate"));
      objc_msgSend(v15, "tocViewController:didSelectChapter:", self, v13);

      activityIndicator = self->_activityIndicator;
      if (activityIndicator)
        -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", CFSTR("clearSelectedLink();"),
          &stru_1BFAE0);
    }

  }
  v17 = objc_retainBlock(v19);
  v18 = v17;
  if (v17)
    (*((void (**)(id, BOOL))v17 + 2))(v17, v10 == 0);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_45B70;
  v4[3] = &unk_1BEA88;
  v4[4] = self;
  -[BKTOCWebViewController2 installJavaScriptWithCompletionBlock:](self, "installJavaScriptWithCompletionBlock:", v4, a4);
}

- (BOOL)_webViewWantsToLoadURL:(id)a3 navigationIsClickOrOther:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 _indexPathForURL:](self, "_indexPathForURL:", a3));
  v7 = (void *)v6;
  if (v4 && v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController fetchedResultsController](self, "fetchedResultsController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v7));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocDelegate](self, "tocDelegate"));
      objc_msgSend(v10, "tocViewController:didSelectChapter:", self, v9);

    }
  }

  return v7 == 0;
}

- (BOOL)fetchedResultsControllerAscendingOrder
{
  return 1;
}

- (id)pageLabelFont
{
  -[BKTOCViewController calculateFontSize](self, "calculateFontSize");
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (void)scrollToItemId:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  BKActivityIndicatorOverlayView *activityIndicator;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_45EA4;
  v13[3] = &unk_1BFB08;
  v6 = a4;
  v14 = v6;
  v7 = a3;
  v8 = objc_retainBlock(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("scrollToItemWithId(\"%@\")"), v7));

  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_45F2C;
    v11[3] = &unk_1BF3B8;
    v12 = v8;
    -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", v9, v11);

  }
}

- (id)chapterInfoForPageNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("chapters")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
    if (v8)
    {
      while (1)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pageInteger")));
        if (objc_msgSend(v9, "integerValue") != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = objc_msgSend(v4, "integerValue");
          if ((uint64_t)v10 >= (uint64_t)objc_msgSend(v9, "integerValue"))
            break;
        }

        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
        v8 = (id)v11;
        if (!v11)
          goto LABEL_9;
      }
      v8 = v8;

    }
LABEL_9:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)tocDataIndexFromChapterHref:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  unsigned __int8 v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("chapters")));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v6;
    v8 = (char *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        v13 = &v9[(_QWORD)v10];
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12), "objectForKeyedSubscript:", CFSTR("href"), (_QWORD)v18));
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if ((v15 & 1) != 0)
          {
            v16 = (unint64_t)&v12[(_QWORD)v10];
            goto LABEL_12;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = (char *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v10 = v13;
        if (v9)
          continue;
        break;
      }
    }
    v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

- (void)applyClassName:(id)a3 toOnlyLinkWithHref:(id)a4
{
  void *v5;
  BKActivityIndicatorOverlayView *activityIndicator;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("applyClassNameToOnlyLinkWithHref(\"%@\", \"%@\");"),
                   a4,
                   a3));
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    v7 = v5;
    -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", v5, &stru_1BFB28);
    v5 = v7;
  }

}

- (unint64_t)pageIndexForLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v6 = objc_msgSend(v5, "directoryContent:pageNumberForLocation:", self, v4);

  return (unint64_t)v6;
}

- (id)chapterInfoForCurrentNode
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocDelegate](self, "tocDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tocViewControllerCurrentLocation:", self));

  v5 = -[BKTOCWebViewController2 pageIndexForLocation:](self, "pageIndexForLocation:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 chapterInfoForPageNumber:](self, "chapterInfoForPageNumber:", v7));
    v9 = v8;
    if (v8)
    {
      v6 = v8;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chapters")));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    }
  }

  return v6;
}

- (id)elementIdForCurrentNode
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 chapterInfoForCurrentNode](self, "chapterInfoForCurrentNode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 elementIdForChapterInfo:](self, "elementIdForChapterInfo:", v3));

  return v4;
}

- (id)elementIdForChapterInfo:(id)a3
{
  char *v4;
  char *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  char *v19;
  __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;

  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("href")));
    if (v6)
    {
      if (BYTE4(self->super._verticalCenteringInsets.right))
        -[BKTOCWebViewController2 applyClassName:toOnlyLinkWithHref:](self, "applyClassName:toOnlyLinkWithHref:", CFSTR("currentLocation"), v6);
      v7 = -[BKTOCWebViewController2 tocDataIndexFromChapterHref:](self, "tocDataIndexFromChapterHref:", v6);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = v7;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("chapters")));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", v25));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("id")));

        if (v20)
          goto LABEL_22;
        v29 = BCIMLog();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v32 = 136315650;
          v33 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
          v34 = 2080;
          v35 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
          v36 = 1024;
          v37 = 609;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v32, 0x1Cu);
        }

        v31 = BCIMLog();
        v11 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v32 = 138412290;
          v33 = (const char *)v6;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "@\"Expected a toc element id for href: %@\", (uint8_t *)&v32, 0xCu);
        }
        v20 = 0;
        goto LABEL_21;
      }
      v8 = BCIMLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v32 = 136315650;
        v33 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
        v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
        v36 = 1024;
        v37 = 612;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v32, 0x1Cu);
      }

      v10 = BCIMLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_20:
        v20 = &stru_1C3088;
LABEL_21:

        goto LABEL_22;
      }
      v32 = 138412290;
      v33 = (const char *)v6;
      v12 = "@\"Expected a toc data for href: %@\";
    }
    else
    {
      v21 = BCIMLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v32 = 136315650;
        v33 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
        v34 = 2080;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
        v36 = 1024;
        v37 = 615;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v32, 0x1Cu);
      }

      v23 = BCIMLog();
      v11 = objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v32 = 138412290;
      v33 = v5;
      v12 = "@\"Expected a toc href for chapter: %@\";
    }
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v32, 0xCu);
    goto LABEL_20;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocDelegate](self, "tocDelegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tocViewControllerCurrentLocation:", self));
  v15 = -[BKTOCWebViewController2 pageIndexForLocation:](self, "pageIndexForLocation:", v14);

  v16 = BCIMLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v32 = 136315650;
    v33 = "-[BKTOCWebViewController2 elementIdForChapterInfo:]";
    v34 = 2080;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/Directory/BKTOCWebViewController2.m";
    v36 = 1024;
    v37 = 619;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v32, 0x1Cu);
  }

  v18 = BCIMLog();
  v6 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    v32 = 138412290;
    v33 = v19;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"Expected a toc entry for page %@\", (uint8_t *)&v32, 0xCu);

  }
  v20 = &stru_1C3088;
LABEL_22:

  return v20;
}

- (void)highlightCurrentNodeWithCompletionBlock:(id)a3
{
  void *v4;
  BKActivityIndicatorOverlayView *activityIndicator;
  void *v6;
  void *v7;
  void (**v8)(id, BOOL);

  v8 = (void (**)(id, BOOL))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 elementIdForCurrentNode](self, "elementIdForCurrentNode"));
  if (v4)
  {
    -[BKTOCWebViewController2 scrollToItemId:completionBlock:](self, "scrollToItemId:completionBlock:", v4, v8);
    activityIndicator = self->_activityIndicator;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("selectItemWithId(\"%@\");"),
                     v4));
    -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", v6, &stru_1BFB48);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocDelegate](self, "tocDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tocViewControllerCurrentLocation:", self));
    v8[2](v8, v7 == 0);

  }
}

- (void)highlightCurrentNode
{
  -[BKTOCWebViewController2 highlightCurrentNodeWithCompletionBlock:](self, "highlightCurrentNodeWithCompletionBlock:", &stru_1BFB88);
}

- (void)installJavaScriptWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  BKActivityIndicatorOverlayView *activityIndicator;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("chapters")));
  v19 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 1, &v19));
  v8 = v19;

  if (objc_msgSend(v7, "length"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setupTOCWithChapters(%@);"),
                      v9));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_46C00;
    v16[3] = &unk_1BFBB0;
    v16[4] = self;
    v18 = v4;
    v17 = v8;
    v11 = objc_retainBlock(v16);
    v12 = v11;
    activityIndicator = self->_activityIndicator;
    if (activityIndicator)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_46E0C;
      v14[3] = &unk_1BF3B8;
      v15 = v11;
      -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", v10, v14);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)htmlMarkup
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[6];

  -[BKTOCViewController establishChapterFonts](self, "establishChapterFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 themePage](self, "themePage"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "separatorColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 traitCollection](self, "traitCollection"));
  v5 = dbl_172BF0[objc_msgSend(v4, "userInterfaceStyle") == (char *)&dword_0 + 2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", v5));

  v27 = v7;
  if (-[BKTOCViewController usesPopoverStyle](self, "usesPopoverStyle"))
    v8 = v7;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableViewCellSelectedColor"));
  v9 = v8;
  v21 = v8;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryTextColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tintColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tocPageNumberTextColor"));
  *(_QWORD *)&v12 = objc_opt_class(self).n128_u64[0];
  v24 = v13;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController fetchedResultsController](self, "fetchedResultsController", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocDelegate](self, "tocDelegate"));
  v15 = BUProtocolCast(&OBJC_PROTOCOL___BKTOCViewControllerDelegate, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterTopLevelFont](self, "chapterTopLevelFont"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCViewController chapterSubLevelFont](self, "chapterSubLevelFont"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 pageLabelFont](self, "pageLabelFont"));
  -[BKContentViewController contentInsets](self, "contentInsets");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_470F8;
  v29[3] = &unk_1BFBD8;
  v29[4] = self;
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tocHTMLWithFetchedResultsController:directoryDelegate:chapterTopLevelFont:chapterSubLevelFont:pageLabelFont:themeContentBackgroundColor:textColor:selectedTextColor:pageNumberTextColor:separatorColor:highlightedBackgroundColor:highlightedTextColor:contentInsets:completionBlock:", v22, v16, v17, v18, v19, v26, v10, v23, v11, v28, v9, v10, v29));

  return v25;
}

- (void)loadHTML
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 htmlMarkup](self, "htmlMarkup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tocPageHref"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "urlForHref:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 elementIdForCurrentNode](self, "elementIdForCurrentNode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@#%@"), v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  v10 = BEURLHandleriBooksImgUrlFromiBooksURL(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
  v13 = -[BKActivityIndicatorOverlayView loadData:MIMEType:characterEncodingName:baseURL:](self->_activityIndicator, "loadData:MIMEType:characterEncodingName:baseURL:", v12, BEXBEHTMLContentType, BEUTF8StringEncodingName, v11);

}

- (void)updatePageStylesheet
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  BKActivityIndicatorOverlayView *activityIndicator;
  id v21;
  id v22;
  void *v23;

  v3 = -[BKTOCWebViewController2 htmlMarkup](self, "htmlMarkup");
  v4 = AEBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("BEVerticalTOC.xhtml"), CFSTR("tmpl")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 tocData](self, "tocData"));
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEMinimalTemplate evaluateTemplateWithURL:data:error:](AEMinimalTemplate, "evaluateTemplateWithURL:data:error:", v6, v7, &v22));
  v9 = v22;

  v10 = objc_msgSend(v8, "rangeOfString:", CFSTR("<style"));
  v11 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR(">"), 0, v10, (_BYTE *)objc_msgSend(v8, "length") - v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", &v11[v12], (_BYTE *)objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("</style>"), 0, &v11[v12], (_BYTE *)objc_msgSend(v8, "length") - &v11[v12])- &v11[v12]));
  v23 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v21 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v14, 1, &v21));
  v16 = v21;

  v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v15, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewController2 elementIdForCurrentNode](self, "elementIdForCurrentNode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("updatePageStylesheet(%@); clearSelectedLink(); scrollToItemWithId(\"%@\")"),
                    v17,
                    v18));
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
    -[BKActivityIndicatorOverlayView evaluateJavaScript:completionHandler:](activityIndicator, "evaluateJavaScript:completionHandler:", v19, &stru_1BFBF8);

}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return *(BKActivityIndicatorOverlayView **)&self->_htmlLoaded;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_htmlLoaded, a3);
}

- (WKWebView)webView
{
  return (WKWebView *)self->_activityIndicator;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (NSDictionary)tocData
{
  return (NSDictionary *)self->_webView;
}

- (void)setTocData:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (CGSize)contentSize
{
  NSDictionary *tocData;
  double width;
  CGSize result;

  tocData = self->_tocData;
  width = self->_contentSize.width;
  result.height = width;
  result.width = *(double *)&tocData;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  *(CGSize *)&self->_tocData = a3;
}

- (BOOL)htmlLoaded
{
  return BYTE4(self->super._verticalCenteringInsets.right);
}

- (void)setHtmlLoaded:(BOOL)a3
{
  BYTE4(self->super._verticalCenteringInsets.right) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_htmlLoaded, 0);
}

@end
